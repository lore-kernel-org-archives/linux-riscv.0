Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811ECC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KCscQucmZQAFoeVwuxpBUOo4tl+cyBeimwnMDQzxC8=; b=YOFWvGTWFgDMY6
	QzVojb4Zd77c7mpbzmDPLJiKIgpKrm/cSgcHdwlfI55FPo7kYx5F3wSNigCw8yplBNTQLJFrK2RWq
	83FIPZZY85fWSaNYpA4TJt4Yiow0sbTWsH9g1v35s0xJsHt9AhB2Ej1DMheqXoGUHADb8eY32/Wlk
	orvbj0V8FOmoejfEa0gQGmY/1Q4kweifMLdLAeE3PRvxOzaUtBtOwQdf15chb7OdWhN/ZxzoOWdr5
	ghWfF87tzmU2CVadhT7Qji2SZeJJV817WAb1L8UKbl12+H2ysAMXehQ53J11n9W/kVJ4bXF43oj8T
	4M/tFj+27CC5aZrSEpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf3A2-00H0vZ-0K;
	Wed, 22 Mar 2023 18:26:10 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf39v-00H0tF-22
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 18:26:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id j13so19301178pjd.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679509557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xai25ViACOhtMbP/9A/HIC69Te+6jb14im4nmgBreX0=;
        b=Nc7bqPWvvVP0Fh9GRUREatEuPhbNWcj8ydyJq6p7WhnKTmZsmINp40U8jm2U/D3eOh
         GiADNrvpDW1src3wBD86k8hybLw++0LHdLBlze0Q290ZO1ycLMYXpjqhF0bC849Amhtk
         Uy0gNTTczAqnmq7Ne1eUnCmgjRAczfqeQ58RKE9Z1Dbo8WYhXCE+35mHwpNTZjinRv7Z
         SvFY91A1LyC+CNVJab3PMehak5rGBLhjGTsCzg52VkGZ8uMK06Y5GA1JlP2dh0NN6NWH
         L5Jzlk3GH1BS4NTePFlNBmFvEFZSn5SfhLcK85z0+yzixjDvudD4Wt6pqVVnBBIsUYXI
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xai25ViACOhtMbP/9A/HIC69Te+6jb14im4nmgBreX0=;
        b=KQhNQ6qZdnsp7URDD86xCmn+JRln74jt22fCvz4dKfUrMnJkT/s6cHOqa0X2aWY4p9
         GMuJyabqtnesjSVq7pHcHnGKHaHjIySWK7azpBTc1Q501Xskg7o8J2Adl8tO5yZM27qU
         83eN/wmniCDxJqw7ClrJawr4uB/hamYWU846t0p/y49VztC24pvYndrQl+gxd39tEw4B
         mJ1QdjR0Y/EGcB7ppVWjwMUgJl40HtmIHpsC6PHYAQkoez9bd8yYGVeC1BohA+ZduoK4
         lieuqBHLaNbaJ8KyT50iuoyg1NsJa178ykfWIP7NbsQMS+Kl/TaGUuT0uMaGmuFFVRAu
         xuPg==
X-Gm-Message-State: AO0yUKV5mdWfafLALO1cefrRL0KON++uJ2wtEgsqomC5LA5SVjzBHuYZ
	MBGsSaGnUW4nJjqG0y/n7cFlAzfADAKivd2qFNGhlA==
X-Google-Smtp-Source: AK7set/ZMXJixIFC4D/KWjt5E7Yb69EPs9KtjzG+BYb//151Eeugg7QbDH72EBo41HILsUMiYkKai/KWyETz2jWK8JA=
X-Received: by 2002:a17:902:7b8b:b0:19a:82a2:fcf9 with SMTP id
 w11-20020a1709027b8b00b0019a82a2fcf9mr1399015pll.2.1679509556719; Wed, 22 Mar
 2023 11:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877cw7dphf.fsf@all.your.base.are.belong.to.us>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Mar 2023 11:25:45 -0700
Message-ID: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, nathan@kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_112603_670779_8B48F701 
X-CRM114-Status: GOOD (  11.72  )
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

T24gRnJpLCBGZWIgMjQsIDIwMjMgYXQgNzo1OOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0
ZXM6Cj4KPiA+ICtjYyBsaW51eC1rYnVpbGQsIGxsdm0sIE5hdGhhbiwgTmljawo+ID4KPiA+IE9u
IDIvMTUvMjMgMTU6MzYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+PiBGcm9tOiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4gPj4KPiA+IEkgdHJpZWQgYSBsb3Qgb2YgdGhpbmdz
LCBidXQgSSBzdHJ1Z2dsZSB0byB1bmRlcnN0YW5kLCBkb2VzIGFueW9uZSBoYXZlCj4gPiBhbnkg
aWRlYT8gRllJLCB0aGUgc2FtZSBwcm9ibGVtIGhhcHBlbnMgd2l0aCBMTFZNLgoKT2ZmIHRoZSB0
b3Agb2YgbXkgaGVhZCwgbm8gaWRlYS4KCihNYXliZSBhcyBhIGZvbGxvdyB1cCB0byB0aGlzIHNl
cmllcywgSSB3b25kZXIgaWYgcHVyc3VpbmcKQVJDSF9IQVNfUkVMUiBmb3IgQVJDSD1yaXNjdiBp
cyB3b3J0aHdoaWxlPykKCj4KPiBEb24ndCBhc2sgbWUgKndoeSosIGJ1dCBhZGRpbmcgLS1lbWl0
LXJlbG9jcyB0byB5b3VyIGxpbmtlciBmbGFncyBzb2x2ZXMKPiAidGhlIE5VTEwgLnJlbGEuZHlu
IiBib3RoIGZvciBHQ0MgYW5kIExMVk0uCj4KPiBUaGUgZG93bnNpZGUgaXMgdGhhdCB5b3UgZW5k
IHVwIHdpdGggYSBidW5jaCBvZiAucmVsYSBjcnVmdCBpbiB5b3VyCj4gdm1saW51eC4KClRoZXJl
IHdhcyBhIHBhdGNoIGp1c3QgdGhpcyB3ZWVrIHRvIHVzZSAkKE9CSkNPUFkpIHRvIHN0cmlwIHRo
ZXNlIGZyb20Kdm1saW51eCAoZm9yIHg4NikuIExvb2tzIGxpa2UgeDg2IHVzZXMgLS1lbWl0LXJl
bG9jcyBmb3IgS0FTTFI6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAzMjAxMjEw
MDYuNDg2My0xLXBldHIucGF2bHVAc3VzZS5jb20vCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5p
ZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
