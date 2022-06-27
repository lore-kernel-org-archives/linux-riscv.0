Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5135C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqpoR8il8AFXYtnC6VKE09ifpg7tInZD5h+ne7p71yE=; b=xHYtc8mrG1f312
	4F8xVpEIyRH+6SQ1bAk6ivCT7LG+UYbppT8YBJUj7U+qHePxfVaz5LNd/hyzQlu2XWMr16n2/ycZ5
	8cD6EVDMe23vs2NnlaxLjB+liEkEtFMR5uppaiGder6OMvjFt7s5XlBOv0Lf2E+lOmuoPSlMRXXfB
	0F8XaPe42kVgulKkuMrqil7sm8FD1c/hY3gN13tGuZLI9W+ojnZfFbnBgaTzF5kqwWDNw6ubeur2R
	7ly1bT166Zieq1NkA9qFiPMmmJ2BrafSSCZJpJco7yjrssZidSewHCSaKKwi+PRn5ALas4144oHGX
	PeVlwi4k8xP+K47nWNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jMS-00GSnU-IA; Mon, 27 Jun 2022 07:40:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jMP-00GSlF-2V
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 07:40:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1F41B80F9E
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 07:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B0CC341D1
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656315637;
	bh=MzjeRwNuJsz8lcgalKEQ4uPa0idcPi8oD5nNWGIpJfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VaX5mrEEdE2Z9agLkU0695/N0Do+K7kF7EzotBofAEeAZi3H81+ru7iELCi7+CXud
	 I7sc6MspU0l3UFZ6WiWU8Owcp0WOSW2xzI9iypARvXToBYm/vVtpIyJWtiYf2Mru+y
	 FwkAxPjXWB1ui6WY2lNeo7CZ3yli2jfGTjOVhR2fZOuqt0nFgyNGNIJSQN3GQRxw1I
	 ieVGf6EXs6UgX1ltdxJsmBhvXeUoNUVbQoBIRCsTBqIpxYBI8cmysEiTKfFkrUqkmi
	 pVJXRRGBX2OAvkj97g2ROqu5HI59sS5ykPbmuohM1fFANHeS6HmQGfzQuqDm8gZvVu
	 A6I7kl8DIplEQ==
Received: by mail-vs1-f51.google.com with SMTP id d187so372862vsd.10
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 00:40:37 -0700 (PDT)
X-Gm-Message-State: AJIora/wGuSXTFQgxeHqvdYUP0m9IKrK0bfHRODga2SXmoqJWG3nXE4u
	mTbln7O/HpnzntHfMt2aCXF6iH7LtGADqPOmFqg=
X-Google-Smtp-Source: AGRyM1u9UMEKzaQ6qY0F+LTaZrCPsaY5ETieZQ4tBTTwNl2TC5aylcJ0FKqZSQCmSwgkYlER6Qj74Jpb2RbFugMABwo=
X-Received: by 2002:a05:6102:366f:b0:356:352f:9de2 with SMTP id
 bg15-20020a056102366f00b00356352f9de2mr2343073vsb.2.1656315636148; Mon, 27
 Jun 2022 00:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220627051257.38543-1-samuel@sholland.org> <20220627051257.38543-2-samuel@sholland.org>
In-Reply-To: <20220627051257.38543-2-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 Jun 2022 15:40:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSq1NsBWRCg+kpTbJRwSeE30P9NVB5di6vzi7m2CFRzHw@mail.gmail.com>
Message-ID: <CAJF2gTSq1NsBWRCg+kpTbJRwSeE30P9NVB5di6vzi7m2CFRzHw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220627_004041_460920_7021606A 
X-CRM114-Status: GOOD (  28.27  )
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

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMToxMyBQTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNo
b2xsYW5kLm9yZz4gd3JvdGU6Cj4KPiBUaGUgUklTQy1WIFBMSUMgc3BlY2lmaWNhdGlvbiB1bmZv
cnR1bmF0ZWx5IGFsbG93cyBQTElDIGltcGxlbWVudGF0aW9ucwo+IHRvIGlnbm9yZSBlZGdlcyBz
ZWVuIHdoaWxlIGFuIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdCBpcyBiZWluZyBoYW5kbGVkOgo+
Cj4gICBEZXBlbmRpbmcgb24gdGhlIGRlc2lnbiBvZiB0aGUgZGV2aWNlIGFuZCB0aGUgaW50ZXJy
dXB0IGhhbmRsZXIsCj4gICBpbiBiZXR3ZWVuIHNlbmRpbmcgYW4gaW50ZXJydXB0IHJlcXVlc3Qg
YW5kIHJlY2VpdmluZyBub3RpY2Ugb2YgaXRzCj4gICBoYW5kbGVy4oCZcyBjb21wbGV0aW9uLCB0
aGUgZ2F0ZXdheSBtaWdodCBlaXRoZXIgaWdub3JlIGFkZGl0aW9uYWwKPiAgIG1hdGNoaW5nIGVk
Z2VzIG9yIGluY3JlbWVudCBhIGNvdW50ZXIgb2YgcGVuZGluZyBpbnRlcnJ1cHRzLgo+Cj4gRm9y
IFBMSUNzIHdpdGggdGhhdCBtaXNmZWF0dXJlLCBzb2Z0d2FyZSBuZWVkcyB0byBrbm93IHRoZSB0
cmlnZ2VyIHR5cGUKPiBvZiBlYWNoIGludGVycnVwdC4gVGhpcyBhbGxvd3MgaXQgdG8gd29yayBh
cm91bmQgdGhlIGlzc3VlIGJ5IGNvbXBsZXRpbmcKPiBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHRz
IGJlZm9yZSBoYW5kbGluZyB0aGVtLiBTdWNoIGEgd29ya2Fyb3VuZCBpcwo+IHJlcXVpcmVkIHRv
IGF2b2lkIG1pc3NpbmcgYW55IGVkZ2VzLgo+Cj4gVGhlIFQtSEVBRCBDOXh4IFBMSUMgaXMgYW4g
ZXhhbXBsZSBvZiBhIFBMSUMgd2l0aCB0aGlzIGJlaGF2aW9yLgpBY3R1YWxseSwgQzl4eCBzdXBw
b3J0IHB1bHNlIHNpZ25hbHMgd2hpY2ggY29uZmlnZWQgYnkKcGFkX3BsaWNfaW50X2NmZ194IGZv
ciBTb0MgdmVuZG9yOgoKaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTA2L2Js
b2IvbWFpbi9DOTA2X1JUTF9GQUNUT1JZL2dlbl9ydGwvcGxpYy9ydGwvcGxpY19pbnRfa2lkLnYK
MTA0OiBhc3NpZ24gaW50X25ld19wZW5kaW5nID0gcGFkX3BsaWNfaW50X2NmZ194ID8gaW50X3B1
bHNlCjEwNToKICAgICAgICA6IGxldmVsX2ludF9wZW5kaW5nOwoKVGhleSBjb3VsZCBwdXQgcGFk
X3BsaWNfaW50X2NmZ194IGludG8gdGhlIFNvQyBzb2Z0d2FyZSBjb25maWcKcmVnaXN0ZXJzIHJl
Z2lvbiBvciBiaW5kIHRoZW0gdG8gY29uc3RhbnQgdmFsdWVzLgoKPgo+IFNpZ25lZC1vZmYtYnk6
IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+IC0tLQo+Cj4gIC4uLi9zaWZp
dmUscGxpYy0xLjAuMC55YW1sICAgICAgICAgICAgICAgICAgICB8IDMxICsrKysrKysrKysrKysr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAu
eWFtbAo+IGluZGV4IDI3MDkyYzZhODZjNC4uM2M1ODljYmNhODUxIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZp
dmUscGxpYy0xLjAuMC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiBAQCAtMjYs
OSArMjYsMTMgQEAgZGVzY3JpcHRpb246Cj4gICAgd2l0aCBwcmlvcml0eSBiZWxvdyB0aGlzIHRo
cmVzaG9sZCB3aWxsIG5vdCBjYXVzZSB0aGUgUExJQyB0byByYWlzZSBpdHMKPiAgICBpbnRlcnJ1
cHQgbGluZSBsZWFkaW5nIHRvIHRoZSBjb250ZXh0Lgo+Cj4gLSAgV2hpbGUgdGhlIFBMSUMgc3Vw
cG9ydHMgYm90aCBlZGdlLXRyaWdnZXJlZCBhbmQgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMs
Cj4gLSAgaW50ZXJydXB0IGhhbmRsZXJzIGFyZSBvYmxpdmlvdXMgdG8gdGhpcyBkaXN0aW5jdGlv
biBhbmQgdGhlcmVmb3JlIGl0IGlzIG5vdAo+IC0gIHNwZWNpZmllZCBpbiB0aGUgUExJQyBkZXZp
Y2UtdHJlZSBiaW5kaW5nLgo+ICsgIFRoZSBQTElDIHN1cHBvcnRzIGJvdGggZWRnZS10cmlnZ2Vy
ZWQgYW5kIGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1cHRzLiBGb3IKPiArICBlZGdlLXRyaWdnZXJl
ZCBpbnRlcnJ1cHRzLCB0aGUgUklTQy1WIFBMSUMgc3BlYyBhbGxvd3MgdHdvIHJlc3BvbnNlcyB0
byBlZGdlcwo+ICsgIHNlZW4gd2hpbGUgYW4gaW50ZXJydXB0IGhhbmRsZXIgaXMgYWN0aXZlOyB0
aGUgUExJQyBtYXkgZWl0aGVyIHF1ZXVlIHRoZW0gb3IKPiArICBpZ25vcmUgdGhlbS4gSW4gdGhl
IGZpcnN0IGNhc2UsIGhhbmRsZXJzIGFyZSBvYmxpdmlvdXMgdG8gdGhlIHRyaWdnZXIgdHlwZSwg
c28KPiArICBpdCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIGludGVycnVwdCBzcGVjaWZpZXIuIElu
IHRoZSBzZWNvbmQgY2FzZSwgc29mdHdhcmUKPiArICBuZWVkcyB0byBrbm93IHRoZSB0cmlnZ2Vy
IHR5cGUsIHNvIGl0IGNhbiByZW9yZGVyIHRoZSBpbnRlcnJ1cHQgZmxvdyB0byBhdm9pZAo+ICsg
IG1pc3NpbmcgaW50ZXJydXB0cy4KPgo+ICAgIFdoaWxlIHRoZSBSSVNDLVYgSVNBIGRvZXNuJ3Qg
c3BlY2lmeSBhIG1lbW9yeSBsYXlvdXQgZm9yIHRoZSBQTElDLCB0aGUKPiAgICAic2lmaXZlLHBs
aWMtMS4wLjAiIGRldmljZSBpcyBhIGNvbmNyZXRlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBQTElD
IHRoYXQKPiBAQCAtNjUsNyArNjksOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgY29uc3Q6IDAKPgo+
ICAgICcjaW50ZXJydXB0LWNlbGxzJzoKPiAtICAgIGNvbnN0OiAxCj4gKyAgICBtaW5pbXVtOiAx
Cj4gKyAgICBtYXhpbXVtOiAyCj4KPiAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQo+Cj4g
QEAgLTkxLDYgKzk2LDI0IEBAIHJlcXVpcmVkOgo+ICAgIC0gaW50ZXJydXB0cy1leHRlbmRlZAo+
ICAgIC0gcmlzY3YsbmRldgo+Cj4gK2FsbE9mOgo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRp
ZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAg
ICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gdGhlYWQsYzkwMC1wbGljCj4gKwo+ICsg
ICAgdGhlbjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICAnI2ludGVycnVwdC1jZWxs
cyc6Cj4gKyAgICAgICAgICBjb25zdDogMgo+ICsKPiArICAgIGVsc2U6Cj4gKyAgICAgIHByb3Bl
cnRpZXM6Cj4gKyAgICAgICAgJyNpbnRlcnJ1cHQtY2VsbHMnOgo+ICsgICAgICAgICAgY29uc3Q6
IDEKPiArCj4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Cj4gIGV4YW1wbGVzOgo+IC0t
Cj4gMi4zNS4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
