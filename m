Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE66C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9VV9djFcMRRU/seLojBKMXbzv2qf1laZrHz1fed1z8=; b=wzfeokE5lu3BFU
	fHZV+tljR+2qjaK4x14273Hh8nzVYIXlDPQliOYZYIM5pYurL+4iNc3AINY4arreW1a+DCVVz32E5
	hfx4oD/Ev9FPr6tkWGDiK5Jg9Z1aqFAuvygBG+WNa5Ms3UaNO446UefYaL4AvUZuPwOfOVzW56xXW
	u47dCwEkdGAyI258PjyFGSZzEGFFEaKS1yn2tF1wMMlvFXcK7kRw6eGU2AnT/J80/HEY3DzK4cGlc
	NqB8kZQMZQTrZWgm86jR9v+z3y3bMGRRk1q9Mdr5amx6tgo0gleVrLJXVLs7HmVOh4elj97fp/Iwd
	SOmkNKzthDUJkS8hWmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB3F-0000000GMXz-110N;
	Tue, 23 Apr 2024 07:58:53 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB2T-0000000GLp3-13jf
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 07:58:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 744B46000A;
	Tue, 23 Apr 2024 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713859080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZqHyozgK9yUpKZAcjflzI3qZ70gn2cG0mX8HWy0gz4=;
	b=GNUhZvOZOMxsc8HXr44gDKbrPOlq6PglAKkDaFbvZK8W993ghKQ4XrG9MQ4MgFK54LnZG6
	mVUiqbtBZTJwnk04pvzFYx6E+1/6pFVn0xd4stVyXZDHoyAPu5Bp8v01L2vXcIzrJNoW5p
	VTbtbo6ADq4hAR+/mV+cbykRCoGcg1ucE3JmUhKD2wg2nI8AelF+c/Uu3GEEaUAZtz56Zp
	YuzLaB/NbB1kxE59UIbzy8BluPB7c1AggjPgKX876j8NPA5wZXsqeiGn5IXUbi33WyfOwI
	6IhMYZSSc//Fj8wurj3iN1WygehsvIBTt2d8w/reNTjTuDVcG7diY7XskOGEyA==
Message-ID: <4b5657be-686b-460f-bc04-b023ffbe1910@bootlin.com>
Date: Tue, 23 Apr 2024 09:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] riscv: dts: sophgo: add initial Milk-V Duo S board
 support
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
 <20240417065311.3881023-3-michael.opdenacker@bootlin.com>
 <IA1PR20MB49539A380E44459ACE19DEB6BB0F2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e457d5f6-3289-4049-b663-2ebcfe78dce4@bootlin.com>
 <IA1PR20MB4953D0D45EB0EDB6E8046664BB132@IA1PR20MB4953.namprd20.prod.outlook.com>
 <fbdcc77e-eab4-41da-803c-d65405f37f02@bootlin.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <fbdcc77e-eab4-41da-803c-d65405f37f02@bootlin.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_005806_256486_9F829C70 
X-CRM114-Status: UNSURE (   4.85  )
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

Hello Michael,

> By the way, where's the best source of information about the Sophgo 
> sg2000 and sg2002 processors? Even the Sophgo website doesn't seem to 
> have them :-/ . It just mentions the CV18xx ones.

The best source of information I found for the Sophgo SG2002 and SG200 
is this Github repository from Sophgo :
https://github.com/sophgo/sophgo-doc
It contains the Technical Reference Manual for the Sophgo SG2000, SG2002 
and SG2042.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
