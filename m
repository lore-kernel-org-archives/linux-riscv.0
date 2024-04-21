Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BAFC04FF8
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBCWf11ndyFCL3XFi0wxG2cgm6PleYJTC8xpJWUucd0=; b=1+RBwa0YS4F/Xq
	NCz2jxP5abnW0suQ9PvEOwp2GWqmr1s+w/+OTwCj9XP9REBgk/tXxK4KKPsLcxfFwaLyfdFMaqPlB
	kctrunazU4V8MhVWtjcgKnVcoCZNv+yHirGbNUSF+nWLI722mwZEes3Jzb+x3cdFLFwGUbx1y0f3p
	7q39jFZlbY1fLLOf9D7EbSJ7ZQAlKKuOyizDwp+8llslWnS3VIk4QZ9bebBtCRYXHjHyVsjTuMkKM
	Py+Pb4/HgRVeau1GdImzoOeS7Wa9aE4xxSFqNbpqEhkTtKM5XE1MUZnsusyWl8DuWeM45DV2505Tm
	8/XuSkd2CosGU76bF+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryWhe-0000000AVKo-2oaw;
	Sun, 21 Apr 2024 12:53:54 +0000
Received: from out203-205-251-36.mail.qq.com ([203.205.251.36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryWhb-0000000AVJr-2rHf
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 12:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1713704027; bh=+MFWVuEyUVqlNiNc84ZLlRbkslCJ1Q/32gOiB+YTW2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GCq27bp9DOpfpFtNbQ+ps1WKJIJh6TsojhuwC7VkZgdWEIVJx2t6w5RN2TBDu74Oq
	 Ofm37a/qfcx+cLaOSsfSv1XpSFLVsQB3tfeivUKFbaszUpgAbtWxYlNXb+WNs1H6HP
	 xZWbPyualZf6Awh3XjRa8zVcCaMxmaVw2XoGorr0=
Received: from cyy-pc.lan ([240e:379:2264:6200:aa04:7d36:395a:da35])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id D6B1C271; Sun, 21 Apr 2024 20:53:43 +0800
X-QQ-mid: xmsmtpt1713704023t32d6eczu
Message-ID: <tencent_31510A9A680F39CAE25AC60485043772F00A@qq.com>
X-QQ-XMAILINFO: MvTK+AXQ7a4FhEnFVpRX4G66+GiF/6N8d5qNLQRLLX2rV2tcDzzoadgdArdnVU
	 dz1NkQiSsfsChzkeiJEPf6LLSX8srOMnUsANmnxzIo7X4x1P16IT3B3qmFFmFksO4UgcfUzk/P5h
	 NmSks9IOiVB+PJdHeAuXSgvi85S7PK0BFTeO+eNsD/kXE5ga9YZ9LGsKsFhb+BWCpbTUGuezkLy9
	 p2tvy8yTiaUXZPD1hgeNYhRYW9JTYDJTd/7CFAnY/liIGKUIip9IgrKLoTAruZab7xPARl1gMzq5
	 Vg8ECqx1+z9TygrVKJlw2kQmb16CiEby9D3zH3p0RPmKe1hY8yBNIH/u2oS48MKW9G8+J9dtWvBH
	 Njmkw6Q93BBWhuDigkdmUVKVFV8AZXbyW2kxKiYw2Ze4N5rPmd+gsKMUabLAiUkpaKSDLo4zy2NE
	 8KnROju1uOHPpEwjUie8N2vK9/QdftKylrnZPmHa5tJktnz7QHAIIhmQTNPLko2oLnJnxOeBH8tG
	 nhiNJOyiAFeHrIsDDGd0X8dFo1LOlrdQFmEtyCJN5HcLWbmcePFEBbrBvacAAub9FVRlWd5luH0N
	 y5zCPMd65rY6h3bJwTux44Pcfy0PAyHH5clre+2SPhTOFYOIIjC5IXduum+sGyiyVi8QW0ESY7rJ
	 EMepmi6+9DjlIlTZXskBYCzvximCXoOlFylz4h3XOtJX+96HafQp1iSBmIma2aXQKWskqHfkdQrE
	 5QTGPopCXi8mN79d+N/fAW0bFdj+LubR7svXAHizMXK9qG/tsmcsyXdo/RSwQ1CT6XeOzmcOE1LQ
	 RzFqG8hLZ4FDg0WNGXutp2cx2ZLRb9noU7O3/N5+3MXmWcIsCegMizoMDtWWVJfmxkW078ughOnK
	 ZKi5WEIV4j0vjBA4EdeWMg7mHi7LqCxxAfU/im43RnNVWbaTGtUTxT4Pd9ngrmgNHDwFzXEwQSCL
	 N2/8vGlgN7BhKZYbknFkaD64K6FwSmuKLBJ20wOiPSisK7Myk0nMvl1jKJKKuxC7ogq6gZD4Bcs+
	 wyEuZfVA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 1/2] dt-bindings: dwc2: Add bindings for new Canaan Kendryte K230 SoC
Date: Sun, 21 Apr 2024 20:53:29 +0800
X-OQ-MSGID: <20240421125330.1039774-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_E9B853316D217B8D1E7CDF8288DA5E8ED908@qq.com>
References: <tencent_E9B853316D217B8D1E7CDF8288DA5E8ED908@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_055352_188007_B093658D 
X-CRM114-Status: UNSURE (   7.53  )
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

Add the dwc2 bindings for the Canaan Kendryte K230 SoC from Canaan.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 0a5c98ea711d..c39d7f9d76a3 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     oneOf:
       - const: brcm,bcm2835-usb
+      - items:
+          - const: canaan,k230-otg
+          - const: snps,dwc2
       - const: hisilicon,hi6220-usb
       - const: ingenic,jz4775-otg
       - const: ingenic,jz4780-otg
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
