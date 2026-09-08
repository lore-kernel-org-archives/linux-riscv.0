Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59464C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jon0KlOSlXyKCTH9NfFnPXNR2x06ZnCYj+vtjwhliuY=; b=BJaE6Dyu+LnjfB
	NClccfFSqJe7x2PK+Z3uvjgXl41AyD9UhFyQ3Z+sgsO3kJ6Tx6A6kREDzUS0YpabABaS2jsWoQsUB
	4NWv0vLEoreOcpr64YyQZaMBD1doA1bO9s3EHUh05t7jsnrrpL5OvkgTPClrbrIUX87Z5PdSx2DYh
	EbPgXHE/3utX8qSqXC66neJ4oizp7b/UxW9w245Hme8K4D/aQqsXlOHfryWrKL1CXsbV7nT4qYLF3
	jpmO0Q41K0Yjx2JjP1lrrpuBqrOplsfArK5qmeLMpyEN73WLgZv3+gddF+hJGJUydMAiKiwPSqQvs
	MaxxG1SIC6bA9b0BKQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x0v-00000009Ikf-004t;
	Tue, 08 Sep 2026 14:41:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x0u-00000009Ik5-0ITD;
	Tue, 08 Sep 2026 14:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A81C4360A;
	Tue,  8 Sep 2026 14:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83611F00A3A;
	Tue,  8 Sep 2026 14:41:14 +0000 (UTC)
Message-ID: <7c9f6ec3-5886-41ea-8803-d81019321d29@kernel.org>
Date: Tue, 8 Sep 2026 16:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/24] powerpc/vdso: Enable the vdsocheck tool
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-17-3a93791af1cf@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-17-3a93791af1cf@linutronix.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwOC8wOS8yMDI2IMOgIDA4OjMzLCBUaG9tYXMgV2Vpw59zY2h1aCBhIMOpY3JpdMKgOgo+
IFRoZSB2ZHNvY2hlY2sgdG9vbCB2YWxpZGF0ZXMgdGhlIG9iamVjdCBmaWxlcyBhbmQgZmluYWwg
LnNvIGxpYnJhcnkuCj4gSXQgY2FuIGRldGVjdCBpZiB0aGUgY29tcGlsZXIgY3JlYXRlZCByZWxv
Y2F0aW9ucyB3aGljaCBhcmUgaW5jb21wYXRpYmxlCj4gd2l0aCB0aGUgdkRTTyB3aGljaCBuZWVk
IHRvIGJlIHdvcmtlZCBhcm91bmQuCj4gCj4gV2lyZSBpdCB1cCBmb3IgdGhlIGFyY2hpdGVjdHVy
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KPiAtLS0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAg
ICAgICB8ICAxICsKPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSB8ICA0ICsr
LS0KPiAgIGxpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyAgICAgICB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2Fy
Y2gvcG93ZXJwYy9LY29uZmlnCj4gaW5kZXggMjU4MGUyN2U0MzI4Li5mMTllMjI1Y2ZjNWMgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKPiArKysgYi9hcmNoL3Bvd2VycGMvS2Nv
bmZpZwo+IEBAIC0zMzAsNiArMzMwLDcgQEAgY29uZmlnIFBQQwo+ICAgCXNlbGVjdCBTWVNDVExf
RVhDRVBUSU9OX1RSQUNFCj4gICAJc2VsZWN0IFRIUkVBRF9JTkZPX0lOX1RBU0sKPiAgIAlzZWxl
Y3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAo+ICsJc2VsZWN0IFZEU09fQ0hFQ0sKPiAgIAlzZWxl
Y3QgVkRTT19EQVRBU1RPUkUKPiAgIAlzZWxlY3QgVkRTT19HRVRSQU5ET00KPiAgIAkjCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvdmRzby9NYWtlZmlsZQo+IGluZGV4IDM2ODc1OWY4MTcwOC4uY2EyMGI5MWI0Mzcz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZQo+IEBAIC04MSw5ICs4MSw5IEBAIHRh
cmdldHMgKz0gdmRzbzY0Lmxkcwo+ICAgQ1BQRkxBR1NfdmRzbzY0LmxkcyArPSAtUCAtQwo+ICAg
Cj4gICAjIGxpbmsgcnVsZSBmb3IgdGhlIC5zbyBmaWxlLCAubGRzIGhhcyB0byBiZSBmaXJzdAo+
IC0kKG9iaikvdmRzbzMyLnNvLmRiZzogJChvYmopL3Zkc28zMi5sZHMgJChvYmotdmRzbzMyKSAk
KG9iaikvdmdldHRpbWVvZmRheS0zMi5vICQob2JqKS92Z2V0cmFuZG9tLTMyLm8gJChvYmopL2Ny
dHNhdnJlcy0zMi5vIEZPUkNFCj4gKyQob2JqKS92ZHNvMzIuc28uZGJnOiAkKG9iaikvdmRzbzMy
LmxkcyAkKG9iai12ZHNvMzIpICQob2JqKS92Z2V0dGltZW9mZGF5LTMyLm8gJChvYmopL3ZnZXRy
YW5kb20tMzIubyAkKG9iaikvY3J0c2F2cmVzLTMyLm8gJCh2ZHNvY2hlY2spIEZPUkNFCj4gICAJ
JChjYWxsIGlmX2NoYW5nZWQsdmRzbzMybGRfYW5kX2NoZWNrKQo+IC0kKG9iaikvdmRzbzY0LnNv
LmRiZzogJChvYmopL3Zkc282NC5sZHMgJChvYmotdmRzbzY0KSAkKG9iaikvdmdldHRpbWVvZmRh
eS02NC5vICQob2JqKS92Z2V0cmFuZG9tLTY0Lm8gRk9SQ0UKPiArJChvYmopL3Zkc282NC5zby5k
Ymc6ICQob2JqKS92ZHNvNjQubGRzICQob2JqLXZkc282NCkgJChvYmopL3ZnZXR0aW1lb2ZkYXkt
NjQubyAkKG9iaikvdmdldHJhbmRvbS02NC5vICQodmRzb2NoZWNrKSBGT1JDRQo+ICAgCSQoY2Fs
bCBpZl9jaGFuZ2VkLHZkc282NGxkX2FuZF9jaGVjaykKPiAgIAo+ICAgIyBhc3NlbWJseSBydWxl
cyBmb3IgdGhlIC5TIGZpbGVzCj4gZGlmZiAtLWdpdCBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVj
ay5ycyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwo+IGluZGV4IGU0NWExZmJjNjgyOS4u
NDI5YmRjZDY1ODE4IDEwMDY0NAo+IC0tLSBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwo+
ICsrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycwo+IEBAIC02OSw2ICs2OSwzMyBAQCBm
biBhbGxvd2VkX3JlbG9jYXRpb25zX2Zvcl9tYWNoaW5lKG1hY2hpbmU6IHUxNikgLT4gT3B0aW9u
PEFsbG93ZWRSZWxvY2F0aW9uczwncwo+ICAgICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0
KCkKPiAgICAgICAgICAgfQo+ICAgICAgICAgICAuaW50bygpLAo+ICsgICAgICAgIGJpbmRpbmdz
OjpFTV9QUEMgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKPiArICAgICAgICAgICAgaW5fb2JqZWN0
X2ZpbGU6ICZbCj4gKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUENfUkVMMjQsCgpOb3Qg
c3VyZSB0aGlzIGlzIGNvcnJlY3QsIHNlZSBjb21taXQgNDJlZDZkNTZhZGUyICgicG93ZXJwYy92
ZHNvOiBCbG9jayAKUl9QUENfUkVMMjQgcmVsb2NhdGlvbnMiKQoKPiArICAgICAgICAgICAgICAg
IGJpbmRpbmdzOjpSX1BQQ19SRUwxNCwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQ
Q19SRUwzMiwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwxNiwKPiArICAg
ICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQQ19SRUwxNl9MTywKPiArICAgICAgICAgICAgICAg
IGJpbmRpbmdzOjpSX1BQQ19SRUwxNl9ISSwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpS
X1BQQ19SRUwxNl9IQSwKPiArICAgICAgICAgICAgXSwKPiArICAgICAgICAgICAgLi5EZWZhdWx0
OjpkZWZhdWx0KCkKPiArICAgICAgICB9Cj4gKyAgICAgICAgLmludG8oKSwKPiArICAgICAgICBi
aW5kaW5nczo6RU1fUFBDNjQgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsKPiArICAgICAgICAgICAg
aW5fb2JqZWN0X2ZpbGU6ICZbCj4gKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUEM2NF9S
RUwyNCwKCk5vdCBzdXJlIHRoaXMgaXMgY29ycmVjdCwgc2VlIGNvbW1pdCA0MmVkNmQ1NmFkZTIg
KCJwb3dlcnBjL3Zkc286IEJsb2NrIApSX1BQQ19SRUwyNCByZWxvY2F0aW9ucyIpCgo+ICsgICAg
ICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTQsCj4gKyAgICAgICAgICAgICAgICBi
aW5kaW5nczo6Ul9QUEM2NF9SRUwzMiwKPiArICAgICAgICAgICAgICAgIGJpbmRpbmdzOjpSX1BQ
QzY0X1JFTDY0LAo+ICsgICAgICAgICAgICAgICAgYmluZGluZ3M6OlJfUFBDNjRfUkVMMTYsCj4g
KyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul9QUEM2NF9SRUwxNl9MTywKPiArICAgICAgICAg
ICAgICAgIGJpbmRpbmdzOjpSX1BQQzY0X1JFTDE2X0hJLAo+ICsgICAgICAgICAgICAgICAgYmlu
ZGluZ3M6OlJfUFBDNjRfUkVMMTZfSEEsCj4gKyAgICAgICAgICAgIF0sCj4gKyAgICAgICAgICAg
IC4uRGVmYXVsdDo6ZGVmYXVsdCgpCj4gKyAgICAgICAgfQo+ICsgICAgICAgIC5pbnRvKCksCj4g
ICAgICAgICAgIF8gPT4gTm9uZSwKPiAgICAgICB9Cj4gICB9Cj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
