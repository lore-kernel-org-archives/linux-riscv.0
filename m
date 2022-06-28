Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947EFCCA479
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFp5idhCepZm9gt8gzuEgojvkWSflS0D2S/rWJq3yqc=; b=nOvC1y15i84ipW
	Hm34bvNdZ36L+4B1MEYxWpAuSQl4hX6Ni1COV/fAGvUrfeVVt7P4lkqueAPrJ4wgjRdn79E/MfWzh
	A6OpoMbeW9TPJukhz+TaHxtht8eMOIhPHg9u84i1olw1FfOLf+NOB37d4eD2aGi/LyPPBCt4P7vx5
	4lOpfO6676BNR0m6ErSFeTfp28/nTfpw0xsVxeIitBoFFdAVFXGPXv2+cN9OmbvGSxkJRDoVa6MXX
	P6Gx7YyNhyVb26QPcbi7ScOGXxIocoy6iG3aGS2JAp+1NpdY9gcV8vGbURc0MF0Jf3avLk7hxYDud
	NhXhWNbNPZvyMwN8C+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o664T-00565c-Ex; Tue, 28 Jun 2022 07:55:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o664P-00564N-KM
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 07:55:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8FA6BB81CCD
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 07:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197DCC341D0
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656402933;
	bh=IupijrcDgqt6dfkeSK5H+pNqJwXwR4adqvvRmmKP5sc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=paGx7XfbzxmoD6s8mMOY4mzGbS2u9WekunAOEYaz+9lezGJxV4BJ3ivCKJIMv12s2
	 sIG7TOcSHwTl/IhgC090IGhxSjQX/HvKsRipbz7GIQ9GSjYB4sn8dxAHNTr51LTY+I
	 6XUA2Mz0i/z4ZacC46QQM/aXopEgvL4qxGXimz5dD3/fcJe5BEpV04BkCr66vmARPG
	 KAnfMCt2Q0STLg6k6gG90Wp/xabYeF2/+odjNEUzZ+sE6wJivs4ej5VS8iU77M58dI
	 CXOTtjtKp9GtqzE/x+vzWb0PkcjWiiJEljuvb6/rVFvUVHrzi/upwI/dbFXHN7AfTv
	 rS+hYZCmVVUhg==
Received: by mail-vs1-f51.google.com with SMTP id j6so11299912vsi.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 00:55:33 -0700 (PDT)
X-Gm-Message-State: AJIora8M/1n5rRPDRtjWORhOEUYIZYtwN4Oss5DBYWFZlsLfwoUv4P1B
	K7Kodm/pshNFl4EYMXR8ga2cMN5D7FoXDWQzjhA=
X-Google-Smtp-Source: AGRyM1sZHbrnSo9VFN7K3myYkXRhM98Iy11cmoI8nqJ+4ldlVk/ZiXXwVXgC4FMCw2mOFBDVLbXR+0jMWfuApvm2ZAg=
X-Received: by 2002:a05:6102:f8b:b0:354:57e8:4c1b with SMTP id
 e11-20020a0561020f8b00b0035457e84c1bmr1315164vsv.8.1656402931955; Tue, 28 Jun
 2022 00:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220627051257.38543-1-samuel@sholland.org> <20220627051257.38543-2-samuel@sholland.org>
In-Reply-To: <20220627051257.38543-2-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 28 Jun 2022 15:55:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTuBagHb0SHZqFjUP9bryVs=AnOTF8z2pxqEfmX4g14zQ@mail.gmail.com>
Message-ID: <CAJF2gTTuBagHb0SHZqFjUP9bryVs=AnOTF8z2pxqEfmX4g14zQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: interrupt-controller: Require trigger
 type for T-HEAD PLIC
To: Samuel Holland <samuel@sholland.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_005537_993117_105786D8 
X-CRM114-Status: GOOD (  27.84  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gTW9uLCBKdW4gMjcs
IDIwMjIgYXQgMToxMyBQTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4gd3Jv
dGU6Cj4KPiBUaGUgUklTQy1WIFBMSUMgc3BlY2lmaWNhdGlvbiB1bmZvcnR1bmF0ZWx5IGFsbG93
cyBQTElDIGltcGxlbWVudGF0aW9ucwo+IHRvIGlnbm9yZSBlZGdlcyBzZWVuIHdoaWxlIGFuIGVk
Z2UtdHJpZ2dlcmVkIGludGVycnVwdCBpcyBiZWluZyBoYW5kbGVkOgo+Cj4gICBEZXBlbmRpbmcg
b24gdGhlIGRlc2lnbiBvZiB0aGUgZGV2aWNlIGFuZCB0aGUgaW50ZXJydXB0IGhhbmRsZXIsCj4g
ICBpbiBiZXR3ZWVuIHNlbmRpbmcgYW4gaW50ZXJydXB0IHJlcXVlc3QgYW5kIHJlY2VpdmluZyBu
b3RpY2Ugb2YgaXRzCj4gICBoYW5kbGVy4oCZcyBjb21wbGV0aW9uLCB0aGUgZ2F0ZXdheSBtaWdo
dCBlaXRoZXIgaWdub3JlIGFkZGl0aW9uYWwKPiAgIG1hdGNoaW5nIGVkZ2VzIG9yIGluY3JlbWVu
dCBhIGNvdW50ZXIgb2YgcGVuZGluZyBpbnRlcnJ1cHRzLgo+Cj4gRm9yIFBMSUNzIHdpdGggdGhh
dCBtaXNmZWF0dXJlLCBzb2Z0d2FyZSBuZWVkcyB0byBrbm93IHRoZSB0cmlnZ2VyIHR5cGUKPiBv
ZiBlYWNoIGludGVycnVwdC4gVGhpcyBhbGxvd3MgaXQgdG8gd29yayBhcm91bmQgdGhlIGlzc3Vl
IGJ5IGNvbXBsZXRpbmcKPiBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHRzIGJlZm9yZSBoYW5kbGlu
ZyB0aGVtLiBTdWNoIGEgd29ya2Fyb3VuZCBpcwo+IHJlcXVpcmVkIHRvIGF2b2lkIG1pc3Npbmcg
YW55IGVkZ2VzLgo+Cj4gVGhlIFQtSEVBRCBDOXh4IFBMSUMgaXMgYW4gZXhhbXBsZSBvZiBhIFBM
SUMgd2l0aCB0aGlzIGJlaGF2aW9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQg
PHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gLS0tCj4KPiAgLi4uL3NpZml2ZSxwbGljLTEuMC4wLnlh
bWwgICAgICAgICAgICAgICAgICAgIHwgMzEgKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
c2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCj4gaW5kZXggMjcw
OTJjNmE4NmM0Li4zYzU4OWNiY2E4NTEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlh
bWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IEBAIC0yNiw5ICsyNiwxMyBAQCBkZXNj
cmlwdGlvbjoKPiAgICB3aXRoIHByaW9yaXR5IGJlbG93IHRoaXMgdGhyZXNob2xkIHdpbGwgbm90
IGNhdXNlIHRoZSBQTElDIHRvIHJhaXNlIGl0cwo+ICAgIGludGVycnVwdCBsaW5lIGxlYWRpbmcg
dG8gdGhlIGNvbnRleHQuCj4KPiAtICBXaGlsZSB0aGUgUExJQyBzdXBwb3J0cyBib3RoIGVkZ2Ut
dHJpZ2dlcmVkIGFuZCBsZXZlbC10cmlnZ2VyZWQgaW50ZXJydXB0cywKPiAtICBpbnRlcnJ1cHQg
aGFuZGxlcnMgYXJlIG9ibGl2aW91cyB0byB0aGlzIGRpc3RpbmN0aW9uIGFuZCB0aGVyZWZvcmUg
aXQgaXMgbm90Cj4gLSAgc3BlY2lmaWVkIGluIHRoZSBQTElDIGRldmljZS10cmVlIGJpbmRpbmcu
Cj4gKyAgVGhlIFBMSUMgc3VwcG9ydHMgYm90aCBlZGdlLXRyaWdnZXJlZCBhbmQgbGV2ZWwtdHJp
Z2dlcmVkIGludGVycnVwdHMuIEZvcgo+ICsgIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdHMsIHRo
ZSBSSVNDLVYgUExJQyBzcGVjIGFsbG93cyB0d28gcmVzcG9uc2VzIHRvIGVkZ2VzCj4gKyAgc2Vl
biB3aGlsZSBhbiBpbnRlcnJ1cHQgaGFuZGxlciBpcyBhY3RpdmU7IHRoZSBQTElDIG1heSBlaXRo
ZXIgcXVldWUgdGhlbSBvcgo+ICsgIGlnbm9yZSB0aGVtLiBJbiB0aGUgZmlyc3QgY2FzZSwgaGFu
ZGxlcnMgYXJlIG9ibGl2aW91cyB0byB0aGUgdHJpZ2dlciB0eXBlLCBzbwo+ICsgIGl0IGlzIG5v
dCBpbmNsdWRlZCBpbiB0aGUgaW50ZXJydXB0IHNwZWNpZmllci4gSW4gdGhlIHNlY29uZCBjYXNl
LCBzb2Z0d2FyZQo+ICsgIG5lZWRzIHRvIGtub3cgdGhlIHRyaWdnZXIgdHlwZSwgc28gaXQgY2Fu
IHJlb3JkZXIgdGhlIGludGVycnVwdCBmbG93IHRvIGF2b2lkCj4gKyAgbWlzc2luZyBpbnRlcnJ1
cHRzLgo+Cj4gICAgV2hpbGUgdGhlIFJJU0MtViBJU0EgZG9lc24ndCBzcGVjaWZ5IGEgbWVtb3J5
IGxheW91dCBmb3IgdGhlIFBMSUMsIHRoZQo+ICAgICJzaWZpdmUscGxpYy0xLjAuMCIgZGV2aWNl
IGlzIGEgY29uY3JldGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIFBMSUMgdGhhdAo+IEBAIC02NSw3
ICs2OSw4IEBAIHByb3BlcnRpZXM6Cj4gICAgICBjb25zdDogMAo+Cj4gICAgJyNpbnRlcnJ1cHQt
Y2VsbHMnOgo+IC0gICAgY29uc3Q6IDEKPiArICAgIG1pbmltdW06IDEKPiArICAgIG1heGltdW06
IDIKPgo+ICAgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlCj4KPiBAQCAtOTEsNiArOTYsMjQg
QEAgcmVxdWlyZWQ6Cj4gICAgLSBpbnRlcnJ1cHRzLWV4dGVuZGVkCj4gICAgLSByaXNjdixuZGV2
Cj4KPiArYWxsT2Y6Cj4gKyAgLSBpZjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBj
b21wYXRpYmxlOgo+ICsgICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGVudW06Cj4g
KyAgICAgICAgICAgICAgLSB0aGVhZCxjOTAwLXBsaWMKPiArCj4gKyAgICB0aGVuOgo+ICsgICAg
ICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgICcjaW50ZXJydXB0LWNlbGxzJzoKPiArICAgICAgICAg
IGNvbnN0OiAyCj4gKwo+ICsgICAgZWxzZToKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAg
ICAnI2ludGVycnVwdC1jZWxscyc6Cj4gKyAgICAgICAgICBjb25zdDogMQo+ICsKPiAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4KPiAgZXhhbXBsZXM6Cj4gLS0KPiAyLjM1LjEKPgoKCi0t
IApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
