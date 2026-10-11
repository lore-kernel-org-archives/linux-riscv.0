Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00F8CA9EC7
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lTq9+o352B4JS5M0U4Wu3eeaWZCOFDvgFcUG7zqGD5U=; b=K6JThttsCRGqm1
	PWpI3kubMzO9yYsDChsQ0h3aHws6VjrRJNWg3FR4GDWgcUB8H3ksVM/eH5UedeXpJmQmqUyxF7L+H
	Cdui4hv5zzcSME6/giqE01PsLhkwQLCnO2FHXozrfm5iGlokpNOFVFzcIXqR7UiFSEEtz2RmDvByY
	SFlGq9fTX6/OYHPt2GUSApzdASY/swaAv0N1zowSrjY14cDOY3NgLDtfKHmGPpmW+jlnxhtXjo6k8
	Lo2PDwt+/ZGkMRnfFEDMB3YByP/9XvdCVAFmsxMeEHhiyqfz2RBdBzycJLSujFhCfIChN1T4c9MnR
	i8LmaHR8o1U6BYXoezvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtln-000000094Jn-4Be6;
	Sun, 11 Oct 2026 13:39:20 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtlm-000000094J8-2Hhl
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 13:39:19 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j2hXB2Yxtz1sRLM;
	Sun, 11 Oct 2026 15:39:06 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=XHaRzrcWnGBBJEk/8UCbSfHdRQxOX7rp7HismjlBhG8=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1791725946; v=1;
        b=0qV+POqPPmchVPibyAQ0QllyUA6rfYlJQuHF+sVvTjeFa3E3EQq6Qfypw+RP9zsp
         4WQYNAx6aRFoQMKi0QT8YaO9S9Zus+nzs6PJzyGQotkOjvAcibP5YCeO4UViZbGK
         qYNL37sZiaLJcZHBVPBXAS8/uxUwrrDCAVfcLmmy7aL81GadHgtqu7v+RfcF+QJi
         qYpUkMIzP+kDP3Y6fnmSE3e9orBY06zB0JX285/XsrHL67lJ1OzBPheOj5FkP9KL
         1Zi6guX34V/OuzzKgwPb6rmCIEx9R6aUPI2dLURNAhoc/1+yJjK2kb8vvGB7F5Uo
         mBOmPENc+CshHCHqHjDahQ==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j2hX80cp0z1sR8b;
	Sun, 11 Oct 2026 15:39:04 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4j2hX80376z1qqlW;
	Sun, 11 Oct 2026 15:39:04 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id E9OEDt-NYzGT; Sun, 11 Oct 2026 15:39:01 +0200 (CEST)
X-Auth-Info: RWtFOPa2WPAAcoNvORZRjrjvz3yyE/RdyuxRfNfJkBn6yqWRhEJ0wED3jO+mdFff
Received: from wiesel.intern (aftr-62-216-206-149.dynamic.mnet-online.de [62.216.206.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 11 Oct 2026 15:39:01 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:c2df:628d:efc1:8817])
	by wiesel.intern (Postfix) with ESMTP id 1665179A036C;
	Sun, 11 Oct 2026 15:39:00 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH 0/2] Enable bluetooth on BeagleV-Ahead
Date: Sun, 11 Oct 2026 15:37:57 +0200
Message-ID: <cover.1791720467.git.thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_063918_732869_C94207E6 
X-CRM114-Status: UNSURE (   8.39  )
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

The single board system BeagleV-Ahead uses a Ampak AP6203BM chip for wifi
and bluetooth. Wifi is already enabled for this board. The bluetooth
module of the chip connects by UART and PCM to the TH1520 SOC. The PCM
interface is currently not used because of missing I2S drivers for the
SOC.

This patch set enables bluetooth.

Thomas Gerner (2):
  riscv: dts: thead: Enable bluetooth on BeagleV-Ahead
  Bluetooth: btbcm: disable read tx power for BeagleV-Ahead

 drivers/bluetooth/btbcm.c                     | 19 +++-
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 89 +++++++++++++++++++
 2 files changed, 105 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
