Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92402C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 06:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54744610A6
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 06:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54744610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y75Dd3t99o5NVNCNe3bAUJ9JHIf0IVMpGEWMai7K83M=; b=RJXCkBlToWCdNE
	xsutwl0hEPYbTSUY+4GNzgvpotPmWOed/EXlAyYE7DmEe5zNGzQGqeGLUVSvOmumQctQ3haanu1s5
	sdn5VPbJpnjR3WI1TcCgaIZNYuXuUMG6zNdskLQT1oTuzmIw3JDrtfwswjiT/38+5+xz1VsaKKIKl
	1HyAiOKpHoumksXrseoMKbp400+gwwSjc4z4XyzE7SgHkEqcBdxRPi5SqZwVK6ITiGoh4mI1ECmEZ
	uQiS6eSn3Bad7bK/Q0GTsd7sBGSL4XLtQ4/DnvW/G0TBrn6KN1Mek99/htMOaRYbNtzfGpWOjx4Eo
	DEYwZkp7QCFgI3NFG0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcLvY-00EIEi-Fz; Mon, 18 Oct 2021 06:15:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcLvW-00EIDe-2j
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 06:15:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id m42so7690998wms.2
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WQhK9newMuT4ZcfEVTu2O6OOxhG5FSs8pfq23mZQ9b8=;
 b=IU6s7L+v4s0/VflIrjGqDc+A21kMuoTSuD8fw/5h+PKaJcHoeA0GIjHE/yccgSfss3
 j/2wa+P8gnqL6Aa9WPzCcZ4eOB1bvmHD6MW4wiRcR6KGbbafNxloYv76HE6sYsABF6iL
 3IIW3b1BdgKPatNsN3YHj1WciZ2YTWYCsA+xwiAbrLkwnSEJazWr63w59qkkHBdT6Mc5
 qtNJ4fl61L6stAnOOVlMFk39rhnU1189y8xIoQnXQBFFHQi6NVelT5k2Hl2CVHC0hvpN
 QBSKmU3wWRMgBbEl0fEjaIvsd7Ii0nqJtesePyWPqKwIIO96lZoeHF3WRatFjI17NkFs
 +KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WQhK9newMuT4ZcfEVTu2O6OOxhG5FSs8pfq23mZQ9b8=;
 b=rjzOEP95B3ec+H7ygSL+75CWxfS2N+NvOIqNc7eMIKZx7xmA9bD7E/FcDohpmmTulG
 UoWf5XMNxyJaeGBnxUyfwhutjoKltvPvqxpb+RoR7kqPPwp1b05DCKOHrjw/ex9/dskS
 5nS0wFD9majihM3BXIxzmhL6PzG9hdQt09c1uqixOC8IozxLLVWGNLw3vsIWMCd183+T
 GG8JtDY2a0bezp+SEAwruDxuiiPsi+78NakopqfqKyQha6Jrnwav0VySSMuuNj6FAG51
 TlpfYykT//w4gZo5lCmrh/rOCai3idl+mc6Z51qvXMMiOH6Dc08cORmwFKeX6gT4Taei
 qplw==
X-Gm-Message-State: AOAM532cxb5YzhTfbYv8MM/kYbj0UrfJY88iY0D3AFwYYhSgt6mclDt1
 OEosCKLpFInxNjvBCiF3HcOhaxBOv1H7BF1Vno0=
X-Google-Smtp-Source: ABdhPJzIWJApevckci5qatLKjWalU8JmJdnGMPtIihNA04JRK/++WitE4TYuQZePvX7gfpQTma1rFv+7dMmpPjJx4WI=
X-Received: by 2002:a1c:750b:: with SMTP id o11mr28786227wmc.5.1634537712218; 
 Sun, 17 Oct 2021 23:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211014142554.53120-1-lmb@cloudflare.com>
 <20211014142554.53120-2-lmb@cloudflare.com>
In-Reply-To: <20211014142554.53120-2-lmb@cloudflare.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 18 Oct 2021 08:14:59 +0200
Message-ID: <CAJ+HfNjwYtg+8ZWBNaL08afQJpOQ6m0tUiTjhTtLBBoLDdxAmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] bpf: define bpf_jit_alloc_exec_limit for riscv JIT
To: Lorenz Bauer <lmb@cloudflare.com>
Cc: nicolas.dichtel@6wind.com, Luke Nelson <luke.r.nels@gmail.com>, 
 Xi Wang <xi.wang@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, kernel-team@cloudflare.com, 
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_231514_164604_5A766AA8 
X-CRM114-Status: GOOD (  11.87  )
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

T24gVGh1LCAxNCBPY3QgMjAyMSBhdCAxNjoyNiwgTG9yZW56IEJhdWVyIDxsbWJAY2xvdWRmbGFy
ZS5jb20+IHdyb3RlOgo+Cj4gRXhwb3NlIHRoZSBtYXhpbXVtIGFtb3VudCBvZiB1c2VhYmxlIG1l
bW9yeSBmcm9tIHRoZSByaXNjdiBKSVQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnogQmF1ZXIg
PGxtYkBjbG91ZGZsYXJlLmNvbT4KPiBBY2tlZC1ieTogTHVrZSBOZWxzb24gPGx1a2Uuci5uZWxz
QGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgfCA1ICsrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvcmUuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCj4gaW5kZXgg
ZmVkODZmNDJkZmJlLi4wZmVlMmNiYWFmNTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb3JlLmMKPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwo+IEBA
IC0xNjYsNiArMTY2LDExIEBAIHN0cnVjdCBicGZfcHJvZyAqYnBmX2ludF9qaXRfY29tcGlsZShz
dHJ1Y3QgYnBmX3Byb2cgKnByb2cpCj4gICAgICAgICByZXR1cm4gcHJvZzsKPiAgfQo+Cj4gK3U2
NCBicGZfaml0X2FsbG9jX2V4ZWNfbGltaXQodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIEJQ
Rl9KSVRfUkVHSU9OX1NJWkU7Cj4gK30KPiArCj4gIHZvaWQgKmJwZl9qaXRfYWxsb2NfZXhlYyh1
bnNpZ25lZCBsb25nIHNpemUpCj4gIHsKPiAgICAgICAgIHJldHVybiBfX3ZtYWxsb2Nfbm9kZV9y
YW5nZShzaXplLCBQQUdFX1NJWkUsIEJQRl9KSVRfUkVHSU9OX1NUQVJULAo+IC0tCj4gMi4zMC4y
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
