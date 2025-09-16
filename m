Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F56DCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwnqlFgYHQp1XdYpQv6pnXlyKQ+dH4/Fw4MQr5VKhsw=; b=14ilhGvt+MjeHj
	I4IdkgZyQ83LR+mEmEEHMEDYkBMA59+MctssZLVPbGB1hLGsURJ6zagDypH9aAW3Njr5/LB5Ljxnm
	NQY8Am+Qa1QlifbkPOZSYgb6ums3SflxkUUuQNnqZRpIVMmlKZBIPkbYwAaueKS+B/xySanojnaS7
	tP7N2oTn4ojtb3yclXq8gTFFX85iTnxAcDAlRrcjRuzb1QWkk48olRTSCPo1Me8t+ZlOpcwBrtbaT
	qInXJ7bvTl0FV4V6JU7z4cYVus2mc25WeN9jQpA3HrRUYl7OX2CbYo2qQdi6501qep95H01CHw/RG
	MSysfhpPcxEUfvrXgqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyX8E-00000008D5F-2Mwj;
	Tue, 16 Sep 2025 14:58:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyX8A-00000008D4P-1wB9
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 14:58:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0F9DC8F46E;
	Tue, 16 Sep 2025 14:57:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1BA16061E;
	Tue, 16 Sep 2025 14:58:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 449F8102F179E;
	Tue, 16 Sep 2025 16:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758034682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bG7jqwDvwnMc7LKOXfefsfuPcEBkoTgIfTnNQ5xb3R0=;
	b=B7aOeUXjfCsW+Dlii7CJAjRoXF0N21Pde2jHkNplWhvSErBR/Il15KgX8NlYo4+wUlwu9D
	Pc4PlN7ZXRRZzxQQ+vho3mpz0TSvleSyoSnbSsTcYjWFbDo1ulhxIcOza9vBZaMzrUiZAG
	6r/+gV4y8GUOLMrltPg6hASqSECE133GI0FBxDJ+69bPLEElb0ZSt/mIVJpWwoD31Ggdl1
	gN2pOO8PjrtsP/n0XLe8q6X++2crVhZAeD7jdBo8CGOVHBwnWfxOJxm8gbbzbmYxv2yq5q
	wsuT7Om98eOUTGy/v6uWC5DH4GzLluuKDB4cwJI4daWKeIsTNt+rMNr3mTe7JQ==
Date: Tue, 16 Sep 2025 16:57:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 4/7] rtc: spacemit: support the SpacemiT P1
 RTC
Message-ID: <175803465665.231523.13284487487341532209.b4-ty@bootlin.com>
References: <20250825172057.163883-1-elder@riscstar.com>
 <20250825172057.163883-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825172057.163883-5-elder@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_075806_689141_3BFC9260 
X-CRM114-Status: UNSURE (   8.63  )
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

On Mon, 25 Aug 2025 12:20:53 -0500, Alex Elder wrote:
> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
> only setting and reading the time are supported.
> 
> The PMIC is implemented as a multi-function device.  This RTC is
> probed based on this driver being named in a MFD cell in the simple
> MFD I2C driver.
> 
> [...]

Applied, thanks!

[4/7] rtc: spacemit: support the SpacemiT P1 RTC
      https://git.kernel.org/abelloni/c/c96433f4806f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
