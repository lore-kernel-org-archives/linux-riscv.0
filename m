Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0136DC0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1u0VIQ4NIUXAEjzatnUQcz/1UrmCmOCCedYEOwwYYk=; b=GHy6U8ZdT64VEO
	/piAIuSqn++UcIdGS/xThLKcDCe2im3/i879q4vzT10O7seD1Lkazd+jZcjPYuiBit4KmsuehwX4A
	U4+4E0eYeIyX8o2zV9KMv/0e9ZHeAbZHitAPioa7XFsP9KznFFn+4TRVbVJ0VX/Rk/7Lf3YGhz/r+
	37WahwVuIiMKfeoJkKV6QpKht+cCVhlcQXkm6jUHZMsCDh7iHFePWHu0foX/7RasToJ4e8oV2sxTK
	eUeDt7zj1b7da6IPOkzEjcm5pAdol/ETzZdiz4mALsf+MBiP6GT4xbJQjvN/OYs5Tboo6FTQQpAno
	Y4PQsq4AbzM+HCokmFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWL-00000001Wkt-3eyQ;
	Mon, 10 Feb 2025 21:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNS-00000001KYJ-2pp4
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=; b=U9Iscp55QxwoaGQoYEtYflo5i8
	bCLiESkfdZEQqHVFf2d5/6jPiVP3UyWzyjnoJGx6zxRzvbFeA7oo42OoqKnxuU6BGWuSdf8ab4ykq
	b3gqeGfKT3TFPT+3FdH3xMMQfB8T2K7e3b2tKUMh0R/+cXCNQV05nf1D7CDxUZ4tR4C39dyEFAVuQ
	IT15ZnBxNSh0JHedxu02pU/zQ4D8kdnA6YwxGbR8Ew/EVUJVJXEgOgU4Hzo3skfz4mojgnrz5t+Sj
	TPVnn6FXhL1jyMGNMuAW71UhJSLrwo5ZZ/qWPFT47fHB90T4zLfz6eVPx4AHXKBu92RnR/O5/17DD
	u5rag+SA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNP-00000000DmL-3x4r
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f3e2b4eceso90262195ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219249; x=1739824049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=sCyHtiszLJfI83xQxTXu31CX5u+1s5TvtCDS7W9FfFnDC0aK1Uswchd3XBvyHuaj1U
         Sm57WgQMwjrZj1zCQGGYCNjq6Vj/ebMl5AOvK6gEbfMtn11UirFgBVNsTgJH6pnG9oyr
         5DrmdDzBTzlRc8R01rXNUPkVyjLbdR8WQoKS3eorHIVsWr5NxnvtZrksZzc7D2keqE7j
         uKUevDhMf9Ggvhy8QzTUpuc2/adFMbQhCDU9ylyes+K25+RuLZpVqwoHTXwT9UPzmICj
         iKR6od+Os1nR6KlEdYAwQKqWbfRgb+gXZYbj7j5oNlUBvnFidJLUbDH4OCZI0DQCb6Jg
         0lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219249; x=1739824049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=bD8I8sw8BarscARWgi71jFOXL2ZQ14CufaAqZQS0ttHBVygJ3ey8NmczkLU8tsPcFz
         3RzgEYNkBs7Z6fKCA5D+n/MsGdi+wp+z2Oo9B5r3e1I1IE3AUgMlVWtNkx02dSrNx0ka
         YLWBEMtPOn1zmtT3FPwaxLOU0R/C+Bx1iTATKNIPIiuu1hpGu2bVOj/yJRfmsd3JYPKn
         bomt3SHiyLC6EE908EEiLHZ8Gofy5DX2/CngVnUU0UL0qjxjU/MjMniYjAXgKl3MAfft
         sdbhb5NF2b2qm/HMvaSaWwSpMv3G0MuXdISRn6ZvkjrUrdJ+MxtVxxkxf5uLymCHVzkI
         iO3w==
X-Forwarded-Encrypted: i=1; AJvYcCVE7O7vmTmRk9mnkLln2gQY1+dOR4VJZSH5Wh8+Li2ZNmfprgk+rVpw8nzJ+2sv7KPZMHafPnEwBgMkPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxS0f/M9XqOWGW+xgPDnl95V0dGxhlPl2210tXpD29P0EnuLhK
	Z9r+LWQcktEmaEVlQl/GJWLVc4OCL/1F6ZhKs3VRrREB3xkyq3sh4D3gH1BJxq8=
X-Gm-Gg: ASbGncu8OXAGhW7fJXd8bBICY8q5qO/OyGD+AY50WTpj6+DYvIvkGp3gLmmn4Dteu18
	me9xSL/st3KHq63HBL0WzQNtMJYxt8mxx5wuj2ioODMz99uZ66PkXtWOyquCXtGe4TCSa3kTECp
	VA01HjiNWBvDAS0+ZmsJGvVYY9cwVvqn9HmkGVF9qZYHPZrdu0YCgdBMMEftIajeU7D84k9tuvf
	pZYKzXUA1n/zdZ/AZrW+gGqbgBybY9TvAVdsi4bC0eQOURAjaJWCvyXcMiIb4M+FKey5OXnmFW5
	3ZUvCEoS6t+eyfEU2E+jddRnpw==
X-Google-Smtp-Source: AGHT+IEt5F3RjsoBA/4cHXJN1Ltv5WX03R8vCEuQgHxCW+5M2vSetK20AA29/O7CLlddL+JvfC+2OA==
X-Received: by 2002:a17:902:d484:b0:21f:617a:f1b4 with SMTP id d9443c01a7336-21f617b009dmr211020025ad.45.1739219249583;
        Mon, 10 Feb 2025 12:27:29 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:29 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:52 -0800
Subject: [PATCH v10 19/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-19-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250210_202732_063882_4059CF6A 
X-CRM114-Status: GOOD (  10.04  )
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
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
