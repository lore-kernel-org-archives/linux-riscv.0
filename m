Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 22:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVelkxdCo+4wwWDdIJ6/4Hwinh+DyWnhaSKCPBd70yw=; b=WnAKLzgchOKZLU
	y4QIvGWb5tDjD9agxPHWk5t58uP004dyEEG9TAFZG4VTFH4ioFq+GAoBpoSoz1J8L8MV1GZLryTc5
	TXKQcBSAq3D/EemNwgwphpL1UxkmsJ4Zl1m4TsylGRbeaoUmEPgqgZ6Q0xZr51RM02vG8SKKyfKiV
	tdNDLUlVHHXDFmGMEmc1LHIOATKRmRQlmoLOYCKeqoRocLJOzxzb3qZW8Ry1MWZifjcpjwgfb3S1I
	R8U6x9QWPXvpeaVK5PxpS62zZFQpKuoOjfaaz38Mb4zN7ALYf3tk4k7doTn3ftMIKZ6ui/6BeNQIy
	qrLcfGNT9upqkU+QnKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxxPG-006Fvq-2k;
	Tue, 31 Oct 2023 22:40:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxxPD-006Fto-1V
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 22:40:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40838915cecso47855765e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 15:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698792013; x=1699396813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJWbuo+9TPVToDVPf96jeRxWUliwPBKXtZxQViTwJnU=;
        b=v/81C5A6a2IA4ZW6Iv542EJeTiwqynj7UMXf4sqRO04QZ6MxNQ1iKsfWP+4KSZVm+U
         Gicdma8duSPqMsf/GflEfvgkc17QH0f5AbiMpqzPIK8AsnxdaIO5MdT1v5HdVNgHjfq5
         aqMfNBFOA8zEQEAXSA28CUVk6v9fjzVyXr2oG5BU4S7hpnMHepo9s0aRzKP/WfUFKIIV
         VNa5C8hjBuWDigtGznOoEGKkw2KH5Xtpsi1acj8x3kxHrArl35W9UIdowiG8w18oM7Pt
         qlL4HiBjd5MuiVcOd0M3broIbkpOJFHVDe0U4VVsTSEdJGyP2ba6cN/JX+dMI93auWoK
         H15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698792013; x=1699396813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJWbuo+9TPVToDVPf96jeRxWUliwPBKXtZxQViTwJnU=;
        b=XkYuLfK4cWkK+1xHwSSsznAZwDDZn00+WNbGAQtN+Z20lUiNtI4iJkKPsOgvmqTmP2
         BXICO3y/Dq7Vjah2FgPux+qX0i1L6+/TJl7WmRFqME8gprl1IZiduY6O4k4lVpvrDubw
         dMMshQ4LLopiCmM5ujldDFrHuoig247wZvzwraWA37XY21m24FJhwlnTUhRWT/kGckN+
         AZiGnCnXVVofTlEF8u6LTESaIQTq8YJR2lCSIVZXpRepp5LLhpd/V0hFRXEE+seZwauv
         l7KxZJzuXSCv066ZUye0VsJZ+Uz8BfizEdakN/hiAiWPlq3zd6S3NRZio4i1EBRplJFp
         8pPQ==
X-Gm-Message-State: AOJu0YzEJx4wUHhoTt9S0UWobQu7kJjQ6dcpghMh3tPW5mxDaAzN92Fx
	4yoSFuvNl6/KfVcBYYYFOmlxgILJsPK8HPRr5Qds+A==
X-Google-Smtp-Source: AGHT+IHkDiPkYLUipg1BNgD620eOceDAkQD+A32NnZclx+AVnVsN45AUMqsjx/qUof6Oj5kTmFWO4hEnjV9b1jDP2pc=
X-Received: by 2002:adf:d1ef:0:b0:32f:7db1:22fb with SMTP id
 g15-20020adfd1ef000000b0032f7db122fbmr8716023wrd.28.1698792012937; Tue, 31
 Oct 2023 15:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
In-Reply-To: <ZUFzZf-YmCRYP6qo@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 31 Oct 2023 15:39:42 -0700
Message-ID: <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_154015_505426_F0ECB6E0 
X-CRM114-Status: GOOD (  14.07  )
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

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMjozNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiBPbiBUdWUsIE9jdCAzMSwgMjAyMywgRGF2aWQgTWF0
bGFjayB3cm90ZToKPiA+IE9uIDIwMjMtMTAtMjcgMTE6MjEgQU0sIFNlYW4gQ2hyaXN0b3BoZXJz
b24gd3JvdGU6Cj4gPiA+IEludHJvZHVjZSBhbiBpb2N0bCgpLCBLVk1fQ1JFQVRFX0dVRVNUX01F
TUZELCB0byBhbGxvdyBjcmVhdGluZyBmaWxlLWJhc2VkCj4gPiA+IG1lbW9yeSB0aGF0IGlzIHRp
ZWQgdG8gYSBzcGVjaWZpYyBLVk0gdmlydHVhbCBtYWNoaW5lIGFuZCB3aG9zZSBwcmltYXJ5Cj4g
PiA+IHB1cnBvc2UgaXMgdG8gc2VydmUgZ3Vlc3QgbWVtb3J5Lgo+Cj4gPiBNYXliZSBjYW4geW91
IHNrZXRjaCBvdXQgaG93IHlvdSBzZWUgdGhpcyBwcm9wb3NhbCBiZWluZyBleHRlbnNpYmxlIHRv
Cj4gPiB1c2luZyBndWVzdF9tZW1mZCBmb3Igc2hhcmVkIG1hcHBpbmdzPwo+Cj4gRm9yIGluLXBs
YWNlIGNvbnZlcnNpb25zLCBlLmcuIHBLVk0sIG5vIGFkZGl0aW9uYWwgZ3Vlc3RfbWVtZmQgaXMg
bmVlZGVkLiAgV2hhdCdzCj4gbWlzc2luZyB0aGVyZSBpcyB0aGUgYWJpbGl0eSB0byAoc2FmZWx5
KSBtbWFwKCkgZ3Vlc3RfbWVtZmQsIGUuZy4gS1ZNIG5lZWRzIHRvCj4gZW5zdXJlIHRoZXJlIGFy
ZSBubyBvdXRzdGFuZGluZyByZWZlcmVuY2VzIHdoZW4gY29udmVydGluZyBiYWNrIHRvIHByaXZh
dGUuCj4KPiBGb3IgVERYL1NOUCwgYXNzdW1pbmcgd2UgZG9uJ3QgZmluZCBhIHBlcmZvcm1hbnQg
YW5kIHJvYnVzdCB3YXkgdG8gZG8gaW4tcGxhY2UKPiBjb252ZXJzaW9ucywgYSBzZWNvbmQgZmQr
b2Zmc2V0IHBhaXIgd291bGQgYmUgbmVlZGVkLgoKSXMgdGhlcmUgYSB3YXkgdG8gc3VwcG9ydCBu
b24taW4tcGxhY2UgY29udmVyc2lvbnMgd2l0aGluIGEgc2luZ2xlIGd1ZXN0X21lbWZkPwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
