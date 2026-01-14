Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE05DD37E37
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ+CNz9V2xzOsWBwktJ6/JUin21vwvlrtVb7tbWMuLg=; b=B9R6UibWFIHKgj
	UtY/NZf+YFEabggDbbPX3hGfRrwDOjpf6k3AyZh3wdoXrl6RESzcAHC6H4NVxRxSW1yLSBtB5OsBA
	eL+8qqCdpq0dZVsZtZdhXZsklgue5Xi+H4ToPFG6qzNvvmdMl+U37Fmoys0CXvAuwDsF8SVkabx6J
	y+HDGU5AkokUO5WskKUSYWBQMIFeGoSXN0xP6YFoBdpzu0c+QGR3Lf3SOT0IaoiUeNpy5qo8f0fjt
	A2ULng+c+Gx3jY0MTpmXJPpM22bGCQgzdyOk3f6q2trzpy4gaeCruGTUTW1X5oudQXJcksN4ceRdo
	r5yi8U7jp0BfzyKuFgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1KT-00000009PnD-2TtI;
	Wed, 14 Jan 2026 13:54:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1KS-00000009Pmj-1VF3
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 13:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D24F860053
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 13:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BB2C19425
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768398870;
	bh=pko9oW1g+IluAhY7M1qdOiwhwRkDyq9ZjyBhU9sgrLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cvxhmlDBIWz66KMgGJkZsiNg/kcCqFr1SH2ajz4Bvlp3FXF1JN9gkfEwuB94fgep1
	 KS5DH+zPbowY5TrkhD/Zt5J/WdDPj7dWOv2cn/iyNDzs5idHyyp5AL02jAw5vU90wa
	 Zv65yzYpKrdbVxK4cH3wJMcTIwAN88JY1bVrc5DyBMDw4syzWnhgJj7hObOk/jj9KM
	 Dis0MQ7Wvhq5uQeNhfxgCSPCc3lUtg4hOBovQxeRBnMSdsJtfWm5grYPKc0WXD27Xv
	 JmI7oGwHohvMSsppF/ppe1Xa0s7eSDHVlSCWWCymp53g0mCrR+7QSKuXVpQeNKhDkO
	 Di5lkP5NfUR2Q==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-644798bb299so8294702d50.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 05:54:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrp3ptPYfbrPjUN0grl31mtPodzu8Hozx1SVpzZNuZAUwXUAhVYN8CcC+FNGzfPlJ42IyfA1NRFrzzOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGXwIgUHGmUGT3vhni5ilV50XYS1NSqzDft/r3L3vFVjAHMPmV
	UpEHagSp5IuY93w9hNpAAFiqNeut/XOUBnAIeLzuySPgDWmytPYjQJDEKWNz4HFKWkwAPo3VzsH
	7EoahSSNyRnDkiV1avytvrokyb+/e8S0=
X-Received: by 2002:a53:ac8b:0:b0:646:5019:f3f2 with SMTP id
 956f58d0204a3-64901a9c702mr2454045d50.19.1768398869885; Wed, 14 Jan 2026
 05:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20260114-k3-pinctrl-io-doc-fix-v2-1-025b05f9e65a@gentoo.org>
In-Reply-To: <20260114-k3-pinctrl-io-doc-fix-v2-1-025b05f9e65a@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Jan 2026 14:54:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLk-dg1Hh28QaTo+0nONAP1PiOQza1-L3Nn4XJEeEShmuw@mail.gmail.com>
X-Gm-Features: AZwV_QgO7G4JdjPod5hP416XqHCDN-684za1JJpJPBU8JnvDVeq9VXheBatx4Aw
Message-ID: <CAD++jLk-dg1Hh28QaTo+0nONAP1PiOQza1-L3Nn4XJEeEShmuw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: spacemit: k3: fix drive-strength doc
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong@riscstar.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMToxN+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gRml4IGEgdHlwbyBpbiBEVCBkb2N1bWVudGF0aW9uLCBpdCBzaG91bGQg
ZGVzY3JpYmUgdGhlIDMuM1YgZHJpdmUgc3RyZW5ndGgKPiB0YWJsZSBvZiBTcGFjZW1pVCBrMyBT
b0MuCj4KPiBGaXhlczogNWFkYWExYThjMDg4ICgiZHQtYmluZGluZ3M6IHBpbmN0cmw6IHNwYWNl
bWl0OiBhZGQgSzMgU29DIHN1cHBvcnQiKQo+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
WWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+CgpQYXRjaCBhcHBsaWVkLgoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
