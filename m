Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28378C982FE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=846momnPJpMVywX5DdgU72kAX8KG3zzZY2digLFSAmg=; b=V33liBB0TeAePA
	iSpbuiSI4KaSXd3SD1UpWa2XapQ3d/NrC3OGVIEXEUF+eCBHA6klWngJoKr5l/YgJ3Vu0tUy3TP9o
	m2YKcBD/zIO8bvlbvr8Hepjpb07bTXxS3EtKu+v1OXcXvwcDHNCMgewLp6ynnZLpG1RMaQFt2rPpW
	kD7nAAxHSOVdBNpSSqSIyD/u/CSqI8ItxkurLvfWF3ZytpnBDG5wgvCE8G/7IBH+eyFgJbZ4BJvGK
	Ypw/hvEXE/2GLFy6PHbwNa3FqkNMfVVur5TYyGPlfZrvO6DmhTPlukJNhT1+go7+JDkejZhrzYVJ0
	UGgq0t2J3NCkCTZqRTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqsm-0000000EpvD-2mEs;
	Fri, 16 Jan 2026 20:57:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqsk-0000000Epuo-1AMj
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 20:57:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKbiuk2642174
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 20:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DWP2Ujqs2BmFb5DW3lQ4Z+DQ
	NeiBk+zTYBEoqRugQ4U=; b=Hz2O6J4FuI8Ag+kpb0e1IQ7G+VgfoiKzAOaYCwF0
	6NfhDAjpe4txJfVOmN2jy+9I7Ts3GX9N+HQpsUyagzrEQxZTrC8DVOn5b1SaifCI
	chJ+vknIP/d2I08dOCX4zi0AItGFyUOg1W+uTv+dxVcHLZ6djyaM6sCx4Ay5hELH
	mbnoCbjQuiqG9Ow/OVIg2vcZ/bb8z/syYZ+iXIJT7e1YRLfexTCAUWGxob7Yp81d
	+g13Ivp3bZRN64g0S3O7Nfg2Zol+DMt7LzGQW6kdT21S9QSnyu9lm9w28zfv8RmB
	O5QsMc2kzu04jChWtWeOW2A8FGRvwszthTo/qiVaMvK1/Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvhh81at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 20:57:21 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45c8650ffcaso3762673b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768597040; x=1769201840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWP2Ujqs2BmFb5DW3lQ4Z+DQNeiBk+zTYBEoqRugQ4U=;
        b=FppyH3I0s5CWhfWZqpP6TMS6GWCduycIbGegtpVo4TOu6sKiPFmulpS49jyyCO1QOM
         DLwVAE/jbmX9VL8N4KbG8zb1+kaHzwEfzfX5BGMB20rSL4nTD3iJjYq6wdWem8Lm+4cy
         kGoUEehGpKDHss95k7gegIOLMnxb38v1wKW0tWEpNRLlyPCqmGKR8YcsikA6oAmMLzvd
         WkseRI4IzQtDw5tesihJANFYVZ0f2xvRZerjeBJat50EWwwpzsBVA2+x+QZPAbBZifLe
         shl+l12vQwM6dAOY4dnExZjgvb8xh96WJQEucaIskDdK4lmbeDzrFHQOEAdsWJdL1iS7
         fTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768597040; x=1769201840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWP2Ujqs2BmFb5DW3lQ4Z+DQNeiBk+zTYBEoqRugQ4U=;
        b=CsBsp0VAG9ktShscMPdEuo/1nnrywchnRhZiYkz8iMZ+VHd00sy8I5VXR/mlmCPfla
         48wEX8UbHnzqgNckJhH7sp2HL05cO04bMBDE7uQdE9tgeiupWbHRE7szDbHO56BFmeHC
         Da+xTpK3AlL6ewmf4F+5dQdvkAcHujbneN3utRfudtirgPMbGdppTWWGCQrbUPINo7Xf
         t0jOsd7W0bkMiQRCINsF3GZ7vrMsxegFD4Czw5FcuPnMMVnlC/tv3D92rWlqgK5UaVCm
         xTilYUWSR8STUR3wxrt5CRUmj4TKhoWnrwrb60Gm5C0GCiqQBFH0hL+vFhil5z+DwJBs
         nuxw==
X-Gm-Message-State: AOJu0YwBQurqVaV5cY/dB2hx/m1PQzSLRnxRZaeCqZauDwQSqIz4wo9A
	dBxjVJ3UaDVddyasNf0C4M/XYboHesDZpTo6cRg2phua1X6R3zZn7ToLyzDbpuYv/4qnrRppBv0
	thZSfwUDxuZRKaucEjUlyeak9VjlF9p1hPwEA1abjqrokptEg4jxW7eCFOKZUfK4XQyaX3n0r+i
	pWps8=
X-Gm-Gg: AY/fxX7qrgmb7+EXO4rFgwPPuqOkMRLqopbvj/OcRRtN6fCaph5Usohcal8dxYtHnfv
	0yKactxR9yKnXeZ2NO9U/MA6ZLfZITToOcAmLDqVcPzcEHATAskk8QDV9KAIQb/TdRjr9uWeX85
	yKlPKRJShKp+BdgaQ+owVkpypKDbzZkXIvydmJ8v8LWsvKjvbU5+ip/8rVCCCUPXRY6zuE+TZg8
	uuHdPKuAcvNiLRbdyo4r1WZkmZJC2H15dY6RjFApvFoLhra1L43nVDGRJwtyFvchUxdfL/JP6wN
	VQuQQt1rayoj1q4/moX06be4d9lKitSsrM44B65t1e6voio+a4Z2fqetvL2y78TSHxNo5RHMe/2
	FuXvfCYGILnKf6oe44dw=
X-Received: by 2002:a05:6808:1815:b0:43f:6979:6c9d with SMTP id 5614622812f47-45c9d6f9b4cmr2312125b6e.7.1768597040570;
        Fri, 16 Jan 2026 12:57:20 -0800 (PST)
X-Received: by 2002:a05:6808:1815:b0:43f:6979:6c9d with SMTP id 5614622812f47-45c9d6f9b4cmr2312112b6e.7.1768597040230;
        Fri, 16 Jan 2026 12:57:20 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e03faa4sm1820689b6e.18.2026.01.16.12.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:57:19 -0800 (PST)
Date: Fri, 16 Jan 2026 14:57:19 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: Re: riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
Message-ID: <tfte4r4yucp2fmphlag3odxbxv2yg6h7nvx6oasra2kczv2rkp@h6r6s5gquxsn>
References: <127dab2c-a77b-c1ae-7c36-2144e9203cc3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <127dab2c-a77b-c1ae-7c36-2144e9203cc3@kernel.org>
X-Proofpoint-GUID: arq90NWMZ3C9sweH2OcJSgGXlLAbNHU7
X-Proofpoint-ORIG-GUID: arq90NWMZ3C9sweH2OcJSgGXlLAbNHU7
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=696aa631 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6fThoZFA6hzuAKw3ua8A:9 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1NyBTYWx0ZWRfX1n5iAhw3U+Dv
 4Nw6GnvI82YK7cclPn5eUyWunRH8C/6sZvjit1AMBxhHuoT5sQ9HZYpEQZL2+rTrVOrC2JKS7dq
 6FJ9i1H1XPztR6o3Vq0hQb6JM/ySdzCI8teLNRh366b1YRHhAMQAYxSfEag24GCgF6C2DDEEDQF
 USdOCD9u/5SjbTVjeeDMPSQeIQZXnmN7ql5vrpwSyozXBNkUjkuy5Aqp6tIY2TjSddN0ma0stKl
 PPtL1Yd39V3TgBy4dwXd5tD3lgGK0JM8QEJ1Z91vc6W9dS1iOdjCNwR5GItGAQNQDeNblYmWh12
 Qx3x594LZCU2JzB42nEqnm7CtSjPhAVkLmsPkMPQc2yQFzhVvJ+kQShokUrgvQ95J57YX/J8ZJ0
 hKd307rnFw6Z5UBc6MqMWeRyxA2VUAq5nAKNJZoWE2wp+X8xS3cFJB/2HwkK65Bhfu/NB0Fqfd9
 8bafQpHdnGOMiD8hGzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_125722_458128_B24AC004 
X-CRM114-Status: GOOD (  21.47  )
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

On Thu, Nov 27, 2025 at 01:23:35AM -0700, Paul Walmsley wrote:
> We've run out of bits to describe RISC-V ISA extensions in our initial
> hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0.  So, let's add
> RISCV_HWPROBE_KEY_IMA_EXT_1, along with the framework to set the
> appropriate hwprobe tuple, and add testing for it.
> 
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> ---
>  Documentation/arch/riscv/hwprobe.rst          |   4 +
>  arch/riscv/include/asm/hwprobe.h              |   3 +-
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/kernel/sys_hwprobe.c               | 169 +++++++++++-------
>  .../selftests/riscv/hwprobe/which-cpus.c      |  18 +-
>  5 files changed, 120 insertions(+), 75 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 641ec4abb906..03484a2546da 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -387,3 +387,7 @@ The following keys are defined:
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicbop block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
> +  extensions that are compatible with the
> +  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.

Can we also change the documentation for RISCV_HWPROBE_KEY_IMA_EXT_0
to remove the word 'the' before extensions, i.e. just '...containing
extensions...' rather than '...containing the extensions...'?

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
