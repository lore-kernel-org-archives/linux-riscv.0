Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F71C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RAOMMbY/9T+HlAZWbNxCFXp/OzsFBU+xMDZykcDmVg=; b=EEep3khbWGUO5y
	uf16paH5yQgzC8QeUPv/eSv9fXqEIYSSEt2i0EDr8dTrFp0wNPvrx5giEaQGPTo7WsQ6oYBc9s3UE
	HTezXt0bJahGJMISXQG3nR6mbhLcdWmJFhH9/wfnkL3pwwoTGQ51C2y8g+TASVGh3mMAg2WaEYNV4
	o6ek/D5bcQ9ufiL/DMsfRWLcIF6Kk/9+dKUE0lQATPUhLba/AIgkctnkpJ2MJKH6dkBlgcVLGjNQD
	98M31qrhaebQQhBxTMRkV71s7eQBDiL/EwYxi/1tsL9ExIOks75k+C3Mhovw86NA73HOaWKlc1pkZ
	rWwP8QFBrt3EMDB2cSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Yz-0077JC-1r; Thu, 24 Nov 2022 09:30:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Yv-0077De-A4
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:30:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso3470322wme.5
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcInVSFUNn3V5gEBEwa46hG0c1UErYT5MY3Lep/oon4=;
        b=3U8QF/IxWYVg6NG1OREUoIauxTEjXWySLivW3OoiK8D11df7Rh1iNX1uqA1lBUzNk/
         ZZKzsDnzstwokJqPuVkX0A/kidsn3HFivPBhPNcQI1yvwjuMtTL9u82zvoepm70Tl4ir
         4+RjclN95QEUehpDyItjE35OcZLndsYbjwItRQkgTd7KRkg8wOc3uN8LECUKIdeAGZAV
         bW0FFU2xAeSbzr1FohDjzLwPUBQMTu8RHGIEiMxtfk9c8AUcmU9luvWLkQQ6ZMtsoqbG
         Ygb1PLG82VSFdsp3VMSb7lAu9kGI5Cj3J5CGKFN8RW4f4JToQ8MKzaDWdVK0DzfTfnyp
         B7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcInVSFUNn3V5gEBEwa46hG0c1UErYT5MY3Lep/oon4=;
        b=FjM/MknGRtmKt8n43vt5AwdBgPXHXtC/aL8uRMWjFi8pb8X8FtmFIBJAwPlr0jttnf
         gIdS0CBNugGpcLSOBcxlHGY/FvwZO+h/0xbdl6K4EyXge+EJP5/vQZwl6gJr1GQdxfF7
         EowpYDQAm1Q6E/q/8tWYd720zo9uxWETBnafRFTGcBqMMwm74bkuyBhKlbCa+hmF47nt
         OP4jVIl8LB7C8eYGLeMH3AI+9VGdC3IiYJlcrvlXWh1nvg+QLDHyy6ridLLZcqDL7o4O
         TSJdMfAp0re6LCmyRtwx4kfIDFi+WWyrgkCElgJ2aOO9FvWKKi7qAFTc1SeJr1F6pkKS
         WS8w==
X-Gm-Message-State: ANoB5pn489oy10xMIx5Fk8CLVXmWwfKbagYWhOu+nhBMqp/8A2IpjGGI
	ovvQwfjlv+b8hl9x0SgleUJtOQ==
X-Google-Smtp-Source: AA0mqf4crTB40uwfsg1ylnZejqCYL+Y/+FPaqGBbpi33Lt/Gm3Lxt/Vb0EDvIH6aMI3lgkxSpfZDJw==
X-Received: by 2002:a05:600c:4e46:b0:3cf:8762:23d9 with SMTP id e6-20020a05600c4e4600b003cf876223d9mr10470781wmq.112.1669282225613;
        Thu, 24 Nov 2022 01:30:25 -0800 (PST)
Received: from vermeer ([145.224.92.100])
        by smtp.gmail.com with ESMTPSA id ba17-20020a0560001c1100b00236695ff94fsm885373wrb.34.2022.11.24.01.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 01:30:25 -0800 (PST)
Date: Thu, 24 Nov 2022 10:30:21 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	linux-man@vger.kernel.org, Jiatai He <jiatai2021@iscas.ac.cn>,
	Heiko Stuebner <heiko@sntech.de>, Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
Message-ID: <Y385rS/5zDaDJ3Os@vermeer>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0i22SdbHjB/MX@Sun>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqY0i22SdbHjB/MX@Sun>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_013029_389367_A832C858 
X-CRM114-Status: GOOD (  13.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 13, 2022 at 02:46:35AM +0800, Hongren (Zenithal) Zheng wrote:
> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> index 46dc3f5ee99f..bfed3e5c338c 100644
> --- a/arch/riscv/include/uapi/asm/hwcap.h
> +++ b/arch/riscv/include/uapi/asm/hwcap.h
> @@ -22,4 +22,26 @@
>  #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
>  #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
>  
> +/*
> + * HWCAP2 flags - for elf_hwcap2 (in kernel) and AT_HWCAP2
> + *
> + * As only 32 bits of elf_hwcap (in kernel) could be used
> + * and RISC-V has reserved 26 bits of it, other caps like
> + * bitmanip and crypto can not be placed in AT_HWCAP
> + */

Have we agreed that multi-letter ISA extensions would use hwcap to be
exposed to userspace? With so many potential extensions, we could
quickly run out of space on AT_HWCAP2 as well.

Cheers,
Samuel.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
