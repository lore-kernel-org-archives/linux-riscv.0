Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EBACCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBBJfPMnfdDtSdGog5Wr4Ftylp7AikWNLr0qBDobZmQ=; b=3OvlAlgdD8NH+Y
	2OtUM4LBSAOxJ0z2S5rBLbrPuRNXj8WQDKMIt+wujsgZm6OqtOkCPtTxAhfy/5huTGIj1KRgaKQwp
	eyZUY9JwDDJh1QICgnWYNzZmT/I6G3yDZVZas3qeDQHge/vMqqOFRQz+5PvmdFw18xcDkHGAHKf8y
	byUW3LVGD5MnbKC59ASZQUksrSTnvhp9dDfjBC79i2107hY1GXDhnPBbog7PtP6rMDuUEyBIygyq5
	47KI8IruIsJAbz2aZnUAJgDAi3poreuGuSdAVVsBGAxDZxFUd8TYI6O8ow7N/icHFoWiBfrmglpP6
	7OWPBNpHyqUh854OUGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAs5-0000000BGdQ-2TVX;
	Tue, 04 Nov 2025 06:50:25 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAs3-0000000BGZh-1GjG;
	Tue, 04 Nov 2025 06:50:24 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0z9m0gsPz9sSb;
	Tue,  4 Nov 2025 07:31:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzBUMEXuRcrz; Tue,  4 Nov 2025 07:31:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0z9l6gDWz9sSZ;
	Tue,  4 Nov 2025 07:31:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CCC188B76C;
	Tue,  4 Nov 2025 07:31:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GoDVNgciAAnR; Tue,  4 Nov 2025 07:31:07 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA3368B763;
	Tue,  4 Nov 2025 07:31:05 +0100 (CET)
Message-ID: <942a27d9-135a-4e59-8eff-a44c46f8bb76@csgroup.eu>
Date: Tue, 4 Nov 2025 07:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.736737934@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.736737934@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225023_514134_143E0C23 
X-CRM114-Status: GOOD (  23.44  )
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

CgpMZSAyNy8xMC8yMDI1IMOgIDA5OjQ0LCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBG
cm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiAKPiBSZXBsYWNlIHRo
ZSBvcGVuIGNvZGVkIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIG5ldyBnZXQvcHV0X3VzZXJfaW5s
aW5lKCkKPiBoZWxwZXJzLiBUaGlzIG1pZ2h0IGJlIHJlcGxhY2VkIGJ5IGEgcmVndWxhciBnZXQv
cHV0X3VzZXIoKSwgYnV0IHRoYXQgbmVlZHMKPiBhIHByb3BlciBwZXJmb3JtYW5jZSBldmFsdWF0
aW9uLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IFBldGVyIFppamxz
dHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBDYzogRGFycmVuIEhhcnQgPGR2aGFydEBpbmZy
YWRlYWQub3JnPgo+IENjOiBEYXZpZGxvaHIgQnVlc28gPGRhdmVAc3Rnb2xhYnMubmV0Pgo+IENj
OiAiQW5kcsOpIEFsbWVpZGEiIDxhbmRyZWFsbWVpZEBpZ2FsaWEuY29tPgoKUmV2aWV3ZWQtYnk6
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KCj4gLS0tCj4g
VjU6IFJlbmFtZSBhZ2FpbiBhbmQgcmVtb3ZlIHRoZSBoZWxwZXJzCj4gVjQ6IFJlbmFtZSBvbmNl
IG1vYXIKPiBWMzogQWRhcHQgdG8gc2NvcGUgY2hhbmdlcwo+IFYyOiBDb252ZXJ0IHRvIHNjb3Bl
ZCB2YXJpYW50Cj4gLS0tCj4gICBrZXJuZWwvZnV0ZXgvY29yZS5jICB8ICAgIDQgKy0tCj4gICBr
ZXJuZWwvZnV0ZXgvZnV0ZXguaCB8ICAgNTggKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNTcgZGVsZXRpb25zKC0pCj4gLS0tCj4gLS0tIGEva2VybmVsL2Z1dGV4L2NvcmUuYwo+ICsr
KyBiL2tlcm5lbC9mdXRleC9jb3JlLmMKPiBAQCAtNTgxLDcgKzU4MSw3IEBAIGludCBnZXRfZnV0
ZXhfa2V5KHUzMiBfX3VzZXIgKnVhZGRyLCB1bnMKPiAgIAlpZiAoZmxhZ3MgJiBGTEFHU19OVU1B
KSB7Cj4gICAJCXUzMiBfX3VzZXIgKm5hZGRyID0gKHZvaWQgKil1YWRkciArIHNpemUgLyAyOwo+
ICAgCj4gLQkJaWYgKGZ1dGV4X2dldF92YWx1ZSgmbm9kZSwgbmFkZHIpKQo+ICsJCWlmIChnZXRf
dXNlcl9pbmxpbmUobm9kZSwgbmFkZHIpKQo+ICAgCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gICAKPiAg
IAkJaWYgKChub2RlICE9IEZVVEVYX05PX05PREUpICYmCj4gQEAgLTYwMSw3ICs2MDEsNyBAQCBp
bnQgZ2V0X2Z1dGV4X2tleSh1MzIgX191c2VyICp1YWRkciwgdW5zCj4gICAJCQlub2RlID0gbnVt
YV9ub2RlX2lkKCk7Cj4gICAJCQlub2RlX3VwZGF0ZWQgPSB0cnVlOwo+ICAgCQl9Cj4gLQkJaWYg
KG5vZGVfdXBkYXRlZCAmJiBmdXRleF9wdXRfdmFsdWUobm9kZSwgbmFkZHIpKQo+ICsJCWlmIChu
b2RlX3VwZGF0ZWQgJiYgcHV0X3VzZXJfaW5saW5lKG5vZGUsIG5hZGRyKSkKPiAgIAkJCXJldHVy
biAtRUZBVUxUOwo+ICAgCX0KPiAgIAo+IC0tLSBhL2tlcm5lbC9mdXRleC9mdXRleC5oCj4gKysr
IGIva2VybmVsL2Z1dGV4L2Z1dGV4LmgKPiBAQCAtMjgxLDYzICsyODEsMTEgQEAgc3RhdGljIGlu
bGluZSBpbnQgZnV0ZXhfY21weGNoZ192YWx1ZV9sbwo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4g
ICAKPiAtLyoKPiAtICogVGhpcyBkb2VzIGEgcGxhaW4gYXRvbWljIHVzZXIgc3BhY2UgcmVhZCwg
YW5kIHRoZSB1c2VyIHBvaW50ZXIgaGFzCj4gLSAqIGFscmVhZHkgYmVlbiB2ZXJpZmllZCBlYXJs
aWVyIGJ5IGdldF9mdXRleF9rZXkoKSB0byBiZSBib3RoIGFsaWduZWQKPiAtICogYW5kIGFjdHVh
bGx5IGluIHVzZXIgc3BhY2UsIGp1c3QgbGlrZSBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21p
YygpLgo+IC0gKgo+IC0gKiBXZSBzdGlsbCB3YW50IHRvIGF2b2lkIGFueSBzcGVjdWxhdGlvbiwg
YW5kIHdoaWxlIF9fZ2V0X3VzZXIoKSBpcwo+IC0gKiB0aGUgdHJhZGl0aW9uYWwgbW9kZWwgZm9y
IHRoaXMsIGl0J3MgYWN0dWFsbHkgc2xvd2VyIHRoYW4gZG9pbmcKPiAtICogdGhpcyBtYW51YWxs
eSB0aGVzZSBkYXlzLgo+IC0gKgo+IC0gKiBXZSBjb3VsZCBqdXN0IGhhdmUgYSBwZXItYXJjaGl0
ZWN0dXJlIHNwZWNpYWwgZnVuY3Rpb24gZm9yIGl0LAo+IC0gKiB0aGUgc2FtZSB3YXkgd2UgZG8g
ZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5hdG9taWMoKSwgYnV0IHJhdGhlcgo+IC0gKiB0aGFuIGZv
cmNlIGV2ZXJ5Ym9keSB0byBkbyB0aGF0LCB3cml0ZSBpdCBvdXQgbG9uZy1oYW5kIHVzaW5nCj4g
LSAqIHRoZSBsb3ctbGV2ZWwgdXNlci1hY2Nlc3MgaW5mcmFzdHJ1Y3R1cmUuCj4gLSAqCj4gLSAq
IFRoaXMgbG9va3MgYSBiaXQgb3ZlcmtpbGwsIGJ1dCBnZW5lcmFsbHkganVzdCByZXN1bHRzIGlu
IGEgY291cGxlCj4gLSAqIG9mIGluc3RydWN0aW9ucy4KPiAtICovCj4gLXN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgaW50IGZ1dGV4X2dldF92YWx1ZSh1MzIgKmRlc3QsIHUzMiBfX3VzZXIgKmZyb20p
Cj4gLXsKPiAtCXUzMiB2YWw7Cj4gLQo+IC0JaWYgKGNhbl9kb19tYXNrZWRfdXNlcl9hY2Nlc3Mo
KSkKPiAtCQlmcm9tID0gbWFza2VkX3VzZXJfYWNjZXNzX2JlZ2luKGZyb20pOwo+IC0JZWxzZSBp
ZiAoIXVzZXJfcmVhZF9hY2Nlc3NfYmVnaW4oZnJvbSwgc2l6ZW9mKCpmcm9tKSkpCj4gLQkJcmV0
dXJuIC1FRkFVTFQ7Cj4gLQl1bnNhZmVfZ2V0X3VzZXIodmFsLCBmcm9tLCBFZmF1bHQpOwo+IC0J
dXNlcl9yZWFkX2FjY2Vzc19lbmQoKTsKPiAtCSpkZXN0ID0gdmFsOwo+IC0JcmV0dXJuIDA7Cj4g
LUVmYXVsdDoKPiAtCXVzZXJfcmVhZF9hY2Nlc3NfZW5kKCk7Cj4gLQlyZXR1cm4gLUVGQVVMVDsK
PiAtfQo+IC0KPiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgZnV0ZXhfcHV0X3ZhbHVlKHUz
MiB2YWwsIHUzMiBfX3VzZXIgKnRvKQo+IC17Cj4gLQlpZiAoY2FuX2RvX21hc2tlZF91c2VyX2Fj
Y2VzcygpKQo+IC0JCXRvID0gbWFza2VkX3VzZXJfYWNjZXNzX2JlZ2luKHRvKTsKPiAtCWVsc2Ug
aWYgKCF1c2VyX3dyaXRlX2FjY2Vzc19iZWdpbih0bywgc2l6ZW9mKCp0bykpKQo+IC0JCXJldHVy
biAtRUZBVUxUOwo+IC0JdW5zYWZlX3B1dF91c2VyKHZhbCwgdG8sIEVmYXVsdCk7Cj4gLQl1c2Vy
X3dyaXRlX2FjY2Vzc19lbmQoKTsKPiAtCXJldHVybiAwOwo+IC1FZmF1bHQ6Cj4gLQl1c2VyX3dy
aXRlX2FjY2Vzc19lbmQoKTsKPiAtCXJldHVybiAtRUZBVUxUOwo+IC19Cj4gLQo+ICsvKiBSZWFk
IGZyb20gdXNlciBtZW1vcnkgd2l0aCBwYWdlZmF1bHRzIGRpc2FibGVkICovCj4gICBzdGF0aWMg
aW5saW5lIGludCBmdXRleF9nZXRfdmFsdWVfbG9ja2VkKHUzMiAqZGVzdCwgdTMyIF9fdXNlciAq
ZnJvbSkKPiAgIHsKPiAtCWludCByZXQ7Cj4gLQo+IC0JcGFnZWZhdWx0X2Rpc2FibGUoKTsKPiAt
CXJldCA9IGZ1dGV4X2dldF92YWx1ZShkZXN0LCBmcm9tKTsKPiAtCXBhZ2VmYXVsdF9lbmFibGUo
KTsKPiAtCj4gLQlyZXR1cm4gcmV0Owo+ICsJZ3VhcmQocGFnZWZhdWx0KSgpOwo+ICsJcmV0dXJu
IGdldF91c2VyX2lubGluZSgqZGVzdCwgZnJvbSk7Cj4gICB9Cj4gICAKPiAgIGV4dGVybiB2b2lk
IF9fZnV0ZXhfdW5xdWV1ZShzdHJ1Y3QgZnV0ZXhfcSAqcSk7Cj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
