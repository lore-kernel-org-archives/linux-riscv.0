Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAFDC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cgo4hqN21SBgEepTExJjftqADU1X+lRfBLAjxGxqaNE=; b=eK1i1gfnwvgHHn
	+kawoaMdYic3qA31G2dzF3Fn2RKtc+S8lg2AQOCukuh2FURZKo38j5HfH3EBKM87FkczWyqU/gWzE
	IT8MeSBJ8defp4nP50CdKoj0/HAcsv1bXmtqch6rdWzzckLPFarquOOdESg7nzCPx2Ufl3abO9O+K
	1rzpuBJ0ShSeN7s3sJbUvpLB9EQ9JaI9AShTDmcMTA8Pj1wb+9+HC+D/2v6/7sc4zZw/xmCJ3wy69
	Bw0D0foPDCgcBa1m26e2bmINEG/tpPoiu/uq4xR7m3i/L0EJGiWFUuHWbhhWe9CjaK3ITq/4k539K
	ejLII9BgkB2X5JYT+PLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptmxO-000sqq-1d;
	Tue, 02 May 2023 10:10:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptmxL-000spY-1x
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 10:10:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1191661D3E;
	Tue,  2 May 2023 10:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF92C433A1;
	Tue,  2 May 2023 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683022198;
	bh=8gNEyWWACUeeP7m7t0N/tXXQmwetfjaFAJPzW/qAkvc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rPttr6hAeJqsGZPJsVvwf3Xw/k8Ltqgxi8wlnPBL01CGAamhvCP2yKD9IkMvFdZ8F
	 xDgbjnVL9VsPawKuoxQb2NUIYnLcsPiRLzfQR4buUDu3zGtFMbPUo1g23PrLpDyVv+
	 C6sStexoJUt9LY4Ah16xc+MpHUQt772yvzW9RlaCSLA6x6UvLXQhFTjjP8gRVecNtz
	 D1kS1M11/IheHMV76bbKH1m6gzxrTRaHxNVd796hXuPHKi9iHep2pgQlPn0JCTn1N9
	 5Z2rXEOij+5McZnr92Tfp5zdwIulrW00FqrjeA01tRTb6s4aygIelR5ZawVfRCAobd
	 GJVdEy0eb2/2Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Kito Cheng <kito.cheng@sifive.com>, Conor
 Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, Greentime Hu
 <greentime.hu@sifive.com>, nick.knight@sifive.com,
 christoph.muellner@vrull.eu, richard.henderson@linaro.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux
 vector
In-Reply-To: <CAAeLtUCqyARVaY2YtVXWc_cucMOCbQ2RAd2y35pun_MMagEN_w@mail.gmail.com>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <87ednz7roh.fsf@all.your.base.are.belong.to.us>
 <7DD2C38C-CBB3-41EE-A195-50E4C2451B7E@jrtc27.com>
 <CAAeLtUADqnwrgBjhDd+iNfwhMU6YBiMUZzeopVMAh0Jq19W9JA@mail.gmail.com>
 <87jzxrnp01.fsf@all.your.base.are.belong.to.us>
 <CAAeLtUCqyARVaY2YtVXWc_cucMOCbQ2RAd2y35pun_MMagEN_w@mail.gmail.com>
Date: Tue, 02 May 2023 12:09:55 +0200
Message-ID: <87pm7j9h8s.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_030959_720952_5218A001 
X-CRM114-Status: GOOD (  29.36  )
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

UGhpbGlwcCBUb21zaWNoIDxwaGlsaXBwLnRvbXNpY2hAdnJ1bGwuZXU+IHdyaXRlczoKCj4gT24g
VHVlLCAyIE1heSAyMDIzIGF0IDA5OjU4LCBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3Jn
PiB3cm90ZToKPj4KPj4gUGhpbGlwcCBUb21zaWNoIDxwaGlsaXBwLnRvbXNpY2hAdnJ1bGwuZXU+
IHdyaXRlczoKPj4KPj4gPiBJdCBpcyBhIHBpdHkgdGhhdCB0aGUgY3VycmVudCBpbnRlcmZhY2Ug
d2FzIGRlc2lnbmVkIHdpdGhvdXQgaW52b2x2aW5nCj4+ID4gUlZJIChhbmQgdGhhdCBJIGhhZCB0
byBhc2sgbXkgdGVhbSB0byBwdXQgdG9nZXRoZXIgYSBwYXRjaCBzZXQgZm9yCj4+ID4gZnVydGhl
ciBkaXNjdXNzaW9uLCBnaXZlbiB0aGF0IG5vbmUgb2YgdGhlIG90aGVyIG1ham9yIHZlbmRvcnMg
aW4gUlZJCj4+ID4gc3RlcHBlZCBmb3J3YXJkKS4gIEkgZ3VhcmFudGVlIHRoYXQgcGxlbnR5IG9m
IHJldmlld2VycyB3b3VsZCBoYXZlCj4+ID4gaGlnaGxpZ2h0ZWQgdGhhdCBhIGNlbnRyYWwgcmVn
aXN0cnkgKGV2ZW4gaWYgaXQgaXMganVzdCBhIGtlcm5lbAo+PiA+IGhlYWRlcikgc2hvdWxkIGJl
IGF2b2lkZWQuCj4+Cj4+IEFyZSB5b3UgY2xhaW1pbmcgdGhhdCB0aGUgaHdwcm9iZSB3b3JrIHdh
cyBub3QgZG9uZSBpbiB0aGUgb3BlbiwgYnV0Cj4+IHNlY3JldGx5IG1lcmdlZD8gVGhhdCBpcyBu
b3Qgb25seSBpbmNvcnJlY3QsIGJ1dCBydWRlIHRvIHVwc3RyZWFtIFJJU0MtVgo+PiBMaW51eCBk
ZXZlbG9wZXJzLiBJIHN1Z2dlc3QgeW91IHJldmlldyBob3cgeW91IGludGVyYWN0IHdpdGggdXBz
dHJlYW0KPj4ga2VybmVsIHdvcmsuCj4KPiBQbGVhc2UgZG9uJ3QgcHV0IHdvcmRzIGludG8gbXkg
bW91dGguLi4KPgo+IEkgd2FzIG1lcmVseSBwb2ludGluZyBvdXQgdGhhdCB0aGVyZSB3YXMgbm8g
ZW5nYWdlbWVudCBieSB0aGUgUlZJCj4gbWVtYmVyIGNvbXBhbmllcyAoaW4gcmVnYXJkIHRvIHRo
aXMgbWVjaGFuaXNtKSB3aXRoaW4gUlZJLCB3aGljaCB3b3VsZAo+IGhhdmUgcHJldmVudGVkIEpl
c3NpY2EncyBpc3N1ZS4KPiBUaGlzIHdvdWxkIGhhdmUgYWxzbyBoZWxwZWQgdG8gYWRkcmVzcyB0
aGUgY29uY2VybnMgb24gdmVuZG9yLWRlZmluZWQKPiBleHRlbnNpb25zLgo+IAo+IEFsc28gd2hv
IGRvIHlvdSByZWZlciB0byB3aGVuIHlvdSBzYXkgImhvdyBfeW91XyBpbnRlcmFjdCI/ICBJZiBp
dCBpcwo+IFJWSSB0aGF0IHlvdSByZWZlciB0bzogaXQgZG9lc24ndCBpbnRlcmFjdCB3aXRoIHVw
c3RyZWFtIHdvcmsKPiBkaXJlY3RseSwgYXMgaXQgZG9lc24ndCBvd24gYW55IGVuZ2luZWVyaW5n
IHJlc291cmNlcy4KPiBSVkkgcHJvdmlkZXMgYSBmb3J1bSBmb3IgbWVtYmVyIGNvbXBhbmllcyB0
byBjb21lIHRvIGFuCj4gdW5kZXJzdGFuZGluZy9kZXNpZ24gYW5kIHRoZW4gaGF2ZSB0aGUgbWVt
YmVyIGNvbXBhbmllcyBwZXJmb3JtIHRoZQo+IHdvcmsgYW5kIHRha2UgaXQgdXBzdHJlYW0uCgpU
aGFuayB5b3UgZm9yIGNsZWFyaW5nIHRoYXQgdXAuIEkgZ3Vlc3MgSSB3YXMgZ3JvdXBpbmcgUlZJ
L1JWSSBtZW1iZXJzCmludG8gb25lLiBNYW55IG9mIHRoZSBSVkkgbWVtYmVycyBoYXZlIGFjdGl2
ZSBrZXJuZWwgZGV2ZWxvcGVycy4gT25lCmNvdWxkIGFyZ3VlIHRoYXQgdGhlIGlmIHRoZXJlIHdh
cyBhIGNvbmNlcm4gYWJvdXQgY3VycmVudCB3b3JrLCB0aGF0IGl0CndvdWxkIGhhdmUgYmVlbiBy
YWlzZWQgYnkgbWVtYmVycyB0byBSVkksIG5vPyBCdXQgdGhhdCdzIGFub3RoZXIKZGlzY3Vzc2lv
biwgYW5kIG1heWJlIG9uZSB0aGF0IHNob3VsZCBiZSBkb25lIGJldHdlZW4gUlZJIG1lbWJlcnMu
CgpBcG9sb2dpZXMgaWYgSSBvZmZlbmRlZCB5b3UsIHRoYXQgd2FzIG5vdCBteSBpbnRlbnRpb24u
IElmIHRoYXQgd2FzIHRoZQpjYXNlOyBJJ20gdmVyeSBzb3JyeSwgUGhpbGlwcCEgSSBjYW4gc2F5
LCB0aGF0IHRoZSB0aW1pbmcgb2YgdGhpcyBzZXJpZXMKbWFkZSBtZSBhIGJpdCB3YXJ5LiBNeSBy
ZWFkaW5nIHdhcyAiT2gsIFRIRVkgZGlkbid0IGluY2x1ZGUgdXMsIGFuZApnb2luZyBiZWhpbmQg
b3VyIGJhY2shIEhlcmUncyBPVVIgc29sdXRpb24hIi4gSGFwcHkgdGhhdCB3YXNuJ3QgdGhlCmNh
c2UhCgpJJ20gY29udmluY2VkIHRoYXQgd2UgKHVwc3RyZWFtIGRldmVsb3BlcnM7IHNvbWUgd29y
a2luZyBmb3IgUlZJIG1lbWJlcgpjb21wYW5pZXMsIHNvbWUgbm90KSBzdGlsbCBjYW4gbWFrZSB2
ZW5kb3ItZGVmaW5lZCBleHRlbnNpb25zIHdvcmsuCgo+PiBXaHkgZGlkbid0IFJWSSBnZXQgaW52
b2x2ZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgc2VyaWVzPyBUaGUgZXhwZWN0YXRpb24KPj4gY2Fu
bm90IGJlIHRoYXQgYWxsIG9wZW4gc291cmNlIHByb2plY3RzIGdvIHRvIFJWSSwgYnV0IHJhdGhl
ciB0aGUgb3RoZXIKPj4gd2F5IGFyb3VuZC4KPgo+IFRoYXQgaXMgZXhhY3RseSB0aGUgcG9pbnQg
SSB3YXMgbWFraW5nIGFuZCB3aGljaCB5b3Ugc2VlbSB0byBtaXNzOiBSVkkKPiBkb2VzIG5vdCBv
d24gYW55IGVuZ2luZWVyaW5nIHJlc291cmNlcyBhbmQgZGVwZW5kcyBzb2xlbHkgb24gaXRzCj4g
bWVtYmVyIGNvbXBhbmllcyB0byBwcm9qZWN0IGludG8gb3BlbiBzb3VyY2UgcHJvamVjdHMuCgpP
ay4KCj4+IFRha2UgYSBsb29rIGF0IGNvbW1pdCBlYTNkZTljZThhYTIgKCJSSVNDLVY6IEFkZCBh
IHN5c2NhbGwgZm9yIEhXCj4+IHByb2JpbmciKS4gWW91ciB0ZWFtIHdhcyB2ZXJ5IG11Y2ggaW52
b2x2ZWQgaW4gdGhlIHJldmlldy4KPgo+IEkgYW0gYXdhcmUsIGFzIEkgaGFkIHJldmlld2VkIGFu
ZCBjb21tZW50ZWQgb24gdGhlc2UgYXJlIHdlbGwuCj4gQW5kIG15IG9ubHkgcmVxdWVzdCAod2Fz
IGFuZCkgaXMgdGhhdCB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgYSB3YXkgdG8KPiBlZmZpY2llbnRs
eSBkZWFsIHdpdGggdmVuZG9yLWRlZmluZWQgZXh0ZW5zaW9ucy4KCkF3ZXNvbWUsIHRoYXQgbWFr
ZXMgdHdvIG9mIHVzISBMZXQncyB0cnkgdG8gZG8gdGhhdCBieSBjb2xsYWJvcmF0aW5nIG9uCndo
YXQncyB1cHN0cmVhbSwgYW5kIGJ1aWxkaW5nIG9uIHRvcCBvZiB0aGF0LgoKCkJqw7ZybgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
