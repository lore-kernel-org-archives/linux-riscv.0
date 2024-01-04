Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E791FC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHqKQ0mVHCQR0KIbViRW4SSyRxojlT23Yo7oBfHniyI=; b=fyun/WHIA0s2qw
	Aim28u/v59x5ZPec6PVcPOnvWpXMDKHIvmR/wigGRU3Rlvqp73K9nHaw+CUikHMBbqZj38z9+HZH5
	3yEFhvkc2xN3WvxoDizcm7EFRfKHKIly/FG0j43H8o5/pgwqS4J7zcIPZb/muEoMFOPtw5EtZ5Ohr
	NM8z87DLVXZyUgtmuOTMDNYcT4Pw2VtinsTRmtKuCQl5QYkZOv/Mh5KVcQII5XImxA4USzoOoA+C9
	THHwzogvkdWKhDs/KK6RUikRhODfiUxZAKeV7sPV4VdDvvzSP1MvPIyafjN8Qt7t+/cuh2yIAWSiX
	FJdnLfwxha6HH8D5sivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJKq-00DFON-0a;
	Thu, 04 Jan 2024 08:44:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJKn-00DFLe-39
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 08:44:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a28ec136715so14547366b.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 00:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704357850; x=1704962650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4epjjtWpm5YSGmP4xrJiMs2lpLIiDHgjuHx9R0clTd0=;
        b=ZcMORPDMJ5cX6OP7OpvKk7cmSnPsx84PfkD/W0t+WYTD3Vv3ZHE6Tpkyseb9vJIGXZ
         kc3S3fhoqEVMkTNZCPov120eVPqGeEbFdRW3EKtKNbgvxTb5r8CRnIO5o4lIsJv+gyhD
         3ClXiN2zuIoLyq51+xP0nCgpMV8GjdPAdrSVA2ig5qMTRSBKcFqNuPbRApK6m4NQpn4r
         +2L4F+IfNNsuUoCHe0KIPwe1+wUWGkzpOoqjzqje4lE+xhfKPPYmB/Dc0BPruaJub74G
         QuMR5q1CBxeAbK30nDXr3YLXvCoZkbzQ7ljDhVYho+4psljHyAv31a8V/Rkyf/1fc9z3
         IbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704357850; x=1704962650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4epjjtWpm5YSGmP4xrJiMs2lpLIiDHgjuHx9R0clTd0=;
        b=a3LgVXHEF3XMp8NjFWVn/5g1j/I7B2FS7j8T1PwowcYcqho7bNQYKlwrdz29kfvdxK
         YkJYY/nfmRvKNXKdGxtMJ3kF7ESi6/OJosHRQ4EiqmJD8rlXUisgjHoBpX+8IDv3XLNp
         +d2s3ru4f1RnrMe+yS/205sH5xgFFulvj03QAZUXxHOqBLSM4SABwr/io90GAXwK0zOB
         R1phu4kh3pPj2Izi1dSqqYOaKyXgY7EBBCoBK54IZk8oCrk7Cs8ft0tZ4KG6TZIZZ8mL
         ZxwnEKKd1GdT8ynZ5JmN7P6dVhdBrTfw1IMYLFCsTjB78Q3wa9hzr3w58S88hq/nyJEd
         PFZQ==
X-Gm-Message-State: AOJu0YxvjNVotcjBofUY1m7Nm14Ggcp6phdB1rBaJTfokloq/aK9nPFS
	M9QKCa6CEwRFgVya4GfMu2NFtIG5c9Quww==
X-Google-Smtp-Source: AGHT+IFjo5G9hUEsiOBKeZmfjHqIDoS4qnsJnLjC6+kfhzlYxJE5w3Yd1fDSK0j2mr1dRUuO1P9phQ==
X-Received: by 2002:a17:906:a3d6:b0:a28:a940:5305 with SMTP id ca22-20020a170906a3d600b00a28a9405305mr122872ejb.6.1704357850151;
        Thu, 04 Jan 2024 00:44:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d3-20020a1709063ec300b00a280944f775sm3460797ejj.153.2024.01.04.00.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 00:44:09 -0800 (PST)
Date: Thu, 4 Jan 2024 09:44:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	KVM list <kvm@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Re: linux-next: Tree for Jan 2 (riscv & KVM problem)
Message-ID: <20240104-b82c16721dab11facda797db@orel>
References: <20240102165725.6d18cc50@canb.auug.org.au>
 <44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org>
 <20240103-d2201c92e97755a4bb438bc3@orel>
 <1ab4ff24-4e67-43d7-90b7-0131182b7e1f@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ab4ff24-4e67-43d7-90b7-0131182b7e1f@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_004414_014484_04FBB631 
X-CRM114-Status: GOOD (  21.87  )
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

On Wed, Jan 03, 2024 at 10:06:52PM -0800, Randy Dunlap wrote:
> 
> 
> On 1/3/24 07:18, Andrew Jones wrote:
> > On Tue, Jan 02, 2024 at 10:07:21AM -0800, Randy Dunlap wrote:
> >>
> >>
> >> On 1/1/24 21:57, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20231222:
> >>>
> >>
> >> It is possible for a riscv randconfig to create a .config file with
> >> CONFIG_KVM enabled but CONFIG_HAVE_KVM is not set.
> >> Is that expected?
> >>
> >> CONFIG_HAVE_KVM_IRQCHIP=y
> >> CONFIG_HAVE_KVM_IRQ_ROUTING=y
> >> CONFIG_KVM_MMIO=y
> >> CONFIG_HAVE_KVM_MSI=y
> >> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
> >> CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
> >> CONFIG_KVM_XFER_TO_GUEST_WORK=y
> >> CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
> >> CONFIG_KVM_GENERIC_MMU_NOTIFIER=y
> >> CONFIG_VIRTUALIZATION=y
> >> CONFIG_KVM=m
> >>
> >> Should arch/riscv/kvm/Kconfig: "config KVM" select HAVE_KVM
> >> along with the other selects there or should that "config KVM"
> >> depend on HAVE_KVM?
> > 
> > We probably should add a patch which makes RISCV select HAVE_KVM and
> > KVM depend on HAVE_KVM in order for riscv kvm to be consistent with
> > the other KVM supporting architectures.
> > 
> 
> Yes, I agree.
> 
> >>
> >>
> >> The problem .config file causes build errors because EVENTFD
> >> is not set:
> >>
> >> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_irqfd_assign':
> >> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
> >>   335 |         eventfd = eventfd_ctx_fileget(f.file);
> >>       |                   ^~~~~~~~~~~~~~~~~~~
> >>       |                   eventfd_ctx_fdget
> >> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> >>   335 |         eventfd = eventfd_ctx_fileget(f.file);
> >>       |                 ^
> >>
> > 
> > Hmm. riscv kvm selects HAVE_KVM_EVENTFD, which selects EVENTFD. I'm
> > not sure how the lack of HAVE_KVM is leading to this.
> 
> The "select HAVE_KVM_EVENTFD" is gone in linux-next.

Doh, sorry about looking at the wrong tree...

I'll send a patch for riscv kvm now.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
