Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B3AE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVHKZM2817OBnvHHY6m88D1XISWZMLMaf+neLAJVxFg=; b=sEcqokNsb5J182
	CI7TXTYDmLbbGdqXMrwkJb89PSqeVwNGUnK+1m4RCxXfKSbp8PkTK2HIfeTm7bmX7p2HVBUHNi0TI
	3uKU2r1ylwjZwF8RJRSkZLBjKkD3kNicP0ncCe6fqMmGbrVwKdv4zjW0LdXfJp1GGtIIrXWefJbz8
	LAqsREuSQsyoSdcaluMuYSFPsUwnWXdfYId3jP89q610oIDaS5F1WfYgfFdDWCsmB4XmznNTtgY9S
	duhh8DKDPkLAL0nqxaXFuFkiJMgjAVmlc9L4/10R+QxFjGifiKu+kTJc3LdHRIcCqHTrGR8SwWM7v
	MVgiSZ5jFKCASVRAGW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mi-00000009RNz-1SVI;
	Mon, 16 Dec 2024 08:49:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mf-00000009RMd-0elt
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:48:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21644e6140cso35495275ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338936; x=1734943736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTubMU2kWF4VQtI7+afjrAi0Qg8VFM9pvYCuyyQx/90=;
        b=Vejj0Ni0C9UAupw4bqsdOmzDacBo8W8RSpFhMLbkvxW8n4WP8zLPgtToBfQMU1ntGe
         3RIZeEm+UQTgQhtZ7rJOjl2CxwCFWTZwzNE3np01cJ5nXJjCsQ4YFMS1bhwvBHXscnan
         tXUrcP1U8zXt15acXUv4OGJyTNaFhXwYVdXb2au0u/ysnf77IOEuNk9Aw83Qhkty/B/P
         aVvlPzwZPRvIrCv8Gzu2Wjvw23a3MTQx/zOi2mS1nuFU3N1A4fymFSeh0o5/fKspbMAL
         DQO+fG4/WZrFla7ZP65Hp8E6Uec3zBaK8AaVsKZFSdZHjCmopL9nPKYgBE+ag07y8Vjm
         ZXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338936; x=1734943736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTubMU2kWF4VQtI7+afjrAi0Qg8VFM9pvYCuyyQx/90=;
        b=ORH2iA9553CkCb7e/7rqb4UG5szu1lEFvDhCaTczkHajvwDltBQHOSAoZYt5x+zVzA
         sWcQzpWjOyVYAoIVkdO/7zidVXVPaAfy+C8b0dMIZU8TrOSO2eo45vo4CTSN+9lqzzWm
         0IEEs5rqJHaTb9ojkX9MZTrR/fYH8002sJojuvKlc8XwkwgV3pKP/pALOrBbrSnNyA7L
         kt4Svf3/cJuNQRbqXT5t54ekiNsqIBj0eFsWdOEm+Vcalb8bQgzQM1EEV2GlTLy7OqGf
         n4tgG72JMRlxyqW0JPhLAkgUu5EW2WsDeFLW9oI8aJJyr9iA+3Sqoq4ZikZj53jVTqEG
         nnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYv3qekXYnfCGdISElKed/Zv90V+T7BIJ0Hu+p5z4hkNCCRyrK0ybbPDe2cdXjKylw7OxTuTk2ewN/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9Cu+7kyjyTX7c1AC02r9yMBmPd6TX2MKJg2WOYhtA/x461SB
	pbtHBmzyF27jNrajVxvp9sRbb/gSYMsk0MtlUQmv4MDK/xztFcYPRSefXzqp5eM=
X-Gm-Gg: ASbGncvgMwWAXEWXauNFxUdR9CYOPVsaUSZLx+o2FpBtERZe0RYL0s3CXp9Ypyw/xbk
	oH/9kdWAvJJRTG5vVTWXhOk/dYh+zcrZnSD3BTmIjOXLJDTXVo4a9lJpVOdVJOfVxr9ZFZN/jiM
	cQhvh3lcA+Fk4aSGPGhLvIwlYFMKB/50nX8IPgBQgSuSDpIKDlr4u8UGRDl660tJgrf+tNtESIF
	E41ETx2mgB3nYztwG/9JtR8dKaxL6gRwmHc+nNqQiWALRBmsChMAOraQ7sxjRYWNb6oxVt2qqFU
	k3qTI4zOgUbxqjY=
X-Google-Smtp-Source: AGHT+IHpuJTFzeEhjSiGdehFNiKlPC/zQ57iedGa+8ilj9RzYBUBHeCW2l8Z59j6jtt7ugE/4lqbMg==
X-Received: by 2002:a17:902:ec90:b0:215:75a5:f72b with SMTP id d9443c01a7336-21892aed1eemr161821665ad.53.1734338936193;
        Mon, 16 Dec 2024 00:48:56 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [RFC PATCH 4/8] RISC-V: Add defines for the SBI message proxy extension
Date: Mon, 16 Dec 2024 14:18:13 +0530
Message-ID: <20241216084817.373131-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_004857_195831_32123978 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bc35ad750e28..18817efba430 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -401,6 +402,64 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_NO_RESP,
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
+};
+
+enum sbi_mpxy_attribute_id {
+	/* Standard channel attributes managed by MPXY framework */
+	SBI_MPXY_ATTR_MSG_PROT_ID		= 0x00000000,
+	SBI_MPXY_ATTR_MSG_PROT_VER		= 0x00000001,
+	SBI_MPXY_ATTR_MSG_MAX_LEN		= 0x00000002,
+	SBI_MPXY_ATTR_MSG_SEND_TIMEOUT		= 0x00000003,
+	SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT	= 0x00000004,
+	SBI_MPXY_ATTR_CHANNEL_CAPABILITY	= 0x00000005,
+	SBI_MPXY_ATTR_SSE_EVENT_ID		= 0x00000006,
+	SBI_MPXY_ATTR_MSI_CONTROL		= 0x00000007,
+	SBI_MPXY_ATTR_MSI_ADDR_LO		= 0x00000008,
+	SBI_MPXY_ATTR_MSI_ADDR_HI		= 0x00000009,
+	SBI_MPXY_ATTR_MSI_DATA			= 0x0000000A,
+	SBI_MPXY_ATTR_EVENTS_STATE_CONTROL	= 0x0000000B,
+	SBI_MPXY_ATTR_STD_ATTR_MAX_IDX,
+	/*
+	 * Message protocol specific attributes, managed by
+	 * the message protocol specification.
+	 */
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_START	= 0x80000000,
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_END		= 0xffffffff
+};
+
+/* Possible values of MSG_PROT_ID attribute */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0,
+};
+
+/** RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID,
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	(((__ver) >> 16) & 0xffff)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	((__ver) & 0xffff)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
+
+/* Capabilities available through CHANNEL_CAPABILITY attribute */
+#define SBI_MPXY_CHAN_CAP_MSI			BIT(0)
+#define SBI_MPXY_CHAN_CAP_SSE			BIT(1)
+#define SBI_MPXY_CHAN_CAP_EVENTS_STATE		BIT(2)
+#define SBI_MPXY_CHAN_CAP_SEND_WITH_RESP	BIT(3)
+#define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
+#define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
