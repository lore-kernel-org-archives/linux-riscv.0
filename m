Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855EEC624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 04:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hY8S3EDQovRTlFosbvhrc84VE3+r+H5O5LPDDLY0IHc=; b=q3siFGVw4MkkmA
	7DgVb6eldmUturyPbuLTh/8ifRcA0iW15wqKWr5wbqf1Q07489ey6k1YGv0O/h2c2BU1UhMJOzHtn
	7UCl4k/6HpRhUM6zO3yie7ck9Nc9q+MWg/Wn7K/6FjNJ02EShcehydEHwqPF5E2PsXzOVyWcAGkm4
	SMS+zG8FCQpuR6sDeoxxao2bHQDTe/y/tBfZgWx/fKTkv7LOFEQI3lFV/3rrTpsveXtNBbFd0hhl4
	OgxHVBRxLhICbC3lAZK96sucUsDto0Uk35XyaTHTv5NRgCh9fgS4KpZnh0YGbfmAqd1Lxrs+dbk7N
	AZYfI+69vVmn6yQNVg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tuD-00000008UiP-1geB;
	Mon, 31 Aug 2026 04:46:01 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tu7-00000008Ufo-1nmc
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 04:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FjJnigpBeHIQ125/9YAb7UUdeqoXLLzRYVllv9SQ/2Y=; b=YzEAmaZUONWfIOcm0Rfr6LmhL5
	pm0LIeefxErQuG1LTBIoHJijnOYdNnszYJuXeEu1pN2nLXZ8GfcXio3I0bAhwslfxvH64uRGYBdfG
	Qv4yRTNzR32iX463fYdcLylcj/lbRyKDmHYpgJxWqPnPBMDMzpgrHI+iwsEnjmm6fT0EWEzjQ6VAg
	po7JUg9UdWwUESvVSkflVvgpa09LkKKEcPYhep4I0LoWKaTQFdCJAt6tvlU3eQ4KkZzTlZQUSvgj4
	abQFeWriRge2loMNtWVgS5KmtEGN5zhMZNXWszMrdCCsE1pMe03LtA49WMqPcOhkGIyR6DqTsuzuA
	7HC0nkYw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu3-0000000ApeA-45VG;
	Mon, 31 Aug 2026 06:45:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
Date: Mon, 31 Aug 2026 06:44:24 +0200
Message-ID: <20260831044540.3304350-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_214555_488255_4DEF99F1 
X-CRM114-Status: UNSURE (   9.43  )
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

On the K3 Pico-ITX board, by default the GPIO pin that connects to the
RTL8852BE WLAN enable signal is driven low, resulting in impossibility
to connect to any network. Add a DT node to expose it as an RFKILL
device, which lets the WLAN driver or userspace toggle it as required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d3f256dffb4fd..dda420900aa2c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -44,6 +44,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+	};
+
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
