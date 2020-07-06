Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2C4C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 08:15:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED70720739
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 08:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpgUpzs7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED70720739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RsJlYUp7E+9ZyM7/lWFK6J6eYabUaTerV+bAy4Xetmw=; b=VpgUpzs79MXLne5JZHiZcezFT
	SAIKVIu/QXk0qQ6m0SumdTuaScn7yeRwZ8ecyRAxdkRcVAU4ja65LeP1aqXfuDIGf46DJO8s+1NRF
	q/Rd4iJMtFqL25jGkNEvnkXhnRHHBo5vEyKLrsDsZrUfGtoiP7bXOOGwiEzhx7uCAzrvi5yXUoSBF
	+iEk+HopbdSz8p+HRv9p3xrpswMeBOQoiAoF4X9PxCxvNdfhU+4KVngH5Mtjnbriy8+D5Tcpyp1xy
	B41jIY/QRhn4kJq7qP8fAAamkLb3j38jWEaYFss36mjYpu0C1cnFeK1ooLZXMWa7jkiqJ72kYwlzc
	LrkLWJMyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsMHx-0005j7-Sx; Mon, 06 Jul 2020 08:15:45 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsMHv-0005iN-TS
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 08:15:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41029AD5D;
 Mon,  6 Jul 2020 08:15:43 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
 <mvmftabiklh.fsf@suse.de>
 <CAEn-LTqMAf8vaaMhkX7h7+iY8U8v6JTSpW1FMj+JDr7PaWx1zw@mail.gmail.com>
 <BN6PR1301MB2020C5FAA902AC521721319A8C6A0@BN6PR1301MB2020.namprd13.prod.outlook.com>
X-Yow: I'm into SOFTWARE!
Date: Mon, 06 Jul 2020 10:15:42 +0200
In-Reply-To: <BN6PR1301MB2020C5FAA902AC521721319A8C6A0@BN6PR1301MB2020.namprd13.prod.outlook.com>
 (Yash Shah's message of "Fri, 3 Jul 2020 05:53:23 +0000")
Message-ID: <mvmtuylcb4h.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_041544_070047_DDF02C79 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup@brainfault.org>,
 "lollivier@baylibre.com" <lollivier@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Green Wan <green.wan@sifive.com>, Atish Patra <atish.patra@wdc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sachin Ghadi <sachin.ghadi@sifive.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>,
 "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 03 2020, Yash Shah wrote:

> Yes, you are right. The userspace governor is the only one supported.

That doesn't make sense to me.  How is the userspace governor different
from any other governor?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
