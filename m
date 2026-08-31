Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29B4C61DF0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 04:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pitMBbhM89x/mrSSrQ6uNKtcFAedhZGWzvyPO7FJY3E=; b=eKIYT2Tr30zqIe
	vRVie8vKjTZGzeqrl/2zSE0WGq4QrSl6Rjg3/PbqHqDNfop3/OPy25yc9ZQlg216GsHG1M1z2VQ0C
	gJC/Wtmq07EMUDEBSXnATxytjcb7o6jY/QSL+D89B8iLPOOSb3hjvTuo8iI/4Z1DUgXNoFZiD+KRe
	EfwPSvHlckq9C2rEtg/LrjRbRk/eHe03lh7DXRoDtWxHn7xG99vR1K/6PjtoD/JnGb3fwbqMk1Or/
	lLw6wINkIG+0m58HxGhYndD1ZqaETldZqHQ4vaJ31b8BgQlWYc2ujib8oFDaXfK6eo4HrEopw/EHe
	s57LqafiWYp/VYDfwimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tuA-00000008UhO-0Hig;
	Mon, 31 Aug 2026 04:45:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tu7-00000008Ufp-1jaK
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 04:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=KX61QIrNDMGQZNkhbujvGPtXrkJ/uJvb5+zoWtNRHjk=; b=0X5CSn3bQBiJZlBdrT/fLfEcIN
	HtfA3z/+uSh6cLGhejo+QF7vdKbYAB0AoPqUKJisVFiW2Jor/QZhLSZZg/F04bLxjQvCypORBXvL3
	py+sI8M1m3/GE5W7djluQan6srqt96N6pn+bo0onhPT1diO8YTJwWLpavSpbWAZV1dVtb9e0fRMCx
	3NCDbyaF1gy9dLoJkiI36lHnHm1aEeYh5oOmOnx43B+qZfCdE9y4pOzi/a7e1c5GVucujXP4F2IKO
	EWlkiaEQg4Fl/tZvRMz9GJqcbaL9qRZLjDJnkE2WB1K9rIJ+jcAcCsKuyxQvxwtC2Cb8X9znGkeHq
	iiUZTFfg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu4-0000000ApeD-2mOd;
	Mon, 31 Aug 2026 06:45:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v3 5/5] riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3 Pico-ITX board
Date: Mon, 31 Aug 2026 06:44:25 +0200
Message-ID: <20260831044540.3304350-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_214555_475074_2E0EDBBD 
X-CRM114-Status: UNSURE (   7.69  )
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

The SpacemiT K3 Pico-ITX board has a RTL8852BE Bluetooth and WLAN
controller connected through PCIe and USB. For the WLAN part, enable
CFG80211, MAC80211, RTW89 and RTW89_8852BE as modules. For the
Bluetooth, enable CONFIG_BT and CONFIG_BT_HCIBTUSB as modules.

Both also require RFKILL and RFKILL_GPIO.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511b..1bc79ba2ee649 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -100,6 +100,12 @@ CONFIG_NET_CLS_CGROUP=m
 CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
 CONFIG_CAN=m
+CONFIG_BT=m
+CONFIG_BT_HCIBTUSB=m
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_GPIO=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
@@ -143,6 +149,8 @@ CONFIG_DWMAC_THEAD=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
+CONFIG_RTW89=m
+CONFIG_RTW89_8852BE=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
