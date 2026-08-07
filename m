Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C22C5AC9F
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAseqRg0XL81eH997gJo81Ok/IQ3E6ZxQyZivm8YCcg=; b=v4dpXkyLjp1m0H
	xa/trbwC1Nz1VyQgoIYrsGQIMj0LhSaxsIDQBScM9APjgdkTRjE0eBcc11aiMFEFiWveKYDEzSRbw
	Bo+nAXqDi5Mb7CtCDSJ4Bu/+QAH0xUpsYRCa2sOKpGJEQmjw5cVoY6nS/N1DZngBou27NOYkiTLTV
	UM6Q8R9jgnMlFn8Nge7o85+jXQaDUXoWTAwEuI1guCGnZ813Fz9Sj1PK8pcyFs4ySKCu/dpFOWvTf
	27rQUrCp0rwqpCIzyN5IqwqgzghFj7XOqhCiSrxWVPI9ez+Ynfq1fuKuJn4Y1wXDv93xqQW1UMTwn
	Zv+/eqet3kwAwuUcvSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8s-00000008Zru-1v5X;
	Fri, 07 Aug 2026 18:18:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8r-00000008ZpX-0XXw
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=; b=W+ZQj4q72zv7kwj6s1GXMM7SWT
	H29a4PrzmGpW05s4ikq/M5PdDgW+JGW5PC26tBiTkgFj94Ga4KaTNdAi/+pSCAWDlvK7HkNwdnFMP
	8vUmYmQDjmgRH6eEb4gyDmyvcc7VZJ4hHxzR7hpdTm40UAkgQdwKyadiRPTLdMunjA30kjSJz8Voj
	rKyVDVfEBva4/wc7a/332pb/Uyicp1FdLd53b6/qMZAGxMbIviMLd7ABMi/piRdDG9ZGhluVw/NKo
	2iyuxyLLRERnF3HhYtK5HQ2/7nWqmh9hWwJhSOT+OC/mbvt9J3g750amHgNMnwEugr+XwyUJGqH+y
	fL8MkLsQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsP8m-0000000CaHv-2ufI
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOQH11807655
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TkV4Y148NbG
	wrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=; b=lhAVwuZaBjaNsZgJjszLZN7iqdj
	l9ogub+tzB+ROqTU3uBuWS/oC/WwQF8yhTyGwIUje4lcnGi9wxLYYmxLJ+qLF+9e
	evmdBHJTSefh+mRrukIKCihKsMmC59OFqYfovVTSRQuw9wOiZpKtVt/5l4Tu/MnD
	vIKIsl+Q3bkG0FDkTHCgpT17aZ3My7N9N+ONPwwbZhZgMy9W9BRNF5bBeHd2+o8c
	caCdLR4O74UwhaNMrtBy5QnhMsVyGgLnErOdwcuKnWRaIUj2X07TUQVGPTQ3iYio
	JFm+M5ORlDQNYStciyV0tHAi87vnKQE3tJXDn5NchOL13uMnpAJGSkZeMcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgewh751-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso45054231cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126671; x=1786731471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=bLzZCsDgiG4S8O4CHyeSOUVMTnG9ks2M9Y3Czy8LLvPOTwI0N6IuRkoDNSFdgyLgIa
         QNdAq0pZoS6XPvJwPpE2ZGNlYCw9nF6M1wn7ALZt/b/ddYCtoRx+zqusTnb5hFqdqg8G
         fwnXbxLGGbVJB606DjLbvNQ1NzT9TA8QKKEYDur3mvUXfIH/9H8D0TRMLvPxresM2LHQ
         Pbv5VNYPr443adGG+3wDrY6F921PEwaMJhpJujzdfuREqO6FV0RuOb9XVzPpDjHI2fkM
         Xyw1vKsbAOVZx4MMjtHc38STceqnNvE42E0Mnldfc8g4wH+Ae9GHY1csfQPFq6aT1/hS
         HckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126671; x=1786731471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=LJfZiNAtvLnpCr9ND+S1BbKqEZ5ZyrpmYls9ZdFA9jcgDlDEXMhMJL3bYjtmm+9bYO
         zzb7Ex0h/9gLUmg69J+ewSbsrIFxabLptzW4woTXx4hCsBhWxz0kSWqX75HOYRhu3boz
         q8zMPcRHNoI0Ic10oYP3ZZ6iPyQEdj0yNXWtiSJqyEo7FBtbJQ0CZjCgRoTzPen4mNRs
         WA6+/HQjSzw7hXZVFUcG5FXdWaZMtuitoyp390cj7UUhBEV206CPiktK+KQzD6IsWg2D
         KXlcEFTKy05lPbK/jDBTlx08lLj/HYWE0y/EhHp32L1qAigPb8irHpy6KlVvD4TMDirI
         dgJw==
X-Gm-Message-State: AOJu0YwLe5/pGDRdehj8kh8L/Mg+tsT23S58EuN+wDZWTbEgCcuFU7v4
	79MqpoQ8/APwOiv2CRdGL64CGbUZqc3vTUviRzCzC6Ma0arP22cpPetH/RZkeezcim8qjMYw1mr
	yXFw63ArYk7L1C+W98QvIGIE66rF1yGQA59qFhiU4S5aj6Pj4tzFMwYORZ8VwPv9Ep7YIS/3677
	M98Ps=
X-Gm-Gg: AR+sD12dGzg04ej9bEzZ7ltWdexWEIacrE8fEoYmP1rwSRSDbw2EcLe/pv5j3O7awR7
	9obvZC25A4Vl79quUgvRG2zA1+BUbqvL9a6CQWpSHr3wat5m2ktb2oafioxJ7/p/7FoisVx4M+t
	ARJPG3zQruMdv7FISVfc2Fr6tdGUoLDDTGxcOP8NO23noAt5L1uTYYwpcwP445VR/uM2XijHjaR
	T9XoQgnoSjAYKsy2B9m+/nrWEDaKXVvK2nvusYoRKBJPb5OsFflm0R65CdlEtqyfhJuStKN+rTC
	gUDJIo5e7jJVZzpIOa07cVk69ujXXHy9TMr7FQLVWZaRuzwgH4JQ4y2LNBGzAQ576ssa+0mmGor
	UMTAwS6jxJpRTYLadulqPncRsumS/wg6CvbmjXs0=
X-Received: by 2002:ac8:5e0c:0:b0:527:43a:2f31 with SMTP id d75a77b69052e-52ce5fbf924mr245637351cf.15.1786126671535;
        Fri, 07 Aug 2026 11:17:51 -0700 (PDT)
X-Received: by 2002:ac8:5e0c:0:b0:527:43a:2f31 with SMTP id d75a77b69052e-52ce5fbf924mr245636731cf.15.1786126671088;
        Fri, 07 Aug 2026 11:17:51 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c9155fsm76965466b.37.2026.08.07.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:50 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v3 17/19] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Fri,  7 Aug 2026 20:17:11 +0200
Message-ID: <20260807181713.228535-18-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX1qUvBJPKfKee
 fawWB0J256XFAQRAsqcYmcBg9VDbb4nXcw8NAuJtDynXFoRLO1R3RJIu81vev7VCGkAhgBRHimw
 OHYsj11vokrFUBbNndxJ1lK5dbxYZoc=
X-Authority-Analysis: v=2.4 cv=N5cZ0W9B c=1 sm=1 tr=0 ts=6a762150 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=Hp3hLBw8nfLOXl02dSwA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: wIrK13Tk1VYbd_khxOLpln3dkEbndYmM
X-Proofpoint-ORIG-GUID: wIrK13Tk1VYbd_khxOLpln3dkEbndYmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXzrVDYmC64af3
 JvTHCwJ0BIOY+f7wcwqmScORkF1pRfcvupJnodfAt5/IwO5r/flixbVEgonuODNfr0lnIPJzGpK
 4UGFO7tomZPRvRugSJWvU7CclU2Vq0+YsD+k19RKMlwhxWpx/Pb0qtxerbhpLb65MPXnwfAVRKq
 fQ7BaotegKDgaLd9GPyyxqNIDmS2ArRkl18W95K3G+6SYycioKDlOKDXF+cYJWAeLMdqkxVeEt0
 eP61Ty/yUOVbLJ9Y020g/Uqbjbq4k9QzliXyY30Jt1VOU5zVYQItf54WnaJCZ+JahZTAReDLlh8
 TsIG7Aej6OkxRw6cEI6rvgumiNXL0pogvIWdbHBYiNl8V39Xrff0z7Siq5y5Nebz6jaNakm6+Xp
 JvcWAMh5IbzT0A8ArciFdQpIkVcUcNxqXHEIzBfHQsjYHdFjLA5Js+OQhi2yx0Fk/lfQgUHm7g9
 S2Ipkjj26lBT3UsIfXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_191757_870475_E32CF54B 
X-CRM114-Status: GOOD (  10.44  )
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
