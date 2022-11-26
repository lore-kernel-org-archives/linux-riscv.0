Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D04C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeYCP3/QrD3F7qciptbG1zd8zcBzzuIjJQcQ5pW+Xsk=; b=UfO8TNr+a+hz5D
	bPEqYUskgDwXEAZ+nzeRcLapGBR10aPgXvE7TqpheBsUoBluC4Va2UYyJoAAs+ZORzhNQQEqfMZLu
	sa3N8HUOENp6EX54QPHEKpujvNQhKR4kQ5NTR/bABZ2kaESIo/iNzyWpv98qq6hzJLwHN3VpemZg1
	dfUNlISBkLv+fLE0hfh0TsxEu60u/GUEZwLzKVO/N83JUs1A9pyJYl4aFb7NJK97+ET2KFD1Yg8U4
	MBT2bHwsSPlAhudsA1bhsJoSDSrTkg9gYprKt0uAwFDuC6X0A0wVgqkiFkxQ91CELtUxvXz3Ufyga
	CRVo0dl/mR+wUJwgJAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz0hS-007vKg-84; Sat, 26 Nov 2022 19:18:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz0hN-007vHT-7X
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 19:18:51 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C44903F0B5
	for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 19:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669490324;
	bh=3jItt0ash3hJiki2QJADtgoIkp7l1vksCPuWqsHPOEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=FN4gjz8e8sQLVUrWbPu86i4T03ksrdFdV91C+9eF8Rt/40VOJJwRe+qOYGul2wYpn
	 hA7Erk3CUzN12/xZB4SLlxWO4PPKMfBSlJajCZEiip2zBaVGvfvn9Llv+16YJNbm0s
	 0qN5FwbtJqeguhm/ZNk0ozNYu+JoR8h0rrgkoOUtj1vGcxxGtouGKY0uper0omtTH3
	 gNYdcRgj35z8Mrb0QcpsOLFzumXNRDVe4k/8Dv7escHJcfitq6IGa8/HhDeakT9v0Q
	 yWsEeNPcYj1yg3MqsOZsURmQ7vDNPykHJrPXWmE6o3gz++SqHBmMu0k+i5NIulbcD1
	 CsSTXWfhS4VPw==
Received: by mail-ed1-f69.google.com with SMTP id h9-20020a05640250c900b00461d8ee12e2so4453347edb.23
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 11:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jItt0ash3hJiki2QJADtgoIkp7l1vksCPuWqsHPOEA=;
        b=VFPvszg9SmRYBjwSwOuMlwea8nSMr8+kcenFlrHVWs3vdcCrai2G4bpsNu/Q+7oLD5
         tBQrC8XeQ5iRHLWp61OMEV1HCN6hXlpZ1cVsGJlY5jh5BKZTWzekEsC5/yYcAPahHhGM
         CcEQo8VhzeKB4lm1czuy9Lis6vq/2GZyFwka+ZPB8ZqmK4r2+UKXfo43oe4fmIHf2kKP
         kJVDeN7Jvd8SdDFGnqalaYdZiDCb80C3pgiH6APgUTmR9xpWTS8nZKrzWNbX+1CJ6SWK
         R1dVqwcVNl4sFxm+MfGLE5w8xLTTat8fNuqBH7hWK66Au3h4sJAfyh30DKu5yClA0mR9
         F6SA==
X-Gm-Message-State: ANoB5pnrUH/chH0H9HRQi1FSddY4m/o6jQdbdF3RmcshGVtrAtXpa7sW
	R+MiTfe2X6Ll2SnAZUwuV3MS6V4lePKEpuLjH0cCRr8WSnOvs8pTPZR8WZ4215bqBz0kLmNxJuB
	kZIoOK3qeZ3CQM+oVKsJAW8LK2ydBTtUSM31LvOsrXHiZCw==
X-Received: by 2002:a05:6402:5010:b0:467:60bd:41a1 with SMTP id p16-20020a056402501000b0046760bd41a1mr41669392eda.97.1669490324457;
        Sat, 26 Nov 2022 11:18:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4eQn2h60P7KFREvb4hY60Hz7Uxi+cxQKbGlNYDp2XAebbhV4E/WIex/WNPH9L1Kw7thsUSOA==
X-Received: by 2002:a05:6402:5010:b0:467:60bd:41a1 with SMTP id p16-20020a056402501000b0046760bd41a1mr41669384eda.97.1669490324251;
        Sat, 26 Nov 2022 11:18:44 -0800 (PST)
Received: from localhost ([95.236.177.174])
        by smtp.gmail.com with ESMTPSA id w21-20020a170906385500b0077a201f6d1esm2971541ejc.87.2022.11.26.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 11:18:43 -0800 (PST)
Date: Sat, 26 Nov 2022 20:18:43 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: increase boot command line size to 1K
Message-ID: <Y4Jmk74enBTwkNcR@righiandr-XPS-13-7390>
References: <20221125133713.314796-1-andrea.righi@canonical.com>
 <Y4Je7chN+fQM3NpP@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4Je7chN+fQM3NpP@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_111849_656900_EF757F21 
X-CRM114-Status: GOOD (  18.25  )
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

On Sat, Nov 26, 2022 at 06:46:05PM +0000, Conor Dooley wrote:
> Hey Andrea,
> 
> On Fri, Nov 25, 2022 at 02:37:13PM +0100, Andrea Righi wrote:
> > Kernel parameters string is limited to 512 characters on riscv (using
> > the default from include/uapi/asm-generic/setup.h).
> > 
> > In some testing environments (e.g., qemu with long kernel parameters
> > string) we may exceed this limit, triggering errors like the following:
> > 
> > [    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> > [    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
> > [    3.333233] Hardware name: riscv-virtio,qemu (DT)
> > [    3.333550] Call Trace:
> > [    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
> > [    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
> > [    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
> > [    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
> > [    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
> > [    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
> > [    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
> > [    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
> > [    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
> > [    3.335857] SMP: stopping secondary CPUs
> > [    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
> > 
> > It seems reasonable enough to increase the default command line size to
> > 1024, like arm, to prevent issues like the one reported above.
> 
> error: arch/riscv/include/uapi/asm/setup.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
> 
> Unfortunately this does not build :/
> 
> Thanks,
> Conor.

Oh I see, because it's uapi it needs "WITH Linux-syscall-note",
wondering why I can't reproduce this failure...

Anyway, as pointed out by Alexandre, there was already a previous
discussion about this topic:
https://lore.kernel.org/lkml/CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com/T/

Hopefully this change will be addressed there (and the patch land in
-next at least), otherwise I'll post a v2.

Thanks,
-Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
