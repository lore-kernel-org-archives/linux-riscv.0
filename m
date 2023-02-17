Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F51C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZC4sXqs4zY9dHLn+u0nqo6qJWyXFWaS8h5B2g+FAzQ=; b=VzcHB9CzXZqBN8
	RttFGNhgbMOY32uWj79i53cxEL4Igj6JZhu3oBv8nHj2NL15NIw3JzLwD14fFTezoLnU6bVboYDGH
	268x93aFCGwXLZOTxIa3jHUlnPWFUqoJCz9G2tBCvVW1G5tcwUOOgRDgVnOnIoNwZlYmCyd+kty8S
	Va0Vgzf9hBKRnuPt00PtEetRgrEzBoeBJhhadGiF7QtFLYnRUa77kwNypbPvk46noXv1XVknyjl+s
	k0vSOm5BwQcjR2wAGo1Yo0bmvWGYaUrEPaRsbrzERF0LGH/3CFSnqePdc09KUjzzoDHHOuorgqXU/
	2wtEcbHdtDANfGreLpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2NG-00EltM-Ri; Fri, 17 Feb 2023 15:10:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2CK-00EgIM-FT
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 14:58:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8002561D4F;
	Fri, 17 Feb 2023 14:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECF2C433D2;
	Fri, 17 Feb 2023 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676645931;
	bh=MtqNCOwgfK+uXpcr0rZdEnDp31xRiNLfgJsnxPeWYqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y+nxlJ/gcm1x1jXsY3cF3B2F4DeZFxJ9wZOVnugbYAbAfjCUaUNp6p8wLm6FsPubc
	 y2vH2kqB56EDNmv6n9vtjALmNGH0PYbk1CIRl/oF53U5XcUxCzzv9XtK04QMvq4Qhg
	 n8t43QZ+dFseHw1S4ynHE9XUtR4jMpd2TtHiKWBgTrrnP9fdYcYAmbp4ojbYCkQni9
	 4JWBeXVn+vRxHUTHYiG8pQT89DD73jY/kZVn5jLYwZklPZsb1ujOFPKmcJKTzRnW6X
	 e7Z54JinCqoqpi2P+C/zcmlGwW5QT/aNTofmP7TJgXMt/maIyvhVUGBl4v5sE6sAGU
	 6ClN341Ryg/0A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel
 address space
In-Reply-To: <20230203075232.274282-4-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
 <20230203075232.274282-4-alexghiti@rivosinc.com>
Date: Fri, 17 Feb 2023 15:58:48 +0100
Message-ID: <873574uymv.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_065852_640022_653612F9 
X-CRM114-Status: UNSURE (   9.76  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoZSBl
YXJseSB2aXJ0dWFsIGFkZHJlc3Mgc2hvdWxkIGxpZSBpbiB0aGUga2VybmVsIGFkZHJlc3Mgc3Bh
Y2UgZm9yCj4gaW5saW5lIGthc2FuIGluc3RydW1lbnRhdGlvbiB0byBzdWNjZWVkLCBvdGhlcndp
c2Uga2FzYW4gdHJpZXMgdG8KPiBkZXJlZmVyZW5jZSBhbiBhZGRyZXNzIHRoYXQgZG9lcyBub3Qg
ZXhpc3QgaW4gdGhlIGFkZHJlc3Mgc3BhY2UgKHNpbmNlCj4ga2FzYW4gb25seSBtYXBzICprZXJu
ZWwqIGFkZHJlc3Mgc3BhY2UsIG5vdCB0aGUgdXNlcnNwYWNlKS4KPgo+IFNpbXBseSB1c2UgdGhl
IHZlcnkgZmlyc3QgYWRkcmVzcyBvZiB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UgZm9yIHRoZQo+
IGVhcmx5IGZkdCBtYXBwaW5nLgo+Cj4gSXQgYWxsb3dlZCBhbiBVYnVudHUga2VybmVsIHRvIGJv
b3Qgc3VjY2Vzc2Z1bGx5IHdpdGggaW5saW5lCj4gaW5zdHJ1bWVudGF0aW9uLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKUmV2aWV3
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
