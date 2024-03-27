Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F28C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRWPmaCGzLrophTCHtPVgIMtEVxrsdFS2c0cJRS2A2k=; b=FzNd7EODd75X4f
	5f6szG0Dwfr/HcY7kpl5Xam1ktqr4KcR7U/opsqCcm5Z+4nv6+0xTkn2pLTh0ymX9CCf6s8nlAQj/
	0+u/2FdwamR5Ep07z0BQl012ioDBToQ9Wh2oBY4G0OoU+EYz3FRHLYUrJpHRyIMwk9SrnjOO88TOv
	D9cVheO9Tx4gEePqHzVLg+fenrRRvuLzujblEmkeNDHcPVIg3hg2QSmbul1+EEXF/uut4D4Wt9+4r
	bZns/R6f3YL3U/7CBzePhq0xhfnLKcIXNtV/H0qB1SOeFzkxdCkjA8FpjW0FuUIqcENS0fnpJ0Od6
	vOdJl6izL/he4796vW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVma-00000009zFb-0uNE;
	Wed, 27 Mar 2024 16:05:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmR-00000009zAy-2DK5
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 16:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+4M9Lk9Z8nU8etdW0Vehxd3ZiXzPs65Q9tqt+MZAHIQ=; b=HDsrVq3Axo+rFzXr2XQ43rvZ2i
	0DVMUyf+vbNDrksXuXGM+OOdf25mwPfM1eFQV1xbKCSAUuwuv20cgHGFVINASLZ7hmOvqtzT8VpGC
	wI6nw9HtagGy3YkZY+JLFFrpA/sd0Q9RqLnh3/FuKZLTOqz6haWH1cw0DCMISLqLSbuawkYJn2bvd
	F5UlOmvFpndxLoqs9fz2IxgLTvErY96e2FmNBkSa3D4B6tu45qwH9vredfOgsXaHsn05tOHz1eLxv
	yV18WN242CGZRrejm+YPh4TgdK02VpxyQwZqk54uSSXQtl+pU813z92UIFmt4lCOiDesANU5w/Qg9
	59EAnA6Q==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmM-00000000MSu-1rj6
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e0bec01232so29133085ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555527; x=1712160327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4M9Lk9Z8nU8etdW0Vehxd3ZiXzPs65Q9tqt+MZAHIQ=;
        b=dg1RIsKuUm3RjDbfK05UgVHiRazUyBESUTazTEmNWbihuvBnnRE1ycBdZ7Ke/5DIae
         7ef5Uqi/oJpcnJJnmRMsX176DqgHjeMou24WQ4XU/+d1RKus6adOje9G6qbqIO4jyWtC
         RLukmr8l8huWE88ZoFMXmdiPwNPvmSyL5T24etJJJ17SGdjfyvG0tb4MB0WbbsfGesDb
         PS5xgbEGkA3BG8rIBedJQmfpfGA+9dJvhkdsHITChMSEkUswI34j5zhy2l8TMX2GeV+8
         zRzxt8Y6CoSnQ3HXfoMT7CxkGFLnfEliGcJKTJNttOENZgE2RTY1Ixj1glBuZ+0SkVxs
         NuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555527; x=1712160327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4M9Lk9Z8nU8etdW0Vehxd3ZiXzPs65Q9tqt+MZAHIQ=;
        b=EIdgAcgLNmohQuLsNAd6aKIEDl5wLN0fuZsWB9Sr5xxaLcJor3S6pfHmTN3Nl7ICn5
         69ibbly0p4iMHpnkUF0lm54MtM82JSVIhzl0mQANRmCyn9I0sriZcn/iE3VIxaynYyVU
         9rPPK8y8aSdOE9P/dEf1iSO20qFK2NfGhzjWfI9d1t+AOyVolXafYBXnQrrBsWq9h8kS
         LVSmf00c7k7RMSL/Af33+e4yWDg5EP/mBJNi3Su+5/veHoDkzQYrFZbrvHghCx/MpPqD
         lPKH8LlsN9lKAL1BmEd8xFv5UNnukCGFHNGNozl54gMzJTsae/5+eal3KvurCcV9yeg7
         A5cg==
X-Forwarded-Encrypted: i=1; AJvYcCUua9egKPMqb4Iy+s1+0oU8kPflA2AglkzgdtGanuw0ocl5SOusrKHr/JWEzdDM/Y0LdkiDyIOYdBE4Io59eeNPU39caeuwayZ1GrDKyx+a
X-Gm-Message-State: AOJu0YyjC6V6snrIo7O+otM+wSmbI5sYSsmat5ji9wipm3dyzQTxVyt5
	90geFVed8Dfn4eh2L7b4R+uyVt60SVWG+aqhpmHEi1Slf26LANWD3b+h2qNSb4U=
X-Google-Smtp-Source: AGHT+IHmU9bA6AvbKxQ+lqld0GtL9R2sxBrS7FKO5825OmmPZqHfmYm+9jb41eb0MCY+vR/dQnQAlw==
X-Received: by 2002:a17:902:e541:b0:1e0:9122:abc4 with SMTP id n1-20020a170902e54100b001e09122abc4mr169570plf.21.1711555527635;
        Wed, 27 Mar 2024 09:05:27 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 4/7] riscv: Simplify text patching loops
Date: Wed, 27 Mar 2024 09:04:43 -0700
Message-ID: <20240327160520.791322-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_160530_654067_35D336CC 
X-CRM114-Status: GOOD (  12.01  )
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

This reduces the number of variables and makes the code easier to parse.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Further simplify patch_insn_set()/patch_insn_write() loop conditions
 - Use min() instead of min_t() since both sides are unsigned long

 arch/riscv/kernel/patch.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 9a1bce1adf5a..0d1700d1934c 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -155,22 +155,24 @@ NOKPROBE_SYMBOL(__patch_insn_write);
 
 static int patch_insn_set(void *addr, u8 c, size_t len)
 {
-	size_t patched = 0;
 	size_t size;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * __patch_insn_set() can only work on 2 pages at a time so call it in a
 	 * loop with len <= 2 * PAGE_SIZE.
 	 */
-	while (patched < len && !ret) {
-		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched), len - patched);
-		ret = __patch_insn_set(addr + patched, c, size);
-
-		patched += size;
+	while (len) {
+		size = min(len, PAGE_SIZE * 2 - offset_in_page(addr));
+		ret = __patch_insn_set(addr, c, size);
+		if (ret)
+			return ret;
+
+		addr += size;
+		len -= size;
 	}
 
-	return ret;
+	return 0;
 }
 NOKPROBE_SYMBOL(patch_insn_set);
 
@@ -190,22 +192,25 @@ NOKPROBE_SYMBOL(patch_text_set_nosync);
 
 int patch_insn_write(void *addr, const void *insn, size_t len)
 {
-	size_t patched = 0;
 	size_t size;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * Copy the instructions to the destination address, two pages at a time
 	 * because __patch_insn_write() can only handle len <= 2 * PAGE_SIZE.
 	 */
-	while (patched < len && !ret) {
-		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched), len - patched);
-		ret = __patch_insn_write(addr + patched, insn + patched, size);
-
-		patched += size;
+	while (len) {
+		size = min(len, PAGE_SIZE * 2 - offset_in_page(addr));
+		ret = __patch_insn_write(addr, insn, size);
+		if (ret)
+			return ret;
+
+		addr += size;
+		insn += size;
+		len -= size;
 	}
 
-	return ret;
+	return 0;
 }
 NOKPROBE_SYMBOL(patch_insn_write);
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
