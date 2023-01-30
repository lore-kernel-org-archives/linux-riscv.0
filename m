Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E5C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF0WMXdDk7L53tulWyUMO7JSmfMQPOUjC3PWMNJboO0=; b=P+Km82BEO5YyxT
	tMRxx8Cb2jqRki/1RACGFQOR7Xn0i1s7IGky5if01ZU/xPRWsh4b9Zn7DNPTy/l5+r/kPJrBqqGDh
	jEgqOipySOdr2U+TZzH4UNzGXgw93FYjMtwKwM0Q2Yd4Ho5uYqB78hpB2ZnwGBjYv2Iqwk3FlOnwL
	0gjx5Ozwv2CALZVschq8FKTtLtDXaijV9jS2wbUw1PpwwxHLkA5ovgQU3J3/FixuWpcRnBlYe65hn
	dd0E/G+r+DXp6pbalwRbQyRKtB+FB2b3h9qIWe5ED5vC8Pe/QCeUog+Ns35CvIFEWewcsgbs6Qp7H
	wvE3Mfclv3Cs3hRlHpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTLx-003Vlc-R1; Mon, 30 Jan 2023 12:33:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTLu-003VkV-Dg
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:33:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0D48B8101B;
	Mon, 30 Jan 2023 11:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3242C4339C;
	Mon, 30 Jan 2023 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675079838;
	bh=Bf8wXn0zRLu9HdaSqycqpB534BIJARXYm1sFG+MUpXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GSLp284SjuIuW4XWjBOUObAOGJI2q7alFTxsGR7F9z+cZxgWOVcVsZWAGZiSWUvS+
	 J00I3RbWhRoEivjtITdrCSpYlnLyAEYWhGBHUPvy9oPAGiDe0eULAVVtFCVSqYLgTK
	 olij8y6dfEU8WLnVQImTPg3m8qjysNZdP25H5BUFuItQcNjGlxMD9WQhzpo/7pvUqS
	 aBOHUacSkQoEq0MCY4o+aYx1GE/QBgwGz4MScnZI4YN/N5nJSZm3n9K6tGzXMzpJBS
	 g5GvOxyDnqwQzJrGdMw/wyKgsgF1eM0HfD9CO/6rRCSCZvyJZoIB0ECCguPDfFAxnB
	 IwvyOitQLhmPg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, guoren@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, jrtc27@jrtc27.com,
 andy.chiu@sifive.com, zong.li@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Greentime
 Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH -next V3 1/2] riscv: jump_label: Fixup unaligned
 arch_static_branch function
In-Reply-To: <20230126170607.1489141-2-guoren@kernel.org>
References: <20230126170607.1489141-1-guoren@kernel.org>
 <20230126170607.1489141-2-guoren@kernel.org>
Date: Mon, 30 Jan 2023 12:57:15 +0100
Message-ID: <87357sjkv8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_043338_621876_F32530B0 
X-CRM114-Status: GOOD (  17.99  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBBbmR5IENoaXUgPGFuZHkuY2hpdUBz
aWZpdmUuY29tPgo+Cj4gUnVudGltZSBjb2RlIHBhdGNoaW5nIG11c3QgYmUgZG9uZSBhdCBhIG5h
dHVyYWxseSBhbGlnbmVkIGFkZHJlc3MsIG9yIHdlCj4gbWF5IGV4ZWN1dGUgb24gYSBwYXJ0aWFs
IGluc3RydWN0aW9uLgo+Cj4gV2UgaGF2ZSBlbmNvdW50ZXJlZCBwcm9ibGVtcyB0cmFjZWQgYmFj
ayB0byBzdGF0aWMganVtcCBmdW5jdGlvbnMgZHVyaW5nCj4gdGhlIHRlc3QuIFdlIHN3aXRjaGVk
IHRoZSB0cmFjZXIgcmFuZG9tbHkgZm9yIGV2ZXJ5IDF+NSBzZWNvbmRzIG9uIGEKPiBkdWFsLWNv
cmUgUUVNVSBzZXR1cCBhbmQgZm91bmQgdGhlIGtlcm5lbCBzdWNraW5nIGF0IGEgc3RhdGljIGJy
YW5jaAo+IHdoZXJlIGl0IGp1bXBzIHRvIGl0c2VsZi4KPgo+IFRoZSByZWFzb24gaXMgdGhhdCB0
aGUgc3RhdGljIGJyYW5jaCB3YXMgMi1ieXRlIGJ1dCBub3QgNC1ieXRlIGFsaWduZWQuCj4gVGhl
biwgdGhlIGtlcm5lbCB3b3VsZCBwYXRjaCB0aGUgaW5zdHJ1Y3Rpb24sIGVpdGhlciBKIG9yIE5P
UCwgd2l0aCB0d28KPiBoYWxmLXdvcmQgc3RvcmVzIGlmIHRoZSBtYWNoaW5lIGRvZXMgbm90IGhh
dmUgZWZmaWNpZW50IHVuYWxpZ25lZAo+IGFjY2Vzc2VzLiBUaHVzLCBtb21lbnRzIGV4aXN0IHdo
ZXJlIGhhbGYgb2YgdGhlIE5PUCBtaXhlcyB3aXRoIHRoZSBvdGhlcgo+IGhhbGYgb2YgdGhlIEog
d2hlbiB0cmFuc2l0aW9uaW5nIHRoZSBicmFuY2guIEluIG91ciBwYXJ0aWN1bGFyIGNhc2UsIG9u
Cj4gYSBsaXR0bGUtZW5kaWFuIG1hY2hpbmUsIHRoZSB1cHBlciBoYWxmIG9mIHRoZSBOT1Agd2Fz
IG1peGVkIHdpdGggdGhlCj4gbG93ZXIgcGFydCBvZiB0aGUgSiB3aGVuIGVuYWJsaW5nIHRoZSBi
cmFuY2gsIHJlc3VsdGluZyBpbiBhIGp1bXAgdGhhdAo+IGp1bXBlZCB0byBpdHNlbGYuIENvbnZl
cnNlbHksIGl0IHdvdWxkIHJlc3VsdCBpbiBhIEhJTlQgaW5zdHJ1Y3Rpb24gd2hlbgo+IGRpc2Fi
bGluZyB0aGUgYnJhbmNoLCBidXQgaXQgbWlnaHQgbm90IGJlIG9ic2VydmFibGUuCj4KPiBBUk02
NCBkb2VzIG5vdCBoYXZlIHRoaXMgcHJvYmxlbSBzaW5jZSBhbGwgaW5zdHJ1Y3Rpb25zIG11c3Qg
YmUgNC1ieXRlCj4gYWxpZ25lZC4KClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgoKTmljZSBjYXRjaCEgQW5kIEkgZ3Vlc3MgdGhpcyBpcyBhbiBpc3N1ZSBmb3Ig
a3Byb2JlcyBhcyB3ZWxsLCBubz8KSS5lLiBpbiBnZW5lcmFsIHJlcGxhY2luZyAzMmIgaW5zbnMg
d2l0aCBhbiBlYnJlYWsuIFRoaXMgaXMgb25seSB2YWxpZApmb3IgbmF0dXJhbCBhbGlnbmVkIDMy
YiBpbnNucz8KCkBHdW8gSSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIGRvaW5nIGEgc2VyaWVzIGZv
ciB0aGlzLCBhbmQgYXNraW5nIHRoZQptYWludGFpbmVycyB0byAicGljayB0aGlzIHBhdGNoIHRv
IHN0YWJsZSwgYW5kIHRoZSBvdGhlciBmb3IKbmV4dCIuIElzbid0IHRoYXQganVzdCBtb3JlIHdv
cmsgZm9yIHRoZSBtYWludGFpbmVycy9yZXZpZXdlcnM/CgoKQmrDtnJuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
