Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A81C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 02:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiSvh5CYi8ukqU1b+sxPMGNQWyFL6quDZgO4CT/Bgj8=; b=oRPOfdhC86MNKV
	cFGzhkePZhmKxJq96znKlLa7xrxsAKi5U5d+9cuBxo3PikLjDmVDnN5X/hNI/X13Y29rO35a0cRpw
	l8BEw4+EurUQ1p5if4VVfMN97WMU5tkg5xWlw4nuT+/xgDJ4ygXqBR3FI/zvvxZT3R2bLvb2RdXlJ
	qUBg5LqriSuhtCUb6ZYL9kKsgeJiS6qbzpv0F+hScPYG4Fdp2NQVanDxRl1asEkklBuqBzeVMHuA9
	e/++7S6BR6Kh7xnr2EtDtRDUcel78IyC28RUe8wqRgGQCDkcyPcg/EivWVg4P5+sJcr7qWkNP2Bgc
	+BRdUSdMc6I5FEzrfIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SiL-000dP3-Cu; Fri, 09 Dec 2022 02:02:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SiH-000dKl-Pd
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 02:02:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 29805B82709
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE0BC4339E
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670551326;
	bh=TCJA0NUGNPVahhQQ1Hh45pVrzy/SBPNYQTr7lJlPvZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AOt6nXINrFhD3l3S8AGeEWGjJdu/iDcqC7dw6pvW9uNXlKU9+xIAWyKn4Udpa9lGu
	 tz23+Orysyyd7QCnMfAMmTRdIab5J2u5iFfwBH7SDRC2cjTlpeEy0W/UQVFCWvhTE/
	 BND8LOG+YndCLHuyUZHcSDf0qNfb7d+J5YtXfZjhAv35OdXxypIdxGCxrwN2ZBAruR
	 1QbdsIE7poNWNMJ+rqODLHdTTglEXEnrAEwEu3mEbFSDo9zei6lwpXt+3noXm3np9n
	 yZQ4L8Z5aH6Cb3O4d4QBuqh7fmN1IvANZQOzw7nSV93uF1PVoKjUWeYIl/z2Pn79k7
	 glwY4NMinObgw==
Received: by mail-ej1-f47.google.com with SMTP id vp12so8260998ejc.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 18:02:06 -0800 (PST)
X-Gm-Message-State: ANoB5plStNiO0WeZ6pn4MJKa//nh+uC+zQrikXO1DMJF+HV5W6UNMq0p
	McSFiyev9v3tSbuI69XPdh4Jf2ZV8sGnrU0Zbf4=
X-Google-Smtp-Source: AA0mqf7rwovsaAf13UZfyBGYG5BIBX9Qugpw3448wzFAmjiIot+YK5dKORtA+wYq7D7grCvkr7hneMnboU5JC+nuyIE=
X-Received: by 2002:a17:906:ee2:b0:78d:3f96:b7aa with SMTP id
 x2-20020a1709060ee200b0078d3f96b7aamr64216935eji.74.1670551324505; Thu, 08
 Dec 2022 18:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20221208025816.138712-1-guoren@kernel.org> <20221208025816.138712-7-guoren@kernel.org>
 <87r0xaw6fh.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87r0xaw6fh.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 9 Dec 2022 10:01:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR+7phq0uaQOH_xtAju-q59BFDy2Nwf4MB=n3ZzV4W6Jg@mail.gmail.com>
Message-ID: <CAJF2gTR+7phq0uaQOH_xtAju-q59BFDy2Nwf4MB=n3ZzV4W6Jg@mail.gmail.com>
Subject: Re: [PATCH -next V10 06/10] riscv: entry: Consolidate
 ret_from_kernel_thread into ret_from_fork
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	ben@decadent.org.uk, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_180210_000396_BA0D766E 
X-CRM114-Status: GOOD (  10.63  )
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

T24gVGh1LCBEZWMgOCwgMjAyMiBhdCA2OjEyIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPgo+ID4gVGhlIHJldF9mcm9tX2tl
cm5lbF90aHJlYWQoKSBiZWhhdmVzIHNpbWlsYXJseSB3aXRoIHJldF9mcm9tX2ZvcmsoKSwKPiA+
IHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgd2hldGhlciBjYWxsIHRoZSBmbihhcmcpIG9yIG5vdCwg
dGhpcyBjYW4gYmUKPiA+IGFjaGlldmVkIGJ5IHRlc3RpbmcgZm4gaXMgTlVMTCBvciBub3QsIEku
RSBzMCBpcyAwIG9yIG5vdC4gTWFueQo+ID4gYXJjaGl0ZWN0dXJlcyBoYXZlIGRvbmUgdGhlIHNh
bWUgdGhpbmcsIGl0IG1ha2UgZW50cnkuUyBtb3JlIGNsZWFuLgo+Cj4gTml0OiAiaXQgbWFrZXMi
LgpPa2F5LgoKPgo+Cj4gQmrDtnJuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
