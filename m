Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEFEC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YK5BfMYQBp0dtfMl3G4PuE78bwLfantl7CpLfbphdI=; b=jAOkgGK2ACvZIc
	FwEbZWBF+M19Kh3nL6toPaXYwSS5Oop4pdmXwQaK/WqP9asdJFKvVAJ9vXAtzVjXAeFujrGHI73eL
	Ak6cTNcCQuM4n4f7gYOm1M4UuneMe2BroP5YqPmQDJUWdbFIrNFJ1NfrNOxAOP2IQc3TJ+EM3pnoc
	r/PFwx5iqIeFL0fJ+RSaWViwC72pi14nvwyrodDDbImvxb87sJJMb/PrEGIDIPjnIUI4h/qGukFoe
	VJ2FcNr2MF+Rlv/3dW8V5RKtC2EiZEvOIwXuzNCPeNTXDbCgt0nkdxCmR7cXaFb4PRaNNPEHmz0iq
	8d76ZU8A5DN4WqXmBCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZ6P-008sjz-DB; Thu, 16 Feb 2023 07:54:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZ6L-008sit-P5
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 07:54:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BEC961EAB;
	Thu, 16 Feb 2023 07:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B89C433EF;
	Thu, 16 Feb 2023 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676534083;
	bh=KA/5JF5HlerkurForNO9JKH5IFf6vgsN6Wv08r1dIwM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l/WJ5eYYPOVw4F5vwb0QTZCVSVofcMD8FP6A6jZfcJsTs2qNkbEuZntflodp7jdjM
	 U395s6xJr3Ll2QU3lJST1ALbt4JjCwjremXGiRU5dIC5tj5OdJJfnKsDviK988ESrg
	 ubh/YJjD7lWxQj2S7uVO+AvKs+5wnP6RqHzSuzYIbtwrklFdnJwaooLHvzXNchiCJV
	 oPe8Uf9t6Lpb5xP8xV1MpO0NN298ErBhPmfmz652cxGdDFBHhAKM+N1HDdJ2Vnb4w+
	 GVi7KzDV0DsuEtITSI1/EX3SBp/6eBaCipwNuoVWfckGLCHbaANlCeHa4zKCVfl9Nj
	 lFEOtMN0c9oCQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>, Andrea Parri <parri.andrea@gmail.com>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, Changbin
 Du <changbin.du@huawei.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
In-Reply-To: <CAJF2gTQsRcUpMk8nvFkEsz_fpVV+v6tpUDcPzaNjqfj+i_VvXA@mail.gmail.com>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <87ilgntdef.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
 <Y9jz+zUDebQ4VLlF@andrea>
 <CAJF2gTQsRcUpMk8nvFkEsz_fpVV+v6tpUDcPzaNjqfj+i_VvXA@mail.gmail.com>
Date: Thu, 16 Feb 2023 08:54:41 +0100
Message-ID: <878rgy3v0e.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_235445_932950_FC07167A 
X-CRM114-Status: GOOD (  19.32  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gVHVlLCBKYW4gMzEsIDIw
MjMgYXQgNjo1NyBQTSBBbmRyZWEgUGFycmkgPHBhcnJpLmFuZHJlYUBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pgo+PiA+ID4gSXQncyB0aGUgY29uY3VycmVudCBtb2RpZmljYXRpb24gdGhhdCBJIHdhcyBy
ZWZlcnJpbmcgdG8gKHJlbW92aW5nCj4+ID4gPiBzdG9wX21hY2hpbmUoKSkuIFlvdSdyZSBzYXlp
bmcgIml0J2xsIGFsd2F5cyB3b3JrIiwgSSdtIHNheWluZyAiSSdtIG5vdAo+PiA+ID4gc28gc3Vy
ZSIuIDotKSBFLmcuLCB3cml0aW5nIGMuZWJyZWFrIG9uIGFuIDMyYiBpbnNuLiBDYW4geW91IHNh
eSB0aGF0Cj4+ID4gU29mdHdhcmUgbXVzdCBlbnN1cmUgd3JpdGUgYy5lYnJlYWsgb24gdGhlIGhl
YWQgb2YgYW4gMzJiIGluc24uCj4+ID4KPj4gPiBUaGF0IG1lYW5zIElGVSBvbmx5IHNlZToKPj4g
PiAgLSBjLmVicmVhayArIGJyb2tlbi9pbGxlZ2FsIGluc24uCj4+ID4gb3IKPj4gPiAgLSBvcmln
aW4gaW5zbgo+PiA+Cj4+ID4gRXZlbiBpbiB0aGUgd29yc3QgY2FzZSwgc3VjaCBhcyBJRlUgZmV0
Y2hlcyBpbnN0cnVjdGlvbnMgb25lIGJ5IG9uZToKPj4gPiBJZiB0aGUgSUZVIGdldHMgdGhlIG9y
aWdpbiBpbnNuLCBpdCB3aWxsIHNraXAgdGhlIGJyb2tlbi9pbGxlZ2FsIGluc24uCj4+ID4gSWYg
dGhlIElGVSBnZXRzIHRoZSBjLmVicmVhayArIGJyb2tlbi9pbGxlZ2FsIGluc24sIHRoZW4gYW4g
ZWJyZWFrCj4+ID4gZXhjZXB0aW9uIGlzIHJhaXNlZC4KPj4gPgo+PiA+IEJlY2F1c2UgYy5lYnJl
YWsgd291bGQgcmFpc2UgYW4gZXhjZXB0aW9uLCBJIGRvbid0IHNlZSBhbnkgcHJvYmxlbS4KPj4K
Pj4gVGhhdCdzIHRoZSBwcm9ibGVtLCB0aGlzIGRpc2N1c3Npb24gaXM6Cj4+Cj4+IFJldmlld2Vy
OiAiSSdtIG5vdCBzdXJlLCB0aGF0J3Mgbm90IHdyaXR0ZW4gaW4gb3VyIHNwZWMiCj4+IFN1Ym1p
dHRlcjogIkkgc2FpZCBpdCwgaXQncyBjYWxsZWQgLWFjY3VyYXRlIGF0b21pY2l0eS0iCj4gSSBy
ZWFsbHkgZG9uJ3Qgc2VlIGFueSBoYXJkd2FyZSB0aGF0IGNvdWxkIGJyZWFrIHRoZSBhdG9taWNp
dHkgb2YgdGhpcwo+IGMuZWJyZWFrIHNjZW5hcmlvOgo+ICAtIGMuZWJyZWFrIG9uIHRoZSBoZWFk
IG9mIDMyYiBpbnNuCj4gIC0gZWJyZWFrIG9uIGFuIGFsaWduZWQgMzJiIGluc24KPgo+IElmIElG
VSBmZXRjaGVzIHdpdGggY2FjaGVsaW5lLCBhbGwgaXMgYXRvbWljaXR5Lgo+IElmIElGVSBmZXRj
aGVzIHdpdGggMTZiaXQgb25lIGJ5IG9uZSwgdGhlIGZpcnN0IGMuZWJyZWFrIHdvdWxkIHJhaXNl
Cj4gYW4gZXhjZXB0aW9uIGFuZCBza2lwIHRoZSBuZXh0IGJyb2tlL2lsbGVnYWwgaW5zdHJ1Y3Rp
b24uCj4gRXZlbiBpZiBJRlUgZmV0Y2hlcyB3aXRob3V0IGFueSBzZXF1ZW5jZSwgdGhlIElEVSBt
dXN0IGRlY29kZSBvbmUgYnkKPiBvbmUsIHJpZ2h0PyBUaGUgZmlyc3QgaGFsZiBjLmVicmVhayB3
b3VsZCBwcm90ZWN0IGFuZCBwcmV2ZW50IHRoZSBuZXh0Cj4gYnJva2UvaWxsZWdhbCBpbnN0cnVj
dGlvbi4gU3BlY3VsYXRpdmUgZXhlY3V0aW9uIG9uIGJyb2tlL2lsbGVnYWwKPiBpbnN0cnVjdGlv
biB3b24ndCBjYXVzZSBhbnkgZXhjZXB0aW9ucy4KPgo+IEl0J3MgYSBjb21tb24gaXNzdWUsIG5v
dCBhIHNwZWNpZmljIElTQSBpc3N1ZS4KPiAzMmIgaW5zdHJ1Y3Rpb24gQSAtPiAxNmIgZWJyZWFr
ICsgMTZiIGJyb2tlbi9pbGxlZ2FsIC0+IDMyYgo+IGluc3RydWN0aW9uIEEuIEl0J3Mgc2FmZSB0
byB0cmFuc2Zvcm0uCgpXYWtpbmcgdXAgdGhpcyB0aHJlYWQgYWdhaW4sIG5vdyB0aGF0IENoYW5n
YmluIGhhcyBzaG93ZWQgc29tZSBpbnRlcmVzdApmcm9tIGFub3RoZXIgdGhyZWFkIFsxXS4KCkd1
bywgd2UgY2FuJ3QgcmVhbGx5IGFkZCB5b3VyIHBhdGNoZXMsIGFuZCBjbGFpbSB0aGF0IHRoZXkn
cmUgZ2VuZXJpYywKIndvcmtzIG9uIGFsbCIgUklTQy1WIHN5c3RlbXMuIFdoaWxlIGl0IG1pZ2h0
IHdvcmsgZm9yIHlvdXIgSS9EIGNvaGVyZW50CnN5c3RlbSwgdGhhdCBkb2VzIG5vdCBpbXBseSB0
aGF0IGl0J2xsIHdvcmsgb24gYWxsIHBsYXRmb3Jtcy4gUklTQy1WCmFsbG93cyBmb3IgaW1wbGVt
ZW50YXRpb25zIHRoYXQgYXJlIEkvRCBpbmNvaGVyZW50LCBhbmQgaGVyZSB5b3VyCklGVS1pbXBs
ZW1lbnRhdGlvbnMgYXJndW1lbnRzIGRvIG5vdCBob2xkLiBJJ2QgcmVhbGx5IHJlY29tbWVuZCB0
bwpyZWFkdXAgb24gWzJdLgoKTm93IGhvdyBjb3VsZCB3ZSBtb3ZlIG9uIHdpdGggeW91ciBwYXRj
aGVzPyBHZXQgaXQgaW4gYSBzcGVjLCBvciBmb2xkCnRoZSBwYXRjaGVzIGluIGFzIGEgS2NvbmZp
Zy5zb2NzLXRoaW5nIGZvciB0aGUgcGxhdGZvcm1zIHdoZXJlIHRoaXMgaXMKT0suIFdoYXQgYXJl
IHlvdSB0aG91Z2h0cyBvbiB0aGUgbGF0dGVyPwoKCkJqw7ZybgoKWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwMjE1MDM0NTMyLnhzNzI2bDdtcDZ4bG5rZGZATTkx
MHQvClsyXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24vYmxvYi9t
YXN0ZXIvaWQtY29uc2lzdGVuY3ktcHJvcG9zYWwucGRmCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
