Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E1FC369A7
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGL+CJfETlQxxIZaQaMPayBnqJGPbLeqzirx0lFXG4k=; b=Vh42x2UbgPf7SdYBRnXNd0vP0x
	ezl35SKBgpa6cKWAX0oeh0TyZa6F3o+JGo4m7oYbQoNfEDK998T+a6FSvR96jOT9RpfESZhx5uDYd
	CN3l4tntuq9oaKdsWcFFNcyLb/Tpwbbwk/6p2yf4vg1jtPtv7nRyTJhgVzmNsSNKVVakSRxt5fTg6
	1aYe5iOTP1dTGZFoVDUf02n6TERRG1RnNnYjGd1dVebW0bIdsrOv4dbhG5m9j2+MCTmZf9KvOvUC9
	cw1UGlftFEyzb/c3o9/4E/lImHfltfSkFYXKVumHfyNSt6E2PE1evwJST4Pv+Y5m41Zu3qRfMWGvc
	Y6pvPg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMjW-00000004Nbd-0Iur;
	Wed, 25 Sep 2024 07:46:46 +0000
Received: from 8.mo583.mail-out.ovh.net ([178.32.116.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMNN-00000004JTL-0qWC
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 07:23:55 +0000
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.176.14])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4XD7WR6nvqz1RNx
	for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 07:23:47 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-64cjv (unknown [10.110.118.154])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4775F1FE3C;
	Wed, 25 Sep 2024 07:23:45 +0000 (UTC)
Received: from milecki.pl ([37.59.142.103])
	by ghost-submission-55b549bf7b-64cjv with ESMTPSA
	id mUbACYG682ZBNAAAyTvjrg
	(envelope-from <rafal@milecki.pl>); Wed, 25 Sep 2024 07:23:45 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G00530c11656-fd2d-4e51-b038-3339ee5f64f8,
                    9DD8DC6CF38314E8515C70E4989C69D14BB97D32) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 176.31.235.81
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 09:23:44 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
 <heiko.stuebner@cherry.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Michael Zhu
 <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhs@frame.work, ams@frame.work,
 gregkh@linuxfoundation.org, yuning.liang@deepcomputing.io,
 huiming.qiu@deepcomputing.io, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor: add deepcomputing
In-Reply-To: <20240925053123.1364574-2-sandie.cao@deepcomputing.io>
References: <20240925053123.1364574-2-sandie.cao@deepcomputing.io>
Message-ID: <9e32cc30b1c9923f985aa6786d1f9d62@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 13439585716663266069
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtgedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhfkgihitgfgsehtkehjtddttdejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejjeekkeegjedtffffveffieevtdeuieefueffgeekheekleeiudfgleefuddtueenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudejiedrfedurddvfeehrdekuddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=oItKQ7Un4VVtOguEdJMdsbTrZ/zvp+itPGogkzlkK3Y=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1727249028; v=1;
 b=Ovl4kHSGTKMErUPsh99wFV9ywc1NXhkv4W4b/wxPhu+8OY/PTRr7RVL/1a3rSQ0+zjGtZsCX
 sBn6acYwUaURTOmlLCHj1xYZjb+yeb/elRftToCNh26hE2BoWnBgAIez5SyHszscWcLwCyt5I3u
 M4VgZhlwnLHLgIjwUJxrPtqZ4/nCv+OtjjSEgTjQJmCF0BVYhxE5kYM4/S6O0ngtzu4TOf6NBHW
 K+xThf2JP6f+2J/2QPuEhF8pfvDk6sKz3863KeZynfrARAwpOB+SFKHEWiewOuRkmPzbCwrWodI
 +Plooid2MqWS9co3Y1LSMvlCwFMD35DuuJQIpzZ82Hh7g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_002354_297113_820E44E6 
X-CRM114-Status: UNSURE (   5.59  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNC0wOS0yNSAwNzozMSwgU2FuZGllIENhbyB3cm90ZToKPiBBZGQgZGVlcGNvbXB1dGlu
ZyBpbnRvIHZlbmRvciBsaXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbmRpZSBDYW8gPHNhbmRp
ZS5jYW9AZGVlcGNvbXB1dGluZy5pbz4KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPgoKVGhpcyAiUEFUQ0giIGlzIGVtcHR5LiBQbGVhc2UgdmVyaWZ5IHdo
YXQncyB5b3VyIGFib3V0IHRvIHNlbmQgOikKCi0tIApSYWZhxYIgTWnFgmVja2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
