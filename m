Return-Path: <SRS0=TATJ=F5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A05CC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Dec 2020 14:56:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5026C22288
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Dec 2020 14:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5026C22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rg9ighmGXEWUoWK1yPlJcvdASa1H2QpjrhfxctNdoVA=; b=PvtlTawwk4+1P0retPYxWCE6QO
	S3MTAOsobqQmuF7z31pF3ILGVXAngPo5qXFwvaOVP8UcbwMouQ2F8+ZgYYQF2Rqfx8ddf4rgmpMW7
	6bRfQIoW6ylzTMjjVSspnlnKGGM/DzYEUEG/rnSKqbXi8ZdzpeEOB7oTYz/8Xdy2hrddIqxggvXqs
	23oWGXC/1vO0R8XkYIbkGcM5SXwP8M5ZTF+a/ZMVSxG7vOFdxMkPjjFNgPhuw9gkAPBIQ/RMGCyUY
	eylzBd56gjw6r68lvJtHQhqkNH+lwtoSFyWSrb7KR38f0uzALQud3qxBar2Zd9pYDxOcvxNpy4D2b
	eEqJ5d4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksoVp-0007uP-7u; Fri, 25 Dec 2020 14:56:13 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksoVi-0007tO-Pg
 for linux-riscv@lists.infradead.org; Fri, 25 Dec 2020 14:56:10 +0000
Received: by mail-qk1-x72a.google.com with SMTP id v126so4069684qkd.11
 for <linux-riscv@lists.infradead.org>; Fri, 25 Dec 2020 06:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7AlEcFriJoeYzWuqNZSt+YwH22DlPDSRTWH0OUhugF4=;
 b=iXdeLLKWI2a2tzHtP6QFBSAaYojgLd9qzejmUIDJaNWNwMgMXPp1n5dxni2oWYx8pF
 BJN7Rk6603DwyUwjiEpo+Z27P6Q2qSIWwsLc9wTTImAeuU0lKrV4bnOvKpRqsS46l29n
 XG/wIMGlR5yO1ZNLMXrlCfChFWj1LtLLYHLX5/Xg3kt3BFEwUbOkE2Elh7/EOgvvngAe
 6vjnSONKhecC/DWbx3tr4QrhbJ+PMZpFdstIUvqWUXg/+Es4sS6K3+nT2gthlZuGl/SN
 j01qHekn01kHve5HfMN9W/H1pMVjByQw40PU1PgOVXgg29ghNKBWmuLn/14HRfW2KvMU
 9l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7AlEcFriJoeYzWuqNZSt+YwH22DlPDSRTWH0OUhugF4=;
 b=hLt1i7Ya9vS/aBmDmht/ajnsZUIE7Se0jwJkLHkkCjwlAZ49j6R0FTKAR41XJEjPub
 8iPi7ST1ccu/5ENqitiWfPCq1D5g6KV7DbScn2Dqx4Ck6WAVcN+d8oywxAlmcxkkHMYk
 fG7V2U1fMdFm+LNpRVNPJk84jo+7pUx51loghokKGuTw8XkWYxBZcHWGEk47OiBX8/D1
 kr6/qfZFWapd+DGGsQvCZ/2PMPCKFJ6gtwiJaizh/8diS9jt5HYTUHMeTi/3MWa9JN/Z
 zJSlUsMtLFanktl6hEVU2LdTnIldN7mg1eL0fYtVTJZ9eyjmPDfDdIeC2sFWMrQUAWYa
 D8Ew==
X-Gm-Message-State: AOAM532Nn9QaZZiYL4b2ep/LZJetOsCKWJDGt1STRD1WBQlz1B1/DoNx
 C6DMcvJFHyL4ThxoA2ZIk0JNoWmU/7sDKxQOXkGHqA==
X-Google-Smtp-Source: ABdhPJwx/z89Ckw2LTXrhcFRg0wHRcqaZgoQhNhab+S61GnPyHv3wwkR4bwJShF3YjcV/1d+NwxYvDa25/sIQZMfjhk=
X-Received: by 2002:a37:9a97:: with SMTP id
 c145mr34583489qke.350.1608908160008; 
 Fri, 25 Dec 2020 06:56:00 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 25 Dec 2020 15:55:48 +0100
Message-ID: <CACT4Y+bpkSYTL_UwNoKVd0PDFF_xrNN6=y_S_v8W3YRaAcMm2g@mail.gmail.com>
Subject: riscv+KASAN does not boot
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>, nylon7@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_095606_901301_1C817814 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Tobias Klauser <tklauser@distanz.ch>, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

I am considering setting up a syzbot instance for riscv arch (using
qemu emulation) and testing kernel config/image/etc. I can boot
defconfig+kvmconfig riscv kernel, but so far I can't get a booting
CONFIG_KASAN+CONFIG+KCOV kernel.

But first of all I would like to ask if the riscv port is stable
enough at this point and if there is interest in continuous fuzzing
and receiving bugs? If there is no interest, then the rest is not
worth spending time on.
Second, what git tree/branch should be used for testing (to find bugs
sooner and get fixes faster)?
Currently it seems that riscv/fixes is the most up-to-date branch with
most fixes, is it the right one?

Re non-booting kernel problem. If I do:
defconfig+kvm_guest.config+ scripts/config -e KASAN -e KASAN_INLINE
I only see OpenSBI banner and then nothing happens (qemu consumes 100% CPU).
I've tried on v5.10, current upstream head (71c5f03154ac) and
riscv/fixes (20620d72c31e). The result is the same.

I see this recent patch from Nylon:
https://lore.kernel.org/linux-riscv/1606727599-8598-1-git-send-email-nylon7@andestech.com/
which suggests that KASAN is working for Nylon.

I am using qemu 5.1.0 as:

qemu-system-riscv64 \
-machine virt -bios default -smp 1 -m 2G \
-device virtio-blk-device,drive=hd0 \
-drive file=buildroot-riscv64.ext4,if=none,format=raw,id=hd0 \
-kernel arch/riscv/boot/Image \
-nographic \
-device virtio-rng-device,rng=rng0 -object
rng-random,filename=/dev/urandom,id=rng0 \
-netdev user,id=net0,host=10.0.2.10,hostfwd=tcp::10022-:22 -device
virtio-net-device,netdev=net0 \
-append "root=/dev/vda earlyprintk=serial console=ttyS0 oops=panic
panic_on_warn=1 panic=86400"


I've also tried this config (slightly larger than defconfig, but does
NOT include KASAN nor KCOV):
https://gist.githubusercontent.com/dvyukov/b2b62beccf80493781ab03b41430e616/raw/62e673cff08a8a41656d2871b8a37f74b00f509f/gistfile1.txt
and this is the ultimate large config that I would like to use:
https://gist.githubusercontent.com/dvyukov/2b4e621d5252dbc5a2f28802b8d71d95/raw/3ef2b8d8eda60d3acfc4bf7916ffb9e77671ed76/gistfile1.txt

Both of them hang after the OpenSBI banner in the same way.

Is it a known issue? Am I doing something wrong?

TIA

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
