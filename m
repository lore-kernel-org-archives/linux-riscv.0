Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC74D232FC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcofYlXY+klm0XhkhjXwQDSfw2qNNpcDoT9wOs7avZQ=; b=AqZKmCslDyPhFG
	tNswoQYJSpFSa2fmsny+lMsWu90wbofbMGPQtE8c/n2Opzbvvwt7dPBba+ttH+lUzC3EIDsiEPrb0
	tnNbwGQr09Ap/qSHhYH72GTqKiFqZLXCa3KCfB6BiM6BNQLFpwretGiVN7OJ/lHyCGLCUn/7rhNo1
	OVYsSqN6MgqtPDTmNM0m1m9huK99wRIspn0fZrjGWkk0XELhr89P+48iFD80qxXBHH6+NLPZ7rl3q
	W+Lk8j8t5qQ2kdgweS4BVxoZW8+Ciem5ZBfNmR8asvRhRSE+b3f8leacBUiyk9o/aQ5LbExKrvRpy
	L76F/CEVPHbEIWGXUGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OG-00000001x9m-3JlC;
	Fri, 09 Jan 2026 09:02:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OE-00000001x96-2Ljb
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982XqQ2184008
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZsTYqbukSC2
	gNcKAlH0Q1txs/g5j4eHRax/TlmVURj0=; b=agkzSWv+DE+oAq68amCweJIWpoJ
	/NiyfB3BYLDFKySSNqiCb62EPqctf7XfQlJWtXnBD4MZZtRbcLz6HsWAJcX67ToQ
	2ONq1FWeJRRjPFt2Cdjm9NNd5WmyOmR9d1eX+3NByk2NsAGILA6plcT63buTOdqa
	8aGZHCmqwdk8nW6qv6+25Q81XUGIcPlB3vgxjAl2SU+geCq/9Z3DT4X0+7oE3J6n
	iB42mfEfTAZWCXKCf1OcmtdZlvFW9Otg6BvH3TFa4q2FfoHehv3D8PEcvHLtyR50
	851YLZushoahf4sWd9jeuJz4kL9vfj87xsefXli4zYhqjAp1e66fasEUJyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn863n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:02:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d481452732so4787900b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949357; x=1768554157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsTYqbukSC2gNcKAlH0Q1txs/g5j4eHRax/TlmVURj0=;
        b=jc1MOGpae/dU6KmYLWUDpo0KwLt2isMczZ+sx6GIai3kjCQO2TjWVTE0aYJVtG7ixv
         sVPmuMN5TsHj9jidLVXpvGzsojsSpVWgvqu8XPlznWpjuvoR4UiDFtz2ERvy4yj04fXq
         c3jNNEfcrQL6vA6h6LO05mcA/QgOBndWy+rKcEZ5Qzt2GGQba8xyHRpSmiKzXVlKdNhu
         hZnFQGjTwcsFDR0K2PWqytX0CHKI0uwAMCc+1ZZOTfmvgYN9Na6hCbIkVkO+2UnmFXH8
         WNvSoXTYnzDrwaBW03CEXgZriVW6z6OWuqI24BCZy+rUQQwUH0KbGZgO2hp5CyyKnuhu
         mvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949357; x=1768554157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsTYqbukSC2gNcKAlH0Q1txs/g5j4eHRax/TlmVURj0=;
        b=Kw/ATaIKaJH9D4VkU7UAOGRxsHWi3cGpKy7psgCUKYWEv3KVZ5xhrVRmhzyQ7URl0p
         zPWBuI71haGy5L17WJs/5ZgdWowAAc6wPA8kMapcbeI1oyZX3jXmJzgybn4ZK3FcRj/z
         I8qxP1Qb9BM+7hBFgiD19zhzp3YBLDJoBT5Y9sgAijRPYB68C5YluAXdHWFaEzImhgFs
         Ev9Nmpedf6SGfq9rT7/7ps7X7hWw5nuaZz8O6ncs2Mr4WiRaCIvZvweE+m59t6Pv5Xzn
         M/Il4sIl2sAa48/KKOvPMzMQpcAhFN9C8jSKwgpaEEYKyOCLNdFd/8zXYkZ2LC9BgyEl
         KjSw==
X-Gm-Message-State: AOJu0Yw9XLlLh3CSRY09wQ3YCx9UhSw8MYnvP3UYw5N/c95gR/HVjG/L
	GCf5ubu7tcy31kJ064td8RqO/Rq3AqXkvtx9dmCPA9+eOM2TVJ+AEh2zgNRSuQ5r9xnXwUkO+ZE
	2eDiEcDKs+tB6j80tLQYp3LjdiJCMvq/mD8tKlbZV1OZyb/76dqGcVijnosxrXBSGGZnPyqGGVs
	7lXw8=
X-Gm-Gg: AY/fxX7eq3hrUjVwa8RxfT8O1N75s2NPEY+NfQz71kKEm0q0HTYVLyymJX0HIatvEX8
	xiG0ME8wPSgJnuYAITuTwZM446o1PSbbMyxmzXlKAjd2cwfr7jT5MITOO8kEPia/GFxiEbU3S3Y
	ps1gzPNuDh9IGy1smpwCp8cizyKzgbMqgSIWbHOeCw/VsTKYp+xJRrGx6ynMIG7tTfloQ1Hli6K
	/vkyqb1qRmvo5Qt5CRf59+Rf3k7Qr+rtYXWyuhhoO5XsZOqPRq1dbpdNUba6z7Hje+d/RmnJEsT
	oT7AjDtAMJ0I99Zgkt7x05GrO6k2ht1LfawI4je+SNdhbtfsarnxRVo4fNhuwfneT5teOK8BrbU
	3YGtguZ4a7oPx6PGiCPpb9cdRPh4D0MWRZE3XHIRt+zWW96b0nHFPl0D27f1voNyUzJKWOCyBS6
	YX50GgagQSCHKgxrviKEZA4vzhglHXFJsdXQ==
X-Received: by 2002:a05:6a00:4388:b0:81d:a1b1:7319 with SMTP id d2e1a72fcca58-81da1c0ba5fmr3618465b3a.8.1767949357323;
        Fri, 09 Jan 2026 01:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOyqXvuG3s1YsXIvbbegM8dNOFmUKr/zAttl62kuwT5+fBNngo2bTFR2q6zm58OKrXld9U8g==
X-Received: by 2002:a05:6a00:4388:b0:81d:a1b1:7319 with SMTP id d2e1a72fcca58-81da1c0ba5fmr3618430b3a.8.1767949356857;
        Fri, 09 Jan 2026 01:02:36 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:36 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 01/10] riscv: Define ioremap_cache for RISC-V
Date: Fri,  9 Jan 2026 14:32:15 +0530
Message-ID: <20260109090224.3105465-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: FwqYd2eijoENuh0ZzAwP3jdDCwMrDrYU
X-Proofpoint-ORIG-GUID: FwqYd2eijoENuh0ZzAwP3jdDCwMrDrYU
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960c42e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JWN5yfGi9shfayy-Z8YA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX+fvf+ZuAHurO
 ue5K2swxdE3B99CRpttCWu4fcq32qAXWu5HzSB6yGa3HMS+As0DQCYhaUPkFZalMnvUKPdbAK9Q
 aq9ZzUuG73NJoDJ5cdKaFE+JHhEH6w6xn5CBAqaS2fiPlQYyZ4W2w3nutaC5hzmxuCKlZoYQSsY
 HZO1tDWH6DzL+5cLowVrjh1bpKH8leJSs+ybsGA0TZgQ0LFomLSrlbs5EDYUiPT1XA5fL6DsEDB
 j5qHJ2w67ifld7NGayy0BSP2iQ49nEg7ySA0W4WK5QVt7m/IvItfXX93VWEQH877c47IDF2MeSo
 H+9hdTSMO80PP+Ktj7XGNhQ2AR81q5jrftVBMyVKd7KKuK70rvh3/8yM+YfeDTYF44XDThDnl9U
 JeiREAf+kClNl8UiAM/zBdx/OSubxsJXOiTFFFhLHTqE5QBRJhYBnZsvamgFLmrwczqTy8L2D/Y
 Vi+HHgTbG+P/l/ekcOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010238_601882_08C785D3 
X-CRM114-Status: GOOD (  10.87  )
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
