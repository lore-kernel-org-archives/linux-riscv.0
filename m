Return-Path: <SRS0=4eYz=VC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FA8C5B57D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2019 03:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102792082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2019 03:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iO9EOp9B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vHnLM1ce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102792082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UgtlUveIxzxXWs4TTLSiSHu/59ANE3umM6MOq7VQuwU=; b=iO9EOp9Bf+sWWL
	8qVKyDb/l/9noe+CTA4YPIOVnV3CVRAR+JbEzADxgB0GZEvOZvgtdPiYBv6dovesMpcLMx0d1INnP
	BeIJDkwrghTyGMNXgQ1beswGIGpKM39Lqbg4uNFzKibB+BgNaJm3nqhB5cGxeldCk7qXC5zIMWJwl
	ZQ3+qxSvD8FpDA/kYsNnRirw2X0xvaioB0vrTWPoPwPkGN5hyUeib50I0vOAt2P9/gCkE7d+rLPh7
	ywTNEyQistIJB/TRWlh8VM6vAeTyZR9RKrtIFhnCFJyS+TWr94Xjxb0vX4evoNHYdMQau1+Ky77ng
	HKGKz+WOpDIZnR0XfUvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjFHM-0003MG-JK; Fri, 05 Jul 2019 03:52:56 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjFHJ-0003Lb-7Z
 for linux-riscv@lists.infradead.org; Fri, 05 Jul 2019 03:52:54 +0000
Received: by mail-pg1-x542.google.com with SMTP id i8so3640273pgm.13
 for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2019 20:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=xu4ABObSCRqu2Mk20412Tl9QlsmSP9rhZN50xb4/big=;
 b=vHnLM1ceUx8eJNufwRNa4exnkzXDK9BF97MlNTaSuJK/19VnmYTb6P1oxMxWmt2qZM
 J3Up12wI6K/5fFJJ8INdCuhVjHHvfUoxC10L0tQlvkF2IjJl7/+B7GW0VfGcKgvuygkd
 nd8Y96VhgpUub3exDdINyCDqWH6LIFqQTfaDZD3EVCVJ5uMlhDnB4pfGksPOYbNhE0Uh
 NNJH0Mgu8OrV0QiIP2e0IvJ1aBTGFEvcUTQ9lvfyY2tmCA0hd5+8ZEfOMuxZ4sOzeqxg
 gV4oXVrHs/qTFEyxAlBB4uZ+IJvVIihcL+qUxfIeNuUWOfjPZK/RDsGtP0lUwoIUkrKN
 FCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=xu4ABObSCRqu2Mk20412Tl9QlsmSP9rhZN50xb4/big=;
 b=OMGHCszmYEj9KvGFpUKJfcXBr1aMOLiAPjf13i4uaHoynb2k3RDvg04QkKmEkOjJiR
 Sw9na6qdBYL6uoeTw92vIo9l1IMbPT71BUwFMh0dMkbcfqTzo8GQIb33aQhkTvdJpoTz
 KGAQnS2KfRU90u51TfwGOw7nZKyI3263Az+gdCqLr4elgUAwauw18TcxYPEBK1GgmU7k
 t7xE6OBpGN45seE156YNsiBn6iJ/q4NpG/J1LciQFzQfB3LzUeTg92U12OEh43243mR0
 Yq5WgOGGuybwUPKx8lsbzk9vm8f8bg3Q7Rro5VbYj30JPK/t3U7WOMpjf4o+0nkV6dt6
 PiSg==
X-Gm-Message-State: APjAAAXiGO2eDsW9as/4IJCL18AFwoBBUAkzMFRhQLb+RWM4YKJJQvSQ
 IucGK/FXTpyOJ2SPh2Oa9zJ22UC/
X-Google-Smtp-Source: APXvYqxQ+E22P6Re+Mg4H6Bbhpk0RvNKsPjNN0FoGD6LstocEGajOh5zyUSY8+myfFRJaaAYqTh8zQ==
X-Received: by 2002:a17:90a:c58e:: with SMTP id
 l14mr1917724pjt.104.1562298771973; 
 Thu, 04 Jul 2019 20:52:51 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 3sm4305336pfg.186.2019.07.04.20.52.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 04 Jul 2019 20:52:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Yash Shah <yash.shah@sifive.com>
Subject: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
Date: Thu,  4 Jul 2019 20:52:46 -0700
Message-Id: <1562298766-25066-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190704_205253_301073_E712E68C 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Per device tree spec, the "status" property property shall be present
for nodes representing CPUs in a SMP configuration. This property is
currently missing in cpu 1/2/3/4 node in the fu540-c000.dtsi.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 4098349..0fff2a4 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -53,6 +53,7 @@
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			status = "okay";
 			tlb-split;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -77,6 +78,7 @@
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			status = "okay";
 			tlb-split;
 			cpu2_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -101,6 +103,7 @@
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			status = "okay";
 			tlb-split;
 			cpu3_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -125,6 +128,7 @@
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			status = "okay";
 			tlb-split;
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
