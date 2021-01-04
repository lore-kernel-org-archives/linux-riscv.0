Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E935C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 21:27:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B93216C4
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 21:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B93216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LPyAb/KTDZUD0kWyDWoXLD/PeJvGO5Aco3kNbnTq3Eo=; b=1l9CZr/a3dyZyzAyLKhv7vb3F
	/VgfpKXoXnn48LWiOFhTv3i64ifTXT7Is3DiPXDSDr34b0Vm6wY45tbGB6nQ0bvr14Q3A9sBHa/8a
	T3Q2PP/FCf6sXRWsc0+vm0WJ3eaTTU5Ys1zxM16yaYumOd3kw/w/W2i3u+TaKjNPIwpLogWJY29ZT
	Izl5B4A8k6fcaurhG0oMR02DTMEkCvoXXSLQ984mAGcogYDUnenZexNzDqVKYGwqWRJJwcy2t78S5
	hgXAZwl/xNwusz6kIpBK9/U5+ydK4swX3FhykO7OqW9ArEZ/9rBI7k5tZ8MW99eVIFBnZqtDNsC9p
	fx0b0juhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwXNV-0004Qc-OR; Mon, 04 Jan 2021 21:27:01 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwXNS-0004PT-SI
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 21:26:59 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9398AD1E;
 Mon,  4 Jan 2021 21:26:56 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: EFI booting crashes
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
X-Yow: I wish I was on a Cincinnati street corner holding a clean dog!
Date: Mon, 04 Jan 2021 22:26:55 +0100
In-Reply-To: <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 (Atish Patra's message of "Mon, 4 Jan 2021 12:46:03 -0800")
Message-ID: <87k0ssfl5s.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_162659_047175_2F3F0D84 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jan 04 2021, Atish Patra wrote:

> Can you give more details on the platform and UEFI firmware (U-Boot/EDK2) used ?

I'm using qemu 5.2.0 with u-boot 2020.10:

http://download.opensuse.org/ports/riscv/tumbleweed/repo/oss/riscv64/u-boot-qemu-riscv64smode-2020.10-7.1.riscv64.rpm

> If you can share the opensuse image, I can try that as well.

http://download.opensuse.org/ports/riscv/tumbleweed/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
