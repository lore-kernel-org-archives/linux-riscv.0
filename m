Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDFCD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcofYlXY+klm0XhkhjXwQDSfw2qNNpcDoT9wOs7avZQ=; b=2BwGMhtlZcg4OY
	dqnYa7zp7Uilv6MZgZchKHIHOW2KwcAAoes83AbN0G49mhGJX7+Vx6h/jwFPXCGPscHgHjpavRS+x
	0Q6LAr8mmD8enp+vscLOsMw4W58KtkLKW00Yz4ogEmG18uokWZilYMfyWxhhQnV1W9zpsbfxvbbIF
	G0ihgFbQfdg3rwgOJuMoUUf+1USCqlzEXMDs+u75dauG/BuzR0m1hbfJlzeHKytSOxDyvMNW2MlqP
	a+cDSm4lcXxJRE+9EuMdZ9/a+cCuxWERaPDh6lzPJ48vshD1jfOAv7CpHHg8/CUsqztyS8NYZLFz9
	mKX2tQT/MTRQJrsqww9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5C8-00000001m8R-0kB7;
	Wed, 13 May 2026 08:43:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5C4-00000001m7Q-1Fsk
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:43:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pXBW2653257
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZsTYqbukSC2
	gNcKAlH0Q1txs/g5j4eHRax/TlmVURj0=; b=PVY2NhZlOkpU5eEQdbYJr4v0WnJ
	eIU3l3b4LkvTNgWgMVIRW+4hg75jgGW1/4vqAk3rZLMDnlAfjuVhNMG++U0GU/4w
	dIw5jlcVN8NbIRjnDnPEVgiAxxAgB0X4GMija/rkWozakzeCKgKLz8094lHyoppB
	tPGFgr/Svl2T8KfPmH1IGfY/NadkGKKRYTjQr+r0+t9msxR2o2HC4mAGgRcM1KUU
	sUCSppWNRf6WvBkvadAB2qDj3DVGpzCg+37USjAa1AqiE6j9ZzAcOCefL4qX7uKw
	+mPdyJKnp7PcIjK5agkIWNClHGkkugHJBUeZSQL4YSuQ1TD5qOCCgx6KAKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avku4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:43:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a6d84522so123085265ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661830; x=1779266630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsTYqbukSC2gNcKAlH0Q1txs/g5j4eHRax/TlmVURj0=;
        b=jwV/AhJSgWm/1mmfB1jshvgFXNlgbFvg0FX+gG+mDuX++7QnlFQaXZaGtPPH6cqkUD
         0wm9iH4MXMB1gqEU58Upp8euVB/9/daJiQDJQHNloH5grzc/bZkpNPI2g3PBbtP1WrLX
         eLmaCJj+C381Ksfp8L/5VH3Pmevbt+W8elxRQsVGU/MqfncPsA5E7RuVm+fl2T2iJSIm
         kbsAkwzogk65VGgKjExPbrH9Knn/cz2eZSkeeeRC+EPQVM/jm+yrNXb9lRNEhmFSfYbn
         IKTkgJ0ZnzlVaMYoZGabDCowjQ3gyZhEgk7NId8udoLC757T8p90x0JnA0wvOitfDXFn
         8Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661830; x=1779266630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsTYqbukSC2gNcKAlH0Q1txs/g5j4eHRax/TlmVURj0=;
        b=EL8Xw16Jue0rv/pfyCQBvBzoS3AMfOeSt3TV1SyxEWF/5ctrU2MAK+rq9T/KiUwYPc
         Nq/0TEhyGpUTVNrblubUSwUgq2MproAxd6TJkp3M+S45Poucxml+XYelRv2AfSJg13SN
         OYigPQr82/35uo7b7MToVf/cqZq/Ebn89hN+2fSgsQdi6JvAlHsk5TWzJVSNlprYJ+r8
         vkq8vEHDDdJmsgnPYFTOMIq8+x0ZsGbqWCp158pO7xeV1SZaQXYpc/W+eJCK5bDUCXTw
         x6B4y3sFQ+pIp1x3P9LQq+7fNBRWhhSg4qjS7/UKnkPDxyfRA+9vC8KoWBGys78m73W3
         4CsA==
X-Gm-Message-State: AOJu0YzjZwRXar5ltk+WgK3QhUsfIAOeyt+tzuCCrJsEBsgCWXotnEaE
	i6EbKcx2+59NOJhVFFJCb1Kymq7K/ahPIcQx4NiRgTDAXQ/+iT/mFd5w8VqiJYZNwxRua7kXYNu
	GcuvTe7uBnoBfiic9lBUNU3486CSAvzmMzhSGBaBoGhVB4JqCUpEPZ5NDguGwOvyxf8NEfA4W8N
	Tgzqc=
X-Gm-Gg: Acq92OGrHu+nY2xDFpVuzNwkwpt8Aez17ltZaOzyzCdabF75Env+obSFB6IjCX8LdgH
	ODcETB5H7r5iSg67SF98Xv4O31yesoGTKs+PPwDbPLHhSOsS3AcWKNetAFZW7XokJHLfTP6jPz6
	OHoEW/eziLhsOX1aeMIFv1M7opPJ/p0uJITwc2hvM/phMLNB31gpF5U46YTTSN+MIV0m+KSe89E
	HYBJP9eStZEFw6sisZtfKZ2Q6LToRkzo6QVXm16w9YkV2hF9TXzP4TvKfahlGG5GJProEybZj8j
	PFwnW3AjLM4pwZ4NIHTOc7ua4cuUNQBaKvL6whHoxPlv3HUlAUkQoPhMNM6ncAP2GAVpgDUF+j1
	69yJGInWgf1RN6nyxyFQhFoA5O3ZQl4Uu/T9b4XJ0GGoC2Y8Msxk18lQ/Tq8xauwvAPnP91gez9
	/IoAoJqWstay3vN2JOTdD19HrYJOm8NlIa6T0JcCNyqId8Hw==
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd2718bf40mr20937115ad.4.1778661830004;
        Wed, 13 May 2026 01:43:50 -0700 (PDT)
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd2718bf40mr20936745ad.4.1778661829451;
        Wed, 13 May 2026 01:43:49 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:43:49 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 01/10] riscv: Define ioremap_cache for RISC-V
Date: Wed, 13 May 2026 14:13:16 +0530
Message-ID: <20260513084325.2176952-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: GCAZJDSDOWG_qz3IdrtFZwRnNRyllKlF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX0DcmGCn7eJIF
 6ZUQxhNy5bdtq0Jem3jzCluijWG19ZKpf93erndymofJgIpZHd4GgJmBwsVUPb7kCIqyHMMW18+
 sX7vi6gDxCeN/RfEjfA14zSG3VssUKeuLZD3lEagyXVLVJHpSTfR801/+R3eskmGKjzi7viaFyW
 BuI99RllX0yYK7DBHrMjQMO47ZGPlCh3bLXZ5k+KiRMrrya3ilQ0wqy/yvAwJhB8Uh/5QjVTD2H
 UEi38lB0lUlcJSnQfHuCTTGTxWIqvJf3Y97RqwOOu0fYivkyytQ/dug8JcktNtRQz3jua3g6LMV
 cR4T7dEmYsFxTrtT2b7RKo1mh3G/Vd0QV78Egj9NmKtCxAwqEX7Z4wnjoj/k+586wyZwYu7Jj9I
 g3q1bbkzethpVk9ba+FBCEIuEDMLCU4/AIfV4pe0O3fmAL2iSCxh5AYODCJeO7KJUxSZricoW9q
 Sg5BTCJAh8IWPvYiLhg==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a0439c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JWN5yfGi9shfayy-Z8YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: GCAZJDSDOWG_qz3IdrtFZwRnNRyllKlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_014352_457556_A75DAA2A 
X-CRM114-Status: GOOD (  10.15  )
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

bert and einj drivers use ioremap_cache for mapping entries
but ioremap_cache is not defined for RISC-V.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/io.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 09bb5f57a9d3..5550b28f38db 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -142,6 +142,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #ifdef CONFIG_MMU
 #define arch_memremap_wb(addr, size, flags)	\
 	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
+
+#define ioremap_cache(addr, size)					\
+	((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
 #endif
 
 #endif /* _ASM_RISCV_IO_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
