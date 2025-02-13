Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8B6C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 18:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVsSL1hVIoxfDMb2PfNfNVd/0FVXM1v1SNvlXKg3s7k=; b=aQJMihwTyfePLq
	Jl4/QQVkszvAm0YtkODWovI82JRvKg68GYXoT1Q1qbctOE3zbWo7y/+wcIbuykrrcppY95JWA7Ork
	Q2de+UHa3iax4f6PVkqRbufKPw0vhN+Ldo58WQcIKDb/+nTWq002r5/eboBW6Wj2GR5m/DitB9e1h
	yPMHhK4pyl2wcQoO1ymTdi+MouRAZggJMbCbPnHUlUzmVIjB+DJ658YK2XZ5O3HdUMP/Dw50pw5xQ
	jz8X6xvn3XHsuIMbrZ0UDfx25EsFiLaBMUWp+b4CQ6p8V4zPPYnnkSFAJAwHc+sVAb9OpTrptp6vL
	DjoPfyjtHskJdM2Ypg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidYk-0000000C7xh-2P3f;
	Thu, 13 Feb 2025 18:03:34 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticoy-0000000ByQd-1VAb
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 17:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cKiGkcsixPn4QQtTKc7Lsw9RVigZQY9fPXwk3glZ0vE=; b=Eyh1K3WK+bt6eeYNEDl6HFh6MG
	Pu53wMhcj8neZh7w/pUF5gbJCETid3gJAMO5ZWdY2aWMZe4tqMloacovCGkLmhbzaYKm3m+lB+RHd
	Vx47vQWHi5WJ4W3znn72Ta73MlQCRb2Rm+oDHOahy1KH6rvvU5khKRlUSMBMGJQggF56VmmZXai3q
	xz3az8d2FmgVyCykADzIPUgKnuo7Ewmd1gA4qKj88Fe201qa3w+8xNWlGxLoD/pqLStfaZXEt9lB9
	8bbt7RwbdRdOlV0+RiEEi1pHq1D83YRmAMGO/kR1Bqe2hQ/SsuX9IWBK59m5w10TFAUoF9a3tZ2XF
	oLlaihcQ==;
Received: from [167.98.27.226] (helo=[10.35.6.157])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1ticoo-0081al-LJ; Thu, 13 Feb 2025 17:16:06 +0000
Message-ID: <a994e94c-3211-4bb4-ab41-71a2c1abebd4@codethink.co.uk>
Date: Thu, 13 Feb 2025 17:16:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: implement user_access_begin and families
To: Cyril Bur <cyrilbur@tenstorrent.com>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-2-cyrilbur@tenstorrent.com> <Z4rl8BgoV8tygCn9@ghost>
 <b45aab1e-6d37-4027-9a15-4fa917d806b9@codethink.co.uk>
 <e4a4c688-b78c-468b-8196-68d2df980167@tenstorrent.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <e4a4c688-b78c-468b-8196-68d2df980167@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_091616_501360_BC044236 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13/02/2025 17:07, Cyril Bur wrote:
> 
> 
> On 6/2/2025 1:08 am, Ben Dooks wrote:
>> On 17/01/2025 23:21, Charlie Jenkins wrote:
>>> On Mon, Nov 18, 2024 at 11:01:09PM +0000, Cyril Bur wrote:
>>>> From: Jisheng Zhang <jszhang@kernel.org>
>>>>
>>>> Currently, when a function like strncpy_from_user() is called,
>>>> the userspace access protection is disabled and enabled
>>>> for every word read.
>>>>
>>>> By implementing user_access_begin and families, the protection
>>>> is disabled at the beginning of the copy and enabled at the end.
>>>>
>>>> The __inttype macro is borrowed from x86 implementation.
>>>>
>>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>
>> If we're doing this, then saving the STATUS.SUM flag is going to
>> be more important than before. We had this discussion when the
>> initial user-access with syzbot stress testing turned up.
>>
>> We partially fixed this by rewriting the ordering in the __put_user
>> function to stop the 'x' argument being evaluated inside the area
>> where SUM is enabled, but this is going to make the window of
>> opportunity of a thread switch much bigger and the bug will just
>> come back and bite harder.
>>
>> If you want I can look at re-doing my original patch and resubmitting.
> 
> Oh! Could you please link the patch? I haven't seen it and can't seem to 
> find it now.

https://lore.kernel.org/linux-riscv/20210318151010.100966-1-ben.dooks@codethink.co.uk/

> Thanks.
> 
>>
>>
> 
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
