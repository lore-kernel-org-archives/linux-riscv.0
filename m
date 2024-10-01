Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870D1CEACE6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNXga4wIff13xPr+cfJQgp87WUF4kRgo84xBMMES5kE=; b=lPEJVXdc0I9QiQ
	wJKIGyNITOOLdc3BK0MYgc8Gxlj7dcPciQaVq8eTo4kCSD5X7X70SrNmM3VIcwfp9XtZ0O9M6mvtc
	f3zSeun+Xa1zMZHZoSLZW9AUezZyvX/MgsqZY/+0KAFQwpxwf13qn2k3iRWHcNf+31HzziHv5RDGc
	nBX7+UcNm8AoKczKyzspxRozlYj8zy5jgOze2ysovdunIyk+RwyMXHZcBIw4EQPmgR0xnCki7VUit
	idm71RmnynK9BgKEBmrG8merPHL/SdtgjOOI/it3OujtU+IYDFc/0VM+TUlrarnPhnH0R8A9iPWTw
	NrucgafNLaPtIzyJ7W7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfco-00000003WWC-2rg8;
	Tue, 01 Oct 2024 16:21:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfQ2-00000003RWn-0UsF
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e091682cfbso4248090a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798889; x=1728403689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=;
        b=1fvoSEdYk0I9s7g+3OHuGFreQ7g0kwMrJVo57uocF+fyf8tcHANnsUb4C6/22UiBGI
         fdHx9+lJaRhspM8jApzV2U26rb8sLDnQbk22C3ZE5raXmKNwFKuE00ConU1pOgBgcaiI
         z3R1E861hMuP3nW3+xb965OBkbHQXIOCHKWSdgy3u1DhHu1Rg6ZaoRmgNZs1qMZ0w1WY
         do+XnOXlcek/RwJwKeI9ai1YmSWhfCS1Rjn9DGgOBFjrnQ0lmEY+Cxb2UhVP8VBks4YU
         jyavCQV8NKDnB0CG9YrEzC1PLwjSk/R1Bo2Ro9pxS69lT4e/u59+6y9l2pzFFUEM0Ez9
         xPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798889; x=1728403689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=;
        b=CtebMVRm/4YpXDr35On5xXiJST8AjUiB0QOVi8fmLxJ0+jgxQubXfBh7OZOXZc/Qpx
         3cpn0Jrrv8Ea4ZU0RuW3vBLPdwa/JqTfF2Gu855HMGEtIZhB1a2z+SpWEi9lKIkGE2CG
         TI8KArfHuUmYwZpQatLERKMZszljDTO+HnvH1npNO7pm7fTT3TcHFwXaN1QyslnqJ3HK
         D0CJHCvxov29vbN7PIP72BcUOhRsHwGD7nVNS4QS4ERPnmjC+Zs+I+IHQrozsGBlIE4G
         Neh17bVbgNTtH3a69WdxZqoss10Qf+h2FUefgPu3FNZKm511oVtq3ZaXV5m20VrcN7e5
         iiPw==
X-Forwarded-Encrypted: i=1; AJvYcCUu4xQ+7ScwjUrhuiQ+SPVH5+sNElbr/5DZrIe/oSkpHlJGE0eMpDQ3krVPCslODwiJOozlutl8RSTC6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT6ylbGOWCvmsiS8YQiAb2ZeK6DOzLwsoizFHomC0yOHj24bhB
	/z9KavEhTP3DOXqiyofo5JmtrUw4RA2XXmAlako9zSmw/DApQspjX3GnxghiITc=
X-Google-Smtp-Source: AGHT+IEFtkvkf8CeAUwgsAXuKYnO4LfTHDhI++8QoSmmlyNMIGKy49PqXf+MVN7GYY3kXwIYrf7vbw==
X-Received: by 2002:a17:90a:7402:b0:2d8:77cc:85e with SMTP id 98e67ed59e1d1-2e18496b9e2mr188291a91.37.1727798889491;
        Tue, 01 Oct 2024 09:08:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:31 -0700
Subject: [PATCH 26/33] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-26-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_090810_304899_75FF7CE5 
X-CRM114-Status: GOOD (  10.48  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..d5c5dec9ae6c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..98f72ad7124f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
