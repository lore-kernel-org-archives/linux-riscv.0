Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B3CA5FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qty1lM+Guww4DjWUKRgvHfAxzCIOeMAYcD0YIP8SOh0=; b=KBffBOiWqA5oKy
	ajc5CbSE6CWkfUxuNNX24eKOlyY5TW+QlMVzsRjxvaYVw8OMOx+veIgUQ8mbNqSn8Y1ZfBo7Mj7fP
	ntR46OUtTUlOS1lo4sByEM4OmFnJoedygE0Obj8oEN8QmnPh4S/KN3VRz20Z6UAPOEoDu46LvMg4H
	Hz3dZVbr9sHgTVUe6v5/1xSQFbfvb7JmZuCTquaVjfHQK2pMgqqp9uY5lgp/YSLd/Pm7ZSUS0vRcW
	8g75Olr7yRDt9PDmdE2c+VuCGAdMvARxvWkH1EtqbhI02k/ha5xTOfy30q0ke6l6zIxSVGBDuYssZ
	/STXiuECqOzYH2M33SAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf9F-0000000G1NU-2Zfw;
	Mon, 05 Oct 2026 09:38:17 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf9C-0000000G1Lo-434t
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 09:38:16 +0000
Received: by mail-pj2-x2a.google.com with SMTP id 98e67ed59e1d1-3a4bbc51755so102288a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193094; x=1791797894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=ex2JzAKrTCKasPjdB7RclNLjf3Ec20dX/tD51FOtOXYA5mpIvSRGQqGhDp2aMi/tu3
         t8/ngdpQleNNM4qymUH5NjhE8KiKoZogLwjwvpFCwNBIBRxlkY4QZHwQh1gg4zTg21Lq
         klqFfcgIxCPaR80bfYlZ48dBMvb/L2aCpeybim5cW6FGbKDWs4hpn8NOg6Bk+jgSBzSE
         a8kOPjrqcuXfu15QDLSXoeDb78txMNKtA+w1jbgHqYbHI65fmLlKG+OsTLZDaqVEP2Pp
         9kQRtr9n9L8XHFkp8r1PrMzNiINYMkdFuPn82FMjI+kGOEXLtuKctj+LurUUh04n5IGr
         b/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193094; x=1791797894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=n2iQuJRbWBYykKq0gQKgyLDcyJCoWcIk/3PZt7Tn2jIFwBIv8M5D1XA0jCgz4tnUIo
         uuMB6SCnNXunZwCrFk1D8Tcsx4+Rwd0VMbtTkoDG4rYoFBW7guNo3f771HuPiZycQp7S
         5tNXSfdoqDU9zFRkRD37JR8mhI7SK0MwWwXz2ccj5LMpbs2L+uIvhBI21+h8fQHqEQku
         2zxfugZDBqjWcsNQI7YhU2usdueHwRqllhAUuPXDm5X/P82Db/B0NOuK/XT+8aRt5eRQ
         mAVITgE6bISdwXelUZkSWoNivEgf/UcU4nfySj2kbdY0FnGzI/IYWEUS0cGHLNndCxBm
         mq+g==
X-Forwarded-Encrypted: i=1; AKwUvBz8FMkXAqBi9duTg+BJMEy7lnsK8Gkl5FDGNfaPuONBCOFz4Ge9AdunbYxejGee7LSHhthahn8XCY7IXA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJC7bjObUyKBoyz41JlLjtUQPgGZeV7SjpQlK35MTido2N8axlT
	URncwvaMifySdqvya+z2VOuxyPZMQPfxTtrCe4SSx0BsztJMDNhsr8N3
X-Gm-Gg: AYBFou34syyiI1EZQJQKRITJOC4uGLdE3EMxEQPd6rlm75aGQI3r8PYiememhOAWxwB
	dZqSjUTOT9OhpQnh0K1QMFVn9YTqBZK6KmQxBQ7Z8Bw2wOxyNQ7Aq3xpf6cFMRAsT0rAquvh5pA
	4s8E9d30J9LRbfIXxRfTrfz4ggAjExJ9NlRShLP0L85oIdHNtaibV1gJMvI1mXbgSXU6EV15hUy
	yWrSgb8bbkWbvKBwWcZ+EoQsF7xpoq1/D9I7/GSLy64NCCtWblPTUuW/e6UBHOMSkXa39gBIkpx
	2mQ5gLzAWXYkxDG3kqw3AR/o6s33UB2fx94pKtIAWHW0Ml4MqxhueDmWVbSb9mYQ1/LQvDB3LU0
	+uYtlcps+oY4hpuIeFuNxy+ZA9h3XuuPtQMFvHGQDNP5EfgR9pSmLnyd/Xi43Kt8Aj3Eyhtp3kg
	wS3x9dfCSGZcKQt47MPJ9U9aCvbv4gPURorzggIuje2TKcsUyOHMhKlcjmVt4/0G5vTr/P+ey7t
	SucqEnSJw6B/W/BFcSy5WcAVA31nidssmjlfd4a9WJPZ/BGUTBcTgXlnZfAT3lRtTIPBg==
X-Received: by 2002:a17:90b:4c81:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3a6f1d2701amr12943495a91.4.1791193094249;
        Mon, 05 Oct 2026 02:38:14 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:13 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Mon,  5 Oct 2026 17:37:49 +0800
Message-ID: <20261005093749.645014-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_023815_460042_0138A19C 
X-CRM114-Status: GOOD (  11.22  )
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

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..d2ec70fd515e 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: ethernet-phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
