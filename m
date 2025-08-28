Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB410CA0FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 03:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qcFG0a1rqxdsp8lzluQjT9xP0Z/DRQogHX3SmNUTEk=; b=at38fGGf+6gXQA
	IQSTKTSYtvECW2iENj4FLboBiZRbwTaMZr5qRMgEMezX6Cfht4mzQE+tooHvUMDku5eOZp5rpdzIU
	qN+YOf8O/Ymm9JRFvlH3tqJU3PFzl7eTrza2PN/xk6u84spLeZZmDjuyAIYOWJh3dodVqqZ1v7dwp
	uF3f4F7XL04S8F+hTZy2fDUuGk0Vpx3f9a2AX4DeG5u3moNtrbyA2VTwyEOIbz7pcFwd+86HnMVE2
	egwMzt6FA8na1ZbranasFw4+ZSxvmzVv39jPsg0IXGEcLeCOKd9KWs8jI/GltXWwQaOIlGHOLTEY9
	iBe9Ym5tmeUH61K0sVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTgJ-00000000Av0-1emp;
	Thu, 28 Aug 2025 03:52:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTdY-00000000Ag1-2bqn
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 03:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756352958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uzv1TpitFH2MWtQCE2YAgMRuIwrsgG0F2dWnOgzNbxU=;
	b=P0fsY9V2OTD7vKs/OsU2tqPz71GM7RxHix9+zjkXMtcwQagPSq0D4HT46wkSEHUcnxtMRa
	I1dMk6aQuCxdCSWfAcWUfsVmcpMYzwd76ZTV8YoAkvsFppjMuHxmLSJaNdE9W/GGYoUJgV
	/jnFW0LwAQrUUFWosArdFNWyv6ZmQbo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-75-oEaYp2oLO5OtXgsJu53zxg-1; Wed,
 27 Aug 2025 23:49:14 -0400
X-MC-Unique: oEaYp2oLO5OtXgsJu53zxg-1
X-Mimecast-MFC-AGG-ID: oEaYp2oLO5OtXgsJu53zxg_1756352952
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54EBE180035F;
	Thu, 28 Aug 2025 03:49:11 +0000 (UTC)
Received: from localhost (unknown [10.72.112.154])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0E2A1800447;
	Thu, 28 Aug 2025 03:49:09 +0000 (UTC)
Date: Thu, 28 Aug 2025 11:49:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Coiby Xu <coxu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 0/3] kexec: Fix invalid field access
Message-ID: <aK/RsVZxBw108MNJ@MiWiFi-R3L-srv>
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_204921_079505_B500B8B5 
X-CRM114-Status: GOOD (  15.40  )
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

On 08/27/25 at 03:42am, Breno Leitao wrote:
> The kexec_buf structure was previously declared without initialization.
> commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> added a field that is always read but not consistently populated by all
> architectures. This un-initialized field will contain garbage.
> 
> This is also triggering a UBSAN warning when the uninitialized data was
> accessed:
> 
> 	------------[ cut here ]------------
> 	UBSAN: invalid-load in ./include/linux/kexec.h:210:10
> 	load of value 252 is not a valid value for type '_Bool'
> 
> Zero-initializing kexec_buf at declaration ensures all fields are
> cleanly set, preventing future instances of uninitialized memory being
> used.
> 
> An initial fix was already landed for arm64[0], and this patchset fixes
> the problem on the remaining arm64 code and on riscv, as raised by Mark.
> 
> Discussions about this problem could be found at[1][2].
> 
> Link: https://lore.kernel.org/all/20250826180742.f2471131255ec1c43683ea07@linux-foundation.org/ [0]
> Link: https://lore.kernel.org/all/oninomspajhxp4omtdapxnckxydbk2nzmrix7rggmpukpnzadw@c67o7njgdgm3/ [1]
> Link: https://lore.kernel.org/all/20250826-akpm-v1-1-3c831f0e3799@debian.org/ [2]
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Breno Leitao (3):
>       arm64: kexec: Initialize kexec_buf struct in load_other_segments()
>       riscv: kexec: Initialize kexec_buf struct
>       s390: kexec: Initialize kexec_buf struct

Thanks for the fix, all looks good to me.

Acked-by: Baoquan He <bhe@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
