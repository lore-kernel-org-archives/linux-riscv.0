Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B95D2ECF6
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Tfmf8UioNTL5B5jrYF54NVZrizzkKPyckFHtd/JzqQ=; b=fHIAzlgLUmaDZU
	oIEWR5mDSeW/7DLrb6NWLAY1b30/4UkCWtnZuCukLi4/IwWSKs7q5U6ikyvTjAMe+o88cKd0F7DKr
	3I5/T3RW760rXeV0HsXr1oB+4/dvO2av7JgtXBbzKhIH+Tvi1N884hZQibAmvl0iXUSo9nzzjss/D
	uZNCM8t5MXxK6P1Xs7bR+RHc9r19FhI7Sk41g/pyhKfSyz3AX0WPqTHW+USaPV3M277X5M+TcFY0Y
	4PtxHRWvqCWoyp9Ld7GYtQZyBSHCguekC75MDMDuUsUpHpvd8YjwXFBK7tV+AnmWWYuCrq+8lyxmN
	mZi0RXxDGUjeo2AojcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhz2h-00000002yhy-3gFa;
	Mon, 19 Jan 2026 23:52:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhz2f-00000002yhU-2nZW
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 23:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5681E43EE7
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 23:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30613C19424
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768866736;
	bh=oEUu9/PDf523PRaQvLKq/iXwr4E9yKFjaIG8HW8PyjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1fRNObD1fayH8hVIj8ARBKin7GncYXFtALKlfE99kRfDWhzb498K1nNL5Dfwj1kQ
	 NC/3A0TQnWp9yzRURdIbLil3TnHKexA5uocZYaxRDjPQzUPSNqxnTpi7hQ226mRI4v
	 TqCxUjz46PIi9IW9Wzj1xZ725hPrDY36RfJuidS3i9Xp88PentbwSaJshAdYkZiYp5
	 cC1EyjzmIqdVIcANdtvrfhfeGuebPY5qn5doAJ5Dw0cFikX2oJtr6GxEaKvHCUMQfj
	 NEkxZVnOs8epjbE7lsc3hfEIwHflA1mpUZUxS1h8VFhjldioE1n/wWypMRo7od0qOq
	 94g+cnCfEBMgA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64472121ad5so3389030d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 15:52:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnfm5/BdabhG4tl36g4VOHw0FhN8e1UKz42343nigPHX0bFaHW6IU4pLZK0sWRncKxgFDXXtGj3glaNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YycfzymYdeLGEVOCseL/fmypz3MNKYLVsmEQHHPFGKylK4dDxRL
	DKDsjOxyNExLmtLV3xDkxMZESbIjZDnqmJqckAGJ/hoyvXtEcKBdI9AXe4PyPcN1GtICt3rgL0b
	SXxfPaFH4ot+zunYwkGwKATnuQeXANz8=
X-Received: by 2002:a05:690e:190b:b0:640:cc09:b7c8 with SMTP id
 956f58d0204a3-6493c7f3a3fmr116732d50.23.1768866735546; Mon, 19 Jan 2026
 15:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 00:52:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
X-Gm-Features: AZwV_QgGDEeGRtBiw30NZCmvNLT-lDgyzgro6X2hF8bkv_0hnJ5tDvF5IEFLosE
Message-ID: <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain configuration
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_155217_746376_CCCB8519 
X-CRM114-Status: GOOD (  13.13  )
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjQz4oCvQU0gVHJveSBNaXRjaGVsbAo8dHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgoKPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBv
cnQgZm9yIGNvbmZpZ3VyaW5nIElPIHBvd2VyIGRvbWFpbiB2b2x0YWdlIGZvcgo+IGR1YWwtdm9s
dGFnZSBHUElPIGJhbmtzIG9uIHRoZSBTcGFjZW1pdCBLMSBTb0MuCj4KPiBPbiBLMSwgSU8gZG9t
YWluIHBvd2VyIGNvbnRyb2wgcmVnaXN0ZXJzIGRldGVybWluZSB3aGV0aGVyIGEgR1BJTyBiYW5r
Cj4gb3BlcmF0ZXMgYXQgMS44ViBvciAzLjNWLiBUaGVzZSByZWdpc3RlcnMgZGVmYXVsdCB0byAz
LjNWIG9wZXJhdGlvbiwKPiB3aGljaCBtYXkgbGVhZCB0byBmdW5jdGlvbmFsIGZhaWx1cmVzIHdo
ZW4gR1BJTyBiYW5rcyBhcmUgZXh0ZXJuYWxseQo+IHN1cHBsaWVkIHdpdGggMS44ViBidXQgaW50
ZXJuYWxseSByZW1haW4gY29uZmlndXJlZCBmb3IgMy4zVi4KPgo+IFRoZSBJTyBwb3dlciBkb21h
aW4gcmVnaXN0ZXJzIGFyZSBpbXBsZW1lbnRlZCBhcyBzZWN1cmUgcmVnaXN0ZXJzIGFuZAo+IHJl
cXVpcmUgYW4gZXhwbGljaXQgdW5sb2NrIHNlcXVlbmNlIHZpYSB0aGUgQUlCIFNlY3VyZSBBY2Nl
c3MgUmVnaXN0ZXIKPiAoQVNBUiksIGxvY2F0ZWQgaW4gdGhlIEFQQkMgcmVnaXN0ZXIgc3BhY2Uu
Cj4KPiBUaGlzIHNlcmllcyBlbnN1cmVzIHRoYXQgcGluIHZvbHRhZ2UgY29uZmlndXJhdGlvbiBj
b3JyZWN0bHkgcmVmbGVjdHMKPiBoYXJkd2FyZSByZXF1aXJlbWVudHMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KCkV4
Y2VsbGVudCB3b3JrIGluIHRoaXMgcGF0Y2ggc2VyaWVzIFRyb3khCgo+IFRyb3kgTWl0Y2hlbGwg
KDMpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBzcGFjZW1pdDogYWRkIHN5c2NvbiBw
cm9wZXJ0eQo+ICAgICAgIHBpbmN0cmw6IHNwYWNlbWl0OiBzdXBwb3J0IEkvTyBwb3dlciBkb21h
aW4gY29uZmlndXJhdGlvbgoKVGhlc2UgdHdvIHBhdGNoZXMgYXBwbGllZCB0byB0aGUgcGluIGNv
bnRyb2wgdHJlZS4KCj4gICAgICAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IG1vZGlmeSBwaW5jdHJs
IG5vZGUgaW4gZHRzaQoKUGxlYXNlIGZ1bm5lbCB0aGlzIG9uZSB0aHJvdWdoIHRoZSBTb0MgdHJl
ZS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
