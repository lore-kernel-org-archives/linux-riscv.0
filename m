Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA60606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHjDMjua;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GUi+svDU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kh6gdOfp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWQjp46ONAvjXbgnBlncFR+YZx6AtkD0D2lKFfXowXE=; b=EHjDMjua+cCvcc
	IpCIq0cAb1cTlgISEEeuBWLQf2RFj02qjVLRuRusyCuL3T4iVJ3BU0vQd5qTPY+ZkmrF8AyVoHvUT
	W8+B6gCr9sE/+06LFqaVa7aovzy5mOKsdYSMejKrqmk8jX4YFn1POWgLPU+4xCCnZUjGM2M9StPiB
	IldQXN8lToyCnTUjfKT2yyBZwNi2XjiQOa/RQUWeuKTK8Qpqmi3gqZtFa9fumaRyoNTINhtIgmBlP
	UTCDJgtiiFUlwi28UkV09dcTZFyMgFl6uIb68ctug/YBYT9V4H4DRY3uw6Q3SQe8JLGdS7KLABeTZ
	zdlChXfhsoqCMcFfKZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZFn-0000000CQbo-19H6;
	Wed, 21 Oct 2026 16:33:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZFl-0000000CQar-0FNz
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 16:33:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFoBLS524209
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=; b=GUi+svDU/yyymhsl
	VrHOtB1d73sBGwG7COM52idcWEEDctYMa+eF6Pt4VtlzcUUOeQtAh2n1Vsh/2WQu
	0u2tDuR/jArqfSZjo5WeZDkmKKnq5Cyx8LpPJLaBgJ14HSsFT34pk/oMJnE/QjZP
	wyw5Luv8WVqQT2T3xAGbmx03QPVfE3A+2OotuyjaMF4DqeoByKTYNGCQZF08de+c
	iWVSRHM+0Mr8/oSDoL8AAiVZP7kj7Tx91KaLcsM4HRQSlR0x5UCwgmmD9m+hLCQj
	/j5oJYm/JjLQzfXhoQU6IC244z8l/Pqlkc+kupWm84Z9ZYCfxIBs8ju/HIUwivyK
	DroMWg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv0739-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:33:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso8279195ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792600404; x=1793205204; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=;
        b=kh6gdOfpMFBioC9/R3gzzYn9HTNZPnX/LMsVluIhPbYC+WgyXfd/1rciZXyULhQKAe
         BntIXQJHwMt2sVDtK070HeyOf3tKHauKgvJnRCD5hmwOexV4OSG+wQC+0e7Ny53KWLg8
         IKmrim3pdI+grvyUGOXz9i0vP01dRP0Epu4YE5i8XKxd9F+Z9yosVGCOpF3p6wO69Z++
         v++d1fFvtyIsvHigTtNa2cbIf8qg5dnsTRjSWukiWmRWSbRTmwIfwM9bkeJMdkiAp18W
         QsatGGq3EWaSBNaQaVRR+ppF+eNw8gTulI2W7NTzkfaDNerXVhbiQEazYaBqD6Het6Xs
         150g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600404; x=1793205204;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=;
        b=lcmZxmR7Y7XBS1Cs92NuecWITC0T30OPsjpMU+qS4XOb7C+bveui/hKGF+Hxn8XnyA
         y5WVcch9u+e1mOW+m9Zgbhbpp7ahRkDTMqPVFGXL2cIZmCu5bKeQjH5zSVeYx3pOOh84
         yjgOuIIMou1kgCcp33vyhQgaGmIXlVc/ZmcD+DR3BFvvHo64yBZJ5uI0skTv6bbGgMF9
         hau+pvJx4de2Rcax+tfFWA60AVutcjSRtwA6g4lt71lMZzFbixFvfwLkQyT3xBeLTDyO
         +zuvFbYj0CXQWrZpnUi7lYaIN8VAllB2h466rTW4BDwvBbY3KzULr/c8uyYWT/qO1kPz
         AJ4A==
X-Forwarded-Encrypted: i=1; AKwUvBz24UfcAvWg0h8osDNodvhLRImAquxCC8TvmWTEUvXdr/HJntNvezZOONB0uyzUXxeQlSQdWSmXyWPysw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIfQ3KoLlzEDO8G4GRTvJss/CFZW3cP5heT2eCFCSSyJz0e1ZzI
	jQAw9+X6CF8uy/HxzEVx6qW+lWxw+jAA2V6eZo9kaGvFlO+pHQSpj0l5WkC5yvv0NfXMaRqqmck
	65vubTZS6pBHdfjdLSxn366Q9ijLeeftI1XDwrZuPvb2CxIiUkp2Te7eTg1E6z7AUYvvl4r4=
X-Gm-Gg: AYBFou0J/L9IftpOdjY3uaEd0/bzyOe96k3LKjH4jGRC3tLDzyZDpIzdixx0eoXxU56
	SfrqILcEWZlH22oYP8z4PN8RCb3lAO3LL2SUyZv9/6Q/RIluPCT8HkfOo1TWq7lI7rITkKsmMys
	3mpVP12ywq2ZqDBjUGpEMuhZKMtho8p/HkCroL4g0spXzKGRVi1DAcwbomXOo8HX8NCEjK3PqfB
	k2j1NKGp7S+OrsiB8Hjuz+ReRKWBXdGBxBP0z/bZKB0++3b9XVWnerLDW8/bDA4QVxSeW28ZgNJ
	MPx/1c+E7EZqQyojvMN+mtAiEmtNvfjY7W65Acs/szMqlZe7NIrSm1ISBKwXiC7KzaKFOqB7sB/
	6H2X8mfc1OdJH8en5flG0lAk3hFmxMrJMJQ0tOM8eDQ==
X-Received: by 2002:a17:90b:5688:b0:3ac:b185:fa16 with SMTP id 98e67ed59e1d1-3ad86ef57d3mr2257180a91.43.1792600403621;
        Wed, 21 Oct 2026 09:33:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5688:b0:3ac:b185:fa16 with SMTP id 98e67ed59e1d1-3ad86ef57d3mr2257139a91.43.1792600403107;
        Wed, 21 Oct 2026 09:33:23 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea4005a7c1sm11891595ad.71.2026.10.21.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:33:22 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:33:16 -0700
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
Subject: Re: [PATCH v2 06/15] efi/zboot: Lift efi_cache_sync_image() from
 efi_zboot_decompress()
Message-ID: <20261021093316.0000594b@oss.qualcomm.com>
In-Reply-To: <6-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<6-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad8e954 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=w7afb6Jpyl5axNu8_tQA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Wk3EIzlgXB_HllsS7eLjYYUCiOXeB3AD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX6RvKgrcA3P0A
 o/7Q1lFAxPLgfWcgq0nZTKLJt7k5RSPSuH/JWhk8IRmj/vkBoeIvXwXENt007ggWHLuxFam5D8g
 +uSZy83BzJPPAvS9rNEuNwQJ57nlUbM=
X-Proofpoint-GUID: Wk3EIzlgXB_HllsS7eLjYYUCiOXeB3AD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfXyZfABuFmLWvn
 rROzHQxHN4FjQlmDIJsCaXrg9u5m82A8AVxDyCWP3ChRiTCkxTgiIjlhv60+Llqwrsb8/FGdBaP
 h9g5lKlwgx83YUp/yCdCpQQ4RXILHOOApSnWEZ05HSATlxpAa8sOHMFw+DDsEhBZH3IALnZCyuq
 lOmMuodbs4tDS4GZOWqT69NaLFAM66KmBpzKCSPnphdDsYhoYn66NlHg+pPnx9AOmOkcpaOdY7y
 MVXnJzqmtvFj+F+iLsld6VeRmHbP1IuDwDZwgHHkdtaMNmg7UF4fZyea6EKc7R04x0sb4UxL8IB
 5HqDCshDQuK770/QMQ5zfdF6y2MOeZjpp6ZBJEDF0GmQY+j6xWR4fLCmxYVbF0DJm7hq2VFc5DV
 jM9wZ67bAEEHwoFqw+90aPAa/iq9g5MXuACKvJXl3ZwIptOdeW1Z7HXlrLDLKsuU33rRkktEU2B
 bdyRav+kzSPyZ0M1vKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093325_105825_FD6BB700 
X-CRM114-Status: GOOD (  16.98  )
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

On Fri,  2 Oct 2026 20:31:43 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The two decompressors duplicate this call and the next patch needs to
> change the argument. Hoist it up to remove the duplication.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Some mutterings below, but I couldn't come up with a better code
style, so

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
> index 4b76f74c56dae0..e3abaa05fc4183 100644
> --- a/drivers/firmware/efi/libstub/zboot.c
> +++ b/drivers/firmware/efi/libstub/zboot.c
> @@ -92,9 +92,11 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
>  	}
>  
>  	// Decompress the payload into the newly allocated buffer
> -	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
> -	         efi_stub_common(handle, image, image_base, cmdline_ptr);
> -
> +	status = efi_zboot_decompress((void *)image_base, alloc_size);
> +	if (status == EFI_SUCCESS) {
> +		efi_cache_sync_image(image_base, alloc_size);
> +		status = efi_stub_common(handle, image, image_base, cmdline_ptr);

A little ugly though less so than original code with that implicit assumption
of EFI_SUCCCESS == 0 that is avoided in most the rest of this code.
__free magic would be complex given the need to provide the size and hence
we are down to a helper.  Ok. Maybe just not worth the effort given how small
the code is.

> +	}
>  	efi_free(alloc_size, image_base);
>  	return status;
>  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
