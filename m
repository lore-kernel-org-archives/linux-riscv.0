Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5373C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGIJgcdcI9OK9GG8nXUw6JwFhFyj5BFtQbe1vBnG6pk=; b=XBb/x2hBGEPvBF
	pvvNc8tb1WWQ55+Aq/yLarcZaXdT0h/BuXCMeL5hWUY/ipNhkl3hHWyqo/33JL8K+GHuhEvKkmDhi
	z+LXFrLVjp38wN3YLviNleQZ9//ufo0HcI936z6jOCaTEV/siVPWwo2+xzZK7UoKyL07afX/SMF/4
	kOVdY2cb155TYqMVJNg4BbMvFeRWEZN3j3Q7HtDn39DRWIjsXYGirS1DXGcmSBhOizeWsvUCgSYJr
	LMwTjGysKi54ko8rIm/fx4E85UE4GberCFFvo3DYHgmr+BrSyOcuQ9OzvFFU+HaNhynmAWEkiFqwz
	BDJHYNWY/WY6643Ftu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wnw-005GQP-2S;
	Tue, 28 Nov 2023 12:03:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wns-005GNK-1y;
	Tue, 28 Nov 2023 12:03:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CC532B80188;
	Tue, 28 Nov 2023 12:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328E8C433CA;
	Tue, 28 Nov 2023 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701172978;
	bh=tkisRUNNY/d67zoz0XA6BZXue7+K+QjhY+cL0sK45N8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sv0moNEISqAvIRepmeldusBufgOdTcqt5uw7EgC03dJNooOu6yLd9UagBF49Pq5oV
	 nuxldMXUbHev2H7y9Z0bND2qTUshxyEHfw40PUMU5GRpmnlw3/lmIFw3bmo2oi4HKK
	 3nv7+VgALDGdeBGLMdVtFpfC/dwrXrZf5RrrvEiE3ppWMZaF7+2JP5BLcT2pu8gpqF
	 t9PImNSajJ3jx70BxXDGfAEBM0EIfnyjL66CugRoFldWEmOXJKI+gpDPfR9xQRfyMi
	 uwtuEm2YpH3wWALrbtqg9gCvW1smFJ0BXnCMtILNLb39eIl7Ts+y8liW6eDOuA0XUq
	 CiDCP3bAiiDbA==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1efabc436e4so3528620fac.1;
        Tue, 28 Nov 2023 04:02:58 -0800 (PST)
X-Gm-Message-State: AOJu0YxURZCxwXOFUZxZYTekBOiYjON+xCehPDsr/ihTuxGWoD/no1zd
	7rrSlbqBBc4j0mzMfiwyD/vTf6Lhy/cHPBQwr/o=
X-Google-Smtp-Source: AGHT+IEFDfYBlWh8jfejCGx1eDJyhRxoHb509GRWFdAaRY+qU5DbRfAMND1PnS9hMDUW0DhzFL5FYkPa7akv32zR/1E=
X-Received: by 2002:a05:6871:5824:b0:1fa:26b7:af18 with SMTP id
 oj36-20020a056871582400b001fa26b7af18mr12432388oac.17.1701172977577; Tue, 28
 Nov 2023 04:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
 <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com> <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 28 Nov 2023 21:02:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com>
Message-ID: <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Rob Herring <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_040300_926232_C76CFB93 
X-CRM114-Status: GOOD (  22.34  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMTE6MDPigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDE6MznigK9BTSBNYXNh
aGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IE5vdiAyMywgMjAyMyBhdCA3OjEy4oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBzZXQgdGhlIGR0
YyBleHRyYSB3YXJuaW5nIGxldmVsIG9uIGEgcGVyCj4gPiA+IGFyY2ggb3IgcGVyIHBsYXRmb3Jt
IChkaXJlY3RvcnkgcmVhbGx5KSBiYXNpcy4KPiA+ID4KPiA+ID4gVGhlIGZpcnN0IHZlcnNpb24g
b2YgdGhpcyB3YXMganVzdCBhIHNpbXBsZSBwZXIgZGlyZWN0b3J5IG92ZXJyaWRlIGZvcgo+ID4g
PiBTYW1zdW5nIHBsYXRmb3JtcywgYnV0IENvbm9yIGFza2VkIHRvIGJlIGFibGUgdG8gZG8gdGhp
cyBmb3IgYWxsIG9mCj4gPiA+IHJpc2N2Lgo+ID4gPgo+ID4gPiBGb3IgbWVyZ2luZywgZWl0aGVy
IEkgY2FuIHRha2UgdGhlIHdob2xlIHRoaW5nIG9yIHRoZSByaXNjdiBhbmQgc2Ftc3VuZwo+ID4g
PiBwYXRjaGVzIGNhbiBnbyB2aWEgdGhlaXIgbm9ybWFsIHRyZWVzLiBUaGUgYWRkZWQgdmFyaWFi
bGUgd2lsbCBoYXZlIG5vCj4gPiA+IGVmZmVjdCB1bnRpbCBtZXJnZWQgd2l0aCBwYXRjaCAyLgo+
ID4gPgo+ID4gPiB2MToKPiA+ID4gIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMx
MTE2MjExNzM5LjMyMjgyMzktMS1yb2JoQGtlcm5lbC5vcmcvCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4KPiA+Cj4g
PiBUaGVyZSB3ZXJlIHNvbWUgYXR0ZW1wdHMgaW4gdGhlIHBhc3QgdG8gZW5hYmxlIFc9MSBpbiBw
YXJ0aWN1bGFyIHN1YnN5c3RlbXMsCj4gPiBzbyBoZXJlIGlzIGEgc2ltaWxhciBjb21tZW50Lgo+
ID4KPiA+IEFkZGluZyBhIG5ldyB3YXJuaW5nIGZsYWcgdG8gVz0xIGlzIGFsd2F5cyBzYWZlIHdp
dGhvdXQgZG9pbmcgYW55IGNvbXBpbGUgdGVzdC4KPiA+Cj4gPiBXaXRoIHRoaXMgc2VyaWVzLCBp
dCB3b3VsZCBub3QgYmUgdHJ1ZSBhbnkgbW9yZSBiZWNhdXNlIGEgbmV3IHdhcm5pbmcgaW4gVz0x
Cj4gPiB3b3VsZCBwb3RlbnRpYWxseSBicmVhayByaXNjdi9zYW1zdW5nIHBsYXRmb3Jtcy4KPgo+
IFRoZSBkaWZmZXJlbmNlIGhlcmUgaXMgdGhlIHBlb3BsZSBwb3RlbnRpYWxseSBhZGRpbmcgd2Fy
bmluZ3MgYXJlIGFsc28KPiB0aGUgb25lcyBlbnN1cmluZyBubyB3YXJuaW5ncy4KPgo+ID4gTGlu
dXMgcmVxdWlyZXMgYSBjbGVhbiBidWlsZCAoaS5lLiB6ZXJvIHdhcm5pbmcpIHdoZW4gVz0gb3B0
aW9uIGlzIG5vdCBnaXZlbi4KPgo+IExpbnVzIGRvZXNuJ3QgYnVpbGQgYW55IG9mIHRoaXMgQUZB
SUNULiBXZSBhcmUgbm90IGFsd2F5cyB3YXJuaW5nIGZyZWUKPiBmb3IgVz0wIHdpdGggZHRicy4K
CgoKRG9lcyBpdCBtZWFuLCB5b3UgY2FuIGVuYWJsZSBhbGwgd2FybmluZ3MgYnkgZGVmYXVsdD8K
CgoKCgoKPgo+IFJvYgo+CgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
