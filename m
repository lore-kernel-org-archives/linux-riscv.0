Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D19606BF0C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C/R7dBAS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9+3PrHW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZIfvINI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ROYo+Q6pLZd17TqB81I1uFuG02me096154TQUcYnSs=; b=C/R7dBASBssqPB
	ZIEZvWIJ1F1mQ90xMh+v+ivI5fjrnrPzAWwG8sd6Lc0CsDkZKaksn/JuwAAgNnhOsM+TzdGRwopSh
	vloKCB2pC3MVPhRAlHHmzPFGAsEl53Qwf91GK7tgt0C3cIgUdYx3EWOGXk8Gyo2uiSeQGpucXTLnD
	QZ8AAl9V/O3sSciFtzqE8cJCfdCDrjOPCipeegAWvVLyZsteL6oAceUhq2CEoVOSMrKOlSdxMaUas
	ISyiVCHcYDfPKoUURJMNEsfN326L6ZR0hjFKxluTxwol1/hlxntiumdFEMDgaoXIwatIgDBoptwdE
	CQE7kLXUinN5EkGh8JNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYzT-0000000CODR-3FZE;
	Wed, 21 Oct 2026 16:16:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYzS-0000000COCf-0S0c
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 16:16:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG4C9h2149280
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=; b=i9+3PrHWHdY9KcEx
	Rkizp5TA6LO3x6JHCBfisbZ0xVIII/InNbBxuEouoj5Gl5TOhuvbQWrw8eL06u4X
	qiHRcvAhNmVYdbjfFVOwPWC3tQY0bR5kWrXLzQ6N++TpSf/0W4Z9TASh0cWZS0a4
	Xr9AZ/sJJsXeg1+6ffdBlzPEUJbhqfq/9wHvJh7xsRqxJSeMNgDYFH12igwOZIPc
	9Ae4kXTrb8SAFEmNoQRNByJbkPWjKBdcjRrRz6EVRgeBw92KcZMZBQC+kZVat+X1
	ZWlx2gub9lucHtn0mdnHsO852q/e0aPYuMDdx068yiGnUphUu4BvJDEy1BXUn9xg
	8ukbIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke01wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:16:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so3243a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599393; x=1793204193; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=;
        b=WZIfvINISfWf6iXUcP0/+L3vNE6ncJQYU2EOPpyGvj6mFax3g/31Dd7/LtdxbGG6k6
         doy7HxTYRbbSlyrf/9XL8G7w7t7ehXeC6Kp5CXn8yvSzJYb/Hw+nAL+8f2jFJxABGLHO
         b8XtlQPZlAJXSHmbnVSgTedDpkyJcE2Jms2OVKmmrwFuoX6hCgXmFFS7fXOcdXZHoF6V
         DRFQe6UzmWavULBFOZkMOcoRKQDt0NYvt/wBgfbfIhFOVruwsgCEQ/4f5A0YMt01H6Yt
         i1VS6Tya9SWS4/nQqUsACOkOZMi4YOw8S+8GNh62g9OIcKc/8TrMd3KeMi8vFMXsMnao
         djYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599393; x=1793204193;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=;
        b=o3acfYl/tfp3N+2gq2UICGgVKziuxTW2GDKyvSP5Z6ezXcKklKGfFJVrAZDce1vPSH
         R/nwXVrD4PaLXwaC9YAaVaxaAoQ/mDLSbbD3eKY3Nt19CcNz2jsk1Lm3wfv6auK12fS+
         csg54SfYDbJ5wBBkRGJh6RMRgBpcduK7cfMKMn6PHfZbsQBU4Oih4veSXOkrjTB0xfrH
         T8WNZ3zLfLC7H1tq38jd8H5vSZsPer1AtFyzfnyFBa/BvOUqRHM1nkXaVSh+G6qfxt7x
         9MUfg058rmLo8mNywSVp96jc4Xs9Sdqn5+VHcbUyWkfcURBCb1QPlylaO+npfEnmfVVS
         xEuA==
X-Forwarded-Encrypted: i=1; AKwUvBxff84Apk+hL7amlxesUS7g92ZDpPw5OUVFq0Kj4w/R5d+HrwEgk8H9TA1wym9VN+0S74UMvx60EtdyJg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJFzJGJzztGkyckWO3hv2mBqGbuY68B7RaPlJRrx5GLN2afqpuD
	6LawBoklEroQeTB0SXWjaNvR07RBOUwysHjGP6bl+JrijbRL5H86voPTk7s9x6dM5z4EjKZUUBO
	fJdWpGpb6KZIH545PjIjp2YgcsrGrrCvKaX1dr8B6KEmPkAe4Mu91S0VzIgvhLT+T9RQL4XXGRt
	cuHAc=
X-Gm-Gg: AYBFou2Ap2NrrfNxd/rJA4DGzwkpL/HBu5saxDDsk2PbWGStZZTs4/RbuT/Pz8RVCM4
	sABsyRUpUfdm2Y4UNP926TnNW3KehJJBwEbiWJRCEJhUoUM485ShH3Q9xQ67//jPP8XlP/kcAfH
	RDZD4+gUYQTm/oLZ52bpEH40v+RB2O9vMQ4gTpDRTB2nSQappWH3JTaT5GHyD7R4Y/RXKT0ETVA
	XSdwbIhNHgty5/Wo5bjVmfXKLOuVCOurzl3fphUwfQMFoeDRfUzgwBo70ltX4+H3+wBuW1aH4bw
	KTjNJQLyKUooAlN+5rif00oHwHxDYIvm0NqqE9qxSwUAgnyrJvhYKnkIZQaSr0nC/km73iJGNXQ
	/h+xldKjsEqX+u0LdT0htxFDVO5UfWZFLhut7EIf6Vw==
X-Received: by 2002:a05:6a20:2f98:b0:3e2:6653:149c with SMTP id adf61e73a8af0-3e26fc04d39mr3512937637.10.1792599392787;
        Wed, 21 Oct 2026 09:16:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:2f98:b0:3e2:6653:149c with SMTP id adf61e73a8af0-3e26fc04d39mr3512915637.10.1792599392315;
        Wed, 21 Oct 2026 09:16:32 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b84b6b17sm205866a12.13.2026.10.21.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:16:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:16:25 -0700
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
Subject: Re: [PATCH v2 04/15] efi/libstub: Add a general way to get symbols
 from the vmlinux into zboot
Message-ID: <20261021091625.0000515e@oss.qualcomm.com>
In-Reply-To: <4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: OEknKiylM6lS_EhWQ5qrDgNsA0LVfUWe
X-Proofpoint-ORIG-GUID: OEknKiylM6lS_EhWQ5qrDgNsA0LVfUWe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX0z3LVy4wl7x9
 h9U8oFzN7X9FYUrRLSciMVbdB7RFmOwiQD/16lslA01jHCyKea4heZKmIcFj4dY6AfZO0IDsY7e
 3v0MCnykBG5YbA1qr9z22Ny51c2R6Ls=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad8e561 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=ah4THgOBrJhmsRMU:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ikd4Dj_1AAAA:8 a=_GvItbcUg7J-DuPKX2oA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXw2ilTAZKNPlL
 5alsUKhMeRrsoxBktVPYq6dPrRNBB3Et97JTNioEF1R+eUybIyFl6ZNXH9f5Btvg9TxEP3Up7No
 4mbFLyQt+l9RUl+Y2CwSTbfA34Obc5S/VbQ9daZDf4eudSqjUfB2GX0gLDZLeCORd4NtAINZ2T8
 4J7WtzHRLIzLcz/63SoWrQuh0s8DzRBU/SBDwG37nJ1u6Jn4HpZdq/MLsZQG6TPYf2JZy2JFNGP
 sromjz8Z/oBhx0l22mTmKO+Da4rgsBmy3SyzZVuYaV0xgGGAtub+cXnd/StlVFqWK2pu9FZNl8u
 Mj7BBLttVmIewK6GQbdyeTBOUvzTotYG16UAPesz9ADXlnTSS9Ffy4Xd66ejh1WchqTFCBCJWzN
 6YgQMyV774kcbwW3GJXiX0H4U/t0X5PS3Jp03wwyHt1kZQTpOC5TaKMsSbr1dWQN7hIiwIwAv2C
 1ip0TBHiJlYopHLb61g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_091634_156425_EB9768F5 
X-CRM114-Status: GOOD (  39.35  )
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

On Fri,  2 Oct 2026 20:31:41 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Currently the zboot stub has no access to symbols in the vmlinux. In
> contrast x86 has a voffsets.h header that allows the stub to know whatever
> symbols it wants for the decompressed image. ARM DRTM needs another 4
> symbol locations to work, and it also wants to compile the DRTM libstub
> code once and have it work in both zboot and embedded.
> 
> The current solution in arm is "code_size" from commit 45dd403da851
> ("efi/zboot: arm64: Inject kernel code size symbol into the zboot
> payload"). This is neat, but it makes the zboot and embedded cases
> work differently.

Not a real review as linker fun is not my forte.  So just some
trivial formatting comments.


> 
> The x86 voffsets.h approach is also nice, but it can only work in zboot
> since it relies on 'nm vmlinux' to extract the locations. That's a
> circular dependency for the embedded stub.
> 
> One idea that meets the requirements is to embed a struct of offsets
> inside the vmlinux and then have both stubs know its offset from the start
> of the image.
> 
> First, each arch defines what information it wants the stub to have in a
> struct:
> 
>        struct efi_image_info {
> 	       __le64 code_size;
>        };
> 
> Second, it populates the struct with the linker:
> 
>        EFI_IMAGE_INFO(
> 	       /* code_size */
> 	       EFI_IMAGE_INFO_OFFSET(__inittext_end)
>        )
> 
> This approach with the linker is guaranteed to emit a value and not a
> relocation. I looked at writing the struct initializer in C, but that can
> result in relocations inside the struct. That seemed sketchy so I stuck
> with a linker script approach.
> 
> Finally, any stub code, either in zboot or embedded can access the struct
> through:
> 
>   const struct efi_image_info *efi_get_image_info(unsigned long image_base);
> 
> The makefiles arrange that both links have a "u64 __efi_image_info_offset"
> symbol that contains the value. For vmlinux this links to a symbol created
> by the EFI_IMAGE_INFO() macro, for zboot it uses the same technique as
> code_size through the zboot.lds.
> 
> Since this needs arch changes, protect it under
> CONFIG_EFI_STUB_IMAGE_INFO. The arch should define the struct and use the

Odd line wrap as moving the CONFIG up a line is still shorter than some of
the lines above.

> linker macro before enabling that config.
> 
> Since everything is linked together, and the actual location of the struct
> is not fixed, this is all private within the kernel build and can't become
> ABI to any bootloader.
> 
> As some follow-up work, it seems interesting to standardize on this
> mechanism and remove the PROVIDE() and voffset.h alternatives. This would
> also avoid needing to pass sysfb_primary_display through EFI from zboot,
> for example.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>


> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index b2988aa12f6645..4dd52ddb148401 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -83,6 +83,44 @@
>  #define RO_EXCEPTION_TABLE
>  #endif
>  
> +/*
> + * Architecture specific information made available to the EFI stub, see
> + * CONFIG_EFI_STUB_IMAGE_INFO. The architecture describes the data with a
> + * struct efi_image_info in its asm/image.h and emits the matching bytes here
> + * through contents, using linker expressions the compiler cannot compute.
> + *
> + * Place in the same section as INIT_DATA.
> + *
> + * The architecture must also define EFI_IMAGE_INFO_SIZE to sizeof(struct
> + * efi_image_info), and that definition has to be visible to the linker script

I'd wrap this to have the whole sizeof() on one line line.

> + * before this macro is used. Keeping the two in sync is checked by a
> + * static_assert() next to the struct and by the ASSERT() below.
> + *
> + * The struct's offset from _text is emitted as a u64 at
> + * __efi_image_info_offset. The architecture aliases this location to
> + * __efistub_efi_image_info_offset for the embedded stub. The absolute
> + * _efi_image_info_offset_value contains the offset itself; Makefile.zboot
> + * extracts it with nm and zboot.lds emits it for the compressed image.
> + */

>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
