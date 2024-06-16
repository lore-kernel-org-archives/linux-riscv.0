Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B86C27C6E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOLOr0DiDSgalQtnFCQQf4Mtqe6LyugI4KElhDTGbec=; b=EewMHvOEgGOR0h
	vzb1sETRjE5ppq8ZIVfARSOA79HNQFNjNdw42lryeuXzSIJxUizkZwfAU57HjdRAJrGbdF3PDZiUW
	vN/IWBFlzLi9DmS2AIYngbGKHX1GIFM2JklzDu8OOKgiZuwc/a/8SBHqo3YNhsfz+mzncG+2rM6Dw
	u1km5zZlUAzc71oR0UaPMwiSpMAScz4SUJ/ocbkPZotWRi95eHuU3AWJgKek6x0LyaHRV97DFBC0U
	fRR9FyiqKXGsRg4fc3OGmfEy3SvR+nD1Ri6hTbfVyO7vsnFzj30jIQGU8GyZXBd1/ex+RMApkiOhe
	lwaKbszIgubKBH1W3D3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZN-00000007y6o-1Qqo;
	Sun, 16 Jun 2024 17:21:33 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZD-00000007xxy-2UKl
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558481; bh=zeKC3Oe1sKju5vea7yzmfOgsaAN9lHVzkh8ycGLf/vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HkzPbmD7s6YHL/D3EqqWpqvW4N61D1PBYyP21oFlaa0DangknigrWTxkmCaWoMqgd
	 PhpImyg3uzn/A8fWUlQutPVsDfenHaE2HYrDpjZ9dF+1cnqqbLBE0t4JOc7hmd5Eyk
	 viScshcInG6ZbLevh33OL7cFM0D59TuC1GnqrV9g=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558479t9pmmv511
Message-ID: <tencent_CD84ADB1874F47D04EBBD51119173CC62405@qq.com>
X-QQ-XMAILINFO: MziGzrjZeogZ27NrJX86U9jmp3/uR2WhQdNN59aMjNpQON5Q8za+/F7sLh1Hw3
	 68tTGDI+4ujTQB04ciQCZIDqmk5l0FgIz7LbadCoXNVt4MbdGSzeVw5sw0p7+W9jP/tnOz1ijKX2
	 yymOGrxBVmW++5Dlp4bpZOOpIboV3Te7DvvSydWKW5hdB+f6O9O7JLb0duDWH9IwUFe1ghXevd+E
	 2p9dJzWImyecsjCIsgX3kkW14grbuplj7fdgkZuolIIpyKBbwEqG17ZFtSwGLFVkYyPe2QnUcReg
	 Nhd7VbCnrgu2Q9RCdahd8qcNgj03uFRba26bDP09Olc0sR2eQYSYzytI01/Ns4mlPh5owihYJSL/
	 G3ULFnShSV6ndFfa1lx74tipKESOiplwjU/ImPfilq2L1aeWFycQuUcio/lU3zz6eJriG9xt3yXd
	 dvdTisTuLI7XTvONtGY1xY2ExXxplOVEJRs5ODMrsD5MCcbQypY+8eCuyQqs2lUIcVN7D6YuJrdz
	 Vk0jxsvGtmNKfCmunBl6VSPgYGDPazV6MA80LcJqf/IGxD0PyOoUJeVNaFj3dq/AtpflQg5y47Ui
	 YEwJpRllMYTo77HXltI7f+RsC4hSlhjzkvGRDATwKCX3WEay91kmQkEqv5QRdj2Eu65334LgXyN/
	 6KmZP1k8Kc9+fNe4wpjR9XhqldEwx1dn0Fx3hegHJbOheC3UmJf83SIMIxX+PBMr0vp1BErH3RnD
	 jfz/a9k34ylPB8U3O8eZC8fVssocE6wWsxVCBv91Q7VB3UdxJJnlVcDrbpgGO/rwKpmWUthdmnOc
	 FUMgRcvOiTsPWQz2Klt9gl3e6Td1kmog0s5XTYzQ2dkTDFi9leD+p26OiKY+bKNqVKkNc7pcowCi
	 iTqQv/zIAluRWXikuNSH5dLzkqEr1TppMuJ1ISsJWoO16rsZQq4d/o++9ULOQ+JfXcCFb6Cu6hq1
	 TKXk8tVqLfxXv19rmC5A524t1CeqLW9xchlDewimwA+cK63EmfN3HP98gV7BMzX+MHp/1dKGOs6T
	 CQmN2bCTO2XrP3ipdtdxmzN8cDo9AljyrAmES/ev8FXRPKSwia
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 9/9] riscv: defconfig: enable SpacemiT SoC
Date: Mon, 17 Jun 2024 01:20:54 +0800
X-OQ-MSGID: <20240616172054.3074948-9-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102124_062302_A85C3B75 
X-CRM114-Status: UNSURE (   7.62  )
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

Enable SpacemiT SoC config in defconfig to allow the default upstream
kernel to boot on Banana Pi BPI-F3 board.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8ac..a33e8c463c8a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -30,6 +30,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
+CONFIG_SOC_SPACEMIT=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_ARCH_VIRT=y
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
