Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A782EC02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 01:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJAddW/CpSEc+HL2TYxhUft0JIihdxynRBRk6j3v/8s=; b=2666is7G3mxi05
	RbvKLxKDmiY32aNP3VVLXJxNYvj3GFV3rZSARxNxeEw6VvSgC0lkASOZ+Xo1vtNCnn6eXEEosGVab
	C0Jgto7zchkVgCb+Z7nhxPLpTVRxrUPwUeOEpEwpSr9F8zKSsiXtswHcFJ3Cy+DXKcmVZC3xbF3Uz
	oSofG9TaRobixGkQfF1Zx6QE2+B2eA4N9MbmE2Z9HtqHhA1mH3nNECpMqWgfdt5gKoRTDjnrlIF7e
	vn4TwNOEHAfPz/iC7UedLt39tzJw9OtzgiVLMigNv7QADK+tCnBGhK/wyzpPM4dCEJQx0OxZDvSIS
	RcqvDV8CupZXijtNx6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiO1g-00000009OLt-1KL5;
	Thu, 13 Feb 2025 01:28:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiO1d-00000009OKy-1BBz;
	Thu, 13 Feb 2025 01:28:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so155657f8f.1;
        Wed, 12 Feb 2025 17:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739410099; x=1740014899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
        b=PkQD1UmJ+gm9wsyvi1ov7gavDQ37RmUbcuZ5qf4dGvY5yUwAXHjiIKdi56dOE0FGIm
         riR+KmW0IByyP5qkPR49IwiMXJJ5KIY17OlfT70CvJfYH2e+LradT+TNlBAnfG7h3lAK
         uWQz9zUcF8GoRcOr0FcfguvHL28AE9Pf7KJyxnqEoAra1fCrY/zk+jf8fuSwuK+BSaDq
         epALQq8ByQ+2omFdxR2D/PKsWNr+NbB/lw1+ldVDOKQHsjpU194xt9o9/6OBmY6tVc0Y
         /rf8+DUBNMHKz1sqTzP2OHvgRa35uHOnAKdZ9/CAEOsswby+Lfa++Nel+JfOZLXQFaTz
         Bx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739410099; x=1740014899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
        b=YKe2XrbaRGb5RluY/IY4mIgl9LXv6JyF6HVfx4POVr6r21T19VlskWAQtJggDwx0sV
         NbjaME5lF+ueyF/pOHl2fak1hLHBmrCFgXbaLGzvS5yQBbKrQD0pCnQ4yb1wdI9jVLBm
         MgSjv2TCGd4o+J9ByhNRLmNAxf7cOYvwau0D90aq/ONZgxaSQNTqIJsC9XIDO8kgnjjr
         rCWdJIbMdvNqZn2OXJBdeodPz45xXT+M0hfRALuk64fxGV2hbAru24l7L9vX204a7wL9
         Lh4RudYpCXq5bR4NWUzLu2R7QPGkdZMEiO4jtGohZtras73ET90c9Sz7kZfAY9Jb4FYt
         ehOg==
X-Forwarded-Encrypted: i=1; AJvYcCVTaesbG89kDCSBOpaPcUjZpdF871iIZRbPTSirPHIThGaNgDxXpWEbwQb+xPWSI6joPFXbkCpOflQtub7ObwvX@lists.infradead.org, AJvYcCXxMGG7jvqQtE18/rKdh/TuibsGjiRPaJi+hg9y9miB8IO/b03T+bRp4cMk4T7gJhPGNpqvmq1G2W3Rn7o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Bx+cExPATwvBPZveUsOkMYkpFnSBab+0HBvDqwzlWZx1VE79
	mpD5wmjZqkMeDuB15upOz0Im9TW+1EbgceB1/AGbtx/poQSBvBfpL9pMRwx98gPFczzMMxGP/0N
	WGSUY7GSm+7ekqGj7xyzt0L2WkMQ=
X-Gm-Gg: ASbGncsCvfP+9awH+y7oCzjFYcXn70udBe0K/iJX3VBIh8kTWvu+vd+xEJCmfp84Q2Y
	T27HkFecSjyya5EauEjg9FjTP79khlgH3teIezM/gxFDl+NIJWLUmlbYzH0/3eSiUH26vnmTxJi
	E=
X-Google-Smtp-Source: AGHT+IEhltifMX701fYkEDmSU69qM9C3gXECNDsqw8PpPT3Yw5x0mc+ricaPHhG6ElqQmHswedH/T+PZOKbLltISlh4=
X-Received: by 2002:a05:6000:144f:b0:38f:227e:6ff2 with SMTP id
 ffacd0b85a97d-38f244df054mr1302880f8f.14.1739410099435; Wed, 12 Feb 2025
 17:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6> <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
In-Reply-To: <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 13 Feb 2025 02:28:08 +0100
X-Gm-Features: AWEUYZn2XkAKpo5fHBIg4DaefcDCWc7cwclFMrZ0d3cOTpLW86BXbO6cjB81ilc
Message-ID: <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172821_318549_B9BF82F8 
X-CRM114-Status: GOOD (  25.96  )
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

T24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgMjoyMeKAr0FNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDExLCAyMDI1IGF0IDc6MDfi
gK9QTSBNYWNpZWogV2llY3pvci1SZXRtYW4KPiA8bWFjaWVqLndpZWN6b3ItcmV0bWFuQGludGVs
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSSBkaWQgc29tZSBleHBlcmltZW50cyB3aXRoIG11bHRpcGxl
IGFkZHJlc3NlcyBwYXNzZWQgdGhyb3VnaAo+ID4ga2FzYW5fbWVtX3RvX3NoYWRvdygpLiBBbmQg
aXQgc2VlbXMgbGlrZSB3ZSBjYW4gZ2V0IGFsbW9zdCBhbnkgYWRkcmVzcyBvdXQgd2hlbgo+ID4g
d2UgY29uc2lkZXIgYW55IHJhbmRvbSBib2d1cyBwb2ludGVycy4KPiA+Cj4gPiBJIHVzZWQgdGhl
IEtBU0FOX1NIQURPV19PRkZTRVQgZnJvbSB5b3VyIGV4YW1wbGUgYWJvdmUuIFVzZXJzcGFjZSBh
ZGRyZXNzZXMgc2VlbQo+ID4gdG8gbWFwIHRvIHRoZSByYW5nZSBbS0FTQU5fU0hBRE9XX09GRlNF
VCAtIDB4ZmZmZjhmZmZmZmZmZmZmZl0uIFRoZW4gZ29pbmcKPiA+IHRocm91Z2ggbm9uLWNhbm9u
aWNhbCBhZGRyZXNzZXMgdW50aWwgMHgwMDA3ZmZmZmZmZmZmZmZmIHdlIHJlYWNoIHRoZSBlbmQg
b2YKPiA+IGtlcm5lbCBMQSBhbmQgd2UgbG9vcCBhcm91bmQuIFRoZW4gdGhlIGFkZHJlc3NlcyBz
ZWVtIHRvIGdvIGZyb20gMCB1bnRpbCB3ZQo+ID4gYWdhaW4gc3RhcnQgcmVhY2hpbmcgdGhlIGtl
cm5lbCBzcGFjZSBhbmQgdGhlbiBpdCBtYXBzIGludG8gdGhlIHByb3BlciBzaGFkb3cKPiA+IG1l
bW9yeS4KPiA+Cj4gPiBJdCBnYXZlIG1lIHRoZSBzYW1lIHJlc3VsdHMgd2hlbiB1c2luZyB0aGUg
cHJldmlvdXMgdmVyc2lvbiBvZgo+ID4ga2FzYW5fbWVtX3RvX3NoYWRvdygpIHNvIEknbSB3b25k
ZXJpbmcgd2hldGhlciBJJ20gZG9pbmcgdGhpcyBleHBlcmltZW50Cj4gPiBpbmNvcnJlY3RseSBv
ciBpZiB0aGVyZSBhcmVuJ3QgYW55IGFkZHJlc3NlcyB3ZSBjYW4gcnVsZSBvdXQgaGVyZT8KPgo+
IEJ5IHRoZSBkZWZpbml0aW9uIG9mIHRoZSBzaGFkb3cgbWFwcGluZywgaWYgd2UgYXBwbHkgdGhh
dCBtYXBwaW5nIHRvCj4gdGhlIHdob2xlIDY0LWJpdCBhZGRyZXNzIHNwYWNlLCB0aGUgcmVzdWx0
IHdpbGwgb25seSBjb250YWluIDEvOHRoCj4gKDEvMTZ0aCBmb3IgU1cvSFdfVEFHUykgb2YgdGhh
dCBzcGFjZS4KPgo+IEZvciBleGFtcGxlLCB3aXRoIHRoZSBjdXJyZW50IHVwc3RyZWFtIHZhbHVl
IG9mIEtBU0FOX1NIQURPV19PRkZTRVQgb24KPiB4ODYgYW5kIGFybTY0LCB0aGUgdmFsdWUgb2Yg
dGhlIHRvcCAzIGJpdHMgKDQgZm9yIFNXL0hXX1RBR1MpIG9mIGFueQo+IHNoYWRvdyBhZGRyZXNz
IGFyZSBhbHdheXMgdGhlIHNhbWU6IEtBU0FOX1NIQURPV19PRkZTRVQncyB2YWx1ZSBpcwo+IHN1
Y2ggdGhhdCB0aGUgc2hhZG93IGFkZHJlc3MgY2FsY3VsYXRpb24gbmV2ZXIgb3ZlcmZsb3dzLiBB
ZGRyZXNzZXMKPiB0aGF0IGhhdmUgYSBkaWZmZXJlbnQgdmFsdWUgZm9yIHRob3NlIHRvcCAzIGJp
dHMgYXJlIHRoZSBvbmNlIHdlIGNhbgo+IHJ1bGUgb3V0LgoKRWgsIHNjcmF0Y2ggdGhhdCwgdGhl
IDNyZCBiaXQgZnJvbSB0aGUgdG9wIGNoYW5nZXMsIGFzCktBU0FOX1NIQURPV19PRkZTRVQgaXMg
bm90IGEgdGhhdC13ZWxsLWFsaWduZWQgdmFsdWUsIHRoZSBvdmVyYWxsIHNpemUKb2YgdGhlIG1h
cHBpbmcgaG9sZHMuCgo+IFRoZSBLQVNBTl9TSEFET1dfT0ZGU0VUIHZhbHVlIGZyb20gbXkgZXhh
bXBsZSBkb2VzIHJlbHkgb24gdGhlCj4gb3ZlcmZsb3cgKGFyZ3VhYmx5LCB0aGlzIG1ha2VzIHRo
aW5ncyBtb3JlIGNvbmZ1c2luZyBbMV0pLiBCdXQgc3RpbGwsCj4gdGhlIHBvc3NpYmxlIHZhbHVl
cyBvZiBzaGFkb3cgYWRkcmVzc2VzIHNob3VsZCBvbmx5IGNvdmVyIDEvMTZ0aCBvZgo+IHRoZSBh
ZGRyZXNzIHNwYWNlLgo+Cj4gU28gd2hldGhlciB0aGUgYWRkcmVzcyBiZWxvbmdzIHRvIHRoYXQg
MS84dGggKDEvMTZ0aCkgb2YgdGhlIGFkZHJlc3MKPiBzcGFjZSBpcyB3aGF0IHdlIHdhbnQgdG8g
Y2hlY2sgaW4ga2FzYW5fbm9uX2Nhbm9uaWNhbF9ob29rKCkuCj4KPiBUaGUgY3VycmVudCB1cHN0
cmVhbSB2ZXJzaW9uIG9mIGthc2FuX25vbl9jYW5vbmljYWxfaG9vaygpIGFjdHVhbGx5Cj4gZG9l
cyBhIHNpbXBsaWZpZWQgY2hlY2sgYnkgb25seSBjaGVja2luZyBmb3IgdGhlIGxvd2VyIGJvdW5k
IChlLmcuIGZvcgo+IHg4NiwgdGhlcmUncyBhbHNvIGFuIHVwcGVyIGJvdW5kOiBLQVNBTl9TSEFE
T1dfT0ZGU0VUICsKPiAoMHhmZmZmZmZmZmZmZmZmZmZmID4+IDMpID09IDB4ZmZmZmZiZmZmZmZm
ZmZmZiksIHNvIHdlIGNvdWxkIGltcHJvdmUKPiBpdC4KPgo+IFsxXSBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxODA0MwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
