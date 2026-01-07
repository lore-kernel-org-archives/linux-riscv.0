Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3554CCD585A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R3eKNgF7NQoqCIDDuSbSYG0dO9ou+j3kXERETtwldQE=; b=3Uv80/LmKQ5Omx
	uT3/mQrpxKJEptLYXHc5wNZmRoyXh3i9XdBW5VAgGLMyWLUFfSRBlB5N6dG+ahViSxEauO0jCUaXh
	ioIDQkCWTRoj3xlaT/i0s22h4cqV5r2U4UkJb220KBbmkO06favNr95plsGLRrMzVcFwndbsVN4ze
	taCm7ZJrhFpdj7qI4j6xbD5JOkrzM4X2jjZqRVj9++Bi3kT4Eiq9zBSPhvPmQOU5yE4r8iW9VDrsA
	79AN1kGDygKgYn5RMrQNEhZRzB4Rc4J539RJTM0zcKhtg76NXHI0yeIK56lBxbyB923PoXpj7EneO
	rVlqr81JvNAWo/lZ1tZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRji-0000000Epa5-31K0;
	Wed, 07 Jan 2026 11:29:58 +0000
Received: from mail2.viabit.com ([65.246.80.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRjg-0000000EpXG-3R2b
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 11:29:58 +0000
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dmQmj13q7z3wfb;
	Wed, 07 Jan 2026 06:29:41 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767785383; bh=wOuoDMbBMwNQWUDyFD9Ibb1QmbRGam09Jbve+PNUIig=;
	h=From:To:Cc:Subject:Date;
	b=WTCaCBzL8vLnF9WQeURYbRKbjrkCMCMK+hA208w9MyNntA8dltSfAYk3M9/9Df7Yr
	 hTQ2H5lJ//XdftYXfkwxJRqLEoySb8v9DKRujx3xw7dRiRNBdDZZtL2g7wk5Kg8MwK
	 0WezSF4ZwchPHuPh8xkvWEloyHz0j7Z2UpbaozOQ=
From: Michael Orlitzky <michael@orlitzky.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/1] Enable hardware clock (RTC) on the Milk-V Pioneer
Date: Wed,  7 Jan 2026 06:29:21 -0500
Message-ID: <20260107112922.20013-1-michael@orlitzky.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_032957_048497_6B3ECC0D 
X-CRM114-Status: UNSURE (   7.32  )
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

Add the DTS entries needed for the hardware clock on the Milk-V
Pioneer. I was able to get this working with an earlier (6.1.x) vendor
kernel, but it is disabled in the upstream DTS.

Changes in v2:
  - Trim extraneous information from the commit message
  - Link to v1: https://lore.kernel.org/sophgo/20260105120129.58895-1-michael@orlitzky.com

Michael Orlitzky (1):
  riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer

 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
