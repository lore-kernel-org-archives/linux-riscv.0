Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC9FC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfk72O6F1oSxEpF1Oft1Qb/FFfE/5fUONy0y7oLhmWw=; b=4PEq/pK2KRG23Y
	yoDJtFnSdDTCyHRDsxKOm52BQX+eLZUWExw3sTT6Ej3h4jcqXehhGMxGsNT1Z96e+CBa8nU9HYcZC
	nzTNqyWbaBW0HIxxqG/PxUQ/M4+Fm+5vIiOayihXQUGMh82RtgSHORbagVGCT+id+BPw2yXjVHoRy
	wxrnPxhJaT6nhilq8s4tIKqvqQJghbbcPWLPFDwb38U+cxZtHZpcDcee7obLMxQ6JVH3ATcMRnZRG
	gKnEgHzXmiP7T/nmPGJHcIUlkiWBwyJRFpur6FrxKFaXZl2/Mwmo491Clz91uI/b8sd7LTigUF0IO
	2W/Pne18oSpBJMKVoxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx3T-0000000AyUB-2Nxe;
	Wed, 18 Jun 2025 17:58:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw9O-0000000AnPF-12Tp
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Jun 2025 17:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=; b=YJ2InSmlO3goAal90oLGa+qUOi
	341A9NSu6ACO+DjZ+ZJBGv/DmrM9oKtrRBvaUa/rYwT6BzoACq6TrTzY2H+xsqfKqOaSUdwLULxdA
	SlOyZKuOV2h+HMJaXmQZfsNrxj6V+MW3VhdWbqwH5sql4vsSlpruPHkPRDY1mATl0hyTELCY1o+4l
	V9Gsriqr4VbN/V8xj18CTN1hlFEt5fG60Vq9EnLDvsCNFXcXSC2HNBChZearfRoH9LXxIeN/xpJLc
	fTRYLtKisxFp+lQTA3dsaouewzjxIKCMriXVN1H/Vm9AvL7Qxpg1w/VWxSOHYoIalzCr3h0dNt/1g
	kykrQE0A==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw9J-00000004DDx-169l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 17:00:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8100942e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750266029; x=1750870829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=haySZ1Sh52QaSMeZDbG0lHMq+veiTxOQOY3oMO+Wy3NuM1GhXeqM2LGcrybttA5N9/
         gT6PmrRDegbpGdUrrEIF7LERsWkn6MmUe8BDadBTEsMoJtq6orSojcHLeb+XLLzM/Yqv
         M7Bh4QI8BY1Sc5Qv/7T3NMro21SZeKNcqNn1imkt0ShezRnz3q/Qpm8ary6LN5KLWII0
         H8S6mlrreX74NAF4aNoXeJ0opZemTtG4W8otPB2HM+XPnp0cQgrNe2vjk4l2lfOigGmq
         qGy5W3FXskD8GFphhJqiDkYfYaXPK+ug4jURGm8Em/LgCY4YzYNUOmE0/n2odvpcKxxh
         5LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266029; x=1750870829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=RHZ5dTEEPRiDFBCn58Qnh9zEmtqtFCuHdP5bLfNOPWtgjwhDmIox1ZWJz/+7VlGLfb
         MKQ5xvstsV7zjHCVcs+S1gwIDiiMt5AihIrvKX5PGtYH/EK+fYohzNUg4/XYn/KL5dwo
         dgZjMZhD3ieYk19fKQ2NqKJxS1ijz1znXl6vhT3/N/qtPJR0eZq02wK4kjH1jLYVN6yK
         eAWsemCQa88z3crNTf8PakZzs+/jxk3u4UPnir7HxjePIFbFtZfQmzKEc5LAgqg7WeO5
         heB5HJfnaSauxC6qmaoXt33vUgEV88bvpJPtIXyycPXVnaMCb+169l6NTi0qs9ADZovA
         FaEw==
X-Forwarded-Encrypted: i=1; AJvYcCXTvxwqfp305zDAWE9/OSnllPQFzSZzRPpLY5bnnSgONp8fa0TeT854sXAauQqF1LDrgf/o6PpWO6Jg4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZeplkC2jxQfHSwJEgwOP84yGJ+ENaCSxXFghx2RAnijeNHX1V
	uGAvAI3rAMP/78sdUk4mqLzejkZu9HmiIOsqApl8RBmpkucZ3Nau8yfDGsNXOWHSH41zwrSfdvR
	a65mjYJ8NFKew8m8kuCe2Zr5aS5/U/59wq/lVhIoAIA==
X-Gm-Gg: ASbGncvyn9JxnoIDjn6qKHHW/sFmJBg9Cl4msjpKK9WNEz5xWZflJYPLmYqCotm3XTw
	xVvzp5Z1ROEaTo/AT06hAZQ6WgAc1od0XkC40JU6HeTx3ePUIxF6rXHfXEjqnvlppAgLn7EblFG
	khYIlN00wqIdNPGZDNlHLD/jXCkSB8HBspN5dXwgeMMWuzvHyicPKXdoBEc4dzASFMRopfmBbPd
	Q==
X-Google-Smtp-Source: AGHT+IFrk7wjLo0FScAaHSeULurkvYIZ6q3poIqbDoop4mdMvyFf4GdTA027YlkMWkLw9hocI1+ULYkfCsJCJgw5Ht4=
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id
 2adb3069b0e04-553b6f16e9cmr4855031e87.30.1750266029272; Wed, 18 Jun 2025
 10:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
In-Reply-To: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 19:00:17 +0200
X-Gm-Features: AX0GCFsZ9BzqvDbhrAHxtqvk55yr6p1JWPmW5O8GtAIoAiziZFdZwWCX10LDhDU
Message-ID: <CAMRc=MfWD7XGuuiLd5_Sh1vODfE-v6suM3w=qdufxXPtkW+HVg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_180034_425462_31C69A81 
X-CRM114-Status: GOOD (  13.94  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgNjo0M+KAr1BNIE1hcmVrIFN6eXByb3dza2kKPG0uc3p5
cHJvd3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBBIGZldyBtb3JlIGNoYW5nZXMgYXJlIG5l
ZWRlZCB0byBhdm9pZCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UKPiAob2JzZXJ2ZWQgb24gUmFz
YnBlcnJyeVBpNSksIGJlY2F1c2UgdGhpcyBkcml2ZXIgY2FsbHMgLT5zZXQgbWV0aG9kCj4gaW50
ZXJuYWxseToKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1tbWlvLmMgYi9kcml2
ZXJzL2dwaW8vZ3Bpby1tbWlvLmMKPiBpbmRleCA5MTY5ZWNjYWRiMjMuLjU3NjIyZjQ1ZDMzZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1tbWlvLmMKPiArKysgYi9kcml2ZXJzL2dw
aW8vZ3Bpby1tbWlvLmMKPiBAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQgYmdwaW9fZGly
X291dF9lcnIoc3RydWN0IGdwaW9fY2hpcCAqZ2MsCj4gdW5zaWduZWQgaW50IGdwaW8sCj4gICBz
dGF0aWMgaW50IGJncGlvX3NpbXBsZV9kaXJfb3V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNp
Z25lZCBpbnQgZ3BpbywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgdmFs
KQo+ICAgewo+IC0gICAgICAgZ2MtPnNldChnYywgZ3BpbywgdmFsKTsKPiArICAgICAgIGdjLT5z
ZXRfcnYoZ2MsIGdwaW8sIHZhbCk7Cj4KPiAgICAgICAgICByZXR1cm4gYmdwaW9fZGlyX3JldHVy
bihnYywgZ3BpbywgdHJ1ZSk7Cj4gICB9Cj4gQEAgLTQyNywxNCArNDI3LDE0IEBAIHN0YXRpYyBp
bnQgYmdwaW9fZGlyX291dF9kaXJfZmlyc3Qoc3RydWN0Cj4gZ3Bpb19jaGlwICpnYywgdW5zaWdu
ZWQgaW50IGdwaW8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHZh
bCkKPiAgIHsKPiAgICAgICAgICBiZ3Bpb19kaXJfb3V0KGdjLCBncGlvLCB2YWwpOwo+IC0gICAg
ICAgZ2MtPnNldChnYywgZ3BpbywgdmFsKTsKPiArICAgICAgIGdjLT5zZXRfcnYoZ2MsIGdwaW8s
IHZhbCk7Cj4gICAgICAgICAgcmV0dXJuIGJncGlvX2Rpcl9yZXR1cm4oZ2MsIGdwaW8sIHRydWUp
Owo+ICAgfQo+Cj4gICBzdGF0aWMgaW50IGJncGlvX2Rpcl9vdXRfdmFsX2ZpcnN0KHN0cnVjdCBn
cGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQKPiBncGlvLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludCB2YWwpCj4gICB7Cj4gLSAgICAgICBnYy0+c2V0KGdjLCBncGlv
LCB2YWwpOwo+ICsgICAgICAgZ2MtPnNldF9ydihnYywgZ3BpbywgdmFsKTsKPiAgICAgICAgICBi
Z3Bpb19kaXJfb3V0KGdjLCBncGlvLCB2YWwpOwo+ICAgICAgICAgIHJldHVybiBiZ3Bpb19kaXJf
cmV0dXJuKGdjLCBncGlvLCB0cnVlKTsKPiAgIH0KPgo+IERvIFlvdSB3YW50IGEgZm9ybWFsIHBh
dGNoIHdpdGggdGhlIGFib3ZlIGNoYW5nZXMsIG9yIHdpbGwgWW91IGp1c3QKPiBhbWVuZCB0aGVt
IHRvIHRoZSB1cGRhdGVkIHBhdGNoPwo+CgpUaGFua3MsIGEgcGF0Y2hbMV0gaXMgYWxyZWFkeSB1
cCBmb3IgcmV2aWV3LiBQbGVhc2UgZ2l2ZSBpdCBhIHRyeSBhbmQKbGVhdmUgeW91ciBUZXN0ZWQt
Ynk6IGlmIHlvdSBjYW4uCgpCYXJ0b3N6CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwNjE4LWdwaW8tbW1pby1maXgtc2V0dGVyLXYxLTItMjU3OGZmYjc3MDE5QGxpbmFyby5v
cmcvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
