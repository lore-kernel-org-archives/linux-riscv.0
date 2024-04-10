Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9873ECD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ah15HOnYhXx6Xo/y/VFdG2wCUjU8L4oiDsYpAFyb34I=; b=GD7ama8skw7e6m
	k9ECuokaMvWK4LBj5rIu3iFaUVcpW6SKpDgRcdEp4oWSIXQ8zvSQMjT7j/Q9dXlWvvzu/4GNvfrL/
	qg8FbBYmqT14ByrZODOwmaGCYZIHYBX9KcDLgH+K0x+SLilAjIuI0inGgSSLcitpNpKnDh9KnA7Av
	bH+/aoLcA8mIvZQcNAtevfTXuqkjYbtGq7B0E+V2lFCoszNKUCHt/5N6W47sx8Fr4MVRvjdtkCQRY
	kYhKa8oc5rR86pk0b7MuBdXjPskylNanstfV/wQR/apx5gkFXtA8O9b4lJDhaaEooYOPf5S2+LRKI
	UMqifA8KZHy0s5MGTIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYU-00000005Plc-2qGF;
	Wed, 10 Apr 2024 06:35:35 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYN-00000005Pfx-4BxN
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:35:32 +0000
X-QQ-mid: bizesmtp86t1712730877tdxfamr5
X-QQ-Originating-IP: XMC/Y2Cff99dY9PQbikRSBmS4897mos9i3ewMrbtgHA=
Received: from HX01040082.powercore.com.cn ( [14.19.197.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Apr 2024 14:34:36 +0800 (CST)
X-QQ-SSF: 01400000000000B09000000A0000000
X-QQ-FEAT: LE7C6P2vL8QcpsM0XxE6roUsBBlPUMTUXBLuXMBDE/CETF9FiznKeqh03oOnY
	M0Qw4nvC45lLsSp2KTiohwk3Md8pj3He3/RNlXxl6qsh0VZW4nmsTHqOG/k3xMHNd+98SiQ
	4AXDYlAwyljrezLrsEZCfyWKrbPqoulb1KXTR1rQKAppiYr07C7dlBAyw57vIurjQLngyt/
	mWGF4wTTzBwIklwl2uY5zCZqjpI25KhEW0TpNbxBsXlq3Eui2FcbIPh2ZGKPLmEvkvVilZJ
	Kslifj+HIXWgKWM9cQN4mPlPIBjkhX0kNw75PJ9MtnteXeFSK0+0etopbWLj1yCT3SnBiSB
	qqAuaG2ieslEQ5EMUXnFavqyG5C7iF7EIzgaLWzsshBDF0UVd8xsaRVdaKI41F0afh9Sqkb
	7XD/9mG/m4g=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 1382288310512996310
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: [PATCH 0/3] Add early console functionality
Date: Wed, 10 Apr 2024 14:34:29 +0800
Message-Id: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_233528_355050_3D2323E2 
X-CRM114-Status: UNSURE (   7.79  )
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

The following patch series implements support for the early
console on the RISC-V platform.

Jinglin Wen (3):
  riscv: Support for early console.
  riscv: Support SBI as the interface for the RISC-V early console
  riscv: Add information for MAINTAINERS

 MAINTAINERS                            |   6 ++
 arch/riscv/include/asm/early_console.h |  23 ++++++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/early_console.c      | 108 +++++++++++++++++++++++++
 arch/riscv/kernel/setup.c              |   2 +
 drivers/tty/hvc/Kconfig                |  12 +++
 drivers/tty/hvc/hvc_riscv_sbi.c        |  29 +++++++
 7 files changed, 181 insertions(+)
 create mode 100644 arch/riscv/include/asm/early_console.h
 create mode 100644 arch/riscv/kernel/early_console.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
