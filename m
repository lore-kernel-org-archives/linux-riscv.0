Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B96C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 06:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H84Y9sgR4Xd8lyZdkIdbZyMxgneYss+EhqDBizg62hQ=; b=OTb8GpBCQxcWJ3
	19crFFTFVcyTpo6C6KOAeop00O1ap0UuR8PMqmJC4PFWogGcwS/LMmWUSgPFcb10r7A5IEbE9yLM5
	gdtfQCIulerwm56nXdMgvisaz5eGL2HjZ+qRDM1B48i/kkAgziGbtlPPq8UQ6tenzlLfFGkAD0xh9
	827UunOWaNbgu6DigUchUzIVO6XX4eJ6piqGFiDrtZJuOuqUAlGiI8diiOJcbKS/I6Fche9UwKcOr
	Ht8i+eC0fqZSTpOB7KLL5xEg6WoTJl7y1SBBKEVIcyXreN1BGHDgqtUtBtpbA4fQSOsuvwatRkhDb
	Fi1Jz+xCQ5KuvmXhvc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQek-00GEcV-2W;
	Mon, 14 Aug 2023 06:02:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQeh-00GEbZ-1H
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 06:02:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEE9762931;
	Mon, 14 Aug 2023 06:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDBEC433C7;
	Mon, 14 Aug 2023 06:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691992938;
	bh=bWQE+knkPDexsk5CayFor2pwXRX42J9XJ9j+G5K22WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLDhfybewPP9yvESjtahMyDlG8PZfkIu0PjSuqnTZD4i8lVnuIthwCoAdcrXExjNc
	 ifbQOR0LYE5+tlb+Ds2kXgnKIeEAQqhnBrLU3Yhe1o1ry9Dw7Lu6vnyhXO94sME2rN
	 dN7W7/A2TqJT4TZLhhqjp9v+1DkbNbRHvmmaW3sg=
Date: Mon, 14 Aug 2023 08:02:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: zong.li@sifive.com, jirislaby@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/1] Add Sifive uart suspend and resume
Message-ID: <2023081432-level-prelaw-3794@gregkh>
References: <20230809135042.2443350-1-nick.hu@sifive.com>
 <2023081143-flannels-verbally-9d0f@gregkh>
 <CAKddAkA9TZs2vVCzBWtfgo3gYJsrMMmsDMtA22iEMM3ok9TgPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKddAkA9TZs2vVCzBWtfgo3gYJsrMMmsDMtA22iEMM3ok9TgPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_230219_512141_2E7C04BF 
X-CRM114-Status: GOOD (  17.70  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMDE6NTU6NThQTSArMDgwMCwgTmljayBIdSB3cm90ZToK
PiBIaSBHcmVnCj4gCj4gT24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgMzoxMeKAr0FNIEdyZWcgS0gg
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEF1ZyAw
OSwgMjAyMyBhdCAwOTo1MDo0MVBNICswODAwLCBOaWNrIEh1IHdyb3RlOgo+ID4gPiBBZGQgU2lm
aXZlIHVhcnQgc3VzcGVuZCBhbmQgcmVzdW1lIGZ1bmN0aW9ucyBmb3Igc3lzdGVtIHN1c3BlbmQu
Cj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+IC0gQ2hhbmdlIFNpZ25lZC1vZmYtYnk6
IEJlbiBEb29rcyB0byBSZXZpZXdlZC1ieTogQmVuIERvb2tzCj4gPiA+IC0gUmVtb3ZlIHRoZSB1
bm5lY2Vzc2FyeSBjaGVjawo+ID4gPgo+ID4gPiBOaWNrIEh1ICgxKToKPiA+ID4gICBzZXJpYWw6
IHNpZml2ZTogQWRkIHN1c3BlbmQgYW5kIHJlc3VtZSBvcGVyYXRpb25zCj4gPiA+Cj4gPiA+ICBk
cml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIu
MzQuMQo+ID4gPgo+ID4KPiA+IERvZXMgbm90IGFwcGx5IHRvIG15IHRyZWUgOigKPiBJcyB0aGVy
ZSBhbnkgcmVhc29uIHRoYXQgaXQgZG9lc24ndCBhcHBseSB0byB5b3VyIHRyZWU/Cj4gV2hpY2gg
dHJlZSBzaG91bGQgSSBnbz8KCldoaWNoIHRyZWUgZGlkIHlvdSBtYWtlIGl0IGFnYWluc3Q/ICBJ
dCBkb2Vzbid0IGFwcGx5IGR1ZSB0byBjb25mbGljdHMuClBlcmhhcHMgZWl0aGVyIHJlZ2VuZXJh
dGUgaXQgYWdhaW5zdCB0aGUgdHR5LW5leHQgYnJhbmNoIG9mIHRoZSB0dHkuZ2l0CnRyZWUsIG9y
IGxpbnV4LW5leHQ/Cgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
