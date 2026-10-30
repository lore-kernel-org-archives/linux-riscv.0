Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B429606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYmRCTu8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=BwK07IbJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jpWW8NJBYdYecRds6/doAiWACSNblIrnl4n7zx+DPsw=; b=zYmRCTu8jX30ffDcGBduiKlMLw
	9IKrIzBmXg+DKvupyweI6m4sHNRjz+GMt585WPTE6vdlrRTYVWto14ioSHU5FQ+v/3ox0imCXp8Id
	T62DRcuwvKpYmo5z7NB7gPQvHpzPqWCCSLG3FrDCNttGA42NHo3bkstNenRfp/CMFgswMFN9xGkxt
	uSlbB7aLcoSPjkU9LhPMNLqfxSsSubQM06Y31WvOHwtf4E0i+brjmnPpu498TKnOkPVBy74yzkb0L
	lqhLJTPRJ82WkIgn1W33jXml8mDGJjaAThoKPOjQc9MP4OGN2fHwQV1Qm95Ts0UX08fkpdbLW21jK
	PWXcSSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMciq-0000000Agml-2AjG;
	Fri, 30 Oct 2026 02:52:04 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcim-0000000AgmN-3UCi
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 02:52:02 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-679a2b5fe87so178813d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 19:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793328718; cv=none;
        d=google.com; s=arc-20260327;
        b=DWyMUTZfN2xPXjNNOUzLKttucYAhFKrOcx9uf0wq3LSCYjmSyIbuxuGs/3YWQY5WcQ
         tn2Ssr7DMzF9vgYr7ThGANUZDkLmmrAla1x0cJ0kGxaUis1ty5fVVNroQ+s6kECW3Uif
         SX79oBuVI0NwtflprJ0DtPk1wEEBC25ouSp6bp+7piD1EZWij/H11BNkPsUt4EpydWHw
         Lld5F+AigzBiv//SlJjd/eUe33WlehQTDgK097WxiJs7V+EKJE9pcRQB5pxRGsp49asj
         8LiuKoB5qpQSueQzfGcYssbAnoYO0SEWq/M23FtahLKSx1usbezeTebTVBJp20BYvCA6
         3h8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        fh=UMzcwCQfz2BLKXOf0HD/WJXQuekVjyMuAJunIOcTxwI=;
        b=DdjV0hiUJlRIBAGBeX8NWe7vvQx5sQTYLPeh0gLkCu5s84WYKsaAGiSBQZBYzCw8ZU
         S6Bh5ulcFd2YFj95HmmFMAsjUsStfIoIJ/yyHGPwcUW8VkVuF43GeBIBgvkz966Z1rOx
         YbplT/e1mS19K+juCtVyZ4PMjun2qEF5DtXBDCJht3UaUvXj8GYTqteDxVhVLXX58rjW
         ZvyOqM137epO59NXKDVqBxNZgGPPsLkt8oCiECV9SgiRfFcG1L9wQzIFdn7KDqC10bvq
         Go5MJ5mKzJMP0WTtoMu38iymAmIYZXMj+7vOBr6YZb/3BDWrC7LxypQQyR6dxIOTx5aJ
         PZ8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793328718; x=1793933518; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=BwK07IbJyJeocnswBS17v8mctTjA2TSLxUaR+s9sHID7V/6newggL5W70NcaZCCN6h
         TjzGdykXtYdRQDC/xghKzz9Gpd8ZztCOAfIDcTDfMz3PMz63b6WCC0/VnglVD63eKh9D
         Wwg5l3arxWJMQE77cS+Y79Kr2VSIQyjkHqJla6NrFO6Aak+QBkPkhX71KnVv6wwgmS+7
         mLSA3z6ISyaL3Hv5dzivhvZd0+jtRd9s+ud4e9XhGEjp2SWOn9jNIzWLoBGUnplp+KTA
         OVdoQ6WAKtaGj3E8vw7q6A4yQLC8RFcMOxT2ZilvNHh2I8z/lDSAjOOCog61BdPvzuzx
         UAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328718; x=1793933518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=YW9dKUuUtaGMrChwDT+RLLc/svu1amt3iR052MIuUH8aPz1jbleGV8IJXZ/UChAi9s
         bXgNuZJVWz9RbuIvQCT1QjI4V8VV35WuNcq/DxFZH+DUEOvin88irUMwfPDnl34GMMv3
         SXrs67MU2tGlwA0+0Lb4S619qpularEhE3z77KKzjFWv2NLP1ZRw3so7wgNFVc79qEvq
         Ahbn8/Cg4ZOjBCndr5WGmZsim6T7yduhcAPGXEQvp9hHgoclXap/8Ss3t/PZrGDQ/x8M
         thhhld0mRaCb0Hag67gsG0QnUdtXOW8tP3CZr/shZe0oUI1rVMzvM74Kt+Y67I+2RUsn
         XP4A==
X-Forwarded-Encrypted: i=1; AKwUvBzhAl1a73THp/r7VngGj3b5dBzJztDbDJi2EVpot9gsthzL93N2nVDkfqyTnudaj6eL6hRutQIIdlFtFw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJCmoN+xXaV5n4d9wOa163NXsJiHbo2yCOEB+cq238LuuEtKHlY
	oQBKZYk12qMZ6I9b2STUR62zopiEGOjcts8Dp01UaPR+5qGrvn81RdBRaBE+zZ8lp6F7ARGZs4r
	9IsYbwCn3lhiPcHYsCYqdriwMCuIvJgi5V2b6khnNQA==
X-Gm-Gg: AYBFou0Wui3a1vEKsbYH+ipyIoMjztJjhxgPlxa8VS81n6P5VvvKMIlWVlCB6G3tzVV
	DkBhYCmgHwsHiCPkV4wYWKiSaiqN/XLdvv+TP2GJNUJ/rqHC1ndjl3HcKcVCzYmnURCNA+dzk9j
	vbkiotnOECZsQP9RyT9hbCGaT1cagioMTwMGrf+cFd6wmyU6bGl8PuyXrPlbwiHZFvOK3Qh+WYe
	QpiW5qNglozXQtfxjP0mW5P9QzX1oHYpRYfGWxXrZXFit9YidyjcfH0cB+OTRXXAb+u0aUPLmuj
	ixJ2llbdTMludgG7cO0uQa3IH8MUoD3uN8tQZgMlME+rFbH1qVbVFievuHXDwO97VeB521CkZEu
	G5nSXw4+gF+wY3ucwiFkU0jCkekFPlPpRbQIQMh3FuAmrgBnYspBHMxO5QenxYzRzPMi1zyXe4/
	D3Tr+SALQU+U56yaKLlXy23wA=
X-Received: by 2002:a05:690e:454d:10b0:679:a353:7a7d with SMTP id
 956f58d0204a3-67ba4eeac55mr426041d50.53.1793328718349; Thu, 29 Oct 2026
 19:51:58 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029162343.1896134-1-e@freeshell.de> <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
In-Reply-To: <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 29 Oct 2026 21:51:46 -0500
X-Gm-Features: AclHuK_jwkWhvW67oyVz3_xpn9l6bwLOir-RRbNmugfkCBr6eaFqkHpPNMfZ2UY
Message-ID: <CAEev2e9aYewWgOjxSq6ShaLpj6SaYjxQq+C-L1zX2vHyWH81HA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_195201_032838_6A947875 
X-CRM114-Status: GOOD (  24.50  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVHJveSwKCk9uIFRodSwgT2N0IDI5LCAyMDI2IGF0IDk6MDTigK9QTSBUcm95IE1pdGNoZWxs
Cjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPiBIaSBFLAo+Cj4g
T24gVGh1IE9jdCAyOSwgMjAyNiBhdCA5OjIzIEFNIC0wNzAwLCBFIFNoYXR0b3cgd3JvdGU6Cj4g
PiBDaGFuZ2UgdGhlICJyZXNlcnZlZCIgc3RhdHVzIG9mIG1pbXNpYyBhbmQgbWFwbGljIHRvICJv
a2F5Ii4gVGhlcmUgaXMKPiA+IGFuIG1haW5saW5lIE9wZW5TQkkgdXNlciBvZiB0aGlzIGFuZCBz
ZXR0aW5nIHN0YXR1cyBva2F5IHJlc29sdmVzIHRoZQo+ID4gc3RhbGwgb2YgTGludXggd2hlbiBw
cm9iaW5nIHBlcmlwaGVyYWxzIGF0IGJvb3QuCj4KPiBUaGFua3MgZm9yIGJyaW5naW5nIHRoaXMg
aGVyZS4gSSBzdGlsbCB0aGluayBzdGF0dXMgPSAicmVzZXJ2ZWQiIGluCj4gazMuZHRzaSBpcyB0
aGUgcmlnaHQgZGVzY3JpcHRpb24uCj4KPiAoVG8gY2xhcmlmeSB0aGUgQWNrZWQtYnkgSSBnYXZl
IG9uIHRoZSBVLUJvb3QgdGhyZWFkOiBpdCB3YXMgZm9yCj4gY2FycnlpbmcgdGhlIG92ZXJyaWRl
IGluIHNwYWNlbWl0LWszLXUtYm9vdC5kdHNpLCBub3QgZm9yIGNoYW5naW5nCj4gdGhlIGtlcm5l
bCBEVCkKPgo+ID4gQEAgLTE0NTIsNyArMTQ1Miw3IEBAIG1pbXNpYzogaW50ZXJydXB0LWNvbnRy
b2xsZXJAZjEwMDAwMDAgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1zaS1jb250cm9sbGVy
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGhhcnQtaW5kZXgtYml0cyA9IDw0PjsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixudW0taWRzID0gPDUxMT47Cj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgc3RhdHVzID0gInJlc2VydmVkIjsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAgICAgICAgICAgICAgIH07Cj4gPgo+ID4gICAg
ICAgICAgICAgICBtYXBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQGYxODAwMDAwIHsKPiA+IEBA
IC0xNDY0LDcgKzE0NjQsNyBAQCBtYXBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQGYxODAwMDAw
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixjaGlsZHJlbiA9IDwmc2FwbGljPjsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixkZWxlZ2F0aW9uID0gPCZzYXBsaWMgMSA1
MTI+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LG51bS1zb3VyY2VzID0gPDUxMj47
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gInJlc2VydmVkIjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAgICAgICAgICAgICAgIH07Cj4g
PiBGaXhlczogNTZmMzdlMzkxYTYyICgicmlzY3Y6IGR0czogc3BhY2VtaXQ6IGFkZCBpbml0aWFs
IHN1cHBvcnQgZm9yIEszIFNvQyIpCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEgYnVnIGluIHRo
ZSBrZXJuZWwgRFQgZWl0aGVyLgo+Cj4gVGhpcyB3YXMgYWxzbyBkaXNjdXNzZWQgd2hlbiBrMy5k
dHNpIHdhcyByZXZpZXdlZCBbMV0uIFRoZSBEVEIgYnVpbHQKPiBmcm9tIHRoZSBrZXJuZWwgdHJl
ZSBpcyBvZnRlbiBsb2FkZWQgZGlyZWN0bHkgYnkgdGhlIGJvb3Rsb2FkZXIgKGUuZy4KPiBmcm9t
IC9ib290KSBpbnN0ZWFkIG9mIHRoZSBGRFQgdGhhdCBPcGVuU0JJIGhhcyBhbHJlYWR5IGZpeGVk
IHVwLiBXaXRoCj4gIm9rYXkiIHRoZXJlLCBMaW51eCB3b3VsZCBwcm9iZSB0aGUgTS1sZXZlbCBJ
TVNJQy9BUExJQyBhbmQgdGFrZSBhbgo+IGFjY2VzcyBmYXVsdC4gVGhlIGNvbXByb21pc2UgYmFj
ayB0aGVuIHdhcyB0byBrZWVwIHRoZW0gb3V0IG9mIHRoZQo+IGtlcm5lbCdzIHZpZXcgaW4gazMu
ZHRzaSAoImRpc2FibGVkIiBhdCBmaXJzdCwgInJlc2VydmVkIiBzaW5jZSB2NSkKPiBhbmQgZW5h
YmxlIHRoZW0gZm9yIHRoZSBmaXJtd2FyZSBidWlsZCBpbiAtdS1ib290LmR0c2ksIHdoaWNoIGlz
Cj4gZXhhY3RseSB3aGF0IHlvdXIgVS1Cb290IHBhdGNoIGRvZXMuCj4KPiAoQWxzbyByZXBsYWNp
bmcgR3VvZG9uZydzIGFkZHJlc3Mgd2l0aCBoaXMgY3VycmVudCBvbmUgaW4gQ2MuKQo+Cj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC83N2Y5YTAwMS03ZjBhLTRjMjktYWJjYi01MDFl
ODc1ZGExMTdAc2lmaXZlLmNvbS8KCkxpbnV4IHdpbGwgc2tpcCBwcm9iaW5nIHRoZSBNLUlNU0lD
IGJlY2F1c2Ugb2YgdGhpcyBwaWVjZSBvZiBjb2RlIGluCmltc2ljX2dldF9wYXJlbnRfaGFydGlk
LiBJdCByZXR1cm5zIC1FSU5WQUwgdW5sZXNzIGl0IHNlZXMgaW50ZXJydXB0CklEIDkuCgogICAg
LyoKICAgICAqIFNraXAgaW50ZXJydXB0cyBvdGhlciB0aGFuIGV4dGVybmFsIGludGVycnVwdHMg
Zm9yCiAgICAgKiBjdXJyZW50IHByaXZpbGVnZSBsZXZlbC4KICAgICAqLwogICAgaWYgKHBhcmVu
dC5hcmdzWzBdICE9IFJWX0lSUV9FWFQpCiAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgpJIHNlZSB0
aGlzIGluIHRoZSBsb2dzCgpbICAgIDAuMDAwMDAwXSByaXNjdi1pbXNpYzogaW50ZXJydXB0LWNv
bnRyb2xsZXJAYTAwMDAwMDA6IG5vIHBhcmVudAppcnFzIGF2YWlsYWJsZQpbICAgIDAuMDAwMDAw
XSByaXNjdi1pbXNpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwMDA6IGZhaWxlZCB0bwpz
ZXR1cCBzdGF0ZSAoZXJyb3IgLTIyKQpbICAgIDAuMDAwMDAwXSBPRjogb2ZfaXJxX2luaXQ6IEZh
aWxlZCB0byBpbml0Ci9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwMDAgKChfX19fcHRy
dmFsX19fXykpLCBwYXJlbnQKKF9fX19wdHJ2YWxfX19fKQpbICAgIDAuMDAwMDAwXSByaXNjdi1p
bXNpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAYTQwMDAwMDA6IHByb3ZpZGluZwpJUElzIHVzaW5n
IGludGVycnVwdCAxCgooYTAgaXMgbS1pbXNpYywgYTQgaXMgcy1pbXNpYykKClsgICAxMC43Mjc2
MDVdIHBsYXRmb3JtIGNjMDAwMDAwLmludGVycnVwdC1jb250cm9sbGVyOiBkZWZlcnJlZCBwcm9i
ZQpwZW5kaW5nOiBwbGF0Zm9ybTogc3VwcGxpZXIgYTAwMDAwMDAuaW50ZXJydXB0LWNvbnRyb2xs
ZXIgbm90IHJlYWR5CgpUaGUgTS1BUExJQyBwcm9iZSBpcyBkZWZlcnJlZCwgYmVjYXVzZSB0aGUg
TS1JTVNJQyB3YXNuJ3QgcHJvYmVkIGFuZAp0aGVyZSBpcyBhIGRlcGVuZGVuY3kgaW4gdGhlIERU
IGZvciBpdC4KClRoaXMgc2hvdWxkbid0IGNhdXNlIGFjY2VzcyBmYXVsdHMgYXMgZmFyIGFzIEkg
Y2FuIHRlbGwuCgpPbmUgd291bGQgaGF2ZSB0byBpbXBsZW1lbnQgYSBkdCBmaXh1cCBpbiB1LWJv
b3QgbGlrZSBIZWlucmljaAptZW50aW9ucyBpbiB0aGF0IHRocmVhZCB0byBzb2x2ZSB0aGlzLgoK
Pgo+IC0tCj4gVHJveSBNaXRjaGVsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
