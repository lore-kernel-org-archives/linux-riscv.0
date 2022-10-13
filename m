Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE41C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=m86wx0ePhCWAnVFACm6UXEp8z2pNChiLwKo7tVZhsH8=; b=Px9mvRnRVP8dmr/xPKL+vMGHLu
	wiMzquNATKePLnk0Q6HaikkMvtqKEAdkDY0KsdlLuW4R8omcEAiYAFJzI0rzcHh9vCvd1QSw4Mi4d
	mlhMharOTsQZvA0rpfm/Wh7AKDANJLpWu7fMXxq2+zKT9RA7uDlEqeTEYssiJdTZ2q118VtIMG1bq
	qgZud4LosFYcP7eQPnyOp7QyykxB2sIiPeKqcWPak+I1vKdxAHxkLn/y6rYcTpHUFVO3iDNidzWAp
	MuP9LpBuoUBoJWqeFF0hkSw9vNfAD/mCTiqdTChwQKPijTlXZXozv2kqKOFTZuy/ofDXGQB80evV1
	05IWb8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bj-00Crei-Ti; Thu, 13 Oct 2022 19:48:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bh-00CrdV-BO
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 19:48:15 +0000
Received: by mail-pg1-x529.google.com with SMTP id r18so2419965pgr.12
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgZOJIzJ73Ud5K4AO9wMRxTvyPd7NOkkGohUnr84Uc4=;
        b=VlS7HWDyZxpbJhYUSnLGjJZmLD7+PxV0SNMJeYf5vnqjd3mBJYrGyIzo2G+HpLPMp7
         2LJo6lnnkRcN1KCtCgkoxeBCJmPC5RJrqjYh1Vr+BFv3GHOyqB6hCQge1TjvgKiRq8ha
         uCJt3jbAtZpmYDy+1YYtZCtS+26QcIc6b2pWqsjYP0sajI/5aByQQKUR5bYqN4WJJnNw
         g0lAa4CRgsbDsfWuzP+zVFixgId4ufdA2vPKu/HAGhxFKdN+OJ7LNpi0VpjWt1ITo4XK
         QUWl05hNBFS+9rsYpz+n3VkelYPR7rBVAzYpAI26Cq+Fyz7d7ClzmSD529Lk8Grmz8YU
         D6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgZOJIzJ73Ud5K4AO9wMRxTvyPd7NOkkGohUnr84Uc4=;
        b=Ke3bO+v6fvaP4qRWoVw8kJOXbIhxvHB/LV8JzOcmy1fprT2Yqlz/aqDPxmBFy9cCEM
         VbyU+X4+g+dPNqblKAUEUk8jhD7grQr4JDFJP4pqOtVgPum3xpcY4v7VFzI2pi0uUKzd
         Y2fSnSg7BLban408farB1JcJh7uo/P7s2bcoQw6jYSSy3et/qoFBZCQtg4ghhsmrGN/c
         WHu/aPzWa9J3U+Q7S4O9/gXC2d28GTK5NRV1n/OzgMtJi0KaqdmXPUjKtuME0A/Xd2KN
         U5iaC54TF/70ijlSi57ti51wsysL7J4+YYMRYRjeZQFGpls4LPaOa6G3zdMTl7TyaTVU
         iYZA==
X-Gm-Message-State: ACrzQf132z7p9IzmHJEJW6kMr3m+JVqqPJOOO+sIjN7qX0j2XZ8ppLr0
	t+ghUHAJ8W64TL9VAksagjQDsQ==
X-Google-Smtp-Source: AMsMyM77texRQgum7ZA4975dKa4r36xr/DFtWQxFz6jNF/AiXBr6NsBpb26mIPpJZGbPmr/XsyrjBA==
X-Received: by 2002:a05:6a00:2291:b0:563:9d0d:62ae with SMTP id f17-20020a056a00229100b005639d0d62aemr1207346pfe.17.1665690490240;
        Thu, 13 Oct 2022 12:48:10 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b0017a0e78ed0dsm205370plx.254.2022.10.13.12.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:48:09 -0700 (PDT)
Date: Thu, 13 Oct 2022 12:48:09 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Oct 2022 11:29:01 PDT (-0700)
Subject: Re: [PATCH] riscv: enable software resend of irqs
In-Reply-To: <86ilkof2jz.wl-maz@kernel.org>
CC: bjorn@kernel.org, tglx@linutronix.de, conor.dooley@microchip.com,
  aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  samuel@sholland.org, dfustini@baylibre.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-5edb73ee-d815-48d9-ad07-980a7623c05b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_124813_617288_837DDB27 
X-CRM114-Status: GOOD (  21.05  )
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

T24gVGh1LCAxMyBPY3QgMjAyMiAwMzoyMDowMCBQRFQgKC0wNzAwKSwgTWFyYyBaeW5naWVyIHdy
b3RlOgo+IE9uIFRodSwgMTMgT2N0IDIwMjIgMDI6MTM6NTAgKzAxMDAsCj4gUGFsbWVyIERhYmJl
bHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiBNb24sIDEwIE9jdCAyMDIy
IDA0OjIxOjM4IFBEVCAoLTA3MDApLCBiam9ybkBrZXJuZWwub3JnIHdyb3RlOgo+PiA+IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyaXRlczoKPj4gPiAKPj4gPj4g
VGhlIFBMSUMgc3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBkZXNjcmliZSB0aGUgaW50ZXJydXB0IHBl
bmRpbmdzIGJpdHMgYXMKPj4gPj4gcmVhZC13cml0ZSwgb25seSB0aGF0IHRoZXkgImNhbiBiZSBy
ZWFkIi4gVG8gYWxsb3cgZm9yIHJldHJpZ2dlcmluZyBvZgo+PiA+PiBpbnRlcnJ1cHRzIChhbmQg
dGhlIHVzZSBvZiB0aGUgaXJxIGRlYnVnZnMgaW50ZXJmYWNlKSBlbmFibGUKPj4gPj4gSEFSRElS
UVNfU1dfUkVTRU5EIGZvciBSSVNDLVYuCj4+ID4+IAo+PiA+PiBMaW5rOiBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvcmlzY3YtcGxpYy1zcGVjL2Jsb2IvbWFzdGVyL3Jpc2N2LXBsaWMuYWRvYyNp
bnRlcnJ1cHQtcGVuZGluZy1iaXRzCj4+ID4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+ID4gCj4+ID4gV2FraW5nIHVwIGFuIG9sZCB0
aHJlYWQuIEZXSVcsCj4+ID4gCj4+ID4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QGtlcm5lbC5vcmc+Cj4+IAo+PiBUaGFua3MuICBUaGlzIGxvb2sgcmVhc29uYWJsZSB0byBtZSwg
bm90IHN1cmUgaWYgdGhlIGlycWNoaXAgZm9sa3MKPj4gaGF2ZSBhbiBvcGluaW9uIHRob3VnaD8K
Pj4gCj4+IEluIHRoZW9yeSB0aGUgUExJQyBpc24ndCB0aGUgb25seSBpbnRlcnJ1cHQgY29udHJv
bGxlciAoYW5kIHRoYXQgc3BlYwo+PiBwcmVkYXRlcyBtb3N0IG9mIHRoZSBpbXBsZW1lbnRhdGlv
bnMpLCBidXQgdGhlIFNpRml2ZSBQTElDIGRlcml2ZWQKPj4gaW50ZXJydXB0IGNvbnRyb2xsZXJz
IGhhdmUgYmVjb21lIGEgZGVmYWN0byBzdGFuZGFyZCBhbmQgSUlSQyB0aGV5J3JlCj4+IHRoZSBv
bmx5IHRoaW5nIHNoaXBwaW5nIHJpZ2h0IG5vdyBzbyBJIHRoaW5rIGl0J3MgT0sgdG8ganVzdCBz
dGljawo+PiB0aGlzIGluIGFyY2ggY29kZS4gIFdlIGNvdWxkIG1hcmsgaXQgYXMgImlmIFNJRklW
RV9QTElDIiBvciBzb21ldGhpbmcsCj4+IGJ1dCBJIGRvbid0IGtub3cgaWYgdGhhdCdzIHdvcnRo
IGRvaW5nLgo+Cj4gU2V0dGluZyBpdCBhdCB0aGUgYXJjaGl0ZWN0dXJlIGxldmVsIGlzIGF0IGxl
YXN0IGNvbnNpc3RlbnQgd2l0aCB3aGF0Cj4gb3RoZXIgYXJjaGVzIGFyZSBkb2luZy4gSWYgd2Ug
bmVlZCB0byBmaXggaXQgb25lIGRheSwgd2UnbGwgZG8gaXQKPiBnbG9iYWxseS4KCldvcmtzIGZv
ciBtZS4KCj4KPj4gCj4+IEVpdGhlciB3YXksIHRoaXMgaXNuJ3QgcmVhbGx5IG15IHRoaW5nLiAg
SGFwcHkgdG8gdGFrZSBpdCB2aWEgdGhlCj4+IFJJU0MtViB0cmVlLCBidXQgCj4+IEFja2VkLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4gVGVzdGVkLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gIyBvbiBRRU1VCj4KPiBQbGVhc2UgdGFr
ZSBpdCBkaXJlY3RseSwgYW5kIGZlZWwgZnJlZSB0byBhZGQgbXkKPgo+IEFja2VkLWJ5OiBNYXJj
IFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+Cj4gdG8gaXQuCgpUaGFua3MsIGl0J3Mgb24gcmlz
Y3YvZm9yLW5leHQuCgo+Cj4gVGhhbmtzLAo+Cj4gCU0uCj4KPiAtLSAKPiBXaXRob3V0IGRldmlh
dGlvbiBmcm9tIHRoZSBub3JtLCBwcm9ncmVzcyBpcyBub3QgcG9zc2libGUuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
