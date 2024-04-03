Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2266DCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkKbD7uyguiv9Udh71kQeAal9UeZETM6mm7YQYhCjy0=; b=bHgK+Mo3k6aE6v
	XSA8PUKYcDvlRbq7HQ3hZyR/dqBYbv3ySYv5W40mp1kgC5s9CjR9tIJRRTsWVAzY2rsPU6PL8EWfw
	FdfQ2xq/tEvTrBzOD3UKKUccZvudMLrYQ7bBFnkkp5gBn+n+FEs9KMNTx7M1shRFldf78/C+aPo4H
	Ae3RAxfJXVQrqpB6LTlHavCSYKS3eQHs+QGplFeY+8/niHM0aTv7Yvza8TMFHDOkfYKfzzJVe0nlx
	TPy0utlaovaEbmsSG4/m/MHlSsbJDAUG5Krrc8doUfIJxdxvBliGKE70FzmzjhobTJeI2vj1NGDOU
	MzTyNBGJInMvU8SwXs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFN-00000000a4D-3d7d;
	Wed, 03 Apr 2024 23:42:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEx-00000000Zdv-3X7n
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e28856ed7aso2974555ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187719; x=1712792519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1ajd+NFF25bzcoUpj6TOVq3gYUXEAPUF2iej3ctG8E=;
        b=r+DT8/ZoOTcXlEFmWn7ZeTIccuPs+76VQ+FGSvl5KB0k1wNYePoFKFn5xzgxN5igBb
         nqWfE5izs3fc+kZWTGzhFNHXi+RO/ynrROkXgBsm2frIGL9CjThxo/ISKARc98kKNHQJ
         LPbhFRMpuKNR2S1JpTuEqUIvJmp40kwIbMKOqfE8JWybCeFrxXWq57GQtcXBIHic8Trh
         aNcYS3PMSFWuaGfB1/2Yo8HdQAVtc0zfyABLbSbZqE7/QbmmO0CoXWwO31pxV6r12Kea
         3qx86t5QZrPGM21UC4QVL9r/wswFiEL8BgtA02AtbauFOpkAMk2z9hoihMpblhoAysYl
         ioQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187719; x=1712792519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1ajd+NFF25bzcoUpj6TOVq3gYUXEAPUF2iej3ctG8E=;
        b=J/t9JB5mnherJU35ZuuNZPLvUapnUilf+MUIDxmUvjSPwL0ibTy5w18kCxMkTqgp1Z
         u+M4BR6CmEmpJNzNbkEaA78yt6rD6c8ZyMX/FHw8jceXWp8toFoPRBUrVUzMZ1xlGMzT
         Xv2gpeZ7AkKG4lz07Zib7uaECM8IQiA8SpqeC4+vo6bfrln44GRFXDNZsL9wd9P5Aa9d
         P1ibcIDqoz1E0AAVeeAOgi+yPLqBgcvB+ZrV5oYBzpGsPz1Q1cUkXAQtxrdW4rwmtwAk
         OWyQYGYYzfz5bHGSy2Ew8ODXcCz4jE3WWaCbHVuAsDJdXtHAQ/u9YT9OiwHtTQOZ7FB2
         SqBA==
X-Forwarded-Encrypted: i=1; AJvYcCVs+YST3pNxyEDfFTNez0088GONe39WMx1a7MSkgF0HyThxXh6NGmcz6HRPpEjX2nRbtpAhNKdxfBJnLTzuX+53b/3ghFB6AQ4vX2/Y2HGr
X-Gm-Message-State: AOJu0YzPych9rlsVX6n5EGyYSCssmLfujjalSAz2rBfWbzIUG6ZvYDHK
	AP8+6vsz+eUbST9D+6xIc0HOfXZilv79mkBYOdAn06scanxBL3iB06sY24MgAsc=
X-Google-Smtp-Source: AGHT+IGh4iyC/GhUryA4pkxFBs7yNJ36fG0Y8vGsIbyj+jFCsDK2F7CISUUTPnXh7UOmjs+99OfNvA==
X-Received: by 2002:a17:902:f105:b0:1e2:718c:61e with SMTP id e5-20020a170902f10500b001e2718c061emr712135plb.27.1712187719240;
        Wed, 03 Apr 2024 16:41:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 11/29] riscv mm: manufacture shadow stack pte
Date: Wed,  3 Apr 2024 16:34:59 -0700
Message-ID: <20240403234054.2020347-12-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164200_082634_553329B5 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4d5983bc6766..6362407f1e83 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -408,6 +408,12 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -693,6 +699,12 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
