Return-Path: <SRS0=b7IV=KA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95BEC433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 19:08:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387F5613BC
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 19:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387F5613BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1+nNMn0WAZW/B5gMxirHnffEP5im37TT2sQoGnIrQmA=; b=ElL6vtBGQbsbBsmaXvNE8RWix
	YvM0mUfjTy2BsFDq4zXKspKknRrWehoCmOglAx9GHRFzxOvikilTdJo5fysE2NTKe/WD+P4aRj1Sa
	RdG0Hn7qp/As0ACaegkMOrAyY1NIJ54dwRW1lJJZZCOqPQ+I0gm7VlNrdx3oF4CwXyzuJ+0US6zSD
	3alyTkp+18blBVr+0c5zY3vjt4YfPryyPOkPOtSOZEyMjRCLLv3gtmKVv7vlWjdWqxqNlDR+6Lneh
	hWQgpUlJI9py8t7xhW9QFH1UkdammNT9cGUXZFVdWHOJ/J7t2m8iqcKadmR89IvzP+uBoIUQErSGz
	DZ6z9vn2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leMsm-0026jm-1p; Wed, 05 May 2021 19:08:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leMsa-0026is-Ek; Wed, 05 May 2021 19:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=KetdvTVcEZYEg3KI8wZrAYaLGmySEOM12uTYfAQ4Bd4=; b=yHydWOUt4sFf1Oy9KJkUjRcNro
 5Iy4qCq9BycCp6ryYs0uNqwpW3jMz5mUv6AZj0oMucHpPlIDfqdHkYevWS2A18ZyWVLvDZPcfLuIB
 NqHLqMEGEXX87rrCMxVofKhtUwDHHIm9AD5kOzx4xOVtLTNLrhrhB6J+TD1cwVjL5rkiNtPCbFscb
 049lMBfzlVLcp3RDEhOwiWUI/IqESbplEjeWMv1yUVBm4xHyNAnU0Mb5M5bqWwLxMrQuDhHCQrb1p
 m+9ZI+Z8jfaiNMxw8dn7qglYsRprrOBSMuVtiWJ+XUY1t5dQ0wNgF4fmBmhzlV7v4hMLcUkfDaBoT
 sic/fTsA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leMsU-005BO5-5T; Wed, 05 May 2021 19:08:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F53D613BC;
 Wed,  5 May 2021 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1620241689;
 bh=hhpxxXD6aDeVp5ZewAeV19qTR1ebHSAlNlE2Ux5iOSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ug/m3Htuj/0ky54AF8kZ3lyLJYozDhbNWgyIX0TCxQniyIIVskzJR85jb1a8l24+P
 wj3Uq3KGTcmSyyj8MjENJW/Q1S0V1k1C7Ipr+8QQ7aULrVrbnYhAQH9rFXWSlKHVc9
 sXdVqWFVybXYIICA46jG/2KrFmKvLuINZAazEgtE=
Date: Wed, 5 May 2021 12:08:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christopher
 Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, James Bottomley
 <jejb@linux.ibm.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Matthew
 Wilcox <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Mark
 Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>, Shakeel Butt
 <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>, Will Deacon
 <will@kernel.org>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-Id: <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
In-Reply-To: <20210303162209.8609-1-rppt@kernel.org>
References: <20210303162209.8609-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_120810_313032_B27A8C34 
X-CRM114-Status: GOOD (  19.27  )
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

On Wed,  3 Mar 2021 18:22:00 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> This is an implementation of "secret" mappings backed by a file descriptor.
> 
> The file descriptor backing secret memory mappings is created using a
> dedicated memfd_secret system call The desired protection mode for the
> memory is configured using flags parameter of the system call. The mmap()
> of the file descriptor created with memfd_secret() will create a "secret"
> memory mapping. The pages in that mapping will be marked as not present in
> the direct map and will be present only in the page table of the owning mm.
> 
> Although normally Linux userspace mappings are protected from other users,
> such secret mappings are useful for environments where a hostile tenant is
> trying to trick the kernel into giving them access to other tenants
> mappings.

I continue to struggle with this and I don't recall seeing much
enthusiasm from others.  Perhaps we're all missing the value point and
some additional selling is needed.

Am I correct in understanding that the overall direction here is to
protect keys (and perhaps other things) from kernel bugs?  That if the
kernel was bug-free then there would be no need for this feature?  If
so, that's a bit sad.  But realistic I guess.

Is this intended to protect keys/etc after the attacker has gained the
ability to run arbitrary kernel-mode code?  If so, that seems
optimistic, doesn't it?

I think that a very complete description of the threats which this
feature addresses would be helpful.  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
