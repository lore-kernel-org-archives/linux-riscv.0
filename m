Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11986C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhrlcCQHdWsuSZnXjguKv9p6ueZOiirm4Dy1CRWSlfU=; b=1C5pYDDI12wqnA
	GSDRecCB/yTD+orkZrdYhrfnKYWqTVP3a8zDgs5WUsdftjbi+Juj+WOgnfo627E6JJgWnuqf5ssn3
	PxAEeVyMaB+slYVg6CaALopgkXeoMCRZZfG246l9zC/9d9svOUuLfUJI2ihqxhMMHgZVrqOPZJ7vW
	rwa7q5N/vX3fqGZntpD74tMW7Xk1w3gXGvI7yNimmAX06YxXkstiZn9g/0+jDpHG5MwDTpTe1ewRM
	hzrgt3LXumpy3CXGM69Eexz4riyiF/I2OTjIeFVAq6N0HeiBaipmop8Xyw5UXka6H+YzCvZ9O5AuP
	56l6p0blEFXyIH+Q09gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAgc-007Wp2-2q;
	Wed, 01 Nov 2023 12:51:06 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAgZ-007WnP-0u
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 12:51:04 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-66cfc96f475so43158036d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698843062; x=1699447862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DytdUoCbq8poGHKLHOEtAO0D5dohgKyWvCysCxFt+wY=;
        b=OHvcyVuufsczbZiXsunzJJRMcWr4kOB6zSehhHXT6JyGuOHOthGpJTrhTnS3+S838U
         5oFONc0nDhk4U8HEtzJvNYYtr07xlXSerxzpOqWNmYd8ZpvuLbV7Aax9MqPKVOUQXHrD
         knSnLQ5kwIQNRXH2zT2aqB6HoQrdcMe/TVW+Xh+pm8oHuSEp+2eJ6oqB56EfTH4Il5KO
         zCbpY8UgfmOd8/3+IEDT3yfDlhrczCqh7cTF/ptO46hg/cRhxv4t8fXwACdhlyyLW3nb
         uSW7ilTxRVDKVXc7pBcketUR1EQJ0bWhA0tfC3KFagli0IcT/dVlP+xejtb49PVhhJ9Z
         HxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698843062; x=1699447862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DytdUoCbq8poGHKLHOEtAO0D5dohgKyWvCysCxFt+wY=;
        b=VNUksxMrdtWy+Vwpq7S5B5YqxFRWekrZPga1wnmtkH3WOql7b1JebacALOZfEnJ0P/
         TKTdNl133LYU6uoP1t6lmUAEH7NDkZ6a9d6o3xik0PKdYt5RsFo9Ms/4XjG0MiseJmyn
         lkWfPBJVaiechSaFbsj/CrJB0gmWMunJEd+JfzuMoNdFcH+DlgH4C6Jrzg1qA/Ww+Q3z
         2Gi3OWyA3Nz1th910w7yd/MJGI+nN0pIh0cwO1BSLugB0D5RGWEcVLYLk5KWF7CCIbBg
         2/uUmfh5/CdYxVrF2EtFnmvbFhcQaI1OS8eCizFwzo7+WyhQYoTVSMx7VTzZ5fXSG/qa
         47xw==
X-Gm-Message-State: AOJu0YyATY4eR5UpogNpu7zwRGM/wpp42xl4ZaESFZPYrlPZRdBnu1TH
	Wz/GtTBNx5uKqhnwJylGRbZ942XKdohT4FLZUtGuYw==
X-Google-Smtp-Source: AGHT+IF4xR6L8cVnqFnyZjdEh5XAFhWOV7M0s6Xt9NyBBttGvtAf21ACAZmexGcVd+eTPklAY7PiFjol+SoHUZLf4NM=
X-Received: by 2002:a05:6214:262e:b0:66f:bd35:e889 with SMTP id
 gv14-20020a056214262e00b0066fbd35e889mr16003984qvb.60.1698843062295; Wed, 01
 Nov 2023 05:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-5-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-5-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:50:26 +0000
Message-ID: <CA+EHjTxW3P+_fejO6emoZ1=c9EkWJUH63-ffmSumh=6P6MbTqQ@mail.gmail.com>
Subject: Re: [PATCH v13 04/35] KVM: WARN if there are dangling MMU
 invalidations at VM destruction
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
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
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_055103_327042_F9310CDB 
X-CRM114-Status: GOOD (  18.32  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyMuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEFkZCBhbiBhc3NlcnRpb24gdGhhdCB0aGVyZSBh
cmUgbm8gaW4tcHJvZ3Jlc3MgTU1VIGludmFsaWRhdGlvbnMgd2hlbiBhCj4gVk0gaXMgYmVpbmcg
ZGVzdHJveWVkLCB3aXRoIHRoZSBleGNlcHRpb24gb2YgdGhlIHNjZW5hcmlvIHdoZXJlIEtWTQo+
IHVucmVnaXN0ZXJzIGl0cyBNTVUgbm90aWZpZXIgYmV0d2VlbiBhbiAuaW52YWxpZGF0ZV9yYW5n
ZV9zdGFydCgpIGNhbGwgYW5kCj4gdGhlIGNvcnJlc3BvbmRpbmcgLmludmFsaWRhdGVfcmFuZ2Vf
ZW5kKCkuCj4KPiBLVk0gY2FuJ3QgZGV0ZWN0IHVucGFpcmVkIGNhbGxzIGZyb20gdGhlIG1tdV9u
b3RpZmllciBkdWUgdG8gdGhlIGFib3ZlCj4gZXhjZXB0aW9uIHdhaXZlciwgYnV0IHRoZSBhc3Nl
cnRpb24gY2FuIGRldGVjdCBLVk0gYnVncywgZS5nLiBzdWNoIGFzIHRoZQo+IGJ1ZyB0aGF0ICph
bG1vc3QqIGVzY2FwZWQgaW5pdGlhbCBndWVzdF9tZW1mZCBkZXZlbG9wbWVudC4KPgo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9lMzk3ZDMwYy1jNmFmLWU2OGYtZDE4ZS1iNGUz
NzM5YzUzODlAbGludXguaW50ZWwuY29tCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhl
cnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRnVhZCBUYWJiYSA8
dGFiYmFAZ29vZ2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29t
PgoKQ2hlZXJzLAovZnVhZAoKPiAgdmlydC9rdm0va3ZtX21haW4uYyB8IDkgKysrKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IGluZGV4
IDFhNTc3YTI1ZGU0Ny4uNGRiYTY4MjU4NmVlIDEwMDY0NAo+IC0tLSBhL3ZpcnQva3ZtL2t2bV9t
YWluLmMKPiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gQEAgLTEzNTYsOSArMTM1NiwxNiBA
QCBzdGF0aWMgdm9pZCBrdm1fZGVzdHJveV92bShzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICAg
KiBObyB0aHJlYWRzIGNhbiBiZSB3YWl0aW5nIGluIGt2bV9zd2FwX2FjdGl2ZV9tZW1zbG90cygp
IGFzIHRoZQo+ICAgICAgICAgICogbGFzdCByZWZlcmVuY2Ugb24gS1ZNIGhhcyBiZWVuIGRyb3Bw
ZWQsIGJ1dCBmcmVlaW5nCj4gICAgICAgICAgKiBtZW1zbG90cyB3b3VsZCBkZWFkbG9jayB3aXRo
b3V0IHRoaXMgbWFudWFsIGludGVydmVudGlvbi4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBJ
ZiB0aGUgY291bnQgaXNuJ3QgdW5iYWxhbmNlZCwgaS5lLiBLVk0gZGlkIE5PVCB1bnJlZ2lzdGVy
IGl0cyBNTVUKPiArICAgICAgICAqIG5vdGlmaWVyIGJldHdlZW4gYSBzdGFydCgpIGFuZCBlbmQo
KSwgdGhlbiB0aGVyZSBzaG91bGRuJ3QgYmUgYW55Cj4gKyAgICAgICAgKiBpbi1wcm9ncmVzcyBp
bnZhbGlkYXRpb25zLgo+ICAgICAgICAgICovCj4gICAgICAgICBXQVJOX09OKHJjdXdhaXRfYWN0
aXZlKCZrdm0tPm1uX21lbXNsb3RzX3VwZGF0ZV9yY3V3YWl0KSk7Cj4gLSAgICAgICBrdm0tPm1u
X2FjdGl2ZV9pbnZhbGlkYXRlX2NvdW50ID0gMDsKPiArICAgICAgIGlmIChrdm0tPm1uX2FjdGl2
ZV9pbnZhbGlkYXRlX2NvdW50KQo+ICsgICAgICAgICAgICAgICBrdm0tPm1uX2FjdGl2ZV9pbnZh
bGlkYXRlX2NvdW50ID0gMDsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgV0FSTl9P
Tihrdm0tPm1tdV9pbnZhbGlkYXRlX2luX3Byb2dyZXNzKTsKPiAgI2Vsc2UKPiAgICAgICAgIGt2
bV9mbHVzaF9zaGFkb3dfYWxsKGt2bSk7Cj4gICNlbmRpZgo+IC0tCj4gMi40Mi4wLjgyMC5nODNh
NzIxYTEzNy1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
