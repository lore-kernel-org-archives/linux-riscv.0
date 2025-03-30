Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED16C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrxB4hRzE7FiLcNPh/gl4+A9BXe+QCqv+ktVb5Rmdhs=; b=CpNZkuyW6WIKr+
	A3YSISata4fMqPtDVMGEmrhGSQd70aA9HCEBH3af8LhYFYDQuUgoTZ+l2V1xjUZs8p04ajPEBynTk
	8bD/cyCJ9diD1E79S5fTwhkic33voC9bdfhuBtBVXoVHhOEqZR0zTHpTksIB0CbV9d86rSRhSaCHS
	dXkMax/omxfnqn5QgIH7M0aJ+NkBOWq6kyPM2jlJ2Dx3zdxKmxEMbnv4n3kdAjz/lBKSiGqwEd2YE
	3SUWlE0dIvagdWyuXAzk0BAyBGeok32p3Nz4sNTTDngXmAlyg7oKmK8anhnHLh063aZlNZBoH0Amw
	5VO0mJQ+WCoopQBGJj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typNx-0000000G3OR-3jCf;
	Sun, 30 Mar 2025 09:55:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typNw-0000000G3O4-0Di1
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 09:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86E5A4485E
	for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 09:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E85C4CEF0
	for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743328518;
	bh=5JcLcytBRlmqq09jrH9DsNQgRgGQPz51SsbBw3q5JSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LVwYvOIDxdCP0Z9BjL3B1PAHmQd53fCbPCe/8WOgLcx1ljiuXcCB9ADzvsgrEEe7N
	 J94UI9F1F43dVael8ZKw1WrBuL3Z8/K01PAuFyK7QiPLBN6nFeQ/4lCtBWE6PGKg+k
	 AATkpLpk7JltkfNCvra7WIZyxcrPpu0ZfnDz+0crF5lR6jU3TahgKiKt29zC974P/p
	 BLnyAJcEmlTXSgR0RsYJfH/b43X7GogMb1dfG3N44taBxdk6Pkt2UaoeKV31gy9kPC
	 bUQX4ziINEwxmfZh6H2syHazgTlPuXw7zvRmWKCwu4l5B/eufTJ22wNH9Q0ywZ3M1d
	 Zeam7t1/znD7A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abbb12bea54so704806866b.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 02:55:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKmVJrgHxfHtkfOz3fYstG5O/EQ3vnGavNH/exksQAu3TuUj/m6g1A3Hko+ZWXpiFisEuQMNuaHSJrmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAXZPRpQa7xFP0ZiO6L/PN1tsrT0+5hNz5+61fgQIGC+lXxCac
	e3c52G6xIY1omV6aJQmgBnERmuqbDEzL3kmOHpqOuW2YovIU1cK278f8Wyy4tQ2qd3Dx1UJfzln
	TEKdn0a/F/UGeGrwT0AAjvUdZ/NA=
X-Google-Smtp-Source: AGHT+IE+jFr2hSf27y/s5sTiGjkAaHOpg05In4illWNF6eBuAiUU/eLj5n9SWJwueOHAvvfk8n3IXs3JbaDs3TMErMA=
X-Received: by 2002:a17:907:6092:b0:abf:3cb2:1c04 with SMTP id
 a640c23a62f3a-ac738a0f3b3mr442616566b.9.1743328517187; Sun, 30 Mar 2025
 02:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250224112042.60282-1-xry111@xry111.site> <20250224112042.60282-4-xry111@xry111.site>
In-Reply-To: <20250224112042.60282-4-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 30 Mar 2025 17:55:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5-h3iJSDAkXz2dnW6JQRGJm03EFG2KLL_Ak1q83LMKAA@mail.gmail.com>
X-Gm-Features: AQ5f1JoPN8zLi6dXxQbDVe9ayOBCDaGT24wARYK2-Hg0w9-96JHC_84wcc-aObw
Message-ID: <CAAhV-H5-h3iJSDAkXz2dnW6JQRGJm03EFG2KLL_Ak1q83LMKAA@mail.gmail.com>
Subject: Re: [PATCH 3/3] LoongArch: vDSO: Remove --hash-style=sysv
To: Xi Ruoyao <xry111@xry111.site>
Cc: Guo Ren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Fangrui Song <i@maskray.me>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_025520_137347_8F9A8B02 
X-CRM114-Status: GOOD (  16.87  )
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

QXBwbGllZCwgdGhhbmtzLgoKSHVhY2FpCgpPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCA3OjIx4oCv
UE0gWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+IHdyb3RlOgo+Cj4gZ2xpYmMgYWRkZWQg
c3VwcG9ydCBmb3IgLmdudS5oYXNoIGluIDIwMDYgYW5kIC5oYXNoIGhhcyBiZWVuIG9ic29sZXRl
ZAo+IGZhciBiZWZvcmUgdGhlIGZpcnN0IExvb25nQXJjaCBDUFUgd2FzIHRhcGVkLiAgVXNpbmcK
PiAtLWhhc2gtc3R5bGU9c3lzdiBtaWdodCBpbXBseSB1bmFkZHJlc3NlZCBpc3N1ZXMgYW5kIGNv
bmZ1c2UgcmVhZGVycy4KPgo+IFNvbWUgYXJjaGl0ZWN0dXJlcyB1c2UgYW4gZXhwbGljaXQgLS1o
YXNoLXN0eWxlPWJvdGggaGVyZSwgYnV0Cj4gRFRfR05VX0hBU0ggaGFzIGFscmVhZHkgYmVlbiBz
dXBwb3J0ZWQgYnkgR2xpYmMgYW5kIE11c2wgYW5kIGJlY29tZSB0aGUKPiBkZS1mYWN0byBzdGFu
ZGFyZCBvZiB0aGUgZGlzdHJvcyB3aGVuIHRoZSBmaXJzdCBMb29uZ0FyY2ggQ1BVIHdhcyB0YXBl
ZC4KPiBTbyBEVF9IQVNIIHNlZW1zIGp1c3Qgd2FzdGluZyBzdG9yYWdlIHNwYWNlIGZvciBMb29u
Z0FyY2guCj4KPiBKdXN0IGRyb3AgdGhlIG9wdGlvbiBhbmQgcmVseSBvbiB0aGUgbGlua2VyIGRl
ZmF1bHQsIHdoaWNoIGlzIGxpa2VseQo+ICJnbnUiIChBcmNoLCBEZWJpYW4sIEdlbnRvbywgTEZT
KSBvbiBhbGwgTG9vbmdBcmNoIGRpc3Ryb3MgKGNvbmZpcm1lZCBvbgo+IEFyY2gsIERlYmlhbiwg
R2VudG9vLCBhbmQgTEZTOyBBT1NDIG5vdyBkZWZhdWx0cyB0byAiYm90aCIgYnV0IGl0IHNlZW1z
Cj4ganVzdCBhbiBvdmVyc2lnaHQpLgo+Cj4gRm9sbG93aW5nIHRoZSBsb2dpYyBvZiBjb21taXQg
NDhmNjQzMDUwNWMwCj4gKCJhcm02NC92ZHNvOiBSZW1vdmUgLS1oYXNoLXN0eWxlPXN5c3YiKS4K
Pgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9BT1NDLURldi9hb3NjLW9zLWFiYnMvcHVsbC85
Nzk2Cj4gU2lnbmVkLW9mZi1ieTogWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+Cj4gLS0t
Cj4gIGFyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9v
bmdhcmNoL3Zkc28vTWFrZWZpbGUgYi9hcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlCj4gaW5k
ZXggZmRkZTFiY2Q0ZTI2Li5hYmFmODdjNThmOWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2Fy
Y2gvdmRzby9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUKPiBA
QCAtMzcsNyArMzcsNyBAQCBlbmRpZgo+ICAjIFZEU08gbGlua2VyIGZsYWdzLgo+ICBsZGZsYWdz
LXkgOj0gLUJzeW1ib2xpYyAtLW5vLXVuZGVmaW5lZCAtc29uYW1lPWxpbnV4LXZkc28uc28uMSBc
Cj4gICAgICAgICAkKGZpbHRlciAtRSUsJChLQlVJTERfQ0ZMQUdTKSkgLW5vc3RkbGliIC1zaGFy
ZWQgXAo+IC0gICAgICAgLS1oYXNoLXN0eWxlPXN5c3YgLS1idWlsZC1pZCAtVAo+ICsgICAgICAg
LS1idWlsZC1pZCAtVAo+Cj4gICMKPiAgIyBTaGFyZWQgYnVpbGQgY29tbWFuZHMuCj4gLS0KPiAy
LjQ4LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
