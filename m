Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1471C10F16
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSsNHoXB7ITb9D5JmkR3OCWQFgs9JsDFFj0NPycRp8Y=; b=zV25b62Rw9JkIL
	zp881Qm7LS5WoDYHwDHTpeR91S8cSl8Ffcx2Ph2tVFlgQYtzizmOKq1d4yfrEMQMhYWo96/UhYUhY
	gKYtKT7wvcStldA82SXcc1xcX+vNaNRhX1L95MvXgD5nYZenrpAIA7fBsyAlbvLTO4HKFkoTZ7W6D
	n55h/iyEH0g4rmfJZ+IjUiv7i+8uwxqRsMK6yhxN8t9xnJGjt7zBxOSHeOXlO3KtESaor0pDolSK2
	dJWO+Yz6CURIQYzKIv2qRVzNhyCicSiywmpnXYlRFIp/C2zwvvqHbKwb5P67Jc4k320KoI9DiI7Vy
	+rMkRjd48zlS/7/1T6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zKc-00000007fhE-0h4c;
	Mon, 06 May 2024 14:28:42 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zKY-00000007fgV-4APi
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 14:28:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE491C0002;
	Mon,  6 May 2024 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715005714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PA/Ob+PeIgYK/56bxpi/YcTUZp23Z72IIc5Igx2Qlbo=;
	b=RUMGXUk0pS94Utzp1N2KuwhLsZ0ZbwE2XlVxI1tzziUKXDvWMQJZMit0t7nI8/a+jeKiRY
	qFXZFPpCfO1VnmRAmf4C7r7YUpbxphJt2VccRFgYl8vHa7yuIEiH5YHHotZLL3YGBfMWj7
	GbX1eSoSbxMiOzzJ6V+DFmBgG9QGNStZRACk5Obx7rBOYeQytSwVcJpfIdpPZvqm60KuyK
	9U1/TAj2Pzcye1b1xDzVluHuW07gH/UziqcX4sBzOs8Iu1bePzsWWT0iANBEFuvDnzS53J
	hRvWhS/ZM06Zci6RIx3KNM+DZiq6pWy9Nyjf+hh7oQ4taSwVYnJPyBYYFrHqzw==
Message-ID: <c384a754-f1a6-4666-b07e-8a38f57ca43d@bootlin.com>
Date: Mon, 6 May 2024 16:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: emil.renner.berthing@canonical.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dfustini@baylibre.com,
 guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 wefu@redhat.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_072839_198006_AC29F796 
X-CRM114-Status: UNSURE (   3.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

Thanks for this series, it works with the I2C and the PWM.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
