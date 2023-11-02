Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CEDC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTcVqAJoXVEHDHjKHylqTz/0+DVVzu77mK9BMqDRV8Y=; b=a+KNU0qmEHEJc7
	kJccj1eLu1iX1wFC1VzHfxDidIEsVWRr7UPGDqepHyo1EsIZUDJM1MyJoZX3M6Ne/f68mn1oqGUHA
	oFhx3pjHvVDM9Niw+h0gBgUTkLgt39zWBsTbJh882MNMaoOdMWzhJZg3DaZDj0ZWlngq5TWyIm2zD
	4W6mmrIMWlY3DQOdbY3QlVdMw5muDffZR8AyvUPqXA/lKTODJ974mJJk/laiXRuutQ5QAMxkUS4aD
	I68sB8GIvAoU116LYWj9t33QLUQoRFsfC7q/CX8w/+lBbQgqy0k+HccYsn4t+crBeFFAbJazv69zg
	SF5lLfmSmhpyygzIwG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYnx-009enO-0s;
	Thu, 02 Nov 2023 14:36:17 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYnu-009elS-1b
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 14:36:15 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-777719639adso57853985a.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698935773; x=1699540573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGQNRc9zE40ysVevY/WGU/Lu6W4371YJar5QqeiLOSY=;
        b=uX/4E7ee2dSqF6LLd1Q7l0mHTYpnZMxQrVGQpQPbzKSXXzl/BZ5rBH9Bk8lrBFQGaE
         nLIz2qAFRI3K3MUYcsE6RMQ/J1xkorS6Ktx9li1zgsGSHSbB/mcnuRntbGiU+sEs5+MM
         bd0iX+je6BYxFxZg6e2OPiS+PuI47evYdDm4phuvgEQf8sTcATwowdlaHKNpxcwhzD+i
         zj4feeLyvQbMgs0l2+QYUFZc//X8fNDnqZOQl1ghSJdv71mvDfHw7B+VDc5/1ZQ2DipA
         3KlQNZJowU0JfQUYUA75iH0INwMOwz9+loZCymVhHAeZk3Pyi6Wfo2Rf5zaoJkeGy7Mq
         fNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935773; x=1699540573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGQNRc9zE40ysVevY/WGU/Lu6W4371YJar5QqeiLOSY=;
        b=ECwPXBNEDxJkrvbVecKmF805f871tZGYUON7lQuLvqwLl4VQzZOIcTudj+/f0Uvxa8
         WTTUlKSztUdyy1XxVuE0qn72S17ZRVaY0MfawUUMCEu5hNy4ix3lRtXV7+KEa40/QWlT
         YqyZvU/jC+Mzy02Mwg4XCnPbEjihcFHpku3XPT3vErTWpaK/DJhv+difMoq1HZprg/+5
         jPmguVUzDKmz7AQ8UKbNyV1fpSjAlibx8Uj9gwDzGfxgbhvJUWMuMiZkZjHSbd0+G6oH
         arA88Dh+44UqJrItXI7MHOnN+PBXuVL5wmMdU06DvnTGptGDNtodkTpJhsgcJ+E0WJ57
         iUjw==
X-Gm-Message-State: AOJu0YwsSorBiJgopWnKAAbzWXu4Pbmqi6ApJSNo57PLFRZ3uCDSYqU5
	4H5bmd7o4xk5t3y/GfCFyfe7+tJomfNcham4A9HsvQ==
X-Google-Smtp-Source: AGHT+IG3zQONLtNNLFCBisiqnyb2KBBdAZoBcVXn8ZKHSOcO4zLCu8vZ+2T5E0OEe4jyHp5mk0SJgyrOfTeARfH9hlY=
X-Received: by 2002:a05:6214:242e:b0:66d:a90f:c06 with SMTP id
 gy14-20020a056214242e00b0066da90f0c06mr22425828qvb.14.1698935773112; Thu, 02
 Nov 2023 07:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-22-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-22-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:35:36 +0000
Message-ID: <CA+EHjTzk0=24wGbxQUApAY4B-K3xO3+SOfLn1tPJk-hVJY0+GQ@mail.gmail.com>
Subject: Re: [PATCH v13 21/35] KVM: Drop superfluous __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 macro
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
X-CRM114-CacheID: sfid-20231102_073614_535181_BC78A1D9 
X-CRM114-Status: GOOD (  14.26  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyM+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IERyb3AgX19LVk1fVkNQVV9NVUxUSVBMRV9BRERS
RVNTX1NQQUNFIGFuZCBpbnN0ZWFkIGNoZWNrIHRoZSB2YWx1ZSBvZgo+IEtWTV9BRERSRVNTX1NQ
QUNFX05VTS4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Cj4gUmV2aWV3ZWQt
Ynk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1i
eTogRnVhZCBUYWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0
YWJiYUBnb29nbGUuY29tPgoKQ2hlZXJzLAovZnVhZAoKPiAgYXJjaC94ODYvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCB8IDEgLQo+ICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgIHwgMiAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggOGQ2MGU0NzQ1ZThiLi42NzAyZjc5NWM4NjIg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtMjEyNCw3ICsyMTI0LDYgQEAgZW51
bSB7Cj4gICNkZWZpbmUgSEZfU01NX01BU0sgICAgICAgICAgICAoMSA8PCAxKQo+ICAjZGVmaW5l
IEhGX1NNTV9JTlNJREVfTk1JX01BU0sgKDEgPDwgMikKPgo+IC0jIGRlZmluZSBfX0tWTV9WQ1BV
X01VTFRJUExFX0FERFJFU1NfU1BBQ0UKPiAgIyBkZWZpbmUgS1ZNX0FERFJFU1NfU1BBQ0VfTlVN
IDIKPiAgIyBkZWZpbmUga3ZtX2FyY2hfdmNwdV9tZW1zbG90c19pZCh2Y3B1KSAoKHZjcHUpLT5h
cmNoLmhmbGFncyAmIEhGX1NNTV9NQVNLID8gMSA6IDApCj4gICMgZGVmaW5lIGt2bV9tZW1zbG90
c19mb3Jfc3B0ZV9yb2xlKGt2bSwgcm9sZSkgX19rdm1fbWVtc2xvdHMoa3ZtLCAocm9sZSkuc21t
KQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4
L2t2bV9ob3N0LmgKPiBpbmRleCBlMzIyM2NhZmQ3ZGIuLmMzY2ZlMDhiMTMwMCAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmgKPiBAQCAtNjkyLDcgKzY5Miw3IEBAIGJvb2wga3ZtX2FyY2hfaXJxY2hpcF9pbl9rZXJu
ZWwoc3RydWN0IGt2bSAqa3ZtKTsKPiAgI2RlZmluZSBLVk1fTUVNX1NMT1RTX05VTSBTSFJUX01B
WAo+ICAjZGVmaW5lIEtWTV9VU0VSX01FTV9TTE9UUyAoS1ZNX01FTV9TTE9UU19OVU0gLSBLVk1f
SU5URVJOQUxfTUVNX1NMT1RTKQo+Cj4gLSNpZm5kZWYgX19LVk1fVkNQVV9NVUxUSVBMRV9BRERS
RVNTX1NQQUNFCj4gKyNpZiBLVk1fQUREUkVTU19TUEFDRV9OVU0gPT0gMQo+ICBzdGF0aWMgaW5s
aW5lIGludCBrdm1fYXJjaF92Y3B1X21lbXNsb3RzX2lkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
PiAgewo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0KPiAyLjQyLjAuODIwLmc4M2E3MjFhMTM3LWdv
b2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
