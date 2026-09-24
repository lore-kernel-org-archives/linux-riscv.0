Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD869C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtYVtTdrnoQMleZ9wGItKE6K9VvD4lwPdyF37/dJQjs=; b=Tq37BEVPmRasxI
	R3YbVTdxmNuCPUaVY+Wlp98W3Lf8pqlsKz8TKQt9Mq3Nj5Mz8lOVJ3XEMqgBU/p8eSo/M8SegBxKv
	X+63N4oo/BaHjfO77910gytVbq4GhPuJsOXPFHOJswlOg8qZevb6E556g9wRA8mJwiUjHK/aUf+hM
	Q89lK9qIkzEotegBYL4P9eIhswKWY9XnQ023ky9xxhWdYfH3tSehqn63nrxTRB0/5UFlWijNFQV80
	iY/+gBU4KgBhBmZs9Pmutp5N+DY1eBRxjXcZiXhKAx59vc/PRs3UvduDurhQAxBciPCOthifJha7k
	SW4tf+YZMknz37ByDK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1Q-0000000AJCl-2tus;
	Thu, 24 Sep 2026 07:37:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1O-0000000AJBj-09Td
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:37:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O62OpJ1475962
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=COCHYx8vdlE
	VpwnqbwXHA67D8m795QMTNoWQg+xmxzc=; b=io4eAL92O4D+jrHD1TDM984uvmu
	64MNZODOVo+7yMikxK8gsjzkZxX8wiQ4zhpAZuPVaAyxz39onl+JYOvjErO4hcas
	SilhHoOcf2rWdtFS3lAzjrktbneNePETTvo0awaKTCyVoMJuTZq82Gz1S0vR52L4
	MKxMXM0iWqSs5UdzxHdljpL6CKc5kMz5PG6wdRSP5jQpCI4dpEUxlbGB9wXtI42A
	klsbyaa05UMMVwjWejhvqhuOsU2ZGlvp4Xk7DOPoaf0ndxWXxUXgjb5wXOoU289T
	JtiL9OQsOi4otO250ShDu2rZNeTDkvUK1YQXe8mbmjMDNruFZL4E9J+1hRA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agc9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so2110826eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235453; x=1790840253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COCHYx8vdlEVpwnqbwXHA67D8m795QMTNoWQg+xmxzc=;
        b=K31L/Ob9ZoTdpGdLiYVn1sX2nm+WtK0TT11sFQN8ZGHZRaZui6hTpnDhc8NcS6NRrx
         pAFrYmS0fVs6TBaFP5TNVpSkVBLdc/p8bbgCbM4QdeczvgLF8AjXVsFqagPC+lbs43c1
         ZTBsWOCVR/o4BJU37BrncqIIzK4Q2SHkuBPVBJgs59Nci5OgEiCuqYhRsBa1zg4GRwwY
         08WiGkJ6DL0BD+7unkTvcYsfBwL92T9FEqNafOYkRSksvmHcJ+VBOFby9jJJjQpbSgPs
         O9aXupbZMq8KKHZmU5kEhhqrzrvvOz8KyeqFcpN8kCnjaCVJOXVR70Z59BjqSxL2JaXy
         5TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235453; x=1790840253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COCHYx8vdlEVpwnqbwXHA67D8m795QMTNoWQg+xmxzc=;
        b=BEsOcpVzzS5Oe2Iq4/RlLJQHBZ7bLeKFzS1G/SUk0WFOzQubPtbaFxG224isSx3UyS
         nw75Bpc4gpe2LsyD07PoNgX/vyyGcP/yDcayBXCL31fG03kSX+9kMHv9FRW7fwxjK/g7
         usIHzF54MbYqbxIX/WcyywGxXMKnOM5T/3l43DqP44uHctDlIa6p+H5KRsnGRpKf7QFD
         tafxgyOLQYbAeig5tywzwaPbYFFIIpuMe8iPfO+c4nfkHM5SKA4GMLP4gtRnZGr1rkPC
         8kDNOifUAwToiBQKRnTG9O3l6tZKp5oTPPCkxWg8BkPj2+NpxgIP01+/EcQ36OXMsorY
         15+A==
X-Gm-Message-State: AFuF++m08wchP6OzmgjFm/FdLKl/ZgU/Hrob6s84FbvB++f0k0shO9jQ
	MCxEmUobn5yTzCFVYZqnu6GO/gbw6vMeHbuO6NkvgfChBoWWzdlFMwy5sXwZu9GjeU7my1afEWk
	2NoddVLF+LFcR1bAXpLHOu2V7Uk1LDw4SUIyve5q/CHUWXC63idiFoHpII5RE+L0AvxzA1DYj9U
	hPPqA=
X-Gm-Gg: AYBFou0poPztZ01Pk75ft4x4FufA97i/2OJ5ODGR7ia8WmmXJ2wlonJwNDO4AUXVk1z
	RqzTG9slUNotkLRR8aTlKnpdEp8ZpBy+o+pMvRkaw/MtLPWRYeRHJLp8AH5jeZncg56CbxGqZDy
	erM1tNwJ82D/h2scHT4g6MVMiowIwwQff4lqxLB3TLaXCv9QiGDrAyjfojq0Dt/SEsFxpWxjEq3
	mmjdy0pzjEShwySGZ37GqT0ePmM5ZjuuicXCsFFG0GpkFfMYUFEP4mZHfBVWV1Qj9/uq8YKhGwB
	PXfQLDdcDQ+UxxgPK+W3LeEGjApCpSc31A3sNGbkcLW/prm04e/N2/7vYo/d8QdtdDrC3j8OEOo
	tDaLiD/xpyCuG3V6L1ocYU3NzXK0+Ocr+hIl+oPLWFW0tNlbNoJ/+qKhckqnBPMAAEsR/YQz5uV
	XnEVZ9brUxiGRYwg6cdws/RskL
X-Received: by 2002:a05:7301:90e:b0:33b:fc9d:947f with SMTP id 5a478bee46e88-3400566e970mr1106766eec.40.1790235452899;
        Thu, 24 Sep 2026 00:37:32 -0700 (PDT)
X-Received: by 2002:a05:7301:90e:b0:33b:fc9d:947f with SMTP id 5a478bee46e88-3400566e970mr1106736eec.40.1790235452334;
        Thu, 24 Sep 2026 00:37:32 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:31 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 1/9] riscv: Define ioremap_cache for RISC-V
Date: Thu, 24 Sep 2026 13:07:06 +0530
Message-ID: <20260924073714.1650588-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX0R62HZhKA7PV
 6v3Zcaf6oJ4ePABDfiV//HRRog/I+GxLq01NJHm+albtTCaHjzwTd1UgZSUACLchSRjaZovwC56
 CRqEO9iVPGTiE2enXm4ohJ7vBm100fo=
X-Proofpoint-ORIG-GUID: IQBfmiIWwZLM0qNT3apRb_ntmhFlcXkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXysH/RIalEYZr
 5N3Gq4iNnbQ8G3UMnUCsl8TLyRNmhAY/Ib8IP8yv7Mvp3rYb7RUJ29d5kg2pY093IYoG0eqUQGn
 dVFZe2kwd25BX6UAG4gfEfnjp3+W1toWpCiVfh7E3Sy0fw5tZ03lHrFJPKmUZdVFquAwLMxX7dH
 aKbGohP7XBO4AnkBUUM6Bq0LsBKs+xiDpqyeVlKQW9ywWCG5EjX+40hEXJwsBIbTb9l0FNhRQo3
 iSAMDmAJNzsj9IVHozKF2TnH+y4iDmK9qweEJ0RfvwWYXpZS1edoNxE36N/3LG1rWcOgrvbUNfg
 rkZ116gfQAXxkvCK2OrQ2q+T35FO32p0jDEdUetIGZBiaXdwCmyd1MDqSadTRzlYmmo7GZhuQLG
 Vzwp8WYWDoB4TIZHGNe/UM8sl2TtdNWsA33pOs/6Ttlkk6A6HGGYU7MZSwaQG+3zqjgGl8JgARW
 5l4iYB/sf3sxURlB0Hg==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4d33d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JWN5yfGi9shfayy-Z8YA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IQBfmiIWwZLM0qNT3apRb_ntmhFlcXkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003734_109186_254E4E4A 
X-CRM114-Status: GOOD (  10.81  )
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
index 92d5f831f349..a51904a6c79b 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -150,6 +150,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
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
