Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E864C55175
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSnXAw+QzWDYdfAxnpbmJLVv6VKzPyHMCN6FY+Q8eD8=; b=1AmHnB4KeRIJDD
	YjToeVQBR2kvE7T4JGCYNH27hjojHw+xvvoK8Ullsm24wt5VA32/2XZ4IgFMe8UQTY/J/p59LwV1Y
	KBn1DRINfiWPU4pjv7HDDkHhBfm1MKUzCK2jAWSvIK8Jz5iMiN1hp1b837cjRWWQEQaF7fEilJzqg
	ncSoZspX7/o+zu36CYFK7v7Omp4u61MOW9UTiQHQHMWBGD4GoSaJxXdePVExWeN3f1aX2eotG1Fl5
	jBnybJ6P11gXt+lEGJUQ4WYcyx/Er7V4mL4Gxu6rrplz2hcQCQjw6WS6XnsUEgt71tQ/rJ9JRtZ6l
	FZ3ZDD7GXkARK3LKf6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnO7-0000000GYRL-10TD;
	Mon, 03 Aug 2026 07:47:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnO6-0000000GYRF-0Xws
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 07:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 178D8439CB
	for <linux-riscv@lists.infradead.org>; Mon,  3 Aug 2026 07:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0FD1F00AC4
	for <linux-riscv@lists.infradead.org>; Mon,  3 Aug 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743225;
	bh=403dFbmwi2uDJ9XkHtGEBz3c5Zn1S63P+m2h+phsk/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S7dY7bgBh/JwmN/pxPWXRBsIZGqBVNQgPTz5vW7eS5zdQCSYmAT/Xmx3DRC0pmvvI
	 nE3It+No5ARtWD84yzpxSuSkad5JYibPOFvWEiiWY9xovK+tWfvZWWhlYDedXmFOlP
	 6QwDBUYAQv8uuL6yOoNA4jTwyeKL1Ns2lslL0u0CQqfEnBnkOggaK54dJnsddW9m6R
	 U9dJCN7Nrks0VdAlXsn4ogHdiobIH8+5Wy/noRlaOwyQ/25BSW5dFKDuWL5qheOC+v
	 pNRkol4SZVqeOgHPecz2Lu0ViTr/YOfVk2xEFT6xbQaQvO5h0VjGFwl9egxUUaAiM4
	 rAg58gxS2PXag==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so22463701fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 00:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp128RGchhPxu6K+f50H42bC6QQ4w3jpK0JtHW7N5brCj5zKxCs+qqOiPJtUwhWPDBFxUuU51/VPb/6nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhXCZmP39PSwn/mnrQB7ZVRri65taWVKJL7F4hUvoO1/6JgiXp
	7S/wFeSNW4OMgsvMqJHmrNUD8P8YBDbTRYmm872AIyKM94cXr9kZSeJ1sRxgZPs0wIFihfY0TyS
	mh+ikVtf+asqWjTRlLvK6vcKNyVcPEc0=
X-Received: by 2002:ac2:446a:0:b0:5b2:9b13:2cd9 with SMTP id
 2adb3069b0e04-5b2e4f8014cmr1179343e87.44.1785743223708; Mon, 03 Aug 2026
 00:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
In-Reply-To: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:46:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkh0BxaNksg8GzBKbhT20B5qutOAkBc5hMODmG=9uLy_w@mail.gmail.com>
X-Gm-Features: AUfX_mzUZKe_fim1woi5skXnfHo0SBeV2P3xbdCqiKquNyg0_pLWmtWIWfBu1s0
Message-ID: <CAD++jLkh0BxaNksg8GzBKbhT20B5qutOAkBc5hMODmG=9uLy_w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: validate pins in pinconf callbacks
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMTE6MjfigK9BTSBUcm95IE1pdGNoZWxsCjx0cm95Lm1p
dGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cgo+IFBpbiAwIGlzIGEgdmFsaWQgcGlu
IElELCBidXQgc3BhY2VtaXRfcGluY29uZl9nZXQoKSByZWplY3RzIGl0IGJ5Cj4gdGVzdGluZyB0
aGUgbnVtZXJpYyBJRCByYXRoZXIgdGhhbiB0aGUgcmVzdWx0IG9mIHRoZSBkZXNjcmlwdG9yIGxv
b2t1cC4KPiBJdCBhbHNvIGZhaWxzIHRvIHJlamVjdCBub256ZXJvIElEcyBhYnNlbnQgZnJvbSB0
aGUgU29DIHBpbiB0YWJsZSBiZWZvcmUKPiBjb21wdXRpbmcgdGhlaXIgcmVnaXN0ZXIgYWRkcmVz
c2VzLiBDaGVjayB0aGUgZGVzY3JpcHRvciBhbmQgdXNlIGl0cyBwaW4KPiBJRCBmb3IgdGhlIHJl
Z2lzdGVyIGxvb2t1cC4KPgo+IHNwYWNlbWl0X3BpbmNvbmZfZ3JvdXBfc2V0KCkgdmFsaWRhdGVz
IG9ubHkgdGhlIGZpcnN0IGdyb3VwIG1lbWJlciB3aGVuCj4gZ2VuZXJhdGluZyB0aGUgY29uZmln
dXJhdGlvbi4gSWYgYSBsYXRlciBtZW1iZXIgaXMgaW52YWxpZCwKPiBzcGFjZW1pdF9waW5fc2V0
X2NvbmZpZygpIHJldHVybnMgLUVJTlZBTCwgYnV0IHRoZSBjYWxsYmFjayBpZ25vcmVzIGl0Cj4g
YW5kIHJlcG9ydHMgc3VjY2VzcyBhZnRlciBwYXJ0aWFsbHkgdXBkYXRpbmcgdGhlIGdyb3VwLgo+
Cj4gVmFsaWRhdGUgZXZlcnkgZ3JvdXAgbWVtYmVyIGJlZm9yZSB3cml0aW5nIGFueSByZWdpc3Rl
cnMgc28gbWFsZm9ybWVkCj4gZ3JvdXBzIGZhaWwgd2l0aG91dCBiZWluZyBwYXJ0aWFsbHkgYXBw
bGllZC4KPgo+IEZpeGVzOiBhODNjMjllMWQxNDUgKCJwaW5jdHJsOiBzcGFjZW1pdDogYWRkIHN1
cHBvcnQgZm9yIFNwYWNlbWlUIEsxIFNvQyIpCj4gU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVs
bCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+CgpQYXRjaCBhcHBsaWVkIQoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
