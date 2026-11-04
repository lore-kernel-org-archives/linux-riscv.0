Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F2606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=31Tp6alz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O48Xwgq5frO2hUHFnz6W4q/f9IAdiWg7bNOB7/jsgGs=; b=31Tp6alzHRkXYtvVKZ5zOrRJux
	RgIf5DxWgun5ArlgoZ0n7lLWCAKGiW3OLcNyulVLB1BhRh8t56zkGmSmCmkULlIx933yK5npGGDk3
	RNtJdvb0UXhtcEOLD8/3Tv5JviP2Msp2i6WQLaugNlVhBofQGhZAXSAhNaJtp2Xywn5QJ1z2H/23/
	R/3dGhtgORRtdAdBy+qfYaIP6uPa+gZBtyq7skUVcnM3fsB3gzisxabzQG/T+ZCyMD7zs2dMYWOjs
	v73DQMVSPfjwBcJ8OWCnw1DsiGYpwLOD2on7etn973voxHCf1GgblhtxPNhmBwRuWkePvOonPVPJc
	PPvWXcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOap8-00000005S9p-3Cxm;
	Wed, 04 Nov 2026 13:14:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOap7-00000005S9K-20aI
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 13:14:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D187343EF7
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AC11F00A1F
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798080;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PSwVh+0eCTT+b5fCxey1CsR0b6m5BP0NC9rEWv/qGoVAp7z7b/X1baMHbpDnRhHw0
	 1IlSHrcLAlVsg55IpOJF5Nkvf2vaGC/fHZEyKH+Don9up9zSqgKV37V5nainUewRr1
	 tAyK+1WI3fZ/i42mU5cbzo+HvC/82f7rkN3yxsVGBPX5SeP8DXJpSKARcrEvAMNSv1
	 RLgoTtiG3rPcDWuwk0+yNZkdNee1OkZ9GCZo58XY+OQNfYVWhHMw4oNuRfTNNgiFs7
	 4AkeoxFWz8uacgEWDIjPHFeVRqn52p+Yr5AhY/9vo5pidgnseQ+ftRBNMagtn2p8xU
	 Pbq1Di/rgQkDA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso428134e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 05:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxyfMx0O+MvzUS3GmPwzKylOdqzaTD1SUXOvHfcInjJOm9uvm8Ny/13LqWVGXaVW57k0aupbIoD1f0bEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+/UBHcUBO7blU4kv+gF7gRGSAy1YU9UKMooMq4LRWsrANQN7dW
	85qy06XNVPn73hB8nxQfqX+3B5bBE92mk9TYtWU6duejNGNtd0BWSGPJYOFSkw7t8hPMp65Z2Am
	/u933SGLA1ISiNCtQQIDYiZAfeZyzRAw=
X-Received: by 2002:a05:6512:3d93:b0:5bf:ac46:c5d6 with SMTP id
 2adb3069b0e04-5bfd956d81cmr4929046e87.12.1793798079384; Wed, 04 Nov 2026
 05:14:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:14:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
X-Gm-Features: AclHuK-6MXT5O-NfPKrU9YAGzhqKyzaaZr6RTIvrirwYp92eUVqCIspXmcEerPc
Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 06/17] dt-bindings: pinctrl: add Zhihe A210 pin controller
To: gaohan@iscas.ac.cn
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMiwgMjAyNiBhdCA4OjQ14oCvUE0gSGFuIEdhbyB2aWEgQjQgUmVsYXkKPGRl
dm51bGwrZ2FvaGFuLmlzY2FzLmFjLmNuQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBaaGln
dW8gWmh1IDx6aGlndW8uemh1QGxpbnV4LmFsaWJhYmEuY29tPgo+Cj4gQWRkIGEgYmluZGluZyBm
b3IgdGhlIEFPTiwgUEVSSTEgYW5kIFBFUkkyIHBhZCBjb250cm9sbGVycyBvZiB0aGUgWmhpaGUK
PiBBMjEwLiBFdmVyeSBwYWQgaXMgbXV4ZWQgYW5kIGNvbmZpZ3VyZWQgb24gaXRzIG93bi4gRnVu
Y3Rpb25zIG9mIHRoZSBzYW1lCj4ga2luZCBzaGFyZSBvbmUgbmFtZSB1bmxlc3MgYSBwYWQgY2Fu
IHNlbGVjdCBtb3JlIHRoYW4gb25lIGluc3RhbmNlIG9mCj4gdGhlbSwgYXMgd2l0aCB0aGUgVUFS
VHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gWmh1IDx6aGlndW8uemh1QGxpbnV4LmFsaWJh
YmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KClRo
aXMgTEdUTSwganVzdCB3YWl0aW5nIGZvciBhIG5vbi1SRkMgdmVyc2lvbiBhbmQgRFQgYmluZGlu
Z3MgcmV2aWV3LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
