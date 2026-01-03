Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BBCFC6160
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FfNX9NAlE0ETVqYsMWTEbelWzccprhMxd5kyKG+SJcw=; b=Mo0y9yYCzqWKvl
	77IEB6XDOm/qXztVKQTS6eYzEW4H9v0t/lSG19xv0HojSYhQXmoGcA5pygf2Nx7vLtivkpQ1RNlhK
	m/xW5fgwfgMsUTW48NFzOJufpxyC/4fdOnWuUMUpHEbxpW9xG6dGrXhFlBLZ/aAGoU4rjzyIRy1sD
	Gr3d2oQ+dnBER4oXrkCC4ZcnA6Y/LBKlRhCDps0WnBRmlmMhkXMr9ubuJKfPOYz+yfmr7K0pg35zC
	x3AyMbFLypK741AsVaRpk1fBX04KjC+NkxEoZWApEl1FMN7J2fB+TiOrNkPawA0wo8gUWx1nhKifN
	UDa4T0ubSoSVRvfPBFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxId-000000097AF-2WbK;
	Sat, 03 Jan 2026 08:47:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIa-0000000979d-1uj2
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 08:47:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so196452b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430067; x=1768034867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=;
        b=cyb3PRFutmc0WwAKdP6FmqGs6KNUtLEG3/dp27VoQpv6uBKpZ1TyeovSwWILbdyj/q
         X1kzeo8QlDTFbdhQwnx8RchR7PRbl4TaJVhLaavqCn8PU8E2U9f1vQVBqDA4UCG1z7CA
         Bd9Sp5+zt+IPxsmZA8MjAxb7Y0MwMNkjwBqTfIoUu00ZNASH9Xmn7b/95QizLfpA6VJ/
         IyzQzOuo2lEv0eSxUH7BrKzahbUGSbDO2QUWv1HeNNplM0EZxKyjQieNkmGCzSVVCd8o
         37oZHUkU0r5j0yWxSamsh0twrZz28YX/CMOgrpzycEK6CZz/TKZJUsS3YCpL+VlYzTrr
         tj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430067; x=1768034867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=;
        b=MbYhK6g5FlP4iHWLP43S8Ul7FxOEU318ygK3C9oFtfyPcxO1dX6V7hTIk+r59AGIDA
         DcehRnFlQv3Edx3y3gv54qgIHQzw6jy4J6LKI5MAuwpp2GOMF8tKNZkKlE0hUMQjoizZ
         pEX/NU2Ayf6yVkIr2M5n2N5ykeLrlS2oiM5HvgMfa7LTMiLsPLM2bHP0vai4rQb1tINt
         1njNn3c2arVRO7/EEf6rFXz31BLVvcpTH2Jg0ZvedvR7kj28sOiB5zaAwvALAIEAvACw
         JVGuSu/FZ+ncnWrsapb842jdyZ7vBEf0sB+JG5PyFTe2Url0VYir9pq1kVXL+EQAEg/x
         /HQw==
X-Forwarded-Encrypted: i=1; AJvYcCWofegAluVNlUFVo7bzJRG0Fj+UntU8BJXUddp8b8VtIKV8Ktq65UHQN4PdqyzcZVUB1mNloc8rYSy8kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8cx8rI+29CUrt4BmWRG2wxzPQCTdXk9OEZECxu4LsK9lnBhqY
	zvs1jsHz1eDAjBYpQo4NDuce0yFNe9v7FCZeLAWeKpQiwm0PEpPHSVIT
X-Gm-Gg: AY/fxX74GKZytWNCin8IhIRgiSZ8GLOl/4SrjQAMTMyTRnGNiO2U7wwxSwZNhqyd3Rs
	p/hUQ1TWgYmF+ZBUv/7x398xGxwPJ44MLq4E2MfN+tE57gd9skYFkm03Wji0/nECtMh9qOtz69H
	5GcMuhXujmns1ehqosiGe0z3/8qO7SHFSAs+TlSLN4lFA8F7SOH1wMdSwSZM6fa1DrUgLhQRQoi
	5unrh6lyMUkVxEqyWxFXklu/k2gdgSHOuu1Pj9o9XNBhR3t6NhUYNax8yARBvEdBp/PqxbfGGFk
	kCgwo9EdstcsSBPxUD5PUOIOOcCHMOoWnPIQxzYYUuE1iLZVA0jf1tyOL6tZIk0V+x8ctRdGX63
	cRJzoH2kinEHZzISTo/m5Tr9+J54XdZ19jDxU7wm2TRCdgat1OlVzMEusktEpVHN9LhxqYjvoRc
	SE9wYYQRzw9+lULLcfGqi3z432hW89GoJJs9w=
X-Google-Smtp-Source: AGHT+IFlp8qcq2QazAOf3KnrJVHQQLc5fUVTVkMNEtXBSYaNUnUycb5/s395woDebt+kaXn7KmVKuQ==
X-Received: by 2002:a05:6a00:4ace:b0:7e8:3fcb:9afb with SMTP id d2e1a72fcca58-8148ba19ccdmr1341264b3a.17.1767430067508;
        Sat, 03 Jan 2026 00:47:47 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:47 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 0/5] uprobes: transition from kmap_atomic to kmap_local_page
Date: Sat,  3 Jan 2026 16:42:38 +0800
Message-ID: <20260103084243.195125-1-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004748_512951_8A0CC6D7 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The use of kmap_atomic/kunmap_atomic is deprecated. The purpose of
kmap-like functions is to create temporary mappings.

kmap_atomic() typically disables preemption, while kmap_local_page()
allows preemption.

According to the documentation, kmap_atomic() is primarily necessary
for contexts that cannot sleep.

> kmap_atomic() may also be used by interrupt contexts, since it does
> not sleep and the callers too may not sleep until after
> kunmap_atomic() is called.

> kunmap_atomic() may implicitly depend on the side effects of atomic
> mappings, i.e. disabling page faults or preemption, or both. In that
> case, explicit calls to pagefault_disable() or preempt_disable() or
> both must be made in conjunction with the use of kmap_local_page().

Link: https://docs.kernel.org/mm/highmem.html#temporary-virtual-mappings
Link: https://lwn.net/Articles/836144/

Keke Ming (5):
  riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  uprobes: use kmap_local_page() for temporary page mappings

 arch/arm/probes/uprobes/core.c     |  4 ++--
 arch/arm64/kernel/probes/uprobes.c |  4 ++--
 arch/mips/kernel/uprobes.c         |  4 ++--
 arch/riscv/kernel/probes/uprobes.c |  4 ++--
 kernel/events/uprobes.c            | 12 ++++++------
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
