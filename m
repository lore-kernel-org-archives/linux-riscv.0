Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9F0C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KDEOdd4iAgDEQzuMZuUFl7VMr1b8ZEQLG3VBHKZbeHg=; b=xYPODX2LOPkA7u0eXviW8om1C2
	GAYNwrj2hiEexCnfwBOxbxz2MAVc6fWXOraWYBbLndQ5+1sCer6x5bGIqj0lzMaMBs3GD16FmcuBZ
	OBgr3ZQVTZD9yumKf02QW/PT3Bv4azimrwk6jahRc0ChBsUl8tRW4p0XRsZFuWVWZA4gdRPeZm24c
	0WOCQQ2BN4tMRwrVyo56X/frfURlXH6Uk6bu18rHY9JS2xN0dgnNnxJgrExMw24dM1sOwvnjgn6YW
	IXTKupU+vGiBfNmEY5gcIpzI528HuRCeToF5LcKElLnebYI9YG8dWRINOdTodJxBhHjUUlnocC2m0
	rib6ElzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rC5oE-000ckX-1u;
	Sat, 09 Dec 2023 22:28:30 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rC5oA-000chi-0q
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 22:28:28 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b9ef61b6b8so1229939b6e.3
        for <linux-riscv@lists.infradead.org>; Sat, 09 Dec 2023 14:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702160904; x=1702765704; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=GIZ+mcVI5qd9xzhqd2Lq/djPmsscI/1vsqmZHAfk8NA=;
        b=fcAyvtgr/P86KD7EgiiDUsSe6KWHQ4KjUcRbRRXa2zj8VDNy/fMl6EAm3RKHbi40Bp
         YvtfOopHK9uF0uUpFfNh0L47hi0UlsrUnjTPyvxeWudU0Keb3GkX5pshZmuu3ELIWfHi
         IhPPA9Z3CxDkocYErq6Yl2kwxItys//eielvG8TQMkWh57MnR8igcbQh1lyyiNeQyCBN
         wUK34T9nS9Lxzw5oRNj7YorTeHYI/45EEi4NgpwK60aNaz7CF6LyTL/ABfoU1fT9AH/s
         O77bBcuXg7Qrr8CN2yrSu+8ZXDgQ53X6dzM5At8jZqYlTiw2zfadtCzc1H4F9UADE5j1
         jm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702160904; x=1702765704;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIZ+mcVI5qd9xzhqd2Lq/djPmsscI/1vsqmZHAfk8NA=;
        b=SPdnrdz3LAjY6qG0+JRdztEFoAZieESu4VFFlv2CYDw5l/XVflhSd/+iOzYXANa+rf
         iimb53IAeCMcG2bERL8j6qok9zfxe4lRq0+ewcMMljAvEO2hcrZQ/CEmK/z8agc6qxId
         0zHbNYxoy6scGbXSZ8S/b/FdzWbmKog95lp1Zlt86enH9rJUPKaMNrwNZBvP+1b1golq
         c1a6LqtGZok7IDv7vdKLlX31gjyz5bammBkIcu4VmJRsYxhuZ16rH1uHswF5Kq/J5RrI
         9+dpT6LCC0Q4tojpMOobEMkOMLKdRIikIM2tTu9xDUr86IkJF2U8s0SNjWHE8DVWttye
         AeSA==
X-Gm-Message-State: AOJu0Yw9eOxiOOWRZSNBNRFBd/lLR8Bkhk1s8qczIs4sggUWTFxDq63O
	IV28/II6FxLnPpwXTonun/dM0w==
X-Google-Smtp-Source: AGHT+IHe/3Q7T7mqAS39AMZy9ESnpkNFM6q37u24Z3u046keYsm8BlHmxnJkG9/CppRHC9PxpHjPRw==
X-Received: by 2002:a05:6808:21a6:b0:3b9:e87b:d963 with SMTP id be38-20020a05680821a600b003b9e87bd963mr2922446oib.85.1702160903962;
        Sat, 09 Dec 2023 14:28:23 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:ded6:9593:9f4f:5c29])
        by smtp.gmail.com with ESMTPSA id h17-20020aa786d1000000b006ce7ed5ba42sm3794269pfo.171.2023.12.09.14.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 14:28:23 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-25-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 25/39] arm64/signal: Expose GCS state in signal frames
In-reply-to: <20231122-arm64-gcs-v7-25-201c483bd775@kernel.org>
Date: Sat, 09 Dec 2023 19:28:21 -0300
Message-ID: <87sf4bf1tm.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_142826_307273_D1F7D59B 
X-CRM114-Status: GOOD (  10.85  )
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


Mark Brown <broonie@kernel.org> writes:

> +static int preserve_gcs_context(struct gcs_context __user *ctx)
> +{
> +	int err = 0;
> +	u64 gcspr;
> +
> +	/*
> +	 * We will add a cap token to the frame, include it in the
> +	 * GCSPR_EL0 we report to support stack switching via
> +	 * sigreturn.
> +	 */
> +	gcs_preserve_current_state();
> +	gcspr = current->thread.gcspr_el0;
> +	if (task_gcs_el0_enabled(current))
> +		gcspr -= 8;
> +
> +	__put_user_error(GCS_MAGIC, &ctx->head.magic, err);
> +	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
> +	__put_user_error(gcspr, &ctx->gcspr, err);
> +	__put_user_error(current->thread.gcs_el0_mode,
> +			 &ctx->features_enabled, err);

Other preserve_<foo>_context() functions zero the reserved fields in
ctx. I suggest doing the same here. It helps with backward
compatibility.

> +
> +	return err;
> +}


-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
