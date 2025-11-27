Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711D5D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5NWgAwvhpGJNLUtR2WNimyvj7e1tmrtFYpxM7KfQkQ=; b=k20L8X8HhAbQuf
	IzuG6tPiAjXmqgrxAB4s312EAdC0knbsZ2TYe6jZYnLU7zZGJaq2v4OxS3sCR/vSKs4sHZM8/whq/
	9WaK0X53CiiSiwSK0J50ryEVvQob3XhQlGVEHnVfwGTlWjOO0u6jXW9O87hTiY0nTg2u1HyF8kLAc
	yQMqIwPNMozfTd3HqL1Oc+u4seuhCZBshgODu4Ozq6WiVc7FF5+FX6mxqtYc0sx47iV/mzJS8vdqP
	CYTHDvkXT/EGU9CGUqyYD+TpOmb59Vd0VQXCUwG5eXE/xPCX3WljFTEYco8rakYl9udAgNlryo73H
	cUtWSj0Cr8lPrBcrg6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOicN-0000000HC3I-2RtH;
	Thu, 27 Nov 2025 20:29:31 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOicL-0000000HC2U-0bzy
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 20:29:30 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-882399d60baso9364246d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764275368; x=1764880168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=glGu3j/sbwJP9ugyr9ppE0wQSdNNUmPqilAdAs+RYyi0tkB6x/6cXR2xEpyDpwQK0P
         REvHP9dAc9KL+ncaOucm6IkMwIBdBcZa6U+AandaMxyEys//mpHfX/5vdYIzRRXMM7yZ
         QXZ+m2V9csiZpZUqyfzPsYQq5AGoRYiBJiFv6lDuI1ude0Ah2ZSRXEZdRXyAHkyYluwn
         aYKOfeQ9Cbk0nnyUQ9MunYirGxkvCeJT1gdiE43xA8g1T2omz2p+3Y6TgqUngJ6+h5/X
         YbCu9kFq/vMCNqphAFrlW5tFmPPuHQN1uBp31qeiMSWLtmGKlv8ZHRNFNYGJERNzdxIr
         I3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764275368; x=1764880168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=pdkZdesDf2O3ihkyMTMoRCDbuN5Li6NN7SvMgrnZwCXoPIIFiFb8icoiL7mDtoBHle
         fa5hRDAojsdc9ZFk9rN2TIR0pIP/0/vD5bIaD4OwU9DHkPexUFIfJbrm3OOV66J/ChxT
         CLMbmeC/Uj92cn84BJoY2cyxg7YnhqeVvsQXWXIvYZFWLmuIdbUJoaj8GvkYkSCGBso+
         DWgpEnieoj7XbVNFkQIKb1bZ7qKt67NtiPwDg7XfLeEjydpNLd6VQyRZJVbzj8bHfpkZ
         k1BR5dft+6llZilH/rMTBZZYzjbGk+kQYHe9sYm5cpl0qfu/MwAIjDq5PLpWPUHYBlpv
         AlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeJqlQj1TdkV785w4kT4oyGDsDSCanvOX6Rz7EHNh2R2s7e0Okzyy/DIsWwpoRBln3n5DY9M2vhUkwRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGrG4VTbqQIwsmqfCOGeFGPrdVA+WRNm/kRUmIF/hDF/ssG6bp
	hkWKPHzMFGsJkOxJPa5UCFqHH37Z5r8TeJ8s3U5lJeZAHGZa/TVzNZ9LmxZcL5FrZX/QFrfD180
	cQYHCqdCUsqBwv2elv2EbuqRddPi/MVY=
X-Gm-Gg: ASbGnctmFA0iQF+IViEP1caNnSBSec6MEO4ND4qxSoSQnz9j66IK+TzMDY9Od1Yjhm6
	A3/D//qbUDyGj19PyH8Si0I3TNUHyExj+LTsLVmQbPC1ijFYGYZEa7FCfqv5aJFV9VwSfmFf79D
	Z8Opn/sERgbvGZYlJ+ZcIXTp+6zOOGzxvtbCjyQlUV7cXCa2usKvnh71BA2DQ4Xm7q4TAkjGXQ0
	h35AMFpnBvNArJ2sVwYH3lId7K4cY5GSOY+7PTy579VOGN1R7ydYl+AoAFmdQcLnBnXhw==
X-Google-Smtp-Source: AGHT+IG5GcGrOmVVsePre6BxCVhrhKY7NJnCRBVNCLt/HcgbymNTTZVjYmvrDTtjRkuAQ9GKsIJdwvx3BNDYrNQPC88=
X-Received: by 2002:a05:6214:234f:b0:880:486d:18dc with SMTP id
 6a1803df08f44-8863afb4d8fmr176925236d6.58.1764275367501; Thu, 27 Nov 2025
 12:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com> <aSip2mWX13sqPW_l@casper.infradead.org>
In-Reply-To: <aSip2mWX13sqPW_l@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 04:29:16 +0800
X-Gm-Features: AWmQ_bn_b-JGqeMVPQ751bNAv2Qsiauy9g_kN3cQ2gR4dkmeqYmOBAyRrjCf_ew
Message-ID: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_122929_221726_7285EFBD 
X-CRM114-Status: GOOD (  35.69  )
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

T24gRnJpLCBOb3YgMjgsIDIwMjUgYXQgMzo0M+KAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IFtkcm9wcGluZyBpbmRpdmlkdWFscywgbGVhdmluZyBv
bmx5IG1haWxpbmcgbGlzdHMuICBwbGVhc2UgZG9uJ3Qgc2VuZAo+IHRoaXMga2luZCBvZiB0aGlu
ZyB0byBzbyBtYW55IHBlb3BsZSBpbiBmdXR1cmVdCj4KPiBPbiBUaHUsIE5vdiAyNywgMjAyNSBh
dCAxMjoyMjoxNlBNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMjcs
IDIwMjUgYXQgMTI6MDnigK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDA5OjE0OjM2QU0gKzA4
MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiA+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byBhbHdheXMg
ZmFsbCBiYWNrIHRvIG1tYXBfbG9jayBpZiB0aGUgcGVyLVZNQQo+ID4gPiA+IGxvY2sgd2FzIHJl
bGVhc2VkIG9ubHkgdG8gd2FpdCBmb3IgcGFnZWNhY2hlIG9yIHN3YXBjYWNoZSB0bwo+ID4gPiA+
IGJlY29tZSByZWFkeS4KPiA+ID4KPiA+ID4gU29tZXRoaW5nIEkndmUgYmVlbiB3b25kZXJpbmcg
YWJvdXQgaXMgcmVtb3ZpbmcgYWxsIHRoZSAiZHJvcCB0aGUgTU0KPiA+ID4gbG9ja3Mgd2hpbGUg
d2Ugd2FpdCBmb3IgSS9PIiBndW5rLiAgSXQncyBhIG5pY2UgYW1vdW50IG9mIGNvZGUgcmVtb3Zl
ZDoKPiA+Cj4gPiBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHBhZ2UgZmF1bHQgaGFuZGxlcnMg
c2hvdWxkIGF2b2lkIGhvbGRpbmcgdGhlIFZNQQo+ID4gbG9jayBvciBtbWFwX2xvY2sgZm9yIHRv
byBsb25nIHdoaWxlIHdhaXRpbmcgZm9yIEkvTy4gT3RoZXJ3aXNlLCB0aG9zZQo+ID4gd3JpdGVy
cyBhbmQgcmVhZGVycyB3aWxsIGJlIHN0dWNrIGZvciBhIHdoaWxlLgo+Cj4gVGhlcmUncyBhIHVz
ZWNhc2Ugc29tZSBvZiB1cyBoYXZlIGJlZW4gZGlzY3Vzc2luZyBvZmYtbGlzdCBmb3IgYSBmZXcK
PiB3ZWVrcyB0aGF0IG91ciBjdXJyZW50IHN0cmF0ZWd5IHBlc3NpbWlzZXMuICBJdCdzIGEgcHJv
Y2VzcyB3aXRoCj4gdGhvdXNhbmRzIChtYXliZSB0ZW5zIG9mIHRob3VzYW5kcykgb2YgdGhyZWFk
cy4gIEl0IGhhcyBtdWNoIG1vcmUgbWFwcGVkCj4gZmlsZXMgdGhhbiBpdCBoYXMgbWVtb3J5IHRo
YXQgY2dyb3VwcyB3aWxsIGFsbG93IGl0IHRvIHVzZS4gIFNvIG9uIGEKPiBwYWdlIGZhdWx0LCB3
ZSBkcm9wIHRoZSB2bWEgbG9jaywgYWxsb2NhdGUgYSBwYWdlIG9mIHJhbSwga2ljayBvZmYgdGhl
Cj4gcmVhZCwgc2xlZXAgd2FpdGluZyBmb3IgdGhlIGZvbGlvIHRvIGNvbWUgdXB0b2RhdGUsIG9u
Y2UgaXQgaXMgcmV0dXJuLAo+IGV4cGVjdGluZyB0aGUgcGFnZSB0byBzdGlsbCBiZSB0aGVyZSB3
aGVuIHdlIHJlZW50ZXIgZmlsZW1hcF9mYXVsdC4KPiBCdXQgaXQncyB1bmRlciBzbyBtdWNoIG1l
bW9yeSBwcmVzc3VyZSB0aGF0IGl0J3MgYWxyZWFkeSBiZWVuIHJlY2xhaW1lZAo+IGJ5IHRoZSB0
aW1lIHdlIGdldCBiYWNrIHRvIGl0LiAgU28gYWxsIHRoZSB0aHJlYWRzIGp1c3QgYmF0dGVyIHRo
ZQo+IHN0b3JhZ2UgcmUtcmVhZGluZyBkYXRhLgoKSXMgdGhpcyBlbnRpcmVseSB0aGUgZmF1bHQg
b2YgcmUtZW50ZXJpbmcgdGhlIHBhZ2UgZmF1bHQ/IFVuZGVyIGV4dHJlbWUKbWVtb3J5IHByZXNz
dXJlLCBldmVuIGlmIHdlIG1hcCB0aGUgcGFnZXMsIHRoZXkgY2FuIHN0aWxsIGJlIHJlY2xhaW1l
ZApxdWlja2x5PwoKPgo+IElmIHdlIGRvbid0IGRyb3AgdGhlIHZtYSBsb2NrLCB3ZSBjYW4gaW5z
ZXJ0IHRoZSBwYWdlcyBpbiB0aGUgcGFnZSB0YWJsZQo+IGFuZCByZXR1cm4sIG1heWJlIGdldHRp
bmcgc29tZSB3b3JrIGRvbmUgYmVmb3JlIHRoaXMgdGhyZWFkIGlzCj4gZGVzY2hlZHVsZWQuCgpJ
ZiB3ZSBuZWVkIHRvIHByb3RlY3QgdGhlIHBhZ2UgZnJvbSBiZWluZyByZWNsYWltZWQgdG9vIGVh
cmx5LCB0aGUgZml4CnNob3VsZCByZXNpZGUgd2l0aGluIExSVSBtYW5hZ2VtZW50LCBub3QgaW4g
cGFnZSBmYXVsdCBoYW5kbGluZy4KCkFsc28sIEkgZ2F2ZSBhbiBleGFtcGxlIHdoZXJlIHdlIG1h
eSBub3QgZHJvcCB0aGUgVk1BIGxvY2sgaWYgdGhlIGZvbGlvIGlzCmFscmVhZHkgdXAgdG8gZGF0
ZS4gVGhhdCBsaWtlbHkgY29ycmVzcG9uZHMgdG8gd2FpdGluZyBmb3IgdGhlIFBURSBtYXBwaW5n
IHRvCmNvbXBsZXRlLgoKPgo+IFRoaXMgdXNlIGNhc2UgYWxzbyBtYW5hZ2VzIHRvIGdldCB1dHRl
cmx5IGh1bmctdXAgdHJ5aW5nIHRvIGRvIHJlY2xhaW0KPiB0b2RheSB3aXRoIHRoZSBtbWFwX2xv
Y2sgaGVsZC4gIFNPIGl0IG1hbmlmZXN0cyBzb21ld2hhdCBzaW1pbGFybHkgdG8KPiB5b3VyIHBy
b2JsZW0gKGV2ZXJ5Ym9keSBlbmRzIHVwIGJsb2NrZWQgb24gbW1hcF9sb2NrKSBidXQgaXQgaGFz
IGEKPiByYXRoZXIgZGlmZmVyZW50IHJvb3QgY2F1c2UuCj4KPiA+IEkgYWdyZWUgdGhlcmXigJlz
IHJvb20gZm9yIGltcHJvdmVtZW50LCBidXQgbWVyZWx5IHJlbW92aW5nIHRoZSAiZHJvcCB0aGUg
TU0KPiA+IGxvY2tzIHdoaWxlIHdhaXRpbmcgZm9yIEkvTyIgY29kZSBpcyB1bmxpa2VseSB0byBp
bXByb3ZlIHBlcmZvcm1hbmNlLgo+Cj4gSSdtIG5vdCBzdXJlIGl0J2QgaHVydCBwZXJmb3JtYW5j
ZS4gIFRoZSAiZHJvcCBtbWFwIGxvY2tzIGZvciBJL08iIGNvZGUKPiB3YXMgd3JpdHRlbiBiZWZv
cmUgdGhlIFZNQSBsb2NraW5nIGNvZGUgd2FzIHdyaXR0ZW4uICBJIGRvbid0IGtub3cgdGhhdAo+
IGl0J3MgYWN0dWFsbHkgaGVscGluZyB0aGVzZSBkYXlzLgoKSSBhbSBjb25jZXJuZWQgdGhhdCBv
dGhlciB3cml0ZSBwYXRocyBtYXkgc3RpbGwgbmVlZCB0byBtb2RpZnkgdGhlIFZNQSwgZm9yCmV4
YW1wbGUgZHVyaW5nIHNwbGl0dGluZy4gVGFpbCBsYXRlbmN5IGhhcyBsb25nIGJlZW4gYSBzaWdu
aWZpY2FudCBpc3N1ZSBmb3IKQW5kcm9pZCB1c2VycywgYW5kIHdlIGhhdmUgb2JzZXJ2ZWQgaXQg
ZXZlbiB3aXRoIGZvbGlvX2xvY2ssIHdoaWNoIGhhcyBtdWNoCmZpbmVyIGdyYW51bGFyaXR5IHRo
YW4gdGhlIFZNQSBsb2NrLgoKPgo+ID4gVGhlIGNoYW5nZSB3b3VsZCBiZSBtdWNoIG1vcmUgY29t
cGxleCwgc28gSeKAmWQgcHJlZmVyIHRvIGxhbmQgdGhlIGN1cnJlbnQKPiA+IHBhdGNoc2V0IGZp
cnN0LiBBdCBsZWFzdCB0aGlzIHdheSwgd2UgYXZvaWQgZmFsbGluZyBiYWNrIHRvIG1tYXBfbG9j
ayBhbmQKPiA+IGNhdXNpbmcgY29udGVudGlvbiBvciBwcmlvcml0eSBpbnZlcnNpb24sIHdpdGgg
bWluaW1hbCBjaGFuZ2VzLgo+Cj4gVWgsIHRoaXMgaXMgYW4gUkZDIHBhdGNoc2V0LiAgSSdtIGdp
dmluZyB5b3UgbXkgY29tbWVudCwgd2hpY2ggaXMgdGhhdCBJCj4gZG9uJ3QgdGhpbmsgdGhpcyBp
cyB0aGUgcmlnaHQgZGlyZWN0aW9uIHRvIGdvIGluLiAgQW55IHRhbGsgb2YgImxhbmRpbmciCj4g
dGhlc2UgcGF0Y2hlcyBpcyBleHRyZW1lbHkgcHJlbWF0dXJlLgoKV2hpbGUgSSBhZ3JlZSB0aGF0
IHRoZXJlIGFyZSBvdGhlciBhcHByb2FjaGVzIHdvcnRoIGV4cGxvcmluZywgSQpyZW1haW4gZW50
aXJlbHkgdW5jb252aW5jZWQgdGhhdCB0aGlzIHBhdGNoc2V0IGlzIHRoZSB3cm9uZwpkaXJlY3Rp
b24uIFdpdGggdGhlIGN1cnJlbnQgcmV0cnkgbG9naWMsIGl0IHN1YnN0YW50aWFsbHkgcmVkdWNl
cwptbWFwX2xvY2sgYWNxdWlzaXRpb25zIGFuZCByZXByZXNlbnRzIGEgY2xlYXIgbG93LWhhbmdp
bmcgZnJ1aXQuCgpBbHNvLCBJIGFtIG5vdCByZWZlcnJpbmcgdG8gbGFuZGluZyB0aGUgUkZDIGl0
c2VsZiwgYnV0IHRvIGEgc3Vic2VxdWVudCBmb3JtYWwKcGF0Y2hzZXQgdGhhdCByZXRyaWVzIHVz
aW5nIHRoZSBwZXItVk1BIGxvY2suCgpUaGFua3MKQmFycnkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
