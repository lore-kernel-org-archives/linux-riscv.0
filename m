Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2724AC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfy1o5SI08qz8gz9IEAvZdOTWvXL3i+IPatbQAvs7Gw=; b=vXkYPUeEi8UijI
	dTCqvoOqBI6dzNsG8YgTTFj5XHEif6uoVe9S99yfhQb+33/YIdK1ELKBGPxpeRX4WnRVF35cfivn0
	sbsJggsE5Z7mOhW3TohxbHAKKV+mRZ+Yl/zvdHIlQMJwOaF0cEYmrKUxCNwWCMHoBHQEYlbMSkhuV
	6gSMy9YvW3mTFiw6EIOMKJdgLKgTYtERTahxtaeaELWy0FoJcDf8YI2ae+4KNx+8OrLEFFCyPJsbh
	6ShKtQ79i3XJPhGKmIWaYOmFb7mWr7WmYCGDjJGOlDjnUl1fJUVIH4oFu+yYNymgyEYV6AdpAXLTm
	d8mL/GW/nOYbE+MM1vJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rycLS-0000000B6xb-1oI4;
	Sun, 21 Apr 2024 18:55:22 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rycLO-0000000B6wA-3KMO
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 18:55:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3273E1BF203;
	Sun, 21 Apr 2024 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713725709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUNbORL/3INaIWPSTEZc9brKWOzN/OqC04ZQVfTjKGg=;
	b=NmdeSaFSkHrSuC+jBAghlH7/fb1qwiTuDrlhvcFsch5yTj489Tx9YmKXSYvsTmBqukdNrh
	cnNX8nWcxEDEh1POvtwxRczpxMVsoodN4yojiKOcTbcryyyBM066escRQmZjNw+iFxrpug
	nbBJ3obYzem/kXKVN9yyJjW2ZrdgjU9GDEJOOLHYkCROjqlmyVpYIxRQ51pxMRVL4BfLQ7
	qKsI0CIEo1zRk3D4nN9onyUQckw0t9h3tUL0X8SNj6/bAIpHeETgatpk7w157fEOCKz0mx
	XpbV4LkOiyndTfldpH0o/8N26+WkMT9nrnvJtt0eGESvt7BT3OwgCItHMirWgw==
Message-ID: <b1f59075-f2b0-4f2c-aea3-bc596ac45f1c@bootlin.com>
Date: Sun, 21 Apr 2024 20:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: riscv: add Milk-V Duo S board
 compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>
References: <20240421055710.143617-1-michael.opdenacker@bootlin.com>
 <20240421055710.143617-2-michael.opdenacker@bootlin.com>
 <c30cc11a-209a-4919-a382-7588daff0d71@linaro.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <c30cc11a-209a-4919-a382-7588daff0d71@linaro.org>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_115519_024335_64ACAD7A 
X-CRM114-Status: UNSURE (   8.11  )
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

Hi Krzysztof

On 4/21/24 at 16:12, Krzysztof Kozlowski wrote:
> On 21/04/2024 07:57, michael.opdenacker@bootlin.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Document the compatible strings for the Milk-V Duo S board[1] which uses
>> the SOPHGO SG2000 SoC, compatible with the CV1812H SoC[2].
>>
>> Link: https://milkv.io/duo-s [1]
>> Link: https://en.sophgo.com/product/introduce/cv181xH.html [2]
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
> Where is the changelog? It's v6!

Oops, it was in my cover letter 
(https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/T/#t), 
which you didn't get because of get-maintainer.pl. As the recipients are 
patch dependent, am I supposed to describe the changes in all patches 
and not only in the cover letter?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
