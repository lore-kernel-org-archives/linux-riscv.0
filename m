Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F57C982D3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1qLm2chZh3l4YX5fls9eJ9oKoINyquuzqUM0GFoMXx0=; b=hedXf265AJneZ2gTNSLcKQhZRa
	wbzM6HmFHnzkt37vklnsIKbBOeI6W2arTtmy4ZlU/UPh5834LGrUTr3q/iuHNEZpWJFACM3h/RZ2h
	gNcq0jzK6rBSlEtF9qCaVL/MjwP0iYIAz+oUHVu2Ik3j1OPwx3UMuuaqbr/U2KTLQ1Xp6ZoK0mi2r
	SmUzfWbnc+6Yruo7ufGSsqfVUmnQIz+z8JS8b53seSpPzB809oSZHp3vploPl/XZWhyT3UDvyyMHF
	yIZ8lV73zxp4D0iV+QFRFcpB/MQpgykxgpz2ET8cOt2UarvSzLpcg9iAWDU2Svh09Dy3YNRxmyffM
	Zq32ubnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglwi-0000000ENrG-1B67;
	Fri, 16 Jan 2026 15:41:08 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglwf-0000000ENqG-429f
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 15:41:07 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a0c495fc7aso21173555ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768578064; x=1769182864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbz4P0q8LjyF0OVI7OVejj9Lnkf5fBOIA9+hzT8ibrU=;
        b=d+7mLlQyVBwwg0CXl2ldhK52c0PE/1ko7G9sJ+a8xv8NepHCetzxKGyXZxAR5J5525
         GsAlbfn7/N13APdgEu6W1wjTK0+Mc39jGTHW6fEN4evxROPS3oj47wc3soNwLbpwOVaK
         WzSUSwFBvizjA1VESD/t78ELkSET7cKz6YggLSsrVdxsIHv5O40UFA5fzu0le0EBBO+r
         9IhPDFqJIrlSYan8kSPX04OMISLWIMD1l+CqzWFrfEmV7fhNmzZi24PywjdguGP2DG63
         TmOh4B5eVu7SfXHL7PcBm0tsSI5SHl1ApgavjpPWIPMfYD0jjTUxCdqfaDkp4OlznhLY
         rq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578064; x=1769182864;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cbz4P0q8LjyF0OVI7OVejj9Lnkf5fBOIA9+hzT8ibrU=;
        b=pnzQsjqji1XFG61CQL3zfIDZ89W7dWMMWleOzkknTKCRo2NwqgjRTDHqwCTB7A+sEH
         5IQ6S3MJxFMJHKad99O7m0UszIiLXsRWau/N3VVZ4mPSG1ssrnkt7aAOZy0CoRX9psFo
         WjvZO2OiojY3C7iYdgvQLKRA7b3FFU3WEam9JoGxCXIaWigjc3WFWvz1hMaxJch8JY89
         uwT+RFa7Hsu4w9xronSB9OaQP+cco7Airc7SiZII9JOQntqHltWA97vzXq9woB6aXbKb
         wDXHzcACc32FgHSohbpD3ANkWw+tj0mtrMk613UxFWRo4w8KIELwJ5mObhpKyLAASPph
         n/1g==
X-Forwarded-Encrypted: i=1; AJvYcCWzYQGI94E3Ixosf0OXsIE2LLSzmJAu2WgX9j/wCUrcCaUbPCubKNAUmDmbwQzpCoOlS8T6DVXLBhr0Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQuiDrJnR11z1gRWgwDrqb/TC0c6IM8989MOrfcDJIL1o7LzD
	sV6KyVaqF83dy/DarmyJmYFnf4k6f8dmgC5XAKikQ7b0o4lCo8yfRGDTs2zY65R3L+8WbIt1f0Y
	MbwObQQ==
X-Received: from plss10.prod.google.com ([2002:a17:902:c64a:b0:29f:68b:3550])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf07:b0:2a2:bff6:42ef
 with SMTP id d9443c01a7336-2a7174fa860mr37848805ad.7.1768578064299; Fri, 16
 Jan 2026 07:41:04 -0800 (PST)
Date: Fri, 16 Jan 2026 07:41:02 -0800
In-Reply-To: <4781ba9c5d16394cdd785d008cf2a2d81c5cda35.camel@intel.com>
Mime-Version: 1.0
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <208b151b-f458-4327-94bc-eb3f32d20a68@amazon.com> <4781ba9c5d16394cdd785d008cf2a2d81c5cda35.camel@intel.com>
Message-ID: <aWpcDrGVLrZOqdcg@google.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kalyazin@amazon.com" <kalyazin@amazon.com>, "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "david@kernel.org" <david@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "jgross@suse.com" <jgross@suse.com>, "surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "ast@kernel.org" <ast@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "pjw@kernel.org" <pjw@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "peterz@infradead.org" <peterz@infradead.org>, "oupton@kernel.org" <oupton@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "jthoughton@google.com" <jthoughton@google.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, 
 "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, "ackerleytng@google.com" <ackerleytng@google.com>, "jannh@google.com" <jannh@google.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "will@kernel.org" <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_074106_006336_4A703E0B 
X-CRM114-Status: GOOD (  13.48  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYsIFJpY2sgUCBFZGdlY29tYmUgd3JvdGU6Cj4gT24gRnJpLCAy
MDI2LTAxLTE2IGF0IDE1OjAyICswMDAwLCBOaWtpdGEgS2FseWF6aW4gd3JvdGU6Cj4gPiA+IFRE
WCBkb2VzIHNvbWUgY2xlYXJpbmcgYXQgdGhlIGRpcmVjdCBtYXAgbWFwcGluZyBmb3IgcGFnZXMg
dGhhdAo+ID4gPiBjb21lcyBmcm9tIGdtZW0sIHVzaW5nIGEgc3BlY2lhbCBpbnN0cnVjdGlvbi4g
SXQgYWxzbyBkb2VzIHNvbWUKPiA+ID4gY2xmbHVzaGluZyBhdCB0aGUgZGlyZWN0IG1hcCBhZGRy
ZXNzIGZvciB0aGVzZSBwYWdlcy4gU28gSSB0aGluayB3ZQo+ID4gPiBuZWVkIHRvIG1ha2Ugc3Vy
ZSBURHMgZG9uJ3QgcHVsbCBmcm9tIGdtZW0gZmRzIHdpdGggdGhpcyBmbGFnLgo+ID4gCj4gPiBX
b3VsZCB5b3UgYmUgYWJsZSB0byBnaXZlIGEgcG9pbnRlciBvbiBob3cgd2UgY2FuIGRvIHRoYXQ/
wqAgSSdtIG5vdAo+ID4gdmVyeSBmYW1pbGlhciB3aXRoIHRoZSBURFggY29kZS4KPiAKPiBVaGgs
IHRoYXQgaXMgYSBnb29kIHF1ZXN0aW9uLiBMZXQgbWUgdGhpbmsuCgpQYXNzIEBrdm0gdG8ga3Zt
X2FyY2hfZ21lbV9zdXBwb3J0c19ub19kaXJlY3RfbWFwKCkgYW5kIHRoZW4gcmV0dXJuICVmYWxz
ZSBpZgppdCdzIGEgVERYIFZNLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
