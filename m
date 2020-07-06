Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22268C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 08:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2890206E6
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 08:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mnh/UECL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2890206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=acN/Wm+PBDop9w3xlFSGVf8jarHG20uwSFwE0r6if0k=; b=Mnh/UECLWlcVUuO6fW9Z2I3tr
	/ZCtQFtuJ8k0MPPN2bdCbZJRDPwpeqEJSU31IVmILY4NkNsmPLOiD0RfmvXZZBiJcFdI+T1Y/R8in
	xVJ9DqlOhKQgYD+ZM0zQO6LzZ+YH6TcZtruW3XB3Iq8gHmA7SgUyTn0JTqaQqTlxU811XHvWWzB4X
	kO+gcIrFfuUrLc0gkdpgKbH752zZ0PGlOyxJIG84/WAj1eLr3OqSud6AZvoI8HF+wuP+bPaty2wQw
	xD2Y77Mz97kM+V1p472mRBwp3KZkd1+QzovXcevbMAdUXSnC4z/fIGakQAU0DfntPGFP0EnQkL3lx
	cwImWL4MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsMH5-0005XT-2f; Mon, 06 Jul 2020 08:14:51 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsMH2-0005WZ-TU
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 08:14:49 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D15B5B160;
 Mon,  6 Jul 2020 08:14:45 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: syzkaller on risc-v
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmlfk4n1mj.fsf@suse.de>
 <CAEn-LTqVR4CXk-q=7zwFKvgmHEZpP+AO0XiycKf9mDAHS60_yg@mail.gmail.com>
 <mvm8sg4n0ja.fsf@suse.de>
 <CAEn-LTq8cxT73p29hCx5_B9-b_J0khTFgEJAPwFE8zesktNE1A@mail.gmail.com>
 <mvmzh8klld6.fsf@suse.de> <20200702220045.GA1187627@aurel32.net>
X-Yow: I own seven-eighths of all the artists in downtown Burbank!
Date: Mon, 06 Jul 2020 10:14:44 +0200
In-Reply-To: <20200702220045.GA1187627@aurel32.net> (Aurelien Jarno's message
 of "Fri, 3 Jul 2020 00:00:45 +0200")
Message-ID: <mvmy2nxcb63.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_041449_057639_32D08819 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 03 2020, Aurelien Jarno wrote:

> On 2020-06-30 15:43, Andreas Schwab wrote:
>> On Jun 30 2020, David Abdurachmanov wrote:
>> 
>> > You seem to bootstrap with gccgo, which will not work (tried it).
>> 
>> I consider that broken.
>
> I agree that something is broken. Here gccgo is broken, not Golang. 

Agreed.  I was able to bootstrap go1.14 now with the other bootstrapping
method.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
