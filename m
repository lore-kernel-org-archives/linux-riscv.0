Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljyRQqcn0YA+upCLwjrMhYJYI5l8bmaZGn2OGvFVqOc=; b=P21Z0tgpBJCVt6
	Qh87QrqbvQqsnck+fCs6fg7FfZP7uQxPC2qm1PK4KVpk1qemLRyvchVbwh2q8zoSUVdIo/TxYUfkw
	s1wAs6L0ISQ5gs089sQfBf31OL4to9+Q3Xsxs3D9Mx0DQUxA2ZjBYA8vXkd9qxMX0CqsOnZEZyNoY
	kbArsTuYjy4sGEQkJdUjTIYUBz/j/474bROimALC0wdk4cfUdBgfwxOL2rTUBanBq+KhGB4KXLvb7
	viVkJQdoHB3OEPgCG+s88fchw9lzX17i2sBm1IAgr7DPNDad/jwoNBm80NeFoyv03i6vn1Md6lnXL
	Eahrm8lvBSX/A/C7jBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqinB-001tJg-TO; Thu, 03 Nov 2022 22:34:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqimv-001tEL-Fn
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 22:34:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id l6so3017362pjj.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldFAJy69ux+7z8nNCEANq8kYxugZwXEN2GoxlipQK+E=;
        b=mkCIQ7bnuqf5rnZcP6hp5JREtMJ78/S1f1OWtkJaTeRse5OVZRNDMID1AYpz+jBJzg
         eTpW9c3Fpt1GJSjywJBWRecDimPLsqOLfN7Nt46XLz4VoW6wiMtnGP3QRSBmWb2Jy2Ue
         XIrU3j6Zv6WjRE+wBsl7MInjLBoh0ETGKk290BPhyym2xqAHPTTSp2piVfBSnA5Xqpa6
         3LkVfTkbpSA7y+3xQukW44oEvhoV3ll0HshYQg8WmMixLpenp+usLAkNlELtK9JmVVTO
         f4CyPp1jxX+2aW0ZdvzjRbMLb0KbcueA1rrAX1kSu3aGK0UrE4ad6SuEvUCcApyckgBR
         ztmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldFAJy69ux+7z8nNCEANq8kYxugZwXEN2GoxlipQK+E=;
        b=XBao0RWgobb9/9L/0ngz/GZqanG38WaFDwx3i64GNu0XOofNbWt4I8KEnZHMJ191rK
         8gfm7zGyxBiQarZZwpq5SNh5pnFcH6Tji97VqxMpgLxz3yQqR++ablufVtBQbc/HCRmX
         UqHAow4b+++I+n4nRqRqUNi0xjdX4fISFTDrWeW2Y+R9+yJh1Jydde4EladwVBgIY9Fz
         u+hSFzG0Eu/XqEY6GVxIUau2V5Y26BKwi9tcRsNWQ/7ksxMoUvrdxvgNnTHoSe5eHWln
         PnCk36zz72193eLJhjlxnL7hPVv9gDUPTB5QyGMqGwY+wCb2131ObxTPsBIKgFlGmXk/
         S01A==
X-Gm-Message-State: ACrzQf3KMAIJgDDLfpENCpmrDesVBuF/XicvX+y9t3mRj3g01ARcpsjF
	Dw556jHVa4xyGvLdJhQGLO0PpA==
X-Google-Smtp-Source: AMsMyM4x/1h/4H3vdmKr9CnvGb6Osipgsi8YDrhqpMcYmjYNzerzqYc2UHi5AhKhfTxXN1DVaborYg==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id h5-20020a17090a604500b00212fe9a5792mr49415367pjm.178.1667514854306;
        Thu, 03 Nov 2022 15:34:14 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902e80a00b00186ad73e2d5sm1151929plg.208.2022.11.03.15.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 15:34:13 -0700 (PDT)
Date: Thu, 3 Nov 2022 22:34:10 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
Message-ID: <Y2RB4qT02EkhMjPL@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <20221103210402.GB1063309@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103210402.GB1063309@ls.amr.corp.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_153422_713005_B74AC236 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, Nov 03, 2022, Isaku Yamahata wrote:
> On Wed, Nov 02, 2022 at 11:19:03PM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index f223c845ed6e..c99222b71fcc 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
> >  };
> >  
> >  struct kvm_x86_init_ops {
> > -	int (*check_processor_compatibility)(void);
> > +	int (*check_processor_compatibility)(int cpu);
> 
> Is this cpu argument used only for error message to include cpu number
> with avoiding repeating raw_smp_processor_id() in pr_err()?

Yep.

> The actual check is done on the current executing cpu.
> 
> If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
> in non-preemptive context, it's a bit confusing. So voting to remove it and
> to use.

What if I rename the param is this_cpu?  I 100% agree the argument is confusing
as-is, but forcing all the helpers to manually grab the cpu is quite annoying.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
