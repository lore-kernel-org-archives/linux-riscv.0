Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE67C87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwTwfavs8MHNn+8+z4MA6ZUP9HFL1U7C+I7nESMzzpg=; b=iEZUowoo49A7Tk
	203AeFtvPlG6P6r0iIEfxnii+jDmOOqnc6llBb/hthSBmgOFYVbO8exzgEUBGzsjuuMHraqR0y4Ri
	oz2Pp3mEFIgwBq7nWL3xzZ377TVcAgQCGGjOoAGSRVPX12MBkWsM3MGxABuumGrW72Eei4kcYBSCt
	t+IKdyXjTQWzIopm6n0T4OB645cbpo2dX3MTW6F0dzglEcSu6m9qP5r1SCqa9Dzj/El8vkmiunjpZ
	JiMVJKpoDz8IQYpaHn8Vcef9g85e7yLIkg70/Y5ck/klXs6CntuyqZf2rlQ9497IqbIYV37W43KV1
	7QmEBTuYxTM4Wu74vTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukfAU-00000004HKf-1uk2;
	Sat, 09 Aug 2025 08:43:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukfAR-00000004HKJ-2E8x
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 08:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754728985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+vP3eh5eUjP7Lq+gTWgW1fmf2ENVDRoJb0qh1Cws54=;
	b=XmY88VkuwzWK+9uCC7j+JfXClyIdg7AVsjun0sv45m7jqBihwPkns1NLPU3HApk9k3n/33
	ZvubgtZluTgvk6legPMeFv7egMgEhda72ALJR9U7JnUXr/0x6nZc9ClKJurxK5sT2cC4Et
	gmZO4DmRDt6ud/bSVoa/3I+WT+X7+PY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-cCaGX3YIMmO3w5FJf_xLRA-1; Sat,
 09 Aug 2025 04:40:36 -0400
X-MC-Unique: cCaGX3YIMmO3w5FJf_xLRA-1
X-Mimecast-MFC-AGG-ID: cCaGX3YIMmO3w5FJf_xLRA_1754728834
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 330E4180048E;
	Sat,  9 Aug 2025 08:40:34 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.45.224.52])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E76E919560AD;
	Sat,  9 Aug 2025 08:40:29 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alexandre Ghiti <alex@ghiti.fr>,  Samuel Holland
 <samuel.holland@sifive.com>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,  Andy Chiu
 <andybnac@gmail.com>,  Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  Drew
 Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate
 during syscall
In-Reply-To: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
	(Drew Fustini's message of "Wed, 06 Aug 2025 07:03:28 -0700")
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
Date: Sat, 09 Aug 2025 10:40:46 +0200
Message-ID: <lhuo6so7ur5.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_014307_694146_935F9EC0 
X-CRM114-Status: GOOD (  10.48  )
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

* Drew Fustini:

> From: Drew Fustini <dfustini@tenstorrent.com>
>
> Clobbering the vector registers can significantly increase system call
> latency for some implementations. To mitigate this performance impact, a
> sysctl knob is provided that controls whether the vector state is
> discarded in the syscall path:
>
> /proc/sys/abi/riscv_v_vstate_discard
>
> Valid values are:
>
> 0: Vector state is not always clobbered in all syscalls
> 1: Mandatory clobbering of vector state in all syscalls
>
> The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.

Can this be put into the system call number instead, or make it specific
to some system calls in other ways?

I think C libraries can use this optimization for their system calls
(after adjusting the assembler clobbers) because the vector state is
caller-saved in the standard calling convention.  But there is backwards
compatibility impact for turning this on for the entire process.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
