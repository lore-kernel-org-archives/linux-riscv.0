Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D3BD3F07A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V15fBPnrMEiHQoBKpbDCdUR9YffOqkuIcSaPoasdj38=; b=pjIlcUGwv3WYLx
	iiwWvf3c1jhJ53MOis5c7sMtLNIvd8bXibrTDrqqp5+vXDvsjYQfw6F/HGF3pr3trHz6BD2Vj93tr
	PjxNtkIUEfpn8RFDxLHqIKBKxuZ5z2k9eHF3m0a/UI1fdql2OvQY4BDFcy6gnSpVPCQu/SvNW9RYd
	zBY5/OCUqTdjr/HhYuDXQCNZIF63FY7JOreOeIrXIkDMeVQlKY6MsVGP+7GoDF4VRQ8PPb+NOec4N
	lBvES9irm/LAKWZ50BbhwQdl9aZapCgnOZEce+8zjmDyZMGVtiNv/m/WACcnI1hzWNAAenEvGU6i3
	XJIjuYD8pyBjOzMf1K2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RQ-0000000GHHU-0ss0;
	Wed, 28 Jan 2026 15:26:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RO-0000000GHGz-2WH4
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Jan 2026 15:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=; b=D0+epEgADtZ6Xvl1LKyUn5+asX
	fOOs2czvqwl46bs2jAVwtXHF+MR1SJj49t11ssfMq074SRzZF+JiqmXfYiijFqxVtmZd2AatgpKWt
	XHLbgnhuvWBdkTn1uP3uMmu2JCm3CdaKZFYSWRZkGwo50o2NuI8C9cqLzuU5H7nWuMn7B+/5rRZGG
	0HAY1beXvVybo2tUoTT6RQbEIAeOz1374KT7iqlo1+YWLftNBIn6Gam+29TK4FJE24/0uqMW4/LGQ
	R35uowZNU+FJe1De4CoxhsaHWSsQXMuCYNtiwEgJ4tTXufyebH1i7H1hpl6ORFTZWm98mY3D3BRJn
	18lik/mA==;
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RK-00000008pm4-3dLM
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:26:44 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-793fdbb8d3aso63738427b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 07:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769614000; cv=none;
        d=google.com; s=arc-20240605;
        b=Dfb9qynaRVneqE858BOB1O+BV7BGv+kOrh0vpBSRetLL5ekuCAFD9zjcBp6uiyTTmS
         WXQ9k2qYWFY/OQhwt5hQ82Z59h/pQy5M9szLJqJq85e8ejo+GBJH6jIeuelch78yJ4ml
         GQaN8MJEFnK+4aJucVSKqTYr5adqmLE/tMxBtmfnEMnAP4P2dnrkcl1wJLLPul6j63r2
         nD6pmOivp0xhAhAlgx36KwbCUkLElh7kuhmC3pKz29qgsLXSuvYmyG+xTGllY3psSQpa
         dXuD2Tqd6Gu5y5SqMNJJCmlj7nJBZumdPKH9q0Su/Nq2mHWXnPtTzF6V0eiHiUjFZXJT
         T7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=;
        fh=dfhlxih5/ZNfQdUgveX+fx+m6rwQKq0MLogjwrSRi0k=;
        b=bpGZ/ynzmzdRIBpbFaZfkrGBs/dNGo91TdObi2iNyUDbJU1Sj4jyjRLya93C++R+EC
         l9Kdte7mWOjjErx0dNfA/EvNk/ZbTnpT2sGHtmb0nSxcPJkItCDOlj/sTNXgZ1vy4DV4
         XKf+bJCqCCrsmzbkoApvM5jkKCZyENuUlyOIIfnk9r5HmcsfWrmcb9Va/Ko+zXHgtHlx
         j+4EynFLx+7Y7i9lltikOf4tzUQxMzRH5uWGSwkHgbh8zmwJ78xcgDcCbWlw6e7RjCi/
         6iBVker4KatDjOSVukGqy5/wWFan7DzsK7nH4Pe7iLU4qZ6xhkzVqlTHHBxrgwBUCoc3
         uW1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769614000; x=1770218800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=;
        b=C2g4BvIZxS3GGkfLRuqmUi135rW8VNgO1ZOplSaEJanr5jOgg/j8iPKGN7svJEWmaJ
         EsPmXBZWeXztqeoqKvFbF1NPe/9cDK8yznF9DDepuWuMbh9OyMfUiqiuFDLYhc4HqAs2
         rkVJuBsB0GzKN/LRou1sPPwxQYg+LKhLj0uHa4vqQahTEY5vuCXkntnH2qp+ZsXFinIl
         574u2Y3rsCRxBj2UX4OrWz54iJSDXiQcTQaYTTnAxHvNYXsAyyIRvCGfyuUnzwd4Pu3E
         xkUHdNpqsczUOT8bpVPXpBC6d58OUxbpg8g4Pjs7fZwTNYjVMoHPJgm6+Jmm2UcH1DYn
         Grxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614000; x=1770218800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Dsm6BZo17gBRQFENmdqPMvpuqH/DjJGK39Lg1Meemg=;
        b=Z+G7f/8bLpNR/DKaR53GSK9zQtFvhJ2ubVfllNmDFB11P4e9DhdUFtQcapinWxCRXs
         pKy4ZOk8j5drjTLxhNcH+8JKQC7qkQWtICkz+tChlsiIyaqzYkButxQh50KWa8nqrIa8
         1LgtONXkIG7RDhTorQiRT1kaf8r3PfQt0y9JBbIy+j+yQgODBhy2WRnUYv6KX9msa/0r
         zxbj1kgpxqddGWYVix+LOYpo93kNDnky9V0Sg9u/QzTAnuqPVnGZk8JMOrL3LWCHNXNc
         vtELoOEMO6ncOVbiogjIhWvPaYq/FaJou/VHzEXgAb75hlkpmDMZHnWBnjrojtsdXzlN
         t7NA==
X-Forwarded-Encrypted: i=1; AJvYcCXlAcQmCzPj2K4I4mv/hVfbn0Rc1LWQnRRMEAa3YgSceDdvX/TkmxmqXRGssmpNbNH1EToKnTkW0C12Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YythMQdA7oCZwHIF7V4PPpYtzFkvq6xT4Gq598H72RP/y96G8Xa
	vTlInpKSLlCPd02v+KdZa/Hhb1r5Ejv83t+LMakkeGMeRj/daD2VdTE/8K0Ub/dD1BUvcov9ysm
	3JrldLg4WwwKAsOgFGN+1uW/HVIUcl/A5g9wSNHA+mg==
X-Gm-Gg: AZuq6aJ0JrrPd+k7P1EhKaRuHETI3SByc6+zSO+8sxY9MHbbbfHFG8XKw7otu3ANNeh
	NpvOQ0S9nTmVP6lfRO35JotOv+FkTodzpvsZ6ABuncdFG97xJ7DJmaEnLH2a7pGOEDjUpwIzy/t
	8JovqmywCkPRkVoamjY8SflaGDBS3lxM0aUuRrPeUhF5tkIuz4iabYrMD7ITNAk65gyHNInRTVy
	Mapkfud12J15YM5TGaHyt3wBaGJViyYmZ/OJ+fPBBwlkaEVsb1Tm9T1jZwRKy1Gf36asNiP4Ceg
	X0dZG4GCfHB3JaLn3Til5Vu90HbyvTP+50cdVXuYHfWy
X-Received: by 2002:a05:690c:102:b0:794:26a9:f9c3 with SMTP id
 00721157ae682-7947acaa3d3mr43960177b3.63.1769613999909; Wed, 28 Jan 2026
 07:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com> <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
In-Reply-To: <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 28 Jan 2026 23:26:28 +0800
X-Gm-Features: AZwV_QgomjxoBBbY7bdQOSeCA_WHXLS0jMtYpjhysR3Ljanlh3cbjMNBBXCdn70
Message-ID: <CAH1PCMYWFhR-Np0-yq40eWqJbTmFub4qop6Wq2gA2mUqbJrtdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK
 and LDO regulators
To: Alex Elder <elder@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_152642_994199_8BD1122B 
X-CRM114-Status: GOOD (  31.12  )
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

SGksIEFsZXgKCk9uIFdlZCwgSmFuIDI4LCAyMDI2IGF0IDk6MjjigK9QTSBBbGV4IEVsZGVyIDxl
bGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgo+Cj4gT24gMS8yMy8yNiA2OjIwIFBNLCBHdW9kb25n
IFh1IHdyb3RlOgo+ID4gSGlnaGVyIHZvbHRhZ2Ugc2V0dGluZ3Mgd2VyZSB1bnVzYWJsZSBkdWUg
dG8gaW5jb3JyZWN0IG5fdm9sdGFnZXMgdmFsdWVzCj4gPiBjYXVzaW5nIHJlZ2lzdHJhdGlvbiBm
YWlsdXJlcy4gRm9yIGV4YW1wbGUsIHNldHRpbmcgYWxkbzQgdG8gMy4zViBmYWlsZWQKPiA+IHdp
dGggLUVJTlZBTCBiZWNhdXNlIHRoZSByZXF1aXJlZCBzZWxlY3RvciAoMTIzKSBleGNlZWRlZCB0
aGUgYWxsb3dlZAo+ID4gcmFuZ2UgKG5fdm9sdGFnZXM9MTE3KS4KPiA+Cj4gPiBGaXggYnkgYWxp
Z25pbmcgbl92b2x0YWdlcyB3aXRoIHRoZSBoYXJkd2FyZSByZWdpc3RlciB3aWR0aHMgcGVyIHRo
ZSBQMQo+ID4gZGF0YXNoZWV0IFsxXToKPiA+IC0gQlVDSzogMjU1ICh3YXMgMjU0KSwgYWxsb3dz
IHNlbGVjdG9ycyAwLTI1NCwgc2VsZWN0b3IgMjU1IGlzIHJlc2VydmVkCj4gPiAtIExETzogMTI4
ICh3YXMgMTE3KSwgYWxsb3dzIHNlbGVjdG9ycyAwLTEyNywgc2VsZWN0b3JzIDAtMTAgYXJlIGZv
cgo+ID4gICAgc3VzcGVuZCBtb2RlLCB2YWxpZCBvcGVyYXRpb25hbCByYW5nZSBpcyAxMS0xMjcK
PiA+Cj4gPiBUaGlzIGVuYWJsZXMgdGhlIGZ1bGwgdm9sdGFnZSByYW5nZSBzdXBwb3J0ZWQgYnkg
dGhlIGhhcmR3YXJlLgo+ID4KPiA+IEZpeGVzOiA4Yjg0ZDcxMmFkODQgKCJyZWd1bGF0b3I6IHNw
YWNlbWl0OiBzdXBwb3J0IFNwYWNlbWlUIFAxIHJlZ3VsYXRvcnMiKQo+ID4gTGluazogaHR0cHM6
Ly9kZXZlbG9wZXIuc3BhY2VtaXQuY29tL2RvY3VtZW50YXRpb24gWzFdCj4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gdjI6IE5v
IGNoYW5nZS4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3JlZ3VsYXRvci9zcGFjZW1pdC1wMS5jIHwg
NiArKystLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEu
YyBiL2RyaXZlcnMvcmVndWxhdG9yL3NwYWNlbWl0LXAxLmMKPiA+IGluZGV4IDJiZjkxMzdlMTJi
MS4uMmI1ODViYTAxYTkzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2Vt
aXQtcDEuYwo+ID4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYwo+ID4gQEAg
LTg3LDEzICs4NywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGxpbmVhcl9yYW5nZSBwMV9sZG9f
cmFuZ2VzW10gPSB7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAjZGVmaW5lIFAxX0JVQ0tfREVTQyhf
bikgXAo+ID4gLSAgICAgUDFfUkVHX0RFU0MoQlVDSywgYnVjaywgX24sICJ2aW4iLCAweDQ3LCBC
VUNLX01BU0ssIDI1NCwgcDFfYnVja19yYW5nZXMpCj4gPiArICAgICBQMV9SRUdfREVTQyhCVUNL
LCBidWNrLCBfbiwgInZpbiIsIDB4NDcsIEJVQ0tfTUFTSywgMjU1LCBwMV9idWNrX3JhbmdlcykK
Pgo+IFRoaXMgaXMgY29ycmVjdC4gIFRoZXJlIGFyZSAyNTUgcG9zc2libGUgcmFuZ2VzLCAwLi4y
NTQsIGFuZAo+IDI1NSBpcyBhbiBpbGxlZ2FsIHZhbHVlLgo+Cj4gSSB0aGluayB0aGlzIGJ1ZyBp
cyBhbiBhcnRpZmFjdCBvZiBhIGNoYW5nZSBJIG1hZGUgd2hpbGUKPiBjaGFzaW5nIGFuIGlzc3Vl
IGR1cmluZyBkZXZlbG9wbWVudCwgYW5kIEkgbmVnbGVjdGVkIHRvCj4gY2hhbmdlIGl0IGJhY2su
Cj4KPiBUZWNobmljYWxseSB0aGlzIGlzIGEgYnVnIGZpeCBidXQgaXQgZG9lc24ndCBtYXR0ZXIg
YmVjYXVzZQo+IHRoaXMgdm9sdGFnZSB2YWx1ZSAoMjU1IHJlcHJlc2VudHMgMy40NTAgdm9sdHMp
IHdhcyBub3QKPiByZXF1aXJlZC4KPgo+ID4gICAjZGVmaW5lIFAxX0FMRE9fREVTQyhfbikgXAo+
ID4gLSAgICAgUDFfUkVHX0RFU0MoQUxETywgYWxkbywgX24sICJ2aW4iLCAweDViLCBMRE9fTUFT
SywgMTE3LCBwMV9sZG9fcmFuZ2VzKQo+ID4gKyAgICAgUDFfUkVHX0RFU0MoQUxETywgYWxkbywg
X24sICJ2aW4iLCAweDViLCBMRE9fTUFTSywgMTI4LCBwMV9sZG9fcmFuZ2VzKQo+Cj4gSSB3b3Vs
ZCBzYXkgdGhpcyBpcyBub3QgY29ycmVjdC4KPgo+IFRoZSB2YWxpZCByYW5nZSBvZiB2YWx1ZXMg
aW4gdGhpcyByZWdpc3RlciBpcyAweGQtMHgxZiAoMTEtMTI3KSwKPiB3aGljaCBpcyAxMTcgdmFs
dWVzOyAweGQgcmVwcmVzZW50cyAwLjUwMFYgYW5kIDB4MWYgcmVwcmVzZW50cwo+IDMuNDAwVi4K
Pgo+IFRlY2huaWNhbGx5LCBhbGwgb3RoZXIgdmFsdWVzIHJlcHJlc2VudCAwLjV2IChhbmQgY291
bGQgdGhlcmVmb3JlCj4gYmUgY29uc2lkZXJlZCB2YWxpZCksIGJ1dCBJIGJlbGlldmUgdGhvc2Ug
c2hvdWxkIG5ldmVyIGJlIHVzZWQKPiBhbmQgaW50ZW50aW9uYWxseSBjb25zaWRlcmVkIHRoZW0g
aW52YWxpZC4gIElmIDAuNVYgaXMgZGVzaXJlZCwKPiAweGQgc2hvdWxkIGJlIHVzZWQuCj4KPiBE
byB5b3UgZGlzYWdyZWUgd2l0aCB0aGlzPwoKSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybiBhYm91
dCBzZWxlY3RvcnMgMC0xMC4gSG93ZXZlciwgbWF5YmUgeW91IG1pc3NlZAp0aGlzIHBhcnQ6CgpD
b2RlIHNuaXBwZXQgZnJvbSB0aGUgYyBmaWxlLCBMaW5lIDUzOgooVGhlIHAxX2J1Y2tfcmFuZ2Vz
IGFuZCBwMV9sZG9fcmFuZ2VzIGFyZSBkZWZpbmVkIGNvcnJlY3RseS4pCgovKiBTZWxlY3RvciB2
YWx1ZSAyNTUgY2FuIGJlIHVzZWQgdG8gZGlzYWJsZSB0aGUgYnVjayBjb252ZXJ0ZXIgb24gc2xl
ZXAgKi8Kc3RhdGljIGNvbnN0IHN0cnVjdCBsaW5lYXJfcmFuZ2UgcDFfYnVja19yYW5nZXNbXSA9
IHsKUkVHVUxBVE9SX0xJTkVBUl9SQU5HRSg1MDAwMDAsIDAsIDE3MCwgNTAwMCksClJFR1VMQVRP
Ul9MSU5FQVJfUkFOR0UoMTM3NTAwMCwgMTcxLCAyNTQsIDI1MDAwKSwKfTsKCi8qIFNlbGVjdG9y
IHZhbHVlIDAgY2FuIGJlIHVzZWQgZm9yIHN1c3BlbmQgKi8Kc3RhdGljIGNvbnN0IHN0cnVjdCBs
aW5lYXJfcmFuZ2UgcDFfbGRvX3Jhbmdlc1tdID0gewpSRUdVTEFUT1JfTElORUFSX1JBTkdFKDUw
MDAwMCwgMTEsIDEyNywgMjUwMDApLAp9OwoKLmxpbmVhcl9yYW5nZSwgdGhlIG51bWJlciBvZiB2
YWxpZCB2b2x0YWdlIHN0ZXBzIChzZWxlY3RvcnMgMTEtMTI3KQoubl92b2x0YWdlcyBmaWVsZCwg
d2hpY2ggZGVmaW5lcyB0aGUgc2VsZWN0b3IgbmFtZXNwYWNlICgwIHRvIDE3MCwgdGhlbiB0byAy
NTQpCgpXaXRoIG5fdm9sdGFnZXMgPSAxMTcsIHRoZSBtYXhpbXVtIGFjY2Vzc2libGUgc2VsZWN0
b3IgaXMgMTE2LiBUaGlzIG1ha2VzCnNlbGVjdG9ycyAxMTctMTI3IHVucmVhY2hhYmxlLCBldmVu
IHRob3VnaCB0aGV5J3JlIGRlZmluZWQgaW4gdGhlIGxpbmVhcl9yYW5nZS4KCm5fdm9sdGFnZXMg
PSAxMjggZG9lc24ndCBlbmFibGUgdGhvc2UgZm9yIG9wZXJhdGlvbmFsIHVzZSwgaXQganVzdCBh
bGxvd3MKdGhlIGZ1bGwgdmFsaWQgcmFuZ2UgKDExLTEyNykgdG8gYmUgYWNjZXNzaWJsZS4KClRo
aXMgaXMgd2h5IGluIG15IHRlc3QgZm9yIHRoZSBLMyBwaWNvIGJvYXJkLCBzZXR0aW5nIEFMRE8g
dG8gMy4zVgooc2VsZWN0b3IgMTIzKSBvciAzLjRWIChzZWxlY3RvciAxMjcpIGZhaWxzIHdpdGgg
dGhlIGN1cnJlbnQgY29kZS4KSSBtZWFuIHRoYXQgbGVhZHMgbWUgdG8gdGhpcyBidWcgZml4LgoK
QmVzdCByZWdhcmRzLApHdW9kb25nIFh1CgoKPiA+ICAgI2RlZmluZSBQMV9ETERPX0RFU0MoX24p
IFwKPiA+IC0gICAgIFAxX1JFR19ERVNDKERMRE8sIGRsZG8sIF9uLCAiYnVjazUiLCAweDY3LCBM
RE9fTUFTSywgMTE3LCBwMV9sZG9fcmFuZ2VzKQo+ID4gKyAgICAgUDFfUkVHX0RFU0MoRExETywg
ZGxkbywgX24sICJidWNrNSIsIDB4NjcsIExET19NQVNLLCAxMjgsIHAxX2xkb19yYW5nZXMpCj4g
Pgo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9kZXNjIHAxX3JlZ3VsYXRvcl9k
ZXNjW10gPSB7Cj4gPiAgICAgICBQMV9CVUNLX0RFU0MoMSksCj4gPgo+Cj4gSSBoYXZlIGV4YWN0
bHkgdGhlIHNhbWUgY29tbWVudCBhYm91dCB0aGlzIGNoYW5nZSB0byB0aGUKPiBudW1iZXIgb2Yg
c3VwcG9ydGVkIHZhbHVlcy4KPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
