Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D5606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUanZhRL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBq8By91;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LZ5f+Tsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJwFqMfJIEJh1dcAHVlX3AKyndtAirxqKxO+LAtQp2k=; b=UUanZhRLuiBSN7
	M2TVi1oE/T6aJH+EWDTeS4NbfN6R6OknA3f3lkfjGSsXQAo9iPsTubWKC6yG/Ipkjt3rMseyJ334v
	jD2VU9qhX0zbwjGHeydEwFPEQvfMH5HIuimXZwECVLN9zDCyoTK2NbGbGs7t1HXeLgnyuZUVO3mWY
	urf1LZlN03DmE4qyQo5AY//rhvW6p6H3qPy79jzdyieN5ya3X+hNzUtpThgkbkaztwMTSAtd1ypIO
	hxQ7Bjnys/UKbUTaDZ01EkOguZFILqysztUOQuQ4t8QRTYiX4es7oQhSr8MEe1yV2og01LCdLXf0d
	AdJyNI8UdpfpyuhtINZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJamu-0000000CdET-0wE4;
	Wed, 21 Oct 2026 18:11:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJams-0000000CdDz-0p2y
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 18:11:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHxShP293148
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 18:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=; b=KBq8By919CR0Wk6J
	i6AHGYv1uzl0plIu0g/ZjSagDkXy5EsbBsmzhImhAELaJ/l3SfReAUQpWiSHeVNf
	BufY1pa+JPkBGkez43hmPC7dSe/wTdocSPdgRHEIkjXg+77SAdYjTQAo3aTC702v
	wIJaXklJi5pC3EQlxvgOlS9JUMDPzA8ux1CypnFa/HaSbozJtLx5c4F1YuTj12X7
	fPuROybpD306YEcuArWKV69DugzhWLf5aBj0QG/MFJEbJRpq1GRrz3FGnTg4Sr+J
	HgvYZbYSilPrBWCFEs8avj6fFE58i34cFDbduqKYWVEMlX2iQVhEPuzZodKWCD3h
	tK/n4A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q99bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 18:11:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso2793711eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792606300; x=1793211100; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=;
        b=LZ5f+Tsr7kX6LN5G10szs1ZQl29o17fBbRiBi+U1rKL+S+PYlPxlR152hh+ZrkZE47
         x8Dvos2H0CROa2wP6SUGzuPzV1sBDDl0NRUN/EVqKoESklCiVJ3xPyCiZqUZw9SymOgP
         QJ3b3N/trTNaGVTU0d8Nz+dcgCZDXnDl07Lq+/QrUIVGKYHLYv3XxauTihKDZ6YN+9I9
         l/lcFa6VEKIhlyDxHje4X2hORoJZ+jKNFhMbFXJPVE3qBKaLcc1ec1tX1ZrpYpYm8cDV
         6iw95TlNZjyO7qHE1D1KheisKX8UUpv4FMa/z9UmqD85MXuPdpL0EOSJOsQf5TX4smMp
         esSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606300; x=1793211100;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=;
        b=BHW7SYyZrSy61ttQDGLyqojqTYVDls5D/LDxEVHGq9oYTbJ1QhX+p8644mwp77PtBP
         oohML/RuEh4D6nTt8GEhRMCTCxIAvC+GsBfba9RqVPLYajfKAJcZ2KPXeYyM2FdK7+6L
         MK8K0U0IXja1c2ZeeDdiwXw59554kWSvPvrp+yMXJ77FDXEhyiFjPKhKlPUa/yEPF9n5
         2nnIq+Lsc4UCCmf8kHYo/+UeI04AlHX6l0Zqe5Ows8wK6lxCz9wS9gaNWQtlurlxN4aa
         SzVQeYDkH/rL51LKeFy9JUgq9LVa+SoIKrGxt0uRsbULn95jlLbMnIk4UrI8t8ycoYCj
         1CxQ==
X-Forwarded-Encrypted: i=1; AKwUvByE/QWcuBS8HvKfs9Qo1AkqYT9MC6Up8DIUfgbQ4d3hMBiRNIfp98hZbQI7VEnuMTVTFaIm9+drZJGLnA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKREBLtXz775nbKajkCwm1w124Oek5aTOqplVzPcfDeYmJ4ygXz
	P3Yq2T6QbliNKD3qQEsO6ZT9tIiNG04EZ2smqUJzF5bTM5JJr1Df+dAoDlEXNe5J8KxVgqTJ0eR
	5T+uBkuheYyw7FgwxPvRPFFtakfLEIH+8vZa6lQZGB+bLYJyYXt/qkXUV3NWGPS2RrFHxYDs=
X-Gm-Gg: AYBFou3wACNomfh1bubNeD9ZV6FBRwRqN5ZGt3ZGOZPiFjekLXh8gqg8t1aa8+vHyTs
	p2tnXv9V1dGlCyaXNXilwbqeW2ajqw9sJU00JFQXPNwPTI9wYGp8O4E0tQYDvMyh+LpNZ7prJ3E
	o1YVyC68lOViLJqLSOu6TP8KchYKUE0mdqfSHq1ESoWBN3oYwuwkiXKAxR+nbX+Y76nyzLrwUPG
	lR6lCkRzW5D6uSXWxmJ/aAY1ZEyGfF/+qz+ysq4A9cAYVmmoLg1jbaA6UuBmY7mlqeoitzgQVwQ
	MPjLYkckr1gDCbnlx/1lfIALVb3nucKa/DOuWrhw5khENlJHNtu1koaHH2SR3SSryAMA/KIqqje
	9rBbfQ5yxZlq75v23eBETxUW5Z5whFKyWrApZqHf9xm8=
X-Received: by 2002:a05:693c:41cf:20b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3674f21a97dmr3790659eec.24.1792606299675;
        Wed, 21 Oct 2026 11:11:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41cf:20b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3674f21a97dmr3790596eec.24.1792606298974;
        Wed, 21 Oct 2026 11:11:38 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674206d1f1sm9116156eec.28.2026.10.21.11.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:11:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:11:15 -0700
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
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20261021111115.00004c5c@oss.qualcomm.com>
In-Reply-To: <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfXy4H/oik8TBWc
 hTyVHUBDf+n856sqSSnSVWsSWJLd8/D1t+wFaCwb9a1c1Qxt9MJ5et3I0UA1qOnNljOiwn1f32t
 ZexCqPPsPtJIc2kJQDOS2IIoMsKZmwc=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad9005c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=Sk9Lk7371zlc0StAK_oA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: iEGOtqCaO1UnQq_rex79zDDUpjBXjc7C
X-Proofpoint-ORIG-GUID: iEGOtqCaO1UnQq_rex79zDDUpjBXjc7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX3IVmJXEHdgBq
 VendAFm1ijMtryLoIKZnlQlsvnk7x3jWCtjCIg91YBRjc6/C9X4h5GK/3ahym+kkfDa6UIM/OZl
 xKrONrzIZHSuKUuksq6Vvj4CXyXb5E2938IU3xPVsWwhQz2AH2ZgtQtN55exJdtBnN5+CZmJhcK
 apkGdarroonO6RFSSh7j3VVqKDJS57rh7kzjTv33P9MBGFemsgU8et/h8OHCNZNMXvOXaeu+sjn
 NUP5IXG4dNzO+pfsjOgD3xM8gCdpamE9GD/AwvbM4se3TBl59gExPZUa/TQKB4G72HJBUaSyl36
 9DA89e9YpXrmQhTqDPGV3TXeMENdbCq4Lig8z1/h0CE+qf553deDnfwT3s3hpXD3SHAcHdWkAlp
 GGqn7NuOWLG73bctqzxm5QoEkTeVHwLm9JifT29IcmqCsxoq83Ig94+Rq3Lt606fN6XTLFLdGc1
 NcsDZtlRmP4g5DEypkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_111142_344878_0B842379 
X-CRM114-Status: GOOD (  35.96  )
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

On Fri,  2 Oct 2026 20:31:52 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Provide an implementation of the CONFIG_EFI_STUB_DRTM protocol for ARM64
> DEN0113 >= v1.1.
> 
> First, it queries the FW for support and collects all the
> information. This is needed to compute the extra_size, which comes
> from FW reporting how much memory it needs during the launch for the
> DLME Data and DCE-owned data. The generic stub ensures there is
> trailing memory after Image for this.
> 
> Then the DRTM_PARAMETERS launch structure is computed using the
> offsets in the efi_info.
> 
> Finally, the stub does ExitBootServices and calls the actual launch.
> 
> The feature discovery process is deliberately fairly verbose to help
> debug any FW weirdness in the field. Enable it with efi=debug
> 
> It looks something like:
> 
>  EFI stub: DRTM: interface version 1.4
>  EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
>  EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
>  EFI stub: Decompressing Linux Kernel...
>  EFI stub: Generating empty DTB
>  EFI stub: Exiting boot services...
>  EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0
>  [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> 
> Eventually the launch'd kernel is going to require built in crypto
> libraries that match what the FW is using so it can validate some of the
> information left behind during early boot. Refuse to launch if these are
> not built in and build in the most common ones from the ARM64_DRTM
> kconfig.
> 
> One nit, if the platform does not support SMC then using drtm=auto may
> crash on the SMC op. As far as I can tell there is no way to discover SMC
> support through EFI. Learning it from the ACPI FADT is doable and costs
> about 250 lines of code.

Ouch. Sounds like a must have if there is no easier way.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

One thing inline that confused me.

Otherwise seems fine to me

> diff --git a/drivers/firmware/efi/libstub/arm64-drtm.c b/drivers/firmware/efi/libstub/arm64-drtm.c
> new file mode 100644
> index 00000000000000..2fc58babc3e7cb
> --- /dev/null
> +++ b/drivers/firmware/efi/libstub/arm64-drtm.c
> @@ -0,0 +1,426 @@

> +
> +/* True if SMCCC 1.0 or later is available. */
> +static bool efi_arm64_psci_smccc_compatible(void)
> +{
> +	struct arm_smccc_res res;
> +	s32 status;
> +
> +	arm_smccc_1_1_smc(PSCI_0_2_FN_PSCI_VERSION, &res);

A function that is meant to check for smccc 1.0 is using the
smccc_1_1 namespaced calls?  Maybe add a comment on why that
is ok to do.  Is anyone actually using SMCCC 1.0 on systems like this?

I a bit surprised we don't have a common helper for this -
I guess the version checks are often explicit in a particular
driver being bound.

> +	if ((s32)res.a0 < 0)
> +		return false;
> +
> +	if (PSCI_VERSION_MAJOR(res.a0) < 1)
> +		return false;
> +
> +	arm_smccc_1_1_smc(PSCI_1_0_FN_PSCI_FEATURES, ARM_SMCCC_VERSION_FUNC_ID,
> +			  &res);
> +	status = (s32)res.a0;
> +	if (status == PSCI_RET_NOT_SUPPORTED) {
> +		/*
> +		 * SMCCC_VERSION was introduced by SMCCC 1.1, so firmware that
> +		 * does not advertise that function through PSCI_FEATURES is
> +		 * using the valid SMCCC 1.0 baseline.
> +		 */
> +		return true;
> +	} else if (status < 0) {
> +		return false;
> +	} else {
> +		u32 version;
> +
> +		arm_smccc_1_1_smc(ARM_SMCCC_VERSION_FUNC_ID, &res);
> +		version = res.a0;
> +		if ((version >> 16) != 1 || version < ARM_SMCCC_VERSION_1_1)
> +			return false;
> +	}
> +	return true;
> +}



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
