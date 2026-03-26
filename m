Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF910AB82B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 22:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJaHCBd26qXh0N23eVHoBRSH4y2Eos74wH7PHuBSJAM=; b=RojcRu1LnPpOei
	SddEpEo5UXk1oliKC1bRudW7p/OmCHD0p4RyfHIQ2FNX1j4cI2D8ZEiXD40IaAP+gE93QxiEgQDlE
	aQ0IcYkWomMuOOpeJkHiBDkKyUEKce2O+1cej4YIpiIE+Xry37TWxUOPdefzytFNdmUl5cpHOzNue
	agI5B2wB+s3HqSX5DMPVd8wYl55ztAxb9OppeqS8spCU3ej45Nv/g3glVxDb0SQcyMysigAAH36sP
	Ddg85evrZk36e7E038lnRmOso6scCTuSSydGzVaN96Z7r5rSj9ygm8utA1QzgPQOjBNiOTxzxTS87
	V+pQpweHvrIn7w9WVCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tAz-00000006KFd-2HGj;
	Thu, 26 Mar 2026 22:27:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tAx-00000006KFJ-0VxT
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 22:27:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9etn334237
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 22:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/xni4FY6hQwi8RbBOZW2v9OB
	re3n7HLWLu2Wnmm7GMI=; b=Ke65oCy8mHzGZxEozeWojgixILFW4zoBJWv6aDwW
	0k+GU3EXFjF+eyEIIYdCnrYwXF207gKauJjHBsGSYFNH7twZA9Tbd0LHNQ+67RIE
	78sSJy88b9k9Gr/F5cfFUDjVfVYBYXQCesfIDYon1XI225dqnxHnfY8JX/ZbV/iv
	EdYafwXOavioSah7jE2xyZiAHXy2PRbli6O1U522VuYphqm9sI1q+sFlGwHmTATc
	7bJNFiJezTGtFC6AblM9KHC4PQjNub2aASnTpCDak3lg/2W4APteMpaoV9/EZjZo
	Z3Cvl5Z7VJs0GggGJJlywgZ6B8tYtlj9GfmveyX54CxEPQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527ytkhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 22:27:38 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-41555e51e94so1453769fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774564057; x=1775168857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xni4FY6hQwi8RbBOZW2v9OBre3n7HLWLu2Wnmm7GMI=;
        b=YTZf5NlkbUSYityz8mhb2oy1DFQWKSjzfeEeukVqJZoKPdoG3JOq5ACAiM8QoTjszF
         mob39LjTKD4msuLS5AfVCCIS8BSefGb/IeufMNqrPDMh6OKeE2UtvvY0utFu+R18Tw7u
         Vbwigxb/eyoBvjWOwGYM0hIhrQfZE8OVBrVzWd/OdTVU5uOtS9qgm55wO1wEw/Z66T6h
         RSdFdlQAMwHfZbvN5lmlOV1zn7TLjTpSvh+ZYq2CnM6FDPyAwMpkEFjcEUFTslX/Lmaf
         mPo1ZxoZmjOPExPIDWtDi4ZmB2fnKhhFm2SzsCihPG8QjyXU00HghzTbn8SBJ8VGdPG4
         /OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774564057; x=1775168857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xni4FY6hQwi8RbBOZW2v9OBre3n7HLWLu2Wnmm7GMI=;
        b=b7ukpnLqXIW607N5ZkRD+UpUvWhksQaspYDmQeviisUeDUlZ/qkbNDr+Z0zRrtdT1I
         kyFCIY+n3j55TArw69HCcoWQG98MmUx/KEIKwZYQL4aX/QLHyEECxmOhqlBilSUu/iL6
         vQ4zubAFkUuQxxBJkwvDw2O1Yjyr5IHMBzPjIecO5TGQNqETEo3qt+ZXl1zoVTV7pV9O
         Kkd00E/EWxsqhZtjOK4kRb1XzwKGHA3o9AnGmYniVFSLf1bu6cwL0p/nm9QC4jW7FRx9
         9ZrAJ2QrQ9k9GZRQA+l/jG+IisVOHrfjfDfYD4lwa3lzU06RH+RipOSNPtOOfta4Ma5W
         bf/g==
X-Forwarded-Encrypted: i=1; AJvYcCXpWDLnsdhJfVX5eqmv25eMaeEjcZGZJKjcSDf1feAuzkbk5Yd7A9zm4GszCmqK4s38XqnT7RMOE7V7qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoWTYugh2SyAS6/SuXDzYFl8JkpfSdGJpvPCn4NSnEpUyHBCxj
	2PmU7fIlPgyDJ/2ELkeYDeW/zBw6rSZPUMXn2h3iBI58THgY6j4wZ07j+8jgxu95lKn54xEH7bS
	9KMfL7H9iCOD0bgEFe2BRM5Tl1xQI+zo/P04TF1azWaXQppLbA38zRc1VYbDm+UUDGl/koZU=
X-Gm-Gg: ATEYQzy4cnvGARX+lxmEuMGIQHwNV39qnkW2WOPj0JKyBn6NKxNoZmjDG59F7rGVCOU
	qPVMsyv18pt9xwzAZAxlxt32EhOf8dIyEyODeGsa+JcaX3SDxh2O6R8iMSQskWsZYxoec7rwd+I
	9g8lO0cJefqOdS2tDnyMuH5zAvHV4P9tDU4of/fqGijiDPLbTBK0G9LO9jvQzE+qnCkirpir3m1
	oLMj+K+Sa1D7E6eRB6Uh1lyd6nFMKjzIZ41H3g5VGrLUZQF9Hf1dRqIyQmzWiJu7VsnN1TiHqMG
	1HBNqdHQadgkSWEijbsRbpY3MiP9un/0HkTcfO7sDRM2rsZTA+vzMtuH+bbneYQ3dBfobtRr85a
	pV5JDDfWETmkdQvoFjwGAHudlWqKgtrU=
X-Received: by 2002:a05:6820:308c:b0:67d:e42d:e50b with SMTP id 006d021491bc7-67e18671e76mr225465eaf.29.1774564057523;
        Thu, 26 Mar 2026 15:27:37 -0700 (PDT)
X-Received: by 2002:a05:6820:308c:b0:67d:e42d:e50b with SMTP id 006d021491bc7-67e18671e76mr225450eaf.29.1774564057113;
        Thu, 26 Mar 2026 15:27:37 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0a9e1860sm3006023eaf.2.2026.03.26.15.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 15:27:36 -0700 (PDT)
Date: Thu, 26 Mar 2026 17:27:35 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Atish Patra <atishp@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: restore U-mode counter access (scounteren)
Message-ID: <fyf2z2tdzm7cu52kybmwvigvxpwigdceasveenjnoes6g6ilwi@otq2sp3m3qam>
References: <20260326111713.2282289-1-manfred.schlaegl@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326111713.2282289-1-manfred.schlaegl@gmx.at>
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5b2da cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fQSUa0upvHhAmFPvouAA:9 a=CjuIK1q_8ugA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: 8IawZSMwcuQKfL9V8ZbowZkdC6uh66yP
X-Proofpoint-GUID: 8IawZSMwcuQKfL9V8ZbowZkdC6uh66yP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2MSBTYWx0ZWRfX5nICoEdCz2yX
 3y/ERuQLEHBcqtXzAq9z0XfxuQNTGyOqSkqlqDoi4oYBuQfSDlnlx9ozdpIPrZfzUYDfk+LCVNT
 PRVyN8eK5smT/Mjh0PiyF/Q+dJ/+N4CtdHlPgN5098/DKmd3BbSdnlCoNciiLz08RRfcfGoN1Xe
 XAiNHN3f2OIFuKEKTdWGDGaxuWRy9jpI1rT9DAmzLSUCcMndPDtRWZxFLqyFA3snqcpOkiVVvbA
 82zWA+HT269kmesbSuhDSdgrJekeL9Rzi5IJsP4n1M9Z3DdtM10JCpT62Iea0/BPow/UUydueIr
 d4b5nhVIiiqgUVL7m2QZmrrWsIXt4pu2klHCnkDc5Est91qiLmpyl4HBWa2XxSfGUkj4zqcIEE4
 Zq0i8WQi3lQEKTwQm0aCFkbVWL1L6cx5i7NqF7W6ejywD0L3o9mNCz+BZsZPivuK1yAuABoKUXo
 avwJQNBf7/aMVIO0BaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_152739_430388_0BFD4BD7 
X-CRM114-Status: GOOD (  22.20  )
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

On Thu, Mar 26, 2026 at 12:17:13PM +0100, Manfred SCHLAEGL wrote:
> In commit 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
> the initialization of scounteren was moved from the hypervisor (KVM) to
> the supervisor -- a well-argued change. However, the same change also
> restricted access to performance counters without comment: previously,
> scounteren was set to 0x7 (0b111), allowing U-mode (userspace) access
> to instret (IR), cycle (CY), and time (TM). After the change,
> scounteren is set to 0x2 (0b010), which allows access only to time (TM)
> and prohibits access to instret (IR) and cycle (CY). This breaks user-
> space programs that directly use these performance counters.
> 
> This change restores the prior behavior: scounteren is set to 0x7,
> which re-enables U-mode (userspace) access to instret (IR), cycle (CY),
> and time (TM).
> 
> Fixes: 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
> Signed-off-by: Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
> ---
>  arch/riscv/kernel/head.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6fe8..5ad5e12a8299 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -133,8 +133,8 @@ secondary_start_sbi:
>  	csrw CSR_IP, zero
>  
>  #ifndef CONFIG_RISCV_M_MODE
> -	/* Enable time CSR */
> -	li t0, 0x2
> +	/* Enable CY, TM, and IR counters in U mode */
> +	li t0, 0x7
>  	csrw CSR_SCOUNTEREN, t0
>  #endif
>  
> @@ -247,8 +247,8 @@ SYM_CODE_START(_start_kernel)
>  	 */
>  	csrr a0, CSR_MHARTID
>  #else
> -	/* Enable time CSR */
> -	li t0, 0x2
> +	/* Enable CY, TM, and IR counters in U mode */
> +	li t0, 0x7
>  	csrw CSR_SCOUNTEREN, t0
>  #endif /* CONFIG_RISCV_M_MODE */
>  
> -- 
> 2.47.3
>

5bc409786752 should have explained that change by referencing the
same links as commit cc4c07c89aad ("drivers: perf: Implement perf
event mmap support in the SBI backend") does.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
