Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A4C27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Y8GN3z7woQo9PfAUylQprBiHSxlrqJNQCAVSN4jdJ4=; b=j8CyF7/pqbAz92
	HQM5eNRblURy07lBu7T82ZF/D2W4maMLg+Y2dV08DoMZZVRPkQnAHdbAfTvap8AEpzAys1N4GDL/7
	rvta9XH+f+j1bQRw9tUC99D1hTzqWWHoMlj1FmAjDlLmO73DZ5DFiVA47gjrPVAzbDeZtiyzzo69Y
	9Ko3urGrv1+/NtzD8djhjlF4zobrF8UaTxmeI+hruovD/1m8WXxW0NZWah8n6p95xmHdcSExteiV0
	ImUGBF9djZy03tnhTNCu/B4cPF7Q3hBeCrZCGITYqpd8KHYBycxHcfC15k1Wh4NYurZBLG1tBZpYW
	0CaFWR/OatGAoxsFaeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1pF-00000008o8K-33DB;
	Mon, 17 Jun 2024 02:10:29 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1pC-00000008o6f-06b2
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:10:28 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dfe41f7852cso3977142276.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2024 19:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718590221; x=1719195021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqCXTr60lfURDiU6o/ziPYUoB/pkh4/Y0UTODd/6hiA=;
        b=NBNdCWuJvaTXXeadLJPjhn8urwxATDmAiN2NaAnk6QQV9q/TJU69H9RK9q0JUhp4VF
         yObY/bEGEWMagD2xCw60oFaRa2NTrErfczmfU6HD3ngaMyBPfqbUQfldjx5Iyvu2RzJ8
         wtylGZMC/PQu06FuuqP+aDw4p6MBfsnJk2HvH1mpowaYknV4vJqsyFMCH2NRyUftC/az
         fH7wXAr01Jkkfs9YRRE4gvcZ1foTT0htxc+EuQiO+cX0HHEKXd22iiM3ngL+KokTZ4ob
         btDu3plh8PYFIco97dCSfHYrbgiQZbcCVaVl6wKbXDpVDoIGeFIqNzcjGmKcKOJ7tAia
         S/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718590221; x=1719195021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqCXTr60lfURDiU6o/ziPYUoB/pkh4/Y0UTODd/6hiA=;
        b=j42JdS+496t4JUZ93HN6Vq2N8EswcqpU+pfXzpmVnofBZwZ1QLiMh10JYAm4KLMQ/i
         qQL8mYg3UXZBAwCqn5C2IFE/YT4T4IceS34+NXFRtBA1g5l1pQbmneqJoC0MMNtcMPs3
         OsZTOG9aK1QsGDoX2SSIfawplTjWJ3wvLEtrR7KZBSO3ybGaIKlIdIq5/g+KaU8VHBks
         kIbjWg5PBZjLS5DonlZNVlj0frtrd7frRy7xCse8ZV5Y0eH/qW8Kw3y2Ig4bfu1sNhjY
         UdC+FeHSXAJK0kfUVrm3+3PrJsJMwkp7OANISFmnG6SLWW0DpOr7Hq8Bh9JkLFJrMtTj
         YeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyxKN3xm9wItw9mPdtXFrVA1srtlTJrfF7PjR68dQuKUJvMvPkROvDmRiZIXqAaNeB1aHDhSI+Yda+VDBNP7e6/IU0IA1ByVxARpapGoVP
X-Gm-Message-State: AOJu0YyCEfhtC/Sv/ZVHMQI6bSLUvTviiVJ459FmYAstoqvxlSeZpLhX
	eqCZL4Lk5gEo5a6ML9dMjhgjtgj3nGKIDNKzLjtitwXcEivU8CsZ0L2MgJ2OkfX4PgQL0S7b+z8
	xxNsj7M20+1lGC++joZid3xBCnkQ8OzI+g9FASw==
X-Google-Smtp-Source: AGHT+IHVdf4CeK9m5TY7u8n2i5EYX8aCm7rXG/PvOUZXj0qTxh3niUzEWChMP06D9pYzethEgSj8BqmnKZHhXWATYww=
X-Received: by 2002:a25:6612:0:b0:dff:3b6a:6322 with SMTP id
 3f1490d57ef6-dff3b6a64a9mr2668500276.34.1718590220902; Sun, 16 Jun 2024
 19:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-2-1a538e12c01e@sifive.com> <20240613093233.0b349ed0@rorschach.local.home>
In-Reply-To: <20240613093233.0b349ed0@rorschach.local.home>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 10:10:09 +0800
Message-ID: <CABgGipXB8uQ7XZbBFMZa8b7mymKAW7qOkKKaA8qVZ0hGXziSYA@mail.gmail.com>
Subject: Re: [PATCH 2/8] tracing: do not trace kernel_text_address()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191026_551587_066F6320 
X-CRM114-Status: GOOD (  15.63  )
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

T24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgOTozMuKAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMTMgSnVuIDIwMjQgMTU6MTE6MDcgKzA4
MDAKPiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4ga2VybmVs
X3RleHRfYWRkcmVzcygpIGFuZCBfX2tlcm5lbF90ZXh0X2FkZHJlc3MoKSBhcmUgY2FsbGVkIGlu
Cj4gPiBhcmNoX3N0YWNrX3dhbGsoKSBvZiByaXNjdi4gVGhpcyByZXN1bHRzIGluIGV4Y2VzcyBh
bW91bnQgb2YgdW4tcmVsYXRlZAo+ID4gdHJhY2VzIHdoZW4gdGhlIGtlcm5lbCBpcyBjb21waWxl
ZCB3aXRoIENPTkZJR19UUkFDRV9JUlFGTEFHUy4gVGhlCj4gPiBzaXR1YXRpb24gd29yc2VucyB3
aGVuIGZ1bmN0aW9uX2dyYXBoIGlzIGFjdGl2ZSwgYXMgaXQgY2FsbHMKPiA+IGxvY2FsX2lycV9z
YXZlL3Jlc3RvcmUgaW4gZWFjaCBmdW5jdGlvbidzIGVudHJ5L2V4aXQuIFRoaXMgcGF0Y2ggYWRk
cwo+ID4gYm90aCBmdW5jdGlvbnMgdG8gbm90cmFjZSwgc28gdGhleSB3b24ndCBzaG93IHVwIG9u
IHRoZSB0cmFjZSByZWNvcmRzLgo+Cj4gSSByYXRoZXIgbm90IGFkZCBub3RyYWNlIGp1c3QgYmVj
YXVzZSBzb21ldGhpbmcgaXMgbm9pc3kuCj4KPiBZb3UgY2FuIGFsd2F5cyBqdXN0IGFkZDoKPgo+
ICBlY2hvICcqa2VybmVsX3RleHRfYWRkcmVzcycgPiAvc3lzL2tlcm5lbC90cmFjaW5nL3NldF9m
dHJhY2Vfbm90cmFjZQo+Cj4gYW5kIGFjaGlldmUgdGhlIHNhbWUgcmVzdWx0LgoKU291bmRzIGdv
b2QsIEkgYW0gZ29pbmcgdG8gZHJvcCB0aGlzIHBhdGNoIGZvciB0aGUgbmV4dCByZXZpc2lvbgoK
Pgo+IC0tIFN0ZXZlCgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
