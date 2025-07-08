Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF77BC83F09
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Cc:In-Reply-To:References:
	Mime-Version:Subject:To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSE/mZAjbfTgTpZV1NAGKnF+Wr1xmSVSJs+jARAYv5E=; b=fQLYpjeC2bbr8b
	/lOr13cz3LD7nrh7ZMC8b2PM5dRmuY+hI67opH8+/4kp6h7XfU6fZV85BR7InoQ4eLxHpBqaRJb3A
	vhLAbFuaiu9ssQGPq+A51mWRXHOJnoARF0tPpmsbLjakcKvuyMKDvCrozEgI8ro2D1rVK6fm3l2ZM
	zchZntnZ3rGtCKeXI9cSSNDBmoyglj004H1SXjPnhlYxyJjuToYXZxN76mrGsaaszo+ihNJkQysRQ
	oj8BMd4OBGfyRRw63QuLbhH7ES9+xl82noTy5kRVDDuRYvD5xT5B0HQwYN4nZ2hf7GPIZbUP1QKt7
	o3iE+SfnWWd0VkpiwSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzA7-00000004BpU-3f7o;
	Tue, 08 Jul 2025 03:38:31 +0000
Received: from sg-1-23.ptr.blmpb.com ([118.26.132.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzA4-00000004Boz-2j6u
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 03:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751945902;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=JPtZMecHGbjHuuvbPojNTgsTRGbNnLkGsdh+C3TLsdQ=;
 b=L2L3k/yJNkvFUl6D33uz0TzHHsBs16ZB8VD4V54hwB0v9eX7yqQL7hnsDA1ptgiKfjMby8
 5vzBfTaFv+BIp0y7YGO1LS+AKKAmwdhtzwbpVYwmjmedZ59OMstcwmISHxhINADu4IFp60
 Re3aDpahZQ9Cm/OHqtHOsh7JNZsFJ3XhGnQJC9da4iCABqds418ZBql5qFrrrlcdq+yIxC
 5jr/3GTyjb44plydwUMSKM34goLSce/Kdgip0nHrQf0CPSsNGhwsjFdAGJMAua88RJuOPP
 Mks8LiL0U4YOlcKNW5Aw4pK7HGqZGT7Mo8NMRpN21QwGm/PDqx9Pij7kKiIPpQ==
Message-Id: <3c4a03b3-21e4-47d3-8f69-767c2594d1bb@lanxincomputing.com>
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 11:38:19 +0800
To: <liu.xuemei1@zte.com.cn>, <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: mmap(): use unsigned offset type in riscv_sys_mmap
Content-Language: en-US
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2686c92ac+502a69+lists.infradead.org+liujingqi@lanxincomputing.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
References: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
In-Reply-To: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
User-Agent: Mozilla Thunderbird
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Tue, 8 Jul 2025 11:38:17 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_203828_920141_4E609CBA 
X-CRM114-Status: GOOD (  12.71  )
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

On 7/7/2025 7:34 PM, liu.xuemei1@zte.com.cn wrote:
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
>
> The variable type of offset should be consistent with the relevant
> interfaces of mmap which described in commit 295f10061af0 ("syscalls:
> mmap(): use unsigned offset type consistently). Otherwise, a user input
> with the top bit set would result in a negative page offset rather than a
> large one.
>
> Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

> ---
>   arch/riscv/kernel/sys_riscv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index d77afe05578f..795b2e815ac9 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,7 +10,7 @@
>
>   static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>   			   unsigned long prot, unsigned long flags,
> -			   unsigned long fd, off_t offset,
> +			   unsigned long fd, unsigned long offset,
>   			   unsigned long page_shift_offset)
>   {
>   	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
