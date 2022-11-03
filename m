Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 17:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHC6oMiqXiA6siE7m8pgOUY8CsK2FLlxfaW6gl6N9pU=; b=vHFxuNJ9F2yjU9
	TWGRgn1ctugCoLokGycsec28pS3/BGenZPh+3So5JsGeYiY/paLuKGqPnm4DjOu+xPGW/+DqE76h3
	3m/ER26RS66aewKsoOi+dgMGauHR1nEm0AwHG/l4Y7U5dL9AkAMTzCdZO1c5uCu0IQ90hZ8YHMpqI
	oOx1EHzp10cFkOLKpm2WMDz12SNQIdhQDR/ot2Bb6s6EDCcLxomP9U72y+Ak0RaTnX1VV6wMlWEJy
	F+9dZUIe/3YNUwTgNOCM195A0KtvOuCGW8bpwnTVx6oj7XzNcszniiEXfGsQ2pLa3Ib4ulD/EkXsy
	pBjdEnL9xWYQ1talW7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeH0-0017J5-MX; Thu, 03 Nov 2022 17:45:02 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeGv-0017G7-Tc
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 17:45:00 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o7so2367610pjj.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cK19xZ8r/JxZ6zrZk59CGRO4XALiFfw/k+DEo690ifc=;
        b=AMXkMgBJe864E9ylH4eLhcV4DnnmpnUZQciwStcW/fWfVy8vl8xbyLHXqWoh/4n8QF
         bRAhsfNtOcglKLMhK6Nb/v5AF7HvdYNYuPv80cwXOHPX5E9n4f4rIwmSH2XAdpFIqhuj
         sSsx/7sAKHM3fmeDS7xyNpoxOPMcbkwOVVWM5XBPQcjHKuBxYoH5JxFh6oDyEgClSLr4
         VePL27iqi0rk5/s+JivkXFUi7OtMXJLNacJQMnJ3M4obYSjfplMj8jxI5D4RNhWTNCit
         VmDRgbq4Pt+ph415Zp0hH77zR2JN9eVpsj1xI6CTZrVgir1QKlQnpGg6QTPI6wKdJ0ls
         3hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cK19xZ8r/JxZ6zrZk59CGRO4XALiFfw/k+DEo690ifc=;
        b=zATlkalcrWkNMYQWzzKfziohVOUm3OLFXJZvSZmnRznNeeYGdcnbG3FVoXY4BeXqfl
         6jAA1anhhmYFoyEZwpJVDnwMe8nH02dvPZOidJXQLhWAsHf5AVLfPdqwyJZUsrsh5mEv
         vpOJzx8wIgrMEdkq52ji84iV9agMcgv/YKA0V+hTNG38lH2lM26VJ391CW4MBOig2Zgb
         zlzx7lABov5i013VCPEMwEyF15RT86p2StUSPaYSMVzZx+x6W9Pv/nDMubCUpnHgFWye
         ZtkQtsTmyAyzk3JJqUMYXYSR6cbH1liD+QRlLdzrvOYYj8PIMt1o0Hp0MPoSbeUeZmHD
         664Q==
X-Gm-Message-State: ACrzQf0AwX0veViEhYbaNFVqcFCTZula9bhEDIbR9yhFFwlZK3+AISM4
	8+7cw4KvWipiXUUUFPPDDalv9Q==
X-Google-Smtp-Source: AMsMyM7Vi7ErqJmqrzHt1bwsO7Jfw+kVc4w4lCdxf/cK5b8KZHYV39XlOvASF4Eye8GSeC7ZJ2rbFQ==
X-Received: by 2002:a17:90a:d24d:b0:213:d3e4:677a with SMTP id o13-20020a17090ad24d00b00213d3e4677amr24629292pjw.101.1667497496277;
        Thu, 03 Nov 2022 10:44:56 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00178aaf6247bsm1004862plr.21.2022.11.03.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:44:55 -0700 (PDT)
Date: Thu, 3 Nov 2022 17:44:51 +0000
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
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <Y2P+E+631c0TNcK7@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <23bfd709-f99a-5a74-e4b9-1381b88453f1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23bfd709-f99a-5a74-e4b9-1381b88453f1@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_104459_552160_BDC8EF4F 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 00:19, Sean Christopherson wrote:
> > From: Chao Gao<chao.gao@intel.com>
> > 
> > Do compatibility checks when enabling hardware to effectively add
> > compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> > online process, if the (hotplugged) CPU is incompatible with the known
> > good setup.
> 
> This paragraph is not true with this patch being before "KVM: Rename and
> move CPUHP_AP_KVM_STARTING to ONLINE section".

Argh, good eyes.  Getting the ordering correct in this series has been quite the
struggle.  Assuming there are no subtle dependencies between x86 and common KVM,
the ordering should be something like this:

  KVM: Opt out of generic hardware enabling on s390 and PPC
  KVM: Register syscore (suspend/resume) ops early in kvm_init()
  KVM: x86: Do compatibility checks when onlining CPU
  KVM: SVM: Check for SVM support in CPU compatibility checks
  KVM: VMX: Shuffle support checks and hardware enabling code around
  KVM: x86: Do VMX/SVM support checks directly in vendor code
  KVM: x86: Unify pr_fmt to use module name for all KVM modules
  KVM: x86: Use KBUILD_MODNAME to specify vendor module name
  KVM: Make hardware_enable_failed a local variable in the "enable all" path
  KVM: Use a per-CPU variable to track which CPUs have enabled virtualization
  KVM: Remove on_each_cpu(hardware_disable_nolock) in kvm_exit()
  KVM: Drop kvm_count_lock and instead protect kvm_usage_count with kvm_lock
  KVM: Disable CPU hotplug during hardware enabling
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: Drop kvm_arch_check_processor_compat() hook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
