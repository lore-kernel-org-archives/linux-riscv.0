Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAC2C369AB
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 03:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z1NgNoWeaCFlLDv3HMnDyMdEU9lh8XhsnRbZQh7beQk=; b=xFwt02GdGQLcBz
	lev552ZVgr5c0RxP9sa8znTATOBi9CUGJiDGvHQd/XLq9NfvbWLsN7cDItTm6mdGxtki9wohIeo2u
	BLgsHjgxDgY6N5kxL4xtXTUgUFagXzb2JFt3hbQbf/RLPdaFxS2i52V5rLPYFi/j8WiyT9JZeX/TE
	jve3y9dtKxGz4KPglZRUTRn2E+BcpWYEf/Uiw7TOIXdZw3G6SFvuvd37priwLr/moegO8loR5Ukvs
	TiTiqPNGakiav6LnyUbtGQ/bdM3Kws7aBjPeOq84dIIek7Jju5Q/h7ATYNg7gfzrTKD9hNUNXD8ri
	6YAi2A12nTYHDAdjAGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ywq-00000000mD4-2oxY;
	Sat, 19 Apr 2025 03:32:56 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ywn-00000000mCk-2vdS
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 03:32:55 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6FD19342FFE;
	Sat, 19 Apr 2025 03:32:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Date: Sat, 19 Apr 2025 11:32:29 +0800
Message-Id: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE4ZA2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NLXQNT3ZSSYt3knPzkbF0DI7OktOREc9NU0yQloJaCotS0zAqwcdG
 xtbUA00Pqnl4AAAA=
X-Change-ID: 20250419-05-dts-clock-026bfca75e5b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=BRF5fK7Un10wZTyZfTXIVd9zabiIA3JZA0TuwSgl7v0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoAxlURMkpdvlUF29l1uf4AJYDU30V5PsV4KVww
 i6zxWd3AIOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAMZVF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277a63D/0boFdPgWrGpZ98JT
 qL0/qzJXF0bNOXh5MepNrUxH9zyciee8/3B78OZDmfuL+JKsRIpjCMjqrnzWarj8cKoppu+Q++q
 TEwoBavC0+8CfIKKLcU7NC70gwg3fEBXJot188WdhWlORBsj+zOkXuDBWRTtK0pO65vCjbLND2F
 oxmEiUE+sjSK9N7sIOu27fclOzRvMnTzDGLG3QcHW9UruGkuyydnp+e0bR/av+1ePIjEu9ENsFO
 LltyeMvyKhbTdOU2Cu8Iy62JAunsEAP5tEeWM3Oiq2yV09dNj2YJKGcFsoftJMd+0F/8SZGUWvp
 rMdWT01MfmWRJzdMQCQUaJmvUtXH/mlF3EGItJUL7XXdnodi1n8brmuA9qD53Tee+qvt48PvlbI
 F/WBLReiKyDZ2+qi8Ma0KkH7dueJIgVz4cXRRVzF1UUMi/9unytB4EKjjUoSjyMkU/IAfZ9tbw4
 LmGL32qrRFx48LD2vDBV6KDLfkB/0rdeiX2B6YoLZyZtXW5gSGwhBC1REv1ofXWiUTYN6wQrU/t
 Qm02SVjzZTXoSywutIBOPwb5IEWI0DpvckPfdmsBxmUL8KwHQ15KGt70V5Mne7Rew7OQiotBBxy
 EyWr0CCUKBv6wr7W0j5J7UfQJIMkb7k10jF3VbkZFxw5mJF67XUwGtzHFnvrO9C4Q99Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_203253_767338_994ACB47 
X-CRM114-Status: UNSURE (   6.01  )
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

Populate clock property for pinctrl and UART controller.

The pinctrl's clock dt-binding patch is still waiting to be merged[1].

The UART's dt-binding and driver code has already been accepted[2],
so we now are only sending the DT part patch.

These two patches are abased on SpacemiT SoC tree's for-next branch[3]

Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
Link: https://github.com/spacemit-com/linux/tree/for-next [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      riscv: dts: spacemit: Acquire clocks for pinctrl
      riscv: dts: spacemit: Acquire clocks for UART

 arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)
---
base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
change-id: 20250419-05-dts-clock-026bfca75e5b

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
