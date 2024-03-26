Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C5DC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0B/xV7ISTXqk75qRIpEyk8mW4xB5CaFqcTzV+sS8eho=; b=l37JqfWKASZ7lg
	3w35ks+OhLtPz0XYAuG+6JyL2YKCSr3f9AsBxCwsSyW8I94IO+sCQfkkk2qX11kOI/M11/ZcUMdiW
	POFD28tyReL1p4Zjp4Qg40fpvMv7Y2vnavHdor07pZhH+eT7yeXhVx0L4Mh0skWow81ixvBKc3oQi
	9aF/WOJ0ZNuWzAcAZTCV0qsx+meQiPr8Ns93ZayABGW1TF/yghVlIDlh0Z14iAHrwOIo3avqZA6bl
	wmMS7LEeXbh8Ufi1DiqJtWHkRqN3OU7TyOEGr39f7AxuELLtnt5igv128j2+jGDNVFPvGHVw0cclq
	gzoQ04cRs/WOpeao58SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9zS-00000005Z4P-2BqW;
	Tue, 26 Mar 2024 16:49:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8wC-00000005GOW-3d5Z
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 15:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03CADCE2272
	for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECABDC43601
	for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711467726;
	bh=WjxorTNm16pmawi2QrpcbXtzMMk9UnMvAB/SISpbzEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ao2XtACaF0FfHcF0Bbp0uK4XSd/WW7XJxlflVaBBitQFHAYUXbSDfVfUOuTsKgYgr
	 c9WC2gOGxSnJQNVNu3Guov8XU3k8dQhmKV9UklIz/xG8ZiMf2GdfI97Ac7XUzdQ89N
	 jPKwHwZk9n9o1qXB2oc93Fam7JUqwBcQRooyeQdGVBl+PSebxSp4CVYhD+WAOTCw1s
	 oAOBcmg8d4uMpBKwlq2GVqoi/mDhF9uTlkEgNxLINIR963aH9AwpPvATKvSCgwxqHw
	 rJ+skEC3hymTttNXUG/+feEOw42QxP1FVV0YalNbh25q0mcNEjvLYvSNu/P+iR509W
	 CC/KfPWZSAgmg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d228a132acso77147391fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 08:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKEpcwvzwhtKI7/+onEKcsCKWcnnrXp9Y0beJ/UeFt68Qk0w8byjmO7Gn2TtBzsfB1Io5vc2A1CMJldT3PuAnJ2SLhgF4kuqUdnZylYlRg
X-Gm-Message-State: AOJu0YzPKxI6P+RtW3VndaCuU5VbwAAvOgRR3oktDViCKY2WStV0EquD
	XMUNt+N53eX6JIhzHQSBHdKgIxrYyqHZ96XOrjDZFvM+3AJ7alJEtvbty0LVkkMFFe5lozFPJbs
	orkpnEo8baJHj7MH8TUPnDg8+lTQ=
X-Google-Smtp-Source: AGHT+IGBjbfnutWizOG4D+Y2Ce7JcBLvcXREvmL/5vUZ5omtP/DI9YkkoY1H5oFNMwi+Mh0v0WtWKqlJd4crDHOnXGo=
X-Received: by 2002:a2e:3613:0:b0:2d4:6bc3:192b with SMTP id
 d19-20020a2e3613000000b002d46bc3192bmr6902404lja.31.1711467724641; Tue, 26
 Mar 2024 08:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
In-Reply-To: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Mar 2024 00:41:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
Message-ID: <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	Karolis Mituzas <Karolis.Mituzas@imgtec.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Carlos de Paula <me@carlosedp.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_084209_376441_2998BB8D 
X-CRM114-Status: UNSURE (   6.84  )
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

T24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgODo1OeKAr1BNIE1hdHQgQ29zdGVyIDxNYXR0LkNvc3Rl
ckBpbWd0ZWMuY29tPiB3cm90ZToKPgo+IEZyb206IEthcm9saXMgTWl0dXphcyA8a2Fyb2xpcy5t
aXR1emFzQGltZ3RlYy5jb20+Cj4KPiBUaGlzIG1hdGNoZXMgdGhlIGJlaGF2aW9yIGZvciBhcm02
NCBbMV0gYW5kIHByZXZlbnRzIGNsb2JiZXJpbmcgb2YKPiB2bWxpbnV4LSR7S0VSTkVMUkVMRUFT
RX0uCgoKCgpXaGF0IHByb2JsZW0gYXJlIHlvdSB0cnlpbmcgdG8gc29sdmU/CgoKV2h5IGlzIGNs
b2JiZXJpbmcgdm1saW51eC0ke0tFUk5FTFJFTEVBU0V9IGEgcHJvYmxlbT8KCgoKCgoKCi0tIApC
ZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
