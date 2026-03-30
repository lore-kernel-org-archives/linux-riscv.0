Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B14FB3D02
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iH85pPw+lAaoGPew9D5mAifNVNXvdoUKFUzWnfZDyfI=; b=VMYGv9gY+IGnvz
	HaJ+WseD+K9MJu4R9kOQlbHHuHEY4Jicr+YBEk3sb0Yxpdw2xswdVJUG6Z7bO4OXPrHIWWM6elc8V
	Rvkg7eLTlNYG46WdH9btKQzFqSZ3aaFA0B779a4Ve26Bm2wd7QX/Gli0KaU19ttoc84lxwNWfyRfU
	Xw/XdnCyUMWZdi05rwz3bb/vBT4fcyGaZPq7TrKXtQxzg2P7fLJ+zACfivChULUyrFYlZl3+nUM+X
	xUpwASbpZiSij6BDwGRJSaoyqAsJ7OfX1VW2QGV+ExhMUBGBQrtRXKf0qDse9IDUu6VdRh4B8RfH4
	BhxKObDZhZRSwkB2oZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79sI-0000000B3q2-1Z4s;
	Mon, 30 Mar 2026 10:29:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79sH-0000000B3p0-2vTd
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7JYDL0DEs18bvH+bx4jI+vxQlpNvbJ7A49OFmkp3rYk=; b=dn0y1wo6P7EDKdvSGAlRaDe1vk
	eY4dVTyEU5+nmJFInnxtBXxkZPIciLWHWHyMmCnqZx8+IKXGOje/ZHeRT7w9xir+wQDX2k9cb/adM
	S5W20gmFdeN6ETDinwUqbj6+dc+RDT06mIJZvO+9GpGIVH3PkcVnkFZNCuw948NxFCvtB7EGJTfED
	xqwQSjETfGURxUQulGneu2SVYAYLihWxCqM0dd9dwfTdBM7IenTC+mOEHHXQmNDkuL1PRcWFFvjZR
	2JRbDqTPT0ODm9Xcg9hMbYekfE1nG9Mw43jPbhUKFyKl6dvaIMBLJ/75ZB8/s2AZIXDEmh6gfGiwz
	xslAhgew==;
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79sD-0000000Da3b-36Nd
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:29:36 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASI1F038289;
	Mon, 30 Mar 2026 18:28:18 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:18 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 6/7] dts: riscv: update cache compatible strings to LLC
Date: Mon, 30 Mar 2026 18:27:23 +0800
Message-ID: <20260330102724.1012470-7-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UASI1F038289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_112934_478248_54E10B0B 
X-CRM114-Status: UNSURE (   8.83  )
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

Update the cache driver compatible strings from ax45mp-cache to llcache
for both Qilai and RZ/Five platforms.
This follows the Andes cache driver refactoring to use more generic
Last Level Cache (LLC) naming.

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 arch/riscv/boot/dts/andes/qilai.dtsi        | 4 ++--
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
index de3de32f8c39..a7436cbf6f69 100644
--- a/arch/riscv/boot/dts/andes/qilai.dtsi
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -137,8 +137,8 @@ plmt: timer@100000 {
 		};
 
 		l2_cache: cache-controller@200000 {
-			compatible = "andestech,qilai-ax45mp-cache",
-				     "andestech,ax45mp-cache", "cache";
+			compatible = "andestech,qilai-llcache",
+				     "andestech,llcache", "cache";
 			reg = <0x0 0x00200000 0x0 0x100000>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			cache-line-size = <64>;
diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 571de3cafa82..83a5d4d41f8e 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -144,7 +144,7 @@ plic: interrupt-controller@12c00000 {
 	};
 
 	l2cache: cache-controller@13400000 {
-		compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+		compatible = "renesas,r9a07g043f-llcache", "andestech,llcache",
 			     "cache";
 		reg = <0x0 0x13400000 0x0 0x100000>;
 		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
