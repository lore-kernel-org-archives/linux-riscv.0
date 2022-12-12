Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB28C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRLqTjZOPQusrsF6kq81JetYhhPENYMbXFZWxxqh74Q=; b=jkvMPxZo9DmmDA
	6Ix+3Q+iZjmPBumv+WSWi/E9Bo/vhWK3h+WvUmslXvHVAFhRP9KixR7HZg70/NTrfM0U97Vakg8aQ
	bx34/yvxnGfMe8xqoeT/XuZvUihv91/JrATFiLiP83l1rtrN2VUwG5AeCF6/kd/dvE8HnpjcJ73pK
	xZaPCcplscJqEt5I/5LNe2ix2vUJhuE4YwbOCSg6FJQ4FLiLj6ezh2loA3IL8El5zDnInct+5DEUZ
	8c8tFG1Kh0+IYPGf1vD37ERd8pu3WzoBUbki/h803ILS6soqLkGni8N17XXwEEZD4H5DLa+6t/hwK
	E9ZrULLmAlO29DynVG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dX7-009cJ7-FV; Mon, 12 Dec 2022 07:47:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dX4-009cGS-TQ
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:47:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8958BB80B32
	for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 07:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02E7C433A7
	for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 07:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670831241;
	bh=WodXS32v21twmYiAX4EYlvjeOy5WNyupQTY3RKVIkMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JRhQfJB40YY1E5o01ZIlNYc/kdRlHLSopZcdsjGRcGGaq/j8ogOV5FOb9ECPuXpV3
	 3F4kAF7d+ZePQLnhrtqk6TnGyTB7nJJmBf2/SwzmXO29+gKYoL77hm28HSpGSMc0kc
	 +e5bvEF2reg5XXKTe0uv4HxENb9IF0VZHq8iZS2xWKyg2FfeZe8hBGYa+lhgufAJT9
	 jS7/rhDtZofEslTd5R8ecnylbu/UK6DX28P1RNHVo3raOFea75pK3+Xml6J/Ie6kmC
	 BJI6vGkuF6tdHzwGsXZD9plAR/tqCoVTjgpqIWRi5XCnkL/dX28blJmeeOFpUMyBb6
	 da2jonlWoe9QA==
Received: by mail-ej1-f42.google.com with SMTP id x22so25724952ejs.11
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 23:47:21 -0800 (PST)
X-Gm-Message-State: ANoB5plCZBbUVzHsNaO++OHqFhRjbkgD6DEE7BuN+bjbId9nwwrLXNeH
	8YaBtPdJyJisLAfFemRO34rqEe5y5sHxemwWgiY=
X-Google-Smtp-Source: AA0mqf7N7UFVN5fBKS9zwvAu/9ydpmWDWTK7ZNrJwhsUxCGulp+irELYyY+9ZVZUSyYbpQOC8Wlu29oUzLHN3ddUewU=
X-Received: by 2002:a17:906:1546:b0:741:5c0e:1058 with SMTP id
 c6-20020a170906154600b007415c0e1058mr79503869ejd.472.1670831239987; Sun, 11
 Dec 2022 23:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20221210171141.1120123-1-guoren@kernel.org> <87o7s9ay4v.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87o7s9ay4v.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Dec 2022 15:47:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTtw2A3Xkp7HZR4e+g9kZ9DGJx+gG2PtoTz1uAjnJ0mQw@mail.gmail.com>
Message-ID: <CAJF2gTTtw2A3Xkp7HZR4e+g9kZ9DGJx+gG2PtoTz1uAjnJ0mQw@mail.gmail.com>
Subject: Re: [PATCH -next V11 0/7] riscv: Add GENERIC_ENTRY support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, mark.rutland@arm.com, greentime.hu@sifive.com, 
	andy.chiu@sifive.com, ben@decadent.org.uk, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_234727_135427_2BC3E4D1 
X-CRM114-Status: GOOD (  15.89  )
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

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMzoxOCBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IGd1b3JlbkBrZXJuZWwub3JnIHdyaXRlczoKPgo+ID4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFRoZSBwYXRjaGVzIGNv
bnZlcnQgcmlzY3YgdG8gdXNlIHRoZSBnZW5lcmljIGVudHJ5IGluZnJhc3RydWN0dXJlIGZyb20K
PiA+IGtlcm5lbC9lbnRyeS8qLiBTb21lIG9wdGltaXphdGlvbiBmb3IgZW50cnkuUyB3aXRoIG5l
dyAubWFjcm8gYW5kIG1lcmdlCj4gPiByZXRfZnJvbV9rZXJuZWxfdGhyZWFkIGludG8gcmV0X2Zy
b21fZm9yay4KPiA+Cj4gPiBUaGUgMSwyIGFyZSB0aGUgcHJlcGFyYXRpb24gb2YgZ2VuZXJpYyBl
bnRyeS4gM343IGFyZSB0aGUgbWFpbiBwYXJ0Cj4gPiBvZiBnZW5lcmljIGVudHJ5Lgo+ID4KPiA+
IEFsbCB0ZXN0ZWQgd2l0aCBydjY0LCBydjMyLCBydjY0ICsgMzJyb290ZnMsIGFsbCBhcmUgcGFz
c2VkLgo+ID4KPiA+IFlvdSBjYW4gZGlyZWN0bHkgdHJ5IGl0IHdpdGg6Cj4gPiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL2d1b3JlbjgzL2xpbnV4L3RyZWUvZ2VuZXJpY19lbnRyeV92MTEKU29ycnks
IEkgZm9yZ290IHRvIHB1c2guIE5vdyBpdCdzIHJlYWR5LgoKPgo+IEZXSVcsIHRoZSB2MTEgYnJh
bmNoIGlzIG5vdCBhdmFpbGFibGUgaGVyZS4KPgo+IFRoaXMgc2VyaWVzIGlzIGEgcmVhbGx5IG5p
Y2UgY2xlYW51cCBmb3IgdGhlIFJJU0MtViBlbnRyeSBjb2RlLiBJJ3ZlIHJ1bgo+IGl0IG9uIHNv
bWUga2VybmVsIHNlbGZ0ZXN0cywgYW5kIGhhdmVuJ3Qgc2VlbiBhbnkgaXNzdWVzLgo+Cj4gSSdt
IGxvb2tpbmcgZm9yd2FyZCB0byBoYXZpbmcgdGhpcyBzZXJpZXMgcHVsbGVkIGluIQo+Cj4gUmV2
aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KVGh4LgoKCgotLSAK
QmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
