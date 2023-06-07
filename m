Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3335C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSAtHk1YQBV2lhZCAR5qe3KdUcYZKsNjs4aspwvIS9k=; b=ZYm/UTK2jltBzQ
	UlGBl/8DhYQBhbxGnhTKOraRob/mIf6EHXop092dmRklmUg3bZ/GKDdICo2MGMn6nOz7ZbdajuSMW
	NxKdknOeu1o63LtSMuv2bokHYudSdKVzqc2n1dEJYkb72BXNeULmxWI8W+HLBj9X8pb4XeRUlBuFT
	pd+f8RTGT2OVX3tN/H3aTfa9tHrS8h70cWXzg0KFztAih8GaaF/6FTv4tFAZS6UFZUijcj9KbPlzt
	Sxzbs8twdPNG9QGmVeC6ZVZYe/zBOWV+Lq0WoAEavyQzI+R9nuq05axgzCZlNSW2FYUiOSJTSD5yy
	ZIGSp2o2QFc/w6STavwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mId-004VTC-1l;
	Wed, 07 Jun 2023 06:05:39 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mIa-004VRq-0e
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 06:05:38 +0000
Date: Wed, 7 Jun 2023 08:05:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1686117930; bh=j87jB5tkNZ9EKrRf0GhAoecY1yef9wSw92FeK2xc91Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EP2x3rpqr3aSbklvJE5UgMnYNtD9PlRfBr397LFhzxNjaHx1xRnsandIkNnuj3kM7
	 sAHh9noZ3/qtsX13MTIr6a4jLHgoFRHVKzfVOw8u/Kgq4tBn6jLtXKA4gdLgxJTEQO
	 aUbazmyyAdnmYbDOl4FHdgjB0OSVrLjoU3VAVcEI=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Message-ID: <793fc122-1409-4092-b39c-ea348de8ba14@t-8ch.de>
References: <ZIAB7bFYegCuXT9g@1wt.eu>
 <20230607053920.667272-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607053920.667272-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_230536_391369_F896504F 
X-CRM114-Status: UNSURE (   6.96  )
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

Hi Zhangjin,

On 2023-06-07 13:39:20+0800, Zhangjin Wu wrote:
> 
> As a summary, will use 'sysret()' and something like:
> 
>    static __attribute__((unused))
>    int chdir(const char *path)
>    {
>    	return sysret(chdir(path));
>    }
> 
> to renew the syscall helper patchset, Thanks you very much.

But please to use the "__" prefix.
Otherwise it could conflict with user code.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
