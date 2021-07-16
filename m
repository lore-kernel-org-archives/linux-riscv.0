Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B9DC12002
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 15:54:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E0F608FE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 15:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E0F608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU0LVfSfGy0idc9tySzQZkMr7MoLiMfj2ChEkFdZN84=; b=4i0axKsCKa26Mn
	rDmzihwP+tTWXHi4InFkORRLHAmj5YuzHASmJLfL5vcVNDW5G6XssqnNchFYBnC0eu3/XuPfKzAeL
	9IEMxV99KddACxTb/UtmRgaGXV4LRt0ZAucd9rJfDThBKlOH786YcMcewCCFeX09qLqA/RKLd62pq
	wx3RwdnNssgvEBDc4gW4FAi/ET8KWMUhyIscTins4dqqpZxy+mUf3sUEtevR1w9C2S2U44BJbdL1g
	ojU38GIJL8z6koR3khDg8908taSA2MH8nXOTCG2OvmvkZth4pcMTJgE4iIR02vHFy9oaDYFFbY97g
	lXVmgd4FAN+rNgeKcwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4QA3-004max-Ag; Fri, 16 Jul 2021 15:53:59 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4QA0-004maQ-4s
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 15:53:58 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GRG4c1xpCz1qw9Q;
 Fri, 16 Jul 2021 17:53:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GRG4c0k0Qz1qqy2;
 Fri, 16 Jul 2021 17:53:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ua9oCtw0oHIU; Fri, 16 Jul 2021 17:53:50 +0200 (CEST)
X-Auth-Info: hNFfgV+zdvt6oFzKbma464ONWGddgfQIitZc4eefrC0nK2UxpUd7lRGwoA+kAqVg
Received: from igel.home (ppp-46-244-181-162.dynamic.mnet-online.de
 [46.244.181.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 16 Jul 2021 17:53:50 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 4EFB02C2532; Fri, 16 Jul 2021 17:53:50 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Tong Tiangen <tongtiangen@huawei.com>,  <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
References: <20210621032855.130650-1-tongtiangen@huawei.com>
 <87pmvjtumc.fsf@igel.home> <20210716205332.5856df78@xhacker>
X-Yow: YOW!!  Up ahead!  It's a DONUT HUT!!
Date: Fri, 16 Jul 2021 17:53:50 +0200
In-Reply-To: <20210716205332.5856df78@xhacker> (Jisheng Zhang's message of
 "Fri, 16 Jul 2021 20:53:32 +0800")
Message-ID: <871r7yz241.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_085356_358835_D80768E2 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On Jul 16 2021, Jisheng Zhang wrote:

> I can't reproduce the panic error. Mind to share your .config?

https://github.com/openSUSE/kernel-source/blob/master/config/riscv64/default

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
