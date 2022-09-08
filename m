Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0502C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3lwguYuZ6R37f+xppKLxlgxn1NMUh4S/8Xb5FS+pUs=; b=iGTC8uEzJg+hoB
	h9WPWzsp7fv7aYSx3JiH2CgJJhcr9rcg/nARB1CcEdGSyrW+Ig87e5tq3fTLskN8rcHDc+oc4PAZO
	BTQtRlE+06b9y2J77wI9BCPTM9fOYMnAvhSgbMrPcTdvnr6haAPtqLdqik8pP3AxmvJNjqVwKh87I
	j+gatkw7l8qqqics14JIgf1haza5f5KCX5G557MpvTc3w2YHTPygGwrDxGEo+ci/a4cL2qU1Rh+FK
	x371x41SoCflNMq95dWLvPSUpx2JX8g1j5EIQH1zsc9Xod3KTgMaPFLkGOe38kR7ARjJJj+E+fzhx
	t1fSsJUkq/4VkBVBwqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIdN-004lUM-TF; Thu, 08 Sep 2022 14:36:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIdL-004lSZ-Bz
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:36:00 +0000
Received: from [192.168.1.90] (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F064E6601F95;
	Thu,  8 Sep 2022 15:35:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662647757;
	bh=yxWthJQQFVyrsOLPbde9GuvBF4vIyWDhHqgg0BlNRAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NtBdI5kJn9GypI1bNaHxCRe/R2YNffP8X2c0sCP9yx+FWWt/ukEaWS7En7VQA6dC8
	 fza9h27A/mPIRJzU57eYPSITn/593dRZEzUH8qFW0sUjGLkDJE1iTWjbxvX77SSYen
	 /U+4CUqzswlEi/nh0I29vdHaxdpxjR8JFA5jSFYBKY9fHE1YtqevvgzsISxOVPv221
	 /+f7peI9RWaC8/XZ42sa6HSUntdlQEIgO299oe7t3bg9uyAv24tgStoM+B6MFiDEdS
	 TDh94n0TEjjlTSrpyEDGXRW9S++Hda8k7uNk3vd/+Jcoml5KOccyVNlRC8StsARvZ2
	 Btkbwm1r+gM2Q==
Message-ID: <958a72a9-9594-32d2-3a90-780cef92109e@collabora.com>
Date: Thu, 8 Sep 2022 17:35:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/3] riscv: dts: starfive: Add common DT for JH7100
 based boards
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220902100806.2378543-1-cristian.ciocaltea@collabora.com>
 <20220902100806.2378543-3-cristian.ciocaltea@collabora.com>
 <8528d39e-c03a-7d83-d8e7-5191d3110015@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <8528d39e-c03a-7d83-d8e7-5191d3110015@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_073559_574394_9FEB4A5A 
X-CRM114-Status: GOOD (  11.57  )
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

On 9/8/22 14:33, Krzysztof Kozlowski wrote:
> On 02/09/2022 12:08, Cristian Ciocaltea wrote:
>> In preparation for adding initial device tree support for the StarFive
>> VisionFive board, which is similar with BeagleV Starlight, move most
>> of the content from jh7100-beaglev-starlight.dts to a new file, to be
>> shared between the two boards.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Use proper arguments to git format-patch, so that the copy is properly
> detected.

Right, handled this in v3:

https://lore.kernel.org/all/20220908142914.359777-1-cristian.ciocaltea@collabora.com/

Thanks for reviewing,
Cristian

> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
