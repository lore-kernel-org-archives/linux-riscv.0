Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C354CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2024 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93T30dub+6mx6WLEXYjnyIGnnW8aeEw7SprKM5FCfKY=; b=r89wD758bl4bct
	qcxEgTw5BBwICztXI1UstSHah2HlxRoxIKgOigu8ZLkZTbH1S53IqlkuHo3WR5qW8ntyeumEqmFpb
	K5+rrAPqVKbmuhwNqxbF+tsPXjRA9gQvDgbdGAJgHOUHuyvK3jUHaMEIPwooRdPRgilEugcDeKGZd
	QYx6ydU2xbpIuwCLJxvjpCFrHWmmlOetm0S3muQKOc5IdPvHfu6b3aV4a03gv9rgUMwyF871FIL1T
	gIq0g6AFy3EzF6EmZbWF9hRlnBdsFcxGjR76a8IHg60NMKZUrXTg2UwRlPKaJWGW8lvrTa173hruB
	5sk6dcZ65yvSGP7wkQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa9jo-0000000B1VS-0Z7Z;
	Sat, 03 Aug 2024 08:03:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa9jI-0000000B1RW-2CB2
	for linux-riscv@lists.infradead.org;
	Sat, 03 Aug 2024 08:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722672186;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ChVTiGdYPFEhWu1znKPIMwiy58kLR6qAS9OD9lZfQ0M=;
	b=h3egY4Kg7ciCQk4Z2iuzpmCkgECUNyF2A4+iqutcbXBNmKAuNqj9EQx8ksdGzlllh96lDg
	bSXFrF+y20V9XQkCPzMjghwOVGLfINWZY/SYPALiiFu2nN5rcKLJkzU0LRz8l54Mu53Fgx
	y9uRgjx+tj8Bl0g2nCoZ2JoKyUZvfN8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-i1KcjCVDOlW0clbpFo74aw-1; Sat,
 03 Aug 2024 04:01:00 -0400
X-MC-Unique: i1KcjCVDOlW0clbpFo74aw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FC0C19560A1;
	Sat,  3 Aug 2024 08:00:51 +0000 (UTC)
Received: from tucnak.zalov.cz (unknown [10.45.224.25])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20CAF300018D;
	Sat,  3 Aug 2024 08:00:48 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
	by tucnak.zalov.cz (8.17.1/8.17.1) with ESMTPS id 47380i3q931236
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 3 Aug 2024 10:00:44 +0200
Received: (from jakub@localhost)
	by tucnak.zalov.cz (8.17.1/8.17.1/Submit) id 47380fEc931235;
	Sat, 3 Aug 2024 10:00:41 +0200
Date: Sat, 3 Aug 2024 10:00:41 +0200
From: Jakub Jelinek <jakub@redhat.com>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Andreas Schwab <schwab@suse.de>, Florian Weimer <fweimer@redhat.com>,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-api@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        WANG Xuerui <kernel@xen0n.name>,
        "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] syscalls: fix syscall macros for newfstat/newfstatat
Message-ID: <Zq3jqeq6USL066k+@tucnak>
References: <20240801123305.2392874-1-arnd@kernel.org>
 <Zq28wejX3U9J1_JV@faede8dcc269>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zq28wejX3U9J1_JV@faede8dcc269>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_010308_700168_DC6397E0 
X-CRM114-Status: GOOD (  10.86  )
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

On Sat, Aug 03, 2024 at 05:14:41AM +0000, Rudi Heitbaum wrote:
> With this patch to kernel 6.11-rc1 the error whilst compiling gcc-14.2 for
> aarch64 with libsanitizer has changed from '__NR_newfstatat' to
> '__NR_fstat', so some change, but still fail8ng.
> 
> sanitizer_syscall_linux_aarch64.inc:13:23: error: '__NR_newfstatat' was not declared in this scope
>    13 | #define SYSCALL(name) __NR_ ## name
>       |                       ^~~~~
> 
> sanitizer_syscall_linux_aarch64.inc:13:23: error: '__NR_fstat' was not declared in this scope
>    13 | #define SYSCALL(name) __NR_ ## name
>       |                       ^~~~~

Probably it would be useful to check
echo '#include <asm/unistd.h>' | gcc -E -dD -xc - | grep '#define __NR_' | sort
for all arches between 6.10 and the latest git, diff them and resolve any
unintended differences.

	Jakub


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
