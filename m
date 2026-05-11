Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07408CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOrWEYc3OvKlvlj+eFqSYwFMBF+JSR0iUKCeQNY8/ZE=; b=ZDIs/Z41l4ePL7
	1CzEviKi0GdUbEXFoY/GtBI6A1jT3ElGrPX18dvHRz7A7dUDu8fKOx4Tkxs3Lc0GUXRxeVp++usqG
	O14NTEc2vqM2XK/ixheR7zgPh1lgypc5kUlhd49ZoQwdiSTXzFr0wwX5L3I4dC+258dqdr7H4NTvW
	ThIdLtPgu61c9sj4+5FNvaf06eKle3n7A61v3+OdzwgXqG9IrZjXdl8yVNw7Kp1WzMHXYlvDDtjiM
	PpcB0rFOeLQm1SdITp3vuTDMlRbWg4iqdgz3r46HI98VtpsLcEbFvSK+nY0T5dM4G3eXUp/K1b6z7
	sI0tnXCCrnw4Y0P64z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMM3P-0000000ClXG-1IH8;
	Mon, 11 May 2026 08:31:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMM3M-0000000ClWe-3nmH
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:31:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A49E1258479
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 08:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liNuFjs0lWZuIiFKHVxV0Y8he+FIbK0rAFC9jD6OJfc=; b=UE1MQHTNKmIIkV/g
	IdjogApqjJzYuBNq48UcVmK9kYIH9MMqjYki3DzKkC3dqs9QepTnNfgtQaf3EqT2
	kGvD1CvhIS9/oDrzftuxekEBljeFCsiECbp4ZnaWLV1yhzQEgsAqQJ3aWjBhE/QZ
	kKz7i+fUQTumDI4sE/oGzM6LiYVoiSa9J7l70vbwvoGmXAx9KPjg9W/WqCq54Q4q
	IV3gl5iVON+Ah+cdzmtyEspmYy6RpQrs0gLwatD0GkjbdPJXIk+dP2sCPZlv5DWY
	2Z4KddSZaXmGRDYNr4twTCNWdT0dx9Ikw6UE8GP/TOZa80iEHdltoR82gKn2zpLV
	oTLX9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag209ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 08:31:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2055971b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778488310; x=1779093110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liNuFjs0lWZuIiFKHVxV0Y8he+FIbK0rAFC9jD6OJfc=;
        b=EvWUDfrd8rUwS2x9RcQQ7HrOxyxLbUDDbJygqn/r30YA7hP4zH0+HHP3DdHAjCMGTk
         LJGx2JPYpJPWAVS0m0sJx5fLdENoqSzxhRIROptH/AEpCTsP+8flaQjq+cS5yoKHc0Ic
         3hovDD4oKIEZtDX8LEGDADa+thuRas1jTWSTQ01ljGUYxxXr99UO2SInSLBZEfoNnU1i
         opTmnoUumhrD/11LM5ASS4LUB3JDyxWURT5aE+Vm9oSDl/717v3w099wXvUYfb5jdL/u
         YzQ7adPeLYIaWHtDFcvMT0zvKQq1dejN9qgBU6b63lmdlG4TcgkPqqIY6EAtIP7vu+m3
         nhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778488310; x=1779093110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=liNuFjs0lWZuIiFKHVxV0Y8he+FIbK0rAFC9jD6OJfc=;
        b=i0tikUjowyvY7VkGtM6aD7sS1QxKMbBkddTPXf/sXkfFEy09sacEpsQq4+gQ0U2flN
         LafXwtdPueVXsrEFkov1T+Qwpeu+sTK6KHuSxJNUPGHPxieCnGN4bUaNY//z3xvE6k8I
         tIHU/J2G+ZzAFPL60qo2WDG/Ldd7Hit/zjTZxnOsNXqKMsOsEjk1HZXmfoDPNnW0Fyka
         VMrb54ms+gQ0H55saE8Wsm6TylGevO88xhMISHXwH2h8NUQP9coIA/FuApNYZ+jFEKMw
         QH73x3vR+WS9UcydCJo1VnGkhfPeEafRlvTArN8HsIJIv61nnDxfl3gr4oj5FPo06Dz8
         z5jQ==
X-Gm-Message-State: AOJu0YwPPtjahmtCDpJjsy7sv51n5JR9DaMAor2ns6U/sZtTC0v7vn/I
	UNX541+fxbS4OvcYCiGZNZwMMJzVx+ZlAYTZvQnBkHsj6cXgJ/QN3jqvCEW7a4mHv7SzGmXl1YF
	PdbyoFc+Iqq2B44fqqmMy6yZvLyfpCxtaCZV+952XiEFOKpk9UG/WbhqngsSpqv+/wmZ6R1o=
X-Gm-Gg: Acq92OFD/U/uLTlg3kreOLsJf3ceUovGWVm4PTBuBJ3CbbDHF40FZ2K3Zu2OsH4LA+8
	hq/S2QyK0fSh5o+NbOL7a4A9TlyQFjIgPVjWb+xvHZhMhQFqHs+F1pi5I+4Dak0pG3ga2sUXgg3
	AAJNimdtw138FVtB0Buhnukrth7fNI3sCpwOK3XV9jiZPnOIrfp+tb+Mh8at4nr1CrxrlrGtN+7
	E1kGOaK4VTQhtbO27r0U9aFPHd2VODMemLtklTxPqqESr+HV5tRgk03qEZ6krkNK+azRBI4jwuo
	wUwr9LQ3YXNdqnpxtqjcXqDZCVMX62Iiww7QqTLIp5kRD59/RV6FN3RyaMUcXS1oKJU0pSqY+3q
	fsQr43a+/pN3H2qFm
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr8897232b3a.25.1778488309785;
        Mon, 11 May 2026 01:31:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr8897201b3a.25.1778488309228;
        Mon, 11 May 2026 01:31:49 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:dc6a:a003:bc2d:d67d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24586408b3a.3.2026.05.11.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:31:48 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Xincheng Zhang <zhangxincheng@ultrarisc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jia Wang <wangjia@ultrarisc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
References: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
Subject: Re: (subset) [PATCH v4 0/3] riscv: Add PCIe support for UltraRISC
 DP1000 SoC
Message-Id: <177848830296.12802.14978169328629266559.b4-ty@b4>
Date: Mon, 11 May 2026 14:01:42 +0530
MIME-Version: 1.0
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: nxERZ_NJ3vmOIlLMybkcSRckGYBHhpqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MyBTYWx0ZWRfX+M0ZINeIDxS5
 Hi7YuzkJcIEKZkqmxYKtf4I9VdKotHnGsY4QEpiUPwwYeFM4P2YR0A91Cgmcc5aUgqayc5HXbIB
 /znChLBTugEh112faQhWp3fARgL430odurbP3EnFTPIioNQ54z4Iyi7wKrDple33hdXQTw1LgBv
 vA2uHB6vSPnuBNAL666w5g5QBB+30PbReyhJOb/FPB+DzM6w/9+Qj+Wwo7yCAhG26RAlFg+i5BF
 SVcLrsb1p5xJwleBFXPU+AQzJcjFp2CM9DJVt0riTIsLlddOVhqs9ycQ7RPX8pozL1a6GKiKwJE
 g4KQeuErVX/phpGdDGqT2oyrR6S8b9tgyGUig6OKXZMTUx9LdFGKf1fblfXekyqVh1jxt95Fg74
 kWpFAAFeXkJPMbPiFEzm00qE3Mty06SEU82W9TnFCuI6ApXhXDw/gHYW5ZstZGXNFfKZY2/BRmF
 ThZoZezraR6E9dKtI3w==
X-Proofpoint-GUID: nxERZ_NJ3vmOIlLMybkcSRckGYBHhpqE
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a0193f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=l0vRmO6wWID8S7eiZWwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_013153_261317_697DDA73 
X-CRM114-Status: GOOD (  12.59  )
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


On Mon, 27 Apr 2026 09:32:09 +0800, Jia Wang wrote:
> This patch series adds PCIe controller support for the UltraRISC DP1000 SoC.
> The DP1000 is an 8-core 64-bit RISC-V SoC based on UltraRISC CP100 cores,
> supporting RV64GCBHX ISA with Hardware Virtualization and RISC-V H(v1.0)
> Extension.
> 
> The PCIe controller is based on Synopsys DesignWare PCIe IP.
> This series adds:
> - Patch 1 adds the basic SoC family Kconfig support for UltraRISC platforms.
> - Patch 2 adds the device tree bindings documentation for the PCIe controller.
> - Patch 3 introduces the PCIe host controller driver.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: PCI: Add UltraRISC DP1000 PCIe controller
      commit: 09b78d6ec24624c2f5192dbf0c6e05cad61c529d
[3/3] PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root Complex driver
      commit: 34f9bebe1cf573cf9735a71c1d484b57f65e5314

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
