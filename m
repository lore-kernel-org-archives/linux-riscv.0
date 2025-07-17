Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A09C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0Zs1Sd4BA8LaYvS/vI7vsMSsBCqmw/BPa1K2lXuFyc=; b=Rn/RhIK8jQuClM
	ZHADafIiqQUc9guM1d0ikpBt+/byJgvrZ3XnQXrDzQ1uTl2lKIh9uD5FHTUpcygPVvEk2fr1wAybo
	0oVAecKlaKtNtkJUqiL9GZnUt3jtdrfvAolZhBM/Os5N2i6wcuhoPxr27v0FO+0zxh9O9C5g+7G2x
	EGkbhdNoCqYtWJIB12LkQLA5vJ2/FPcmkDPeQD33A0tKtga+RSvb2DGkvNenRhIM8hJrsPy5QHOjN
	661NTC7+Vu8DMm1/I0TVR3MO2U3ijcmYeJFZZJqHzbx4o9vpixjZmA7wYcaMCuSk0RZBXYrhc6B0J
	EJzspaNt9Ycm5EjrVPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKbI-00000009gXc-2DDt;
	Thu, 17 Jul 2025 09:08:24 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJsj-00000009ZCP-23VC
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 08:22:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7B3431D8;
	Thu, 17 Jul 2025 08:22:14 +0000 (UTC)
Message-ID: <1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr>
Date: Thu, 17 Jul 2025 10:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
To: guoren@kernel.org, palmer@dabbelt.com, conor@kernel.org,
 alexghiti@rivosinc.com, paul.walmsley@sifive.com, bjorn@rivosinc.com,
 eobras@redhat.com, corbet@lwn.net, peterlin@andestech.com,
 rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Leonardo Bras <leobras@redhat.com>
References: <20250713155321.2064856-1-guoren@kernel.org>
 <20250713155321.2064856-3-guoren@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250713155321.2064856-3-guoren@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedukeehrddvudefrdduheegrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudehuddphhgvlhhopegluddtrddugedrtddrudefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehguhhorhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrt
 ghpthhtohepvghosghrrghssehrvgguhhgrthdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvth
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_012221_683229_B7FD72E1 
X-CRM114-Status: GOOD (  28.85  )
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

On 7/13/25 17:53, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
>
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
>
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
>
> This problem is only observed on the sg2042 hardware platform by
> running the lock_torture test program for half an hour. The problem
> was not found in the user space application, because interrupt can
> break the livelock.
>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
>   arch/riscv/Kconfig.errata                    | 17 ++++++++++
>   arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
>   arch/riscv/include/asm/errata_list_vendors.h |  3 +-
>   arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
>   include/asm-generic/rwonce.h                 |  2 ++
>   5 files changed, 75 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/include/asm/rwonce.h
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e318119d570d..d2c982ba5373 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -130,4 +130,21 @@ config ERRATA_THEAD_GHOSTWRITE
>   
>   	  If you don't know what to do here, say "Y".
>   
> +config ERRATA_THEAD_WRITE_ONCE
> +	bool "Apply T-Head WRITE_ONCE errata"
> +	depends on ERRATA_THEAD
> +	default y
> +	help
> +	  The early version of T-Head C9xx cores of sg2042 & th1520 have a store
> +	  merge buffer delay problem. The store merge buffer could improve the
> +	  store queue performance by merging multi-store requests, but when there
> +	  are no continued store requests, the prior single store request would be
> +	  waiting in the store queue for a long time. That would cause signifi-
> +	  cant problems for communication between multi-cores. Appending a
> +	  fence w.o could immediately flush the store merge buffer and let other
> +	  cores see the write result.
> +
> +	  This will apply the WRITE_ONCE errata to handle the non-standard beh-
> +	  avior via appending a fence w.o instruction for WRITE_ONCE().
> +
>   endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 0b942183f708..fbe46f2fa8fb 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int stage,
>   	return true;
>   }
>   
> +static bool errata_probe_write_once(unsigned int stage,
> +				    unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> +		return false;
> +
> +	/* target-c9xx cores report arch_id and impid as 0 */
> +	if (arch_id != 0 || impid != 0)
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_BOOT ||
> +	    stage == RISCV_ALTERNATIVES_MODULE)
> +		return true;
> +
> +	return false;
> +}
> +
>   static u32 thead_errata_probe(unsigned int stage,
>   			      unsigned long archid, unsigned long impid)
>   {
> @@ -183,6 +200,9 @@ static u32 thead_errata_probe(unsigned int stage,
>   
>   	errata_probe_ghostwrite(stage, archid, impid);
>   
> +	if (errata_probe_write_once(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
> +
>   	return cpu_req_errata;
>   }
>   
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
> index a37d1558f39f..a7473cb8874d 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -18,7 +18,8 @@
>   #define	ERRATA_THEAD_MAE 0
>   #define	ERRATA_THEAD_PMU 1
>   #define	ERRATA_THEAD_GHOSTWRITE 2
> -#define	ERRATA_THEAD_NUMBER 3
> +#define	ERRATA_THEAD_WRITE_ONCE 3
> +#define	ERRATA_THEAD_NUMBER 4
>   #endif
>   
>   #endif
> diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
> new file mode 100644
> index 000000000000..081793d4d772
> --- /dev/null
> +++ b/arch/riscv/include/asm/rwonce.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_RWONCE_H
> +#define __ASM_RWONCE_H
> +
> +#include <linux/compiler_types.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/errata_list_vendors.h>
> +
> +#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE)
> +
> +#define write_once_fence()				\
> +do {							\
> +	asm volatile(ALTERNATIVE(			\
> +		"nop",					\
> +		"fence w, o",				\
> +		THEAD_VENDOR_ID,			\
> +		ERRATA_THEAD_WRITE_ONCE,		\
> +		CONFIG_ERRATA_THEAD_WRITE_ONCE)		\
> +		: : : "memory");			\
> +} while (0)
> +
> +#define __WRITE_ONCE(x, val)				\
> +do {							\
> +	*(volatile typeof(x) *)&(x) = (val);		\
> +	write_once_fence();				\
> +} while (0)
> +
> +#endif /* defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE) */
> +
> +#include <asm-generic/rwonce.h>
> +
> +#endif	/* __ASM_RWONCE_H */
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index 52b969c7cef9..4e2d941f15a1 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -50,10 +50,12 @@
>   	__READ_ONCE(x);							\
>   })
>   
> +#ifndef __WRITE_ONCE
>   #define __WRITE_ONCE(x, val)						\
>   do {									\
>   	*(volatile typeof(x) *)&(x) = (val);				\
>   } while (0)
> +#endif
>   
>   #define WRITE_ONCE(x, val)						\
>   do {									\

I'll send this patchset in my next PR for 6.17:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
