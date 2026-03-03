Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D654EC0480
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Yodj1uZUBD8yBXLjnKj3LtVItxTxXYsMevEKE9Lnbc=; b=qb4q3hZmFzh/Zd
	L+oeEgafxCHn27Gjcx1Yd/rzwX4qx/ZoaejjrMdT8OaeNxGUnXE42cCoEIyjg87XND1x0pIVygZC/
	7yO18GWJUpyVqqQpGs2R6jy8m6B27JXNSb3x0qQyBX+bbstr9ggEVJIdK7V3PaOcqifwmDrATCYbW
	ldaKMdFI26+SI3E3hkHvU2iMbmjUnpNBoTNivup5WvyOvL0OQThPsLOOgZG1a62wOMRmOsCtmomBh
	1E3SfN4XWNZbhcImEQcgSXB+vBDkQ3xr3iedBG7GSMVcBAjKOj/PFUpGqzdV8f5m04NPx2rLq87km
	y29lyvYhJMLygIHOMH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMQ4-0000000EuQJ-2fCH;
	Tue, 03 Mar 2026 09:52:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMQ2-0000000EuPr-0md2
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 09:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 144DC43F7F
	for <linux-riscv@lists.infradead.org>; Tue,  3 Mar 2026 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E702AC2BC87
	for <linux-riscv@lists.infradead.org>; Tue,  3 Mar 2026 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772531516;
	bh=XalzPg49RXPyVEL2vPgmeWZTYucUbBJT1qg2QsW/c+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZQe/dcLM7bextUbFEcHjwIWSvtcSaRFqDHn5x3AZKXWzzMux178+lX6I1injdSSLp
	 JSgTaixa/4u6A4oOX+116QqLTJlMN9u2dtjBSMZ9auDhSepUZHPUX42uvu6J54BeR/
	 p8mEczjLEQgdKbTb7eSjzKAc6geeIz/UkbBhdGxYobONM0Hhn/UdVheHnHqZP/T7mf
	 ks3NuMi1kHTN5enUiaG5FOLHoNlEBRr4PU2Ub/ksexF047I9fElFtNE2yl3xbbN2TU
	 CS0jWGHYvz+Rbwr3mZeUuz5aKTchzRijVwG6ZghE3NfoZCnaN1mW+hQDe1iLGQq3bJ
	 2VBC3be7ZGE+w==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so4565692d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 01:51:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfzTjKPdYr1fbaIJRbWePAP5Wd3JmjJex8AurqKTRj0MPt5VlJm7JwAQBnqDNuZ3Xh9wnNQFkukfgn4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrC5o7EyYrJ/SPaQ1k8roizEKoP6bHYCdAkgmJh5gfPppSoArj
	/l5LrtOx4XDy5zwHFwrOiuGK6xstAeyQfxXUsCotzynIKoemz4I5XAfds0bopDjkYwEwGVDN788
	31EBgIVP0n8OU/UIYX102oJXvF2GesrY=
X-Received: by 2002:a05:690e:418b:b0:649:b535:46ab with SMTP id
 956f58d0204a3-64cc2224edbmr12429538d50.49.1772531516289; Tue, 03 Mar 2026
 01:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20260213-stole-economist-d5b0ac711d42@spud> <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
 <20260303-crazy-shrink-ef2c085c99c4@spud>
In-Reply-To: <20260303-crazy-shrink-ef2c085c99c4@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 10:51:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
X-Gm-Features: AaiRm50_zRIl3DDZ8TPCxh3-gQQ3XT2N6HjNPMgWYnCBTJLoWzssuKdnbu3f9Bs
Message-ID: <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, jonathan.cameron@huawei.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_015158_265855_FE4DCE2D 
X-CRM114-Status: UNSURE (   9.15  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCAxMDo0MeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IFRoZXJlJ3Mgbm8gZGVwZW5kZW5jeSBvZiBjb3Vyc2UsIEknbGwg
c3BsaXQgaXQgb3V0Lgo+IE9yZGluYXJpbHkgSSB3b3VsZCBhbHdheXMgc3BsaXQgdGhlbSwgYnV0
IEknZCBzd2VhciBJIHdhcyB0b2xkIGF0IG9uZQo+IHBvaW50IHRoYXQgc2luY2UgZml4ZXMgd2Vy
ZSBvbiBvbmUgYnJhbmNoIGluIHRoZSBzb2MgdHJlZSB0aGF0IGl0IHdhcwo+IG9rYXkgZm9yIG1l
IHRvIGRvIHRoZSBzYW1lLiBJbiB0aGlzIGNhc2UgSSBkaWQgaXQgb24gb25lIGJyYW5jaCB0byBi
ZQo+IGxlc3Mgd29yayB0byBnZXQgb250byBhIHBvdGVudGlhbCBmaXhlcyBQUiB0aGF0IHdlbnQg
b3V0IGJlZm9yZSAtcmMxLgoKWW91IG1pZ2h0IGJlIHJpZ2h0IGFib3V0IHRoYXQsIEknbSBsZWFy
bmluZyBteXNlbGYuCgpQZXJoYXBzIHlvdSBrbm93IG1vcmUgYWJvdXQgdGhpcyBwcm9jZXNzIHRo
YW4gbWUsCmRlc3BpdGUgbWUgYmVpbmcgb25lIG9mIHRoZSBTb0MgbWFpbnRhaW5lcnMgbm93IDpQ
CgpMZXQncyBzZWUgd2hhdCB0aGUgb3RoZXJzIHNheS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
