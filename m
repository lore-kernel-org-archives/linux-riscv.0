Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15666C624B4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lWraAbfu7sWwl/PRBfguvLul4R+1/ymJvOVBZjn0Po=; b=RtkMfMdAkhkiOn
	6hBvBwOji0TdB/BEf4DyZrvppg4kwmPy7l0/1zvNwa40aB4J/CRs8uJX3nwgAIIzwev6MViXjN4NW
	ebl3ag9AFhtVuc00sfYDYIk18N6/Se3B/lZoH5hXUWMkAG81DdhYPfAjRkmXbJIfqn3XAwT/DFjPi
	XMyL/MABmQdFEIJp1E8u1ueTp/xWiaJNPtXZ7PRH1kuyeggR1vu/vN2VyDTfT2ynAacXYHgqaf33A
	BOqixCSNqXWOCP8bPfkwwWni4kClLKl0ysaXrFZ0KlV+TwxRsiOu+kb7XfNtaAE5SzVu93pHj6qcH
	BdeEtccpyzv0xskubRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r68Op-004jD3-1m;
	Thu, 23 Nov 2023 12:01:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r68Om-004jCA-1J;
	Thu, 23 Nov 2023 12:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9614162056;
	Thu, 23 Nov 2023 12:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1589C43391;
	Thu, 23 Nov 2023 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700740894;
	bh=O0KmdSGxCuQhaLjAepXLnzFblGpCjlLbqUPX4wb97x0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kS1okNpzujNNw/x/VQUygpXQNKyT7qe3NWEy9iSrouVQ6TUCTn6VfC14Txvw++BVV
	 iP8JUYYi2LufvwJjHcJ18sn0TUSo+HCxS+TcMGn1DwamM80Fd1CUi+OdYJIb7rS/m2
	 MTtmBPoDEZRVZJyo/v+luSJdHaPmasoHDTDlOYmfroEoKkGD5EbEJw/Het6UV+/41Y
	 OKzJasOj0E1bo4jrK6Pv7dwiFXmOxZzrcPxGYhFIpJLUzQNwW+E9k+ncUxqWog/Plh
	 FiLM5FdWXnNolHuf1g1sqTtJzrSUgUUwj5/lKX6Lt6rMEJqrbM2BNXczL877bCqro/
	 ZXM2hl3SRRaLQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1efb9571b13so474747fac.2;
        Thu, 23 Nov 2023 04:01:34 -0800 (PST)
X-Gm-Message-State: AOJu0Yw30B1vbaB2Zg/7aILDDWLWOPom9N2rQ9vXZsBrMb+dO8X94m+u
	+GPuPiUzNmGjYmapcVbNxAKNNEWD2Zwvf6OlrKo=
X-Google-Smtp-Source: AGHT+IFPWqcWm1vj9d+/mSuXvSBN4xPQg2Cs74iia34uCpa531SKpvW8e3BZggfqXVk4Lz+CoMinflKiObT0Xe10rJE=
X-Received: by 2002:a05:6870:f78b:b0:1f9:34b3:7ae9 with SMTP id
 fs11-20020a056870f78b00b001f934b37ae9mr7617512oab.17.1700740894160; Thu, 23
 Nov 2023 04:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
 <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com> <20231123-deviator-camisole-645715ad02e9@wendy>
In-Reply-To: <20231123-deviator-camisole-645715ad02e9@wendy>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Nov 2023 21:00:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6e9=RtCJYSof8NwOD2npoKNRN-Fo8GBLvYS0sz5DsqQ@mail.gmail.com>
Message-ID: <CAK7LNAQ6e9=RtCJYSof8NwOD2npoKNRN-Fo8GBLvYS0sz5DsqQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_040136_553057_FEB7C5C6 
X-CRM114-Status: GOOD (  25.68  )
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

T24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgNjo0NOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gWW8sCj4KPiBPbiBUaHUsIE5vdiAyMywgMjAy
MyBhdCAwNDozODozN1BNICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gPiBPbiBUaHUs
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
IFdlIGNhcnJ5IGEgY29weSBvZiB0aGUgZHRjIGluIHNjcmlwdHMvZHRjLCBzbyBJIHdvdWxkIGV4
cGVjdCB0aGF0IGJlZm9yZQo+IGFuIHVwZ3JhZGUgaXMgZG9uZSB0aGF0IHdvdWxkIGludHJvZHVj
ZSBuZXcgd2FybmluZ3Mgd2UgY2FuIGZpeCB0aGVtIGluCj4gdGhlIHJlbGV2YW50IHBsYXRmb3Jt
cy4KCgpJdCBtaWdodCBiZSBlYXN5IHRvIGZpeCB1cCBvbmx5IHJpc2N2IGFuZCBzYW1zdW5nIHBs
YXRmb3Jtcy4KCklmIG1vcmUgYW5kIG1vcmUgcGxhdGZvcm1zIGFkZCBLQlVJTERfRVhUUkFfV0FS
Tj0xIGluIHRoZWlyIE1ha2VmaWxlcywKaXQgd2lsbCBiZWNvbWUgaGFyZGVyIHRvIHNvcnQgdGhl
bSBvdXQgYmVmb3JlIGFkZGluZyBhIG5ldyB3YXJuaW5nIGZsYWcuCgoKVGhlIHN5bmMgb2Ygc2Ny
aXB0cy9kdGMgd2lsbCBiZSBkZWxheWVkIHVudGlsIHRoZW4sIG9yCnlvdSB3aWxsIGVuZCB1cCB3
aXRoIGRlbW90aW5nIHRoZW0gKGkuZS4gZGVsZXRlIEtCVUlMRF9FWFRSQV9XQVJOPTEpLgoKCgo+
IFBlcmhhcHMgSSBhbSBtaXN1bmRlcnN0YW5kaW5nIHNvbWV0aGluZyB0aGVyZSwKPiBidXQgSSdt
IHN1cmUgUm9iIGNhbiBjbGVhciBpdCB1cCBpZiBJIG1hZGUgYSBtaXN0YWtlLgo+Cj4gPiBMaW51
cyByZXF1aXJlcyBhIGNsZWFuIGJ1aWxkIChpLmUuIHplcm8gd2FybmluZykgd2hlbiBXPSBvcHRp
b24gaXMgbm90IGdpdmVuLgo+Cj4gRm9yIFJJU0MtViBhdCBsZWFzdCwgdGhlcmUgYXJlIGN1cnJl
bnRseSBubyBXPTEgd2FybmluZ3Mgd2hpbGUgYnVpbGRpbmcKPiB0aGUgZHRicyAoYmVjYXVzZSBJ
IHB1dCBlZmZvcnQgaW50byBmaXhpbmcgdGhlbSBhbGwpIGFuZCBJIHdvdWxkIGxpa2UgdG8KPiBr
ZWVwIGl0IHRoYXQgd2F5LCBzbyB0aGF0IHJlcXVpcmVtZW50IGlzIG5vdCBhIGNvbmNlcm4uCj4K
PiBDaGVlcnMsCj4gQ29ub3IuCj4KCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
