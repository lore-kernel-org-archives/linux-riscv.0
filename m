Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5F9EE3F2F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSJbGqApgBedmWpYN1a0y0NygBJFSm9Dv0yqGbbdx5s=; b=jdShZgTmPf7ilD
	AJN3cI2j6T6ZeDnWTYPS6ExkSM+yOdr727uKPIb/9hYj5UHYEZKQBVXVMK7giyUI1TfSnMwnjSomO
	KapNGfFU32ahFnl8YT4D5hHrmC+0PIXcpjyeXVZNBhZBIsf8WY3O2PUNX1wqHhsQS8gCXTIfQH2Mq
	FzwUCuKcZn7iRb3ybt0zApY5cD15710lna9Ju/BM7JB7h4Q+sulGwWH40J46i1BGJdK3nZYq16Z0c
	HPdfMPcSaYqhe1zHXhCtiq1lVQARqGSsI8jFluz+1ZWTljDLZ8L2JFDIiBnhLvLXxPbb0FHsVx79i
	TzSNvFT80lWbBFM5lZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2DH-009thL-2Y;
	Fri, 15 Sep 2023 06:21:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2DF-009tgg-0A;
	Fri, 15 Sep 2023 06:21:58 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so2916908e87.1;
        Thu, 14 Sep 2023 23:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694758912; x=1695363712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CbOaBoTgdqZjkC9bgxngrjMf2gb+bcUOXRH9i9PPC4=;
        b=ahWx5WEQf6IL50xDONL2N0CURn3lt3Y3B8KkpPu5r/np3TOy8YLoEST2megTfgHrES
         ClPWwa/1BUIchq5qRm96AwXZFSid4K57qVrSNzghAmd6N7gIvAWRWq4w+deMUaGvl0/t
         73RbqCw/BAdWWnHpwK62750gh3yM6eyQmCVYqvtldL9CsuFgL2IMwJoBCFpRX/LhQQkn
         36JTQTQrohYCNHBaVB3b9rjMdyJDvMgz0LGw6uEl5EnbObE4IezzKd/mUiYfL/471gKv
         rFzRaoYipOaE4JnGgJ1AdJmtLg0oLs0f4G5Ey5J2Rbf4IBiRF/+sgDq6Ph6YqvgMQJSC
         p21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758912; x=1695363712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CbOaBoTgdqZjkC9bgxngrjMf2gb+bcUOXRH9i9PPC4=;
        b=ajPkhIjlCppHzA2eEiaAWRP13U9j4+D+JRSugPm91hWocDO9QxmDtX/9vmdVx/JzQW
         mNI4co6ZCyA09Au1qcr7go/4DS4vk3tnAMdu7dvuLxTFATdWOv2w9QJW/SC2eZWwClJ+
         iHIK/QmL/zKqELKIIGdeYj48lbb4f1k6anmnHJIVjedX6iyRU5XDrXWXaUtzDr9M3Zqs
         gNEirEXcsRJeLqJpZdlFQMUgnmA55NvJg2jz4yJ0zUSzhDdlccnsWwTvA7woR5fK1g9S
         XxKEj2KHmqDHKFCJw5TZLW/FZAVzVe56taq9FElv4inWYaeBvULQN48x3QhBVtUz3WTe
         e5jQ==
X-Gm-Message-State: AOJu0YznEi8nCnAC2KDW3S0gNG+roHtRLT2jeItr4dc9CB5vdZ6rLyDV
	midG8NUGSWj9y5AGkiMdyFNMmmPy+3EzJf1GX8U=
X-Google-Smtp-Source: AGHT+IFQEpOnX9uf3gdbZsJHudImE7kbvB8OM+rS3Fi4ABBNMgv5QYCfVKA10TAI1f03ryjhcKZYalx2hAKJFWVnvIc=
X-Received: by 2002:a19:6715:0:b0:502:e2be:54b5 with SMTP id
 b21-20020a196715000000b00502e2be54b5mr569046lfc.17.1694758912398; Thu, 14 Sep
 2023 23:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-d2e594e7d84503ad14036e2d@orel>
In-Reply-To: <20230914-d2e594e7d84503ad14036e2d@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:21:41 +0800
Message-ID: <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_232157_113507_6271E8C2 
X-CRM114-Status: GOOD (  12.66  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgNTo1MuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDk6Mzc6
MDNBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBBZGQgYSBLVk0gc2VsZnRlc3RzIHRvIHZh
bGlkYXRlIHRoZSBTc3RjIHRpbWVyIGZ1bmN0aW9uYWxpdHkuCj4gPiBUaGUgdGVzdCB3YXMgcG9y
dGVkIGZyb20gYXJtNjQgYXJjaCB0aW1lciB0ZXN0Lgo+Cj4gSSBqdXN0IHRyaWVkIHRoaXMgdGVz
dCBvdXQuIFJ1bm5pbmcgaXQgb3ZlciBhbmQgb3ZlciBhZ2FpbiBvbiBRRU1VIEkgc2VlCj4gaXQg
d29ya3Mgc29tZXRpbWVzLCBidXQgaXQgZnJlcXVlbnRseSBmYWlscyB3aXRoIHRoZQo+IEdVRVNU
X0FTU0VSVF9FUShjb25maWdfaXRlciArIDEsIGlycV9pdGVyKSBhc3NlcnQgYW5kIGF0IGxlYXN0
IG9uY2UgSQo+IGFsc28gc2F3IHRoZSBfX0dVRVNUX0FTU0VSVCh4Y250ID49IGNtcCkgYXNzZXJ0
Lgo+CgpHb29kIGNhdGNoIQoKSSBjYW4gYWxzbyByZXByb2R1Y2UgdGhpcyBpc3N1ZSBhbmQgaXQg
aXMgYSBjb21tb24gcHJvYmxlbSBmb3IgYm90aAphcm02NCBhbmQgcmlzY3YgYmVjYXVzZSBpdCBh
bHNvIGhhcHBlbnMgaW4gYSBhcm02NCBRZW11IFZNLgoKSXQgc2VlbXMgbGlrZSBhIHN5bmNocm9u
aXphdGlvbiBpc3N1ZSBiZXR3ZWVuIGhvc3QgYW5kIGd1ZXN0IHNoYXJlZAp2YXJpYWJsZXMuIFdp
bGwgZG91YmxlIGNoZWNrIHRoZSB0ZXN0IGNvZGUuCgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
