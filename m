Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6351C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3dt/kNrl6h/t1/4CbebUAclvapA7srMneDnHHWrLpiw=; b=3EdgSfocE6NFbs
	73+OhmXqmL4XDJM2M0bsW7F9zrEWjuQHw6z/DglJqMPQ0te1OkFzSGzB6Q2Tk0SevYmltunQHBb4g
	mS6PEpCQ4N2/SNiyZwPKtnsi9IeT7+AdzEQDk9lTKLwZiFRQsa+YvvuF/AH9Z53Ll7/XWMFI70bsd
	B7VkIDMZa8aml5Ywq7buEnLVQo3kbqTTjbFMUCoturAYvfxlQeRfoF85Uh4HV3BvlZmcwpr/8KTsj
	NVridNJx6F3QfF11U+RZk4caR4MehkASfsvuBI3TS3US4u7QSW+xVX2EWAIB79CGtfV9ZiAgtT7Tx
	PfW7IMOZ3L912Ka0Rrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwtR-00FC7m-1J; Fri, 05 Aug 2022 12:57:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwrv-00FB1b-Oh
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 12:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659704160; x=1691240160;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+/4/f+QmTKxnEWDI54MXjjktDAKqUKFkKTc9gwTjtlg=;
  b=kt0tHvy7loneY9vNjjkSRXf3ozCpkqooGvLO18x0whYETTuuKeETLMbt
   Rs0jl+clCF/jzKI9MzfkxSHTMnJxAn+FArO5AyE7aEXfkg2W5oo1E9Zb/
   GbzVq8zwHHoect5zJtbUdtKAoNse4s8yHyomFqryVKtQGO/ZKhN1DXSwp
   /w3RnTEUcuTjiXj+/ml06Wqk9tOB2f7YUdk4yakJX2JwfgMzXArR6zXa2
   vuIYtYTctK9Sd19Xxv1/nr2iWWux9BaD+DV8F910mGBAks0A7pE/bloOF
   bp/a8TRD/0LXZAXj0DN/R/rBov5/u2Um1jehzy4GIFb6R/mQ1XEB8xhMx
   A==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="175067540"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 05:55:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 05:55:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 05:55:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 0/3] MPFS mailbox fixes
Date: Fri, 5 Aug 2022 13:56:16 +0100
Message-ID: <20220805125618.733628-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_055600_068526_1608B59B 
X-CRM114-Status: UNSURE (   7.50  )
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

Hey all,

I spotted a couple of bugs in my mailbox driver while developing some
new features. None of the features these bugs relate to were in use so
they've gone unnoticed until now. The binding screwup is unfortunate
and I don't really know how I misread the register map so badly.

Jassi:
Not sure if you prefer developers to add a CC: stable or not to patches
so I have left them out, but I would like to see them backported.

Thanks,
Conor.

Conor Dooley (3):
  dt-bindings: mailbox: fix the mpfs' reg property
  mailbox: mpfs: fix handling of the reg property
  mailbox: mpfs: account for mbox offsets while sending

 .../mailbox/microchip,mpfs-mailbox.yaml       | 15 ++++++++---
 drivers/mailbox/mailbox-mpfs.c                | 25 +++++++++++--------
 2 files changed, 25 insertions(+), 15 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
