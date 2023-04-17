Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C192DC77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mje7CUT8vJv2BjfIzs+uhoCJ63rRYZCbaNV85J5y0fw=; b=3N5rhJYs4ZKfhX
	+70vqGwGuet9krz4MYLWMmhaxrrhFW/A2GGAN0hfDp56KPMgfEw6RiVtEbqSMdwyDVwikEaysgu2Y
	irVTKLMbxLCqKHsehMSj42eRWAsDJ85+XT0u9b1/1ukPFL7fUD1t15YdpPEkvDNNSus60PUKPJgeD
	M0JPHevL4t9D2FYwQrD41KhcAfSMpz9K36pX6/LWvazNcjMsQMCxNKX+Cf8IKbzJKExHgGueq5TLf
	RFQEPoMxv4Svvqywg0hVmSjMfPRHv1EC5aeFcWLtGFhSTNmL4PZSaBd6jX9ciwXcj70zJzaGWY+Ov
	ezB3tA+xMCNeW0fnuSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBh-00Fkp2-0D;
	Mon, 17 Apr 2023 10:34:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBZ-00FkhU-1z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:17 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-504eac2f0b2so4536700a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727652; x=1684319652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc+gzPz7d3OgysNEaF2tqRu5pz5HUBdz+KJkxVP4YTc=;
        b=Bq2UMDrpx1NHajQq/PDfZO0xZn0fq+4G7dETLNW6QFXS9pq5oYuEXG3YHHIKP/hM2I
         yKDRJo3mtrBrZn08HccWMkvzLzuWqztw4qXtoze/V0kbFr0D5Q+wg0KOCJkSPUH01RN5
         3p2juZOu6jsZ5afCJ8xtt8DmNii0rlH0LoJPPCsD7e85v/E9DGQyMYf1gBndLrrRd1MD
         5pQXT2kg1X4NNmNwvY0pfXXcuOFh8KR7UKSkrLZICqbqqwKLb6prHXfd6EteajwI+XOK
         ZFSVkpDFaykYR2G2m5pnL0BEuTKgWRbwHvZIj6YD2eu0MFA7SwU7nQLAKZSGd9AYWOtX
         OdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727652; x=1684319652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc+gzPz7d3OgysNEaF2tqRu5pz5HUBdz+KJkxVP4YTc=;
        b=JeDbDhNjAAJPK2vykkWo5g+5QaKIfsj+bNW+6M6lW/p8WNMXwIjRI+2FTreOryGCc3
         /NBqKnkVcsBfqi2mW08Czqux+/yHwP3QZqc8Aii3Nm2FtXH+JOLQ0KfP64aU7NZ34RpI
         G85kdp6AtbS5QXAaNMi489feePVrLGuX+9IShdCNOh3omAcyRbkMhURdpSQDLAAFLQ03
         a0YC2BxVJAtLJ3Nf4SBYve5R4szeQ750WU3Dcfs4vmjudBzMTTpEWFVJ5muspp/bXE8X
         CVYAzdpjC9mnKsBCGHaGjN1ltNfz24nHNHPhspIwt6xdjUXGyghj9XstqIHdqXwQ4E0L
         sUdA==
X-Gm-Message-State: AAQBX9eBH2NE1eYpJG3wl2OO6Y1oXeGHYj8WBmjMErbR1mnOlcPJuuIj
	QageKH8qk6DScJxBmkLr9FZPWg==
X-Google-Smtp-Source: AKy350ZOLJ17sudnmshnx4tDR/+j7QQ4eBKvsM6on76waoml6SRjFZnbAeUpOABwachFHa1BQYBaTQ==
X-Received: by 2002:aa7:c512:0:b0:4fc:709f:7abd with SMTP id o18-20020aa7c512000000b004fc709f7abdmr13725960edq.2.1681727651626;
        Mon, 17 Apr 2023 03:34:11 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s11-20020a056402164b00b00504adfd77f6sm5589213edx.29.2023.04.17.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:11 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Date: Mon, 17 Apr 2023 12:33:50 +0200
Message-Id: <20230417103402.798596-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033413_677681_126CC66A 
X-CRM114-Status: UNSURE (   7.84  )
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

The SBI STA extension enables steal-time accounting. Add the
definitions it specifies.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 945b7be249c1..485b9ec20399 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -30,6 +30,7 @@ enum sbi_ext_id {
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
+	SBI_EXT_STA = 0x535441,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+/* SBI STA (steal-time accounting) extension */
+enum sbi_ext_sta_fid {
+	SBI_EXT_STA_SET_STEAL_TIME_SHMEM = 0,
+};
+
+struct sbi_sta_struct {
+	__le32 sequence;
+	__le32 flags;
+	__le64 steal;
+	u8 preempted;
+	u8 pad[47];
+} __packed;
+
+/* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
