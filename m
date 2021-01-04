Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71044C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3520B207AE
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3520B207AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ot4TVOVw6pdrFcWTnFuo1ZI0BfwkiuwkpAz/xG6cKs=; b=dsqcPGjn4jOSlk47tOAhtU/iqo
	ZKevJF5DljhRw2eqEmaNImN9TBtdWgpgPXGhP5uMDVf/Kf8QbL/EqamaARIYZ43s2wUxbFhr/nn6Y
	zDohaNrMkljFsg2yNWasKvkSfdQRevRN0Ozn4xEjcoNVEJAobIf1Q/mg2KTgPsoXMdA6qn8e9HdFK
	SNaLPOtdcqHL3svFQW6CDjToZQ8yNoUPMxO8OPdOY7KTCkyO/GLOHbfBT0/YwkQuM3MU170YCf7QK
	cf4B8RkhJi/labyS1FgAM7EnRi0TVhKV6NklVjnvLPgo7k45RRj4REU3hDtNTLpBeooyziDKtXgTd
	MOvNdToA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPv8-000723-Gw; Mon, 04 Jan 2021 13:29:14 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPv5-00071U-VO
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 13:29:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F6C1ACAF
 for <linux-riscv@lists.infradead.org>; Mon,  4 Jan 2021 13:29:09 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: EFI booting crashes
X-Yow: Look DEEP into the OPENINGS!!  Do you see any ELVES or EDSELS...
 or a HIGHBALL??...
Date: Mon, 04 Jan 2021 14:29:09 +0100
Message-ID: <mvmk0ssu8yi.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082912_137043_CC00EAA4 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Has anyone sucessfully booted 5.10 via EFI?  When I try that, I get this
crash:

[    7.677382] Unable to handle kernel paging request at virtual address 00000000200a2388
[    7.678710] Oops [#1]
[    7.678873] Modules linked in:
[    7.679242] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.10.3-1-default #1 openSUSE Tumbleweed
[    7.679954] Workqueue: efi_rts_wq efi_call_rts
[    7.680296] epc: 000000002002c33c ra : 000000002002c496 sp : ffffffe07eacfd10
[    7.680656]  gp : ffffffe001367ab8 tp : ffffffe07eac0000 t0 : 00000000000002ea
[    7.681031]  t1 : ffffffe07ea08c6c t2 : ffffffe000a025f4 s0 : ffffffe07ea9fd80
[    7.681400]  s1 : 00000000200a2338 a0 : ffffffe07ea9fd98 a1 : ffffffe000c15080
[    7.681756]  a2 : 0000000000000000 a3 : ffffffe07ea9fd80 a4 : ffffffe07ea9fd78
[    7.682023]  a5 : 0000000000000000 a6 : ffffffe000c15080 a7 : 0000000000045b96
[    7.682380]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
[    7.682795]  s5 : ffffffe07ea9fd80 s6 : ffffffe07ea9fd78 s7 : 0000000000000022
[    7.683216]  s8 : ffffffe00140c698 s9 : ffffffe00003d580 s10: ffffffe00003d580
[    7.683630]  s11: ffffffe07ea08c00 t3 : 0000000000000000 t4 : 000000000000010a
[    7.684205]  t5 : 0009be2b8189352a t6 : 00000000000bafbf
[    7.684543] status: 0000000000000120 badaddr: 00000000200a2388 cause: 000000000000000d
[    7.685557] ---[ end trace 7579eddbb881c1ff ]---

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
