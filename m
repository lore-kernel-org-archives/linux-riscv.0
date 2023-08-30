Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799AEC83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ClNj4Vke0YbUAjEi2JhnjY0U1RhcfgRuLLhPf8TLRQ=; b=XG272WRcApxVfC
	eTnqF3oOZan/sUxE/PZQO4Ax/fnfQVKe97n3X53k3PURchiFWReNyU/4xPIioEG7Q+5pXYDQ8XU3m
	59Xcfb/FX8QxO7sRSsHIUIBm1p2cNL5mMBE2fN6odjy6vy0UtRcijZ52Ouzpko5A4cudi81x83OPZ
	Upy4hIvhRgJ9OqLSeydIRzThGt1DA0RWFZoZ6BDshSAyQmGNdYYHl8Y8MWVF0tMUtQhOLvdoG86ma
	czMgSOYzDeHVYDcnPXhXS6HIUu8mKYTTRP4cr8n1eiRHv4wdaHh5/9qJeMVpRNlEo0r+g9vWnMr74
	KqtY2XxW8AgML+og3wtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFh3-00D0eP-0x;
	Wed, 30 Aug 2023 07:32:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFh0-00D0cz-1b
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 07:32:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF649624FD;
	Wed, 30 Aug 2023 07:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E721AC433C8;
	Wed, 30 Aug 2023 07:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693380765;
	bh=MNdLlpmsuMBurHZF+Un6RDif17HZyEPH4RFqN/Wu58Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LwJNGWglZNtVFL2hiU39ixbHdn+xn2No5KphPWRiGWMEBIoD2qOS7xcuKx7GjLg6G
	 7Vus2xgqpIZBTufZVy0QR2ybkcIbWFYmURDGmyhkfI8+3grx3/MEG5w8Dr1Kc/kNC3
	 MEdVP7R79J/zvQjSbe0HQGmUsJDfPlK7tYMA+Xvdi1wEWUs6Y+9TWkRaCYtC+apjaT
	 QiwTODnJpEHyFoEkD0Ch/1KNXKRiDVJg6AJELI2fAc8m8f8urYCOt7HlnWC2F/ifJO
	 L9pjpvllQkwGVu1nJIK/pYMuvkugrFtJ1MsNY/RBIxmbjzEOnjcUH/VLblKnYuEtcF
	 zZGxruNXunOiA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
In-Reply-To: <ZO4+/P9B29Bpb0Yz@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
 <ZOyhozSq3S36eRSq@nam-dell> <ZOymDqhE9STgx4Mm@nam-dell>
 <87edjmz864.fsf@all.your.base.are.belong.to.us>
 <ZO4+/P9B29Bpb0Yz@nam-dell>
Date: Wed, 30 Aug 2023 09:32:42 +0200
Message-ID: <87il8xm1d1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_003246_613878_EDB407C4 
X-CRM114-Status: GOOD (  25.76  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gVHVlLCBBdWcgMjksIDIw
MjMgYXQgMDg6MTQ6NTlBTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gTmFtIENhbyA8
bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKPj4gCj4+ID4gT24gTW9uLCBBdWcgMjgsIDIwMjMg
YXQgMDM6MzE6MTVQTSArMDIwMCwgTmFtIENhbyB3cm90ZToKPj4gPj4gT24gTW9uLCBBdWcgMjgs
IDIwMjMgYXQgMDI6NDg6MDZQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gPj4gPiBO
YW0gQ2FvIDxuYW1jYW92QGdtYWlsLmNvbT4gd3JpdGVzOgo+PiA+PiA+IAo+PiA+PiA+ID4gdXBy
b2JlcyBleHBlY3RzIGlzX3RyYXBfaW5zbigpIHRvIHJldHVybiB0cnVlIGZvciBhbnkgdHJhcCBp
bnN0cnVjdGlvbnMsCj4+ID4+ID4gPiBub3QganVzdCB0aGUgb25lIHVzZWQgZm9yIGluc3RhbGxp
bmcgdXByb2JlLiBUaGUgY3VycmVudCBkZWZhdWx0Cj4+ID4+ID4gPiBpbXBsZW1lbnRhdGlvbiBv
bmx5IHJldHVybnMgdHJ1ZSBmb3IgMTYtYml0IGMuZWJyZWFrIGlmIEMgZXh0ZW5zaW9uIGlzCj4+
ID4+ID4gPiBlbmFibGVkLiBUaGlzIGNhbiBjb25mdXNlIHVwcm9iZXMgaWYgYSAzMi1iaXQgZWJy
ZWFrIGdlbmVyYXRlcyBhIHRyYXAKPj4gPj4gPiA+IGV4Y2VwdGlvbiBmcm9tIHVzZXJzcGFjZTog
dXByb2JlcyBhc2tzIGlzX3RyYXBfaW5zbigpIHdobyBzYXlzIHRoZXJlIGlzIG5vCj4+ID4+ID4g
PiB0cmFwLCBzbyB1cHJvYmVzIGFzc3VtZSBhIHByb2JlIHdhcyB0aGVyZSBiZWZvcmUgYnV0IGhh
cyBiZWVuIHJlbW92ZWQsIGFuZAo+PiA+PiA+ID4gcmV0dXJuIHRvIHRoZSB0cmFwIGluc3RydWN0
aW9uLiBUaGlzIGNhdXNlIGFuIGluZmluaXRlIGxvb3Agb2YgZW50ZXJpbmcKPj4gPj4gPiA+IGFu
ZCBleGl0aW5nIHRyYXAgaGFuZGxlci4KPj4gPj4gPiA+Cj4+ID4+ID4gPiBJbnN0ZWFkIG9mIHVz
aW5nIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uLCBpbXBsZW1lbnQgdGhpcyBmdW5jdGlvbgo+
PiA+PiA+ID4gc3BlZmljaWFsbHkgZm9yIHJpc2N2IHdoaWNoIGNoZWNrcyBmb3IgYm90aCBlYnJl
YWsgYW5kIGMuZWJyZWFrLgo+PiA+PiA+IAo+PiA+PiA+IEkgdG9vayB0aGlzIGZvciBhIHNwaW4s
IGFuZCBpdCBpbmRlZWQgZml4ZXMgdGhpcyBuZXcgaGFuZyEgTmljZSEKPj4gPj4gCj4+ID4+IEdy
ZWF0ISBUaGFua3MgZm9yIHRlc3RpbmcgaXQuCj4+ID4+ICAKPj4gPj4gPiBIb3dldmVyLCB3aGVu
IEkgdHJpZWQgc2V0dGluZyBhbiB1cHJvYmUgb24gdGhlIGVicmVhayBpbnN0cnVjdGlvbgo+PiA+
PiA+IChvZmZzZXQgMHgxMTgpIGZyb20geW91ciBleGFtcGxlIFsxXSwgdGhlIHByb2JlIGRvZXMg
bm90IHNob3cgdXAgaW4gdGhlCj4+ID4+ID4gdHJhY2UgYnVmZmVyLgo+PiA+PiA+IAo+PiA+PiA+
IEFueSBpZGVhcz8KPj4gPj4gCj4+ID4+ID5Gcm9tIG15IHVuZGVyc3RhbmRpbmcsIGJvdGggdXBy
b2JlcyBhbmQga3Byb2JlcyByZWZ1c2UgdG8gaW5zdGFsbCBicmVhayBwb2ludHMKPj4gPj4gaW50
byBleGlzdGluZyB0cmFwIGluc3RydWN0aW9ucy4gT3RoZXJ3aXNlLCB3ZSBtYXkgY29uZmxpY3Qg
d2l0aCBzb21ldGhpbmcgZWxzZQo+PiA+PiB0aGF0IGlzIGFsc28gdXNpbmcgdHJhcCBpbnN0cnVj
dGlvbnMuCj4+ID4KPj4gPiBJIGp1c3QgcmVhbGl6ZSB5b3UgcHJvYmFibHkgYXNrIHRoaXMgYmVj
YXVzZSB1cHJvYmUgY2FuIHN0aWxsIGJlIGluc3RhbGxlZCBiZWZvcmUKPj4gPiBhcHBseWluZyB0
aGUgcGF0Y2guIEJ1dCBJIHRoaW5rIHRoYXQgaXMgYW5vdGhlciBidWcgdGhhdCBteSBwYXRjaCBh
bHNvCj4+ID4gYWNjaWRlbnRhbGx5IGZpeDogdXByb2JlcyBzaG91bGQgbm90IGluc3RhbGwgYnJl
YWtwb2ludCBpbnRvIGVicmVhayBpbnN0cnVjdGlvbnMsCj4+ID4gYnV0IGl0IGluY29ycmVjdGx5
IGRvZXMgc28gYmVjYXVzZSBpdCBkb2VzIG5vdCBldmVuIGtub3cgYWJvdXQgdGhlIGV4aXN0ZW5j
ZSBvZgo+PiA+IDMyLWJpdCBlYnJlYWsuCj4+IAo+PiBGV0lXLCBJIGNhbiBzdGlsbCBpbnN0YWxs
IHRoZSB1cHJvYmUgYXQgYW4gZWJyZWFrIHdpdGggeW91IHBhdGNoLiBJdCdzCj4+IG5vdCBoaXQs
IGJ1dCBzdWNjZWVkcyB0byBpbnN0YWxsLgo+Cj4gSXQgc2VlbXMgdXByb2JlcyBpbnN0YWxsIGZh
aWx1cmVzIGFyZSBjb21wbGV0ZWx5IHNpbGVudCAoc2VlIHVwcm9iZV9tbWFwKCkgaW4KPiBrZXJu
ZWwvZXZlbnRzL3Vwcm9iZXMuYykuIFNvIEkgdGhpbmsgYWx0aG91Z2ggdXByb2JlcyBpbnN0YWxs
IHNlZW1zIGZpbmUsIGl0Cj4gYWN0dWFsbHkgaXMgbm90LgoKSHVoLCBzbyB0aGVyZSdzIG5vIGNo
ZWNrIGlmIHRoZSBpbnN0cnVjdGlvbiBpcyBhIHZhbGlkIG9uZSBhdCBldmVudApyZWdpc3RlciBw
b2ludD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
