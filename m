Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE322C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Mime-Version:Message-ID:In-Reply-To:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Kx9YO7FJo4hYGyGH08DffB3CKcfcal93gKcqCL4JP/M=; b=CpHaSFHWeVhIFNJQdx//Uh5gdW
	mOaeeyIvAMkHBUoPSYqFCSpeTuSYSuDC9puuhJ8EDdqJyygzTSM750txm5LyTJDWpb46iyy3+6fAt
	nSvPtyGNv3nDEB4FC73jyI5MoBc49jB2iSS7utUhFq0eHOZtYzQN78qHIwD0zk/N/9YLfYbwSjC3z
	Noge58YHVJSE172nrab/Mh4lY5kNpFRgUpxIzj8ZdcCmdTCKkZBYy+hMrZCj0rKpqdQN6VzTNiv7I
	pi3BHbys67E0U78tsVGD0m6Od9FWctXNeSnRFuhyMxmNpogo35OypXf/6APNRaFYGbMs+b1CAavMc
	ZRO9wbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5GA-003zZM-VQ; Wed, 15 Feb 2023 00:02:54 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5G6-003zXk-G6
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:02:53 +0000
Received: by mail-pj1-x1033.google.com with SMTP id w20-20020a17090a8a1400b00233d7314c1cso394613pjn.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbFovadKcl/JZxK4Bjf6R66tD5TDSZlcwBjyZK7kphs=;
        b=NWTezG1DVyenY3xUETeqQjvR9TAb/Zov9eU2Yf8vrIoUv2Dzf5aaT9sSbc+xufYdOO
         u51awyyzyZ32M5/VZkOppCdzJf6ADdzM34T6o8leJ4EbnVJZnJp84MKhe+znBv9UAjvJ
         vZvpnkBNouM81P09I96pC/IuxbjUtsizIMOIGdJ1rojXyEhOSZxHo9G7w+DD8n7NJ1Pj
         zT7wleoczdF6bKuYbPVWNzgVzJIhKJhUSJIfQyQ9Ri6eAwgER0nuLS0oLaXcZrtbJQnu
         Hwxh+laJ8YyGZmFV11oaTs8u/XFyeSEK30zTohWDXl75l7ShwtF70gw3Y6CaZtqIgztv
         FdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbFovadKcl/JZxK4Bjf6R66tD5TDSZlcwBjyZK7kphs=;
        b=42bBKM1F9H23xr1zrqJYQErDDl5z+AwvjEi27CmhhoM47y0AoPPCK2c2jbqOumaKYK
         PSFbDPGwFZae8dZ3jcjI4565fqYFAVrUMonFLQh1qyetiIsSRoZjQbdjTiWR5Dm1JSLa
         sr8Y0dUP06uDwFbaHU4wGG77AKTrReFBuExZzh+/KBMtwmRvMDI3uhC6dG6mRnebxtmW
         RGMb1f3+IZNcW1DHoS6APEC9FQVQQ1DT1ldWoG96DRLIo01EvbYOEyI4kLIKJF27SA2I
         u8ECqdFkQEyExxObWa8UcxUUFM3z7roX/tlMir3Py9tG8Rduzwp53T1+E0JQsQWhPzHN
         Htfw==
X-Gm-Message-State: AO0yUKUIRFjIypmpgGg2l/G7gfNzSqTACx18n5iav+On4X64RpaLX03X
	NqlFbxd4XTeMxLiAPAWB52IYInYPOqA6ZItH
X-Google-Smtp-Source: AK7set+6Y853n/N5t+vbHSaAjDqsCQPLVR+jnlBV0n84XFSHISWBfJoXBPP4YXeFIfYFLl/jCCUHoA==
X-Received: by 2002:a17:902:cf4e:b0:19a:8647:1267 with SMTP id e14-20020a170902cf4e00b0019a86471267mr354415plg.42.1676419369354;
        Tue, 14 Feb 2023 16:02:49 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902d30200b0019a733a75a2sm8756686plc.60.2023.02.14.16.02.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:02:48 -0800 (PST)
Date: Tue, 14 Feb 2023 16:02:48 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 16:02:33 PST (-0800)
Subject: Re: [PATCH] RISC-V: Guard alternative asm macros with !LINKER_SCRIPT
In-Reply-To: <20230214201358.10647-1-palmer@rivosinc.com>
Message-ID: <mhng-858f0ba6-5ea1-4f41-b0b1-42f33c09dfe2@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_160250_776706_F54E20A7 
X-CRM114-Status: GOOD (  16.19  )
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

On Tue, 14 Feb 2023 12:13:58 PST (-0800), Palmer Dabbelt wrote:
> Without this I get a handful of .macro related directives that trip up
> LD.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> I'm not sure when this started failing, but I recently tried a build on
> my local machine (with crossdev-based toolchains) and it failed.

It's actually just because I had 
https://lore.kernel.org/all/20221216062109.865573-3-panqinglin2020@iscas.ac.cn/ 
applied, I'll squash this in if that's OK with folks over there.

> ---
>  arch/riscv/include/asm/alternative-macros.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index cc6a81c00f2f..afc87528cf71 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -6,6 +6,8 @@
>
>  #ifdef __ASSEMBLY__
>
> +#ifndef LINKER_SCRIPT
> +
>  .macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
>  	.4byte \oldptr - .
>  	.4byte \newptr - .
> @@ -53,6 +55,8 @@
>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
>  #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
>
> +#endif /* LINKER_SCRIPT */
> +
>  #else /* !__ASSEMBLY__ */
>
>  #include <asm/asm.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
