Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DCEC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oh75L48wE34DQBlKF+UAfR929uO6W0GwznCUW0op0oQ=; b=n8zxwXUKAXqpuWeQQyEipx0brh
	Y7AQ6bXg+dlszfgkdeZokCI359FdtWnf4h37uqU5QoEhrZgJXhZyKJ1/+YBs+aYROR1tImq2PVTKp
	mRdUIUA4rSwqMvAFjxhGrEyqP8MyXLHHVLNTPc2ZFTXZdiVWbNva8OrF2vVxq3n+hX7VZmd3LVu+m
	i6gdmnShOCdB4EX210GTKIePU8L1Hkn1EMymlmoYy60dQbRR6WYqhFyTXh4EE+RSOB/hRjU05BDmf
	C7uWkHqIDUfXefPtVsoPN6lWii4wVS8X0b80JPlo4o1AUX6ozeBGA+Q0tHJnyd/La1k3ZIWyI2Vf4
	h6ELAmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWzW-00GSZ2-RE; Wed, 28 Sep 2022 13:20:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWzT-00GSXi-GH
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:20:45 +0000
Received: by mail-pj1-x1033.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso2251840pjk.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=MKjBtfVqM7oE/HjoEhHcpSAGvRLARwPkLBdhf/tEBvI=;
        b=VIdRVlWK9HuMTRWJJ/bibqa7mqDVzRWzAb40oXrki1m4cAhl2Kr1xDj9TxH9Gm+pEy
         Ne5gTkGgmcdt/v97l/9vZSPNZJ8xOno0skL7ZwqBm2ad/vobUktB5nOEe7DgUbib60sG
         XCMdrEulTsH5QLf6f/IZQ3HnL3XHKsMndLUwrSEm1QYqhVMusfVJ6laOTVMFoMFXstCq
         I8QQdzlLkyXtcUedi/ZwvG8BAuGWbSKjx5W3L6TUxVmn/J1097jiIoTNzeA9UFiFAcJU
         gbjOKw5K5irc7ov+X3osRXmFrVvg3kHgCou+JksNu3pundVdD5n/cNhTeR18+mB3reOZ
         n+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=MKjBtfVqM7oE/HjoEhHcpSAGvRLARwPkLBdhf/tEBvI=;
        b=xhdan4zBOM3uiKtmxmMZiH4ppEdkNwQPuRLBIKETCTZXFXeU8b01GR9fADM8sdqWLU
         svmP8KAuU2RuhvxbV92YAQmVpomFSufcFu1oGo43phcDV9BBDbRoADuve6AK9YYkx0QE
         oU8yOYCmB1xWtn9k8bAClEFtitizxMiYHmHFkJWej+pzdUqd2YAkyRboStzABUBIFvTu
         TOFXPr4CiNplLtG1XROhyQZNiLfAZ4lhWGZnrgYDRpJ9jVp/1xbwrdi3lZEipYkWy8MC
         51M83gmLwO07nMj6/BkgPJvX0PwV/LsqHRpzVBTNkmtfQNylzlaogrsbEcU+YtAs5/By
         fEJw==
X-Gm-Message-State: ACrzQf09x08KfFaJpKh4EWqzVpIWUg8gXjED2zJr6MZk9V/B1gfGEBA/
	0jTno1VKdpX+6k8fZknU98N+ag==
X-Google-Smtp-Source: AMsMyM44lf5wtKZiH6zPQZoIJncyVe0D8lEi4vQgU25p9YT7eqw4C9XYGwqXSzt/5cecnw6Xqc/h8w==
X-Received: by 2002:a17:90b:3852:b0:202:f891:9ed5 with SMTP id nl18-20020a17090b385200b00202f8919ed5mr10692096pjb.239.1664371239823;
        Wed, 28 Sep 2022 06:20:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id a19-20020aa79713000000b0053e6eae9665sm4154150pfg.140.2022.09.28.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:20:39 -0700 (PDT)
Date: Wed, 28 Sep 2022 06:20:39 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Sep 2022 06:20:34 PDT (-0700)
Subject: Re: rdcycle from userland with RISCV_PMU_SBI=y
In-Reply-To: <CAGRC-mhdmjcf=6gx8Rh5Rt8jvy5a2Rz+2g_UBRG_0fAG-D14uQ@mail.gmail.com>
CC: apatel@ventanamicro.com, malat@debian.org, atishp@atishpatra.org,
  linux-riscv@lists.infradead.org, aurelien@aurel32.net, Paul Walmsley <paul.walmsley@sifive.com>,
  jannewger@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: janwas@google.com
Message-ID: <mhng-fb2905c4-7e33-483d-b223-020ae4501397@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_062043_766998_FD74AAD9 
X-CRM114-Status: GOOD (  23.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[Sorry if this a mess, it's not showing up in my inbox.]

>> Currently, only "time" CSR is available to user-space and all other performance
>> counters should be enabled (or accessed) using Linux perf syscalls.
> Unfortunately that would seem to prevent precisely measuring very small code
> regions (order of 10 cycles). What is the corresponding advantage/benefit?
> As mentioned, there is no security gain from merely disabling rdcycle.
>
>> In the future, someone can always propose a RISC-V ISA extension to obfuscate
>> "time" CSR values visible to user-space but the "cycle" counter is
>> purely a performance counter and accurately reflects cycles taken by the CPU.
> Yes, this is why we use it. I'm curious why we think rdcycle is being
> used to measure wall time?
>
> About consistency: I understand there will be a time when rdcycle may
> or may not be available on Linux depending on PMU.
> But there is also bare metal, and other OSes. Is there a way for
> userland to detect whether rdcycle will fault?

We can't just trap rdcycle as SIGILL into userspace, it's part of the 
uABI.  I get the instruction was removed from the ISA, but that doesn't 
matter: we don't break userspace, regardless of how hard the ISA makes 
that.  

I understand there's some worries about the resolution of these counters 
on some systems, but the solution there is to maintain the uABI by 
trapping/emulating the removed instructions (and then providing some way 
for userspace to ask to turn that off, like we'll have to with a bunch 
of stuff).  That's a way's off, though, so for now we need to just stop 
breaking userspace.  There's also some proposals for sorting out the 
accuracy issues with ISA specs, but that's even farther off.

I just sent 
<https://lore.kernel.org/r/20220928131807.30386-1-palmer@rivosinc.com>, 
which hopefully fixes the issue.  I ended up with COVID so I'm kind of a 
mess, I can try to find some time to test it but it'd be much 
appreciated if someone who has a setup already can do so.

Sorry for the breakage.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
