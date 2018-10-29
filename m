Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34350C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 22:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73DA2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 22:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oL5HKx1G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="Ufl/m0Se"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73DA2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYYrV8bYGTAVRXpyP/YmnHz2scJMlNDMdqLakQXtcQ0=; b=oL5HKx1GFed05h
	yLvvc9wiPcwhH+54x2BRBn5UPmre1yBgzpXsoElLW9r3wZw3IsvYIqECHbKETpqE/Zi64E+djASz/
	APltyTZ2NwBMU2nF31DXmtA2CMo/RXIFGkdTQJGVb1fAWG/nZq2quUsTAfSXVNvz4L6ffiTga6dSY
	2Ww8Qxh1uPa3Gu9HYmUwcVjQrVM9nBq9oXiEwaXPKNClZp9jWh1V2ysolZJbx42tcN+8b1h9vUShQ
	3UII8xC0HECQZ8VhUYW78VW99Vk73tNugi5dskjWNGRYOUwZjN+fclUXIFr8xiI/zmThZbdVs5HQZ
	HLH6OWK8fqIWer975csQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHGU7-0002B9-SU; Mon, 29 Oct 2018 22:58:11 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHGU5-00029h-8v
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 22:58:10 +0000
Received: by mail-lf1-x143.google.com with SMTP id o2-v6so7369925lfl.13
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 15:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HAaDmrAhiPIUs37kgOYsuLv6czEMDqu6UUWI/wc1ByU=;
 b=Ufl/m0SeikOBfA0wbXyLlcAUlbpY+4/mTTOt7gzUSr81A2a+YoPJgRRjxxXTSOWlIZ
 ikIJtQRPgWeuKPvFzD8+Uq6IGlG8wraAwAYXbU31iOL+/geSyeury0NDOBBjbpbdecFo
 XfToOUDJu4vmX2mLNjbS8CthKmztMudI/zrsSV9YcZrNTYun0wAEE7BHbc13gFFdtleU
 esssIvtr6DRBAugWSfo3HTqd9FK4tXMXHIM0lTFCLBOosS2kizGF+ptvmcIR+SAhvJb9
 0ZvIciQQ1Nwivg6KBxX+RvtslGMRNZWAGfZtOHkaUSExWDP0Sl6AoZ2VjEornFc3yc3m
 eJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HAaDmrAhiPIUs37kgOYsuLv6czEMDqu6UUWI/wc1ByU=;
 b=ht1cy96X+QeUiKxp+TJaPSZV8N9cZXB9pFIkYMsMzgd0cJ17fa2AXA48hpjWTlMxLE
 6H8o2kfVHwy16HUHSqInimE/hxllYQqvLwDdq5cFE6YZWLF6sva/BHuur3p/oQNNYtyI
 F15RahQNwxjg5vyosxcQVabamlqbW7QOGkth/FnLb8yRwh4f9XAVCpgDsLU+1jSZRGXG
 ajneVg5nx3vFqnjyvc6R8mMdfd4GhmMtHd4/c4rKmV2Aq/TmnSMS/IWI+TMX6+dpBAjj
 4AVbufnUyX9yEmjZcqIrMIA0k8zYa+Unakf67n2HfwEY/cAPoDMIBtQN95euPWySJ4S9
 /gwQ==
X-Gm-Message-State: AGRZ1gLhJeCeONvalyosZfGiqfwstqjQtA2sKgW67sUV6bM4/tFNDBP/
 jRhhrZX3mhAJdgEG1VPys1xCaP3IRzwlJVCBcYZJ
X-Google-Smtp-Source: AJdET5cnY5C2KXoS4EiIdSfvk2LmTIDoCW3vGKR3yeiE06YWN40lhCG+NEticxkPmLs9zP9UMMq67yqYqxfcQ45eNUc=
X-Received: by 2002:a19:1a41:: with SMTP id a62-v6mr372254lfa.40.1540853875709; 
 Mon, 29 Oct 2018 15:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
In-Reply-To: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 29 Oct 2018 18:57:44 -0400
Message-ID:
 <CAHC9VhSdOJunU18-FxbdmTuEmwtwzSbaBwt71P-F5hP3sLW-Ag@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: add audit support
To: david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_155809_315998_2C202773 
X-CRM114-Status: GOOD (  15.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-audit@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029225744.CgbD5_O6a_K9VSVX2J84RQY2GMxtDqNoyK9FlbzpZWg@z>

On Mon, Oct 29, 2018 at 6:49 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> This patchset adds system call audit support on riscv (riscv32 &
> riscv64).
>
> The pachset was prepared on top of v4.19 tag.
>
> audit-userspace changes were submitted. See:
> https://github.com/linux-audit/audit-userspace/pull/73
>
> Tested the following manually:
> - auditctl (checked several different example rules from internet)
> - aulast
> - aulastlog
> - ausearch
> - ausyscall
> - aureport
> - autrace (compared some syscalls to strace: order and return
>   value/input arguments seem to be correct)
> - /proc/self/loginuid (required by DNF [package manager])
>
> I looked into audit-testsuite and with some adjustments results are:
>
> Failed 4/14 test programs. 19/88 subtests failed.
>
> The failing tests were due to missing CONFIG_IP_NF_MANGLE, 'id -Z' not
> printing categories (don't know why), not having loadable kernel module
> support enablled and syscall_socketcall not being relevant for new arches.
>
> audit-testsuite with adjustments:
> https://github.com/davidlt/audit-testsuite/tree/riscv64
>
> Depends on:
> [PATCH 1/2] Move EM_RISCV into elf-em.h
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html
>
> This should solve DNF issues in Fedora 29/RISCV.
>
> David Abdurachmanov (2):
>   riscv: add audit support
>   riscv: audit: add audit hook in do_syscall_trace_enter/exit()
>
>  arch/riscv/Kconfig                   |  1 +
>  arch/riscv/include/asm/ptrace.h      |  5 +++++
>  arch/riscv/include/asm/syscall.h     | 10 ++++++++++
>  arch/riscv/include/asm/thread_info.h |  6 ++++++
>  arch/riscv/kernel/entry.S            |  4 ++--
>  arch/riscv/kernel/ptrace.c           |  5 +++++
>  include/uapi/linux/audit.h           |  2 ++
>  7 files changed, 31 insertions(+), 2 deletions(-)

Thanks for the patches David, I'll be able to take a closer look next
week once the merge window is closed.

-- 
paul moore
www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
