Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FF7D2FED1
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 00:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7/oS1yJpP6dt1Cjiocc4KF0xS30vlrQZ4oWPKTVLCh4=; b=fR4jaz78IjKJo1CdBdpkJd+om8
	Ugt8dY0OAgNxzGRSEZOtmDuuit9FHEPIH5ZEjruy+/QtktnzHbttodhBE5TsVALBskusJ1Pu25VML
	Bo7cXibfZbz8sldFRjz5+9DoVCFqobnUeB7QqV9VVo4QyqvayV4S3KeKJtKxnbEIFMkbts629SdTh
	mnVeXJvHHtAaXFMlHnAw0eTMEfHG4sbNhZVdm3lOUIZQLdPOLQvdcvd055qLcDiPcUkL9wdoFU8MU
	3qvJFBFZYElIeR00yO7Wisqynv9TcchAEsm3h43oFSFe/mg2mPck/tT7PoO9BcR7NDPtKyezJLM/K
	4eh6clMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktQl-0000000FCrq-1roS;
	Wed, 28 Jan 2026 00:29:11 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktQi-0000000FCqx-0ifF
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 00:29:09 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso2281620137.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 16:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769560146; cv=none;
        d=google.com; s=arc-20240605;
        b=Q+dmI9L17lfkeYV4TXIQBlz4OQKE92NUM73g2MNqqkAXK0aVJEIxX3/L9JuDJZhB0L
         ia87nBXtlmwahuhy6icX1fGSU/7xETJgIySStCGvFBzBXbEXPKVb1vZBuTN0bvSfHTwr
         0UUkQAPaq7cbkKGvyfSaG19w5kv0WdUPMxN5rX3yMlz2RvjYf9QN/Fh0O99AH35VzDUO
         VaBLjFkDbfnUzg+s9uo/OO7Mvv4IeqBxZzBaGFSRHIBpWpTnpHnjbBovWo3mRVKrhdK7
         CrfbnCRrTWXEX4OaNpfXSWcQjB7ZaIENjQb5BA1RRYbVoG2PDhVJBeU8E//+BI515+MJ
         ovag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=afdfdT2YOMsD0iZJQSrtAQ+axiAIWjxn1C3TT/YCmDM=;
        fh=0TSOZ0mLWLrqJe09Y6O0krrNCOvzp1LB7YUmFJ9dEeY=;
        b=YhTaUwyDdkIcOWYXUA2nrs3pfdTZLo1IUqQOZgSfF5T/TKKkhTQRtMFvGfJ5z/9Mnw
         SxOWmFAtltO/7zT6X8EsO4hRj5v0GrrDglWUgB6C9cCfWzDZk21lHmxX8BR0K+LYFt9Z
         saS0SmfTFUYcVWVrSfWpxwAnUml9auBGIwB7Zgi65AGYGvEUHPRupSoJi+Q5gpNyDYPE
         WP6hNf3kBpVoGMaJqDM0cwzXVvreL/frIn5kgmCvWUhQjZJL4FvMo7IVz7J/QWIF4ecP
         40Fju6ZsCOGnbFCKOqmIJpQv494RA8dFw77d6b75X/o+kuV+YzqUSEMfSe7KrxNV2/D/
         IXKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769560146; x=1770164946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afdfdT2YOMsD0iZJQSrtAQ+axiAIWjxn1C3TT/YCmDM=;
        b=UgOCEBvYYSuSHq327vM8KgXCsow9qAhBCgvOde8nntkLJTfFzNmHhi0F0wWxRcl2V5
         +dooRvufFfq0Vc10GsrYCbQ76AkP9zTq23xJwnCHix35SJKWD/WannqMEkOlmBIIKtnz
         OKfvCmbXYAERhgiNknrW6D6IcGnCpUZM0NBCLQF8WGZ/0voKujxLGX7QCy5b7bXQddFp
         3lH7YfSXTiFk4MYijI3LsNJpTFv/piCW/+1BUNGnl2d4QksgOPGuA/V8FfkaHbfvqeCW
         scqvP6dWH1jpABrP7p8HI0GvP3n7DCO7GcLd7yFZanqAl6vkUBP/a2baMUnt3czNMTZL
         ApCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769560146; x=1770164946;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afdfdT2YOMsD0iZJQSrtAQ+axiAIWjxn1C3TT/YCmDM=;
        b=peC4MnZFIVZ9IJXkeQsLFXiiERszW1Cz+ITI2KtazGDYOcXOtKHGriIs4pzIuAbwsc
         U70Y7+g1otLr/ln155G9LnI7QKh5+0C08InwQwyDjil4SKvQogGN5qmjJ2FkMYzz/cr9
         Qlz5waCNnFdohRJ6QIl4PK6C37XwcSN8DwHNKp/6L/tlQvNyUAODi7m8xtzV9Eccq3sU
         y2GiMJimdYfAnrhPzdAqcdklxuaBXFrOQ0ZvISJIrDxey1YdLjl1aKhPfII63qTq1y8t
         JG35fPawMtR7BNfDaiUO/dlG1fa3zLaUtqcOoDdqXxIn6N0CDPMUWrF42SzREhdvzbG+
         w41w==
X-Forwarded-Encrypted: i=1; AJvYcCWiZH7ebyE5v6yyqhcgQwi8hVEeLstv3nm8Dfkm4gfd7PSqdUjL8IK/WKGxAJKcIbrLHjtoP+KDftpFcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6aTUhWLCmeKe2SJqSos1j85eQtIFuQY0W7j+JI14bgYO/RYA/
	0/bhKB137Qkh7ucBZP0iMlCzy9jejNJBpY2V0zIAj918vehnwyEM5MpkpzWl1fPc4kyfZesaFr8
	J+qY4o4G2/1CZo0PI9vXQK0JJOF4v15wv+vzwvLl3
X-Gm-Gg: AZuq6aLmkNLg1jQ0ab/JbY4bqkWFJLnhMJKSD0ZU/cRWXAtLK5YdSCMSUEhfQZphheu
	ZZqqLEY9bUXQaSx7FPdgjAfTMkQSsX5Cwav+E+Ho4kIRwQ1qGIjpzUiCYAbeQklsnEF2uowoNkX
	HgkfEH5aU/VDQ3aXZ7k1is9foIh3VEHBhV6VT47ukUwa5ZKARTYtGD2ocozcy8NikIVND9AXbRt
	UZBMANi7DSgiBOAir87eOkw+QbTxALG2dgr70KO8q5mqs4zbjyCzrzmGzIXVk+5GcBgfG9COki4
	lWi8I7HurYbLqPIippk4U55kuB+tMP5PCLaU
X-Received: by 2002:a05:6102:94f:b0:5db:cba0:941 with SMTP id
 ada2fe7eead31-5f72380ed5bmr1335024137.38.1769560145803; Tue, 27 Jan 2026
 16:29:05 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 16:29:05 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 16:29:04 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <f4f2a0297e38ac45e4438342ac2c882b91544acb.camel@intel.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
 <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
 <CAEvNRgEbG-RhCTsX1D8a3MgEKN2dfMuKj0tY0MZZioEzjw=4Xw@mail.gmail.com>
 <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
 <CAEvNRgEz0+ic9uvcsWYqWgR5EV=TfY0SAGC39zAL+n19SoBXmw@mail.gmail.com> <f4f2a0297e38ac45e4438342ac2c882b91544acb.camel@intel.com>
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 16:29:04 -0800
X-Gm-Features: AZwV_Qi5-DP-v6wjOnL-aDMsdDCx4XY7-YGdXQ0tP6_jJk0lLjibrIAwkazF3pk
Message-ID: <CAEvNRgHMOWfCRnkx7YJoAzNpBBOHCgvR5GHe66uHJX45WDT-YA@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Annapurve, Vishal" <vannapurve@google.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jgross@suse.com" <jgross@suse.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "pjw@kernel.org" <pjw@kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "luto@kernel.org" <luto@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "jthoughton@google.com" <jthoughton@google.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jannh@google.com" <jannh@google.com>, 
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_162908_235039_F91FE185 
X-CRM114-Status: GOOD (  11.85  )
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

IkVkZ2Vjb21iZSwgUmljayBQIiA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+IHdyaXRlczoK
Cj4gT24gVGh1LCAyMDI2LTAxLTIyIGF0IDE0OjQ3IC0wODAwLCBBY2tlcmxleSBUbmcgd3JvdGU6
Cj4+Cj4+IFRoZXJlJ3Mgbm8gdXNlIGNhc2UgSSBjYW4gdGhpbmsgb2YgZm9yIHVubWFwcGluZyBU
RFggcHJpdmF0ZSBtZW1vcnkKPj4gZnJvbSB0aGUgaG9zdCBkaXJlY3QgbWFwLCBidXQgU2Vhbidz
IHN1Z2dlc3Rpb24KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2FXcGNEckdWTHJaT3Fk
Y2dAZ29vZ2xlLmNvbS/CoHdvbid0IGV2ZW4KPj4gbGV0IHNoYXJlZCBndWVzdF9tZW1mZCBtZW1v
cnkgYmUgdW5tYXBwZWQgZnJvbSB0aGUgZGlyZWN0IG1hcCBmb3IgVERYCj4+IFZNcy4KPgo+IEFo
IQo+Cj4+Cj4+IEFjdHVhbGx5LCBkb2VzIFREWCdzIGNsZmx1c2ggdGhhdCBhc3N1bWVzIHByZXNl
bmNlIGluIHRoZSBkaXJlY3QgbWFwCj4+IGFwcGx5IG9ubHkgZm9yIHByaXZhdGUgcGFnZXMsIG9y
IGFsbCBwYWdlcz8KPj4KPj4gSWYgVERYJ3MgY2xmbHVzaCBvbmx5IGhhcHBlbnMgZm9yIHByaXZh
dGUgcGFnZXMsIHRoZW4gd2UgY291bGQKPj4gcmVzdG9yZSBwcml2YXRlIHBhZ2VzIHRvIHRoZSBk
aXJlY3QgbWFwLCBhbmQgdGhlbiB3ZSdkIGJlIHNhZmUgZXZlbgo+PiBmb3IgVERYPwo+Cj4gWWVz
LCBqdXN0IHByaXZhdGUgcGFnZXMgbmVlZCB0aGUgc3BlY2lhbCB0cmVhdG1lbnQuIEJ1dCBpdCB3
aWxsIGJlIG11Y2gKPiBzaW1wbGVyIHRvIHN0YXJ0IHdpdGgganVzdCBibG9ja2luZyB0aGUgb3B0
aW9uIGZvciBURFguIEEgc2hhcmVkIHBhZ2VzCj4gb25seSBtb2RlIGNvdWxkIGNvbWUgbGF0ZXIu
Cj4KPiBJbiBnZW5lcmFsIEkgdGhpbmsgd2Ugc2hvdWxkIHRyeSB0byBicmVhayB0aGluZ3MgdXAg
bGlrZSB0aGlzIHdoZW4gd2UKPiBjYW4uIEtlcm5lbCBjb2RlIGlzIG5vdCBzZXQgaW4gc3RvbmUs
IG9ubHkgQUJJLiBJIHRoaW5rIGl0IHdpbGwgbGVhZCB0bwo+IG92ZXJhbGwgZmFzdGVyIHVwc3Ry
ZWFtaW5nLCBiZWNhdXNlIHRoZSBzZXJpZXMnIGNhbiBiZSBzaW1wbGVyLgoKSSBhZ3JlZSBvbiBz
cGxpdHRpbmcgdGhlIGZlYXR1cmUgdXAgOiksIGFncmVlIHRoYXQgc2ltcGxlciBzZXJpZXMgYXJl
CmJldHRlci4KClBlcmhhcHMganVzdCBmb3IgbXkgdW5kZXJzdGFuZGluZywKCisgc2hhcmVkIHBh
Z2VzID0+IG5vdCBpbiBkaXJlY3QgbWFwID0+IG5vIFREWCBjbGZsdXNoCisgcHJpdmF0ZSBwYWdl
cyA9PiBhbHdheXMgaW4gZGlyZWN0IG1hcCA9PiBURFggcGVyZm9ybXMgY2xmbHVzaAoKKEkgY291
bGQgcHV0IHBhZ2VzIGJhY2sgaW50byB0aGUgZGlyZWN0IG1hcCB3aGlsZSBkb2luZyBzaGFyZWQg
dG8KcHJpdmF0ZSBjb252ZXJzaW9ucykuCgpJcyBldmVyeXRoaW5nIGdvb2QgdGhlbj8gT3IgZG9l
cyBURFggY29kZSBub3QgYXBwbHkgdGhlIHNwZWNpYWwKdHJlYXRtZW50LCBhcyBpbiBjbGZsdXNo
IG9ubHkgZm9yIHByaXZhdGUgcGFnZXMsIGFzIG9mIG5vdz8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
