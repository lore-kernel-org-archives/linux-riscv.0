Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99864C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7PHDh3Cq6tkyWNCEyh+J3taG2LgzKTL+iwpTcY74pw=; b=E8S6VkiVo9Jq9z
	fEqaZSny9Z9FBsaSyzZh5mC4rEo+L1Svo40z9o5VQ6TaYWH6gWiX4UUBSFsADM3Q7vFEZSyCSot+y
	F2oKBDfKfK2f71vdRSdqUgPECh4j/MDEKP68hGjw/+q9VY+RbRh8Ml03K9t7VFU3UHQ3l+OKGa8vI
	QQL2hBFcSbTCSyiSs1e3YkuexygOEJKrVf/J+tNpBjwhvFRRZ/OUynIAYIZTzgb+7410K32XncHFU
	EvwhsyUbsXlkAJGBL4BWksv4jxVqu3RqVy5GeRpuhKAuMS24d09CvTHvx+ZJmjFCyW1WrvnHKsN09
	EYO2mQ+orRct7a74wy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgEoP-00000003ZWL-05fx;
	Tue, 20 Aug 2024 02:41:33 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgEoL-00000003ZUT-1E37
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 02:41:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wntrh5vJ3zQq4b;
	Tue, 20 Aug 2024 10:36:36 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 6AE9C1402E0;
	Tue, 20 Aug 2024 10:41:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 20 Aug 2024 10:41:16 +0800
Message-ID: <2ee770cc-b5dc-1837-aa65-6b2519e03d70@huawei.com>
Date: Tue, 20 Aug 2024 10:41:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] riscv: Remove unused _TIF_WORK_MASK
Content-Language: en-US
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<samitolvanen@google.com>, <debug@rivosinc.com>, <andy.chiu@sifive.com>,
	<guoren@kernel.org>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240711111508.1373322-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240711111508.1373322-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_194129_674639_5583932F 
X-CRM114-Status: UNSURE (   7.76  )
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



On 2024/7/11 19:15, Jinjie Ruan wrote:
> Since commit f0bddf50586d ("riscv: entry: Convert to generic entry"),
> _TIF_WORK_MASK is no longer used, so remove it.
> 
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/include/asm/thread_info.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 5d473343634b..0eead6b7b790 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -111,8 +111,4 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>  #define _TIF_UPROBE		(1 << TIF_UPROBE)
>  #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
>  
> -#define _TIF_WORK_MASK \
> -	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
> -	 _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
> -

Ping.

>  #endif /* _ASM_RISCV_THREAD_INFO_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
