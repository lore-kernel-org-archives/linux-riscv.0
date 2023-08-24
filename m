Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1BC6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y535E2Z9onBwwaoU7q87b27guz968/VzDm+XxINJD1o=; b=zE7c0QXSPEa1Qw
	74P+cB6h+qV9tMgvJX2WV5O2x7BUNXy0lFilQYpiu2HhRFivTg2mBExh+1piyBPE7vtKGs7Oooz1N
	U7dfKZ7jMUgyekNdcQkq8omalTVN45Fmk2WWGDiES/nkFbc96ngszZN+rMnW+dNybUUUPWsHW09x3
	/zJ7grXANQmzmIzc6qW/gXQreHfueVWoBb2XmLPwZ3250uhjSP3GTvHFKReDAa5um5wv3v5UbZOXs
	BSEZiVz32Rvv5TEOFSjETW1vrL4CFi9NLLjPmgsJEluRCyffvixPCnplmWriVG2mlCHp9nRRubAHY
	XTm1G3R1oB2ZrcqbZg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIfl-003urg-08;
	Thu, 24 Aug 2023 22:19:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIfh-003urG-2h
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 22:19:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27E12670EA
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 22:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C952C433CC
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 22:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692915560;
	bh=zvH8ONOUJWk9e87genF3KmOMumc0b+2p11O9YN0uraU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Py9k2pBynJepls2T4y1A5dYXBOUBsYr/oyTG5rN13nfoKhzOnEbkTwRrwOK2xB3DQ
	 HnW2YN/npJ4d/FGrPv/gKh+QrBMHxiQynYBsdTGeooDkT1Ie/gqToTtxp/N08YM17A
	 y6sQKI+4bcu6DHawsCXgMj2cqrZ6rOfpfryt+o1eKtQpjkkph8hy6wohB84935sg3J
	 scMMKMtNGoH+BYelFpIuU0TIiX7CvrA89okXXS40NhKYliU1OABTbfReE1sFfwPZfy
	 F7in4L+LE5k6Z5S2kizXOX77M9c+aAh6Hi8lp4ktXuYtpgp5ar2EJ30z/Zcu/k6kem
	 l5oeLOEydkqMw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4ffa6e25ebbso1661212e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 15:19:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YxuJQB1OLDxl/kYtDpfXr64kyyhma3K7M1yIEJDoJSWPO9r8OjY
	naNTrUpIY7DatCsZnkkINXWIEFCq1ahg55LmDZA=
X-Google-Smtp-Source: AGHT+IF2/zODRPW5Xo9uTDOdjogrYYoQqdmXIyi7fsgZ23qeHth2bWzkXZpzsrjdMEfTmPWdilSHUZJb7Eond9KK2Y8=
X-Received: by 2002:a05:6512:1193:b0:500:9a50:8970 with SMTP id
 g19-20020a056512119300b005009a508970mr2066629lfr.31.1692915558581; Thu, 24
 Aug 2023 15:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230824133135.1176709-1-puranjay12@gmail.com> <20230824133135.1176709-4-puranjay12@gmail.com>
In-Reply-To: <20230824133135.1176709-4-puranjay12@gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 24 Aug 2023 15:19:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4hfBMvB9DzM=ZCnq5Bz-bpFTP1gBujyEN7NxdsXnnceA@mail.gmail.com>
Message-ID: <CAPhsuW4hfBMvB9DzM=ZCnq5Bz-bpFTP1gBujyEN7NxdsXnnceA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/3] bpf, riscv: use prog pack allocator in
 the BPF JIT
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	pulehui@huawei.com, conor.dooley@microchip.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, yhs@fb.com, 
	kpsingh@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_151921_937203_749CEE29 
X-CRM114-Status: GOOD (  10.74  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNjozMeKAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eTEyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBVc2UgYnBmX2ppdF9iaW5hcnlfcGFja19hbGxvYygp
IGZvciBtZW1vcnkgbWFuYWdlbWVudCBvZiBKSVQgYmluYXJpZXMgaW4KPiBSSVNDViBCUEYgSklU
LiBUaGUgYnBmX2ppdF9iaW5hcnlfcGFja19hbGxvYyBjcmVhdGVzIGEgcGFpciBvZiBSVyBhbmQg
UlgKPiBidWZmZXJzLiBUaGUgSklUIHdyaXRlcyB0aGUgcHJvZ3JhbSBpbnRvIHRoZSBSVyBidWZm
ZXIuIFdoZW4gdGhlIEpJVCBpcwo+IGRvbmUsIHRoZSBwcm9ncmFtIGlzIGNvcGllZCB0byB0aGUg
ZmluYWwgUlggYnVmZmVyIHdpdGgKPiBicGZfaml0X2JpbmFyeV9wYWNrX2ZpbmFsaXplLgo+Cj4g
SW1wbGVtZW50IGJwZl9hcmNoX3RleHRfY29weSgpIGFuZCBicGZfYXJjaF90ZXh0X2ludmFsaWRh
dGUoKSBmb3IgUklTQ1YKPiBKSVQgYXMgdGhlc2UgZnVuY3Rpb25zIGFyZSByZXF1aXJlZCBieSBi
cGZfaml0X2JpbmFyeV9wYWNrIGFsbG9jYXRvci4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5
IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogU29uZyBM
aXUgPHNvbmdAa2VybmVsLm9yZz4KClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
