Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AB3C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 04:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29DBZ9EcG0T87XqGMuSE/jmWEMZjwrceE0OM7wnwbU0=; b=m6Bk4yDmMjb52e
	xpoNsiRyG4qT4iDswLQuJBGAFu0hgmCLQT+wJdaPlYrxEsd8FlOe3i3lB9mN9flqvIoRCPdwLljR6
	IcONm5U4LHN++ARJ89mh+4SJFshNOOjHN8sVYkTZ+fnz4Ku4HTsIYxqAz0scQ99dFW9qkMd4rt7Df
	cLeZybCRg6yvAkhQHZMnlxf/bBZwpTbRADIy4YIJ/kWdVTo6zh1knLhiklnvOB1PkHOCNtvTAZYAx
	MQnqtexgdLJ/C7xw9P/gfWpQSGxqpJrMNh12m+GW1Jy4F9xgmtXswAwPxF4jUldibdS6Yv4GCT3JM
	B4es8l5vK8KiAwkRKHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOVnx-0095cN-2d;
	Wed, 26 Jul 2023 04:07:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOVnu-0095al-1N
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 04:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690344432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jd3Ayh8DN133HPzYKMvS4hrOB9t+N5s98/iIQZ50pSY=;
	b=DAhZ+vTsZL1nGTc51NxghZ11XvIAOZsoYkXttdbCoAN8MN/jST/W0b34Gj2Jqd6YlCYdhL
	vgEfJPRL91cJcARMxHjIKGh2ZGckGYCJtvekX2wAG++vNXAPyMwsnI3J+SZdYttvk9ovWM
	6r9PeEjXjC69WknWeg2wLIFndUruAL0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-JyNZ6ZlFMfqdDaP04E1-tA-1; Wed, 26 Jul 2023 00:07:06 -0400
X-MC-Unique: JyNZ6ZlFMfqdDaP04E1-tA-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-67d0eacdf97so757144b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 21:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690344425; x=1690949225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd3Ayh8DN133HPzYKMvS4hrOB9t+N5s98/iIQZ50pSY=;
        b=gHITKmSRpRRBsbUKyVjcEph53pIs7fa2Ghwi+RRVuobPHM7PiR8pgSXBhiZcKDZfeg
         vsc7tgcafJY7e8PEtcHlZNnv0UQerYvo5WK+MotiuhFp/XIxkS2ycKorBNhtm+nAZXcU
         GCa/s7s4V+v0DA0sWQIWMeYsQe8EbzJiYBp/m6mz+v6QpYhiTww+aFmJKi+C4HsjP3eZ
         vfiR7q/N4W7IrM55wlYxS9StLo1ZpHGyj5SPjUZN0kto7fxdXXuzA26NvHrzsIlam3Q9
         XjK9syQYXogf1VL/PhsFj7z6gydXPWOSVAMC5Ht1ngGR4LBLbznsakn0E4ZEOYzikTPx
         S3dQ==
X-Gm-Message-State: ABy/qLYoXqsCGXkuyp8rTpbXiZNSkhJ9Au6xCqLC7FJu7QxE7wBsnsdl
	nbbUoEirdy/VA/fCgfDzALOl7pawok4vstbxSWuC4oQTG41e/jNMtqfMxoGLT87b5bFH2ovC5os
	/HLshZMtlNAVOr7MXYddC41FRcF2n
X-Received: by 2002:a05:6a21:998e:b0:13a:3649:dc1a with SMTP id ve14-20020a056a21998e00b0013a3649dc1amr1214741pzb.0.1690344425268;
        Tue, 25 Jul 2023 21:07:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHleYbAwzuemeXRJ1zvnZsyP8kzTsFzjwsO8Pk5jpHvjhbkv06p3/Mm3PthC+5aKlT4RtEFvA==
X-Received: by 2002:a05:6a21:998e:b0:13a:3649:dc1a with SMTP id ve14-20020a056a21998e00b0013a3649dc1amr1214709pzb.0.1690344424918;
        Tue, 25 Jul 2023 21:07:04 -0700 (PDT)
Received: from [10.72.112.95] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id a13-20020aa7864d000000b006862e7f4648sm10736311pfo.99.2023.07.25.21.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 21:07:04 -0700 (PDT)
Message-ID: <bd054dfa-915d-e231-b480-06401622ebde@redhat.com>
Date: Wed, 26 Jul 2023 12:06:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for
 unmap
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>,
 Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20230722022251.3446223-1-rananta@google.com>
 <20230722022251.3446223-13-rananta@google.com>
 <0841aca6-2824-6a1b-a568-119f8bd220de@redhat.com>
 <CAJHc60znT5ThqKE3TgTW-0Us3oNv8+KF=81TSK0PbG3tTyJLFQ@mail.gmail.com>
 <7ea9e7a0-508d-0f00-09ae-ae468f111437@redhat.com>
 <CAJHc60xaygC8tX8yFnoFM9YqWg8iE6r5d+kugGwO5KZxDtG3rQ@mail.gmail.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <CAJHc60xaygC8tX8yFnoFM9YqWg8iE6r5d+kugGwO5KZxDtG3rQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_210714_538531_D942602D 
X-CRM114-Status: GOOD (  32.43  )
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

SGkgUmFnaGF2ZW5kcmEsCgpPbiA3LzI2LzIzIDAxOjIzLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRh
IHdyb3RlOgo+IEhpIFNoYW9xaW4sCj4gCj4gT24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgNzozMuKA
r1BNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+
PiBPbiA3LzI1LzIzIDAwOjQ3LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+Pj4gT24g
TW9uLCBKdWwgMjQsIDIwMjMgYXQgMjozNeKAr0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gSGkgUmFnaGF2ZW5kcmEsCj4+Pj4KPj4+PiBPbiA3
LzIyLzIzIDEwOjIyLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+Pj4+PiBUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgc3RhZ2UtMiB1bm1hcCB3YWxrZXIgdHJhdmVyc2Vz
Cj4+Pj4+IHRoZSBnaXZlbiByYW5nZSBhbmQsIGFzIGEgcGFydCBvZiBicmVhay1iZWZvcmUtbWFr
ZSwgcGVyZm9ybXMKPj4+Pj4gVExCIGludmFsaWRhdGlvbnMgd2l0aCBhIERTQiBmb3IgZXZlcnkg
UFRFLiBBIG11bHRpdHVkZSBvZiB0aGlzCj4+Pj4+IGNvbWJpbmF0aW9uIGNvdWxkIGNhdXNlIGEg
cGVyZm9ybWFuY2UgYm90dGxlbmVjayBvbiBzb21lIHN5c3RlbXMuCj4+Pj4+Cj4+Pj4+IEhlbmNl
LCBpZiB0aGUgc3lzdGVtIHN1cHBvcnRzIEZFQVRfVExCSVJBTkdFLCBkZWZlciB0aGUgVExCCj4+
Pj4+IGludmFsaWRhdGlvbnMgdW50aWwgdGhlIGVudGlyZSB3YWxrIGlzIGZpbmlzaGVkLCBhbmQg
dGhlbgo+Pj4+PiB1c2UgcmFuZ2UtYmFzZWQgaW5zdHJ1Y3Rpb25zIHRvIGludmFsaWRhdGUgdGhl
IFRMQnMgaW4gb25lIGdvLgo+Pj4+PiBDb25kaXRpb24gZGVmZXJyZWQgVExCIGludmFsaWRhdGlv
biBvbiB0aGUgc3lzdGVtIHN1cHBvcnRpbmcgRldCLAo+Pj4+PiBhcyB0aGUgb3B0aW1pemF0aW9u
IGlzIGVudGlyZWx5IHBvaW50bGVzcyB3aGVuIHRoZSB1bm1hcCB3YWxrZXIKPj4+Pj4gbmVlZHMg
dG8gcGVyZm9ybSBDTU9zLgo+Pj4+Pgo+Pj4+PiBSZW5hbWUgc3RhZ2UyX3B1dF9wdGUoKSB0byBz
dGFnZTJfdW5tYXBfcHV0X3B0ZSgpIGFzIHRoZSBmdW5jdGlvbgo+Pj4+PiBub3cgc2VydmVzIHRo
ZSBzdGFnZS0yIHVubWFwIHdhbGtlciBzcGVjaWZpY2FsbHksIHJhdGhlciB0aGFuCj4+Pj4+IGFj
dGluZyBnZW5lcmljLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8g
QW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgYXJjaC9hcm02
NC9rdm0vaHlwL3BndGFibGUuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJs
ZS5jIGIvYXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwo+Pj4+PiBpbmRleCA1ZWYwOThhZjE3
MzYuLmNmODg5MzNhMmVhMCAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9rdm0vaHlwL3Bn
dGFibGUuYwo+Pj4+PiArKysgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4+Pj4+IEBA
IC04MzEsMTYgKzgzMSw1NCBAQCBzdGF0aWMgdm9pZCBzdGFnZTJfbWFrZV9wdGUoY29uc3Qgc3Ry
dWN0IGt2bV9wZ3RhYmxlX3Zpc2l0X2N0eCAqY3R4LCBrdm1fcHRlX3Qgbgo+Pj4+PiAgICAgICAg
IHNtcF9zdG9yZV9yZWxlYXNlKGN0eC0+cHRlcCwgbmV3KTsKPj4+Pj4gICAgIH0KPj4+Pj4KPj4+
Pj4gLXN0YXRpYyB2b2lkIHN0YWdlMl9wdXRfcHRlKGNvbnN0IHN0cnVjdCBrdm1fcGd0YWJsZV92
aXNpdF9jdHggKmN0eCwgc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBrdm1fcGd0YWJsZV9tbV9vcHMgKm1tX29wcykKPj4+Pj4gK3N0
cnVjdCBzdGFnZTJfdW5tYXBfZGF0YSB7Cj4+Pj4+ICsgICAgIHN0cnVjdCBrdm1fcGd0YWJsZSAq
cGd0Owo+Pj4+PiArICAgICBib29sIGRlZmVyX3RsYl9mbHVzaF9pbml0Owo+Pj4+PiArfTsKPj4+
Pj4gKwo+Pj4+PiArc3RhdGljIGJvb2wgX19zdGFnZTJfdW5tYXBfZGVmZXJfdGxiX2ZsdXNoKHN0
cnVjdCBrdm1fcGd0YWJsZSAqcGd0KQo+Pj4+PiArewo+Pj4+PiArICAgICAvKgo+Pj4+PiArICAg
ICAgKiBJZiBGRUFUX1RMQklSQU5HRSBpcyBpbXBsZW1lbnRlZCwgZGVmZXIgdGhlIGluZGl2aWR1
YWwKPj4+Pj4gKyAgICAgICogVExCIGludmFsaWRhdGlvbnMgdW50aWwgdGhlIGVudGlyZSB3YWxr
IGlzIGZpbmlzaGVkLCBhbmQKPj4+Pj4gKyAgICAgICogdGhlbiB1c2UgdGhlIHJhbmdlLWJhc2Vk
IFRMQkkgaW5zdHJ1Y3Rpb25zIHRvIGRvIHRoZQo+Pj4+PiArICAgICAgKiBpbnZhbGlkYXRpb25z
LiBDb25kaXRpb24gZGVmZXJyZWQgVExCIGludmFsaWRhdGlvbiBvbiB0aGUKPj4+Pj4gKyAgICAg
ICogc3lzdGVtIHN1cHBvcnRpbmcgRldCLCBhcyB0aGUgb3B0aW1pemF0aW9uIGlzIGVudGlyZWx5
Cj4+Pj4+ICsgICAgICAqIHBvaW50bGVzcyB3aGVuIHRoZSB1bm1hcCB3YWxrZXIgbmVlZHMgdG8g
cGVyZm9ybSBDTU9zLgo+Pj4+PiArICAgICAgKi8KPj4+Pj4gKyAgICAgcmV0dXJuIHN5c3RlbV9z
dXBwb3J0c190bGJfcmFuZ2UoKSAmJiBzdGFnZTJfaGFzX2Z3YihwZ3QpOwo+Pj4+PiArfQo+Pj4+
PiArCj4+Pj4+ICtzdGF0aWMgYm9vbCBzdGFnZTJfdW5tYXBfZGVmZXJfdGxiX2ZsdXNoKHN0cnVj
dCBzdGFnZTJfdW5tYXBfZGF0YSAqdW5tYXBfZGF0YSkKPj4+Pj4gK3sKPj4+Pj4gKyAgICAgYm9v
bCBkZWZlcl90bGJfZmx1c2ggPSBfX3N0YWdlMl91bm1hcF9kZWZlcl90bGJfZmx1c2godW5tYXBf
ZGF0YS0+cGd0KTsKPj4+Pj4gKwo+Pj4+PiArICAgICAvKgo+Pj4+PiArICAgICAgKiBTaW5jZSBf
X3N0YWdlMl91bm1hcF9kZWZlcl90bGJfZmx1c2goKSBpcyBiYXNlZCBvbiBhbHRlcm5hdGl2ZQo+
Pj4+PiArICAgICAgKiBwYXRjaGluZyBhbmQgdGhlIFRMQklzJyBvcGVyYXRpb25zIGJlaGF2aW9y
IGRlcGVuZCBvbiB0aGlzLAo+Pj4+PiArICAgICAgKiB0cmFjayBpZiB0aGVyZSdzIGFueSBjaGFu
Z2UgaW4gdGhlIHN0YXRlIGR1cmluZyB0aGUgdW5tYXAgc2VxdWVuY2UuCj4+Pj4+ICsgICAgICAq
Lwo+Pj4+PiArICAgICBXQVJOX09OKHVubWFwX2RhdGEtPmRlZmVyX3RsYl9mbHVzaF9pbml0ICE9
IGRlZmVyX3RsYl9mbHVzaCk7Cj4+Pj4+ICsgICAgIHJldHVybiBkZWZlcl90bGJfZmx1c2g7Cj4+
Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gK3N0YXRpYyB2b2lkIHN0YWdlMl91bm1hcF9wdXRfcHRlKGNv
bnN0IHN0cnVjdCBrdm1fcGd0YWJsZV92aXNpdF9jdHggKmN0eCwKPj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9wZ3RhYmxlX21tX29wcyAqbW1fb3BzKQo+
Pj4+PiAgICAgewo+Pj4+PiArICAgICBzdHJ1Y3Qgc3RhZ2UyX3VubWFwX2RhdGEgKnVubWFwX2Rh
dGEgPSBjdHgtPmFyZzsKPj4+Pj4gKwo+Pj4+PiAgICAgICAgIC8qCj4+Pj4+IC0gICAgICAqIENs
ZWFyIHRoZSBleGlzdGluZyBQVEUsIGFuZCBwZXJmb3JtIGJyZWFrLWJlZm9yZS1tYWtlIHdpdGgK
Pj4+Pj4gLSAgICAgICogVExCIG1haW50ZW5hbmNlIGlmIGl0IHdhcyB2YWxpZC4KPj4+Pj4gKyAg
ICAgICogQ2xlYXIgdGhlIGV4aXN0aW5nIFBURSwgYW5kIHBlcmZvcm0gYnJlYWstYmVmb3JlLW1h
a2UgaWYgaXQgd2FzCj4+Pj4+ICsgICAgICAqIHZhbGlkLiBEZXBlbmRpbmcgb24gdGhlIHN5c3Rl
bSBzdXBwb3J0LCB0aGUgVExCIG1haW50ZW5hbmNlIGZvcgo+Pj4+PiArICAgICAgKiB0aGUgc2Ft
ZSBjYW4gYmUgZGVmZXJyZWQgdW50aWwgdGhlIGVudGlyZSB1bm1hcCBpcyBjb21wbGV0ZWQuCj4+
Pj4+ICAgICAgICAgICovCj4+Pj4+ICAgICAgICAgaWYgKGt2bV9wdGVfdmFsaWQoY3R4LT5vbGQp
KSB7Cj4+Pj4+ICAgICAgICAgICAgICAgICBrdm1fY2xlYXJfcHRlKGN0eC0+cHRlcCk7Cj4+Pj4+
IC0gICAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYSwgbW11
LCBjdHgtPmFkZHIsIGN0eC0+bGV2ZWwpOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgICAgICAgaWYg
KCFzdGFnZTJfdW5tYXBfZGVmZXJfdGxiX2ZsdXNoKHVubWFwX2RhdGEpKQo+Pj4+IFdoeSBub3Qg
ZGlyZWN0bHkgY2hlY2sgKHVubWFwX2RhdGEtPmRlZmVyX3RsYl9mbHVzaF9pbml0KSBoZXJlPwo+
Pj4+Cj4+PiAoUmUtc2VuZGluZyB0aGUgcmVwbHkgYXMgdGhlIHByZXZpb3VzIG9uZSB3YXMgZm9y
bWF0dGVkIGFzIEhUTUwgYW5kCj4+PiB3YXMgYmxvY2tlZCBieSBtYW55IGxpc3RzKQo+Pj4KPj4+
IE5vIHBhcnRpY3VsYXIgcmVhc29uIHBlciBzYXksIGJ1dCBJIHdhcyBqdXN0IGdvaW5nIHdpdGgg
dGhlIGxvZ2ljIG9mCj4+PiBkZXRlcm1pbmluZyBpZiB3ZSBuZWVkIHRvIGRlZmVyIHRoZSBmbHVz
aCBhbmQgdGhlIFdBUk5fT04oKSBwYXJ0cwo+Pj4gc2VwYXJhdGUuCj4+PiBBbnkgYWR2YW50YWdl
IGlmIHdlIGRpcmVjdGx5IGNoZWNrIGluIHN0YWdlMl91bm1hcF9wdXRfcHRlKCkgdGhhdCBJCj4+
PiBtaXNzZWQgb3IgaXMgdGhpcyBwdXJlbHkgZm9yIHJlYWRhYmlsaXR5Pwo+Pgo+PiBIaSBSYWdo
YXZlbmRyYSwKPj4KPj4gSSBqdXN0IHdvbmRlcmluZyBpZiBiZWZvcmUgdGhlIHN0YWdlMiB3YWxr
LCB3ZSB3YW50IHRvIGRlZmVyIHRoZSB0bGIKPj4gZmx1c2gsIGJ1dCBpZiB3aGVuIHdhbGsgdGhl
IHN0YWdlMiwgdGhlIHN0YWdlMl91bm1hcF9kZWZlcl90bGJfZmx1c2goKQo+PiB0cmlnZ2VyIHRo
ZSBXQVJOX09OKCkgYW5kIHJldHVybiBkb24ndCBkZWZlciB0aGUgdGxiIGZsdXNoLCBpdCB3aWxs
Cj4+IGZsdXNoIHRoZSBjdHgtPmFkZHIncyB0bGIuIEJ1dCBiZWZvcmUgdGhlIFdBUk5fT04oKSB0
cmlnZ2VyZWQsIHRoZXNlIHRsYgo+PiB3aWxsIG5vdCBiZSBmbHVzaGVkLCBzaW5jZSB3aGVuIHdh
bGsgc3RhZ2UyIGRvbmUgaW4gdGhlCj4+IGt2bV9wZ3RhYmxlX3N0YWdlMl91bm1hcCgpLCB0aGUg
c3RhZ2UyX3VubWFwX2RlZmVyX3RsYl9mbHVzaCgpIHN0aWxsCj4+IHRyaWdnZXIgdGhlIFdBUk5f
T04oKSBhbmQgZG9uJ3QgdXNlIHRoZSB0bGIgcmFuZ2UtYmFzZWQgZmx1c2guIFRodXMgc29tZQo+
PiBvZiB0aGUgdGxiIGFyZSBub3QgZmx1c2hlZC4KPj4KPiBFeGNlbGxlbnQgcG9pbnQhCj4+IElm
IHdlIGRpcmVjdGx5IGNoZWNrIHRoZSAodW5tYXBfZGF0YS0+ZGVmZXJfdGxiX2ZsdXNoX2luaXQp
LCB0aGlzIGlzbid0Cj4+IGNoYW5nZSBkdXJpbmcgd2Fsa2luZyB0aGUgc3RhZ2UyLCBzbyB0aGUg
V0FSTl9PTigpIHNob3VsZCBvbmx5IHRyaWdnZXIKPj4gaW4ga3ZtX3BndGFibGVfc3RhZ2UyX3Vu
bWFwKCktPnN0YWdlMl91bm1hcF9kZWZlcl90bGJfZmx1c2goKS4KPj4KPj4gSSdtIG5vdCBzdXJl
IGlmIGl0J3MgcmlnaHQgc2luY2UgSSBqdXN0IHRoaW5rIG9uY2Ugd2Ugc2V0IHVwIHVzZSB0aGUK
Pj4gVExCSSByYW5nZS1iYXNlZCBmbHVzaCwgdGhlIHJlc3VsdCBvZiB0aGUKPj4gX19zdGFnZTJf
dW5tYXBfZGVmZXJfdGxiX2ZsdXNoKCkgc2hvdWxkbid0IGNoYW5nZS4gT3RoZXJ3aXNlIHRoZXJl
IG11c3QKPj4gaGF2ZSBzb21lIHN0YWxlIFRMQiBlbnRyeS4KPj4KPiBPbmUgc29sdXRpb24gdGhh
dCBJIGNhbiB0aGluayBvZiBpcywgaWYgdGhlIGNvZGUgdHJpZ2dlcnMgdGhlCj4gV0FSTl9PTigp
LCB3ZSBmbHVzaCB0aGUgZW50aXJlIFZNJ3MgVExCIHVzaW5nCj4ga3ZtX2NhbGxfaHlwKF9fa3Zt
X3RsYl9mbHVzaF92bWlkKSBhZnRlciB0aGUgZW50aXJlIHdhbGsgaXMgZmluaXNoZWQuCj4gSW4g
dGhpcyBzcGVjaWFsL3JhcmUgc2l0dWF0aW9uLCBpdCdsbCBiZSBhIGxpdHRsZSBleHBlbnNpdmUs
IGJ1dCB3ZQo+IHdpbGwgYXQgbGVhc3QgYmUgY29ycmVjdCwgbGVhdmluZyBubyBzdGFsZSBUTEJz
IGJlaGluZC4gV0RZVD8KPiAKCkkgdGhpbmsgaXQgd2lsbCBiZSBnb29kIHRvIGhhdmUgdGhpcyBo
YW5kbGluZy4KClRoYW5rcywKU2hhb3FpbgoKPiBUaGFuayB5b3UuCj4gUmFnaGF2ZW5kcmEKPj4g
VGhhbmtzLAo+PiBTaGFvcWluCj4+Cj4+Pgo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAga3Zt
X2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYSwgbW11LAo+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+YWRkciwgY3R4LT5sZXZlbCk7Cj4+Pj4g
U21hbGwgaW5kZW50IGhpbnQuIFRoZSBjdHgtPmFkZHIgY2FuIGFsaWduIHdpdGggX19rdm1fdGxi
X2ZsdXNoX3ZtaWRfaXBhLgo+Pj4+Cj4+PiBBaCwgeWVzLiBJJ2xsIGFkanVzdCB0aGlzIGlmIEkg
c2VuZCBvdXQgYSB2OC4KPj4+Cj4+PiBUaGFuayB5b3UuCj4+PiBSYWdoYXZlbmRyYQo+Pj4+IFRo
YW5rcywKPj4+PiBTaGFvcWluCj4+Pj4+ICAgICAgICAgfQo+Pj4+Pgo+Pj4+PiAgICAgICAgIG1t
X29wcy0+cHV0X3BhZ2UoY3R4LT5wdGVwKTsKPj4+Pj4gQEAgLTEwNzAsNyArMTEwOCw4IEBAIGlu
dCBrdm1fcGd0YWJsZV9zdGFnZTJfc2V0X293bmVyKHN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0LCB1
NjQgYWRkciwgdTY0IHNpemUsCj4+Pj4+ICAgICBzdGF0aWMgaW50IHN0YWdlMl91bm1hcF93YWxr
ZXIoY29uc3Qgc3RydWN0IGt2bV9wZ3RhYmxlX3Zpc2l0X2N0eCAqY3R4LAo+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBrdm1fcGd0YWJsZV93YWxrX2ZsYWdzIHZpc2l0
KQo+Pj4+PiAgICAgewo+Pj4+PiAtICAgICBzdHJ1Y3Qga3ZtX3BndGFibGUgKnBndCA9IGN0eC0+
YXJnOwo+Pj4+PiArICAgICBzdHJ1Y3Qgc3RhZ2UyX3VubWFwX2RhdGEgKnVubWFwX2RhdGEgPSBj
dHgtPmFyZzsKPj4+Pj4gKyAgICAgc3RydWN0IGt2bV9wZ3RhYmxlICpwZ3QgPSB1bm1hcF9kYXRh
LT5wZ3Q7Cj4+Pj4+ICAgICAgICAgc3RydWN0IGt2bV9zMl9tbXUgKm1tdSA9IHBndC0+bW11Owo+
Pj4+PiAgICAgICAgIHN0cnVjdCBrdm1fcGd0YWJsZV9tbV9vcHMgKm1tX29wcyA9IGN0eC0+bW1f
b3BzOwo+Pj4+PiAgICAgICAgIGt2bV9wdGVfdCAqY2hpbGRwID0gTlVMTDsKPj4+Pj4gQEAgLTEw
OTgsNyArMTEzNyw3IEBAIHN0YXRpYyBpbnQgc3RhZ2UyX3VubWFwX3dhbGtlcihjb25zdCBzdHJ1
Y3Qga3ZtX3BndGFibGVfdmlzaXRfY3R4ICpjdHgsCj4+Pj4+ICAgICAgICAgICogYmxvY2sgZW50
cnkgYW5kIHJlbHkgb24gdGhlIHJlbWFpbmluZyBwb3J0aW9ucyBiZWluZyBmYXVsdGVkCj4+Pj4+
ICAgICAgICAgICogYmFjayBsYXppbHkuCj4+Pj4+ICAgICAgICAgICovCj4+Pj4+IC0gICAgIHN0
YWdlMl9wdXRfcHRlKGN0eCwgbW11LCBtbV9vcHMpOwo+Pj4+PiArICAgICBzdGFnZTJfdW5tYXBf
cHV0X3B0ZShjdHgsIG1tdSwgbW1fb3BzKTsKPj4+Pj4KPj4+Pj4gICAgICAgICBpZiAobmVlZF9m
bHVzaCAmJiBtbV9vcHMtPmRjYWNoZV9jbGVhbl9pbnZhbF9wb2MpCj4+Pj4+ICAgICAgICAgICAg
ICAgICBtbV9vcHMtPmRjYWNoZV9jbGVhbl9pbnZhbF9wb2Moa3ZtX3B0ZV9mb2xsb3coY3R4LT5v
bGQsIG1tX29wcyksCj4+Pj4+IEBAIC0xMTEyLDEzICsxMTUxLDIzIEBAIHN0YXRpYyBpbnQgc3Rh
Z2UyX3VubWFwX3dhbGtlcihjb25zdCBzdHJ1Y3Qga3ZtX3BndGFibGVfdmlzaXRfY3R4ICpjdHgs
Cj4+Pj4+Cj4+Pj4+ICAgICBpbnQga3ZtX3BndGFibGVfc3RhZ2UyX3VubWFwKHN0cnVjdCBrdm1f
cGd0YWJsZSAqcGd0LCB1NjQgYWRkciwgdTY0IHNpemUpCj4+Pj4+ICAgICB7Cj4+Pj4+ICsgICAg
IGludCByZXQ7Cj4+Pj4+ICsgICAgIHN0cnVjdCBzdGFnZTJfdW5tYXBfZGF0YSB1bm1hcF9kYXRh
ID0gewo+Pj4+PiArICAgICAgICAgICAgIC5wZ3QgPSBwZ3QsCj4+Pj4+ICsgICAgICAgICAgICAg
LmRlZmVyX3RsYl9mbHVzaF9pbml0ID0gX19zdGFnZTJfdW5tYXBfZGVmZXJfdGxiX2ZsdXNoKHBn
dCksCj4+Pj4+ICsgICAgIH07Cj4+Pj4+ICAgICAgICAgc3RydWN0IGt2bV9wZ3RhYmxlX3dhbGtl
ciB3YWxrZXIgPSB7Cj4+Pj4+ICAgICAgICAgICAgICAgICAuY2IgICAgID0gc3RhZ2UyX3VubWFw
X3dhbGtlciwKPj4+Pj4gLSAgICAgICAgICAgICAuYXJnICAgID0gcGd0LAo+Pj4+PiArICAgICAg
ICAgICAgIC5hcmcgICAgPSAmdW5tYXBfZGF0YSwKPj4+Pj4gICAgICAgICAgICAgICAgIC5mbGFn
cyAgPSBLVk1fUEdUQUJMRV9XQUxLX0xFQUYgfCBLVk1fUEdUQUJMRV9XQUxLX1RBQkxFX1BPU1Qs
Cj4+Pj4+ICAgICAgICAgfTsKPj4+Pj4KPj4+Pj4gLSAgICAgcmV0dXJuIGt2bV9wZ3RhYmxlX3dh
bGsocGd0LCBhZGRyLCBzaXplLCAmd2Fsa2VyKTsKPj4+Pj4gKyAgICAgcmV0ID0ga3ZtX3BndGFi
bGVfd2FsayhwZ3QsIGFkZHIsIHNpemUsICZ3YWxrZXIpOwo+Pj4+PiArICAgICBpZiAoc3RhZ2Uy
X3VubWFwX2RlZmVyX3RsYl9mbHVzaCgmdW5tYXBfZGF0YSkpCj4+Pj4+ICsgICAgICAgICAgICAg
LyogUGVyZm9ybSB0aGUgZGVmZXJyZWQgVExCIGludmFsaWRhdGlvbnMgKi8KPj4+Pj4gKyAgICAg
ICAgICAgICBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UocGd0LT5tbXUsIGFkZHIsIHNpemUpOwo+
Pj4+PiArCj4+Pj4+ICsgICAgIHJldHVybiByZXQ7Cj4+Pj4+ICAgICB9Cj4+Pj4+Cj4+Pj4+ICAg
ICBzdHJ1Y3Qgc3RhZ2UyX2F0dHJfZGF0YSB7Cj4+Pj4KPj4+PiAtLQo+Pj4+IFNoYW9xaW4KPj4+
Pgo+Pj4KPj4KPj4gLS0KPj4gU2hhb3Fpbgo+Pgo+IAoKLS0gClNoYW9xaW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
