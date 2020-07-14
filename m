Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA29EC433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 05:32:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD2A21927
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 05:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tU49+NUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD2A21927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4SByNa68fYj6O2z16ZzbbVxlJe9yQUv7bwlS3B9DIk=; b=tU49+NUPgFvzKoOssTmb+ItIH
	VguEy259ciUMPUiqgrqEh5M0qduhmxLJYaGTAazgjsUNrA+fm0d+p//LPBPJ6vdfW25jCd/VQwGF/
	y45C0CgCDXt3wa13iZKXM0LyS370A3v+LvmJ839EPQxgg1DSz6wm9uBk/QuM9IW4SO2lgtry6QI9R
	IJKSRWEI1QxmSGTSKImrR7ImTisEeGPPAh2Xji1qnREIHaD8OdCa2U7t35z93NcWRwcYMZHnvqPU0
	LFJpSERqn2aMSGGIIQ04aHEIfY4+9xHHrfGT2GSRGh/tVZAfcuXL+08ue7CtV5DrGucdZrpzkWV/9
	ujdKXoKAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvDYe-0005ro-P9; Tue, 14 Jul 2020 05:32:48 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvDYc-0005rB-8q
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 05:32:47 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CAACB004;
 Tue, 14 Jul 2020 05:32:46 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Double the stack size on rv64
References: <20200714011922.138617-1-palmerdabbelt@google.com>
X-Yow: Didn't KIERKEGAARD wear out his TIRES in VIENNA during a SNOWSTORM of
 FREUD's unpaid DENTAL BILLS?
Date: Tue, 14 Jul 2020 07:32:42 +0200
In-Reply-To: <20200714011922.138617-1-palmerdabbelt@google.com> (Palmer
 Dabbelt's message of "Mon, 13 Jul 2020 18:19:23 -0700")
Message-ID: <87v9iq4q6d.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_013246_414106_391ACB20 
X-CRM114-Status: GOOD (  13.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: colin.king@canonical.com, linux-riscv@lists.infradead.org,
 stable@vger.kernel.org, dvyukov@google.com, david.abdurachmanov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 13 2020, Palmer Dabbelt wrote:

> This was suggested in the syzkaller thread as a fix for a bunch of issues.  It
> seems in line with what other architectures are doing, and while I haven't
> personally figured out how to reproduce the issues they seem believable enough
> to just change it.
>
> Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> I've put this on fixes as I don't see a patch from anyone on that thread, and
> it seems straight-forward enough to just do it.  If there's any issues I'm
> happy to listen, otherwise this is going up later this week.

See
<https://lore.kernel.org/linux-riscv/20200708145625.GA438@infradead.org/T/>.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
