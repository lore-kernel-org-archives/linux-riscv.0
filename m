Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593A2C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D9A5611C0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D9A5611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tCErE2puWBkNdJyw9X0IEeF9P8TNi76K8GuiwihkPI=; b=Mak8rFEjK/s9If
	Xx174ZAMqaRkxZ7hAQoArjvztnPWIN1y6dlVGSWB/JeE/tnloAJoA+m5Rub+VwSFJr9aBQ1hCEDD5
	ZGwg0b4TE8QIJJBAU4sDIHVDcOfwx3QhJYOoXdnZHcsoXAhVewKRwU1+CTVGl7+jLpExotPmRxxsb
	MYulNa/MN7jVA68qf52yvYbPjD0UKZCy1gesoP/4uBCqwujAd9dxFMfpLvhsR7QCyfh8s4v/aNkog
	qiXmeTMv9tu69xxTsovrf6xDIpDrvWxdCyHHPgH3iHUU/bK9SbiulSJxJuXbgPJBhZW8Ld9/5VlTQ
	cI9rrQsxz+4s304HjYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHRn-003WON-Nu; Tue, 15 Jun 2021 22:22:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltF92-002bgC-GA; Tue, 15 Jun 2021 19:54:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00C79613B6;
 Tue, 15 Jun 2021 19:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623786884;
 bh=W1xnnWvWsJfJPutiRyGO1n1B7NplEf1u/yklRr5NuJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FgFM5z/YVrym2+ybVw2j7+G7rVK6F3z5ixkmNOqF3/3eC+PCHhGuVWGd6EOSLEAWb
 nEbd/+pGd7OWOpXzBPDatp7+bI74enZPNjDvZm6aNCiyWFXl6WoTsP4QUPMyN/UlJc
 6HOYnMH3Ls6N5VsYh6/FndJ3hQ1zDHT2ty0EDeHmw2B8ZqEaanwD75Jig86CzTSint
 pjM8wNp900v8f8+Vp7FRu/kUWG6Dg0RhQsDskZcpQQeNgwa5s0uB1ekGUMBUtamuDY
 GiQW7YnJeAcZsWnZlmbC+bxDdYMqeZDLpQhxQzpaFF1Y1xf2RDTYA1QD3apfyPUSeo
 wtOSGfseFiJkg==
Received: by mail-ej1-f49.google.com with SMTP id nd37so16736427ejc.3;
 Tue, 15 Jun 2021 12:54:43 -0700 (PDT)
X-Gm-Message-State: AOAM531XDqo+Dph0rpvMydMdNYpNg/+lz3nVr3qPb/n5Tda7NHuBSe2a
 g9jnf3ZRwbC9awdewwSn92Md1wFxqGq7aI6zNg==
X-Google-Smtp-Source: ABdhPJws6EJc3AHI9SCrC49CmDB2SKmyNaBg1CnISwWPlKJmd/mj1fUa/9RW04SrT9zPSts7jNSN1kgXP2Sdl9DBSy8=
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr1314651ejx.341.1623786882557; 
 Tue, 15 Jun 2021 12:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623780059.git.geert+renesas@glider.be>
 <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
 <abadee118c1945c44d9bff7675b12ec4@mailhost.ics.forth.gr>
In-Reply-To: <abadee118c1945c44d9bff7675b12ec4@mailhost.ics.forth.gr>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Jun 2021 13:54:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLU7GWDxdnR2-Yd2vbj7w=5pNr_fFocDQgPbs17EpBG0g@mail.gmail.com>
Message-ID: <CAL_JsqLU7GWDxdnR2-Yd2vbj7w=5pNr_fFocDQgPbs17EpBG0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125444_628610_84337FAD 
X-CRM114-Status: GOOD (  19.84  )
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

T24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMTI6NDAgUE0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGlj
cy5mb3J0aC5ncj4gd3JvdGU6Cj4KPiDOo8+EzrnPgiAyMDIxLTA2LTE1IDIxOjE3LCBHZWVydCBV
eXR0ZXJob2V2ZW4gzq3Os8+BzrHPiM61Ogo+ID4gUklTQy1WIHVzZXMgcGxhdGZvcm0tc3BlY2lm
aWMgY29kZSB0byBsb2NhdGUgdGhlIGVsZiBjb3JlIGhlYWRlciBpbgo+ID4gbWVtb3J5LiAgSG93
ZXZlciwgdGhpcyBkb2VzIG5vdCBjb25mb3JtIHRvIHRoZSBzdGFuZGFyZAo+ID4gImxpbnV4LGVs
ZmNvcmVoZHIiIERUIGJpbmRpbmdzLCBhcyBpdCByZWxpZXMgb24gYSByZXNlcnZlZCBtZW1vcnkg
bm9kZQo+ID4gd2l0aCB0aGUgImxpbnV4LGVsZmNvcmVoZHIiIGNvbXBhdGlibGUgdmFsdWUsIGlu
c3RlYWQgb2Ygb24gYQo+ID4gImxpbnV4LGVsZmNvcmVoZHIiIHByb3BlcnR5IHVuZGVyIHRoZSAi
L2Nob3NlbiIgbm9kZS4KPiA+Cj4gPiBUaGUgbm9uLWNvbXBsaWFudCBjb2RlIGNhbiBqdXN0IGJl
IHJlbW92ZWQsIGFzIHRoZSBzdGFuZGFyZCBiZWhhdmlvciBpcwo+ID4gYWxyZWFkeSBpbXBsZW1l
bnRlZCBieSBwbGF0Zm9ybS1hZ25vc3RpYyBoYW5kbGluZyBpbiB0aGUgRkRUIGNvcmUgY29kZS4K
PiA+Cj4gPiBGaXhlczogNTY0MDk3NTAwM2QwMjM0ZCAoIlJJU0MtVjogQWRkIGNyYXNoIGtlcm5l
bCBzdXBwb3J0IikKPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+Cj4KPiBOQUNLCj4KPiBUaGVyZSBpcyBub3RoaW5nIHN0YW5kYXJk
IGFib3V0ICJsaW51eCxlbGZjb3JlaGRyIiwgaXQncyBhbgoKSXQgaXMgYW5kIGl0IGlzIGRvY3Vt
ZW50ZWQgd2hpY2ggaXMgbW9yZSB0aGFuIHdlIGNhbiBzYXkgZm9yCiJsaW51eCxlbGZjb3JlaGRy
IiBhcyBhIG5vZGUuCgo+IGFybTY0LXNwZWNpZmljIHByb3BlcnR5IG9uIC9jaG9zZW4gYW5kIGl0
J3Mgc3Vib3B0aW1hbCwgaXQgZ2V0cyB0aGUKPiBhZGRyL2xlbmd0aCBvZiBFTEYgY29yZSBvZiB0
aGUgcHJldmlvdXMga2VybmVsIHRocm91Z2ggdGhhdCBwcm9wZXJ0eSBhbmQKPiB0aGVuIGdvZXMg
b24gdG8gcmVzZXJ2ZSB0aGF0IHJlZ2lvbiBhdDoKPiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NS4xMy1yYzYvc291cmNlL2FyY2gvYXJtNjQvbW0vaW5pdC5jI0wxNTUKPgo+IFdo
eSBvbiBlYXJ0aCBpcyB0aGlzIGNsZWFuZXIgdGhhbiBqdXN0IGRlZmluaW5nIGEgcmVzZXJ2ZWQt
cmVnaW9uIGluIHRoZQo+IGZpcnN0IHBsYWNlIChhIHN0YW5kYXJkIGJpbmRpbmcpIHdpdGggYW5k
IGhvb2sgdXAgYSBjYWxsYmFjayB3aXRoCj4gUkVTRVJWRURNRU1fT0ZfREVDTEFSRSBmb3IgaXQg
dG8gYWxzbyBpbml0aWFsaXplIGVsZmNvcmVoZHJfYWRkci9zaXplID8KPiBJZiB5b3UgZG9uJ3Qg
bGlrZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgSSdtIG9rIHRvIGNoYW5nZSBpdCwgYnV0IHRoaXMK
PiBwYXRjaCBicmVha3Mga2R1bXAgb24gcmlzY3Ygc2luY2UgdGhhdCByZWdpb24gd29uJ3QgYmUg
cmVzZXJ2ZWQgYW55IG1vcmUKPiBhbmQga2VybmVsIHdpbGwgY29ycnVwdCBpdC4KCkkgbWlnaHQg
YWdyZWUgaWYgd2Ugd2VyZSBkZXNpZ25pbmcgdGhpcyBhbGwgZnJvbSBzY3JhdGNoLCBidXQgd2Un
cmUKbm90LiBXZSd2ZSBnb3QgcG93ZXJwYyBkb2luZyAvbWVtcmVzZXJ2ZS8gKyBrZXJuZWwgY21k
bGluZSwgYXJtNjQKdXNpbmcgY2hvc2VuLCBhbmQgUmlzY1YgYSAzcmQgd2F5LgoKV2hhdCBoYXBw
ZW5zIHdoZW4vaWYgUmlzY1Ygd2FudHMgdG8gYWRkIGFuIElNQSBidWZmZXI/IFRoYXQncyBubwpk
aWZmZXJlbnQgdGhhbiB0aGlzIGNhc2UuIFRoZSAyIGFyY2hpdGVjdHVyZXMgc3VwcG9ydGluZyBp
dCBib3RoIHVzZQovY2hvc2VuLiBTcGVjaWZ5aW5nIGFuIGluaXRyZCBpcyBubyBkaWZmZXJlbnQg
ZWl0aGVyLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
