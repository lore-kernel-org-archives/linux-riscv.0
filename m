Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6286C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9DUGTm+iWHz+BSoxYfe+JQgIGiRwLjavjWC16tNKAc=; b=UNtQsrUYrtcile
	Y//tPsn+N+nuoyanza1jVkR+fGXjBn9uURNQ2T3hqEYZqFB1DiIUvjkXkw0ZGfbUNBRKCjLGcOaqu
	rNZcYCq2kPmgBcYskgd9+t5kvE7wVNoOgLAMLKdVvUms/oF9TfnLmvM8xFLRx9/+7V61T4vydT8Vz
	ilmATInkzn5MWDI1XuMFS7uOWoZwSxGySzHcNx1pZ+XICQPc98QbipdvHv41W5JLXvJmaH7IHqeYt
	V433Y9X7KuA59EeVWdXYUepoANzt+muUGNqeCecgN66ZVjf1Kr05NNfr9ZMHoC6RW577K6eI7brXm
	xU0Rrj76Rfv8YrizDBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSle-0000000910L-3dIF;
	Wed, 27 Mar 2024 12:52:34 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSlb-000000090yY-2fjw
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:52:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-29dedcd244dso4764169a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543950; x=1712148750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAvrRvDli3MU1wwHmO9KGxOUp2wwO3ANxnE7ASg3pIU=;
        b=I9Ldmn7q699up1pEP4NLqI05sujpsgKcnth8f81+Ki/gWutSwH07SuKctJx5h+lX0a
         BKgzjha3HEGMuCiDQEshF3QVtdZAUZ4FK/Y6C0vesNYELuMMHxqKG/X0+DdzvsrO8n/J
         tL+A/y+te3ZT96i+us0fD5aaCdk56AQfMR08m16zBZcWV1vosP5EzFNoUDOcZvAGA7d4
         TflcapMDISxoZ9RYYkm78kB96kdajHdV2pRTb/CvCOytYG82iTwkjvvfkiPNK+mPlEWl
         9jJuSD+2il4ZOcij0fnCdcbkpUhd/aRw39NbkGUt2p7Rkn1umXyIFiUeEMQB1B8ajc+D
         pmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543950; x=1712148750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAvrRvDli3MU1wwHmO9KGxOUp2wwO3ANxnE7ASg3pIU=;
        b=IX5REg468kabCJFY/MG3H1DbFjAa2Gd2lc2OVP7akORVubBfQDnA7ZaSWDOWIsvjAg
         AcfcIyqM0CCOX8FLErLmzCN8XKCL9Hkd6CQ6BeCiwFsIUYCb760KlqV2S/z7A6SG621F
         62CAFlKRKej7vqqD/Y/vkyEARZE9aNseN7uaSqwonplmIgGDbfJ0tTkqPmu2pb7R1p5k
         zF+NnThOMuZlvy7xlnCdRAvG5D70I8pYxj3pNDuP0m8IbH1vYiWSrPU+TcGzCZwg8oD1
         ziq7/pkcI4lihRFWCMVX25LAeB0VvceghEJacEJQxLFoquBicXNqG7Tk3PEDqk6aWkDB
         4D3g==
X-Forwarded-Encrypted: i=1; AJvYcCWCyrKP9Jh8noAxmRoguZ2r4Sq/OPIMszWGAUqzy4y/I+KdJt71Xxon1Hk9hqxvp3V+vT6oTjZjqBI1lwwyLuVOOsM6k7Ju0WeZsNdN8Vlk
X-Gm-Message-State: AOJu0YzBiu5sp2lI8T/smPNps72/jWQrhBhHTS2H16gipusVVZTA75eQ
	GL5L2nxRWW8wU/UH/PtnnJoQhGjewe9XbCZAAl0f98YcrwmkOMWAZBP1+TrFylfc+PDipyqLOtj
	59FNEXRpSAoBov4Bh5lClG2T7I/lki4qy+u3oyw==
X-Google-Smtp-Source: AGHT+IHY+2UAj74FKEtjbyT+87XUc6G/DqM4kccngP/A2LCLGbbPHvI0e9mfhKo5kTUGX5ZVCnsxWpIe0ZbpiTPyVfw=
X-Received: by 2002:a17:90a:e605:b0:2a0:1ff8:1560 with SMTP id
 j5-20020a17090ae60500b002a01ff81560mr2847472pjy.31.1711543949752; Wed, 27 Mar
 2024 05:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240326153712.1839482-2-samitolvanen@google.com>
 <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr> <CABCJKudxjhbLo_2zHBcsPh42vuLUGFj9wUxk+jf5USf2mvUZGg@mail.gmail.com>
 <485d2bc5-37f5-42a7-a3f8-bd53641c0d83@ghiti.fr>
In-Reply-To: <485d2bc5-37f5-42a7-a3f8-bd53641c0d83@ghiti.fr>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 27 Mar 2024 06:52:18 -0600
Message-ID: <CAEUSe79Fb0Knk850QtqQp12_7Rrb0Hp6rNoDwtjpCmdTELyVFg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Sami Tolvanen <samitolvanen@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_055231_871421_EBBCF28C 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8hCgpPbiBUdWUsIDI2IE1hciAyMDI0IGF0IDEzOjU2LCBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhAZ2hpdGkuZnI+IHdyb3RlOgo+IE9uIDI2LzAzLzIwMjQgMTk6NTUsIFNhbWkgVG9sdmFuZW4g
d3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAyNiwgMjAyNCBhdCA2OjQz4oCvUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+PiBEbyB5b3UgaGF2ZSB0aGUgbGluayBvZiB0
aGUgcmVwb3J0PyBTbyB3ZSBjYW4gYWRkIGEgQ2xvc2VzIHRhZy4KPiA+IFN1cmUsIHRoaXMgd2Fz
IHJlcG9ydGVkIGhlcmU6Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC81NmQz
Mjg1YS1lZDIyLTQ0YmQtOGMyMi1jZTUxYWQxNTlhODFAbGluYXJvLm9yZy8KPgo+IEZvciBiNDoK
Pgo+IENsb3NlczoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzU2ZDMyODVhLWVkMjIt
NDRiZC04YzIyLWNlNTFhZDE1OWE4MUBsaW5hcm8ub3JnLwo+Cj4gSSB3YXMgZXhwZWN0aW5nIHRo
ZSAiZGlyZWN0IiBsa2Z0IGxpbmsgdGhvdWdoLCBARGFuaWVsIGRvIHlvdSBoYXZlIGFueT8KCk5v
LCB0aGF0J3MgdGhlIGV4dGVudCBvZiB0aGF0IHJlcG9ydC4KCkdyZWV0aW5ncyEKCkRhbmllbCBE
w61hegpkYW5pZWwuZGlhekBsaW5hcm8ub3JnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
