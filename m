Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD7AC3ABCD
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/7R7a86FLCvuZak+Qg2SAo+p5S6DuyuzYfyHYMkcvs=; b=tN4OpkMyFc7VS9
	7+xsH2bbYLL9LoZzn7JqnUSaTYC0yugBjdo3x6lvZYNwpCyHBqsKvYygp+TXRL5/x4atVXtTxye1G
	AzhXFXPAeMwb29xcL75VemodpYoYghpKi/X6ORpnMGIv69iGDceDApbUu0X6B2p9HFEd+rvDNo0Pb
	uRbAjrMbc2sQ78n9Jbn7a0kbPlLa7QRBH22NlUX+ukVDDsRCMxyShjNWCIzlfBIQZNVOpceqLW3eY
	m6s8msfWVCT/jvCyDbvhUMgMbrzaMWNN7fSpdeVJIEsn1jnBMe44JX5mevymY0vVWUQUR0oNNPeyH
	jyq39wdGNtnhAOf42VMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQNS-000000095wy-27L4;
	Mon, 12 May 2025 10:27:18 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPwI-000000092fu-3c0Q
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 09:59:16 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-30aa3980af5so5182140a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747043953; x=1747648753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3Bg40GR4NpfXrAg/Ch4DnXqg4ghwkqgvCQYfyo4D0=;
        b=ZQw7/JYBAtOHNvYT8B6iNmc7tb+izJUnVHav8EhYxPp2ULH3Ss9I4jpHTyEmtld/hG
         PO9nxS4zTZTRJzVHST3dFtdv/RKRUPHHyRkuvhDz+DSTuPX4zNZ05W2A697q4e6dC6U1
         SPMgy/FvT+BI3y4TCOt+0qK4+z7Px+Djv6HzTyHwR4NQ4lbHRuI+GCxPBSqFu9t8GSQx
         rkzYAHSZ5fTsdmgS4OlILLB2Bjheq3r3hpVK1IQGqTTqUvc3GzY+zNDyb/ePp5ZoKduZ
         UL83/o3Z5BwzmetxwqdR0QgBQovdzErlFkfYTsn+2EhHoWICI3QW3koDt50TAL8MQcFM
         ETiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043953; x=1747648753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf3Bg40GR4NpfXrAg/Ch4DnXqg4ghwkqgvCQYfyo4D0=;
        b=uXVPtFM71ZpR9fFiIp+yrUYSH0vtvumggZx3ZYrof1XdLF4BAZAky8Hy+0sgYla+Hc
         M773+GNC649kqQZfTPbWId0QZatKANkBukXGUhtIYSynkDt8bQIF/LkQE3ha6zme8VRM
         c48fjxQHbFkuHlTRxIyB3ZOvGyvPsWFN4EDhuMADV5wOiWhfLUEKjAVYiU+FYNFS4TUt
         aE41Og5Pn2oXAZ/mGyPmO/c7DbqYFDPmgf1LFeUtF6D4f7OZrd+Ik9b3WroHk2z1i3nM
         niWe2joY6x6szvXMuXQUQdyXmq5A/9HqEjgcDX4BhpekYXVFz8T0pN92iBvIYeFr/Awm
         zVCA==
X-Forwarded-Encrypted: i=1; AJvYcCVMyf/AG0mR2bnRLVkoekRIvQy26leUzCBAWBtJcFeCja0d1n4WqGt45zo7CVnnp8A/zHlH0mFVGv98gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybkGFkDcICNRE2YXPwyN41lp/EkXF/tgKhttSUWT9P2RBGg6wE
	q9xa9LSffTHr4CuLVjWp979JHzsqUF1sNT1ZOIrYaAKKHmRNqyySg5qnfanVr9cznKIzzHXsghx
	IabbtGAFmi7/ZGbM65l6nYoiZwQHEIZS3JzKDBQ==
X-Gm-Gg: ASbGnctWDvQbPJzp6SypwR6+rf3iYTDbvqBUx4TwXMVYs6L75az/gJVNgHucg3PcE36
	FGcRNQpk7pSHbku2qGjMpH4kovcneP5rjYU9m7nKgSYU8Ab+HLOLlZm7orlnqHhzjGulxcHhwJ6
	kHrn09UN1CMSbil8R0MATO/MFK/KLhX5/2rx66KwKQ2G2IlMImOoa7n0ni72gLxlwSBQ==
X-Google-Smtp-Source: AGHT+IFmptyqWaBaNLC9k0gsNSW1Mdny4736KNzExVRpf+rPHHgsVAfgbx/JtvVdU///OameWngynORVG+ED15XYxz0=
X-Received: by 2002:a17:90b:164f:b0:30a:4d18:c71b with SMTP id
 98e67ed59e1d1-30c3d3eb986mr18159261a91.20.1747043953353; Mon, 12 May 2025
 02:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com> <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
In-Reply-To: <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Mon, 12 May 2025 15:28:37 +0530
X-Gm-Features: AX0GCFtBWusa8PQze3o0UbkP-799T9yoI70LiT3XQ9z7ouWVSYyLKKQP5YJzFHg
Message-ID: <CA+Oz1=ZXJOrXT28V+MVSmvh-4ddnwZ8hJAFzB6tmNbcohLMT=g@mail.gmail.com>
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_025914_906583_193D679A 
X-CRM114-Status: GOOD (  37.65  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, rahul@summations.net, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMTI6MzjigK9QTSBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAxMSwg
MjAyNSBhdCAwNzowOToyNlBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gRnJvbTogUmFo
dWwgUGF0aGFrIDxycGF0aGFrQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gVGhlIFJQTUkgc3Bl
Y2lmaWNhdGlvbiBkZWZpbmVzIGEgY2xvY2sgc2VydmljZSBncm91cCB3aGljaCBjYW4gYmUKPiA+
IGFjY2Vzc2VkIHZpYSBTQkkgTVBYWSBleHRlbnNpb24gb3IgZGVkaWNhdGVkIFMtbW9kZSBSUE1J
IHRyYW5zcG9ydC4KPiA+Cj4gPiBBZGQgbWFpbGJveCBjbGllbnQgYmFzZWQgY2xvY2sgZHJpdmVy
IGZvciB0aGUgUklTQy1WIFJQTUkgY2xvY2sKPiA+IHNlcnZpY2UgZ3JvdXAuCj4KPiAuLi4KPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgv
ZXJyLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21haWxib3hfY2xpZW50Lmg+Cj4gPiArI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4KPiA+ICsjaW5jbHVkZSA8bGludXgvbWFpbGJveC9yaXNjdi1ycG1pLW1lc3NhZ2UuaD4KPgo+
IEp1c3QgdG8gcG9pbnQgb3V0IGFnYWluIHRoYXQgdGhlIGFib3ZlIG1pc3NlcyBhIGxvdCBvZiBo
ZWFkZXJzIGRlZmluaXRpb25zCj4gYW5kL29yIEFQSXMgdGhpcyBkcml2ZXIgdXNlcy4gRm9sbG93
IElXWVUgcHJpbmNpcGxlLgoKU3VyZQoKPgo+IC4uLgo+Cj4gPiArI2RlZmluZSBHRVRfUkFURV9V
NjQoaGlfdTMyLCBsb191MzIpICgodTY0KShoaV91MzIpIDw8IDMyIHwgKGxvX3UzMikpCj4KPiBI
bW0uLi4gUGVyaGFwcyBhZGQgdGhpcyBraW5kIG9mIG1hY3JvIHRvIHdvcmRwYXJ0LmggPyBJSVJD
IG5vdCBvbmx5IHRoaXMgZHJpdmVyCj4gdXNlcyBzb21ldGhpbmcgbGlrZSB0aGlzLgo+CgpTdXJl
LCBpdCBtYWtlcyBzZW5zZS4KCj4gLi4uCj4KPiA+ICtlbnVtIHJwbWlfY2xrX3R5cGUgewo+ID4g
KyAgICAgUlBNSV9DTEtfRElTQ1JFVEUgPSAwLAo+ID4gKyAgICAgUlBNSV9DTEtfTElORUFSID0g
MSwKPgo+ID4gKyAgICAgUlBNSV9DTEtfVFlQRV9NQVhfSURYLAo+Cj4gTm8gY29tbWEgZm9yIHRo
ZSB0ZXJtaW5hdG9yLiBQbGVhc2UsIGNsZWFuIGFsbCB0aGVzZSBjYXNlcy4KClN1cmUKCj4KPiA+
ICt9Owo+Cj4gLi4uCj4KPiA+ICt1bmlvbiBycG1pX2Nsa19yYXRlcyB7Cj4gPiArICAgICB1NjQg
ZGlzY3JldGVbUlBNSV9DTEtfRElTQ1JFVEVfTUFYX05VTV9SQVRFU107Cj4gPiArICAgICBzdHJ1
Y3Qgewo+ID4gKyAgICAgICAgICAgICB1NjQgbWluOwo+ID4gKyAgICAgICAgICAgICB1NjQgbWF4
Owo+ID4gKyAgICAgICAgICAgICB1NjQgc3RlcDsKPiA+ICsgICAgIH0gbGluZWFyOwo+Cj4gSGF2
ZSB5b3UgbG9va2VkIGF0IHRoZSBsaW5lYXIgcmFuZ2VzIGxpYnJhcnkgd2UgaGF2ZSBpbiB0aGUg
a2VybmVsPyBDYW4geW91Cj4gdXRpbGlzZSBpdCBoZXJlPwoKT2ssIGkgd2lsbCBjaGVjawoKPgo+
ID4gK307Cj4KPiAuLi4KPgo+ID4gK3N0cnVjdCBycG1pX2NsayB7Cj4gPiArICAgICBzdHJ1Y3Qg
cnBtaV9jbGtfY29udGV4dCAqY29udGV4dDsKPiA+ICsgICAgIHUzMiBpZDsKPiA+ICsgICAgIHUz
MiBudW1fcmF0ZXM7Cj4gPiArICAgICB1MzIgdHJhbnNpdGlvbl9sYXRlbmN5Owo+ID4gKyAgICAg
ZW51bSBycG1pX2Nsa190eXBlIHR5cGU7Cj4gPiArICAgICB1bmlvbiBycG1pX2Nsa19yYXRlcyAq
cmF0ZXM7Cj4gPiArICAgICBjaGFyIG5hbWVbUlBNSV9DTEtfTkFNRV9MRU5dOwo+ID4gKyAgICAg
c3RydWN0IGNsa19odyBodzsKPgo+IEp1c3QgYSByZW1pbmRlciB0byB1c2UgYHBhaG9sZWAgdG8g
Y2hlY2sgdGhhdCB5b3VyIGRhdGEgbGF5b3V0IGlzIG9wdGltaXNlZCBmb3IKPiBtZW1vcnkgY29u
c3VtcHRpb24uCgpPaywgaSB3aWxsIGNoZWNrCgo+Cj4gPiArfTsKPgo+IC4uLgo+Cj4gPiArc3Ry
dWN0IHJwbWlfZ2V0X3N1cHBfcmF0ZXNfcnggewo+ID4gKyAgICAgdTMyIHN0YXR1czsKPiA+ICsg
ICAgIHUzMiBmbGFnczsKPiA+ICsgICAgIHUzMiByZW1haW5pbmc7Cj4gPiArICAgICB1MzIgcmV0
dXJuZWQ7Cj4gPiArICAgICB1MzIgcmF0ZXNbXTsKPiA+ICt9Owo+Cj4gSXMgaXQgQUJJPyAoSSBt
ZWFuIGlmIHRoaXMgaXMgaW50ZXJmYWNlIHdpdGggc29tZSBraW5kIG9mIEZXKQo+IElmIHNvLCBV
c2UgcHJvcGVyIGVuZGlhbmVzcyBhd2FyZSB0eXBlcy4gU2FtZSBRIGZvciBhbGwgZGF0YQo+IHR5
cGVzIGRlZmluZWQgaW4gdGhpcyBkcml2ZXIuCgpTdXJlLgoKSXQncyB0aGUgbWVzc2FnZSBmb3Jt
YXQgZGVmaW5lZCBieSB0aGUgUklTQy1WIFJQTUkgc3BlYy4KCgo+Cj4gLi4uCj4KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgcngtPnJldHVybmVkOyBqKyspIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyYXRlaWR4ID49IChjbGtfcmF0ZV9p
ZHggKyByeC0+cmV0dXJuZWQpKQo+Cj4gVG9vIG1hbnkgcGFyZW50aGVzZXMuCgpPaywgd2lsbCBy
ZW1vdmUKCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBycG1pX2Nsay0+cmF0ZXMtPmRpc2Ny
ZXRlW3JhdGVpZHgrK10gPQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBHRVRfUkFURV9VNjQocmF0ZV9kaXNjcmV0ZVtqXS5oaSwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJhdGVfZGlzY3JldGVbal0ubG8pOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgfQo+Cj4gLi4uCj4K
PiA+ICsgICAgIGRldm1fa2ZyZWUoY29udGV4dC0+ZGV2LCByeCk7Cj4KPiBXaHk/ISBUaGlzIGlz
IGEgcmVkIGZsYWcgdG8gcG9pbnQgdGhhdCBoZXJlIGlzIG1pc3VuZGVyc3RhbmRpbmcgb3IgYWJ1
c2Ugb2YKPiBtYW5hZ2VkIHJlc291cmNlcyBhcHByb2FjaC4gRWl0aGVyIHVzZSBfX0ZyZWUoKSBm
cm9tIGNsZWFudXAuaCBvciBkb24ndCBjYWxsCj4gZGV2bV9rZnJlZSgpLiBUaGUgbGF0dGVyIG11
c3QgaGF2ZSBhIHZlcnkgZ29vZCBqdXN0aWZpY2F0aW9uIHRvIGV4cGxhaW4gd2h5LgoKWWVhaCwg
SSB0aGluayBpdCdzIGJldHRlciB0byB1c2Uga3phbGxvYyBmb3IgdGhpcyBjYXNlIGFuZCB0aGVu
IGZyZWUgaXQuCgoKPgo+ID4gKyAgICAgcmV0dXJuIDA7Cj4KPiAodGhpcyBpcyBldmVuIG5vdCBh
biBlcnJvciBwYXRoLCB3aGVyZSBpdCBtaWdodCBoYXZlIGEgbGl0dGxlIGFyZ3VtZW50IGZvcikK
Pgo+IC4uLgo+Cj4gPiArICAgICAvKiBLZWVwIHRoZSByZXF1ZXN0ZWQgcmF0ZSBpZiB0aGUgY2xv
Y2sgZm9ybWF0Cj4gPiArICAgICAgKiBpcyBvZiBkaXNjcmV0ZSB0eXBlLiBMZXQgdGhlIHBsYXRm
b3JtIHdoaWNoCj4gPiArICAgICAgKiBpcyBhY3R1YWxseSBjb250cm9sbGluZyB0aGUgY2xvY2sg
aGFuZGxlIHRoYXQuCj4gPiArICAgICAgKi8KPgo+IC8qCj4gICogVXNlIHByb3BlciBzdHlsZSBm
b3IgdGhlIG11bHRpLWxpbmUgY29tbWVudHMuIFlvdSBjYW4KPiAgKiByZWZlciB0byB0aGlzIGNv
bW1lbnQgYXMgYW4gZXhhbXBsZS4KClllcywgSSB3aWxsIGNvcnJlY3QgaXQuCgo+ICAqLwo+Cj4g
Li4uCj4KPiA+ICtvdXQ6Cj4KPiBSZWR1bmRhbnQgbGFiZWwuIE5vdGUsIHRoZSBsYWJlbHMgYXJl
IHJlY29tbWVuZGVkIHRvIGJlIG5hbWVkIGFmdGVyIHRoZSBmbG93Cj4gdGhleSB3aWxsIHJ1biBp
ZiBnb3RvLiBUaGlzIG9uZSBjYW4gYmUgbmFtZWQgYXMgb3V0X2xpdGVyYWxseV93aXRoX3JldHVy
bl8wLAo+IHdoaWNoIG1ha2VzIGl0IG9idmlvdXMgaG93IHVzZWxlc3MgaXQgaXMuCgpJIHdpbGwg
aW1wcm92ZSB0aGUgZmxvdy4KCj4KPiA+ICsgICAgIHJldHVybiAwOwo+Cj4gLi4uCj4KPiA+ICsg
ICAgIHJhdGVzID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKHVuaW9uIHJwbWlfY2xrX3JhdGVz
KSwgR0ZQX0tFUk5FTCk7Cj4KPiBzaXplb2YoKi4uLikKPgo+ID4gKyAgICAgaWYgKCFyYXRlcykK
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4gPiArCj4gPiArICAg
ICBycG1pX2NsayA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZihzdHJ1Y3QgcnBtaV9jbGspLCBH
RlBfS0VSTkVMKTsKPgo+IERpdHRvLgo+Cj4gPiArICAgICBpZiAoIXJwbWlfY2xrKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPgo+IC4uLgo+Cj4gPiArICAgICBy
ZXQgPSBycG1pX2Nsa19nZXRfc3VwcG9ydGVkX3JhdGVzKGNsa2lkLCBycG1pX2Nsayk7Cj4gPiAr
ICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wdHJfcHJvYmUo
ZGV2LCByZXQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgIkdldCBzdXBwb3J0ZWQgcmF0ZXMg
ZmFpbGVkIGZvciBjbGstJXUsICVkXG4iLCBjbGtpZCwgcmV0KTsKPgo+IEluZGVudGF0aW9uIGlz
c3Vlcy4gUmVwZXRpdGl2ZSByZXQgaW4gdGhlIG1lc3NhZ2UuIFBsZWFzZSwgZ2V0IGZhbWlsaWFy
IHdpdGgKPiB0aGUgZm9ybWF0IGRldl9lcnJfcHJvYmUoKSB1c2VzLgoKT2ssIEkgd2lsbCBjb3Jy
ZWN0LgoKPgo+IC4uLgo+Cj4gPiArICAgICBpbnQgcmV0LCBudW1fY2xvY2tzLCBpOwo+Cj4gV2h5
IGlzICdpJyBzaWduZWQ/CgpUaGlzIGFuZCBudW1fY2xvY2tzIGNhbiBiZSB1bnNpZ25lZCwgd2ls
bCBjaGFuZ2UuCj4KPiAuLi4KPgo+ID4gKyAgICAgLyogQWxsb2NhdGUgUlBNSSBjbG9jayBjb250
ZXh0ICovCj4gPiArICAgICBjb250ZXh0ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpjb250
ZXh0KSwgR0ZQX0tFUk5FTCk7Cj4KPiBIYS1oYSwgeW91IGhhdmUgZXZlbiBpbmNvbnNpc3RlbnQg
c3R5bGUgaW4gdGhlIHNhbWUgZmlsZSEgU28sIGdvIHRocm91Z2ggdGhlCj4gd2hvbGUgc2VyaWVz
IGFuZCBtYWtlIHN1cmUgdGhhdCB0aGUgc3R5bGUgdXNlZCBpbiBlYWNoIGZpbGUgaXMgY29uc2lz
dGVudC4KClllYWgsIHRoYXQncyBiZWNhdXNlIHRoZXJlIGFyZSBtdWx0aXBsZSBkZXZzIGluIHRo
aXMgc2VyaWVzLgpJIHdpbGwgaW1wcm92ZSB0aGF0LgoKPgo+ID4gKyAgICAgaWYgKCFjb250ZXh0
KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPgo+IC4uLgo+Cj4gPiArICAgICAv
KiBWYWxpZGF0ZSBSUE1JIHNwZWNpZmljYXRpb24gdmVyc2lvbiAqLwo+ID4gKyAgICAgcnBtaV9t
Ym94X2luaXRfZ2V0X2F0dHJpYnV0ZSgmbXNnLCBSUE1JX01CT1hfQVRUUl9TUEVDX1ZFUlNJT04p
Owo+ID4gKyAgICAgcmV0ID0gcnBtaV9tYm94X3NlbmRfbWVzc2FnZShjb250ZXh0LT5jaGFuLCAm
bXNnKTsKPiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X2Vycl9wcm9i
ZShkZXYsIHJldCwgIkZhaWxlZCB0byBnZXQgc3BlYyB2ZXJzaW9uXG4iKTsKPiA+ICsgICAgICAg
ICAgICAgZ290byBmYWlsX2ZyZWVfY2hhbm5lbDsKPgo+IFRoaXMgaXMgc2ltcGx5IHdyb25nLiBZ
b3Ugc2hvdWxkIG5vdCBkbyBnb3RvIGJlZm9yZSBhbnkgZGV2bV8qKCkgY2FsbHMuCj4gVGhlIGVy
cm9yIHBhdGggYW5kIC0+cmVtb3ZlKCksIGlmIHByZXNlbnQpIGlzIGJyb2tlbi4gRml4IGl0IGFj
Y29yZGluZ2x5Lgo+Cj4gSGVyZSBzaG91bGQgYmUKPgo+ICAgICAgICAgICAgICAgICByZXR1cm4g
ZGV2X2Vycl9wcm9iZSguLi4pOwo+Cj4gaXQncyB5b3VyIGhvbWV3b3JrIHRvIHVuZGVyc3RhbmQg
aG93IHRvIGFjaGlldmUgdGhhdC4gUGxlbnR5IG9mIHRoZSBleGFtcGxlcyBpbgo+IHRoZSBrZXJu
ZWwuCj4KClN1cmUKCj4gPiArICAgICB9Cj4KPiAuLi4KPgo+ID4gK2VudW0gcnBtaV9jbG9ja19z
ZXJ2aWNlX2lkIHsKPiA+ICsgICAgIFJQTUlfQ0xLX1NSVl9FTkFCTEVfTk9USUZJQ0FUSU9OID0g
MHgwMSwKPiA+ICsgICAgIFJQTUlfQ0xLX1NSVl9HRVRfTlVNX0NMT0NLUyA9IDB4MDIsCj4gPiAr
ICAgICBSUE1JX0NMS19TUlZfR0VUX0FUVFJJQlVURVMgPSAweDAzLAo+ID4gKyAgICAgUlBNSV9D
TEtfU1JWX0dFVF9TVVBQT1JURURfUkFURVMgPSAweDA0LAo+ID4gKyAgICAgUlBNSV9DTEtfU1JW
X1NFVF9DT05GSUcgPSAweDA1LAo+ID4gKyAgICAgUlBNSV9DTEtfU1JWX0dFVF9DT05GSUcgPSAw
eDA2LAo+ID4gKyAgICAgUlBNSV9DTEtfU1JWX1NFVF9SQVRFID0gMHgwNywKPiA+ICsgICAgIFJQ
TUlfQ0xLX1NSVl9HRVRfUkFURSA9IDB4MDgsCj4KPiA+ICsgICAgIFJQTUlfQ0xLX1NSVl9JRF9N
QVhfQ09VTlQsCj4KPiBObyBjb21tYSBpbiB0aGUgdGVybWluYXRvciBsaW5lLgoKT2sKCj4KPiA+
ICt9Owo+Cj4gLS0KPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBBbmR5IFNoZXZjaGVua28KPgo+CgoK
VGhhbmtzCgpSYWh1bCBQYXRoYWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
