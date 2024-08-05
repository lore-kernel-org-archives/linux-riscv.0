Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5808C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEd8Zk9vtWp4dxRtbg642OK2BKPdLKHmSs3ZQS6cVxY=; b=gnnY8gjNyxEjMC
	ZW5iKTVAxcv7HJ4gJkiTiffKBtpoQQwa3Q6DctlQYJ62mGQtgp+cpkmkYDIxs4Dqk/jFohPEZKA/3
	Sk+qwoLoRXnGtc7fH8OYRmb7eOq7mkFs8QojGDgC8oaceqocOEAVulDVHEeqvO6hhweKTZeEmxLc2
	T3SDbZJoAco+/t/5t9NFzxino9osW/eL6PyrU2Eu8/GZKLe7H1wB0LENX1NgJLlj9qSJS5AV2dtTm
	+SBVvNOHenOxd/+TQLCo86/1IheY3jCg/QIaOhLL4bB8R+Va9BbN0ftGASrlM9+5mfn2SnhLi7jL/
	Ua5HEdoj3QtIBrIrFcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3mO-0000000H5qX-3fRj;
	Mon, 05 Aug 2024 19:54:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3mM-0000000H5ow-1P7r
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 19:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722887640;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=QMcB7PhofnR3QJhm5j9PvLH/K7OQu77lKAt5++u+MFU=;
	b=YZ48RtCqaQQYhsj4ypVNXk/CHEkv/hdNO4pCWWJlOo7upuyeG3JgLtB877hMBzqrv1iybR
	q/bJhIDPYN31umL0pG6JW3aRwd5C84YdOaPloOGBT2eaWyW0DSCjk2vFRiEyVHNoiL+SOY
	QJnkxo69PaYSbBTWHgiUNyN4lq48a7Q=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-JDnuY8mBNhiOQheAGsfQPA-1; Mon,
 05 Aug 2024 15:53:57 -0400
X-MC-Unique: JDnuY8mBNhiOQheAGsfQPA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA6701956080;
	Mon,  5 Aug 2024 19:53:53 +0000 (UTC)
Received: from tucnak.zalov.cz (unknown [10.45.224.25])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C8CA1955D42;
	Mon,  5 Aug 2024 19:53:51 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
	by tucnak.zalov.cz (8.17.1/8.17.1) with ESMTPS id 475Jrm4I3885874
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 21:53:48 +0200
Received: (from jakub@localhost)
	by tucnak.zalov.cz (8.17.1/8.17.1/Submit) id 475JrjfI3885871;
	Mon, 5 Aug 2024 21:53:45 +0200
Date: Mon, 5 Aug 2024 21:53:44 +0200
From: Jakub Jelinek <jakub@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rudi Heitbaum <rudi@heitbaum.com>, Arnd Bergmann <arnd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Andreas Schwab <schwab@suse.de>, Florian Weimer <fweimer@redhat.com>,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-api@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev
Subject: Re: [PATCH] syscalls: fix syscall macros for newfstat/newfstatat
Message-ID: <ZrEtyJd2qydKcWxQ@tucnak>
References: <20240801123305.2392874-1-arnd@kernel.org>
 <Zq28wejX3U9J1_JV@faede8dcc269>
 <Zq3jqeq6USL066k+@tucnak>
 <c78916da-ee59-4ecb-9886-7bbc7f077fa5@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c78916da-ee59-4ecb-9886-7bbc7f077fa5@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_125402_467390_DE38C463 
X-CRM114-Status: GOOD (  14.74  )
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
Reply-To: Jakub Jelinek <jakub@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 03, 2024 at 10:12:47AM +0200, Arnd Bergmann wrote:
> > Probably it would be useful to check
> > echo '#include <asm/unistd.h>' | gcc -E -dD -xc - | grep '#define __NR_' | sort
> > for all arches between 6.10 and the latest git, diff them and resolve any
> > unintended differences.
> 
> Right, I should have done that before the original series really:
> I spent a lot of time validating the kernel's internal changes for
> consistency (which found a dozen bugs that were unrelated to my
> series) but missed the unintended changes to the external header
> contents.
> 
> I'll do that now and send another fixup.

I've done 6.10 to 6.11-rc2 <asm/unistd.h> comparison just for the Fedora
arches (x86_64, aarch64, ppc64le, s390x, i686).  Full details in
https://bugzilla.redhat.com/show_bug.cgi?id=2301919#c8
On i686, ppc64le and s390x there are no changes.
On x86_64
#define __NR_uretprobe 335
has been added, perhaps that is intentional, haven't checked.
On aarch64 when going just after __NR_ defined macros and their values,
I see:
#define __NR_nfsservctl 42
#define __NR_fstat 80
#define __NR_arch_specific_syscall 244
#define __NR_syscalls 463
removal and
#define __NR_newfstat 80
and addition and then
#define __NR3264_fcntl 25
#define __NR3264_statfs 43
#define __NR3264_fstatfs 44
#define __NR3264_truncate 45
#define __NR3264_ftruncate 46
#define __NR3264_lseek 62
#define __NR3264_sendfile 71
#define __NR3264_fstatat 79
#define __NR3264_fstat 80
#define __NR3264_mmap 222
#define __NR3264_fadvise64 223
macros are removed as well (let's hope it is an implementation detail and
nothing uses those macros, but some search would be helpful).

	Jakub


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
