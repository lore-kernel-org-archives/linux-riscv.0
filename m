Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F75B606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WF2mwSLi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTBGL1w+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iAbMR5nE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I/cfdGxeUEGbSlmkIHpY6CEsXJEQXWdcEwkpMRgco7w=; b=WF2mwSLiHYdv/z30TggMJF4bdh
	5SfoW/qr0Xt1A3hvhULD22/Qod74uVMsBNoEpkk+/juPQLzsrtpvHTKwjM08//eYQAizG7OHbBeU5
	ofou2lIxkAJULz0AAEVU7FLF7CAlZuW8XS9YqNX04rbqhPbJo1LZt0w6U3Ga+lYbVstNmrMFmaN9c
	yAdUf1s3g3Q+Y6knHmLqlRW3mLlx41naAYqUeGM/aVntO2D/8bkHVmUsaFMnr3RtoZIbJFMPLPoZf
	20Pob4dU14znI0H5kpnv0e0OR2SPaqmQsAy3YkcELMxhIYe008E9GZNMiB/UXCLXQXrXY3Hi2gnZM
	fQzMKz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOdd-000000095Pa-1Ws7;
	Thu, 29 Oct 2026 11:49:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOda-000000095PC-2me9
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 11:49:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vF2M3765970
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 11:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CnD9Bbx1mXxdyDGDWNvR0ef0
	iRlpiPdONHzOZK+2clg=; b=NTBGL1w+LQ9lMZJioMX9Fp9L3e2sNR/scON+RaeN
	STps0tqVzMHp1Ae2gO4tTv1V7S4QmiYU9g1B1Vrsmbly190GW8H1nn8D7wh4OARp
	k6tkJPPPyQ44ok9hzhYPSI65vZ/zkLZhV2JSVLlf4JdSNH97OK4z32pVx0WTRoGx
	DseJ1qt0wTRcRTwg2H3fseezhu+3A3/K1Zpa1uMo994q2BCUGjlEqC60nKo4yUev
	HVKMhrStF/sqPT70b6W+jo4ZtcvCfyNE5WsRiNABaP1DIZ5uVicXxSX0TeCKfryA
	uC6O5hn3uD1N8chgf2bgk/vkhAY4xiHcKX5nUZWCvXLzcw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpudgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 11:49:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2365770eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793274580; x=1793879380; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnD9Bbx1mXxdyDGDWNvR0ef0iRlpiPdONHzOZK+2clg=;
        b=iAbMR5nENo6Jb52wHyBNGe4QKta2YiOpN4tAuf5UW4TYVMTGZ/GPE9H/8F0xkgr43b
         QqDbG1elqsj+Svf3l4QJrW3eDcQARyifNik0JqMWPAVqeDXWDDBUrTYUE5tw+YrSpE6t
         euyu9p0lErvi9GKMXcczPiBmpkiskl9dVueFY+APKHsdb0Ig3JZVM2dBXxLVKy+uSelj
         1mY/2okr3po6Cg3GqxHr5h6oHUjiZ6PVWbzO8oH2LRyyl8Gz6sheXM6P7V74x66A7IQx
         xWX/mNHh/CIW1XXTtRtYuGU0rDNEm467HFril5cRCYI1JVj5EfNS8gBC3zJO5B6MIlZQ
         DBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274580; x=1793879380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnD9Bbx1mXxdyDGDWNvR0ef0iRlpiPdONHzOZK+2clg=;
        b=E7jMm85QrlaKELjom+3rmtrxiFF64LLVoBp1I0rDJYEZcXfsT5JvfDpwAw3AePGKdh
         5+eJjydackWu+TCczjpd3AUxn1SKjz9MfAYNRkvn/w1tihdq/Tu+gp53Qlxg/laA0OGI
         W9ML+qak6eYSGKoFTQQkgWbhy/uDOuRSn1IqTYY88kMqrJ6kzrWFfcoJMn+lhR7b1Ra3
         zJuxY8BpSLByk+M0tYgF9xeRjNj6kJ6keD1hnwYs3JRtSJ3qEzUsVsRpMc7qufswJOLN
         WPsd9PFHGkGT+Le/6SV2XdlJdordHVgCsyncSXT6p/IjEtHnwapxxbGx12+tH+OC0OHP
         uvjg==
X-Forwarded-Encrypted: i=1; AKwUvBxc8qILMb7bnEDvHkTPdiolTmDUw7ZtjVatJgd4mx01kHHzW1yiHh7DpkI2Xl115+XJDB1eYe9FZpt11w==@lists.infradead.org
X-Gm-Message-State: AFq9FYLO7ounbuKCHWVr8I036j5epWmv21CGhidb0RhyEBYFRZvjccY+
	ZAw5glZf14VNDBM9tAYbRotZGBBFp0LvEPs0H/C5TFsuIkdSE4kAwPIKg9O4gzvb1zkrQHPTSGm
	roOZbSbNbzjsHGAYN5IeL+xGOdCM/4Zq7ESYMRD+yyaIq1LyTiGsjXFGyNKtogebiKlp2SvU=
X-Gm-Gg: AYBFou3usflR72NkXTLuoGhr00SVxNQMfbpdD/jauf6tcadSqjcK3pTOgExqwI6OQLY
	oF5IFehZjOGqKpOA1T4vHN3owPuWA60/d2u7MSXQfMdzqN9zexa1IEMla1mjW7clk3JL80C2K4Z
	e496vRDijWvhZBY8LXwHm4rpNyvPlzj+BI8pZ/AApDwPDj/omXW6JYVud8zO+E3a1m+McQy6Gl3
	zrck0kHVyIGW0haA2WyzzVIxSNR5/U3XQCSWlvhS7VByKIC2j63+opKpkr6UUk7GELN+tFZTeoo
	tMc5CTOcC/G0Ry8MhSHOj4DpWWUGwVEe0yWefHt2dvPeznws6TYOuH80+ubhU1Gkm+w5rRfBPaZ
	K6rOGT0TUeZnGjl6z9IqOBt7CNEnQKojAg+QILbZbJKcIXHPQk3pPnZ6yAhuV/Pmqvqz0U6NL0d
	k3tPsjdLjZBxra716VF49yinMatKIY98ogDhZq3oAstNAmugb9K9cgSHkrSqUPzTQhADrqU55k
X-Received: by 2002:a05:701b:270f:b0:128:d4be:7428 with SMTP id a92af1059eb24-1a6ce4ea644mr7017473c88.19.1793274580127;
        Thu, 29 Oct 2026 04:49:40 -0700 (PDT)
X-Received: by 2002:a05:701b:270f:b0:128:d4be:7428 with SMTP id a92af1059eb24-1a6ce4ea644mr7017432c88.19.1793274579516;
        Thu, 29 Oct 2026 04:49:39 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a5594efsm19594399c88.2.2026.10.29.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:49:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:19:27 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        yuanzhu@bytedance.com, yang.yicong@picoheart.com,
        yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v12 03/11] riscv: sse: mask events during shutdown and
 kexec
Message-ID: <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX+5BGcpfeaZsL
 l3TDCgprByp1bzXk8R5H/TDPS1yzxrKPH9gewAhzLcCC4R0S1swaDWeBVfgFBJMf6qgLk86+BAq
 TakmJdf/NKuP8f8pxR0Kg/u4JvD6c4zMrYyqmff/9ffgsLUX7qmtaoSamnBG5XGgQ7kR/oiMRT4
 1jMPIWJj67AlqwtvxVEwucoNvB6+gKrryu40U/dFF27+5kPovn5If3rJdwU3JHcK9eCN1m1Ut2y
 r989kABnaIFzZc3D+hDgCCUq43WEoTFgQOXqkpms0/bUeJ0kXrI65wJ9PoX7s8+jGmE9+KzouVg
 CYDumInBkEcFeyWFmfPre/P2bSNL1xKt0KTh7U+8kLuai/gTPzQu0rNia9NImwofMngrhnpZ7iC
 kFpE6XuWSH+dlcMDLvMC9jZPP7/FwyNMSLTEOd+oEDFZkLaGh17o6J6ZJBey/WTu3voCQ0UJFbM
 w+mESVkDkJAPdj1/RYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX8HBmsHoBMagh
 N4PA1odZ1YZJcVZgjxPSt8eneQho3uEhDMi2hTyAm0aiMEhSP1T1U7+1+xEKnqWEYoJ+uTa0HlE
 pv46OTss8r6Q5y3L5p7xVi7Tl7A8L+Q=
X-Proofpoint-ORIG-GUID: Oz1MGrERP1_UYy3gfMfYFUsHgCZMryt8
X-Proofpoint-GUID: Oz1MGrERP1_UYy3gfMfYFUsHgCZMryt8
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae332d5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=d9ZL6iGcv7SM8b05mYgA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_044942_823243_F8EF0D03 
X-CRM114-Status: GOOD (  34.27  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:48:45PM +0800, Zhanpeng Zhang wrote:
> SSE delivery is independent of normal S-mode interrupts. Firmware may also
> retain an event registration until Linux explicitly unregisters it. A hart
> must therefore stop accepting SSE events before Linux stops servicing the
> registered handler.
> 
> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
> and crash shutdown paths. This prevents firmware from entering Linux-owned
> handler state after the corresponding CPU or kernel context is no longer
> valid.
> 
> A crash kernel cannot identify or take ownership of registrations
> inherited from the crashed kernel. Reject a later normal kexec while such
> SSE state may still exist, rather than transferring unknown firmware state
> to another kernel.
> 
> The restriction is deliberately based on firmware SSE availability, not
> CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disabling
> SSE in the crash kernel does not establish that registrations left by the
> crashed kernel are absent. Consequently, normal kexec from a crash kernel
> is also rejected when firmware advertises SSE but no registrations were
> actually left behind. This conservative restriction remains until a safe
> way to establish or clear inherited firmware state is available.
> 
> Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com/
> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6..24e7affae70 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -14,10 +14,13 @@
>  #include <asm/set_memory.h>	/* For set_memory_x() */
>  #include <linux/compiler.h>	/* For unreachable() */
>  #include <linux/cpu.h>		/* For cpu_down() */
> +#include <linux/crash_dump.h>
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  
> +#include <asm/sse.h>
> +
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz = 0;
>  	int i = 0;
>  
> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
> +	    riscv_sse_available()) {
> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;

I think I had pointed this out in v10 also. This rejects a normal kexec from any kdump kernel whenever firmware merely advertises SSE, regardless of CONFIG_RISCV_SBI_SSE or whether anything is registered. Can you check if its breaking kexec() with SSE just being advertised?

Regards
Himanshu

> +	}
> +
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -127,6 +137,7 @@ void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> +	riscv_sse_mask_current_hart();
>  
>  	/* shutdown non-crashing cpus */
>  	crash_smp_send_stop();
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db8..fdab37e7ae5 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,20 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
> +
> +#include <asm/sse.h>
> +
> +#ifndef CONFIG_SMP
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +#endif
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	riscv_sse_mask_current_hart();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +46,14 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index eddbc3ad06c..9ad38df4827 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -22,10 +22,13 @@
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
>  #include <linux/nmi.h>
> +#include <linux/panic.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
> @@ -78,8 +81,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
>  	return -ENOENT;
>  }
>  
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +
>  static void ipi_stop(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	set_cpu_online(smp_processor_id(), false);
>  	while (1)
>  		wait_for_interrupt();
> @@ -90,6 +103,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -253,6 +267,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -300,6 +316,7 @@ void crash_smp_send_stop(void)
>  		return;
>  
>  	cpus_stopped = 1;
> +	riscv_sse_mask_current_hart();
>  
>  	/*
>  	 * If this cpu is the only one alive at this point in time, online or
> -- 
> 2.50.1 (Apple Git-155)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
