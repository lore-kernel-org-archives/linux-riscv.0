Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D546C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbCs6Qb7VCTV7ghvzBtvkW60Jih9E++pVIKpMgpLVqA=; b=XClbCcTKNmSp52
	8bKeDTLuOT3kq80nH23evHM2HOrFLcSadIcLq4+MYAyCWOgyePALVhLydJ/wAjol1VUfO9MtfoOxE
	0cTjO+w189FSZVnSgpYre1nudwu92jxEInfaEz1PsmfhB5Cz3j3dIN81Weke29aVoe3UrPmDXNGM2
	ELrefdSzyuXngC0BQMKEKzhFXwM4L1WeXfv95qmjcFsz+LF0FpFoflDjdR1xbxCoYo/ZgXeVU47JG
	zQr/xvE9ZF0kNxP74jHZMhitUwPsaSoDNk+CwpE1c9ajLvyzPkRnn3VLK4MSsQlsRuQaYG7lzCWUe
	pqh/lGOsDXZSqhbFyL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxjb-00GNbu-2i;
	Mon, 06 Nov 2023 11:25:35 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxjY-00GNaM-18
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 11:25:34 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-67572f4b17cso19172336d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 03:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699269931; x=1699874731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FgFIIfzRIOk5S3UyWAM1hrnYX4eHCPdXXTgA8O3M1A=;
        b=fTiZplA/fsu9c/mYJjs7B+XrjV595HQ6xaXOk5N/8l8MT8M34UqyuyLUXaNaTPuMai
         AhtwgmN/qWDyJKgjI1yqrAmrKSxxXYEyO7kYeSDAQ9/4NT7RIQEGj8UHkEwolTYqbSPP
         csrU6VQw72PRaJMAQgPNvWo1LAUqeYkw7jnATM5n1A+KzsEqMqhRobfM37WZDSzZNmKL
         8k8VoScOhTwgAlHFaFPJTuGGHsFGBX1SO68L1zTldH+A1/0tgo5e1UodFTivpXGV9JLN
         RX8fwMN/6I5upKAup0bIieWGgwhrRULh04XIFV1NSKOY63m5Qx8yk9hc+FQ743wRafi/
         5kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699269931; x=1699874731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FgFIIfzRIOk5S3UyWAM1hrnYX4eHCPdXXTgA8O3M1A=;
        b=Fs1oDLtvRjw6t048rYCa8Pg3Vjn0JrnTjox3QeL7Z5Xe/TGaHKVEjk+uvGO18p1tU9
         0jT+9LVFqMj/MKz4r3veERbSJXn1hghw+xQibAurzlZg7Js7Be+fqbPleVdX6JxiwrBg
         cEGtdj76BMaytGtjr+MvBw/llYOyWnqERTPPCWdAas0B1sZhPsjxuttw7h1CGd/4r0CE
         9WfgTheRvtPY0TDYTWk9IoPYgeKIQjrd2f3WwekLpebwzH8eboYlMpU22Lz64P70xPEj
         ODX8TX+m1zYqvXTo1OnH0iMNhTOZjrABeM7A+yTnMUSy1CTqjiOBVG2wcYfRAb6GDI6m
         z/fA==
X-Gm-Message-State: AOJu0YyQHOWbfmyBJqKb168uCjQahGdccp8jWE0VIQ/NczrqxW4vLpr6
	fead9PlhFgBA0hWCoNEUisCMX0yFu6J9yK61/rwGcw==
X-Google-Smtp-Source: AGHT+IF4yL2/LL4u2aXRMHdIO4tBxiGnD2Sg0p8AaFV/BRnT///c7YsCa6iLfBADu8SZkPGs+0c1ElvE1cEBNyIvvIQ=
X-Received: by 2002:a05:6214:ac9:b0:671:7312:bf5 with SMTP id
 g9-20020a0562140ac900b0067173120bf5mr32557664qvi.17.1699269931062; Mon, 06
 Nov 2023 03:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-26-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:24:54 +0000
Message-ID: <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
Subject: Re: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
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
X-CRM114-CacheID: sfid-20231106_032532_408049_2912892D 
X-CRM114-Status: GOOD (  20.24  )
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
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaXNoYWwgQW5uYXB1cnZlIDx2YW5uYXB1cnZl
QGdvb2dsZS5jb20+Cj4KPiBBZGQgaGVscGVycyB0byBjb252ZXJ0IG1lbW9yeSBiZXR3ZWVuIHBy
aXZhdGUgYW5kIHNoYXJlZCB2aWEgS1ZNJ3MKPiBtZW1vcnkgYXR0cmlidXRlcywgYXMgd2VsbCBh
cyBoZWxwZXJzIHRvIGZyZWUvYWxsb2NhdGUgZ3Vlc3RfbWVtZmQgbWVtb3J5Cj4gdmlhIGZhbGxv
Y2F0ZSgpLiAgVXNlcnNwYWNlLCBpLmUuIHRlc3RzLCBpcyBOT1QgcmVxdWlyZWQgdG8gZG8gZmFs
bG9jYXRlKCkKPiB3aGVuIGNvbnZlcnRpbmcgbWVtb3J5LCBhcyB0aGUgYXR0cmlidXRlcyBhcmUg
dGhlIHNpbmdsZSBzb3VyY2Ugb2YgdHJ1ZS4KCm5pdDogdHJ1ZS0+dHJ1dGgKCj4gUHJvdmlkZSBh
bGxvY2F0ZSgpIGhlbHBlcnMgc28gdGhhdCB0ZXN0cyBjYW4gbWltaWMgYSB1c2Vyc3BhY2UgdGhh
dCBmcmVlcwo+IHByaXZhdGUgbWVtb3J5IG9uIGNvbnZlcnNpb24sIGUuZy4gdG8gcHJpb3JpdGl6
ZSBtZW1vcnkgdXNhZ2Ugb3Zlcgo+IHBlcmZvcm1hbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmlz
aGFsIEFubmFwdXJ2ZSA8dmFubmFwdXJ2ZUBnb29nbGUuY29tPgo+IENvLWRldmVsb3BlZC1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gTWVzc2FnZS1JZDogPDIw
MjMxMDI3MTgyMjE3LjM2MTUyMTEtMjgtc2VhbmpjQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiAtLS0KPiAgLi4uL3NlbGZ0
ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmggICAgIHwgNDggKysrKysrKysrKysrKysr
KysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2t2bV91dGlsLmMgICAgfCAy
OCArKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9i
YXNlLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNl
LmgKPiBpbmRleCA5Zjg2MTE4MmMwMmEuLjE0NDFmY2E2YzI3MyAxMDA2NDQKPiAtLS0gYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmgKPiArKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmgKPiBAQCAt
MzMzLDYgKzMzMyw1NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdm1fZW5hYmxlX2NhcChzdHJ1Y3Qg
a3ZtX3ZtICp2bSwgdWludDMyX3QgY2FwLCB1aW50NjRfdCBhcmcwKQo+ICAgICAgICAgdm1faW9j
dGwodm0sIEtWTV9FTkFCTEVfQ0FQLCAmZW5hYmxlX2NhcCk7Cj4gIH0KPgo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgdm1fc2V0X21lbW9yeV9hdHRyaWJ1dGVzKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50
NjRfdCBncGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50NjRfdCBzaXplLCB1aW50NjRfdCBhdHRyaWJ1dGVzKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
a3ZtX21lbW9yeV9hdHRyaWJ1dGVzIGF0dHIgPSB7Cj4gKyAgICAgICAgICAgICAgIC5hdHRyaWJ1
dGVzID0gYXR0cmlidXRlcywKPiArICAgICAgICAgICAgICAgLmFkZHJlc3MgPSBncGEsCj4gKyAg
ICAgICAgICAgICAgIC5zaXplID0gc2l6ZSwKPiArICAgICAgICAgICAgICAgLmZsYWdzID0gMCwK
PiArICAgICAgIH07Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEtWTV9TRVRfTUVNT1JZ
X0FUVFJJQlVURVMgb3ZlcndyaXRlcyBfYWxsXyBhdHRyaWJ1dGVzLiAgVGhlc2UgZmxvd3MKPiAr
ICAgICAgICAqIG5lZWQgc2lnbmlmaWNhbnQgZW5oYW5jZW1lbnRzIHRvIHN1cHBvcnQgbXVsdGlw
bGUgYXR0cmlidXRlcy4KPiArICAgICAgICAqLwo+ICsgICAgICAgVEVTVF9BU1NFUlQoIWF0dHJp
YnV0ZXMgfHwgYXR0cmlidXRlcyA9PSBLVk1fTUVNT1JZX0FUVFJJQlVURV9QUklWQVRFLAo+ICsg
ICAgICAgICAgICAgICAgICAgIlVwZGF0ZSBtZSB0byBzdXBwb3J0IG11bHRpcGxlIGF0dHJpYnV0
ZXMhIik7Cj4gKwo+ICsgICAgICAgdm1faW9jdGwodm0sIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVU
RVMsICZhdHRyKTsKPiArfQo+ICsKPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB2bV9tZW1fc2V0
X3ByaXZhdGUoc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90IGdwYSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpemUpCj4gK3sKPiArICAgICAgIHZt
X3NldF9tZW1vcnlfYXR0cmlidXRlcyh2bSwgZ3BhLCBzaXplLCBLVk1fTUVNT1JZX0FUVFJJQlVU
RV9QUklWQVRFKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHZtX21lbV9zZXRfc2hh
cmVkKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50NjRfdCBncGEsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpemUpCj4gK3sKPiArICAgICAgIHZtX3NldF9t
ZW1vcnlfYXR0cmlidXRlcyh2bSwgZ3BhLCBzaXplLCAwKTsKPiArfQo+ICsKPiArdm9pZCB2bV9n
dWVzdF9tZW1fZmFsbG9jYXRlKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50NjRfdCBncGEsIHVpbnQ2
NF90IHNpemUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHVuY2hfaG9sZSk7
Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdm1fZ3Vlc3RfbWVtX3B1bmNoX2hvbGUoc3RydWN0
IGt2bV92bSAqdm0sIHVpbnQ2NF90IGdwYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDY0X3Qgc2l6ZSkKPiArewo+ICsgICAgICAgdm1fZ3Vlc3RfbWVt
X2ZhbGxvY2F0ZSh2bSwgZ3BhLCBzaXplLCB0cnVlKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGlu
ZSB2b2lkIHZtX2d1ZXN0X21lbV9hbGxvY2F0ZShzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0X3Qg
Z3BhLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3Qg
c2l6ZSkKPiArewo+ICsgICAgICAgdm1fZ3Vlc3RfbWVtX2ZhbGxvY2F0ZSh2bSwgZ3BhLCBzaXpl
LCBmYWxzZSk7Cj4gK30KPiArCj4gIHZvaWQgdm1fZW5hYmxlX2RpcnR5X3Jpbmcoc3RydWN0IGt2
bV92bSAqdm0sIHVpbnQzMl90IHJpbmdfc2l6ZSk7Cj4gIGNvbnN0IGNoYXIgKnZtX2d1ZXN0X21v
ZGVfc3RyaW5nKHVpbnQzMl90IGkpOwo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9s
aWIva3ZtX3V0aWwuYwo+IGluZGV4IGI2MzUwMGZjYTYyNy4uOTVhNTUzNDAwZWE5IDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYwo+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYwo+IEBAIC0xMTY3LDYg
KzExNjcsMzQgQEAgdm9pZCB2bV9tZW1fcmVnaW9uX2RlbGV0ZShzdHJ1Y3Qga3ZtX3ZtICp2bSwg
dWludDMyX3Qgc2xvdCkKPiAgICAgICAgIF9fdm1fbWVtX3JlZ2lvbl9kZWxldGUodm0sIG1lbXNs
b3QycmVnaW9uKHZtLCBzbG90KSwgdHJ1ZSk7Cj4gIH0KPgo+ICt2b2lkIHZtX2d1ZXN0X21lbV9m
YWxsb2NhdGUoc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90IGJhc2UsIHVpbnQ2NF90IHNpemUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHVuY2hfaG9sZSkKPiArewo+ICsg
ICAgICAgY29uc3QgaW50IG1vZGUgPSBGQUxMT0NfRkxfS0VFUF9TSVpFIHwgKHB1bmNoX2hvbGUg
PyBGQUxMT0NfRkxfUFVOQ0hfSE9MRSA6IDApOwo+ICsgICAgICAgc3RydWN0IHVzZXJzcGFjZV9t
ZW1fcmVnaW9uICpyZWdpb247Cj4gKyAgICAgICB1aW50NjRfdCBlbmQgPSBiYXNlICsgc2l6ZTsK
PiArICAgICAgIHVpbnQ2NF90IGdwYSwgbGVuOwo+ICsgICAgICAgb2ZmX3QgZmRfb2Zmc2V0Owo+
ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBmb3IgKGdwYSA9IGJhc2U7IGdwYSA8IGVu
ZDsgZ3BhICs9IGxlbikgewo+ICsgICAgICAgICAgICAgICB1aW50NjRfdCBvZmZzZXQ7Cj4gKwo+
ICsgICAgICAgICAgICAgICByZWdpb24gPSB1c2Vyc3BhY2VfbWVtX3JlZ2lvbl9maW5kKHZtLCBn
cGEsIGdwYSk7Cj4gKyAgICAgICAgICAgICAgIFRFU1RfQVNTRVJUKHJlZ2lvbiAmJiByZWdpb24t
PnJlZ2lvbi5mbGFncyAmIEtWTV9NRU1fR1VFU1RfTUVNRkQsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJQcml2YXRlIG1lbW9yeSByZWdpb24gbm90IGZvdW5kIGZvciBHUEEgMHglbHgi
LCBncGEpOwo+ICsKPiArICAgICAgICAgICAgICAgb2Zmc2V0ID0gKGdwYSAtIHJlZ2lvbi0+cmVn
aW9uLmd1ZXN0X3BoeXNfYWRkcik7CgpuaXQ6IHdoeSB0aGUgcGFyZW50aGVzZXM/Cgo+ICsgICAg
ICAgICAgICAgICBmZF9vZmZzZXQgPSByZWdpb24tPnJlZ2lvbi5ndWVzdF9tZW1mZF9vZmZzZXQg
KyBvZmZzZXQ7Cj4gKyAgICAgICAgICAgICAgIGxlbiA9IG1pbl90KHVpbnQ2NF90LCBlbmQgLSBn
cGEsIHJlZ2lvbi0+cmVnaW9uLm1lbW9yeV9zaXplIC0gb2Zmc2V0KTsKPiArCj4gKyAgICAgICAg
ICAgICAgIHJldCA9IGZhbGxvY2F0ZShyZWdpb24tPnJlZ2lvbi5ndWVzdF9tZW1mZCwgbW9kZSwg
ZmRfb2Zmc2V0LCBsZW4pOwo+ICsgICAgICAgICAgICAgICBURVNUX0FTU0VSVCghcmV0LCAiZmFs
bG9jYXRlKCkgZmFpbGVkIHRvICVzIGF0ICVseCAobGVuID0gJWx1KSwgZmQgPSAlZCwgbW9kZSA9
ICV4LCBvZmZzZXQgPSAlbHhcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHB1bmNo
X2hvbGUgPyAicHVuY2ggaG9sZSIgOiAiYWxsb2NhdGUiLCBncGEsIGxlbiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnaW9uLT5yZWdpb24uZ3Vlc3RfbWVtZmQsIG1vZGUsIGZkX29m
ZnNldCk7Cj4gKyAgICAgICB9Cj4gK30KPiArCj4gIC8qIFJldHVybnMgdGhlIHNpemUgb2YgYSB2
Q1BVJ3Mga3ZtX3J1biBzdHJ1Y3R1cmUuICovCj4gIHN0YXRpYyBpbnQgdmNwdV9tbWFwX3N6KHZv
aWQpCj4gIHsKCk5pdHMgYXNpZGU6CgpSZXZpZXdlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29v
Z2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29tPgoKQ2hlZXJz
LAovZnVhZAoKPiAtLQo+IDIuMzkuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
