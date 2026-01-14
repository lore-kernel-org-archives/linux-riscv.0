Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7222D31A06
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 02:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG8Ii+QXnrc7RoqkLbWL67l/MI+uVfYgiiTwX8d7fpc=; b=uFHNJhtgE6WRU6
	72NjeTnxj2L3BplDPd1JzF3gGxSPeL85fPe7VtA5SxpD1WacGoKpub6r7geD1lblhWJH8RL6F97k4
	qLxi5XKrd/VC5rCi0T06l+i3yUiOinE4mYIDyu8usEV3P+bKUy7TpF8DYmKUB1CdB81mhIjUR64Di
	epQqMv8zctGw5hi6nSCurX2EAPf5bDCBaLPjv5UgMOIedNPPwZLL4BK02py+DxTqE6p58lfzZaIIO
	nHkeJORXR3Sd1p2yPuYyrz6x9jWFIz8y1jrN9xINpRlCiSmX+1mdC/xcs0jvV9OIqwrbV3ypEL2gU
	qhJ56P0ZoY1iyMz+Hfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqhh-00000007zlS-2PjC;
	Wed, 14 Jan 2026 02:33:49 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqhe-00000007zl3-3qTO
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 02:33:48 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7927b1620ddso7635957b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768358025; x=1768962825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=nHSIb1WVnIMePHF0rgcHD1udueaFqIEYTE543msAYjixGnTnHDfLsc8kuOSZJh+C7T
         fc0DKpOkYuC6LZwqibL9TDro4cVmfA7iORGvZgaBQIE31fzHplTDUSNug16RkIBlU7Id
         joZ2HdIExe54J1c3jh1iYUeWbj+jA1Cam3aBPGOQ9ZVgPXC+Zp5UwE2vsLA10HBhVWwQ
         hksoulMwMnoAkjZ6yRJGfXV83zkwxzymgpIaTItUEVGpRkYwU4sH91YQ0NLeaTsnOZ2g
         m8zjYo/AjDJFQeRs8Jxx38zxiIITV5uRDtPiIxcLdOP1Jv/GuJaBwwHI+O+gNP4YYRyN
         Iz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768358025; x=1768962825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=FLtEp4j9sfhDsZekGa9vdMCJh5DiLNaEoDrfiz0Khsuis5uTz0Apj6RC3XlI/n7WhW
         7pDFLm3AdePuOH3TIZRBkZEtkVd5eay/o0ngXKQIGWqKVmJ4mIt/dwqjzJZtRglRbthx
         xbvIfQJEkvNQvQ7AAhRHfC07vJa+OhUD1zdhBeq0nDdR4HpS+9KirCF9OoeFgBRFF/qR
         1Yn4qyDiTcR64EvTR6XVeabGtVGYyPyWwP/yx2uC5P8g2prW+vnhgDQbERj5TM7eIa/1
         6bZnhzvVqLAZs3FvpaY/ab/gRE06exMZS6LJ0DHfiERz6ZhDQZhEWrmn/19Vo6iI+BTA
         LP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUzBdnAd+AYdald3AWXimwIOfuVaq4OkZWchQ+9kCIsS4fg9AXTk7u7OHZlOWgx5PyPk+zZ5TISYAAnUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9V0gC9lnp58KXZGun6FWHDhb8Ox2rNe0JgHPOjqRPE7m+lr+Q
	L+FxYdWybuC+BlV8VwUwxa7/8wv8O5ABs0gjMy8llTVNXM1g+cPz7S7jbb6j3yGGPpIfWPd+Cov
	h2j63rQe6gpYecCyW79uc0f0PVkbiXxAz32jVTBEwQA==
X-Gm-Gg: AY/fxX5CvM0zlZ6bv/uWS8sJ0Xkf5vumSOen8IORN1jSVg01brZctMBsvUo19crwALa
	O77zNfFU9/5lVy26wMFtXIHwe5jwZNb+sKsw2HB2lOWSsW4gYTacb7QDxbgGfw6UVSW8FINVGLg
	UPJH+i13gTquKPjzB9pk3CRNKuOiOq3k3XzxLqacskumirM5JEvoUhdZyua/B0/Wj36MftwC9kZ
	qps9n6iGEt0UkC51Xx7klHD+xirCqTsAku/0mjJGJyWCkT+OOs71UcGRmO5vum3GvzI+XvRL5BD
	vaJeNEyVIUDCdbdrkrM2878Z6Om+jDE5vxnadA==
X-Received: by 2002:a05:690e:d45:b0:63e:1563:4801 with SMTP id
 956f58d0204a3-649023ff038mr916948d50.22.1768358025225; Tue, 13 Jan 2026
 18:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
In-Reply-To: <20260113075339-GYA25466@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 Jan 2026 10:33:34 +0800
X-Gm-Features: AZwV_QiwlJO3ZADv09NVm7VZL0Pi5fI-J1pRA-OmeKisX5gdDwuQlnWQ0Nwjwhc
Message-ID: <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_183347_084083_3C5396B6 
X-CRM114-Status: GOOD (  16.22  )
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

SGksIENvbm9yLCBZaXh1bgoKT24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMzo1M+KAr1BNIFlpeHVu
IExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsCj4KPgo+IE9uIDE1
OjQ1IFR1ZSAxMyBKYW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+ICJiIiBpcyByYXRpZmll
ZCAoQXByLzIwMjQpIG11Y2ggbGF0ZXIgdGhhbiBpdHMgY29tcG9uZW50cyB6YmEvemJiL3picwo+
ID4gKEp1bi8yMDIxKS4gV2l0aCAiYiIgYWRkZWQgaW50byByaXNjdi9leHRlbnNpb25zLnlhbWws
IGEgZGVwZW5kZW5jeQo+ID4gY2hlY2tpbmcgcnVsZSBpcyBub3cgZW5mb3JjZWQsIHdoaWNoIHJl
cXVpcmVzIHRoYXQgd2hlbiB6YmEsIHpiYiwgYW5kIHpicwo+ID4gYXJlIGFsbCBzcGVjaWZpZWQs
ICJiIiBtdXN0IGJlIGFkZGVkIGFzIHdlbGwuIEZhaWxpbmcgdG8gZG8gdGhpcyB3aWxsCj4gPiBj
YXVzZSBkdGJzX2NoZWNrIHNjaGVtYSBjaGVjayB3YXJuaW5ncy4KPiA+Cj4gPiBBY2NvcmRpbmcg
dG8gdWFiaS5yc3QsIGFzIGEgc2luZ2xlLWxldHRlciBleHRlbnNpb24sICJiIiBzaG91bGQgYmUg
YWRkZWQKPiA+IGFmdGVyICJjIiBpbiBjYW5vbmljYWwgb3JkZXIuCj4gPgo+ID4gVXBkYXRlIGV4
aXN0aW5nIGRldmljZXRyZWUgZmlsZXMgdG8gY29uZm9ybSB0byB0aGlzIHJ1bGUuIExpbmUgYmFs
YW5jaW5nCj4gPiBpcyBwZXJmb3JtZWQgd2hlcmUgbmVlZGVkIHRvIGltcHJvdmUgcmVhZGFiaWxp
dHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5j
b20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FubG9naWMvZHIxdjkwLmR0c2kg
ICAgIHwgICA1ICstCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LWNwdXMu
ZHRzaSB8IDI1NiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9i
b290L2R0cy9zcGFjZW1pdC9rMS5kdHNpICAgICAgICB8ICAzMiArKy0tCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMTQ2IGRlbGV0aW9ucygtKQo+IHBsZWFzZSBoYXZl
IHNlcGFyYXRlZCBwYXRjaCBmb3IgZGlmZmVyZW50IFNvQ3MsIHNvIHRoZXkgY2FuIGdvIHZpYQoK
VW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4uCgo+IHRoZWlyIG93biBTb0MgdHJlZS4uIHRoYW5rcwoK
Q29ub3IsIGlzIGl0IHBvc3NpYmxlIHRvIHRha2UgdGhpcyBhcyBvbmUgcGF0Y2ggaW5zdGVhZD8K
Ckl0IGZpeGVzIHRoZSBzYW1lIGR0YnNfY2hlY2sgd2FybmluZ3MgZnJvbSByaXNjdi9leHRlbnNp
b25zLnlhbWwgYWNyb3NzIHRocmVlClNvQ3MuIEtlZXBpbmcgdGhlbSB0b2dldGhlciBtYWludGFp
bnMgcmVhZGFiaWxpdHkgYW5kIGNsZWFyIHRyYWNraW5nLCBJTUhPLgoKSGFwcHkgdG8gc3BsaXQg
aWYgbmVlZGVkLCBidXQgd2FudGVkIHRvIGNoZWNrIGZpcnN0LgoKVGhhbmtzLApHdW9kb25nCgo+
Cj4gLS0KPiBZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
