Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7D3CEE336
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mz7lPtWG72U8NQRZ6eWbox9rBEdlXX2aGahzGQGU2Zg=; b=mLvE6Z3Z4aYt9B
	Rih+QaDissdyMRWmAglGx2RrIg75ueUaeQJ/0xppM6s98EerhkaqvDAjnezWzvkZjcixKENZ6U0Ep
	4fdaaR3MCRSrOuIbDb2V9UL196Df+rS+/cFum3LsZXjr06hMM2GCzzkVJbCI+7pYruTj0YDEzwJgT
	yEqJlidPnmtE0WSBCQHOrcRK7E0Fey7dw89R628Evk32uZRijQJ9n6qmlRyVWbV4XtRIOpNTnfbUc
	XfYLjdUmQnb3jTj3Fa6H4U3NcC1X2y4kpMP4QLwFKe7XsGwmPIoo0bDH1vbwUjyb3KY3J9lbMX0ug
	UH3xRO20OBz878FYdICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaZi-0000000AC1A-22Tb;
	Wed, 09 Oct 2024 17:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZrq-0000000A3j9-1VTK
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Oct 2024 16:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=; b=JXLp2uuRyp7VgkEiyDmht2ZdaK
	0JFKsDGU0MYio5YqymkPLCfC49QMW62ZKXDV2HRofIwoXLtZIDZUxV9RfG93pvY4mL6RxMA3Uzpy3
	jO+Bss0na+RO6QlshxidWNYun4Um6w+zg7bn4iP+FXGkwbJSkUNYJmKEl0o3iP9kDO0k2/rkcu+3f
	jBYrDlqZFNlcKbP00z2sQrE6gcpNiYHdFv8XMjhiwp/AO//B56PzUg3ZOHs3RXlENAKBy9BQfStFS
	VVz31h9rxwnQCq+ucbds373NnnZwo8JT66lVnSmiIeGvZa/CR2E3z0P3FWR8KObaQP+n7HTdp4HU/
	mfk5xHZA==;
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZrn-000000052yX-21bB
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 16:48:53 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4601a471aecso3091cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728492520; x=1729097320; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
        b=r337W5u87fA9ipyZ/HmIQSdDW762EqIrZirODCNQnepvplbqAl+B6d+qSVLI6yXPWt
         CjRJQVXiM89p/9HsctfXLzi0E4bf6pcQRdYK/70qPlt0IvUAsHlqZzdOGMKeP+O5G71a
         2H3nFNWtF71lij/UY6tNGe1N41gdlK9rox84zpTzyllZdYChJa6hZuI5V6uknUFAB5ZU
         adeIJ+u3jkh5qrJ9ys0MEYMx4wGDVn5X5PMciqQVhNG8jvTLyRBq4I3p0qxZUaeA0U1z
         iE3Fw3jFA33iuZNomZynmXsaUk3SXqima2THW++/kHo4LZB2CRc+/ZTvN2hdR0VYmdf6
         /Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492520; x=1729097320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
        b=Vl49KOfliyuFtJBeIZvql5kQT9ANrkZuUAP2nTcXP8eBESzEzSIzQCcvhGpahO8BZL
         L2CYxyoh11ZMTGi1g20A06b1R5u178RcQs/TwoSDtEPgSujbtTc7qwmQBQBLlq+y62W5
         tEe8uKkVHEhZKqJmbVSR1Hom1UBJKTdaq8Zfuq8jQkesChH/fOOI0Zb/YK9i+y0pXDXa
         /cefv3r8nRZIS77lVNrA+gZy5KKRRuDmnp/auY39CbeU0tXliNRSJedxeD7ztLRgQshS
         NFlgLglgsLHQiylzzS6hViQ8Egkn2gkMgb8tJk0hIWlLKqZgOGWKO2EG3Csy+r6nKa/7
         5oBQ==
X-Forwarded-Encrypted: i=1; AJvYcCViMbtUiUiTyZUVFTrL4Ajtra51q94hWFadTZA9O1gv0JvusMtPtaqg3tmjnacoes0EIernRV3P1iJJ1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhfpubk5jH2ycOn2XOel/hX362t1bR/WpWP5E1xCcL9dR0RLTC
	jkFTg94CXe+0m65NWVgry86HdYogLzgMXNhYJ3S7xqsGPNihlnPtde4nuYtTioOTNyy4GOgOMSI
	dHToUQK4yxrR9l4rwD46GmwaGEhfCdZJe2Brp
X-Google-Smtp-Source: AGHT+IFU2+kjwmtE/tnFQrIWgevFZ6/YDFYn29RzthvZHDHMDNxdPEj2AOVBL4hcHNKv+c2nCcFEUJDPNG9SsF97388=
X-Received: by 2002:a05:622a:5612:b0:447:dbac:facd with SMTP id
 d75a77b69052e-45f0a1537fbmr4407531cf.24.1728492519801; Wed, 09 Oct 2024
 09:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
In-Reply-To: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 09:48:03 -0700
Message-ID: <CABCJKuf83gywnbtkJ3d2VfDRH9f6kcf1Bn1Zau5re=4YoV6E8g@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_174851_617300_56726DDA 
X-CRM114-Status: GOOD (  13.00  )
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

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCAxMDozN+KAr0FNIEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBn
b29nbGUuY29tPiB3cm90ZToKPgo+IFRoZSBLQ0ZJIHNhbml0aXplciBzdG9yZXMgdGhlIENGSSB0
YWcgb2YgYSBmdW5jdGlvbiBqdXN0IGJlZm9yZSBpdHMKPiBtYWNoaW5lIGNvZGUuIEhvd2V2ZXIs
IHRoZSBwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgZmxhZyBjYW4gYmUgdXNlZCB0bwo+IGludHJv
ZHVjZSBhZGRpdGlvbmFsIG5vcCBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSBtYWNoaW5lIGNvZGUs
IHRha2luZyB1cAo+IHRoZSBzcGFjZSB0aGF0IG5vcm1hbGx5IGhvbGRzIHRoZSBDRkkgdGFnLiBJ
biB0aGlzIGNhc2UsIGEgYmFja3dhcmRzCj4gb2Zmc2V0IGlzIGFwcGxpZWQgdG8gdGhlIENGSSB0
YWcgdG8gbW92ZSB0aGVtIG91dCBvZiB0aGUgd2F5IG9mIHRoZSBub3AKPiBpbnN0cnVjdGlvbnMu
IFRvIGVuc3VyZSB0aGF0IEMgYW5kIFJ1c3QgYWdyZWUgb24gdGhlIG9mZnNldCB1c2VkIGJ5IENG
SQo+IHRhZ3MsIHBhc3MgdGhlIC1acGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5IHRvIHJ1c3RjIHdo
ZW5ldmVyIGl0IGlzIHBhc3NlZAo+IHRvIHRoZSBDIGNvbXBpbGVyLgo+Cj4gVGhlIHJlcXVpcmVk
IHJ1c3RjIHZlcnNpb24gaXMgYnVtcGVkIHRvIDEuODEuMCB0byBlbnN1cmUgdGhhdCB0aGUKPiAt
WnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBmbGFnIGlzIGF2YWlsYWJsZSB3aGVuIENGSSBpcyB1
c2VkLgo+Cj4gRml4ZXM6IGNhNjI3ZTYzNjU1MSAoInJ1c3Q6IGNmaTogYWRkIHN1cHBvcnQgZm9y
IENGSV9DTEFORyB3aXRoIFJ1c3QiKQo+IFNpZ25lZC1vZmYtYnk6IEFsaWNlIFJ5aGwgPGFsaWNl
cnlobEBnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5l
bkBnb29nbGUuY29tPgoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
