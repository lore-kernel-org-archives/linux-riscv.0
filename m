Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77330C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58qUM+Y3+omUQlZZddVTOJ65uMT5AKTYB9Z52V7fRyY=; b=d+CKb3co+hmXLp
	DV5LwtaCPhFZYqjNLNHBTYwHCgg/qSKnu6hL40ADVMQ5tc4hu1eSLpZ89pP3Pv2gdipfei8FJAZ7+
	oPHLIO+TeS1d2BUmkb7wLA0lsLip+RAZtdMJ+3hv9CPgrQlBAv4WZMdwFIFF1fa3/qgt6Zo3UNoGK
	292tW5jPfwual663aWs/pSop7LVFz4wJoniMrtEvWEp5jrR3mRqEZlOLOHVdwvQQ+SMuVtTiTMtqS
	lnfhqJheXoC+mzRrh3g1NODzmG1mLxA4VrzL1nMNDgPtrjIhEFXmilMLiC76ACJPK4UZLN/hzFDbc
	lL3eaB6O4Som1UxALn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbkn-0000000CMAj-0b88;
	Thu, 12 Jun 2025 06:49:37 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbkk-0000000CMAN-2Qw1
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 06:49:35 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5290be1aedcso1032108e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749710973; x=1750315773; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIagQ3tKw+VRVzWHIFGN+DFKgeQK8xK9RH2ZXHnRA6U=;
        b=QlNO0ph6D93jXOL7Ur+8rDlW58CQv4SnPZcIT0Upb8Gj7ORmCxts3uYgRwdDkTwd63
         aRHQWG/r7G3FpyTLT3GXlg6vNidCsE2Xyyp6UCJekaOeZyE6qD9Mj/GbskJvGoVa8Ltg
         MacwrokiTB/Mw5FHvwsDBKSWoBn9E6frigNAm31Hz+zxxQbFz174lBMb6sHQoYQguJ4B
         B8iG7tDbUpDilq/lC2xwj50V9IKb6vk77EEogHCkBYj+RfN519mlCdYgQwQnvOD7e/Qi
         wSedeSmAsagj8CkE4yVdBpR5UlPc2spqYxB5OAuUw+U4ly5on6QKF2Q+j4cbaBwZqX4d
         C22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749710973; x=1750315773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIagQ3tKw+VRVzWHIFGN+DFKgeQK8xK9RH2ZXHnRA6U=;
        b=LNelCzgVOq8F4gDtwrYQRT1tbP2OgFQR9KGyu3Vu/QMm7y7kKk2o5uuh5ie8kIz7PL
         ARTnRwHkxwiOyS86MEXAP0f5RkACYFfXPWJQh1/T5GWKS1H4WLymzltAa3VXnhPaEhFu
         D6qSWBoB1mfcGCL1txnWKGA5qfYFanHf/CYh7i3/qvrq1R7O8u2e3yxWbz4JvIFGAvvQ
         e89leSFDWLLWNkOYHDSyECSmZzDq6mNAbb7rP/m/IA28QfRbort98mRBmxOBQSqF1OZ3
         u+olKBSVl0PKflsPnMMhzPbUvsllNaWakJrZezWXqT4raBKOmBKQSnTyp4wrwKUEYIpG
         KifQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs9WSAwI5Ao+YdH3zi/NU8TAdJxzVKDTyNtbfB/LEXd4Ygd4YM0oCNObMjzq+KftcqJVazksPx+1s/NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCb7dEPnxQ+V7lYx3X5ui/jS5DDdOeHHvm5BTNUrtKoGpE+ld7
	41yjntCPkwGL/SlnAGnO1xh/AyNoNJblrGfR5A0UnV/jsF9njYTbI5KZPb4O/sJCx1LJwJaFZ3T
	0uGqYB3xXO8A35nD59fsRMfdGtk7rHmWDeiIR
X-Gm-Gg: ASbGncuLtIhhUwhgCH54uIYIBfIeIAuUtE5iKVMGQ/+upV8jB8cEmyV4yHiDp/8eDw5
	eyTIGyrv9xIqf0UiPW4uq/RoCkpXHoJwyCz3g52B7CVEIELqUUCO8rL+pzgIadM3ZLwDjeV1+6D
	64ZmxPpE5j7rjenetaX67bDK17Jnl87GVmR5o1oqVqmDDdLTfxjBuIsq3J1JWbI+cm/bVMTiMHR
	BwmnOkdTm/lTA==
X-Google-Smtp-Source: AGHT+IGD3eZR9/mZ47AnHOjtmb2jyKNdWbD8QMM1UbBROZtZgAI+wcvkLYS5Dqd7Dl/ahOh6vfuGKCSVejVpRlBkST4=
X-Received: by 2002:a05:6871:5a0b:b0:2e9:5d01:effc with SMTP id
 586e51a60fabf-2eab3fd5893mr950668fac.2.1749710961123; Wed, 11 Jun 2025
 23:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-2-zhangchunyan@iscas.ac.cn> <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
In-Reply-To: <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 12 Jun 2025 14:48:45 +0800
X-Gm-Features: AX0GCFsFusn6QO5kIpgi5nARUF3bNqkUVtgblhgNgnSm2q-UjFddMwiMEi3J5as
Message-ID: <CAAfSe-tUNxzHq-GeN6AhX=46mu5iMYV4OZPNRU1pKf_2xAfGVQ@mail.gmail.com>
Subject: Re: [PATCH RFC v7 1/3] riscv: Add RISC-V Svrsw60t59b extension support
To: Deepak Gupta <debug@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ved Shanbhogue <ved@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_234934_647912_D50B68C2 
X-CRM114-Status: GOOD (  16.38  )
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

Hi Deepak,

On Sat, 7 Jun 2025 at 00:58, Deepak Gupta <debug@rivosinc.com> wrote:
>
> On Wed, Apr 09, 2025 at 05:53:18PM +0800, Chunyan Zhang wrote:
> >The Svrsw60t59b extension allows to free the PTE reserved bits 60
> >and 59 for software to use.
> >
> >Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> >---
> > arch/riscv/Kconfig             | 13 +++++++++++++
> > arch/riscv/include/asm/hwcap.h |  1 +
> > arch/riscv/kernel/cpufeature.c |  1 +
> > 3 files changed, 15 insertions(+)
> >
> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >index bbec87b79309..332fc00243ad 100644
> >--- a/arch/riscv/Kconfig
> >+++ b/arch/riscv/Kconfig
> >@@ -842,6 +842,19 @@ config RISCV_ISA_ZICBOZ
> >
> >          If you don't know what to do here, say Y.
> >
> >+config RISCV_ISA_SVRSW60T59B
> >+      bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
> >+      depends on RISCV_ALTERNATIVE
>
> depends on MMU && 64BIT as well.

Ok, I will address in the next version.

Thanks for the review,
Chunyan

>
> >+      default y
> >+      help
> >+        Adds support to dynamically detect the presence of the SVRSW60T59B
> >+        extension and enable its usage.
> >+
> >+        The Svrsw60t59b extension allows to free the PTE reserved bits 60
> >+        and 59 for software to use.
> >+
> >+        If you don't know what to do here, say Y.
> >+
> > config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> >       def_bool y
> >       # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
> >diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> >index e3cbf203cdde..985f6dfc80ed 100644
> >--- a/arch/riscv/include/asm/hwcap.h
> >+++ b/arch/riscv/include/asm/hwcap.h
> >@@ -105,6 +105,7 @@
> > #define RISCV_ISA_EXT_ZVFBFWMA                96
> > #define RISCV_ISA_EXT_ZAAMO           97
> > #define RISCV_ISA_EXT_ZALRSC          98
> >+#define RISCV_ISA_EXT_SVRSW60T59B     99
> >
> > #define RISCV_ISA_EXT_XLINUXENVCFG    127
> >
> >diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >index 2054f6c4b0ae..0f0f3027d400 100644
> >--- a/arch/riscv/kernel/cpufeature.c
> >+++ b/arch/riscv/kernel/cpufeature.c
> >@@ -523,6 +523,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >       __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >       __RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> >+      __RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> > };
> >
> > const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> >--
> >2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
