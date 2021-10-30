Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87434C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:50:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EF2610EA
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27EF2610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xmission.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SQnzU16Wn2hVLj6LQIc0WNKrKHIU1esc954+O7tWNpg=; b=aoDDRnHL3/hsdSt5ZhAacobhf1
	Ipv1/Qwjc3XswAWDFc/FsmlJqt9h+ZraK120C0FN8vqUaqK7I9Akx3hxupJc3pInsuJlh5DRDkxe6
	ewCl5XG1Zk7LklWRVyLhKHyHyfoz63VhR6Z5J4/Z5QcetTxOaJyaESsqHEjgK3YzFKxNAH6AUEuSU
	eizpJlnsrTZYV6z2K2mJJu0asNXA8uDtDT5FjljHUnz4+K0OjZ+/GaVEyg8eP9orliwSYFGMvK4Oy
	vXGN7PuoKpMR+kESNbDVAtglZhQEpI11tapj6gBofjN0ZYUa7rXzaZ3ZxbHK8T7gBRDcTNexDs0PS
	AQ/4f6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgfNk-00ChCR-VH; Sat, 30 Oct 2021 03:50:13 +0000
Received: from out01.mta.xmission.com ([166.70.13.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgfNg-00ChBf-0b; Sat, 30 Oct 2021 03:50:09 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:59486)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mgfNL-002uma-RR; Fri, 29 Oct 2021 21:49:47 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:47698
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mgfNI-005pIg-Du; Fri, 29 Oct 2021 21:49:47 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Liao Chang <liaochang1@huawei.com>
Cc: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <mick@ics.forth.gr>, <jszhang@kernel.org>, <guoren@linux.alibaba.com>,
 <penberg@kernel.org>, <sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>,
 <changbin.du@intel.com>, <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20211030031832.165457-1-liaochang1@huawei.com>
 <20211030031832.165457-3-liaochang1@huawei.com>
Date: Fri, 29 Oct 2021 22:49:09 -0500
In-Reply-To: <20211030031832.165457-3-liaochang1@huawei.com> (Liao Chang's
 message of "Sat, 30 Oct 2021 11:18:31 +0800")
Message-ID: <87ee83goju.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mgfNI-005pIg-Du; ; ; mid=<87ee83goju.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX18f7M3MHRYDgl23l5rWQ+6xsslUtaUkAZ0=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH 2/3] RISC-V: use memcpy for kexec_file mode
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_205008_084643_397A6DA8 
X-CRM114-Status: GOOD (  20.82  )
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

Liao Chang <liaochang1@huawei.com> writes:

> The pointer to buffer loading kernel binaries is in kernel space for
> kexec_fil mode, When copy_from_user copies data from pointer to a block
> of memory, it checkes that the pointer is in the user space range, on
> RISCV-V that is:
>
> static inline bool __access_ok(unsigned long addr, unsigned long size)
> {
> 	return size <= TASK_SIZE && addr <= TASK_SIZE - size;
> }
>
> and TASK_SIZE is 0x4000000000 for 64-bits, which now causes
> copy_from_user to reject the access of the field 'buf' of struct
> kexec_segment that is in range [CONFIG_PAGE_OFFSET - VMALLOC_SIZE,
> CONFIG_PAGE_OFFSET), is invalid user space pointer.
>
> This patch fixes this issue by skipping access_ok(), use mempcy() instead.

I am a bit confused.

Why is machine_kexec ever calling copy_from_user?  That seems wrong in
all cases.

Even worse then having a copy_from_user is having data that you don't
know if you should call copy_from_user on.

There is most definitely a bug here.  Can someone please sort it out
without making the kernel guess what kind of memory it is copying from.

Eric



> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index e6eca271a4d6..4a5db856919b 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -65,7 +65,9 @@ machine_kexec_prepare(struct kimage *image)
>  		if (image->segment[i].memsz <= sizeof(fdt))
>  			continue;
>  
> -		if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
> +		if (image->file_mode)
> +			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
> +		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
>  			continue;
>  
>  		if (fdt_check_header(&fdt))

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
