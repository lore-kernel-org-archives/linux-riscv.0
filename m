Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A0C54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0MQxcbrXBYMYEMJ4HLPr/cJFD8RX+eWBygTFSe9mvg=; b=oy3vapaEw+X9uB
	dULZC3NvIQLmP1B7rQssAakyMP8cRvGLDsE6jl1/tkvDtssb/IAqpvEl+lg7pS66vng26/Zv0AzRS
	5mFVM6J3sjypLvzO4p843y5e1v9WtfECGchKVPeDvWLkDabvvG45jj9Sost7wul7gqu7YFlVyvWv3
	sZLvG+AYHm1/clzyHGbYwNIMzwsMbi88tVkbHMq9b73sGwppy/5sT89jIS9LqovUfY8Tg9L2X4mAV
	gS+99FR6MScl5qUbX3CQvwwhYztA3/mbxbEqoooMZSFJQJqwDl3yIivcFqkReOICQf5UP4U5CX0Ic
	NOF+FMTNxxhBObXOacyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqan-0000000EI15-2FHp;
	Thu, 28 Mar 2024 14:18:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqaS-0000000EHxU-2Sgr
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 14:18:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6eac64f2205so902042b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711635514; x=1712240314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqbRQqW0auM8yPwFJcSxCTI/1OyWyhS5S2oHIbdG6Uc=;
        b=P6gXjk6bsTQoQpyo4BOmVL42QAQiusR1xN6wO1tKrsobcSkk+4M0veIzUVdDQQtzEE
         qxQsItIGHhQXOPscMNEEAO84fuSg0UCZ7owUzx+IoXV+VCVHozW+W7TZDhl5cPbtAOJg
         5zIOLBZMM2oQyK4XtJuzJA1+wLUO7a0MDj8NiDhg4TPxp9nKjxZLuxHhQPWDQH5baTt/
         G3Z6SvD3TEt67HV+tHw7Yys+c/oe0NwU7jQBywDqPu+qL6DoO1iPOdJAcOoePMEPrvyv
         JKVyk3iIoOZuM+2kUOBQJo48EcMA7qPmRXlw92L/UlYnAcdxMMQnbSC53ZCBNVJoh7k/
         lmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635514; x=1712240314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqbRQqW0auM8yPwFJcSxCTI/1OyWyhS5S2oHIbdG6Uc=;
        b=YslRemSA9xSLfzcn1ERW7gF5ElAqzS0YPlppMH/JVu9BbEgCsW8XDfhwio8nJqwubF
         Xryz4bxsZy9WM2hRZkYly1Tn5p4aAHCZKAmzro7VAg0oCKKjUcW2VFiKjKKCtIknPqel
         pdcWh85uj4MrJRJOHZS7I6/z1aipB3vYJiu6EvzmHZAJMokmW+4sT21/EAzNeZVnxyym
         53/qIvZyxWzp7E6mvFo8XRL3KxKIzFvrAw9ZXgYwPfZXrwPKQ3WwACRPFOemUbHhV3yh
         YL8OYD+r/nVKo07bSuIOG+iwXpPDUfuCaEUUfCWa/cIxjc0D8cAZAIzpdfixioPEC+z8
         g8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7KjFeYU+AwcTkNKeHYCHinHWArbQbyvOXuueHLNtc/shaLUtPKa+cdidnqMiY7Ba6uL6hOYFEgOImSqW6A6ZL3BFeCz882mNGWFvA06/7
X-Gm-Message-State: AOJu0Yz09nLOVmjQo0RFDP2XkVtUSFa+jp9WqOMOrG75ozgiYJMxqotF
	YkdkJ6xxeRfbhTSIh9i0fIsEyUphuMSnN0NtMcp9JZhn3o74hp939RmnqnFNp1v0Xy4hj08++bZ
	5dRGb5FIwICW4ayF+JpCJzzcfaffrnIe0dA2SRg==
X-Google-Smtp-Source: AGHT+IECNRXB/xpyWGPViS4bOavtZoe3t64KsRpvmvbiSa3NftMcTTx/WyhY4Yiz0ZvGzMPEWuXdtCgC6OPQJUcVzRQ=
X-Received: by 2002:a05:6a21:3409:b0:1a5:6b2f:7b91 with SMTP id
 yn9-20020a056a21340900b001a56b2f7b91mr2170822pzb.21.1711635514320; Thu, 28
 Mar 2024 07:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
 <20240327103130.3651950-3-christoph.muellner@vrull.eu> <20240327-imperfect-washbowl-d95e57cef0ef@spud>
 <20240327-77a6b64153a68452d0438999@orel>
In-Reply-To: <20240327-77a6b64153a68452d0438999@orel>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 28 Mar 2024 15:18:22 +0100
Message-ID: <CAEg0e7jyGZV3+04HNYzgfHMGYT9wV_c0A=ekpCRi3L-5yjxK=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: T-Head: Test availability bit before enabling
 MAEE errata
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	Cooper Qu <cooper.qu@linux.alibaba.com>, Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
	Huang Tao <eric.huang@linux.alibaba.com>, Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_071842_084436_5AEE6324 
X-CRM114-Status: GOOD (  45.57  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTo0MeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTE6MDM6
MDZBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gV2VkLCBNYXIgMjcsIDIwMjQg
YXQgMTE6MzE6MzBBTSArMDEwMCwgQ2hyaXN0b3BoIE3DvGxsbmVyIHdyb3RlOgo+ID4gPiBULUhl
YWQncyBNQUVFIG1lY2hhbmlzbSAobm9uLWNvbXBhdGlibGUgZXF1aXZhbGVudCBvZiBSVkkncyBT
dnBibXQpCj4gPiA+IGlzIGN1cnJlbnRseSBhc3N1bWVkIGZvciBhbGwgVC1IZWFkIGhhcnRzLiBI
b3dldmVyLCBRRU1VIHJlY2VudGx5Cj4gPiA+IGRlY2lkZWQgdG8gZHJvcCBhY2NlcHRhbmNlIG9m
IGd1ZXN0cyB0aGF0IHdyaXRlIHJlc2VydmVkIGJpdHMgaW4gUFRFcy4KPiA+ID4gQXMgTUFFRSB1
c2VzIHJlc2VydmVkIGJpdHMgaW4gUFRFcyBhbmQgTGludXggYXBwbGllcyB0aGUgTUFFRSBlcnJh
dGEKPiA+ID4gZm9yIGFsbCBULUhlYWQgaGFydHMsIHRoaXMgYnJva2UgdGhlIExpbnV4IHN0YXJ0
dXAgb24gUUVNVSBlbXVsYXRpb25zCj4gPiA+IG9mIHRoZSBDOTA2IGVtdWxhdGlvbi4KPiA+ID4K
PiA+ID4gVGhpcyBwYXRjaCBhdHRlbXB0cyB0byBhZGRyZXNzIHRoaXMgaXNzdWUgYnkgdGVzdGlu
ZyB0aGUgTUFFRSBiaXQKPiA+ID4gaW4gVEhfTVhTVEFUVVMgQ1NSLiBBcyB0aGUgVEhfTVhTVEFU
VVMgQ1NSIGlzIG9ubHkgYWNjZXNzaWJsZSBpbiBNLW1vZGUKPiA+ID4gdGhpcyBwYXRjaCBkZXBl
bmRzIG9uIE0tbW9kZSBmaXJtd2FyZSB0aGF0IGhhbmRsZXMgdGhpcyBmb3IgdXMKPiA+ID4gdHJh
bnNwYXJlbnRseS4KPiA+ID4KPiA+Cj4gPiA+IEFzIHRoaXMgcGF0Y2ggYnJlYWtzIExpbnV4IGJv
b3R1cCBvbiBhbGwgQzl4eCBtYWNoaW5lcyB3aXRoIE1BRUUsCj4gPiA+IHdoaWNoIGRvbid0IGhh
dmUgTS1tb2RlIGZpcm13YXJlIHRoYXQgaGFuZGxlcyB0aGUgYWNjZXNzIHRvIHRoZQo+ID4gPiBU
SF9NWFNUQVRVUyBDU1IsIHRoaXMgcGF0Y2ggaXMgbWFya2VkIGFzIFJGQy4KPgo+IENhbiB3ZSB3
cmFwIHRoZSBjc3IgYWNjZXNzIGluIGEgX0FTTV9FWFRBQkxFKCk/IElmIGZpcm13YXJlIGhhbmRs
ZXMgaXQsCj4gdGhlbiB3ZSByZXR1cm4gdHJ1ZS9mYWxzZSBiYXNlZCBvbiB0aGUgdmFsdWUuIElm
IGZpcm13YXJlIGRvZXNuJ3QgaGFuZGxlCj4gaXQsIGFuZCB3ZSBnZXQgYW4gaWxsZWdhbCBpbnN0
cnVjdGlvbiBleGNlcHRpb24sIHRoZW4gd2UgYXNzdW1lIHRoZSBiaXQKPiBpcyBzZXQsIHdoaWNo
IGlzIHRoZSBjdXJyZW50IGJlaGF2aW9yLgo+Cj4gPgo+ID4gSSB0aGluayB0aGlzIGlzIGdvbm5h
IGJlIHVuYWNjZXB0YWJsZSBpbiBpdHMgY3VycmVudCBzdGF0ZSBnaXZlbiB0aGF0IGl0Cj4gPiBj
YXVzZXMgcHJvYmxlbXMgZm9yIGV2ZXJ5IG90aGVyIHZlcnNpb24gb2YgdGhlIGZpcm13YXJlLiBC
cmVha2luZyByZWFsCj4gPiBzeXN0ZW1zIGZvciB0aGUgc2FrZSBvZiBlbXVsYXRpb24gaXNuJ3Qg
c29tZXRoaW5nIHdlIGNhbiByZWFzb25hYmx5IGRvLgo+ID4KPiA+IFRvIG1ha2UgdGhpcyBzb3J0
IG9mIGNoYW5nZSBhY2NlcHRhYmxlLCB5b3UncmUgZ29ubmEgaGF2ZSB0byBhZGQgc29tZSB3YXkK
PiA+IHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBzeXN0ZW1zIHRoYXQgZG8gYW5kIGRvIG5vdCBz
dXBwb3J0IHJlYWRpbmcgdGhpcwo+ID4gQ1NSLiBJIHRoaW5rIHdlIGVpdGhlciBhKSBuZWVkIHRv
IGNoZWNrIHRoZSB2ZXJzaW9uIG9mIHRoZSBTQkkKPiA+IGltcGxlbWVudGF0aW9uIHRvIHNlZSBp
ZiBpdCBoaXRzIHRoZSB0aHJlc2hvbGQgZm9yIHN1cHBvcnRpbmcgdGhpcwo+ID4gZmVhdHVyZSwg
b3IgYikgYWRkIGEgc3BlY2lmaWMgU0JJIGNhbGwgZm9yIHRoaXMgc28gdGhhdCB3ZSBjYW4KPiA+
IGRpZmZlcmVudGlhdGUgYmV0d2VlbiBmaXJtd2FyZSBub3Qgc3VwcG9ydGluZyB0aGUgZnVuY3Rp
b24gYW5kIHRoZQo+Cj4gVGhlIEZXRlQgU0JJIGV4dGVuc2lvbiBpcyBiZWluZyBkZXZlbG9wZWQg
YXMgYSBtZWNoYW5pc20gZm9yIFMtbW9kZSB0byBhc2sKPiBNLW1vZGUgdGhpbmdzIGxpa2UgdGhp
cywgYnV0IEkgdGhpbmsgdGhhdCBleHRlbnNpb24gc2hvdWxkIGJlIHVzZWQgZm9yCj4gZmVhdHVy
ZXMgdGhhdCBoYXZlIHBvdGVudGlhbCB0byBiZSBjaGFuZ2VkIGJ5IFMtbW9kZSAoZXZlbiBpZiBu
b3QKPiBldmVyeXRoaW5nIHdpbGwgYmUgY2hhbmdlYWJsZSBvbiBhbGwgcGxhdGZvcm1zKSwgd2hl
cmVhcyBhbnl0aGluZyB0aGF0J3MKPiByZWFkLW9ubHkgd291bGQgYmUgYmV0dGVyIHdpdGguLi4K
Pgo+ID4gcXVvdGUtdW5xdW90ZSAiaGFyZHdhcmUiIG5vdCBzdXBwb3J0aW5nIGl0LiBJIGRvbid0
IHJlYWxseSBsaWtlIG9wdGlvbiBhKQo+ID4gYXMgaXQgY291bGQgZ3JvdyB0byBzZXZlcmFsIGRp
ZmZlcmVudCBvcHRpb25zIChlYWNoIGZvciBhIGRpZmZlcmVudCBTQkkKPiA+IGltcGxlbWVudGF0
aW9uKSBhbmQgc3VwcG9ydCBmb3IgcmVhZGluZyB0aGUgQ1NSIHdvdWxkIG5lZWQgdG8gYmUKPiA+
IHVuY29uZGl0aW9uYWwuIEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCBJIGFtIG1pc3Npbmcgc29tZXRo
aW5nIHRob3VnaCwKPiA+IHRoYXQnZCBtYWtlIGl0IGRvYWJsZSB3aXRob3V0IGludHJvZHVjaW5n
IGEgbmV3IGNhbGwuCj4gPgo+ID4gVGhhbmtzLAo+ID4gQ29ub3IuCj4gPgo+ID4gSWYgb25seSB3
ZSdkIG1hZGUgZW5hYmxpbmcgdGhpcyBiZSBjb250cm9sbGVkIGJ5IGEgc3BlY2lmaWMgRFQgcHJv
cGVydHksCj4gPiB0aGVuIGRpc2FibGluZyBpdCBpbiBRRU1VIHdvdWxkIGJlIGFzIHNpbXBsZSBh
cyBub3Qgc2V0dGluZyB0aGF0Cj4gPiBwcm9wZXJ0eSA6KAo+Cj4gLi4udGhpcywgd2hlcmUgIkRU
IHByb3BlcnR5IiBpcyAiSVNBIGV4dGVuc2lvbiBuYW1lIi4gSSB3b25kZXIgaWYgd2UKPiBzaG91
bGRuJ3Qgc3RhcnQgY29uc2lkZXJpbmcgdGhlIGludmVudGlvbiBvZiB4bGludXhfdmVuZG9yX3h5
eiB0eXBlCj4gZXh0ZW5zaW9uIG5hbWVzIHdoaWNoIGZpcm13YXJlIGNvdWxkIGFkZCB0byB0aGUg
SVNBIHN0cmluZyAvIGFycmF5LAo+IGluIG9yZGVyIHRvIGNvbW11bmljYXRlIHJlYWQtb25seSBp
bmZvcm1hdGlvbiBsaWtlIHRoaXM/Cj4KPiBUaGFua3MsCj4gZHJldwoKSGkgQ29ub3IgYW5kIERy
ZXcsCgpUaGFuayB5b3UgZm9yIHlvdXIgaGludHMuCkkgZnVsbHkgYWdyZWUgd2l0aCBhbGwgeW91
ciBzdGF0ZW1lbnRzIGFuZCBjb25jZXJucy4KClN3aXRjaGluZyBmcm9tIHRoLm14c3RhdHVzIHRv
IHRoLnN4c3RhdHVzIHNob3VsZCBhZGRyZXNzIGFsbCBtZW50aW9uZWQgY29uY2VybnM6Ciogbm8g
ZGVwZW5kZW5jeSBvbiBPcGVuU0JJIGNoYW5nZXMKKiBubyBicmVhayBvZiBmdW5jdGlvbmFsaXR5
Ciogbm8gbmVlZCBmb3IgZ3JhY2VmdWwgaGFuZGxpbmcgb2YgQ1NSIHJlYWQgZmFpbHVyZXMKKiBu
byBuZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBIVyBhbmQgZW11bGF0aW9uIChhc3N1bWlu
ZyBRRU1VCmFjY2VwdHMgdGhlIGVtdWxhdGlvbiBvZiB0aC5zeHN0YXR1cykKCkFsc28gbm90ZSB0
aGF0IERUIGhhbmRsaW5nIHdvdWxkIGJlIGRpZmZpY3VsdCwgYmVjYXVzZSB3ZSBuZWVkIHRvIHBy
b2JlIGJlZm9yZQpzZXR0aW5nIHVwIHRoZSBwYWdlIHRhYmxlLgoKVGhhbmtzIQoKCj4KPiA+Cj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11
ZWxsbmVyQHZydWxsLmV1Pgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFk
L2VycmF0YS5jIHwgMTQgKysrKysrKysrKy0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9l
cnJhdGEuYwo+ID4gPiBpbmRleCA4YzhhOGE0YjA0MjEuLmRkN2JmNmM2MmEzNSAxMDA2NDQKPiA+
ID4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+ID4gKysrIGIvYXJj
aC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+ID4gQEAgLTE5LDYgKzE5LDkgQEAKPiA+
ID4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vdmVuZG9yaWRf
bGlzdC5oPgo+ID4gPgo+ID4gPiArI2RlZmluZSBDU1JfVEhfTVhTVEFUVVMgICAgICAgICAgICAw
eDdjMAo+ID4gPiArI2RlZmluZSBNWFNUQVRVU19NQUVFICAgICAgICAgICAgICBfQUMoMHgyMDAw
MDAsIFVMKQo+ID4gPiArCj4gPiA+ICBzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfbWFlZSh1bnNp
Z25lZCBpbnQgc3RhZ2UsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ID4gPiAgewo+ID4gPiBAQCAtMjgs
MTEgKzMxLDE0IEBAIHN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9tYWVlKHVuc2lnbmVkIGludCBz
dGFnZSwKPiA+ID4gICAgIGlmIChhcmNoX2lkICE9IDAgfHwgaW1waWQgIT0gMCkKPiA+ID4gICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPgo+ID4gPiAtICAgaWYgKHN0YWdlID09IFJJU0NW
X0FMVEVSTkFUSVZFU19FQVJMWV9CT09UIHx8Cj4gPiA+IC0gICAgICAgc3RhZ2UgPT0gUklTQ1Zf
QUxURVJOQVRJVkVTX01PRFVMRSkKPiA+ID4gLSAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+
ICsgICBpZiAoc3RhZ2UgIT0gUklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JPT1QgJiYKPiA+ID4g
KyAgICAgICBzdGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfTU9EVUxFKQo+ID4gPiArICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+Cj4gPiA+IC0gICByZXR1cm4gZmFsc2U7Cj4gPiA+ICsg
ICBpZiAoIShjc3JfcmVhZChDU1JfVEhfTVhTVEFUVVMpICYgTVhTVEFUVVNfTUFFRSkpCj4gPiA+
ICsgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gKwo+ID4gPiArICAgcmV0dXJuIHRydWU7
Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAvKgo+ID4gPiAtLQo+ID4gPiAyLjQ0LjAKPiA+ID4KPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
