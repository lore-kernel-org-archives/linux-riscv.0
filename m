Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2B9CD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRjln73GQwZXS9BSL7/i+UI4gcLTfGi/vO+oFpXq+o4=; b=eCYmr1eMjkkq2U
	TaEjAP5uMr89AGrsVdpHvo0C8GOrn6o4YBZ5Q1waoVQ2uw3QtmhRjoPCUCAA0uxWeFoBa5rEcU4Jl
	J0L9mooZjju/n28gu2XYPRqjhB9+vvCcNk2OERanndAh0NfNSeK6mEycyqAs21PL7U43PwvUTnCCj
	dtLCCqf2AorusEF4zl5cymhV2nEoELHt2Ac4bdGJH/X25X4erOpjU/gVnFur4KJTBb6ZtH8eP97HJ
	PWZPNKpa4HJVsX9uj0W9ncHYLjeuiV4sj+9SGri0npT6nf2h7dAGLlgCSoD6knQDTw3nG4m8o49ou
	7oyYFr6SUuhBbF2MLc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVTx-0000000D1yl-3tvp;
	Sun, 07 Apr 2024 16:35:01 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVTt-0000000D1xj-37MN
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712507693; bh=k2XCyj2HtiyDsP/ZIm+qg3j+A+CGArLiMKptqsaRcss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BFKE0XsPMCmRMqJx6W7Ufa8qPAgA3ypm4lDlhEyPt6cu0kz6USUeLi4jdCpfyTrzk
	 C/fpkv2/9nZuthmkhnkGBbEWvDBWsRxcLi7O/c+1f4WsT51iHUIA/aQ3+5aMVdIArC
	 JOK1rL4OG5WtRsu7djiCNT0XlAUCROoSTv+taMQ4=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 726A94B5; Mon, 08 Apr 2024 00:28:38 +0800
X-QQ-mid: xmsmtpt1712507329te5faxais
Message-ID: <tencent_444C9BD6510E173A262A84AA919D0F449005@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujUM20gunPaMcDELA5CKx/0jtaWZDjXoyAIsc/x+iKqTXBOy9PIA
	 ZOq8R7uN+6n1l4+1ybvkutPK0qsTqXW9JncdjaYy5yfxUTt86vJ0M75UwcDJfllnICH7HUEjDvd4
	 xSzl7HCR7aJiG39kJgcDEqh0KqPV7ctYVhVZfOtaNeRcRAiGJLeScddDYxi10tInAGbPXRYTHXKs
	 5Nr/3N9x5sOMHOJU7wCVSIgeudORwZPRmEGnGqo/doLXsOIJQXaTRskVnhNX8cNQltVmVsot2bVC
	 tq/iN7O8KJuFeOvRZSVZAXC5xTnKwL0roWq1xnbFHwVdaWgnNe1FbXXNRB7rAt1iDp/Nvgef7ftN
	 pABhkspOgU7m1m5VWszMymI3eNRd/m6N0jW0arWtkAKVi+AwbivAvMPaEXsHUl4knouI47YcnJdZ
	 +P94hdDcGeZn/9kJD7Mkob8ukzcHGzab3IBo8ZxgRX1ixsxUq4soLbFGeC8AW67H3aykxvFtvOl5
	 JLzG9zdew2FHl6XhS/Bkv8eiVjPTeMlcwutYUNmZDqWsBYYjJOQScdwC7/i93QYnxaHzvLroQZAt
	 31UBGNpnZqsHLUyK8tATC/oe7/6RUtA2uKiZevVXI8Nub7SUQ5cCeZBCqmEEHWt8pOwTimcNT8eh
	 7Ejp3qFMJvPrZMDbPZFpMCXs7aZZ5wHfOFcpnOVdWYzBsFxgE0SBPZdsDKRdr84TIHJaRVU5dPUK
	 2lkKoyRW6qCWWbEjRZ7NlTjESIWA5IEvsUoqxxv07x2Lgi3HLzUluR41cctwhJFXT3TmJt8jxsRQ
	 lZyKs8DvkHQ1LAoy+1d4B8eG9zUMhvFu42+5L7m+YKrPhCQ9W1xeg+oU6g96T72x9dhDbVphIkvc
	 SFVL8FnVuds7SDh03vzb30MScnoEjSPCMHJqpmVHV5pN4/vxqW8suRxkdMKu4/FH130Lz9oKEPmC
	 INDInv+6GVRdpLbykoS/HGGzYru5ewrCOzIBhA/i+PqYizwhDZ7F7nTr9oAjDiyg1evVnylIa+7q
	 tz8A3i55u+1+OT5YL2NUCOpMBu2a79ANzv6sFhWuTzI2VAJ7CDIsonUjU0Tbs=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v8 6/6] riscv: config: enable ARCH_CANAAN in defconfig
Date: Mon,  8 Apr 2024 00:28:35 +0800
X-OQ-MSGID: <20240407162835.3199788-6-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_093458_132240_FC4C15DF 
X-CRM114-Status: UNSURE (   7.30  )
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

Since K230 has been supported, allow ARCH_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc0ec2ee13bc..27bea8296b9d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
