Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0945C46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2b/9Yav3EQ8K0UUs3czdIYaKlRndFl10wbqCTEjM4X4=; b=dGIkjS8nzIZYlt
	7ZvXt6+FOLscJqKrErBmhTMWJWl9O37picIu1gvbA76Oo5jZwIMMWHF7nvOSq+0j/HivSs/4TgD0Y
	aLySXoOx9dSlPlZ2QbcUyu1byX+1LyuSv7OyGpPOmj4c24r69cuflCTBMop111++cO8AI/+tKFudu
	g94ab4iPeQv6tZ4HtPVXGmPqQSRNnTtbTR5njQCGlX4GMa6vJQRYKDGEhqwy9NRRE1O52dgOR3r27
	v+TuPrBtxvbBWVJXE9GmFSe2fkrlybCmmvOHBi0ZAyDmMPAMTMqPYx8ELkup2ucKvIzX/ylcTAFuh
	F3uaao9nhLJbJxAVP3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzw-000M4C-2E;
	Wed, 20 Dec 2023 16:00:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzg-000LmE-1F
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3363aa2bbfbso6276781f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088020; x=1703692820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsqMVAX9+HvHM4O5cP+0LJ3eZPLQeiGLpoG96t1YCys=;
        b=CbmiRUrlACdELKI9D6FR3/8u8AtNZgPi1R5MGQczJZyFbYVgcTlgLuSjHCaIF7IUa9
         hkw8wXPX7YH+nVlfYsEDnCw7sCP25JKIQ9k5yDlqz3dp+qWR/xU+9E0khwg0mtp0E6OW
         x+h3GHsdMf6XxJ6ZtEn8y+Q8gBWg0cYPYdBpun8A3X7M43AaOsl/b4m+eJ50JRGcJyaU
         CcZAdZGIfYEV8yBv/7XEs/EIdeXQ0jNq06Nr0T6adZMrQqZ7ci0OwGjX/g8ow7BY6Y3P
         dhO7RPEXdBayl8GrqbZy5FuG6Sp44oAL7su/obmPpX9rspmcm4VwX3wVFm/Rhi9e8FnH
         r+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088020; x=1703692820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsqMVAX9+HvHM4O5cP+0LJ3eZPLQeiGLpoG96t1YCys=;
        b=wO39KVgBkK1e+WIU9QwLb7Dekm+V00ouxM4RdhRcrT97pYHn5xelsDArFKTtTMOaE8
         XOqDr5Td+F2CHhn0z4Nu2T3ETXmzng13Tfi73/VqIIP7qbqLZOf3Xxs1mHeY8jg+jH44
         YGUUL0YyFspK7JlU/tNX0eIJGDDjQtZEuxgLj8rnp9CU4NC6iWyIunKlaFwZUeot/Tf+
         Ul/G3Jy6MxnDDkWYRu4WiRfTvEJzJLtBLBKB8+bbKsDFV1c96bsvH1OK6cTW/nSoIo8q
         KooB9FuoP9Zi1kpV9yuj28dwNyyrph4OBYgOkms0+bPcHnP/X3rCe+mKf0k2KSaJd4gO
         R6+g==
X-Gm-Message-State: AOJu0Yw9TkSu2/MNEwIo5zJngd5rA2Ce/bs2PSq1BLU0PsQNuuvOU5rg
	oHo7LjX6O5QvRzrh8pxnvq6eXQ==
X-Google-Smtp-Source: AGHT+IGvi//DvXAg1xDIrKAJaGuMCehkfokcMb0T9IgvWVneX0+gPJn+9LH1j0ttz6W8NArfksk+Iw==
X-Received: by 2002:adf:e412:0:b0:336:7a8d:bf6b with SMTP id g18-20020adfe412000000b003367a8dbf6bmr757905wrm.58.1703088020563;
        Wed, 20 Dec 2023 08:00:20 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4009000000b0033677a4e0d6sm2893440wrp.13.2023.12.20.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:20 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 02/13] RISC-V: Add SBI STA extension definitions
Date: Wed, 20 Dec 2023 17:00:15 +0100
Message-ID: <20231220160012.40184-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080024_489037_FCB6A130 
X-CRM114-Status: UNSURE (   7.26  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..b6f898c56940 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -31,6 +31,7 @@ enum sbi_ext_id {
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
+	SBI_EXT_STA = 0x535441,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -243,6 +244,22 @@ enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
 };
 
+/* SBI STA (steal-time accounting) extension */
+enum sbi_ext_sta_fid {
+	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
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
+#define SBI_STA_SHMEM_DISABLE		-1
+
+/* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
