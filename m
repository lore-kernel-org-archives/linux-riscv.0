Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CB6C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 22:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgkagaSsiZiFp80grjWEyL7mSZb9sQnn5SGrAm3EzI8=; b=ojT5sH306BTghf
	nv7jrNd0JWHTa9CxftBMdgEg+2rWHtG1Ewtk2j9tzGk264telL+BhhXsHpXM0/Os6IpgvUDr2xKo+
	fscdEtidH0H2HjD+L3w8YR+exvls6DOHgEYBxbMX3YDH5Ey3SmBOdQFHFa1FW/jL0c9hncqhQxOvQ
	tgojFRTNtku1iL8fNRtwlE7mBaML9vHqcWlQpOAT+kVYjlhQ/WkD5EJ6PZMed80o9czV13qvVUDfO
	ztDMww5JhOvFO1VJyuQpnwNgRw3ggnPPaTTPvE20DkiJG5CJs449aJLjwE9kEiEcqqCTWQtjJs5wF
	ql58HDKYvm545lKqQZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnni-00000006IdW-04nb;
	Tue, 15 Jul 2025 22:07:02 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnng-00000006Id6-0qzo
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 22:07:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-31c4a546cc2so4472553a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617219; x=1753222019; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+1bnGTrSGimGK3Zq/YxQ9BHvkckKvMOjIcjntRlGw4=;
        b=gX391aXKhAAS1gnGLxXmaCe0UcgDvM7Tg8YxXD28DLtgxLeoKUyfJrSpf2Fu8wX/mt
         8FnWim2WtRqKslMRX1dLC+WPYyBcP+kkQ8P0+UZEIqXhhecnCQA320oq8gQPDjfDO3L7
         zsvxBKemosGWKUdbJ51ZNZVaZGv9G+5h046Fqp/OE4KBzYIzbiYL+EjWDjOPrZ0MBUHg
         JwWkduVws3CIunDSTA2+4FMhYiV4rFcz5G1Py2qDlW8X8zA145wIVwBBowUDVP7ZFlbl
         3hLjD4R8170DxkchIAQCTLqTg4OrKUhWBbVQcl/vnLKLZWV4M2kfBNVBw6EpXoacKjU2
         l4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617219; x=1753222019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+1bnGTrSGimGK3Zq/YxQ9BHvkckKvMOjIcjntRlGw4=;
        b=Vs4BLRoOl8cuLYNnTMPHL0OThwlZbPnMwnmrcQ1ZG3ztH2zaFEDDngcEU3cXmcE5yE
         1ad/0VirWvnYmd1FDWWf64VcBCAOcLlNZSHtcxNazuZceM5hCR/5rfQnY0Fgjllck6ul
         ZnYHqETdFzlYbO/rA0bWEnD/9wiuI1PglfTZtKO2ndAI+khUHEr89Q0hMIRmryoIi09m
         5zwe77Kql3dKEkNFVbapjFwGtCIQ+3Y3mo+QqEb+O10NQGgII/OinPt0fkPqCXIr1VQf
         eqmFRkP0JtQ6k6ZOLi1RQH24e+FE2BMFTWgHAhoxmkmvH5dal3hplBGz1M6ggkUP/5Vd
         7yYw==
X-Forwarded-Encrypted: i=1; AJvYcCV4nep7Wwgim4lKsIDfDjKI9mfxmapGzterAQSiDPeiKKK3qfAjUCja9svf7c3q7A0XKYkZIwYnd4zLRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/tMnhKFgzm0hRuSzewL3Z27j/ZwbBmWj8WVgT2DGrlohpe3mk
	HrFPO/XO8o1oG3H0c8ya/OQ38FbZmVdyuMNwTHWZowbiJonj3Hi47iCC
X-Gm-Gg: ASbGnculNfZdrw4rQSIJVi3hYWNOOQz8m6Su4MwAE7Hm5ALNaGZEWNlvZttF1GF9HR4
	gRZr8ue7stf10GuBFdbB3h+I/4l/zSP18NCnp3mN5pM7F3nvrWbMsckCwR2BwC8uvJ8P0sLEME2
	ucqqvKCCzUeill5IjL2Q8ojV4FRmY4sWSfiqSuHr+v/9ir09tUBzv+WJcT58mwYwnT1CZtWqJOy
	nUuuHl9192fPNgXmpVG8rA07el4R32QH0LehLkhGXJ+NXhB16Z+CgpK5xh1ddBLd/ScGC9OPuY7
	GwUrnLuBj+KOJQKRXAYtkFCtLC6w4hOlsl2SHvUzF3GDr+xAiO7HIYzAh2gBbFjcraQ6LKdK3FK
	O7MNcJQ5MG85mTOqN655GIQ==
X-Google-Smtp-Source: AGHT+IGA5Go/W11svBOlx+oojZuGSHeTcf6nPxWvkyTAK/25JmtPG/Wzl0xDDQgSb4VJ+3l1d//G6Q==
X-Received: by 2002:a17:90b:2ec7:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-31c9f435537mr372501a91.2.1752617219023;
        Tue, 15 Jul 2025 15:06:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c9f1e61d2sm96213a91.11.2025.07.15.15.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:06:58 -0700 (PDT)
Date: Wed, 16 Jul 2025 06:06:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Richard Cochran <richardcochran@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: sophgo: Add mdio multiplexer device for
 cv18xx
Message-ID: <bww3dwd37ujcnztbzw7o7r2qajwcvn54kcd6pcd42y4axfp2d4@zx5jrtcmkh4k>
References: <20250703021600.125550-1-inochiama@gmail.com>
 <20250703021600.125550-3-inochiama@gmail.com>
 <CAL_JsqLKLKHj+vQJmZnaXRj3TmqR3ELjpBc27HRbTOOP9FD0hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLKLKHj+vQJmZnaXRj3TmqR3ELjpBc27HRbTOOP9FD0hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_150700_245629_41B152CE 
X-CRM114-Status: GOOD (  17.44  )
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

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMTI6NDM6MzVQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA5OjE24oCvUE0gSW5vY2hpIEFtYW90byA8aW5v
Y2hpYW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkIERUIGRldmljZSBub2RlIG9mIG1k
aW8gbXVsdGlwbGV4ZXIgZGV2aWNlIGZvciBjdjE4eHggU29DLgo+IAo+IFRoaXMgYWRkcyBhIGR0
YnNfY2hlY2sgd2FybmluZzoKPiAKPiBtZGlvQDMwMDk4MDAgKG1kaW8tbXV4LW1taW9yZWcpOiBt
ZGlvQDgwOnJlZzowOjA6IDEyOCBpcyBncmVhdGVyIHRoYW4KPiB0aGUgbWF4aW11bSBvZiAzMQo+
IAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5j
b20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaSB8
IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxODB4LmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+
ID4gaW5kZXggN2VlY2M2N2Y4OTZlLi4zYTgyY2M0MGVhMWEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kKPiA+IEBAIC0zMSw2ICszMSwzMyBAQCByc3Q6IHJl
c2V0LWNvbnRyb2xsZXJAMzAwMzAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAjcmVz
ZXQtY2VsbHMgPSA8MT47Cj4gPiAgICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiArICAgICAgICAg
ICAgICAgbWRpbzogbWRpb0AzMDA5ODAwIHsKPiAKPiBUaGUgbm9kZW5hbWUgaXMgd3JvbmcgaGVy
ZSBiZWNhdXNlIHRoaXMgaXMgbm90IGFuIE1ESU8gYnVzLiBJdCBpcyBhCj4gbXV4LiBTbyAibWRp
by1tdXhALi4uIiBmb3IgdGhlIG5vZGUgbmFtZS4KPiAKClRoYW5rcywgSSB3aWxsIHNlbmQgYSBm
aXggZm9yIHRoaXMuCgpSZWdhcmRzLApJbm9jaGkKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
