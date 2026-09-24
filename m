Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9643EC98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnsxbE/v5VBVIGUMzMAiXPjOn3SyQogAmeUVza9AMk8=; b=l3HzOWutCxCbJK
	e3xNFgCCT78HdYp7EYFSgPnU8fxfe7SwvdmmsBGgpDbAvWB8Z3a+QkOWaUIRcG/wWdP98PCjSycxR
	4i1futXh8Ca2DtAEQRyZvTsIeffriixvU2IV8P87jHpPehIrE/BnkLiuxudYvu8lO8nxe3ecGLTeK
	T5umpb2G4xze3b4b2xfu25Y7ojS7WcBHflGrwEjwwAXTEJutvmyfeySMmBL+hhy4rqzMqqb0WSQ4U
	CN2WRNFZqW7eHnR8mVN7uK2TIk6VeouJhf59xdVLfrskEu8XxhJjybM+F/mhDPpXIAdBu6F9zQ7yy
	aDYjJgsgDHhdM/WNb1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2T-0000000AJV8-49Pf;
	Thu, 24 Sep 2026 07:38:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1s-0000000AJMf-0fPZ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:38:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9ui2420866
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9ko9wYXNb1l
	9AJ4BTleLCn1bm6Eblo34heY8xr2hrJM=; b=Sww/9JMGycO/MuG9UC6K+WzENPb
	Ik/71spcOH+1tGG/HaLWYAHINktuuyBGK3SROiojJndlkOsmfbeUEC05l3LPaAFQ
	m+XZaOqGc4/KUqv9jRERX/+W600Q7J443C7rTtIwft7ddRjU71oLEIBe5Lu89ywx
	mNIxMEDVc7UROB2DLovIbWv8F0Rk356pjV/L0NIm+EHLgozUs7r5vmhDgsVtuRtW
	3EYaGt4H6yRXZE36c04XUxOwJuGYFZi3s0HPF7XIMIXzEccSn+VW7C1bLPGIJdJA
	MjF8AVgSt5lWVCWsUHnocS/U8b8kYA+7GWtMGWEXz0IA7pW+H/bXST6B8QA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhafx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so3295418eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235483; x=1790840283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ko9wYXNb1l9AJ4BTleLCn1bm6Eblo34heY8xr2hrJM=;
        b=FGQKKBNZsR0w+jubn3tvgDw9dCOg2HWKzDjp2hOR4hkzM+QztshjXuPInAqWSP6kbC
         fBAGC7CVjPYuLe5Y0YO7jAzI4S623zap0J9tzj76oOJuNDzCt3ZUGBWA7mPM3CGb94yP
         du2JT1WV9geS0ypsKVzdUHS6yNcQpAjg+84IFQv4Lby91vYJEHhR9ZaZRMG8dw41SHDs
         YTfNEMNIo25Bv1pdWLCd77dYoGIIJeUXfQEnC2x8nKw8EK3nl0GG1j5Zb3KaJidG5xiw
         mDERoGM2Rr0//sap2emlHsuGF0QIVmN9cNhqrd09c1kXBfZhbAiKQk02B9sff19OxG9Z
         mtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235483; x=1790840283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ko9wYXNb1l9AJ4BTleLCn1bm6Eblo34heY8xr2hrJM=;
        b=sfoIHGchqMSKNauyYqdyQa506m3Le91Tcx0Vck/Vy6SB7Y/Xm/NBan912wcQEHEMPp
         xcv1PTWJSIImyGmNC0S6BgKVxFQA78bsMXY1rgX/nRFjH+ppcGx7WVuPLNLgz6Uc0raP
         Qj0Xq5N1tNTvIrCWPG3is6XoSff+8K2DoU7udl38j2iqE4ANJ8KlhCeTmXIW7AQXCXO2
         eJGNXEq6x+TJi5+7amYMViexHjtLwmXaH8oUlH3rZNFZHh08KXi+xYu+wtZbfZRyBGUL
         pnOCFxmtkBqydG0uKn/IqHUnEGvUuoglGhVbjFggtAzoI31/aslCzC3hV1yxkTsCGESu
         qxYA==
X-Gm-Message-State: AFuF++k7GBuxYXxGun6HUPkpAVcGCziVOVKx6uSj9/eM+XtPvDq+/trI
	KPG/yGWbsyfZ3WvUkScylVwV1M+8j/tCYIVLvqxWz4BZBTxTprxDaE/rl0pdxwg0UQJYmAI3p92
	4qcsowD/2Sguigmwd+1AOCH32+/hXi2yUye1VhocO/A+a4zzhTGT7sjnVYEnd5O+M+Neihbof4V
	9xArk=
X-Gm-Gg: AYBFou12P6iCYjXAM1E30i8XpQs6pUZ50KuiS5FgshRTtl/SedTOKxhwAoqvqZC3SjG
	JfEZIzmBJOMPenonGToAgVFSMaoPCyHgf8N+vCx2xjKjbPiMLKZIeSG6GhsQK1/Tv1Bf5243VjE
	3quYYwcB3pjy62ChSNc3bCHNxifPhcJSzDV9mVCbFjDBBmYhBnMi0NnRllf38mMy+cMDlcerDux
	LucTA+ouef0OwMEU60He1wLRwc1ikaYGvqyxZFI3QuRdDzVHMlpUHwySMtR+W7JCIIDNZRsVI8E
	4/J3CUssY8dW8WKK4H95Dw8Rm8So/G5UQFjQMmmSYBgj9rFmd6LRd/Bs8G0uhYCAfrU85cpwGLR
	a6QXBODzaQziDIAjpf/nYCl/m12GsXp6wilt4yqsoh9au15KUjQc52IC6q3VaBV8qHOlMMNible
	Fl48CD3BakHv3R50Gw0cu4CE3D
X-Received: by 2002:a05:7300:d115:b0:33c:e82:70c6 with SMTP id 5a478bee46e88-34000b32287mr1161301eec.29.1790235483000;
        Thu, 24 Sep 2026 00:38:03 -0700 (PDT)
X-Received: by 2002:a05:7300:d115:b0:33c:e82:70c6 with SMTP id 5a478bee46e88-34000b32287mr1161277eec.29.1790235482398;
        Thu, 24 Sep 2026 00:38:02 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:01 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 6/9] riscv: Add RISC-V entries in processor type and ISA strings
Date: Thu, 24 Sep 2026 13:07:11 +0530
Message-ID: <20260924073714.1650588-7-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX68nriIUPci+K
 bJ/9xQEVYxASwFoH7AZWlJ4iyF0/iqwd10oHRvDh2MLJPd6lZpaAPFvxQMkGu4kpyyXdrb5eCZw
 3PhQ7l9wpNhSwuzPoWht7cRkYsCXNY4=
X-Proofpoint-ORIG-GUID: 0ieK2uM2rUqcQx3jKZHCr346Edh-bzk2
X-Proofpoint-GUID: 0ieK2uM2rUqcQx3jKZHCr346Edh-bzk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXzT+FOZBXARL2
 Ne5C/RyyNZY0u02jfEVzJ1BtS10HiMVFa05ysu+81GqJBZrBLYtpBUzaTM7IO2pB3aac+E0spUx
 73tp7u+0qAYWkjV5Z9C1jl/UAqK/ApqkhWnLqQkJbSUz7JX4bQVbZYVxufNrDFK5y/T+uzuykmc
 eAdU3W1Xk4gZaWKMjyux6Js6FKtIpPVVivyt2oKc+KjnzZmfO5LiQCW7xg5Jw2EuUUeWfieba8F
 oftC7lkC9qlNrb3PZrqIGlqXA0kk4krlX1Acqc7f1cPct6zK9efoKvl5wMdSzoMC/eb2Boul/OE
 kmlYQ8w09+x6zD7Fw3G8pdGocc2E2QzONNhXAIqV5ZyY6t3Bd23kFhB661wlaLkOozfb1jDTavF
 KAULgpcHQp+nu3cErP9T6MXHbpc83Xgw0AyWZo7RYy5E6OV1ZUYKsv8r/CXUAAtZ7upypJHaVGf
 m7o3FFbSFWdUwI8lFYw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4d35b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=osVkw33_48dge00NZUcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003816_060776_0C42664B 
X-CRM114-Status: GOOD (  11.88  )
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

Add RISCV and RISCV32/64 strings in the in processor type and ISA strings
respectively. These are defined for cper records.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/firmware/efi/cper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index 06b4fdb59917..1b1ab2f1355b 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -170,6 +170,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISC-V",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -178,6 +179,8 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RV32/RV32E",
+	"RV64",
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
