Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10716CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuK6MNGq2yam71U+yJm5fJ6A3RTPgmT8k40MY56LeJI=; b=z+slipsN6i2+JJ
	r/nJwurO+a3nJi7HhUCDieDT4+AB0yyNbfus1EEyEBXHRloM1Iw7DtVyaEwYwh/duafoaI/jZNXYv
	96k6cdY/QoqVNebmt/TGH7ZkXic9+piH9H6g/NBq7NtiLQwJa286O4fvI+FdsonCeERxJPQo9PBLC
	hRCln1wZeTYOcd5nltE9Pe+J3H69IeyFIVvQ1gj6dehz14hNMVV3YyTwwujydQqxg9kqVf977mH5k
	/W9OPrxXJb0C9vlUdEAeuJb6uPplIrxNrrCU5ZLyWI2EHbzXTAkEobui0rbHePrMIes722NBF6gOH
	DKHPCP/SxoZ7V1HyseEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAW4-0000000H1wy-2hG4;
	Thu, 04 Jun 2026 16:01:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAW2-0000000H1wH-0T0Z
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:01:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654A8UTW3234783
	for <linux-riscv@lists.infradead.org>; Thu, 4 Jun 2026 16:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yt4gW85Y9LMlMB5+VVL9pvf/
	wye7kF75DN7q+ptOBr4=; b=OF+XSvRYiLrTH54S9+jd0MNLNy21hVd6XdRt8wwZ
	0pjMiHCqOMO+rMsINhJw6L7neH6unjvY+9GUSK/2X88fKg9XOTBb19AnBXn1LSoG
	ou19z3e2t6MIjiBwOFCbQ3TSgGV8rxh1DVzmFwuS66BCG915tom3yAXcjdtUTsgW
	j80safQqLSn+NuNnDb8Sltf82fX8mRFpErJcWSRgngpurvuc0LmzRv0Qe/vY1qzt
	hhHsiPH/x2iTyAkULmj29aMqSZuAm05syng1M0Oit8Mgkp+PF4oHJ72dZ9KVspxZ
	tGNduT1zRurOxBDDs2NtuTwW61/n5BBkmdLzzpBVW31+mQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s4q7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 16:01:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137fe4a3640so1370019c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780588912; x=1781193712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt4gW85Y9LMlMB5+VVL9pvf/wye7kF75DN7q+ptOBr4=;
        b=PftByYPP4AivyGR2cymGsYvbbUjuaIcmrA3P/C8e6YsFhbdeQNm4e9NvXb1mVqINrL
         7xh35+puQGA1J1cWTW5+xSY09RhfHMM2q1LS+bFX2Xb4zByT2/Q6+fNFfrO/br2J2E8G
         EEG3LqLk8sAHbSO1jq258YanuBWzktj/2Ty3PiKHj21u2wjHQPNVFCgx2I0xlxF3l8eG
         khns7zIwuHVWjf4LUeERlnrHO69UbveFxmOSkBfybpSxdc7TPOvtbYRYjGkzYdpcFFhu
         nLhxl2aEeuZ53sk9lSMxoFt/tpaqDxDcEnRp1hN57C30UnKOqX3+oToB96msbvlAwT4B
         611w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588912; x=1781193712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt4gW85Y9LMlMB5+VVL9pvf/wye7kF75DN7q+ptOBr4=;
        b=M5RZW3Un28PWdLznCwP/T6VE26BpkfrAxJr/MYmXFuviSSzjUq8dmyl1CSxXJR1iBT
         jwzlO7zviLbSTum3vngCk19KcES4Kfm1EA1eoAgdv2dLmt6p9Lue1+IgzgevPaTtqcQz
         raC4Yd+2hc7R0ekh2D/FRRigBw4APL6TA5iXwxbG/iRCW+S7U0yh3L6TLg/Qqs0y6EXW
         1bgQGX1fByoBbkBNw1dhAgyFPsuKCFd8TfnpmHNldgmXibhW23ilaIL+NyK0yN9ePEIR
         rMa/uyTF3UZsNOxF0Z1ICymPcYFDIJL5MHhIIUc+nHaR1TPgzNZni+jylQMmWQSqlMPd
         Mu2g==
X-Forwarded-Encrypted: i=1; AFNElJ+OpvvKy9MQliSIM0s5qVkOQk5sPM2DrU8nTF8HJHpz4VSI2Ca3bIp87xhFpyIXziapr6q/zOvLiqGSMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVnQXt1IghC2pnlSxphCBCytTj5ca5Oxu/OiEPj/0yqGCVWVk
	1yeRnkePL+0gqm7iw7Pp/DGoIqJGRLEvqOCGRutFy3q46fsE1NSV1xpaKg06vVnUdOU8afakdWE
	BvjE0jRTZN11vp3wado6XdYXSoPuWLIESS81un1ytDyBOXB3QWEAz8uwoB/afjZWseB4ft1w=
X-Gm-Gg: Acq92OE265r/koV2h4srycke6Bte0xe93S8lZ5nVb095/h2mUzwxgw4WorFQocJqats
	D5pzaVFosoFeaEdfYUbkSNVGZY1jzzodws7hxppiwZFn1ZbELHF35eHgkJR5LMh31MfpXcc5/Lm
	pPzA85M0nmGKJqDmj6mTA6irkjZGkiM2A04ZVq0n0o8eblTzZCN6vuEiyCfM2hxqQ7dm5oMXN8E
	vNt9ridvxN3SwxaYdZYi0tcOB/DvHZoRpyrM2APRHvgCrq2VogiuBrbhvmFCcGjwmLQC30HM/Fz
	LGxQtxgPRLWsYftvR/9eFgFLTxNrWEyArteCKHmB6ulTQg0swFWOMqzCmdPzOVxxMnM9VSKvDaw
	JK4+xMTxjMg==
X-Received: by 2002:a05:7022:206:b0:137:ea56:358 with SMTP id a92af1059eb24-137f6bd030emr3478925c88.30.1780588910493;
        Thu, 04 Jun 2026 09:01:50 -0700 (PDT)
X-Received: by 2002:a05:7022:206:b0:137:ea56:358 with SMTP id a92af1059eb24-137f6bd030emr3478562c88.30.1780588909024;
        Thu, 04 Jun 2026 09:01:49 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f716017esm5199221c88.15.2026.06.04.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:01:48 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:01:47 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/15] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Message-ID: <vazr6kop3pbga22p5wbn3oursuic4thh4aeogkndyuskrncgta@cpk6igb7cr6a>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
 <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
X-Proofpoint-ORIG-GUID: UeQoevjWK3YPB2HrGt0Xr8qmfa1R0EYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX85DFzLpTbERK
 P9XS6WXeYUfJ5eek5yMccT2saeHSFStC/1Tz3GE4MqT6UUhIyItghcl0rlll9KaVQYF39xPl6wR
 P8F3C8oeTjVBl+pD/ywNaN0ruT5y56C7AaWgnmfGLKA1zrjCMWQtyP4w2RqXtORnAemUaHSb8np
 GyJwLPLdLyjuvjmsXaybHWL8zHEeTTiwnuwauAL2wauniB7u6YiZEv6qst088CKWMtdOBkIrVfj
 wtsl+VEOLmEDHTxXV8AGdhKs1UedjxsxALZm++uw1meGnh0q0JFpu+R2kVCPKrsSJODDftyIq1C
 qnwAmhwsVbXj9ioyL4FCacxjbq/XsajGEo2kU3fcDFtiAVGxA1F1x+q581Hqod+ZPQg+q5bRVf1
 P5wI4Y1W6CRMTbF7Za5ikTFWb11iffEn5JqopR7Fe52Ct3whozSgYeQx4SG4Sce2O0rFJMSgTKW
 P4HjMxhoKS2weiSgWBQ==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a21a170 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MiYv3HnXQXVWDUVKjRcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: UeQoevjWK3YPB2HrGt0Xr8qmfa1R0EYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_090154_266534_D98CF512 
X-CRM114-Status: GOOD (  22.31  )
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

On Wed, Jun 03, 2026 at 07:11:57AM -0400, Guodong Xu wrote:
> Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
> enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS and
> RISCV_HWPROBE_EXT_ZICFILP, but did not add matching entries to
> Documentation/arch/riscv/hwprobe.rst.  Add them now.
> 
> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v3:
> - Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
>   sibling enumeration added by the same commit (Andrew).
> v2: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index a09a8f16bd16f..3cedaaa53f331 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -289,6 +289,11 @@ The following keys are defined:
>      defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
>      load/store pair for RV32 with the main manual") of the riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
> +    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +    extensions specification, ratified in commit ff03d8485a04 ("Update to

Can we use commit 302a2d45c243 instead since that one has the v1.0 tag?

> +    ratified state") of riscv-cfi.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>    :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>    mistakenly classified as a bitmask rather than a value.
> @@ -391,3 +396,8 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>    extensions that are compatible with the
>    :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
> +    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +    extensions specification, ratified in commit ff03d8485a04 ("Update to
> +    ratified state") of riscv-cfi.
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
