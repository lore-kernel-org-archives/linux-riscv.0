Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F9AC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 01:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXFdi5zknbJNyQ8A8PmccW2VGmUn4ynZwDuY7ErmfOM=; b=NPlt23l+AvUejI
	ohFQ+Umc22jLdyK8Rsoc7tCFiKbgtB+T+XyqIzb++54lv0la7ds30+edu7bDufQILyHaMoeWjVmef
	uOJHxCjEeeQ5RI854s93d8OsMTExbVp/t716UREia3VpELtoGfVDTMllRccYDVDIgsYgqTCT5hDNa
	SNHipGgGtwU7ha915huYA5Jot4sQB/jl67WUxhWsLmfGjDwTzm1ruYlq6bDp2/mDcpXKe2hPNpQ9d
	IpNsbj0tH82NhVap4A2ljEmBgJLZ6+zpGg+Gm/WR32cwT7Lk7WtfMWYRUDq6g7uRsOkGrrIIXc7YE
	bFx/0i8vQjuD4L3WQfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUHUr-006CDA-Rz; Tue, 21 Feb 2023 01:31:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUHUk-006CBS-RE
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 01:31:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 69325CE1081
	for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 01:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB387C4339C
	for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676943057;
	bh=g+C3+KM0lb+qdx4B+wH/mE5N9+DQmnKIvrTIb2t8Bz4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dm2VjDM8MJxLhwFt2t0/Bp2ST7AgqgEnhGyTv6a0eCN/H+EBQMvy/y8cBVlUwjvc3
	 FMFTZDn2r8fHeitCF+Prcy4wi3VPwGBdO/m3pfbYsw7lGDd6G8CLganfwPk/DVicWQ
	 vs4AobY9reKQJPVQAJ2fB2Xc4wmGMWkQUcNgbUrat6grie4+AA8eWxw/3BhQ55lDy1
	 ntuYdpIlNaL/cejBp9ggdajLuGGnYE63FXDXnwVmJrcAcUShUa85RKUs3WvhbFctaD
	 eyxfRMGwMvpt9749lhl1ULii48AGnnRGNfVKt3qDwwasatrn/3RfdZanNc9gsyYlGJ
	 dIFpIMQqfMszw==
Received: by mail-ed1-f41.google.com with SMTP id cq23so10879282edb.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 17:30:57 -0800 (PST)
X-Gm-Message-State: AO0yUKUYzcLrgLnEGiW8JXwbfjaTgexTgk20xi54ufTnxQMFzAWfAGlJ
	VkkDBpKG9L7+K26/1zWtgIFx+h0yOdccKaGd/9E=
X-Google-Smtp-Source: AK7set940J9K2gxAYeDdkE9or/jljaOFOKUp0vZfyIlw9CxDUVM3+723k9rKkwcQOT0Ae9QnzTR5w34bQZr9McHG3ac=
X-Received: by 2002:a50:aa8b:0:b0:4ad:7439:cecb with SMTP id
 q11-20020a50aa8b000000b004ad7439cecbmr1129926edc.7.1676943055937; Mon, 20 Feb
 2023 17:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
 <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
 <Y9juYX8Bt1Z55lv0@FVFF77S0Q05N> <20230217002351.112635f4fb35f84002666d29@kernel.org>
In-Reply-To: <20230217002351.112635f4fb35f84002666d29@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Feb 2023 09:30:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTt5n8Ur4sRSDWppE2JtYtuEF2jEDC_mCBOVkripgkj6A@mail.gmail.com>
Message-ID: <CAJF2gTTt5n8Ur4sRSDWppE2JtYtuEF2jEDC_mCBOVkripgkj6A@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	"liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	conor.dooley@microchip.com, penberg@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_173103_282966_0C22BB31 
X-CRM114-Status: GOOD (  39.53  )
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

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMTE6MjMgUE0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IFNvcnJ5IEkgbWlzc2VkIHRoaXMgdGhy
ZWFkLgo+Cj4gT24gVHVlLCAzMSBKYW4gMjAyMyAxMDozMzowNSArMDAwMAo+IE1hcmsgUnV0bGFu
ZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+Cj4gPiBPbiBUdWUsIEphbiAzMSwgMjAy
MyBhdCAwOTo0ODoyOUFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gPiBPbiBNb24sIEphbiAz
MCwgMjAyMyBhdCAxMTo0OSBQTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3
cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIEJqb3JuLAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBK
YW4gMzAsIDIwMjMgYXQgMDQ6Mjg6MTVQTSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+
ID4gPiA+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gPj4gSW4gdGhlIHNlcmllIG9mIFJJU0NWIE9QVFBST0JFUyBbMV0sIGl0IHBhdGNoZXMg
YSBsb25nLWp1bXAgaW5zdHJ1Y3Rpb25zIHBhaXIKPiA+ID4gPiA+ID4+IEFVSVBDL0pBTFIgaW4g
a2VybmVsIHRleHQsIHNvIGluIG9yZGVyIHRvIGVuc3VyZSBvdGhlciBDUFVzIGRvZXMgbm90IGV4
ZWN1dGUKPiA+ID4gPiA+ID4+IGluIHRoZSBpbnN0cnVjdGlvbnMgdGhhdCB3aWxsIGJlIG1vZGlm
aWVkLCBpdCBpcyBzdGlsbCBuZWVkIHRvIHN0b3Agb3RoZXIgQ1BVcwo+ID4gPiA+ID4gPj4gdmlh
IHBhdGNoX3RleHQgQVBJLCBvciB5b3UgaGF2ZSBhbnkgYmV0dGVyIHNvbHV0aW9uIHRvIGFjaGll
dmUgdGhlIHB1cnBvc2U/Cj4gPiA+ID4gPiA+ICAtIFRoZSBzdG9wX21hY2hpbmUgaXMgYW4gZXhw
ZW5zaXZlIHdheSBhbGwgYXJjaGl0ZWN0dXJlcyBzaG91bGQKPiA+ID4gPiA+ID4gYXZvaWQsIGFu
ZCB5b3UgY291bGQga2VlcCB0aGF0IGluIHlvdXIgT1BUUFJPQkVTIGltcGxlbWVudGF0aW9uIGZp
bGVzCj4gPiA+ID4gPiA+IHdpdGggc3RhdGljIGZ1bmN0aW9ucy4KPiA+ID4gPiA+ID4gIC0gVGhl
IHN0b3BfbWFjaGluZSBjb3VsZG4ndCB3b3JrIHdpdGggUFJFRU1QVElPTiwgc28geW91cgo+ID4g
PiA+ID4gPiBpbXBsZW1lbnRhdGlvbiBuZWVkcyB0byB3b3JrIHdpdGggIVBSRUVNUFRJT04uCj4g
PiA+ID4gPgo+ID4gPiA+ID4gLi4uYW5kIHN0b3BfbWFjaGluZSgpIHdpdGggIVBSRUVNUFRJT04g
aXMgYnJva2VuIGFzIHdlbGwsIHdoZW4geW91J3JlCj4gPiA+ID4gPiByZXBsYWNpbmcgbXVsdGlw
bGUgaW5zdHJ1Y3Rpb25zIChzZWUgTWFyaydzIHBvc3QgYXQgWzFdKS4gVGhlCj4gPiA+ID4gPiBz
dG9wX21hY2hpbmUoKSBkYW5jZSBtaWdodCB3b3JrIHdoZW4geW91J3JlIHJlcGxhY2luZyAqb25l
KiBpbnN0cnVjdGlvbiwKPiA+ID4gPiA+IG5vdCBtdWx0aXBsZSBhcyBpbiB0aGUgUklTQy1WIGNh
c2UuIEknbGwgZXhwYW5kIG9uIHRoaXMgaW4gYSBjb21tZW50IGluCj4gPiA+ID4gPiB0aGUgT1BU
UFJPQkVTIHY2IHNlcmllcy4KPiA+ID4gPgo+ID4gPiA+IEp1c3QgdG8gY2xhcmlmeSwgbXkgY29t
bWVudHMgaW4gWzFdIHdlcmUgYXNzdW1pbmcgdGhhdCBzdG9wX21hY2hpbmUoKSB3YXMgbm90Cj4g
PiA+ID4gdXNlZCwgaW4gd2hpY2ggY2FzZSB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBvciB3aXRo
b3V0IFBSRUVNUFRJT04uCj4gPiA+ID4KPiA+ID4gPiBJIGJlbGlldmUgdGhhdCB3aGVuIHVzaW5n
IHN0b3BfbWFjaGluZSgpLCB0aGUgIVBSRUVNUFRJT04gY2FzZSBpcyBmaW5lLCBzaW5jZQo+ID4g
PiA+IHN0b3BfbWFjaGluZSgpIHNjaGVkdWxlcyB3b3JrIHJhdGhlciB0aGFuIHJ1bm5pbmcgd29y
ayBpbiBJUlEgY29udGV4dCBvbiB0aGUKPiA+ID4gPiBiYWNrIG9mIGFuIElQSSwgc28gbm8gQ1BV
cyBzaG91bGQgYmUgbWlkLXNlcXVuY2UgZHVyaW5nIHRoZSBwYXRjaGluZywgYW5kIGl0J3MKPiA+
ID4gPiBub3QgcG9zc2libGUgZm9yIHRoZXJlIHRvIGJlIHRocmVhZHMgd2hpY2ggYXJlIHByZWVt
cHRlZCBtaWQtc2VxdWVuY2UuCj4gPiA+ID4KPiA+ID4gPiBUaGF0IGFsbCBzYWlkLCBJSVVDIG9w
dHByb2JlcyBpcyBnb2luZyB0byBkaXNhcHBlYXIgb25jZSBmcHJvYmUgaXMgcmVhZHkKPiA+ID4g
PiBldmVyeXdoZXJlLCBzbyB0aGF0IG1pZ2h0IGJlIG1vb3QuCj4gPiA+IFRoZSBvcHRwcm9iZXMg
Y291bGQgYmUgaW4gdGhlIG1pZGRsZSBvZiBhIGZ1bmN0aW9uLCBidXQgZnByb2JlIG11c3QgYmUK
PiA+ID4gdGhlIGVudHJ5IG9mIGEgZnVuY3Rpb24sIHJpZ2h0Pwo+ID4gPgo+ID4gPiBEb2VzIHlv
dXIgZnByb2JlIGhlcmUgbWVhbjogPwo+ID4gPgo+ID4gPiBUaGUgTGludXgga2VybmVsIGNvbmZp
Z3VyYXRpb24gaXRlbSBDT05GSUdfRlBST0JFOgo+ID4gPgo+ID4gPiBwcm9tcHQ6IEtlcm5lbCBG
dW5jdGlvbiBQcm9iZSAoZnByb2JlKQo+ID4gPiB0eXBlOiBib29sCj4gPiA+IGRlcGVuZHMgb246
ICggQ09ORklHX0ZVTkNUSU9OX1RSQUNFUiApICYmICgKPiA+ID4gQ09ORklHX0RZTkFNSUNfRlRS
QUNFX1dJVEhfUkVHUyApICYmICggQ09ORklHX0hBVkVfUkVUSE9PSyApCj4gPiA+IGRlZmluZWQg
aW4ga2VybmVsL3RyYWNlL0tjb25maWcKPiA+Cj4gPiBZZXMuCj4gPgo+ID4gTWFzYW1pLCBTdGV2
ZSwgYW5kIEkgaGFkIGEgY2hhdCBhdCB0aGUgdHJhY2luZyBzdW1taXQgbGF0ZSBsYXN0IHllYXIg
KHdoaWNoCj4gPiB1bmZvcnR1bmF0ZWx5LCB3YXMgbm90IHJlY29yZGVkKSwgYW5kIHdoYXQgd2Un
ZCBsaWtlIHRvIGRvIGlzIGdldCBlYWNoCj4gPiBhcmNoaXRlY3R1cmUgdG8gaGF2ZSBGUFJPQkUg
KGFuZCBGVFJBQ0VfV0lUSF9BUkdTKSwgYXQgd2hpY2ggcG9pbnQgT1BUUFJPQkUKPiA+IGFuZCBL
UkVUUFJPQkUgYmVjb21lIHJlZHVuZGFudCBhbmQgY291bGQgYmUgcmVtb3ZlZC4KPgo+IE5vLCB0
aGUgZnByb2JlIHdpbGwgcmVwbGFjZSB0aGUgS1JFVFBST0JFIGJ1dCBub3QgT1BUUFJPQkUuIFRo
ZSBPUFRQUk9CRQo+IGlzIGNvbXBsZXRlbHkgZGlmZmVyZW50IG9uZS4gRnByb2JlIGlzIHVzZWQg
b25seSBmb3IgZnVuY3Rpb24gZW50cnksIGJ1dAo+IG9wdHByb2JlIGlzIGFwcGxpZWQgdG8gdGhl
IGZ1bmN0aW9uIGJvZHkuCj4KPiA+Cj4gPiBpLmUuIHdlJ2Qga2VlcCBLUFJPQkVTIGFzIGEgInlv
dSBjYW4gdHJhY2UgYW55IGluc3RydWN0aW9uIiBmZWF0dXJlLCBidXQgaW4gdGhlCj4gPiBmZXcg
Y2FzZXMgd2hlcmUgT1BUUFJPQkVTIGNhbiBtYWtlIHRoaW5ncyBmYXRlciBieSB1c2luZyBGVFJB
Q0UsIHlvdSBzaG91bGQKPiA+IGp1c3QgdXNlIHRoYXQgZGlyZWN0bHkgdmlhIEZQUk9CRS4KPgo+
IEkgdGhpbmsgd2hhdCB5b3UgYXJlIHNheWluZyBpcyBLUFJPQkVfT05fRlRSQUNFLCBhbmQgdGhh
dCB3aWxsIGJlIHJlcGxhY2VkIGJ5Cj4gRlBST0JFUy4KSSdtIHNvcnJ5LCBJJ20gbm90IHN1cmUg
aG93IEZQUk9CRVMgY291bGQgcmVwbGFjZSBLUFJPQkVfT05fRlRSQUNFPyBEbwp5b3UgaGF2ZSBz
b21lIGRpc2N1c3Npb24gb24gaXQ/Cgo+Cj4gVGhhbmsgeW91LAo+Cj4gPgo+ID4gVGhhbmtzLAo+
ID4gTWFyay4KPgo+Cj4gLS0KPiBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBr
ZXJuZWwub3JnPgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
