Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5EC25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTLD/G+noPySRqhERNPUEXk2l3wcq1BIhhRs9j3I6vQ=; b=LEQow8ASMOTvPI
	SUsxZL4tn35Y8E8ki52rxeqBlB08GRYKiPlFCb42gJ1Kyq3tF/XowR5qrNPwIZEA3p4ytpKTirlC0
	nePABbAW5pspAY6UI9XDxqVjbJEvi9biUGT1UiXD4PAml+IKyJ5Qlv0CVor9BVTohrvD7Wg8llk34
	40cxOOEbcd7+N+RfSXq7Xp6dJbZEPdCRm5ek4nl2gLy9eNUEbVvIzvVnKMeS8TO83eAaTHEbkyk8+
	uqcwSSCnhJkLKgRY0s7pWMaaZ4A6aPJoawc+K6uqULIrK8wZiztDDQlDD3qdBRzCBhkFe+JHbK1+Z
	Nwcrzc8jp0BnMDPhFSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MfI-00000004igf-40CH;
	Fri, 10 May 2024 09:35:44 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MfF-00000004ie2-2mJO
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 09:35:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4VbNzD2CTxz1qsPQ;
	Fri, 10 May 2024 11:35:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4VbNzD0J3Sz1qqlW;
	Fri, 10 May 2024 11:35:36 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id W7SDgKtSIU0X; Fri, 10 May 2024 11:35:34 +0200 (CEST)
X-Auth-Info: WpkhOM/yLbHyYToGgYckJ3TxBRsGdMRWU+bfIT1zsPao++vXAB/KuQGIznDFs2yE
Received: from igel.home (aftr-82-135-83-249.dynamic.mnet-online.de [82.135.83.249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 10 May 2024 11:35:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 5C89D2C1A3A; Fri, 10 May 2024 11:35:34 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Emil Renner Berthing <kernel@esmil.dk>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
In-Reply-To: <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
	(Emil Renner Berthing's message of "Fri, 10 May 2024 04:02:58 -0500")
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
	<87wmo2nmee.fsf@linux-m68k.org>
	<CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
X-Yow: Are you still SEXUALLY ACTIVE?  Did you BRING th' REINFORCEMENTS?
Date: Fri, 10 May 2024 11:35:34 +0200
Message-ID: <87zfsy102h.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_023542_031776_03CC660D 
X-CRM114-Status: GOOD (  10.65  )
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

On Mai 10 2024, Emil Renner Berthing wrote:

> You don't include any information useful for debugging this, but if it get's
> far enough to load the firmware could you at least make sure you run the
> version below, so that's at least the same.
>
> https://github.com/esmil/linux/blob/visionfive/firmware/brcm/BCM43430A1.hcd

That didn't change anything (and there are no messages related to
firmware loading from hci_uart).

[  +0.879623] Bluetooth: Core ver 2.22
[  +0.004843] NET: Registered PF_BLUETOOTH protocol family
[  +0.008787] Bluetooth: HCI device and connection manager initialized
[  +0.021944] Bluetooth: HCI socket layer initialized
[  +0.008488] Bluetooth: L2CAP socket layer initialized
[  +0.006333] Bluetooth: SCO socket layer initialized
[  +0.097478] Bluetooth: HCI UART driver ver 2.3
[  +0.007943] Bluetooth: HCI UART protocol H4 registered
[  +0.006066] Bluetooth: HCI UART protocol BCSP registered
[  +0.006962] Bluetooth: HCI UART protocol LL registered
[  +0.000015] Bluetooth: HCI UART protocol ATH3K registered
[  +0.000084] Bluetooth: HCI UART protocol Three-wire (H5) registered
[  +0.000247] Bluetooth: HCI UART protocol Intel registered
[  +0.000455] Bluetooth: HCI UART protocol Broadcom registered
[  +0.000084] Bluetooth: HCI UART protocol QCA registered
[  +0.000008] Bluetooth: HCI UART protocol AG6XX registered
[  +0.000057] Bluetooth: HCI UART protocol Marvell registered
[  +0.051854] hci_uart_bcm serial0-0: supply vbat not found, using dummy regulator
[  +0.000387] hci_uart_bcm serial0-0: supply vddio not found, using dummy regulator
[  +0.094658] hci_uart_bcm serial0-0: No reset resource, using default baud rate
[  +0.990297] Bluetooth: hci0: command 0x1001 tx timeout
[  +0.022893] Bluetooth: hci0: BCM: Reading local version info failed (-110)
[  +3.306159] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[  +0.013336] Bluetooth: BNEP filters: protocol multicast
[  +0.124262] Bluetooth: BNEP socket layer initialized

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
