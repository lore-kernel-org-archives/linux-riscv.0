Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E625CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4x0o1+ZJ3C65R0w4Qbcxy+aHXbyYKgSDQ7FYl1iJynM=; b=sZLGSXwerYuK7s
	l4BVnmfESQy/lJ0eUuOH23G0aVZMn6jP/1pTNRyIoXyIXeUdpsJSnQYF1mDLhUOeuS4U4V/6IOi0e
	oUxcOu3rIbOfPtkXiHeHQzMsfjpBuXpkj0gPTaMALxAOfPelHhfh77AihwgPecoKTXvgxOHl0sl4v
	kiSEqLbOpcewLiu9YOatvtp2ZNKj0J1qewWmwGi2CcG8OHKxymZlSRBVsLn1FeTFKLgy5r6S4cH7b
	LfPuGuoaBNunDysg3XFjDk0Cwtpupn+3H0aoWzMZDN2DDLhlEAmgaG8U7nPqpGUMKJxADlKiUgBTT
	NXDyFnLebWwRE5PyPJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0dq-0000000GHjK-2LkO;
	Mon, 17 Nov 2025 14:55:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0do-0000000GHid-3Wnj
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 14:55:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAC47e3571549
	for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 14:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awbwG/k9XyjzMvCh6NANh6uyBFKHQ/YUvVhYaVb6bNY=; b=lTOhfrUnVVdViObc
	dVXIqvdmzxpeVtUkMLX1z9OnGv+edJ5XTbdvLAe2DcgV7rbnHw0BOsnuKQol2q01
	QZcPHjtaQn8EzTqNSO2LQ6ek9A4xnbC604QgAjnOEctwy5r0OM2URZ8APcqr2VCC
	fRhU+xXuIzWe/ux1tU7orrxc2HqY4KwWSHjTwo4raNX/OkNcIy/qs4RbphlZhnx6
	g4xdwJbZ4AvaBrFyrauLgDFcMsL2VsWA0dNk2Ij9aWC4xxKa0aOTihkVCxA40Bb3
	l5RVJEVFdvWmgkwFTqiCO0Jev0xG5WAlddEn2GCmXr8Ckg44ZJObXSO6OejjMeGg
	nPO9gw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrrvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 14:55:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a432101881so8728322b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763391339; x=1763996139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awbwG/k9XyjzMvCh6NANh6uyBFKHQ/YUvVhYaVb6bNY=;
        b=Dc4oIF2KF9+m4D6lqjmE3EnFAsm2ukiELQPIQ+W6JRN6FP6eQHSdUWNdeuh80RSB98
         8j1epry7hlQezbfmvXy2fHaEEFEI6M7WZFmdOZGtyevVjvBRrG4e26LpdNpMVxPqrEzJ
         F9Mjn2AvbzO+8qzGZh0kGrehyPFj/cpPsTgJORBaEQktD6zXYGUA5SblFW+9xBBrgikJ
         K0jUOCe46UDieorK7HVB/3wdTg/9rbV/jQK8zQgHULqLLtGq1HyUxBnDNzGYzJr2xYgA
         9LydNjqFNSOop6Q1HJ6p5OFx3BVd5RE7NqY81VB9zfsAqt3yCcDvCspQz29d/QUALRYX
         4U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391339; x=1763996139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awbwG/k9XyjzMvCh6NANh6uyBFKHQ/YUvVhYaVb6bNY=;
        b=GKuHZe7gOsj72xrOYt6r5yuqyPcbIjp35iENKyJw5n6SfQMVRgiVFD8xyr+puH3YYy
         dTDGcsh28nXXJosNqBvWitxrh/iulzb2uJIF5pKDWKRM406xck/RrDxxwxtIXrsx0fG5
         DZ/+S1BJdZJ/PhrCAuIN/0FCy+Yg2KIqm3KmWk6Ul9FtDqhYp+6Zleq8Udevj+gfdvkF
         G3SOJAePDZTD6dqwstGgh9trtME7x3tLwTeKW3ai/E2uREGjs5ZOLS1BfL/OXx76As07
         kaHWaOsM63x4Xl+hcObW6EoyhixFMCCDtFGoA9XLF/GjGiQNIVdPC02OYh8gXo3SxUX+
         Hwbw==
X-Forwarded-Encrypted: i=1; AJvYcCU2zJdLphz/rXFfbKocsMpsXS6nhWZ+GPqNqFamEhC4jCSwhv9k+5HvNSw2vM1TTedmARBuSBxI2cHiLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRVKQ8rMT0QnAmb1fkwwVJqs4VyCzAGAtWt/CRnEIB7q7LnoyA
	iY9FuIJdzXcjSkzbKXTdQh40KGw/mok2e7Q8fCcyAPi4K5IrUo5l19+wJ6m3/ol3GbK9I4cEuTG
	7OTNi3YNv1aGAAKCMK7Fp5mEiA4rG7av55HSauY4h1MKtdy5FY8SJjOUirc9rl/CTGZs8OiQ=
X-Gm-Gg: ASbGnctLibzX7Pa03xUa6AWj7Kb5D6nx7+rBFD/9Vz601PN7zdUV9FmLfEf7vT7HaZN
	FNKGkshwZWzeDpmZE3Mi57+XXWgMgK1xKUhwS66gelzDG5bUPGCJcnhf4AjnxONOyXL+Vh0P+Cc
	GPly9z6WlEGsCRnsn0VO21W0UAYgNX4RuaIJOnkc1regdG/bO8d9sg3hixCa34CRyVw2uXC0fmt
	IEZLcj20PKZpPOwVQ9GCYOx1EszIC0SIJoiZYU1u++XCtRhnhw5rA5KNNer+36clkm20pZx/hc+
	TNBsrtrNGZUTzgEYSXf72SfoAqnNNyRFobYJGbEpXJ5tvoCGoE+qAAts1HDwwc5+SxGYMsIq
X-Received: by 2002:aa7:9069:0:b0:7b8:349:1b24 with SMTP id d2e1a72fcca58-7ba3bb8c363mr13353815b3a.22.1763391339400;
        Mon, 17 Nov 2025 06:55:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSL5vJ9zpN99/df4BrrN39IGWZXi59cv6hPKEmE1JVTmbqGnrZbM2VZhjhEvINN7S/y/pFWA==
X-Received: by 2002:aa7:9069:0:b0:7b8:349:1b24 with SMTP id d2e1a72fcca58-7ba3bb8c363mr13353786b3a.22.1763391338914;
        Mon, 17 Nov 2025 06:55:38 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee8afsm13627213b3a.8.2025.11.17.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:55:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, bhelgaas@google.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org,
        Alex Elder <elder@riscstar.com>
Cc: ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com,
        mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        shradha.t@samsung.com, inochiama@gmail.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        p.zabel@pengutronix.de, christian.bruel@foss.st.com,
        thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
        guodong@riscstar.com, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v6 0/7] Introduce SpacemiT K1 PCIe phy and
 host controller
Message-Id: <176339133088.9268.13766811346004998135.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 20:25:30 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Cb1qpVJTCrp1oOR6VNWxOuazbBmgMM9M
X-Proofpoint-ORIG-GUID: Cb1qpVJTCrp1oOR6VNWxOuazbBmgMM9M
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b376c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=TFzoyenawzPvhxzIwaMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyNyBTYWx0ZWRfXxCZMWXFiachP
 ZaR7X/vxDIxAoBijXu7ofRmjRlS4L84sEwsVcMs2xkSWAVsKs3MB2HY4/reboR5DvgBLT5ycH7y
 T8bvLP1DCwhPQFUViQHKkHIcHKoSi0u3XJEYe0ArEha5uHcorTvQuNJr0QK7waOknas0zuRMNsa
 3aNXJ1az7qNkxpEK0ayaWmjoIoi6JqQvMZAhJdcU7S3XYPfIrrPR59nLEMKqiL4a2XWPtj6XnOn
 iDmmexqWq+sZ6mwL0TNw+Ua2xOvwslTVSDkzpucywn+gWUVdfp2FXsiOJ8tsG1wS0rKw5Tsku0K
 2qlcKPSWwfTjrC7+vf0PhyqVaj/th3IfPRyV58bW8LyeVJoKo1egc3/eKhP/dHOSswWmCwM8LHU
 pH1nVjGpUMOnuG62IJlwvyLLoUSSOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_065540_922226_2E0E61C7 
X-CRM114-Status: GOOD (  10.83  )
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


On Thu, 13 Nov 2025 15:45:32 -0600, Alex Elder wrote:
> This series introduces a PHY driver and a PCIe driver to support PCIe
> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
> one PCIe lane, and the other two ports each have two lanes.  All PCIe
> ports operate at 5 GT/second.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: pci: spacemit: Introduce PCIe host controller
      commit: a812b09a6b599ea80ec1065a9a635724a235843d
[5/7] PCI: spacemit: Add SpacemiT PCIe host driver
      commit: ff64e078e45faee50cc6ca7900a3520e8ff1c79e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
