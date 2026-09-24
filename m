Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FDFC9831E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9PcR8NFrOIy9vv4YM5455rzYP52o3XUD40f3EQnXHw=; b=P0OEU63WGnNr6E
	IWNhFjlnDSFNnAvxizS58EfHHaA19eyP4QSOfyFhgVetfh+1xbX5e5PtyfH1UC0wvjHWvRCdlTRlr
	zKXWHH3TWLI79gtc4gRsUONS4wlmgREZugJw+erL9H0x5e0dTHJywVptiEGAQuobF47b+2y8zIdAF
	GykP6YcWAGovNYJy58kwo5e3TzBfbNt1J54JnkB5qvYhh9sEXsGY24/FfFuB4p8yKaJrUfcsKQvZ3
	Jja7bWNtgFKqvJmgkeymVW/lB9omRkjCQUPoflG5LMgHu28b9DQFqcIAGHYrwxdZ0Vn/yjUo7GB2E
	vyh1BOo0C2PW8wHwTaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s9L-0000000CJ7g-4672;
	Thu, 24 Sep 2026 22:42:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s9J-0000000CJ6H-1Ltb
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 22:42:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOrOd280380
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=; b=eaJiYBcoVJ7qevSl
	dhfq+tXf9Yrht/mLq/jwiRTObIgOPPAp4gq7bt1mDqjTW0V6kXIW+8178jTvvqEY
	/g72Tu5uLFr9TmxDOZ/WTOw4Db3jptMoLUpu03x0RYDq28zhhqtQH8+V6kNLVLAO
	1Ua+MyDrNoK2wgREaJE/EZogzihYwOq1s6HaLVkWSmzeuJh3HKsCfCtwvHP6+Jd8
	ENol9vchyHUhmq3K8SCqt3P2t3zGBv8XLggSyAt3yjEQk8zBoVPz6YK9sKvOoTjx
	qeijDJMaDaBEWWHG3mt12b/Lo717uv1T508Ea2fRW/yjOhQsk+HBOm2Y6914Juvl
	Prcy/g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce782jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:42:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso426148eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790289760; x=1790894560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=;
        b=RAVdiTllE8BUDuv4hbyZXeRfJ2tJke8W0/d/cqf5YdWTqylGanmOHGg84Zg+IBXSW+
         bfVdYaROhh4qoUlswW4HTs9siyWOhEpzTeLhpHHj/EkvSZLx1r6RDbkbKpunklA5duUO
         Mj7Tvp1lZMAwx8vLZBJ+hMO2wEfvNm91uew/qME+pJjeDs5JncPPUrukbEnq0VN5UE2b
         /gZlCBjmxcZT7n1Y7cDKSDmkkEarMi4xWECXJjrRpDIEQuFjr7ZiF+Bm960KBtVlsvqm
         6waHKHn1AWoE836p4kZ0v6AZY0H8L+2RrQYqrDCXM6ktOqFuuUzorHRIEi7bpR3edifC
         gf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289760; x=1790894560;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=;
        b=tb8iyCM4MimUI2q7Eo9474fL3mWCMwTv/AGZTzjjFra2SFxtwqqrSxvprgJbdPgF2A
         1B5yflG9p28oNRqW4UdQfaq/67w7u/SmnMKHV5Xys6kUazwzg8IOtBX8ZXYx1ydKja5b
         xgYKmDBlQPyThkw1Qrl9MBJYWYRgvJiUTlR3Baoq3mu2LXk+C7C6D2m8DtmgU6+YGLUE
         xC7FDECGBMaRtjJiL1XnZcmPb4tP8egXjLgrtHViqsAyLcbgwbWb3MOoA9PDZUhWH2s8
         hzZsRh2ull6z0dZ3/TTfvdVSsxVuB/8Cy39UhNUOEaFb1W2OmwHEG1ENRbJJdzs48+SE
         s2UA==
X-Forwarded-Encrypted: i=1; AKwUvBz3BnxE46Wb7IuwahQSxyhMRaipTBCLyijINdh0isY/8YaWPa17Y3IXJCIQKAqXSB4goNAu8W+AHOYmMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mDgSsZjafIylPlcu5QOF+tLrmGQLs3vwKkns6LAEKuiafrO4bk
	+GiMSb6Xdx0n+lj2s0Fmgoteu0S1tQeo2Exr7GuLS8GxnJ33fepcM4DPI4GkVK9efThclKEjCdQ
	e4t8gkUUbThsqoDuTIv1ERL4ZO1pfl8m36Js82FHsR/t89hSjEzRo6OpmZhm3kYRN70V12dM=
X-Gm-Gg: AYBFou2W/JNCYmlYz+xGT+mIZuyXV2eHw20Xn8wBzPD7dN/NlfOz4Cf0V+NzMJ9EnGe
	UIEJUJvDi8PQOe2RvO3Lg/ZekRofNnuSv6ST3o+pRwzoYhyUQZspG9F9/KPJbJsrxVqTKjG5emR
	1KPOe2D6G6SQ+4AAyBzp4TgnbzNMmFxhGttalEb3oKqRxuLOQPxgCwQ7rPD2hWCmrN04nFW3Shy
	HnrZHJvOUwMxb5gx0ju+5OFsYauLi046bjNG0uH+XOXB7eCjudMJwp6XaImaFJJtxDIhGXclOt1
	lIe4NE3NXnJAotZucOgRVrdAMzKc2LYNOm2V9mwlBfbWw+qtrJOq1HPwHqIVkv/XklqBuXkXS9l
	4YOYL1DHAdgkxNZqkNgmvF3k5jJfy/bqrFZrjCnF+N+lboi3szPXD4w==
X-Received: by 2002:a05:693c:601c:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-341973cf3cfmr121086eec.13.1790289760157;
        Thu, 24 Sep 2026 15:42:40 -0700 (PDT)
X-Received: by 2002:a05:693c:601c:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-341973cf3cfmr120917eec.13.1790289752160;
        Thu, 24 Sep 2026 15:42:32 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm1538764eec.25.2026.09.24.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:42:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:42:27 -0700
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
Subject: Re: [PATCH 01/16] efi/libstub: Fix error unwind freeing fdt in
 allocate_new_fdt_and_exit_boot()
Message-ID: <20260924154227.00001cbe@oss.qualcomm.com>
In-Reply-To: <1-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<1-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Proofpoint-GUID: KyxFWronZLyDIcIWz2Uu1-D4rrk9Vrni
X-Proofpoint-ORIG-GUID: KyxFWronZLyDIcIWz2Uu1-D4rrk9Vrni
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab5a760 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=7U2iMG9xLqzP7ZOKqLsA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX46X1tIYgCU+E
 jcqWswpfIOmTDsk5iouVk1q4c/zNNmF/Mjx+gqt7CMZzAStPVvaf8pjKGwp+xh6oo2IiFWg6HQa
 +mmAeO3YyaFLnqQRG2FUGBUbUqByT9C2EH+SbdycsMaVLS3eEKZNwJZL5xoMpYSK40UHbCyc124
 eBMN+NgrqT35CN551bxWG9qj3ORbTnxqBPIMIc9XO+pulaSaRg6c94muJZZ8qesViyNqXd48oFZ
 s5dg2NWLV/UB4E3gKpXYtlqt0kVAvs2TLxIDvqa7CxCYSscl0iBC6KnLJJq0BXakwW7kZQhQKEs
 GUu7OnGqcHvdWU9ARxNoTOVLfVcGbj2kE6Rxbbo7bPdnlpnSaR8lCFv9YpLVEjShVoUBP5o0QiT
 uxviTvk3zOZSRmsbImzsSqOVs7rP9ylkoFsIWMDucwuVaZ1OcBYnM8ZjWU51mjO2RiKHqtlAXlw
 CAQjgNMJQ7RQANsX6yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX96tFBzLQFnKc
 HQF+ITJSt88purbQ6P0akia18XZNQksTIzqamVuIBEfCeGyJTe1xdgkAv1D9AaW3FVYICkj7X1A
 E37SLmiAZwpmZJmkPR+8oPWd5+BDhAI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_154241_377880_36593B3B 
X-CRM114-Status: GOOD (  24.36  )
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

On Thu, 24 Sep 2026 10:53:04 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko says fdt_addr can point to either an allocated fdt or the fdt from
> get_fdt() which is memory owned by FW.
> 
> Only the allocated fdt should be freed on the error unwind path. Use a
> dedicated variable for the allocation's size so that the free does not get
> confused.
> 
> Fixes: 4fc8e738ff3e ("efi: libstub: remove DT dependency from generic stub")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/firmware/efi/libstub/fdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
> index 23b3543d3041b0..5b2dd709d7b151 100644
> --- a/drivers/firmware/efi/libstub/fdt.c
> +++ b/drivers/firmware/efi/libstub/fdt.c
> @@ -229,6 +229,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  	u32 desc_ver;
>  	efi_status_t status;
>  	struct exit_boot_struct priv;
> +	unsigned long fdt_size_allocated = 0;
>  	unsigned long fdt_addr = 0;
>  	unsigned long fdt_size = 0;
>  
> @@ -257,6 +258,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  			efi_err("Failed to load device tree!\n");
>  			goto fail;
>  		}
> +		fdt_size_allocated = fdt_size;
Hmm. I argued with myself for a while on this.  Which one of fdt_size and fdt_size_allocate
is the appropriate one to pass to the call?  In the end I didn't get a good answer so
oh I guess this is as good as the other way around.

Bug looks real to me and this fixes it I think. Give I know this code very little
take this tag with a pinch of salt.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

>  	}
>  
>  	if (fdt_addr) {
> @@ -334,7 +336,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  	efi_free(MAX_FDT_SIZE, *new_fdt_addr);
>  
>  fail:
> -	efi_free(fdt_size, fdt_addr);
> +	efi_free(fdt_size_allocated, fdt_addr);
>  	if (!efi_novamap)
>  		efi_bs_call(free_pool, priv.runtime_map);
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
