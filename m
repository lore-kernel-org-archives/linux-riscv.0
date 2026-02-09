Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505BAE81BD3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wxm+6caKRYp6O62Bw8hroBS/LLzDHGINebm5MycIBlo=; b=LgoPkpqYJCQ4f9
	6/VjT9/fSqe+ihaRu6y/6eiJqQuS5fZ7QLOSVQoamIGsHR8YKwNzAMZMKDvhBKDXkTtT6LjyqIFXL
	I0DDMgrrMY36uOI83S4GR4EfZr248ACV7fHa9bkOQpW+aLVhVFgSRXpyVDeN0ByUqGGLoyMSjY9gS
	fZqoXzPGtHDjhSI4vTQ2ImSsPnqAs24ggxPCjVA7ZSrsP3+LZw9bPShdDHTQMpJVY4B6WBHEs/bAn
	LbJQvGx4KK0w6J8GsyLsTpz8m1GFkLntHGmdplu0AHkt6kbqk2vf8mH53ujDw+aJIRuX7sFXX0jh9
	Rr36Zw1WKCj7aYZwezqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVSB-0000000Fo1k-1cXv;
	Mon, 09 Feb 2026 17:53:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVS8-0000000Fo1L-3b8V
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 17:53:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619GoWMh1656035
	for <linux-riscv@lists.infradead.org>; Mon, 9 Feb 2026 17:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PMH2LfJbgMJ32u9Y2F7PoHqj
	pd6CbIaPx+bRrUXeUHc=; b=nFxprgS9c7DLrtlW9FNDOfSAE5vKbugBqF3sKMIH
	jitqHsIrQEaieLKz27hsPsAfHc9ZhETJN0I+rmVk7vxrLjOnMyqp1G15+9ITMxtw
	AEKHGe3DmglFhYjjJm1zDKGwcpsLKYP+KIWl5vrj5q/2qaJQPRw7dq+cqRxW+JbU
	Hb6pPcPPvl6lN9DfmUyXzq94NqCKztn0QMQQ2eb6Ww00pZgwcjarcgXyqkvbRBSl
	AWodsskdbiqRM8xCq42MM3pIUdmW5UGyefgsy8TMlmy7NCvlrB4mqSqcg7vqTgap
	JiKL7wwn9f5W4rgH+Z9bq9NU5SdImIbYDm5EWxw9QaO8oA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862tqh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 17:53:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba68ed568bso483597eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770659619; x=1771264419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMH2LfJbgMJ32u9Y2F7PoHqjpd6CbIaPx+bRrUXeUHc=;
        b=JHaTjPHy99k3VepvBFSb9K+iyn14qwVYpJCJR5vQw9wFFIcKhtC+PX+J/SqszZjaAZ
         uxeRHHZ34CdPXtB7jJ1McHn3Q18wlRixz0NUfVjS1m7y8bI/PvGilavtodanX6jgDqWb
         ezcaVg2GhtFT/i0K8kBhbt6C72VPffU5iAkMKowftVlfzp9/pFz8KfaB2j25V7icft76
         1QSvi2KEh3OEK3ChvFi82gxosak5/6PStTNfp1inOGMySe7bBMw0X73HrqkjynlDxsWb
         JfV7UYAHEI334Zulsa002E3QLsyejzx5GbEATku5U+M3PBSZm7u/p3L9+dc62wUTO2cL
         O2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770659619; x=1771264419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMH2LfJbgMJ32u9Y2F7PoHqjpd6CbIaPx+bRrUXeUHc=;
        b=JHrSDfhkoi/ddCb4XUgmpkCxYc2yRrH6G7OqztMp+ZWKzINWhvUHHzbayx1A03J9Z+
         5M5+NPMooAgu1QY5SK8/jNGOccPt2nscq7yHpsoCMPVupTjw/ygIQDWuLnkze2Z71aZH
         MwKi1mwzGbCLN0eOvIJwSp6TBejHolshuAd5pTRZLIAuFOTKJbGfR75Wy35Ef0w6BFDX
         pl8bKTrVFwOqq7dB97LUdYVHhj0KMeBM1dyJFrto4fEwoEk2CbPi/fgV/d9jy/proMrh
         ddspnk/SNODtV9MLRTgxllnRleq5/vp94J4mJSKfVNgDPMoXIMRkLnt8yOeq6FGPnCU4
         kp8g==
X-Forwarded-Encrypted: i=1; AJvYcCUHNxQKIptHRBDRL2z0gt77W5n74gsYkbEq7/x54s5qKpvoFr5Lb9tCMdzsWgq26y+N1xEbStEfjDYCkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeuLBuaPtqySwoGLdr31JqQPc42HPqTm4GezbhC+iGA+dc1/Fj
	OJqrIC73tcrjhvuMZNc01GG8WG9b4TbrXmIxNAbo+3l6lfuDX797gzzN4mankyhuikHHb76LNpg
	GQId+p8UIe0fbOGDk8ACfABudm2EL8BVlw/FuAiTQvYsAzLpghFfh3B+ELRz5Ub9anso572c=
X-Gm-Gg: AZuq6aJf6LJYr1MhBmDeuYz1WwEN98quo7foGmVlzfRS++N6+r3jmZEp1oNdcCHy0MG
	V1T/+QqzZcT0EKviEwjCd/Wk4EhrAwkzIm++wNrAPuDoNmXpYJnIroa+eTTcmG81Lq4+gF//uJ5
	qhO1nVj1uWn8FQhPa7YDmw1AKvqXrgM+HrGMM/3Ws4k/7b3//P5zY6Tnyo68QIQQAfzuJNDsWQx
	rbzo6aGjlcZsJgeiv1O6FEDR2gYAfCwg8UDrIyZonSNEXCfNN/dAjIHKrFxOQlpbC8ka/l5MfD+
	vIkR+ez1fN4zx+wjhmXYzjYS5NO36gKj/o6ru1N9DeHVSjq3y886t1mSnF3uzf7URJKKPCG8489
	zmM7q1c5f8Q9Rr4xnuKQ=
X-Received: by 2002:a05:7301:1f0a:b0:2b7:5a7f:f74c with SMTP id 5a478bee46e88-2ba88509495mr89807eec.9.1770659619359;
        Mon, 09 Feb 2026 09:53:39 -0800 (PST)
X-Received: by 2002:a05:7301:1f0a:b0:2b7:5a7f:f74c with SMTP id 5a478bee46e88-2ba88509495mr89798eec.9.1770659618803;
        Mon, 09 Feb 2026 09:53:38 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm10256781c88.11.2026.02.09.09.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 09:53:38 -0800 (PST)
Date: Mon, 9 Feb 2026 11:53:37 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: maohan4761@gmail.com
Cc: pjw@kernel.org, palmer@dabbelt.com, guoren@kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mao Han <han_mao@linux.alibaba.com>
Subject: Re: [PATCH 1/1] riscv: Optimize user copy with efficient unaligned
 access support
Message-ID: <juvvkliij2fbv2n5jgebuczlevbswgku5vtjm5m5hldbm7i74t@5ccwalmficeg>
References: <20251202074121.81364-1-maohan4761@gmail.com>
 <20251202074121.81364-2-maohan4761@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202074121.81364-2-maohan4761@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE1MCBTYWx0ZWRfX0+Kd0zcl2SBQ
 +L4g/+1mpZdUS3RAwb984PgSdexGhiwuaKJ+7forvI5/YGCuH6DDC/rV/6U3herqxLgs6EHmOos
 bk/vqMHrxLtnwaOV0RFq34qmncFmct1LhxR40UuGrHDIgk4F5owHZ+CnOn0z3GKE0oO8xeIUgk8
 5j5Uc8jEvPxN1To6ebVi6PbBg9RXzWAvNbP0wF91jv6K0akU3yaLVowfPKxISOqfcXCBC6Rz4J/
 NDof9rdLFLNWqXAj0xZnV2NvH+QoQODSlgNImXGBHaFhQ8b+IIELMPQgL0PR6ak5DmgzboNX+ml
 IvxGg0nJDq04nueB/dFVWzpDJlw/RVax29Vk+YnUFW+wxndkEVbtyWvUV5lxQYFWSJkNMkvNO6W
 fm9SrYfRVqsR28jm3cAwDEyd4BNct7TStVX985kDMAcF8F/f8CtdRm1LDD4lUMcVN0f2rxOgFJ+
 oL+FAF8921goacN0BpQ==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=698a1f24 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=ydGDfJNDtM0v5vcO3F0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: z9cT6InzIL9_OAEJCgADFYyRQWUQ0hBr
X-Proofpoint-GUID: z9cT6InzIL9_OAEJCgADFYyRQWUQ0hBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_095340_898117_FC21A06A 
X-CRM114-Status: GOOD (  11.58  )
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

On Tue, Dec 02, 2025 at 03:41:21PM +0800, maohan4761@gmail.com wrote:
...
> +.L_len_less_16x_szreg:
> +        # Pre-check: ensure at least one register copy is possible

ensure at least four register copies are possible

> +        addi     t1, a0, 4*SZREG
> +        bgtu    t1, t0, .L_len_less_4x_szreg
> +
> +.L_loop_4x_reg:
> +        fixup REG_L   a4,        0(a1), 10f
> +        fixup REG_L   a5,    SZREG(a1), 10f
> +        fixup REG_L   a6,  2*SZREG(a1), 10f
> +        fixup REG_L   a7,  3*SZREG(a1), 10f
> +        fixup REG_S   a4,        0(a0), 10f
> +        fixup REG_S   a5,    SZREG(a0), 10f
> +        fixup REG_S   a6,  2*SZREG(a0), 10f
> +        fixup REG_S   a7,  3*SZREG(a0), 10f
> +        addi    a1, a1, 4*SZREG
> +        addi    a0, a0, 4*SZREG
> +
> +        # Check if another register copy is safe

Check if another four register copies are safe

> +        addi    t1, a0, 4*SZREG
> +        bleu    t1, t0, .L_loop_4x_reg
> +

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
