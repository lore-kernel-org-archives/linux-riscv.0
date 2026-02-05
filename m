Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ED4EC1EB9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGx1ZyGcquIq28WIjMBqfOi6eN1i0z21ep6lGQKVoq4=; b=PZYVi0yWivFuzv
	b0aDhfN6AO4scPo976EJCKRuB0BEBeIXdVxctlVWPy5OGeG7ZmFhg5re44fIfMDlQoLIEu8mvApYF
	7kTe5ZVj0WESt1fp47tWDM24icHURacLwntYSBopj6FE0VVmWk0Sz0jo99370fFR01hQvvR09PDfq
	Vb/PBCfNKhaLXIt28sZgafU3EoEWh6jCw3yjxucpq0uXoDUs2i/I90ok+kbVAXceZAMjR7gyypNJ0
	r+4onutJavF7hdfO4w13ckG19GDqsWT75TTpBiHnxPu8SjCJRpJQbfxsyQBAkj3Qaft0mzrR0+LxK
	61XiVYEwumUf4HNItp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Bu-0000000A18J-41Bd;
	Thu, 05 Feb 2026 14:18:42 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Br-0000000A17o-18Dd
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 14:18:41 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-649d4690088so1058418d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 06:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770301117; cv=none;
        d=google.com; s=arc-20240605;
        b=SP2M+SOa6Fk4P1btBG9wXVM76039RruLko2GdxiKjqmT6QMEQ8f40FmPTjlk77X+NR
         Jv/0PUFGaTTDwzD0d8xHaZGtwNFAh1ZnCqIfvwy2rtpztdHi8a4cl0oaGWRvSfUpYiGw
         MtuSSy6R88VKMAENj4QIzRvhevUpjZqpcjUu2C7WcWKnIYil6ZtJ4EvYEv3Vk7XrG3ZE
         CXd9e24+YpQONEKIIPFte57+cZj/FVqrndYoBkfh84GTaUuLVfwxR/UMJSvNTJCyAqrO
         aISm6MBRU1A5KYSaIQkhSu7Wu+WAYCeymBApYSEGc7SB8/hO6Bgom8xT8G1jTpf7CNXp
         L2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmzX7miFPHenGmKgTxHym6piSGjO2BEbSWKlfsS546M=;
        fh=UPglEyKhMkIPW4ZkJH8s79XOr2Lcs4CPxbJKWZrhio0=;
        b=dmw7BVV4xkB9tlI4Hc3TaO7ANFYm5Rlakwsjv2baPDTi/xGfwia71GlXTQ8tUnN9W+
         ByKo/+lTMGE1RSyFloQRVbwmDgn5C9JMDh91pdIxsxkxYooB/KIX24C2v2jknCkcHqVr
         nhrJTJV4jFIetl9+AYj+eqV08JOnr+0QVF8KpqBlqk+0EwH4fI4+b979ojNfPWLlWfMr
         lZBLpTyH+T9rf3xij+qr1YxLN6kuX6eD432yRC0knxvl5lAqD4VurSiDP2r+KHpWNCCQ
         eaREw3VcyBzQBf6zZUOFTIksyY39gHkCr03WDvnrM1HU0uquQoSOHDzjSHcI+rj67uCm
         Henw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770301117; x=1770905917; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmzX7miFPHenGmKgTxHym6piSGjO2BEbSWKlfsS546M=;
        b=ZlvJ5XwpS5z4qbfIYdUncfhvztrNaaGo5RCsnAy8+/V2v0ZcoCrI4I5S+q9+ZadgLS
         Kvzw/1GjoSroeXOFi049sl9+2IvM/09Eb3okVIJLPplK30iwBefOp396GTC6TeXsLalD
         jb8p+CjMh+WVydAj+GhBBpqB/vFHq7lb0iunS/tCt1r3ewyoS9G+F5vaj8Ar9Lu8JyZW
         QPAty1lxKBSQvGhsJ1VlyXTL5vHhPkHv/M9aijux0QZXeNTWie6nxmG4MfXIYXNV4cE0
         QcnsyphCbJo6LC9jr2snc+an8ZIX9K1QdScsV3b5upNS7Tu4JHBNnEzTRmiO9eOHSUtT
         MnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770301117; x=1770905917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmzX7miFPHenGmKgTxHym6piSGjO2BEbSWKlfsS546M=;
        b=XhMi6l7kYoes6JE8xAJVnaoSPwqgTySHsrMbEuioGhCH08lwZLMbRcTuYJlWy6fFBH
         AGxCFK/0DLt50kS3U15kN1eWT3DXJOoNeHH59U1qFYdKsS7xSQn/sgxezNzVOV+Yis1T
         BzBqjYhwFp4zu/6Wspp1occhu8czP2Q0TXvcgsUsd/n05iNzVnYeF3bcs/p+TDyedq1S
         GIvEu7GHPj5DGmnzodji+Ncyd9a/KDC4i9H2WqdWwz/yrY+O1MOvwZpteuXaWX3vUWn7
         Eps60kbkUE64XlR5SOa00AxMFCp3K9NXRWHZYF2BRupkanFLyvEOuhutRgfFu/V+r+Zh
         LNnA==
X-Forwarded-Encrypted: i=1; AJvYcCWi1/CkCu0VCOWI2drE4Oegt3628BHhR1uSNxrIiTElUIzLOn0fSiTTdn+PgeFVU9xGrsAUJ/eyXdzFiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi+kQJybMoMjRve/PZgtwqjA9yQLKezNdecz2v24gyqA/dge90
	HBNEB+DM4k96QobCSM5xupkupPj5g8Ky/FyzhRhP08r7zSOh1YaPA5B9UOdcdJN6PjuCP4rq5g1
	PpkGlBM0/qqR4qyYOU7FHHJ3m9WqYvD6we38Hlonocg==
X-Gm-Gg: AZuq6aLG77zWy4BkDjqtrcVWH5TIgy5hU6P8uclcy6aGMttaUFo9PPG+U4crgGudXKe
	xstoERCFe6pY36UfMc28extPf2QJDbsu+FxRfmwf5h6ZeOyust0iDlg1Ce5ZU7QAWtl+/SULGPq
	NaUZ6KIytXk56sug1C2Mq+zlEb8/xNdPyYTAWpnk0N4AMuvUwTENG5qQPoqYDRIpEdSgc5HSbS0
	0BG8kopWkyxPAgNj+cB1YGEpmD7pzDHEnCf6B+rHKfjLARO+eugLo7Z8oQOkdFXN0fVltk7lAA1
	EtenlYFCppp42xhx0J3LgC/jYy06ZsvDYN4PnDFPFxWGBtN6TjsQE7SCxv2w
X-Received: by 2002:a05:690e:400b:b0:649:deac:3a4b with SMTP id
 956f58d0204a3-649deac3b03mr3774253d50.53.1770301117363; Thu, 05 Feb 2026
 06:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com> <20260205-spiffy-bizarre-doberman-184d2b@quoll>
In-Reply-To: <20260205-spiffy-bizarre-doberman-184d2b@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 5 Feb 2026 08:18:26 -0600
X-Gm-Features: AZwV_Qjh73GzJRPJHTYqtWlvnk8u0Q7TIS1RXBqh4qKkHh3LKjQLN6cuUSeiYrU
Message-ID: <CAEev2e_S9LYV609VmrHCqNneuTro=hbAjzgHFLAO6RD0_fErwA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_061839_398075_C3200547 
X-CRM114-Status: GOOD (  16.22  )
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

SGVsbG8gS3J6eXN6dG9mLAoKT24gVGh1LCBGZWIgNSwgMjAyNiBhdCAzOjI34oCvQU0gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgRmViIDAy
LCAyMDI2IGF0IDAxOjQ2OjUwUE0gLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvYy90ZW5zdG9ycmVudC9hdGxhbnRpcy1wcmNtLmggYi9p
bmNsdWRlL3NvYy90ZW5zdG9ycmVudC9hdGxhbnRpcy1wcmNtLmgKPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjg0MTUxNmNiZWZkOQo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvaW5jbHVkZS9zb2MvdGVuc3RvcnJlbnQvYXRsYW50aXMtcHJjbS5oCj4g
PiBAQCAtMCwwICsxLDMxIEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLwo+ID4gKy8qCj4gPiArICogU2hhcmVkIGRlZmlu
aXRpb25zIGZvciBBdGxhbnRpcyBQUkNNIENsb2NrIGFuZCBSZXNldCBEcml2ZXJzCj4gPiArICoK
PiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgVGVuc3RvcnJlbnQKPiA+ICsgKi8KPiA+ICsjaWZu
ZGVmIF9fU09DX0FUTEFOVElTX1BSQ01fSF9fCj4gPiArI2RlZmluZSBfX1NPQ19BVExBTlRJU19Q
UkNNX0hfXwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gPiArI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+Cj4gPiArCj4gPiArc3RydWN0IGF0bGFudGlzX3ByY21fYWRldiB7Cj4g
PiArICAgICBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSBhZGV2Owo+ID4gKyAgICAgc3RydWN0IHJl
Z21hcCAqcmVnbWFwOwo+ID4gK307Cj4KPiBEcm9wLCB0aGVyZSBpcyBubyBkcml2ZXItd2lkZSB1
c2VyIG9mIHRoaXMuCgo+Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgYXRsYW50aXNf
cHJjbV9hZGV2ICoKPiA+ICt0b19hdGxhbnRpc19wcmNtX2FkZXYoc3RydWN0IGF1eGlsaWFyeV9k
ZXZpY2UgKmFkZXYpCj4KPiBTYW1lIGhlcmUuCj4KPiBEbyBub3QgYWRkIHN5bWJvbHMgdG8gaGVh
ZGVycyB3aGljaCBub3RoaW5nIHVzZXMuIFRoZXNlIGFyZSBwcml2YXRlIHRvCj4gdGhlIGRyaXZl
ciBzbyB0aGV5IG11c3Qgc3RheSBPTkxZIGluIHRoZSBkcml2ZXIuCgpUaGUgZGVmaW5pdGlvbnMg
aW4gdGhlc2UgZmlsZXMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRoZSBjbG9jayBhbmQgcmVzZXQKZHJp
dmVyICh3aGljaCBhcmUgaW4gZHJpdmVycy9jbGsvdGVuc3RvcnJlbnQvIGFuZCBkcml2ZXJzL3Jl
c2V0LyksCmhlbmNlIHRoZXkgaGF2ZSBiZWVuIHB1dCBoZXJlLgoKPgo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
