Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD06CE835D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZDFxDHGaPhojWo7hjh7lJfvswaOoOUXIMvbbMgopCM=; b=eym6ajvQrlG/OW2NRJwWgxfZkN
	L9qj3qLVKePFSdtwNTtSAR4lq6AF4nPFE+8nNK4+BLPV8o1xaH/UoP7tz+EIDwHWx930kXMqoWo/U
	7Iq+9c063IqcSaVKGf4SEWYsZoZ+KMaVFL/j65XT35sglvo8CyWFQC6/xnEGvDSoCGsyNjSqRC0Hw
	MDLSx5ASZn60lOb8poOW6r+Q/j+lxtwaD9G0RNra5janJVp41RGz6C+Jx8DVGsA0MX+On5nmLdWfv
	aQYhvEsTDubEEtk8G/Vepkuz1hZlnyto00EBVUsCz5BSVhqfKmVwsdFw7CyN7puTVx9ecohftq1zM
	PCPLoe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJud-00000000LYY-13CC;
	Mon, 30 Sep 2024 17:10:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJua-00000000LXk-2irn
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 17:10:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20aff65aa37so37713755ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727716216; x=1728321016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kx5xY759dyUvA9Oa0etxE9VI1UhfQHqL7wndkbURsJU=;
        b=Is1py1kkTxpUgyOt+v/zMCFNIJhoSfhWmSoZlY4e77caPucmMsShB6++v8VwqX/FRZ
         qGZY857LGyX87awptER6AxeOeWaAY0i3aRhNBsWps5Ho218J7v5soCiBRIDCGiTRIcUE
         8PUXwni3uHrKpcaqt6Dift5As6rtBlfE5Dfon6yrTP/m0+HLavf1fdJgMFKB3DtI/LuZ
         kHR+kM1GkFGu6E/72SREpnoP8kmhwHCUVLuuTGvZezfRc1nFMFmmL0wCjspbVPDk3n7d
         8JayQG0e6WVVmO6ioZ5MBKKTKA596D3dEv9sG1pNXr3a/AKnErpci0hMIQjBf5VD7RrT
         +T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727716216; x=1728321016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx5xY759dyUvA9Oa0etxE9VI1UhfQHqL7wndkbURsJU=;
        b=QJvlOc+liQX9hZl4QqZZJsWKT3+H+ICmn9vilsglE3C20IvagZpp/fKLUWFSZsQZf4
         Xm/5F1X3xpAKC5eRt0/MB4l5yyQ57AfeH/tgiBtOUt4OafBcG7XoKT5ZRQtourDNMhHO
         LIubBSMgryjKsRSZ01KZaxpHlt8YEY3sReL8mUsnmTktxLh5gWSxVuS7lpwaR5ZyoKop
         NHl//sRP60lsKEUoi+yVLgZhf118olZzMqQhRcvyvK/7v3Wqv2q6k6eqa4JDUuERFRik
         U04FGlFVQ1ZbDlb/JJoEIX3CiJfNYWLS/E9y9ng2hocDWzH/jlZ6R1e7M8wOC6L5WeNp
         DUmw==
X-Forwarded-Encrypted: i=1; AJvYcCVVxQ3NL6xRv9vQWc6RAEWQSU8wZZYSKlG7VO6UYIK/+dKtY2ffMkHtydz2Wofjqc/Ga7hi3EcgqNWecA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPkMacSREQcU/wMvmBQsKUdt7VLoCkZwDmEtl6oLcuog+oNn3k
	Hikc8wRDAl4vK722A/gdTBral26wvsHdqApjRaFSkEfc2WI3uKHKUMkamPRlo9o=
X-Google-Smtp-Source: AGHT+IHhm9pcVh5+FAyHVsQ1m3+mrrvYcuAeUKlMpqmlUG23x4p++fjWVQHljqdw9xU30Zn1dsMTzg==
X-Received: by 2002:a17:903:40d1:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-20b3f702f68mr178426175ad.41.1727716215778;
        Mon, 30 Sep 2024 10:10:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b533fa125sm42501775ad.141.2024.09.30.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 10:10:15 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:10:13 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Max Hsu <max.hsu@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RFC v2 2/3] riscv: Add Svukte extension support
Message-ID: <ZvrbdUrU+/L3H+CR@debug.ba.rivosinc.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
 <20240927-dev-maxh-svukte-rebase-2-v2-2-9afe57c33aee@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-2-9afe57c33aee@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_101016_719197_F040526A 
X-CRM114-Status: GOOD (  14.35  )
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

On Fri, Sep 27, 2024 at 09:41:44PM +0800, Max Hsu wrote:
>Svukte extension introduce senvcfg.UKTE, hstatus.HUKTE.
>
>This patch add CSR bit definition, and detects if Svukte ISA extension
>is available, cpufeature will set the correspond bit field so the
>svukte-qualified memory accesses are protected in a manner that is
>timing-independent of the faulting virtual address.
>
>Since hstatus.HU is not enabled by linux, enabling hstatus.HUKTE will
>not be affective.
>
>This patch depends on patch "riscv: Per-thread envcfg CSR support" [1]
>
>Link: https://lore.kernel.org/linux-riscv/20240814081126.956287-1-samuel.holland@sifive.com/ [1]
>
>Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>Signed-off-by: Max Hsu <max.hsu@sifive.com>
>---
> arch/riscv/include/asm/csr.h   | 2 ++
> arch/riscv/include/asm/hwcap.h | 1 +
> arch/riscv/kernel/cpufeature.c | 4 ++++
> 3 files changed, 7 insertions(+)
>
>diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>index 25966995da04e090ff22a11e35be9bc24712f1a8..62b50667d539c50a0bfdadd1c6ab06cda948f6a8 100644
>--- a/arch/riscv/include/asm/csr.h
>+++ b/arch/riscv/include/asm/csr.h
>@@ -122,6 +122,7 @@
> #define HSTATUS_VSXL		_AC(0x300000000, UL)
> #define HSTATUS_VSXL_SHIFT	32
> #endif
>+#define HSTATUS_HUKTE		_AC(0x01000000, UL)
> #define HSTATUS_VTSR		_AC(0x00400000, UL)
> #define HSTATUS_VTW		_AC(0x00200000, UL)
> #define HSTATUS_VTVM		_AC(0x00100000, UL)
>@@ -195,6 +196,7 @@
> /* xENVCFG flags */
> #define ENVCFG_STCE			(_AC(1, ULL) << 63)
> #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
>+#define ENVCFG_UKTE			(_AC(1, UL) << 8)
> #define ENVCFG_CBZE			(_AC(1, UL) << 7)
> #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
> #define ENVCFG_CBIE_SHIFT		4
>diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>index 46d9de54179ed40aa7b1ea0ec011fd6eea7218df..3591a4f40131ff5958c07857a1bd1624723d6550 100644
>--- a/arch/riscv/include/asm/hwcap.h
>+++ b/arch/riscv/include/asm/hwcap.h
>@@ -93,6 +93,7 @@
> #define RISCV_ISA_EXT_ZCMOP		84
> #define RISCV_ISA_EXT_ZAWRS		85
> #define RISCV_ISA_EXT_SVVPTC		86
>+#define RISCV_ISA_EXT_SVUKTE		87
>
> #define RISCV_ISA_EXT_XLINUXENVCFG	127
>
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>index 3a8eeaa9310c32fce2141aff534dc4432b32abbe..e0853cae1dc0ba844d5969a42c30d44287e3250a 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -381,6 +381,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>+	__RISCV_ISA_EXT_SUPERSET(svukte, RISCV_ISA_EXT_SVUKTE, riscv_xlinuxenvcfg_exts),
> 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> };
>
>@@ -921,6 +922,9 @@ void riscv_user_isa_enable(void)
> {
> 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
>+
>+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
>+		current->thread.envcfg |= ENVCFG_UKTE;

Pending merge of samuel's patches, this looks good to me.

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

> }
>
> #ifdef CONFIG_RISCV_ALTERNATIVE
>
>-- 
>2.43.2
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
