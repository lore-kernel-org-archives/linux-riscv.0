Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC65FD10F22
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xg/jbD2P4/Wfs/PjIIXiWbtMKmKmPP+N7XmXgkMQItY=; b=ThxLHjF/rWWuDO
	8mjh51JkGBrcUuZp+2kSqTiYkzVnXzVxzYqg+dDvnuNiUKZefEAICWCfO7SQXbQv/FSXKuQH7/Ysp
	YtkTdyWQAMkRU/vyWgXoggtZQzQzuFAAPth3jHg5Hwp/zfkRt44c8t+8lpdA8F1LSxM4RmETiBx71
	nZHWQl7CUA3i5YUpbJz0Hxz34MAhO/4cVUZ9iEHgK7oOTb8oSMK6yr9/9u9XQv1vCMPA0tYY3zh9g
	ABRhQjyMqvC2862J/5G+ZNKiXe6Om0PjuEmt0wNbYPoY+i289SnecMThrDh3NVHYfFJoI0HtGQLNx
	5yey1eLdFJ59u0VYcz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODNu-0000000Esrs-1s2N;
	Wed, 26 Nov 2025 11:08:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODNs-0000000EsrA-2Pnm
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 11:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6367A44065;
	Wed, 26 Nov 2025 11:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EC6C113D0;
	Wed, 26 Nov 2025 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764155307;
	bh=CVdLyC6tIhbwP1dKRBost2ptghGpeg2cmZtZEA7xGm4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hQ29ELhin85lmtvEwxBL5KVjagO/88PonpwLzCU/2cvS4LT7AwcX9kgLwKmrPTrXx
	 GbO0IREIBGaoFUzm0IEhgiVy8pr8NL9vFTrxgsJgiNbjEP5BjdHMXljA0on33JsIgg
	 XMx2thnXWaGpKPCRCxotTZj7lPQiNP/Y0xWBT3jwEU7dGUsT2H0UFjkH9U051ciIOm
	 /CIKtWvjcs7CwMqWvV10Fn137Dwhjq0TORYIPvr8DInchqk05RqXijp8hodqJpXBwm
	 /lgMxLV86WSjPxgA69A2wa3aPUCLE2mSw/0Ghi4d8PJ+lN1uWDBeOHUdGgBUlq2p6W
	 tMjBR24MVFG+A==
Message-ID: <0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org>
Date: Wed, 26 Nov 2025 12:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-7-samuel.holland@sifive.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <20251113014656.2605447-7-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_030828_682928_C4B5D976 
X-CRM114-Status: GOOD (  16.50  )
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

CgpMZSAxMy8xMS8yMDI1IMOgIDAyOjQ1LCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdMKgOgo+IFNv
bWUgcGxhdGZvcm1zIG5lZWQgdG8gZml4IHVwIHRoZSB2YWx1ZXMgd2hlbiByZWFkaW5nIG9yIHdy
aXRpbmcgcGFnZQo+IHRhYmxlcy4gQmVjYXVzZSBvZiB0aGlzLCB0aGUgYWNjZXNzb3JzIG11c3Qg
YWx3YXlzIGJlIHVzZWQ7IGl0IGlzIG5vdAo+IHZhbGlkIHRvIHNpbXBseSBkZXJlZmVyZW5jZSBh
IHBYWF90IHBvaW50ZXIuCj4gCj4gRml4IGFsbCBvZiB0aGUgaW5zdGFuY2VzIG9mIHRoaXMgcGF0
dGVybiBpbiBnZW5lcmljIGNvZGUsIG1vc3RseSBieQo+IGFwcGx5aW5nIHRoZSBiZWxvdyBjb2Nj
aW5lbGxlIHNlbWFudGljIHBhdGNoLCByZXBlYXRlZCBmb3IgZWFjaCBwYWdlCj4gdGFibGUgbGV2
ZWwuIFNvbWUgYWRkaXRpb25hbCBmaXhlcyB3ZXJlIGFwcGxpZWQgbWFudWFsbHksIG1vc3RseSB0
bwo+IG1hY3JvcyB3aGVyZSB0eXBlIGluZm9ybWF0aW9uIGlzIHVuYXZhaWxhYmxlLgo+IAo+IElu
IGEgZmV3IHBsYWNlcywgYSBgcHRlX3QgKmAgb3IgYHBtZF90ICpgIGlzIGFjdHVhbGx5IGEgcG9p
bnRlciB0byBhIFBURQo+IG9yIFBNREUgdmFsdWUgc3RvcmVkIG9uIHRoZSBzdGFjaywgbm90IGEg
cG9pbnRlciB0byBhIHBhZ2UgdGFibGUuIEluCj4gdGhvc2UgY2FzZXMsIGl0IGlzIG5vdCBhcHBy
b3ByaWF0ZSB0byB1c2UgdGhlIGFjY2Vzc29ycywgYmVjYXVzZSB0aGUKPiB2YWx1ZSBpcyBub3Qg
Z2xvYmFsbHkgdmlzaWJsZSwgYW5kIGFueSB0cmFuc2Zvcm1hdGlvbiBmcm9tIHBYWHBfZ2V0KCkK
PiBoYXMgYWxyZWFkeSBiZWVuIGFwcGxpZWQuIFRob3NlIHBsYWNlcyBhcmUgbWFya2VkIGJ5IG5h
bWluZyB0aGUgcG9pbnRlcgo+IGBwdGVudHBgIG9yIGBwbWR2YWxwYCwgYXMgb3Bwb3NlZCB0byBg
cHRlcGAgb3IgYHBtZHBgLgo+IAouLi4KCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4gVGhpcyBjb21taXQgY292ZXJz
IHNvbWUgb2YgdGhlIHNhbWUgY2hhbmdlcyBhcyBhbiBleGlzdGluZyBzZXJpZXMgZnJvbQo+IEFu
c2h1bWFuIEtoYW5kdWFsWzFdLiBVbmxpa2UgdGhhdCBzZXJpZXMsIHRoaXMgY29tbWl0IGlzIGEg
cHVyZWx5Cj4gbWVjaGFuaWNhbCBjb252ZXJzaW9uIHRvIGRlbW9uc3RyYXRlIHRoZSBSSVNDLVYg
Y2hhbmdlcywgc28gaXQgZG9lcyBub3QKPiBpbnNlcnQgbG9jYWwgdmFyaWFibGVzIHRvIGF2b2lk
IHJlZHVuZGFudCBjYWxscyB0byB0aGUgYWNjZXNzb3JzLiBBCj4gbWFudWFsIGNvbnZlcnNpb24g
bGlrZSBpbiB0aGF0IHNlcmllcyBjb3VsZCBpbXByb3ZlIHBlcmZvcm1hbmNlLgoKQW5kIHRoaXMg
Y29tbWl0IGhhcyB0aGUgc2FtZSBwcm9ibGVtIGFzIHRoZSBzZXJpZXMgZnJvbSBBbnNodW1hbiwg
c2VlIFsyXToKCkJlZm9yZSB0aGUgcGF0Y2gsIGFzIGFuIGV4ZW1wbGUgb24gcG93ZXJwYy8zMiBt
bV9maW5kX3BtZCgpIHdhczoKCjAwMDAxODYwIDxtbV9maW5kX3BtZD46CiAgICAgMTg2MDogICAg
ICAgODAgNjMgMDAgMTggICAgIGx3eiAgICAgcjMsMjQocjMpCiAgICAgMTg2NDogICAgICAgNTQg
ODQgNjUgM2EgICAgIHJsd2lubSAgcjQscjQsMTIsMjAsMjkKICAgICAxODY4OiAgICAgICA3YyA2
MyAyMiAxNCAgICAgYWRkICAgICByMyxyMyxyNAogICAgIDE4NmM6ICAgICAgIDRlIDgwIDAwIDIw
ICAgICBibHIKCk5vdyBpdCBpczoKCjAwMDAxODYwIDxtbV9maW5kX3BtZD46CiAgICAgMTg2MDog
ICAgICAgODEgMjMgMDAgMTggICAgIGx3eiAgICAgcjksMjQocjMpCiAgICAgMTg2NDogICAgICAg
NTQgODQgNjUgM2EgICAgIHJsd2lubSAgcjQscjQsMTIsMjAsMjkKICAgICAxODY4OiAgICAgICA3
ZCA0OSAyMCAyZSAgICAgbHd6eCAgICByMTAscjkscjQgIDw9PSBQb2ludGxlc3MgcmVhZAogICAg
IDE4NmM6ICAgICAgIDdjIDY5IDIyIDE0ICAgICBhZGQgICAgIHIzLHI5LHI0CiAgICAgMTg3MDog
ICAgICAgN2QgNDkgMjAgMmUgICAgIGx3enggICAgcjEwLHI5LHI0ICA8PT0gUG9pbnRsZXNzIHJl
YWQKICAgICAxODc0OiAgICAgICA3ZCAyOSAyMCAyZSAgICAgbHd6eCAgICByOSxyOSxyNCAgIDw9
PSBQb2ludGxlc3MgcmVhZAogICAgIDE4Nzg6ICAgICAgIDRlIDgwIDAwIDIwICAgICBibHIKClRv
IGF2b2lkIGl0IHlvdSBuZWVkIHNvbWV0aGluZyBsaWtlOgoKZGlmZiAtLWdpdCBhL21tL3JtYXAu
YyBiL21tL3JtYXAuYwppbmRleCBhYWZlZmMxZDc5NTUuLjBjNjExNTNmNGVhOSAxMDA2NDQKLS0t
IGEvbW0vcm1hcC5jCisrKyBiL21tL3JtYXAuYwpAQCAtODE5LDE1ICs4MTksMTUgQEAgcG1kX3Qg
Km1tX2ZpbmRfcG1kKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCAKbG9uZyBhZGRyZXNz
KQogIAlwbWRfdCAqcG1kID0gTlVMTDsKCiAgCXBnZCA9IHBnZF9vZmZzZXQobW0sIGFkZHJlc3Mp
OwotCWlmICghcGdkX3ByZXNlbnQocGdkcF9nZXQocGdkKSkpCisJaWYgKCFtbV9wNGRfZm9sZGVk
KG1tKSAmJiAhcGdkX3ByZXNlbnQocGdkcF9nZXQocGdkKSkpCiAgCQlnb3RvIG91dDsKCiAgCXA0
ZCA9IHA0ZF9vZmZzZXQocGdkLCBhZGRyZXNzKTsKLQlpZiAoIXA0ZF9wcmVzZW50KHA0ZHBfZ2V0
KHA0ZCkpKQorCWlmICghbW1fcHVkX2ZvbGRlZChtbSkgJiYgIXA0ZF9wcmVzZW50KHA0ZHBfZ2V0
KHA0ZCkpKQogIAkJZ290byBvdXQ7CgogIAlwdWQgPSBwdWRfb2Zmc2V0KHA0ZCwgYWRkcmVzcyk7
Ci0JaWYgKCFwdWRfcHJlc2VudChwdWRwX2dldChwdWQpKSkKKwlpZiAoIW1tX3BtZF9mb2xkZWQo
bW0pICYmICFwdWRfcHJlc2VudChwdWRwX2dldChwdWQpKSkKICAJCWdvdG8gb3V0OwoKICAJcG1k
ID0gcG1kX29mZnNldChwdWQsIGFkZHJlc3MpOwoKClsyXSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbW0vZjQwZWE4YmYtMDg2Mi00MWE3LWFmMTktNzBiZmJkODM4NTY4QGNzZ3JvdXAu
ZXUvCgo+IAo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vMjAyNDA5MTcw
NzMxMTcuMTUzMTIwNy0xLWFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20vCj4gCgpDaHJpc3RvcGhl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
