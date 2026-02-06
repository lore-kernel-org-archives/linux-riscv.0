Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC43EEE2084
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeLU+uxF5OzX/ZpeAo0OfUmxDv9NiATqBj/sEJ5USbI=; b=LdiwdlkHbNp/jf
	JtOmOPbdXMfsl7kqfAd86jwtoktqZuqoVi8hNS2hUIgNtUnHVb2PCITfcI6ZaOgBVd3FKKJ5am0Yq
	A9PbUHkmowCOBfdW1mWonwc8Gfrhi/7Oi/KvBFaOI2YiWZlwLPAOgP81bv2FXgRc9AeSp82C9Xbn1
	yb31hw4PibtzlUyip6yu4FMO9Q5fphrB1Ip5Oa21rihjgQoXbGCbiZ1aJCmZIeMMhvSjfP0aeuCKg
	cXE1vDTjQKK/GsjgXs/2kQu+0cMPSbrMKWf3afLqklqW2X/8FHuqWXq9/ofpfjaE2rIushwa+53Je
	xw/X8PZ7eGNmDwunuykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJtA-0000000BEcc-01wb;
	Fri, 06 Feb 2026 11:20:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJt8-0000000BEcE-0G6r
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 11:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D60E2443E3
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 11:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA307C2BCB4
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770376836;
	bh=+0Zf81B1zwL2wSz5t/L+Z6ELV13gCyGdVzUjKB9M1Uc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X1JlEi4+A/BeE46ROFljUPd0gcDPYROCoJCjtCsyzL/EyJwE1SXQKEeY/NMgm9oHB
	 tFZVuQtUzi7hA3PUKNhDiIViyUp0SHxDcKC/kad62VbEnK6hZ2YaisS4ZTHDtdj65G
	 kBz1ROeebJds0quSurtgOAfPwElV9F6/ZWDEGMuoIL98Wp1SfgHANduYrB7kLe/zYT
	 LCiBGqCkdbbG9poTc2PiI91mq/n0IQVub0BdL31xr+2p3j7VSUDabS36spR2Q9H/u8
	 OCIe44z8pn3/3R329cWpfN4puIJAmKalHWNuOou4TnJZYmdkcnTi+3jCAdL/pS5hI8
	 jKNpjf9qkJg4w==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c5349ba802so188642385a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 03:20:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrcNux9X1psHubvQ/v1D1/6lqQkqXEb/rTa54fJy/Nj2fS1tioq9uqtbR0/lILF4OYoo3kJG8gjLC9MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx3yHuQunapDJ2TKKg6vaBQh7UZGo/wuL0hgfeUppF5QDL20Q0
	xDf/0mq/b95ELIFVa+2oG+ud35yL6Uc5d+ob24gieRg2IY0TuxuYFRX8qOB1UebQThlQqMivy+X
	wkRXbafLXAhUQjAqKjtdNSx46YvG043U=
X-Received: by 2002:a05:620a:458f:b0:8c6:a034:9224 with SMTP id
 af79cd13be357-8caefeb5124mr294393085a.47.1770376835715; Fri, 06 Feb 2026
 03:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
In-Reply-To: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Fri, 6 Feb 2026 12:20:24 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNh63kg7QNOVhn4As1nGBLDLEy72zaiz0i2+CZKe=f9WuA@mail.gmail.com>
X-Gm-Features: AZwV_QjCrScYWjPV5ppNztAa4kuGugsdR88HnW_ml3c8dytE-xCI9Xjh09UuXZQ
Message-ID: <CAJ+HfNh63kg7QNOVhn4As1nGBLDLEy72zaiz0i2+CZKe=f9WuA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/3] bpf: fsession support for riscv
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com, 
	puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev, 
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leon Hwang <leon.hwang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_032038_143713_E09BAC2A 
X-CRM114-Status: UNSURE (   7.21  )
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

VGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRoaXMhCgpPbiBUdWUsIDMgRmViIDIwMjYgYXQgMDY6
NTIsIE1lbmdsb25nIERvbmcgPG1lbmdsb25nOC5kb25nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJ
bXBsZW1lbnQgYnBmIGZzZXNzaW9uIGZvciB0aGUgcmlzY3YgYXJjaGl0ZWN0dXJlLgo+Cj4gTWVu
Z2xvbmcgRG9uZyAoMyk6Cj4gICBicGYscmlzY3Y6IGludHJvZHVjZSBlbWl0X3N0b3JlX3N0YWNr
X2ltbTY0KCkgZm9yIHRyYW1wb2xpbmUKPiAgIGJwZixyaXNjdjogYWRkIGZzZXNzaW9uIHN1cHBv
cnQgZm9yIHRyYW1wb2xpbmVzCj4gICBzZWxmdGVzdHMvYnBmOiBlbmFibGUgZnNlc3Npb25fdGVz
dCBvbiByaXNjdjY0CgpJJ20gaGFwcHkgd2l0aCBlaXRoZXIgYWRkcmVzc2luZyBMZW9uJ3MgY29t
bWVudCB3aXRoIGEgZm9sbG93LXVwLCBvcgpzcGlubmluZyBhIFYyLgoKRm9yIHRoaXMgdmVyc2lv
biBwbHVzIExlb24ncyBuaXQgYXMgYSBmb2xsb3ctdXAsIG9yIGEgVjI6ClRlc3RlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gIyBRRU1VL1JWQTIzL0RUCkFja2VkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
