Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD42C43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 12:01:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA5D2080A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 12:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z5cjWDy9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foW1Md5+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA5D2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RY1CXI2hormxKj61thWDzn/lTnrIiFO0xWPrkPTxnMs=; b=Z5cjWDy9UZfRcOxupTMNu+nRd
	ZtiuDxPWxfSfAaJ5WO9mLyenUTrpOzmKF7aLwVe0hCa0Iwww3NPRXr4kYy6294YwtlFfSyNI9dcpQ
	Px2wyOp+pjbutBGYXXlFeVIUOzIBh0boUWJ5dyHoNOPsKpifd3CVIZeWNSfTnOcqj/79xtqmqz9fi
	n8ncRMhh9nNgRSxZrF4OBUtRzfL5r6Mik5zKRyqNtlUSLLqtc699+s/bq6CRMCHSXhRJY0nlB/rHG
	sMX4FMjDY9yam7s1/MtBC44gnK64xKNTM8gt1vByDPn3hj8y64TjYWXUByf27izoXO5mAaOgmCTlM
	ta/vW26hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFymc-0001BE-Vs; Wed, 09 Sep 2020 12:01:03 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFyma-0001AT-CE
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 12:01:01 +0000
Received: by mail-ej1-x642.google.com with SMTP id q13so3114354ejo.9
 for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2020 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKqV5XSoH6x5apOh2Nzg4ObPZHKKEF8Qi7zC+PdttRs=;
 b=foW1Md5+PcY51Wfk/sk1BBTgjv6d/chmKaf0uEYrbBg0jd7Bvi6Fkhls4g0/gu296a
 UCEO8KqfQ7ZjID0nbU2267W+NAEMkWeHxYqdFLyZjeF/4lshOVmLeEadcabQL9vAcyBy
 1sxugjTRoJlpEioOX+JeP5pNiQ9hXysXYkB9xJ6xgK+cI4CKr3X/T0BMRREPcXfA1Ft8
 H2Nnmg/2ghq/ZYdkq9NpO8zSjVB78iNNI2mQVfptzeELeGy+t03jkU0hH2SLnILaThFo
 GZw4NXu2NengHu5frTpzbdKqMACUAt5KJM58ItWRHAlMGbpx3XRW2gU+G1rdU9QPkctd
 /zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKqV5XSoH6x5apOh2Nzg4ObPZHKKEF8Qi7zC+PdttRs=;
 b=XtTbQygwi5fXawJNE03lA6/omCTvtPptvxgDDR52KBjop3irAVjiiVxbUXUcm9WWgU
 nsEb0S0vgrRDeA8xMuw3mwGoBDes1xyWGqTjd/99qDVPRYClEgCtsFwz8qiIjkN2ybO6
 HTWib6Db8rsEMRMSEcU/HPghiVxLNoy1oAYI9Kv08J+OXsOCZj5zMWrZ2ULgpnjM4iZa
 76PByxWKf3txm5iXsnAI2szlM4xIitH3GI2yLmPKcc4xM7bYbLiUjFzZTGGzDGykoNLY
 /ljnlMPIuDUyHuO+kAtrHOE7sJ7Xn0dBZ7YekdsB02IAK0EGcXBvLDFrH4xwz9sOJCNY
 tNIQ==
X-Gm-Message-State: AOAM530moMORLkC5RECQwMIkxGONU7t6NpN0vqqE298mL4HE/aC0rY8o
 TWJOM32fjJjVvDF/Z16JhAy1sKOZ4RpEN9McadY=
X-Google-Smtp-Source: ABdhPJzBbr6B4ZQ9Naj8exihC3G1QjkWySYloBeInyig6sZdE4Ug9NrPIGKfHX4XIwFRG3ako1/JZYdHI9UcS1J3EAQ=
X-Received: by 2002:a17:906:4b18:: with SMTP id
 y24mr3123340eju.471.1599652859057; 
 Wed, 09 Sep 2020 05:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200909112901.5002-1-weiyongjun1@huawei.com>
In-Reply-To: <20200909112901.5002-1-weiyongjun1@huawei.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Wed, 9 Sep 2020 15:00:42 +0300
Message-ID: <CAOJsxLH5tQzWaZcGJ15fMNNsguodNj-mTNci8nT02bxVt-TRNA@mail.gmail.com>
Subject: Re: [PATCH -next] riscv/mm/fault: fix old-style-declaration warning
To: Wei Yongjun <weiyongjun1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_080100_444813_DC1B3F35 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Hulk Robot <hulkci@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Sep 9, 2020 at 2:20 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> gcc report build warning as follows:
>
> arch/riscv/mm/fault.c:81:1: warning:
>  'inline' is not at beginning of declaration [-Wold-style-declaration]
>    81 | static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
>       | ^~~~~~
>
> This commit fix it by moving 'inline' after 'static'.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for the fix, but Palmer committed similar fix from me to for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=6f36a9635082e1d6910bc7853d0c9fd12d7890b5

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
