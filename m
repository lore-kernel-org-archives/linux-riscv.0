Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCC606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gmbX9jY4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppsqazaf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zj+APSth
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZjAmD3sBtRdJpTTsCECjc3+532V4IiJWLuV3aMRex8=; b=gmbX9jY4TjEwxS
	af1dfhyxx8Ff8CrNBI9tKb2x+tzdq7V8DiSJ1pkwRfaOQpFeXp1Q2s/PtzSyeVYuJWlmuvAb4M4eR
	pIh9yh+6QLbajTMVhtjyAQ3NOY0Jf8yHew3NqnOabAA+7DE4997DaaGTvSmu1HDuKEiOXyay0WOes
	zU9UvLJ4byfHdoj8Th30741xsUyD5taWZ72xxV1Rt9VvLe8WXVHCKsnoIrdPdewluytnUr63wob+W
	suFCir1Aq5yKlXFL5aLkHnJqpbZl6AjzjxPib+azsEYJ5kL7UhzYBRi6evzzMqPohPG14SiG8mkRE
	LLifGfaZZjQdD+3wjs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYrn-0000000CLax-3k2V;
	Wed, 21 Oct 2026 16:08:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYrl-0000000CLZz-0w3b
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 16:08:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU9Re682672
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=; b=ppsqazaf3z/Ovnn1
	SzWOwFC6FBH4fWPIj1FFpw1+MfbxoKTpq3L+dL3Z+e3w7356YZ6RysSOxUSlT+jE
	QJ63VeLe4fC9YoZU8/wWjZGfXODKSBwllcZGiYbUnENdNs5V4JoZtOO0xT0uHd/I
	xWphiIy5SHHmhNox7zwzrK2Vqs+UWLy3gU0nXuyduCWSyhwAtJrrWHEuN+VRgTMm
	hlzoca2KU2LPeFWWVXhGFOSPOe97rBtnG8yGmM71Gq6BNVbN2C1Iwmwrje5lGBva
	VCVasiUkD3EzsCgdmldMxwRAjdIFHG23zVG5vKxeMRaRrlso7XF2npL2q3GBF2Sc
	GdYlJQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrrku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:08:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so686698b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598915; x=1793203715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=;
        b=Zj+APSthLYvBEQq+FpUBl8LEe58GcixZ8SXmDtPsnSzBmuBbP0Gy+q9BT0M72btEW5
         GmrrcU+5rISwa6p2LAp0F15gZRavh3cmkYEniyWkgpjqduXb4Pf4tmjEPaSCS1f+Vr3z
         gs5u3GA03343425IYihj1p5Kfz+DJXXdOMh+g3qA73uZEZJFisGFhq8Kjfb+vJ5coeMz
         piR1Bm9nFcg3IenQTFO1al28guwy3cvZpQqF+LzhEI4OZnwkeuAbz3fI7FWM1E0Wczw0
         743i6Li4RZe2A8PMJbThLVzsicHEzL5MfJImmHSiOaKZEIFiowrs8NNgs2uCC2vayzAQ
         SIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598915; x=1793203715;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=;
        b=X1+FM2tYIF2WC+TZ/V+bnjEQ69NHCBxB3s3E7gp2ATFbp1jdfPml/m/vcctDB0h26o
         p19rusRGc9O84MttlLhuZAJdPZIwN/g6G8U6iFy1X4gHZnF8sfcner0sOn8jrecyqUCq
         UxITxIvKkVuM1lII9eObqnmI34aTa6RfsqwRBvxSKZ7lm0Jj/MdwfaGBIzwoJbTV03Dl
         8NcxmuuuNUYRR/LV075Og1/EeNX3UqitLePpCYNMgryGBiyq4wBU3rK78NF6ggnvo6vd
         8EofqXFgDN+DmXWuzVcNqmZx5JxRJUM2cRvs59iUZ9MOUehQsnwDPMULyEKvtSCcQ478
         jvew==
X-Forwarded-Encrypted: i=1; AKwUvBzBMMmQaZUQI1cd5adqDCQ/JznaRAxzQlCkHvJ9i1ZU+K7YlG4ftLbQXXBPkBXYimw2fcz3vicf/mEoKw==@lists.infradead.org
X-Gm-Message-State: AFq9FYI4RtJk7ku2C3wGH+4+LQgWzBYCbNSJTNTIXRtq0Io0cQ9dwQkw
	84VcKxSbHeSbUM6MlY1rqfqw1AljGQHpxQEO2O01KK4ZpwYUrSzgtimb/Mws6wY8r1H7heUzSX2
	zklvDO4oi2XL6fotXTKdhbiiygECoYs1c6PV97NqTWCqUOYmFa8ZGwVG90rz6mFyr3bwp32U=
X-Gm-Gg: AYBFou3G/Zc55MvQ7funVMxs3bU5zqWoZlDiNsSLpxbdgtaUvMpYIyM4v9yILlf3/Ex
	Gss6ICqhMe7CO403dWTd/uhll7Hiep6WCaREbETAQFzme1S8w0zCeXqLnQVHvMOjGBSAQlxpAN+
	pj6Ju3baA/RhYFBbAEcAf1UG/Fi5efnob58piTBa3Wpqh5luhFSiBRDs2GbqL6CuTG/V8kMiDKk
	CU57Q+9RJ+MUj4yx/KonC7IiZSbJXSjG7nsygHsKh8dkwJYQ/eqtz3N5nJ94+OEgfIsV8n5yZJx
	zU/tSgv4dlsvQXj5fwrpY2wSaKktrbON9Mg8lGA6OEOAD1QLgp0FoLrPISNcLt8URsASlpRRMGV
	EgXEpvo4C1EwHfoUWFmg3prF0fBVPnpPN5Y/VHv03oQ==
X-Received: by 2002:a05:6a21:3288:b0:3e2:2b76:bf23 with SMTP id adf61e73a8af0-3e287eda189mr2084262637.68.1792598914769;
        Wed, 21 Oct 2026 09:08:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:3288:b0:3e2:2b76:bf23 with SMTP id adf61e73a8af0-3e287eda189mr2084221637.68.1792598914240;
        Wed, 21 Oct 2026 09:08:34 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b861c7dfsm188964a12.25.2026.10.21.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:08:33 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:08:27 -0700
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
Subject: Re: [PATCH v2 03/15] efi/libstub: Free cmdline_ptr in efi_pe_entry
Message-ID: <20261021090827.000078b8@oss.qualcomm.com>
In-Reply-To: <3-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<3-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: fd4g_hfcQfiv4_8VQ_LnEWhZw8JT8fku
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXxpDcN3zDJG9g
 GJ+WSW2kPbyTyEnfvWs7RrlTKQw/3QSeJ826rlo+OCRqp0N1/mdBJ4dWKSpgCCs8iRE2/NsieZO
 6gByU5dMYVz46tviE+nzwKtTmgT78Vs=
X-Proofpoint-GUID: fd4g_hfcQfiv4_8VQ_LnEWhZw8JT8fku
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8e384 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=gCM90IwNaqpJe8xd-nwA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX0vh9BIQTGoSH
 8o5+1/w/9I0sa1aR/os9vc7UJ0tcvZNaFZXlaOHMyOQInV61BRuwnJageFd0rqmhr5cyLxvZQiR
 eLpRFI4iHYFsvBmsK5/Id9M1YgbtsLY5x5eNW00NBdYv8HAGg4lW3jMmKYhiha1KeUuliyyfEYL
 8xj9NcTs8G2AISZt8yEIdnkn0O41g4wDTsOKqhjVc2RjJrCqPHVy3zE6Ioewa6ms/ONqsWIok8s
 iLgAqPgex74Q7OZr5FPaq3bpaU0CCdB0ztGIb9DiZN5MCqmwnI2YduRbJiCiAC+IB0MOZv8kPwr
 b00WmL8V0MFMAJ1RoaXfZCnJDccsokqQlupJgUJ/KeRKyTs+Iz9gqmUTAYp/ujXd3PMpDCikBeb
 KDLuBBuCBz3/v7xrOS6s9bfPfBgB0DIXA0/zxbtbCzqcC8zq7iNmmiOryVg8hTR0B9f6kQVma9m
 r/xgQ+I8qtzX3Itpb6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_090837_419122_C294A7BB 
X-CRM114-Status: GOOD (  20.16  )
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

On Fri,  2 Oct 2026 20:31:40 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko points out that efi_handle_cmdline() allocates this memory and
> hands it over to the caller. If efi_pe_entry() ever returns it should be
> freed. Add a __free annotation.
> 
> Fixes: 42c8ea3dca09 ("efi: libstub: Factor out EFI stub entrypoint into separate file")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Seems sensible. 

If anyone has more time than either of us, I note the efi_handle_cmdline()
use of __free() should move down to the point of allocation.
It's only a couple of lines, but none the less...

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index aa85e910fe595e..fc1282fb442e71 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -40,7 +40,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  	unsigned long image_addr;
>  	unsigned long image_size = 0;
>  	/* addr/point and size pairs for memory management*/
> -	char *cmdline_ptr = NULL;
>  	efi_guid_t loaded_image_proto = LOADED_IMAGE_PROTOCOL_GUID;
>  	unsigned long reserve_addr = 0;
>  	unsigned long reserve_size = 0;
> @@ -63,6 +62,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  		return status;
>  	}
>  
> +	char *cmdline_ptr __free(efi_pool) = NULL;
>  	status = efi_handle_cmdline(image, &cmdline_ptr);
>  	if (status != EFI_SUCCESS)
>  		return status;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
