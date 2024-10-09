Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEF3CF0444
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 05:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+x7RTHs8XPp2zbf+INql7l7ObZUnb2pqylBzcY7Cy5U=; b=yS4T1ObUqwDAHf
	Y2QJMqIih7sZvDLdD+lmL4urld+U+PQY9Lu1LxeKfH/LlVID/+eM5gkHX2l43gdgxKkaxDhIWSPsh
	1bv/XoTAcN6gYNhCNpE5CKQhntXOAd7BlkKXlrVENL23DDimJPL5h6aiDMz0UaFEpG1M30/sXAebM
	l6PEmZrjNUgjkHhBhKSl+wo8wZewHsQHetNk8jKH68k9WQjv0MDhvVnk6qQXby15HA31ZTkcH5hG/
	+xxyJajLJLEKcY2jdeGeagfbBq0bw/6sf+yfM7q0Vlo0u1i0BBEEpZwr7LOkJqjq/McFVAc99k+90
	DAN2NbVQatQoeQwvlRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syPI5-00000007xwm-1gek;
	Wed, 09 Oct 2024 05:31:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syPGu-00000007xpo-0Mn8
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Oct 2024 05:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XkMZIhkwRqxHqF3I9X1ZQS6FafKPnbFPFkGn5tqJ9R4=; b=U64UD1wzVnnpeuqappCEXsROQS
	7qdyegUQmQlnvjoPAvZwN8Gh+KYA8mRWw3zESuCgWw43ZxCgB1SzAc0CPaLDKhYoYlUnDRdw7ViXM
	uWYi7NLOi3VlRCoEmWwmxoOMOh9rhPdWaIKSxk3AJYFGpomVAJIYpHmYibPlgL9iMQGm+lsLxEKs+
	EaqxNnGJxqL290gYlXnxc7JhvwagK5P1LuHNycQ0Q+MbPyI0eYjipD4DEs0Ca92/F1K+mSd0dVyOI
	L6Davb59G68bPFIyY0hV7G6r98mzKOJ0WnZFL7bAEjE1loPYn1bUE5OloFeVGmMhI9RpnLtOo1ZUZ
	YzhTRbqA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syPGp-00000004pHu-04O0
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 05:30:02 +0000
Received: from loongson.cn (unknown [209.85.128.181])
	by gateway (Coremail) with SMTP id _____8BxnmvLFAZnuZYQAA--.23284S3;
	Wed, 09 Oct 2024 13:29:48 +0800 (CST)
Received: from mail-yw1-f181.google.com (unknown [209.85.128.181])
	by front1 (Coremail) with SMTP id qMiowMAxQNbIFAZnpfggAA--.31891S3;
	Wed, 09 Oct 2024 13:29:46 +0800 (CST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e235a61bcbso3244777b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 22:29:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnQxgeo8/B9k4cHUJEKgMOw580ke2veqDJURCZDAu3o9HZcTXQGBREMCjzaJjR0Yhj0MkpNP5XaRm2VA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy85VQFOKmOC5HbhlDVZVwuoD+cjhJbibNITR4TEXtfsSMsxtcQ
	fQccHA8uEzr1f1MrNM6bZQ5a/4y3JPa+ZY0qGA02cIdA8QgrW/H7uBdkL8UYMiqiCQo9OYWNFEV
	emj/5Qwq7gZfQo0MUYqxc/NftmWrjnaSVQAuFbg==
X-Google-Smtp-Source: AGHT+IFJ2asEEWxZSKka5K8xJcQuE0yhLrJteHJQVgRbKdn7qBkd8DoTGjvy8Kw8yN6hlp3uJSEmZIttYvn4pluc94E=
X-Received: by 2002:a05:690c:ed0:b0:6db:cea9:6ed9 with SMTP id
 00721157ae682-6e32219a1f8mr12411127b3.4.1728451783510; Tue, 08 Oct 2024
 22:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
In-Reply-To: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 9 Oct 2024 13:29:31 +0800
X-Gmail-Original-Message-ID: <CAHirt9g6kCwNarFo8Ah3+3dB=Sp1PJNs3PDJ5yFKBwwbdSqcrw@mail.gmail.com>
Message-ID: <CAHirt9g6kCwNarFo8Ah3+3dB=Sp1PJNs3PDJ5yFKBwwbdSqcrw@mail.gmail.com>
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
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CM-TRANSID: qMiowMAxQNbIFAZnpfggAA--.31891S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw48Cr1rZw17XF1xCr15Awc_yoWrWr15pa
	9Y9F1DCF4kJr48XrWxJrWfWr1j9w4DXr1Y9F1DG34rA347JrsxZ34vyw4qgayDursrCFWx
	X3WfKFy3Cw1UZ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	GVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwAwIDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_062959_872899_573622D3 
X-CRM114-Status: GOOD (  22.30  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCAxOjM34oCvQU0gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gVGhlIEtDRkkgc2FuaXRpemVyIHN0b3JlcyB0aGUgQ0ZJIHRh
ZyBvZiBhIGZ1bmN0aW9uIGp1c3QgYmVmb3JlIGl0cwo+IG1hY2hpbmUgY29kZS4gSG93ZXZlciwg
dGhlIHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBmbGFnIGNhbiBiZSB1c2VkIHRvCj4gaW50cm9k
dWNlIGFkZGl0aW9uYWwgbm9wIGluc3RydWN0aW9ucyBiZWZvcmUgdGhlIG1hY2hpbmUgY29kZSwg
dGFraW5nIHVwCj4gdGhlIHNwYWNlIHRoYXQgbm9ybWFsbHkgaG9sZHMgdGhlIENGSSB0YWcuIElu
IHRoaXMgY2FzZSwgYSBiYWNrd2FyZHMKPiBvZmZzZXQgaXMgYXBwbGllZCB0byB0aGUgQ0ZJIHRh
ZyB0byBtb3ZlIHRoZW0gb3V0IG9mIHRoZSB3YXkgb2YgdGhlIG5vcAo+IGluc3RydWN0aW9ucy4g
VG8gZW5zdXJlIHRoYXQgQyBhbmQgUnVzdCBhZ3JlZSBvbiB0aGUgb2Zmc2V0IHVzZWQgYnkgQ0ZJ
Cj4gdGFncywgcGFzcyB0aGUgLVpwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgdG8gcnVzdGMgd2hl
bmV2ZXIgaXQgaXMgcGFzc2VkCj4gdG8gdGhlIEMgY29tcGlsZXIuCj4KPiBUaGUgcmVxdWlyZWQg
cnVzdGMgdmVyc2lvbiBpcyBidW1wZWQgdG8gMS44MS4wIHRvIGVuc3VyZSB0aGF0IHRoZQo+IC1a
cGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5IGZsYWcgaXMgYXZhaWxhYmxlIHdoZW4gQ0ZJIGlzIHVz
ZWQuCj4KPiBGaXhlczogY2E2MjdlNjM2NTUxICgicnVzdDogY2ZpOiBhZGQgc3VwcG9ydCBmb3Ig
Q0ZJX0NMQU5HIHdpdGggUnVzdCIpCj4gU2lnbmVkLW9mZi1ieTogQWxpY2UgUnlobCA8YWxpY2Vy
eWhsQGdvb2dsZS5jb20+Cj4gLS0tCj4gTm90ZSB0aGF0IHRoaXMgZml4IHVzZXMgcnVzdGMtb3B0
aW9uIHdoaWNoIGhhcyBhIHBlbmRpbmcgZml4Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI0MTAwOC1ydXN0Yy1vcHRpb24tYm9vdHN0cmFwLXYyLTEtZTZlMTU1YjhmOWYzQGdvb2ds
ZS5jb20vCj4gLS0tCj4gIGFyY2gvYXJtNjQvTWFrZWZpbGUgICAgIHwgMiArKwo+ICBhcmNoL2xv
b25nYXJjaC9NYWtlZmlsZSB8IDEgKwo+ICBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICB8IDIgKysK
PiAgaW5pdC9LY29uZmlnICAgICAgICAgICAgfCAyICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9N
YWtlZmlsZSBiL2FyY2gvYXJtNjQvTWFrZWZpbGUKPiBpbmRleCA5ZWZkM2YzN2MyZmQuLmQ3ZWMw
YmIwOWZjNCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L01ha2VmaWxlCj4gKysrIGIvYXJjaC9h
cm02NC9NYWtlZmlsZQo+IEBAIC0xNDMsOSArMTQzLDExIEBAIENIRUNLRkxBR1MgKz0gLURfX2Fh
cmNoNjRfXwo+ICBpZmVxICgkKENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0NBTExfT1BTKSx5
KQo+ICAgIEtCVUlMRF9DUFBGTEFHUyArPSAtRENDX1VTSU5HX1BBVENIQUJMRV9GVU5DVElPTl9F
TlRSWQo+ICAgIENDX0ZMQUdTX0ZUUkFDRSA6PSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00
LDIKPiArICBLQlVJTERfUlVTVEZMQUdTICs9ICQoY2FsbCBydXN0Yy1vcHRpb24sLVpwYXRjaGFi
bGUtZnVuY3Rpb24tZW50cnk9NCQoY29tbWEpMikKPiAgZWxzZSBpZmVxICgkKENPTkZJR19EWU5B
TUlDX0ZUUkFDRV9XSVRIX0FSR1MpLHkpCj4gICAgS0JVSUxEX0NQUEZMQUdTICs9IC1EQ0NfVVNJ
TkdfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZCj4gICAgQ0NfRkxBR1NfRlRSQUNFIDo9IC1mcGF0
Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTIKPiArICBLQlVJTERfUlVTVEZMQUdTICs9ICQoY2FsbCBy
dXN0Yy1vcHRpb24sLVpwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9MikKPiAgZW5kaWYKPgo+ICBp
ZmVxICgkKENPTkZJR19LQVNBTl9TV19UQUdTKSwgeSkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29u
Z2FyY2gvTWFrZWZpbGUgYi9hcmNoL2xvb25nYXJjaC9NYWtlZmlsZQo+IGluZGV4IGFlM2Y4MDYy
MmY0Yy4uZjljZWYzMWQxZjBlIDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL01ha2VmaWxl
Cj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUKPiBAQCAtNDQsNiArNDQsNyBAQCBlbmRp
Zgo+ICBpZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0UKPiAgS0JVSUxEX0NQUEZMQUdTICs9IC1E
Q0NfVVNJTkdfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZCj4gIENDX0ZMQUdTX0ZUUkFDRSA6PSAt
ZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0yCj4gK0tCVUlMRF9SVVNURkxBR1MgKz0gJChjYWxs
IHJ1c3RjLW9wdGlvbiwtWnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0yKQoKVGVzdGVkLWJ5OiBX
QU5HIFJ1aSA8d2FuZ3J1aUBsb29uZ3Nvbi5jbj4KCgo+ICBlbmRpZgo+Cj4gIGlmZGVmIENPTkZJ
R182NEJJVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9N
YWtlZmlsZQo+IGluZGV4IGQ0NjlkYjlmNDZmNC4uNjVkNGRjYmEzMDlhIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gQEAgLTE2
LDggKzE2LDEwIEBAIGlmZXEgKCQoQ09ORklHX0RZTkFNSUNfRlRSQUNFKSx5KQo+ICAgICAgICAg
S0JVSUxEX0NQUEZMQUdTICs9IC1EQ0NfVVNJTkdfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZCj4g
IGlmZXEgKCQoQ09ORklHX1JJU0NWX0lTQV9DKSx5KQo+ICAgICAgICAgQ0NfRkxBR1NfRlRSQUNF
IDo9IC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTQKPiArICAgICAgIEtCVUlMRF9SVVNURkxB
R1MgKz0gJChjYWxsIHJ1c3RjLW9wdGlvbiwtWnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00KQo+
ICBlbHNlCj4gICAgICAgICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnk9Mgo+ICsgICAgICAgS0JVSUxEX1JVU1RGTEFHUyArPSAkKGNhbGwgcnVzdGMtb3B0aW9u
LC1acGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTIpCj4gIGVuZGlmCj4gIGVuZGlmCj4KPiBkaWZm
IC0tZ2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnCj4gaW5kZXggNTMwYTM4MmVlMGZl
Li40MzQzNGI2ODFjM2YgMTAwNjQ0Cj4gLS0tIGEvaW5pdC9LY29uZmlnCj4gKysrIGIvaW5pdC9L
Y29uZmlnCj4gQEAgLTE5NDYsNyArMTk0Niw3IEBAIGNvbmZpZyBSVVNUCj4gICAgICAgICBkZXBl
bmRzIG9uICFHQ0NfUExVR0lOX1JBTkRTVFJVQ1QKPiAgICAgICAgIGRlcGVuZHMgb24gIVJBTkRT
VFJVQ1QKPiAgICAgICAgIGRlcGVuZHMgb24gIURFQlVHX0lORk9fQlRGIHx8IFBBSE9MRV9IQVNf
TEFOR19FWENMVURFCj4gLSAgICAgICBkZXBlbmRzIG9uICFDRklfQ0xBTkcgfHwgUlVTVENfVkVS
U0lPTiA+PSAxMDc5MDAgJiYgSEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lOVEVHRVJTCj4gKyAg
ICAgICBkZXBlbmRzIG9uICFDRklfQ0xBTkcgfHwgUlVTVENfVkVSU0lPTiA+PSAxMDgxMDAgJiYg
SEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lOVEVHRVJTCj4gICAgICAgICBzZWxlY3QgQ0ZJX0lD
QUxMX05PUk1BTElaRV9JTlRFR0VSUyBpZiBDRklfQ0xBTkcKPiAgICAgICAgIGRlcGVuZHMgb24g
IUNBTExfUEFERElORyB8fCBSVVNUQ19WRVJTSU9OID49IDEwODEwMAo+ICAgICAgICAgZGVwZW5k
cyBvbiAhS0FTQU5fU1dfVEFHUwo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDRhMzM1ZjkyMGJjNzhl
NTFiMWQ3ZDIxNmQxMWYyZWNiYjZkZDk0OWYKPiBjaGFuZ2UtaWQ6IDIwMjQxMDA4LWNmaS1wYXRj
aGFibGUtYWxsLWRkZDYyNzVlYWY0Zgo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gQWxpY2UgUnlo
bCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
