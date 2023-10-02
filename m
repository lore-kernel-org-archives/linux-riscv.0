Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0494E743C3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8YTT0mn0f44oK86rWl5b8XPyq3mYEIfsV8UXIm/0xM=; b=EQTCmV3zpaY2pr
	Oo4lGwL92odfvPywOzF0QTyPi7hEu0CZF30EoqL6xj+kuNiyI6Mv6O9DuFxS5KToRV60H0GzhfJj0
	ferNHaLoolNTfjeGF3R3Ja412YXPMKZYD9IGCnBM5+JheNIfMeNTxEdBmBKJm3YtlfOnXwyBRJijX
	EBedmhKyTCfpplD7CVuwWFClXmQzrxCi2ATowLQCPlmmF515ybt4xcRNhZ7XBQQ2Nriyrh3I0Bgtn
	EKcorppQxpThEdFXftZXbkKB3e8yLynVybfIowKp9eFkgeREHFq8rC3Rq1Lj9yDqKsKl9/sfx6tgI
	NOgWqiWGVo3comq+r45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLJv-00D1w9-1i;
	Mon, 02 Oct 2023 15:58:55 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLJt-00D1v0-0F
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:58:54 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-454529a2deeso3978503137.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696262325; x=1696867125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/uBY1GHK5wM8Sw0r1xr8kkIVh7PpQ9+l557Rxtbl80=;
        b=g5AQREuBoojoMUOzb6S5hUNhsDfe/1WuJj3gSu1+Os+9a2MgzHr3O40wyZt3W/kKvx
         1A4Um0irsB7mYJthDtrMCaf8wlMn7dDsNQO96rVYw3C9PaO+IZN12x/l51aqOtD2E4km
         zPNLsgOgsKTzGFeipD0ZUWlUfUzZj4+q+X3y7/HWZUhIwf9NiGkbcHSCK1kH8gvV6USm
         QgoUPHOmPwR7JONCWgpSQSzrZ8I0UE5iTzvtgkG76piGWjs8ZytxBIeTq4mc/HL6jv/V
         KY+roZNheibVlPOqNYQ8siC6zlNdDeDfw298COJ5dvFWLHzAGwECQSQujCwDLKLBFCbE
         AIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262325; x=1696867125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/uBY1GHK5wM8Sw0r1xr8kkIVh7PpQ9+l557Rxtbl80=;
        b=wjLtnCeDLNKyKSBke9KlepnLJ8P8WLN0hmeWssZRtFBMfOruQMBLCIMZzZPr6i399O
         kL4/rbPfsxTWfGfqsLYK6kngYHCCrV7liG6DOWe3x6fIh0GgOh0gJFOAA2uBVh6HX+pg
         oWoqINs7oX/aEgJFeGFEf1+he4Ls2AWW9UTnYoOWkAzq+VZNsulS7xRv87wii7LTGMDs
         wQwkmT1DqekSnTQMrFiFyOLtDtwv/xzci99ezvpnr6OfRa9bmu1FOHPCnxywYkAJjhGw
         OVCJ2Z1eQ+MFrgSd48BqYFx80y95GTUxwq+Ew3bULrrtrSQeB2atyHB9QV50Cn+cWAmc
         e0Nw==
X-Gm-Message-State: AOJu0Yxg8QiHY5+0SFAIRMtdeOpGguWIl2WA99CJzbfebzJRs3mxypuH
	ysrnqfw31ydw/JWSv3aAXw8C7TCv3BqdhvQGq+0O9w==
X-Google-Smtp-Source: AGHT+IFW1CmNUWYkc6jWoQN9D8Ez4GQmg0IhD/dCqR+ig8ardwLgD7Q08r9vAe22Az/mJ0aZENlZbqM+iJIDMe5iWf8=
X-Received: by 2002:a05:6102:2db:b0:452:cfeb:160d with SMTP id
 h27-20020a05610202db00b00452cfeb160dmr10233920vsh.26.1696262325473; Mon, 02
 Oct 2023 08:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com> <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
 <20230930-emporium-share-2bbdf7074e54@spud> <202309301400.4E1AD87@keescook>
 <CAKbZUD08W9_HB9F7tQqwreYvVapgVMOkS3QokzwHPcBnFnVMig@mail.gmail.com> <8d305ae1-4235-6ae8-7dfb-9f432fdfcd41@ghiti.fr>
In-Reply-To: <8d305ae1-4235-6ae8-7dfb-9f432fdfcd41@ghiti.fr>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 2 Oct 2023 08:58:07 -0700
Message-ID: <CABCJKucscLdmyD8zJ=aOJDT9zbChW3=ZMXPgudPqykfOemR+fA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Pedro Falcato <pedro.falcato@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_085853_115519_665F7F14 
X-CRM114-Status: GOOD (  24.26  )
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCAxMjowMuKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBPbiAwMS8xMC8yMDIzIDE3OjE5LCBQZWRybyBGYWxjYXRvIHdy
b3RlOgo+ID4gT24gU3VuLCBPY3QgMSwgMjAyMyBhdCAyOjUx4oCvQU0gS2VlcyBDb29rIDxrZWVz
Y29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDEw
OjAyOjM1QU0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+Pj4gT24gRnJpLCBTZXAgMjks
IDIwMjMgYXQgMDM6NTI6MjJQTSAtMDcwMCwgU2FtaSBUb2x2YW5lbiB3cm90ZToKPiA+Pj4+IE9u
IEZyaSwgU2VwIDI5LCAyMDIzIGF0IDI6NTTigK9QTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4gPj4+Pj4gT24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMDk6MTE6NThQ
TSArMDAwMCwgU2FtaSBUb2x2YW5lbiB3cm90ZToKPiA+Pj4+Pj4gQVJDSF9NTUFQX1JORF9CSVRT
X01BWCBpcyBiYXNlZCBvbiBTdjM5LCB3aGljaCBsZWF2ZXMgYSBmZXcKPiA+Pj4+Pj4gcG90ZW50
aWFsIGJpdHMgb2YgbW1hcCByYW5kb21uZXNzIG9uIHRoZSB0YWJsZSBpZiB3ZSBlbmQgdXAgZW5h
YmxpbmcKPiA+Pj4+Pj4gNC81LWxldmVsIHBhZ2luZy4gVXBkYXRlIG1tYXBfcm5kX2JpdHNfbWF4
IHRvIHRha2UgdGhlIGZpbmFsIGFkZHJlc3MKPiA+Pj4+Pj4gc3BhY2Ugc2l6ZSBpbnRvIGFjY291
bnQuIFRoaXMgaW5jcmVhc2VzIG1tYXBfcm5kX2JpdHNfbWF4IGZyb20gMjQgdG8KPiA+Pj4+Pj4g
MzMgd2l0aCBTdjQ4LzU3Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW1pIFRv
bHZhbmVuIDxzYW1pdG9sdmFuZW5AZ29vZ2xlLmNvbT4KPiA+Pj4+PiBJIGxpa2UgdGhpcy4gSXMg
UklTQ1YgdGhlIG9ubHkgYXJjaCB3aGVyZSB0aGUgcGFnaW5nIGxldmVsIGNhbiBiZSBjaG9zZW4K
PiA+Pj4+PiBhdCBib290IHRpbWU/Cj4gPj4+PiBJIGhhdmVuJ3Qgc2VlbiB0aGlzIGVsc2V3aGVy
ZSwgYnV0IEkgYWxzbyBoYXZlbid0IGxvb2tlZCBhdCBhbGwgdGhlCj4gPj4+PiBvdGhlciBhcmNo
aXRlY3R1cmVzIHRoYXQgY2xvc2VseS4gYXJtNjQgZG9lcyBzb21ldGhpbmcgaW50ZXJlc3RpbmcK
PiA+Pj4+IHdpdGggQVJNNjRfVkFfQklUU181MiwgYnV0IEkgdGhpbmsgd2UgY2FuIHN0aWxsIGhh
bmRsZSB0aGF0IGluCj4gPj4+PiBLY29uZmlnLgo+ID4+PiBBRkFJVSwgeDg2LTY0IGNhbiBkbyB0
aGlzIGFsc286Cj4gPj4+Cj4gPj4+ICAgICAgICBubzRsdmwgICAgICAgICAgW1JJU0NWXSBEaXNh
YmxlIDQtbGV2ZWwgYW5kIDUtbGV2ZWwgcGFnaW5nIG1vZGVzLiBGb3JjZXMKPiA+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICBrZXJuZWwgdG8gdXNlIDMtbGV2ZWwgcGFnaW5nIGluc3RlYWQuCj4g
Pj4+Cj4gPj4+ICAgICAgICBubzVsdmwgICAgICAgICAgW1g4Ni02NCxSSVNDVl0gRGlzYWJsZSA1
LWxldmVsIHBhZ2luZyBtb2RlLiBGb3JjZXMKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBr
ZXJuZWwgdG8gdXNlIDQtbGV2ZWwgcGFnaW5nIGluc3RlYWQuCj4gPj4gQWgtaGEhIE9rYXksIHdl
bGwsIHRoZW4gbGV0J3MgdHJhY2sgdGhpcyBpZGVhOgo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9L
U1BQL2xpbnV4L2lzc3Vlcy8zNDYKPiA+IChSZXBseWluZyBoZXJlIGZvciB2aXNpYmlsaXR5LCB0
ZWxsIG1lIGlmIHlvdSB3YW50IHRvIG1vdmUgdGhpcwo+ID4gZGlzY3Vzc2lvbiB0byBnaXRodWIp
Cj4gPgo+ID4gQUlVSSwgeDg2IGNhbm5vdCBkbyB0aGlzIGZvciBjb21wYXQgcmVhc29ucy4gRXZl
biBpZiB5b3UgZW5hYmxlIExBNTcsCj4gPiBtbWFwIG9ubHkgZ2l2ZXMgeW91IDwgNDgtYml0IGFk
ZHJlc3NlcywgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCB0aGluZ3MKPiA+IGxpa2UgSklUcywgZXRj
IHRoYXQgc3Rhc2ggaW5mb3JtYXRpb24gaW4gdGhlIHVwcGVyIDE2IGJpdHMuIFlvdSBuZWVkCj4g
PiB0byBwYXNzIGEgPiA0OC1iaXQgbW1hcCBoaW50IHRvIGdldCA1Ny1iaXQgYWRkcmVzc2VzLgo+
ID4KPiA+IEkgaW1hZ2luZSByaXNjdiBkb2VzIG5vdCBoYXZlIHRoaXMgaXNzdWUgeWV0LCBkdWUg
dG8gbGl0dGxlCj4gPiBhY2N1bXVsYXRlZCBjcnVmdCwgYnV0IGl0IG1heSBiZSB3aXNlIHRvIGNo
ZWNrIGFnYWluc3QgcG9wdWxhciBKSVR0ZXJzCj4gPiBmb3IgdGhlc2UgcHJvYmxlbXMgb24gcmlz
Y3YgY29kZS4KPiA+Cj4KPiBXZSBhbHJlYWR5IGVuY291bnRlcmVkIHRob3NlIGlzc3VlcyBhbmQg
dGhlIHNhbWUgc29sdXRpb24gd2FzIHJlY2VudGx5Cj4gbWVyZ2VkIChyZXN0cmljdCB0byBzdjQ4
IHVubGVzcyBvdGhlcndpc2Ugc3BlY2lmaWVkKToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzA4MDkyMzIyMTguODQ5NzI2LTEtY2hhcmxpZUByaXZvc2luYy5jb20vCgpXZSByZWNl
bnRseSByYW4gaW50byB0aGlzIGlzc3VlIHdoZW4gYnJpbmdpbmcgdXAgQW5kcm9pZCBhcyB3ZWxs
CmJlY2F1c2UgcWVtdSBkZWZhdWx0cyB0byBTdjU3IGFuZCBzb21lIHVzZXJzcGFjZSBiaXRzIHdl
cmVuJ3QgaGFwcHkKd2l0aCA+NDgtYml0IG1tYXAgYWRkcmVzc2VzLgoKTm90ZSB0aGF0IHRoaXMg
cGF0Y2ggdXNlcyBNTUFQX1ZBX0JJVFMsIHdoaWNoIGlzIDQ4IGZvciBib3RoIFN2NDggYW5kClN2
NTcsIHdoaWNoIGlzIHdoeSBtbWFwX3JuZF9iaXRzX21heCB3aWxsIGJlIDMzIGV2ZW4gd2l0aCBT
djU3LgoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
