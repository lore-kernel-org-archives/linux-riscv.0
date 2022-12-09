Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72BFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 02:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4ofco2LQnBhecDEgpj5Sd4AkV1qd1r3tUAvK2/A6CM=; b=fzN3mwcjFCbVvH
	dpOb1SjTmWn9sFlGvgD2iCi6YfYvluOciXFbxO7RBb1TA8NfRpk7+7+Ji0L/P1hYlKig4P+rmAVJd
	vXgjP3bH3bO2Dz2gRTkd5nTYH66CG2eUlUw52IAq9oESfVxo07m9X7IQZvEDhWPGCSGumLJ6DYe7O
	sRwnr7NgeovESfsGvm3pZvoG0uxx0OVbS3eH4t8AU0cUgAtaTiiMHVO/MiwMrdTMAC3+NW10TIXvi
	vdZ6vHpn9I9uVQ21Z1ZJvy5Hnmcaf5owTzNUBRtLvU97z3LrpdZU+pFfbtljxZqYVK2+/dGkGUnE2
	U3JBRRLuKEJ8+LKNH2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Sq6-000lJ9-OE; Fri, 09 Dec 2022 02:10:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Spy-000l8p-Jk
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 02:10:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16DF8B8270B
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388A5C4339E
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670551803;
	bh=Ia3V72Uk7M4KXmgjLjEt+8wDzqEqpUXfSTB4GcRrC0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D9c2U83ObEmD3eWcNvD9nAYLfsSKLqytAljVRtOqFbLravBvSJh76EWTTYjb3xbSD
	 2A4mfWTkFJNHkKEdXkdov4ZXzkq570D2LIl/2YhhUcSE4rD1XDeasAAKlzr/ZYw1Ms
	 xcNjmDJrnGmdrsHMbKmlTLOfbQ2f8sbDDAzgnC+lLRFMAg9q+wEEKnQfci5bK2vsg1
	 ZvB04ge3qN5XyTZQK/KH1t8Me+SZH6fp734MAeqIM7ifIrRxL2oh2/iAc5/uwEqqxo
	 eyLLaRIp3GCjx0Us81ZS2VOuIL1z+/NYvrQvY/751t73Pj36ZAZ4CODEzak6BIjFOf
	 8MrjDP+tfFSxg==
Received: by mail-ej1-f42.google.com with SMTP id vp12so8290834ejc.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 18:10:03 -0800 (PST)
X-Gm-Message-State: ANoB5pmPV5jHiAAVxcxjf78s8axlR71Gb4xDfJ3wgHjHaXc6NyVG4EPd
	HEO7pFl+NBLRG5P9l6BjDOnxbPHxjWYc5uvbnZc=
X-Google-Smtp-Source: AA0mqf7vJJcYsX9o1C4cJqIT0SLKDAkYd+pPh2biTTTXnkbzmntY1yMQBnusQEQqyuAYUACSW7hpi16d7JAo34sLwQg=
X-Received: by 2002:a17:906:8309:b0:7c0:dab0:d722 with SMTP id
 j9-20020a170906830900b007c0dab0d722mr17095382ejx.353.1670551801415; Thu, 08
 Dec 2022 18:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20221208025816.138712-1-guoren@kernel.org> <20221208025816.138712-10-guoren@kernel.org>
 <87o7sew6ey.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87o7sew6ey.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 9 Dec 2022 10:09:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT1YNubBG_RMzwsWVXk0X0nwQvTM2r5NjRvVN+1x1RHMw@mail.gmail.com>
Message-ID: <CAJF2gTT1YNubBG_RMzwsWVXk0X0nwQvTM2r5NjRvVN+1x1RHMw@mail.gmail.com>
Subject: Re: [PATCH -next V10 09/10] riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	ben@decadent.org.uk, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_181007_007014_1F572E4D 
X-CRM114-Status: GOOD (  26.19  )
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

T24gVGh1LCBEZWMgOCwgMjAyMiBhdCA2OjEyIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gQWRkIHRoZSBIQVZFX1NP
RlRJUlFfT05fT1dOX1NUQUNLIGZlYXR1cmUgZm9yIHRoZSBJUlFfU1RBQ0tTIGNvbmZpZy4gVGhl
Cj4gPiBpcnEgYW5kIHNvZnRpcnEgdXNlIHRoZSBzYW1lIGluZGVwZW5kZW50IGlycV9zdGFjayBv
ZiBwZXJjcHUgYnkgdGltZQo+ID4gZGl2aXNpb24gbXVsdGlwbGV4aW5nLgo+ID4KPiA+IFRlc3Rl
ZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1i
eTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICB8ICA3ICsrKystLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYyB8IDMzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCAwYTlkNGJkYzAzMzgu
LmJkNGM0YWU0Y2RjOSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysr
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtNDQ3LDEyICs0NDcsMTMgQEAgY29uZmlnIEZQ
VQo+ID4gICAgICAgICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+
ID4KPiA+ICBjb25maWcgSVJRX1NUQUNLUwo+ID4gLSAgICAgYm9vbCAiSW5kZXBlbmRlbnQgaXJx
IHN0YWNrcyIgaWYgRVhQRVJUCj4gPiArICAgICBib29sICJJbmRlcGVuZGVudCBpcnEgJiBzb2Z0
aXJxIHN0YWNrcyIgaWYgRVhQRVJUCj4gPiAgICAgICBkZWZhdWx0IHkKPiA+ICAgICAgIHNlbGVj
dCBIQVZFX0lSUV9FWElUX09OX0lSUV9TVEFDSwo+ID4gKyAgICAgc2VsZWN0IEhBVkVfU09GVElS
UV9PTl9PV05fU1RBQ0sKPgo+IEhBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLIGlzIHVzZWQgYnkg
c29mdGlycS5jIFNob3VsZG4ndCB0aGF0IGJlCj4gc2VsZWN0ZWQgaW50cm9kdWNlZCBpbiB0aGlz
IHBhdGNoLCBpbnN0ZWFkIG9mIHRoZSBwcmV2aW91cyBvbmU/ClRoaXMgcGF0Y2ggZGVwZW5kcyBv
biB0aGUgcHJldmlvdXMgb25lLiBBbmQgdGhlIHByZXZpb3VzIG9uZSBjb3VsZAp3b3JrIHNlcGFy
YXRlbHkuCgo+Cj4gPiAgICAgICBoZWxwCj4gPiAtICAgICAgIEFkZCBpbmRlcGVuZGVudCBpcnEg
c3RhY2tzIGZvciBwZXJjcHUgdG8gcHJldmVudCBrZXJuZWwgc3RhY2sgb3ZlcmZsb3dzLgo+ID4g
LSAgICAgICBXZSBtYXkgc2F2ZSBzb21lIG1lbW9yeSBmb290cHJpbnQgYnkgZGlzYWJsaW5nIElS
UV9TVEFDS1MuCj4gPiArICAgICAgIEFkZCBpbmRlcGVuZGVudCBpcnEgJiBzb2Z0aXJxIHN0YWNr
cyBmb3IgcGVyY3B1IHRvIHByZXZlbnQga2VybmVsIHN0YWNrCj4gPiArICAgICAgIG92ZXJmbG93
cy4gV2UgbWF5IHNhdmUgc29tZSBtZW1vcnkgZm9vdHByaW50IGJ5IGRpc2FibGluZyBJUlFfU1RB
Q0tTLgo+Cj4gU2FtZSBjb21tZW50IGZyb20gcHJldmlvdXMgcGF0Y2guIFBsZWFzZSB1c2UgdGhl
IHNhbWUgd29yZGluZy9jb25maWcgYXMKPiBvdGhlciBhcmNocy4KPgo+ID4gIGVuZG1lbnUgIyAi
UGxhdGZvcm0gdHlwZSIKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaXJx
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYwo+ID4gaW5kZXggNWQ3N2Y2OTJiMTk4Li5hNjQw
NmRhMzQ5MzcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYwo+ID4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMKPiA+IEBAIC0xMSw2ICsxMSw3IEBACj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9zbXAuaD4KPiA+ICAj
aW5jbHVkZSA8YXNtL3ZtYXBfc3RhY2suaD4KPiA+ICsjaW5jbHVkZSA8YXNtL3NvZnRpcnFfc3Rh
Y2suaD4KPiA+Cj4gPiAgI2lmZGVmIENPTkZJR19JUlFfU1RBQ0tTCj4gPiAgc3RhdGljIERFRklO
RV9QRVJfQ1BVKHVsb25nICosIGlycV9zdGFja19wdHIpOwo+ID4gQEAgLTM4LDYgKzM5LDM4IEBA
IHN0YXRpYyB2b2lkIGluaXRfaXJxX3N0YWNrcyh2b2lkKQo+ID4gICAgICAgICAgICAgICBwZXJf
Y3B1KGlycV9zdGFja19wdHIsIGNwdSkgPSBwZXJfY3B1KGlycV9zdGFjaywgY3B1KTsKPiA+ICB9
Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19WTUFQX1NUQUNLICovCj4gPiArCj4gPiArI2lmZGVmIENP
TkZJR19IQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLCj4gPiArdm9pZCBkb19zb2Z0aXJxX293bl9z
dGFjayh2b2lkKQo+ID4gK3sKPiA+ICsjaWZkZWYgQ09ORklHX0lSUV9TVEFDS1MKPiA+ICsgICAg
IGlmIChvbl90aHJlYWRfc3RhY2soKSkgewo+ID4gKyAgICAgICAgICAgICB1bG9uZyAqc3AgPSBw
ZXJfY3B1KGlycV9zdGFja19wdHIsIHNtcF9wcm9jZXNzb3JfaWQoKSkKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKyBJUlFfU1RBQ0tfU0laRS9zaXplb2YodWxvbmcp
Owo+ID4gKyAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGUoCj4gPiArICAgICAgICAgICAg
ICJhZGRpICAgc3AsIHNwLCAtIlJJU0NWX1NaUFRSICAiXG4iCj4gPiArICAgICAgICAgICAgIFJF
R19TIiAgcmEsIChzcCkgICAgICAgICAgICAgICAgXG4iCj4gPiArICAgICAgICAgICAgICJhZGRp
ICAgc3AsIHNwLCAtIlJJU0NWX1NaUFRSICAiXG4iCj4gPiArICAgICAgICAgICAgIFJFR19TIiAg
czAsIChzcCkgICAgICAgICAgICAgICAgXG4iCj4gPiArICAgICAgICAgICAgICJhZGRpICAgczAs
IHNwLCAyKiJSSVNDVl9TWlBUUiAiXG4iCj4gPiArICAgICAgICAgICAgICJtb3ZlICAgc3AsICVb
c3BdICAgICAgICAgICAgICAgXG4iCj4gPiArICAgICAgICAgICAgICJjYWxsICAgX19kb19zb2Z0
aXJxICAgICAgICAgICAgXG4iCj4gPiArICAgICAgICAgICAgICJhZGRpICAgc3AsIHMwLCAtMioi
UklTQ1ZfU1pQVFIiXG4iCj4gPiArICAgICAgICAgICAgIFJFR19MIiAgczAsIChzcCkgICAgICAg
ICAgICAgICAgXG4iCj4gPiArICAgICAgICAgICAgICJhZGRpICAgc3AsIHNwLCAiUklTQ1ZfU1pQ
VFIgICAiXG4iCj4gPiArICAgICAgICAgICAgIFJFR19MIiAgcmEsIChzcCkgICAgICAgICAgICAg
ICAgXG4iCj4gPiArICAgICAgICAgICAgICJhZGRpICAgc3AsIHNwLCAiUklTQ1ZfU1pQVFIgICAi
XG4iCj4gPiArICAgICAgICAgICAgIDoKPiA+ICsgICAgICAgICAgICAgOiBbc3BdICJyIiAoc3Ap
Cj4gPiArICAgICAgICAgICAgIDogImEwIiwgImExIiwgImEyIiwgImEzIiwgImE0IiwgImE1Iiwg
ImE2IiwgImE3IiwKPiA+ICsgICAgICAgICAgICAgICAidDAiLCAidDEiLCAidDIiLCAidDMiLCAi
dDQiLCAidDUiLCAidDYiLAo+ID4gKyAgICAgICAgICAgICAgICJtZW1vcnkiKTsKPgo+IFNhbWUg
YXMgcHJldmlvdXMgcGF0Y2guIFBsZWFzZSBhdm9pZCBDJlAgYW5kIGhhdmUgYSBsb29rIGF0IGhv
dwo+IGNhbGxfb25fc3RhY2sgaXMgZG9uZSBvbiB4ODYuCk9rYXkuCgo+Cj4KPiBCasO2cm4KCgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
