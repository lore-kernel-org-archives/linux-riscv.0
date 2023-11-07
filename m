Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8891C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XHErt4jSAbCl0w025tJS0VoSDor73OzE5tds9tisG0=; b=ezHuZ3LBWvXCnk
	CNC7VvGKeRxGDTLVnYdok+fAYqWkGhbLm+amMd+OX3sAsHdVqkHGP1egZNB+eGyd/S/9Dgexehnml
	8HmjgLtyUH4rLYHQtfpXiF5q8LhyxHdf+h3J3Ya3Uy67n+orCkB/qf4MiVKPQHeoq+hskw//YoofF
	AL8+pgPdmc655bgajgiTpcL1LtYl/EE1uSJOg43mOkNoR9HiNVR9NXKarftWSmb+/AaG9RCcqzVHy
	86cfiQjIayWokMvK37pFyjRw16HTES6/j46Szs+nvtSjwXYfs64piVrNtz07rbSjw1CLguRkqeWqz
	E9V41QAVSrg28JuTZwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Lbd-001YJ5-18;
	Tue, 07 Nov 2023 12:54:57 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Lba-001YGy-2N
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 12:54:56 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-67131800219so38590406d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 04:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699361687; x=1699966487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuFbqjfsVCp34XchBGKV0CWjcihho4T2q4FA5kjS7eU=;
        b=DUPB+PqdxTx5wlBzU3F6aYrbQchH+ZEia2NaDKLQV63WHwzxwXrqVS53bneTshy2GW
         qIpNiUgNYB1NDN9ukD1m1bIchzWh9e5djXxJ7uLCbZOcpgDQT2FN/HDbsneBISb7gHXm
         UIuKlkwTDIq4oz/KZ+aQ+w7j58u8hPY4ZKZ8HqJjiVGviAkc3TgFKHj6Ycu1QZhWvLpj
         4d4dnYeSE83udoZuSoUaQq3MBSiRR+sKWtIJS9GOZ0r7XtAuSXnmLNyB/210P0gs1otV
         XA6KklDNnIHEo2YEgsmgf9w59z99lyfFGmH+lDtwZIUELOU86WXaW/y3DtTTBbZdPMOM
         n7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699361687; x=1699966487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuFbqjfsVCp34XchBGKV0CWjcihho4T2q4FA5kjS7eU=;
        b=bLqGBxarUSHLCQnA/ceqGMxgAuNGGR7exErsTUFPNe3R7+QZC1xozg8oMn0H8cjrRo
         ktwe+bm1Q534uQVsZuiQkXBLzanKaHOOgxB8PEaXtvOuYjK75CywekkYrYmUW90goaWu
         9krfXc3OTF+4sHKnd/BirUeDcc8OexcRIHAR/jgLzdl5TVoTiW29EH5WB2IyssRZIOs0
         mul1uvJ1w4sFREDlCixMOoOmCvGNwQ7BjGb+Dt22khUbitbarKYCbrmOivuIzQjnLpW4
         5uCVehLlG+7QjlIfPnUF/UxUGxhOB9epLNYf4iDdI4/CCZ0UlcNjMlas3M0Zv1lmSTjP
         1WYg==
X-Gm-Message-State: AOJu0YyvW3vRX1rBLCrOwRVPLSyzGEDRULhT1/kyW1TkKRswEMofUGI7
	49JRVNf5+p8eNdurg58cDNL+lmmqUbD1Bm8G6GJ8ig==
X-Google-Smtp-Source: AGHT+IHS9JUkEkC/BybEMf4UmdGXo/DmXLNK4bOT/jrKIAqRMkLyM4gXD6uMK1OzLS09666PL8dXekXtndn5vIwFZqQ=
X-Received: by 2002:a05:6214:260c:b0:66f:bb36:9a51 with SMTP id
 gu12-20020a056214260c00b0066fbb369a51mr33614248qvb.36.1699361687221; Tue, 07
 Nov 2023 04:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-31-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-31-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 7 Nov 2023 12:54:10 +0000
Message-ID: <CA+EHjTyZoLLv1nRfCEY4nHrbHadphn37jw3OPS17x1dAm_YUxA@mail.gmail.com>
Subject: Re: [PATCH 30/34] KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_045454_778330_AA089351 
X-CRM114-Status: GOOD (  16.08  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCA0OjM04oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDaGFvIFBlbmcgPGNoYW8ucC5wZW5nQGxpbnV4
LmludGVsLmNvbT4KPgo+IEFkZCBoZWxwZXJzIHRvIGludm9rZSBLVk1fU0VUX1VTRVJfTUVNT1JZ
X1JFR0lPTjIgZGlyZWN0bHkgc28gdGhhdCB0ZXN0cwo+IGNhbiB2YWxpZGF0ZSBvZiBmZWF0dXJl
cyB0aGF0IGFyZSB1bmlxdWUgdG8gInZlcnNpb24gMiIgb2YgInNldCB1c2VyCj4gbWVtb3J5IHJl
Z2lvbiIsIGUuZy4gZG8gbmVnYXRpdmUgdGVzdGluZyBvbiBnbWVtX2ZkIGFuZCBnbWVtX29mZnNl
dC4KPgo+IFByb3ZpZGUgYSByYXcgdmVyc2lvbiBhcyB3ZWxsIGFzIGFuIGFzc2VydC1zdWNjZXNz
IHZlcnNpb24gdG8gcmVkdWNlCj4gdGhlIGFtb3VudCBvZiBib2lsZXJwbGF0ZSBjb2RlIG5lZWQg
Zm9yIGJhc2ljIHVzYWdlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBQZW5nIDxjaGFvLnAucGVu
Z0BsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWNrZXJsZXkgVG5nIDxhY2tlcmxl
eXRuZ0Bnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPgo+IE1lc3NhZ2UtSWQ6IDwyMDIzMTAyNzE4MjIxNy4zNjE1MjExLTMz
LXNlYW5qY0Bnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256
aW5pQHJlZGhhdC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29v
Z2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29tPgoKQ2hlZXJz
LAovZnVhZAoKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmggICAg
IHwgIDcgKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9rdm1fdXRpbC5j
ICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5j
bHVkZS9rdm1fdXRpbF9iYXNlLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVk
ZS9rdm1fdXRpbF9iYXNlLmgKPiBpbmRleCAxNTc1MDhjMDcxZjMuLjhlYzEyMmY1ZmNjOCAxMDA2
NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9i
YXNlLmgKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRp
bF9iYXNlLmgKPiBAQCAtNTIyLDYgKzUyMiwxMyBAQCB2b2lkIHZtX3NldF91c2VyX21lbW9yeV9y
ZWdpb24oc3RydWN0IGt2bV92bSAqdm0sIHVpbnQzMl90IHNsb3QsIHVpbnQzMl90IGZsYWdzLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBncGEsIHVpbnQ2NF90IHNp
emUsIHZvaWQgKmh2YSk7Cj4gIGludCBfX3ZtX3NldF91c2VyX21lbW9yeV9yZWdpb24oc3RydWN0
IGt2bV92bSAqdm0sIHVpbnQzMl90IHNsb3QsIHVpbnQzMl90IGZsYWdzLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgZ3BhLCB1aW50NjRfdCBzaXplLCB2b2lkICpo
dmEpOwo+ICt2b2lkIHZtX3NldF91c2VyX21lbW9yeV9yZWdpb24yKHN0cnVjdCBrdm1fdm0gKnZt
LCB1aW50MzJfdCBzbG90LCB1aW50MzJfdCBmbGFncywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ2NF90IGdwYSwgdWludDY0X3Qgc2l6ZSwgdm9pZCAqaHZhLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZ3Vlc3RfbWVtZmQsIHVpbnQ2NF90
IGd1ZXN0X21lbWZkX29mZnNldCk7Cj4gK2ludCBfX3ZtX3NldF91c2VyX21lbW9yeV9yZWdpb24y
KHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50MzJfdCBzbG90LCB1aW50MzJfdCBmbGFncywKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBncGEsIHVpbnQ2NF90IHNpemUs
IHZvaWQgKmh2YSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBn
dWVzdF9tZW1mZCwgdWludDY0X3QgZ3Vlc3RfbWVtZmRfb2Zmc2V0KTsKPiArCj4gIHZvaWQgdm1f
dXNlcnNwYWNlX21lbV9yZWdpb25fYWRkKHN0cnVjdCBrdm1fdm0gKnZtLAo+ICAgICAgICAgZW51
bSB2bV9tZW1fYmFja2luZ19zcmNfdHlwZSBzcmNfdHlwZSwKPiAgICAgICAgIHVpbnQ2NF90IGd1
ZXN0X3BhZGRyLCB1aW50MzJfdCBzbG90LCB1aW50NjRfdCBucGFnZXMsCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYwo+IGluZGV4IDFjNzQzMTBmMWQ0NC4uZDA1
ZDk1Y2MzNjkzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIv
a3ZtX3V0aWwuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0
aWwuYwo+IEBAIC04NzMsNiArODczLDM1IEBAIHZvaWQgdm1fc2V0X3VzZXJfbWVtb3J5X3JlZ2lv
bihzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDMyX3Qgc2xvdCwgdWludDMyX3QgZmxhZ3MsCj4gICAg
ICAgICAgICAgICAgICAgICBlcnJubywgc3RyZXJyb3IoZXJybm8pKTsKPiAgfQo+Cj4gK2ludCBf
X3ZtX3NldF91c2VyX21lbW9yeV9yZWdpb24yKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50MzJfdCBz
bG90LCB1aW50MzJfdCBmbGFncywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50NjRfdCBncGEsIHVpbnQ2NF90IHNpemUsIHZvaWQgKmh2YSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBndWVzdF9tZW1mZCwgdWludDY0X3QgZ3Vlc3RfbWVt
ZmRfb2Zmc2V0KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qga3ZtX3VzZXJzcGFjZV9tZW1vcnlfcmVn
aW9uMiByZWdpb24gPSB7Cj4gKyAgICAgICAgICAgICAgIC5zbG90ID0gc2xvdCwKPiArICAgICAg
ICAgICAgICAgLmZsYWdzID0gZmxhZ3MsCj4gKyAgICAgICAgICAgICAgIC5ndWVzdF9waHlzX2Fk
ZHIgPSBncGEsCj4gKyAgICAgICAgICAgICAgIC5tZW1vcnlfc2l6ZSA9IHNpemUsCj4gKyAgICAg
ICAgICAgICAgIC51c2Vyc3BhY2VfYWRkciA9ICh1aW50cHRyX3QpaHZhLAo+ICsgICAgICAgICAg
ICAgICAuZ3Vlc3RfbWVtZmQgPSBndWVzdF9tZW1mZCwKPiArICAgICAgICAgICAgICAgLmd1ZXN0
X21lbWZkX29mZnNldCA9IGd1ZXN0X21lbWZkX29mZnNldCwKPiArICAgICAgIH07Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIGlvY3RsKHZtLT5mZCwgS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04yLCAm
cmVnaW9uKTsKPiArfQo+ICsKPiArdm9pZCB2bV9zZXRfdXNlcl9tZW1vcnlfcmVnaW9uMihzdHJ1
Y3Qga3ZtX3ZtICp2bSwgdWludDMyX3Qgc2xvdCwgdWludDMyX3QgZmxhZ3MsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBncGEsIHVpbnQ2NF90IHNpemUsIHZvaWQg
Kmh2YSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGd1ZXN0X21l
bWZkLCB1aW50NjRfdCBndWVzdF9tZW1mZF9vZmZzZXQpCj4gK3sKPiArICAgICAgIGludCByZXQg
PSBfX3ZtX3NldF91c2VyX21lbW9yeV9yZWdpb24yKHZtLCBzbG90LCBmbGFncywgZ3BhLCBzaXpl
LCBodmEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
dWVzdF9tZW1mZCwgZ3Vlc3RfbWVtZmRfb2Zmc2V0KTsKPiArCj4gKyAgICAgICBURVNUX0FTU0VS
VCghcmV0LCAiS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04yIGZhaWxlZCwgZXJybm8gPSAlZCAo
JXMpIiwKPiArICAgICAgICAgICAgICAgICAgIGVycm5vLCBzdHJlcnJvcihlcnJubykpOwo+ICt9
Cj4gKwo+ICsKPiAgLyogRklYTUU6IFRoaXMgdGhpbmcgbmVlZHMgdG8gYmUgcmlwcGVkIGFwYXJ0
IGFuZCByZXdyaXR0ZW4uICovCj4gIHZvaWQgdm1fbWVtX2FkZChzdHJ1Y3Qga3ZtX3ZtICp2bSwg
ZW51bSB2bV9tZW1fYmFja2luZ19zcmNfdHlwZSBzcmNfdHlwZSwKPiAgICAgICAgICAgICAgICAg
dWludDY0X3QgZ3Vlc3RfcGFkZHIsIHVpbnQzMl90IHNsb3QsIHVpbnQ2NF90IG5wYWdlcywKPiAt
LQo+IDIuMzkuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
