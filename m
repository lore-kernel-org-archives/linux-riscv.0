Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B9D39019
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SufnUgvh157SexmDTDUFsD0/UzP14riBfTdJRS1i+Es=; b=dEv0xPiSgQIPYv
	pbLIMvTnscg0YgBF8TmrP8lZ3Sq3QKDEON07JpMQ4fkpR3qYbIz3cVGFSYB/xiMpV1LK+OBLNwZu/
	stdHdRxJQvPWwWduKo2Ig3fDO1vCC5euS+viBgQ4NZU4idRR3or2mr7KMMBswA5duTMSk6ej3RA4y
	s8MRue2h1YD9RR0p8OofahatpMqSSN0Sw0xTQsLQJsR4LiJlCX6mDN3d4+ERux17EeW9GxF5mU8Mx
	ohMPBNc/lDXndghlfRvqy6Qghk8fgc7zW/gwACMOmScU2YiLKedpmZ43/VZ4SUe4zQFjcpGP+Rqql
	wu/KmtOGFL+cpWdHX2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Zi-0000000Ae4P-3V54;
	Wed, 14 Jan 2026 20:34:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Zf-0000000Ae3J-2l35
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 20:34:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EIDnAO3460406
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=; b=Ns25+uldQ1DaIQeO
	HjYOpkWlYYe3g8JDT1yTh0ggWSEOBdKUP7IQQdK/m6u87EBdlAiyjM8cVcsUE/ER
	wH/0zS36jL2yIJvdkx4ZYA/rFXr509YPvxYMEi0fqXFkyGs5VvrBom6he7rDfAPE
	uSmlPi1gYIFCKBxlpIQfchkYhqywZCRH4JNI1eeIJ1bo7Iwiq3lqAcdv4gl5TfL8
	g8vFo0OQBtaq1h+hGfP/SwSS/Ev+hcNCbDqXzEjBggdUrATyNPMVAUOoCQjwwgJf
	MltwdO4xzDo7m259cDcvpBWOxx4P36NmbW7DgQer7rb8+1Bk9ox2gnaTFLF9Vt1N
	gIZurQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg848d8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:34:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae546fa935so1928037eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 12:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768422878; x=1769027678; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=;
        b=N2/gmDL2mZq7rrsmKe7RUIyvacfyoA9vyRYFwMfLUQ8Fe+hS2YioPK/86vLH29sLLd
         G+JWihglutv4Llj6ANE+FAeK0CIaufZiGJf5dhWtZI9XkIUxoKMJe7cf9BfG44nByp6M
         4XvVyy1J7qBsZzecsgnykAzXXRvBQ/Z1EB4UlgUyQ9gdpRI+/foRWQIe6yKgzNEMTvyQ
         IGfgrCzB3YZQrS17v2eLflC4X9xl2T+lggltVj7ploPH0AZ4CVoNs0kfldQXBqu6Rewp
         Dhfsbwre+uD6Uh6xe+WIli8pnZbYrGJLaJCE8RCcQJcIqkK3guNE2wQySGSdkKkjz2q+
         cr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422878; x=1769027678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=;
        b=PO4rEHduVrWsuTdAsy+wVWH7dcCYpSss/esi7uRGQJeJg6zVCGe0mdqotQftEuTPiI
         /8YhhBNHD9Uv0r7a2NZ08/YxxDtTFp8Jobcdrq4yXcespsDLJ6vJT/5Qh5UEoyi+rcCh
         s3uHKHZusMba+tDi1JC8f8ZU6o8TFPc5ay3IaJVaVqwwOI2rp9R6q+ZEYAQBg2oAkvLD
         SO7TmiuOIe9cLZPGriZYaWU641RK/ynG/0ogzzkUHCYD8lkNiAMPnEBNvoCo+q9R235o
         geTRDiVSh9udVj1x4Kr+7M70iRItnpvo61mcF3XiweNraFmJGuqu2d9Hn9ALg7/kJS5/
         xwpA==
X-Forwarded-Encrypted: i=1; AJvYcCWZJKoMMXaso0biyRBV+FUWuMPUhpVa2pk7hGqD/CWi30Mrwq+tDE3zdKg1J9iwKSHyo9LIqks9O7Jncw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfX5BlN2RaHqUCnxU9SVe7uLR+1kMMWgJrVAtjdWdVmBo2gigd
	dEWvhImBh0MBf0pMHRHsvoKH2aT92uvbPIeTdKdZfF6h61GpiTbrFBtRi0wli7nFkmzGAwb5yBu
	hP4hdQkIoQ87RqPDCgKvNfvCzFIHEagzWGtig5kSAEjMdsjWNpshonuH9CJT/oXASQDIeog9nxX
	ITIFc=
X-Gm-Gg: AY/fxX7CXcqAJwoTkPrtV3+63EDC88F4/wfNibW9Cke4c8ZRWSRG0bt4U35yr1SORd+
	0JMCEnm24FrCvnKIYjjdcMDWOFqWtlApXwk/8AoqgZoJV4eDP8jJqoNszNpEu432gpBNo4M1M1I
	oAYB96AaSiNMcJPqmXhlTzvntfRmuAhtKBDVCEP3KUSBEkc2or0VkGd9N3akDcR316d4A23t9Qb
	hbcVyLaduHjJHokjMdNQbBbluOxwXPB/mf04k4qCL6dahEKnv8SPFZPhzdxZqM/hbedFnWsvN15
	KHEgDuF8dDkACs6GTSVD/JwVcxb3OKKS2PkZvB/bxmHZPsei9ICSUkclTPKq8T6DZVSRkHbcjSI
	wYLSSfox5DIE0ZyZLDtk=
X-Received: by 2002:a05:693c:2c15:b0:2b0:5bfb:86 with SMTP id 5a478bee46e88-2b48f230681mr4714342eec.17.1768422878241;
        Wed, 14 Jan 2026 12:34:38 -0800 (PST)
X-Received: by 2002:a05:693c:2c15:b0:2b0:5bfb:86 with SMTP id 5a478bee46e88-2b48f230681mr4714293eec.17.1768422877702;
        Wed, 14 Jan 2026 12:34:37 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm21242064eec.5.2026.01.14.12.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:34:36 -0800 (PST)
Date: Wed, 14 Jan 2026 14:34:35 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
Message-ID: <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OCBTYWx0ZWRfX+haQf4yHK2vk
 owS+Hd2Q9333WEWF/BGDN1IxBGz3ZO6S1qWhs5oUtZR3mHywtjTbEGQ162iXvQw9I27fLAIAzZA
 EViufD2W4+EL2DdbP53ivAwnbPSr7uF8dml5blMZI18Mr7/Pjqd8puIo7slmMSUoaE1CDxS95N5
 kLnz27HwqUU9+K0VQWauGKQCg/lYU7XaY3AR6xumD4hKWkG9EOoybL3f8VwgoQHTauKglMgKKqC
 WblxuqOdta4nlkGmGKW7HWE3qv4PgNqtxY8qwYIbbvvcqtEmZMgI0WJ9Yo1Bhkd+78zg5fGQk9e
 UPQfKqcosRmuET7xaxyd1jzqnjSv1a9c/d4Wn/wO2hOw+MPf+vL1QaDYKrb0a0sfCt1mJem1s6H
 UpIo00TqZc+OhLpc0bwcf0H9H0LQSWnQAxOBmRzRmDZYYNLCWYZsgDVALUdzUghWd/KsE49nDYM
 IAhx6P9agiPHJ6ptKyA==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6967fddf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9CwZglbhEJm_Vmq__6wA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=VxAk22fqlfwA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: U4ckv1e8pv-luOJYPu1RBEPwWyhBrupD
X-Proofpoint-ORIG-GUID: U4ckv1e8pv-luOJYPu1RBEPwWyhBrupD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_123440_292736_8C2BB9E2 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 07, 2026 at 04:28:28PM +0000, joaopeixoto@osyx.tech wrote:
> From: Jo=E3o Peixoto <joaopeixoto@osyx.tech>
> =

> Move the IPC shared-memory hypercall ID from architecture-specific
> headers into include/linux/bao.h.

The series should be rebased to have this fixup integrated into the
previous patches where the code is first introduced.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
