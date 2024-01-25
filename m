Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFA7C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwmlBxsw863HycCbreNdynL2P/I/d4dDJ4cF0Z64W78=; b=Bx2oRyqQ2h/IdS4A7RgqYnb9Dy
	yOlv1fbM7tHiyWkDF7yKPdp+2y4aOZv2z7x1Zms6CBFvsbheEggdKu+bk9LUzXLOCTuVNLbgMts5Z
	qtsO6R1FLzqxwl8cTg/B8s9zSc6VbLTURvk8ro4McFiaoket6d7co+LIfVJNX+UBsL09Qqpe+0fCu
	XZaJ7WER3O3SF1VCKuXy7nkw1a8bmXCvLQI/p0MseBOBgc9IFvyYuMKaDOR02UTNNyZAPZly6CGA0
	xkEy+9RDps7sp5YKOlL7PL6rqG8qBoJr8+vhca/PYRh0KigXYttLmIRw1m82boDcNp2HL3PPAj7qr
	t4FRCrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3C4-000000013rZ-22PP;
	Thu, 25 Jan 2024 17:07:12 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3C1-000000013q4-192Q
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:07:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ddc1b30458so1704967b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706202427; x=1706807227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Y205/Bj9/UaPGsjWa2kZTirfJ1VaurSr0W2Uv0l3s=;
        b=ko5myZUA7qr5q1aISayRDcGLg9+AEWJ0RlQV3U85FKlokA0aDzWyzWiAiCgJYWOF80
         5g3U6g6Rgm1Ba5/HLkOAH7MnmmPBjVGcTNYg5E0FzVDN32rA9BaX1zZLqzaYAdksSyAM
         HvTCJHG4k2DRVypAGTVvSZga7uYAxNKwmKzcjzLzp/hOSlmBa4+ghOjpNkWJh8f7GKOa
         mm6wwogI3dBE6QRjIFleMYQdex0yBnhvv5ns7aRgMIvHewvI50zSc2/Doi8m/Fw0yNPB
         1CXqjrIBZDvYymFCwwvV1rYgAA68QrgU9ynNRuceBtN5lzX0tE4thI/DMG5EPX9XrVt2
         c3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706202427; x=1706807227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+Y205/Bj9/UaPGsjWa2kZTirfJ1VaurSr0W2Uv0l3s=;
        b=UCQi76HRKpXt621cwScOy0QQtJzjUE4dBnhlnjDbFk3N8RNpmMBDgAYDLztyTgWQFA
         geX/z/G5NE/lIZg5QUE5Te4uc11NHQqzT8Osn0sdJhoKHSeuUQIDD6DE9Dfzj4xiWDrd
         8HNVXSfkNwt1BB2BkQYADvGi+VtXVAjFxj19x4xjo2xBb7ZHRWYnfwsPvB+xU4Vsnt4e
         h4wwkNu+FHu+znFdIlJsMmKewQGNsToXTIxeyx38f97VcdPDJtL1W8ezBupaKddJP1uP
         g/AxAGprYHG8mT5YCrrl01dezJEFZV5EIVp1OJUXRzzsFx7jmJqRMCf1vTL+XPclu7Qg
         AkzA==
X-Gm-Message-State: AOJu0YwlVPMXhHaZoFpEdqdg3TBaXggCzkrBYCqcJCWaX3A1gHCKtvt7
	9Byf9yeQ5ZKX0KZSKbVLdDSovqddEWLvlKwjA7sWlSVx50UFHlH5YVyYigK9eU0=
X-Google-Smtp-Source: AGHT+IHYeX7pTsc6T2+Oj8CHwr5rzy78ADNZC7lkEDYMAD93a3MlR2jkEuTYyjSwB5kHgHqSGlWjog==
X-Received: by 2002:a05:6a00:2b56:b0:6dd:8a23:b2c7 with SMTP id du22-20020a056a002b5600b006dd8a23b2c7mr21796pfb.5.1706202427107;
        Thu, 25 Jan 2024 09:07:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id lc9-20020a056a004f4900b006db105027basm16031068pfb.50.2024.01.25.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 09:07:06 -0800 (PST)
Date: Thu, 25 Jan 2024 09:07:02 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 09/28] mm: abstract shadow stack vma behind
 `arch_is_shadow_stack`
Message-ID: <ZbKVNm5ubV8yQtSE@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-10-debug@rivosinc.com>
 <2f34f6aa-99fa-4545-b706-a1d50864f9e9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f34f6aa-99fa-4545-b706-a1d50864f9e9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_090709_377661_C6323BB1 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 25, 2024 at 09:18:07AM +0100, David Hildenbrand wrote:
>On 25.01.24 07:21, debug@rivosinc.com wrote:
>>From: Deepak Gupta <debug@rivosinc.com>
>>
>>x86 has used VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow
>>stack VMA. VM_SHADOW_STACK is thus not possible on 32bit. Some arches may
>>need a way to encode shadow stack on 32bit and 64bit both and they may
>>encode this information differently in VMAs.
>>
>>This patch changes checks of VM_SHADOW_STACK flag in generic code to call
>>to a function `arch_is_shadow_stack` which will return true if arch
>>supports shadow stack and vma is shadow stack else stub returns false.
>>
>>There was a suggestion to name it as `vma_is_shadow_stack`. I preferred to
>>keep `arch` prefix in there because it's each arch specific.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  include/linux/mm.h | 18 +++++++++++++++++-
>>  mm/gup.c           |  5 +++--
>>  mm/internal.h      |  2 +-
>>  3 files changed, 21 insertions(+), 4 deletions(-)
>>
>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>index dfe0e8118669..15c70fc677a3 100644
>>--- a/include/linux/mm.h
>>+++ b/include/linux/mm.h
>>@@ -352,6 +352,10 @@ extern unsigned int kobjsize(const void *objp);
>>   * for more details on the guard size.
>>   */
>>  # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
>>+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
>>+{
>>+	return (vm_flags & VM_SHADOW_STACK);
>>+}
>>  #endif
>>  #ifdef CONFIG_RISCV_USER_CFI
>>@@ -362,10 +366,22 @@ extern unsigned int kobjsize(const void *objp);
>>   * with VM_SHARED.
>>   */
>>  #define VM_SHADOW_STACK	VM_WRITE
>>+
>>+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
>>+{
>>+	return ((vm_flags & (VM_WRITE | VM_READ | VM_EXEC)) == VM_WRITE);
>>+}
>>+
>
>Please no such hacks just to work around the 32bit vmflags limitation.

As I said in another response. Noted.
And if there're no takers for 32bit on riscv (which highly likely is the case)
This will go away in next version of patchsets.

>
>-- 
>Cheers,
>
>David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
