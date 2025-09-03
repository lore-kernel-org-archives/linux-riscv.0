Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203C7CA1018
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoMTEWvsORZdPPyVcnqJu4byqWAPuR6fw/tvDk28avY=; b=W9R7QswxacwkXf
	0nzS/ANfFbDU9YvqCplonYM72oKhFdAU1kAyy5O1s6DiMRTVUGOu9OjwCtCULX63C/NgjWXHq55oH
	DoDRCwKCjRxl+KYUaQcqGPy2JUwGZNxslZMZ84IxsTViAbj75tHf/cgbFOQG3oFuZFCMmnYwGu2Js
	hnG7IV4tzxiITzR2ND2q2wnZJ5wL1F5yu2sZV6fVM3KGDhgtTcPHxhD3DGk8aPTivnXXrASVhkbkK
	6dVraDTQMe90NzYj/knt9NcA8IxU9B2VlOW7sHH+bxGUhJZB4D27+3xCgfrSvTZOnsC2XxU/TQGgz
	bz82QUIJUkcUTWAfecdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQT-00000008E0x-2uFo;
	Thu, 04 Sep 2025 02:10:13 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt25-00000007RW4-1y71;
	Wed, 03 Sep 2025 19:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756927235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c+ZgGU/Y7ymCGJS4a8iBSCEwRU68y0Cdd3gwtYGpdv4=;
	b=Z0xvlH/ECfsC59swm4ATc7moQPplDnhXIzmBF4X35r6pJmnBDDeoU1Ie5Ab1yxhe+1ln8W
	GcUQb2ZLGdW9NnPudS1kvJ3oXxwi39axE8bJQYRDLCQpq4QuYcwKIMP6MOFv74jzcnlQqN
	tMc5uO4lOOAAr/7RBg88uyXzuq33+zQ=
Message-ID: <f19aa842d210bf4cd3d7abf03ea7323f9e52df75.camel@crapouillou.net>
Subject: Re: [PATCH 024/114] clk: ingenic: x1000-cgu: convert from
 round_rate() to determine_rate()
From: Paul Cercueil <paul@crapouillou.net>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Wed, 03 Sep 2025 21:20:32 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_122037_672439_B9B8E006 
X-CRM114-Status: GOOD (  13.07  )
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

TGUgbHVuZGkgMTEgYW/Du3QgMjAyNSDDoCAxMToxOCAtMDQwMCwgQnJpYW4gTWFzbmV5IHZpYSBC
NCBSZWxheSBhCsOpY3JpdMKgOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQu
Y29tPgo+IAo+IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdy
YXRlIHRoaXMgZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1
c2luZyB0aGUgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIg
b2YgdGhpcyBzZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5
QHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxv
dS5uZXQ+CgpDaGVlcnMsCi1QYXVsCgo+IC0tLQo+IMKgZHJpdmVycy9jbGsvaW5nZW5pYy94MTAw
MC1jZ3UuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9pbmdlbmljL3gxMDAwLWNndS5jCj4gYi9kcml2ZXJzL2Nsay9pbmdlbmljL3gxMDAwLWNndS5j
Cj4gaW5kZXgKPiBmZWIwM2VlZDRmZThjOGY2MTdlZjk4MjU0YTUyMmQ3MmQ0NTJhYzE3Li5kODA4
ODZjYWYzOTMzMDlhMGM5MDhjMDZmYjUKPiBhYThiNTlhY2VkMTI3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvY2xrL2luZ2VuaWMveDEwMDAtY2d1LmMKPiArKysgYi9kcml2ZXJzL2Nsay9pbmdlbmlj
L3gxMDAwLWNndS5jCj4gQEAgLTg0LDE2ICs4NCwxNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZwo+
IHgxMDAwX290Z19waHlfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJcmV0dXJu
IHBhcmVudF9yYXRlOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBsb25nIHgxMDAwX290Z19waHlfcm91
bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQKPiBsb25nIHJlcV9yYXRlLAo+IC0J
CQkJwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpwYXJlbnRfcmF0ZSkKPiArc3RhdGljIGludCB4
MTAwMF9vdGdfcGh5X2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+ICsJCQkJCXN0
cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0Cj4gKnJlcSkKPiDCoHsKPiAtCWlmIChyZXFfcmF0ZSA8IDE4
MDAwMDAwKQo+IC0JCXJldHVybiAxMjAwMDAwMDsKPiAtCj4gLQlpZiAocmVxX3JhdGUgPCAzNjAw
MDAwMCkKPiAtCQlyZXR1cm4gMjQwMDAwMDA7Cj4gKwlpZiAocmVxLT5yYXRlIDwgMTgwMDAwMDAp
Cj4gKwkJcmVxLT5yYXRlID0gMTIwMDAwMDA7Cj4gKwllbHNlIGlmIChyZXEtPnJhdGUgPCAzNjAw
MDAwMCkKPiArCQlyZXEtPnJhdGUgPSAyNDAwMDAwMDsKPiArCWVsc2UKPiArCQlyZXEtPnJhdGUg
PSA0ODAwMDAwMDsKPiDCoAo+IC0JcmV0dXJuIDQ4MDAwMDAwOwo+ICsJcmV0dXJuIDA7Cj4gwqB9
Cj4gwqAKPiDCoHN0YXRpYyBpbnQgeDEwMDBfb3RnX3BoeV9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywgdW5zaWduZWQgbG9uZwo+IHJlcV9yYXRlLAo+IEBAIC0xNjEsNyArMTYyLDcgQEAgc3Rh
dGljIGludCB4MTAwMF91c2JfcGh5X2lzX2VuYWJsZWQoc3RydWN0IGNsa19odwo+ICpodykKPiDC
oAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIHgxMDAwX290Z19waHlfb3BzID0gewo+
IMKgCS5yZWNhbGNfcmF0ZSA9IHgxMDAwX290Z19waHlfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRf
cmF0ZSA9IHgxMDAwX290Z19waHlfcm91bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IHgx
MDAwX290Z19waHlfZGV0ZXJtaW5lX3JhdGUsCj4gwqAJLnNldF9yYXRlID0geDEwMDBfb3RnX3Bo
eV9zZXRfcmF0ZSwKPiDCoAo+IMKgCS5lbmFibGUJCT0geDEwMDBfdXNiX3BoeV9lbmFibGUsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
