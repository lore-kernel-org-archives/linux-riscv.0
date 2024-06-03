Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5406EC25B78
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 23:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dg6Q26slwZY5XwUEaLUQJPBWavEk997J4aiCm8Mbg3w=; b=uoEd0t5DFGYABe8vyGKD/Jsq8n
	CR1mJuRaC3mU01PM4Hkdgf3ry+1i2e8CjrO3ZPI5TPGCERwfvrdVKS4pdJZyS7xFP64Tt8NGBXwhC
	omDWRnbsPlQ24GN/uD5HYLV1rY0kLtlRYjS8Sa6XJcry7QCASvvq5yIeEOFoG88KV8eETpLigYLDy
	P2nCXmIaDZSmLiuoSBNai8zh8CqHiYgUFY8LDOWy2y2EsYdG4jFTk6XKk/Q+QIV+196yV+7Gy0F2w
	V5z8fAciVU+7liBK0mMNjdUNEwrU8httRNm+ppp6i3LV/wKleldljQxa3D3vlyl6qtGk+ZUCK/Q0j
	L+P2uivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGi1-00000000ZiD-2fYE;
	Mon, 03 Jun 2024 23:03:21 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGhw-00000000ZbY-07NP
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 23:03:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f6174d0421so19615475ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 16:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717455787; x=1718060587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0SJTxFtK/1G56YdHzcPYdHV7zjy1ZVa0L4hU78kSrI=;
        b=IVSkrx2SVLgc6N/ZyTV8E9DWpjYxSsSk0dfu+0sxPTtR3B+Y9Myk1iB/OI1cNb6PjJ
         xPubOkfyVVR+qbicp2q/PDhTKXUa0cgSxpBAhvhe1Q/hctwm5vCXjkTsBGnrMzD1/ddp
         pHlsBEyXR331MV34eFEx5r/xZzhITwDmBUnQeiW3qUtdomJRx8PVLCH7upG6z7JvMkM6
         NxJfl/C1wti4At/owVm3LPP80JZL3F3pHbvbGK4N/JOkn7rulphO0IwyF585V0SKdiIb
         Q/JidIvlkv320B+DdaLAhT+Scm/ECUzBDJnxhXQRZKMJrTvahAsiZvowCVA7uAJPEXvd
         RNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455788; x=1718060588;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w0SJTxFtK/1G56YdHzcPYdHV7zjy1ZVa0L4hU78kSrI=;
        b=QyZx7alHjDNK38fT5IbyVu3jM0QJ/PuGYv06QzWPZstQ8kRNT3lrqtC++mKTb/2HE0
         UrWCZXIdcbGgeygKMMhDG7E8LREClWMhQVGdf9KolXJBjLkhFHRULKhXMlCd8+MnMXsH
         o5Ad3nm1eWXdfnnOw0n/1h/lUaCTM+Gkkv4Pp3m0btZoYrx7BL6Cf9w1ZB+wt9/MC5eN
         7PZxIUru41gdJKMzgdetkfekQfxwtbIwTIxZ3ckqzrw0MYACnjOM2RBO7mDc3pih2DiB
         kXVNmAxo7JX2CAS5KaNwEIiBzqwUkddn9Pxk/eeLSEYXtVK6+ilHuBM/xatMdu9+MLP9
         KOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0oKy2z6LZmrDNi0pp8/hk+y3jPnqS57Oz+VRO7FpWf8bzrW9BOBsaGCdwtFT2Y4Yq13beHFjpYsbUrdSbISg9SPXVVqfAJ+Cvl9Va5kms
X-Gm-Message-State: AOJu0YyZawVyHfPU2MD+IrA1rrJp8L1v7++iIKVj16P4310pUxXMC2Ne
	UKFtOCEaRe6S5XTWZrti631tAtoRusZQ8QhfolxgBuu9/VF7iaFXsFZoKCUa87Ky2eYLTfCW4Ik
	LQg==
X-Google-Smtp-Source: AGHT+IH9puzU5V8aMTwgzoabUylaHv5IhJEL6Kgk0jFfHrRaPIZ6XCL4YZWlIMRWpWZxlsRoR1ZSqKiiwm0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea05:b0:1f6:3891:794a with SMTP id
 d9443c01a7336-1f638917b67mr7110545ad.10.1717455787406; Mon, 03 Jun 2024
 16:03:07 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:03:05 -0700
In-Reply-To: <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com> <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
Message-ID: <Zl5LqcusZ88QOGQY@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_160316_096565_00DBD78B 
X-CRM114-Status: GOOD (  32.02  )
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

T24gTW9uLCBKdW4gMDMsIDIwMjQsIEphbWVzIEhvdWdodG9uIHdyb3RlOgo+IE9uIFRodSwgTWF5
IDMwLCAyMDI0IGF0IDExOjA24oCvUE0gWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+IHdyb3Rl
Ogo+ID4gV2hhdCBJIGRvbid0IHRoaW5rIGlzIGFjY2VwdGFibGUgaXMgc2ltcGxpZnlpbmcgdGhv
c2Ugb3B0aW1pemF0aW9ucwo+ID4gb3V0IHdpdGhvdXQgZG9jdW1lbnRpbmcgeW91ciBqdXN0aWZp
Y2F0aW9ucyAoSSB3b3VsZCBldmVuIGNhbGwgaXQgYQo+ID4gZGVzaWduIGNoYW5nZSwgcmF0aGVy
IHRoYW4gc2ltcGxpZmljYXRpb24sIGZyb20gdjMgdG8gdjQpLgo+IAo+IEknbGwgcHV0IGJhY2sg
c29tZXRoaW5nIHNpbWlsYXIgdG8gd2hhdCB5b3UgaGFkIGJlZm9yZSAobGlrZSBhCj4gdGVzdF9j
bGVhcl95b3VuZygpIHdpdGggYSAiZmFzdCIgcGFyYW1ldGVyIGluc3RlYWQgb2YgImJpdG1hcCIp
LiBJCj4gbGlrZSB0aGUgaWRlYSBvZiBoYXZpbmcgYSBuZXcgbW11IG5vdGlmaWVyLCBsaWtlCj4g
ZmFzdF90ZXN0X2NsZWFyX3lvdW5nKCksIHdoaWxlIGxlYXZpbmcgdGVzdF95b3VuZygpIGFuZCBj
bGVhcl95b3VuZygpCj4gdW5jaGFuZ2VkICh3aGVyZSAiZmFzdCIgbWVhbnMgInByaW9yaXRpemUg
c3BlZWQgb3ZlciBhY2N1cmFjeSIpLgoKVGhvc2UgdHdvIHN0YXRlbWVudHMgYXJlIGNvbnRyYWRp
Y3RpbmcgZWFjaCBvdGhlciwgYXJlbid0IHRoZXk/ICBBbnl3YXlzLCBJIHZvdGUKZm9yIGEgImZh
c3Qgb25seSIgdmFyaWFudCwgZS5nLiB0ZXN0X2NsZWFyX3lvdW5nX2Zhc3Rfb25seSgpIG9yIHNv
LiAgZ3VwKCkgaGFzCmFscmVhZHkgZXN0YWJsaXNoZWQgdGhhdCB0ZXJtaW5vbG9neSBpbiBtbS8s
IHNvIGhvcGVmdWxseSBpdCB3b3VsZCBiZSBmYW1pbGlhcgp0byByZWFkZXJzLiAgV2UgY291bGQg
cGFzcyBhIHBhcmFtLCBidXQgdGhlbiB0aGUgTUdMUlUgY29kZSB3b3VsZCBsaWtlbHkgZW5kIHVw
CmRvaW5nIGEgYnVuY2ggb2YgdXNlbGVzcyBpbmRpcmVjdCBjYWxscyBpbnRvIHNlY29uZGFyeSBN
TVVzLCB3aGVyZWFzIGEgZGVkaWNhdGVkCmhvb2sgYWxsb3dzIGltcGxlbWVudGF0aW9ucyB0byBu
dWxsaWZ5IHRoZSBwb2ludGVyIGlmIHRoZSBBUEkgaXNuJ3Qgc3VwcG9ydGVkCmZvciB3aGF0ZXZl
ciByZWFzb24uCgpBbmQgcHVsbGluZyBpbiBPbGl2ZXIncyBjb21tZW50cyBhYm91dCBsb2NraW5n
LCBJIHRoaW5rIGl0J3MgaW1wb3J0YW50IHRoYXQgdGhlCm1tdV9ub3RpZmllciBBUEkgZXhwcmVz
cyBpdCdzIHJlcXVpcmVtZW50IHRoYXQgdGhlIG9wZXJhdGlvbiBiZSAiZmFzdCIsIG5vdCB0aGF0
Cml0IGJlIGxvY2tsZXNzLiAgRS5nLiBpZiBhIHNlY29uZGFyeSBNTVUgY2FuIGd1YXJhbnRlZSB0
aGF0IGEgbG9jayB3aWxsIGJlCmNvbnRlbnRlZCBvbmx5IGluIHJhcmUsIHNsb3cgY2FzZXMsIHRo
ZW4gdGFraW5nIGEgbG9jayBpcyBhLW9rLiAgT3IgYSBzZWNvbmRhcnkKTU1VIGNvdWxkIGRvIHRy
eS1sb2NrIGFuZCBiYWlsIGlmIHRoZSBsb2NrIGlzIGNvbnRlbmRlZC4KClRoYXQgd2F5IEtWTSBj
YW4gaG9ub3IgdGhlIGludGVudCBvZiB0aGUgQVBJIHdpdGggYW4gaW1wbGVtZW50YXRpb24gdGhh
dCB3b3JrcwpiZXN0IGZvciBLVk0gX2FuZF8gZm9yIE1HUkxVLiAgSSdtIHN1cmUgdGhlcmUgd2ls
bCBiZSBmdXR1cmUgYWRqdXN0bWVudHMgYW5kIGZpeGVzLApidXQgdGhhdCdzIGp1c3QgbW9yZSBt
b3RpdmF0aW9uIGZvciB1c2luZyBzb21ldGhpbmcgbGlrZSAiZmFzdCBvbmx5IiBpbnN0ZWFkIG9m
CiJsb2NrbGVzcyIuCgo+ID4gPiBJIG1hZGUgdGhpcyBsb2dpYyBjaGFuZ2UgYXMgcGFydCBvZiBy
ZW1vdmluZyBiYXRjaGluZy4KPiA+ID4KPiA+ID4gSSdkIHJlYWxseSBhcHByZWNpYXRlIGd1aWRh
bmNlIG9uIHdoYXQgdGhlIGNvcnJlY3QgdGhpbmcgdG8gZG8gaXMuCj4gPiA+Cj4gPiA+IEluIG15
IG1pbmQsIHdoYXQgd291bGQgd29yayBncmVhdCBpczogYnkgZGVmYXVsdCwgZG8gYWdpbmcgZXhh
Y3RseQo+ID4gPiB3aGVuIEtWTSBjYW4gZG8gaXQgbG9ja2xlc3NseSwgYW5kIHRoZW4gaGF2ZSBh
IEtjb25maWcgdG8gYWx3YXlzIGhhdmUKPiA+ID4gTUdMUlUgdG8gZG8gYWdpbmcgd2l0aCBLVk0g
aWYgYSB1c2VyIHJlYWxseSBjYXJlcyBhYm91dCBwcm9hY3RpdmUKPiA+ID4gcmVjbGFpbSAod2hl
biB0aGUgZmVhdHVyZSBiaXQgaXMgc2V0KS4gVGhlIHNlbGZ0ZXN0IGNhbiBjaGVjayB0aGUKPiA+
ID4gS2NvbmZpZyArIGZlYXR1cmUgYml0IHRvIGtub3cgZm9yIHN1cmUgaWYgYWdpbmcgd2lsbCBi
ZSBkb25lLgo+ID4KPiA+IEkgc3RpbGwgZG9uJ3Qgc2VlIGhvdyB0aGF0IEtjb25maWcgaGVscHMu
IE9yIHdoeSB0aGUgbmV3IHN0YXRpYyBicmFuY2gKPiA+IGlzbid0IGVub3VnaD8KPiAKPiBXaXRo
b3V0IGEgc3BlY2lhbCBLY29uZmlnLCB0aGUgZmVhdHVyZSBiaXQganVzdCB0ZWxscyB1cyB0aGF0
IGFnaW5nCj4gd2l0aCBLVk0gaXMgcG9zc2libGUsIG5vdCB0aGF0IGl0IHdpbGwgbmVjZXNzYXJp
bHkgYmUgZG9uZS4gRm9yIHRoZQo+IHNlbGYtdGVzdCwgaXQnZCBiZSBnb29kIHRvIGtub3cgZXhh
Y3RseSB3aGVuIGFnaW5nIGlzIGJlaW5nIGRvbmUgb3IKPiBub3QsIHNvIGhhdmluZyBhIEtjb25m
aWcgbGlrZSBMUlVfR0VOX0FMV0FZU19XQUxLX1NFQ09OREFSWV9NTVUgd291bGQKPiBoZWxwIG1h
a2UgdGhlIHNlbGYtdGVzdCBzZXQgdGhlIHJpZ2h0IGV4cGVjdGF0aW9ucyBmb3IgYWdpbmcuCj4g
Cj4gVGhlIEtjb25maWcgd291bGQgYWxzbyBhbGxvdyBhIHVzZXIgdG8ga25vdyB0aGF0LCBubyBt
YXR0ZXIgd2hhdCwKPiB3ZSdyZSBnb2luZyB0byBnZXQgY29ycmVjdCBhZ2UgZGF0YSBmb3IgVk1z
LCBldmVuIGlmLCBzYXksIHdlJ3JlIHVzaW5nCj4gdGhlIHNoYWRvdyBNTVUuCgpIZWgsIHVubGVz
cyBLVk0gZmx1c2hlcywgeW91IHdvbid0IGdldCAiY29ycmVjdCIgYWdlIGRhdGEuCgo+IFRoaXMg
aXMgc29tZXdoYXQgaW1wb3J0YW50IGZvciBtZS9Hb29nbGUgQ2xvdWQuIElzIHRoYXQgcmVhc29u
YWJsZT8gTWF5YmUKPiB0aGVyZSdzIGEgYmV0dGVyIHNvbHV0aW9uLgoKSG1tLCBubz8gIFRoZXJl
J3Mgbm8gcmVhc29uIHRvIHVzZSBhIEtjb25maWcsIGUuZy4gaWYgd2UgX3JlYWxseV8gd2FudCB0
byBwcmlvcml0aXplCmFjY3VyYWN5IG92ZXIgc3BlZWQsIHRoZW4gYSBLVk0gKHg4Nj8pIG1vZHVs
ZSBwYXJhbSB0byBoYXZlIEtWTSB3YWxrIG5lc3RlZCBURFAKcGFnZSB0YWJsZXMgd291bGQgZ2l2
ZSB1cyB3aGF0IHdlIHdhbnQuCgpCdXQgYmVmb3JlIHdlIGRvIHRoYXQsIEkgdGhpbmsgd2UgbmVl
ZCB0byBwZXJmb3JtIGR1ZSBkaWxlZ2VuY2UgKG9yIHByb3ZpZGUgZGF0YSkKc2hvd2luZyB0aGF0
IGhhdmluZyBLVk0gdGFrZSBtbXVfbG9jayBmb3Igd3JpdGUgaW4gdGhlICJmYXN0IG9ubHkiIEFQ
SSBwcm92aWRlcwpiZXR0ZXIgdG90YWwgYmVoYXZpb3IuICBJLmUuIHRoYXQgdGhlIGFkZGl0aW9u
YWwgYWNjdXJhY3kgaXMgaW5kZWVkIHdvcnRoIHRoZSBjb3N0LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
