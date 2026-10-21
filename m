Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB100606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DQ9r1P7o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoyi9og8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aTfChh+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWM4U+zIZm0xO7T+9ZXHwKVwit5LapETo4OtmyU0ojg=; b=DQ9r1P7oAjtWDR
	O/CEPTSJsIQF6dNbkHvwroLDnWbON/B4FUDZhbv5WHb+cGPPNtRHnc9ILUiDDbiBU4ReDBUJ3GgXj
	oenxxkx9bQCpXkw9rfctAYWONPfVhBbPOsZPFK5yzfOnD2MnhZBu6Y1nJRVoPQIg0q5jNSKs1+QcQ
	SLc27U0NbRUObtr6wZFp3iaVB9ZdhKMbsU1pYHqWtA+RJIcHW9+zZ2kKBLvOXWTaKYERG1oAh3joc
	+ymBwmDYrcKH3TsxBk7xQ+b/iHx6cc/inkVSJO0dHIzKlMfBoNxrUTwDLLY17Sa6EUCriE8rRKmUl
	EiqwM1ABDXdsu34Ai7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaLq-0000000Ca0r-0UEK;
	Wed, 21 Oct 2026 17:43:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaLn-0000000Ca0U-22Ws
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 17:43:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU3a52102378
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 17:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=; b=eoyi9og8lE7X7gFs
	6zN8p4jNwkyfCNTayV/KpLYTog8YiPf09MNrJZcVJnd8ebBGnM3y90AF6J6wPsgu
	KIHm6p3JiNc6RZfwNDa4t1fGBEFrTEmAppjPtFmqqXsDcs6gCeSuRZZlb5bNDOS9
	ImS1uhcDnN727Uzxw2NojUhBmpaItcPZUTIJpC/20W36NsqozA/ILY/A7RqOC8Fa
	fp6nVz6bC6n4qpaiLw/MFEox+9rhuaWmCR3mtKA8Cekf76hFS10V2nlLwjUarK9d
	b3wbMfLBTWZOussj3TRqDPdEihPsXKcxNsCG7ejdilg63VQy4NSwejKyn6ahUKZG
	iSFgwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhv26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 17:43:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso2719299eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 10:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604622; x=1793209422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=;
        b=aTfChh+awzum+EBMj8suZ7z1R7HOP+CllnMWfvB8z21W8/DdPcONjobEHE6M13hYdA
         /splTG7PsUe5lyeugu9ibHrEe/IreHM3mLnnHLiK5Wm2GY35Jmna6J1e2rqzbfhAJyJD
         dRIFLuog+0E+2UbnpmEyDtt1AN0apY7vvJW3A4OcEPU8caYREdRKf25f9yj4RdTED+CA
         n4AoRgTO9w6IpRYr0hQWkWZzqpCTY792HLfY4SeeytceJ0NdA5VnGino5pDNXNnNsD+2
         nHI2HC1eaIGpTKiyNwiJZt17Jha6KJDNdCPKEx/FZqRJ/h78MUTwcPc2BEiTV9jQEDpD
         e/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604622; x=1793209422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=;
        b=nMKnLTIvhHut7Y2HK5JwdTAZ0XurVK08fjplQxPp+t0GGiZRBrzMewNGGcPHoKS0U1
         M06IM+C2xWGwLjkiEcpbRgfrsTRrh9KBXE6Rm4DpKOuYwmaruW6M9W+/T41HLcHv1bk7
         GVzU3gDCOo85kfH2WP9xBlOwmwf5+8DVyFrUyPo56gQZbvAywwSopJEseptiptsXfHmD
         YZ3cg+4dfgj01iH5jXniqYiMFOHkiKQD8jts3gM4yPVnhT0P9pilPKlmbrcmwCrpgiqr
         B6RGQZdew0fb57ZaYxPRVdrE/qLI1KgL+ljleKE1imwoC5ZqfFPUQ92gCAgCQ8KGeZj9
         sAEg==
X-Forwarded-Encrypted: i=1; AKwUvBxunA0tL4oMlF5q3j+A7/n54siEhae9NoaKc5o4gx6E+YyU1XKYS0P+yGJZS1VlggtJgrwEHhLcBrZOzw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIzrlWzAuwdS1hdkK2WsvbqHyfmAeBqhmyT6CaSu+p1ol3bIW5C
	oUQH36hglNnRZbEE/VOehbZFXVZwmRGdBJYuokBRCsgwTpNPTpQsU7MlwHTYxU2v2zvz3Xxc+of
	sn7JKUT+gL9j/tXfD0kgqteW64NrRUKSWJgay6Z19Ovbr7wZE7SyEsyr/+IJZjFtnygsMi0E=
X-Gm-Gg: AYBFou2hi3VvHHmesGjgOxou/wfhds7C8xT93iAe84nM01d2RKwF1vdRPK4RfwTprxN
	VjC4akOPYDNpTUVqiW2stCBYkYtCg8ocV4hsLNzcoPoKuNs7AhEV/RpVtv6JM2gva+qFiYFMGxB
	XExMQP6cBMrUhl7toPhHMzmHycewyx/Bpbq2/BHn7DOk9iS5BXVxBT1w8YnQ8+vh/kbXsUPmPBz
	xJDJhHiLkRYeQWOZBj5IgXCSTvtqYlcv6WBsyiO9o2Vc3RWtQ7U2CCjvHxETE3G9kMMsV2w/t6D
	y2izu2mbRC9Kg3J6bBAFA9w9pcGy7rgmCUuPxucztRgrwzpcJGueQBbap7st29kWr5U+YsrIaVm
	NcRCPKX3/raAcdHe5wdYJ+2jMR8h2C+FlXY9sBBEfuA==
X-Received: by 2002:a05:693c:65db:b0:366:8efb:bab9 with SMTP id 5a478bee46e88-3674e450f24mr4349162eec.11.1792604622272;
        Wed, 21 Oct 2026 10:43:42 -0700 (PDT)
X-Received: by 2002:a05:693c:65db:b0:366:8efb:bab9 with SMTP id 5a478bee46e88-3674e450f24mr4349127eec.11.1792604621677;
        Wed, 21 Oct 2026 10:43:41 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741f753f7sm8840346eec.27.2026.10.21.10.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:43:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:43:36 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 11/15] arm64: drtm: Add macro definitions for DEN0113
Message-ID: <20261021104336.00000437@oss.qualcomm.com>
In-Reply-To: <11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8f9cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=cBdanpMcOxUnX1AP4g8A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX/NAfzz3R38/j
 wJez6IKBahHE696Ce6y0Jqia4pkFlOExXxoNMYRZPntJ2PmBMVcLSeOyCUmAgy3tp4XTSj9iKCX
 N+fI4rph1rw19TtS41i5NiNwmns+LlM=
X-Proofpoint-GUID: uQ6I7WQtsUgn0udVAkqIs_4gJxHcXyJM
X-Proofpoint-ORIG-GUID: uQ6I7WQtsUgn0udVAkqIs_4gJxHcXyJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX6SPVxwbGLdK3
 OIZz4UDNdpEKqbWDO982++il/xg4kqlI9VVfdbKrWZsXMtVa8l11Ax7pZjnjFnR7L54u8pzGUcv
 lzgJv6bjhpGMzJvE3ffVCa6oneGvZvuanNuIUbQwllTq0WU1y0xuiftmCufrC1npg0eY8xA5UKG
 Ev8OvNmJLwV2vS4VZaylUB3NmbqNsf0x5xMaBAC/YoykW25qrFEYzJggwORh6JTtGXuulwaq29k
 0Kv2jW97Xd88UvzgEE4DHVIuvG++VUQg41RjRwuaMJEmP9cxDPfmgya60dtQJ2yBH1z06LG+Sm9
 VsU24zDHE9blyJ+pIPDTfMDqMu3Oyq84kYQwq9lKwzdX23Inpb8UtINBEZk3CK160LslcZZNsnG
 154OfPn2OyFqdwkKBmIdwQi1C6xKo6zYOH5HhhAm2g9jh6A9Zydvunb7TUU36TTUSL6F/CO0Eb2
 rXB63/gAl/zNTjS6IIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_104343_534419_E448C19B 
X-CRM114-Status: GOOD (  28.81  )
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri,  2 Oct 2026 20:31:48 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Taken from rev 1.4b of the spec, following the SMCC register layout and
> constant names.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Nice - appreciated the spec references as saved a bunch of searching.
A few really small comments inline. Either way 

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  arch/arm64/include/asm/drtm.h | 304 ++++++++++++++++++++++++++++++++++
>  1 file changed, 304 insertions(+)
>  create mode 100644 arch/arm64/include/asm/drtm.h
> 
> diff --git a/arch/arm64/include/asm/drtm.h b/arch/arm64/include/asm/drtm.h
> new file mode 100644
> index 00000000000000..8188af1b582bb3
> --- /dev/null
> +++ b/arch/arm64/include/asm/drtm.h

> +/*
> + * The spec uses 4KB pages for sizes and alignment throughout, see v1.4B
> + * sections 3.3, 3.13, 3.14 and 3.15.
> + */
> +#define ARM_DRTM_PAGE_SIZE			4096

Maybe use SZ_4K from linux/sizes.h



> +/* v1.4B section 3.3 "DRTM_FEATURES" */
> +#define ARM_DRTM_SMC_FEATURES			(ARM_DRTM_SMC_FN_BASE + 0x01)
> +/* X1 input parameter */
> +#define ARM_DRTM_FEATURE_SELECTOR		BIT_U64(63)

Maybe define the alternate masking for function ID - for completeness if nothing else.

> +#define ARM_DRTM_FEATURE_ID_MASK		GENMASK_U64(7, 0)

> +/*
> + * PCR schema numbers. ARM_DRTM_PCR_SCHEMA_MASK is a bitmap indexed by these,
> + * and the Launch Features ARM_DRTM_LAUNCH_PCR_SCHEMA_MASK field holds one.
> + */

Similar to below. Maybe this dual use is a bit fragile.

> +#define ARM_DRTM_PCR_SCHEMA_DEFAULT		0
> +#define ARM_DRTM_PCR_SCHEMA_AUTHORITIES		1

> +/* v1.4B Table 6 "DMA protection features" */
> +#define ARM_DRTM_FEATURE_DMA_PROTECTION		0x03
> +#define ARM_DRTM_DMA_PROTECTION_MASK		GENMASK_U64(7, 0)
> +/* Only valid if ARM_DRTM_DMA_PROTECTION_REGION is supported */
> +#define ARM_DRTM_MAX_REGIONS_MASK		GENMASK_U64(23, 8)
> +
> +/*
> + * DMA protection types. ARM_DRTM_DMA_PROTECTION_MASK is a bitmap indexed by
> + * these, and the Launch Features ARM_DRTM_LAUNCH_DMA_PROTECTION_MASK field
> + * holds one.
> + */
> +#define ARM_DRTM_DMA_PROTECTION_COMPLETE	0
> +#define ARM_DRTM_DMA_PROTECTION_REGION		1

The dual use of these for bitmap indexes in one place and
values in another seems fragile.  Maybe it is better to have
different naming for the two even though the values match?


> +/* v1.4B section 3.4 "DRTM_DYNAMIC_LAUNCH" */
> +#define ARM_DRTM_SMC_DYNAMIC_LAUNCH		(ARM_DRTM_SMC_FN_BASE + 0x04)
> +
> +/* v1.4B section 3.5 "DRTM_UNPROTECT_MEMORY" */
> +#define ARM_DRTM_SMC_UNPROTECT_MEMORY		(ARM_DRTM_SMC_FN_BASE + 0x03)
> +
> +/* v1.4B section 3.6 "DRTM_CLOSE_LOCALITY" */
> +#define ARM_DRTM_SMC_CLOSE_LOCALITY		(ARM_DRTM_SMC_FN_BASE + 0x05)
> +
> +/* v1.4B section 3.7 "DRTM_GET_ERROR" */
> +#define ARM_DRTM_SMC_GET_ERROR			(ARM_DRTM_SMC_FN_BASE + 0x06)
> +
> +/* v1.4B section 3.8 "DRTM_SET_ERROR" */

I know I'm the one who asks for references, but maybe the SMC numbers are obvious
enough without given the name matches the spec section?  The table references
etc below are excellent!  The do no harm beyond a bit of bloat though so I don't
mind if you want to keep them.

> +#define ARM_DRTM_SMC_SET_ERROR			(ARM_DRTM_SMC_FN_BASE + 0x07)

> +
> +/* v1.4B Table 8 "Definition for error IDs (Bits[10:3])" */
> +#define ARM_DRTM_ERROR_ID_NONE			0x0
> +#define ARM_DRTM_ERROR_ID_PARAMETERS		0x2
> +#define ARM_DRTM_ERROR_ID_SECURE_EXCEPTION	0x3
> +#define ARM_DRTM_ERROR_ID_TCB_HASH_UNLOCKED	0x4

I'd use NOT_LOCKED to align with spec.  Maybe it makes a subtle
difference somewhere? UNLOCKED might imply a transition to that
state, where as NOT_LOCKED doesn't.  Meh, doesn't really matter
as I'm probably over thinking this.

> +#define ARM_DRTM_ERROR_ID_TPM			0x5
> +#define ARM_DRTM_ERROR_ID_SIGNATURE		0x6
> +#define ARM_DRTM_ERROR_ID_IMAGE_FORMAT		0x7
> +#define ARM_DRTM_ERROR_ID_VENDOR		0xFF

> +/*
> + * v1.4b Section 3.3.1 says:
> + *   A return value of greater than 0 means the feature ID is
> + *   implemented, and there are other feature-specific
> + *   feature or capability bits available in other return value
> + *   registers.

I'd wrap to 80 chars.

> + * And for FEATURE_SELECTOR all defined features return data in other
> + * registers, so 0 is not an allowed return.
> + */
> +static inline s64 arm_drtm_query_feature(u64 feature, u64 *value)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_smc(ARM_DRTM_SMC_FEATURES,
> +			  ARM_DRTM_FEATURE_SELECTOR |
> +				  FIELD_PREP(ARM_DRTM_FEATURE_ID_MASK, feature),

> +			  0, 0, 0, 0, 0, 0, &res);
> +	*value = res.a1;
> +	return res.a0;
> +}


> +
> +#endif /* !__ASSEMBLY__ */
> +#endif /* __ASM_DRTM_H */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
