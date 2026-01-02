Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23954FA374B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YX0htZMzWqb+KM/F6kQ5W2+dJC1j3v+iZpYHw3ZZIhM=; b=VHBUUv9/vFHyne
	5gh78JpkmiW/zj1DrQjM5j57lfIoC8R/BuSzZiI7P3cKy4m2hJr52z4hETkGRv0dCM6rNQ/SOls8U
	qlIVgYPDwdr24KjhrtDZ7+2tdVb2ZbEXBCbkUEPfNIZJZX3R8k3euqYrgvXg20WSOye+z6GkXjB+I
	YYim4zNldcVfuuoMS2QfXdB10FKy11hZmjetnd9mlZndA5HYtrO26R0Cfacp14JjahL1kJFbgr/iR
	iZGbl4BAfN9u78NoEqOGikzbXeFLnGQVrFer66egIV7lffCfKgtKbCk6R2AjmweE3apjKomTWYTXq
	a2k0u3Ot0rMk5L+b8i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfqT-00000008L7v-3eDO;
	Fri, 02 Jan 2026 14:09:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfqQ-00000008L76-0hfu;
	Fri, 02 Jan 2026 14:09:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C207F497;
	Fri,  2 Jan 2026 06:09:25 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DD043F63F;
	Fri,  2 Jan 2026 06:09:28 -0800 (PST)
Message-ID: <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
Date: Fri, 2 Jan 2026 14:09:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Content-Language: en-GB
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-3-ryan.roberts@arm.com>
 <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_060934_323535_93D9237D 
X-CRM114-Status: GOOD (  18.09  )
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

T24gMDIvMDEvMjAyNiAxMzozOSwgSmFzb24gQS4gRG9uZW5mZWxkIHdyb3RlOgo+IEhpIFJ5YW4s
Cj4gCj4gT24gRnJpLCBKYW4gMiwgMjAyNiBhdCAyOjEy4oCvUE0gUnlhbiBSb2JlcnRzIDxyeWFu
LnJvYmVydHNAYXJtLmNvbT4gd3JvdGU6Cj4+IGNvbnRleHQuIEdpdmVuIHRoZSBmdW5jdGlvbiBp
cyBqdXN0IGEgaGFuZGZ1bCBvZiBvcGVyYXRpb25zIGFuZCBkb2Vzbid0Cj4gCj4gSG93IG1hbnk/
IFdoYXQncyB0aGlzIGxvb2tpbmcgbGlrZSBpbiB0ZXJtcyBvZiBhc3NlbWJseT8gCgoyNSBpbnN0
cnVjdGlvbnMgb24gYXJtNjQ6CgowMDAwMDAwMDAwMDAwMDAwIDxwcmFuZG9tX3UzMl9zdGF0ZT46
CiAgIDA6CTI5NDAxNDAzIAlsZHAJdzMsIHc1LCBbeDBdCiAgIDQ6CWFhMDAwM2UxIAltb3YJeDEs
IHgwCiAgIDg6CTI5NDEwMDAyIAlsZHAJdzIsIHcwLCBbeDAsICM4XQogICBjOgk1MzFlNzRhNCAJ
bHNsCXc0LCB3NSwgIzIKICAxMDoJNTMwZTM0NjggCWxzbAl3OCwgdzMsICMxOAogIDE0Ogk0YTA0
MDBhNSAJZW9yCXc1LCB3NSwgdzQKICAxODoJNGEwMzE4NjMgCWVvcgl3MywgdzMsIHczLCBsc2wg
IzYKICAxYzoJNTMxOTYwNDcgCWxzbAl3NywgdzIsICM3CiAgMjA6CTUzMTM0ODA2IAlsc2wJdzYs
IHcwLCAjMTMKICAyNDoJNGEwMjM0NDIgCWVvcgl3MiwgdzIsIHcyLCBsc2wgIzEzCiAgMjg6CTRh
MDAwYzAwIAllb3IJdzAsIHcwLCB3MCwgbHNsICMzCiAgMmM6CTEyMWI2ODg0IAlhbmQJdzQsIHc0
LCAjMHhmZmZmZmZlMAogIDMwOgkxMjBkMzEwOCAJYW5kCXc4LCB3OCwgIzB4ZmZmODAwMDAKICAz
NDoJMTIxNTUwZTcgCWFuZAl3NywgdzcsICMweGZmZmZmODAwCiAgMzg6CTEyMGMyY2M2IAlhbmQJ
dzYsIHc2LCAjMHhmZmYwMDAwMAogIDNjOgkyYTQ1NmM4NSAJb3JyCXc1LCB3NCwgdzUsIGxzciAj
MjcKICA0MDoJMmE0MzM1MDQgCW9ycgl3NCwgdzgsIHczLCBsc3IgIzEzCiAgNDQ6CTJhNDI1NGUz
IAlvcnIJdzMsIHc3LCB3MiwgbHNyICMyMQogIDQ4OgkyYTQwMzBjMiAJb3JyCXcyLCB3NiwgdzAs
IGxzciAjMTIKICA0YzoJNGEwMjAwNjYgCWVvcgl3NiwgdzMsIHcyCiAgNTA6CTRhMDUwMDgwIAll
b3IJdzAsIHc0LCB3NQogIDU0Ogk0YTAwMDBjMCAJZW9yCXcwLCB3NiwgdzAKICA1ODoJMjkwMDE0
MjQgCXN0cAl3NCwgdzUsIFt4MV0KICA1YzoJMjkwMTA4MjMgCXN0cAl3MywgdzIsIFt4MSwgIzhd
CiAgNjA6CWQ2NWYwM2MwIAlyZXQKCj4gSXQnZCBhbHNvIGJlCj4gbmljZSB0byBoYXZlIHNvbWUg
YnJpZWYgYW5hbHlzaXMgb2Ygb3RoZXIgY2FsbCBzaXRlcyB0byBoYXZlCj4gY29uZmlybWF0aW9u
IHRoaXMgaXNuJ3QgYmxvd2luZyB1cCBvdGhlciB1c2Vycy4KCkkgY29tcGlsZWQgZGVmY29uZmln
IGJlZm9yZSBhbmQgYWZ0ZXIgdGhpcyBwYXRjaCBvbiBhcm02NCBhbmQgY29tcGFyZWQgdGhlIHRl
eHQKc2l6ZXM6CgokIC4vc2NyaXB0cy9ibG9hdC1vLW1ldGVyIC10IHZtbGludXguYmVmb3JlIHZt
bGludXguYWZ0ZXIKYWRkL3JlbW92ZTogMy80IGdyb3cvc2hyaW5rOiA0LzEgdXAvZG93bjogODM2
Ly0xMjggKDcwOCkKRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
b2xkICAgICBuZXcgICBkZWx0YQpwcmFuZG9tX3NlZWRfZnVsbF9zdGF0ZSAgICAgICAgICAgICAg
ICAgICAgICAzNjQgICAgIDkzMiAgICArNTY4CnBpY2tfbmV4dF90YXNrX2ZhaXIgICAgICAgICAg
ICAgICAgICAgICAgICAgMTk0MCAgICAyMDM2ICAgICArOTYKYnBmX3VzZXJfcm5kX3UzMiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMTA0ICAgICAxOTYgICAgICs5MgpwcmFuZG9tX2J5dGVz
X3N0YXRlICAgICAgICAgICAgICAgICAgICAgICAgICAyMDQgICAgIDI2MCAgICAgKzU2CmU4NDM0
MTlAMGYyYl8wMDAxMmQ2OV9lMzQgICAgICAgICAgICAgICAgICAgICAgLSAgICAgICA4ICAgICAg
KzgKZTg0MzQxOUAwZGI3XzAwMDEwZWMzXzIzZWMgICAgICAgICAgICAgICAgICAgICAtICAgICAg
IDggICAgICArOAplODQzNDE5QDAyY2JfMDAwMDM3NjdfMjVjICAgICAgICAgICAgICAgICAgICAg
IC0gICAgICAgOCAgICAgICs4CmJwZl9wcm9nX3NlbGVjdF9ydW50aW1lICAgICAgICAgICAgICAg
ICAgICAgIDQ0OCAgICAgNDQ0ICAgICAgLTQKZTg0MzQxOUAwYWEzXzAwMDBjZmQxXzE1ODAgICAg
ICAgICAgICAgICAgICAgICA4ICAgICAgIC0gICAgICAtOAplODQzNDE5QDBhYTJfMDAwMGNmYmFf
MTQ3YyAgICAgICAgICAgICAgICAgICAgIDggICAgICAgLSAgICAgIC04CmU4NDM0MTlAMDc1Zl8w
MDAwOGQ4Y18xODQgICAgICAgICAgICAgICAgICAgICAgOCAgICAgICAtICAgICAgLTgKcHJhbmRv
bV91MzJfc3RhdGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTAwICAgICAgIC0gICAgLTEw
MApUb3RhbDogQmVmb3JlPTE5MDc4MDcyLCBBZnRlcj0xOTA3ODc4MCwgY2hnICswLjAwJQoKU28g
NzA4IGJ5dGVzIG1vcmUgYWZ0ZXIgaW5saW5pbmcuIFRoZSBtYWluIGNvc3QgaXMgcHJhbmRvbV9z
ZWVkX2Z1bGxfc3RhdGUoKSwKd2hpY2ggY2FsbHMgcHJhbmRvbV91MzJfc3RhdGUoKSAxMCB0aW1l
cyAodmlhIHByYW5kb21fd2FybXVwKCkpLiBJIGV4cGVjdCB3ZQpjb3VsZCB0dXJuIHRoYXQgaW50
byBhIGxvb3AgdG8gcmVkdWNlIH40NTAgYnl0ZXMgb3ZlcmFsbC4KCkknbSBub3QgcmVhbGx5IHN1
cmUgaWYgNzA4IGlzIGdvb2Qgb3IgYmFkLi4uCgo+IAo+PiArc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSB1MzIgcHJhbmRvbV91MzJfc3RhdGUoc3RydWN0IHJuZF9zdGF0ZSAqc3RhdGUpCj4gCj4gV2h5
IG5vdCBqdXN0IG5vcm1hbCBgaW5saW5lYD8gSXMgZ2NjIGRpc2FncmVlaW5nIHdpdGggdGhlIGlu
bGluYWJpbGl0eQo+IG9mIHRoaXMgZnVuY3Rpb24/CgpHaXZlbiB0aGlzIG5lZWRzIHRvIGJlIGNh
bGxlZCBmcm9tIGEgbm9pbnN0ciBmdW5jdGlvbiwgSSBkaWRuJ3Qgd2FudCB0byBnaXZlIHRoZQpj
b21waWxlciB0aGUgb3Bwb3J0dW5pdHkgdG8gZGVjaWRlIG5vdCB0byBpbmxpbmUgaXQsIHNpbmNl
IGluIHRoYXQgY2FzZSwgc29tZQppbnN0cnVtZW50YXRpb24gbWlnaHQgZW5kIHVwIGJlaW5nIGFw
cGxpZWQgdG8gdGhlIGZ1bmN0aW9uIGJvZHkgd2hpY2ggd291bGQgYmxvdwp1cCB3aGVuIGNhbGxl
ZCBpbiB0aGUgbm9pbnN0ciBjb250ZXh0LgoKSSB0aGluayB0aGUgb3RoZXIgMiBvcHRpb25zIGFy
ZSB0byBrZWVwIHByYW5kb21fdTMyX3N0YXRlKCkgaW4gdGhlIGMgZmlsZSBidXQKbWFyayBpdCBu
b2luc3RyIG9yIHJlYXJyYW5nZSBhbGwgdGhlIHVzZXJzIHNvIHRoYXQgdGhheSBkb24ndCBjYWxs
IGl0IHVudGlsCmluc3RydW1lbnRhdGlvbiBpcyBhbGxvd2FibGUuIFRoZSBsYXR0ZXIgaXMgc29t
ZXRoaW5nIEkgd2FzIHRyeWluZyB0byBhdm9pZC4KClRoZXJlIGlzIHNvbWUgcHJldmlvdXMgZGlz
Y3Vzc2lvbiBvZiB0aGlzIGF0IFsxXS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
YVM2NUxGVWZkZ1JQS3YxbEBKMk43UVRSOVIzLwoKUGVyaGFwcyBrZWVwaW5nIHByYW5kb21fdTMy
X3N0YXRlKCkgaW4gdGhlIGMgZmlsZSBhbmQgbWFraW5nIGl0IG5vaW5zdHIgaXMgdGhlCmJlc3Qg
Y29tcHJvbWlzZT8KClRoYW5rcywKUnlhbgoKPiAKPiBKYXNvbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
