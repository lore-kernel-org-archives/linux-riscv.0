Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C3EC4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WsX+zfxYx49rQUQyWp6NpNBZmp0xiRfFnLkFOgDbIY=; b=QK8//g5hmp7TMy
	GUK+3wQzr5oEJM5ybFf1JvYix5W23l+qe7g429n84F6ZTzgFaf6x2HYVvjlsyfQ5Ofh2O4gcXd+E4
	ChOPzh38q6tMOkYbDiZFd5u+BHosxikRO5oZOEZeYQvuBXAbqLLNIKF1pgz9erkNOX26JiYImPXmK
	1tbspv720VtWFw+chUQsVIusYabMJ43zWY8AaiqB++wp/bLgs11N/jXUz/IF/J7dAo0OwUk12wjVJ
	Ka/4HhobSzHz/JXE2q3Ry4mSfX7KdlcHya6ps6a4cSSxHu1iKbAEcnDQInZ2RPwpd/e600s397o1D
	huvVhazCWX0JvBxOmzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilA-00HRLp-1g;
	Thu, 14 Dec 2023 10:16:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDil6-00HRHc-26
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so74477755e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548956; x=1703153756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Woc15oz+CoXPrVL5FpAnQJp0K5JKZ0y7fyyofa5MJ/g=;
        b=EgFdhjh3Wdyo6BYmqRBLwHXrDj8H6Jx95ARE1BmDt/xOPFvfPn2GNNV37B6s11kKpQ
         twO80XmkNWmlJuTKWNvy6okgoet+uJCbf0XNNuxRLSTyx94d+fANglCOIGBonJa702Q7
         nbZup2hR5KZPOCIq08QiH+FhzJY9VLhGfn8rGzAdwht5CtadC7Z/VqPsNM/Ti1BisEtn
         9zyR9gQQnr8w7ucYqpw2cqkOIUEMonYRQ4tEm+shExqv1T8EVKgHIYjFqQYMUHuyNCl6
         aYTiO8S9idLs/i6WoghUAOQWz6O6fU1C4yS1LiGkcwoxA+H2yIGaF9a6YXkntsK8OWmg
         KKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548956; x=1703153756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Woc15oz+CoXPrVL5FpAnQJp0K5JKZ0y7fyyofa5MJ/g=;
        b=OqHo+d5E/Qy5w7S4uReZyNlbl+/sFGkIKu/O9CCPbKVHOD0InxPAwN395TRDAXUg4h
         o8/Xrb4JKG7xM/i0lB/KH3LktpBXuUZGGHPfDKHVN3OKJs8onNCya3B2yON2MhHSX5Wq
         CkCIrDdf4Fw9SjBXOPtivWSjxUdVb+++w7kowdnTOXMaUOT59DyoxsYpCdcnzhyuGb5v
         Rxuo3pAXstzK7ySQU9wybFMDHiZY7xkJx6a2GNecI6vY3BbcvHUsKjr5BJ5Fmf92p+HT
         Dc9FZPFUr/zwZfa2Keon/FDfdLre/zxVpRctGNgNiBwZOY3vry6AAvS3//V43oux/Lod
         +x1A==
X-Gm-Message-State: AOJu0YykAs20cy2u66qABSZoxnjltGMv21CknFUobuLY+QLwo7riK7Hc
	1cXvluRWuHjsmEv+1cCmNbU3hw==
X-Google-Smtp-Source: AGHT+IFfvKGJdC1xVt4K4bKm5d7cOnRv8TQYL5otvs9mb8+kEgJtDUDvnFCXQvhqDlCC//Y1eELkkQ==
X-Received: by 2002:a05:600c:4591:b0:40c:25f7:8da5 with SMTP id r17-20020a05600c459100b0040c25f78da5mr2433308wmo.264.1702548956738;
        Thu, 14 Dec 2023 02:15:56 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b0040b30be6244sm24077359wmq.24.2023.12.14.02.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:15:56 -0800 (PST)
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
	conor.dooley@microchip.com
Subject: [PATCH v2 02/13] RISC-V: Add SBI STA extension definitions
Date: Thu, 14 Dec 2023 11:15:54 +0100
Message-ID: <20231214101552.100721-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021600_686192_1CFBDB78 
X-CRM114-Status: UNSURE (   7.13  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
