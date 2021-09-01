Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9210DC4320E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 11:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0380761053
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 11:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0380761053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTIIm8wWX9YLFfWzt2rvX/l+pNYVBk3bQAhspIwrFSA=; b=3HDqgyvdtKRA53
	k9H1lwCUxNPRFhMnnnpSBMaXrzBcm13wQKmYNW6/1xZCaO8jwhVqKSVtbb+B11aQGFxobHLf2GkL5
	2q9SJk9QFAp52O7tQJ40LWDIf6tPDT5sRY6QWvsDKHpeJYdCCSkSnlxdTAUH41Ijby+j/1AJ44OZr
	H6Ll9Dxkijnlv61TSy1rka2h2kFXTa7gkaO9sAbWKPRZXrKt8nMTqbUbEiETule5z/LpfBT5xhygu
	mOcFs1kDPCHMpMf0BAGqev3nUkAkgccCTOBu8wKajO8uvaw4wp7ksSgydp2r9KkMRTO/baYXHSYSq
	ZcJ5vJdfXWei6Bgu8OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOHX-005Xjk-EZ; Wed, 01 Sep 2021 11:19:51 +0000
Received: from forward107j.mail.yandex.net ([5.45.198.252])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLNil-005JFU-1I
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 10:43:59 +0000
Received: from myt6-ecec3fffc7db.qloud-c.yandex.net
 (myt6-ecec3fffc7db.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4681:0:640:ecec:3fff])
 by forward107j.mail.yandex.net (Yandex) with ESMTP id AE866886488;
 Wed,  1 Sep 2021 13:36:40 +0300 (MSK)
Received: from myt3-5a0d70690205.qloud-c.yandex.net
 (myt3-5a0d70690205.qloud-c.yandex.net [2a02:6b8:c12:4f2b:0:640:5a0d:7069])
 by myt6-ecec3fffc7db.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 1fZrkdnbPm-adH4Jkep; Wed, 01 Sep 2021 13:36:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1630492600; bh=bJRqLiOEp8JXTGlpq3+JJAn5wnhGgMPYEfxoudaUc8g=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=DwvxWzy8/FIiSbgtrncqM9p7Q32h5dWjPq1krdFgsqH/bnpE/scvmCLeuVHPVscxQ
 sGsDwCTvss2J0yq2kkjk2TMtVqWLK5+rtiiC56H31xhJ/ZQ0rT50fnjGPgKTx3YzLm
 Hu/880HcH/uUoaFfHCg9GdodZhTtlR/omQ1vnMMg=
Authentication-Results: myt6-ecec3fffc7db.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt3-5a0d70690205.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id Z5XXDbYXRx-acB8hfbS; Wed, 01 Sep 2021 13:36:38 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: atish.patra@wdc.com
Cc: alankao@andestech.com, anup.patel@wdc.com, bpf@vger.kernel.org,
 daniel.lezcano@linaro.org, guoren@linux.alibaba.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 mick@ics.forth.gr, nickhu@andestech.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, vincent.chen@sifive.com,
 wangkefeng.wang@huawei.com, xypron.glpk@gmx.de
Subject: Not compiling with CONFIG_BPF_SYSCALL enabled
Date: Wed,  1 Sep 2021 13:36:34 +0300
Message-Id: <20210901103634.26558-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528184405.1793783-2-atish.patra@wdc.com>
References: <20210528184405.1793783-2-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_034355_295117_9B81450A 
X-CRM114-Status: UNSURE (   4.61  )
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

Hello, Atish.

The above series won't compile with CONFIG_BPF_SYSCALL set:

linux/kernel/events/core.c:9912:18: error: assignment to 
'bpf_user_pt_regs_t *' {aka 'struct user_regs_struct *'} 
from incompatible pointer type 'struct pt_regs *' 
[-Werror=incompatible-pointer-types]
 9912 |         ctx.regs = perf_arch_bpf_user_pt_regs(regs);

Just informing you - hope this is helpful.

Yours,
Nikita Shubin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
