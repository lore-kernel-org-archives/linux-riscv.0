Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75991C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7bp2fD8PaPoKWc7nWAysh5w38BLHIJC9CZQab2ocnE=; b=dy6AxGESwymTGy
	j2X+OLnOaD+sdelfVFw8ZJmsafuVSFMmdwmls3APAp6UGXhuX7/1i+jaV6g0/95w4cdp4Y2EhtEFw
	TcWUKLdIZ1gI7tvV6RziZ5gVQ7aG5V0K0A89dtGtvoAvPKEv6ChJKvcykI6ANNvxAvmjJGnhGRPqv
	EsIeNfmdcdoMqoxOB9vKsEMiImiBkfXNOyf5Cmq3nOjP128+GECVRGPMqw4oomTybocmjNSmB/zBG
	UXBxhw4awiz+IfQSBhLaV/fx4P64c9Tyj7TJWc08n1dn/OnbtqwG7ArS4nFVQgx+sG1xYFDyEfVHO
	MnmyGIhCnIrtgWgNwWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8Xe-00000004tmh-3VoE;
	Thu, 22 Feb 2024 12:51:10 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8Xb-00000004tl3-2Vt0
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 12:51:09 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5d862e8b163so2393912a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 04:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708606266; x=1709211066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuwAWrKDu1e5t4umhFsz7T/5diX1pTYK82qJWje4hkM=;
        b=OrkgjXaQHu6bbDcQtGmtr2OVy2v4zrJVeVAcRlbjKD2UamC//LRCTjN5Ubc0KOYk8v
         CNEMw1ioo3VyrCGyyAvkx+Hhv69oFCmvCLiGbdJFNWRTLloxPflO/LLzIuu2yG2FqZC1
         0p1Nee1MQk7FWt58JReWHHGnWX3Vv/5qnJNLJMDzLu0Zp2iPybV5qtpNnoLAB+nNmLOM
         5E7E62M/mv+RtrvVQhEoCZu476lYllNOFDBaisSVu62WsGIftfjGmnwayC4ryaXxEpwP
         EkiPVcphla8MPczx+fOw6OlqE8JtaNGoqbBjveigHeIqQUyRtfC66n/8Fa+09wXm4yRM
         Lmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606266; x=1709211066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuwAWrKDu1e5t4umhFsz7T/5diX1pTYK82qJWje4hkM=;
        b=Ui2FNcz8CojnhQk3NYw7ZooktHPW/KHAieknCp7H5ihCG7t6lGDZi4k9VyNZ2Fnrmh
         S6IzfikcyDp0etQkpeP19FaPLeITFDAGT5WfZ+u5pNPiGdpMWbowvy9duQOafjbm01rK
         Qyui2OCnhK2UrERuJHwkH4upXmJwxIc+TvWrqsG3dAlc6qT4kKD8o8oEl6N+8gG9c/ut
         ArnKnAGugmFLKqHtenk5a1whzqK2nceyfPnWRBfuTaGuQtqv7Klgn6EKWW9GTWcT0LqH
         CJmw+Yz8m/Cu7hZm9W2OF5IKzrKqbQG5sgYFxv+FybpUXjGsPRi6b2EaTa1cZJkxv4FS
         Igrw==
X-Gm-Message-State: AOJu0Yy6etrs4Tl69jvN/EW8iybEBUt0W25+UOnetdCAzAuG7oNUYFIz
	bqiwBSTRdF/byMyIYId4/iZAac5l0sV8USa/etxsDJyVufnISv0tqxPL2HNEWCxX24iSk3jrfqh
	y
X-Google-Smtp-Source: AGHT+IGDnbx1AQNKvK0en3U+xfkxPHfdBufxMOu9UAiAIpFlxTxmhpHnLsLyVE1XX0tuJpWd7vKq9w==
X-Received: by 2002:a17:902:ed05:b0:1dc:51ac:88ef with SMTP id b5-20020a170902ed0500b001dc51ac88efmr1056056pld.6.1708606265710;
        Thu, 22 Feb 2024 04:51:05 -0800 (PST)
Received: from aryabhatta.. ([49.37.248.155])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902e90500b001db7599aba0sm9898438pld.24.2024.02.22.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 04:51:05 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 1/2] riscv: Add SBI debug trigger extension and function ids
Date: Thu, 22 Feb 2024 18:20:58 +0530
Message-Id: <20240222125059.13331-2-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222125059.13331-1-hchauhan@ventanamicro.com>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_045107_664296_21BAF5E9 
X-CRM114-Status: GOOD (  10.74  )
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

Debug trigger extension is a proposed SBI extension to support
native debugging in S-mode and VS-mode.

The proposal for the extension can be found at:
https://lists.riscv.org/g/sig-hypervisors/message/361

This patch adds the extension and the function IDs defined
by the extension.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6e68f8dff76b..e79ff1a2f387 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -34,6 +34,9 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 
+	/* SBI Debug Trigger Extension */
+	SBI_EXT_DBTR = 0x44425452,
+
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
 	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
@@ -124,6 +127,34 @@ enum sbi_ext_susp_sleep_type {
 	SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM = 0,
 };
 
+/* SBI debug triggers function IDs */
+enum sbi_ext_dbtr_fid {
+	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
+	SBI_EXT_DBTR_SETUP_SHMEM,
+	SBI_EXT_DBTR_TRIG_READ,
+	SBI_EXT_DBTR_TRIG_INSTALL,
+	SBI_EXT_DBTR_TRIG_UPDATE,
+	SBI_EXT_DBTR_TRIG_UNINSTALL,
+	SBI_EXT_DBTR_TRIG_ENABLE,
+	SBI_EXT_DBTR_TRIG_DISABLE,
+};
+
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+};
+
+struct sbi_dbtr_shmem_entry {
+        struct sbi_dbtr_data_msg data;
+        struct sbi_dbtr_id_msg id;
+};
+
 enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_NUM_COUNTERS = 0,
 	SBI_EXT_PMU_COUNTER_GET_INFO,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
