Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3624C47DDF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3+2aHhO6aSka+wY9u15MsOySdTpi7Ku6LDfDMZNy04=; b=AK8J9ZgXBvP3t4
	55Vgv9s++os2uzCX5qsWS/8CFm0EIoanNar7x8Sc369f7lQckHuWLoA8dwxESdzzTMkbcYi1jYBPC
	iV/Jbtxnbug+2nC8/VEEAixaERDbM6ZPjOx9eq+GwZFEKK1BtDM4OcJ8EovEL0MTWRXH1jeimQ3np
	gOpGFeWXlGJXw+HY/1eepPBm6wm0Q/NmVF+DCvvHFGjaxggLWhi2Cd0Lu/qUrmVDzROx8m0XSNBg8
	7XRCN18nqu3lPrvaxC3xu1fr9T10ROp4ta9/5ZGxF7Z4wV1aPf0+D00XdKd/HLun6ukzStfDE61/n
	dEj5c2l3QBfH1MFrvXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQz-00000007m3L-0QKq;
	Sat, 27 Jan 2024 16:21:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOh-00000007kTL-3EF4
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d7431e702dso10697725ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372350; x=1706977150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aon1Rb6AZmHyR8DhDKG8+17ET4YMl25ggX5aln3DKEY=;
        b=EvbZHYsvOqcZg1m+f35oLDQPyOA63yDNHxT4g5TRfENHGnSQlThzznZUz6E9yiiCXr
         QOD6m8jIJG0U6BlIb7IUFAcYF298gmCVc1cte0YB1wEQiWDbqnrWh2X5vP9v5XvD0N3p
         QSX7tM6qY19YVf+j9OXhxipiIh3/V/hgJ2AYjZPFQRSS8tL3+k7VOqSrdFqalCi/lbfz
         A/Y49OpoeZowesMsvpPKhsXUfCPefeq1d5niwpiCttMCC9L6yUPw8AI8RTfl0Tk2EKQf
         rRG2PNT+ajVPCOigcsazeLQVG69+jgr1JEayJ2rKmCvRQthIKm0V8tzr8ab9VLxj7DcI
         88Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372350; x=1706977150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aon1Rb6AZmHyR8DhDKG8+17ET4YMl25ggX5aln3DKEY=;
        b=CntAVI1K4esIe1xk1HgerEQiITDb3G8fXUjXCiwnprTSONOoCJyzZhBpOrav/JdfJ9
         PZGbYzNQSBn3G5ASyn+1QZQC0vk6fd0NGbx1YqawkrSXjcrII7JRktlIwlpTnf89PtrO
         qGlLjwTuoeLFj9GJ97blYLSsdW7/8pASB16AQPOzHysQPd8K5a2U2gTGghHpdr5JpxYF
         ZKmi57FR3aIpTkAM4NlY3qQZzHG0IO3o6DgYsbORRXqR2vE0OQP27TwOFnpzk//tRmn9
         5WyCL9xN3PhjTI+5GLx3FP0zNvVBv8f/PbaRtXcGHO7DCjjT2UflGNag8GqgDFyqjEF7
         LiLg==
X-Gm-Message-State: AOJu0YxBcL4Hdq+Qv44+42UEfGfE6cwIZmoJdPocRZq4frM5X6nSii1P
	o8Y3Ds1JykBSfBhx6bCQWv6kIc9xAzu3hU3kupNFPUTPz8y4qzLvyMVXNEgnQOc=
X-Google-Smtp-Source: AGHT+IESNQpMnkRheaXf4Iny97ASS+tysV2T2yQTW1r5Ok8Ym8c2y+pgCA3LcaRphHbCd/cF/syjDQ==
X-Received: by 2002:a17:902:ecc5:b0:1d6:f4d7:ed13 with SMTP id a5-20020a170902ecc500b001d6f4d7ed13mr1046044plh.83.1706372349939;
        Sat, 27 Jan 2024 08:19:09 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:09 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 09/25] genirq/msi: Provide DOMAIN_BUS_WIRED_TO_MSI
Date: Sat, 27 Jan 2024 21:47:37 +0530
Message-Id: <20240127161753.114685-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081912_193659_0681BC4B 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Provide a domain bus token for the upcoming support for wire to MSI device
domains so the domain can be distinguished from regular device MSI domains.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irqdomain_defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 4c69151cb9d2..f59d2e9941a2 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -27,6 +27,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_PCI_DEVICE_IMS,
 	DOMAIN_BUS_DEVICE_IMS,
+	DOMAIN_BUS_WIRED_TO_MSI,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
