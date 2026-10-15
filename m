Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E33CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N31TAuio4qxb4NgHqWlcr21jqRpGxFwUuAH5K+MHWD4=; b=yfycrfkAFxU7Uy
	/cTquxxPkBJGXdnLvYH6L6mfg9zgwvdGshB4An+1dNKLm1kWpePJqa9z10Q3mqiU2/wQJU4WARC4P
	FtNGRC8hp+j1i6c6cLo1gi/kJ1Zx+0akBg7HTicjySALrCpaQ9Qwu6ov/qfeBwaoFRyXeA66oXY4O
	BgW9MjJrtPM5N0lQ/1lOSgnPdb98NKjPq3YuPinc7hu3poWvR2X0lo8/8pbQHK7j5tZl79E50OAcq
	KpFPbwfDQjw4BIYeRufRN9vx6xrrJCdZEJ169w1gJgPfZ0veht5EBnFiMpLxEDQDfSchL67t3yGI8
	U59gWTqbGYJPp5jJk7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHKF-0000000HCsY-01WS;
	Thu, 15 Oct 2026 09:00:35 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHKC-0000000HCr7-1y9T
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 09:00:33 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1504390d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 02:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792054827; cv=none;
        d=google.com; s=arc-20260327;
        b=jYSkzWgb+7tmVECoHPZhRjqnG1cMUYYStnlv/9raAsarsdnBptbUsnMcHFDWKbgrmN
         VJX6ekMvpFqMRWRu9xyYi6/TwpvswxD0akaXhRc7OlH42s3VcE/UkWY16hTGz5ddOsnB
         xANZUqmw9FqfiyjbK9EUKRl7q9mKUnolfgFhlAD0d9ZmqwV+2DyZaHein5wt7R4iC3lo
         ipSn4WirDYut5GBeoeMBmNIGowOwuMHtm37+Bj2WEMXnkChl1U/FiQqsn0D97tXkZe8L
         c3HPbjUgaeQulWvtXBNOtBkHY7U1gTlfNC7CcqFQkGMToTIw7r8bX0ehjGg/jjp3ZqWY
         RPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        fh=F1UbRTDTuMx+fxGkv5cPxXqFZNAirP3pEGOAboXtUbI=;
        b=bvB8yJ74BEpsOQYHOQ0E+OUsdiuKq9XvZfNII/MYh7VbWZQG28GOIxwcmrWCc5KuGQ
         XZGZ2bywuuoZGSjCHZQAjS5bdAZxbRhdEb1XEY4HFkLhQVlAxsIrhwUmEON3RVugK5us
         muPYOrIjB6xQA3Rb+cyzXHnbx0fc565bT4kjovkReYuRmoCU51zbD02irqjGE0X3zBIA
         pvMMA8+LeFQJays1H0hS51jpRxSK5iaNPYchrSE6zA5A+qkSuReBrIycskha+B76ZBFy
         m73UlAAxaRHcEk4/nr9oto4iqN5zocai0PDX2Qo4pp+a/bZXO/2gFAtU5uFihjBNCipc
         JXMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792054827; x=1792659627; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        b=lUrWq00CEXpNQb7Y/jyPMFEXluKqklVVE06erlfq0yZTbwMnfnl2MwgKAuG+QkSsev
         SzryBikODMRpH/7ffaPDjhQje/nmOxg3i7uGv7jRjQk3NzrMILu4EuQc1ppHzLkFB9Jk
         OJJGNDvgLSW89Q6RN/76RtLY9oeZXzEuBikpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054827; x=1792659627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        b=1s3PXjYwFZSTnXWEB390zkJYVWEyMfdWvAdpA3Vhw0q9XMN4ffnGIUJfz4FMddOtbH
         8j3+lpM1TuexQr3AabqW1itGh3mf5ZjMRlEI0IdVfDddUOtxGU2LnUVACMj+yHV5yTyk
         C0CGbvMX4E8todfe6o52ZlRijXXBw9w2XOsIDnBGJj5T2OQB/7voMcEoNtZ/nBxH76yX
         idBczXxwjW8dWdzBdfOnPAWbPLxfOqw66fDBx1YOCsOFg33v9VRT1j7/SHwO/Y+Ka5Eb
         4z2igqXRzqiRuRM806NyJAMYGYTWDmZPCVvqS3wxId7aDwqgKXYVnOC48Mcx8rTvqJVD
         bzkg==
X-Forwarded-Encrypted: i=1; AKwUvBwWwqTDMHOwvOgEoXVmiyIJ2wE0ZJBC6/2BrPzSB9ie42Pm8+h+SozJVtzXkHo2xE9mCdOQi/4+VzazXQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKRBTuA645mCJuBo6MHzIvazUroERyMPejOTgF59lV/Z8rbAS+v
	9L0a1H4XpQoucNxVyDTolHOEJqjayxgnlTyRmTGyJ5hGMG+1o2LRF4PqRvSsun5Z/N6RchZxNxi
	c/jFLvXG6Ntwvz13BFuKS0cgPk2AQ0ENuaHGyO+0U
X-Gm-Gg: AYBFou0ZMIQyb2JolFTtUkr7S6u2BDrk7jUsNJKgUlnS7bRay3WPgo4dP82skTIGvaR
	+Wp5rC9ro8g0vv1YDsER7GqsyH1a73Qo+N5KCddP6uk+oz+TM2alobCeWjGNoefJgU+RfTGnZjj
	utSCvRORsUzehXYwEepNyYk+gcLK9aJMLa9lAiMxJaEW4ut6OXyrWm6/HGV1MaZAkseRemg8bxz
	6wUiP0HPYHMwUrezxIPu1n5FWdX5HHLLzKsYuwgJCf/a0jDGzGsGg5SOXCnPUVF/FQoolMFYBJo
	2BACcjMPi49jGHqgE/y7bkM88/QXsU45yJOykJdgRIMhIynDuXJd29Sqsx6DFaNHKP4=
X-Received: by 2002:a53:ac9e:0:b0:675:449d:3d74 with SMTP id
 956f58d0204a3-679362786a1mr5012542d50.92.1792054826173; Thu, 15 Oct 2026
 02:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
In-Reply-To: <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Oct 2026 18:00:14 +0900
X-Gm-Features: AclHuK909vzDVZhhmMGqz8RNS4kIz2k4tldUZDjIEfGnLkXIyAs5uz5oF7-pLmQ
Message-ID: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_020032_556966_7E537D96 
X-CRM114-Status: GOOD (  39.10  )
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

KENjLWVkIE1hdGhpYXMsIHRoZSB4SENJIGRyaXZlciBtYWludGFpbmVyIGluIGNhc2UgSSBtaXN1
bmRlcnN0b29kIHhIQ0kuKQoKT24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNDo0NOKAr1BNIE5laWwg
QXJtc3Ryb25nCjxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDEwLzE0
LzI2IDE4OjM2LCBLb25yYWQgRHliY2lvIHdyb3RlOgo+ID4gT24gMTAvMTQvMjYgMTE6NDQgQU0s
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4+IE9uIDEwLzE0LzI2IDExOjI5LCBDaGVuLVl1IFRz
YWkgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDU6MjjigK9QTSBOZWlsIEFy
bXN0cm9uZwo+ID4+PiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+
ID4+Pj4gT24gMTAvMTQvMjYgMTA6MjAsIENoZW4tWXUgVHNhaSB3cm90ZToKPiA+Pj4+PiBUaGUg
RFdDMyBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3QgbW9kZS4gSXQgZG9lcyBzbyB3aXRo
IGEgWEhDSQo+ID4+Pj4+IGNvbXBsaWFudCBob3N0IGNvbnRyb2xsZXIuIFRoZSBYSENJIGhhcyB0
d28gZG93bnN0cmVhbSBwb3J0cywgb25lIGZvcgo+ID4+Pj4+IEhTIGFuZCBvbmUgZm9yIFNTLiBV
U0IgZG93bnN0cmVhbSBwb3J0cyBzdGFydCBmcm9tIDEsIG5vdCAwLgo+ID4KPiA+IFsuLi5dCj4g
Pgo+ID4KPiA+Pj4gSU1ITyBoYXZpbmcgY29uc2lzdGVudCBudW1iZXJpbmcgYWNyb3NzIGNvbnRy
b2xsZXIgdHlwZXMgd291bGQgYmUKPiA+Pj4gYmV0dGVyLiBUaGlzIGF2b2lkcyBtYWtpbmcgdGhl
IFVTQiBjb3JlIGFuZCBodWIgY29kZSBkZWFsIHdpdGggbW9yZQo+ID4+PiBleGNlcHRpb25zLCBh
bmQgYWxzbyBlYXNpZXIgdG8gdW5kZXJzdGFuZCBhbmQgd3JpdGUgZGV2aWNlIHRyZWVzLgo+ID4+
Cj4gPj4gSSB3YXMgaW4gdGhlIGltcHJlc3Npb24gdGhlIHBvcnQgbnVtYmVyIG5vdCBuZWNlc3Nh
cmlseSByZWZsZWN0cwo+ID4+IGFuIGFjdHVhbCBwaHlzaWNhbCBudW1iZXJpbmcsIGFuZCBjYW4g
YmUgYSBsb2dpY2FsIG51bWJlciB3ZSB3b3VsZAo+ID4+IHRoZW4gbWFwIGluIHRoZSBrZXJuZWwu
Cj4gPj4KPiA+PiBJIGRvbid0IHNlZSBhbnkgaXNzdWUgaGVyZSBoYXZpbmcgYmFzZSAwIGZvciB0
aGUgYmluZGluZ3MgYW5kIHRoZW4KPiA+PiBjb252ZXJ0aW5nIGl0IHRvIGJhc2UgMSBmb3IgdGhl
IFhIQ0kgcG9ydCBudW1iZXJpbmcuCj4gPgo+ID4gSSB0aG91Z2h0IGJhc2UxIGNvbWVzIGZyb20g
dGhlIFVTQiBzcGVjIGFuZCBub3QganVzdCBYSENJPwo+Cj4gVGhpcyBpcyBteSBxdWVzdGlvbiwg
aXMgdGhlIHNwZWMgc2F5czogZWFjaCBVU0IgSG9zdCBDb250cm9sbGVyIHJvb3QKPiBwb3J0IHNo
YWxsIGJlIGNvbnNpZGVyZWQgYXMgYSBwb3J0IG9mIGEgSHViIGFuZCBudW1iZXJlZCB0aGUgc2Ft
ZSB3YXksCj4gdGhlbiBmaW5lLCBsZXQncyB1c2UgdGhlIGJhc2UxIG51bWJlcmluZy4KPgo+IEFz
IEkgdW5kZXJzdGFuZCBob3cgVVNCIGlzIGFyY2hpdGVjdHVyZWQsIGFsbCBkb3duc3RyZWFtIHBv
cnRzIG9mIEh1YnMKPiBhcmUgbnVtYmVyZWQgaW4gYmFzZTEsIGFuZCB0aGUgd2hvbGUgdG9wb2xv
Z3kgaXMgYmFzZWQgb24gdGhhdC4KPgo+IEJ1dCBoZXJlLCB3ZSBhcmUgc3BlYWtpbmcgb2YgcGh5
c2ljYWxseSBzZXBhcmF0ZSBVU0IgYnVzc2VzLCBvbmUKPiBVU0IyLjAgYW5kIG9uZSBVU0IzLjAs
IGEgY29udHJvbGxlciBjb3VsZCBhbHNvIGhhdmUgMTAgVVNCMi4wIHBvcnRzCj4gYW5kIDUgVVNC
My4wIHBvcnRzLCB3aG8ga25vd3MuIFRoZSB3YXkgdGhvc2Ugd2lsbCBiZSBudW1iZXJlZCBpcyBu
b3QKPiBwYXJ0IG9mIHRoZSBzcGVjaWZpY2F0aW9uIGJlY2F1c2UgdGhlIHNwZWNpZmljYXRpb24g
b25seSB0aGUgZGVmaW5lcwo+IHRoZSB0b3BvbG9neSBvZiBhbiBVU0IgYnVzLCBsaWtlIFBDSShl
KSBkZWZpbmVzIHRoZSB0b3BvbG9neSBvbiBhIFBDSShlKSBidXMuCgpObywgdGhlIFhIQ0kgc3Bl
YyBhY3R1YWxseSBzcGVjaWZpZXMgaG93IHRvIGlkZW50aWZ5IHRoZSBudW1iZXIgb2YgcG9ydHMK
YW5kIHdoaWNoIHBvcnQgc3VwcG9ydHMgd2hhdCB2ZXJzaW9uLiBTZWUgYmVsb3cuCgo+IEhvdyB3
ZSBhZ2dyZWdhdGUgYWxsIHRob3NlIGJ1c3NlcyB0byBhYnN0cmFjdCB0aGVtIHRvIHNvZnR3YXJl
IGlzIG5vdAo+IHBhcnQgb2YgdGhlIHNwZWMsIHdlIGNob3NlIHRvIGRlY2xhcmUgYSBmYWtlIHJv
b3QgSHViIHdpdGggYSBwaHlzaWNhbAo+IGRvd25zdHJlYW0gcG9ydCBhcyBhIHZpcnR1YWwgcG9y
dCBvZiB0aGUgcm9vdCBIdWIsIGZpbmUgYnV0IHRoaXMgaXMKPiBwdXJlbHkgc29mdHdhcmUgYWJz
dHJhY3Rpb24uCgpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBM
aW51eCBhbmQgdGhlIFhIQ0kgc3BlYywKdGhlIFhIQ0kgaGFyZHdhcmUgcmVnaXN0ZXJzIGdpdmUg
dGhlICJtYXhpbXVtIG51bWJlciBvZiBwb3J0cyIgaW4KSENTUEFSQU1TMS4gVGhlbiB0aGVyZSBp
cyBhdCBsZWFzdCAxICJ4SENJIFN1cHBvcnRlZCBQcm90b2NvbCBDYXBhYmlsaXR5IgplbnRyeSBp
biB0aGUgIkV4dGVuZGVkIGNhcGFiaWxpdGllcyIgc2VjdGlvbiB0aGF0IGRlc2NyaWJlcyBhIGdy
b3VwIG9mCnBvcnRzIChvZmZzZXQgYW5kIG51bWJlcikgYW5kIHRoZSBVU0IgcHJvdG9jb2wgc3Vw
cG9ydGVkIGJ5IHRoYXQgZ3JvdXAuCgpVc2luZyB0aGUgZXhhbXBsZSBnaXZlbiBieSB0aGUgWEhD
SSBzcGVjIG9uIHBhZ2UgMzMwIGFzIGZpZ3VyZSA0LTM1OgoKICAgIFhIQ0kgcG9ydCAxOiBIUyBv
biBwaHlzaWNhbCBwb3J0IDEKICAgIFhIQ0kgcG9ydCAyOiBIUyBvbiBwaHlzaWNhbCBwb3J0IDIK
ICAgIFhIQ0kgcG9ydCAzOiBIUyBvbiBwaHlzaWNhbCBwb3J0IDMKICAgIFhIQ0kgcG9ydCA0OiBI
UyBvbiBwaHlzaWNhbCBwb3J0IDQKICAgIFhIQ0kgcG9ydCA1OiBTUyBvbiBwaHlzaWNhbCBwb3J0
IDMKICAgIFhIQ0kgcG9ydCA2OiBTUyBvbiBwaHlzaWNhbCBwb3J0IDQKClRoZSBEVCB3b3VsZCBi
ZSBzb21ldGhpbmcgbGlrZToKCiAgICB4aGNpIHsKICAgICAgICBwb3J0cyB7CiAgICAgICAgICAg
IHBvcnRAMSB7IC8qIGdyYXBoIHRvIEhTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciAxICovIH07CiAg
ICAgICAgICAgIHBvcnRAMiB7IC8qIGdyYXBoIHRvIEhTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciAy
ICovIH07CiAgICAgICAgICAgIHBvcnRAMyB7IC8qIGdyYXBoIHRvIEhTIEVQIG9uIFVTQiBBIGNv
bm5lY3RvciAzICovIH07CiAgICAgICAgICAgIHBvcnRANCB7IC8qIGdyYXBoIHRvIEhTIEVQIG9u
IFVTQiBBIGNvbm5lY3RvciA0ICovIH07CiAgICAgICAgICAgIHBvcnRANSB7IC8qIGdyYXBoIHRv
IFNTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciAzICovIH07CiAgICAgICAgICAgIHBvcnRANiB7IC8q
IGdyYXBoIHRvIFNTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciA0ICovIH07CiAgICAgICAgfTsKICAg
IH07Cgo+IFdlIG1heSBvbmx5IHVzZSB0aGUgaGFyZHdhcmUgSVAgcG9ydCBudW1iZXJpbmcgaW4g
dGhlIGJpbmRpbmdzLCBub3QKPiB0aGUgc29mdHdhcmUgYWJzdHJhY3Rpb24uCgpBbmQgd2UgYXJl
IHVzaW5nIGhhcmR3YXJlIHBvcnQgbnVtYmVyaW5nLiBJdCdzIGp1c3QgdGhlIG51bWJlcnMgdXNl
ZAphcmUgdGhlIHBoeXNpY2FsIHBvcnQgbnVtYmVycyBmcm9tIHRoZSBYSENJIHJlZ2lzdGVycywg
bm90IHRoZSBsb2dpY2FsCnBvcnQgbnVtYmVycyBvbiB0aGUgcm9vdCBodWJzLgoKSW4gZmFjdCwg
d2UgY291bGQgc2F5IHRoYXQgdGhlIHBvcnQgbnVtYmVycyBvbiB0aGUgcm9vdCBodWJzIGZvciBY
SENJCmFyZSBtYWRlIHVwLgoKPiBXZSBjb3VsZCB1c2UgdGhlIGJhc2UxIHRvIGRlc2NyaWJlIHRo
ZSBEV0MzIHBvcnRzLCBidXQgaG93IHRvIGRlc2NyaWJlCj4gYWxsIHRoZSBwaHlzaWNhbCBVU0Ig
YnVzc2VzIGEgY29udHJvbGxlciBjYW4gZXhwb3NlID8gV2UgbWF5IG5vdCBsaW1pdAo+IHRoZSBi
aW5kaW5ncyB0byBVU0IyLjAgYW5kIFVTQjMuMCBwb3J0cyBvbmx5LgoKVGVjaG5pY2FsbHksIHRo
ZXJlIGlzIG9uZSBidXMgZm9yIFVTQiAyLjAgYW5kIG9uZSBidXMgZm9yIFVTQiAzLjAuIEJ1dApj
dXJyZW50bHkgZm9yIFhIQ0kgaW4gRFQsIHdlIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSBwb3J0cyBk
aXJlY3RseSwKcmVnYXJkbGVzcyBvZiB0aGUgVVNCIHByb3RvY29sIHRoZXkgc3VwcG9ydC4KCkkg
ZG9uJ3Qga25vdyB3aHkgd2UgZG9uJ3QgZGVzY3JpYmUgdGhlIHJvb3QgaHViLCBidXQgbWF5YmUg
aXQncyBiZWNhdXNlCnByaW9yIHRvIFhIQ0kgdGhlIGNvbnRyb2xsZXIgYW5kIHJvb3QgaHViIHdl
cmUgdGhlIHNhbWUgZW50aXR5PyBFdmVuIGZvcgpYSENJLCB0aGUgcm9vdCBodWIgaXMgbW9yZSBv
ZiBhIGxvZ2ljYWwgZW50aXR5LgoKQW5kIEFGQUlDVCwgdGhlIGhhcmR3YXJlIHJlZ2lzdGVycyBk
b24ndCBkaXN0aW5ndWlzaCBiZXR3ZWVuIHBvcnRzIG9uIHRoZQpVU0IgMi4wIHJvb3QgaHViIHZz
IHRoZSBVU0IgMy4wIHJvb3QgaHViLiBUaGUgcG9ydCBjb250cm9sIHJlZ2lzdGVycyBhcmUKanVz
dCBpbiBhbiBhcnJheSwgaW5kZXhlZCBmcm9tIDEgdG8gbWF4UG9ydHMsIGkuZS4gdGhlIHBoeXNp
Y2FsIGluZGV4LgoKPiBIb3cgYWJvdXQgdGhlIFVTQjQsIGRvZXMgaXQgdXNlIHRoZSBVU0IzLjAg
cG9ydCA/CgpJJ20gbm90IGZhbWlsaWFyIHdpdGggVVNCNC4gQSBxdWljayBzZWFyY2ggc2F5cyB0
aGF0IGl0IGNhbiB0dW5uZWwKVVNCIDMueCwgRFAsIGFuZCBQQ0llLCBhbmQgaXQgZG9lc24ndCBo
YXZlIGl0cyBvd24gVVNCIEhDSSBkZWZpbmVkLgoKU28gSSdtIHRoaW5raW5nIHRoZSBVU0I0IGNv
bnRyb2xsZXIgd291bGQgYmUgbW9yZSBsaWtlIGEgbmV4dXMgbm9kZQpvciBtdWx0aXBsZXhpbmcg
bm9kZSwgb3IgcGVyaGFwcyBsaWtlIGEgVVNCIEMgY29ubmVjdG9yLiBJdCBoYXMgaW5wdXQKcG9y
dHMgZm9yIGFsbCB0aGUgcHJvdG9jb2xzIGl0IGNhbiB0dW5uZWwsIGNvbm5lY3RlZCB0byB0aGVp
ciByZXNwZWN0aXZlCmNvbnRyb2xsZXJzIChYSENJLCBEUCwgUENJZSkuIFRoZSBiaW5kaW5nIHBy
b2JhYmx5IHdvdWxkIGJlIHZlcnkgbWVzc3kKaWYgb25lIGNvbnRyb2xsZXIgc3VwcG9ydGVkIG11
bHRpcGxlIG91dGdvaW5nIHBvcnRzLCBhcyBlYWNoIGRvd25zdHJlYW0KcG9ydCBoYXMgYSAzLXRv
LTEgcmVsYXRpb25zaGlwIHdpdGggaXRzIHJlc3BlY3RpdmUgdXBzdHJlYW0gcHJvdG9jb2wKaW50
ZXJmYWNlcy4KCgpDaGVuWXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
