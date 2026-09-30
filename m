Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9BDCA5FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 22:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OeEUjuhQjpp0EZmLuKe5wv5Yz07mQM5KyCdU0cyR+Tc=; b=BgX9aj/DQesXGp
	y5U+J5XpPgLL7ThgrPILflOLNrCOiUeEVCd47RCPuDohSenLjZFYuqoWK5b7nzH0zv5rsYCyowPmj
	XxGGkNoth+dMHkauTcS/0wBDktRqoGf364HmW2WrlwxEV03L32TyovrsZ5pS9Qtibkf0qqEZoF2hS
	iei2gRYrixXzYkkCSk0PiHcrQ19oW/j3nDIWkaRw3pOr+3j1EhCMOjm5BJ6YBPW8qQ6UTEv+z08BX
	OX3W77TWolqXJoLed2X+efGxO0odBAiSy9zT+3i5GG7qaT+hktleU/0or5ThNjLiQcnAJnqO5SsOP
	grpPomBbg+bO2vnKsb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2ew-00000007MIs-0TEK;
	Wed, 30 Sep 2026 22:20:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2ev-00000007MIk-0grH
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 22:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C39941959
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA7E1F0089B
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790806816;
	bh=65w+P0+syMfsfRRZGa4iHCxiTRt/X9tvdIf2JYTb96Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=apmecSKYc5gBN42A6zWWWkk6OW+y7YoiG/6qrXTo7mJuc4R/eCMOAol1IZv9XJnDg
	 Q2rkcKZ8S10pMTa3KtmHvhOHyERUQxvjI0YPGqpBHW5mCeK0jw6nwaKGdXDT/wl5LV
	 ULEc/8Dj+pzS/Q39coXbMkP7JXcUk7QvZy9l2NsEH6caHTDh8jlAicaIdbX7J68tKx
	 kh8NbgsMRtT4rt2KtkByqSMzgFKfVWh8QiAkfiLvdRwGveolIRL8W91X4KU+O/u6A4
	 Rgq5JEre6+kkAcV8T+JTIPyXynLHxz2fTzpsMxYqtVeIEqZMpnJV6mmHU/v2l3lJX9
	 tXu38IzrQ68Pg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba418c79ccso684364e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 15:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybkcdEuyKQEB6+8dARClaDj4CJHDbDQdaTf4edRuhiEgnLEBCLuXt3lLl9muFauEJwbG75sEWTulPBeg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLjO9KVAxy4wKUFHAFDovt8K8ulkNfE7i6JpNnvCswWq9uNRz2a
	nlzx7U3cKvkYWrZDcxk0x3TvmSCGKwreBlVAjnBFEFtt4MvOHuiimMz1EVbNmNS2KGUYOQvNh4g
	pKv/Erp4eb04kWOOslC7SzrBm3lIbiYk=
X-Received: by 2002:a05:6512:1593:b0:5b8:e886:3688 with SMTP id
 2adb3069b0e04-5ba402b3b33mr1066317e87.5.1790806815272; Wed, 30 Sep 2026
 15:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 00:20:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
X-Gm-Features: AclHuK-3WLZPojlMzN86zHmOvH9gBpstHy6qqmtykYw4QwirmmoTz47SZXLeMp8
Message-ID: <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

SGkgQ2hhbmd1YW5nLAoKT24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTI6MDTigK9QTSBDaGFuZ2h1
YW5nIExpYW5nCjxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgoKPiBD
aGFuZ2h1YW5nIExpYW5nICgyMik6Cj4gICBkdC1iaW5kaW5nczogcGluY2ZnLW5vZGU6IEFkZCBw
cm9wZXJ0eSAnaW5wdXQtZGVib3VuY2UtbnMnCj4gICBwaW5jdHJsOiBwaW5jb25mLWdlbmVyaWM6
IEFkZCBwcm9wZXJ0eSAnaW5wdXQtZGVib3VuY2UtbnMnCj4gICBkdC1iaW5kaW5nczogcGluY3Ry
bDogQWRkIHN0YXJmaXZlLGpoYjEwMC1zeXMwLXBpbmN0cmwKPiAgIHBpbmN0cmw6IHN0YXJmaXZl
OiBBZGQgU3RhckZpdmUgSkhCMTAwIHN5czAgY29udHJvbGxlciBkcml2ZXIKPiAgIGR0LWJpbmRp
bmdzOiBwaW5jdHJsOiBBZGQgc3RhcmZpdmUsamhiMTAwLXN5czBoLXBpbmN0cmwKPiAgIHBpbmN0
cmw6IHN0YXJmaXZlOiBBZGQgU3RhckZpdmUgSkhCMTAwIHN5czBoIGNvbnRyb2xsZXIgZHJpdmVy
Cj4gICBkdC1iaW5kaW5nczogcGluY3RybDogQWRkIHN0YXJmaXZlLGpoYjEwMC1zeXMxLXBpbmN0
cmwKPiAgIHBpbmN0cmw6IHN0YXJmaXZlOiBBZGQgU3RhckZpdmUgSkhCMTAwIHN5czEgY29udHJv
bGxlciBkcml2ZXIKPiAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBBZGQgc3RhcmZpdmUsamhiMTAw
LXN5czItcGluY3RybAo+ICAgcGluY3RybDogc3RhcmZpdmU6IEFkZCBTdGFyRml2ZSBKSEIxMDAg
c3lzMiBjb250cm9sbGVyIGRyaXZlcgo+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBzdGFy
Zml2ZSxqaGIxMDAtcGVyMC1waW5jdHJsCj4gICBwaW5jdHJsOiBzdGFyZml2ZTogQWRkIFN0YXJG
aXZlIEpIQjEwMCBwZXIwIGNvbnRyb2xsZXIgZHJpdmVyCj4gICBkdC1iaW5kaW5nczogcGluY3Ry
bDogQWRkIHN0YXJmaXZlLGpoYjEwMC1wZXIxLXBpbmN0cmwKPiAgIHBpbmN0cmw6IHN0YXJmaXZl
OiBBZGQgU3RhckZpdmUgSkhCMTAwIHBlcjEgY29udHJvbGxlciBkcml2ZXIKPiAgIGR0LWJpbmRp
bmdzOiBwaW5jdHJsOiBBZGQgc3RhcmZpdmUsamhiMTAwLXBlcjItcGluY3RybAo+ICAgcGluY3Ry
bDogc3RhcmZpdmU6IEFkZCBTdGFyRml2ZSBKSEIxMDAgcGVyMiBjb250cm9sbGVyIGRyaXZlcgo+
ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBzdGFyZml2ZSxqaGIxMDAtcGVyMnBvay1waW5j
dHJsCj4gICBwaW5jdHJsOiBzdGFyZml2ZTogQWRkIFN0YXJGaXZlIEpIQjEwMCBwZXIycG9rIGNv
bnRyb2xsZXIgZHJpdmVyCj4gICBkdC1iaW5kaW5nczogcGluY3RybDogQWRkIHN0YXJmaXZlLGpo
YjEwMC1wZXIzLXBpbmN0cmwKPiAgIHBpbmN0cmw6IHN0YXJmaXZlOiBBZGQgU3RhckZpdmUgSkhC
MTAwIHBlcjMgY29udHJvbGxlciBkcml2ZXIKCkFsbCBvZiB0aG9zZSBhcHBsaWVkIHRvIHRoZSBw
aW5jdHJsIHRyZWUhCgpJIGhhZCB0byBtYW51YWxseSBhZGp1c3QgdGhlIE1BSU5UQUlORVJTIHBh
dGNoIGJlY2F1c2UgaXQgaXMgYmFzZWQKb24gc29tZSByZXNldCBjb250cm9sbGVyIHBhdGNoIEkg
ZG9uJ3QgaGF2ZSBpbiB2Ny4zLXJjMS4KCj4gICByaXNjdjogZHRzOiBzdGFyZml2ZTogQWRkIEpI
QjEwMCBwaW5jdHJsIHBhZCBudW1iZXIgaGVhZGVyCj4gICByaXNjdjogZHRzOiBzdGFyZml2ZTog
amhiMTAwOiBBZGQgcGluY3RybCBub2RlcwoKUGxlYXNlIGZ1bm5lbCB0aGVzZSB0aHJvdWdoIHRo
ZSBTb0MgdHJlZS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
