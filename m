Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8930BC76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLY+JQe9XBHc3KawA6OspXM+hV2HwMIaNgHNcHLPH3A=; b=N3hh7z2MDNL/FG
	4jCUUhmA+326XHqbfNiEzgW6MWlbBuejAI380Ij/PCOvnBq1N2wCbfQkjWoEYls5o8Nd8kj+/eKh2
	rkDcNSolV8xBKx+obQz8EGY/K2pR3voDjLa6wurplLroPUqID7TDWkpr6jVE193F9unuIdFcYcoCi
	znfSB8gpX2cY6hw0pnsT+VpDmeqz6WQvLmfMv8qPxxhxnt/SSC47M1P9cvVAkWVsEZ+CJW1Hh7E3s
	HKheT9If0pHeescptPOx1OoXeXjye1dO6Qgbj8mbN/sPNOBjJ4rTMwDeG1hJSjdr5FTSZWLfU8zaO
	5H7lPjJqcFSQxZDWnm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkeI-00A7ox-1z;
	Fri, 07 Apr 2023 11:52:58 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkeF-00A7nP-0V
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 11:52:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-946a769ae5cso161188766b.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680868373; x=1683460373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdsSI2dugb8QtnqVf27M40SpFkEimDgZgBLKngWDXtA=;
        b=eHsgTAiypcrDoToWF8gXeNKhzM4YibV2hdoLrWbc40xstbkqSMD2hqNE1gsmMjN3p4
         //6oW8ONGMISP8svpNGmoZx5P1ZtcrmQ3hG8y10TMyWYm8MlUNN2KXBNnRzDADBFNO7W
         a2GXJ8oaGTYSVlkRyi0UjC1Qg8gOn+ckfYsilet/eHZSkS7NKeeIt+2Xvgmw0N5xDedB
         Gr2y4Mqzsuc4KnvTWuo00UUGSxbzLNqsqVf2jmQhfsajOKYQqAEoOZ3OZmAat1kYXlBP
         bl7DwQ+RcnkCoO4WXQmtqho/DofhzTjuFQ3Mj9ggvkXsKoBJyNkhk9I0iXEi/RyiS9Cs
         MiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868373; x=1683460373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdsSI2dugb8QtnqVf27M40SpFkEimDgZgBLKngWDXtA=;
        b=q/4isFIbEsGyKEBdnNyjiQbGOMY8cLwrCigLV1Bobu9QV50ljonvXDFy9mi9w851aQ
         5zYGkwJJ0J/m9muBA80WeX93TRUfTAvOfoqLCwO9dxfknW2gJWx/OWDC3CtjvIZJ1cxq
         R+Cxq/FoQyMVzQ7jDxsSEM4sg+rvC6ChjRlOvCJwEvCPj1ymHVwJryW3Uoax/hFnhoPc
         f/+/l5pLlJK9kFkfhcY/JOV0Yzv7tRnyV1K/zBWA+JpTy8guf+y3Mh8zO60r2rWuKxxJ
         Rb7HMLezq0CN/V3PAjsZnMxU9Fj9ixfu3amxq877Yxz53KzmC2YyJAaLbQTiyK95q/on
         ztwA==
X-Gm-Message-State: AAQBX9cfnrkmVtZtJBxZIr/pcpEarsHpOIbkKBJiww+kFODJZZeYzm1t
	GlqxFXAqtnOkkXMrRQdX+0NF9lXyEB2uDuvZDVZRZA==
X-Google-Smtp-Source: AKy350bQHM5pLOO7YoLDGP8RS5GEUwvXo1V1aEdjTyr1nsOixOPcDpdxiLE0Wsb/9xEUqMtWYrfxFCjyAdAWx5Xhz8A=
X-Received: by 2002:a50:9f43:0:b0:4c0:71e6:9dc5 with SMTP id
 b61-20020a509f43000000b004c071e69dc5mr766168edf.1.1680868373537; Fri, 07 Apr
 2023 04:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230401112730.2105240-1-apatel@ventanamicro.com>
In-Reply-To: <20230401112730.2105240-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Apr 2023 17:22:42 +0530
Message-ID: <CAAhSdy1rFdCDOajCo+_07=S1n1LC-4ZdK1u1Bz4Zi5KxrcuHeQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow Zbb extension for Guest/VM
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_045255_245842_3A0EA1ED 
X-CRM114-Status: GOOD (  13.70  )
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

T24gU2F0LCBBcHIgMSwgMjAyMyBhdCA0OjU34oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2UgZXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBP
TkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBLVk0KPiB1c2VyIHNwYWNlIHRvIGRldGVjdCBhbmQg
ZW5hYmxlIFpiYiBleHRlbnNpb24gZm9yIEd1ZXN0L1ZNLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51
cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3Ig
TGludXgtNi40CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9rdm0uaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAy
ICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4gaW5kZXggZDhlYWQ1OTUyZWQ5Li40N2E3YzM5NTgyMjkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAgLTEwNiw2ICsxMDYsNyBAQCBlbnVtIEtWTV9S
SVNDVl9JU0FfRVhUX0lEIHsKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NWSU5WQUwsCj4g
ICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiAgICAgICAgIEtWTV9SSVND
Vl9JU0FfRVhUX1pJQ0JPTSwKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pCQiwKPiAgICAg
ICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCAzMTEyNjk3Y2Ix
MmQuLjAyYjQ5Y2I5NDU2MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBAQCAtNjEsNiArNjEsNyBAQCBzdGF0aWMgY29u
c3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9IHsKPiAgICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihTU1RDKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVklOVkFMKSwKPiAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpC
QiksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklISU5UUEFVU0UpLAo+ICAgICAgICAgS1ZN
X0lTQV9FWFRfQVJSKFpJQ0JPTSksCj4gIH07Cj4gQEAgLTk5LDYgKzEwMCw3IEBAIHN0YXRpYyBi
b29sIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQp
Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTVEM6Cj4gICAgICAgICBjYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1NWSU5WQUw6Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhU
X1pJSElOVFBBVVNFOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQkI6Cj4gICAg
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAg
ICAgICAgIGJyZWFrOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
