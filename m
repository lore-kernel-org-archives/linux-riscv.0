Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A34EEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uARpp434/WoVrXyZdwYBjfQnL7UGJiwIYyBEh+M+Uyw=; b=R4I0XKTNt432Am
	KE+Y++hkqhkkfMui7X9nEbj4xV1+wh4BtixNIqwEH5QVryJJwpI8vlviXRUDEkTc3vU7daAkSpPkZ
	TJIkEmqFFHri8mnrts/nzeiQQ3KkzMysobq63w1KmYnK5M9QsIrpv/ehlU0fMW1pdm+DTJwtOFJoZ
	+7nl9QP2Usu7d7zmEw+CKcB4jUs9b2/gy+OMuTWWSKdjcuIx1iespRIug0Ejz0pK9lJBB96kcWPLT
	q/c3bznyAmQzhKKIBwZV8MZe2ARtn/ReYh2Ptc4nxT/QQJ+NxUmbCwdBw9CZH2YmaVAxKjTIGUdyj
	GS5C94CiJljN/3lzU/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot6m-0000000ETUC-1fob;
	Thu, 12 Sep 2024 23:20:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot6k-0000000ETS6-0dBa
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KiNSEhiMyi/vclkP3i3QvX4mx663SI7U/pxriPsJ9Y4=; b=Lh6TTUrAGLFhaPpeTCCa+g3FTa
	LINfTN93HLpq1K7ENbsAaI/1WMaNVNhFGQxeOtlqsaI8vaBE39FeL1sKKSd+aZ9rRR3P6Wa12/yQg
	CgPXMojo45JKS6AXJ32nLs7R7h269NE8yELNYL2don7dtBM9P1uzOEinayf6NNmuzHkX/2ZvSunme
	zxHzb+WVFPBhDbeN4Sv7YpYDXGovrU2nz81CDpmeMheHQn4SpzyvWoEDO08M+3aU+Lil+v2hQtQ7C
	igUkwrkDvsj/319daVxNco4qeTmr1/kY6tvocBMvL5OmDNkjilkGlf+T1JcGRNXQfdT+ucm5TXtRe
	kMcZ9MWA==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot4h-00000000Y89-1uTw
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:20:12 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7c3e1081804so954472a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183078; x=1726787878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiNSEhiMyi/vclkP3i3QvX4mx663SI7U/pxriPsJ9Y4=;
        b=Pw/rgR7/StvVZywWiPiN9DHRQ968Ixg1bPmOot+urx41f3bXSlUy30q6lcN/JFXX7g
         9p5lg4CF0c/r64FD7MzRuU8Ra1C1j0QY29Bh7bfabnJH2Ri1mpSw7veGkmveEqe6btjy
         K4R8xK5RZUUqSdnf+ZyezudrMVyL9LX6Wt+1dPjjSWFuIa/hhljdysaGzm2iMMaQJPwg
         TWIEJUB4toWEQRMRth3U6qeEag7LC072MbmJRjN8cbYrA27/dOkaighl9cUJFR3BLi1C
         TFaBtABxE8c+2rUxT1jL8+riAk1K1zvS4xowrV7tqGiZZNzwt3u1qAp/im2J+LIvDho2
         2ccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183078; x=1726787878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiNSEhiMyi/vclkP3i3QvX4mx663SI7U/pxriPsJ9Y4=;
        b=WXCfGC5ZxwOdyX2uKx5o75DYzO9BUON8LhulmBb3RPn0kVxYPGGZ9UitrjfgV7dxAM
         lK/GNopsDuP1+cNwTzHfsZ2swo4mdO/5NVGjHXymk1KYCGPo5sMAumZu0vI8KMonXLgs
         n3k8/FpD7R0F3Cy5860vR1HN4FyoLeQI5rKzQ0VNvHkLH11QbTQHdcDhy7GTgp10DBfH
         IPs2yavEr6Qylbrn8w+a8F0JjvYLMlsWTAQWbs/bqFK3lnqtLtoZwJ1cbFhGNaVJSJxN
         sYcbh8yH1CWgABfNeqHft/CX5YI6RZu67l8Xao1WcFi98wzAHbUHBDlSCJfZNYPMMhxf
         N4aA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ovXmSB8mtbevDEIKAUKTcOIOYPriNq1qotdnvmnVPBXI3fW8Uf9XlcQsLk0PVUjQwlKAiMywMBIYew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMteTM9tTK15uwKdOxmMGJWRZzRJrdlblOqgt9cDEJf2mOvEL/
	Dbzrmb9QwJv49jlATpUL89CsuFbQZoDaNIrw5O0KH6JtepwWEH0cWYMsvOEmPUs=
X-Google-Smtp-Source: AGHT+IF4e0NCjicspxUUMmlG4elk65ZCg5cB6xw18ixrBvYAVw02n2WNOur1Dg21kRqmRwms2SEZcA==
X-Received: by 2002:a17:90a:fd04:b0:2c9:a3d4:f044 with SMTP id 98e67ed59e1d1-2db9ffbcbd4mr5139066a91.11.1726183078465;
        Thu, 12 Sep 2024 16:17:58 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 12/30] riscv mm: manufacture shadow stack pte
Date: Thu, 12 Sep 2024 16:16:31 -0700
Message-ID: <20240912231650.3740732-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001812_629116_0AE0F156 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
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
index af4337774fe5..0b6c66fb853a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -732,6 +737,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
