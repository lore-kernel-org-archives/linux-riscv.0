Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5595DFD45EC
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 21:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XKwKQwc8vin3C+nXNGPs8grcaHIIWu1+cgnsHzoLIE=; b=3rbIWFGYwnpGLO
	HQV9bfC4YMB/EDt6LKJ4PyoZNkqbnXmvHDWN40b3phLdYnl6gyBRIdmswBQEp8v0BZMMe8MPogtfL
	KGCyp4Rm3qzfv+t2c7HNDubbVO/TCW7646sFjr8cNxHPD+kdaOgoUjJo0lrTMc56o7EENG4Fdl19Z
	7s0RcQ//MtcLd8io8uuyhf4D11ftH3zUU/YOscRiBvTdRkJYNcMFwB5kAnrj6jiKW8Cp0vVSoAR27
	POFYbZOOlheOrt20G0TS/OE+PH08BO6GjhjdLCp6p5tjgM95Y8OPpy8Onk30lRTaLTKx3MK2hY/eu
	E14okxvgSLoVm42MXWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvM7y-00000004tYt-068a;
	Wed, 25 Feb 2026 21:09:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvM7v-00000004tY7-3a1i
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 21:09:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHOOlf1363608
	for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 21:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBmnl9PJw1wesdKZ2FfBJpI0
	enm3lW3EvYf0jk7sk7w=; b=aPLRKa94YDUOW/qMnOjRcpCcH8aILpYCYua+iSRW
	oAz+0avS3bsLqu+Or7sIXixWe1zdVa3PvO0vshaSlXLCKro7vtqWlirNpNkmWZrH
	GmgxwyIkc2ADY0hO5A8AGSPA5S+v6s9XuGkeDAFa4yPVzkqE7TCxZnnLVxgUHFT1
	3BfDm1X2MPQzsPdvIFj+fbuJU61j/J2lduCDZ0m2nVzvW1QEe8F9mVnPc7ASwZRc
	kDtUrRXDnkKY27sa4HaxdUdVKg6GFM4EUX+Kp959gwvrkRk1qkp+FC9cxJZYoC9J
	vFkU6d2moA9Ruqp5l1HKEe2pG2U5DIQIIyBpk+zbAxLHxA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15bk26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 21:08:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdc5078895so2069876eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772053738; x=1772658538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBmnl9PJw1wesdKZ2FfBJpI0enm3lW3EvYf0jk7sk7w=;
        b=RRPJP9KK+8QdcblYz6SKt4W8UuWvQV9J1t1BxO/4jnnNw3PwfQfhnxR1SC6qD5XTZr
         weweWs2LNKw98SrZvcAV8k+GihV1mgCKz+SWamE0NK++ucpIQTFY1PRuzBoHjCNYTVhQ
         MZQgH9Pnihc9MmvH4WxsqHofIHSNu+XL+2oMrTA2fyX4UyfoTPRcR7Lo1LY7PJKBD3PD
         R/qv0QF9t+T/1wlPsdRdlkXYIutkWiWZpGDqUojBgRC9X39vqY8Ye0bv6aKSXRGxTMFD
         zIDDE+McIg/CfEr0pmZJlkgSFhlsoEPqP3Z9jVMYFGiTGotY6a4SoLkoDNP4gFkyRHf2
         EyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772053738; x=1772658538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBmnl9PJw1wesdKZ2FfBJpI0enm3lW3EvYf0jk7sk7w=;
        b=Mn7KcttBgsXft4xDHhmj52s9Ba9Ys1bV2RgGB8TmIEz/NyB3qfUJEucCP+PNAC9aH8
         ZWPaNtsDyxJpCVCCvgGK1KtK9m88D7Kv20XUHwmDJ/2sWnz1QVnBlB6OMfQLPOl4WZyw
         TFFf7G5+DDbsOAcbDMwSSEomzXnaHDaSpAo5kuZoUliekhtk07CdT5jiC4+1L1qCAjcG
         wyOaN+wHTci6o+glXYJE9VqHZc2BXAGhcO/a8+yKjYn9Yzb+/PdJxkpdavuYUHSAj1Pr
         ukWfaIkBWyw1D3nhbWP6giLRAcJTpREen+ypBOY2xLevtgO8PMX5hdGNfEGiLJ4yfWNR
         Tblg==
X-Forwarded-Encrypted: i=1; AJvYcCU73qT1Lxv0hiT8XzC2bXV/HgJG3H4W1lYCtom5HvWbw3NhpksAEE8+pnnPHnUBKcYGMjjJsYkTupAdew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Iv7BBQEiAnNFq1jLlC3a2Qt3RZk0+m0gD5ct4C7WZRHYbgCe
	TQ4d85MtWwBLKKZ0GkhEOfVI7Dt886uy0HIfz5fBaJd13TTB3iuGqjQP4KvPlrXqHG4ypV+/Zqd
	dcwRq/3FzX8a0ngq+zmZ3ud4uWtqr7UjtQJzDpnMFrVzcWD+e8w6CXoOzrSLnK8ViEN+NP/E=
X-Gm-Gg: ATEYQzxJgL1Uk6XSuiwH3KoHcjxCLyRj2z2BisIe/h7kpLBBV3MRxwsdsSHXbiEbfNd
	BLkYkKsfJZT9mxn+AnTB3tzzRmO/5hI8xu2B3ug0ulm4G+uCaQyJ0/K3+LQDAyCbEneO/ZN2xNQ
	T9p31X90qxXz9gtFiYZT4rlIsnNoJOAGGJljZJ+46ufmBvGZ2z7Q84Ynoiyx19QZeDsPaoCeUCW
	kCQwiaaHAzPhl4z53yGrlC6jQZJaJ8t6bgE/vGGKlbiGAXcpxar/uZKVTvD8B5ug3fda7tlPLb2
	HthalI9Mk1SIHcIPoys2E7gYjGZMmRNxEPhIjEWgYp57K0oJfVP96ffhNE825vlmEyqyqgb1v8l
	abgmBvotsbxYT+7UU6QR9QsVcEbC7CGML
X-Received: by 2002:a05:7301:678a:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bdcbf7ebf5mr946970eec.14.1772053737578;
        Wed, 25 Feb 2026 13:08:57 -0800 (PST)
X-Received: by 2002:a05:7301:678a:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bdcbf7ebf5mr946947eec.14.1772053736987;
        Wed, 25 Feb 2026 13:08:56 -0800 (PST)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1df6b0asm188889eec.12.2026.02.25.13.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 13:08:56 -0800 (PST)
Date: Wed, 25 Feb 2026 15:08:54 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
        Leo Yan <leo.yan@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Dmitrii Dolgov <9erthalion6@gmail.com>,
        Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>,
        Yuzhuo Jing <yuzhuo@google.com>,
        Dapeng Mi <dapeng1.mi@linux.intel.com>,
        Shimin Guo <shimin.guo@skydio.com>,
        Athira Rajeev <atrajeev@linux.ibm.com>,
        Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        Thomas Richter <tmricht@linux.ibm.com>, libunwind-devel@nongnu.org
Subject: Re: [RFC PATCH v1 7/7] perf unwind-libunwind: Add RISC-V libunwind
 support
Message-ID: <q3oys2ukvylrd7xfn7267bh3wpumyxbbxpk2udhps375cmk64p@l7sjnlxll6c7>
References: <20260224142938.26088-1-irogers@google.com>
 <20260224142938.26088-8-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260224142938.26088-8-irogers@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIwMSBTYWx0ZWRfX2fVqzPPIFkly
 ij63DV9nU4iTgdYeJ2bKsWdkVDpyuAEwuX5uYCBII8M+VZXbpBltx44Dnt5itREVqvjIei8GbHE
 fshecxTfrNw7JpImUwGF7rhrGIV+ynWNB0a2ahkuVIqwL9+7sYphnGuXOSCT6nhp0OjnwkaBt+G
 bFG+OZYawTpJKxzh83D7cH3PYHdDHJNzE1HKQYbVoJVPF2BJrloDbbDotS9kh5HkDOH8nHptJrt
 CWQ8Dqogf2zuxMdrS3yBCpvS641QXFTp4ZNNKvDJJdWdrr2dKkHRR0sf2tLBva/ZohE1iSvMEXX
 +9uqtkUY5vONZx2ZhwgGbqBnCyUM2+Cy4fzbnLH/QHod+OvNGrCD/q0bL7TvDgHyPpnKHtXtjkL
 nyvwl8tJsFt6kSEIMyL+mpiYwVn9MDH0UenhiWt2TqrafSsJTJesguF92+Jy5a7/RgbNg6yg9RZ
 neUARnJts0Y8YGu2V3g==
X-Proofpoint-GUID: CdLFf69lAGW5L36cVz6_-Zng6WBpnEzh
X-Proofpoint-ORIG-GUID: CdLFf69lAGW5L36cVz6_-Zng6WBpnEzh
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f64ea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=OC80/TC5XWgnnCQ5Z9xtWg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8mPsIthyXUsASUFpomQA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_130900_033198_A699676C 
X-CRM114-Status: GOOD (  12.40  )
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

On Tue, Feb 24, 2026 at 06:29:37AM -0800, Ian Rogers wrote:
...
> +struct unwind_info *__libunwind_arch_unwind_info__new_riscv(struct thread *thread __maybe_unused,
> +							     struct perf_sample *sample  __maybe_unused,
> +							     int max_stack __maybe_unused,
> +							     bool best_effort  __maybe_unused,
> +							     uint64_t first_ip  __maybe_unused)
> +{
> +#ifdef HAVE_LIBUNWIND_RISCV_SUPPORT
> +	struct x86_64_unwind_info {
               ^ copy+paste issue?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
