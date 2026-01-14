Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8315FD30CDB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 00:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDzdR8Jsel7HXPeh+TEMsJqEsdLPiGIZqt/kGjzwfeY=; b=lgqlrq7VApy8OL
	oW8t6ZON+o41+FyFISBHyC1pC49L8rgLH1vwfmWMyiD2TL7/SUy/d9RWVB57rc5UUMgGOXdwICrBS
	f29GH1XQM7SYuU/d8kH7ep7PL2dJ7S2f+56d5mAoDOBHxIZp2YvWZiA++P16nsM9UWqs8mGZHfzk1
	s6HYVjwE8DwDQkXWcJOTnCft3Wc1T87S1xhrtXyS33sluZpKHviqx08beiVw1v9Q0Ji4I6hg0FRJA
	gvVP4XKubEdE8HskVNE3Hl/QLJTQ4Z/d32IF2wF29jQNtsrUbjMveK0KUE6/sK7p553gerxpbcDnk
	K0jCBylltyO10LYdgoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfp3A-00000007v6J-1PGJ;
	Wed, 14 Jan 2026 00:47:52 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfp37-00000007v5N-05gB
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 00:47:50 +0000
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 41FD5340F92;
	Wed, 14 Jan 2026 00:47:43 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ze Huang <huang.ze@linux.dev>
Cc: Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Date: Wed, 14 Jan 2026 08:47:36 +0800
Message-ID: <176835146982.13007.17884535903013126936.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
References: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_164749_097029_F7237C7F 
X-CRM114-Status: UNSURE (   7.43  )
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


On Sun, 11 Jan 2026 14:41:01 +0800, Ze Huang wrote:
> This patch series enables the DWC3 USB 3.0 host controller on the
> Spacemit K1 SoC and enables it for the Banana Pi F3 board.
> 
> For testing, the following kernel configurations should be enabled:
> 
> CONFIG_PHY_SPACEMIT_K1_USB2=y
> CONFIG_PHY_SPACEMIT_K1_PCIE=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_ONBOARD_DEV=y
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
      https://github.com/spacemit-com/linux/commit/0346e7284c2a1a39befc8711e5bc7f0306df7bdc
[2/3] riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      https://github.com/spacemit-com/linux/commit/4b8fd1c95f0dd0398da1ea373ab67dd3559afb31
[3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
      https://github.com/spacemit-com/linux/commit/2c1c8ee2c30f90b2dc2d6629e364aaed622c98b6

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
