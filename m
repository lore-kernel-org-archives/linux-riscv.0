Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713D9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 02:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/Sy1u01FomrHyTIunk3nsUJAY2ptIZHXatn1yjOHSgQ=; b=hgmZDZBoPfzt4OgLV0uDQfGtsS
	xYpvjG82JzEkZWvrqTC5ut/VcRGlflG2QShHaBq6i2uTQw3p1EgYrgXINmyjP089zhOoB1RF52s8y
	Jk7mAtB+hH3S/TxdC4EiirNlK6XTS9pA+0tM0mS+WR3fLl4vJgfUPzxuV26Ou53MOWrIGCQa6L9vo
	bmC4KROEKlMtPkt1d7UW5oVtwqdaZFI1T2EaPO8PdW7dA4786miyITErIW2gsqk6PJgSEAwDbf0bb
	06QBIoNu/cJWcPDUGTZZzDAEGbU4RqcEi2u/96CWcFOSDuiqjfJD4HQQ1ccC55+78AAptycKYtcDQ
	1VftvBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWURT-009kR2-Ki; Tue, 22 Mar 2022 02:40:15 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWURO-009kPF-D9
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 02:40:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so945984pjp.3
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=M+KlCJnb95r0VR1xBE5WLiRYber7fzPWf0JKHkm47E0=;
 b=Pe0u5j5dFgSZ3lzCDOdBMiZkLDKDrBHO4RaGl9PVTMzGEvtxylOpkAyknVfzIpO+Pz
 ehR+nkVvIdTYsCY+P3yFpKLsWaX+15b35OChFAjuO0ygpZnVv/45OCaHeU1x5A8cg2R0
 MGSQvXE7COuhSYamHkoUH2dPNWwGWwnPBGqqh8xMQ6qLCRuG96LpVcXbhtyrDh1Jzqky
 khcLzlfY01LbFFTj/yZnIa8WQ5oJpFPpT9YEMBwf0uGv4cBPmi6rd3zchZij9eyrlQZq
 tf0Y7ZRk8k747hA+WQMYW0sVnJpoGvxUAYx9fqWDdDNPaFr1xbojzpAOo4gEtu81i7N1
 9flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=M+KlCJnb95r0VR1xBE5WLiRYber7fzPWf0JKHkm47E0=;
 b=sdaPGTXnyQRpmGDxjueuBIo5ebPrzxttR3dro/zzx66BnS3YsMFjYwVOOx07AMBK8j
 tbApVK9uFhVDCvgnEwRhafELwGLpjaPeP3CVTCWr6NviyJJ1hF2l4yEkQNL4EFWRcxqc
 HbfWs860I4TS5VCoC4zp+AjNZ/VhLuqN7InrZ/YBDvdGLRGTjrYe4TU6X3158P+Z72/0
 Ffv2lpoYfhT6bxsIfgyeZC3YeVpazdpvMH8ngSge7qo7vDFW+6JnIAnmWqfc0n6sLbAZ
 lXzZiOjZDywKUUzrND/SFS9EOyLoTATk4BIqJm0LVZryd+HPSVFvumN1fibEAbv2yvYk
 9B0Q==
X-Gm-Message-State: AOAM531e6s39JeJUW693S994k2svQKNfwvIgENwJidilYMLfWljV56Br
 71tfJVlWYWXfox+jzSS292EGYA==
X-Google-Smtp-Source: ABdhPJyDcJGpQWK2rYm3jfCyAwNOjQpHzMh5NTSXwfiYOHiLN06VyUaDlpPdX+aQeV/AFP+ZUbQqqg==
X-Received: by 2002:a17:90a:c984:b0:1bf:aee2:3503 with SMTP id
 w4-20020a17090ac98400b001bfaee23503mr2402874pjt.28.1647916809497; 
 Mon, 21 Mar 2022 19:40:09 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a7f9100b001b9e4d62ed0sm724127pjl.13.2022.03.21.19.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 19:40:08 -0700 (PDT)
Date: Mon, 21 Mar 2022 19:40:08 -0700 (PDT)
X-Google-Original-Date: Mon, 21 Mar 2022 19:39:45 PDT (-0700)
Subject: Re: [PATCH] riscv: ftrace: no need to acquire text_mutex when
 executed in stop_machine
In-Reply-To: <20220313080711.mrzsgtxpbycug2vm@mail.google.com>
CC: rostedt@goodmis.org, changbin.du@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mingo@redhat.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: changbin.du@gmail.com
Message-ID: <mhng-62c2ef00-fb64-48c3-a2bb-43b2799161bf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_194010_511035_869337D2 
X-CRM114-Status: GOOD (  17.83  )
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

On Sun, 13 Mar 2022 00:07:11 PST (-0800), changbin.du@gmail.com wrote:
> On Thu, Mar 10, 2022 at 09:27:42AM -0500, Steven Rostedt wrote:
>> On Thu, 10 Mar 2022 12:54:54 +0800
>> Changbin Du <changbin.du@gmail.com> wrote:
>>
>> > It's safe to patch text segment in stop_machine. No race is possible here.
>> > Besides, there is a false positive for the lock assertion in
>> > patch_insn_write() since the lock is not held by cpu migration thread.
>> >
>> > So we actually don't need our ftrace_arch_code_modify_prepare/post(). And
>> > the lock assertion in patch_insn_write() should be removed to avoid
>> > producing lots of false positive warnings.
>> >
>> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
>>
>> Ideally, RISC-V should try to get off of the stop_machine approach, and
>> move to the breakpoint modification.
>>
> yes, that's a further step. I can feel a obvious stall to enable ftrace running
> in QEMU. (maybe qemu-riscv tcg is too slow...)

Looks like we've had this exact discussion before, even with exactly the 
same patch and people and everything.  I guess I dropped the ball here, 
I got so distracted trying to figure out those sequences to avoid 
stop_machine() that I forgot to clean up the patch to fix stop machine.  
I just sent out a v2 <20220322022331.32136-1-palmer@rivosinc.com>.  That 
should at least fix the crash, we can deal with getting rid of 
stop_machine() later.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
