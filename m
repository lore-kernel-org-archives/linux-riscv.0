Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DC8CC6B20
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 04:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDC+ZvqoJOVYKa0hp3hPjIZ1npxhmvgXZewFnCUs4Zg=; b=MkMB+gQH3NM7Vy
	+pKjyxk/T2nYs0rQ8TVBdGWlcqOaD188juSYtYZ6Qo9/TOpwYMw7CkH1tk3PZsJ+Sk3GNrBpfbzi8
	xq8ntZC/oCMd8bWJeNm7ZrXGMPrjgAMXFPKjAyDBeIS77WiiwoogqqRaRsTnuwc5C3f8rr2FcmKkH
	JuWtihnJk0jvCi86qx0LmklFw+vVkjJG1QU7gJNWKsWxBGi3HQxc3be++Jo/r9S0KS/4/9zWjOUb1
	8KdbRgZSaSbpcuZek1D1rjSo+8AnHPIsfbZrNhfkAxcSDNfQBAv+2qpoXRGM9Fat+o1qDFXvD6kCV
	SsepUJzMeQG8WOUiaQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqCd-0000000ETK8-3X80;
	Wed, 14 Oct 2026 04:02:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqCb-0000000ETJP-0wwj
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 04:02:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1LBNY2332963
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 04:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VWdbP2YpPS6VQfeV27iDbD/q
	vWCuu42ZlVxsIM4yMqU=; b=p52aLg4oqtWTVq+OGhn1mbuFCCdAblvqzUacGfB0
	U6X48RQ5MqlULeAjZr6+vISYvjeYJszESwFiSAp9TAIlVwKQvVJzUIML7zfIZ7yp
	8f7J7WLfwEgM9ojdBzkMMC6ZpO0mKO3M5v5lNRCEFFA0EXmeNwOG1M3O/1TeBtGD
	du4HXJ3eAwg/aIY+xMLOznrb8aluZFhodl+laqpIGjNsfydnfsKMcg00yI9HUICL
	QXHmP/apS4j/N26cP7DpOnPDY+dUcYtd6LGIhrrKr/ThtFdRiMJsewoZa0YMHr3T
	wRvWhxyZIOgEHBISEXEodQcOo3krDbHteXU0A/KH9M3PyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s0hj71e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 04:02:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so10060984eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791950571; x=1792555371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=;
        b=Yp5QpLzheyLEuORlAbhb/X934MJyPahFWDIPe2/LVIkFqv81U0Z0VGiYs1r9uINTkN
         mcg1cb2IJYmqJzUDY04vpGbLH0UVZyvMiUBJhGVMLNeS4Oze2qJQ41V7xMfQKQ9qSWmB
         K0YKaHE0dH2xNjE5oOuYVo9YWyRgVneVoPzNoUTEOCZqpKDoKIAGpqXxzqwYCU5b04W8
         U+g1huXdd3rBl2GRQa5MoDmQX0T/1XcxG81abP5UwVTC4bicWZ8bj1hj52tmUH4wWoab
         z1540YwvIGYHej310M+usS+8VL9qRqensnBQl8MhaQlJyfY2R6gsmt8luGah1Wqij6/P
         CoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950571; x=1792555371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=;
        b=Q0a1SvyXPU0DqxFtei7LYDS6ljZPOVzu40sY+og16nMgn8SKvCw/5EEaw7dU7OPTtH
         jwjevxz0oPC4StGCuRkuMJuDPk8KpAgajTjBlI/3e5udL+gNMqxvzZprEudaEKx4Mh7w
         b2q6wfGQLvLnn7tXUAomw4qdEECgtqTEs5a6NrReAbhKl63r/QVjJYxC5W/UdUPPhXsq
         LqcBplvKsBGFyWyJ/s1OP4NDaKbh3PZBIhNTO0O3pUpGmxC7RZmgunGVwZa4pA72vzRW
         Km09gnc8IWiweNoriymSNRx9DKoC7gtztsN8laYXVMKv7dO4PJ5jrq1rolqpwHL3/iQt
         eqyg==
X-Forwarded-Encrypted: i=1; AKwUvBx2fY7MJKm8CVMsvCXE/ejJEFeV2VRhv2m1RaeeB2pwnSKaKD0wAWj0AOC+YEXU0nP8/60am756ULjTlw==@lists.infradead.org
X-Gm-Message-State: AFq9FYK45tdeunvTa6xudal4MZsSYBgXyXyFzthCDi3I108qcDgangH7
	hGNBqDog1rDmxJljCXcOvsEtCzdRFXTEst96JsJXm6MTaS724+toPYiDvUCeUcQe0djx9q6Gek5
	E44hZAaxXKsUv5UmBHYlLKpmEUYcRnQw6MUgCOlyueOP3uZVKtXwrV9WWloX0cLaTpvRdCT4=
X-Gm-Gg: AYBFou16omC4BUGnI4TtGJLeTIgYw75YaE4PkxnW/YaUkDPqBO+Eg31OhJJlJADF/8y
	lP5StAb1f1/Z+x5iFw5p/mJE57GnmGg1KK5sr7vW1OMqsseCNSqOu17hVTN0pmqq9JveQkyrGlI
	aT7fQ69CIYg+RCpWD0Y8+TxF5Ilm65+4klBc0GPAj55AzuEYrUyTkQlSYVG0oR22iGeHNfihL4Z
	Zu8pOjIVz/UxAnxA3uZtH202bZDoUh4SSKpMpxh+kJTK7DVQvFyx7LcmsHjC+qFwHFLX/hvlhG7
	U4oNmBwt6nfTvADkW4toMPdgMcDFKv25qGXf+qQaK7vbCfpEWZrttHySQJC5Cn6PFNBagPtXkp+
	0+aZGXkE0NT7WX3Pqv6fy2DhUyExbxEAEDvkvEdyWWdD6VW3cECYUpMbqheAbFE9k4JF6P7mSUG
	hLUbTYjQThNersDGmT8pFttVpc
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr19572239eec.1.1791950570641;
        Tue, 13 Oct 2026 21:02:50 -0700 (PDT)
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr19572147eec.1.1791950569770;
        Tue, 13 Oct 2026 21:02:49 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm50995980eec.21.2026.10.13.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:02:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:32:36 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>,
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
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
        Yuanzhu <yuanzhu@bytedance.com>,
        Yicong Yang <yang.yicong@picoheart.com>,
        Susheng Yang <yang.susheng@zte.com.cn>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 RESEND 3/9] riscv: sse: mask events during shutdown
 and kexec
Message-ID: <as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
 <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Authority-Analysis: v=2.4 cv=GL+dgeNK c=1 sm=1 tr=0 ts=6acefeec cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=968KyxNXAAAA:8 a=a_nq2awA8k5mFBtTUooA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: okkgiT_tvC1Tk-Ltdi9l6LnYZLdWTF7G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX8K8aJmozJGR6
 ltJydUieBiy4oaeiaoYvydwDqnj4OcDy4LWXEt/JEtlExTiojOWhXUesORNaLbJX/ipu1P7CXkD
 LIgSjeQhhH4KnUEOdzWyGCCCyAbQG9U=
X-Proofpoint-GUID: okkgiT_tvC1Tk-Ltdi9l6LnYZLdWTF7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX8hQ/Pze97iac
 FUFbrz6oEIspvqTEHZY6AQDDmxiRF+kWTqE4vVPhwLH63FtyVab5jSBoAminu1Ii9K1vjZV4bGv
 4JCRLjJ8li6UewxUv4XioqQC0JiBg5iwEm1YCQx4/HEYsgDGA/4Vqm8NUf8LbskkJVnEstJCalY
 luS7UrrVVSM24a7r6OYF2SqtJ+/kPpKYlj376ho1tYHtWMC3auiHnWr7PppmJ/3zFVPK8N8Vj4s
 NSQaWQpWgG5kFeRZ1ar0Em+Jjq5LoEtqtTDqm+fMbZe93sH4uJ9W5D3n6NCLO+fnsCJyp/KrYlh
 VMW/lHqh7H8x5/2pz8NQz5cNKiiepRdk3HY7c4S4MvFyc32nptvIyzDnYA95T3E6D5bTbWePzTh
 csEol+JsfPPIXIPEWce8k9FR9h1dWLBzbdylWzfwRSR8XAKcC4ci16vKzBc/ftjiRgom9TH7Kec
 5X8lpOywZFMpKKfex1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_210253_384728_DE6652B7 
X-CRM114-Status: GOOD (  32.44  )
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

On Mon, Sep 21, 2026 at 07:15:00PM +0800, Zhanpeng Zhang wrote:
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
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6f..24e7affae70b 100644
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

I just realized. This rejects a normal kexec from any kdump kernel whenever firmware
merely advertises SSE, regardless of CONFIG_RISCV_SBI_SSE or whether anything is registered.
Can you check if its breaking kexec() with SSE just being advertised?

Also, there are some shasiko's comments worth addressing.

> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;
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
> index 14eb08a6db85..fdab37e7ae52 100644
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
This function call does SSE probe on every call. Wouldn't it be cheaper to do once?

Regards
Himanshu

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
> index fa66f9c97d74..7f0d4e7332f1 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -23,10 +23,13 @@
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
> @@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
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
> @@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -254,6 +268,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
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
