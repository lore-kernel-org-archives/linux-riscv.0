Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F128C9831E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 22:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5tS1YJ13qXclQ6euev/qHEU9pWgSQc8Zr2ICXpc6hI=; b=GDsrH/JF4AHxeR
	87HX8O7CyVH1NnxqXDtpjv/AW6gbw25JWh3vJUUWaLGin7YYku6lhZdUgOw5YgOZD25TJuKKvnJGX
	VWkEfy/w66Gugn5I7AbX34RZxWbtbT4yi94M/gqDjMal7aKEeW5bC0ebbULcOH12WfuNC60Z/Opb5
	vMeCp2ci8gZDFpw0zaYAq8v8zeSIAlHbFuJrgXHlMn6YqIjNaPUHyvg2USbkcSED0O73GbOdXxjJv
	vYjNDQbc+ZddGKBhLxsC1x+uGjuEUU/O/VXKrpILlicqbbYVaPOyE8d7yWR7DKTIUiVAQuU4xLGiD
	/XBy2/EqwOi64Ai2yrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJa-0000000CKQo-0Rq2;
	Thu, 24 Sep 2026 22:53:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJX-0000000CKOV-2aCD
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 22:53:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPDhn3339618
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=; b=ezYnMi7mMpeuODcw
	+WiLkeryjucsr3GUsliA6Q/qo9TCIvd1SSF+jrBzrQsbydlvqplcNShv16zQgQxI
	MZGRtlLbh1SH7v/AkrkJ4rsQTrubeuk55FyS3UYZA3e7Vb0jZYtOfaHJsc0CxZih
	etk7fMNAWWFGjHVbtpCZkh0C3smj0TUga8KPoHo0DhbMcC5s48nWQxTTlwwPM23X
	QjeAe/CIUE+1ffljI8bI50OGKNhfgBFjYbh7Tg1yB5i7NO5Vh63G1a/eoj//OtUr
	RfEUshvbHxlSjE1ljTH7HJPpxS/ad+gFcAm607wb7wN25GasXfj7gfZwpl42yLDA
	g5fLXw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8sy73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:53:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso430436eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290393; x=1790895193; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=;
        b=NNCz6faeJ12TntL+LaA0kLGk+lKgUHkKxRUf1Mj8SwiQ4aPGdyLJ9OvB9LmnrPVfhl
         XxJm9ruUErbOCpcBA537Tsm2bMVdAYyjXit+9poUy2i6CzneexiCIwxE748LQMK6UCyN
         BCf/LCchs6zpMaKT+QkHzz1qDJuvSxbpK0H4kXFDf+yl6B6KfpWQG9EAAfVh9AgSinne
         MiHLPEMtTvEJBFHXff9glzgrJ2Bs7R6pT+TDe6pTTVLyRbMe98eZwb460vBezU0CCc91
         F46RjwDPGNA+ZGRVExV/UjNvUCExaK0y0RTOZ0Q9KQx+PuqI/+d4235hoIfiweX0Bez4
         oiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290393; x=1790895193;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=;
        b=qAzpTNx/CdYfpBQ0V4qi3cYAmp/5LYkQLyCuFo3bmPLpeq+cZ1qVEQVl11d7zCV0z9
         N6DWc3RiXkJNV78Ho6UvN/mIIM4LwBUqD2YjRWLjHFASsCp8p4t7KDeQ1+ivoOdWGqrD
         F6202iIgmvnVeF79h1ku5NTc25XycJF/4v6ION0rcHS2K2F4N9JK4eGirZT1pm1shy8P
         dsy6Sh8UOvFu7moZWOQxmifKlr1xzHjJMkyHWl6IelWaBkdHXpNwwZdEaXIGNMueY2NM
         QrG4vp8bFVkujtQiisIT1cKgNwUs4s0mR7HRwnqq9Hjn5HIukgvcAFXADbwDKVqoLQBw
         Cclg==
X-Forwarded-Encrypted: i=1; AKwUvByx5nedeplnfH0nzIxGm4cYoCBMk95rQoEIo29ECa/ocOyMvpGFwxDapSqW0KkJjC5cYN6kanyaeQ7RjA==@lists.infradead.org
X-Gm-Message-State: AFuF++kHJ+9wa2Ht1d2ob2pMj6QDJuX1LOZjtLx/pxL6TpYQA5NpEFex
	jePtzHxR00LIKolMsmRSdijcp2bDsQduY9qth+dzQKAl5bHTjKD8fIhEW96wbQpbQz0hhnraoqZ
	/TPjnTUx7IxSYYX7secPrALtpy4u5PEuX0pAaDp0MH2iEqXXKJzjE158gcwJATERHQa8Kvtg=
X-Gm-Gg: AYBFou0+/BLmBBKVtXWl8WLWNeijxn+Ov3R7lfCpWi1Res635AHfewyB4xG9rVILCNI
	J3gCloBjc4r8hzshWNiFz/oARcIZkAZPbs5ASUYz9+TKkiln+dXZK3jk38WjjuNAjOqMBxfEtKB
	nLmyDeMQ06Ub+FiQ/cotrGltDKwf3LXJPF4OTXLV2WwnCCwepFXtQTPXnTk2FRCw2Ogm9wVeAEh
	eQb1i1X81ZNyDFeRRZ9XfzEjWGWCQPht4xwznEHiiCrnrI7OAryHpl1kqq5NxT4hod/15fZ+Ef4
	NLwx2Rj8a1cmNVAekQhUxuBRsUESP96/mifacADxLtbHPNEpVKChKxdWuJRr7LY2yvAK6YC/izs
	QcwYo7H7nLW8vFw/JSj2q5qHmyUj6BkdlD5XtZAsQ3GTpSI0hdFCF8w==
X-Received: by 2002:a05:701b:204f:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-14503f966ecmr3398059c88.20.1790290393253;
        Thu, 24 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a05:701b:204f:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-14503f966ecmr3398015c88.20.1790290392489;
        Thu, 24 Sep 2026 15:53:12 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm1524306c88.12.2026.09.24.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:53:12 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:53:07 -0700
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
 Shuai <songshuaishuai@tinylab.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 04/16] vmlinux.lds: Move DATA_LE32() from arm64 to the
 common linker script
Message-ID: <20260924155307.00007dfc@oss.qualcomm.com>
In-Reply-To: <4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfXxO+4VI+l+cAY
 X/Wl4PrNuQ3jKzqgED7ahxzxosnRRkUei2+3efa9c1MraP/8gVs3icWhtQgDM/s1fTtj8IQzJHY
 wj/P+uoJgzgtlH6VIfAihiswh8KFK3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfXzPpECG15T+P3
 PNQ1tzS3zJQvwGMZWzoFuQCVmyIfdSDZog/KYDHD5PDIgcJGyX4mAhA3Jm7BbLJq453KdP446CV
 Cn1+sMzftn/GjGLNVN4uTPBOpvLUHq1A9pG8NObMUhG/UTxJCGhKh/1FpedWEFTCdEkEHnhOS9E
 ulPJpizdexmca1QQ/D8pgzwxdRATgFfoQGBuMuGJ0ulPoYYUoIYQeknGvFLHrUxdJOHsJLsq24k
 UCSVEv4IiV+IrrA3FItiZWwxnfgGBM14Ci4g0rcRsT7ZW7o9zJl4pIvt4hmuP+BeI6EWIU9kD8r
 2r/bGjpqq6mGi2DwzcrCv3tX4Uj99KmmtUro9lnA7lgROescDWJumz8lOXNSlBwnKsz10RSJkLV
 iTTF8taiy3jNguSAC0Oex+dQyaCBTGzQ0FBQVJZ+/IMcJInyG9/XCsIoY9xRbUoDO9wtLh554It
 APkUi2tQmWOc1+Inp0A==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab5a9da cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=Qd5iYfxjV735tpeAhwAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: lMQvPgSdqeOwQkfUHGvCRx6zc3fPwuPZ
X-Proofpoint-ORIG-GUID: lMQvPgSdqeOwQkfUHGvCRx6zc3fPwuPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155315_863876_1942D30C 
X-CRM114-Status: GOOD (  23.87  )
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

On Thu, 24 Sep 2026 10:53:07 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Other arches may want to use this to get consistent fixed endian output.

You will have to grab it quickly!
https://lore.kernel.org/all/20260918145217.1669-10-will@kernel.org/#Z31arch:arm64:kernel:image.h
drops that definition as part of ripping out arm64 big endian support.

+CC Will for awareness.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/kernel/image.h         | 14 --------------
>  include/asm-generic/vmlinux.lds.h | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
> index 7bc3ba89790191..1bff6b061b6cab 100644
> --- a/arch/arm64/kernel/image.h
> +++ b/arch/arm64/kernel/image.h
> @@ -14,26 +14,12 @@
>  #include <asm/image.h>
>  
>  /*
> - * There aren't any ELF relocations we can use to endian-swap values known only
> - * at link time (e.g. the subtraction of two symbol addresses), so we must get
> - * the linker to endian-swap certain values before emitting them.
> - *
>   * Note that, in order for this to work when building the ELF64 PIE executable
>   * (for KASLR), these values should not be referenced via R_AARCH64_ABS64
>   * relocations, since these are fixed up at runtime rather than at build time
>   * when PIE is in effect. So we need to split them up in 32-bit high and low
>   * words.
>   */
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -#define DATA_LE32(data)				\
> -	((((data) & 0x000000ff) << 24) |	\
> -	 (((data) & 0x0000ff00) << 8)  |	\
> -	 (((data) & 0x00ff0000) >> 8)  |	\
> -	 (((data) & 0xff000000) >> 24))
> -#else
> -#define DATA_LE32(data) ((data) & 0xffffffff)
> -#endif
> -
>  #define DEFINE_IMAGE_LE64(sym, data)				\
>  	sym##_lo32 = DATA_LE32((data) & 0xffffffff);		\
>  	sym##_hi32 = DATA_LE32((data) >> 32)
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index b2988aa12f6645..1786a8e4323b9f 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -56,6 +56,21 @@
>  #define LOAD_OFFSET 0
>  #endif
>  
> +/*
> + * There aren't any ELF relocations we can use to endian-swap values known only
> + * at link time (e.g. the subtraction of two symbol addresses), so we must get
> + * the linker to endian-swap certain values before emitting them.
> + */
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +#define DATA_LE32(data)				\
> +	((((data) & 0x000000ff) << 24) |	\
> +	 (((data) & 0x0000ff00) << 8)  |	\
> +	 (((data) & 0x00ff0000) >> 8)  |	\
> +	 (((data) & 0xff000000) >> 24))
> +#else
> +#define DATA_LE32(data) ((data) & 0xffffffff)
> +#endif
> +
>  /*
>   * Only some architectures want to have the .notes segment visible in
>   * a separate PT_NOTE ELF Program Header. When this happens, it needs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
