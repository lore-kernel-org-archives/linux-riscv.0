Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8429CCCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SPFSsxo+gM9RMBxMiLxdKxKjkSfnA/GzVmc0ZjXErJI=; b=2kzWVwbZtSupEm7QFGomukqwNB
	DnrXN4/tOTiyECZ56VL1o6KiCyP0nj+Z5Y0ISxSh/2mbd9XTy9P2UjNV5uoApTdCvXtf/E+olGyy0
	gc4n29F1PbaV+WEcYFZpJVbEqfxwau+3vO5kyaaWIjHWVB5KBYwiXZU61+E0AaoMkPPiObZ6bBlEo
	P+nA7DtdypE7hrYolxqHDwpgLB3/6TglWEfQNOhT+vwxeSEwKU/MpC1hneYmp3T8998gJ42Dtf1s0
	m5krkzF0aGmS7FoszJoYXXIndZsbBIK0D8LOYuQSudAZEKuPHAkUGOc976TVQTXVdiKEzuu57gchr
	GMCf3mVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKlX-00000009zZv-0Oik;
	Fri, 24 Oct 2025 16:35:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKlV-00000009zZ5-2ntY
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:35:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-290c9724deeso20914105ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323744; x=1761928544; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
        b=n6wRqoYVp2wZI8y7HVTFemsH/sm7lQyMOG/U6IQLFHJZYYahUwiyiDAFaroe4u5YtH
         z1q6XJVbpu2G0EnXFfRebj87AWobSFSybQHYiWEpcmCRC4wyX13ubZEBbKJuf+vSAN7G
         PQFvqlZGOmkokTQPkP2oXihgfjoNkzR2hBYz6Cf525kBPGWc+BDicRncDxh90Dah7m6J
         eDzILFO1BPYvwv3nXCLL9FzlzK7bbBVqGgIWnXElOWsznVBPQ9/BRVIwt+3f6lBr1N/z
         FgyxzlPWlafGUFaAzeZotV4J36XqfPvE/KbqQp9GYg3L6pVFMssKLjs33897ec2l4pmb
         7TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323744; x=1761928544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
        b=ZY4XJBs2LRCiEgsAkOH0WKZVksycpDjKo7ueoRANo8sp8GunCNUN9UCa/aMn1Jwsei
         lMhBECpXcIgXGdsL+JzDnNWMIkeIeGXvmNubLQ9uNnh/BcIQMZLv5hjhk6GkM/NCtyxR
         /pYCkQhzEf7IhkqeIfeUBakMO2CXJgclAPaEZ661hdZpZxXrFuN7vYucOdLGSYuuYjHU
         WMzorg9xO0u5Q9NFtu6brODQY78cBQHVqdToVT94W5iPmzzvkFEnGVTxAPi77Dl0mODE
         SGQ5724SvyVuLP9G2BWPyOzMhnjO45W5DaZlGqPHRWvdLcyFODGZp8d9upJ8C0Y6qEow
         g6qA==
X-Forwarded-Encrypted: i=1; AJvYcCXcoCSDvo6ibUiy/6KVp9fU3qSU10iQH8at9eYbLI8dQRX8vRntYOhE/66FhaXTkq2P3tZd34CbYUaOfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxstt30a0KnEfuGXUI6wjiJuI6yAjfzVajHfdUDgevFfhH4hMlk
	SNtVTYtRvkifDWSwmi7z99aePDBQpA2UrPRmc65R5z1+QsUIhspQ4iIdijpjQHfNfMbruYdrqgY
	38xIo1Q==
X-Google-Smtp-Source: AGHT+IHEqEX/8GwSPDTtO9R4g/+ZtFO0C94Pe4ULgHF/AbXONvqtNga/vyT3hE3hD5zVd0KE3EnoXL2eWbI=
X-Received: from pjyj8.prod.google.com ([2002:a17:90a:e608:b0:33b:51fe:1a8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db05:b0:24e:3cf2:2450
 with SMTP id d9443c01a7336-290c9c8a5e6mr368813165ad.2.1761323744332; Fri, 24
 Oct 2025 09:35:44 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:35:43 -0700
In-Reply-To: <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-15-seanjc@google.com>
 <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
Message-ID: <aPuq33-qEJsDhdgG@google.com>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_093545_706668_0E671B68 
X-CRM114-Status: GOOD (  21.43  )
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

On Thu, Oct 23, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > mapping is invalid, and it should be impossible for the S-EPT mappings to
> > be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().
> > 
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
> > entries that can be used for the initial image.  The call from sev.c is
> > obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
> > so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
> > __kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
> > image, the APIC page has its own non-guest_memfd memslot and so can't be
> > used for the initial image, which means that too is mutually exclusive.
> > 
> > Opportunistically switch to "goto" to jump around the measurement code,
> > partly to make it clear that KVM needs to bail entirely if extending the
> > measurement fails, partly in anticipation of reworking how and when
> > TDH_MEM_PAGE_ADD is done.
> > 
> > Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
> 
> So IIUC this patch only adds a KVM_BUG_ON() when TDH.MR.EXTEND fails.  How
> does this fix anything?

Hmm, yeah, I'll drop the Fixes.  It made more sense when I thought it was
impossible for tdh_mr_extend() to fail, as returning an error and not explicitly
terminating the VM was "wrong".  But I agree it does far more harm than good,
even when relocated to the end of the series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
