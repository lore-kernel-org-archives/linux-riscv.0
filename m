Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7CB1125856
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbcdcjoVukBszs88HjjM0RG6pQHw2mKqL+Gu5zzhACA=; b=aaJKU3peJgDG8h
	S93VGyXvVilSIXSaH1/AdmwPm5goVYsiymzvaVGUuzcBFG36IY5jXp5gBrN+0gtuYEgBZ48uwPpdt
	9jKD9RjWIr4LbgEJIq1zpqIczqTEE/qNJPJt4Di3I0RaMAjtKo3vkVFOk8/PI3KmKoc5RqXgZvCMP
	JRK4HvgTjjNeSquMbiBMqQ/9MVTQ3+OngY1qvQQ2NU/yLb+0Yjnai3I8/Fm4E5dVk8SLEuYqCp/Fq
	s8oHc7goMsaPX+gKjtS91dOfr7CUYEy+vJGGA3GNPqiDIi/4aawCBipm8qCwlYJ8O/bWBXWAN9+dq
	+SyJPzuKzfXzXYT5y7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NCT-0000000C1Jj-0SNg;
	Wed, 11 Mar 2026 17:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NCS-0000000C1JB-0U1t
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Mar 2026 17:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=; b=NOTx0hwPgonEZ8e2XN9HSkI1kd
	FNrJjq5jG88yytV4RlkX64d02XoZT0i/XFrtZzGCd9bgbKfh3UYZfeajkA9ahSCndnxp3AFtOoUsg
	XSIslY2HzBaSnbwe8rP2UaCLt5gXvWBJwhBpWonZV1D3UDkibVEh+dEu9hYegWirSiNIrbbuKqm2b
	KpFLRSPXnIw2s+Yh0YfaTjGfBuwrVccl7N9I/Lr4F2q39PnvMJLam8DgSU5lhvOcId0XTCtfANKHo
	RhPyhpoVsFREj/0t8XGfwMDMRMf0Qf52Ozc4PPMhq70aU9bYDCb1ga7qN2gru6VU5Dekr9JX1Id/4
	g2s3rXXQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NCN-0000000HOuR-2au7
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 17:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2867B4469E
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09843C2BCB2
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249496;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iI3/lJ1AQxBpOoKbjorbok0yM+cC5+ZfVtlCq8Wa75WAnPRUVxfTomE36pME1zAr7
	 r052TY9iZh0GoCqL2pamDmeFQJSjB2pwhuZY0PdNBAx3SrN2Wzw/lL0dQWtWJkjI9c
	 M2uaUbhYwnyiniJnKGa4WDW3lXldtWVxL5/qkk8VN9fA1kKRfUP3DZW7t+N4XIiPnr
	 r+c7hYYO3vf6H9EdlqOFqxu0kMl7CUhnoIKMWJ8pNfGLzvitoFUbQoAlOBtjzCJgAc
	 xmifdmJI6zK+T5101InfsaE8XXb3060UDCourC3gX1PEgUOWCxj+zVEN5sdEnAnJs9
	 zz0luOwBU3p3w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso1545181fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 10:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVj5lPrXe1pgSazro5P4eQeLegoH6L6UNAaL4sxitFSP+9jH5ReqPeF0PBkGwKby8XSGQjNRcynQDftcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjh8nr1ycFZKX1F78qSqf9AeaxtafoCI55QjLdt0hZDNCcwGI3
	5ot/eNj5h+D8CTXabkOBybpdHDlNluClbHzCqk8hAOtzIbR2e10oeS1yq+PeEKfhMN8EPayh5F3
	cckMTPpI3oG7Bk7cO8VqrSCSQxjr+XDlCYap69WGJrA==
X-Received: by 2002:a05:651c:1604:b0:38a:957:a125 with SMTP id
 38308e7fff4ca-38a67e1ba60mr11617111fa.18.1773249494042; Wed, 11 Mar 2026
 10:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com> <abGizL-uYnahlcEt@shell.armlinux.org.uk>
In-Reply-To: <abGizL-uYnahlcEt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 18:18:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
X-Gm-Features: AaiRm52Tw2Qo9qa62t56mCoewk4vwmQ4zN4g67WY5ySxyBb-ueDnRqCKEIOABSM
Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_171820_007726_78C1C73F 
X-CRM114-Status: GOOD (  16.75  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjoxNOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFdlZCwgTWFyIDExLCAyMDI2IGF0
IDA2OjAzOjM3UE0gKzAxMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+
ID4gSW4gb3JkZXIgdG8gZHJvcCB0aGUgZGVwZW5kZW5jeSBvbiBDT05GSUdfT0YsIGNvbnZlcnQg
YWxsIGRldmljZSBwcm9wZXJ0eQo+ID4gZ2V0dGVycyBmcm9tIE9GLXNwZWNpZmljIHRvIGdlbmVy
aWMgZGV2aWNlIHByb3BlcnRpZXMgYW5kIHN0b3AgcHVsbGluZwo+ID4gaW4gYW55IGxpbnV4L29m
Lmggc3ltYm9scy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBQ
bGVhc2UgcG9zdHBvbmUgdGhpcyBmb3IgdGhlIHRpbWUgYmVpbmcgLSBJJ20gdHJ5aW5nIHRvIGdl
dCBzdG1tYWMncwo+IHBhaW4taW4tdGhlLWFyc2UgUENTIHN1cHBvcnQgc29ydGVkLCBhbmQgSSd2
ZSBwYXRjaCBzZXJpZXMgb3V0IHRoZXJlCj4gYW5kIHBlbmRpbmcgdGhhdCBtYWtlIGEgbGFyZ2Ug
bnVtYmVyIG9mIGNoYW5nZXMgdG8gdGhpcyBkcml2ZXIuIFRoaXMKPiBpcyBsaWtlbHkgdG8gY29u
ZmxpY3Qgd2l0aCBteSB3b3JrLgo+Cj4gSSdtIGxpbWl0ZWQgYnkgdGhlIHJhdGUgYXQgd2hpY2gg
cGF0Y2hlcyBjYW4gYmUgYXBwbGllZCB0byBuZXQtbmV4dAo+IGFuZCB0aGUgcmF0ZSBhdCB3aGlj
aCBNb2hkIGNhbiBwcm92aWRlIG1lIGZlZWRiYWNrLiBPbiB0aGF0LCBJIG5vdGljZQo+IHlvdSBo
YXZlbid0IENjJ2QgTW9oZCB3aG8gaXMgbm93IGluIE1BSU5UQUlORVJTIGZvciBxY29tLWV0aHFv
cy4KPgoKRG8gdGhlc2UgdHdvIGNoYW5nZXNldHMgaW50ZXJhY3Qgd2l0aCBlYWNoIG90aGVyIGEg
bG90PyBEbyB5b3UgaGF2ZSBhCldJUCBicmFuY2ggSSBjb3VsZCB0YWtlIGEgbG9vayBhdD8gVGhp
cyBoYXMgYmVlbiBwb3N0LXBvbmVkIHNldmVyYWwKdGltZXMgYWxyZWFkeSwgdGhlcmUgYWx3YXlz
IHNlZW0gdG8gYmUgc29tZSBuZXcgY2hhbmdlcyBjb21pbmcgaW4uIDovCgpCYXJ0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
