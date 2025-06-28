Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E731EC7EE39
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 20:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEl1s/eAI1Qh3vk6xmKOil/sxGuriLWAsyxL0YIZwd4=; b=32McQ5EWK69soO
	910X7DT39fk0h08/JQTpcq5JrC5nhaYtS6BF01yXqZp2Vow/YVRUf1wSvAM9+4zytZLOvj02GUXRv
	1/9H10I2u/vhT6ZUb1sR+mXs0sQzwN+FDLv+ez3h27r3pXc3DyKAHIJUsp3Sg6x0IAy/sHby8S9+Y
	ClJttMkgfoXKre+h2wDmacAUziuI2eITVRS0AQBW1/p/SfVuHvPKMj3MwiNMBNCg0S5Ikz+uuYdr4
	wosSiG+/T+8+3HTBKo99i5pi+JOL/q/GIqF9/Yu2V+oh+8pFaqokqxtWjcmA2EBDz4geKMcZJPWDh
	q2yvJjcvVPFtztms+6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVbvc-0000000HHT7-0dXY;
	Sat, 28 Jun 2025 20:13:36 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVbs2-0000000HHK1-0Z0y
	for linux-riscv@lists.infradead.org;
	Sat, 28 Jun 2025 20:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f0a4
	USs8i2mvWvTWq8g8LuHUKhjCSiBButMrbCa/mH4=; b=cRccKSrMuLEV25A9nnIC
	sWKdKpgFQRGtgH2xx2EGOKIZcLJ7cNNTjGeCT8XDCbp0pvHfRM07JdMTvK8zv20f
	H8Yilak3wSwsRnzRpffpVRqTfNprO40+wdV07A06qaLpQSEXFWSrIPWpxfomhu4X
	Oh+4sQqg9Y0uRCHb9pSAlnmjRAH2JYlt7dGB5rBmhmbRlOY05rXnl8bdJSgtV5Cp
	x3PW98NBeRa0szF/V5B2WViZvUmkqx94S8n477Utb2gem7Xm3/oG+udwFezJU6gA
	qLCY/pTIoQmVzTHq9xPf15Z0Z6yiaRSvxVzEnsiYaOUnweXJlmrY/ovZcvsGB0mE
	AQ==
Received: (qmail 1928467 invoked from network); 28 Jun 2025 22:09:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 22:09:50 +0200
X-UD-Smtp-Session: l3s3148p1@rcR2YKc4ZgdtKPCO
Date: Sat, 28 Jun 2025 22:09:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alex Guo <alexguo1023@gmail.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	andi.shyti@kernel.org, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Fix out-of-bounds bug in
 mchp_corei2c_smbus_xfer
Message-ID: <aGBMDFLH7aJGFyQ2@shikoro>
References: <20250615234919.525431-1-alexguo1023@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250615234919.525431-1-alexguo1023@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_130954_448517_721966A5 
X-CRM114-Status: UNSURE (   7.23  )
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

On Sun, Jun 15, 2025 at 07:49:19PM -0400, Alex Guo wrote:
> The data->block[0] variable comes from user. Without proper check,
> the variable may be very large to cause an out-of-bounds bug.

Okay, okay, instead of adding these limits to all these drivers, let me
start adding SMBus3 support to the kernel which allows for bigger block
sizes. I probably won't have time to export this to user space yet, but
let's at least make sure the kernel, and thus the drivers, won't suffer
from buffer overflows anymore.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
