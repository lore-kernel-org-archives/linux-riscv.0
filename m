Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E34C98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 22:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xb85O4Y4YyUb44RwNcoBx5tYCzBJUdq8q3a3dWz7luY=; b=pCWxmUXM23JOHR
	DBTZ+2HxofwBTK6svKXArptqVv+c2OXksecYbSEpbgO0XoSQ6kHjRVV/YW0tXe3E+VXRBDHX+500h
	5x9/z6wzawv8tZlO1Pke1QCLB8L1entTaEKRKrZnhHBnvm1sQyT6ws513RzbarlAjr2gjL4LgoXFo
	VDXiNyARa4fNpfXYa079BUmranzQgqUroSrdHEIHfDzXKcS9QTPYpObiUSFAe0j2TPk6+edTPR8Dl
	7GPP/etqT1hU1eCZcHQPw8EGMSvhrkg/w1iFVEaKwZXgC0PtVocXzSnYJPEoVZ91XBqvv5aOtf8kQ
	1kc8YY8uptkdnKTbOWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sNg-0000000CL1Y-1Dw9;
	Thu, 24 Sep 2026 22:57:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sNd-0000000CL0q-2K25
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 22:57:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOwwi3933496
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=; b=BI2Gayz/LjxSc6mE
	Kg+MLNOusLPeYnOxYOG9xy/G6ynTgm5i8HXcMPcVaie12keAjyA2Oz1Cf0fyIkw2
	1iPHcxBnFcP9qOOkZ07f07f5aQw1qPFKV8ApXthFNkR53KsFmNN+apNakWPmF9KB
	GZ4On06jpyBc5aTWoomkmhaScQbrjk2k5yn95Es0ViLT4dyJ6vNbt0gJYJ4jce1c
	XIv1evwdRyzJbK4ev5ygZd0QRpNzogYF0Tn6LwzUygOtjjPo7wa0hzGZ8ulMQwj8
	1Dwm44i8PH1iR4SnWFtv/Stn36RWYL43Nv8n7mH5JL14F6v+yiIOppzxFkJgDYi0
	2R3TpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjjyr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:57:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33baaba6371so967073eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290647; x=1790895447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=;
        b=QjGcVmw3LpFD4HV56x/faIkzN7MHV0HCbgUEDW4ITtKKTxqutEtai8VSu9sgE/mP2C
         Dkno52W/Zx/B8njutckgHXS55FPCVSx2c1564Wo9f2HsRipA1YlArmr1xMJDE7rtYXnB
         Jd2RMEpTOnw6qsyLec8im9xfo1i4aL10oN9HJs7Qbtx2DAAGR289EFrkj5y1w+Xev5TC
         vyahGfnsQAa71l26cnG7mSfRpaXIweo2D4cSRgvWsVAWcBpIJqlSBd7ItDe4NFnhk+dM
         lZEMTUrYU+p0Y6LqSC5AZ9ycukDTJVt9n78I/w/dTDmavU7ZnggFi6RGjFIZ+Nm3WueW
         cm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290647; x=1790895447;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=;
        b=L9aTc15buFgxkteZeJydaN1UF5rBrRRz/WQ0xT3qDxYkpbnc5zBR2UzIF7VU8atT4p
         t9sDoGfWw2mwiUv/X6y4nhCLy2EbXuUmWNNO0tG6N6IbxC9t0v7vu937Oj9liayAWqHt
         8JylfIoU6NvpsnZ+aF5XJd2YlOx1jvW/lU1M0aEJd5FDZQKDjJ9O65gDFU1NYJQeLM0Y
         taXCGooDDbax9Q4F0C6aD6NFgDSIRfM+I12MtA87t/3ftFr3kUa2CukWt2fFLsw+rHJM
         9j/ArV2uFMbHFE3cib6viSziq239ENdkyKk615UY1ijPCKyrSjj3wGuC8g409ufuIcUQ
         wolQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/pFrDfeWN6lYd5CRWF7nLdAQBN1oQWqSyE8v2GbRMAiA89ApvjSX5ZCQmmUbKPLzgoHhSn7IYF0HrgQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k2qzceUvcOTRitRX+LLRpNKpMMUUucj/gSF/sGbTaa/ne0Bmuo
	Wt33r285p+BgnDOWnEtjQstuBsGoO1L35dbpZSBRzbUzEoAczGLb4sFhsx6OSF4TeFSF5vZlCfY
	h09ADdoZg7T/K6dlCP4WYeFTntoh8l/VHgHqfRuSE4ORGkCmlb5lqOyn3DVag0cMxdPA3/c8=
X-Gm-Gg: AYBFou2YjVHxkIyeadvIC46AcuPF4BpAag3c4oqB6g9eFbFCK9Fc9mWuuwSy8L3Gh20
	keAji8Zw5+oeQ35LCO/6bxk+CG+v64iwn05yQ85JSxa8v/ab4SZQrZk1k/rtlAcgPsdeOSbUdIX
	YO2UldDZydze7Fqjw/SyDivz33+IkTLp9SU3YhnwfP2hHrzSI26tvm2bqEGNDeUSUdTJVfEhMos
	pP49gZk7FOfHRnGYWQiJsTTy2NGBVfSbEx7rVTU7IrdmEboYsOkZukjedoYLAHSilEohrl86h5/
	TeCocZ+yUquekA4I6aNMjFuakBXemeLh1VtgY9ivUC3LOC6MZgv4J6M8fsJUrJIsT5PcmH2A7za
	GRA0j7hicKD2bI9erxFmZsqZdQRpG6+RJwYJsW2ic7SrY7RIcQbQBVg==
X-Received: by 2002:a05:693c:621a:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34002edee42mr4033413eec.22.1790290647513;
        Thu, 24 Sep 2026 15:57:27 -0700 (PDT)
X-Received: by 2002:a05:693c:621a:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34002edee42mr4033386eec.22.1790290646954;
        Thu, 24 Sep 2026 15:57:26 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm2046484eec.14.2026.09.24.15.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:57:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:21 -0700
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
        patches@lists.linux.dev, Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH 07/16] efi/zboot: Lift efi_cache_sync_image() from
 efi_zboot_decompress()
Message-ID: <20260924155721.000016a9@oss.qualcomm.com>
In-Reply-To: <7-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<7-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: xax0nXeeOIiYaxNE9nxHw1SboxRoDKaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX5JR1v5ksJcAi
 SF/Lijg8LTV1hZanQ3w608ek5Wiv36XWthfgdnBVImQyjmRqECEO0isS0fkxJERAVALM35LI3ti
 oeR6xRSfMEbthXJO7sCGVoc7AvAI7Fi54Gc12jW+s8nQRrIzP+xTL3/64ImKGiCVfI8i9XtzUnb
 RPs47y2gbGncWhIuMqUEiLasz/h2PN6XjgHi820YOwm6YTss1xT5JGxHzVGDKPFdxMQZkr+ZzKx
 7ACLXaF+NVl2ItdyQYM7D3imWC0Zh2kC3C/G2ps0yaOgjXj121KymPvV37/ClZ+0mviq9govvwL
 Ej9/wZgPdSKxX0TRLzvhTOm1khlscvG+DF01HSZQ2fLFOV23iyKD5M2I31bJzfaWeD2tVye4WG9
 PScnsXPVImiSET0EX9HMcq/q3cLIhVRD0M7fewv1lH4BCPRhtwxPAWKot0BKkBt/L4is/bOkxyx
 f//SJ2fgJzSeNQjJoIw==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5aad8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ikd4Dj_1AAAA:8 a=gav0J8kFgDfseqtY68YA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: xax0nXeeOIiYaxNE9nxHw1SboxRoDKaX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX5+O39ZiwsLLx
 TT9QMfR7gMfBemYXTSRTSMrTmzBVYB15Jo1BzHQQCftXd3U2dBU9NY9TBSP5M5a1ZZnfKI5Z3Sa
 hPYFdPLtkSgxm0cf1z7/Qd6xFXu5BPE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155729_735238_CF7A2CA7 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, 24 Sep 2026 10:53:10 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The two decompressors duplicate this call and the next patch needs to
> change the argument. Hoist it up to remove the duplication.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

> diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
> index 4b76f74c56dae0..960a542881d875 100644
> --- a/drivers/firmware/efi/libstub/zboot.c
> +++ b/drivers/firmware/efi/libstub/zboot.c
> @@ -92,9 +92,12 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
>  	}
>  
>  	// Decompress the payload into the newly allocated buffer
> -	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
> -	         efi_stub_common(handle, image, image_base, cmdline_ptr);
> -
> +	status = efi_zboot_decompress((void *)image_base, alloc_size);
> +	if (status == EFI_SUCCESS) {
> +		efi_cache_sync_image(image_base, alloc_size);
> +		status =
> +			efi_stub_common(handle, image, image_base, cmdline_ptr);

Just go one character longer!

> +	}
>  	efi_free(alloc_size, image_base);
>  	return status;
>  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
