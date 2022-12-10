Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FF1C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 10:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCEZjk8Lt/XXrvagPbx34ZXmzF1xj3FbJtbV2zGqTRw=; b=XYsttQ+M22O7sT
	HfIzlEWLFUJ8wuG0O96hYdIbRnkMyRQA9sOhUil2zRi1XPMpC1M+ZsSMTF8ExOUYTSplfCmXKmjVn
	rge258UJFuQ5L0N3Hr9CqmUGtMc3DTmvJmXKvF0zjd1tIiXTfggYhw84eU8g8gCBP02T7k/3bPT4U
	bHjq1fec9VJx0UlHXk7kkU7vdHAV67cRitUOOkYbeYBdVzW4nZi4HjYF9ILYZCNBTvgP6xWX4obkA
	hmIaeKp0cljhsPOzp8zANrtr9LD7THQ3bXCqZWy8Lh1tHLFCB5ohhpIcPHoe4l7YwJBQ9a3s91FIL
	+Wf+5HJMWmc+dikSjo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wz8-00GFUN-6P; Sat, 10 Dec 2022 10:21:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wz2-00GFPv-CV
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 10:21:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B2E560AE7
	for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 10:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604CEC4339E
	for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670667685;
	bh=KJsvpZ5QOii9zGY2DeG7g2+E/TbzW2Va+I7GS3tMVW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Im/DIJGyJ7+n1zJ+Kee/HoQJZQRz+qX5u1LytCtJliW4iFmHuzOmDdFoXCjuXCcli
	 dp5rA6ZtgA+yEcFtvJMxAa6nHJzdaiBbt/bK1OXmiRZetc4xI6sE+vjJNMScYfK3Zd
	 9qvnXQan2Hg0N84SUmASx6kzObgXAJNNQd+IWxBcRdZ2xZFjHYLX+eAH6kH7cQ9ibJ
	 XnhpwUnrv6oJ8A6S2J6JAco53vbOOdW9IYNmlwOn0yaK1b2qdq7Zvx15oqxvdY5nQX
	 urUYMiYjbK8dSKz9CL9qHfrNRa0IV4lad1lezuMdCYqZ1GJ6e3H2+fgctrFQDs83oS
	 0XRaeyp31A7iw==
Received: by mail-ed1-f51.google.com with SMTP id f7so6369900edc.6
        for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 02:21:25 -0800 (PST)
X-Gm-Message-State: ANoB5pmmiTbU3xQMxRvI89zA4MttghnPs9Gai4vczbUedjLY1NbbgYP3
	4EVzGvS92LvNkxunwfaY7MtFO45grii0bT/A5Sw=
X-Google-Smtp-Source: AA0mqf4dSb/mqggDS34MJFy0MWfBD+0OERWI5TOzPfeP5X3MFbJGo58MTUjo9Zftn1tq+5ze8jwA4ga7DWxRgpiEhsU=
X-Received: by 2002:a05:6402:22db:b0:46c:c16b:b4c4 with SMTP id
 dm27-20020a05640222db00b0046cc16bb4c4mr15461728edb.419.1670667683430; Sat, 10
 Dec 2022 02:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20221208025816.138712-1-guoren@kernel.org> <20221208025816.138712-10-guoren@kernel.org>
 <87o7sew6ey.fsf@all.your.base.are.belong.to.us> <CAJF2gTT1YNubBG_RMzwsWVXk0X0nwQvTM2r5NjRvVN+1x1RHMw@mail.gmail.com>
 <874ju59ftr.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <874ju59ftr.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 10 Dec 2022 18:21:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTp+ruq+hadMTkkxW1XjSNjjv3VDrjRqnRnExntpCzD8A@mail.gmail.com>
Message-ID: <CAJF2gTTp+ruq+hadMTkkxW1XjSNjjv3VDrjRqnRnExntpCzD8A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221210_022128_533300_E360E191 
X-CRM114-Status: GOOD (  25.91  )
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

T24gRnJpLCBEZWMgOSwgMjAyMiBhdCAzOjUwIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKPgo+
ID4gT24gVGh1LCBEZWMgOCwgMjAyMiBhdCA2OjEyIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+ID4+
Cj4gPj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4gPgo+
ID4+ID4gQWRkIHRoZSBIQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLIGZlYXR1cmUgZm9yIHRoZSBJ
UlFfU1RBQ0tTIGNvbmZpZy4gVGhlCj4gPj4gPiBpcnEgYW5kIHNvZnRpcnEgdXNlIHRoZSBzYW1l
IGluZGVwZW5kZW50IGlycV9zdGFjayBvZiBwZXJjcHUgYnkgdGltZQo+ID4+ID4gZGl2aXNpb24g
bXVsdGlwbGV4aW5nLgo+ID4+ID4KPiA+PiA+IFRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6
aGFuZ0BrZXJuZWwub3JnPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4gPj4gPiAtLS0KPiA+PiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICB8ICA3
ICsrKystLS0KPiA+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYyB8IDMzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+PiA+Cj4gPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4gPiBpbmRleCAwYTlkNGJkYzAz
MzguLmJkNGM0YWU0Y2RjOSAxMDA2NDQKPiA+PiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ID4+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4gPiBAQCAtNDQ3LDEyICs0NDcsMTMg
QEAgY29uZmlnIEZQVQo+ID4+ID4gICAgICAgICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRv
IGhlcmUsIHNheSBZLgo+ID4+ID4KPiA+PiA+ICBjb25maWcgSVJRX1NUQUNLUwo+ID4+ID4gLSAg
ICAgYm9vbCAiSW5kZXBlbmRlbnQgaXJxIHN0YWNrcyIgaWYgRVhQRVJUCj4gPj4gPiArICAgICBi
b29sICJJbmRlcGVuZGVudCBpcnEgJiBzb2Z0aXJxIHN0YWNrcyIgaWYgRVhQRVJUCj4gPj4gPiAg
ICAgICBkZWZhdWx0IHkKPiA+PiA+ICAgICAgIHNlbGVjdCBIQVZFX0lSUV9FWElUX09OX0lSUV9T
VEFDSwo+ID4+ID4gKyAgICAgc2VsZWN0IEhBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sKPiA+Pgo+
ID4+IEhBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLIGlzIHVzZWQgYnkgc29mdGlycS5jIFNob3Vs
ZG4ndCB0aGF0IGJlCj4gPj4gc2VsZWN0ZWQgaW50cm9kdWNlZCBpbiB0aGlzIHBhdGNoLCBpbnN0
ZWFkIG9mIHRoZSBwcmV2aW91cyBvbmU/Cj4gPiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gdGhlIHBy
ZXZpb3VzIG9uZS4gQW5kIHRoZSBwcmV2aW91cyBvbmUgY291bGQKPiA+IHdvcmsgc2VwYXJhdGVs
eS4KPgo+IExldCBtZSB0cnkgdG8gYmUgbW9yZSBjbGVhcjogSVJRX1NUQUNLUyBzaG91bGQgYmUg
aW50cm9kdWNlZCBpbiB0aGUKPiBwcmV2aW91cyBwYXRjaCwgd2hpY2ggYWRkcyBwZXItY3B1IHN0
YWNrcyB0byBoYXJkaXJxLiBUaGlzIHBhdGNoIGFkZHMKPiBwZXItY3B1IHN0YWNrcyBmb3Igc29m
dGlycSwgYW5kIHRoZSBzb2Z0aXJxIHJlbGF0ZWQgc2VsZWN0czoKPgo+ICBzZWxlY3QgSEFWRV9J
UlFfRVhJVF9PTl9JUlFfU1RBQ0sKPiAgc2VsZWN0IEhBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sK
Pgo+IEhlbmNlLCB0aGUgIkhBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLIiBzZWxlY3Qgc2hvdWxk
IGJlIHBhcnQgb2YgKnRoaXMqCj4gcGF0Y2gsIG5vdCB0aGUgcHJldmlvdXMuCj4KPiBPciBhbSBJ
IG1pc3Npbmcgc29tZXRoaW5nPwpZb3UgYXJlIHJpZ2h0LCBIQVZFX0lSUV9FWElUX09OX0lSUV9T
VEFDSyBpcyBiZWxvbmcgdG8gU09GVElSUToKc3RhdGljIGlubGluZSB2b2lkIGludm9rZV9zb2Z0
aXJxKHZvaWQpCnsKLi4uCiAgICAgICAgaWYgKCFmb3JjZV9pcnF0aHJlYWRzKCkgfHwgIV9fdGhp
c19jcHVfcmVhZChrc29mdGlycWQpKSB7CiNpZmRlZiBDT05GSUdfSEFWRV9JUlFfRVhJVF9PTl9J
UlFfU1RBQ0sKLi4uCiAgICAgICAgICAgICAgICBfX2RvX3NvZnRpcnEoKTsKI2Vsc2UKLi4uCiAg
ICAgICAgICAgICAgICBkb19zb2Z0aXJxX293bl9zdGFjaygpOwojZW5kaWYKLi4uCn0KCkkgd291
bGQgZml4IHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4KPgo+IEJqw7ZybgoKCgotLSAKQmVz
dCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
