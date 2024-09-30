Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFDECF6497
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUPA9J1OelZ2zxnS0077QLS8tH0RqLn16lftFlwW+hY=; b=IcMIQHlm6AZYH2
	v+VOBNvg9xI8xwn/TGYlXEay5xqEFgkOn6G/YxayKvpKXKFVjAnwnEwd20GVeHRKiqVXZt3iBDnWv
	vKrEojQHHob/4Zr5QRH14dg6A/EiJ01LvrmrMiMwRVGwRjRBruLCn+RWOWtEmGG8noOSfKPvW7aVg
	mNNXpw5QwowqCMVlG2jqBdwTSyPzI3i8j4f0UI8VfRtVUzcBQbT8FZwgJTLp3jPg64O5aMt0CsRFy
	utTYl3taDor7jPNiHnUUiIV+mNFLhpTx3+5v9PHvEhRIP1TSy6j3tisr9Yf3w/s3YNxUPkOAZMDLD
	SFhBbUzNv7j2QLBk5YdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHb-0000000Ge7t-2ZGX;
	Mon, 30 Sep 2024 10:05:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD80-0000000Gb3P-20MF
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690141; x=1759226141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YsY+gPj3wVsf1p021dBJwYC8DN5AHByNDpJbyROqouI=;
  b=wCqTNFmKcKp4s2fIYvRNn0ZRjl+FhCLrHDLEDWy0ogZ99HJxkLRZduQQ
   ZovYfufDKGeGEsHGAkADj5E22hMlWFsk0Clxp0cLxFvwwWhmV1akZ99wW
   uIlqK1NHZ0CLkG7tux/l2EjgOWlnxRVGBGc34LcMAjdjWUbLw6IgXKHEe
   fzPX2iKDP0yeYR92i9LuSYUntUA7q88UZhV8BtY90LeWPm4IckXf7eaNa
   gjkRbaJEW8/1cL5GCV4B0fzxYPLD+TsdOKRgBed1TE7La8kCFnG8RmsDI
   HRFY4fXEjhFW+rZLqHWU4YsJuLAUQddR5XgChwKNiMlUmZNF8O5SZJ6HZ
   Q==;
X-CSE-ConnectionGUID: VDfGPtv3TTmpuSmsWgS4Xg==
X-CSE-MsgGUID: gzY9/IQ+TOuosDlOklZ5YQ==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="263420157"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:04 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:03 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [linux][PATCH v2 03/20] dt-bindings: mbox: add PIC64GX mailbox compatibility to MPFS mailbox
Date: Mon, 30 Sep 2024 10:54:32 +0100
Message-ID: <20240930095449.1813195-4-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025540_554150_84653D76 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX mailbox is compatible with MPFS mailbox, just add fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index 404477910f02..9e45112e185a 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,mpfs-mailbox
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-mailbox
+          - const: microchip,mpfs-mailbox
+      - const: microchip,mpfs-mailbox
 
   reg:
     oneOf:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
