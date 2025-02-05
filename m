Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D020C02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gs6ReRQhb413TYMhMXOX8+f5fk1JBG4vJm62VYQA/7s=; b=x57KKAkr6jO8KG
	E4t8KDJFkzpEUNEoVRyrifzLJhBEXT1bxrf4ZAgVsk84AL36Fs8zkOehIsadlx8GhhGomb0LYhKnn
	1OGu1/cGLHyupfb41dfDqKgBdtjV2qLBkrGOeJkwiPRMc96mUAkpj1AuPZyWTtkNH9G/jy2+Q39ZB
	Db7kSegP2dkMHyaJ6zvhAJvitM1MTdtI3D1Hob9x8Al6Fb+LAqWUc8b/SYX4610b1oezvljUM7LgP
	zScDJQqOXfDwLU9iflKYD2g67ZXzpx5vn1R4My51HoOvhRNbPgviNVkqhUDuIKKZ5GF0BU1GmgE59
	pNjMoukUJqrxxsz+srkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh1N-00000003hrD-0v9l;
	Wed, 05 Feb 2025 15:08:57 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh1K-00000003hqt-2DqE
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 15:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/58c4CnH2Lo1GWkHkqO/BsSaJ1BpEm4lprv0HNFi/+8=; b=ApO1p1qeot0XCWn/nsFk3CZdV1
	3SgKC0EyYE5BnQ3u9hDpJCX6/+SjMV/oHX0EQSVfkMBP0Jf1f2HkqWR0ZnQJzPopTUGFB7agsCfyI
	6Lt446uAZRpm+46vAJzE9ZlFDTzgJEnCctufLLh7gKFsmysqZNTCsJgvaojDidCYhInFQ16GIcMWw
	qUGrBUUAjYPPd3xvHYgzsyg3vqrXGLbC8TFI6Bsg9KEcIOmKPR2l3+m5ieZEUTogloBccrgV5+9w0
	vjovEHvpYHsfxt0oKnTkqcdV8AvyL1AoRO6sfDeod1EcESzbX7s5C6BQ2YVCqe0DFMU9CXxw2SXF2
	+5kMJJbA==;
Received: from [167.98.27.226] (helo=[10.35.6.157])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tfh1C-00CUJH-Fw; Wed, 05 Feb 2025 15:08:46 +0000
Message-ID: <b45aab1e-6d37-4027-9a15-4fa917d806b9@codethink.co.uk>
Date: Wed, 5 Feb 2025 15:08:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: implement user_access_begin and families
To: Charlie Jenkins <charlie@rivosinc.com>,
 Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-2-cyrilbur@tenstorrent.com> <Z4rl8BgoV8tygCn9@ghost>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <Z4rl8BgoV8tygCn9@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_070854_652392_A27BDC2A 
X-CRM114-Status: GOOD (  10.63  )
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

On 17/01/2025 23:21, Charlie Jenkins wrote:
> On Mon, Nov 18, 2024 at 11:01:09PM +0000, Cyril Bur wrote:
>> From: Jisheng Zhang <jszhang@kernel.org>
>>
>> Currently, when a function like strncpy_from_user() is called,
>> the userspace access protection is disabled and enabled
>> for every word read.
>>
>> By implementing user_access_begin and families, the protection
>> is disabled at the beginning of the copy and enabled at the end.
>>
>> The __inttype macro is borrowed from x86 implementation.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

If we're doing this, then saving the STATUS.SUM flag is going to
be more important than before. We had this discussion when the
initial user-access with syzbot stress testing turned up.

We partially fixed this by rewriting the ordering in the __put_user
function to stop the 'x' argument being evaluated inside the area
where SUM is enabled, but this is going to make the window of
opportunity of a thread switch much bigger and the bug will just
come back and bite harder.

If you want I can look at re-doing my original patch and resubmitting.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
