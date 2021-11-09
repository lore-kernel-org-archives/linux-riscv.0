Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5562C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 00:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C4061101
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 00:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92C4061101
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/444VtbL7afhX5bVZp9vTeG/HTp6n0AGIx33sjeDDg=; b=HdpNG62w8DCRvu
	w60hFJJC4+QHOHVeuTQS0fbvN78OrR5gUEkX5Oruds3UPTc2fCsmDzcZ7WWI8LwPToOUmf9lNBKm3
	sK9eUMdS0Ja4WExDToUP0PCc9ZG4wzQGQq9aSpbe/4Aolgo9CKPKHZL1YVQC1QBUYixEnRAeM/jL9
	2Ec1FlOnVVxqlEg1+bxk79IYpu1C/Lce41slvvleRDUHSpQbpTexEo8ghvGKcwxFuNR9wMLp3ucvq
	iNTkHMsBFab4WXXRAdaSE5oQ0GpuFJTUqUdHei8qHgQ/4RY9GLJqUVKl7B8miMb3YNpeZNWvDjDSt
	B1GrDLI1VnYZUK3s4RkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkb5G-0046VA-Rf; Wed, 10 Nov 2021 00:03:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkaLo-003mZj-28
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 23:16:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id r130so897404pfc.1
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 15:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3iDOWhiMYVH4J/xrL04EpHxxB+pfcqrny8aFQ+9uha4=;
 b=VzrYqN0K7z0Tuv/HZEo98TZC4k8HLv0Bi89F+eTM7VIgt8Hd0SbLQLu1jfW8/8S8fv
 tzfRT3bkeDhN2PHc31X4H7Y8DtkUZW4N710CDOsPQBTQtnUWIqdFY6F7ije1Cnoj6Q+4
 ppkFKf+QIHaiDGp0vt5e+c8PAWdm9ufyP9kMeDz/DPFOwmptdhrUt8KETig+vfK9Hq/N
 lJFBQKcjKRbfCPyMg8YrBLHsmR9t18pjj8BDwHYytNF7IYDGiDNiRxMB/BsE6ChUEAKz
 f1UvA+hVEnhTbq/8QIGBSxxEpmi70akY31pDC1IU1AtgFWCS0WgRlyVxJZndzjJCKeh8
 qtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3iDOWhiMYVH4J/xrL04EpHxxB+pfcqrny8aFQ+9uha4=;
 b=Vzlqos3oBklq4ZY92puNBHJBscAS5U3Ur/fZI5boa/6at6ne6aBP7F5e2NQs3S2R7Z
 ZkryTwqjUg/DFrWw79OE5f0457tmuq/ubW84h0HBkKQ1WvzZAAH7d+QPKfYF/5gZuUI0
 N65YE5rdvYBhyqOkcU/LtmZvITDDTe7HYKf/1GLax7jSi8HE/RUZz4kRCnFyBaNU0pDp
 RNXuogxo3gj/Cldye5Tdb689m4VPbkB55YsKn9Nd31VB/L8rV9rAlaJcsm8nAzgxkhsB
 3v0qirkqO/5PuJKBYgXdh6mUP/OoGNNGsZLFgpjJ1ldMxzfTEW9eJZLeIux2HFSnjJ1T
 TJzw==
X-Gm-Message-State: AOAM533AIsmLj4TONOkUtdlGjU8GTzFPVhiNKiGNkMy0/kFPdsX+/cNO
 34ed+EaulN+mvf3tlmm+0l3ojg==
X-Google-Smtp-Source: ABdhPJzkNcQryrFCiNL8a59OsXtVtP1KqfiFu5fhzV9PARw6xea5VYu1cXC91MqNZo8wxwwswlX9UA==
X-Received: by 2002:a63:2c0f:: with SMTP id s15mr9035602pgs.6.1636499782405;
 Tue, 09 Nov 2021 15:16:22 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y9sm3778534pjt.27.2021.11.09.15.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 15:16:21 -0800 (PST)
Date: Tue, 9 Nov 2021 23:16:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v3 15/16] KVM: arm64: Drop perf.c and fold its tiny bits
 of code into arm.c / pmu.c
Message-ID: <YYsBQvJPrG5Qrm6J@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-16-seanjc@google.com>
 <87tuhnq4it.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuhnq4it.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_151624_192064_488EB00B 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, Oct 11, 2021, Marc Zyngier wrote:
> On Wed, 22 Sep 2021 01:05:32 +0100,
> Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> > index 864b9997efb2..42270676498d 100644
> > --- a/include/kvm/arm_pmu.h
> > +++ b/include/kvm/arm_pmu.h
> > @@ -14,6 +14,7 @@
> >  #define ARMV8_PMU_MAX_COUNTER_PAIRS	((ARMV8_PMU_MAX_COUNTERS + 1) >> 1)
> >  
> >  DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
> > +void kvm_pmu_init(void);
> >  
> >  static __always_inline bool kvm_arm_support_pmu_v3(void)
> >  {
> 
> Note that this patch is now conflicting with e840f42a4992 ("KVM:
> arm64: Fix PMU probe ordering"), which was merged in -rc4. Moving the
> static key definition to arch/arm64/kvm/pmu-emul.c and getting rid of
> kvm_pmu_init() altogether should be enough to resolve it.

Defining kvm_arm_pmu_available in pmu-emul.c doesn't work as-is because pmu-emul.c
depends on CONFIG_HW_PERF_EVENTS=y.  Since pmu-emul.c is the only path that enables
the key, my plan is to add a prep match to bury kvm_arm_pmu_available behind the
existing #ifdef CONFIG_HW_PERF_EVENTS in arm_pmu.h and add a stub
for kvm_arm_support_pmu_v3().  The only ugly part is that the KVM_NVHE_ALIAS() also
gains an #ifdef, but that doesn't seem too bad.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
