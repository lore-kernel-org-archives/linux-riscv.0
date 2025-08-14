Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B0BCA0EE8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvA8+BMZS5QrtyxmgtTK5oXqyFYQ+nE5oXtNOr1HlOA=; b=0hodHssZ6VYZ7k
	YWw/DdcaL2VTRJ+qAQ3kVPaDsQGQAKqnQGXL/lyr1nIcT1W7iF2oZQ/Co5pPX1xnWJYWQDhF8zEAR
	tIiPMa0kNrZ8xL9ktN1/Q7ma4e+Qr50VuPc9JFMSH2tJAm96YXIMovifJFvVe88BL6+jSKKmKZJJY
	7eATKsiNnv3FYaSGAoz6tNZ/qcLrNlf+4rlvEWYhnMEzT+tgzrhiUhCEaYI/nK7aTACAAnKxbTZMj
	5QipHt1gJKnwbGjhE09Pim8mg1NZmGIgniS6Jt//hPJ/3TZEe5wZb9V/Di7IR1zG2629t/EjpcHd2
	Xyq6jYWNqyQzDJKYLZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmt-0000000GxQI-1fDJ;
	Thu, 14 Aug 2025 13:14:35 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umS4l-0000000G2N6-1YeL
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755155315; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fvq9TWrcRHeCodttT+NthzSiPn/hIusOH+1hA7/XQi+uve44lr7AyNVq7BaKcpopw9suuO15/BVQdhuH6DstlShjVBwzMqlcFh5o2C31Zq58JzvCZGByJqA49vYGgEkPGRFccRbTAhaoxwKHwjjvROFE91e+wZI9Wc0/c1Aiq2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755155315; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tg01N9hAPr7V+WeucZx1wgz88In+H8Gy9RZ3eJJm1U0=; 
	b=mWmNYIhHnzz7XR9Nz2f83Qv4lBE5i78j8ps6exmdmqSUDMDUPOzCuEoYsR/H+dD+YNVGezqyGrod1hBKfWAzyZ027vO23eEdrl6fc5OUuae3oOx/idr86iV/O+u52OEK7XEhcKoqkc3tQMKYy3hhWu3H0/C9eJ7IuJM+E4MYp6s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755155315;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tg01N9hAPr7V+WeucZx1wgz88In+H8Gy9RZ3eJJm1U0=;
	b=RnCy3EiamG2MV5JSUkoSahSdwpH5PRxQtpddyWyTqBTN8y8yZv/EYof4FV6iBu38
	/vFoWQZMq7vjdeB2SJ8TMMbrCyF8FGVaa266SLpgDS1poPAK6C0E+w4w/0ZMB6T7HHa
	OxjPJ6sZ7N8MxvbUQHj9LkzJ07yJP+dcy+HjGlqokUPE7SthlNv7B2L4YV/65tm+d41
	yGKNacis+e3Nb4LNtfkvsm0EjMtYqS9bhv38bBUO5QbJkB4B3W3DmR3TXyX9aawCFKJ
	uX05/3SuxFy2jgb/62LdCNvpeSCXnnM5tBPU/+q1hbDZSIlJ6zKdwyAfoic5QzA4/Kr
	QOEbpJtUeQ==
Received: by mx.zohomail.com with SMTPS id 1755155312649914.2180861068258;
	Thu, 14 Aug 2025 00:08:32 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 2/4] dt-bindings: firmware: thead,th1520-aon: add a mailbox name for SBI
Date: Thu, 14 Aug 2025 15:07:55 +0800
Message-ID: <20250814070757.2267325-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814070757.2267325-1-uwu@icenowy.me>
References: <20250814070757.2267325-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_000839_480634_AA070365 
X-CRM114-Status: UNSURE (   9.19  )
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

The SBI firmware might want to communicate to the AON firmware too.

Add a mbox-name item to allow to allocate a mailbox for SBI.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../devicetree/bindings/firmware/thead,th1520-aon.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
index 3365124c7fd47..555465f4aab4e 100644
--- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -26,11 +26,12 @@ properties:
     const: thead,th1520-aon
 
   mboxes:
-    maxItems: 1
+    maxItems: 2
 
   mbox-names:
     items:
       - const: aon
+      - const: aon-for-sbi
 
   resets:
     maxItems: 1
@@ -54,7 +55,7 @@ examples:
   - |
     aon: aon {
         compatible = "thead,th1520-aon";
-        mboxes = <&mbox_910t 1>;
-        mbox-names = "aon";
+        mboxes = <&mbox_910t 1>, <&mbox_910r 1>;
+        mbox-names = "aon", "aon-for-sbi";
         #power-domain-cells = <1>;
     };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
