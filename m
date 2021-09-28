Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB30C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 04:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB70610CC
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 04:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FB70610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnIMnSj7KUKdyHXTFG7nVoe2XMWndsrjAlU7COXNiRs=; b=XlgTTIIN+qzRVy
	49fYQ++P0BONUdG8g7p0inA5FJTjlVQXrTFSro82WGwUnM/8vMAAkbbyV+BKzvjn2b3M5VZi7heAa
	547upVP6mGiVeGU7Re/kByl6RwUhCEMrGlYTCRjjY4bK3DsIlRMt3VJ7ylP75MPWJ+ZTbEYA/ftHs
	0UQdXnx0QmOSdoMyWYaV4IZY+TsRRlSJlbl/Hl21HylWL5m/O9JIzO0HQEU2KFvNutC0lNPywJuxl
	yhVsz42r7kK/LTx7YLVMjqkuSJKx1MgSHt8EwoDDyAgss17HTSO4SCWbEGr9+4NGE0YGwYfsR/q49
	7cXJK4rbcxD/vKBxoO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV4hY-005XD3-JK; Tue, 28 Sep 2021 04:26:44 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV4hV-005XBz-Ef
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 04:26:43 +0000
Received: by mail-yb1-xb32.google.com with SMTP id z5so28909923ybj.2
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=noe4hEAkbPLyBzwsLG+b+9dUQ25Iugn4/xpnSPeZAuc=;
 b=ctUHytmLgvRhUr64u9ZUvPYMirmLeEo1ceE54uHVxga0Zp6hfDZbpNOZ4ZA8yG8XMb
 YTsiXQjRH0z+TyECxxbOC1j9RFukaCdUqocVlR9iid9GQFLLRnwAJh2fm1l8OmZgXX13
 0nqxEZAgpo7qOvaXxuECxOW2w2IGzdLEG/yPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=noe4hEAkbPLyBzwsLG+b+9dUQ25Iugn4/xpnSPeZAuc=;
 b=iAvhAXj0jWfTaadYonRwSi1IBOUgkV/0tIvft0MT/yKmOkFljJIVnQ0OIHAyKDcZty
 qS8n7KzvSCzBCZGZJBVfBbAh07wY18gc4W3BxHQHaW02EZwMR0ERCv7F5AOcqd7gHoY6
 b0VEDUy7+CFMVH+u2qDbQ47mMJfCUfsuemsfcYa4/52norNYrYCOV0jZGcioNrQkIIg9
 R56PLqdEKtWKs+0wWX1JiF9zp1F8w8BXWt35zwDfGk2mZSG9q///AZjS+s++PkP9KzHZ
 VLpCroZ+9qfjaIZ3Oyf82wzG45DLCDUjisYmXUSQJDJscycyt52fptiFnV+1zcVcTFxx
 49VQ==
X-Gm-Message-State: AOAM531QtYHciJUda4OyDXjJapmXgH0dUvSaci06Kui7XTuHSsr9R9vg
 avcfyXj4T6HQmy/uJ7mEThu8ky4rxkGfs4FmBbxD
X-Google-Smtp-Source: ABdhPJyJGMnHW02KO4TptssE4KBJfrgM81CuyWAoWSwb2Hm4Gq9MtUrqECYDOf2ICR3oGYkoyn14YeEGc75+Z/OeWis=
X-Received: by 2002:a5b:2d2:: with SMTP id h18mr4411546ybp.526.1632803200399; 
 Mon, 27 Sep 2021 21:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
 <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
In-Reply-To: <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 27 Sep 2021 21:26:29 -0700
Message-ID: <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Anup Patel <anup@brainfault.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_212641_564869_E0B1511F 
X-CRM114-Status: GOOD (  34.75  )
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

T24gTW9uLCBTZXAgMjcsIDIwMjEgYXQgODo1MCBQTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDI4LCAyMDIxIGF0IDY6MzIgQU0gTmljayBL
b3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4gPgo+ID4gzqPPhM65z4IgMjAy
MS0wOS0yNyAyMzoxMywgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+ID4gPj4gV2UgbmVlZCB0
byBkZWNpZGUgd2hldGhlciB3ZSBzaG91bGQgc3VwcG9ydCB0aGUgdXBzdHJlYW0ga2VybmVsIGZv
cgo+ID4gPj4gRDEuIEZldyB0aGluZ3MgdG8gY29uc2lkZXIuCj4gPiA+PiDigJMgQ2FuIGl0IGJl
IGNvbnNpZGVyZWQgYXMgYW4gZXJyYXRhID8KPiA+Cj4gPiBJdCdzIG9uZSB0aGluZyB0byBmb2xs
b3cgdGhlIHNwZWMgYW5kIGhhdmUgYW4gZXJyb3IgaW4gdGhlCj4gPiBpbXBsZW1lbnRhdGlvbiwg
YW5kIGFub3RoZXIgdG8gbm90IGZvbGxvdyB0aGUgc3BlYy4KPiA+Cj4gPiA+PiDigJMgRG9lcyBp
dCBzZXQgYSBiYWQgcHJlY2VkZW50IGFuZCBvcGVuIGNhbiBvZiB3b3JtcyBpbiBmdXR1cmUgPwo+
ID4KPiA+IElNSE8geWVzLCBJJ20gdGhpbmtpbmcgb2YgS2VuZHJ5dGUgMjEwIGRldnMgZm9yIGV4
YW1wbGUgY29taW5nIHVwIGFuZAo+ID4gYXNraW5nIGZvciBNTVUgc3VwcG9ydCwgdGhleSAndmUg
YWxzbyBzaGlwcGVkIG1hbnkgY2hpcHMgYWxyZWFkeS4gSSBjYW4KPiA+IGFsc28gaW1hZ2luZSBv
dGhlciB2ZW5kb3JzIGluIHRoZSBmdXR1cmUgY29taW5nIHVwIHdpdGggaW1wbGVtZW50YXRpb25z
Cj4gPiB0aGF0IHZpb2xhdGUgdGhlIHNwZWMgaW4gd2hpY2ggY2FzZSBoYW5kbGluZyB0aGUgc3Rh
bmRhcmQgc3R1ZmYgd2lsbAo+ID4gYmVjb21lIG1lc3N5IGFuZCBjb21wbGV4LCBhbmQgaHVydCBw
ZXJmb3JtYW5jZS9zZWN1cml0eS4gV2UnbGwgZW5kIHVwCj4gPiBmaWxsaW5nIHRoZSBjb2RlIHdp
dGggZXhjZXB0aW9ucyBhbmQgdHdlYWtzIGFsbCBvdmVyIHRoZSBwbGFjZS4gV2UgbmVlZAo+ID4g
dG8gYmUgc3RyaWN0IGFib3V0IHdoYXQgaXMgInJpc2N2IiBhbmQgd2hhdCdzICJkcmFmdCByaXNj
diIgb3IgInJpc2N2Cj4gPiBpbnNwaXJlZCIsIGFuZCB3aGF0IHdlIGFyZSB3aWxsaW5nIHRvIHN1
cHBvcnQgdXBzdHJlYW0uIEkgY2FuIHVuZGVyc3RhbmQKPiA+IHN1cHBvcnRpbmcgdmVuZG9yIGV4
dGVuc2lvbnMgdXBzdHJlYW0gYnV0IHRoZXkgbmVlZCB0byBmaXQgd2l0aGluIHRoZQo+ID4gc3Rh
bmRhcmQgc3BlYywgd2UgY2FuJ3QgaGF2ZSBmb3IgZXhhbXBsZSBleHRlbnNpb25zIHRoYXQgdXNl
IGVuY29kaW5nCj4gPiBzcGFjZS9jc3JzL2ZpZWxkcyBldGMgcmVzZXJ2ZWQgZm9yIHN0YW5kYXJk
IHVzZSwgdGhleSBtYXkgb25seSB1c2UKPiA+IHdoYXQncyByZXNlcnZlZCBmb3IgY3VzdG9tL3Zl
bmRvciB1c2UuIEF0IGxlYXN0IGxldCdzIGFncmVlIG9uIHRoYXQuCj4KPiBUb3RhbGx5IGFncmVl
IHdpdGggTmljayBoZXJlLiBJdCdzIGEgc2xpcHBlcnkgc2xvcGUuCj4KPiBJbmNsdWRpbmcgRDEg
UFRFIGJpdHMgKG9yIEtlbmRyeXRlIEsyMTAgTU1VKSBwYXJ0IG9mIHRoZSBMaW51eCBSSVNDLVYK
PiBtZWFucyBmdXR1cmUgaGFyZHdhcmUgd2hpY2ggaW50ZW50aW9uYWxseSB2aW9sYXRlcyBzcGVj
cyB3aWxsIGFsc28gaGF2ZSB0bwo+IGJlIG1lcmdlZCBhbmQgdGhlIFJJU0MtViBwYXRjaCBhY2Nl
cHRhbmNlIHBvbGljeSB3aWxsIGhhdmUgbm8gc2lnbmlmaWNhbmNlLgo+Cj4gPgo+ID4gPj4g4oCT
IENhbiB3ZSBqdXN0IGlnbm9yZSBEMSBnaXZlbiB0aGUgbWFzcyB2b2x1bWUgPwo+ID4gPj4KPiA+
Cj4gPiBJTUhPIG5vLCB3ZSBuZWVkIHRvIGZpbmQgYSB3YXkgdG8gc3VwcG9ydCBpdCB1cHN0cmVh
bSBidXQgSSBiZWxpZXZlCj4gPiB0aGVyZSBpcyBhbm90aGVyIHF1ZXN0aW9uIHRvIGFuc3dlcjoK
PiA+Cj4gPiBEbyB3ZSBhbHNvIGd1YXJhbnRlZSAib25lIGltYWdlIHRvIHJ1bGUgdGhlbSBhbGwi
IGFwcHJvYWNoLCByZXF1aXJlZCBieQo+ID4gYmluYXJ5IGRpc3Ryb3MsIGZvciBpbXBsZW1lbnRh
dGlvbnMgdGhhdCB2aW9sYXRlIHRoZSBzcGVjID8gQXJlIHdlIG9rCj4gPiBmb3IgZXhhbXBsZSB0
byBzdXBwb3J0IEFsbHdpbm5lciBEMSB1cHN0cmVhbSBidXQgcmVxdWlyZSBhIGN1c3RvbQo+ID4g
Y29uZmlndXJhdGlvbi9idWlsZCBpbnN0ZWFkIG9mIHN1cHBvcnRpbmcgaXQgd2l0aCB0aGUgImdl
bmVyaWMiIGltYWdlID8KPiA+IEluIG9uZSBjYXNlIHdlIG5lZWQgdG8gaGFuZGxlIHRoZSB2aW9s
YXRpb24gYXQgcnVudGltZSBhbmQgaW50cm9kdWNlCj4gPiBvdmVyaGVhZCBmb3IgZXZlcnlvbmUg
KGxpa2UgbG9va2luZyB1cCBfX3Jpc2N2X3N2cGJtdCBldmVyeSB0aW1lIHdlIHNldAo+ID4gYSBQ
VEUgaW4gdGhpcyBjYXNlKSwgaW4gdGhlIG90aGVyIGl0J3MgYW4gI2lmZGVmLgo+Cj4gQXQgbGVh
c3QsIHdlIHNob3VsZCBub3QgaGF2ZSBoYXJkd2FyZSB2aW9sYXRpbmcgc3BlY3MgYXMgcGFydCBv
ZiB0aGUKPiB1bmlmaWVkIGtlcm5lbCBpbWFnZSBpbnN0ZWFkIGhhdmUgdGhlc2UgaW50ZW50aW9u
YWwgZGV2aWF0aW9ucy92aW9sYXRpb25zCj4gdW5kZXIgc2VwYXJhdGUga2NvbmZpZyB3aGljaCB3
aWxsIG5vdCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMgbWVhbnMKPiB2ZW5kb3JzIChvZiBz
dWNoIGhhcmR3YXJlKSBhbmQgZGlzdHJvcyB3aWxsIGhhdmUgdG8gZXhwbGljaXRseSBlbmFibGUK
PiBzdXBwb3J0IGZvciBzdWNoIHZpb2xhdGlvbnMvZGV2aWF0aW9ucy4KPgoKSWYgd2UgbWVyZ2Ug
dGhlIGNvZGUgYW5kIGFyZSBub3QgZW5hYmxlZCBieSBkZWZhdWx0LCBpdCB3b3VsZCBiZSBhCm1h
aW50ZW5hbmNlIG5pZ2h0bWFyZSBpbiBmdXR1cmUuClRoZXNlIHBhcnQgb2YgdGhlIGtlcm5lbCB3
aWxsIG5vdCBiZSByZWd1bGFybHkgdGVzdGVkIGJ1dCB3ZSBoYXZlIHRvCmNhcnJ5IHRoZSBjaGFu
Z2VzIGZvciBhIGxvbmcgdGltZS4KU2ltaWxhciBjaGFuZ2VzIHdpbGwgb25seSBncm93IG92ZXIg
dGltZSBjYXVzaW5nIGEgbG90IG9mIGN1c3RvbQpjb25maWdzIHRoYXQgYXJlIG5vdCBlbmFibGVk
IGJ5IGRlZmF1bHQuCgpJTUhPLCBpZiB3ZSB3YW50IHRvIHN1cHBvcnQgdGhpcyBib2FyZCBpbiB1
cHN0cmVhbSwgd2Ugc2hvdWxkIGp1c3QKY2xlYXJseSBzdGF0ZSB0aGF0IGl0IGlzIG9uZSB0aW1l
IHNwZWNpYWwgZXhjZXB0aW9uCmZvciB0aGlzIGJvYXJkIG9ubHkgYmVjYXVzZSBvZiB0aGUgZm9s
bG93aW5nIHJlYXNvbnMKCjEuIFRoZSBib2FyZCBkZXNpZ24gcHJlZGF0ZXMgdGhlIHBhdGNoIGFj
Y2VwdGFuY2UgcG9saWN5LgoyLiBXZSBkb24ndCBoYXZlIGVub3VnaCBhZmZvcmRhYmxlIExpbnV4
IGNvbXBhdGlibGUgcGxhdGZvcm1zIHRvZGF5LgozLiBBbGxvd2luZyBydW5uaW5nIGFuIHVwc3Ry
ZWFtIGtlcm5lbCBvbiBEMSBoZWxwcyB0aGUgUklTQy1WIHNvZnR3YXJlCmVjb3N5c3RlbSB0byBn
cm93LgoKTm8gbW9yZSBleGNlcHRpb25zIHdpbGwgYmUgYWxsb3dlZCBpbiBmdXR1cmUgZm9yIHN1
Y2ggaGFyZHdhcmUgdGhhdAp2aW9sYXRlcyB0aGUgc3BlYy4gUGVyaW9kLgoKPiBSZWdhcmRzLAo+
IEFudXAKCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
