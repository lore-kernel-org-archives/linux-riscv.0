Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565BFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbOqV6pqu+fEFxNrqTKtRSmKK4RkKYI3cakQ1sbs0Y8=; b=rz+EGJf4bss8mu
	dBbzRpWs2nJx4Al6iPfSDXdMJ2s8M9J1vvq2RmDK+xmNGdyrj8aZB2Qt0hgGg3w7eQed/yFUWuW6r
	wgm5/IvN7mZ82Ubta8gXmcjAGviREY8EpbK+2A9KIuP+8/J5HFIJqvgzUKtbkBgwpSXmR5LmurCq5
	ffvKNepDTwplDYYeZGdbtFlOQjyA9dzc1cJwqlbA6f55ipEqInsyH9ZVuwyEYSketX61UGQYH1xbT
	KskVNF/9oThA5hdxrqPxwTd0P9BK+2UiO0QKhCxPQskPCttla2gBnaH9M+adC2vBPmYEol2dXe+dU
	vrZ243I3bfSyBMgsUDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOipi-00DK3X-Bc; Mon, 28 Feb 2022 16:25:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOipf-00DK2o-Jd; Mon, 28 Feb 2022 16:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646065507; x=1677601507;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=et847OQQ3mcoZ5+BEptPvOyvcAVF4lTBNLhOTaaoa3U=;
 b=sQmyt9i0LmrHB6EEb0UrUpZJ43SEBPQFRWDlIhin8CjbJwMgQAXRwr0h
 r29sKDiniYuZ9HZsRq0Cj862YTla6pvXQ9K45fOuuKmEV5Q8+lFMwgZtc
 maMxXhjX+cLdFu6aq2m1HRwiqIXZrztKlwOvqXyHEsPixMCxJyH3yanXw
 KR2htLcZOHZigiEFjHJgia1Kt/D1lHokPi9nr/VouT3MycBHaCIAZUEmJ
 99gtLPcWrMl2XHjSK+KdGpWLARDeAgp4xpeC/E0DgPrYt1j2K/itbJ0aC
 JC7eGf2Bttkfcj206+Re1W/hZzJEU6YiODnV03URJxQR3Bb4Hn8kh2L3t g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="150257703"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 09:25:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 09:25:06 -0700
Received: from [10.12.72.64] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 28 Feb 2022 09:25:05 -0700
Message-ID: <e2a05dbb-8687-6a14-71f9-9dcf2260f5d7@microchip.com>
Date: Mon, 28 Feb 2022 17:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soc: microchip: make mpfs_sys_controller_put static
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <mail@conchuod.ie>
CC: <conor.dooley@microchip.com>, Olof Johansson <olof@lixom.net>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20220226124826.1564871-1-mail@conchuod.ie>
 <CAK8P3a2y2j=zSsPtAFDZxv9b_e2SG6V5DBy__voiHRnDw5n4Aw@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAK8P3a2y2j=zSsPtAFDZxv9b_e2SG6V5DBy__voiHRnDw5n4Aw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_082507_740542_30E24940 
X-CRM114-Status: GOOD (  13.08  )
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

On 28/02/2022 at 16:42, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, Feb 26, 2022 at 1:48 PM Conor Dooley <mail@conchuod.ie> wrote:
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> dsafsdfd0054 ("soc: add microchip polarfire soc system controller")
>> incorrectly exported mpfs_sys_controller_put. Remove the export and make
>> the function static instead. This fixes the "no previous prototype
>> for 'mpfs_sys_controller_put'" warning spotted by the kernel test robot.
>>
>> Fixes: dsafsdfd0054 ("soc: add microchip polarfire soc system
>> controller")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Conor Dooley <mail@conchuod.ie>
> 
> For reference, I saw the same report and added a different fix for  this
> at first, but replaced it with this patch now. No need to add it to the at91
> tree. Nicolas, in case there is another problem with this patch, let me know.

Ok Arnd, thanks.

For the record:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>


-- 
Nicolas Ferre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
