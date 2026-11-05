Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7930C606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0KA/vlNr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQmT+uC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JsryUuuAIm2l2mToTMnqHJ/MeP5nGKmRJ4VVxFFVK0k=; b=0KA/vlNr+Wv+KXD3yCIP9KfRVq
	/kQecnaNcq8qt2lsPUWZ0swFGQQltZha5nWYNdlfEm+GVFJxtJIFVmTc1nPC5NU8ntu2ZZgYPu7ln
	u3m5f7j+LjLU+uk3ccoskrv+ERP4cSFIfjHPJHXG3aFT+aVYGUOqAjz22tmtft/Pv8jp4F8MmH7t0
	WtMm0Ukrjm0hXafO30ptc575exvarW/fm7BXiPYbSu43i/PXmhm9gRcPH4BpMgep+0Pv3fLkMBFuh
	Pi4cu5R2BnHpxQxz7DP6coTUZODvp9zHMf97wublaRvQJGE6jJvLnAmRMUXf9ObKG6TNO/WwEMqg7
	aN2r35xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsdK-000000086tH-3bOa;
	Thu, 05 Nov 2026 08:15:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsdJ-000000086tB-34ht
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:15:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 617FC43D3D
	for <linux-riscv@lists.infradead.org>; Thu,  5 Nov 2026 08:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460561F00A16
	for <linux-riscv@lists.infradead.org>; Thu,  5 Nov 2026 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866541;
	bh=SlJEODHK5MhthQR/d2UxlA9DGUVXpksfxM99m3lFYgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WQmT+uC9OrCA13ynSLmpLIRum4zNdUoKsGrsDvhAEslXqC22LA6/LfAvWjC0HV59a
	 YRUNLGBOhWmPSpmRS2f22eVgpEq7lza7e7wI4d7+wWLlvPnV8/WuPp+woW0xjVUFgd
	 BzGm/HAXQNrSsrpU/MOucBbx9dEMChy1Eu0R1HbZI0aBW28aFVg8b4x+YaPaRC3HNr
	 yo5994LMT5XOPHJy+Owc3HpHVmrJ4GkDYPimFgWq2//sHRuuzJmZpEIcj5SVPZ+2Qj
	 /CsBLKa4WEnxPfIOR1Nj6s5TggJaykdH4vio5BO1yvtP7A2nisemy6Fd2KcpY3wK1T
	 ooTVfGhc8tKXQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso1238307e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 00:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwdNmlkf4b7vA3G1lgz6W6hOD+Lxy/kua9i7CXtm2cqooOnCrh8PlId0ea6CpuFbv87N55BAqrx9F65YQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CEO19kS6Nkj/GNS+dBMSkFUweCzH4R5fj282nQPwaihaQ2bMS
	rVJnB5M2xRgqSViGYBOtrzr/EOJtzJJLW/QX56teDEc+sBGU3ZENzUFtdpZVbuN/YN7/nsFPXBB
	4MLkYsc+ngTU3x0PMVCOZF1iDAE3Is+Q=
X-Received: by 2002:a05:6512:3056:b0:5bf:b96b:2c75 with SMTP id
 2adb3069b0e04-5bfd957c416mr6871531e87.37.1793866540055; Thu, 05 Nov 2026
 00:15:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030181214.2448140-3-conor@kernel.org>
In-Reply-To: <20261030181214.2448140-3-conor@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:15:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAD=SqT9p0U3ZoynfHoLoDqFWVGqnrr20=XbinmGQg5w@mail.gmail.com>
X-Gm-Features: AclHuK9dF7wnimf_TqjYQ2LeWPJLM4JGM9lr2Af8kMxRnI3M55-B2AgQwBBIkvM
Message-ID: <CAD++jLkAD=SqT9p0U3ZoynfHoLoDqFWVGqnrr20=XbinmGQg5w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mpfs-mssio: remove unused mutex
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNzoxNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBUaGUgcGluY3RybCBjb3JlIGNyZWF0ZXMgYSBtdXRleCB0aGF0IGlzIHVz
ZWQgdG8gcHJvdGVjdCB0aGluZ3MgbGlrZSB0aGUKPiBnZW5lcmljIGR0IG5vZGUgbWFwcGluZyBm
dW5jdGlvbnMuIFRoZSAoY3VycmVudGx5KSB1bnVzZWQgbXV0ZXggd2FzIGFkZGVkCj4gd2hlbiB0
aGUgZHJpdmVyIHdhcyBpbiBSRkMgc3RhdGUgYW5kIGNvbnRhaW5lZCBhIGN1c3RvbSBkdCBub2Rl
IG1hcHBpbmcKPiBmdW5jdGlvbiwgYW5kIHVzZWQgdGhlIGRyaXZlcidzIG93biBtdXRleCB0byBw
cm90ZWN0IGl0LiBUaGUgZHJpdmVyCj4gcHJvYmFibHkgY291bGQgaGF2ZSBib3Jyb3dlZCB0aGUg
Y29yZSdzLCBidXQgdGhpcyBpcyBtb290IHNpbmNlIHRoZSBtZXJnZWQKPiB2ZXJzaW9uIG9mIHRo
ZSBkcml2ZXIgbm8gbG9uZ2VyIGhhcyBhIGN1c3RvbSBkdCBub2RlIG1hcHBlci4gUmVtb3ZlIHRo
ZQo+IHVudXNlZCBtdXRleC4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
