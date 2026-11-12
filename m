Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A7606A335
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RNztjnx6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMK6QB0C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGIE1gQ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T38au4hEhmLZhhQln0ZeHBrH10oOO/Svf8s06ildSLw=; b=RNztjnx6r2B+6o1441KheQ3vm5
	o/hCNQ4oRQ449Qx9DzASj+5Nc/G/IpqTIr3MCK4Jb7FeieO4KJ1jV0JcOvAlqDZ4w28WmGSuB1R4M
	cLM7/JvBMYg5zrQD5FbbUHkScMCxUOf/ZmjOiB7ZiYaIGW7n40PLKTWBozLY7m7Fnq6wLFIRQ3LLq
	UZCJ2I7GaBX7avwrjyjUOvy/J1zM1Nd5IaqdeZSMCey6hmiRwlS1Z8h2qARh0eiG3Tqk1YDKmiZDA
	koNKEJm0w1Ufa020zguCJAt43MLwmUlJmkzC6oFMPAqVqj96XA3PUQYiRAptvR6zsN9CwSvSPSres
	JHg+Rjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXS5-0000000AYyf-05UF;
	Thu, 12 Nov 2026 16:15:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXRy-0000000AYwe-08vF
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 16:15:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFa8sG1309448
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=; b=KMK6QB0C53FsJS4C
	tFzPmI8KYZXPG9YLJzFIHsq2h7uTULHaITsbeYFUIXrtAyTo9VDxZNrFSqDkzJpq
	mC8m8R/fymWFTkZR+zYJufGcFbmWp/MxWX76MlvAFLbG9FoP2f+z+rKCIxe+RYZp
	fNg29Szh9iFitCyIbL9cy/C2Vl7m85c3g6TI51EIbHfLC9h8O0jJ6fgHrtpY4rGL
	08kayBMDGukcYg/QNo/plpZ072zNL/DySCmPjrKsTCznHdBeN8UXVE0looqITHXV
	CSjb2q9owW+uO5CsIU7QdGzYYy2A7CSYd9P6FRWnSeZKPdrXY2GcO5p65ofbSXCx
	kI4SBw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4sgd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 16:14:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d60a8bf5so944794137.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500095; x=1795104895; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=;
        b=EGIE1gQ8gLaGdHkCqZhg4uTt0G3jh4Jtb8dc2TCaqn9Y0/bK2mZJpMYtiUpP4QBJpK
         Lmc8IeiMm0ZE9Zj7c8bmchXNd+mHppQIedMyYvGfff4jtBxU1AlaZGLm6QQXUy87yA0L
         xhovLBgVONeHIraFlLcC02PGu9/reCDnHBkz68ZOizZu3YKnFzPWkXwttl/Fvsw0TqBK
         pMCFWclbJhoThno60/ktOWXuP9x6yAhodVUj5+xHbrsi3TJmbtbdFBg8kEbL6QEvxNSP
         h+XI/o7olZnMLPNUWAUiOn+cXLrG0DGU7Ps49aA0jt1lGEgu5jqKUKxoxZEI62nFj1GI
         wXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500095; x=1795104895;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFyW3FlcFVuCcTw1UrnIFaWy9gAZYFzgF43VrM5oqOQ=;
        b=HgG6ZbU9Ta1Pwy9r74AzUuncRFQmUD8tvPNsBg8NYHO0JWE2okT8upmztYR5OASZOK
         WxGb1ulphBEJfsoisPqCPVxFHWwNjTV6rfIHxbAPrkDATf16mLfRRose/364uA+Q2Ya+
         m0g7OYVNJEXl3EimCCpQ+u9JPcoMddK7DXmouiHNQE0N4BqcHEi9RjFYuv6xRNNNyfMD
         +DlE2FFX5MIq5DDpTkLSfqxDh17ogl2ViB0YzvfajFtTvIFGkSD6XlJm5vNsI17hY1XQ
         vPurxeaNNLNiNjn5R670yS80Z2pAFc8mIqRoBFi3ArgTFQ19LvBDBJfqG0QzSs2jBwyb
         iOYA==
X-Forwarded-Encrypted: i=1; AL+hErEPi0BXn8qMFF42FqQ5EjGMjwZHhOQAi56OhL0na2iOFE7XWJGhy3LJ4vukQT6frrhMr8bUlLIpCsm5TQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/n8yS/E6o/4cDhqNbtY6QKGr4zqjGZpZUWzkaZtzi+X1jtV4FQ
	b3VSkB4fJQKFzKsU2NXMiFgkd+AytGRkUQuT3usup1EO7MKfsAOTHaGmk1OoSail1jdfQQB7NNw
	cyaWYSXC3oY+RCqeDBcPrI+YhdxIg+Cmh9vGH3efFfRBB79vjiVSbqqpvPsvehVxjwkIph9A=
X-Gm-Gg: AYBFou0TAT3VnEXqGu0KRTDzOYSPH2kiD1jotrO6Uy+5mUhpfsR/hKkh1AYaxF0sP5C
	HM0/crkZa2zcIG4WDYR3TQiOe+o/QRLQpBfFPLoing23HJqWQX8HmCoBnJbNC/AJ5qNhHkFMYj9
	3J9s6HJhWxBuZOXJdpy59g6HfY64Q4TbbxuLIfhEPPStkslenDofqDxlXZpIQQgsr73TXUqaYpS
	2vWkvzd2DIoDEOyoRDkihPLrBrtwBpYe1Znph/whRmPkfGDeCyrueqZ1PRcdDlRjtatzbA/3rXD
	68HN1Ncc1vc113uLGKe1m9Kn712AQ4Bku5Y1Yb+qmVcp7PMkHl6Fch/w3VAiUYG2X1zvEGJ5Vd3
	84mu81auRTdFXiucEyZZQhq+sBGVLkDtsG1QVJXepJE08bye4CrFUv0AZNtkfQYsIYNEq7+Hq8e
	XGT3XFDkNcolc=
X-Received: by 2002:a67:e109:0:b0:7ae:c2ca:8e1 with SMTP id ada2fe7eead31-7d4fb25077cmr1920110137.11.1794500094867;
        Thu, 12 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a67:e109:0:b0:7ae:c2ca:8e1 with SMTP id ada2fe7eead31-7d4fb25077cmr1920099137.11.1794500094134;
        Thu, 12 Nov 2026 08:14:54 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm78783665e9.4.2026.11.12.08.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:14:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Nov 2026 17:14:50 +0100
Message-Id: <DMTD6WT2DU30.AX3QK44UUYB3@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v11 1/5] riscv_cbqri: Add capacity controller core
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
        "Jonathan Cameron"
 <jic23@kernel.org>,
        "Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>,
        "Zeng
 Heng" <zengheng@picoheart.com>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <x86@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Drew Fustini" <fustini@kernel.org>,
        "Adrien Ricciardi"
 <aricciardi@baylibre.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Albert Ou"
 <aou@eecs.berkeley.edu>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Babu
 Moger" <babu.moger@amd.com>, "Ben Horgan" <ben.horgan@arm.com>,
        "Borislav
 Petkov" <bp@alien8.de>,
        "Chen Pei" <cp0613@linux.alibaba.com>,
        "Conor
 Dooley" <conor.dooley@microchip.com>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Dave Hansen" <dave.hansen@linux.intel.com>,
        "Dave Martin"
 <Dave.Martin@arm.com>,
        "Fenghua Yu" <fenghuay@nvidia.com>,
        "Gong Shuai"
 <gong.shuai@sanechips.com.cn>,
        "Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>,
        "James Morse" <james.morse@arm.com>,
        =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>,
        "Liu Zhiwei"
 <zhiwei_liu@linux.alibaba.com>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Peter Newman" <peternewman@google.com>,
        "Reinette Chatre" <reinette.chatre@intel.com>,
        "Rob Herring"
 <robh@kernel.org>,
        "Samuel Holland" <samuel.holland@sifive.com>,
        "Sunil V
 L" <sunilvl@oss.qualcomm.com>,
        "Tony Luck" <tony.luck@intel.com>, "Weiwei
 Li" <liwei1518@gmail.com>,
        "yunhui cui" <cuiyunhui@bytedance.com>,
        "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org> <20261108-dfustini-atl-sc-cbqri-dt-v11-1-33a1bf0cf01c@kernel.org>
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-1-33a1bf0cf01c@kernel.org>
X-Proofpoint-GUID: 0H-Lytz0Zv4zrzyJUpH4_9EVn7wNFto0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX7yqXRDY9m5zr
 CrKavRF+pSE4z5RnQ70Rb6HJIdSvmL/1otbja1vbWNq/D7Rl9eDI6PY7CvofieFykscViID4HFB
 uoRxJpVLGRXiwDsTr6qmfFhCQM44XIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX1GbEe5I5J9mm
 LbEhMsJsnAHEfQVGwdWxg79zSuVVyBA0J2GdBtWKHmr1t4tygN9orVm28oQPnim87IF0dcVdOfv
 KiS9DgUJby3xQ3GDMOmowLkTm3cTzrjIYueEOHZmOJ+YuZtr+xUTFnItu849W2vMoqbm5nwzXFU
 VGDHRAZC1OP/q3ySViGSG623YOGcaozTb4s6t2eWF0cbBeMn0ArxSGzKxFZxPFRkJ3n2nmrNbTH
 v/kbt+L7DWkIIEJVD52SOiRZu/oF9zqlHtGJ02PzcngXg03vU42KDvKn7DnAquyLKfAkmTt5o4v
 BXSwNCZ9wxTsuTXyAyVuBkf8LORmEfHqTQlL3zW0QtvCWdS18j2Os57gyl4oh8Gyk6k0cYvvgoY
 E38GxT6GT6yY0bXC7az02oW5tCUrcOy3UdAg58elAx3Rbagmv29QuUvb1lH2USEl24gndLxzolp
 1Gm7qGkl/mpkzr8+ddQ==
X-Proofpoint-ORIG-GUID: 0H-Lytz0Zv4zrzyJUpH4_9EVn7wNFto0
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5e600 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=MPNzcpqd3dBX2N5RN88A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_081458_319745_DADB4666 
X-CRM114-Status: GOOD (  32.11  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-11-08T15:20:50-08:00, Drew Fustini <fustini@kernel.org>:
> Add the core for RISC-V CBQRI capacity controllers: the register
> layout, the capability probe, and the allocation operations that
> program a capacity block mask for an RCID and read it back.
>
> A discovery layer maps the register block and describes the controller
> in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> the controller from that descriptor and adds it to the controller list,
> which stays private to the core. The core owns the controller state
> after registration, so nothing in it depends on how the controller was
> discovered. The caller keeps the register mapping alive.
>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> +static u64 cbqri_readq(void __iomem *addr)
> +{
> +	return lo_hi_readq(addr);
> +}
> +
> +static void cbqri_clear_cunits(struct cbqri_controller *ctrl)
> +{
> +	if (ctrl->cc.cunits) {
> +		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF);
> +		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF + 4);

nit: lo_hi_writeq?

> +int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
> +			     const struct cbqri_cc_config *cfg)
> +{
> [...]
> +	mutex_lock(&ctrl->lock);
> [...]
> +out:
> +	mutex_unlock(&ctrl->lock);
> +	return err;

nit: guard the mutex?

> +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
> +			       int operation, int *status, bool *access_type_supported)
> +{
> +	const u64 active_mask = CBQRI_CONTROL_REGISTERS_OP_MASK |
> +				CBQRI_CONTROL_REGISTERS_AT_MASK |
> +				CBQRI_CONTROL_REGISTERS_RCID_MASK;
> +	u64 reg, saved_reg;
> +	int at;
> +
> +	/*
> +	 * Default the output to false so the status==0 (feature not
> +	 * implemented) path returns a deterministic value to the caller
> +	 * rather than leaving an uninitialized bool.
> +	 */
> +	*access_type_supported = false;
> +
> +	/* Keep the initial register value to preserve the WPRI fields */
> +	reg = cbqri_readq(ctrl->base + reg_offset);
> +	saved_reg = reg;
> +
> +	/* Drain any in-flight firmware op before issuing our own write. */
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &saved_reg) < 0) {
> +		pr_err("BUSY timeout before probe operation\n");
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * Execute the requested operation with all active fields
> +	 * (OP/AT/RCID) zeroed except OP itself. Every bit not in
> +	 * active_mask is WPRI and gets carried over from saved_reg.
> +	 */
> +	reg = (saved_reg & ~active_mask) |
> +	      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation);
> +	writel(lower_32_bits(reg), ctrl->base + reg_offset);
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> +		pr_err_ratelimited("BUSY timeout during operation\n");
> +		return -EIO;
> +	}
> +
> +	/* Get the operation status */
> +	*status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
> +
> +	/*
> +	 * Check for AT support if the register is implemented
> +	 * (if not, the status value will remain 0)
> +	 */
> +	if (*status != 0) {
> +		/*
> +		 * Re-issue operation with AT=CODE so the controller
> +		 * latches AT=CODE on supported hardware (or resets it to 0
> +		 * on hardware that doesn't). OP must be a defined CBQRI op
> +		 * here. OP=0 is a no-op and would silently disable CDP.

OP=0 is a reserved for future standard use.
(Hopefully just fails, but it could be worse if it gets implemented as
 something other than no-op.)

> +		 */
> +		reg = (saved_reg & ~active_mask) |
> +		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation) |
> +		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_AT_MASK,
> +				 CBQRI_CONTROL_REGISTERS_AT_CODE);
> +		writel(lower_32_bits(reg), ctrl->base + reg_offset);
> +		if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> +			pr_err("BUSY timeout setting AT field\n");
> +			return -EIO;
> +		}
> +
> +		/*
> +		 * If the AT field value has been reset to zero,
> +		 * then AT support is not present
> +		 */
> +		at = FIELD_GET(CBQRI_CONTROL_REGISTERS_AT_MASK, reg);

I think it would be safer to also check the status field.

I'm not too clear whether the spec actually allows returning 5 (invalid
AT) when the AT is invalid, but an implementation that does that
wouldn't surprise me.

(For example when an implementation supports data AT and a custom AT, so
code AT isn't supported, but AT in general is -- it could keep the
failing code AT and just report the error.)

> +		if (at == CBQRI_CONTROL_REGISTERS_AT_CODE)
> +			*access_type_supported = true;
> +	}
> +
> +	/*
> +	 * Restore the original register value.
> +	 * Clear OP to avoid re-triggering the probe op.
> +	 */
> +	saved_reg &= ~CBQRI_CONTROL_REGISTERS_OP_MASK;
> +	writel(lower_32_bits(saved_reg), ctrl->base + reg_offset);

It would be better to do nothing than trigger an illegal OP.
All our writes should modify the non-WPRI bits anyway, so restoring them
does nothing.

> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, NULL) < 0) {
> +		pr_err("BUSY timeout restoring register value\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> +{
> [...]
> +
> +	/*
> +	 * The driver programs the v1.0 register layout. Controllers that
> +	 * report 0.x differ only in capability bits that read as zero, so
> +	 * they are accepted. Anything newer than 1.0 may move fields.
> +	 */
> +	if (ver_major > 1 || (ver_major == 1 && ver_minor > 0)) {

I think we could accept ver_major == 1 even with ver_minor > 0 since the
minor specifications shouldn't be doing backward-incompatible changes.

(If we fix the OP=0, we shouldn't be invoking any other behavior that
 might change.)

I'd be more careful about accepting anything pre-1.0, since I would
expect there was a breaking change in the spec somewhere, and we could
program it incorrectly...  Do we even care about pre-1.0 hardware?

> +		pr_warn("CC at %pa reports CBQRI version %d.%d, skipping\n",
> +			&ctrl->addr, ver_major, ver_minor);
> +		return -ENODEV;
> +	}

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
