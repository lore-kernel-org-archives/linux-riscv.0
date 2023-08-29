Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209FFC83F14
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 08:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbYQkqxd0Wk+NSW/SNoCL7RP2E4oHcFy+QhMui3CrIQ=; b=jh64cJ+ho0NeTT
	gmUXSAs0jX2j7Fdb1naQVkSxG98rNJ+5P/JIIA6HMRE6lDgYuBJq5GQI73HmHFyKSs9cSrQZSfjRt
	N7+qEr2AyuKvLXgu02CtivOmcAOFUEiIL7a+gix920pmvI+2dARE2qCHR1UC89wfi3SF1kJ9ETAJc
	uGX4xEGm/QP62mT5XxPuqNmteX0YtlVgA5lEs6P61gBlueHzOiVc9j2zOXkt0sRcc1h4Ge49r7LT6
	HTlaSpFgrJXZCeBZOr667oyuz+3MnQ9SlMzYCdf/i5i3bAXDoccboZGIVAYh+2U83l0P+vX0NY7Qf
	GgJN/U1Akto4o3dN/QJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qauOs-00B4YY-1g;
	Tue, 29 Aug 2023 08:48:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qauOp-00B4Xp-1g
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 08:48:36 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c353a395cso529415466b.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693298913; x=1693903713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YJc8FCGCtf+QA21PW9zw+dSzN4oao0rbur83lcAqpY=;
        b=Nkoj5q9dpgihnYQDPjsqU6J6Uuu9c8pYZBsdwMP2jSuzFN/URHy4uhx/gAYTdEX32i
         msyWquKqH7TyXlBzqaQkLwp0sL177Ys+TKCv/110EI5nE4tzMlccH3ibQajkI5ptQu73
         s80ARD1kkvuMVOgxOFHdtFvvcr4jJ9gruwZSuQNNTf5uZ68tYeLzcSMryNVQkhz1PXqL
         2htVRTZcB4z+6aRYe7Mn/Szlr91Os1jMRgjZn1gspUnOeD6bCKCDZxYRIc9IeDOTfKjz
         ppH7c/aNgMT1ltsDXRUPxDSAf8X09phm4Lkd91008AqflC31IAKtoow49OwDLLtvgTik
         v1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693298913; x=1693903713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YJc8FCGCtf+QA21PW9zw+dSzN4oao0rbur83lcAqpY=;
        b=YAFpxnYWKENNB5aIPUOWrps4kf/hwceup8An8X35cHizTKDT5TamidtdJRCqAaNtDI
         kGjWa2XbyD98E+6kyord54Aj8FCdMPA/6xvbxyOmGdnBmv8uTg48vB7w0N8ota9gkd93
         Ns8l4qaG1mSsLqfUwiqhqt8TwtLr1+nFVszj7gsm5xvlY8yQrgLYaGnXxIrwkV8uXSbL
         DR3iT4XaEt4oNVgTksE9Jo/1yfMgwfPGFentQ/a9nIYfzIYk81zwauW7AyzsZnOmGLo9
         Zeoea84Qt5ofx+5Mt0MnIPzb6PG0ip6Dw1uxHTlN1eMbv1UuuhPtPV9yDL8nxAzHHpwD
         4SMw==
X-Gm-Message-State: AOJu0Yzk811Own8+u4tOQAmznhxrR85KEKi4fitL46Hp+thR4C+0V0FO
	8IczLfmoL2XyQgixkLoUYGIkug==
X-Google-Smtp-Source: AGHT+IGANV0ko3RQERka+ZkTfDKbn4edddXZrJXmeK3uAtPTDgyJGdXhlgqVkQjEV7B8tUjt22YIPg==
X-Received: by 2002:a17:907:2bf7:b0:9a1:ad87:1354 with SMTP id gv55-20020a1709072bf700b009a1ad871354mr17131329ejc.34.1693298913427;
        Tue, 29 Aug 2023 01:48:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lw13-20020a170906bccd00b00992f2befcbcsm5675917ejb.180.2023.08.29.01.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:48:33 -0700 (PDT)
Date: Tue, 29 Aug 2023 10:48:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230829-e445d0bdff78969cc33a6263@orel>
References: <20230711201831.2695097-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711201831.2695097-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_014835_567187_E4EBF14E 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Evan,

Here's my stab at new wording.

On Tue, Jul 11, 2023 at 01:18:30PM -0700, Evan Green wrote:
...
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 8960fac42c40..afdda580e5a2 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -42,6 +42,16 @@ An example string following the order is::
>  
>     rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>  
> +"isa" vs "hart isa" lines in /proc/cpuinfo
> +------------------------------------------
> +
> +The "isa" line in /proc/cpuinfo describes the lowest common denominator of
> +RISC-V ISA extensions understood by the kernel and implemented on all harts. The
> +"hart isa" line, in contrast, describes the set of extensions understood by the
> +kernel on the particular hart being described, even if those extensions may not
> +be present on all harts in the system. The "hart isa" line is consistent with
> +what's returned by __riscv_hwprobe() when querying for that specific CPU.
> +

The "isa" and "hart isa" lines in /proc/cpuinfo list RISC-V ISA extensions
which the kernel can identify (the kernel recognizes the extension's name)
and have not been filtered out due to effectively not being present.  An
extension is effectively not present when it is unusable, either due to
defects (which the kernel is aware of), due to missing information which
is necessary to complete the extension's description, or due to being
explicitly "hidden", such as when a kernel command line parameter
instructs the kernel to pretend the extension is not present.  Note, an
extension's presence in a list does not imply the kernel is using the
extension, nor does it imply that userspace or guest kernels may use the
extension (__riscv_hwprobe() should be queried for userspace usability.
The hypervisor should be queried, using hypervisor-specific APIs, to
check guest kernel usability.)

The "isa" line describes the lowest common denominator of extensions,
which are the extensions implemented on all harts.  In contrast, the
extensions listed in the "hart isa" line need not be implemented by
any other hart than the hart corresponding to the line.

---

I've specifically dropped the 'The "hart isa" line is consistent with
what's returned by __riscv_hwprobe()...' part because I suspect hwprobe
could at least lag what gets put in "hart isa", since the kernel may be
taught about an extension for a different purpose first, neglecting
hwprobe. And, there may be cases that hwprobe never enumerates an
extension which the kernel does.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
