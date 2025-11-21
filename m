Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3071BCFC271
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UiH9l0IX5/fuwH/dKKvo6yGGuzksE1FcDOElkIQWj3Q=; b=vNxcOllp6RUWax
	MfqAzIA2EH62pntb5a8RlVEULXypM0tW3I00Rp3uRJItqGTqoxYiymlnIR29MhVspjF8H288LuFbl
	hNOtZV/xim72Abv+ccceOUMHBfRddT323NSA37DGb4tNwdlJg5qvkQoRKzQJU0lqWE+3jY7Bn1W4j
	HwUpA/QlSbECoKHYGAQVBgV8pb3Oqy4Iws8HpmHZhoQ6vOFaQdzhDhvNZTVke2RT9JRCuufeNqXiH
	v8C40SKcqGufcVhHRDg9myShiMbm3XkRHs+V3/BHrTHDg36302JF7R8dz8Izd0FjGgMdGOy55Bb3u
	+4qTRDoyd6zmBntEAJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQmU-00000008O3z-0DXA;
	Fri, 21 Nov 2025 13:02:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQmS-00000008O3h-072H
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B7A56022F
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 13:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B218C19422
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763730116;
	bh=pFABHeUoQY0iTYtcJ4akPo9l83Vtn04kLhdTwdzSeGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tce2aylLuTwJkp5tjrvo9HV45BY43bcXQhLYbKwSeeZfjGseOFeliyQAOjWhaFJcI
	 +mxhfIHytB2afLH4DW230R/oFYafOVUPYiN7jUWqWrt9e3YFRfC3pvrDgZNe3HGGn1
	 h3iPZfY78nLW5DPhcfMzrljOlLgES8nQxFxXUjQ7K4fsCRpjwDCFL5AsR9pqd7ySxH
	 b7tVpmreG4HIcRTWY5x8acgkxyDcwHpvRLpOq0Y/MVrszBXXrE5OtRUWkbXhN/nK4F
	 iL06ikq1zTFM6wuMyGFJWOfGim/tS80lbKOGDdc4CbDUlbJUB8GXYuw04Evk+y6Z9X
	 BS0SMV0I0C9zw==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1135937f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 05:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtclfDcHW51b9Fi3fB2CLjfdeTUx+9zLpzjup0pIpVetQPuNJ4f4D7T7QaK+QU0FwaeJPKBGlLgE8kiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YziETHSW/AKyxi5blT2QncGfU/tNW2v/wx/QgE9EvxOwt2jsCfP
	PW1rBElphg0ETD/DoJmFMVal64ENUXsNlE13ZrudLzUJvjLrlPa4OFK1DK/lioq8cJ47EsktRMy
	ABYmDQnnsvaiAA5cjXYTyiefblgu6JnU=
X-Google-Smtp-Source: AGHT+IH2WWQx62nU3nXwdjAYaSGbKV/vdvwMmXoWS67FwfXhPZ0YDOvI2r9MT5zCkI2PYga5CpnXhou/x6QgIvB6LMg=
X-Received: by 2002:a5d:5c89:0:b0:42b:3455:e4a4 with SMTP id
 ffacd0b85a97d-42cc1d0c963mr2291902f8f.31.1763730114690; Fri, 21 Nov 2025
 05:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
 <20251121063439.2545-2-cp0613@linux.alibaba.com> <20251121-able-terrestrial-spaniel-90c3cf@kuoka>
 <20251121-shortlist-coroner-b29e19293b40@spud>
In-Reply-To: <20251121-shortlist-coroner-b29e19293b40@spud>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Nov 2025 21:01:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRUmUHrTsOBM82kNq2cSYmeYr9NC_ORacUnqHAefFSaWw@mail.gmail.com>
X-Gm-Features: AWmQ_blX7yyP7BZRzgRui-YUVloEOuF-o22dWIaYeG9mowbwvBtor0IGCm44Agc
Message-ID: <CAJF2gTRUmUHrTsOBM82kNq2cSYmeYr9NC_ORacUnqHAefFSaWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add prefix for XuanTie
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, cp0613@linux.alibaba.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgODozMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE5vdiAyMSwgMjAyNSBhdCAxMDowMTowN0FNICsw
MTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjEsIDIwMjUg
YXQgMDI6MzQ6MzZQTSArMDgwMCwgY3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlOgo+ID4g
PiBGcm9tOiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBB
ZGQgbmV3IHZlbmRvciBzdHJpbmdzIHRvIGR0IGJpbmRpbmdzIGZvciBSSVNDLVYgdmVuZG9yIFh1
YW5UaWUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiArKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gPiA+IGluZGV4IGYxZDE4
ODIwMDliYS4uNWQyOGIyZGE5NGNkIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiA+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gPiA+IEBA
IC0xODI5LDYgKzE4MjksOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiA+ID4gICAgICBkZXNjcmlw
dGlvbjogWGlsaW54Cj4gPiA+ICAgICJeeG5hbm8sLioiOgo+ID4gPiAgICAgIGRlc2NyaXB0aW9u
OiBYbmFubwo+ID4gPiArICAiXnh1YW50aWUsLioiOgo+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBD
LVNLWSBNaWNyb3N5c3RlbXMgQ28uLCBMdGQuIChYdWFuVGllKQo+ID4KPiA+IFdlIGRvIG5vdCBj
cmVhdGUgbmV3IHByZWZpeGVzIGZvciBleGlzdGluZyBlbnRyaWVzLiBZb3UgaGF2ZSBhbHJlYWR5
Cj4gPiBjc2t5LCBhbGliYWJhIGFuZCB0aGVhZCBhbmQgcHJvYmFibHkgbWFueSBtb3JlLiBDaG9v
c2Ugc29tZSBhcHByb3ByaWF0ZS4KV2UgY291bGQgbGVhdmUgdGhlIG9uZSBDLVNLWSB2ZW5kb3Ig
ZW50cnksIGhvdyBhYm91dDoKCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTM0Nyw4ICszNDcsOCBAQCBwYXR0ZXJuUHJv
cGVydGllczoKICAgICBkZXNjcmlwdGlvbjogQ3JlYXRpdmUgVGVjaG5vbG9neSBMdGQKICAgIl5j
cnlzdGFsZm9udHosLioiOgogICAgIGRlc2NyaXB0aW9uOiBDcnlzdGFsZm9udHogQW1lcmljYSwg
SW5jLgotICAiXmNza3ksLioiOgotICAgIGRlc2NyaXB0aW9uOiBIYW5nemhvdSBDLVNLWSBNaWNy
b3N5c3RlbXMgQ28uLCBMdGQKKyAgIl54dWFudGllLC4qIjoKKyAgICBkZXNjcmlwdGlvbjogQy1T
S1kgTWljcm9zeXN0ZW1zIENvLiwgTHRkLiAoWHVhblRpZSkKICAgIl5jc290LC4qIjoKICAgICBk
ZXNjcmlwdGlvbjogR3Vhbmd6aG91IENoaW5hIFN0YXIgT3B0b2VsZWN0cm9uaWNzIFRlY2hub2xv
Z3kgQ28uLCBMdGQKICAgIl5jc3EsLioiOgoKVGhlIGFyY2gvY3NreSBpcyB0aGUgYXJjaGl0ZWN0
dXJlIG5hbWUsIHdoaWNoIG1lYW5zICJ4dWFudGllLGNza3kiLgoKVGhlIGM4MTAgaXMgdGhlIENQ
VSBwcm9kdWN0IG5hbWUsIHdoaWNoIG1lYW5zICJ4dWFudGllLGM4MTAiIG9mIHRoZQoieHVhbnRp
ZSxjc2t5IiBhcmNoaXRlY3R1cmUuCgpUaGUgYzkzMCBpcyB0aGUgQ1BVIHByb2R1Y3QgbmFtZSwg
d2hpY2ggbWVhbnMgInh1YW50aWUsYzkzMCIuCgo+Cj4gV2hlbiB0aGUgdmVuZG9yIGxpdGVyYWxs
eSBzYXlzICJDLVNLWSIsIGl0J3MgaGFyZCB0byBidXkgd2h5IGNza3kKPiBzaG91bGRuJ3QgYmUg
dXNlZCBoZXJlLiBYdWFudGllIGlzIGRlc2NyaWJlZCBhcyBiZWluZyBhIGJyYW5kLCB3aGVyZSBh
dAo+IGxlYXN0IHQtaGVhZCB3YXMgYSBjb21wYW55LiBUaGlzIHNlZW1zIGFraW4gdG8gaGF2aW5n
Cj4gInNuYXBkcmFnb24sbXNtODY2MCIgaW5zdGVhZCBvZiAicWNvbSxtc204NjYwIiwgZm9yIGV4
YW1wbGUuClllcywgWHVhblRpZSBpcyBub3Qgb25seSBhIGJyYW5kLCBidXQgYWxzbyB0aGUgYWJi
cmV2aWF0aW9uIG9mIEMtU0tZCk1pY3Jvc3lzdGVtcyBDby4sIEx0ZC4KCkp1c3QgbGlrZToKCiAg
Il4xMDBhc2ssLioiOgogICAgZGVzY3JpcHRpb246IEJhaXdlbi5jb20gKDEwMGFzaykuCiAgIl5s
aW5rc3lzLC4qIjoKICAgIGRlc2NyaXB0aW9uOiBCZWxraW4gSW50ZXJuYXRpb25hbCwgSW5jLiAo
TGlua3N5cykKCj4KPiA+Cj4gPiBZb3VyIGNvbW1pdCBtc2cgc2hvdWxkIGFsc28gZXhwbGFpbiBh
bnl0aGluZyB1bnVzdWFsIGhlcmUsIGxpa2UgYWJvdmUuCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+
ID4gS3J6eXN6dG9mCj4gPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
