Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB85D3F076
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VMqMg67l1RiRm2e5sN6/zqXCzk5xXuiX6AqlI0wC7M=; b=NMBBr18fqtLtZE
	JCTW1eo4XbqNrIzqv+BmmyvwbnKPRNFq7qe/rGgbgQnZ4HTJ3p/edwx38K1+ZZCxoo7GgmicykDmy
	ei/wNcUu8ZVQNjslRHegxaSvXkqDSNfGzWJHJ9uPXDaTGWCmZWClkSmJiPn9Ha921eWp0c+MeMSw8
	bKpauOw/FJx//WVEGsO64zBtPjihSi3hEx4XZct7hXH7kJ0xMDN01IuX84nzCxHWzPaPj5ZqA4VVI
	MAIpAGhlZ30lyJ62cLhNtCwvXbbDTqBz5QI/v5As0gkMJzZWtdY0anEp9+A3ayXo0KPYfTruoimtr
	UyaNtBm+3kxcjN09KCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6pC-0000000GCfe-1IXg;
	Wed, 28 Jan 2026 14:47:18 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6p7-0000000GCfB-2Xjx
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 14:47:15 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-78fc4425b6bso60431137b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 06:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769611632; cv=none;
        d=google.com; s=arc-20240605;
        b=B1OmYRi6mz4BNFuvJyzplUI1JQ+oVyzOvLxZEfFigx7YutTNCjEG4SAX+jJ12WLF8b
         NoiYAOevhEevyrarGW19IeUATXp2nkB3HaIeqYTV2r0IZpQBuuII+/DWD/0NKRxqYgmQ
         KImgu7YrslDsaKt1x+Ry2+4nMXmARCdmODkV5cfDel3std+wUZXcjt55sDraQH7m9hLT
         k46s+cuXqJi807J9FeQl3+KkzwNgWl/Q13kRfLFg60sqMBVnNVIlLf/gMosJQjaf2s7e
         dajz0vH2AiP8FU0dWC7C7N4wX/+B/FgU33ljX0TU09iahz/NuWApKXHKU1gkkikhllNN
         1nUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E6L9Umo/uP8ZQkG562utb1rtQO4EFo9vq+3Gr4Yf7Ak=;
        fh=Hx5VFfNrVlMeA8606M6cl3+s746HeK8cgto/D8zUJXU=;
        b=Qg9naa/jM2FiwFYD29VqLNvlNSbWayo5UEB7n4wOidlYrHE1TfV7O5NeP0gGPHCPJ5
         y0TBzsEYmrg6oqgDBWL7NQjcbtVh0Oz9gFoPno6goQMm+S2dF83oG5LSpkNW9RTGoV2h
         TMcLaxuAi54xB6RprLKSvctd0WbnDDVrj19XuIDfl1gWlRAjdysAhypTacaM5buj3tAq
         RHUfnLJnFpAD/A7kf6ZdZLZixeivvst5wXzI8Ar3OLCTyte1MigRVgYpN+MuItA9LVXm
         JVO11Bt3U7FcCmHaNBr/KuJOKFpqJo9F1r7hwh2Y1BkTbPwNGkptnAxejk/FPhcovOQU
         t25Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769611632; x=1770216432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6L9Umo/uP8ZQkG562utb1rtQO4EFo9vq+3Gr4Yf7Ak=;
        b=EtDHHY6yIcNCnyuPHHp4jGpOByJkgG0539fAwsK+NrNLi0pjo5jVuN2teoZv/H0VQY
         VxOuJXg2fP0/Da0RSuXqZv7OwYSga3fqSNgVJgrNfDi+JuCT3/NMU2Q3rtRAhGUuPTyR
         B3KaBCz3QA2hkx7dr1HJ2+zzYJ5iOEI/gHZGDA9pBchDP2ub7KzCCFiTlUElHTr+lqYL
         3ryKXVBYiDKL/Qe7hw73daDEgz5SCWoAVrjXPhvw4bJui1uou8NVq9DA+1pyHilDI22b
         X0ezimqsoyjhCbR2OvDbEKlgbdFFh+mWK46NXfvEoy9b+1KqRuqEYdZErX8wwgEd/Ey9
         weiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611632; x=1770216432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6L9Umo/uP8ZQkG562utb1rtQO4EFo9vq+3Gr4Yf7Ak=;
        b=g5OvFN+CS3RFDNZJOa5M8tODI+goPehFjm2i1jLlD0oZveQe8RLvDW3pw1hs98eO7d
         v4jDuruAqSpK3wGnE6FExl9rpoUd12QfY84KnMO7vbSqGXVCXrhqzSQ5EXdgwVztHuqB
         FY1bdZh+OAZo8bGkN1IiQRKCd8X+NxHOFXSAm5zPm+b2Nonoi48CvKLIe7rNAXoy0/o2
         HpnUUw3xoMIGOjGsRPBOxOgQiY8nFuTVTb4JfQ0Q/q6q0HOLjS6ZhzkGuI+gdKOQ/68i
         vRXThtC5Lh5JUmTBouM52YRftZBSOolxj2R3z9DqDAxxTsId9AWuDKHolQHKKrSdnSPG
         9D1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0DjlwuYOm+KhwE4XIE4Ywn95sD84KMDfcGHitlYD7KjvyOTDwjbZvLgSOHPnhEbahIYREZWN2WQ4E2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcqnSxgEFZ1/5/i9yyAaiVAxAvy+vKSVOSF9J4mYd9gsja7xJd
	8jbmSBxdkN2cubnoyw/vWVgKlXluslZDxLFFiRy3VetOArtNybc2E9vOW1MbTZ3+dRem1RUMWy0
	fG6Gp0YNOm0c46ILW6MBLncEJyzv+DIV/slsPI1RUYQ==
X-Gm-Gg: AZuq6aIiz8Jxkl0J558WqpgsQaeZq2B33RoFXPrClZZ6kwZuA94f/lT8qQJGRiPjlfZ
	B7yne5jAyz7jk31yGTvi3Psuis0pNV2Z5DsyWsNdIz5/FJi73w9mnAKK7hQT1ni+0jaQqN5dzaV
	z1LFodB6e9h7nLLssxyQieTRpgLhSPidxr+mrv1wdpTIRQXgGdWZdl9Hz1kKTR8NHN22SFFSTEV
	FjveNcUK3w9J5ZxS5hKbEXs10HsbKeVDUhPBKKilWTFVWkYFDymRRniI9Jj7pBuHU+CSr//P4Bm
	As0jsjA/zkz7gC9bvhwTEwX1HJBRp9x8KCs7k4hjar+s
X-Received: by 2002:a05:690c:a7dc:b0:794:1eee:608d with SMTP id
 00721157ae682-7947ac02895mr29873107b3.32.1769611631995; Wed, 28 Jan 2026
 06:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com> <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
In-Reply-To: <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 28 Jan 2026 22:47:00 +0800
X-Gm-Features: AZwV_Qgr9cFTrml5EGU3f-mMndB_n-GeOjeWwN7e29EUvpE6R5XaRFfNWtlDbRE
Message-ID: <CAH1PCMa_wxX_0YX0=3uMpKpE2FQ=COPafAL-tyJv3Y9kjdAujQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
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
X-CRM114-CacheID: sfid-20260128_064713_920470_B3BB81E2 
X-CRM114-Status: GOOD (  29.90  )
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

SGksIEFsZXgKCk9uIFdlZCwgSmFuIDI4LCAyMDI2IGF0IDk6MjnigK9QTSBBbGV4IEVsZGVyIDxl
bGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgo+Cj4gT24gMS8yMy8yNiA2OjIwIFBNLCBHdW9kb25n
IFh1IHdyb3RlOgo+ID4gVXBkYXRlIHN1cHBseSBuYW1lcyB0byBtYXRjaCB0aGUgUDEgUE1JQydz
IGFjdHVhbCBoYXJkd2FyZSBwaW5vdXQgd2hlcmUKPiA+IGVhY2ggYnVjayBoYXMgYW4gaW5kaXZp
ZHVhbCBWSU4gcGluICh2aW4xLXZpbjYpIGFuZCBMRE8gZ3JvdXBzIGhhdmUKPiA+IGRlZGljYXRl
ZCBpbnB1dCBwaW5zIChhbGRvaW4sIGRsZG9pbjEsIGRsZG9pbjIpLgo+ID4KPiA+IFRoZSBzdXBw
bHkgaXMgYSBib2FyZCBkZXNpZ24gZGVjaXNpb24gYW5kIHNob3VsZCBub3QgYmUgaGFyZGNvZGVk
IHRvIGFueQo+ID4gZXhpc3RpbmcgcG93ZXIgc291cmNlLiBUaGlzIGFsbG93cyBib2FyZHMgdG8g
c3BlY2lmeSB0aGVpciBhY3R1YWwgcG93ZXIKPiA+IHRyZWUgdG9wb2xvZ3kgaW4gZGV2aWNldHJl
ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNv
bT4KPgo+IFRoZXNlIGFyZSBnb29kIGNoYW5nZXMgYnV0IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gb24g
dGhlIHdheQo+IHlvdSBkZWZpbmUgdGhlIERMRE8gZGVzY3JpcHRvcnMuICBJIG1pZ2h0IGJlIG1p
c3Rha2VuIGJ1dAo+IEkgdGhpbmsgeW91IHNob3VsZCBtYWtlIHRoaXMgY2hhbmdlLgo+Cj4gQXNp
ZGUgZnJvbSB0aGF0Ogo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFy
LmNvbT4KPgo+ID4gLS0tCj4gPiB2MjogTm8gY2hhbmdlLgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
cmVndWxhdG9yL3NwYWNlbWl0LXAxLmMgfCAyNSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYyBiL2RyaXZl
cnMvcmVndWxhdG9yL3NwYWNlbWl0LXAxLmMKPiA+IGluZGV4IDJiNTg1YmEwMWE5My4uNTdlNmUw
MGE3M2ZhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYwo+
ID4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYwo+ID4gQEAgLTg3LDEzICs4
NywxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGxpbmVhcl9yYW5nZSBwMV9sZG9fcmFuZ2VzW10g
PSB7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAjZGVmaW5lIFAxX0JVQ0tfREVTQyhfbikgXAo+ID4g
LSAgICAgUDFfUkVHX0RFU0MoQlVDSywgYnVjaywgX24sICJ2aW4iLCAweDQ3LCBCVUNLX01BU0ss
IDI1NSwgcDFfYnVja19yYW5nZXMpCj4gPiArICAgICBQMV9SRUdfREVTQyhCVUNLLCBidWNrLCBf
biwgInZpbiIgI19uLCAweDQ3LCBCVUNLX01BU0ssIDI1NSwgcDFfYnVja19yYW5nZXMpCj4KPiBU
aGF0IHdhcyBhIHNpbXBsZSBjaGFuZ2UuLi4KPgo+ID4gICAjZGVmaW5lIFAxX0FMRE9fREVTQyhf
bikgXAo+ID4gLSAgICAgUDFfUkVHX0RFU0MoQUxETywgYWxkbywgX24sICJ2aW4iLCAweDViLCBM
RE9fTUFTSywgMTI4LCBwMV9sZG9fcmFuZ2VzKQo+ID4gKyAgICAgUDFfUkVHX0RFU0MoQUxETywg
YWxkbywgX24sICJhbGRvaW4iLCAweDViLCBMRE9fTUFTSywgMTI4LCBwMV9sZG9fcmFuZ2VzKQo+
Cj4gQXMgc3RhdGVkIGJlZm9yZSwgSSBiZWxpZXZlIHRoZSAxMjggc2hvdWxkIGJlIDExNyBoZXJl
LiAgKElmCgpJIHdpbGwgZXhwbGFpbiB0aGlzIGluIGFub3RoZXIgZW1haWwuCgo+IHlvdSBjaGFu
Z2UgdGhlIGVhcmxpZXIgcGF0Y2gsIG1ha2Ugc3VyZSB0aGUgY2hhbmdlIHRvIDEyOAo+IGRvZXNu
J3QgcGVyc2lzdCBoZXJlLikgIFNhbWUgY29tbWVudCBmb3IgdGhlIERMRE8gcmVndWxhdG9ycy4K
Pgo+ID4gLSNkZWZpbmUgUDFfRExET19ERVNDKF9uKSBcCj4gPiAtICAgICBQMV9SRUdfREVTQyhE
TERPLCBkbGRvLCBfbiwgImJ1Y2s1IiwgMHg2NywgTERPX01BU0ssIDEyOCwgcDFfbGRvX3Jhbmdl
cykKPiA+ICsjZGVmaW5lIFAxX0RMRE8xX0RFU0MoX24pIFwKPiA+ICsgICAgIFAxX1JFR19ERVND
KERMRE8sIGRsZG8sIF9uLCAiZGxkb2luMSIsIDB4NjcsIExET19NQVNLLCAxMjgsIHAxX2xkb19y
YW5nZXMpCj4KPiBXaHkgY2FuJ3QgeW91IHVzZSBfbiBoZXJlIGxpa2UgeW91IGRpZCBmb3IgUDFf
QlVDS19ERVNDKCkgYWJvdmU/CgpUaGUgbmFtaW5nIGZvbGxvd3MgdGhlIFAxIHBpbm91dCBkZWZp
bml0aW9ucyBpbiB0aGUgZGF0YXNoZWV0IFsxXS4KClVubGlrZSB0aGUgQlVDSyByZWd1bGF0b3Jz
LCB3aGljaCBoYXZlIGluZGl2aWR1YWwgaW5wdXQgcGlucyAoZS5nLiwKVklOMyBmb3IgQlVDSzMp
LCB0aGUgRExET3Mgc2hhcmUgcG93ZXIgaW5wdXRzLiBGb3IgZXhhbXBsZSwgRExET0lOMSAocGlu
IDE3KQpwb3dlcnMgRExETzEgdGhyb3VnaCBETERPNC4gRExET0lOMiBwcm92aWRlcyBwb3dlciB0
byBETERPNSwgNiBhbmQgNy4KClNpbmNlIHRoZXJlIGFyZSBubyBwaHlzaWNhbCBwaW5zIG5hbWVk
IGRsZG9pbjMsIGV0Yy4sIEkgY2FuJ3QgdXNlIHRoZSBfbiBpbmRleApmb3IgdGhlIHN1cHBseSBu
YW1lIGFyZ3VtZW50IGxpa2UgSSBkaWQgZm9yIHRoZSBCVUNLcy4KCkRhdGFzaGVldCBwaW4gZXhh
bXBsZXM6CjggVklOMyBQV1IgQnVjazMgcG93ZXIgaW5wdXQgKDE6MSBtYXBwaW5nKQoxNyBETERP
SU4xIFBXUiBETERPMX40IHBvd2VyIGlucHV0ICgxOk1hbnkgbWFwcGluZykKCkxpbms6IGh0dHBz
Oi8vZGV2ZWxvcGVyLnNwYWNlbWl0LmNvbS9kb2N1bWVudGF0aW9uP3Rva2VuPVQxQnR3MkJkaWlT
bFNYa0FkaWJjb01ldG5hZwpbMV0KCkJlc3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKPgo+ID4gKwo+
ID4gKyNkZWZpbmUgUDFfRExETzJfREVTQyhfbikgXAo+ID4gKyAgICAgUDFfUkVHX0RFU0MoRExE
TywgZGxkbywgX24sICJkbGRvaW4yIiwgMHg2NywgTERPX01BU0ssIDEyOCwgcDFfbGRvX3Jhbmdl
cykKPgo+IFNvIHRoaXMgaXMgZ2VuZXJhbGl6aW5nIHRoZSBpbnB1dCwgd2hpY2ggaXMgZ29vZC4g
IFRoZSB1c2UKPiBvZiAiYnVjazUiIGhlcmUgd2FzIGEgQmFuYW5hIFBpIEJQSS1GMyBkZXNpZ24g
YW5kIGJ1dCBpdAo+IGRvZXNuJ3QgaGF2ZSB0byBiZSB0aGF0IHdheS4KPgo+ID4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9kZXNjIHAxX3JlZ3VsYXRvcl9kZXNjW10gPSB7Cj4gPiAg
ICAgICBQMV9CVUNLX0RFU0MoMSksCj4gPiBAQCAtMTA4LDEzICsxMTEsMTMgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCByZWd1bGF0b3JfZGVzYyBwMV9yZWd1bGF0b3JfZGVzY1tdID0gewo+ID4gICAg
ICAgUDFfQUxET19ERVNDKDMpLAo+ID4gICAgICAgUDFfQUxET19ERVNDKDQpLAo+ID4KPiA+IC0g
ICAgIFAxX0RMRE9fREVTQygxKSwKPiA+IC0gICAgIFAxX0RMRE9fREVTQygyKSwKPiA+IC0gICAg
IFAxX0RMRE9fREVTQygzKSwKPiA+IC0gICAgIFAxX0RMRE9fREVTQyg0KSwKPiA+IC0gICAgIFAx
X0RMRE9fREVTQyg1KSwKPiA+IC0gICAgIFAxX0RMRE9fREVTQyg2KSwKPiA+IC0gICAgIFAxX0RM
RE9fREVTQyg3KSwKPiA+ICsgICAgIFAxX0RMRE8xX0RFU0MoMSksCj4gPiArICAgICBQMV9ETERP
MV9ERVNDKDIpLAo+ID4gKyAgICAgUDFfRExETzFfREVTQygzKSwKPiA+ICsgICAgIFAxX0RMRE8x
X0RFU0MoNCksCj4gPiArICAgICBQMV9ETERPMl9ERVNDKDUpLAo+ID4gKyAgICAgUDFfRExETzJf
REVTQyg2KSwKPiA+ICsgICAgIFAxX0RMRE8yX0RFU0MoNyksCj4gPiAgIH07Cj4gPgo+ID4gICBz
dGF0aWMgaW50IHAxX3JlZ3VsYXRvcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
