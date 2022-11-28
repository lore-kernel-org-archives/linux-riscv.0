Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A973C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 23:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QU01+xttyACHXdRSlbsAefcS4JxceCEqTcxql72R6RA=; b=ovq7RYJZq8wwYRS3J9/aqx5D4n
	taK7ElZchWBAJR/RCKkrBsjg2tjRCW4kum0Gs8Bn+u0ldFNIUM2O2Mo82o5LvkKaCyBQr5opYWS77
	fqsvCAGMbKDttcODPG0HmqmQu7eV4sNgCFCpTy/D0wgmNSNT4a+vgi4HniyhDThk4k4+mC+jXQEQU
	HPgkZNJt9jWqKJ0EF3rY4tukD7NSPAUttvswNvXVNWIxmlG3CIWQQC3kZtzJz4QT91LDHrqbLiRNU
	2Xk2RIQTJU4EUfD1njef1AO7qc5tyc79qkl5IOVQHJdoMFQfAT+TTqjl5SOzODroKLVxOvn7fNl7b
	zAOWbsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznhc-004o0s-B0; Mon, 28 Nov 2022 23:38:20 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznhX-004nxr-1f
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 23:38:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id w79so12070685pfc.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 15:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwMkGfYrczoT5UC7Q2IMcaUlV/rVQBcUruupNeEXsUY=;
        b=ADfvVneUt918f/bZRbOmHw0Lcwnvyt6F5cRCxrWm2cERkXdkAXkMibQUkLW32/0CPC
         xoiY4PVZj4K6AmDHv/oqDe9DRPZj3RFebAJ3KZi5JImqUysRWHq/qzQHsA+rXwDoXJjy
         nlHuX2YYEEqG4zbPue9trNucnVeo3dSqaqvgPiYB78L5+wb/zp6wj41+A5rrpwAyc7G7
         WhGGdFSJDlkKtXbvzadzN/hyrzh1GblrzU6Lbw7pnGTxnOyubpVU0ZazlTR4YAPDqDBp
         TeUfh9u11OgkI5j+Lbe6ZhdDki8KMfooATNi2+5ls3HJbhPC68DTQyNbDP+aitoNLDvo
         fHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwMkGfYrczoT5UC7Q2IMcaUlV/rVQBcUruupNeEXsUY=;
        b=h0v1s1bPAwvg+/UpLcDDnN+hmZoVm1WVEN4jj3ijC5Z6kIIEcz0cnTKUIuwgr7KX4f
         BmjDKuhHd5S9czc4uljO6NYiwLY8yLWQMrzQkWkf6umQkYyb3iI+2wfygog/bGAQXcSy
         XrntD89zp5saVADii9IX8eCSo33YoqjqD0GZkGd4WITmIeNwthY/dfBx016lhECN6Cxp
         WV8Nho/DhBOy2xlgYLNMSqMR8f7hnCcr3WJm3uoVYae/DxyNYTFgAu11j+F48BUpyOJf
         g3yn2ahq/VjAoOLkDB06e40BLhnVJs4tlRICKRaXQ4r2Zm7AJk7cv3Dl2b+9CjXe+uRt
         gKYg==
X-Gm-Message-State: ANoB5pnuWTtC46W4EFWdwX5Xn+9l137HPF2mBk7hXzgsPU2dHBuG+d4S
	OEde+0Sz/T4D3sN739VBelsa6hPokBucXA==
X-Google-Smtp-Source: AA0mqf43vI3ugt5v69DI5oTlWcd2zZKdHLfUR6d4brHgj6w2E8fp0HIkDh9akuPP+JDhiGFYhNSuOA==
X-Received: by 2002:a63:4302:0:b0:439:3ca0:5a29 with SMTP id q2-20020a634302000000b004393ca05a29mr28673385pga.443.1669678693663;
        Mon, 28 Nov 2022 15:38:13 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c200-20020a624ed1000000b00574d8d64560sm5730203pfb.175.2022.11.28.15.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 15:38:13 -0800 (PST)
Date: Mon, 28 Nov 2022 15:38:13 -0800 (PST)
X-Google-Original-Date: Mon, 28 Nov 2022 15:37:43 PST (-0800)
Subject: Re: [PATCH] riscv: Fix NR_CPUS range conditions
In-Reply-To: <20221128183559.5ei5fx4cl4mo3ioj@kamzik>
CC: Conor Dooley <conor@kernel.org>, samuel@sholland.org, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, heinrich.schuchardt@canonical.com, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-a00a65f6-76e1-4ec0-bb7f-7919e75ca4c9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_153815_126661_82AD728F 
X-CRM114-Status: GOOD (  24.74  )
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

On Mon, 28 Nov 2022 10:35:59 PST (-0800), ajones@ventanamicro.com wrote:
> On Sat, Nov 26, 2022 at 03:32:04PM +0000, Conor Dooley wrote:
>> On Sat, Nov 26, 2022 at 12:15:56AM -0600, Samuel Holland wrote:
>> > The conditions reference the symbol SBI_V01, which does not exist. The
>> > correct symbol is RISCV_SBI_V01.
>>
>> Huh, good spot.
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Yeah, huh. It never occurred to me that we don't have some sort of symbol
> referencing checking in kconfig. Or maybe we do and I just don't know how
> to enable it? Anyway, this issue made me wonder how many more dangling
> references we may have. I wrote a script to look for them and found 29,
> including this one. I'm not exactly sure how to report them since they
> touch so many different places. For now, I've opened this kernel BZ
>
> https://bugzilla.kernel.org/show_bug.cgi?id=216748

Thanks.  This is on fixes, it's sort of jumping the queue (I've got a 
bunch of stuff still staged from last week, but thanksgiving screwed up 
the flow) but it's small enough it doesn't seem worth waiting.

>
>>
>> >
>> > Fixes: e623715f3d67 ("RISC-V: Increase range and default value of NR_CPUS")
>> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>> > ---
>> >
>> >  arch/riscv/Kconfig | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index fec54872ab45..acbfe34c6a00 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -319,9 +319,9 @@ config SMP
>> >  config NR_CPUS
>> >  	int "Maximum number of CPUs (2-512)"
>> >  	depends on SMP
>> > -	range 2 512 if !SBI_V01
>> > -	range 2 32 if SBI_V01 && 32BIT
>> > -	range 2 64 if SBI_V01 && 64BIT
>> > +	range 2 512 if !RISCV_SBI_V01
>> > +	range 2 32 if RISCV_SBI_V01 && 32BIT
>> > +	range 2 64 if RISCV_SBI_V01 && 64BIT
>
> And for this patch,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
