Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF1CD4F52
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8HUHwKDHvQJeFzfoKZlViO25F7oSMZDbGBxPMs7u+c=; b=sOMcQ9TJ2pOefNHq8Uo4VTb3Le
	6jD/T+VUhn7VIdjvzLPp6p44v83jcAA+Y/OPh2xyLCOkb2nUiCDmAR73HkO9Uqwdcxu8ur1OQ6Ylm
	XFJZJa/rmPOjhHV5THBZR2UpQDvvn1jCw3q++BG7FIQ8aRLhalPiLabCfAm/1piYI/oONEQndVMYc
	wu4g0403N501plkNuVwLzh+y/MRiSUhP+2vTM/GXba/mTxdv5Zl9uzMwm5TZcRd7bum5P5KudELsO
	zy37oQg6ZVpFeO6qKpmCcQCPFfAOJL1HNOnR9VxoxG4pgmDjKdKEFQ8tgduOv39yzjY92CA6mo1HZ
	oeTJ4OiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFoy-00000000g1I-1oeO;
	Tue, 19 May 2026 08:29:00 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFov-00000000fyS-2N5U
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 08:28:59 +0000
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id P3aUwout1nv6VPFoiwhOXs; Tue, 19 May 2026 08:28:44 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id PFofwmZW2tuVJPFogwyce4; Tue, 19 May 2026 08:28:42 +0000
X-Authority-Analysis: v=2.4 cv=BNWzrEQG c=1 sm=1 tr=0 ts=6a0c1f3a
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=7vwVE5O1G3EA:10 a=pGLkceISAAAA:8
 a=pFyQfRViAAAA:8 a=dOPtARG4wUHVzOZUDtUA:9 a=QEXdDO2ut3YA:10
 a=oJz5jJLG1JtSoe7EL652:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dUVG5hW1tXzZ+39lX1QRkXzsTcX3CBxGtHk6r82iEg4=; b=YDPikdm4uUSuK87uwhvRyWshIH
	xW/H5KRIDLw7GN00u9zUJw4FIR6/H9DH7nyWYiQoSzOvUFKIbKhayURyx5HXhPAJtg+zr5Ly+dqhq
	Kko2AmUaq5YWSFk/tARHTraoAlunnmzPjhryfxHAHkmEwJUd2fpNtx6uQoO0HIainLcO0gN51Zgae
	Xs3Z5Do0bYNfsxKnyMVRfMTUh1DxSpc40ZpKSBN84GwiRSVzYNbzJfGzgah/uVlmAlJCacAIsyAUR
	ecqT9EA+GEY/QJEF37cC3dT3jBIG0afNVwdM1rZI47PBIy0GdVK2bfGoMmInmtYdtOK0PjTTgEwCP
	/8gh1pog==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:35914 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.2)
	(envelope-from <re@w6rz.net>)
	id 1wPFof-00000000mHd-2kFT;
	Tue, 19 May 2026 02:28:41 -0600
Message-ID: <ccfe25b8-df25-49b6-a40e-d86630cbc407@w6rz.net>
Date: Tue, 19 May 2026 01:28:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] riscv: cif: reduce shadow stack size limit from 4GB to
 512MB
To: Zong Li <zong.li@sifive.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 david.laight.linux@gmail.com
References: <20260519071809.3823470-1-zong.li@sifive.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20260519071809.3823470-1-zong.li@sifive.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1wPFof-00000000mHd-2kFT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:35914
X-Source-Auth: re@w6rz.net
X-Email-Count: 3
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAu7gLWhTYfgZSu+cl2NGMDCXNK/EF17A5id7LFiRT7aODNcM1LWjVE4QwNnxHF5RR3n2Zg2ee/fdlISkPyFLhjOt5rWEie7AvTY7zb0M+xAX4caoGD5
 1EInlLRm8r/FAWAfxEwB32ywsnzcwcW8hIbJ8VBAUL0qHbAsDtEFGpbgWxBsE6RdpDuyAvRYEUhuDknH9MYiZ6Y3/R4rR9W1Z/c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012857_705208_BAED304A 
X-CRM114-Status: GOOD (  19.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/19/26 00:18, Zong Li wrote:
> Rationale:
>
> 1. Shadow stacks only store return addresses (8 bytes per entry), not
>     local variables, function parameters, or saved registers. A 512MB
>     shadow stack is far more than sufficient for any practical
>     application, even with extremely deep recursion. This size
>     maintains adequate while being more resource-efficient margin
>
> 2. On memory-constrained systems (e.g., platforms with only 4GB of
>     physical memory, which is a common configuration), allocating 4GB
>     of virtual address space for shadow stack per process/thread can
>     lead to virtual memory allocation failures when the overcommit mode
>     is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
>     Error: "__vm_enough_memory: not enough memory for the allocation"
>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>
> Changed in v4:
> - Fix wrong subject. It is 512MB instead of 2GB
>
> Changed in v3:
> - Remove max(). PAGE_ALIGN() already rounds up
> - Change stack size to RLIMIT_STACK/8 with SZ_512M cap. Suggested by David Laight
>
> Changed in v2:
> - Add max() in case RLIMIT_STACK is smaller than PAGE_SIZE. Suggested by
>    Paul Walmsley and Sashiko
>
> Changed in v1:
> - Use min() instead of min_t(). Suggested by David Laight
>
>   arch/riscv/kernel/usercfi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index 6eaa0d94fdfe..2036918a77db 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -109,15 +109,15 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
>   	task->thread_info.user_cfi_state.ufcfi_locked = lock;
>   }
>   /*
> - * If size is 0, then to be compatible with regular stack we want it to be as big as
> - * regular stack. Else PAGE_ALIGN it and return back
> + * The shadow stack only stores the return address and not any variables
> + * 512M should be more than sufficient for most applications.
>    */
>   static unsigned long calc_shstk_size(unsigned long size)
>   {
>   	if (size)
>   		return PAGE_ALIGN(size);
>   
> -	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
> +	return PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 8, SZ_512M));
>   }
>   
>   /*

Just FYI, your V2 version of this patch was merged in Linux 7.1-rc4 (commit 6c7674b5b7ae513cecae22aa9dcdcf533862cf5c). You need to 
rebase, otherwise this patch won't apply.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
