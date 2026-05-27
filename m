Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CDCCD5BD0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qX4w9+jGh9xvyILm/SPnZDqvjzLCfxV2l0caUftrrME=; b=k8gZrsfGX6SEem
	3U/wyk38lDPmyb38N/9qKL11Nh5Hbl6cDDszkZybTq5ZFNeTq7aBtHrg71sN+Zt/qldZeJNJA7iA7
	ah0fJMrd16LN7qrW5RD+hCBNiOdY3d9tcHUHae0T8QAF4lfLzUyteDIfMS3y6ijteEtKNSNs8Ow07
	sJI3ZQNJYjy7l6VAFvkBpdIAqRRLdAwyuqEIUbFfySsPx2bNceYKdt6tWCv9TGSt8A/g+OE4UJuII
	j5z+ntmNQBHqc6mBbxGjbyfR6tRzoQ+qxElU9yRRibW4CWhiknkALdVwifkLeC4cGoeykHIuOJvPT
	7u4+3l2ovu+AwgUntrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGOc-00000004QZS-04Ss;
	Wed, 27 May 2026 15:42:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGOZ-00000004QXX-0zSY
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 15:42:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R9qxj1195636
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 15:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yrZ7fByGdAG1n0GYJXTMCaPm
	clgKYcrSXuiTG7s2eLg=; b=D0jWXAliEPaG0t86Jlq+EqqrT8IlZcnPgJ4As703
	R9IVbhvNt9posO8KWP+BJtFQ8jY7DAwrZBy2Nq9JgsuddOrHjeQJqswkdTbqJn0s
	bBPvWvxryJZXDM8S3Hyxswk6ZTCLLH7cUzb26Vnx8Adkzm/QyC/0QH9Qp/nnvgjM
	BOyATNxcOn+X2DdOyKAH5N9pofXFXeq0BSi8mOD6oZRDfu6BoZodTjRK8YQdIB9X
	/04kwDyCQDX++TLOwGPSIHtQlsqnYkAVo/cbwZi+M5h9fToOsWdJJzMPO0DH5AmF
	h/d7pa3Ly1iz0H+AHhBrH5wAuU7cI7X3GTeZQUdF9eNb+Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxce9abb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 15:42:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304950e5901so1781510eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779896529; x=1780501329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yrZ7fByGdAG1n0GYJXTMCaPmclgKYcrSXuiTG7s2eLg=;
        b=Cm/FJpKa4eTHVee66xsqFFF8bYsMLkmJhS9w3VjtW2INrrp2fQ1dgISrY2sjTGUZKM
         8cpVAD9jddQP/1VmXyDua6+HG+FmiwP1w4dJ2PRMWPKfIvr1M5K/b6oNjeNHKo8kZ9+V
         IGUn3Lo3WRd2JGFmd1hvTbVOSbwChzPFsVla8kfoOGkBD5xLi1RhbK4nNpgZkwaxwEEB
         jEGGT2TQq9OuyceTvWvJ2/a+/DqZjg6L/hX+J6OqHqq2soxHcErBAp6mWB5WrKk5M/ZX
         /2NYny7V2eKiLyY0ej3iMk0rK0E+OtwRT2hnmXFqSpHTaZmIEOEqi4OiCVChI0tfhTd2
         m+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896529; x=1780501329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrZ7fByGdAG1n0GYJXTMCaPmclgKYcrSXuiTG7s2eLg=;
        b=fP0lelAuxoas5uJGwujHGkU66DJYex12vLlMPdR9s4Q2aZVMSLw4aeWM1/SoUi3N91
         Bd0ZuOqmoIc8XssoFnoI2vJ3d0O2n6icwfUS0WmaM0OfgR9yvyfr48rDKBFWq2V8Zp/K
         CKxSxjPB59yR91ZGLvzUkb3tk9GyM+Tk0X1shz/ocDaOqI27m1pzXCL5DtHRYg0Y97zp
         AV4EpLFIhMUjdA4AKM5nLLhI+8lObW6fhiE/5DiBy+v+Kl7AowwPtvlaxCucLaNI3744
         CpWl31WkRne03U3coTstAjglkxJccZZNoVHVB5jQm6giXVYef7q6ZyQMf7NvepPKVCeC
         i3QQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HcwJyC+P+UVNOe1c5AVvi+LoqsVnp9356zg6MzX6sDd/gjvt71qCMJH+tAtiRR5HdiUW3dUMbq7UYmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz99PGAmDtl03YaamD/hvoKBPHZ/3YfinIB6j1AKzwpepS3vGb6
	LCK/58XUP5M4MWM9fOIK6Fuc27GqZL6wFfScYUa5Lzhhb1KjAS2scFNuvjtS4GY1ruBp6Hn9G9o
	UocSp0gF5h/EYHcpCxaDhKAMSriEpYmocSozJ50ugSThE83Nhq2RgnAdJJ2N0y0h9TDwHEA0=
X-Gm-Gg: Acq92OHPhiDLeRloksIu91vntkLoywUTHFMfJdQNxn6bzd1FTO58C5PQhupst46nBXc
	yYXHAwuiXS6rMkviBR3hGremrqxpqQvJXtNIPo837FX5ofcpFYj1gtSDpHe/7rjaxp2KoRBc6cj
	jjA+pyg3evi7UW0NP47m2F/znHSq2rrpHYnuRz7+aIXRw7MHn3Xt710iH1zm9YHly9LNE97Mraw
	JaFyClnsO19Ix/TtWh8mwOEisDuucrnIVrr7Trbqjvo6cg3DIi0ay86rJSA9OrYrVyhOCmaFEtw
	q8MEEFvM94JIQ+VHIZ70Chc5jVF8ZFayEQpz9ZqtaCJg+WgeM54hXCAm7GnJn5vtRx34uYqG7Vc
	E47Po1DWh7Lt/R22VSWUAUA3F21JSU3vFB700pkH04Q==
X-Received: by 2002:a05:7300:2147:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-30430f5a25cmr11505056eec.14.1779896529210;
        Wed, 27 May 2026 08:42:09 -0700 (PDT)
X-Received: by 2002:a05:7300:2147:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-30430f5a25cmr11505034eec.14.1779896528627;
        Wed, 27 May 2026 08:42:08 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm12480494eec.26.2026.05.27.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:42:08 -0700 (PDT)
Date: Wed, 27 May 2026 10:42:06 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/10] riscv: hwprobe.rst: Document EXT_ZICFISS
Message-ID: <7ammujmvz7n6hmaseqns2x6nfypc662i6znvsm26rcxcvntdtg@vn4poummj4vc>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-1-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-1-21c5a544f1dc@riscstar.com>
X-Proofpoint-ORIG-GUID: v4EEoyJfsVjbuo8PW4h_kt-2X2_ojLTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfX4JOCzHyR5dQT
 6G9W5Oj5RFtXMlLynRYw/h7mWUHsX6DDc8te6kSXLJpdIHMnzrfUUr6zaF7zwHI0auHkAGE4mkE
 cxfubrZdQuoz5fx3qypic9WtVEeYNlWGVHAYGWkp31eMhpENegycXbNzrAb3uswP7vueD5TfwRM
 KzlLITxAzJcwhDyWUdadv5AKaZgMnKNK6gVp5hwX8TnvYYbwgelJdgtE3UK/gVI2pWhnEE5oHep
 IpzrUQJkw996FAN5v9YFesKnhRI66qYDXjaWlaGw57G9iyTJAw0Um6q8znACVHJAm3maj/coReM
 7jF3h3xyl0yHbQlL3Avz7jJ3jgiyIOzHH++bePx0yaNsQMG/sSmlS9ojXNHeQVuuOEGK7e/+mDi
 piqd/KI7ODJOXEFPts7k8Wl3eYX7p0rM2pT76JHgWajFvwx+rWhLpxiJd7vGbXOosW5+4JTkw3l
 xds7csMxZYzGNBsogvg==
X-Proofpoint-GUID: v4EEoyJfsVjbuo8PW4h_kt-2X2_ojLTk
X-Authority-Analysis: v=2.4 cv=SIpykuvH c=1 sm=1 tr=0 ts=6a1710d1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ee_2aqc6AAAA:8 a=MJPy3T5N_tYcTtQqpHkA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_084211_292644_0C1337F3 
X-CRM114-Status: GOOD (  20.51  )
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

On Mon, May 11, 2026 at 09:34:46PM -0400, Guodong Xu wrote:
> Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
> enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS as bit 0 of
> RISCV_HWPROBE_KEY_IMA_EXT_1 but did not add a matching entry to
> Documentation/arch/riscv/hwprobe.rst.  Add it now.

We also need to document RISCV_HWPROBE_EXT_ZICFILP

> 
> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index c420a8349bc68..b1a84ac06da75 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -391,3 +391,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>    extensions that are compatible with the
>    :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
> +       as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +       extensions specification, ratified 2024-07.

We have a variety of indentation in this file. Sometimes we align under
'm' as done here, sometimes under the first ':' and sometimes the second.
Not a huge deal, but maybe before documenting more extensions we should
have a patch that makes all the indentation consistent first.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
