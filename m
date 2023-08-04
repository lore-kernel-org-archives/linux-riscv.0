Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC10C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ruz423ldE9GG8pNZccDSGwhvjzSw9RPNSqbjqtEzUc=; b=bQhQOh79+YAen9
	w2K3zPODe7Pmx/149CcO/Znf2QVlPoQUUixPOtt5jAIOYlur/hBDZIxluO85dUWLu+O+iYKD4L2ne
	Xhfz+Kb4Ihd5q2zTDpglPjqq1NeQcDDrSSIzIQdBhO6XuVUIUvfuOQOG+hLnbaBUSR3Mo15VKLuzX
	2W4R/fzpdB+/iHfuPl3JOj5wKW6W8e4xBMwhxYMgrIiYuxYci00jEdBDgBKdRkzkmWPVFgCLD9Qf8
	DErnNetXSrMdwTEpU4QTQfKwFA2IiocbDyXBg9H2FBzEq7kdDHbaMuLNQdu65JPoTW3cGWLJAZkGE
	7jNnhFsb7p4QaEnZ+Z7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyWi-00CtNj-26;
	Fri, 04 Aug 2023 17:23:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyWf-00CtNC-0l
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 17:23:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96B3D620D3
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 17:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D7FC43395
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691169823;
	bh=pX4JO8cUMPFX/7eqCt97XOCu1Qwjs6jTjWKwADOJ3hM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eXx/hocet7GcuQXmEnd8oc8WA31nITE5YL0fB8/IVAofYd3M8Qorx70SE7ytCAghe
	 nTtiDW3K+i7SFDqsiRkjLbI4etNMh61X11ya/Qzussiod+4K2wfBWeteoZM/Kwn9xf
	 EwA07/pBieD75nXplqq9YIgBUuZGfboSDT+E7oVd0Of5qNmPNuYG+AgX3DEb+XZVn6
	 38GBb0TTQMm81sYAiz3Xh8kqu7GUCNomOdqFemGINap9QwHSSBqjLnR6uwmkdg+zsX
	 DEOP8l5DB/5bA4O5L2dPx/9ixFSY8jbFPnq0OwtfsI7fSg+Ot2rSOJV7DCsMh2lSGj
	 cfCDKaf6Lgw/g==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so36439351fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 10:23:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YzGtt2pHMHISBd1YPttZ/UTmjdMi6VaAHOJww9SZfdV1uaxywrA
	njSQ6sHja0tFnH11LbPYzrm9wiRg7g9TrP/6tQ==
X-Google-Smtp-Source: AGHT+IF0j6TlCYvGUVtXd1S/Q0iv1iISN2MYMAf+QAGxO0EdffC7eK6t++9XFQxUNAzy2RqY402LhHUiQr0RNIifL8o=
X-Received: by 2002:a2e:88d6:0:b0:2b9:cb50:7043 with SMTP id
 a22-20020a2e88d6000000b002b9cb507043mr1896653ljk.2.1691169821442; Fri, 04 Aug
 2023 10:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230728195022.1198555-1-robh@kernel.org> <20230729-twerp-avert-70577ff7d952@spud>
In-Reply-To: <20230729-twerp-avert-70577ff7d952@spud>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Aug 2023 11:23:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJip=r-xObhCOnL0sue67Pems8wO1FP3x=rCGXARCA1sw@mail.gmail.com>
Message-ID: <CAL_JsqJip=r-xObhCOnL0sue67Pems8wO1FP3x=rCGXARCA1sw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: Enable COMPILE_TEST for more drivers
To: Conor Dooley <conor@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_102345_316224_A22D3F91 
X-CRM114-Status: GOOD (  11.14  )
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

T24gU2F0LCBKdWwgMjksIDIwMjMgYXQgNDoyMuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAyOCwgMjAyMyBhdCAwMTo1MDoyMVBNIC0w
NjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IFRoZXJlJ3MgcXVpdGUgYSBmZXcgd2F0Y2hkb2cg
ZHJpdmVycyB3aGljaCBhcmUgZWFzaWx5IGVuYWJsZWQgZm9yCj4gPiBDT01QSUxFX1RFU1QsIHNv
IGxldCdzIGVuYWJsZSB0aGVtLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+IFBhc3NlZCBhbGx5ZXNjb25maWcgYnVpbGRzIG9u
IGFybSwgYXJtNjQsIHg4NiwgcmlzY3YsIHBvd2VycGMsIHNwYXJjCj4KPiBEb2luZyBpdHMgam9i
IEkgc3VwcG9zZSwgdGhlIHJpc2N2IHBhdGNod29yayBhdXRvbWF0aW9uIHN0dWZmIGhhcwo+IHNw
b3R0ZWQgb25lIG5ldyBjb21wbGFpbnQgZm9yIGFsbG1vZGNvbmZpZzoKPiBzdG0zMl9pd2RnLmM6
Nzc6MTk6IHdhcm5pbmc6IHVudXNlZCBmdW5jdGlvbiAncmVnX3JlYWQnIFstV3VudXNlZC1mdW5j
dGlvbl0KCkxvb2tzIGxpa2UgdGhhdCdzIGEgY2xhbmcgVz0xIHdhcm5pbmcgb25seS4gUHJlc3Vt
YWJseSBpdCB3YXMgYWxyZWFkeQp0aGVyZSBiZWZvcmUgdGhpcyBwYXRjaCB3aXRoIHRoZSByaWdo
dCBjb25maWcuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
