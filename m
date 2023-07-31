Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E200C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 02:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEWSTa91h64IcyesGtwbS9rfCgKCcn/uaRLjHzRNnC4=; b=nJC4+UEE+Vffc6
	eLIdcI5JaL32NZf6MOvYZEWQ5K9mhq3/pMFbdlanpjaek5pGW2kNkKH7tnA0BIslC3l3n7cxzwBkL
	H7uzbnP3NBVfyhfBi/t9Sz5jxQzOgPhPQWEQt2DGcp9H7kA0FPgvnBR9hcSY9UpYI8W7xbBQT+tRu
	XLOyq06yVeqvP5YDN+4V36XjBprekD9Vg4ZCIWK2MEGAMw6j7MzvY//vBxFhtRYkvwVuOoorB9vo8
	3yi6dYEDxFMx6LZVZy2wB6O7Am2Nq6IFh+mkos1QHcMwsS0CTN0PwnsESv286L+zwuCVThZjSB4Fn
	rgV+TSN89CiNXfN6B7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQInv-00DXJq-0B;
	Mon, 31 Jul 2023 02:38:39 +0000
Received: from out-99.mta0.migadu.com ([91.218.175.99])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQInr-00DXIH-1u;
	Mon, 31 Jul 2023 02:38:37 +0000
Date: Mon, 31 Jul 2023 12:38:11 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690771110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhF9ae7sVYEWGeArURaJEEMWDyQUH8VQmSu9vlqpWUA=;
	b=lNBX0bXbxeY9vD+BAGHVD8mrDp7jZly7tcuxIl86W6Tk15NffKhfYUGVxQ4Pu3VVr2OaqY
	fYh9+ijpTWSOw231yBjByzsvlM+YCFXiSemJQLdrkI7AKYEo6t7sdq80c+VMRNVw3OEt0A
	V9Bhrg/9c+yX2v31W8Kl5Bauewq8w0lARWc+KhyOKQd83PYAdXwL4prtOIwuTvgeb26NP1
	rDQUkmOrwe/hUFCUix/OhV+HmjgO8Wcm4Gw0mogQ20CVRgkGB9tGowGzdiarkTAWGqc2UK
	gY1cL2IRGmJHn2lCUkxuzFxqjSqpRGLAvaDthZKEASMhLcdVcY2P7/iNHFZu8g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller
 nodes
Message-ID: <ZMcek2NnEqtmE5OS@titan>
References: <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-4-contact@jookia.org>
 <ZLzwaQlS-l_KKpUX@titan>
 <5694691.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5694691.DvuYhMxLoT@jernej-laptop>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_193835_785914_50F5131B 
X-CRM114-Status: GOOD (  14.40  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMTI6MDM6NTlBTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IFllcywgdGhhdCdzIHVzdWFsbHkgaG93IGl0J3MgZG9uZS4KPiAKPiA+IAo+ID4g
SSBzZWUgdGhpcyBoYXBwZW5pbmcgaW4gc3VuNGktYTEwLmR0c2kgZm9yIGluc3RhbmNlLCBidXQg
aXQgYWxzbyBzZWVtcyBsaWtlCj4gPiBpdCBjb3VsZCBiZWNvbWUgYSBwcm9ibGVtIHdoZW4gaXQg
Y29tZXMgdG8gcmUtdXNpbmcgdGhlIGR0c2kgZm9yIG5ld2VyIGNoaXAKPiA+IHZhcmlhbnRzLgo+
IAo+IFByb3BlcnRpZXMgY2FuIGJlIGVpdGhlciByZXdyaXR0ZW4gb3IgZGVsZXRlZCBmdXJ0aGVy
IGRvd24sIHNvIGRvbid0IHdvcnJ5IAo+IGFib3V0IHRoYXQuCj4gCj4gQmVzdCByZWdhcmRzLAo+
IEplcm5lago+IAo+ID4gCj4gPiBKb2huLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIEkndmUg
c2VudCBhIHBhdGNoIHRvIGFkZHJlc3MgdGhpcy4KCkpvaG4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
