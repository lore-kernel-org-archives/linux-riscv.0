Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D29EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 20:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aO3D+YLTc3xpMEVe351/cNR+ZoVJsFnffBJ/iRtJmas=; b=1dw5ry0wNYYcarxZ7V3x9AF0pD
	VglX2CUtURowiQd09Yw8STAiCPDdKQj9Vu9KEDJ9ngcHDNeEFEl0hEMCgfHfpro41swaA1iP5AqNl
	nHHsvxj6Ob8MmFdy9Kw0hNHz6W1arRhGOsfyPzBrR1tlpmOWax+w/RT94komwLZ+7EXLtq5bzPhsI
	uH23/OYC0i6PbtzqFTsJ8HTEIyKmfXdIxd6W0NNj4e7xZeXtNehAiZk4Iiq1OY4qvEAUGE5Ovmio4
	8427tg2JMRYXEH7o1B1mHWJBEbm+P0wWHWQuhl376aINAzfUIFMJmCxnrUSFQq9KWAMWJOHyZZtOV
	ifFhzbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDt8O-00B1hc-1g;
	Mon, 26 Jun 2023 20:48:28 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDt8I-00B1gr-30
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 20:48:27 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6686708c986so3729722b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 13:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687812501; x=1690404501;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUPTOszK2L9RCrE5SeliLMIYDzSq6csnmoch3YF2q0Y=;
        b=kxQT1GBgAzYDw2egy8FFSNfu/DK7t7VCYNPVi1sUyLhtgkqmYuggpiomMVY30YwmQq
         pbt3hR0Z8puHg5J7WX/es6N5w6oRkSYMKfsDpHOO2p356yR+mCHidn/Q7CLWV2N0PJW3
         KoNydOqe8SUO9O/Rc+/ODMyJQ1of2JtSthgQ5aYR+m5oRhiptsCpChy8+dMSoETzTx9D
         BMMid2V7FrXpC03se4vf4Vc2dmrendNw3kZOWzEZkRrQotq3yyJp+KgI4DG1zeX8EoLV
         chHlZYotu1h9onpDU52TvrbogPa+ryTG70YI+ED1R/mYObKExMq7XcPZlTwMcjUGto8q
         cjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687812501; x=1690404501;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUPTOszK2L9RCrE5SeliLMIYDzSq6csnmoch3YF2q0Y=;
        b=kROSACMIED3XdU0SVN1vFmvxOgoBbEmM0ul7FkHgGJZ/84NZZkLTr6n6dOVN1H80gM
         +0eSNEeE6XrnH683efF8S3Yl3oo56o7Shm3ryICiq4D2CXItb2nqIXp3oDKkIDK5p3eT
         eJ66x2sVfvUffMsO/k7gDwQLu/PSzjC/g1z1Xnu/7DfPDvcKoIm31snVln8lZBxsgoh2
         whnrZLQ8GxMDQ9645pw3fuhV0+qiOjN0ZnmgkDftDPdZ9ruyqiUDK6FWCz+Y/mXhiJwb
         5A2SZFGRFgJ9krMfTU7KlQ0DHcsa1NAGEMyrwsTO/hoEAwPxZ6k/eqz4KZfz6+bDVVXO
         vz4w==
X-Gm-Message-State: AC+VfDzS3vI961Xu0k1623mZi7JPJitc8LQOhkFe6QIy7KjwFeaiSvhh
	T3KZEs2jHUstDZMz5fCDnbX7/A==
X-Google-Smtp-Source: ACHHUZ6APq8gFSVMvW+cM54DA/ooh6HUyAsu9eSOu1JPULox1+qpHjnMZl2xusR6S+zbo5U8NDKllw==
X-Received: by 2002:a05:6a20:7495:b0:11f:33da:56ec with SMTP id p21-20020a056a20749500b0011f33da56ecmr34404579pzd.27.1687812501350;
        Mon, 26 Jun 2023 13:48:21 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u4-20020a634544000000b0052c9d1533b6sm4536193pgk.56.2023.06.26.13.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:48:20 -0700 (PDT)
Date: Mon, 26 Jun 2023 13:48:20 -0700 (PDT)
X-Google-Original-Date: Mon, 26 Jun 2023 13:48:19 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
In-Reply-To: <20230626-nature-seventh-6102e17bb4be@spud>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-7656ce4f-bdcb-419c-8a77-18ab7d301cd7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_134823_218666_9C371CEF 
X-CRM114-Status: GOOD (  30.79  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNiBKdW4gMjAyMyAxMzozNDoyNCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDEyOjI1OjQyUE0gLTA3MDAsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDU6MTLigK9QTSBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0
IDAzOjIzOjUzUE0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4+ID4gPiBJbiAvcHJvYy9jcHVp
bmZvLCBtb3N0IG9mIHRoZSBpbmZvcm1hdGlvbiB3ZSBzaG93IGZvciBlYWNoIHByb2Nlc3NvciBp
cwo+PiA+ID4gc3BlY2lmaWMgdG8gdGhhdCBoYXJ0OiBtYXJjaGlkLCBtdmVuZG9yaWQsIG1pbXBp
ZCwgcHJvY2Vzc29yLCBoYXJ0LAo+PiA+ID4gY29tcGF0aWJsZSwgYW5kIHRoZSBtbXUgc2l6ZS4g
QnV0IHRoZSBJU0Egc3RyaW5nIGdldHMgZmlsdGVyZWQgdGhyb3VnaCBhCj4+ID4gPiBsb3dlc3Qg
Y29tbW9uIGRlbm9taW5hdG9yIG1hc2ssIHNvIHRoYXQgaWYgb25lIENQVSBpcyBtaXNzaW5nIGFu
IElTQQo+PiA+ID4gZXh0ZW5zaW9uLCBubyBDUFVzIHdpbGwgc2hvdyBpdC4KPj4gPiA+Cj4+ID4g
PiBOb3cgdGhhdCB3ZSB0cmFjayB0aGUgSVNBIGV4dGVuc2lvbnMgZm9yIGVhY2ggaGFydCwgbGV0
J3MgcmVwb3J0IElTQQo+PiA+ID4gZXh0ZW5zaW9uIGluZm8gYWNjdXJhdGVseSBwZXItaGFydCBp
biAvcHJvYy9jcHVpbmZvLgo+PiA+Cj4+ID4gTm8sIHlvdSBjYW4ndCBkbyB0aGlzIGFzIGl0IGJy
ZWFrcyB0aGUgYXNzdW1wdGlvbnMgb2YgdXNlcnNwYWNlIHRoYXQKPj4gPiB0aGlzIHNob3dzIHRo
ZSBzZXQgc3VwcG9ydGVkIGFjcm9zcyBhbGwgaGFydHMuCj4+ID4gU29ycnksIGJ1dCBOQUsuCj4K
Pj4gTXkgaG9wZSB3YXMgdGhhdCB3ZSB3ZXJlIHN0aWxsIGVhcmx5IGVub3VnaCB0aGF0IG5vIHBy
b2R1Y3Rpb24gc3lzdGVtcwo+PiBleGlzdGVkICh5ZXQpIHRoYXQgYWN0dWFsbHkgaGFkIGRpZmZl
cmVudCBJU0EgZXh0ZW5zaW9ucyBpbiB0aGUgc2V0IHdlCj4+IHRyYWNrLCBhbmQgdGhlcmVmb3Jl
IHVzZXJtb2RlIHdvdWxkIGhhdmUgYmVlbiB1bmFibGUgdG8gbWFrZSB0aG9zZQo+PiBhc3N1bXB0
aW9ucyBhdCB0aGlzIHBvaW50LiBJZiBzdWNoIGEgc3lzdGVtIGV4aXN0cywgYW5kIEkgZG9uJ3Qg
a25vdwo+PiBpZiBpdCBkb2VzIG9yIG5vdCwgdGhlbiBJIGFncmVlIGl0J3MgdG9vIGxhdGUgdG8g
bWFrZSBhIGNoYW5nZSBsaWtlCj4+IHRoaXMuCj4KPiBZb3Ugc2hvdWxkIHB1dCB0aGlzIGluZm9y
bWF0aW9uIGludG8geW91ciBjb21taXQgbWVzc2FnZXMgJiBub3QganVzdAo+IGhvcGUgdGhhdCBw
ZW9wbGUgdW5kZXJzdGFuZCB5b3VyIGludGVudC4KPiBVc2Vyc3BhY2UgZG9lcyBhY3R1YWxseSBt
YWtlIHRoZXNlIGFzc3VtcHRpb25zIGFscmVhZHksIHNlZSBmb3IgZXhhbXBsZQo+IHRoaXMgR29v
Z2xlICJjcHUgZmVhdHVyZXMiIHJlcG86Cj4gaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9jcHVf
ZmVhdHVyZXMvdHJlZS9tYWluCj4gVG8gYmUgcXVpdGUgaG9uZXN0LCBJIHJlYWxseSBkaXNsaWtl
IHRoZSBmcmFnaWxpdHkgb2Ygd2hhdCB0aGV5IGhhdmUKPiBpbXBsZW1lbnRlZCAtIHdpdGggb25s
eSBvbmUgb2YgdGhlIHJlYXNvbnMgYmVpbmcgdGhleSBtYWRlIHRoZSBtaXN0YWtlCj4gb2YgYXNz
dW1pbmcgaG9tb2dlbmVpdHkuCj4KPiBUaGVyZSdzIGdvdCB0byBiZSBhIGxpbmUgc29tZXdoZXJl
IGZvciB3aGF0IGNvbnN0aXR1dGVzIGJ1Z2d5IHVzZXJzcGFjZQo+IGFuZCB3aGF0J3MgYSByZWdy
ZXNzaW9uLiBVcCB0byBQYWxtZXIgSSBzdXBwb3NlIGFzIHRvIHdoYXQgY29uc3RpdHV0ZXMKPiB3
aGljaC4KCk1heWJlIGxldCdzIGp1c3QgYWRkIGEgcHJldHR5IHByaW50ZWQgdmVyc2lvbiBvZiB0
aGUgaHdwcm9iZSBpbmZvIHRvIAovcHJvYy9jcHVpbmZvLCBhbmQgdGhlbiBsZWF2ZSB0aGUgSVNB
IHN0cmluZyBhbG9uZSBhcyBhIGxlZ2FjeSAKaW50ZXJmYWNlPwoKSGF2aW5nIHNvbWV0aGluZyBz
byBwb29ybHkgZGVmaW5lZCBhcyB1QUJJIGlzIGEgYml0IGVtYmFyYXNzaW5nLCBidXQgCml0J3Mg
b3VyIG1pc3Rha2Ugc28gd2UndmUgZ290IHRvIGxpdmUgd2l0aCBpdC4KCj4+IEkgdGhvdWdodCBJ
J2QgcHV0IHRoaXMgb3V0IGhlcmUgYW5kIHNlZSBpZiBzb21lb25lIGNvdWxkIHBvaW50IGF0IHN1
Y2gKPj4gYSBzeXN0ZW07IGJ1dCBpZiBub3QgaXQnZCBiZSBncmVhdCB0byBrZWVwIC9wcm9jL2Nw
dWluZm8gYWNjdXJhdGUgYW5kCj4+IGNvbnNpc3RlbnQgd2l0aCBod3Byb2JlICh3aGljaCBkb2Vz
IHJldHVybiBhY2N1cmF0ZSBwZXItaGFydCBJU0EKPj4gZXh0ZW5zaW9uIGluZm8pLgo+Cj4gSnVz
dCBhbm90aGVyIG5haWwgaW4gdGhlIGNvZmZpbiBmb3IgYSBiYWQgaW50ZXJmYWNlIDopCj4gVGhl
cmUgYXJlIGFwcGFyZW50bHkgc29tZSBtaXhlZCBjOTA2IGNoaXBzIHRoYXQgc3VwcG9ydCB2ZWN0
b3Igb24gb25lCj4gY29yZSBhbmQgbm90IHRoZSBvdGhlciAtIGFsdGhvdWdoIGl0IGlzIHRoZWFk
IHZlY3RvciB3aGljaCBpcyBub3QKPiBzdXBwb3J0ZWQgdXBzdHJlYW0geWV0Li4uCj4KPiBPdGhl
ciB0aGFuIHRoYXQsIFNpRml2ZSBzdHVmZiB0ZWNobmljYWxseSBjYW4gYmUgbWl4ZWQgLSBydjY0
aW1hYyAmCj4gcnY2NGltYWZkYyBvbiBhIGJ1bmNoIG9mIHRoZSBvbGRlciBzdHVmZi4gSSBkb24n
dCB0aGluayBhbnlvbmUgYWN0dWFsbHkKPiBydW5zIHRob3NlIHNvcnQgb2YgY29uZmlndXJhdGlv
bnMgb24gdGhlbSB0aG91Z2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
