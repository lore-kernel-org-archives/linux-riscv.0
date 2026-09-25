Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A689CC98328
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2ZKfY5DctGyS5hY3HgUBSoFHV+U4sQyqCn7FlYD7uA=; b=pKu7eexnJDisPI
	funnkxwqj81nkOlP0zRhCHHOcpCgk9ondLiXpjSR1/tPnVYktI+qr8twWYaPY4J7U9EwnP1NKz0tU
	voFttAEpz+4m3f23pO7Q9zB2VXqhP1rgBaGQ1JhokTEIeqA2zH+mIArpK/XJd2Sm4yENscmOyHf16
	ShgtyB2JhqgJmYcAw1LPBw5B1Upg1UcYMDuHbmuatyozuR7J1TV1SM/0ew1Bmvsao4HHnB+BJK5U8
	CaCfeDtILvj4EjVJs2svpVLKQx244s3HqEH1mYdFKEZQ41v2V0aN4cNsdemRX0KzogiE13lLhUXdA
	4yc8mbpqZIAB8FAfCC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gA-0000000DkCP-0NSc;
	Fri, 25 Sep 2026 15:17:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7g3-0000000Dk4V-0AsP
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDkRLq3628372
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FqZyxFQiqFO
	gguIkL3ayyqgZx2I4bO9MC3PloM4KLYg=; b=anZX7FM+R8lHsC29l45QTc82xuP
	LhidCHKsY06Ajxus7clL2vWKSxAMpp9e9EQ76IBuRac6LzzlpaHO6onI3r2e7Bd+
	NgmrCjYXOzfqfp+729/uh95Fqt+HKkgKKirYOq5b8Gkswr7n14MTt6APKXO8a6ni
	6Cy6wSqZrzEw8NrsnlbmR/I/DMNvswALPpy2UiI1RFUnYWSkW6OpUbcgoFF9Tyqn
	ZRwWdK/chY2AzGSQ+osxnFOzbOGolEqWtNIXvLrsjEfPpsBQWHGVanJKIFfHoa6K
	jRS6M2q7TeWXtC6pGLVW8cAZthIVXpp82XDkZdN+35qiAj1v4DOZAM2AHqQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39xbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98527cdac1eso119031241.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349449; x=1790954249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqZyxFQiqFOgguIkL3ayyqgZx2I4bO9MC3PloM4KLYg=;
        b=hh6kVpiZ9P9XjCKeuIbm1velHt/LPRsRiGda81gLEbm3B7qKJ5N4tx5zJN89D3/kNn
         Ve8LefY1whoYj7i+w3v0bHMiH7SXrY9HVktTWvoVM3cKo/ry3Ovcu8bcwVCO0RhJ6bXE
         cKf8PmIXq4l+/TgwZ+2MkUFXOUeOOrWhHArOf/5OLRDLGJRgvdl79qv68BduE9LPaxTu
         /Cs2JMdzynjUlHcyxN0y5Sjk31FOfb2LsCIQ7Wfdh+6/JGLMthvhvBmc/jCKNuxPdAuv
         UoL7nNwYfrDIAE9Y64DhfmcJ2DyrGHOmklPgnaSRxDb8Bb6MYYKFkeoy9loMZJjQ9Q3I
         MUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349449; x=1790954249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqZyxFQiqFOgguIkL3ayyqgZx2I4bO9MC3PloM4KLYg=;
        b=bCD4rX0fP9BSheoaDfuX9ciVHw0kPCXqVGqITwNMg3bPWRPcBRKiSu0Lru+Q+5I9BY
         iRXATjx4NRfNVHCcSUKmDvE2gyivqSy4dEU2duieQUCViKuLJutiM528QHZ0HEOfppOE
         GqPdrV6+qgMJ7BcudGm7vSopz4QKwQb/Iy251PbKe36V8IGE3pvPaouqFXLPoVGLWKjE
         BP38vZBuUaTT9/8sNK4aMNYKz3fUSTwuXstsCVEbzrSs5/D6iHIIpb492iVaaXatuc6N
         e/PVJuVfhhAMCfe1KU8e+28S9Qp6SbGA7+1sn4AtPF3V1p5UTgXr+ioWfWLl0FQaA4e9
         G02w==
X-Gm-Message-State: AFuF++mbPv/wW43IVX8tMCO2mK60sO9kCPssq75qwQxwoqvP0KczzEI8
	Et2qjzMinDdYfjp5YCKW0OtnbKA8l9ewtUaOnOwBtA5+GdjnlBDzFQIwej9d55Xs+KOhvr0tlJ+
	SZ1xfekn9S0yPUTsqo7lrFyPj7wOkQsoBz8vglDDI1p9iYihpVF0RZaMjQNn5l3kDSh3MhHDT4M
	9wLVs=
X-Gm-Gg: AYBFou2MnHLTOEepMR9+OBGSJK9mhtL4B1xm4ZOIMblQ3TVv90OkzIufg5mwsP/wIGu
	aF/A5Myt1drbUojCqyeys4/a0S3JDPWwkQmccevLWsB5wswV1Wmw++2USO6zXqqutcDEG7ai4Pb
	RvD6V7Ylu9cYCSHRPf9SIr13hsx9ZAz2Yjq/r6xIyYK6XaBneqfpsK/JjA5AU/gh6w3ahxMVvsQ
	ow0L8W8JZK1iDQgYHKvpFYdgmbxKs/ImyYr21dtG5xe/HImPCrcpOEytzCEnL9p7Dj/7v9+LBOK
	ndSijwNroXoPfOP1kdBqgAGcT0aNjX2v1Lg669UMJiiHSnso2hUltG8GIvy0GVCQR4W6EuxIV93
	rwXI7Tu7NmQTpzZWLgHcCnyziVG5Gp2wyfV4smQ==
X-Received: by 2002:a67:e703:0:b0:7a5:c8c4:fe87 with SMTP id ada2fe7eead31-7af1cb9a2bdmr2325508137.9.1790349449299;
        Fri, 25 Sep 2026 08:17:29 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:7a5:c8c4:fe87 with SMTP id ada2fe7eead31-7af1cb9a2bdmr2325492137.9.1790349448726;
        Fri, 25 Sep 2026 08:17:28 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm230756115e9.5.2026.09.25.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:27 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 14/16] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Fri, 25 Sep 2026 17:16:57 +0200
Message-ID: <20260925151659.419512-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX0NMS4lkGxHMJ
 71+j2t/lMZ+CPsTWAUoilPqTbrClRe0LmR/CNYo6Su/Gg5s/me7WcUUtxlc3RNBMjd55QgR+4AS
 eyQPVaZAKGSgsHMCWDjc8C6fl/AcBjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX2ZIDBbAOZaTB
 620fSRf4GSrgr+NRmRSqvc6KmTgcelGocvNw1crGdaCdDPEo7BqSTVGjpWGJB/cMPbkebiSFsmc
 mOOjGpB9/Dg/RaD6303lRskDu9CesQ95qcfu291pqb8JlP8atEYUk0Y3xeK6dHPAOj6joTlrpeA
 qkyRmCGPg/6SroSSwZWmomFa+jhjT2LA/OA16XX4e4zCTjljLIonxqr2hU5G2P7fuyyasi3gNoi
 gzZirj5FYDHallbB61XI+Tml8TuhQ5UjBuruLJjuqBDDVlDDLBW4ZZRbKmDPRrTomiuZNC0+Mij
 4eo9+FH2N9CfrVaooU7ruHAotru0RhS4JcQktbacuam8JDfJkqk+NOO4MXb8L002KZxltHR+llY
 yFcVfUkgSLfFRpW0t0qw4eCMJYy0yc01tMZiS/aJ+qwTSYQeQi7a4nCg38KBncDe/FfSfAaOech
 sPy8Fxz7W+BLv3+IrHQ==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab6908a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=SRrdq9N9AAAA:8 a=Hp3hLBw8nfLOXl02dSwA:9
 a=o1xkdb1NAhiiM49bd1HK:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: yZD0O1_HEBe-7Tjw-h3COqAHzU7tn4y8
X-Proofpoint-ORIG-GUID: yZD0O1_HEBe-7Tjw-h3COqAHzU7tn4y8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081731_221651_B5E73D8E 
X-CRM114-Status: GOOD (  10.37  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture, now that VFIO device
assignment is available on RISC-V through VFIO_IOMMU_TYPE1, so a
RISC-V KVM guest can be notified about VFIO-assigned devices.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..49179aae9504 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
