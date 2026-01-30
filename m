Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C31E6BF1E
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovxxAvz0wrmD6o1z4fJXN6qk3MXqQCwZwYN+i1lckfo=; b=uVL9gel88igL4Q
	LpqMvatUJEa/Wqswv6eFtmmPnjC5Y88eDl/5OrmrZxNsObw6s+FF7PilWEbHbLB2CpuguZlYua7sG
	9fpM/eYEEk+6/04gLTQag/QwLph1UUuG+u4iZgjyCYxkafICA8lxVfotQHsX1Cxs3G3tcTpXfp0s1
	dBAYAkK6bIZ8XBiIE0bLyT5l2Mw3ieNEE6eCedGrFBmJ8F7gZHWPrhBGBKyFk0MpUvm8uHuD5b4hi
	Q6JTgVPswmxD6ZON4+tVzYiluIkTeNxa1EChj8zDyopUDyskvj8tOjP7qidlV0ri+ezbPdidOZ23u
	bHIzy59MgDwXmhzAQZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrAt-00000001hsb-0ryP;
	Fri, 30 Jan 2026 16:16:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrAq-00000001hs7-1JwM;
	Fri, 30 Jan 2026 16:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBCD143965;
	Fri, 30 Jan 2026 16:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D006C4CEF7;
	Fri, 30 Jan 2026 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769789802;
	bh=AlNS0o8O55cP7ZrafFrQalBO7KdanY5615Qax8Ig75c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hOS7PmZZrFc5HSN1dVXhZyg9M/cciPSolaQqfWhYDg7HfF1XDoB1HNjJxeiK86UnM
	 t0paeaoxtYjhwYcMLP8ehpw722gawXSmnt1Ff80sY7yEF5L7T7o1KVKgfa1P6xx/Uk
	 S7DHHq636jQuWcXVs9rBcbEQ2QAQvrKFpcJM6bhZnxkVAsJwslEvfWUX4cXWiSjnms
	 hkZcBfTLn6d4cw+9OyK7Jpzkky0ySo8aVXdV/3Vs41kEzOIubFCXlw7rvKNAruk9J0
	 NRQPKWhrHubAf3UrGWI3BkY7UvozmV6Ss4pPyWqiFlF2wY0RZojtLxb1ipESYS24SU
	 AnDTT8wKSbTgQ==
Message-ID: <993fb876-7958-4f1d-ba69-2601976a42d7@kernel.org>
Date: Fri, 30 Jan 2026 17:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ryan Roberts <ryan.roberts@arm.com>
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
 David Laight <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-3-ryan.roberts@arm.com> <aXpArjZ1QQowshnA@zx2c4.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aXpArjZ1QQowshnA@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_081644_393243_1850E4DD 
X-CRM114-Status: GOOD (  26.35  )
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

CgpMZSAyOC8wMS8yMDI2IMOgIDE4OjAwLCBKYXNvbiBBLiBEb25lbmZlbGQgYSDDqWNyaXTCoDoK
PiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAwMTowMTowOVBNICswMDAwLCBSeWFuIFJvYmVydHMg
d3JvdGU6Cj4+IFdlIHdpbGwgc2hvcnRseSB1c2UgcHJhbmRvbV91MzJfc3RhdGUoKSB0byBpbXBs
ZW1lbnQga3N0YWNrIG9mZnNldAo+PiByYW5kb21pemF0aW9uIGFuZCBzb21lIGFyY2hlcyBuZWVk
IHRvIGNhbGwgaXQgZnJvbSBub24taW5zdHJ1bWVudGFibGUKPj4gY29udGV4dC4gU28gbGV0J3Mg
aW1wbGVtZW50IHByYW5kb21fdTMyX3N0YXRlKCkgYXMgYW4gb3V0LW9mLWxpbmUKPj4gd3JhcHBl
ciBhcm91bmQgYSBuZXcgX19hbHdheXNfaW5saW5lIHByYW5kb21fdTMyX3N0YXRlX2lubGluZSgp
LiBrc3RhY2sKPj4gb2Zmc2V0IHJhbmRvbWl6YXRpb24gd2lsbCB1c2UgdGhpcyBuZXcgdmVyc2lv
bi4KPj4KPj4gQWNrZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJ5YW4gUm9iZXJ0cyA8cnlhbi5yb2JlcnRzQGFybS5jb20+Cj4+IC0t
LQo+PiAgIGluY2x1ZGUvbGludXgvcHJhbmRvbS5oIHwgMjAgKysrKysrKysrKysrKysrKysrKysK
Pj4gICBsaWIvcmFuZG9tMzIuYyAgICAgICAgICB8ICA4ICstLS0tLS0tCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9wcmFuZG9tLmggYi9pbmNsdWRlL2xpbnV4L3ByYW5kb20uaAo+PiBp
bmRleCBmZjdkY2MzZmExMDUuLjgwMTE4ODY4MGEyOSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9wcmFuZG9tLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9wcmFuZG9tLmgKPj4gQEAgLTE3
LDYgKzE3LDI2IEBAIHN0cnVjdCBybmRfc3RhdGUgewo+PiAgIAlfX3UzMiBzMSwgczIsIHMzLCBz
NDsKPj4gICB9Owo+PiAgIAo+PiArLyoqCj4+ICsgKiBwcmFuZG9tX3UzMl9zdGF0ZV9pbmxpbmUg
LSBzZWVkZWQgcHNldWRvLXJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLgo+PiArICogQHN0YXRlOiBw
b2ludGVyIHRvIHN0YXRlIHN0cnVjdHVyZSBob2xkaW5nIHNlZWRlZCBzdGF0ZS4KPj4gKyAqCj4+
ICsgKiBUaGlzIGlzIHVzZWQgZm9yIHBzZXVkby1yYW5kb21uZXNzIHdpdGggbm8gb3V0c2lkZSBz
ZWVkaW5nLgo+PiArICogRm9yIG1vcmUgcmFuZG9tIHJlc3VsdHMsIHVzZSBnZXRfcmFuZG9tX3Uz
MigpLgo+PiArICogRm9yIHVzZSBvbmx5IHdoZXJlIHRoZSBvdXQtb2YtbGluZSB2ZXJzaW9uLCBw
cmFuZG9tX3UzMl9zdGF0ZSgpLCBjYW5ub3QgYmUKPj4gKyAqIHVzZWQgKGUuZy4gbm9pbnN0ciBj
b2RlKS4KPj4gKyAqLwo+PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB1MzIgcHJhbmRvbV91MzJf
c3RhdGVfaW5saW5lKHN0cnVjdCBybmRfc3RhdGUgKnN0YXRlKQo+IAo+IFRoaXMgaXMgcHJldHR5
IGJpa2VzaGVkZHkgYW5kIEknbSBub3QgcmVhbGx5IGVudGlyZWx5IGNvbnZpbmNlZCB0aGF0IG15
Cj4gaW50dWl0aW9uIGlzIGNvcnJlY3QgaGVyZSwgYnV0IEkgdGhvdWdodCBJIHNob3VsZCBhdCBs
ZWFzdCBhc2suIERvIHlvdQo+IHRoaW5rIHRoaXMgd291bGQgYmUgYmV0dGVyIGNhbGxlZCBfX3By
YW5kb21fdTMyX3N0YXRlKCksIHdoZXJlIHRoZSAiX18iCj4gaXMga2luZCBvZiBhLCAiZG9uJ3Qg
dXNlIHRoaXMgZGlyZWN0bHkgdW5sZXNzIHlvdSBrbm93IHdoYXQgeW91J3JlIGRvaW5nCj4gYmVj
YXVzZSBpdCdzIHNvcnQgb2YgaW50ZXJuYWwiPyBJdCBzZWVtcyBsaWtlIGVpdGhlciB3ZSBtYWtl
IHRoaXMgaW5saW5lCj4gZm9yIGV2ZXJ5Ym9keSwgb3IgaWYgdGhlcmUncyBhIGdvb2QgcmVhc29u
IGZvciBoYXZpbmcgbW9zdCB1c2VycyB1c2UgdGhlCj4gbm9uLWlubGluZSB2ZXJzaW9uLCB0aGVu
IHdlIHNob3VsZCBiZSBjYXJlZnVsIHRoYXQgbmV3IHVzZXJzIGRvbid0IHVzZQo+IHRoZSBpbmxp
bmUgdmVyc2lvbi4gSSB3YXMgdGhpbmtpbmcgdGhlIF9fIHdvdWxkIGhlbHAgd2l0aCB0aGF0LgoK
SSBsb29rZWQgaW50byBrZXJuZWwgc291cmNlcyBhbmQgdGhlcmUgYXJlIHNldmVyYWwgZnVuY3Rp
b25zIG5hbWVkIApzb21ldGhpbmdfc29tZXRoaW5nX2Vsc2VfaW5saW5lKCkgYW5kIGl0IGRvZXNu
J3QgbWVhbiB0aG9zZSBmdW5jdGlvbnMgCmdldCBpbmxpbmVkLCBzbyBJIHdvdWxkIGFsc28gcHJl
ZmVyIF9fcHJhbmRvbV91MzJfc3RhdGUoKSB3aGljaCBtZWFucyAKIklmIHlvdSB1c2UgaXQgeW91
IGtub3cgd2hhdCB5b3UgYXJlIGRvaW5nIiwganVzdCBsaWtlIF9fZ2V0X3VzZXIoKSBmb3IgCmlu
c3RhbmNlLgoKSG93ZXZlciBtYXliZSB3ZSBjb3VsZCBhbHNvIHJlY29uc2lkZXIgbWFraW5nIGl0
IGlubGluZSBmb3IgZXZlcnlvbmUuIFdlIApoYXZlIHNwb3R0ZWQgaGFsZiBhIGRvemVuIG9mIHBs
YWNlcyB3aGVyZSB0aGUgY29kZSBzaXplIGluY3JlYXNlcyBhIGxvdCAKd2hlbiBmb3JjaW5nIGl0
IGlubGluZSwgYnV0IHRob3NlIHBsYWNlcyBkZXNlcnZlIGEgbG9jYWwgdHJhbXBvbGluZSB0byAK
YXZvaWQgY29kZSBkdXBsaWNhdGlvbiwgYW5kIHRoZW4gdGhlIGNvbXBpbGVyIGRlY2lkZXMgdG8g
aW5saW5lIG9yIG5vdC4KCkJlY2F1c2UgdGhlcmUgYXJlIGFsc28gc2V2ZXJhbCBwbGFjZXMgdGhh
dCBiZW5lZml0IGZyb20gdGhlIGlubGluaW5nIApiZWNhdXNlIGl0IGFsbG93cyBHQ0MgdG8gc2lt
cGxpZnkgdGhlIGNhbGN1bGF0aW9uLCBmb3IgaW5zdGFuY2Ugd2hlbiAKc29tZSBjYWxjdWxhdGlv
biBpcyBwZXJmb3JtZWQgd2l0aCB0aGUgcmVzdWx0IGxpa2Ugd2l0aCAKKHByYW5kb21fdTMyX3N0
YXRlKHJuZykgJSBjZWlsKSB3aGVyZSBjZWlsIGlzIDIgb3IgNC4KClRoYXQgY2FuIG9mIGNvdXJz
ZSBiZSBkb25lIGFzIGEgZm9sbG93dXAgcGF0Y2ggYnV0IGl0IG1lYW5zIGF0IHRoZSBlbmQgCndl
IHdpbGwgaGF2ZSB0byByZW5hbWUgYWxsIF9fcHJhbmRvbV91MzJfc3RhdGUoKSB0byBwcmFuZG9t
X3UzMl9zdGF0ZSgpLgoKT3Igc2hvdWxkIHdlIGRvIHRoZSBvdGhlciB3YXkgcm91bmQgPyBNYWtl
IF9fcHJhbmRvbV91MzJfc3RhdGUoKSB0aGUgCm91dC1vZi1saW5lIHZlcnNpb24gYW5kIGp1c3Qg
Y2hhbmdlIHRoZSBmZXcgcGxhY2VzIHdoZXJlIHRoZSBzaXplIApleHBsb2RlcyBsaWtlIGRybV90
ZXN0X2J1ZGR5X2FsbG9jX3JhbmdlX2JpYXMoKSwgbG9zc19naWxiX2VsbCgpLCAKZ2VuZXJhdGVf
cmFuZG9tX3Rlc3R2ZWNfY29uZmlnKCksIGdlbmVyYXRlX3JhbmRvbV9zZ2xfZGl2aXNpb25zKCks
IAptdXRhdGVfYnVmZmVyKCksIC4uLiA/CgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
