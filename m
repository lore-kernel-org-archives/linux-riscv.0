Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F179C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb1+xVYl7TaAHMzNJ444KjIVzzJwc8PsscYNtYb6lmk=; b=c0YaE9li5adU6t
	vTeBo/yQ1k4SGKQxHAocMJYU4dHuPu4Vp7AWdyi7zFthUUU57NYVSdLtGiPb99sxr1dMvJV0nFXgH
	dAEfKudxshoDD2rD2GnTW5ILi+sCvLF2Tj4mOBNEfzPrX85Pj1fPNyEDmfcHW5BJsRn+EUiZVYeDp
	SGzY4hG7YNmtBFokd6rCK1vLGUzAm6yg0uRy9pIMBt62WwGAJvdDSlMlS3Rg/yKWI/hMWLTw37klc
	P3X2r7Yu+Cua2CcKhLQp4DwR/AoKtsM/JRsXkDVPfNQkhBcvwaW9ayxxC9X6yjDmqO80gyIcsLwFY
	vyDsDUMrBgV1ygi+jPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6v3-00000007HNi-11aZ;
	Sun, 11 May 2025 13:40:41 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6v1-00000007HM6-1lRG
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:40 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b1396171fb1so2352658a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970838; x=1747575638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=d1YHiVuIo22jk6mN5egF+oCa73Fv8cJ07CZ/netjML+q1lWOxwzLKdcoO3vfpzddJW
         mnnSQ0UwtbMEcMPxD/Otplv9QIJAuCZCW39gW/5Q2h3uGbFZ+NxCZsMTl0gyoN0LtiOM
         KUf2jbI0jWv2kMrxk1bFLfCpz7UaZ+Bj5YAoVhDMAQTJ1sTNl3hIHSZj59jotI4PMizJ
         qJBroOyg8cjszmfkoOArfhkt7l2esUct+AIxicJBzsHpJXBTmaDJ0rIwWPaVfyL5AZLt
         Qi59JYb6h06MVzXzWDQ+fD/DO6SqUF4ir/cOWzlajn/b+QGejrDmyfLMXSXWYZKXUx+z
         UdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970838; x=1747575638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=d7G/TdzIOur8CFDfArdoViPybr+KvpL/BBBSNhf9iWwPXpqbPDsf7dUPW4TTklUZ6x
         s8Oxa2RsZsJ/YsTzaIPmd+Q0KTm+NLe+P2Xij+GF4LKk1JNYV1DUtqgaYy0RHMkV6pmF
         lutnOucunCOMsiBPHxkq8wJJi7YjoX9Ohw5dXdi0CGo7xp1ojdP6ZC7Ln33cTDbtYZME
         aZe2+VRSt+1pLQ3ROux3EpCzOBBjwHX8GJIEh3FceTzVZmi56e/Qn7wAmRUjyzEYMAA2
         C22Cdyh1yWCCP+KX/RLuKc5N2LJBwDbIPXjfdATQjFzg3mW/mE/+0yMWd4vkiYx0u4HH
         6omg==
X-Forwarded-Encrypted: i=1; AJvYcCVmodShtFCzw0Q3e9vevpceNnfdAaC7AVbA+T/aAoF2IstNB5LoMkc8sli6OuxjHP1RlHsC4ED/n3zEiw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf0BdC5vQeRBkFg7Za8B/0rrU2bncaM7GH7p5ysn+QfrmHC2zz
	NjEAZuHF/dfsAxkQuuVnUQcRK0cxUtR9kvRizfjwvxkHecm1hwrRbRmqv39r+Cg=
X-Gm-Gg: ASbGncsM7JIVNEaVK1LPwnyE0FVLoypI6mDnBCkRouZG7afKFamgyBC1x4FL7qj0aza
	3GSvqF75PyBIsZ3zXd92oqA8Ge1QOfcYVBU5Wgnamu4aV9oE3tqSmbhE/+f+YRaPO3v0SiRN76F
	/GUkidssZpLbUofWiuzlMF1qg60glcV8lRroDi/SpptojCX+bqZKZxvaLR7Z+5LlD7ftK5P7xyd
	c/obpwvVxBXMf4LbTartvcvBchTVqJFCCDpqyfmYUQEDxH5La4VAWp70wDSJILNNasqfQM+YJ+f
	PysuArs7JTmc7pSejhPaY7xaLmfdTOYPcQyTR9XJUJvoOB0GriRqivvjfSDIofg8JmWA6dOfMw2
	yLo1dabEFo9pMZg==
X-Google-Smtp-Source: AGHT+IHA3PsXqyuN65sUtIV2Ta99+xXozSEhh2Q4R2ahfGnFgJSheXDWuFscswXV0+c2V15ebDTDaw==
X-Received: by 2002:a17:902:d581:b0:21f:1549:a563 with SMTP id d9443c01a7336-22fc8b0cbbbmr134190455ad.2.1746970838172;
        Sun, 11 May 2025 06:40:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v3 04/23] RISC-V: Add defines for the SBI message proxy extension
Date: Sun, 11 May 2025 19:09:20 +0530
Message-ID: <20250511133939.801777-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064039_456468_175883AA 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
 arch/riscv/include/asm/sbi.h | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4dd6aafb8468..d295c26a7c26 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,65 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_GET_SHMEM_SIZE,
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
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
