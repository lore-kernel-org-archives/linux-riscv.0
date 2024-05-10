Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E11CC25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIVCfyLdmMdv2TxFuRqKifoUel/bw2RROHDu7F8E6Do=; b=CBQzQjLl2e691b
	fzguqfAsEOYN4Vxi7+w36/BSl2c7gJnlGUOy2zvz1semRaz9tLI/H5bXsUnRlVRJSuh0HyxaT7BkY
	uY/cKQfj1STL8yW4geBn07NUYlH4HTqtBc3iMWqA4ycCs5n4mVjv++TlmsiKdwYD5XtfhTGXG8MjI
	vqf90EK8d74Dh67OyiA/WkA0gWgNls26xoaCGrf2B9O/Xm3T6Y831alxYCB5UYwIA3cxuMrdUN2OZ
	Twxgibj+xw95WjVMNf4wJH3JTgH8gdHFtZ0I9RE6S81iec4uZjt27QuGFbrQsKpNFNTPksJ75DcUz
	3kxpod00Vz0iqod/9u5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ktq-00000004POj-32et;
	Fri, 10 May 2024 07:42:38 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ktj-00000004PMD-2Pj6
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 07:42:37 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4VbLSW1sm4z1qsNr;
	Fri, 10 May 2024 09:42:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4VbLSW0D2Cz1qqlW;
	Fri, 10 May 2024 09:42:19 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id wa_-KpXdVV1E; Fri, 10 May 2024 09:42:17 +0200 (CEST)
X-Auth-Info: 1/I9WN7qMx6nrIhu6olAZ98FEHY/laUt2/c9CUhT5UGbjjWI2SaIBfGedJ1Wq8gx
Received: from tiger.home (aftr-82-135-83-234.dynamic.mnet-online.de [82.135.83.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 10 May 2024 09:42:17 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
	id 8CAA528726F; Fri, 10 May 2024 09:42:17 +0200 (CEST)
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
In-Reply-To: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
	(Emil Renner Berthing's message of "Wed, 8 May 2024 13:15:53 +0200")
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
X-Yow: Yow!
Date: Fri, 10 May 2024 09:42:17 +0200
Message-ID: <87wmo2nmee.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_004232_761597_E319C48F 
X-CRM114-Status: UNSURE (   8.48  )
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

On Mai 08 2024, Emil Renner Berthing wrote:

> This series enables the in-kernel Bluetooth driver to work with the
> Broadcom Wifi/Bluetooth module on the BeagleV Starlight and StarFive
> VisionFive V1 boards.

That does not work for me:

[  +0.369276] Bluetooth: hci0: command 0x1001 tx timeout
[  +0.025545] Bluetooth: hci0: BCM: Reading local version info failed (-110)

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
