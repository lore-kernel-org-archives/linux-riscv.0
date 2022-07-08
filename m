Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F9DC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5t0hdZ+cAGqjO1zHpO+6Iyyw91nJniGdKbWEwOYO3Eg=; b=GQFXkaSU05yw0YI3jgurGmXOpD
	XiPoo6DJptBjosnKsA2uASxYzl4Cy9ZzxBbYoVN0EbbYVFcd2EWm18b5hnkOvLSSBFytrrqSeulTA
	IQPRYJhdr3NreMzpzp3Kv4R18S6T80fmPM14tJ+1bwJ9dpvT2ZvSOKul4b4I/vT7+geHxhvXRv6zd
	awP8TbQcYgwZf0i/lgTbKvYj36ItpxzDGIRDW748MUtrpSe9JmpOyWfiPsnpsbWC3PrJs0+u04KBO
	eFJ0eChsS01KH7+KoloHQe8UduYXCdfRZbpVjm+xARdj2NPCdvGwyi8zqzH/LVtS+Kajp8AsT5+IX
	8mltbNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hLz-001ymj-A6; Fri, 08 Jul 2022 06:20:39 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hLw-001ylK-7b
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 06:20:38 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-10c0430e27dso16618376fac.4
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=fNUjdaE0EV5/B+j5srZeGZYYmMZqdCOZDtEVyCgIxko=;
        b=up6lv63TJqDJNKt+uARsxdCYMx06YRGPTg32IQOo84VFRSGJBj5dGWn22ABK5QW2bL
         mH/hTMed8jZOXlr20wjWtNUEH3QWs4oZRMXhor/IIqbmNpN9SJ/g0GwVpW9W5t85366c
         XGcZvx0HCAnAP1oQRlx13wxwH3ozNzqO6PMicCNssjm1FxJPwCo6YzsUGnkwQxDIiEtG
         VfA9htZp9ONuXQjonl+m/80VztxTaqIgp9A4q5uhNMx8VrC3S+X3gekDNt4ChZ4Z/MdO
         VdL9O9rxbMdlKXoS7KHwsLE5J/l68QaMBBRYQLLaZPzofLD1o8+8g0q6F6TcGA3rnsXw
         6z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=fNUjdaE0EV5/B+j5srZeGZYYmMZqdCOZDtEVyCgIxko=;
        b=JUGxJoGP98BrQVTu/uIh2x0YKAMWND0dV/jv7TqLJeqR5dSF4sNHYudBlxHNokcMb1
         uIaNmbGR8fraiRj/LuPze3i4O3ei3UxbqXhWXH9W1s86udVWzgnPMJZrUOElg/kCOPlq
         rL8vRZF6sVAx7rwYd3BnY2Xhvp4jhyvvBWa+gInbuwhmn0IP+Nl+jCmQpOT7Q8gZVTds
         QVHkf3gTouZ34BPBu2mXTpfYM9k/HVcfFes9PPah+myW25aqFX5gS54oYbtXXnLv6+NH
         hiCfzRGIPsGLae5NATkVwXrwnYbSVUgHvi7NdBrqDcGItrNXfsiFV3OOeKIGWGFHlYnO
         cx1Q==
X-Gm-Message-State: AJIora92qkdzhGjNbd/0KIN9LFkzvPIw5KJ3XGoZ0qLFU2LwETmvF8xf
	QGJ70yf26sgdhzU03XdWBNdrLw==
X-Google-Smtp-Source: AGRyM1taXaq5OqDQrcefmu3M0SkJMa0nCXbKpMQEe5AVrhfbaOhr8KeyNeg88OlWw/owVGZEcCrwRA==
X-Received: by 2002:a05:6870:f149:b0:dd:f3b0:986d with SMTP id l9-20020a056870f14900b000ddf3b0986dmr5065544oac.148.1657261233655;
        Thu, 07 Jul 2022 23:20:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id r7-20020a0568080aa700b0032e548d96e0sm604389oij.23.2022.07.07.23.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 23:20:33 -0700 (PDT)
Date: Thu, 07 Jul 2022 23:20:33 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Jul 2022 23:20:31 PDT (-0700)
Subject: Re: [PATCH] riscv: don't warn for sifive erratas in modules
In-Reply-To: <CAJF2gTTXT1UusfCDrccqd1X=16Z2Gg9+cvvhSjohF+D_ukVEiw@mail.gmail.com>
CC: heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, cmuellner@linux.com,
  philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>, re@w6rz.net
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de, guoren@kernel.org
Message-ID: <mhng-9491384b-d185-4e4f-a812-26ec8369bb6e@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_232036_537413_8F3874B3 
X-CRM114-Status: GOOD (  37.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwOSBKdW4gMjAyMiAxODoxMjoyNyBQRFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gOSwgMjAyMiBhdCA1OjU4IFBNIEhlaWtvIFN0w7xibmVy
IDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Pgo+PiBIaSBHdW8sCj4+Cj4+IEFtIERvbm5lcnN0
YWcsIDkuIEp1bmkgMjAyMiwgMDM6Mzk6MjQgQ0VTVCBzY2hyaWViIEd1byBSZW46Cj4+ID4gT24g
V2VkLCBKdW4gOCwgMjAyMiBhdCA4OjA5IFBNIEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2gu
ZGU+IHdyb3RlOgo+PiA+ID4KPj4gPiA+IFRoZSBTaUZpdmUgZXJyYXRhIGNvZGUgY29udGFpbnMg
Y29kZSBjaGVja2luZyBhcHBsaWNhYmxlIGVycmF0YXMKPj4gPiA+IHZzLiBhY3R1YWxseSBhcHBs
aWVkIGVycmF0YXMgdG8gc3VnZ2VzdCBtaXNzaW5nIGVycmF0YXMgdG8gdGhlCj4+ID4gPiB1c2Vy
IHdoZW4gdGhlaXIgS2NvbmZpZyBvcHRpb25zIGFyZSBub3QgZW5hYmxlZC4KPj4gPiA+Cj4+ID4g
PiBJbiB0aGUgbWFpbiBrZXJuZWwgaW1hZ2Ugb25lIGNhbiBiZSBxdWl0ZSBzdXJlIHRoYXQgYWxs
IGF2YWlsYWJsZQo+PiA+ID4gZXJyYXRhcyBhcHBlYXIgYXQgbGVhc3Qgb25jZSwgc28gdGhhdCBj
aGVjayB3aWxsIHN1Y2NlZWQuCj4+ID4gPiBPbiB0aGUgb3RoZXIgaGFuZCBtb2R1bGVzIGNhbiB2
ZXJ5IHdlbGwgbm90IHVzZSBhbnkgZXJyYXRhLXJlbGV2YW50Cj4+ID4gPiBjb2RlLCBzbyB0aGUg
bmV3bHkgYWRkZWQgbW9kdWxlLWFsdGVybmF0aXZlIHN1cHBvcnQgbWF5IGFsc28gcGF0Y2gKPj4g
PiA+IHRoZSBtb2R1bGUgY29kZSwgYnV0IG5vdCB0b3VjaCBTaUZpdmUtc3BlY2lmaWMgZXJyYXRh
cyBhdCBhbGwuCj4+ID4gPgo+PiA+ID4gU28gdG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwgYmVoYXZp
b3VyIGRvbid0IHdhcm4gd2hlbiBwYXRjaGluZwo+PiA+ID4gbW9kdWxlcy4gVGhpcyB3aWxsIGtl
ZXAgdGhlIHdhcm5pbmcgaWYgbmVjZXNzYXJ5IGZvciB0aGUgbWFpbiBrZXJuZWwKPj4gPiA+IGlt
YWdlIGJ1dCBwcmV2ZW50IHNwdXJpb3VzIHdhcm5pbmdzIGZvciBtb2R1bGVzLgo+PiA+ID4KPj4g
PiA+IE9mIGNvdXJzZSBoYXZpbmcgc3VjaCBhIHZlbmRvci1zcGVjaWZpYyB3YXJuaW5nIG1heSBu
b3QgYmUgbmVlZGVkIGF0Cj4+ID4gPiBhbGwsIGFzIENPTkZJR19FUlJBVEFfU0lGSVZFIGlzIHNl
bGVjdGVkIGJ5IENPTkZJR19TT0NfU0lGSVZFIGFuZCB0aGUKPj4gPiA+IGluZGl2aWR1YWwgZXJy
YXRhcyBhcmUgZGVmYXVsdC15IHNvIGRpc2FibGluZyB0aGVtIHJlcXVpcmVzCj4+ID4gPiBkZWxp
YmVyYXRlIGFjdGlvbiBhbnl3YXkuIEJ1dCBmb3Igbm93IGp1c3QgcmVzdG9yZSB0aGUgb2xkIGJl
aGF2aW91ci4KPj4gPiA+Cj4+ID4gPiBGaXhlczogYThlOTEwMTY4YmJhICgicmlzY3Y6IGltcGxl
bWVudCBtb2R1bGUgYWx0ZXJuYXRpdmVzIikKPj4gPiA+IFJlcG9ydGVkLWJ5OiBSb24gRWNvbm9t
b3MgPHJlQHc2cnoubmV0Pgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvQHNudGVjaC5kZT4KPj4gPiA+IC0tLQo+PiA+ID4gIGFyY2gvcmlzY3YvZXJyYXRhL3NpZml2
ZS9lcnJhdGEuYyB8IDMgKystCj4+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+PiA+ID4KPj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Vy
cmF0YS9zaWZpdmUvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMK
Pj4gPiA+IGluZGV4IDY3MmYwMmIyMWNlMC4uMTAzMTAzODQyM2U3IDEwMDY0NAo+PiA+ID4gLS0t
IGEvYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2VycmF0YS5jCj4+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMKPj4gPiA+IEBAIC0xMTEsNiArMTExLDcgQEAgdm9p
ZCBfX2luaXRfb3JfbW9kdWxlIHNpZml2ZV9lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0X2Vu
dHJ5ICpiZWdpbiwKPj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9hcHBseV9lcnJh
dGEgfD0gdG1wOwo+PiA+ID4gICAgICAgICAgICAgICAgIH0KPj4gPiA+ICAgICAgICAgfQo+PiA+
ID4gLSAgICAgICBpZiAoY3B1X2FwcGx5X2VycmF0YSAhPSBjcHVfcmVxX2VycmF0YSkKPj4gPiA+
ICsgICAgICAgaWYgKHN0YWdlICE9IFJJU0NWX0FMVEVSTkFUSVZFU19NT0RVTEUgJiYKPj4gPiA+
ICsgICAgICAgICAgIGNwdV9hcHBseV9lcnJhdGEgIT0gY3B1X3JlcV9lcnJhdGEpCj4+ID4gaWYg
KGNwdV9hcHBseV9lcnJhdGEgJj0gfmNwdV9yZXFfZXJyYXRhKQo+Pgo+PiBIbW0sIEkgZG9uJ3Qg
c2VlIHdoYXQgdGhhdCBjaGFuZ2VzPwo+ICsgICAgICAgaWYgKHN0YWdlICE9IFJJU0NWX0FMVEVS
TkFUSVZFU19NT0RVTEUgJiYKPiArICAgICAgICAgICBjcHVfYXBwbHlfZXJyYXRhICE9IGNwdV9y
ZXFfZXJyYXRhKQo+ICAgICAgICAgICAgICAgICB3YXJuX21pc3NfZXJyYXRhKGNwdV9yZXFfZXJy
YXRhIC0gY3B1X2FwcGx5X2VycmF0YSk7Cj4gKyAgICAgICBlbHNlIGlmIChjcHVfYXBwbHlfZXJy
YXRhICY9IH5jcHVfcmVxX2VycmF0YSkKPiAgICAgICAgICAgICAgICAgd2Fybl9taXNzX2VycmF0
YShjcHVfcmVxX2VycmF0YSAtIGNwdV9hcHBseV9lcnJhdGEpOwo+Cj4gQWxsIG1vZHVsZSdzIGVy
cmF0YSBzaG91bGQgYmUgYSBzdWJzZXQgb2YgdGhlIG1haW4ga2VybmVsLiBOb3QganVzdAo+IHNr
aXAgdGhlIGNoZWNrIG9mIE1PRFVMRS4KPgo+Pgo+Pgo+PiA+IFNoYWxsIHdlIHN0aWxsIGd1YXJh
bnRlZSB0aGUgbW9kdWxlJ3MgbXVzdCBiZSBhIHN1YnNldCBvZiB0aGUgbWFpbiBrZXJuZWwuJ3M/
Cj4+Cj4+IFRoZSB3YXJuaW5nIGdlbmVyYXRlZCB0aGVyZSBpcyBtYWlubHkgdG8gd2FybiBhYm91
dCBzb21lIEtjb25maWcgb3B0aW9ucwo+PiBub3QgYmVpbmcgZW5hYmxlZCBhbmQgaW4gaW5kaXZp
ZHVhbCBtb2R1bGVzIGV2ZW4gbm8gZXJyYXRhIHVzYWdlIG1heSBiZQo+PiByZXF1aXJlZC4KClRo
ZSBwcm9ibGVtIGhlcmUgaXMgcmVhbGx5IHRoZSBtZWNoYW5pc20gYnkgd2hpY2ggdGhhdCB3YXJu
aW5nIGlzIApnZW5lcmF0ZWQ6IHdlIGFzc3VtZSB0aGF0IGVhY2ggYWx0ZXJuYXRpdmUgc3RhZ2Ug
Z2VuZXJhdGVzIGF0IGxlYXN0IG9uZSAKaW5zdGFuY2Ugb2YgZWFjaCBlcnJhdGEsIG90aGVyd2lz
ZSB3ZSBwcm92aWRlIHRoZSB3YXJuaW5nLiAgVGhhdCdzIE9LIApmb3IgdGhlIGtlcm5lbCwgYXMg
d2Ugb25seSBoYXZlIHRoZSBvbmUgZXJyYXRhIHN0YWdlIGZvciBTaUZpdmUgc3R1ZmYsCmJ1dCBt
b2R1bGVzIG1pZ2h0IG5vdCBkaXJlY3RseSBpbmNsdWRlIGFueSBiZWhhdmlvciB0aGF0IGRlcGVu
ZHMgb24gCmVycmF0YSBzbyB0aGV5J2xsIG1pc3MgdGhlIGNoZWNrLgoKSGF2aW5nIGEgbWlzbWF0
Y2ggYmV0d2VlbiB0aGUga2VybmVsIGFuZCBhIG1vZHVsZSBjb3VsZCBhbHNvIGNhdXNlIAppc3N1
ZXMsIGJ1dCB0aGVyZSdzIHdheSBiaWdnZXIgaXNzdWVzIHRoYW4gZXJyYXRhLiAgVW5sZXNzIEkg
bWlzc2VkIApzb21ldGhpbmcgdGhlcmUncyBubyBjaGVja3MgdG8gbWFrZSBzdXJlIHRoZSBrZXJu
ZWwgbWF0Y2hlcyBtb2R1bGVzLCBidXQgCnRoYXQncyBub3QgcmVhbGx5IGFuIGFyY2gvcmlzY3Yg
dGhpbmcuCgo+PiBUaGUgaW50ZW50IGZvciB0aGUgcGF0Y2ggaXMgdG8gcmVzdG9yZSBob3cgdGhp
bmdzIGJlaGF2ZWQgYmVmb3JlCj4+IG1vZHVsZS1hbHRlcm5hdGl2ZXMgd2VyZSBpbnRyb2R1Y2Vk
LCBzbyBJIGRvbid0IHJlYWxseSB3YW50IHRvCj4+IGludHJvZHVjZSBmdW5jdGlvbmFsIGNoYW5n
ZXMgOy0pIC4KCklNTyB0aGF0J3MgZmluZSBmb3IgYSByZWdyZXNzaW9uIGZpeC4gIE1heWJlIHRo
ZXJlJ3MgYmV0dGVyIHdheXMgdG8gZG8gCnRoaXMsIGJ1dCB0aGlzIGF0IGxlYXN0IGdldHMgcmlk
IG9mIHRoZSBzcHVyaW91cyB3YXJuaW5nLgoKPj4gQnV0IGFsc28gaW4gdGhlIGZ1dHVyZSB3ZSBj
b3VsZCBkZWJhdGUgaWYgdGhhdCB3YXJuaW5nIGlzIGhlbHBmdWwgYXQgYWxsLAo+PiBhcyB0aGUg
ZXJyYXRhcyBhcmUgZW5hYmxlZCBhdXRvbWF0aWNhbGx5IGJ5IENPTkZJR19TT0NfU0lGSVZFIGFu
ZAo+PiB0aHVzIGRpc2FibGluZyBpbmRpdmlkdWFsIGVycmF0YXMgcmVxdWlyZXMgc29tZW9uZSB0
byB0dXJuIHRoZW0gb2ZmCj4+IG1hbnVhbGx5IGluIHRoZWlyIC5jb25maWcgLgoKSSBjb3VsZCBz
ZWUgYXJndW1lbnRzIGVpdGhlciB3YXkgaGVyZTogdGhlcmUncyBhIGJ1bmNoIG9mIEtjb25maWdz
IAooZHJpdmVycyBhbmQgc3VjaCkgd2hlcmUgdHVybmluZyB0aGVtIG9mZiB3aWxsIHJlc3VsdCBp
biBrZXJuZWxzIHRoYXQgCmRvbid0IHdvcmsgYW5kIHdlIGRvbid0IHdhcm4gZm9yIHRob3NlLCBi
dXQgZXJyYXRhIGFyZSBhbHNvIGxpa2VseSB0byAKcmVzdWx0IGluIGtlcm5lbHMgdGhhdCBhcmUg
c3VidGx5IGJyb2tlbiBzbyBiZWluZyBleHRyYSBjYXJlZnVsIGFib3V0IApjaGVja2luZyBmb3Ig
dGhlbSBzZWVtcyByZWFzb25hYmxlLgoKVGhpcyBpcyBvbiBmaXhlcy4KClRoYW5rcyEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
