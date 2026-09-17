Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C89C982DA
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2GjI8+JHiyBQiegz9xUjpXFjshm2m1eD4AEdohV1Vg=; b=yUGXBfrhyZ5VBO
	q/2P+XEKnGpxJj5mtOL7kXjzHyTyIkWfl5HK4+fXc7ljKlXeBmGqxZC3RK60iFMY3RawayaFo7EQs
	97QvLmmbg0+QL6FMzKm0dTT6KXh0M4PlGjxI3Ill+2Uy59UI5V/awzJwmjv3rm86AXyE9PxKFJ7Kq
	eXqWdeVv/UdK14BgMipKDgAKnqKpXxxvIEpKLtZ/4KD82xw+EfRzrnrqkCkP+l4CTiwmpHRpZM8xz
	gj20R6rxixIKSFhyVO6CTCsXGGbH0HRDpteAImTkJtoNRhhc5kHx5pg9a3GBbXoToPy7uPuPiH3Xy
	8k6O14AFK8L3Qpx1vL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F0u-0000000BuW6-1bwv;
	Thu, 17 Sep 2026 16:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F0t-0000000BuVe-0PtG
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Sep 2026 16:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qx0cf1g+Dt53W7gHztcUTGsB3qoLvk5+RjOcFaDkDog=; b=b59bUhu2F8dB0zlgxgdvVA3PD5
	wG/5FbfcpsZIawIxP9KNqxjGr9Aq14ZC/RNfPt/rdTgvAQbfpq4u0n2RoLH6oJxGdXMkhvPXWZPqh
	n3NjyNp+2TxoB00/q5MwQ6XXsWS0/vVHS+4LRDr3EX/39fEzzEkRmUIgCkEZNHfvImTk9lFdPya1J
	S7bSDbbYqzYcYJ1TMRU/sVsy+7T29Y5W26JF4uK0JYZwN8hNjekmiK2CvelZuRa/WhoQTMkn/KBQu
	wY7MuJ1RzTkuByLkJNGXeSh/2cBZGbr4tjlxO9dQTXNvpexky6+p5U0VD31sc/CC/wLpJmYLWJCOP
	ds5UhStg==;
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7F0n-000000092np-1hd9
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 16:31:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789662642; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jjbW6nPbZ0TL/JId0Pl4SXJ3wP1mZOy++MaTc2dTJg5WNNxLVy1iFb/QuIFEyxGqPlNHvUNLYhLrbjiEAqRExcpi0d1GvudneiPSPOQwtLcn1RwNlGA/8WBTwOPd2OKlzMKk2RfqgZfnHbVtKjSDhUM20p1AMuWGClmCW8oPXgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662642; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qx0cf1g+Dt53W7gHztcUTGsB3qoLvk5+RjOcFaDkDog=; 
	b=V31YYko0JVr2qFZKPJGxnrXkP1eJ4g+Slzs7DRqd/4KXREiwScrPxZFU4lBP2NJ9Iz5MY5NMX0kLfsLm2VawD+ncYtzjekfOaVLcQavZa8z/QmmggTFkZh8ss8uLbHsX1MjaRzmNMNRciJ7tGWoFdFmWsk3diTxDZpNpQxC8DI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662642;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qx0cf1g+Dt53W7gHztcUTGsB3qoLvk5+RjOcFaDkDog=;
	b=LcwK3gGVMvOvgfrCCiGwkgotTTA5iTzqiwxdov1uw4nk5N1ZdMhw0P1lzPektthl
	3WeStpOXakDPq4zUjgoJfKBLd7kPpbFV+8ON4MMDmYavjr5PetUD6hD7dMmJUBakJOf
	h1WArec+qG11n/2pkiiequ82oU+bkqmRRX3GRjKo=
Received: by smtp.zohomail.com with SMTPS id 1789662641274673.8989013615341;
	Thu, 17 Sep 2026 09:30:41 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:34 +0800
Subject: [PATCH v3 2/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260918-k3-aclint-v3-2-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
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
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=987;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=WhEgGQPZ9uGp/f98geVzjbwgaYdy7D6h/qq48gieQ5o=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiLaKnnCrl+vhMnTdIKRaP++/IluWMIuN+SpTu8rvH
 Kwsl/06SlkYxLgYZMUUWbj8xf9Z6/B8OyLQeh9mDisTyBAGLk4BmEhpECPD5Etv/mdFLI6d/WDC
 ss7QbWfW+rb+TJut8fJ0Rb/l+/T6GQz/g9r0WjaUfcw3YS2puCUd8fXMBy6jhC3ebB03Zc7URun
 xAQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_173103_207518_F4CC69DA 
X-CRM114-Status: UNSURE (   6.61  )
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

Add support for the SpacemiT K3 ACLINT MSWI, which provides per-hart
software interrupts for inter-processor communication in Machine mode.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e..d17f5613612c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mswi
       - items:
           - enum:
               - sophgo,sg2042-aclint-mswi

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
