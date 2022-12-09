Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD17C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqSZJN9fiNWKrSufi8CFEAl4vAutqdBIce1k6eIJ2d8=; b=tP8pDhq2+TrBIj
	ZOjZsKn9yQrhD2JszLgJgANlMFJ64yM6T5epAJ0tYOxkKzz6MQD/Cn+XYzER6dH8TPlyrg7ROiagE
	rLJiWAAS1B7JRuoikVw/7YhtwfK5nnM/XF1mpcNoxYDFyPLulE8sXXQ1lNJ0A+5AhgffQ4+Hs/85w
	zWCezL8K8g5CYCYKY15tCDCDlUa0Mq3qhAB8v5tuRIHjQ8158xlu5gFDQRG7ZkS1MyLptFGRjrNr1
	iJqAraCjYLpErAOjMDo8OUXyOr1SNFXPyu7O4GMsmBqrRfpfdV0u3NYddZ03IfmRodK98VPug+d+0
	aPr3OUs6iCAV4IX2uNoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Y91-005FH0-Jm; Fri, 09 Dec 2022 07:50:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Y8y-005F9G-Fa
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 07:50:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2923B82789;
	Fri,  9 Dec 2022 07:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009B2C433EF;
	Fri,  9 Dec 2022 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670572199;
	bh=mgXmxfO0nJsJ5FTTISHf8DIRyMlAKW/tgC3rR79NvVc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=joLlxUe/NXeFxsP8LAZtung2Dnt3UjWGVOHPVdp5J6eogC97HfpJy8yeNgmMAhYVn
	 RRtD4csXTHtUAo/gw/kXOCjeZp/rbq33WtVnuo+dZhNxHRhuQyycVLgu14ekGq23Io
	 8jYa2qN7H9BMaQRe7REvhlg5EW5dM/4kZZ1HFEXU90zfOubP557Hp5VsqeM7RCll09
	 GAOZVYo/cPc/phJ4D6XiKayCyH5H82RHEK4Ba8Y4NTliz6yiySHl6qhJ7rp6Md5yNt
	 cVx2XCgvEHUCHN0JUx5IbIVE5NM5u7eDrbQ8Zv4dxhC7q+VvwHFgdIBieE615/xWp6
	 9f6coiEY925AA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
 peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
 heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mark.rutland@arm.com, zouyipeng@huawei.com, bigeasy@linutronix.de,
 David.Laight@aculab.com, chenzhongjin@huawei.com, greentime.hu@sifive.com,
 andy.chiu@sifive.com, ben@decadent.org.uk, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V10 09/10] riscv: stack: Support
 HAVE_SOFTIRQ_ON_OWN_STACK
In-Reply-To: <CAJF2gTT1YNubBG_RMzwsWVXk0X0nwQvTM2r5NjRvVN+1x1RHMw@mail.gmail.com>
References: <20221208025816.138712-1-guoren@kernel.org>
 <20221208025816.138712-10-guoren@kernel.org>
 <87o7sew6ey.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTT1YNubBG_RMzwsWVXk0X0nwQvTM2r5NjRvVN+1x1RHMw@mail.gmail.com>
Date: Fri, 09 Dec 2022 08:49:52 +0100
Message-ID: <874ju59ftr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_235004_828309_D9B16913 
X-CRM114-Status: GOOD (  17.57  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gVGh1LCBEZWMgOCwgMjAy
MiBhdCA2OjEyIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBndW9yZW5Aa2VybmVsLm9yZyB3cml0ZXM6Cj4+Cj4+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+PiA+Cj4+ID4gQWRkIHRoZSBIQVZFX1NPRlRJUlFfT05fT1dO
X1NUQUNLIGZlYXR1cmUgZm9yIHRoZSBJUlFfU1RBQ0tTIGNvbmZpZy4gVGhlCj4+ID4gaXJxIGFu
ZCBzb2Z0aXJxIHVzZSB0aGUgc2FtZSBpbmRlcGVuZGVudCBpcnFfc3RhY2sgb2YgcGVyY3B1IGJ5
IHRpbWUKPj4gPiBkaXZpc2lvbiBtdWx0aXBsZXhpbmcuCj4+ID4KPj4gPiBUZXN0ZWQtYnk6IEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+ID4gLS0tCj4+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgIHwgIDcgKysrKy0tLQo+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM3IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+ID4gaW5kZXggMGE5ZDRiZGMwMzM4
Li5iZDRjNGFlNGNkYzkgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+ID4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+ID4gQEAgLTQ0NywxMiArNDQ3LDEzIEBAIGNvbmZp
ZyBGUFUKPj4gPiAgICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5
IFkuCj4+ID4KPj4gPiAgY29uZmlnIElSUV9TVEFDS1MKPj4gPiAtICAgICBib29sICJJbmRlcGVu
ZGVudCBpcnEgc3RhY2tzIiBpZiBFWFBFUlQKPj4gPiArICAgICBib29sICJJbmRlcGVuZGVudCBp
cnEgJiBzb2Z0aXJxIHN0YWNrcyIgaWYgRVhQRVJUCj4+ID4gICAgICAgZGVmYXVsdCB5Cj4+ID4g
ICAgICAgc2VsZWN0IEhBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLCj4+ID4gKyAgICAgc2VsZWN0
IEhBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sKPj4KPj4gSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RB
Q0sgaXMgdXNlZCBieSBzb2Z0aXJxLmMgU2hvdWxkbid0IHRoYXQgYmUKPj4gc2VsZWN0ZWQgaW50
cm9kdWNlZCBpbiB0aGlzIHBhdGNoLCBpbnN0ZWFkIG9mIHRoZSBwcmV2aW91cyBvbmU/Cj4gVGhp
cyBwYXRjaCBkZXBlbmRzIG9uIHRoZSBwcmV2aW91cyBvbmUuIEFuZCB0aGUgcHJldmlvdXMgb25l
IGNvdWxkCj4gd29yayBzZXBhcmF0ZWx5LgoKTGV0IG1lIHRyeSB0byBiZSBtb3JlIGNsZWFyOiBJ
UlFfU1RBQ0tTIHNob3VsZCBiZSBpbnRyb2R1Y2VkIGluIHRoZQpwcmV2aW91cyBwYXRjaCwgd2hp
Y2ggYWRkcyBwZXItY3B1IHN0YWNrcyB0byBoYXJkaXJxLiBUaGlzIHBhdGNoIGFkZHMKcGVyLWNw
dSBzdGFja3MgZm9yIHNvZnRpcnEsIGFuZCB0aGUgc29mdGlycSByZWxhdGVkIHNlbGVjdHM6Cgog
c2VsZWN0IEhBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLCiBzZWxlY3QgSEFWRV9TT0ZUSVJRX09O
X09XTl9TVEFDSwoKSGVuY2UsIHRoZSAiSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0siIHNlbGVj
dCBzaG91bGQgYmUgcGFydCBvZiAqdGhpcyoKcGF0Y2gsIG5vdCB0aGUgcHJldmlvdXMuCgpPciBh
bSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
