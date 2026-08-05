Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62623C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9VHatCvIlWyOjK8Tyv8wgyiMJMbjaKhZfuvCmqhQYA=; b=jwjIGhzoUxlreK
	sD/j7lvfdY1uY+HipQLLbkx2BHOFCDVsBArRPmnlaCHRSdeWXBC8t9psZgZ1HAylQaDZA1dltueBj
	849iyEalabwosQJlWPRVrTk5hqpXsiEJ+3nT1drOxeOrytBO/mtFcDYKQMVsPaUBun4NCdBaigfwo
	BGAkK6ZVIr+C3dUCrP8KDpnMwfFJIoycHd9x1YT/llvL6HX4S9Ninl+CyAcWs6hW6XI/cKYle3xGR
	LEbZ0sVHCcAOq4fUzcywfR/cNFIn7+pQ3KzCSnbVGllSDBV9cr7EzLdrp2EW2G574FKwfxNtuMsWZ
	qqgKjLcz+Ua7YW5DzfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbaN-00000003zMU-0vMd;
	Wed, 05 Aug 2026 13:23:07 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbaK-00000003zLx-0zYv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 13:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785936182; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=dH8ip1mRIJGjDV6SLU11tCmimn4ilOn1eL8+M31kjd0=;
	b=r7Fpa1HTcfGq3MERTY+/HR8cyTYyo937Cu6ZMh3cXQAWsygUJoXcgyqEyfa2gHK54V5j883HlNzdEvEOxMcr16JVB4v/j02EAVWDaPS5/UgM0w8hH4bH7DSEeW3o09CFpigcqRhph5dT0WSGdYxbw9dp39v7BrcZHnKBAWdTu5c=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X8REb64_1785936177;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X8REb64_1785936177 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 05 Aug 2026 21:23:01 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	pjw@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	thecharlesjenkins@gmail.com,
	jtaubepe@redhat.com
Subject: Re: [PATCH v6 3/5] riscv: ptrace support for hardware break/watchpoints
Date: Wed,  5 Aug 2026 21:22:52 +0800
Message-ID: <20260805132256.918-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134913.2013674-4-himanshu.chauhan@oss.qualcomm.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com> <20260803134913.2013674-4-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_062304_431228_BDDD183D 
X-CRM114-Status: UNSURE (   5.71  )
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

> +struct __riscv_hwdebug_state {
> +	unsigned long addr;
> +	unsigned long type;
> +	unsigned long len;
> +	unsigned long ctrl;
> +} __packed;

Hi Himanshu,

Two suggestions about the new UAPI structure added in this patch.

1) Consider __u64 instead of 'unsigned long': its size differs
   between rv32 and rv64, so the layout would not be stable across
   32-bit and 64-bit userspace (e.g. a future COMPAT path). __u64
   keeps the layout identical for both.

2) With all members the same width there is no interior padding, so
   __packed can be dropped.

The struct user_hwdebug_state above already uses fixed-width types;
defining this one the same way would be consistent.

Best regards,
Pei

-- 
Chen Pei <cp0613@linux.alibaba.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
