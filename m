Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BADCF11FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZdtaW+LXz2mKzC6KJXaO7DjapKb2RKDKrIyyPvQvdw=; b=aM/tlC9MndqLKw
	LpafnRcsFEdXaLGqvB7Q421xIQ+ztCrU+4xNJwREBRrWrCqGJhixnjrhDXOXwZtBZ5TaPzHpisZjh
	YPSHCEXCLjLoNihqC/9p3xkvWh9EtjGUR243lbC4EmPj8EAqWHGkEipZZWdI3xB50R8VNkCyddLoH
	JDGA3LFm6aAuHt0zsKZxQ6LQpt/ISBWhYZGRvjuXyx7v/qxhDgya8uscKCLGIAsQcQOJnUh0T907G
	HaNr/CoVaKaqXe18sASykfFc/8dGBiKp/GhrsCRUJkgnykaQiExtHH9ciIG6aORWvuPAFW22sQOiq
	P5ZCN0PKLm3elr6PB4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvK6-0000000DNv6-1APC;
	Thu, 10 Oct 2024 15:43:30 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syv1D-0000000DJVZ-1J9C
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 15:24:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D03F1C0007;
	Thu, 10 Oct 2024 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728573837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7g+xGPfmPtCVDE9/xOLezbAJ5PFRDtUwPFyP2N7f7H4=;
	b=fgeC9S65MDOezx4kw/I8xvjGqVf75HS8eJ720599rICrC2/T5ED7OzZcfP9mCAJkzdQh6I
	mi3SWrzuD3dtS2fbHm9Nq2eGko4IpJ9Q3gJ70tvC0moYWQKms2Ubks9XdqrydtFcYpZLhc
	YXMIl8q4KprrZz4a5HXoUZXzijQWaKRR3d+R/g1pB6cilen8oox5Jrar//ycffIs4RjzhI
	bHq8MbSWHZic4BNH1iRV0GawpScgW7Ou0i8hghzESz9mVDjb8bweKnK6M8FKgKv5BZCxLU
	HCn5Q2AYGtqvWhl3EENgwntFRpXZrE8lJFx1EP+TIh7tv3WAJ/X2C3GzBmEgYA==
Message-ID: <d7b32bed-2078-4f5b-80c6-681b7d67302a@bootlin.com>
Date: Thu, 10 Oct 2024 17:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] riscv: dts: sophgo: Add initial SG2002 SoC device
 tree
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
 Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
 <20241010-sg2002-v5-1-a0f2e582b932@bootlin.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20241010-sg2002-v5-1-a0f2e582b932@bootlin.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_082359_719083_35108A0E 
X-CRM114-Status: UNSURE (   8.65  )
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

Hello, sorry for the double email.

On 10/10/24 5:07 PM, Thomas Bonnefille wrote:
> Add initial device tree for the SG2002 RISC-V SoC by SOPHGO.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> The commit adding the bindings for the compatible "sophgo,sg2002-clint"
> has been applied to Daniel Lezcano git tree. This commit may trigger the
> bots because of this missing binding.
> ---

I wanted to say, that the comment above is no longer relevant because 
Daniel Lezcano's branch was applied in 6.11.

Best regards,
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
