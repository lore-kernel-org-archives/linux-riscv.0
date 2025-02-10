Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7F4C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouo6DX3+Zo2X0OcJAXK5MF+nGOnvNHn35A1HrfTTM7o=; b=Yhb83MVYBVBXTV
	JmkY4IF+BA2HHmTIyncNgYQtltvX4ghTUD2qEMDiOAwx5ALnB95rCHNy7JmnyJoua47w3SMaMald2
	LAQUrm8+RFcW8k1TFgWXKGwJDT40Aqi1xsCWSL4g6gWnPckh8zCiUux0u3BXOxEL/ryEVoOTBu2R9
	wkSy4eRbbCqdsBONY6qeaMEgDd9KfFmd5UvYSL1e5wWo59OpmqpbiTqdidytbZYQhv2uboHbvxcvH
	TYs5edY7CHOCiZRC0htRdYUzkZjpPuZCLb3dPGm6qExdeVOzCnU2+YCq9jxPD0rszDjjypXcnTU5p
	Eyq+Gv5jySTbWN1wG8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMw-00000001Jr5-1W00;
	Mon, 10 Feb 2025 20:27:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMt-00000001Jmq-3yYF
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f3c119fe6so107239905ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219219; x=1739824019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=3B6EnMTtdQI+PCHJqqbCnAMv5N++/8Mz9heC5HqeMA+F26Z+8ow64eDqFTnuLRaq28
         ggXK10sfLPgWBiQFFxDN8RUqf6op8Es/ArlV7Mgx4DhgArnUl3GHdK5Jef9vmA+BH4S6
         hclXXA2SvYTA2mS/+xcvmvm069q7DYb2Xpl/Pi3YgHVSp3tqWHx+H5apDRKpYnDPEgpA
         4/09Y4EsrJl1M2jbm42fFvZXzl3/uGYW+8WxrbrjURkYdgAnoLMCUqfZQrk2FwuAZJsP
         cWvUIJymiBsPwJ603Sn4By5xjU9wH3UQdInBg+KvlqaomK18da35rCFsayoS3HeiJrwQ
         CrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219219; x=1739824019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=JRta7FxU2c3FdlGiZyxSjEuDS5DzYZm9wHzaz4iaeItkD1W0P4y9ysxGzSHZa2Xq1y
         2wIykp+FIG7n1nhX2TcY+cWAOh06vCxKRkZEADb3aKqA0hum1AeRyX1fkEV3gU2Qma75
         bk/5iYL0q0GBGPjQCqXopwfUa/vkQnkSo8OxDD9ApUxPKJtnkqjAgiUqYhqURxcLAiBd
         +QjQvoTy7Mx72d6Xda704ffWvubpnL1KEfyiGGeW6engue8o1BltH7YNqAK9vMl9CpHz
         gvQA5xgMFi/Zvdqey6d/fSU9GMOVFl7goUq1f1uGCrf69Ci+P+eHhLKmTO1NQzI0Hebk
         35Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWANSdNPGF/P0bTU6CQ8+ORzuzsOOJ/UbRJDchCVSp1G7oLuiM1lxmHFoiNbuXglVC86z0j/ej1WUuOZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdW/9zfpy0tOk2rr9Z6/eaGTrd/uSvIG6ahJ/ynLMXw/XvlRq+
	J1osPuXGwrdmWCnyB7R+lGdw6DM9FTTLKG1mE7kRwVjQps3iOff26cQCxC56DME=
X-Gm-Gg: ASbGncv0+rSQkuyhFzJPVvXymPlr1iLGYqyrkNh630TkvVkWSTyt2z+Cg2RqPB5+udC
	bWkmCzbP9IZMPOmEpHUHbvHq+eaVhoHmGq/CMZo1iGEp1bxT3iVJ/+0Fulj9CAtOYtSgRHs+qoJ
	T9Kup8p8gbikdUc+HkKlGUVwzcqlSkDqCtf9mFW5Q5gCpPZufAs8EIHwnrDvAzJcGGbp+rGDkLs
	XLMzJ6CEkesk+CUEmI54BpOMPiJ9QI/Nud/60NqRElxoqofzfUZUTyX59welpDAzxVC6rrsmFND
	pNjhYaLtf99LmTXb/gedeIHBBQ==
X-Google-Smtp-Source: AGHT+IED7zcqCk6xnlgZyjRhcEK3K99n9HG3VnjktIjXL97/vl92I1hppw2VD80KTsXjIvmfBlGjpA==
X-Received: by 2002:a17:903:284:b0:216:7ee9:21ff with SMTP id d9443c01a7336-21f4e763a67mr241716765ad.49.1739219219434;
        Mon, 10 Feb 2025 12:26:59 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:59 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:40 -0800
Subject: [PATCH v10 07/27] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-7-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_122700_000288_6934B940 
X-CRM114-Status: GOOD (  10.31  )
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8c528cd7347a..ede43185ffdf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
