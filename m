Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C16CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iHxIu81nmKS06kZ5K1uGVQKLkG7IGKd0Bfca4BbpHo=; b=fjadd/cT5pRsa5
	tf+0UbPXpq+qieyOdmyxYYw/bQQ7aZzVB826LtJyKPgobxaILO1HGYkJAZoLA8FZt+1U7eUb+yF0t
	7cFJxKxcSILHEIz/HLwBrtwC12t+JgMq0uAxW9PP1g41Ecf+xPvIDXzS4bTDsIvtzYhRNgKd7EXta
	1g1TUGvCNRrcK7oTm0hVK6u5vZ41T5A3KUDEAG672VeIwZ/xzkt+wD5iSIBRkqUJ60PoFQjdT6rwi
	ZGf0rX7L45zzwv3uPZqE/vvzCTL70R8eSnmE7H5GNryL16WeTmPmgpOX4+see/F5Llr3+q/MBGaC5
	lVvBK/ZyrF2jPyzBlEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHK-0000000CVTZ-0GNg;
	Mon, 11 May 2026 06:38:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHI-0000000CVT2-0GsL
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 06:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=; b=XbuJ6VbgULkIQspuslVaQMbm1f
	nP+6iQrCerBkuhiCGt2/MqDv4bgKhnlwCpHm9DpCFujZoTrItFr+4E2Kw7X/6vQP1aoD96sPuyPt6
	Sfs4axVSFWzD2ORZbQ3/ovMKWKuernCUoCXSuP1zTYqXGnii2C73TXXsvMXYDUV6cv4/6+FwQxd/P
	ZDXbF9zCxN7an+SF33QsEIQql7Tpco74eIEbEi5ud8RIBq29onWyRzXPbU15nyaN/fluFvhryC90r
	1jNySOjwFM81ugXImyBYBn0lUJdcpcmnNE4RBkwmEQlKn9pY4hcX2QyoaR4Y3kmwTt8lpI0PRsskR
	Rbppb0jw==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKH5-0000000AlgO-3VuV
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:38:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b9705613ddso23613545ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 23:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481473; x=1779086273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=fjn+YF8riofd66vjcc8yHAbFetUD5/T1YzohFi+5vJoV46JwfgrwLnYeCGGr5hO1AC
         UIqWxcyj+gLtmLpv24i7H4VkJDWnNW7gSnNRYEQ3YbwrWxyAgtSdXCr6ZiUQwVo5lfC2
         yDhzlLGKSjpv9ePxng38wHVpXE4SSNgcWFAEtcavzlaN0y/yZWPGq4gkLP1DkFw5r/cQ
         GOLH0py9LnpC+gI4ZRq7j94EHKhyt3ClKWNxs24MNkTVUFdsrpltWBG2tiaQxOx2XH7f
         jlHVD/zk98710lv2cqit+LjD1K2jK1vrFcfsiI2LG+V6kDL6V/dixnoxbE7BkcwWl3bT
         2MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481473; x=1779086273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=YBWiC95zzaqVIATjo/Dn6YGd6+5dahY4UvkvNEcIJsQn58+TYP0/JAQX9tm2xzDE/F
         Xd8jKuhd5S5pN6Wms1VZZyJV6tyQHpHAhgs0qroMCX8dQgeV0N85+JES/s7D3c9NpP5c
         6NA6QTqDLjuezQFQ6viaLw0fkbpLWNvcZKh/LBUGNS3AZc6DL2DTaDpjQvA7RZR7RreE
         wJam4HEFMvBGUqKOb4i057p7FXVJYGPJBrvexLidkAD4qBF0Q1XAV/vQLHCjecBLmlCK
         oTjfY59VnFxagDxz3jB2nrcufKf3JQr4bS5fdKo9MIkJ0LktS/fvvRhu5SCrYDD6Wnlv
         RMRw==
X-Forwarded-Encrypted: i=1; AFNElJ9idYvwhbNfklovVM9zfSxVWMMokEv8ciP64e73EVncRAA7FYoelQPSFzZYXupOSOtmQMoopg9l47guPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6alUlySkfatqa7JKc8sEgXryrhixRRVpNq9dBSpbsRsBFf3lV
	dFlK3g6THTir12bFPP6v9UFWUJw2jWYJDzFZYxOOvBDIKAx3NrkbM8Rf
X-Gm-Gg: Acq92OFgkMNeawfkzyrudrMSAkDb77NK1tgsquAMLBJRadXQSnR9oNmUNd4wZ4riVhl
	/8SKIHBL0GcV/BXATiSBSE7eAzzv++WmGtXEuBmafp1QRuE7nT/23QkQX2z/WWgLtE/YTo9oGDx
	esGWB6TnmCS/TnEbs6VMN/FZSuPJN5AOa5pWyaLI5iTjlHC2XTerE49Lxs05cRQ+hu07GgQoubS
	bKhwbBpcbUphahZIcOyL7PhBqBzC70T4dvI6MYFOWZGuJff0+gBzVC48CpwlA3UMRDpue2ABfKD
	AQWbxx8NIHB7Sl3Lho2O0h5w8FZOSIbE//nHwPBXQ4CMCEtIytBYdlFpXxyHBFI58m0QcdmjSs0
	/lSpIYrap2pvRvVmy2WqEHL82NiSGwDNAdVZumNpUMX7GISfikroG4ous9YTKaLQr0Xwc0xc6IP
	YN8NP00EkaUMMJtc4i7Yofw4M=
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id d9443c01a7336-2bc8634c747mr79731485ad.21.1778481473488;
        Sun, 10 May 2026 23:37:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm86095085ad.18.2026.05.10.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:37:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
Date: Mon, 11 May 2026 14:37:17 +0800
Message-ID: <20260511063719.460049-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063719.460049-1-inochiama@gmail.com>
References: <20260511063719.460049-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_073804_436192_AEA8152B 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The previous version of the binding change only add compatible
string without adding the fallback compatible, this breaks
backward compatibility. Add the needed fallback compatible to
fix this.

Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 804514732dbe..0a30a455b0ee 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -21,11 +21,12 @@ properties:
       - enum:
           - snps,axi-dma-1.01a
           - intel,kmb-axi-dma
-          - sophgo,cv1800b-axi-dma
           - starfive,jh7110-axi-dma
           - starfive,jh8100-axi-dma
       - items:
-          - const: altr,agilex5-axi-dma
+          - enum:
+              - altr,agilex5-axi-dma
+              - sophgo,cv1800b-axi-dma
           - const: snps,axi-dma-1.01a
 
   reg:
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
