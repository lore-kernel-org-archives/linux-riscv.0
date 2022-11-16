Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C6FC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhgbIjcbGU5GqUUidgsjizH4I7Yp0a/cgxOFHGT9Xxg=; b=kv9zM/7fPTZgp9
	VE8n49SmvslTC1vo2z3GmXN6G777FisTukdXTBoT0CB9ww4jJCOI5+Z7vNRxD+DRQmgVVlj5kDoB2
	1qrcKmxPZJin65Jy46lOWJBxUvlNz8MOzN/dy8qZNTtysH47tzkMwq0l9pkvxeSaTuyh2jGDPZ6Jw
	Aq4bFsT4oGn3HnDIgoVNn65vH0Zb4FMfP9bPAjpt/twRhVVjYJLBYNHpAS16sR3KBSjj+w8g1Yn86
	hZ2yJLTIBJd+qg/yU8pVJ3/d1NRWyceIW39nv/rSFMCM9tHqAStbwneCez9p1elEidwIEjH6igx/J
	0xbwy8Mx7ff3LOWDBnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKiU-005bh7-M3; Wed, 16 Nov 2022 15:52:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKiI-005bcF-OR
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 15:52:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id k5so16888258pjo.5
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 07:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=coErVjWyqhzO9EuKB5XSmlh7IJj5NvKWNvG7xdrbhC4=;
        b=Axl8RQ6KDdRrT9Z9C/Q7WDP07ILGsJIsXvmq6hEH7xYRxr1KYM7WfFS4wN+lhhZ4fX
         c4Jtlogr7Ros9vXyyEFv/zFAE8+4peFtT7kH9mbNBRnzYJ/2b8sYrYCafzb/t5b9hh4H
         MzZxnel8UMmtPU7lGv2FYN+iMfYeZiXKTt6kJLjx0bmpPltUoJ0RtRfd1Ec/nG1HLpUR
         NvlX1cr6oDpawENjKiQcMRdisM4zgyG2koLhhizlhvLd74nRufWrbXHhbtX0zrVof0Oh
         3EiecDo5X1cIJiERj7KVmypmulB3/lI1LWoLIDeuu1zT2CC/G2udJFJRosnSOWJ19zuG
         AhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coErVjWyqhzO9EuKB5XSmlh7IJj5NvKWNvG7xdrbhC4=;
        b=J3tWFnSV+sRxsVldJet71A5EdodhLOZvsQA+DDTXmNKfTpXZhwfR++cjZoCHxexm9a
         /Fay6vOt8qzyxy3aat5sCd/HYJABqTcocRvHKYpIUQ+tUHUALTbs7eXBU+zJfPGXm5vK
         0FrUqeXGwzRgAqKxrNcaSyBSugbLDvwXL1/uKvLlv9YutJoJaTSfPct6QfQXsrb6GJKW
         /FJGqp6VFwiTDzVPBxpEl/cCC83hAKAtjWCAGUC4pkkD8+/LTbN2aCs9HCeM1SIDDOxc
         sGkTrK3ZFwMBhgLqcebuB7X6GcnZJsQcE9vUeCInAmezdeVrx2q3wYUV8gzuyphCdFSD
         Thgw==
X-Gm-Message-State: ANoB5pnPpsXImJA116rh0qwTcpiKyPznCiNdbwJAXNErHb9W736u878t
	56tP822vvaZ8wdZd1Mi07wj8Fw==
X-Google-Smtp-Source: AA0mqf7dFwkFbcATwoaCt8aciY1qylOnTaB4gr/nPlKa0OFTmbzR8xQHyljgxnYchchnXSvQiHP/Xg==
X-Received: by 2002:a17:902:6944:b0:188:640f:f401 with SMTP id k4-20020a170902694400b00188640ff401mr9754670plt.44.1668613950911;
        Wed, 16 Nov 2022 07:52:30 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902650e00b00177e5d83d3esm12341507plk.88.2022.11.16.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 07:52:30 -0800 (PST)
Date: Wed, 16 Nov 2022 15:52:26 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"david@redhat.com" <david@redhat.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"Gao, Chao" <chao.gao@intel.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
Message-ID: <Y3UHOg7E0iRFpjml@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-14-seanjc@google.com>
 <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_075234_838472_F325DB18 
X-CRM114-Status: GOOD (  26.04  )
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

On Wed, Nov 16, 2022, Huang, Kai wrote:
> On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> > Acquire a new mutex, vendor_module_lock, in kvm_x86_vendor_init() while
> > doing hardware setup to ensure that concurrent calls are fully serialized.
> > KVM rejects attempts to load vendor modules if a different module has
> > already been loaded, but doesn't handle the case where multiple vendor
> > modules are loaded at the same time, and module_init() doesn't run under
> > the global module_mutex.
> > 
> > Note, in practice, this is likely a benign bug as no platform exists that
> > supports both SVM and VMX, i.e. barring a weird VM setup, one of the
> > vendor modules is guaranteed to fail a support check before modifying
> > common KVM state.
> > 
> > Alternatively, KVM could perform an atomic CMPXCHG on .hardware_enable,
> > but that comes with its own ugliness as it would require setting
> > .hardware_enable before success is guaranteed, e.g. attempting to load
> > the "wrong" could result in spurious failure to load the "right" module.
> > 
> > Introduce a new mutex as using kvm_lock is extremely deadlock prone due
> > to kvm_lock being taken under cpus_write_lock(), and in the future, under
> > under cpus_read_lock().  Any operation that takes cpus_read_lock() while
> > holding kvm_lock would potentially deadlock, e.g. kvm_timer_init() takes
> > cpus_read_lock() to register a callback.  In theory, KVM could avoid
> > such problematic paths, i.e. do less setup under kvm_lock, but avoiding
> > all calls to cpus_read_lock() is subtly difficult and thus fragile.  E.g.
> > updating static calls also acquires cpus_read_lock().
> > 
> > Inverting the lock ordering, i.e. always taking kvm_lock outside
> > cpus_read_lock(), is not a viable option, e.g. kvm_online_cpu() takes
> > kvm_lock and is called under cpus_write_lock().
> 
> "kvm_online_cpu() takes kvm_lock and is called under cpus_write_lock()" hasn't
> happened yet.

Doh, right.  Thanks!

> > The lockdep splat below is dependent on future patches to take
> > cpus_read_lock() in hardware_enable_all(), but as above, deadlock is
> > already is already possible.
> 
> IIUC kvm_lock by design is supposed to protect vm_list, thus IMHO naturally it
> doesn't fit to protect multiple vendor module loading.

A different way to look at it is that kvm_lock protects anything that is global to
all of KVM, and it just so happens that lists and counters of VMs are the only
such resources (lumping in the usage in vm_uevent_notify_change() and the future
usage to protect kvm_usage_count).

> Looks above argument is good enough.  I am not sure  whether we need additional
> justification which comes from future patches. :)

To try to prevent someone from trying to eliminate the "extra" lock, like this
series does for kvm_count_lock.  Hopefully future someones that want to clean up
the code do a git blame to understand why the lock was introduced and don't waste
their time running into the same issues (or worse, don't run into the issues and
break KVM).

> Also, do you also want to update Documentation/virt/kvm/locking.rst" in this
> patch?

Hmm, yeah.  That'd also be a good place to document why kvm_lock isn't used.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
