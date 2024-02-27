Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8F2C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txHyWYXRrOhea7nuAf4PXrsuz2slNTSf3dfsHohqMK8=; b=Ybih5BapkJ7KjW
	8xpYSQBdBLGK2IvP3e8PMlwunKJtCVSNlCfCx1E/d4C8uco3+T+HgZrJid4GNJK70tEAYOfwrB5ws
	F3d11D1Sko3Ebh4yfjR5vcEOn7PbKMLB5kjzlVDi20YJQlh870GR5pDaJOONV8t7LZB4F7dak368J
	RakLy4JQBsC1JFfBjsyOL+i8uWymqNTVCKu5V+DMXvcT5dyw3F66v9iNAm+pHY4Uo0Eb+NRpRPKMS
	bF1JxLQ4ag+XftqyDQ2XGaqmCqL5JNmWoAMDzAX77zKbSBog5eEeTMwaBp1OD0Ar3xP0dHATh3WsW
	CZieX0iGLwHl493fRE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4R7-00000006o5j-2OJw;
	Tue, 27 Feb 2024 20:52:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4R4-00000006o4S-3zl7
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 20:52:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33d28468666so4111203f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 12:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709067141; x=1709671941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzfPm4MGmy+twyI4zc1gm3KO2QTVwDkS4GmOlB/j8Xc=;
        b=Iot2jI8zVhvf4nQ/9mpS1XFlqxzdJ9QHuciUE2addnuV2IeBs0MS5Vnqm73uvLbgl2
         hdtZpxFmkEL3M20obxyQ57tVYS2vafw7x72YemK/p3OG/rPaeWmLEkoCPVdlhugGDeob
         41kOmn2JUGnj88/eGK/e6cVEhLPf0YKY+y/SAvuJArx6wI0s0e1n2MbKkqpSQ8AEjRRw
         FiHbFTNxwY4OMnsN4DWQSYkC+PsRWoCf7hSRLsVL74ZivsqVtbMcNB7Fbl9cHyBmUQD1
         nGkOd13iJAMiI01G4Pj6tmZGBF2yijC7BbN+Az9H0G/HJmi+KE4ECwbKw5uNNtVcS7gv
         AdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709067141; x=1709671941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzfPm4MGmy+twyI4zc1gm3KO2QTVwDkS4GmOlB/j8Xc=;
        b=J8omuFQ4zQF9u5j4WlWd8whWjwffq0h6VWUF8CMMZYTBH7FKKDTJrObseWx1l2iA8v
         QYnoUeGU6C5M/kspi2RV3+xop2nKKc4lW22MlFfmjxjnVB9zu1TKlEJ9d28Y5hWIIvGu
         ensQIWcUFa8seVx23FIBD730UQfqVpy/uhw59MFwYqMgKzCGVf/J+wskLk8BdXr2XHpH
         7sYzLCUn0X6LVbJx8AA57685ojpi/AQrK0HCfZlB4ap54Vb/u9sEyOyXsVCSgpAncJy1
         wqw+rKHYp0ufIMpMtcG96zyVwJSXLuG2GCel0K8rHiUH0tMoPWuOK/BfwGpAaUyZ9wR+
         ETZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCPzE2/v5aDo+ghSu6YAdnAw7uea5SjhYj4V15H0ty8lPK1ez5TcKeJz8peOAPXGdfg1opMI78wnE/QEXWbnQWH9InHw8rUEQO+3b6yFC2
X-Gm-Message-State: AOJu0Yzab/4slqjmpj7bvdD5DbmNGL+Ciy0Fgdk+YStloPS7qBN9MGnT
	SvDkfOwzVZCOx9zifORd5VMKwA3zEHVPuHbB7uj8lJldwaZrjNiaG/YXMRuTi28=
X-Google-Smtp-Source: AGHT+IFncYLlF2rT6hN0L/p/TQJ5LNx4aKQQWd8sjTrt7kQ6BYHBKX2Y0keQQEflI2wLg+Jl/BzNrA==
X-Received: by 2002:adf:f08d:0:b0:33d:1eea:4346 with SMTP id n13-20020adff08d000000b0033d1eea4346mr7362784wro.37.1709067141078;
        Tue, 27 Feb 2024 12:52:21 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id bw1-20020a0560001f8100b0033af3a43e91sm12539544wrb.46.2024.02.27.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 12:52:20 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 2/2] riscv: Fix pte_leaf_size() for NAPOT
Date: Tue, 27 Feb 2024 21:50:16 +0100
Message-Id: <20240227205016.121901-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227205016.121901-1-alexghiti@rivosinc.com>
References: <20240227205016.121901-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_125223_018471_92646D30 
X-CRM114-Status: UNSURE (   9.11  )
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

pte_leaf_size() must be reimplemented to add support for NAPOT mappings.

Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..89f5f1bd6e46 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -439,6 +439,10 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#define pte_leaf_size(pte)	(pte_napot(pte) ?				\
+					napot_cont_size(napot_cont_order(pte)) :\
+					PAGE_SIZE)
+
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * See the comment in include/asm-generic/pgtable.h
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
