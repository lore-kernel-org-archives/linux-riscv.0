Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A01CD4F48
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 01:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dJFEJmLkbkYnJ7kjQ1a2G5O0KdEA8WYx13/1+oWv0Y=; b=a/oQNMseHx2kph
	Iv/QxO2wq3RqzQlndJ4LYuM1zZowLk7sqHDN79vc0exhNNURU/yVRNPi4Tltcmfsb+LHrxhT4BwfW
	BkBzVVKl2xA4cs5M5Urt6Sgrre62IabJPrd7iIMw0qqpuyGNV8lXW11U+BRlvhIqs+Im4L+eOt1HT
	za4XvyyAYCgkfq1oK/yWJ9TQn8EyK+cQ4l46vuYLmfFHrTUvrCEpK+7drFNtsDM8bGuhrRLwojphW
	R+m7PbuXjFWfy5Z4pRmwdNXCIb4yo0LsDEabcpTCvZwavBS4ekxPioaPAx5Ha0heftHPx4AViClrW
	QPZhW8u1Delbnh6xPZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhC2-00000006zn8-26bX;
	Fri, 15 May 2026 01:18:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBu-00000006zgy-1G25
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 01:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE027443CE;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B441FC2BCC6;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807892;
	bh=jjQnxfRGET2wkjQ49uKQqq5EzfIY6g35fjsnjyMVD4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OY+pFhx5lOG86Ao5tfC2wtNj6CF2cBACUAsOrpG69Pz+aYYebjMhdfmIlOa8IbvOJ
	 umTOSEzROcreQEP8fktrctT7MnEKs5b9gr7aI8ZJJ3R3Ks7BLHANOEfRSTL+xN0vJC
	 LXnvNK4khINUkoNB0wFOenvDQVarwWlGNzOHCLiq6KK1fE9Lt4N3LU1qquD2cKjfSn
	 26R3K4reFS/Uarx/tsxXV+yLk0wBDSFt3VKczWxgtdg8+zIYFDyfxwmBv40FRcVvSf
	 QwbFl4Rw5OSEYwEUwI4YPMRmru4yVO3V6SqeQ0xHj+jDSO3/FyKjr+g9F8o/9sx3uu
	 Qmke8Hd6XKj7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A164ACD4F39;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:17:57 +0800
Subject: [PATCH 1/9] dt-bindings: vendor-prefixes: add Rongda
MIME-Version: 1.0
Message-Id: <20260515-ultrarisc-pinctrl-v1-1-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=871;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=9QG7ZiRK3RyROMWf2rb572b5ZDl0GYAcQWD6s3msFM8=;
 b=BmYVDPTGabV641x/qomuXrXxvhNW6sr86M4t/0nTP8YFuQsD95smGsJaFll9aSWKoJtQnh7cU
 5tJXdszmLHLBQn3ku83uxnGymFuIGnfBD/Gu4ylCzy79lP6l68xIEup
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181814_413086_02B54C05 
X-CRM114-Status: UNSURE (   6.77  )
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..04e593c66c7c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1407,6 +1407,8 @@ patternProperties:
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
     description: ROCKTECH DISPLAYS LIMITED
+  "^rongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^rohm,.*":
     description: ROHM Semiconductor Co., Ltd
   "^ronbo,.*":

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
