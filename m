Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB37606A327
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acVWmiZd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=WV1Fa8Tw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ykhYGdQ61d4PTVeEEPs5d2hyykRBnPTyz6Z4hmqbSRg=; b=acVWmiZdsLjtXKEt6dYKq5hewa
	E9MozZ+OwryM7u1QSSec6A4OFaevvMgGF5J9/lZJf5LC9zBob9F0QH7bLuUrYvAlTBU0ZbnOSGEd9
	d98+1N8zNhx/RKrB/pm4Mq7pp185tGhdrcIzIE2CLW3ewpIIpddYjft8bEohsUzoVIKMt/r31dKIt
	cODxXYgkoFSsDN7Sv74wpm9cJ1A+mCnA6ZZAVFdVnd8tiQVUIuzFMriJA67IAythF47ZhrrM6WBKk
	ebgnSX71dOudZ4YUlqPHSfCxZtR6p4m9zloV7Qe76axpFHBHBqK96uNygQoD9uBcVCBEkQRLD+pEg
	10Yfx2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkgY-0000000Ble2-1MBI;
	Fri, 13 Nov 2026 06:22:54 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkgV-0000000BldI-2DzP
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 06:22:53 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3adfe77d336so7318501fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 22:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550969; cv=none;
        d=google.com; s=arc-20260327;
        b=V5DqElUP5N7bae2DF5TP4EEzYvn3bIPQjCzvHBJ4bIDvrV0Q+OYpFCY2SPxQam3bg3
         VZwa0yVB1Ljm29e3qh0szPE23iGQOSJ/WNZ62rnfDPnFuGLP2pB5n4NS37fhCF8XDpj4
         7Ox6R+mC7aBuXC7OdMzCyBMYuzYdgnPsInxRmOWLqsK7t0qMAWMBdeAmwcJ2Y0jWah7r
         PFbEM/+lDyNqb4nLlww3MSog81M53Wf9xQ82TDqoRGRIMVTFz21Kz9pFk4m4DKUe4T6K
         8Bn9REz9emt+GsuIH/ZzwBUhsKwSfdJ0ij8kqb4yd1+a0D0iKlyg9OOMGJTgJ30UvSL3
         RWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
        fh=a9c3mziNjdfKdO++7Ww/tDhUn0QGYH2D4JZGNGz2imA=;
        b=lemFW9jP6ccT32JNek0yCRT+cqatkU8wGevjgSmtBVw3kRv11uEZXvIrsSmBJNvI3O
         QoTH6OTpkJa69egQq5WWhyBTNI2hXTtPCfutrQffc2Cgwkn3Btl4fe50Z1p7KjDyasw5
         bDfa4fTNbr1sDm8ljlu7aor7HLbrENA6g9B41gZAxTDFR2OXPVk+K1Ij1bCZ+OIQxlbb
         22XhwQBbda+K/TOS/yov+25IptRrcId15DPL68jZxzFQDwjP/CN0oWBxqACyeEWMyCrY
         ivSHN/jff2Xbz9dJTOUPTjBATESf6e1QYMXHX9ZTyvEnrba5a6d38zxgi96VvG9nhvWl
         wFeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794550969; x=1795155769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
        b=WV1Fa8TwcVRbeYHNe2z675jinWbeBFcQqZ27K0wYcT7xW4lfNXDmjB4EI0xpalm4Uc
         4wJHR3MV/chEC01sA0ZnAr5m2Vy61zkWcmYEjy4GatdJ0dlXTdQYH+pi4oSRZ1lG/0lE
         aFPLHyKvrQiwjNK6xMzt6ucIb+QEK7KkkFTBfxtL7j5726d7fxWxTc1vrHK1x1b1r7D+
         VAHnkmLszngcbHeFagusjQvDcHYTPJDaeeSL0viCaezpZdFSAZNsKoSUEzpF28NAHUb+
         /YqOuZxuVTgFQCjvQsjfL4MJTXgpKR1a1rLPrF8aXxnA8ocxs7CfWKXc/lesloogacbF
         Vgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550969; x=1795155769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
        b=PyZrwhzgL5jPLNqM3wmrpxPjTzEVXXDzaCBuv0X77n+rsRLGwxMB21EChr0CPAzd4P
         DS4rFfl9QlHUwje5+6Hq2gnCgd3OZgRWZoUC4WEVA5jip1/8g+m9JCijmqsjcnTKviLm
         tPwv2wHWBOyJ5DB5x1ehRsbdhePY2WKtdt2Wj5p6PYHM1FS9+/76dhm2tBw4FDHAxANZ
         Bp/i5NLo4XKFc/h0R1dJYOygpTnYScYuSev0Mrxg9t1gufpX4yhFgL8z6fOYeL22N4py
         ubGw3p4v625PKA/nuLHWo4+wOwtI3UHCsEN5PfBcbBYBx/BAuZ9L9tYQGaZYYTFmvXDz
         ujpg==
X-Forwarded-Encrypted: i=1; AL+hErG6tOklnH1U9UvrLa/HupjlBGSN1QV/HdY5i+KJ7SxgWXoGp0YPn8D7vt4VZIZ1APmnGgvYBVcbbOFtSg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/wbnhCbIX2hjAMALCBz+fqZ7W5+4clqdbAnGrq2siFUHTy/DMX
	FXsEGpEAGhjDjWlxnP77OzQx/eKk9RMAFnb1G+4D7s2+0XzxvJMPBBfyt7jyxQ+Z8sp3+9/1ICV
	1KrBKnItGguyGWu2GKsZ3nQIwkFh5a49eRYUO8maQQw==
X-Gm-Gg: AYBFou1OzucbsB3EZ9NQWdkVt41U82xS8KxAl2khHI6+EV1zTjiMSCaNvJq+NDBb4dc
	7wqCxybm2wA+tZN3hzYtway0lGMeZzZKklm7pLXVg3UypoJB3BAF0M+bDeEvbR9nPNX86CQuLy1
	NNYXWYEJ4RURA08VE/0UWCpmeE2WeNemLsLuZdKq6HWkfOaqR13ZsuPue0TWnHA17XKbtU7EmJV
	owzETd2nWCLy6QOOmRlbWFGxPk+/eiig+QlDSU+CUS7a+5t1mlp5rvmGyB16tDdDR6sWLx3ihlu
	3ADo2vqByMscNBmgPDQ4J9IF5vcJS/O9DvtwaaXfEnlrhYgise2Vx3rWhsVmtJruV5y660+g+oy
	XvkP6aypfzDPuXVN4qdcEzJLRPXI0OGiKoFbRe2KKbArAaOSu1mjfcFST2DlU7OQT+/VBYCGzCX
	OKtn2u4zstl1M5owC5nSun3Nxtl1nPCkeiL6Gg5IjSyf+ODR0PEjov0iGa/22I/2lfQmGcbRBeQ
	3tZCw==
X-Received: by 2002:a05:651c:984:b0:3ae:25db:778e with SMTP id
 38308e7fff4ca-3ae2b4f8c44mr5983811fa.25.1794550969373; Thu, 12 Nov 2026
 22:22:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
In-Reply-To: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:52:37 +0530
X-Gm-Features: AclHuK8kJEX4JlRXb2KsetLnyCm5PUC-HVvhCYSR9hJmTyId-OXBRfW2YskwCEk
Message-ID: <CAAhSdy1vRrD17+a2-QLAqDiJd=S=H08n66x9hW+-NFQEKdU01g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix builds without CONFIG_RISCV_ISA_V
To: slack up <yxcnew@outlook.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <tchiu@tenstorrent.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_222251_604059_8472913F 
X-CRM114-Status: GOOD (  21.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgMTE6MDLigK9QTSBzbGFjayB1cCA8eXhjbmV3QG91dGxv
b2suY29tPiB3cm90ZToKPgo+IEZyb206IFhpYW9jaHVuIFl1IDx5eGNuZXdAb3V0bG9vay5jb20+
Cj4KPiBDb21taXQgYjUwNjBhNGFhMzNkICgiUklTQy1WOiBLVk06IGZpeCB2Y3B1IHZlY3RvciBj
b250ZXh0Cj4gaGFuZGxpbmcgZm9yIGtlcm5lbC1tb2RlIHZlY3RvciIpIG1hZGUgdGhlIEtWTSB2
Q1BVIGxvYWQgYW5kIHB1dCBwYXRocwo+IGNhbGwgZ2V0X2NwdV92ZWN0b3JfY29udGV4dCgpIGFu
ZCBwdXRfY3B1X3ZlY3Rvcl9jb250ZXh0KCkKPiB1bmNvbmRpdGlvbmFsbHkuICBJdCBhbHNvIGFk
ZGVkIGFuIHVuY29uZGl0aW9uYWwgY2FsbCB0bwo+IF9fa3ZtX3Jpc2N2X3ZlY3Rvcl9yZXN0b3Jl
KCkgb24gdGhlIGd1ZXN0IGVudHJ5IHBhdGguCj4KPiBUaGUgbm8tb3AgZGVmaW5pdGlvbnMgb2Yg
dGhlIGZpcnN0IHR3byBoZWxwZXJzIGxpdmUgaW4gPGFzbS92ZWN0b3IuaD4sCj4gYnV0IDxhc20v
a3ZtX3ZjcHVfdmVjdG9yLmg+IGluY2x1ZGVzIHRoYXQgaGVhZGVyIG9ubHkgd2hlbgo+IENPTkZJ
R19SSVNDVl9JU0FfViBpcyBlbmFibGVkLiAgVGhlIEtWTSBoZWFkZXIgYWxzbyBkb2VzIG5vdCBw
cm92aWRlIGEKPiBuby1vcCBfX2t2bV9yaXNjdl92ZWN0b3JfcmVzdG9yZSgpIGluIGl0cyBkaXNh
YmxlZCBicmFuY2guICBBcyBhIHJlc3VsdCwKPiBhIEtWTSBidWlsZCB3aXRob3V0IENPTkZJR19S
SVNDVl9JU0FfViBmYWlscyB3aXRoIG1pc3NpbmcgaGVscGVyCj4gZGVjbGFyYXRpb25zLgo+Cj4g
SW5jbHVkZSA8YXNtL3ZlY3Rvci5oPiB1bmNvbmRpdGlvbmFsbHkgdG8gcmV1c2UgaXRzIGV4aXN0
aW5nIG5vLW9wCj4gaGVscGVycywgYW5kIHByb3ZpZGUgdGhlIG1pc3NpbmcgS1ZNIHJlc3RvcmUg
c3R1YiB3aGVuIFZlY3RvciBzdXBwb3J0IGlzCj4gZGlzYWJsZWQuICBUaGlzIGRvZXMgbm90IGNo
YW5nZSB0aGUgVmVjdG9yLWVuYWJsZWQgcGF0aC4KPgo+IEZpeGVzOiBiNTA2MGE0YWEzM2QgKCJS
SVNDLVY6IEtWTTogZml4IHZjcHUgdmVjdG9yIGNvbnRleHQgaGFuZGxpbmcgZm9yIGtlcm5lbC1t
b2RlIHZlY3RvciIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBYaWFvY2h1biBZdSA8eXhjbmV3QG91dGxvb2suY29tPgoKQSBzaW1pbGFyIGZpeCBmcm9tIFpo
YW5wZW5nIFpoYW5nIGlzIGFscmVhZHkgbWVyZ2VkLgpodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjYwOTIyMDIxODIzLjQ0MjUxLTItemhhbmd6aGFucGVuZy5qYXNwZXJAYnl0ZWRhbmNlLmNv
bQoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiBUaGlzIHNpbmdsZSBwYXRjaCBmaXhlcyBhIGJ1aWxk
IHJlZ3Jlc3Npb24gd2hlbiBLVk0gaXMgZW5hYmxlZCB3aXRob3V0IHRoZQo+IFJJU0MtViBWZWN0
b3IgZXh0ZW5zaW9uLgo+Cj4gVGVzdGVkIG9uIGJhc2UgYTgwNGM1NzQyYmZmIChUb3J2YWxkcyBt
YXN0ZXIpOgo+Cj4gLSBDT05GSUdfUklTQ1ZfSVNBX1Y9biwgQ09ORklHX0tWTT1tOiBmdWxsIElt
YWdlIG1vZHVsZXMgYnVpbGQgcGFzc2VkLgo+IC0gQ09ORklHX1JJU0NWX0lTQV9WPXksIENPTkZJ
R19LVk09bTogdmNwdS5vIGFuZCB2Y3B1X3ZlY3Rvci5vIHJlYnVpbHQuCj4gLS0tCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmggfCA2ICsrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmgKPiBpbmRleCA2MzcxZDVlYTUzOTIuLmViYzYxOWVk
NjdkZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3ZlY3Rv
ci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaAo+IEBA
IC0xMSw5ICsxMSw5IEBACj4gICNkZWZpbmUgX19LVk1fVkNQVV9SSVNDVl9WRUNUT1JfSAo+Cj4g
ICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+Cj4g
ICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1YKPiAtI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiAg
I2luY2x1ZGUgPGFzbS9rdm1faG9zdC5oPgo+Cj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCBfX2t2bV9yaXNjdl92ZWN0b3Jfc2F2ZShzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjb250ZXh0
KQo+IEBAIC01NSw2ICs1NSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X3ZfZXhp
dCh2b2lkKQo+Cj4gIHN0cnVjdCBrdm1fY3B1X2NvbnRleHQ7Cj4KPiArc3RhdGljIGlubGluZSB2
b2lkIF9fa3ZtX3Jpc2N2X3ZlY3Rvcl9yZXN0b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNv
bnRleHQpCj4gK3sKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSB2b2lkIGt2bV9yaXNjdl92Y3B1
X3ZlY3Rvcl9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgfQo+Cj4gLS0tCj4g
YmFzZS1jb21taXQ6IGE4MDRjNTc0MmJmZjIyNGQ0Y2I0ZDI1ZGQzODM1NTRkNTk4YmUzMmIKPiBj
aGFuZ2UtaWQ6IDIwMjYxMDIxLW9zcHAtYzEtYjQtc3VibWl0LWUyMmRjMDlmYWY1YQo+Cj4gQmVz
dCByZWdhcmRzLAo+IC0tCj4gc2xhY2sgdXAgPHl4Y25ld0BvdXRsb29rLmNvbT4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
