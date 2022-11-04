Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2244EC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw6MZvzu/xkyYMTtL+6eEVwLAkrfCMHHRnOdGKTNuq0=; b=pa6iQk1cM0sbv1
	4bOn8rWpL+3XoGca5X2roteuMlMrs/+FtAkvFHFzwBzlmU8d9r8jwDMinl1zh2Nn75VXSCU7T4ddQ
	rRo5HIUODc7UkVlYmQ0wU+pRJfRWmDlil2PpCpv7iiSNasgANXqC8CofYJ66ei6doSD91Lhibvnxm
	V4rkERa3MIftS3GciqMo2hcfsB3dNAerfYycimJ9Jh6JjfY57Tk+uBE1r9vUOsEaIpCBwP8XqIpO3
	tViUb6k5ExbGPJXdc9fDbfi/qVnsMvsALyRH+BV17uHqbk448fDERID94XjW7dewVluH0ANR0YByi
	qbqpqWrELQvr5O69u8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqqyM-002kak-5d; Fri, 04 Nov 2022 07:18:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqqy7-002kUQ-Rw; Fri, 04 Nov 2022 07:18:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id b21so4108258plc.9;
        Fri, 04 Nov 2022 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eA0yZupCmJu+lIFxWoscgsZofsCuVm6nQ+r3Bs4PfgM=;
        b=pMTxZL/oe6jfdbdYCNUp+Xb6WGMwDJ0tqzYjFuCFVTbU1K6LCmp38IhtqgFEtGH1Fw
         eLi3S+bCzf2+/rSdLI9BvXSs2AxVFQGLdZ/VpkCMRosDZICPg8K0E7aAi3VCg4WFPYDw
         BfmWNQys/m/eitnUWQLYZ4i97xNTJmOpokS1/YmW7+tK6sMrbeSwt/lUvRFiVPBmwrU/
         ivWuBjfa1WZ8S1UNebL0AtpJKNK0IoOPWmP7NKKqfcpMaASq0oFieIk/rtzcNf6p/IAa
         QK7q17GoUs4Yjdkmho6a4WFZ4muIgt4Uy+uR4Vu4p0vmgfomnVLk+4/4y9tD9W4Njnx3
         1t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA0yZupCmJu+lIFxWoscgsZofsCuVm6nQ+r3Bs4PfgM=;
        b=L4y7yDjWYjP3qnW3bosm9ab8/px+hoGZXt1PTLTOQc0CvDgKCYduIujUai2d4XDhdJ
         n6GLPY439kwXHW4vJiSt6uwAGjmhOkHHOjrUWMIvUhujkkVSTwrnFc7mHXfSKRYVfC/n
         LtqCEZXBGLJQn7DrComW6GyX7SUI7OyREIDlSgqdjaBZ9TZas9GLSF2A1hm9Zoh8Gvzg
         i4IEnlQfTrGxJE++CgrLy3g5+HK8HbiYi3OyGpoPbb2x+gw6s9wV58bvgadFVkIHLzu4
         2DoYbPJkPt1nH6Shql2gYT3yf7OzhYpLoC/k9be3qiKA8pRSm++BSeHsnMRmfEhm7KKl
         QmUg==
X-Gm-Message-State: ACrzQf1w6qSPKhqrs1d74eqALRPIjVemDT9kVYtDnies1cvmtdPUBp/+
	OisAICM8nNHdWoRvj60HhoQ=
X-Google-Smtp-Source: AMsMyM44DihVYXeoqfThPObIIFl16q8Fgq5Ol1s8X3KRnlnJD5T+n/qjAhXcJhbg7QI1HMtgLqbViQ==
X-Received: by 2002:a17:902:d592:b0:17a:582:4eb with SMTP id k18-20020a170902d59200b0017a058204ebmr34136415plh.40.1667546300864;
        Fri, 04 Nov 2022 00:18:20 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090322c900b00186f0f59c85sm1854838plg.235.2022.11.04.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 00:18:20 -0700 (PDT)
Date: Fri, 4 Nov 2022 00:18:19 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <20221104071819.GD1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <20221103210402.GB1063309@ls.amr.corp.intel.com>
 <Y2RB4qT02EkhMjPL@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2RB4qT02EkhMjPL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_001823_920468_E7D9E456 
X-CRM114-Status: GOOD (  18.53  )
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

On Thu, Nov 03, 2022 at 10:34:10PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> On Thu, Nov 03, 2022, Isaku Yamahata wrote:
> > On Wed, Nov 02, 2022 at 11:19:03PM +0000,
> > Sean Christopherson <seanjc@google.com> wrote:
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > index f223c845ed6e..c99222b71fcc 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
> > >  };
> > >  
> > >  struct kvm_x86_init_ops {
> > > -	int (*check_processor_compatibility)(void);
> > > +	int (*check_processor_compatibility)(int cpu);
> > 
> > Is this cpu argument used only for error message to include cpu number
> > with avoiding repeating raw_smp_processor_id() in pr_err()?
> 
> Yep.
> 
> > The actual check is done on the current executing cpu.
> > 
> > If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
> > in non-preemptive context, it's a bit confusing. So voting to remove it and
> > to use.
> 
> What if I rename the param is this_cpu?  I 100% agree the argument is confusing
> as-is, but forcing all the helpers to manually grab the cpu is quite annoying.

Makes sense. Let's settle it with this_cpu.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
