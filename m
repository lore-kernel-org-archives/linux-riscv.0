Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90464C982D2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 05:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mfww3DSfHmchhjw9P/Cz5PT35s6u13lloT15GMyEbw=; b=oWHJlnbilIqMKk
	JYUGQUS1MigNPF9U+0aBHOmLZeud/P8FV1NxFRSfnoFifnP6WMrXth2W/ZyaFKoqhBdQxoNKmnieC
	UNe3+6MXmVYllI8Y7c3XDnBYUsHnLLJibb8AXz+v2nCQRB1x91OCu4k3F+U7D7CZmr3oUDWrv8pFO
	GuQTZeQBVtQowAg5qm+xwfT+A37FudPlQwdjB+rcuA9RUc9tw5HOQC1O8ZVNiSpLuUaY+h6DPNlY5
	yIK4dBO/EaWBX5wMHgS24lZDHh0RAVGP92hIgBkKCLJ1zTmDP3roLXDFIuAp1BbQeuiDB8nOIO7tR
	+pppFh4mz7BVwnpHEG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RD1-0000000DV4Y-05G9;
	Fri, 18 Sep 2026 05:32:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RCw-0000000DV3b-2zZU
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 05:32:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UjYv3761693
	for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 05:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVBkzaky/dghN741gqL7EjVijpldN22PzKYGKt3DmuQ=; b=nnf7s9/3hN2b3XYS
	Gs4S8Dc/OAnqXP1Kyv3czj6tpjU48w2U7Qn5fM10aOTVd3n3Me0UUaV5DtCJHZZj
	o/Q/a1OunTibO0gVpKrSzJzHmN1XY5Qj1mniHBqpr9QlBZFJZ6TfdMtITcY5Fps8
	+aX1nZBu7y2u3NrTGqtSGgoykX8o4QMK1VDW/qN9k3WlAiAJ7aiSHgIvyEcnMEph
	pzysVsOwtclmUFNnX6Qx/44bL44DZDd19yTWaLGalti7dY6Dvw+osnSZDPkTtpE/
	q/Z1a5w2PUjAb3gP3nmfpihajcioGLfecIX56sHVrwKGBluz60VcRtv6bg6AteDk
	T1cv+w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqea96v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 05:32:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc52c77089bso493675a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 22:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789709540; x=1790314340; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVBkzaky/dghN741gqL7EjVijpldN22PzKYGKt3DmuQ=;
        b=F7q1YngRlS9zdnOmXaycyAewtzA5zXkIoMlilxmsI1q5NtUMeAF8C5EkTVhcul3KHj
         f/cBD+XaR8n69AZheYu0dzz+8qbO6iZIZvQOWyorWA22LLuP0XZjn/GvuCJkq40TKS3D
         tJ+CRLqETJmfREKsoB/8rCIRUmzk/trEqyD33/+DXS9QSDGBbe77yl37vPCs37fu9aPf
         5DgHVA1mH3n7H/neCdgbAzc3rlgiqHRexFTPAtKkA5DvKuMshS8iUHxw1lPXz0DcdV52
         7shvesqvoxM9NsGpPMfTA1C1Sm7Q64+X93tE3OIZFuz5XWCbpIeWzqxfbi/pyI6qzoW1
         vrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789709540; x=1790314340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WVBkzaky/dghN741gqL7EjVijpldN22PzKYGKt3DmuQ=;
        b=EppS0eAQLYEJlYmNlFK+vyBcV1IWKfd3bZbBiZErn4Fi9anhPhk6WmfBFfGA+5m0bo
         LvYFlIidXZ/IaRW9Zm+IGytvkvy2WdGfqrGirA9wEOcSh8I11U+x7u0Dm31E0P+xgFMq
         /e+nydJRgE5giWuQvt+64z36icw5xfaqONwqXkaD6p4x8JCa9vhMi6/1VkexbiqbXmx0
         Oozv05G3ca7T5agaKvoxhSdyhN/hRe/tYeH7+b/F6/MI+/S8UeFvBa9DE/dVH7dPenME
         4OSfKc6lJ+FSsHyBnkB0GPla9H+u71wG39ho5lhQHQcfPywSrS3wgS9wvG662Yh9Pl9t
         xSXw==
X-Forwarded-Encrypted: i=1; AKwUvBz6MnyuZFrsChhS35uJsJA+a6d13VMmcTzbAb+cJSvlM5frY06ErYblP6zqXy6l6/6DfhETHaRuRqNqgQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lbxi9E3+Hz+0KzHHH3cp0OtAqxbksHyl9x024NO/tEVWHjuEv6
	QbDiW2uC72u+fLdorpIjxm9rTeUKGnl+JclQt0Bz6YnU5GFfcoVzapKTdBQZzrE9ElCIayAHUSm
	/JacYjNeAc3tnu64VUP9YrM/VtmvhlE+je7IWrX5N5jYda1FG3Msq+NbDNAyjqr4so2BzKn8=
X-Gm-Gg: AYBFou0Vn7EVxmzqdezmseOrGRXqPgq+w3BoQ1oxpuZJWnwif9q2FwgPIl+gMXtDmEL
	YFMOJQkfb07UR797wkikNJ1J/uw/rQ/Nw2k94+/ehszVIBZmK2gzocei6jvCh7TRpkXDEnpChPD
	ZJbJRauObfvD7IfLsOiTiaMuKGLFgs+rzLMe+dWgAjMpp5wB+xFIwkN6Nd0DtSNmXRHRA/NOpTM
	P3RJgg1V6qEs0l13kPeS4niyXKZaoBqDuMZDJnQ93Slybf0y8ZxAG2sCJBiF14LYjNtCrSucmsG
	sFW/VCyQeQoAxSVYkIOJVaqER6X53AGKQG5lIenUmCQhhHrJAYyKXGuTuAl/j3rMaKWhk80VEES
	01mWonI/DZYPfthOSJcc9rYX0BI4ju3jYyehtjem4cDR2oZV16vOnQD8PipkVT0dnnFSHXCLBLT
	eAKRXC6QvT5GW49A8tqhxivGvP
X-Received: by 2002:a05:6a21:1f8e:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd8c2ddfc8mr2953927637.2.1789709539956;
        Thu, 17 Sep 2026 22:32:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f8e:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd8c2ddfc8mr2953862637.2.1789709539187;
        Thu, 17 Sep 2026 22:32:19 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2874bb0csm1443508eec.16.2026.09.17.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:32:18 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:02:06 +0530
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
Subject: Re: [PATCH v10 7/9] perf: RISC-V: add support for SSE event
Message-ID: <aqzM1jkNziNwRJ8V@hu-himchau-blr.qualcomm.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
 <20260911121456.33223-8-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911121456.33223-8-zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-ORIG-GUID: 2OMCh0qFNSvRPjWsyhIFQB0EVsXykj6W
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aaccce5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=h0uksLzaAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=W-_n0kkjAAAA:8
 a=JfrnYn6hAAAA:8 a=sjI7QCpTNa8k5Zj08CUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=MSi_79tMYmZZG2gvAgS0:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 2OMCh0qFNSvRPjWsyhIFQB0EVsXykj6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA3MSBTYWx0ZWRfXyZ42rdwFBG3h
 U849ktoarV1KGV4vfgyQn/xo/WWdGyJwfLJJokWo97EccytevtlMapL2RKQvvuV7k4WiVQXKrDh
 5t+MZod8e6TAfkFT78S7iXoNmCxvQ2KzNPMK40xlDCxOtrnuDHqNmAhqQAPoxSO/lgSboT9LOYT
 6R/BMKAj0+haveDK5wqKi9vALQw3P/ros7T/mlLoJ3fm3vFMPIV4Hrd3WPj9m+ozZGyg2goft3o
 q1XAxtPTKWzcYBuRZFiQZi69iuGNGL1DtSPODZbmI8ui6yIB+9bSXmKF8kTMkSW/d7G1x6PWvJN
 lvd+NKs4640OITr4jJYUgW8Noc5+2ZdwioMRoxVmcWHXvomCt1eYin0ri5Z7m5pxYYLS9/vn+8V
 XRFoPCP4N9N+3g/jwyL94IglcRYpzhXijR1/VEVqbVc6DGqC48l2rNGUiBUV5SZ+LxKSyFKq/op
 pS8GModQfFG/nheUfDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA3MSBTYWx0ZWRfX3sgDi1B+Nvmy
 kyPaZNPZ8KC0wks9krMF3v6HiKTX33zYPRXBM9OWriBnOTla5Xz3W6UYhJSyPDmb/coRLgiPLO8
 zq0jeVlnwUVYT5NW4Eew2TGdB3sjq40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_223222_988718_DE735079 
X-CRM114-Status: GOOD (  38.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Zhanpeng Zhang,

On Fri, Sep 11, 2026 at 08:14:54PM +0800, Zhanpeng Zhang wrote:
> From: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> Register a handler for the local PMU overflow SSE event so that RISC-V
> perf can receive overflows even when normal S-mode interrupts are masked.
> Reuse the existing overflow handler and pass it the interrupted pt_regs
> rebuilt by the architecture SSE entry path.
> =

> Select the delivery mechanism once during PMU probe. Prefer SSE when its
> event can be registered and enabled. If the extension or PMU event is
> explicitly unsupported, use the ordinary PMU interrupt. Do not enable the
> interrupt after any other SSE setup failure or when a crash kernel may
> have inherited firmware state. Install the PMU enable and disable
> callbacks only after SSE delivery becomes active.
> =

> Keep the local PMU SSE event disabled across CPU power management. On
> entry, the generic SSE notifier masks the hart before the lower-priority
> PMU notifier disables the event and stops the counters. On exit, the SSE
> notifier first unmasks the hart while the event remains disabled. The PMU
> notifier then restores counters and event userpage state before enabling
> the event. An unmask failure stops the notifier chain and leaves the
> counters stopped. Ordinary PMU interrupts retain their existing notifier
> ordering.
> =

> An SSE overflow can arrive as soon as the event is enabled during probe.
> Publish the counter mask before SSE setup, so an early handler can stop
> the counter source even before perf starts admitting normal samples.
> After a real overflow, restart only counters whose perf state is still
> running. Honor a non-zero return from perf_event_overflow() and leave
> throttled events stopped.
> =

> Guest attribution is not part of this version. Detect an interrupted guest
> from hstatus.SPV and skip its sample while still updating the period and
> counter state, rather than exposing guest state as a host sample.
> =

> The perf PMU callbacks cannot return errors. If an SSE transition or
> interrupted-context read fails, latch the failure per CPU and stop its
> mapped events through the normal perf state transitions. Do not reset the
> firmware counter mapping behind perf, restart a failed event, or attempt a
> runtime switch to IRQ delivery.
> =

> During cleanup, close callback admission and synchronously drain each CPU
> before disabling and unregistering the SSE event. If firmware refuses the
> cleanup, stop the counter source and transfer the event to the SSE core so
> later CPU hotplug or shutdown processing can retry without using freed PMU
> callback state.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  Documentation/arch/riscv/index.rst     |   1 +
>  Documentation/arch/riscv/pmu-sse.rst   |  55 +++
>  MAINTAINERS                            |   1 +
>  drivers/firmware/riscv/riscv_sbi_sse.c |   9 +
>  drivers/perf/Kconfig                   |  11 +
>  drivers/perf/riscv_pmu.c               |  14 +-
>  drivers/perf/riscv_pmu_sbi.c           | 544 ++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h         |  20 +-
>  include/linux/riscv_sbi_sse.h          |   6 +
>  9 files changed, 566 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/arch/riscv/pmu-sse.rst
>

Thanks for sending v10. I was waiting on your series so that I can send the=
 RAS series
based on it. I was trying to apply the series on v7.3-rc3 but this particul=
ar patch fails.
I used b4 shazam to pull the series.

Could you once check?

Thanks
Regards
Himanshu
 =

> diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/risc=
v/index.rst
> index ac535c52d509..5cb909c83a88 100644
> --- a/Documentation/arch/riscv/index.rst
> +++ b/Documentation/arch/riscv/index.rst
> @@ -11,6 +11,7 @@ RISC-V architecture
>      vm-layout
>      hwprobe
>      patch-acceptance
> +    pmu-sse
>      uabi
>      vector
>      cmodx
> diff --git a/Documentation/arch/riscv/pmu-sse.rst b/Documentation/arch/ri=
scv/pmu-sse.rst
> new file mode 100644
> index 000000000000..b7458a9d0116
> --- /dev/null
> +++ b/Documentation/arch/riscv/pmu-sse.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +RISC-V PMU overflow delivery through SSE
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When ``CONFIG_RISCV_PMU_SBI_SSE`` is enabled and firmware provides the l=
ocal
> +PMU overflow event, the RISC-V SBI PMU driver uses Supervisor Software E=
vents
> +(SSE) to deliver counter overflows.
> +
> +Delivery selection
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The delivery mechanism is selected once while the PMU device is probed. =
 The
> +driver first tries to register and enable the local PMU overflow SSE eve=
nt.  It
> +tries the ordinary PMU interrupt only when the SSE extension or the loca=
l PMU
> +event is explicitly unsupported.  It does not change the delivery mechan=
ism
> +after the PMU has been registered.
> +
> +Other SSE setup errors do not prove that firmware released the overflow =
route,
> +so the driver does not enable the ordinary PMU interrupt.  The PMU remai=
ns
> +available for counting but not sampling.  If setup retained an SSE event=
, the
> +PMU keeps quiescing that event around perf scheduling changes without re=
arming
> +it.  This preserves callback ownership without creating two possible del=
ivery
> +mechanisms for the same hardware overflow.
> +
> +Interrupted context
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +SSE enters Linux through a supervisor handler context constructed by fir=
mware.
> +The entry contract preserves the interrupted GPRs except ``a6`` and ``a7=
``,
> +which Linux reads from the interrupted-register event attributes.  Linux=
 then
> +reconstructs the interrupted ``pt_regs`` and publishes it while dispatch=
ing the
> +event.
> +
> +Perf uses that context for register samples and callchains.  Kernel stack
> +walking verifies that the interrupted frame belongs to the current task =
stack
> +before dereferencing it.  For sensitive entry paths and IRQ stacks, Linux
> +records the interrupted PC without walking a stack whose bounds cannot be
> +proved.  User callchains use the existing no-fault user unwinder.  A DWA=
RF
> +raw user-stack copy from an SSE handler must not take a page fault, so it
> +walks the current task's page tables with fast-only GUP, copies each res=
ident
> +page through its kernel mapping, and stops at the first non-resident pag=
e,
> +preserving perf's truncated-user-stack semantics.
> +
> +CPU power management
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The PMU and SSE CPU power-management callbacks are ordered according to =
the
> +selected delivery mechanism.  With SSE delivery, SSE events are masked b=
efore
> +the lower-priority PMU callback disables the local PMU event and stops t=
he
> +counters on entry.  On exit, the hart is unmasked while the local PMU ev=
ent is
> +still disabled.  The PMU callback then restores the counters and enables=
 the
> +event, so an unmask failure leaves the counters stopped.  The ordinary
> +interrupt path retains the existing PMU ordering.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d11cd44d2449..91b4e32a1fb2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23392,6 +23392,7 @@ M:	Atish Patra <atish.patra@linux.dev>
>  R:	Anup Patel <anup@brainfault.org>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	Documentation/arch/riscv/pmu-sse.rst
>  F:	drivers/perf/riscv_pmu.c
>  F:	drivers/perf/riscv_pmu_legacy.c
>  F:	drivers/perf/riscv_pmu_sbi.c
> diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/ri=
scv/riscv_sbi_sse.c
> index e81cfb4b0c56..c7d2a2def00a 100644
> --- a/drivers/firmware/riscv/riscv_sbi_sse.c
> +++ b/drivers/firmware/riscv/riscv_sbi_sse.c
> @@ -161,6 +161,15 @@ static int sse_sbi_event_func(struct sse_event *even=
t, unsigned long func)
>  	return 0;
>  }
>  =

> +bool sse_event_is_enabled_local(struct sse_event *event)
> +{
> +	if (!sse_event_is_global(event->evt_id))
> +		lockdep_assert_preemption_disabled();
> +
> +	return sse_get_reg_evt(event)->is_enabled;
> +}
> +EXPORT_SYMBOL_GPL(sse_event_is_enabled_local);
> +
>  int sse_event_disable_local(struct sse_event *event)
>  {
>  	if (!sse_event_is_global(event->evt_id))
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 245e7bb763b9..10b047856121 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -105,6 +105,17 @@ config RISCV_PMU_SBI
>  	  full perf feature support i.e. counter overflow, privilege mode
>  	  filtering, counter configuration.
>  =

> +config RISCV_PMU_SBI_SSE
> +	depends on RISCV_PMU_SBI && RISCV_SBI_SSE
> +	bool "RISC-V PMU SSE events"
> +	default n
> +	help
> +	  Say y if you want to use SSE events to deliver PMU interrupts. This
> +	  provides a way to profile the kernel at any level by using NMI-like
> +	  SSE events. SSE events being really intrusive, this option allows
> +	  to select it only if needed. See Documentation/arch/riscv/pmu-sse.rst
> +	  for interrupted-context limitations.
> +
>  config STARFIVE_STARLINK_PMU
>  	depends on ARCH_STARFIVE || COMPILE_TEST
>  	depends on 64BIT
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 8e3cd0f35336..1f65c640b693 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -13,6 +13,7 @@
>  #include <linux/irqdesc.h>
>  #include <linux/perf/riscv_pmu.h>
>  #include <linux/printk.h>
> +#include <linux/riscv_sbi_sse.h>
>  #include <linux/smp.h>
>  #include <linux/sched_clock.h>
>  =

> @@ -247,6 +248,11 @@ void riscv_pmu_start(struct perf_event *event, int f=
lags)
>  	if (flags & PERF_EF_RELOAD)
>  		WARN_ON_ONCE(!(event->hw.state & PERF_HES_UPTODATE));
>  =

> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	if (unlikely(this_cpu_ptr(rvpmu->hw_events)->sse_failed))
> +		return;
> +#endif
> +
>  	hwc->state =3D 0;
>  	riscv_pmu_event_set_period(event);
>  	init_val =3D local64_read(&hwc->prev_count) & max_period;
> @@ -306,6 +312,7 @@ static int riscv_pmu_event_init(struct perf_event *ev=
ent)
>  	struct hw_perf_event *hwc =3D &event->hw;
>  	struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
>  	int mapped_event;
> +	int ret;
>  	u64 event_config =3D 0;
>  	uint64_t cmask;
>  =

> @@ -331,8 +338,11 @@ static int riscv_pmu_event_init(struct perf_event *e=
vent)
>  	hwc->idx =3D -1;
>  	hwc->event_base =3D mapped_event;
>  =

> -	if (rvpmu->event_init)
> -		rvpmu->event_init(event);
> +	if (rvpmu->event_init) {
> +		ret =3D rvpmu->event_init(event);
> +		if (ret)
> +			return ret;
> +	}
>  =

>  	if (!is_sampling_event(event)) {
>  		/*
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 50220f7b46d9..7e971b47730c 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -16,13 +16,16 @@
>  #include <linux/irqdomain.h>
>  #include <linux/of_irq.h>
>  #include <linux/of.h>
> +#include <linux/riscv_sbi_sse.h>
>  #include <linux/cpu_pm.h>
> +#include <linux/crash_dump.h>
>  #include <linux/sched/clock.h>
>  #include <linux/soc/andes/irq.h>
>  #include <linux/workqueue.h>
>  =

>  #include <asm/errata_list.h>
>  #include <asm/sbi.h>
> +#include <asm/sse.h>
>  #include <asm/cpufeature.h>
>  #include <asm/vendor_extensions.h>
>  #include <asm/vendor_extensions/andes.h>
> @@ -95,7 +98,6 @@ static bool riscv_pmu_use_irq;
>  static unsigned int riscv_pmu_irq_num;
>  static unsigned int riscv_pmu_irq_mask;
>  static unsigned int riscv_pmu_irq;
> -
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
>  =

> @@ -896,14 +898,24 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned l=
ong *mask)
>  	return 0;
>  }
>  =

> -static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
> +static inline void pmu_sbi_stop_all_mask(unsigned long ctr_mask)
>  {
>  	/*
>  	 * No need to check the error because we are disabling all the counters
>  	 * which may include counters that are not enabled yet.
>  	 */
>  	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +		  0, ctr_mask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +}
> +
> +static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
> +{
> +	pmu_sbi_stop_all_mask(pmu->cmask);
> +}
> +
> +static void pmu_sbi_stop_all_cpu(void *info)
> +{
> +	pmu_sbi_stop_all(info);
>  }
>  =

>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> @@ -953,7 +965,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_=
pmu *pmu)
>  static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_=
hw_evt,
>  					      u64 ctr_ovf_mask)
>  {
> -	int idx =3D 0, i;
> +	int idx, i;
>  	struct perf_event *event;
>  	unsigned long flag =3D SBI_PMU_START_FLAG_SET_INIT_VALUE;
>  	unsigned long ctr_start_mask =3D 0;
> @@ -962,7 +974,19 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct=
 cpu_hw_events *cpu_hw_evt,
>  	u64 init_val =3D 0;
>  =

>  	for (i =3D 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
> -		ctr_start_mask =3D cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
> +		unsigned long ctr_ovf_mask_word;
> +		int lidx;
> +
> +		ctr_ovf_mask_word =3D ctr_ovf_mask >> (i * BITS_PER_LONG);
> +		ctr_start_mask =3D 0;
> +		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG) {
> +			lidx =3D idx + i * BITS_PER_LONG;
> +			event =3D cpu_hw_evt->events[lidx];
> +			if (event && !(event->hw.state & PERF_HES_STOPPED))
> +				ctr_start_mask |=3D BIT(idx);
> +		}
> +		ctr_start_mask &=3D ~ctr_ovf_mask_word;
> +
>  		/* Start all the counters that did not overflow in a single shot */
>  		if (ctr_start_mask) {
>  			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
> @@ -971,23 +995,25 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struc=
t cpu_hw_events *cpu_hw_evt,
>  	}
>  =

>  	/* Reinitialize and start all the counter that overflowed */
> -	while (ctr_ovf_mask) {
> -		if (ctr_ovf_mask & 0x01) {
> -			event =3D cpu_hw_evt->events[idx];
> -			hwc =3D &event->hw;
> -			max_period =3D riscv_pmu_ctr_get_width_mask(event);
> -			init_val =3D local64_read(&hwc->prev_count) & max_period;
> +	for (idx =3D 0; idx < RISCV_MAX_COUNTERS; idx++) {
> +		if (!(ctr_ovf_mask & BIT_ULL(idx)))
> +			continue;
> +
> +		event =3D cpu_hw_evt->events[idx];
> +		if (!event || event->hw.state & PERF_HES_STOPPED)
> +			continue;
> +
> +		hwc =3D &event->hw;
> +		max_period =3D riscv_pmu_ctr_get_width_mask(event);
> +		init_val =3D local64_read(&hwc->prev_count) & max_period;
>  #if defined(CONFIG_32BIT)
> -			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> -				  flag, init_val, init_val >> 32, 0);
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> +			  flag, init_val, init_val >> 32, 0);
>  #else
> -			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> -				  flag, init_val, 0, 0);
> +		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> +			  flag, init_val, 0, 0);
>  #endif
> -			perf_event_update_userpage(event);
> -		}
> -		ctr_ovf_mask =3D ctr_ovf_mask >> 1;
> -		idx++;
> +		perf_event_update_userpage(event);
>  	}
>  }
>  =

> @@ -1002,7 +1028,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(=
struct cpu_hw_events *cpu_hw_
>  	struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_addr;
>  =

>  	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
> -		if (ctr_ovf_mask & BIT(idx)) {
> +		if (ctr_ovf_mask & BIT_ULL(idx)) {
>  			event =3D cpu_hw_evt->events[idx];
>  			hwc =3D &event->hw;
>  			max_period =3D riscv_pmu_ctr_get_width_mask(event);
> @@ -1016,31 +1042,111 @@ static inline void pmu_sbi_start_ovf_ctrs_snapsh=
ot(struct cpu_hw_events *cpu_hw_
>  	}
>  =

>  	for (i =3D 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
> +		unsigned long ctr_start_mask =3D 0;
> +		int lidx;
> +
>  		/* Restore the counter values to relative indices for used hw counters=
 */
> -		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
> -			sdata->ctr_values[idx] =3D
> -					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
> +		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG) {
> +			lidx =3D idx + i * BITS_PER_LONG;
> +			event =3D cpu_hw_evt->events[lidx];
> +			if (event && !(event->hw.state & PERF_HES_STOPPED))
> +				ctr_start_mask |=3D BIT(idx);
> +
> +			sdata->ctr_values[idx] =3D cpu_hw_evt->snapshot_cval_shcopy[lidx];
> +		}
> +
>  		/* Start all the counters in a single shot */
> -		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
> -			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
> +		if (ctr_start_mask)
> +			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START,
> +				  i * BITS_PER_LONG, ctr_start_mask, flag, 0, 0, 0);
>  	}
>  }
>  =

> +static bool pmu_sbi_sse_failed(struct cpu_hw_events *cpu_hw_evt)
> +{
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	return READ_ONCE(cpu_hw_evt->sse_failed);
> +#else
> +	return false;
> +#endif
> +}
> +
>  static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
>  					u64 ctr_ovf_mask)
>  {
>  	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
>  =

> +	if (unlikely(pmu_sbi_sse_failed(cpu_hw_evt)))
> +		return;
> +
>  	if (sbi_pmu_snapshot_available())
>  		pmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
>  	else
>  		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
>  }
>  =

> -static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +/*
> + * A local SSE delivery failure makes the current PMU state unsafe to re=
sume.
> + * Latch the failure before stopping mapped events so the SSE transition=
 and
> + * overflow restart paths cannot undo the fail-safe while they are quies=
ced.
> + */
> +static void pmu_sbi_fail_sse(struct riscv_pmu *pmu, const char *op, int =
ret)
> +{
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +	struct perf_event *event;
> +	int idx;
> +
> +	if (READ_ONCE(cpu_hw_evt->sse_failed))
> +		return;
> +
> +	WRITE_ONCE(cpu_hw_evt->sse_failed, true);
> +	pr_err_ratelimited("failed to %s local PMU SSE event: %d; stopping coun=
ters\n",
> +			   op, ret);
> +
> +	for (idx =3D 0; idx < RISCV_MAX_COUNTERS; idx++) {
> +		event =3D cpu_hw_evt->events[idx];
> +		if (event)
> +			riscv_pmu_stop(event, PERF_EF_UPDATE);
> +	}
> +}
> +
> +static void pmu_sbi_sse_disable(struct pmu *pmu)
> +{
> +	struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(rvpmu->hw_events);
> +	int ret;
> +
> +	if (!READ_ONCE(rvpmu->sse_active) ||
> +	    READ_ONCE(cpu_hw_evt->sse_failed))
> +		return;
> +
> +	ret =3D sse_event_disable_local(rvpmu->sse_evt);
> +	if (unlikely(ret))
> +		pmu_sbi_fail_sse(rvpmu, "disable", ret);
> +}
> +
> +static void pmu_sbi_sse_enable(struct pmu *pmu)
> +{
> +	struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu);
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(rvpmu->hw_events);
> +	int ret;
> +
> +	if (!READ_ONCE(rvpmu->sse_active) ||
> +	    READ_ONCE(cpu_hw_evt->sse_failed))
> +		return;
> +
> +	ret =3D sse_event_enable_local(rvpmu->sse_evt);
> +	if (unlikely(ret))
> +		pmu_sbi_fail_sse(rvpmu, "enable", ret);
> +}
> +#endif
> +
> +static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_evt,
> +				       struct pt_regs *regs, bool from_sse,
> +				       bool from_guest)
>  {
>  	struct perf_sample_data data;
> -	struct pt_regs *regs;
>  	struct hw_perf_event *hw_evt;
>  	union sbi_pmu_ctr_info *info;
>  	int lidx, hidx, fidx;
> @@ -1048,28 +1154,38 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
>  	struct perf_event *event;
>  	u64 overflow;
>  	u64 overflowed_ctrs =3D 0;
> -	struct cpu_hw_events *cpu_hw_evt =3D dev;
>  	u64 start_clock =3D sched_clock();
>  	struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_addr;
>  =

>  	if (WARN_ON_ONCE(!cpu_hw_evt))
>  		return IRQ_NONE;
>  =

> -	/* Firmware counter don't support overflow yet */
> +	/*
> +	 * SSE can arrive before perf installs an event. The early exits below
> +	 * must stop the PMU source before firmware completes the SSE.
> +	 */
>  	fidx =3D find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
>  	if (fidx =3D=3D RISCV_MAX_COUNTERS) {
> -		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
> +		if (from_sse)
> +			pmu_sbi_stop_all_mask(cmask);
> +		else
> +			csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
>  		return IRQ_NONE;
>  	}
>  =

>  	event =3D cpu_hw_evt->events[fidx];
>  	if (!event) {
> -		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> +		if (from_sse)
> +			pmu_sbi_stop_all_mask(cmask);
> +		else
> +			ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
>  		return IRQ_NONE;
>  	}
>  =

>  	pmu =3D to_riscv_pmu(event->pmu);
>  	pmu_sbi_stop_hw_ctrs(pmu);
> +	if (unlikely(pmu_sbi_sse_failed(cpu_hw_evt)))
> +		return IRQ_NONE;
>  =

>  	/* Overflow status register should only be read after counter are stopp=
ed */
>  	if (sbi_pmu_snapshot_available())
> @@ -1079,15 +1195,17 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
>  =

>  	/*
>  	 * Overflow interrupt pending bit should only be cleared after stopping
> -	 * all the counters to avoid any race condition.
> +	 * all the counters to avoid any race condition. When using SSE,
> +	 * interrupt is cleared when stopping counters.
>  	 */
> -	ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> +	if (!from_sse)
> +		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
>  =

>  	/* No overflow bit is set */
> -	if (!overflow)
> +	if (!overflow) {
> +		pmu_sbi_start_overflow_mask(pmu, 0);
>  		return IRQ_NONE;
> -
> -	regs =3D get_irq_regs();
> +	}
>  =

>  	for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
>  		struct perf_event *event =3D cpu_hw_evt->events[lidx];
> @@ -1109,14 +1227,20 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
>  			hidx =3D info->csr - CSR_CYCLE;
>  =

>  		/* check if the corresponding bit is set in scountovf or overflow mask=
 in shmem */
> -		if (!(overflow & BIT(hidx)))
> +		if (!(overflow & BIT_ULL(hidx)))
>  			continue;
>  =

> +#ifdef CONFIG_CPU_PM
> +		/* Do not let CPU-PM resume override this overflow decision. */
> +		if (from_sse)
> +			clear_bit(lidx, cpu_hw_evt->pm_resume_hw_ctrs);
> +#endif
> +
>  		/*
>  		 * Keep a track of overflowed counters so that they can be started
>  		 * with updated initial value.
>  		 */
> -		overflowed_ctrs |=3D BIT(lidx);
> +		overflowed_ctrs |=3D BIT_ULL(lidx);
>  		hw_evt =3D &event->hw;
>  		/* Update the event states here so that we know the state while readin=
g */
>  		hw_evt->state |=3D PERF_HES_STOPPED;
> @@ -1124,6 +1248,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, vo=
id *dev)
>  		hw_evt->state |=3D PERF_HES_UPTODATE;
>  		perf_sample_data_init(&data, 0, hw_evt->last_period);
>  		if (riscv_pmu_event_set_period(event)) {
> +			int overflow_ret;
> +
> +			/* Guest attribution and guest stack sampling are not supported yet. =
*/
> +			if (from_guest) {
> +				hw_evt->state =3D 0;
> +				continue;
> +			}
> +
>  			/*
>  			 * Unlike other ISAs, RISC-V don't have to disable interrupts
>  			 * to avoid throttling here. As per the specification, the
> @@ -1132,128 +1264,291 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq,=
 void *dev)
>  			 * TODO: We will need to stop the guest counters once
>  			 * virtualization support is added.
>  			 */
> -			perf_event_overflow(event, &data, regs);
> +			overflow_ret =3D perf_event_overflow(event, &data, regs);
> +			if (!overflow_ret)
> +				hw_evt->state =3D 0;
> +		} else {
> +			hw_evt->state =3D 0;
>  		}
> -		/* Reset the state as we are going to start the counter after the loop=
 */
> -		hw_evt->state =3D 0;
>  	}
>  =

>  	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
> +
>  	perf_sample_event_took(sched_clock() - start_clock);
>  =

>  	return IRQ_HANDLED;
>  }
>  =

> -static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *nod=
e)
> +static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
>  {
> -	struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu, node=
);
> -	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> -
> -	/*
> -	 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
> -	 * legacy option but that will be removed in the future.
> -	 */
> -	if (sysctl_perf_user_access =3D=3D SYSCTL_LEGACY)
> -		csr_write(CSR_SCOUNTEREN, 0x7);
> -	else
> -		csr_write(CSR_SCOUNTEREN, 0x2);
> +	return pmu_sbi_ovf_handler(dev, get_irq_regs(), false, false);
> +}
>  =

> -	/* Stop all the counters so that they can be enabled from perf */
> -	pmu_sbi_stop_all(pmu);
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs *r=
egs)
> +{
> +	const struct riscv_sse_interrupted_context *context;
> +	struct riscv_pmu *pmu =3D arg;
> +	struct cpu_hw_events *hw_event =3D raw_cpu_ptr(pmu->hw_events);
> +	bool from_guest;
> +
> +	if (unlikely(!READ_ONCE(pmu->sse_active))) {
> +		pmu_sbi_stop_all(pmu);
> +		return -EIO;
> +	}
>  =

> -	if (riscv_pmu_use_irq) {
> -		cpu_hw_evt->irq =3D riscv_pmu_irq;
> -		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> -		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
> +	if (unlikely(!regs)) {
> +		pmu_sbi_fail_sse(pmu, "read interrupted context for", -EIO);
> +		return -EIO;
>  	}
>  =

> -	if (sbi_pmu_snapshot_available())
> -		return pmu_sbi_snapshot_setup(pmu, cpu);
> +	context =3D riscv_sse_get_interrupted_context();
> +	from_guest =3D context && context->regs =3D=3D regs &&
> +		     (context->hstatus & HSTATUS_SPV);
> +	pmu_sbi_ovf_handler(hw_event, regs, true, from_guest);
>  =

>  	return 0;
>  }
>  =

> -static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
> +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
>  {
> -	if (riscv_pmu_use_irq) {
> -		disable_percpu_irq(riscv_pmu_irq);
> -	}
> +	int ret;
> +	struct sse_event *evt;
>  =

> -	/* Disable all counters access for user mode now */
> -	csr_write(CSR_SCOUNTEREN, 0x0);
> +	evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
> +				 pmu_sbi_ovf_sse_handler, pmu);
> +	if (IS_ERR(evt))
> +		return PTR_ERR(evt);
> +	pmu->sse_evt =3D evt;
>  =

> -	if (sbi_pmu_snapshot_available())
> -		return pmu_sbi_snapshot_disable();
> +	ret =3D sse_event_enable(evt);
> +	if (ret) {
> +		int cleanup_ret;
>  =

> -	return 0;
> +		cleanup_ret =3D sse_event_disable(evt);
> +		if (cleanup_ret) {
> +			pr_warn("failed to disable SSE event after setup error: %d\n",
> +				cleanup_ret);
> +			return cleanup_ret;
> +		}
> +
> +		cleanup_ret =3D sse_event_unregister(evt);
> +
> +		if (cleanup_ret) {
> +			pr_warn("failed to unregister SSE event: %d\n",
> +				cleanup_ret);
> +		} else {
> +			pmu->sse_evt =3D NULL;
> +		}
> +		return cleanup_ret ?: ret;
> +	}
> +
> +	WRITE_ONCE(pmu->sse_active, true);
> +	pr_info("using SSE for PMU event delivery\n");
> +
> +	return ret;
>  }
>  =

> -static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_dev=
ice *pdev)
> +static void pmu_sbi_cleanup_sse(struct riscv_pmu *pmu)
>  {
> +	struct sse_event *sse_evt;
>  	int ret;
> -	struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> -	struct irq_domain *domain =3D NULL;
>  =

> +	sse_evt =3D pmu->sse_evt;
> +	if (!sse_evt)
> +		return;
> +	/*
> +	 * Close callback admission before draining each CPU. PMU callbacks run
> +	 * with local interrupts disabled, so the synchronous IPI cannot comple=
te
> +	 * until a callback that observed the old state has returned.
> +	 */
> +	WRITE_ONCE(pmu->sse_active, false);
> +	on_each_cpu(pmu_sbi_stop_all_cpu, pmu, 1);
> +
> +	ret =3D sse_event_disable(sse_evt);
> +	if (ret) {
> +		pr_warn("failed to disable SSE event: %d\n", ret);
> +		goto retain;
> +	}
> +
> +	ret =3D sse_event_unregister(sse_evt);
> +	if (ret) {
> +		pr_warn("failed to unregister SSE event: %d\n", ret);
> +		goto retain;
> +	}
> +
> +	pmu->sse_evt =3D NULL;
> +	return;
> +
> +retain:
> +	sse_event_cleanup(sse_evt);
> +	pmu->sse_evt =3D NULL;
> +}
> +
> +static bool pmu_sbi_sse_state_retained(struct riscv_pmu *pmu)
> +{
> +	return pmu->sse_evt;
> +}
> +#else
> +static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static void pmu_sbi_cleanup_sse(struct riscv_pmu *pmu) {}
> +
> +static bool pmu_sbi_sse_state_retained(struct riscv_pmu *pmu)
> +{
> +	return false;
> +}
> +#endif
> +
> +static bool pmu_sbi_select_irq(void)
> +{
>  	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
>  		riscv_pmu_irq_num =3D RV_IRQ_PMU;
> -		riscv_pmu_use_irq =3D true;
> +		return true;
>  	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
>  		   riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID &&
>  		   riscv_cached_marchid(0) =3D=3D 0 &&
>  		   riscv_cached_mimpid(0) =3D=3D 0) {
>  		riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
> -		riscv_pmu_use_irq =3D true;
> +		return true;
>  	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
>  						       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
>  		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
>  		riscv_pmu_irq_num =3D ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
> -		riscv_pmu_use_irq =3D true;
> +		return true;
>  	}
>  =

> -	riscv_pmu_irq_mask =3D BIT(riscv_pmu_irq_num % BITS_PER_LONG);
> +	return false;
> +}
>  =

> -	if (!riscv_pmu_use_irq)
> +static int pmu_sbi_setup_irq(struct riscv_pmu *pmu)
> +{
> +	struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> +	struct irq_domain *domain;
> +	int ret;
> +
> +	if (!pmu_sbi_select_irq())
>  		return -EOPNOTSUPP;
>  =

> +	riscv_pmu_irq_mask =3D BIT(riscv_pmu_irq_num % BITS_PER_LONG);
> +
>  	domain =3D irq_find_matching_fwnode(riscv_get_intc_hwnode(),
>  					  DOMAIN_BUS_ANY);
>  	if (!domain) {
>  		pr_err("Failed to find INTC IRQ root domain\n");
> -		ret =3D -ENODEV;
> -		goto err;
> +		return -ENODEV;
>  	}
>  =

>  	riscv_pmu_irq =3D irq_create_mapping(domain, riscv_pmu_irq_num);
>  	if (!riscv_pmu_irq) {
>  		pr_err("Failed to map PMU interrupt for node\n");
> -		ret =3D -ENODEV;
> -		goto err;
> +		return -ENODEV;
>  	}
>  =

> -	ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-p=
mu", hw_events);
> +	ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler,
> +				 "riscv-pmu", hw_events);
>  	if (ret) {
>  		pr_err("registering percpu irq failed [%d]\n", ret);
>  		irq_dispose_mapping(riscv_pmu_irq);
>  		riscv_pmu_irq =3D 0;
> -		goto err;
> +		return ret;
>  	}
>  =

>  	return 0;
> -err:
> -	riscv_pmu_use_irq =3D false;
> -	return ret;
> +}
> +
> +static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *nod=
e)
> +{
> +	struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu, node=
);
> +	struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events);
> +
> +	/*
> +	 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
> +	 * legacy option but that will be removed in the future.
> +	 */
> +	if (sysctl_perf_user_access =3D=3D SYSCTL_LEGACY)
> +		csr_write(CSR_SCOUNTEREN, 0x7);
> +	else
> +		csr_write(CSR_SCOUNTEREN, 0x2);
> +
> +	/* Stop all the counters so that they can be enabled from perf */
> +	pmu_sbi_stop_all(pmu);
> +
> +	if (riscv_pmu_use_irq) {
> +		cpu_hw_evt->irq =3D riscv_pmu_irq;
> +		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
> +		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
> +	}
> +
> +	if (sbi_pmu_snapshot_available())
> +		return pmu_sbi_snapshot_setup(pmu, cpu);
> +
> +	return 0;
> +}
> +
> +static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
> +{
> +	if (riscv_pmu_use_irq)
> +		disable_percpu_irq(riscv_pmu_irq);
> +
> +	/* Disable all counters access for user mode now */
> +	csr_write(CSR_SCOUNTEREN, 0x0);
> +
> +	if (sbi_pmu_snapshot_available())
> +		return pmu_sbi_snapshot_disable();
> +
> +	return 0;
> +}
> +
> +static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_dev=
ice *pdev)
> +{
> +	int irq_ret;
> +	int sse_ret;
> +
> +	/* Do not claim an IRQ route while a crash kernel leaves SSE state inta=
ct. */
> +	if (is_kdump_kernel() && riscv_sse_available()) {
> +		pr_warn("PMU delivery unavailable with retained crash-kernel SSE state=
\n");
> +		return -EUCLEAN;
> +	}
> +
> +	sse_ret =3D pmu_sbi_setup_sse(pmu);
> +	if (!sse_ret) {
> +		riscv_pmu_use_irq =3D false;
> +		return 0;
> +	}
> +	if (pmu_sbi_sse_state_retained(pmu)) {
> +		pr_err("PMU-SSE setup failed with firmware state retained: %d\n",
> +		       sse_ret);
> +		return -EUCLEAN;
> +	}
> +	/* Only an explicitly unsupported SSE path proves IRQ fallback is safe.=
 */
> +	if (sse_ret !=3D -EOPNOTSUPP) {
> +		pr_err("PMU-SSE setup failed: %d\n", sse_ret);
> +		return sse_ret;
> +	}
> +
> +	irq_ret =3D pmu_sbi_setup_irq(pmu);
> +	if (!irq_ret) {
> +		riscv_pmu_use_irq =3D true;
> +		return 0;
> +	}
> +	return irq_ret;
>  }
>  =

>  #ifdef CONFIG_CPU_PM
> -static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long c=
md,
> -				void *v)
> +static int riscv_pm_pmu_update(struct riscv_pmu *rvpmu, unsigned long cm=
d)
>  {
> -	struct riscv_pmu *rvpmu =3D container_of(b, struct riscv_pmu, riscv_pm_=
nb);
>  	struct cpu_hw_events *cpuc =3D this_cpu_ptr(rvpmu->hw_events);
>  	bool enabled =3D !bitmap_empty(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
>  	struct perf_event *event;
>  	int idx;
>  =

> +	if (cmd =3D=3D CPU_PM_ENTER)
> +		bitmap_zero(cpuc->pm_resume_hw_ctrs, RISCV_MAX_COUNTERS);
> +
>  	if (!enabled)
>  		return NOTIFY_OK;
>  =

> @@ -1264,6 +1559,8 @@ static int riscv_pm_pmu_notify(struct notifier_bloc=
k *b, unsigned long cmd,
>  =

>  		switch (cmd) {
>  		case CPU_PM_ENTER:
> +			if (!(event->hw.state & PERF_HES_STOPPED))
> +				set_bit(idx, cpuc->pm_resume_hw_ctrs);
>  			/*
>  			 * Stop and update the counter
>  			 */
> @@ -1271,6 +1568,8 @@ static int riscv_pm_pmu_notify(struct notifier_bloc=
k *b, unsigned long cmd,
>  			break;
>  		case CPU_PM_EXIT:
>  		case CPU_PM_ENTER_FAILED:
> +			if (!test_and_clear_bit(idx, cpuc->pm_resume_hw_ctrs))
> +				break;
>  			/*
>  			 * Restore and enable the counter.
>  			 */
> @@ -1284,9 +1583,59 @@ static int riscv_pm_pmu_notify(struct notifier_blo=
ck *b, unsigned long cmd,
>  	return NOTIFY_OK;
>  }
>  =

> +static int riscv_pm_pmu_notify(struct notifier_block *b,
> +			       unsigned long cmd, void *v)
> +{
> +	struct riscv_pmu *rvpmu =3D container_of(b, struct riscv_pmu,
> +						 riscv_pm_nb);
> +
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	struct cpu_hw_events *cpuc =3D this_cpu_ptr(rvpmu->hw_events);
> +	int ret;
> +
> +	if (!riscv_pmu_use_irq && READ_ONCE(rvpmu->sse_active)) {
> +		switch (cmd) {
> +		case CPU_PM_ENTER:
> +			cpuc->pm_resume_sse =3D
> +				sse_event_is_enabled_local(rvpmu->sse_evt);
> +			if (cpuc->pm_resume_sse) {
> +				ret =3D sse_event_disable_local(rvpmu->sse_evt);
> +				if (ret) {
> +					cpuc->pm_resume_sse =3D false;
> +					pmu_sbi_fail_sse(rvpmu, "disable for CPU PM",
> +							 ret);
> +					return notifier_from_errno(ret);
> +				}
> +			}
> +			break;
> +		case CPU_PM_EXIT:
> +		case CPU_PM_ENTER_FAILED:
> +			ret =3D riscv_pm_pmu_update(rvpmu, cmd);
> +			if (!cpuc->pm_resume_sse)
> +				return ret;
> +
> +			cpuc->pm_resume_sse =3D false;
> +			ret =3D sse_event_enable_local(rvpmu->sse_evt);
> +			if (ret) {
> +				pmu_sbi_fail_sse(rvpmu, "enable after CPU PM", ret);
> +				return notifier_from_errno(ret);
> +			}
> +			return NOTIFY_OK;
> +		default:
> +			break;
> +		}
> +	}
> +#endif
> +
> +	return riscv_pm_pmu_update(rvpmu, cmd);
> +}
> +
>  static int riscv_pm_pmu_register(struct riscv_pmu *pmu)
>  {
>  	pmu->riscv_pm_nb.notifier_call =3D riscv_pm_pmu_notify;
> +	/* Keep PMU-SSE disabled until counters and userpage state are restored=
. */
> +	pmu->riscv_pm_nb.priority =3D riscv_pmu_use_irq ? 1 : -1;
> +
>  	return cpu_pm_register_notifier(&pmu->riscv_pm_nb);
>  }
>  =

> @@ -1301,6 +1650,8 @@ static inline void riscv_pm_pmu_unregister(struct r=
iscv_pmu *pmu) { }
>  =

>  static void riscv_pmu_destroy(struct riscv_pmu *pmu)
>  {
> +	pmu_sbi_cleanup_sse(pmu);
> +
>  	if (sbi_v2_available) {
>  		if (sbi_pmu_snapshot_available()) {
>  			pmu_sbi_snapshot_disable();
> @@ -1312,7 +1663,7 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
>  		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
>  }
>  =

> -static void pmu_sbi_event_init(struct perf_event *event)
> +static int pmu_sbi_event_init(struct perf_event *event)
>  {
>  	/*
>  	 * The permissions are set at event_init so that we do not depend
> @@ -1324,6 +1675,8 @@ static void pmu_sbi_event_init(struct perf_event *e=
vent)
>  		event->hw.flags |=3D PERF_EVENT_FLAG_USER_ACCESS;
>  	else
>  		event->hw.flags |=3D PERF_EVENT_FLAG_LEGACY;
> +
> +	return 0;
>  }
>  =

>  static void pmu_sbi_event_mapped(struct perf_event *event, struct mm_str=
uct *mm)
> @@ -1453,6 +1806,7 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>  	/* cache all the information about counters now */
>  	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
>  		goto out_free;
> +	pmu->cmask =3D cmask;
>  =

>  	ret =3D pmu_sbi_setup_irqs(pmu, pdev);
>  	if (ret < 0) {
> @@ -1462,9 +1816,15 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>  	}
>  	irq_requested =3D (ret =3D=3D 0);
>  =

> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	if (pmu->sse_active) {
> +		pmu->pmu.pmu_enable =3D pmu_sbi_sse_enable;
> +		pmu->pmu.pmu_disable =3D pmu_sbi_sse_disable;
> +	}
> +#endif
> +
>  	pmu->pmu.attr_groups =3D riscv_pmu_attr_groups;
>  	pmu->pmu.parent =3D &pdev->dev;
> -	pmu->cmask =3D cmask;
>  	pmu->ctr_start =3D pmu_sbi_ctr_start;
>  	pmu->ctr_stop =3D pmu_sbi_ctr_stop;
>  	pmu->event_map =3D pmu_sbi_event_map;
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index f82a28040594..fb913ce7f65e 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -28,6 +28,8 @@
>  =

>  #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
>  =

> +struct sse_event;
> +
>  struct cpu_hw_events {
>  	/* currently enabled events */
>  	int			n_events;
> @@ -39,6 +41,18 @@ struct cpu_hw_events {
>  	DECLARE_BITMAP(used_hw_ctrs, RISCV_MAX_COUNTERS);
>  	/* currently enabled firmware counters */
>  	DECLARE_BITMAP(used_fw_ctrs, RISCV_MAX_COUNTERS);
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	/* Keep counters stopped after an unrecoverable SSE transition failure.=
 */
> +	bool sse_failed;
> +#endif
> +#ifdef CONFIG_CPU_PM
> +	/* Counters stopped by CPU PM and still waiting to be restored. */
> +	DECLARE_BITMAP(pm_resume_hw_ctrs, RISCV_MAX_COUNTERS);
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	/* Restore the local PMU SSE event after counters and userpage state. */
> +	bool pm_resume_sse;
> +#endif
> +#endif
>  	/* The virtual address of the shared memory where counter snapshot will=
 be taken */
>  	void *snapshot_addr;
>  	/* The physical address of the shared memory where counter snapshot wil=
l be taken */
> @@ -54,6 +68,10 @@ struct riscv_pmu {
>  	char		*name;
>  =

>  	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
> +#ifdef CONFIG_RISCV_PMU_SBI_SSE
> +	struct sse_event	*sse_evt;
> +	bool			sse_active;
> +#endif
>  =

>  	unsigned long	cmask;
>  	u64		(*ctr_read)(struct perf_event *event);
> @@ -63,7 +81,7 @@ struct riscv_pmu {
>  	void		(*ctr_start)(struct perf_event *event, u64 init_val);
>  	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
>  	int		(*event_map)(struct perf_event *event, u64 *config);
> -	void		(*event_init)(struct perf_event *event);
> +	int		(*event_init)(struct perf_event *event);
>  	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
>  	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
>  	uint8_t		(*csr_index)(struct perf_event *event);
> diff --git a/include/linux/riscv_sbi_sse.h b/include/linux/riscv_sbi_sse.h
> index 774a782e556d..f6b3881c8884 100644
> --- a/include/linux/riscv_sbi_sse.h
> +++ b/include/linux/riscv_sbi_sse.h
> @@ -42,6 +42,7 @@ int sse_event_enable(struct sse_event *sse_evt);
>  int sse_event_disable(struct sse_event *sse_evt);
>  =

>  /* Local events require the caller to remain on the current CPU. */
> +bool sse_event_is_enabled_local(struct sse_event *sse_evt);
>  int sse_event_enable_local(struct sse_event *sse_evt);
>  int sse_event_disable_local(struct sse_event *sse_evt);
>  =

> @@ -76,6 +77,11 @@ static inline int sse_event_disable(struct sse_event *=
sse_evt)
>  	return -EOPNOTSUPP;
>  }
>  =

> +static inline bool sse_event_is_enabled_local(struct sse_event *sse_evt)
> +{
> +	return false;
> +}
> +
>  static inline int sse_event_enable_local(struct sse_event *sse_evt)
>  {
>  	return -EOPNOTSUPP;
> -- =

> 2.50.1 (Apple Git-155)
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
