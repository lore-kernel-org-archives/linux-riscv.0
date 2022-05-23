Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA57C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BDu0n7WjMtlWWshEiKQtvc+idNpBFwE2d8PjPMAyFuQ=; b=d5MCb8TBpBytTV7jhCa2+LT0Oa
	wO1emBRTkGpB2YYub+cDM7hYHnlo7Xx1NtU6fg6igxH8FDbGren9OUeA4GqRO2BrVeCCj19PTudD3
	Ak6xsjpXeDNjwvFf1juIDj97g9TlPUv8msqTvJSBlMzQpWEsPGSo9WGToG88pnezBEvYi6t9qYMv9
	THbXkY51ZYEzwMxVwBCeWVJIkiVwqiT00D5cR0kHGMhliBZrXNisLUuv9E725hNlE18oUS1nkuSR/
	/ZLHIIyVsP77jCzgHKhptDWWYUZzBx4sGz5qBW0g+sa9ybW/q2sbM3iZKh3iFsI0NHZDHZR+a+Wxx
	tzQu3W4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntE6d-005kgz-R8; Mon, 23 May 2022 19:52:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntE6b-005keU-2f
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 19:52:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id gg20so14962622pjb.1
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vJ/7h+gtdAcH6lg5046ozHJXlKfDaJ+7rqIOW4j5rFs=;
 b=lTQCZCv5SjCSpZkO1elU8OQ5aWFQCrQkHtVcF9TDFzMsnqBFg7KzqJyiNaKPcKbRJj
 i90imZ0Whn93Tu8MftddRbbWIGE4Z51y2k7ektQtHftyO4NCDzN8TCKYp6v4huEfqPiP
 9EULlaFtpqTC5St9isyzpphnuuSOM7iPCBf+hZQdU/kF892Rd5g3H41PsxboienPw/+L
 eQH9HkzV9iG5aCuHhZYSTJreYTOaKCjlfaxF3j2t6Pi5o2S41dP4XVx8pIyTds/M1Hzn
 Sth5UH14P0IyZENuN5FAyQcocPp/wYtTbxP4sf5o+PgAQBR3okXLoeYO/K8CMJlOpwKV
 ONDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vJ/7h+gtdAcH6lg5046ozHJXlKfDaJ+7rqIOW4j5rFs=;
 b=e6VKUXUj1cv/s7B4mLJokfFXiVYgNFMi8TJGTVlnyHpjZerHdRRnoROXwTnvVVXHL+
 pXZfnQ4aXjAYAjrCzsbJ+rLYflt4H+a4tIRzXfwi+yOJU1bIjqFxrlk8y0h/wwV9b+3r
 ZC02XS5XllZHQhBJLgC/886v1SSwMSvZDy9parrj7pR5ioRC5Ch4DSebAjQA46S/tJzp
 x6ez3un1CiNZf+Sl6bCFzxWNJaCVIL9nRetOhupDSclN7baAVFiu4oj9h6qE6DCVlSHE
 qXk6wht1ryyaL1RtRVzTGrzWQZ0xt3jO3yYJiLnuMIN3YaOso8VeZqBe77EcrVCmi0fX
 fnow==
X-Gm-Message-State: AOAM53244TfHwD3uqxqCgBxAkmsu774QDdjXUrQLP3XQ379Vh4FnQbBf
 KUB5wHrjx+U2vPvz7sU40K4Y/A==
X-Google-Smtp-Source: ABdhPJze5JLlUhh4DOxqmNYacegzQnT4dWAyORP1w+YfXIZRr1SHeDENWbQ94DWlMydgQBSrwKF7xw==
X-Received: by 2002:a17:903:25c5:b0:162:e9f:4e6d with SMTP id
 jc5-20020a17090325c500b001620e9f4e6dmr11457165plb.60.1653335556517; 
 Mon, 23 May 2022 12:52:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 i12-20020a65484c000000b003fa5855ad66sm2314836pgs.64.2022.05.23.12.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 12:52:35 -0700 (PDT)
Date: Mon, 23 May 2022 12:52:35 -0700 (PDT)
X-Google-Original-Date: Mon, 23 May 2022 12:52:31 PDT (-0700)
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng,
 pci and clock drivers
In-Reply-To: <875112a6-7328-a40d-bc78-bff4e7d14aa0@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Daire.McNamara@microchip.com, 
 Lewis.Hanly@microchip.com, Cyril.Jean@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-9bccd0ce-6754-49d4-bf6d-5a83b2226b5d@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_125241_153992_80C8B3D6 
X-CRM114-Status: GOOD (  18.30  )
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

On Mon, 23 May 2022 04:42:53 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 05/05/2022 11:55, Conor Dooley wrote:
>> Hardware random, PCI and clock drivers for the PolarFire SoC have been
>> upstreamed but are not covered by the MAINTAINERS entry, so add them.
>> Daire is the author of the clock & PCI drivers, so add him as a
>> maintainer in place of Lewis.
>> 
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey Palmer,
> I know youre busy etc but just a reminder :)

Sorry, I didn't realize this was aimed at the RISC-V tree.  I'm fine 
taking it, but it seems like these should have gone in along with the 
drivers.

Arnd: maybe this is really an SOC tree sort of thing?  No big deal 
either way on my end, just let me know.

> Thanks,
> Conor.
> 
>> ---
>>   MAINTAINERS | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fd768d43e048..d7602658b0a5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16939,12 +16939,15 @@ N:	riscv
>>   K:	riscv
>>   
>>   RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>> -M:	Lewis Hanly <lewis.hanly@microchip.com>
>>   M:	Conor Dooley <conor.dooley@microchip.com>
>> +M:	Daire McNamara <daire.mcnamara@microchip.com>
>>   L:	linux-riscv@lists.infradead.org
>>   S:	Supported
>>   F:	arch/riscv/boot/dts/microchip/
>> +F:	drivers/char/hw_random/mpfs-rng.c
>> +F:	drivers/clk/microchip/clk-mpfs.c
>>   F:	drivers/mailbox/mailbox-mpfs.c
>> +F:	drivers/pci/controller/pcie-microchip-host.c
>>   F:	drivers/soc/microchip/
>>   F:	include/soc/microchip/mpfs.h
>>   
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
