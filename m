Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ECCC36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAywjXIPrOzilfNJ/BE58gre7qRNfrJ0XcBRElp75x8=; b=S3FuFqL2kTAeua
	gaLOueWbg7usgYxERlnaEwlOgdOdQWz6AKc4WuOWO69a3preZxi7vmfjkcphd1A5Kygnp50oitsYy
	Nvk8cQfwMopNVonvMh5d498xHVE7E6iPHSKdplc8UXXL8pLhmy2inAszD9BY7FU+peIbo07+S4xfQ
	okVk7S9vYgRelr3GloJr+E8TvcBw3YHmkYCrLePMtKzRf5VkNqL6q93MBeBqgZ31jPIPu2K5mxOiX
	B6YylK8zkHE0PU46uRnVxlBTnAG75uDWyB10Cefe9VDKKX6xxRKrycETn+QJ7UcQ3kpxAXvUc/OKZ
	XFzX8xl/U7grrIrPiPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUVg-00000009AUu-2Q5J;
	Wed, 26 Mar 2025 17:25:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUB6-000000096ab-3kyP
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 17:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75C684383F;
	Wed, 26 Mar 2025 17:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAA0C4CEE8;
	Wed, 26 Mar 2025 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743008670;
	bh=eYZ1X+n9G5/eODDDq0WeZaZ+W1JG9ClHqRA6twyVa50=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8FhkIKFyA2Bv3+veBkQH7clbm5xCU/8dk+6HJlQJxkciB0sHZvCmuPKWoD50mKwD
	 Weci5flybD4vzMJMmfnp6QHQT7+RoBUeAIDsspoufMd3l3doRwSQwnm3qc5FTR7RJG
	 85+/8u8IDSEN0AuVtgotpS3Go6WNbTFAuVrzNF/acbR5tOcEj2iXhzDEYfm+7m/bJO
	 1pcTbVwa2xxi1xQJ09hUi+2J1o8f5HKmk+fqxNLtSZmREU8mqhwfSZ7UqQVPVeu6mX
	 3wL8DR3yBfkg4IKXRczsmTYTCEJ9bP3XQqGr5n2uEJZuDwJBkWEWSqEPnO0B3R8IeI
	 5t+1qKpTXb+6A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yao Zi <ziyao@disroot.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Ying Sun <sunying@isrc.iscas.ac.cn>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH] riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
In-Reply-To: <20250326051445.55131-2-ziyao@disroot.org>
References: <20250326051445.55131-2-ziyao@disroot.org>
Date: Wed, 26 Mar 2025 18:04:27 +0100
Message-ID: <877c4bg1us.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_100432_952333_AA90DF35 
X-CRM114-Status: UNSURE (   8.89  )
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

WWFvIFppIDx6aXlhb0BkaXNyb290Lm9yZz4gd3JpdGVzOgoKPiBDb21taXQgNThmZjUzNzEwOWFj
ICgicmlzY3Y6IE9taXQgb3B0aW1pemVkIHN0cmluZyByb3V0aW5lcyB3aGVuCj4gdXNpbmcgS0FT
QU4iKSBpbnRyb2R1Y2VkIGNhbGxzIHRvIEVYUE9SVF9TWU1CT0woKSBpbiBhc3NlbWJseSBzdHJp
bmcKPiByb3V0aW5lcywgd2hpY2ggcmVzdWx0IGluIFJfUklTQ1ZfNjQgcmVsb2NhdGlvbnMgYWdh
aW5zdAo+IC5leHBvcnRfc3ltYm9sIHNlY3Rpb24uIEFzIHRoZXNlIHJvdW50aW5lcyBhcmUgcmV1
c2VkIGJ5IFJJU0MtVgo+IHB1cmdhdG9yeSBhbmQgb3VyIHJlbG9jYXRvciBkb2Vzbid0IHJlY29n
bml6ZSB0aGVzZSByZWxvY2F0aW9ucywgdGhpcwo+IGZhaWxzIGtleGVjLWZpbGUtbG9hZCB3aXRo
IGRtZXNnIGxpa2UKPgo+IAlbICAgMTEuMzQ0MjUxXSBrZXhlY19pbWFnZTogVW5rbm93biByZWxh
IHJlbG9jYXRpb246IDIKPiAJWyAgIDExLjM0NTk3Ml0ga2V4ZWNfaW1hZ2U6IEVycm9yIGxvYWRp
bmcgcHVyZ2F0b3J5IHJldD0tOAo+Cj4gTGV0J3Mgc3VwcG9ydCBSX1JJU0NWXzY0IHJlbG9jYXRp
b24gdG8gZml4IGtleGVjIG9uIDY0LWJpdCBSSVNDLVYuCj4gMzItYml0IHZhcmlhbnQgaXNuJ3Qg
Y292ZXJlZCBzaW5jZSBLRVhFQ19GSUxFIGFuZCBLRVhFQ19QVVJHQVRPUlkgaXNuJ3QKPiBhdmFp
bGFibGUuCgpIaSEKClRoaXMgcGF0Y2ggZG9lcyBmaXggdGhlIHZtbGludXggbG9hZGluZyBmb3Ig
a2V4ZWMtZmlsZSAtLSB2ZXJ5IG5pY2UhCkhvd2V2ZXIsIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8g
Z2V0IGtleGVjIHRvIHN1Y2Nlc3NmdWxseSBib290IGEga2VybmVsCmZyb20gcWVtdSwgaS5lLjoK
CiAga2V4ZWMgLXMgLWwgL3BhdGgvdG8vdm1saW51eCAjIGZpeGVkIHcvIHlvdXIgcGF0Y2gKICBr
ZXhlYyAtZSAjIGhhbmdzIGFmdGVyICJCeWUuLi4iCgpTYW1lIHdoZW4gSSB0cnkgdmFuaWxsYSBr
ZXhlYyAoa2V4ZWMgLWMgLWwgL3BhdGgvdG8vdm1saW51eCkuIGtleGVjIHdpdGgKYW4gSW1hZ2Ug
d29ya3MgZm9yIG1lIGluIHFlbXUuCgpCZWZvcmUgSSBzdGFydCB0byBiaXNlY3QgdG9vIG11Y2g7
IFdoYXQgY29uZmlnL3FlbXUgZGlkIHlvdSB1c2UgdG8gdGVzdAp0aGlzPwoKClRoYW5rcywKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
