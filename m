Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1151CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 14:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A173360FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 14:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A173360FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nem3o+yJwLypqsb/IDwNP/dR0xBcO9xUl3NfU7iHcW0=; b=RxkiBFzuvm3/rE
	gEhdW9bj8RTWTeE62wQMeVdzpJki/X+ZHLqnBOSlpEIi/XaLEqI9mUJ2d3biREIs2gFSwadJ/5FTX
	uezNdJcleWNh8W+rBJ7LAH3IQ+KqW9jxxL9gLyTtcGd+sLJ2iBc7+L/6SK8+MjdJZ1cZwLHs7qSOI
	8zD1GO2G1f5UwC2F9amMedxyqC6yB2RzxUkUnBFg15p2a8HvG9WiRlWQHjtyfm8S/Oub6Fq5tsa+8
	80aNRaO0Sq9hejQ9sMaJepZ2EbVHwPUvhFEvuutMbUuxMOFsnemJbw/BZ8T3M3LQUWqCRmV72EHRP
	xVe7o5rD0OkYjhLu8OuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT3YY-008s7B-97; Wed, 22 Sep 2021 14:49:06 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT3YU-008s67-NY
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 14:49:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y8so2916612pfa.7
 for <linux-riscv@lists.infradead.org>; Wed, 22 Sep 2021 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0sqc+8Rn23i9NIXRc3rzWglOlIsYoDOCKK+U0vVnVf8=;
 b=i17P/LE0kBMgmTnemIWdlFQzqY0Hs2jbI6I1/q7BOVL5p2dtOUMx0v77u9KgBVc6Wn
 aKV+BPEmJqQFBnpf2JgmIIqtssY8WUcJgn0PyaL+KfSiTDztZbnAplBfnqcfDhlXXfFn
 BjrKCa5IqUkRjskJLByrIP0vUAdGBFoOpGk78YEBagXPKCi9T3kxBnFA97BcpKw7BZcR
 bmLTSv6ivPklBCfoVzjL+iJjEelTUzY+vAJf7MF3MbJsLpnqXAXpI4Q3beusWaRqYBkI
 4OoNyyAV9qr/c1FTp2tfQsv3gnSyBPHEnLObwapHJkjxKwND1CbJf6lm69JT2lSfnhHf
 qYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0sqc+8Rn23i9NIXRc3rzWglOlIsYoDOCKK+U0vVnVf8=;
 b=GTVSRZfny4fJReVuc2T3DMXSR+tpWOdUBmAi/vJcQbY2YavdkJRuBdFHaVJDQpxqLF
 GV+PBckby+NyAL86rCawNxhIc4ZcBk+mAvLTJHMXylGXGM2mxMS/gJVd9Z2IUTaUkYvx
 W4aWZMZGDALbuiEmqzOJ/6nhmV1fhmmphZV2qZtPxhqAcoeGFJSUvWU+yviMh4GTxnsV
 isz/ojnrGqdaNsYavvgV2c0aYl4gi9x0xRVNpEUQyIh58rSN9gS9KFIsC8lcquPgF9Bl
 L+IN3yS95bzREJBjH4vUtvQLY6rybRR0550Iq+6zGL3APcoHRRdzJetkqLnNA6cyK1L5
 KTTA==
X-Gm-Message-State: AOAM531tvCWXK71hzU2I85YPz2O6rk0Jc6ivGNAVJKfFp8yX/cY6eBJ3
 KrV/f3bqBckZ9vmV+YjKyyB9YA==
X-Google-Smtp-Source: ABdhPJyY3Fv9QcnunPtvdtmn1QYeYqhfMcgkYKWmFqTAaf0DAX+dPQteKaq7uTqZ/uQmOkkrqsksfg==
X-Received: by 2002:a62:5fc7:0:b0:438:9e3a:b8c0 with SMTP id
 t190-20020a625fc7000000b004389e3ab8c0mr22443pfb.74.1632322141372; 
 Wed, 22 Sep 2021 07:49:01 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x19sm3250084pgk.37.2021.09.22.07.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:49:00 -0700 (PDT)
Date: Wed, 22 Sep 2021 14:48:56 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: Re: [PATCH v3 08/16] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <YUtCWOYJwCUYDYtW@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-9-seanjc@google.com>
 <f2ad98e2-ddfb-c688-65af-7ecbd8bc3b3d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2ad98e2-ddfb-c688-65af-7ecbd8bc3b3d@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_074902_819005_65811DF7 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, Sep 22, 2021, Paolo Bonzini wrote:
> On 22/09/21 02:05, Sean Christopherson wrote:
> > @@ -1273,6 +1274,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
> >   }
> >   extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> >   extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> > +#else
> > +static inline unsigned int perf_guest_state(void)		 { return 0; }
> > +static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
> > +static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
> > +#endif /* CONFIG_GUEST_PERF_EVENTS */
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Having perf_guest_handle_intel_pt_intr in generic code is a bit off.  Of
> course it has to be in the struct, but the wrapper might be placed in
> arch/x86/include/asm/perf_event.h as well (applies to patch 7 as well).

Yeah, I went with this option purely to keep everything bundled together.  I have
no strong opinion.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
