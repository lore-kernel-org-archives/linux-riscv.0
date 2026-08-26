Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8542BC5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nDf8b9BIZ6ZE17/iasZhp8lqZltnAJWb+Rj3DLeMEk=; b=CT4iFCWDCIk7kE
	Idn0meh95JKCiGMAcUDMjd/7O/EyBvA5ih8YuSRX/BL0MHMnqOf0DkbKGz1UAcWzMroGc0w3jdskm
	rZ/bhMHu1wZp9bGZ3m3R0iaiWiBauwBC07SywPL/5HVmjkZpHrLy7XdDweahgJ4sHb2okn/wY3csI
	9nPhOar51QsbVm4zKDJ9VhfbFNnh4Z5XsWX9LtT9mj2zqu51XKYyxTjLynOeTxZTLuPyIqx/d2KQE
	FVgI5sSRiT7ilMmDfVsySFp18JrM4Ph8r92peQ6A/Pop5euFjcwsw0zdPNFTqSeP730NAX3HTC20x
	/gW/LkplJIcf8SNOgxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEvB-00000002cKN-15pA;
	Wed, 26 Aug 2026 14:48:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEv8-00000002cJc-2CUv
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 14:48:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDutr21461922
	for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eFKNRs/YM3tVCJQfBBvgS8zA
	RI4a6CJVRm6eUkfUI3w=; b=ZtxHhWEBRPELNFtqJMn52UtxPBsL6OaKQWFEgNql
	zyXbfCwCOsgSe3mXpp+FQ0Sfnskm6se+ptPYLR2BmzCEbu3Xmynys+p1Noym8hXf
	ZVnPNB3ip+14qit31xpRLBTWxWGJl5AvQSaVaBvXFL1BfSnku+D2J6s3xsWxOM6l
	ln3maz4Ia3k788dY6RxbWKn3MlDQ1G9Nbd+0SG4IQZS0EVvM65POeoCwTK5Mbbda
	Mp8tDVOuTMPlKQU8C3UGpPpUsvNpSJZzkpizt8+TQ1NtR/8f3EV1171ygjexx1xb
	cwv5tNfqVT6iMOrRv7UucmIEhNrWZgZIyIvqb3uC2NOg4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gjmb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 14:48:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso10334231cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787755685; x=1788360485; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFKNRs/YM3tVCJQfBBvgS8zARI4a6CJVRm6eUkfUI3w=;
        b=MKAjVCU1IyNC/rDvrby/juwJP8LSm0/ZVXlINzm2Bx1yCQZ9EGZ6n9/M9Hg2CW5AL1
         Couo+7/C+mJEkZsD5NmpJS2VQEK4f7Y0yiB9pUl/RSFRaG+B6ejHIXdQa+yX/dQS5Hp0
         /xT7IgSbRgRYCsJ+T5VSMbKfVxZXCbpImsVZKda+4mOEh8wo0sqnMbpruMQ7dXfiZJhZ
         DQvG1keOnK66LMaTeh2FJbn+A2crlzsiKrHXcWXOyuKB9o12EnatV9fdTR0/MUoC0h7B
         FJjFd4cXtfn2bEdd7EO+jurksYXKrMmKGgVWecDcTArbgMoslFNZf/U/zQAN9UHBBEgj
         we8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755685; x=1788360485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFKNRs/YM3tVCJQfBBvgS8zARI4a6CJVRm6eUkfUI3w=;
        b=fbgx8063n7cf6/IC4B5PYbr+OkZB7OcflRe/n5t1iAG12KVSxDs21Rr/rJoDDn7Xof
         cRfKRd5YF6lk3StY4zvkp3ogobm/tdIZaa4wwplboeS8Nr8OL5Fcxb58d/c2thRHl9m4
         uhggkblusv3XdV/INsf+mOZqcYaoMOb63AxYtZqbrOmMdzbqFTUA9wCGWzPb1SIEXsJX
         t0i7pVO0KMxWQlruPhMqZiYql/xVJOb5AwW15EIIZH7QrOhPKznGDTjDPRlTkqFrYFBo
         +hGbbwcTB0bHeOxFnRtj/8CV8c8MA48deQJEPCn93y+idIEgZLV890bjnlPP/po9lZ9X
         k8/Q==
X-Gm-Message-State: AFuF++mkhoUOZ892N3uiBBiiS8Ph+4Bj4id2TgGe2n3Jf1LBoPVNX8DN
	8QNcDxJ3s5MQQXmKjKc/ZwQVGiCKAW01YvgH+sK/2FXMqcf/rawGJJ/Zwk0j5c9MlvJQsF3IHAk
	XeCMa0IIxX8/jaR4GuLXEB49Wdpciv1KNQzDmCQ7wN+FLfckjlxAf2Z2e2bqXLJSXYkx6EaPSML
	QDCYI=
X-Gm-Gg: AR+sD11V2ZYyLUAafIGwAeQhBDPDLuI19Qm+x1vVfY5FrVdJWFpadlZCtvzkFU5nfTS
	I8bHhgMOcHu1m8WislXSTIkkmNy3Lei3Uvtr9LGXpEba9O6fS0bUUqtgk+qyajDXULICFfMUel+
	/1VEGEQYYUECpXxfk6OiWUPbMvz49bcUAnyBD8+coKkIVdmOBCJycT4wQUqCNQVuErIBioPz9Nk
	W09WuplJ2RetmAdpMGuKN41owTfq0QZBO1ik9HzFjwXUoO/zFPL5QcjDmCZF6TSPGao4nrHscJH
	Tmr+L+ID9HErkZENMyqkOmkGfGteEm0u/7TRpbj2unP1rU5g1wUbxucV5XnMXsdZWizd0fxPrPj
	79sFtH9jn
X-Received: by 2002:a05:622b:106:10b0:52e:467e:e9e5 with SMTP id d75a77b69052e-52e467eecfamr31370181cf.40.1787755684322;
        Wed, 26 Aug 2026 07:48:04 -0700 (PDT)
X-Received: by 2002:a05:622b:106:10b0:52e:467e:e9e5 with SMTP id d75a77b69052e-52e467eecfamr31369441cf.40.1787755683714;
        Wed, 26 Aug 2026 07:48:03 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc0d6sm3053781f8f.18.2026.08.26.07.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:48:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:48:01 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <gzgrgpsnku7npueut6zjel2gb6m4g5b5mjdohlyamrq6ogswlm@6mh42uxi4imd>
References: <20260824125204.GP244917@nvidia.com>
 <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
 <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
X-Proofpoint-GUID: LhGh9GCAAguw5SAaqZGDWZqnNUePcdSR
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8efca5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=K8_gVM2FpOf_7PldHO8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyMyBTYWx0ZWRfX1xDQ8cjbEkcd
 lM081BJC3OgOz7x5z/YpPGw/npxoqFYJWWVyQ4qvdCJfZIjOOZwcCQCtXAPU18xVsMcn8c6Kw4x
 vk/5oZ8oTRddxDYLTF7D0krwvB1aCIQ=
X-Proofpoint-ORIG-GUID: LhGh9GCAAguw5SAaqZGDWZqnNUePcdSR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyMyBTYWx0ZWRfX7fQrRHo7oIc3
 7RdI7hl/Ki7Ff5yodkzjALD50cYQ1y1qWPj1u9VAl6wGbPS7xjIezbMUE+6IGz8dVSSo1k4GSWP
 rWyi4z9rCmQPOgb01IxZ/Ltn3kgG73X/rH5eB4yqCtXecYoFw5Gf86DfUfQAjCk66pdzCtqWoGB
 qLrsexoxpUwB4bPnToVpq3hCl5rxvq4iFVKaXhairrv2gJonsTXXJT8ceigJTFhQIrVlQmBGck2
 dq6x9GjilgGYSkotyXANFjeOsCiydLoZwwI5J4ek76Fra9SuDadGezpd1nqKv+gYGDjmtMuICe1
 N6tUXNP6khEfm3CAhVUOAPdo+etESEs7yozN7ueVMcfH8ljFuMnTzQ2y771Dn1PJMn6NhpEqR+q
 JOkH2r7CTqW97rHJGoH4hJ0GkSNQWDkR+gbcT6h3taeaFEjFDNbnC7O6oh9m5/PinTXUGg1NN6k
 gJac62WkgDN+qpfAbmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_074806_693310_BE45D082 
X-CRM114-Status: GOOD (  13.62  )
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

On Wed, Aug 26, 2026 at 10:23:20AM +0200, Andrew Jones wrote:
> As said, iommu_dma_prepare_msi() handles one fixed MSI target. RISC-V
> has one target PA per IMSIC, so the proposed list API prepares them
> together and guarantees contiguous IOVAs. The interrupt remapping IRQ
> domain's compose callback selects the IOVA corresponding to the IMSIC PA
> selected by its parent. That selection belongs in the IRQ hierarchy.
>

That said, it should be possible to move the host MSI remapping into the
IMSIC irqdomain. I can do that for this series and see what Anup thinks
about putting it there. A per-device IOMMU irqdomain will still be needed
later for guest irqbypass through irq_set_vcpu_affinity(), but that can
wait for the next series.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
