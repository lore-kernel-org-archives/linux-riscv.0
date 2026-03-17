Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FAFFD8770
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHorwF3WbzWwWU5dODKHfNSckce39KnuIPSp75ZrcsM=; b=ogE55fu8fXhUWM
	4qS4D99QLBTtBpBU+Opzlav2vy/GROEsoicx/2wCUGVmO+Yhwf3pCOQ3WEYOvZLql0jC/ZdH4jsvZ
	hg7sEjfwbNypY0lhzxFWVgcYJ7Vbc8B/LREfP8Qr9j9IzLF0UuBIV4jKF6mExEh8LEwIHHUTYleqJ
	cdnLXgRd5oC42NKmYXT5Fem6jKqyi3WtSHa+E4o7STvjjGdhORv79wFXjADqdk3SGC5DCqaIzQjNa
	8yfZcTM4yKTjL2/P0r2wgLePVyzSq7963BcwBvjUxfBi6dlKFKJJ+S8WPF9J4+A3KZ97mKMRuahC1
	tO5Mv6Disx594KzM+TQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VAV-00000006XLh-1FAy;
	Tue, 17 Mar 2026 14:13:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VAS-00000006XKS-3YKS
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 14:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5DF24452E
	for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97B3C2BCB0
	for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756787;
	bh=9QDalKJYBUEDUJPFs8n5F17T6oCLIOfRdQADKKa+dtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tZAEscpa8SCC5cIZ2JquMfgXyJ2cYbjRRZovEZ4pp9iCwMtzoyZvoUvuYiYMbRTYC
	 SnQwovSWExy1qzNu8gKN2Re3kiqbZF6sZmkIooWlWa9EIx1ERfsbgtRs5rZB0SAIxf
	 3lPrGMQ4Ue2TuM4ia8nL9lBYQlDl9Z6+Gmi7Vne8vrfCzyTk9J2Ck3dsbBaTLAPSfD
	 NPCO+IQ8fm5HTfq9yr/wXF7f1MJldHxMFhyKqH3oTfoTSoTC0Dh5v2G2YRcDRDQgL5
	 ObXNTsitNLuKk+KvWrgZ9pPDroH39BoYVIyc5TZiwHYdHQ131NS6aY+w9jvXRnJOfo
	 pYQYSw8TEnjrw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38b13652c87so4371161fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 07:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUigP9qbTFjLuq42mXIM94LZ8wswLVX4ZMEJMLBnogSnUFQdDagQZZtE/cMbs3EMjpyc5GLv9jnCPzyvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZpPpYk2cn9UNFbLdHzljSmX3ztkbrDan3preamKJLpNBbPSQW
	bdkXTiTyKTfsI549NWxFdrENSuP4ABk/MLGdElPz3djoUcpov1QGPrwnq4Z+ZyPbacuc3uvyHcT
	eu0rpqW2QuvKUPhMIluHPQ0SmcD+2h/JM3B4Rb8LA8w==
X-Received: by 2002:a05:651c:2115:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-38a89666433mr58706271fa.6.1773756785569; Tue, 17 Mar 2026
 07:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com> <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
In-Reply-To: <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 15:12:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
X-Gm-Features: AaiRm52mh793CgOH9S8BNXU-tBYi1I-pfEq9XQjt50faEkjR5xH42aEvJgG19dM
Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Radu Rendec <rrendec@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071308_918480_06117FF8 
X-CRM114-Status: GOOD (  32.43  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNzozMeKAr1BNIFJhZHUgUmVuZGVjIDxycmVuZGVjQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMDI2LTAzLTE2IGF0IDEzOjA1ICswMTAwLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4gPgo+ID4gVGhlIERUUyBjaGFu
Z2VzIHdpbGwgZ28gaW4gc2VwYXJhdGVseS4KPgo+IEknbSBzZWVpbmcgc29tZSB3ZWlyZCBiZWhh
dmlvciB3aXRoIHRoaXMgdmVyc2lvbi4gVGhlIHByb2JlIHBhcnQgbG9va3MKPiBnb29kIChidXQg
c2VlIGJlbG93KSwgYnV0IHdoZW4gSSB0cnkgdG8gYnJpbmcgYW4gaW50ZXJmYWNlIHVwLCBpdCBm
YWlscwo+IHdpdGggRVRJTUVET1VULiBUaGUgcmVsZXZhbnQgcGFydCBvZiB0aGUgc3RhY2sgdHJh
Y2UgbGVhZGluZyB0byB0aGUKPiBlcnJvciBpcyB0aGlzOgo+Cj4gZHdtYWM0X2RtYV9yZXNldCsw
eDIwOC8weDIyMCBbc3RtbWFjXQo+IHN0bW1hY19yZXNldCsweDJjLzB4NjggW3N0bW1hY10KPiBz
dG1tYWNfaW5pdF9kbWFfZW5naW5lKzB4MTA4LzB4NDAwIFtzdG1tYWNdCj4gc3RtbWFjX2h3X3Nl
dHVwKzB4NWMvMHg1MzggW3N0bW1hY10KPiBfX3N0bW1hY19vcGVuKzB4YzgvMHgyYTAgW3N0bW1h
Y10KPiBzdG1tYWNfb3BlbisweGNjLzB4MjM4IFtzdG1tYWNdCj4gX19kZXZfb3BlbisweDEzOC8w
eDJhOAo+Cj4gTm93IGR3bWFjNF9kbWFfcmVzZXQoKSBpcyB2ZXJ5IHNpbXBsZS4gSXQgc2V0cyB0
aGUgc29mdCByZXNldCBiaXQgaW4KPiB0aGUgRE1BX0JVU19NT0RFIHJlZ2lzdGVyLCB0aGVuIHdh
aXRzIGZvciB0aGUgaGFyZHdhcmUgdG8gY2xlYXIgaXQsIGFuZAo+IHRoYXQgbmV2ZXIgaGFwcGVu
cy4KPgo+IE5vdywgZ2V0dGluZyBiYWNrIHRvIHRoZSBwcm9iZSBwYXJ0LCB0aGVyZSBpcyBvbmUg
ZXh0cmEgbWVzc2FnZQo+IChjb21wYXJlZCB0byBteSBwcmV2aW91cyBzdWNjZXNzZnVsIHRlc3Qg
b24gdjcpLCB3aGljaCBJIHNlZSBhdCB0aGUKPiB2ZXJ5IGVuZCBvZiB0aGUgcHJvYmluZzoKPgo+
ICAgcWNvbS1ldGhxb3MgMjMwNDAwMDAuZXRoZXJuZXQ6IGNsa19jc3IgdmFsdWUgb3V0IG9mIHJh
bmdlICgweGZmZmZmZjAwCj4gICBleGNlZWRzIG1hc2sgMHgwMDAwMGYwMCksIHRydW5jYXRpbmcK
Pgo+IFRoaXMgaXMgYSBzYTg3NzVwIHJpZGUgYm9hcmQsIHNvIHRoZXJlIGFyZSB0d28gc3RtbWFj
IGRldmljZXMuIEkgb25seQo+IHNlZSB0aGF0IG1lc3NhZ2UgZm9yIHRoZSAybmQgb25lLCB3aGlj
aCBpcyBhbHNvIHRoZSBvbmUgSSdtIHRyeWluZyB0bwo+IGVuYWJsZSwgYW5kIHdoaWNoIGZhaWxz
Lgo+Cj4gSSByZWFsaXplIHRoaXMgbWF5IG9yIG1heSBub3QgYmUgcmVsYXRlZCB0byB5b3VyIGNo
YW5nZXMuIEJ1dCB0aGVyZSBpcwo+IG5vIHdheSB0byB0ZXN0IG9uIGEgU0NNSS1wZCBib2FyZCB3
aXRob3V0IHRoZW0uIEknbSBub3Qgc3VyZSBob3cKPiByZWxldmFudCBpdCB3b3VsZCBiZSB0byB0
ZXN0IG9uIHRoZSBub24tU0NNSSB2YXJpYW50LiBJJ20gYXNzdW1pbmcgdGhlCj4gRE1BIHBhcnQg
c2hvdWxkIHdvcmsgdGhlIHNhbWUgd2F5IChyZWdhcmRsZXNzIG9mIFNDTUktcGQpLCBzbyBpZiBJ
IGNhbgo+IHJlcHJvZHVjZSBpdCB0aGVyZSwgYW5kIHNpbmNlIEkga25vdyBpdCB3b3JrcyBvbiBt
YWlubGluZSBMaW51eCAodGhhdCdzCj4gd2hlcmUgSSB0ZXN0ZWQgdjcpLCBJIGNvdWxkIGJpc2Vj
dCBhbmQgc2VlIHdoaWNoIGNvbW1pdCBpbiBuZXQtbmV4dAo+IGJyZWFrcyBpdC4gSWYgeW91IGRv
bid0IGhhdmUgYW55IGJldHRlciBpZGVhLCBsZXQgbWUga25vdyBhbmQgSSBjYW4KPiB0cnkuIE1l
YW53aGlsZSwgSSdsbCBrZWVwIHBva2luZyBhdCB2OS4KPgoKRG9lcyBjdXJyZW50IG5ldC1uZXh0
IG9uIGl0cyBvd24gc3RpbGwgd29yaz8gT3IgaXMgdGhlIHNlY29uZAppbnRlcmZhY2UgYnJva2Vu
IGV2ZW4gd2l0aG91dCB0aGlzIHNlcmllcz8KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
