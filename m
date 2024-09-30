Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAE0CEB2CC
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eN1zsNKp4walppgaxA2cVbuC4e6Yph3Y5gooKRjmMJs=; b=X8YCYNIffpDs0d
	5FT8hkqQAtOp61Xo4NDnOVhoLoMpnmGAiGhn+/6HI/iGC+iqA0t/4inrAz9Zbw5NnWq2zsoul0Kgr
	THmfbFGN/w8KqfvXCHrCpG53IL/C4GaAsvSp4Cvfor5D+UDj3khox+QovFy6vVTNegShCMtA5wPzp
	+C02S+mpRuZr7DtxBU3tWpcPj+dfQ45kJkwhgWQoKBMeMo2rPEh66yFAwy5oh4FnPUmB2e6PPVNmG
	nkubOkFp0fcnPv30+gJrpxsFqy1FFJG8w7WBfjjh7m2QXzol2r0k2gX1DwbodC2+FMfc81J5N+x4X
	h/WIp6Ywaj7PH0ebTQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svPBw-000000013ZV-45n6;
	Mon, 30 Sep 2024 22:48:32 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svPBs-000000013YH-3UPN
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 22:48:30 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7178388a8b8so3430860b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 15:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727736507; x=1728341307; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEKROrbsF+Qc32qai9a0qLWUFdx11pYvvS7Yvup4cZY=;
        b=ly/H4gcG/uPQHPv0EoRxCMyIg8ITLC2XVYbhDe285BhIBQ2gEuUeeZA2FNqhCtPs2n
         DtT51EXCXHcNVP83h1tZYNDmiTGy5YjYxX8nGa6KsBNNU7VdUyk0X+Km/0qM1jf6xAhA
         dGC2TonXpHwDi9N6BF0IDogulEBbkaGvyXdPfaE6PrNM4ideBZxnEAZo1xyqyNNZ/HU7
         s0dSV5hI0QuHJ6KBy9GbmpNRtDzJlqnBs9t7uZ6ASx3616ATYLf4jax2u6Nzg1uA2lGK
         xDeYaY5FITBJQI4sCNtJt+UmGSb7CVmZn0dJ6DuTXNtT7QNJpMz/BUzwu1ay6yu4vbZN
         VkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727736507; x=1728341307;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEKROrbsF+Qc32qai9a0qLWUFdx11pYvvS7Yvup4cZY=;
        b=HyS7GAULuhNVVze+wD/tUqJZwpeAHYwVjZKFogGuZ0ngBAl6dWQPj+WQotroZ3vjjf
         EQwS2rWX/Hi5eUtTZXFlvMdMTyQ+nDRDklVfgAXZ/OoB2E9h7aesFOBqIsEzflF5biJK
         cizaajyKaLekgh+LkUbGmWz7ovzmpeZhw5pP4nYWpPgIyU1onkkzklJEsQNlKISw3kUU
         yXiev9KnSLESi+rjy7BcQ91AryVXs/1zHRHaIRJZd9dL0IMaoCRYjZlMFX8bNDcGSXWk
         elH6XFPLy6A+B9+szUU77Mrxa+I8RM+I0bSaDZAW73QnnGwxU2K/bQbx10snvMiwMAHM
         3jyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtGaEz11HK5mMzor4SvmxN0rM8botd9BiD6ZboPApoyvBS1SWwAim0T+Ysh7F12JDzelc180bLNOQd6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YybHrGyoQWbbLDGLEJGnZ9oPjye0GeIePUcgPnLIM8/HUGAwJ5g
	yKZQKffw+OvQhPgON8fSbt9wa+TC2Vb5qmzuDzoK+h/F9SzduRJ1fKOi0pFwKQySyR2LKi1Qaqz
	kyw==
X-Google-Smtp-Source: AGHT+IFBqE4b3ETKHUb3GkTpAmeIZlaPPTKak751rxnBHWeoFOgyWmnqPX8beCCGnb8n0RirfB1L8PS0CMc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:83ca:0:b0:718:d8af:4551 with SMTP id
 d2e1a72fcca58-71b25f2ca30mr23827b3a.1.1727736507148; Mon, 30 Sep 2024
 15:48:27 -0700 (PDT)
Date: Mon, 30 Sep 2024 15:48:25 -0700
In-Reply-To: <ZvseoZLzmaS4MEbc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-4-seanjc@google.com>
 <ZvseoZLzmaS4MEbc@google.com>
Message-ID: <Zvsquaq-Lo4umoTI@google.com>
Subject: Re: [PATCH v2 03/13] KVM: selftests: Fudge around an apparent gcc bug
 in arm64's PMU test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_154828_877213_ABB7455C 
X-CRM114-Status: GOOD (  15.01  )
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

On Mon, Sep 30, 2024, Sean Christopherson wrote:
> On Wed, Sep 11, 2024, Sean Christopherson wrote:
> > Use u64_replace_bits() instead of u64p_replace_bits() to set PMCR.N in
> > arm64's vPMU counter access test to fudge around what appears to be a gcc
> > bug.  With the recent change to have vcpu_get_reg() return a value in lieu
> > of an out-param, some versions of gcc completely ignore the operation
> > performed by set_pmcr_n(), i.e. ignore the output param.
> 
> Filed a gcc bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116912
> 
> I'll report back if anything interesting comes out of that bug.

Well, there goes several hours that I'll never get back.  Selftests are compiled
with -O2, which enables strict-aliasing optimizations, and "unsigned long" and
"unsigned long long" technically don't alias despite being the same size on 64-bit
builds, so the compiler is allowed to optimize away the load.  *sigh*

I'll replace this with a patch to disable strict-aliasing, which the kernel has
done since forever (literally predates git).  Grr.

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 48d32c5aa3eb..a6f92129bb02 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -235,10 +235,10 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
        -Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
        -fno-builtin-memcmp -fno-builtin-memcpy \
        -fno-builtin-memset -fno-builtin-strnlen \
-       -fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
-       -I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-       -I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
-       $(KHDR_INCLUDES)
+       -fno-stack-protector -fno-PIE -fno-strict-aliasing \
+       -I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
+       -I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH_DIR) \
+       -I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
