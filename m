Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DD0E9A03B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqqDadiigMfsY9UC9xmE0GJ5hs/B/VogAYysKzsP1e4=; b=IksDzqglRyELlH
	JUpJgfInHi5OWNUl5oX6OIm/t1q4x8YaOFPIT9cJttnwvKeeFQ9fpG9XT/YHtotM4PowPjxde1Le+
	7d3ahKE+bqB82ZjQXcOFghitdwhMjHGzdY51d5OdZ+fR0P6Yl5wH9UdcNfQQ1gkY10ntlaqraK+aA
	cRlMimCVl7YaNk5v8r1dX8qUs4buFdMpZGsDrVuNYK4NWbVPRnTGLTbbBuFDqPt8PICRz/grA95ci
	T5FZ2Wu9VSYb43YedoPttEhdfoQELDIfiV+/iuVON2e7iRkRV3K40ChAR78/X4/Kbe4yR1/Zi70Yh
	TfvHB9WWJagBx51DeiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgKX-00000009kU3-2t6F;
	Wed, 18 Feb 2026 12:06:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgKT-00000009kTX-2kel
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 12:06:56 +0000
Received: from smtpclient.apple (unknown [58.38.117.196])
	by APP-01 (Coremail) with SMTP id qwCowAA33WhJq5Vp5ZUzCA--.1761S2;
	Wed, 18 Feb 2026 20:06:34 +0800 (CST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH V3] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
From: Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20260125063941.443777-1-guoren@kernel.org>
Date: Wed, 18 Feb 2026 20:06:23 +0800
Cc: Han Gao <gaohan@iscas.ac.cn>,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 alex@ghiti.fr,
 leobras@redhat.com,
 djordje.todorovic@htecgroup.com,
 aleksa.paunovic@htecgroup.com,
 arnd@arndb.de,
 rabenda.cn@gmail.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,
 Yao Zi <me@ziyao.cc>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <pjw@kernel.org>,
 Guo Ren <guoren@kernel.org>
Message-Id: <3F85D6ED-6C47-46D0-96A3-165F4DE0D1E7@iscas.ac.cn>
References: <20260125063941.443777-1-guoren@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
X-Mailer: Apple Mail (2.3864.400.21)
X-CM-TRANSID: qwCowAA33WhJq5Vp5ZUzCA--.1761S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW8tFykXF13tF45Wr1DAwb_yoWxZryfpF
	Z0kF4FkFZ5GFn7A3srCw45urn8J3yfGr13K3s7uw18ArsFqrs8Jr1vg3yjqr9FvFs7Wr18
	GrZ3uFy2k39Fq37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbbo7tUUUUU==
X-Originating-IP: [58.38.117.196]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRECDGmVUIGCHgAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_040654_084629_2B97B8F6 
X-CRM114-Status: GOOD (  35.66  )
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

Hi, Paul

There was a response to this patch in Patch V2, but no further action has been taken.

I'd like to ask if there are any other issues with this patch, or if it lacks sufficient review feedback or testing.

> On Jan 25, 2026, at 14:39, guoren@kernel.org wrote:
> 
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
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Cc: Yao Zi <me@ziyao.cc>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
> Changelog
> 
> v3:
> - Rebase on 6.19-rc6.
> - Remove errata_list_vendors patch which has been merged.
> - Add Tested-by tag.
> 
> v2:
> https://lore.kernel.org/linux-riscv/20250713155321.2064856-1-guoren@kernel.org/
> - Add new header file for errata_list_vendors.
> - Rebase newest kernel version.
> 
> v1:
> https://lore.kernel.org/all/20241214143039.4139398-1-guoren@kernel.org/
> ---
> arch/riscv/Kconfig.errata                    | 17 ++++++++++
> arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
> arch/riscv/include/asm/errata_list_vendors.h |  3 +-
> arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
> include/asm-generic/rwonce.h                 |  2 ++
> 5 files changed, 75 insertions(+), 1 deletion(-)
> create mode 100644 arch/riscv/include/asm/rwonce.h
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c945d086c7d..4d3f13522da6 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -154,4 +154,21 @@ config ERRATA_THEAD_GHOSTWRITE
> 
>  If you don't know what to do here, say "Y".
> 
> +config ERRATA_THEAD_WRITE_ONCE
> + bool "Apply T-Head WRITE_ONCE errata"
> + depends on ERRATA_THEAD
> + default y
> + help
> +  The early version of T-Head C9xx cores of sg2042 & th1520 have a store
> +  merge buffer delay problem. The store merge buffer could improve the
> +  store queue performance by merging multi-store requests, but when there
> +  are no continued store requests, the prior single store request would be
> +  waiting in the store queue for a long time. That would cause signifi-
> +  cant problems for communication between multi-cores. Appending a
> +  fence w.o could immediately flush the store merge buffer and let other
> +  cores see the write result.
> +
> +  This will apply the WRITE_ONCE errata to handle the non-standard beh-
> +  avior via appending a fence w.o instruction for WRITE_ONCE().
> +
> endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 0b942183f708..fbe46f2fa8fb 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int stage,
> return true;
> }
> 
> +static bool errata_probe_write_once(unsigned int stage,
> +    unsigned long arch_id, unsigned long impid)
> +{
> + if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> + return false;
> +
> + /* target-c9xx cores report arch_id and impid as 0 */
> + if (arch_id != 0 || impid != 0)
> + return false;
> +
> + if (stage == RISCV_ALTERNATIVES_BOOT ||
> +    stage == RISCV_ALTERNATIVES_MODULE)
> + return true;
> +
> + return false;
> +}
> +
> static u32 thead_errata_probe(unsigned int stage,
>      unsigned long archid, unsigned long impid)
> {
> @@ -183,6 +200,9 @@ static u32 thead_errata_probe(unsigned int stage,
> 
> errata_probe_ghostwrite(stage, archid, impid);
> 
> + if (errata_probe_write_once(stage, archid, impid))
> + cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
> +
> return cpu_req_errata;
> }
> 
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
> index ec7eba373437..8fd7c36307e2 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -18,7 +18,8 @@
> #define ERRATA_THEAD_MAE 0
> #define ERRATA_THEAD_PMU 1
> #define ERRATA_THEAD_GHOSTWRITE 2
> -#define ERRATA_THEAD_NUMBER 3
> +#define ERRATA_THEAD_WRITE_ONCE 3
> +#define ERRATA_THEAD_NUMBER 4
> #endif
> 
> #ifdef CONFIG_ERRATA_MIPS
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
> +#define write_once_fence() \
> +do { \
> + asm volatile(ALTERNATIVE( \
> + "nop", \
> + "fence w, o", \
> + THEAD_VENDOR_ID, \
> + ERRATA_THEAD_WRITE_ONCE, \
> + CONFIG_ERRATA_THEAD_WRITE_ONCE) \
> + : : : "memory"); \
> +} while (0)
> +
> +#define __WRITE_ONCE(x, val) \
> +do { \
> + *(volatile typeof(x) *)&(x) = (val); \
> + write_once_fence(); \
> +} while (0)
> +
> +#endif /* defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE) */
> +
> +#include <asm-generic/rwonce.h>
> +
> +#endif /* __ASM_RWONCE_H */
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index 52b969c7cef9..4e2d941f15a1 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -50,10 +50,12 @@
> __READ_ONCE(x); \
> })
> 
> +#ifndef __WRITE_ONCE
> #define __WRITE_ONCE(x, val) \
> do { \
> *(volatile typeof(x) *)&(x) = (val); \
> } while (0)
> +#endif
> 
> #define WRITE_ONCE(x, val) \
> do { \
> -- 
> 2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
