Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E70606A31B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 05:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07bxn/jL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5u+X6ID;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcmaP4HT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2dI6CByiSzQL1MM94OfRcU06Nb9Bfo/bjYGaGZL3Dr4=; b=07bxn/jLrtFcyH3zq8Sziw/Kko
	tIlD5jUX4eLPRwF6JPQU/mnks/Z5kwqcDEQjKEnlP6B6Vfx0ABc/v2f4QSEjAHe/Obpq2haRPYqDY
	8cdnaZIsqtmCteeGNa3g+AChz3RYCIqRZKUVP7+VSvhrIn4M6p89AuokRCKgmzc3TtHJIew+U/SBs
	3Ce8JxXtsvbzdBirSGZWeL/eFddqH/CQ/79A596i84Lz0xpW/tTFpV6/SJAtNijAYz5h00K06HYfP
	Y22FuLLBG4ZOU948t4AUX+LNRSPTTssb6AeLhhNUzo8LSLxIqiquOtKsszEr4k3MX85u3xR0SnTBg
	r41FNETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZnM-00000003mSQ-1yeo;
	Tue, 27 Oct 2026 05:32:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZnJ-00000003mRp-3ckT
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 05:32:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F5hS1421286
	for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VpHSucyNN1LDa5ApCaatg77B
	1Q+sqWuq080vIR/b0Fs=; b=S5u+X6IDdAqSFMJ/sWFXego0TywOvH3i2WaDBwXL
	mfDX8VulUGbMrrfYuEcCZ1izjFgzaIrtWd9yxtNA0qeqD7VOsM4ia5hN2HGXcOml
	uTQb9ugVR7xpwkYbLrCl6fiksvHkkO3Dd5ubaWPUyuxgkBtpIiw/h/Di7Lbko6as
	j/UPCPe3ww0utvfbRS54B5/lukNbt4BfwSkRCc6Yr4gmm9g2ggWG1idnUE+APZtG
	OHifiAhrl9MpdF6EFICaQa9Ufp7aMytkMHUCmcpLhjgnZvisX5hrbi6HSsSRWE25
	AksywJxYyO7jNCA0Y1dQSI6nbsRFx2rf/pb1AFANpAhyqQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf3w8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 05:32:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1680246c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793079139; x=1793683939; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpHSucyNN1LDa5ApCaatg77B1Q+sqWuq080vIR/b0Fs=;
        b=DcmaP4HThezjpsXo3vAHcJVgXrD224YIFaN6lJ9+ROlP89BlaIuQ9G99lKrHs7m5+B
         oz4mzTFpCY1LvkxI7onUIGYyij6IdqtWr47pKM9a6jwkZO+hpCZm5eMIxMTc1cux8Jqx
         hDKAIPTO0iGbIiqJcPdgATDoCzJas65vIamOpFAifPKHs6V5tRHM/t/3pBdgcmOzWNhM
         ryJy5IxtMvJNgZmh7DmiR1kpaGBTq77HLonzpLX3VxTg+yWvrjMPSvu55DbZAC8qGLls
         Of0ZQDRNr5AbCgk+mXHJBe3YCoHLR/HnmXAjGS0SDlquzDjR+t1eEYf6Wn5tRCvz0Ect
         G2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079139; x=1793683939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpHSucyNN1LDa5ApCaatg77B1Q+sqWuq080vIR/b0Fs=;
        b=OyPRBim+2OuCUoT2j7KWg+uFSJ3oHmGdNVaoZja3y2weCGm+ORP4Jpm1Zo7mA1v30f
         CT3S+z2mncqLnVnF4Z4yuF4nqIfAFDh8zfJBbswRHpfrstdMCLNCrEPLeoAYC28wc6fM
         VNixwA/kRInkpuTin3s1/tw8pFYWGIEXgc71TsaqsZUGujZhCoQ6dvu/bWeWqy+n+pl3
         w7oXEtn0lpRAlteFVfeHzpp2tOJO26Ec2+n70Nkuf5yDRggJupfe+ElmyCMMxsv86Nom
         PzrK5/rpaMcJdm08Bmqm9iVgHjrigT0i9UZnmnsSRhZQKLEf4UUw1Zk75PBAHvg2G1T4
         N3jw==
X-Gm-Message-State: AFq9FYL3uLQe8YX8esgrfVZ1eXGttW3GgJVGSTQuOgPP4pExeOOtkZJu
	4b3HzActVErEKh+0Gd9kAPfbZlB3BNWV8gkDVUacCFI+Hq9AmFZDWQLkL3HkKLkrhI59qgSQPmY
	/64YCdncyS15VM6CYBJonbjwMcRfvd/f8zlDyMdKE2MHQ8fm1oli143gJFIC3yVTyFK547RCxIm
	Y1HN8=
X-Gm-Gg: AYBFou0TcHCSyvqUROzx21oe39yAafWouRjWnAsRP2ZeENtDFg0Eq/PBu01cgv0SrUE
	csamKOnhrSEQRsoYZsIvUHFc3fIcHS1klXJL60cmr3aK6heqxnXxDsn60+NLQoJBvM7O/T5gtN2
	DC5VA3dp9ye4I5QpwCOlSo9VVr2lmNwYbcesF3hSKQJB6LbNY6xKoqU+NvIvWByLHooabbWhmIn
	HB4nKU+kRbLH73azJHRTm2JDxUKfl+X+56Qpf4iSMYTmUlh7k/32h25DuC1wmxeSh6t6B68/dyk
	czKMcu1Nf+snMoxR1LdEyYKTwNu7w/LEr5E/XkbB0Cp7bG2rqRzRoBk1UvTIVj++07q7QG7O3Vs
	tlOzxfEiAZIu8vpmWTe1WH5rq/Xo/CYxN7jVG73iwsXFM//+LIir66aI7v3IbVKYqusz2Bje1EO
	asH6X78pHXe7UY6booBNSbIPA=
X-Received: by 2002:a05:7022:68f:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1a4c892b30emr987458c88.15.1793079138430;
        Mon, 26 Oct 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a05:7022:68f:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1a4c892b30emr987444c88.15.1793079137877;
        Mon, 26 Oct 2026 22:32:17 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a37c88aasm27316225c88.23.2026.10.26.22.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:32:17 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:02:09 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        rafael@kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com
Subject: Re: [PATCH v5 3/9] Introduce a new HEST notification type for RISC-V
 SSE events.
Message-ID: <auA3WZf5rLlx4Lve@hu-himchau-blr.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
 <20260924073714.1650588-4-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924073714.1650588-4-himanshu.chauhan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMSBTYWx0ZWRfX7TlUHsZQZyMi
 /OpNXbfkCM335DwnaSvutfX2KpawxJbKr2oQaI8tRvSgQWSnrKtlhc1FZWR16ArTdEak/CTBt8u
 PzoppKr1jDNGUbg9xWF22nXG8bV2Wio=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae03763 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=wNwvQHF-ByPSNzcBtQ4A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: g0ofOhT5Y_BmcmXCuqHuPTOTNXvGrLX4
X-Proofpoint-ORIG-GUID: g0ofOhT5Y_BmcmXCuqHuPTOTNXvGrLX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMSBTYWx0ZWRfX2GKe71DQtzAq
 zKpq7YwgjiNZ0HZysOA3Yl/OGOeE8m/na8P8llk1Nbk1sOt+1FlCBws2VfG+7WlOhWtiQQohAeF
 EmGYiZxWnCAxG1zOGlu29D3Wd+R2/eRzrP43uwqXwl20jQYZWlV+0MULOJzMUGji1W9cpr+6Wqz
 rC911HPv23ecZNeMr0Mbw1nxf1/AtpmLhBRwV8aeHKP5QetPWPHTM3nYoWKw0CtnwYmWGZxWcJo
 C/PTubgGdgv64XC6J+hL8wO80OAQns2s2Xh1cJd2JCDTH/dmefjZnw4b8ASDpqstmxtCNDfvsp7
 yILwh9mOZc0BPcGsJ70+zZlckROsQzxoRW055GeTln42Fxp73TLnzJMC65wDj77LJ0D3LBOMaYT
 BHvbDQCFfSDoNpjQ3+Cwb9sZuzNHCkrOQvaf33xwalWkQ410fXzkLeNjgXcvOJ1gkXfgVGcuMv5
 pWFmfT2J0pPyLhBiU8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_223222_045384_A66F4982 
X-CRM114-Status: GOOD (  18.80  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 24, 2026 at 01:07:08PM +0530, Himanshu Chauhan wrote:
> The GHES entry's notification structure contains the notification
> to be used for a given error source. For error sources delivering
> events over SSE, it should contain the new SSE notification type.
> acpi: Introduce SSE in HEST notification types
> 
> ACPICA commit f73f39352c1170464afe812cc96b20cc9db1d822

Hi Rafael,

This is merged in ACPICA. Could you please pick it up for Linux kernel?
Once you do that I will drop this patch from here.

Regards
Himanshu

> 
> Link: https://github.com/open-acpica/acpica/commit/f73f3935
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---
>  include/acpi/actbl1.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
> index d824838cb7af..105fd51f83ec 100644
> --- a/include/acpi/actbl1.h
> +++ b/include/acpi/actbl1.h
> @@ -1798,7 +1798,8 @@ enum acpi_hest_notify_types {
>  	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
>  	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
>  	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
> -	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
> +	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
> +	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
>  };
>  
>  /* Values for config_write_enable bitfield above */
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
