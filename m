Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C44C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKOEFuNXS1z+H7H0f4TGOdB7LZGds+r4SDgnmbCl/lM=; b=d7b0gLp/tt0xAc
	xBLAivUfvTWOYEuEyw/r3aJjvlGYsJkNN3FHn7MwdSCeXjz9t7lHG+3JwJJ/GMeF5jZP/NNpkwS0r
	dBf+9+PsjtFJerbMg3zNLcZjwYDAkytOYwzeECOb/LC/DJXwQ1Zxf5bHvpg8QO6FFa1tCqkftP4el
	iPEZhVOTdtUBtJU+AxBn4xsgWPHE8k8rnSaS4NmdMqFB9jIjaxEIV9S7mzmf97dZzXDCMFwGlFacB
	nqQr4YboBoedT31RCStRWPflsERb+bHwGRcC7cNgkFedLHpo/K7L+LpglOSfK9DjzEeW0ZUCZOWrZ
	15B4g6Ue9rycDDaK5B9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtnm-00000000FPh-2tdA;
	Mon, 21 Jul 2025 16:55:46 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsoL-000000007Vz-0iqq
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:52:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m+1kOkgI98FQiE+DAcuWq4X35VjVpO5tHRUEgsFgUbFtvrhrsefMBWPVJTwgYjE+5fV0gXJBpp1gbzkLvpF6AeABWmZQ2+4i/MS753GIH6cIIegB5isdh7N6Xj2ZtUK2Kjsnc6j0n1wxW4ii9AoqdzSV2w4KhHH9k9EfUoV3+mM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113130; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UM5Ba2zZn2jUtrAyvyggswxU+P1g0c0ysXSo+rp/07w=; 
	b=DzFfZkeFUfwCYpkmUeGmsd8v35kBZqUglOj6+SI2gf7UD5vF7airumyl5fEWca5FniBGzS5UjCMrVLwO6j+ntLnIMNJlc4T4MnscZiraheVUJkDdySM66f++dyoU2olKQohmbqeIgUuBcV5im3ZmKFBE+xMLMlV6i1woQxcw+tc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113130;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UM5Ba2zZn2jUtrAyvyggswxU+P1g0c0ysXSo+rp/07w=;
	b=eBfp+ownzL9jN2No4PU77ruhafYWGEUCiGyGP+bY4LoeDznGVS5Zw5Be1oy409E+
	+uOtWvdumRw6Lp0COF0T6r8nA+dtRsnpQ/OOejf0BcMzh7OURFz//QMv9QazjIaWDpJ
	3AYXh8bCo85NxNHsz/9JhCPo1VL2B/nzHUnDMHCw=
Received: by mx.zohomail.com with SMTPS id 1753113128485171.52271227419624;
	Mon, 21 Jul 2025 08:52:08 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:16 +0800
Subject: [PATCH RFC 10/10] riscv: defconfig: Enable Anlogic SoC
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-10-5740c5199c47@pigmoral.tech>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
In-Reply-To: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=717;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=iy4AnDRSlJUF5GnacD/24Ahpd5pwxuoUMab2YIgFR6I=;
 b=F7m4YRktHeWw0lYcRYa179RBWzXWWpelyXb6jm4svGOwIaksd4Rh1DgjJkDY8+Xh0CY0lJl0a
 dikF5QwDvx/CUizfQLfBP+0uuEs11Uf/bG5kZ8/hP28BqnqK4FoZf+Y
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085217_276817_FA015BBD 
X-CRM114-Status: UNSURE (   7.86  )
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

Enable Anlogic SoC config in defconfig to allow the default upstream
kernel booting on Milianke MLKPAI-FS01 board.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb4183ce871020fb2992a21a13bccbc87..9b096dde47a3a4328cd4c9abae6730780ec8fba2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -22,6 +22,7 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
+CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
