Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB2606A329
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vxP4f+nP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nbyd56U3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5KMwoop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fpgob1Hh8El8bX2hxaS2uPnMGvYpBlAyyFMWWKxSPGw=; b=vxP4f+nP1LvLN9VHEjefGjtDiT
	0dgERob2fEW53XTskV5INv8a6v7KtpfiZMog9E/B2/MyM+p/QctuNdHRGuJGSK7ev5OyMp/66cwhD
	k/kVO2S9fcSrIFJSWRS7aQbQyX11Om6pwDXtBZNp/UlASvVFmQb//OEE+x41D57fuAuouQfZwKmAP
	oXVDVv/mczvOCzTnWjRaqDEozWxg096VIXksKXXmxMVs+1A3pwQjdUbxdgNvplPKTYBAywnwCpI1t
	Eiu0NG7Z3cef8/1+UGvcQhlJ5PeOVLIl69aFKfbXmlZtktKHwSJ84OohUSYrzNR3UKGqd1DYZOGZ1
	9Gg2I+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYKY-0000000D7Vp-42lN;
	Thu, 26 Nov 2026 12:12:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYKU-0000000D7Uy-39Wn
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 12:12:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVN4X3476190
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 12:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=; b=Nbyd56U394FEcm0A
	5AK/0bnI5rCiDxK1kRgxf1EFnMIYbBSq3cY7PUvKgnv61I8UoaKnCbq8RrKN+aXI
	ks8uaHQnFddA5OkIMEdYis9rIu1wI2HANgDqnM3DeCRa72abpzzl8OW1HuiS1SMX
	Vk1VGHKKXHubEZqvkY34K4yWrGmmWcv9pk0uLF/7bnb5IOIFRwbhyhfNTtgia4Pw
	0se4oUG1NrOmXCPJbY2BuSJdP16i6y7JD6MwC7wY//6HN82MSz4IIIJF8IK/CEiE
	BanoNMgI9xXLTwPM6niduhZxslJfMkEN8NVIBm8kEeQfoDtZ2t0P4LbD+dqYP70/
	wa4xYA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhb62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 12:11:58 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b155f4eb8eso89315137b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695117; x=1796299917; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
        b=A5KMwoopnM3HPQRNfKQF8GgMp/JDlL+F79r9iL75tJ2JZ29vavIq+VmcwZAH+jgQBT
         qRnHhRy+BpGIu8w/lQq+0ySfFKzxsMNqyDdD/AZGAoWCW2v1ZMQv659HHASmCNQPPfoK
         LS9hAQCA5ZegTBZrU/AACRVUqI9nasVVQto+DL7jKZqy8XsB2xB0GYofuSL8IUpCCTW9
         0WfymphUbA5C+uDeYDUC8fRwiK6ecmZaNFDNtzVEx18GZ6/Gs8MvMkMRN151R0TBkjn/
         1QvalrlXtnwWoT5k8ctF//XGAfbwxYUbdbBSM0uQ9/7yf9B8JES8ZwfVqJs2fhEbOS9/
         vO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695117; x=1796299917;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
        b=U4W6/kkx17ej2qyRQsn4OAXNUM1yw3fZQxaYdnJERiKZFJUgfP5R9iHFIb4OZWBtvj
         v8DRhXAusZACyNq5jUf4wExmC+ZhWkZtoDpkuoxVXJ0tnrZncKkELmBwoO3L4Zt1ecoy
         9Ityvr7hRcMCcGObXecllABdbNIq1g0Tha26hRl9qD96lrWtkULOHfl9uKzHcXCqVdiZ
         myaTImKMJeZY9JOcsUH/upAfnSJpjp4ZhKKSvq/enc6nljHLYZu0S0PeBqj7dB1a5EBF
         I+P0WwD+XMuB9TcHJv65hK50RmJthsHOIecsv+Si0hODX0HBjr66QGHD3T8gaUfVRcn3
         t8Hg==
X-Forwarded-Encrypted: i=1; AL+hErFSGNhGbRXNoCwkfjXkDQwmqBzCDibDYQr+ef8EgEu6mgxZRI5H9qKAGJufDgYiOAOtRgZw/VrbJK7ktw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9QDFayVYEFtU4xA9ox5CZ8plPHbZVKNgghGgkEM/0eEXhOJ1CM
	1fwJqLvhJlM/6/VXnV2QdE1cU+Xka2NHNIo9hWfnsJC0f3lxpH4MklHpKc/lny5l9ZMFnOHrut4
	XfzJ9+Kn1FOJS67JPH9xOYszvbrQ4U8YesUnRRMwcWnhB9/ClRK9FHK+ar8QCdhThZfzywOA=
X-Gm-Gg: AZFdTZcgu08FaR/OMj+fXJZjUqo0HcXkn+xETuC8CkVbowTfQLqu0xLBVAQmzIv8MFC
	UEIq2i99X4ZzNjX/Xl2dYDYB0Si/tTzyERB/+NjYeAe4MMtbISj/+V/twsp4NMYmUcDVC+x92IY
	NkIMMZ6olMOMOcOudA9mBQNO8MoG93KHlCvZ329Bwrl4H6T2CZY2m3GOYCjwl9WMDjRQqPqcnmK
	X68bL7jCkJv+v08qS3d57u21zzGbUjS1C8Kr/SqFiR3tSKfmVPszdWK+9+IIb5nxGIllh+DpZnK
	RsYhiteLXd7KXu5tUDZwES1JGBikgoVnsGFetaCss815Tj8yYjU4CUJRt0qUgTRgrGvkx9YQhMh
	albSQWKCm2GHC5K0X2FYRmtv1bxeqqq07/xqco+69ngVE2lD8ccArmLU0hpgZi7CcnSeV04BjTr
	Pzs029G36uWQ==
X-Received: by 2002:a05:690c:e3cf:b0:8b5:6bf:c396 with SMTP id 00721157ae682-8b52051dd1dmr79066487b3.67.1795695117095;
        Thu, 26 Nov 2026 04:11:57 -0800 (PST)
X-Received: by 2002:a05:690c:e3cf:b0:8b5:6bf:c396 with SMTP id 00721157ae682-8b52051dd1dmr79066347b3.67.1795695116506;
        Thu, 26 Nov 2026 04:11:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202cb0b0sm85825557b3.23.2026.11.26.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:55 -0800 (PST)
Date: Thu, 26 Nov 2026 07:11:51 -0500
Message-ID: <da5af153e664e882654e7f6068ea7105.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To: <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
 <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX8ugh+CDPDUKz
 I4WW5CHxOFQdFVjRKkgjsFXxjsX4wINqEME8yNqsPkh7jXYIAAR5zgDIgbde86PROJ/lAvYsoi0
 ggSd/zuKrXlhWx8+10TWzTdAvfGqorbY3dVhgSweDAZxMjMr757vaJ4HDRwskt6XPypGT2XDtYy
 Ay+CFbuMTAH44N4L5YEja8sfIgcDSrN0geZmBL+B9iZCffQ7IeXi2JDtaKoLIYO63jryncXXYYE
 hPLSYeVkI2d3KI3yXYOiuHYOY4RefJ5wbjIMBRLw98Sfi7aXBHvOxZJaB3AXepIpdAHsUuclj5s
 kjZbitYjl1PG4UkhMLQ/JsiGb6lPKL/R4TxiBfh26fzr2dsbXcs+aOvEbJqMNXro1BbdsyiX/7X
 MlLZb0ijN/hHPdMuquVsEyKmF6CvBg8PImnO3SBC/2UUYHaWH5z4UdE45t7MzgJSXTCRxthCA68
 j/wmvTXp1XzDToKGw9A==
X-Proofpoint-GUID: g4VrLxHnCAqZTwQGb9sphl7vIjQUA8Ez
X-Proofpoint-ORIG-GUID: g4VrLxHnCAqZTwQGb9sphl7vIjQUA8Ez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfXwErazjC705Ra
 PLO9g5VNt1EMOfG7aVbUqCFhNz60Je1Lbdfny1JqPBnprMoHi7qG5I8flOeSz9HCEFNmPPPRucD
 hda3uPskV9bbWf7nI+iqVrRQ9N0p/+8=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08220e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nOXyh_yiW3yAi_GNl5kA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_041158_792886_BE676F38 
X-CRM114-Status: GOOD (  23.49  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Radim,

On Tue, 17 Nov 2026 13:09:47 +0000, Radim Krcmar wrote:
> 2026-11-09T07:47:36-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:

[...]

> > +static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
> > +{
> > +	int cpu;
> > +
> > +	/*
> > +	 * F, D, C, V, Zicbom and Zicboz are RVA23U64 mandatory extensions
> > +	 * that the kernel enables for user mode only when every hart has
> > +	 * them, partly because their enable bits (sstatus.FS/VS,
> > +	 * senvcfg.CBCFE/CBZE) are managed across all harts rather than
> > +	 * per hart.
> > +	 */
> > +	if (base == RISCV_ISA_BASE_RVA23U64 &&
> > +	    !(has_fpu() &&
> > +	      riscv_isa_extension_available(NULL, C) &&
> > +	      has_vector() && riscv_isa_extension_available(NULL, V) &&
> > +	      riscv_isa_extension_available(NULL, ZICBOM) &&
> > +	      riscv_isa_extension_available(NULL, ZICBOZ)))
> > +		return false;
> > +
>
> Looking at the condition, I feel a bit uneasy about code duplication...

Thanks for the review. I had the same feeling, and I agree. I had
considered moving these host-wide checks into a static helper shared
with hwprobe_isa_ext0(), but ...

> > +	for_each_cpu(cpu, cpus) {
> > +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
> > +			return false;
> > +	}
>
> Could we avoid the isa_bases here and just report the base as a function
> of other hwprobe bits (and the awkward PMLEN)?
>
> I think something like the following would directly make use of any
> fixes we apply to the detection of hwprobe features:
>
>   static bool hwprobe_has_rva23u64(const struct cpumask *cpus) {
>   	/* IMA extensions are required by the kernel. */
>   	return riscv_have_user_pmlen(7) &&
>   	       hwprobe_ext0_has(cpus, RVA23U64_EXT0) &&
>   	       hwprobe_ext1_has(cpus, RVA23U64_EXT1); }
>
> Where the two RVA23U64_EXT are hardcoded bitmasks of RVA32U64 extensions
> and hwprobe_ext_has is tweaked slightly to accept a bitmask and return
> true iff all extensions match.

Your suggestion is better. I will take it in v10.

One small concern is the two hardcoded masks, RVA23U64_EXT0 and
RVA23U64_EXT1: a similar exhaustive list already exists in
riscv_set_isa_bases() in cpufeature.c (patch 1). Merging the two into
one source is not straightforward.

Then again, RVA23 is ratified and the list will not change, so that is
probably acceptable, unless somebody wants to avoid even that level of
duplication, which may not be worth the effort.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
