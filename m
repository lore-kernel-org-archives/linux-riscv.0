Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1BCC61DD3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 02:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lvx2XjjKHgdRVxNWlIGvWg8jCNWdbfZQA/8ixbzjEG0=; b=XIH3piBHlme8H+
	1FbpqBJ6tXQsofTxLXQGJBwnFZ2yVJ5Lk9LrXd9sGqx+4XCPf9BGxoNB1/xc8+pDgNcmBNg6fv31n
	/PnPDZAujy2BebItDYfQmdVip2niu56QPNAWG9gwp1sENjJIinQCbpKl13/+ZFTi2iQEP37HeMN1m
	EafmFoTMz9ReNFZWzWDLkXWDowVU1G3ljksLxxC0Y6tbI8BGeO4ieary2Q1zsH1LdUWIncROjECcR
	Ufkvmoj+pe4bhcDS4Zd+szVQWYm2xvO5uRe7Z9+Yp/zRy9lJ9nH3aufM76o6JZAgicigCpkMyBrAx
	gVtHhh+w6ISOy9kUHaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1aMT-0000000Demr-1F1g;
	Wed, 02 Sep 2026 02:06:01 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1aMQ-0000000DemT-1gAA
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 02:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788314755; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=KzB8SvtJKYDJkCMkE4z8SGagC+3bi7pXbxHhhkcgcRE=;
	b=fEPA2HZbTabcM0NdbKdK3QxIcDFqWPcQGYWYDUk8JUi/ytcLPw5QxEOF49aAaEeTGrSvkuz8/PlksiazWtZA/JM7lY6E18n2O3iI87JLw8Dq2eilu0O71nPjqAaU2/ZwEDvtyvrqWdaMQUndgeCvqCig/nwEvUEolQ8ba0eZJvY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0XAArS-Z_1788314749;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XAArS-Z_1788314749 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 10:05:54 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
Date: Wed,  2 Sep 2026 10:05:47 +0800
Message-ID: <20260902095109.reply2.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apdMvKYegtdEWntp@gen8>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org> <20260831100216.reply.cp0613@linux.alibaba.com> <apdMvKYegtdEWntp@gen8>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_190559_160485_48874F15 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Drew,

Thanks for the quick pointer.

To clarify our report: we were not testing the series on a new core. We
backported v6 onto a 6.6 LTS tree, whose resctrl core still predates
dbc58f7eec40 ("x86/resctrl: Generate default_ctrl instead of sharing
it"): struct rdt_resource still carries a default_ctrl member there and
resctrl_get_default_ctrl() merely returns that stored value, so an
uninitialized default_ctrl shows up as cbm_mask=0 / L3:0=0 exactly as
we observed.

> I think you may be looking at an older version. The function in this
> patch is:
>
> static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
>
> struct rdt_resource no longer has a default_ctrl member. Commit
> dbc58f7eec40 ("x86/resctrl: Generate default_ctrl instead of sharing
> it") removed it and derives the value instead.

Right - on the new core the value is derived, so the series needs no
initialization. Our report came from a backport of v6 onto a 6.6 LTS
tree, whose older resctrl core still requires the driver to initialize
default_ctrl; that is a porting issue on our side and has been handled
in our tree. Sorry for the noise.

> I will send v7 today as I have now rebased on v7.3-rc1. It is already
> available as a branch [2]. Please give that a try and let me know of
> any problems.

We will give the v7 branch a try on our QEMU and on the FPGA board,
and report back with results. Thanks again for maintaining this series.

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
