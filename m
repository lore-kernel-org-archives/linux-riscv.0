Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A995C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KAboqWEWfYDsdaoft56+bFtiKI6L/yFT3IleJluC758=; b=heGlVOMbiDpcByBZ+vmbiP4s1a
	YLT4iv9XBhrVNEJL+vjUEgP2ixfy+La5sUPg73MiR3kMk6k1BiYCMs6aW5GlNpZOTVvpWKmQoyDsr
	MwZq3MA0nrBV29zwsFn5ZxwnL/Zo00cnNOQYoigh7YpAzE/fdgo10BXx4OqK+mPZlSybx0RjGUmWG
	RufOBcStQHvL0yFDuzHQ6LhhJlKScqNm4RSkTMBk+v+KQe3cu00pekIzZrgrJbx6D/2PTZzVqWGLJ
	ew1uxR0dFmELTKURA9uQjDZ7CwTB0CmSRhFOdYpR/64DDWZkpRjXsFf70XhJJaQZG65R9KzvSr2T0
	fZWAAHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTNtS-00000007cBe-1a9Q;
	Mon, 15 Jul 2024 15:45:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTNtO-00000007cAb-3YJb
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 15:45:36 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-781f5007950so3731043a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721058333; x=1721663133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9SSjYvQo2eE6vQpTPkzDwm5HWtKGekBFfdySycMfTY=;
        b=SPdO3oN9Dp9pmUeDVT0pcxvYbIH/zwfRF5QuIMbusaOViULOWR9lvYQHoZFz/uvNlk
         D9BWYh2+185pYkT+N1KBJ4OPCX8qLQ9p4/EnX1fKX1E2GfJe1azIkwiZVZ8yeromErRB
         j4LCby3kmdMpPKfMaEChQtXuNSUZ0gys+Ohpiwo6LJJqh6dI4cG3uBIv4Npijz8sHE1e
         EZfdAK8xESyDo6CnuIPy9EzXb06USZ/nfaK6sbKAdwPYL0Y0lU5JkU48S5vpLFjPVlKH
         DcXPG5791SeQhXsUp15DyFzsPrUKduoh1uR+SZa0Qa7tofArFMyL5QFb0shg1bWvadbw
         T7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721058333; x=1721663133;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9SSjYvQo2eE6vQpTPkzDwm5HWtKGekBFfdySycMfTY=;
        b=k1hCqIOS3ulHtiD8UET5wQo5oMJuvMhhZBJfn0Jzm9xFEUXIAuqF4M9kcgM0eL9XmW
         6m6RqzF+KvLkIeoh5wck9EI9cPpamQBDDZ30QxmmMvcG6LHjywShDb9E+nuxr5fNszuW
         kDG+F7DS8lMiaIkc55OTPbz4y2XKrUng/7pOoOtv33BSYN9sNwr+wfzT1j7Bsi4SFlpv
         CYEu4QZvvQxSqlatPwAB0qNh0pBf5mNmifkk2yqSK/sHUBdpMff27BVrpIXPIslEe+2M
         Afd3tgmg/9CVvms9FXTxdfBTV/FBYP0T1rJZAAwz309GBx2kme2v1OHVcbr/sIc5EXNS
         /twA==
X-Gm-Message-State: AOJu0YwbWoAoYqcZBpUyTcxqVz9rQpmDJ5u8DuG4AvrZ09tYCZYj+Amw
	PuBN05D/tjZ/QVT3tiXK028H9x1dsCaftJYHd3cXrOiTAZhcjCeJuQz9Fy/JhEmb7aMNvPIHqFj
	F
X-Google-Smtp-Source: AGHT+IFNK6/9Wxqf80HkpI36sSd2P3cUUY70Ol6prD1pytY8UlRbhTb4pUztsieCjJEp4UjBAvSkbA==
X-Received: by 2002:a17:90b:303:b0:2c8:895:e980 with SMTP id 98e67ed59e1d1-2ca35d9aee3mr14610615a91.47.1721058332974;
        Mon, 15 Jul 2024 08:45:32 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedbdb7c7sm4522541a91.8.2024.07.15.08.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:45:32 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:32 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Jul 2024 08:45:30 PDT (-0700)
Subject: Re: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
In-Reply-To: <20240426100820.14762-12-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu,
  Heiko Stuebner <heiko@sntech.de>, Charlie Jenkins <charlie@rivosinc.com>, David.Laight@ACULAB.COM,
  parri.andrea@gmail.com, luxu.kernel@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-fca2e1e4-385d-4210-8814-680be3a2ee4d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_084535_193733_DAEB92E8 
X-CRM114-Status: GOOD (  21.40  )
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

On Fri, 26 Apr 2024 03:08:24 PDT (-0700), ajones@ventanamicro.com wrote:
> Export Zawrs ISA extension through hwprobe.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  3 files changed, 6 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index b2bcc9eed9aa..e072ce8285d8 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -188,6 +188,10 @@ The following keys are defined:
>         manual starting from commit 95cf1f9 ("Add changes requested by Ved
>         during signoff")
>
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
> +       ratified in commit 98918c844281 ("Merge pull request #1217 from
> +       riscv/zawrs") of riscv-isa-manual.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 9f2a8e3ff204..a5fca3878a32 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -59,6 +59,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
>  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> +#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)

I bumped this to a non-conflicting key when I picked up the patch, I 
figured that'd be better as then we don't have a uABI hiccup.  There 
were some other merge coflicts that looked easy to be, but LMK if I 
screwed something up as I'm not operating on a ton of sleep...

>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8cae41a502dd..b86e3531a45a 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZTSO);
>  		EXT_KEY(ZACAS);
>  		EXT_KEY(ZICOND);
> +		EXT_KEY(ZAWRS);
>
>  		if (has_vector()) {
>  			EXT_KEY(ZVBB);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
