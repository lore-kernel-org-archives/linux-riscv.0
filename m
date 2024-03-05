Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA9C54E49
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2mfk90UEos82enwQ2Gv9Nr4l6AhU9esS4xBeJ2U4bk=; b=FNJGXpzCFCotKT
	xe41rgrnGalFSapm+X9ihi/y+SZcSR4CdfU7mUvrQ5ZjvzAyM2P7b44pFVLIeg6isSDy4uCParITM
	pKCZvFtZz8YeXrKFzNbOB+t32E2uw2sHueZoiqy6s2yfjJRcvoj1BUKCvt67zcstpUKlvNtErOx8V
	QW7WSN5nw1NzTRgVX2Gw2QHJ0XT/TsSfcBnClU89UhgSaUzMLUsr73M/RGweXDofcKs3sZwiteCJA
	f1oZnDN2cuEN6amqT0uEFCSpU+1xq/ep+zbKQ+ryBVAvFqhYOpoywIOW4Z9R1gwRc72QuZyw+Zwdy
	pV5ZBxyZZUK+jksPmCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheH2-0000000FckO-1iQn;
	Tue, 05 Mar 2024 23:32:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheGy-0000000Fcin-3lpf
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 968F4CE1F97
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D219AC43394
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709681553;
	bh=80lvfzGKAe7kEBkauCv2yMWIGPq3NW6MljARA8V1sos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V61IP9fVQO21PP3bJMIqz/79X5pZAG06WSN9f7zC/ea85Jfj0VD8mA0u1PSFOtLOC
	 RUbT2l9DMXG5RZmKOeVPxbDpytt5w8TMIwFfJOfoLPnwHhckftitAW0RDowdgveWnc
	 AHcUt2lqhv13wSFIKqFBocroEIYTg2NyoLp67JsTGkwKsz87FOg6nN/SMK6ZlVqd69
	 slZGFuZ0MSxNe2xbagMMvC569Stop3FcvlB/qgXBk/3L8c9Kqf60WkmHx6a6o3ELdI
	 /uIrKPu5TLiZuR0uXv8R3u6VPbDCVp4zbP/Ihb6CHYnybYAjN0yHC1n1pW27/+D2XP
	 PwiyqyhdUz/tg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d28e465655so95320431fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:32:33 -0800 (PST)
X-Gm-Message-State: AOJu0YzaTr6VRkTyppwIFHQ3yaYShD0htA4I82X2CE5+BkenuSrmCbBc
	p+742VovLGisf5v/3odBflff6/pxgKZc5oy5nDAuu2Imu4X4LAZbT5NeF3hSeSQJdvl+bIZk5O9
	fD9+gd4pycjLCFWlT8S35KIXq5tI=
X-Google-Smtp-Source: AGHT+IFWBGx8vg36clcVJGz6YYNWtxYPJ8dI9W5dVEDPoJeAufsytZgWUj1Bv9JfKRKZua3gnDxuRk9rWeeALEezvLs=
X-Received: by 2002:a2e:9085:0:b0:2d2:c8ee:c99b with SMTP id
 l5-20020a2e9085000000b002d2c8eec99bmr2112010ljg.29.1709681551908; Tue, 05 Mar
 2024 15:32:31 -0800 (PST)
MIME-Version: 1.0
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com> <tencent_AE58630CDF9DA09FF6B5633B2E4C8C668806@qq.com>
In-Reply-To: <tencent_AE58630CDF9DA09FF6B5633B2E4C8C668806@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Mar 2024 07:32:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRqd2tcSF6qanEok-FBXytbFMQLeno1PRGwYuFoTjsWRg@mail.gmail.com>
Message-ID: <CAJF2gTRqd2tcSF6qanEok-FBXytbFMQLeno1PRGwYuFoTjsWRg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: timer: Add Canaan K230 CLINT
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_153237_244513_0298D50A 
X-CRM114-Status: GOOD (  11.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBNYXIgNiwg
MjAyNCBhdCA0OjAz4oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+IHdyb3RlOgo+
Cj4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBDYW5hYW4gSzIzMCBDTElOVC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+IEFja2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gaW5kZXggZmNlZDZmMmQ4
ZWNiLi4wNmM2N2YyMGFkM2MgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gQEAgLTM4LDYgKzM4
LDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgLSBpdGVtczoKPiAgICAgICAgICAgIC0gZW51bToK
PiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW4yMGktZDEtY2xpbnQKPiArICAgICAgICAg
ICAgICAtIGNhbmFhbixrMjMwLWNsaW50Cj4gICAgICAgICAgICAgICAgLSBzb3BoZ28sY3YxODAw
Yi1jbGludAo+ICAgICAgICAgICAgICAgIC0gc29waGdvLGN2MTgxMmgtY2xpbnQKPiAgICAgICAg
ICAgICAgICAtIHRoZWFkLHRoMTUyMC1jbGludAo+IC0tCj4gMi40My4wCj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
