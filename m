Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F03CC98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 21:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XicBWH3Yuuy02CCd07reTFl+jQgDrSagIwCL09EBQjw=; b=Fi+Q/SYS60V2ck
	Y7Tva+9pfjeJwB/QcLUpMjocZ8lmfg866Oe3OJF/WIJqgq2R+Qj6rNt/GsDF5FzTbK/9YuakdSWV5
	ovpw/ujGW2l6IT4SztmQJ6vK7a6B9OA0zWUmgKst64eQ/ZB7yKi1C+HlWBbwhtNTOgkHKims80o5M
	YNvXM1Og6DUj1EEIQ81ffq8r39xAszTwUnuKGkknhXfDbA1IS1Pu5TidDoiD+RQjDg9pViAEimn91
	wOAQWjfiob3y6I1ITDgXVtlyujnGyyXH5J5Cn9pQvAlUJFrjo0iA/RyPXL9rasyd7h7HYS2YeT3po
	ygX+NW4TTn36Pt2rLt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rIz-0000000CF6J-1JSw;
	Thu, 24 Sep 2026 21:48:37 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rIw-0000000CF5b-2MTr
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 21:48:35 +0000
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86efece610cso222941b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 14:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286513; cv=none;
        d=google.com; s=arc-20260327;
        b=fXr3ZzUWSM5H7hdwF742jG981701EJxRNavrZWpov+ON2hSVe3KJYbxyM+cVFddWau
         2StVTPtgw3m1TQkdRZ8SX8EFXuA2cZv2KKHF/JxO2fnan2wpqhymcLIXn5pCqlcy19Bp
         JSIxVP8zEQ7qyLk6IbAwjJh5OSLAKJafC12ysfTLIZJYxqn9LUesg50StCqzqE1ZkWgt
         Mk91AcKbdaIOU0FzQzwZMt/dDhUq8Hu3jJlzlYpghvG9fkMYK4BWog+y1T2MFjv9Jl78
         U0qHBKKuaVjWrLTUtM2/uz8VoUAfKRbFN+QBjVxMjD3hrZzac8Sh62ACWhMCKcQ2PzGT
         XSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
        fh=IdD0zsXeomtgE5StI7AV2a7Vq9Ods2YGVjif2B37tSk=;
        b=CUhRXTYm7aSObBRbNZr0LKM7/XWQlur4mtGO7m/5bcDQKQ6yTf/vx5bZv7xtCbPYEU
         aMBW5cte6hagTVH5uJYYtWZpjr7BSAdS4jpoIpuijNj9sYWPVCpD1CzspNTtCUw5gaVK
         gXLSvRPnc0RW27TmWiIqKhw8LaztlL8g+UkhrvjQrwn0ua95Xl/l7NKLWAutpbdCZXxM
         lBhOUdtFWYkfYy4N+hBtkNDb+wiAxDyOP62d/aGiKA15nI+B5gLw9a3Hvx3H82uH+AA4
         6jA9NIJHAoTUqQLx3NhfabYCKiVOJMhsiv4W+brv/Bwgw/bIjtHLrw9PTQDtMUsMPkq7
         xMrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286513; x=1790891313; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
        b=dLTtdb5i+SMLXo4ZKFB+H7LuZrtaYqKHeB0W+S8QPDABJrcRi5TPbsbomibyU4mjCi
         g5mHrlN8uNTHtcMpp93i3PbPA1h7sO8XksEzWvMuiu3jqLlIJ7HhextwG4XCvEBNZek0
         AMLbDzgS4gmNf9RWHDVUR3mZ7uzo68Xg7JUB6ygEBt5sN173X16/pC6tjzIs4QHdRoYU
         d1OcpzSjIIDlYypAQVeFBPelL0qBdOhBshsDmqkZ0SeXdsv2Y/GD5YcIgcyqQiSlD1V3
         MAOsPh3KtPP2cu8eEJESYWzwJCzDqHO40vNlqNDKKfwwga1SfItLXaRbhxXF8WwrUtnl
         XEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286513; x=1790891313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZERshdcV0tFUZGMj08I8XPWDI+kU48UpwOPfgc8PK8=;
        b=jPy2UwrttAP9+ln9uF7dFSGxVQnbAdYRtXQxEt/4EpdRBM5jnWRK9rpVwmcu2iazBg
         gqEXYtsVzawO0Np1SXqVow30vPCHldtR0sCu325igAbNdf2J85cT9yvPnm58uPXF3dA7
         V5o6TScXYYlIjzxSu0olo7rxo2VSjwQ+Ms4uHYMXTlNGyqCUaLMCn6qAE9OSalKgyW/c
         2nPLGYDthE8v58oOXp5NRWsgZNBR5RJ/gBcIOal0+eFTFd9vA8VvvRWHDbklffZE1N9G
         YVz5Azkwtmbd3zNdkuNIesleShJ4mKdlMmGSncucNu84Tq2wZ+8WEWPu+LY2HdnSfDke
         2oHw==
X-Forwarded-Encrypted: i=1; AKwUvBxOgW9lvN3Gj0dlEOvXy34LmPF9D4gFoSe+Is6QPhFwUXZ8xizBcYUCN2bRZeAgMlVvW2J0l/TbgZ2RiQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nqM6e5UYQuVU+Og7laIiK6LFdrmnO1t0j7v7HAfjfqe1n9aEld
	RwapsRDpc0nzCde9hfrcQbCZ/IcEbv3OYWWPfTzFl2IdJzBYwsiqO+rbhDdIlyq7KU9gQ9Bjz12
	fsCW2SYqK13X+DpjzpeS7PconmCtZYKg=
X-Gm-Gg: AYBFou25/DE3vm1hQcd0gMyCtCHqggsyc4lcY/FJogGe5az3eLAMJrBuFD+nqG3BNPS
	R+1Y0KxJuMbz7PRHfHyeGBu9Y8580xb2slOFPPg7/HfTKWkK87BQcrhtJ8RnBjjAU2jgWUOi1aH
	km4wyDn9x0WbXQjIYG+iWAL288RPS31XIJLySv7uu0AuZjdjljPkQwkS36jyHuYXdVrz8d/2VMQ
	deYs80OhhDkbm4q89N8MjuNae9fnj2e2oUO5QKm3S8qRmsb1fGD/wwMOxgvTB5pw67lIYDj/ZW9
	VACGLYaAWJT93SuiC8KzHLdyrPqG4FaiVrXevdrGVawndeQUeoct4glfFX0Dybm88K4blVT901I
	8dl8yUcVXbRvOP30wg5Uuk3Ismt0wouE4/j++rwKji2l2sKCfYsjPpk7NUR7nYVNhi7Nsr5Bwtg
	==
X-Received: by 2002:a05:6a00:1c8e:b0:871:c970:cf37 with SMTP id
 d2e1a72fcca58-87e9b79bdb6mr3208088b3a.24.1790286513363; Thu, 24 Sep 2026
 14:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260914115607.350097-1-imbigking12@gmail.com> <c28917c2-4715-4c70-a2d3-582ca641e1d6@huawei.com>
In-Reply-To: <c28917c2-4715-4c70-a2d3-582ca641e1d6@huawei.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 24 Sep 2026 14:48:21 -0700
X-Gm-Features: AclHuK-NmUD52AXBMVMmQy8Gn29BL7Vr649cjcXJIdr9GevbBkjrs5JhZeSwUK0
Message-ID: <CAADnVQLGWcdi+G-cWkxLCtY-Q3iQ4TJKPcL4i35+c2e_snSUWg@mail.gmail.com>
Subject: Re: [PATCH] riscv: patch: fix handling of bpf-jit execmem addresses
To: Pu Lehui <pulehui@huawei.com>
Cc: Wei-Jie Hung <imbigking12@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, Xiaofeng Yuan <xiaofengmian@163.com>, 
	Klara Modin <klara@kasm.eu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_144834_617557_D0A5239B 
X-CRM114-Status: GOOD (  22.42  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgNjozMuKAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aS5jb20+IHdyb3RlOgo+Cj4KPiBPbiAyMDI2LzkvMTQgMTk6NTYsIFdlaS1KaWUgSHVuZyB3cm90
ZToKPiA+IENvbW1pdCA4NzE4ZTVhMzA5MGIgKCJyaXNjdjogcGF0Y2g6IHNraXAgZml4bWFwIG1h
cHBpbmcgd2hlbiBrZXJuZWwgdGV4dAo+ID4gaXMgYWxyZWFkeSB3cml0YWJsZSIpIGdhdGVkIHRo
ZSBjb3JlX2tlcm5lbF90ZXh0KCkgYnJhbmNoIG9mIHBhdGNoX21hcCgpCj4gPiBvbiBDT05GSUdf
U1RSSUNUX0tFUk5FTF9SV1gsIGFuZCBleHBsaWNpdGx5IGxlZnQgdGhlIHZtYWxsb2MgYnJhbmNo
Cj4gPiB1bmNoYW5nZWQuIFRoYXQgYnJhbmNoIGhhcyBhIHNlcGFyYXRlIHByb2JsZW0uCj4gPgo+
ID4gVGhhdCBicmFuY2ggb25seSBjcmVhdGVzIGEgdGVtcG9yYXJ5IHdyaXRhYmxlIGZpeG1hcCBh
bGlhcyB3aGVuCj4gPiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1ggaXMgZW5hYmxlZCwgYW5kIG90
aGVyd2lzZSBhc3N1bWVzIHRoZSB0YXJnZXQgaXMKPiA+IGRpcmVjdGx5IHdyaXRhYmxlIGFuZCBy
ZXR1cm5zIHRoZSBhZGRyZXNzIHVuY2hhbmdlZC4gVGhhdCBhc3N1bXB0aW9uIG5vCj4gPiBsb25n
ZXIgaG9sZHM6IGJwZl9wcm9nX3BhY2tfYWxsb2MgY2FsbHMgc2V0X21lbW9yeV9yb3goKSBvbiBl
dmVyeSBwYWNrCj4gPiB1bmNvbmRpdGlvbmFsbHkgaW4gYWxsb2NfbmV3X3BhY2soKSwgaW5kZXBl
bmRlbnRseSBvZiBhbnkKPiA+IENPTkZJR19TVFJJQ1RfKl9SV1ggb3B0aW9uLCBzbyBCUEYgdGV4
dCBpbiB0aGUgdm1hbGxvYyBhcmVhIGlzIHJlYWQtb25seQo+ID4gcmVnYXJkbGVzcyBvZiB3aGF0
IENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCBzYXlzLgo+ID4KPiA+IFdpdGggQ09ORklHX1NUUklD
VF9NT0RVTEVfUldYPW4sIHBhdGNoX21hcCgpIHJldHVybnMgdGhlIHJlYWQtb25seQo+ID4gYWRk
cmVzcyBkaXJlY3RseSwgdGhlIHN1YnNlcXVlbnQgY29weV90b19rZXJuZWxfbm9mYXVsdCgpIHRh
a2VzIGEKPiA+IHBhZ2UgZmF1bHQgYW5kIHJldHVybnMgLUVGQVVMVC4gYnBmX2FyY2hfdGV4dF9j
b3B5KCkgdHVybnMgdGhhdCBpbnRvCj4gPiAtRUlOVkFMLCB3aGljaCBwcm9wYWdhdGVzIHRocm91
Z2ggYnBmX2ppdF9iaW5hcnlfcGFja19maW5hbGl6ZSgpIHRvIHRoZQo+ID4gV0FSTl9PTigpIGlu
IGJwZl9pbnRfaml0X2NvbXBpbGUoKSBhbmQgbGVhdmVzIHRoZSBwcm9ncmFtIHVuLUpJVGVkLgo+
ID4KPiA+IE5vdGUgdGhhdCBCUEYgY2Fubm90IGJlIGZpeGVkIHRoZSB3YXkga3Byb2JlcyB3YXMg
aW4KPiA+IGNvbW1pdCBiZGM0NmU1MDdiNTkgKCJyaXNjdjogbW06IG1ha2UgRVhFQ01FTV9LUFJP
QkVTIHdyaXRhYmxlIHdpdGhvdXQKPiA+IENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCIpLiBFWEVD
TUVNX0JQRiBpcyBhbHJlYWR5IFBBR0VfS0VSTkVMLCBpLmUuCj4gPiB3cml0YWJsZSBhdCBhbGxv
Y2F0aW9uIHRpbWU7IHRoZSByZWFkLW9ubHkgbWFwcGluZyBpcyBlc3RhYmxpc2hlZAo+ID4gYWZ0
ZXJ3YXJkcyBieSBnZW5lcmljIGNvZGUgaW4gYWxsb2NfbmV3X3BhY2soKSwgd2hpY2ggYXJjaCBj
b2RlIGNhbm5vdAo+ID4gaW5mbHVlbmNlLiBUaGUgb25seSBwbGFjZSB0aGlzIGNhbiBiZSBoYW5k
bGVkIGlzIHBhdGNoX21hcCgpLgo+ID4KPiA+IFRoaXMgaXMgdGhlIHNhbWUgcHJvYmxlbSB0aGF0
IHdhcyBmaXhlZCBvbiBhcm02NCBieSBjb21taXQgYjE0ODBlZDIzMGFjCj4gPiAoImFybTY0OiBw
YXRjaGluZzogZml4IGhhbmRsaW5nIG9mIGV4ZWNtZW0gYWRkcmVzc2VzIiksIGFuZCB0aGUgZml4
IGlzCj4gPiB0aGUgc2FtZTogQ09ORklHX0VYRUNNRU0gaXMgd2hhdCBhY3R1YWxseSB0cmFja3Mg
d2hldGhlciB0aGUgdm1hbGxvYwo+ID4gYXJlYSBjYW4gaG9sZCBleGVjdXRhYmxlIG1lbW9yeSB0
aGF0IG5lZWRzIGEgdGVtcG9yYXJ5IGFsaWFzIHRvIGJlCj4gPiB3cml0dGVuLiBDT05GSUdfQlBG
X0pJVCwgQ09ORklHX0tQUk9CRVMgYW5kIENPTkZJR19NT0RVTEVTIGFsbCBzZWxlY3QKPiA+IGl0
Lgo+ID4KPiA+IE5vdGUgdGhhdCB0aGlzIGlzIG5vdCBsaW1pdGVkIHRvIENPTkZJR19NT0RVTEVT
PW4uIFVubGlrZSBhcm02NCwgcmlzY3YKPiA+IHNlbGVjdHMgQ09ORklHX0FSQ0hfT1BUSU9OQUxf
S0VSTkVMX1JXWCwgc28gQ09ORklHX1NUUklDVF9NT0RVTEVfUldYIGNhbgo+ID4gYmUgZGlzYWJs
ZWQgd2l0aCBDT05GSUdfTU9EVUxFUz15IGFzIHdlbGwsIGFuZCB0aGUgYnVnIGlzIHJlYWNoYWJs
ZSBpbgo+ID4gdGhhdCBjb25maWd1cmF0aW9uIHRvby4KPiA+Cj4gPiBUaGUgIUNPTkZJR19NTVUg
YnVpbGQgaXMgdW5hZmZlY3RlZDogaXQgaGFzIGl0cyBvd24gX19wYXRjaF9pbnNuX3NldCgpCj4g
PiBhbmQgX19wYXRjaF9pbnNuX3dyaXRlKCkgaW1wbGVtZW50YXRpb25zIGFuZCBuZXZlciBjYWxs
cyBwYXRjaF9tYXAoKS4KPiA+Cj4gPiBGaXhlczogMmM5ZTVkNGEwMDgyICgiYnBmOiByZW1vdmUg
Q09ORklHX0JQRl9KSVQgZGVwZW5kZW5jeSBvbiBDT05GSUdfTU9EVUxFUyBvZiIpCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWktSmllIEh1bmcgPGltYmlna2luZzEyQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gQmFzZWQgb24gcmlzY3YvZml4ZXMgKGI5NGNlYzU3NjFkMikuCgpOb3QgY2xlYXIgd2hhdCB0
cmVlIHRoaXMgcGF0Y2ggc3VwcG9zZSB0byBnbyB0by4KSWYgaXQncyBicGYtbmV4dCB0aGVuIHBs
cyByZXNwaW4gd2l0aCBjb3JyZWN0IHN1YmosCgpwdy1ib3Q6IGNyCgo+Cj4gUmV2aWV3ZWQtYnk6
IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gVGVzdGVkLWJ5OiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPgoKYW5kIGtlZXAgdGFncy4KVGhhbmtzIGV2ZXJ5b25lLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
