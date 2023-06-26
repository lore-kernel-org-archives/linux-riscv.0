Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E67EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBAzyqfVvFwbOILbdh+oUhHND3GskEYm/JIO7XyL7yM=; b=f31PCE2BAsvCbt
	GNGAlHl5f78Cb9gWd27jMRNM+dhRl9pgPRhEyZM6Tdm/sNJubmpuPqnUsDOwf06VYtHXu+XDWxCxs
	YAhU8zkqSNnnlIDTcEcKI7Mrk4yctz5JFoXMMigQOmIXHCAyEEBRoCeKrtPgutiTrr1T1Zlja+awN
	XH9ILUMqdeSa8xQn0jUpuF89GnanjlfpHPTD79UisNoVEwKXqomcxXfm/34PJGxUFJWlJgkNeYRVw
	jOau9dwN3QXqbr2e8VCi5wz07d9gTfc9vuHXjDmyj7NLB0ZDybHDa8V9f2/mhwXCbQYMI95I1cWxK
	ngajvkmtx5i4/eW/ufdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnGp-00AOcr-2q;
	Mon, 26 Jun 2023 14:32:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnGm-00AObv-21
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 14:32:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-313f61890fbso583875f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687789961; x=1690381961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xifpWCjzQTN6wRfQL9oeo1fgrnPC7xl+aGU5N4Yu6A=;
        b=RVPxNZgu36KUFT5H8FgT+jHwoc06ROYIC9YqiemtZ5d40LXR39skaMUiMgV4EA768/
         ADZ/bbDHZ5XvnvKFxBJzae9FuiIsNGxKe8fmFnOK1Dzh0TArvqizeXoNF9u4+302W6ba
         0VxjXyUzgcKCnJGjgQ/nv8cNE1odKGCUPryU92WObg86FpOId32kNMIdaTbvY+nsyWYK
         XI1cseZM2C26APa4YnVVN5WfVCVxOWBLkGUtHBCQlUqL/OtJpQCEc3hUQUPe+Q+pHKfL
         34npT3MEvrsNBE2pmyQCTio1783XIupfVLOmnsRvbn1N9XppwGfgNhttduphLK9KFHf3
         LDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687789961; x=1690381961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xifpWCjzQTN6wRfQL9oeo1fgrnPC7xl+aGU5N4Yu6A=;
        b=lv097+sX5pf9Ex3Y79D32s8iv4zR1IRupct48wRDHY3lGeaGXNJp629RJhhmZvASGz
         2GoEvE/999bNIOIa+zw2DOAof7RScvfm7gebtn29QPmakhrZtV5iADZ37BdvYzSAuozR
         vPI6XucSvwL/sC1tyJxYqnXprJo+yQ4abkAzPX3fOa59xGF8VYqQbcD70TlKdBekSjfI
         NplDtPHioL6CSAcFinCE7g7JFMrncNfEOF6h5NPoLnNcpA/OC3DQ1oyX7Q8k5em0TCa0
         cw53Ave1j9t2xvMJ5T7uwjPGdGfxhpJ3SP0hm1lQNnMRf4l6BlRplHr5hp+LxdeSZ0YS
         Okiw==
X-Gm-Message-State: AC+VfDwBfE3oNCnaqXxrd3UXV6JS/jAUNJAQNdkDI08Io5/jF5t0HhB2
	ivCIc8eh6i5AUDGCCYFg4mXToEYU3/2aqidcSpfjNg==
X-Google-Smtp-Source: ACHHUZ4IgqEOhodScx0AEA+jCLvvL6P5B9+0OYCeO04Najnk8I35USY/Zjm7Rv0b4Mem2ps/tw2L8geqfmafNkXiry0=
X-Received: by 2002:adf:e98c:0:b0:313:ed13:38d1 with SMTP id
 h12-20020adfe98c000000b00313ed1338d1mr3990360wrm.25.1687789960902; Mon, 26
 Jun 2023 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
 <20230623095547.51881-2-alexghiti@rivosinc.com> <87o7l6mgxg.fsf@meer.lwn.net>
 <CAHVXubhk2xf59XbNiRYKdr4J1yadpeX0KMgW1cFMR4GRN97MYA@mail.gmail.com> <877crrl1jm.fsf@meer.lwn.net>
In-Reply-To: <877crrl1jm.fsf@meer.lwn.net>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 26 Jun 2023 16:32:30 +0200
Message-ID: <CAHVXubit1pun1r-TC48TxR0esfDo49=PYFE+c10HBKqQ=AnZxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
To: Jonathan Corbet <corbet@lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_073244_890141_7CA7A17A 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Song Shuai <songshuaishuai@tinylab.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTA6MznigK9QTSBKb25hdGhhbiBDb3JiZXQgPGNvcmJl
dEBsd24ubmV0PiB3cm90ZToKPgo+IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4gd3JpdGVzOgo+Cj4gPj4gUGxlYXNlIGRvbid0IHVzZSA6YzpmdW5jOi4gIElmIHlvdSBq
dXN0IHdyaXRlIHNldHVwX3ZtKCksIGFsbCB0aGUgcmlnaHQKPiA+PiBtYWdpYyB3aWxsIGhhcHBl
bi4KPiA+Cj4gPiBUaGUgbWFnaWMgaW5kZWVkIGhhcHBlbnMgd2l0aCB2aXJ0X3RvX3BoeXMoKS9w
aHlzX3RvX3ZpcnQoKSwgYnV0IG5vdAo+ID4gd2l0aCBzZXR1cF92bSgpOiBpcyB0aGVyZSBzb21l
dGhpbmcgd2Ugc2hvdWxkIGRvIHdoZW4gZGVjbGFyaW5nIHRob3NlCj4gPiBmdW5jdGlvbnM/Cj4K
PiBJZiB0aGUgZnVuY3Rpb24gaW4gcXVlc3Rpb24gaGFzIG5vIGtlcm5lbGRvYyBjb21tZW50LCB0
aGVyZSB3aWxsIGJlCj4gbm90aGluZyB0byBtYWtlIHRoZSBtYWdpYyBsaW5rIHRvLiAgSW4gb3Ro
ZXIgd29yZHMsIGlmIHlvdSB3YW50IGl0IHRvCj4gbGluayB0byB0aGUgZG9jdW1lbnRhdGlvbiwg
dGhlIGRvY3VtZW50YXRpb24gbmVlZHMgdG8gYWN0dWFsbHkgZXhpc3QgOikKCk9rLCB0aGF0J3Mg
Zm9yIGFub3RoZXIgcGF0Y2hzZXQgdGhlbiwgdGhhbmtzIGZvciB5b3VyIGhlbHAhCgo+Cj4gVGhh
bmtzLAo+Cj4gam9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
