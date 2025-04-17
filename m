Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF0C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sbBuIbu5d6/Hm89DmROzXQifyp87ILBFFkhTtLvxII=; b=cpgf16RTsbq2DL
	j0c/e+n1D/G37aOMnOZXKsLYeQZ+q0sAexOU9mNHRd0Zzbe15ALgIxWuAIALe5QpXLPxTzRZ7kzhY
	P3nUv9tMojMBMGFUbpUSnHxB9+Vb+U0eCECklZQELVtavxhsJZE49s8TR9uVx/yXHCiWM6+yf1Fsz
	MBIGObIPpHLYc5AW4auJO91LgnE3NZ37POjry2Ag6Bm9AXv3K5qmPiOAukyMgCNgQFCY/yDcyvFUI
	HcX7/gLr7/eNL2wab/9PmwLYE9o5Adz0C51RdmPX5u/ZD+V4AeI0NNNu/6w3FcpoRRZw6E3HPgOqb
	OdUY/0nLltgE3jKe+MVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RAk-0000000DW4f-0gzS;
	Thu, 17 Apr 2025 15:29:02 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QPN-0000000DM42-2tsv
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 14:40:07 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e726895a6cdso906673276.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900804; x=1745505604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjSuIg9V8KFXqeOeQX0npWOfivCLZnrB/LzyjhcAUug=;
        b=OpqJqOtNTGJrMKWyo2eFAouOqS0W3dfTEFhh2CcAr/N1AfedTh1gJ5XYahTFTR1kjn
         5FbPxLMtgh2dO8VE7uauDDAfaXecQLRNImndUA8c9Bv3H9kDhCTM4u75Kmqx40CPiT5a
         5EXA8WpxrXlXBa55pgdIRP4FxXF++D/evoX5subarQyb+ET2gN+98FX7mAbMzUwxWf5P
         tT30tm/cB0ztfgXiPhyVief2huqA/YpiHVLyUw41KO86eNg90O4Blm8gBzMVL5EUnvjE
         4kYFCm7HZO9WGQxKghJ1UO1mU3bU3yLBD14McXf8DdnUvCYNiBoMInuWzGSafbJTXrLw
         Zgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900804; x=1745505604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjSuIg9V8KFXqeOeQX0npWOfivCLZnrB/LzyjhcAUug=;
        b=YZAQi9yBMHjfY+VXq8KAf/+jziJMO0XQnc1gz8tQHV3uv2GHFARJXDFMpXnT0tnDCG
         y+kC+csKiD/RFD5AS88rFgore2qMtr+9+IhrQCkfuC+YQheh3W81K6truz3R0DC6bMLB
         77El1+hCBDPBVw7fg1tPdQu2uD0PgqAJSuKwns7oZLzpoSJ77hduXAiN6yBXxYnrSF5V
         OUZHHyxG9FhB3l6FwRS6/4R6IUCSMc1popyp4hyEzyBe5NPaHVjQ2Kt4QWoms2nyN2d3
         UFf0gvdnYDuDJFMNRQkzxNpYNjIarMDBZDVYOUH/rYiDxVfjj6iEyBgYm+WKkxWwoYeU
         yrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFBnlojR2N1j+aC0dOcuyePwaJOf2p0ls+cuM0aMhxe5kR8UjJyqOyCbGFXlvO9i1uiwgK9qlEjIDEYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ZIAmBbPpaBiGM4Fz29+UUwr7VaMf8dBPUp7ugkWrtLK7ecFa
	0nMBpKn+u6PR6xxdJuXHThgDplN0qmnEMV9XzMqt70YY3AIqVIh4bZmJooDJP+uEa72L7UteV/m
	KOxWyjASsxOPz8wNJHTeYpCbaYN7/lgg4uveGLQ==
X-Gm-Gg: ASbGncvBICUfM8NwxNQ93/4B0xJnXdLW2C1ukXJ1apaXnW72OViHBFPsJyDAXHu6yiv
	0CWsqnsXERx8bLfPPB9xqDBTkv9Il6jwAxc/+qFbtroMr0ZXbjcRBQ/1pwWIUAkDnUPXhzGZdhw
	ydjd3JwPeoU/9SMKYmZU3NDcfr3wZU9/G/7XAqUA==
X-Google-Smtp-Source: AGHT+IHfNa7JtP3MTMQBKRDR/0sqBeIlvephhMVZkLn4rPfWcPEYlwEn3wnt7sI5W+yM2CFASAh9zr9eeDt7mosJ8ik=
X-Received: by 2002:a05:6902:270a:b0:e6d:f27a:57e1 with SMTP id
 3f1490d57ef6-e7275986ac1mr7725772276.26.1744900804329; Thu, 17 Apr 2025
 07:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
 <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
 <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com> <CAMj1kXE8nY0rasb04qbZGtkuL5_b8so7L7NH61zLv9G3nm5vcg@mail.gmail.com>
In-Reply-To: <CAMj1kXE8nY0rasb04qbZGtkuL5_b8so7L7NH61zLv9G3nm5vcg@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 17 Apr 2025 22:39:53 +0800
X-Gm-Features: ATxdqUFgfiipK7rybD5hunEoiNe7HpXF2zLIpKw9TAdMUyxIHZOTT-pMNkCnDhs
Message-ID: <CALW65jbg7BAo4kxes5f_feBPjj2CxhmkJyed0G37U0C8yd9UXg@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_074005_732648_6D80AEE4 
X-CRM114-Status: GOOD (  12.47  )
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

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMTA6MTXigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+IC0gVGhlcmXigJlzIG5vIGNsZWFuIHdheSB0byBmb3JjZSB0
aGUgb3B0aW1pemVkIHBhdGggLSBHQ0Mgb25seSBlbWl0cwo+ID4gZmFzdCB1bmFsaWduZWQgbG9h
ZHMgaWYgdHVuZWQgZm9yIGEgc3BlY2lmaWMgQ1BVIChlLmcuLCAtbXR1bmU9c2l6ZSBvcgo+ID4g
LW10dW5lPXRoZWFkLWM5MDYpLCB3aGljaCB0aGUga2VybmVsIGRvZXNuJ3QgdHlwaWNhbGx5IGRv
LCBldmVuIHdpdGgKPiA+IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MuCj4gPgo+ID4g
TWF5YmUgd2Ugc2hvdWxkIHJhaXNlIHRoaXMgd2l0aCB0aGUgR0NDIG1haW50YWluZXJzLiBBbiBl
eHBsaWNpdAo+ID4gb3B0aW9uIHRvIGVuYWJsZSBvcHRpbWl6ZWQgdW5hbGlnbmVkIGFjY2VzcyBj
b3VsZCBoZWxwLgo+ID4KPgo+IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgaXMgYSBi
dWlsZCB0aW1lIHNldHRpbmcsIHNvIHRoZQo+IHJlc3VsdGluZyBrZXJuZWwgb25seSBydW5zIGNv
cnJlY3RseSBvbiBoYXJkd2FyZSB0aGF0IGltcGxlbWVudHMKPiB1bmFsaWduZWQgYWNjZXNzZXMg
aW4gaGFyZHdhcmUuCj4KPiBTbyB0aGF0IG1lYW5zIHlvdSBjb3VsZCBwYXNzIHRoaXMgLW10dW5l
PSBvcHRpb24gdG9vIGluIHRoYXQgY2FzZSwgbm8/CgpHQ0MgZG9jcyBzYXkgLW10dW5lPXNpemUg
aXMgaW50ZXJuYWwgdG8gLU9zIGFuZCBub3QgbWVhbnQgZm9yIGRpcmVjdAp1c2UuIFNvIHdoaWxl
IGl0IGVuYWJsZXMgb3B0aW1pemVkIHVuYWxpZ25lZCBhY2Nlc3MsIHJlbHlpbmcgb24gaXQKZmVl
bHMgYSBiaXQgaGFja3kuCkNsYW5nIGlzIG1vcmUgZXhwbGljaXQgaGVyZTogLW1uby1zdHJpY3Qt
YWxpZ24gY2xlYW5seSBlbmFibGVzCm9wdGltaXplZCB1bmFsaWduZWQgYWNjZXNzZXMuIEl0J2Qg
YmUgZ3JlYXQgaWYgR0NDIGhhZCBzb21ldGhpbmcKc2ltaWxhci4uCgpbMV0gaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9vbmxpbmVkb2NzL2djYy0xNC4yLjAvZ2NjL1JJU0MtVi1PcHRpb25zLmh0bWwjaW5k
ZXgtbXR1bmUtMTIKCj4gVGhlbiwgeW91IGNhbiBqdXN0IHVzZSBhIHBhY2tlZCBzdHJ1Y3Qgb3Ig
YW4gX19hbGlnbmVkKDEpIGFubm90YXRpb24KPiBhbmQgdGhlIGNvbXBpbGVyIHdpbGwgZW1pdCB0
aGUgY29ycmVjdCBjb2RlIGZvciB5b3UsIGRlcGVuZGluZyBvbgo+IHdoZXRoZXIgdW5hbGlnbmVk
IGFjY2Vzc2VzIGFyZSBwZXJtaXR0ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
