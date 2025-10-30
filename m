Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A847CCF9EE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 01:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7tzqpJEiqhjSSYBr/ptUF317EDRZExIyqLb9LClDyQ=; b=uO+HBmdekzOMFH
	NMqSTyJiOmV6M9kMNz1whrh/50oe5FYvSTtLwI8960plik99U7UZ10TFfOkHVuQl6UYVvHAL+mLZm
	y+K3AotCI2FPTFuPx+C7lzUcOiGndm4AdjquGUeIM6KyDlIAjJC3Buc2s8X925U0WstEuYBtupdwc
	SDqopBKgclMbv791MEjjq4AVY+CPda84rtx5o5zaVtXPwQdkhN9t7ps0+GO02fRPZx9aKrDwknZKR
	RnOrQcvjKl/TWb5/0U6l14WOiCsOsTYP0g7Xu+lIenOHTWUXeR8t4KQf1AGj82k5DSDDGSIsjF6+O
	Jmqkp/GM54EUvD4Mkn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEH8m-00000003Jtf-15MV;
	Thu, 30 Oct 2025 01:07:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEH8k-00000003JtH-2Xy5
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 01:07:47 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ecfafb92bcso93751cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 18:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761786465; x=1762391265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Id3gb4VM70r8JjlpIpMntwH9hB/tw0n4UthxF1ao5+Q=;
        b=4p8LyYmbTwxLYz3zjsfH3S9X2Nkqnw8ksGkVs+kLuIFFSLiLDMbL8zCdjU06clcG8w
         Fl59ODbD4KtS1ZNHrGwbldUUmzCs/Uf3YXTV4FHVOU5xEr8EBxmdprF5hHa6e+JHTV1Z
         DULpswJ0hv6rS6FrAw0sP4uqtRRO2eI9I+ocdcB4INBQO1tllof/WUW4n2+4+3n4HyqO
         g96ob6etT3kPpfkGBIjFMQaahU/VwiAXCkkGAQ8IgydcS0VTsQNuoMmL9jIawa8CMc+D
         A0SyqXm0efM/z/atAM0fc4NFnC6efzhjafVCoVg2hlMWtZ2ZUeChV6BIXZEHn3n8UX3q
         hxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761786465; x=1762391265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id3gb4VM70r8JjlpIpMntwH9hB/tw0n4UthxF1ao5+Q=;
        b=mv4RW7vy9jeOZNB6N6KhAeLXNr/Zl58Y/or+Mq5AACfAFe8sar9DGDkagDGVXTIKGJ
         bhNWOoDUuxVA5BwAeLQePkv0Uo5aggHGxzwaNhlc1/hAqIRTI7jf6j/tirsm3LULSnYV
         4NCDqPjLAovHMZeDciCSgClVeceE5N1AHBcWSW/xXFOMr3GRtzvs55kh7ShmzAEceflL
         Vtstd5aC6/3MJOiyWTrUdNJHD/Q3l+iNLHLQLrKAPc6d7ugkQK0MCmPJgDf6sR7TPcmg
         xuy7+70DRAAfTtfJ7dGu1jjQ6ThtwFZA8Mf0dRrz0J3XEdIdf4QtavGtYjF3YfKAYqUx
         F0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVaVw4i4xtFTCiH7fDPCQv9zTJ3cl9YYvOHyQkYsezou1mlcnwuTYbu2eD8EiIHRp9F8UaP3X3dfzJ6TA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0QckQxtXU6sg98hsBn9GM6/P9dv3L9iPJDf0c1JihyU7nN8Nj
	roGHdgBVzS8hOoJOkn0VdWtFlVYrehkeXWmRw0FAQvxDLZ3ZRA0oTUHBpfbnjkTDtVJQuqk/FWm
	dxVOJYkEPJn/1f1MlvunGAEx6uLSvJgPyx1SkcUqF
X-Gm-Gg: ASbGncs6GOGdaeJ06bENYqaiJZZH6GelD6+65sifpHmhkGkkLb4hv/3+DA9mGKl0CNB
	prEROouW4Sc/kWJHjnUHM9INSFbtkCaVB58w5/wXqd1D9zD3zhazFlObZt/cxU72Wq05GufjTj1
	7Y19b8Py7US3gJA5i9TjSvvyOXvYlZ/3VPxmRKj3xnxphgdBnASSzmFt4KGH7YESw4YKdcHW/Ql
	nmbMWFdT91JTBGEGD5w9u9uviJWGOuKpDDpm55ljLI6OfZLZ2OEJYumUjVQr2FJRrk91fw/8DJF
	eBw+HmAk+A6C2ORAzoaf3+Hwtqyn
X-Google-Smtp-Source: AGHT+IGk+D8yQ9+SwKPD0nEhpyf/NXripmysWq7Sb6LYWYRSuXaYyS1yHre0OvZakqvcTcUMROj68CxyaozwBa97GHQ=
X-Received: by 2002:a05:622a:260d:b0:4e5:8707:d31 with SMTP id
 d75a77b69052e-4ed23bf51a5mr1888081cf.7.1761786465168; Wed, 29 Oct 2025
 18:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <10-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <10-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Wed, 29 Oct 2025 18:07:33 -0700
X-Gm-Features: AWmQ_bkkP7FCKXR-SsBvX0XmrZ4yVNMBIM5BqatCpZRvsfd8j587v0wxvY7VreQ
Message-ID: <CAAywjhRW17C-RbqM6zUSuEF7mB2SXzK1E_zthHJ9iJaEo6ejxQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/15] iommupt: Add a mock pagetable format for iommufd
 selftest to use
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_180746_659001_9C0B3B68 
X-CRM114-Status: GOOD (  25.70  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMTE6MjHigK9BTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bu
dmlkaWEuY29tPiB3cm90ZToKPgo+IFRoZSBpb21tdWZkIHNlbGYgdGVzdCB1c2VzIGFuIHhhcnJh
eSB0byBzdG9yZSB0aGUgcGZucyBhbmQgdGhlaXIgb3JkZXJzIHRvCj4gZW11bGF0ZSBhIHBhZ2Ug
dGFibGUuIFNsaWdodGx5IG1vZGlmeSB0aGUgYW1kdjEgcGFnZSB0YWJsZSB0byBjcmVhdGUgYQo+
IHJlYWwgcGFnZSB0YWJsZSB0aGF0IGhhcyBzaW1pbGFyIHByb3BlcnRpZXM6Cj4KPiAgLSAyayBi
YXNlIGdyYW51bGUgdG8gc2ltdWxhdGUgc29tZXRoaW5nIGxpa2UgYSA0ayBwYWdlIHRhYmxlIG9u
IGEgNjRLCj4gICAgUEFHRV9TSVpFIEFSTSBzeXN0ZW0KPiAgLSBDb250aWd1b3VzIHBhZ2Ugc3Vw
cG9ydCBmb3IgZXZlcnkgUEZOIG9yZGVyCj4gIC0gRGlydHkgdHJhY2tpbmcKPgo+IEFNRHYxIGlz
IHRoZSBjbG9zZXN0IGZvcm1hdCwgYXMgaXQgaXMgdGhlIG9ubHkgb25lIHRoYXQgYWxyZWFkeSBz
dXBwb3J0cwo+IGV2ZXJ5IHBhZ2Ugc2l6ZS4gVHdlYWsgaXQgdG8gaGF2ZSBvbmx5IDUgbGV2ZWxz
IGFuZCBhbiAxMSBiaXQgYmFzZSBncmFudWxlCj4gYW5kIGNvbXBpbGUgaXQgc2VwYXJhdGVseSBh
cyBhIGZvcm1hdCB2YXJpYW50Lgo+Cj4gVGVzdGVkLWJ5OiBBbGVqYW5kcm8gSmltZW5leiA8YWxl
amFuZHJvLmouamltZW5lekBvcmFjbGUuY29tPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpn
Z0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L01ha2Vm
aWxlICAgICB8ICAxICsKPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9hbWR2MS5oICAg
ICAgfCAxOCArKysrKysrKysrKysrKysrLS0KPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2Zt
dC9pb21tdV9tb2NrLmMgfCAxMCArKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvZ2VuZXJpY19w
dC9pb21tdS5oICAgICAgICAgIHwgIDYgKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aW9tbXUvZ2VuZXJpY19wdC9mbXQvaW9tbXVfbW9jay5jCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pb21tdS9nZW5lcmljX3B0L2ZtdC9NYWtlZmlsZSBiL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19w
dC9mbXQvTWFrZWZpbGUKPiBpbmRleCAzMmYzOTU2Yzc1MDlmOC4uZjBjMjJjZjVmN2JlZTYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9NYWtlZmlsZQo+ICsrKyBi
L2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvTWFrZWZpbGUKPiBAQCAtMSw2ICsxLDcgQEAK
PiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Cj4gIGlvbW11X3B0X2ZtdC0k
KENPTkZJR19JT01NVV9QVF9BTURWMSkgKz0gYW1kdjEKPiAraW9tbXVfcHRfZm10LSQoQ09ORklH
X0lPTU1VRkRfVEVTVCkgKz0gbW9jawo+Cj4gIElPTU1VX1BUX0tVTklUX1RFU1QgOj0KPiAgZGVm
aW5lIGNyZWF0ZV9mb3JtYXQKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0
L2ZtdC9hbWR2MS5oIGIvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9hbWR2MS5oCj4gaW5k
ZXggNzA2YTcwYzg2MDMwMTcuLjgxY2VkMjQ1ODVmZjkzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aW9tbXUvZ2VuZXJpY19wdC9mbXQvYW1kdjEuaAo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZ2VuZXJp
Y19wdC9mbXQvYW1kdjEuaAo+IEBAIC0yNiwxMSArMjYsMjMgQEAKPiAgI2luY2x1ZGUgPGxpbnV4
L3N0cmluZy5oPgo+Cj4gIGVudW0gewo+IC0gICAgICAgUFRfTUFYX09VVFBVVF9BRERSRVNTX0xH
MiA9IDUyLAo+IC0gICAgICAgUFRfTUFYX1ZBX0FERFJFU1NfTEcyID0gNjQsCj4gICAgICAgICBQ
VF9JVEVNX1dPUkRfU0laRSA9IHNpemVvZih1NjQpLAo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IFRoZSBJT01NVUZEIHNlbGZ0ZXN0IHVzZXMgdGhlIEFNRHYxIGZvcm1hdCB3aXRoIHNvbWUgYWx0
ZXJhdGlvbnMgSXQKPiArICAgICAgICAqIHVzZXMgYSAyayBwYWdlIHNpemUgdG8gdGVzdCBjYXNl
cyB3aGVyZSB0aGUgQ1BVIHBhZ2Ugc2l6ZSBpcyBub3QgdGhlCj4gKyAgICAgICAgKiBzYW1lLgo+
ICsgICAgICAgICovCj4gKyNpZmRlZiBBTURWMV9JT01NVUZEX1NFTEZURVNUCj4gKyAgICAgICBQ
VF9NQVhfVkFfQUREUkVTU19MRzIgPSA1NiwKPiArICAgICAgIFBUX01BWF9PVVRQVVRfQUREUkVT
U19MRzIgPSA1MSwKPiArICAgICAgIFBUX01BWF9UT1BfTEVWRUwgPSA0LAo+ICsgICAgICAgUFRf
R1JBTlVMRV9MRzJTWiA9IDExLAo+ICsjZWxzZQo+ICsgICAgICAgUFRfTUFYX1ZBX0FERFJFU1Nf
TEcyID0gNjQsCj4gKyAgICAgICBQVF9NQVhfT1VUUFVUX0FERFJFU1NfTEcyID0gNTIsCj4gICAg
ICAgICBQVF9NQVhfVE9QX0xFVkVMID0gNSwKPiAgICAgICAgIFBUX0dSQU5VTEVfTEcyU1ogPSAx
MiwKPiArI2VuZGlmCj4gICAgICAgICBQVF9UQUJMRU1FTV9MRzJTWiA9IDEyLAo+Cj4gICAgICAg
ICAvKiBUaGUgRFRFIG9ubHkgaGFzIHRoZXNlIGJpdHMgZm9yIHRoZSB0b3AgcGh5aXNjYWwgYWRk
cmVzcyAqLwo+IEBAIC0zNzgsNiArMzkwLDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kdjFwdF9p
b21tdV9mbXRfaW5pdChzdHJ1Y3QgcHRfaW9tbXVfYW1kdjEgKmlvbW11X3RhYmxlLAo+ICB9Cj4g
ICNkZWZpbmUgcHRfaW9tbXVfZm10X2luaXQgYW1kdjFwdF9pb21tdV9mbXRfaW5pdAo+Cj4gKyNp
Zm5kZWYgUFRfRk1UX1ZBUklBTlQKPiAgc3RhdGljIGlubGluZSB2b2lkCj4gIGFtZHYxcHRfaW9t
bXVfZm10X2h3X2luZm8oc3RydWN0IHB0X2lvbW11X2FtZHYxICp0YWJsZSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwdF9yYW5nZSAqdG9wX3JhbmdlLAo+IEBAIC0z
ODgsNiArNDAxLDcgQEAgYW1kdjFwdF9pb21tdV9mbXRfaHdfaW5mbyhzdHJ1Y3QgcHRfaW9tbXVf
YW1kdjEgKnRhYmxlLAo+ICAgICAgICAgaW5mby0+bW9kZSA9IHRvcF9yYW5nZS0+dG9wX2xldmVs
ICsgMTsKPiAgfQo+ICAjZGVmaW5lIHB0X2lvbW11X2ZtdF9od19pbmZvIGFtZHYxcHRfaW9tbXVf
Zm10X2h3X2luZm8KPiArI2VuZGlmCj4KPiAgI2lmIGRlZmluZWQoR0VORVJJQ19QVF9LVU5JVCkK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwdF9pb21tdV9hbWR2MV9jZmcgYW1kdjFfa3VuaXRfZm10
X2NmZ3NbXSA9IHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9p
b21tdV9tb2NrLmMgYi9kcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L2lvbW11X21vY2suYwo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAuLjc0ZTU5N2NiYTlk
OWNkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQv
aW9tbXVfbW9jay5jCj4gQEAgLTAsMCArMSwxMCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNC0yMDI1LCBO
VklESUEgQ09SUE9SQVRJT04gJiBBRkZJTElBVEVTCj4gKyAqLwo+ICsjZGVmaW5lIEFNRFYxX0lP
TU1VRkRfU0VMRlRFU1QgMQo+ICsjZGVmaW5lIFBUX0ZNVCBhbWR2MQo+ICsjZGVmaW5lIFBUX0ZN
VF9WQVJJQU5UIG1vY2sKPiArI2RlZmluZSBQVF9TVVBQT1JURURfRkVBVFVSRVMgMAo+ICsKPiAr
I2luY2x1ZGUgImlvbW11X3RlbXBsYXRlLmgiCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
Z2VuZXJpY19wdC9pb21tdS5oIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2lvbW11LmgKPiBp
bmRleCAwM2E5MDZmYmUxMmE4My4uODQ4YTVmYjc2MjcyYTkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9nZW5lcmljX3B0L2lvbW11LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2dlbmVyaWNf
cHQvaW9tbXUuaAo+IEBAIC0yMzcsNiArMjM3LDEyIEBAIHN0cnVjdCBwdF9pb21tdV9hbWR2MV9o
d19pbmZvIHsKPgo+ICBJT01NVV9GT1JNQVQoYW1kdjEsIGFtZHB0KTsKPgo+ICsvKiBhbWR2MV9t
b2NrIGlzIHVzZWQgYnkgdGhlIGlvbW11ZmQgc2VsZnRlc3QgKi8KPiArI2RlZmluZSBwdF9pb21t
dV9hbWR2MV9tb2NrIHB0X2lvbW11X2FtZHYxCj4gKyNkZWZpbmUgcHRfaW9tbXVfYW1kdjFfbW9j
a19jZmcgcHRfaW9tbXVfYW1kdjFfY2ZnCj4gK3N0cnVjdCBwdF9pb21tdV9hbWR2MV9tb2NrX2h3
X2luZm87Cj4gK0lPTU1VX1BST1RPVFlQRVMoYW1kdjFfbW9jayk7Cj4gKwo+ICAjdW5kZWYgSU9N
TVVfUFJPVE9UWVBFUwo+ICAjdW5kZWYgSU9NTVVfRk9STUFUCj4gICNlbmRpZgo+IC0tCj4gMi40
My4wCj4KPgoKUmV2aWV3ZWQtYnk6IFNhbWl1bGxhaCBLaGF3YWphIDxza2hhd2FqYUBnb29nbGUu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
