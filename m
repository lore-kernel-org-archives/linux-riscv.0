Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BF0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HN6deqFxnimJdgrcgHHnFpxheDR6zf7zC2twZf8qnRQ=; b=Nu9LKqy1+kq41d
	JJTuhbmUaE+xkhW+oK2PIHR1NH/zAklnlQ9mIqBzmC4KhmpNtxt3MxwlrPeQvNJB2OIUc2czxXdBy
	xH1cgW3ZVWQXz94One+Ufu1qr5NuwfBGbQPLHvdq8uaLK/TWxDfXTFZgxXl69QJ67RzXe92dtY5AS
	PE3mODzXUAWTysluLzam8vHoUaJvdJ0mC12vfc+r4oA2wd5/UDXlmEa/SGVlZLlJ+gwlWKhheWZKA
	a8+x1TDpXQY2JT46qewXYPf+fVuBiGJKT/WHMtB3kAS6S0QvCw0rv4PIMjZNFHX+K3ZXcx2d86VFJ
	fW3adyD+NZ/6iGsyWPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyoJ-004Hxq-9r; Fri, 04 Nov 2022 15:40:47 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyoE-004Hu0-AC
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 15:40:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id i3so4820355pfc.11
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFlTeUJ4nQplolWHip6FrS/j8TYR0+QbDmRZAFvu7G8=;
        b=slnKaxTVWka5uyvV8ksftk1iXtqkYG7wonGPtAtNy/P6RP4ZnWhdbZSV/6seXnMCof
         dnF6JUiRfV2oVCETco2jEIOQzRouLfUDiH7vxFD2orQpNLxCcfMVtLr6ntSOZeUo+8A4
         1WMtzeSAIQ00ZBggEzItHUadG+pi52a6RW5LTbSCWNWQHjLySk/BPh9TembQq8ly6ISW
         XBS14fXfAOCGbRuWccsHUKA4no5JdNrqlAYc2mDDTkISHx1kXdJjDDClXTXp09r2HKHF
         4YYshPvOotdfKVbVnw4u/+IsxQ4NAMvmIrkrc7+c9m8NGZEp/7DC/KTLI5ge39pksAS0
         M2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFlTeUJ4nQplolWHip6FrS/j8TYR0+QbDmRZAFvu7G8=;
        b=6VLeJdRVfDFekZkXCdkvVY/J3+/qx6wnItwzWaTSjOgmgcqMp1i9BRl/698AP0XUOT
         Cmt7O+nqXlwbBmS/4VGMYNua4sTLJzQgXBumI3eayx/7M6IQVJWA61l7M4C+Ud2+XcP6
         6K05Rh1OQuUdJLQWZWTwOwVn8nNrextLWLX+x1p0jJ0wFABFAMNAzbOhRvym1phJOn3E
         vSPfSi0zFjiHhxG1du1Dg5+xJjsOa/mikbad7m7BjE7tXgDtKbCRcyXd+LuInujBbQal
         VtCj62HXbhHxCSYW5143rsoXh3Bwnl/+hm2/PQvzxYOnSJKS0h5lGJmFCwWhGw/eJeiO
         P7eg==
X-Gm-Message-State: ACrzQf023iingIWBpHSGxwixIK7/EpR/dSzb4WY9bOhDTwSAukCOdtzM
	Io6G90T1XnWZUoMfvp11tN99vA==
X-Google-Smtp-Source: AMsMyM5MdI5VKNUr37j2LDfWFXfSalVZ70lqDfROHdw5vEhrWbzDEJP2xBkjkN31VBShKB5D+mx4vA==
X-Received: by 2002:a62:1a8d:0:b0:544:1309:19f3 with SMTP id a135-20020a621a8d000000b00544130919f3mr36549720pfa.37.1667576439875;
        Fri, 04 Nov 2022 08:40:39 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b00565cbad9616sm2905778pfg.6.2022.11.04.08.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:40:39 -0700 (PDT)
Date: Fri, 4 Nov 2022 15:40:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y2UydNBFR3e2DAe7@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
 <Y2QPSK1/6esl61wQ@google.com>
 <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_084042_410603_80CB279B 
X-CRM114-Status: GOOD (  14.90  )
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

On Fri, Nov 04, 2022, Paolo Bonzini wrote:
> On 11/3/22 19:58, Sean Christopherson wrote:
> > 
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 3e508f239098..ebe617ab0b37 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
> >                          strcpy(c->x86_model_id, "386");
> >          }
> >   #endif
> > +
> > +       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
> >   }
> >   static const struct cpu_dev default_cpu = {
> 
> Not needed I think?  default_init does not call init_ia32_feat_ctl.

cpuid_deps is only processed by do_clear_cpu_cap(), so unless there's an explicit
"clear" action, the dependencies will not be updated.  It kinda makes sense since
hardware-based features shouldn't end up with scenarios where a dependent feature
exists but the base feature does not (barring bad KVM setups :-) ).

That said, this seems like a bug waiting to happen, and unless I'm missing something
it's quite straightforward to process all dependencies during setup.  Time to find
out if Boris and co. agree :-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 1a85e1fb0922..c4408d03b180 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -147,6 +147,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 
 extern void setup_clear_cpu_cap(unsigned int bit);
 extern void clear_cpu_cap(struct cpuinfo_x86 *c, unsigned int bit);
+extern void apply_cpuid_deps(struct cpuinfo_x86 *c);
 
 #define setup_force_cpu_cap(bit) do { \
        set_cpu_cap(&boot_cpu_data, bit);       \
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e508f239098..28ce31dadd7f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1884,6 +1884,8 @@ static void identify_cpu(struct cpuinfo_x86 *c)
                        c->x86_capability[i] |= boot_cpu_data.x86_capability[i];
        }
 
+       apply_cpuid_deps(c);
+
        ppin_init(c);
 
        /* Init Machine Check Exception if available. */
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index c881bcafba7d..7e91e97973ca 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -138,3 +138,13 @@ void setup_clear_cpu_cap(unsigned int feature)
 {
        do_clear_cpu_cap(NULL, feature);
 }
+
+void apply_cpuid_deps(struct cpuinfo_x86 *c)
+{
+       const struct cpuid_dep *d;
+
+       for (d = cpuid_deps; d->feature; d++) {
+               if (!cpu_has(c, d->feature))
+                       clear_cpu_cap(c, d->feature);
+       }
+}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
