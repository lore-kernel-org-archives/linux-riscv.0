Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38869606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OR7Z+YC5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anVIaiiw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m81dMUHaZq9wMcQ19+7Lc4tUSUn461AeRCF46e3R2w0=; b=OR7Z+YC52k4pLsrXvPRdyH1+Fd
	SnNgObgdbzF7X9vU76ufKRlDEEfNQIdHfqVKcB7w9xFGxSkS8EaMqzuKUP5F2kZ4rd8+/YlYXpo31
	qXyI0lFAIJztavn3RzytGWEm4gDdSMgpgnYYrgtZJH4Js29UyLg8V+PM07hFJ8aUguygrzQV7Bcpe
	VmPL+LUJVUHAazNRWds163QvCj9GKvFzj0J0d+ZDiI4XhK2SM+6VwxNnedu3FfyHqVgYmCUp+kyHU
	OWXkV2reGqq4RHPz3qDDpCb8L1TuID6smiMPe/QjV4H9eJitCZGcVBWEWJqKyLMFKfvmVfljJrmxc
	3FCMAmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaqs-00000005Sbi-24ng;
	Wed, 04 Nov 2026 13:16:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaqq-00000005SbR-3qNz
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 13:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A36260ABF
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 13:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C151F0093A
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798188;
	bh=H9VTlijTFGW2hK1YgmVnrnjy6rcLsJbVdxBVMKqQ5Mk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=anVIaiiw1pZMJg2YZ1N3c1UamUmvnrrKGQWnO8NEpY87ayerF9aRI865xN7k4arhP
	 0ora4PhcKUA7tc3gRf5KJPZRLzDlKLUVlUaqjd2AMjgBarla0oTMiSTZyFgbsGYlwY
	 fsVOjVqGXMbB1lKrRbyHQGM8moEQGCArsVVqCajNxylEETrn8qtM2iWzHaOLT43wdY
	 9CF1Ojyj4aExSItAwUd/2QmsiJWsZaO/6jXd0s8gtn7I/G6Mjw5g7TIub3bSE58eC8
	 ii1USs42gD/OF3w97LAp+kC8W3GgxUmmbmvKzN05ws3y5BPE6ZVY/ahrli3ugfB9y1
	 B7FSo5BHSH9EA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so496097e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 05:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByujZoVPANQnyVByqRZZZqSheoy7wp6mbKCyd1uKsPxiqvWcTEWrDS010rHH+vlaZxhdLJZNRrRSK1FdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8U0yB/o1o8Gs92ntJroj8560Pw4Kd2zDwTZN1XGqc2XOtfDUSL
	XMwfe22I0I8nqlD/VECb+hVz+iWMKpXXhhKucZO3IKOkFO9yuiK1zO+M7MG+XHQQ/u/NNRPzdx8
	uYJOFisYktEKFaqeQAiUZ7nMx1Rqsfvk=
X-Received: by 2002:a05:6512:6681:20b0:5bf:d9b4:9b48 with SMTP id
 2adb3069b0e04-5bfd9b49cfdmr3241637e87.23.1793798186772; Wed, 04 Nov 2026
 05:16:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-7-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-7-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLk_PJu_ViUmKSg19VEhc0=3SoyiqwkSH3vGix1qk7xpDA@mail.gmail.com>
X-Gm-Features: AclHuK9XaDppXSCtd7Lxt5eqeFEltqu7_7zUAwED7nuqN9o1y9Frwslmkgi1DM8
Message-ID: <CAD++jLk_PJu_ViUmKSg19VEhc0=3SoyiqwkSH3vGix1qk7xpDA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 07/17] pinctrl: zhihe: add A210 support
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

SGkgWmhpZ3VvLAoKT24gTW9uLCBOb3YgMiwgMjAyNiBhdCA4OjQ14oCvUE0gSGFuIEdhbyB2aWEg
QjQgUmVsYXkKPGRldm51bGwrZ2FvaGFuLmlzY2FzLmFjLmNuQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBGcm9tOiBaaGlndW8gWmh1IDx6aGlndW8uemh1QGxpbnV4LmFsaWJhYmEuY29tPgo+Cj4gQWRk
IHBpbiBtdXggYW5kIHBpbiBjb25maWd1cmF0aW9uIHN1cHBvcnQgZm9yIHRoZSBBT04sIFBFUkkx
IGFuZCBQRVJJMgo+IHBhZCBjb250cm9sbGVycyBvZiB0aGUgWmhpaGUgQTIxMC4gRWFjaCBwYWQg
Zm9ybXMgaXRzIG93biBncm91cC4gRHJpdmUKPiBzdHJlbmd0aCByZXF1ZXN0cyBhcmUgcm91bmRl
ZCB1cCB0byB0aGUgbmV4dCBzdXBwb3J0ZWQgdmFsdWUuCj4KPiBBY3Jvc3Mgc3lzdGVtIHN1c3Bl
bmQsIHJlc3RvcmUgb25seSB0aGUgcmVnaXN0ZXIgZmllbGRzIExpbnV4IGhhcwo+IHByb2dyYW1t
ZWQgYW5kIGxlYXZlIHRoZSBvbmVzIHNldCB1cCBieSBmaXJtd2FyZSBhbG9uZS4gUmVsZWFzZSB0
aGUKPiBvcHRpb25hbCBwYWQgY29udHJvbGxlciByZXNldCBhdCBwcm9iZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFpoaWd1byBaaHUgPHpoaWd1by56aHVAbGludXguYWxpYmFiYS5jb20+Cj4gQ28tZGV2
ZWxvcGVkLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTog
SGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgoKVGhpcyBsb29rcyBnb29kLCBqdXN0IHdhaXRp
bmcgZm9yIGEgbm9uLVJGQyB2ZXJzaW9uIGFuZCByZXZpZXcgb2YKdGhlIGRldmljZSB0cmVlIGJp
bmRpbmdzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
