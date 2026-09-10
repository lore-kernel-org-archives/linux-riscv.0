Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBFFC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2b8SLABZCiZX++Bvi/iQDb6MHIgedW++Fs7hhr4EvI=; b=fZGRUaelq08tNV
	RPUWfXRKKoBw0Jh9rRLwiKN0BczFD+2jUrWSHi6nrCOPVFZD93HNMR7+nE6IGFqe+X4DT+oV8Cedq
	DeOe8SZBzn3HdQw5CLfrl9OhVpHGonoClpOUb2QywKAMR2nmlxY4GXpqFUPpaEt1kxBgeLZAjN3Em
	5CHzK9F+AvP0oy0vjdjRThLxI2q6bOV91j9H2UwFHH0lUxxt1LEl8YwbG3ihK5S1Hb5tb3xhkMEBZ
	BMXzdV52no9l152i+63kkO8Hydtzp/LZPSUchoFRj0oEfWwph6iiQhBWn9+TPup4VE3xUp66JE9HW
	vymStZxippDZOMyNWILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cv7-0000000ECPM-0tur;
	Thu, 10 Sep 2026 11:26:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cv5-0000000ECOU-1W4h;
	Thu, 10 Sep 2026 11:26:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0735600C8;
	Thu, 10 Sep 2026 11:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2633C1F000FF;
	Thu, 10 Sep 2026 11:26:14 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-tegra@vger.kernel.org
In-Reply-To: <20260810124315.433448-1-vladimir.oltean@nxp.com>
References: <20260810124315.433448-1-vladimir.oltean@nxp.com>
Subject: Re: [PATCH v9 0/3] PCI prerequisites for PHY consumer/provider
 split
Message-Id: <178903957471.12380.4841684625788511364.b4-ty@b4>
Date: Thu, 10 Sep 2026 13:26:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
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

Ck9uIE1vbiwgMTAgQXVnIDIwMjYgMTU6NDM6MTIgKzAzMDAsIFZsYWRpbWlyIE9sdGVhbiB3cm90
ZToKPiAiW1BBVENIIHY4IHBoeS1uZXh0IDAwLzMxXSBTcGxpdCBHZW5lcmljIFBIWSBjb25zdW1l
ciBhbmQgcHJvdmlkZXIgQVBJIgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBoeS8y
MDI2MDUwNTEwMDUyMy4xOTIyMzg4LTEtdmxhZGltaXIub2x0ZWFuQG54cC5jb20vCj4gYmVjYW1l
IHVubWFuYWdlYWJseSBsYXJnZSBmb3IgYSBzaW5nbGUgcGF0Y2ggc2VyaWVzIGFuZCBuZWVkcyB0
byBiZQo+IHNwbGl0IHBlciBzdWJzeXN0ZW0uCj4gCj4gSGVyZSBhcmUgdGhlIHBhdGNoZXMgcGVy
dGFpbmluZyB0byBQQ0kgZXh0cmFjdGVkIG91dCBvZiB0aGUgbGFyZ2VyCj4gc2VyaWVzLgo+IAo+
IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8zXSBQQ0k6IGNhZGVuY2U6IFByZXNlcnZlIGFs
bCBlcnJvciBjb2RlcyBpbiBjZG5zX3BsYXRfcGNpZV9wcm9iZSgpCiAgICAgIGNvbW1pdDogZGEw
Y2VjMGQ4ZjA4YmY0MTlhYTc2YmNlNDlhNjljMTBjMzFhYzRhOQpbMi8zXSBQQ0k6IEFkZCBtaXNz
aW5nIGhlYWRlcnMgdHJhbnNpdGl2ZWx5IGluY2x1ZGVkIGJ5IDxsaW51eC9waHkvcGh5Lmg+CiAg
ICAgIGNvbW1pdDogODFhY2UzZDc1YzJmY2E0NzdlOTUwMzVjOTlkODI2ZWZhZmIyYWQ5ZgpbMy8z
XSBQQ0k6IFJlbW92ZSBkZXZpY2UgbGlua3MgdG8gUEhZCiAgICAgIGNvbW1pdDogOWE5ZDE4NTQ3
ZGRjOTdhNzNkNWQ5MGNmZjRkNWFlZjkwYmQ4YzE1ZAoKQmVzdCByZWdhcmRzLAotLSAK4K6u4K6j
4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
