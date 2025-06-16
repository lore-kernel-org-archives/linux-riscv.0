Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C64C7115A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GX3u//mNK0K5iBYOzslEOLd6JtIvvGANo7JRjTM0dYw=; b=hCw2gy4H6dGeTm
	ggyCUT6mbce+5p4LYD/Ke7NQkLd54EaylyvgSzaEI0euvknpaIi1NpkJi6DGdcaotD6zsgHOHmz5q
	YFV5Apzz7EDVZc10+EVo2bN6R4bH3UQjN6rg9vQVfLNKa/84IuaSLdXuBmKM/63UFCH5Fyfav1e85
	G0XShDJhz5thYpIm6MID7cm8APM5+T5QYdtNjbuhlA1PFVqIqQl6nNreZ3409F2MG7g3M5hcEko2L
	8Az6INsx87fngqXT36qPJ2SxKgBugzC/cbMIQpZYnOGwhg+57F4z6/cznMTMh0f/GJAY7PGpe34AE
	G9XJUm+EoPEp1AUG3FNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6bm-00000003zny-3HTT;
	Mon, 16 Jun 2025 09:58:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR63C-00000003uDB-0CAc
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 09:22:47 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1126803e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750065764; x=1750670564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
        b=s4JH+it9WuQeneo33V18Ka+o/RO9ZzaTcWlawSEeYPhppGvT1a2jmSmb4pWXEi7h5J
         PMKA3W82qZl5n44e0YgpplqGv4wYf6V3M+YTV/m/2bWyBhbV3U+jhC55k0GKfJt8VvKS
         pNrWt9xATemfP+NLwFm5jAQ6tzM/ng84ISBad0ikBaDQ6TPytFFqrWXkL4YvdNU7Du9Z
         gx12hwi4OVoHajJlfWgdv+qxqetJe21z3MBjZAOq8lTtcIwk3BeQ9jJ/wlurCYTATCKZ
         TgGqKUJyRZpyIstxr3zn4zVyBx/eRqy8klQII7eZuILvgVY2YjX2Bb6esCDCdvNfLaUE
         X5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065764; x=1750670564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
        b=dzhleC1vtOhtoOp3QRVF6B98jt4lYs+3S7O1DdNIyfcgNBA7Ncxmvjcl8yr2y7yQQX
         lFrS/5fbM4SgQ3hGRfFK7EO6dJY6296QFBXnhj0c14fO3s9PZvRuCUT6eTqsELKwPpgI
         3P/wP7D/yIjI+IMfMrN3GaxtChP/2DOvE4zfZ3fYuaWbrv0Y7eEvk7dHUS7ChL2p4S+K
         b3YLYFijocUoYoVYWDqnFEpzFFDBjkFXBBfU7MWGNnsgISyYctqajl0tALNcLOGFh5xN
         BmQq4liov7I3vKaw+ivPIxobYDjuO7nCzB1E+qmXjj5yl8d9Dph3LdO1qPiRX82l+5Vq
         f8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPvTJ48V0h2n0J2aDLaP4KNRlO+jcBaK1lLJDNPxL0dJDi/jyrI770W7aXwGtjgBj4fpqLt1uM7iHk+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWO4Oexfp9L3cO6z7vf4FFjR/VJNUxP+n6U6UHfSrB8vf4hG2+
	jVjU1CCBWDBp+uMnKRKr4SZknE+l/2ZhrfPwdGJzxapdYxkRl+C9xB7YsJAcpw9lJjpj18sbGGd
	vKpGYNdL9gF6Y/IJJ4+C4GR8UHN7G99m4e8vzQOjnpQ==
X-Gm-Gg: ASbGncsB/Xq0EDuww0gaohm0Bxx05u2mJLpNfkBd6MJoYmnRCUnyyfsX0et5GJRY/d9
	86AYI5wcKkobnMTd8H1pGlulOKjw16pMy1LskkVvJ4y118+OTEmXsdmyslcP8+hdB/th2M8cbTI
	urHl6YNENPypc+bF9+nXVQlrpoz+cNXnDm0PZX+fOWxwIFM4aiiddmzWncx8nfRb+rWhAvla4Tv
	5A=
X-Google-Smtp-Source: AGHT+IEsBvyH0Zky97WuBrKbbjvEScgzySvzxn3rYYtDfdyw86suCq566xBi9HBUjAShIE2Mm9O+XZUWm2PEcQ1RjmQ=
X-Received: by 2002:a05:6512:12ca:b0:553:2ed2:15b4 with SMTP id
 2adb3069b0e04-553b6f4d916mr2068254e87.57.1750065764330; Mon, 16 Jun 2025
 02:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
 <CGME20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8@eucas1p2.samsung.com>
 <202506151839.IKkZs0Z0-lkp@intel.com> <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
In-Reply-To: <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:22:32 +0200
X-Gm-Features: AX0GCFvGdfEg2CPyKVWjNTkacG-9vOyaV6LbrgzY6YJIQBzVINyrlmiwiBnsQKI
Message-ID: <CAMRc=MeG40TxMj3ezeC0iUBBo8w99RXQWOQBsfG4ZAJdbA+dYg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: kernel test robot <lkp@intel.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_022246_089723_2FB6FBC0 
X-CRM114-Status: GOOD (  17.84  )
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMTE6MDnigK9BTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiA2LzE1LzI1IDEyOjUxLCBr
ZXJuZWwgdGVzdCByb2JvdCB3cm90ZToKPiA+IEhpIE1pY2hhbCwKPiA+Cj4gPiBrZXJuZWwgdGVz
dCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgd2FybmluZ3M6Cj4gPgo+ID4gW2F1
dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIDQ3NzRjZmUzNTQzYWJiOGVlOTgwODlmNTM1ZTI4ZWJm
ZDQ1Yjk3NWFdCj4gPgo+ID4gdXJsOiAgICBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3Yx
L3VybD9rPTZjM2JjOTk0LTBjZDk1NGM5LTZjM2E0MmRiLTAwMGJhYmQ5ZjFiYS0zMGMyMzc4ZmEw
MTJmYzRhJnE9MSZlPWMzOWM5NjBjLTRkNWYtNDRkNy1hZWQ3LTAwOTczOTRkZmM4MSZ1PWh0dHBz
JTNBJTJGJTJGZ2l0aHViLmNvbSUyRmludGVsLWxhYi1sa3AlMkZsaW51eCUyRmNvbW1pdHMlMkZN
aWNoYWwtV2lsY3p5bnNraSUyRnBvd2VyLXNlcXVlbmNpbmctQWRkLVQtSEVBRC1USDE1MjAtR1BV
LXBvd2VyLXNlcXVlbmNlci1kcml2ZXIlMkYyMDI1MDYxNS0wMjExNDIKPiA+IGJhc2U6ICAgNDc3
NGNmZTM1NDNhYmI4ZWU5ODA4OWY1MzVlMjhlYmZkNDViOTc1YQo+ID4gcGF0Y2ggbGluazogICAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDYxNC1hcHJfMTRfZm9yX3NlbmRpbmctdjQt
OC04ZTM5NDVjODE5Y2QlNDBzYW1zdW5nLmNvbQo+ID4gcGF0Y2ggc3ViamVjdDogW1BBVENIIHY0
IDgvOF0gZHJtL2ltYWdpbmF0aW9uOiBFbmFibGUgUG93ZXJWUiBkcml2ZXIgZm9yIFJJU0MtVgo+
ID4gY29uZmlnOiByaXNjdi1raXNtZXQtQ09ORklHX0RSTV9HRU1fU0hNRU1fSEVMUEVSLUNPTkZJ
R19EUk1fUE9XRVJWUi0wLTAgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2
ZS8yMDI1MDYxNS8yMDI1MDYxNTE4MzkuSUtrWnMwWjAtbGtwQGludGVsLmNvbS9jb25maWcpCj4g
PiByZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAy
NTA2MTUvMjAyNTA2MTUxODM5LklLa1pzMFowLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+ID4K
PiA+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUu
IG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiA+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtp
bmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiA+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPgo+ID4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L29lLWtidWlsZC1hbGwvMjAyNTA2MTUxODM5LklLa1pzMFowLWxrcEBpbnRlbC5jb20vCj4gPgo+
ID4ga2lzbWV0IHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCj4gPj4+IGtpc21l
dDogV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgRFJNX0dF
TV9TSE1FTV9IRUxQRVIgd2hlbiBzZWxlY3RlZCBieSBEUk1fUE9XRVJWUgo+ID4gICAgV0FSTklO
RzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgRFJNX0dFTV9TSE1FTV9I
RUxQRVIKPiA+ICAgICAgRGVwZW5kcyBvbiBbbl06IEhBU19JT01FTSBbPXldICYmIERSTSBbPXld
ICYmIE1NVSBbPW5dCj4KPiBJIGJlbGlldmUgdGhpcyBpcyB0cmlnZ2VyZWQgYmVjYXVzZSBSSVND
LVYgY2FuIGJlIGNvbXBpbGVkIHdpdGhvdXQgTU1VCj4gc3VwcG9ydCwgd2hpbGUgTU1VIHN1cHBv
cnQgaXMgbWFuZGF0b3J5IGZvciBBUk02NC4KPgo+IFdvdWxkIGFuIGFjY2VwdGFibGUgZml4IGJl
IHRvIHJlcXVpcmUgYW4gZXhwbGljaXQgZGVwZW5kZW5jeSBvbiB0aGUgTU1VLAo+IGxpa2Ugc28/
Cj4KPiBkZXBlbmRzIG9uIChBUk02NCB8fCBSSVNDVikgJiYgTU1VCj4KCkknZCBwdXQgdGhlbSBv
biBzZXBhcmF0ZSBsaW5lcy4gV2hpbGUgYXQgaXQ6IGhvdyBhYm91dCBlbmFibGluZyBidWlsZAp3
aXRoIENPTVBJTEVfVEVTVCB0byBleHRlbmQgYnVpbGQgY292ZXJhZ2UgdG9vPwoKQmFydAoKPiA+
ICAgICAgU2VsZWN0ZWQgYnkgW3ldOgo+ID4gICAgICAtIERSTV9QT1dFUlZSIFs9eV0gJiYgSEFT
X0lPTUVNIFs9eV0gJiYgKEFSTTY0IHx8IFJJU0NWIFs9eV0pICYmIERSTSBbPXldICYmIFBNIFs9
eV0KPiA+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxj
enluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
