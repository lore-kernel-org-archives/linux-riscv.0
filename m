Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF56C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TifNLpr3RrTDBsaEFPT87rPvShowuY2G5/U2vBgmTeI=; b=xB/SkTz7+6QBx2
	kfBEPM1FXwgO19S7KCSPicS3C02yCP7PC0LalawGngbLdkUAzmh5G0qrDhiA4fWKp9ZB44n1eHFIn
	JNjjMHlTE7Ujqi62U/BoY+9yPZwdOxv6r/8xTC76D/nidYexpNN0oZh8M8efgXf2oFVi0jcLUZWnm
	6N+8ViGx8TYi/DIDIpXvbLGiitYoeg0XPBSf2i9yLBJAUehpbGXR6AMFjAeI/y2ujP02B1e/ue45K
	L9Ru+T/y6XqRnNDRH0RNTe1L1G5mfNjgmCSJzZfT6dPQCOOT8UwcOyH/1363wnRLcx6rC5ge4X6Fn
	8pg+6pT0K3Dou0hve6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yiG-00000009g9R-0OaP;
	Tue, 08 Sep 2026 16:30:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yiA-00000009g6M-3bVC
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=; b=cY9BXiIPX2p3s3IyaxWXousXs2
	axV6TNIstB/bZBGvYixAgO9RobLSNJuXq944baXYASryFQx8b40Nm/SrT4hBMKweIHLc23/3Dnccl
	uS0j3uhJ62ncz6PdaRPd6GFbZ/rBkcqSYfRzqhoDhw/uHG06t46oY1lKl0ZNPW7WqNnPv8ZqxfjnL
	ca5adw5CU1//ZkqnPBgcJhIKXUOm70C8EGVExxs76rZqc7YvV7k/IVH+7E8lXgZtyz0f7z/+MtjdG
	WJQdnlw5Uvd4dnBfCvRoR3TxR8CHfdgAlK2aM2u2ilRQqWHj8V7A/YRA9yjQ/1+r8uR8wr1jqwffl
	ijPi+1Rw==;
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yi6-000000005rn-3SNJ
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788885001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LQPOiqHS8O2y0iWeuFbT0sDgA308iisGfKmHfixf/fhl+s644VSV6iO0734sEnK5JeHzXqzDXuQW/duBbWZ+kKEcpuMMJmLJw/liCg70fRykKk+Wcf+9B9yq1oVXBTsONVdzGHDD7TR7xMp3mnyyF74F1AsKAJn4iYSrznubv+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788885001; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=; 
	b=I4g3Zax4KezFYoqEQWJQL+4mprqq6oE+EUsuckrOKRlRm5uZWvhR2mHfZTLk3YI1H6MJSMjZHBgMR/Ak3rMOR3On2dJwA3yGBIZ3hPB/jYXOazGYFo/4xmsVxObOyz1fGGiR7SpfM4ipYqh6TVYaBCStSP3XL57OFH7ObMylF9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788885001;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=;
	b=CFhx5rPnXtUuX7tm+BFhX/+6YWoO4k42HdsW8MIuiMlfQhH/7AhwoI8JqgLzIjJ+
	59cUQSrpYbeCy1Wy3T9Y59kaZ/TrvcOzVOIJEb88QpLHgDU9K6aR/jvO1NHClCmMOAM
	UxCsxCSFl3db1JLqhH5mpX3TUY0b8xucJTDFIPsI=
Received: by mx.zohomail.com with SMTPS id 1788884999420980.2422992482639;
	Tue, 8 Sep 2026 09:29:59 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:48 +0800
Subject: [PATCH v2 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260909-k3-aclint-v2-5-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=h8aJIH7hyzSaiZSkDnw2JIZGmRG2/AZ362IquoczBB8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmJ+/eFOyw/1A06Y7ZTcPitVX1TZMeXJNmEnMve74D
 aHNIi+edpSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCR6LOMDG+/Mu7cEcN9cYMQ
 765JzMfmBLwV29nI+vU3391dfiwmt5sY/nA+ObVvzuHQ5bkyVfPm7mh6Pe3mtMiE/Q7lxzg45KT
 q7nIAAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173015_292535_4A4CE7EC 
X-CRM114-Status: UNSURE (   9.09  )
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

Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
SSWI device requires no special handling and can use the existing
generic ACLINT SSWI initialization function.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/irqchip/irq-aclint-sswi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..d3ef2cd3b5c5 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
 }
 IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
 IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
+IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
 
 /* THEAD variant */
 #define THEAD_C9XX_CSR_SXSTATUS			0x5c0

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
