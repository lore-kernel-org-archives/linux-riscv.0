Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A7AC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E09611AB
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E09611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JszpAYqLdsnHNDxB0YD4naRMtdJhCJajvgqCjjimZuI=; b=kxEOntqHUGJnGn
	O5wMdOC6eV+0dtiTBelRs4vi9B5tzldaeEvXCFQRqnpuA7ZSuAY2ZrBWPwi7f/UB5bzIcrIIMu5xb
	5+s/7nq/mSKyucRY+667E+MyjG6T2c6C2Gm4tCuSmjTkLpio9qB2cwoJxUY9fo9rXRgwaCRHI+R+m
	P1PiVpdt8pJEyU1lngN9k7MA5cyfUNO551M4s8sitR3qy1JiEOtuQsseKrHPwZ4bHTk2wFyxHAAut
	nLad24OVecX/BC3yyDfn1PtcetgMDzr340U1x974zDHTgBrI2u3pQN/S8NKPO3IXpwO1sCRQ7920P
	m4fiZ7+xqlowjjuE3bRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqA4r-0029IH-8m; Mon, 07 Jun 2021 07:53:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqA4o-0029HH-0E
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 07:53:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86A5C61244
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623052417;
 bh=bZf1oPujuHjZMOhIewYXXJEcGVTtrINZZrYSSOjle5w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NNznX+gSK1ubk2X3/IRC/NKUHBNtUpj3pIv/4c2uJBBiJUtAV/KhZcOXzgKlTc197
 JoaqNhfMIWWrKQn+ytYhGSXvaYtI570te4Vf2QyUsmIwnEioZqlYZoWTtD3s/olZ1r
 zXU5lkoWfLDBysgxbwtN+RMG+JJ6rSHG187xSFhIHkUpAhqI91/h8j7NLXHV+zL4Ya
 kzZSX1foXTx99yEqWn2UEdMCZtAFdYIHFVjM5lYuzSOaV0RKUi40RbmSeLfz2PBK7X
 uWdUT9XRikixdbajY+xQgkc2hyki1enBqAao5zY2bxSkhf1xV+/LbpZIJLfCEA4My/
 KUsm9jil4LFGg==
Received: by mail-lj1-f179.google.com with SMTP id o8so20954027ljp.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jun 2021 00:53:37 -0700 (PDT)
X-Gm-Message-State: AOAM5303IV1lvApk1nQOkG+xr3urrk+4kKhSTceYaLQ4A66U8WjiGoiD
 h6bK1c3fkUGXCv8KXyWrr0uZnIM6MQ/dtrth1VA=
X-Google-Smtp-Source: ABdhPJwH/bIcZcv9bYZevLpASI9avmmDzuyYLA4C+R6RK/v/ZYHyxwKOcgETDO+RRKacBwp8wDxom+B3t+B9y1ptv1M=
X-Received: by 2002:a2e:3506:: with SMTP id z6mr14531480ljz.238.1623052415598; 
 Mon, 07 Jun 2021 00:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-13-git-send-email-guoren@kernel.org>
 <2490489.OUOj5N01qN@jernej-laptop>
 <CAJF2gTTDVy89R-gvWUS0sgpX=B14LnH5rDoGP7pv1=OSyJq28Q@mail.gmail.com>
 <20210607072709.ul4jdvtyspj6t4c6@gilmour>
In-Reply-To: <20210607072709.ul4jdvtyspj6t4c6@gilmour>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:53:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS9+JYBg2dPEwQccNGku4_z_tv0qwgWQiFN8dQcQ=WweQ@mail.gmail.com>
Message-ID: <CAJF2gTS9+JYBg2dPEwQccNGku4_z_tv0qwgWQiFN8dQcQ=WweQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
To: Maxime Ripard <maxime@cerno.tech>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_005338_113101_EC162F84 
X-CRM114-Status: GOOD (  33.12  )
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

VGh4IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4KCk9uIE1vbiwgSnVuIDcsIDIwMjEgYXQgMzoyNyBQ
TSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1
biAwNywgMjAyMSBhdCAxMTo0NDowM0FNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gTW9u
LCBKdW4gNywgMjAyMSBhdCAxMjoyNiBBTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIQo+ID4gPgo+ID4gPiBJIGRpZG4ndCBn
byB0aHJvdWdoIGFsbCBkZXRhaWxzLiBBZnRlciB5b3UgZml4IGFsbCBjb21tZW50cyBiZWxvdywg
eW91IHNob3VsZAo+ID4gPiBydW4gIm1ha2UgZHRic19jaGVjayIgYW5kIGZpeCBhbGwgcmVwb3J0
ZWQgd2FybmluZ3MgdG9vLgo+ID4gPgo+ID4gPiBEbmUgbmVkZWxqYSwgMDYuIGp1bmlqIDIwMjEg
b2IgMTE6MDQ6MDcgQ0VTVCBqZSBndW9yZW5Aa2VybmVsLm9yZyBuYXBpc2FsKGEpOgo+ID4gPiA+
IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPgo+ID4gPiA+
IEFkZCBpbml0aWFsIERUUyBmb3IgQWxsd2lubmVyIEQxIE5lWmhhIGJvYXJkIGhhdmluZyBvbmx5
IGVzc2VudGlhbAo+ID4gPiA+IGRldmljZXMgKHVhcnQsIGR1bW15LCBjbG9jaywgcmVzZXQsIGNs
aW50LCBwbGljLCBldGMpLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8
Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+IENvLURldmVsb3BlZC1ieTogTGl1IFNo
YW9odWEgPGxpdXNoQGFsbHdpbm5lcnRlY2guY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExp
dSBTaGFvaHVhIDxsaXVzaEBhbGx3aW5uZXJ0ZWNoLmNvbT4KPiA+ID4gPiBDYzogQW51cCBQYXRl
bCA8YW51cC5wYXRlbEB3ZGMuY29tPgo+ID4gPiA+IENjOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0
cmFAd2RjLmNvbT4KPiA+ID4gPiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4g
PiA+ID4gQ2M6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KPiA+ID4gPiBDYzogRHJldyBG
dXN0aW5pIDxkcmV3QGJlYWdsZWJvYXJkLm9yZz4KPiA+ID4gPiBDYzogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lQGNlcm5vLnRlY2g+Cj4gPiA+ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJi
ZWx0QGdvb2dsZS5jb20+Cj4gPiA+ID4gQ2M6IFdlaSBGdSA8d2VmdUByZWRoYXQuY29tPgo+ID4g
PiA+IENjOiBXZWkgV3UgPGxhenlwYXJzZXJAZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvTWFrZWZpbGUgICAgICAg
ICAgICAgfCAgMiArCj4gPiA+ID4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQx
LW5lemhhLWtpdC5kdHMgIHwgMjkgKysrKysrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLmR0c2kgICAgfCA4NAo+ID4gPiA+ICsrKysrKysrKysr
KysrKysrKysrKysgNCBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvTWFrZWZpbGUK
PiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVy
L2FsbHdpbm5lci1kMS1uZXpoYS1raXQuZHRzCj4gPiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS5kdHNpCj4gPiA+ID4KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvTWFrZWZpbGUKPiA+ID4gPiBpbmRleCBmZTk5NmI4Li4zZTdiMjY0IDEwMDY0
NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiA+ID4gPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlCj4gPiA+ID4gQEAgLTIsNSArMiw2IEBACj4g
PiA+ID4gIHN1YmRpci15ICs9IHNpZml2ZQo+ID4gPiA+ICBzdWJkaXItJChDT05GSUdfU09DX0NB
TkFBTl9LMjEwX0RUQl9CVUlMVElOKSArPSBjYW5hYW4KPiA+ID4gPiAgc3ViZGlyLXkgKz0gbWlj
cm9jaGlwCj4gPiA+ID4gK3N1YmRpci15ICs9IGFsbHdpbm5lcgo+ID4gPiA+Cj4gPiA+ID4gIG9i
ai0kKENPTkZJR19CVUlMVElOX0RUQikgOj0gJChhZGRzdWZmaXggLywgJChzdWJkaXIteSkpCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL01ha2VmaWxl
Cj4gPiA+ID4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9NYWtlZmlsZSBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGluZGV4IDAwMDAwMDAwLi40YWRiZjRiCj4gPiA+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL01h
a2VmaWxlCj4gPiA+ID4gQEAgLTAsMCArMSwyIEBACj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gPiArZHRiLSQoQ09ORklHX1NPQ19TVU5YSSkgKz0gYWxs
d2lubmVyLWQxLW5lemhhLWtpdC5kdGIKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9i
b290L2R0cy9hbGx3aW5uZXIvYWxsd2lubmVyLWQxLW5lemhhLWtpdC5kdHMKPiA+ID4gPiBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL2FsbHdpbm5lci1kMS1uZXpoYS1raXQuZHRzIG5l
dyBmaWxlIG1vZGUKPiA+ID4gPiAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwMC4uY2Q5Zjdj
OQo+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9hbGx3aW5uZXItZDEtbmV6aGEta2l0LmR0cwo+ID4gPgo+ID4gPiBCb2FyZCBE
VCBuYW1lcyBhcmUgY29tcHJpc2VkIG9mIHNvYyBuYW1lIGFuZCBib2FyZCBuYW1lLCBpbiB0aGlz
IGNhc2UgaXQgd291bGQKPiA+ID4gYmUgInN1bjIwaS1kMS1uZXpoYS1raXQuZHRzIgo+ID4gPgo+
ID4gPiA+IEBAIC0wLDAgKzEsMjkgQEAKPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wKyBPUiBNSVQpCj4gPiA+Cj4gPiA+IFVzdWFsbHkgY29weXJpZ2h0cyBhcmUg
YWRkZWQgYmVsb3cgc3BkeCBpZC4KPiA+ID4KPiA+ID4gPiArCj4gPiA+ID4gKy9kdHMtdjEvOwo+
ID4gPiA+ICsKPiA+ID4gPiArI2luY2x1ZGUgImFsbHdpbm5lci1kMS5kdHNpIgo+ID4gPiA+ICsK
PiA+ID4gPiArLyB7Cj4gPiA+ID4gKyAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gPiA+ID4g
KyAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gPiA+Cj4gPiA+IFRoaXMgc2hvdWxkIGJlIHBhcnQg
b2YgU29DIGxldmVsIERUU0kuCj4gPiA+Cj4gPiA+ID4gKyAgICAgbW9kZWwgPSAiQWxsd2lubmVy
IEQxIE5lWmhhIEtpdCI7Cj4gPiA+ID4gKyAgICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsZDEt
bmV6aGEta2l0IjsKPiA+ID4KPiA+ID4gQm9hcmQgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcg
c2hvdWxkIGJlIGZvbGxvd2VkIHdpdGggU29DIGNvbXBhdGlibGUsIGluCj4gPiA+IHRoaXMgY2Fz
ZSAiYWxsd2lubmVyLHN1bjIwaS1kMSIuICBZb3Ugc2hvdWxkIGRvY3VtZW50IGl0IHRvby4KPiA+
ID4KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgY2hvc2VuIHsKPiA+ID4gPiArICAgICAgICAgICAg
IGJvb3RhcmdzID0gImNvbnNvbGU9dHR5UzAsMTE1MjAwIjsKPiA+ID4KPiA+ID4gQWJvdmUgbGlu
ZSBkb2Vzbid0IGJlbG9uZyBoZXJlLiBJZiBhbnl0aGluZywgaXQgc2hvdWxkIGJlIGFkZGVkIGR5
bmFtaWNhbGx5IGJ5Cj4gPiA+IGJvb3Rsb2FkZXIuCj4gPgo+ID4gQWZ0ZXIgZGlzY3Vzc2lvbiwg
d2Ugc3RpbGwgd2FudCB0byBrZWVwIGEgZGVmYXVsdCB2YWx1ZSBoZXJlLgo+ID4gU29tZXRpbWVz
IHdlIGNvdWxkIGJvb3Qgd2l0aCBqdGFnIGFuZCBwYXJzZSBkdGIgaXMgaGFyZCBmb3IgZ2RiaW5p
dAo+ID4gc2NyaXB0Lgo+ID4KPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAgIHN0ZG91dC1wYXRo
ID0gJnNlcmlhbDA7Cj4gPiA+ID4gKyAgICAgfTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgbWVt
b3J5QDQwMDAwMDAwIHsKPiA+ID4gPiArICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9y
eSI7Cj4gPiA+ID4gKyAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NDAwMDAwMDAgMHgwIDB4MjAw
MDAwMDA+Owo+ID4gPiA+ICsgICAgIH07Cj4gPiA+Cj4gPiA+IERpdHRvIGZvciB3aG9sZSBtZW1v
cnkgbm9kZS4KPiA+Cj4gPiBEaXR0bwo+Cj4gVGhlIHRoaW5nIGlzIHRoYXQgdGhlcmUncyBuZXZl
ciBhIGdvb2QgdmFsdWUgZm9yIGEgZGVmYXVsdC4gTGV0J3MgdGFrZQo+IHRoZSBtZW1vcnkgbm9k
ZSBoZXJlOiB3aGF0IHdvdWxkIGJlIGEgZ29vZCBkZWZhdWx0PyBJZiB3ZSB3YW50IHRvIG1ha2UK
PiBpdCB3b3JrIGV2ZXJ5d2hlcmUgaXQncyBnb2luZyB0byBiZSB0aGUgbG93ZXN0IGFtb3VudCBv
ZiBtZW1vcnkKPiBhdmFpbGFibGUgb24gdGhlIEQxIGJvYXJkcy4gSXQncyBnb2luZyB0byBiZSBo
YXJkIHRvIG1haW50YWluIGFuZCB2ZXJ5Cj4gbGlrZWx5IHRvIGJlIG92ZXJsb29rZWQsIHJlc3Vs
dGluZyBpbiBicm9rZW4gYm9hcmRzIGFueXdheS4KPgo+IElmIHNvbWVvbmUgaXMgc2F2dnkgZW5v
dWdoIHRvIHVzZSBKVEFHLCBpdCdzIG5vdCByZWFsbHkgZGlmZmljdWx0IHRvCj4gbW9kaWZ5IHRo
ZSBEVCBmb3IgdGhlaXIgYm9hcmQgd2hlbiB0aGV5IG5lZWQgaXQuCm9rYXksIEkgc2VlLiBJJ2xs
IGZvbGxvdyB0aGUgcnVsZSBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaHNldC4KCj4K
PiBNYXhpbWUKCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
