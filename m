Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E968CA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUftji2CZBaVEzIn9bXkPRdqX/aeKHnTzto3C3jfsi8=; b=dmVHPhabvJGkka
	4SNH7C4RBv0+3H9dM2PglJqnqEzXqn14DVev7hgqq3N4by5LLYTKUEfi2e8uFuuBywLfEEzDzhSFU
	kX9v6PXuAJi0lZTaH7s+2w48Voueva9stB+HuMm40TCHjxFZwcHlmcfmzox0SHTMMhcJZAf8ZpHnv
	CpV8KnkOvSqGSc+83WN6lIGjbkMCYRKsRMbtxk9vTHg57uKWcQx72rhfoVpN53NE+zGq972tmJQjS
	KJ/RAWlN3V96Bgmcaqf8m+zIE+IAoiVoXlI7PGpsHezw41KWjG9nAFQBTrosntHHQmH547IArPh5c
	mnqBYtV1jGTLiaeXCKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hm-00000007nx3-47sH;
	Thu, 01 Oct 2026 05:24:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hh-00000007nsD-3TtA
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gHr01511030
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eQud+U/q09O
	AASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=; b=C517Vw//3riY1HrZ2Rru42Br8sQ
	RQQoeSylAikEg3qBU2BpkMk/GMw8nGIAlDBAnh+P7dXbSsQW7il1LGBMC3tK9+gO
	lbxnKz8xzvK5hzR4/F07EcZAGR4423qEx6G8bLCjNAVs8FIiyF1bM/7RZi+vRPUr
	Boh+bVgxEAbUEfmOmAWV6sy9EWfKiof7JDoDXXtWdfjmJhdjUDe2aKoIGA7Sd/Tw
	DEZQimNyJzOnsYWjm1pADydyyekgxOOYdMOWdBd+ae84jQ6PpKJDyF92MPWBQRZ6
	HqrYq7RnNTMGauMZo9xGi5iSmxncLw94lMKaVnKfIMRrhVX2T1gJ3ecxpLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkca50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso41061625ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832284; x=1791437084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQud+U/q09OAASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=;
        b=Eyq7vpLHt5eGmrLiQQq0txupYBym5InGi2v8onQ/KVRX2YPOBa4wQcooRc21xf6UwL
         0n8ttuz3Cr7lM+RdB6JEOLIZE8R3mwlV2W3sobpSVDHmGu69G7A1DV4synWcSH95JzKt
         yDV7dzsxUEQzeYgSfeazY7jEtT1cSRVOTGHL+YiBF/XmxxW8FK9VFqf9HtHPzq35EY4s
         b7y1CbQ8Fkm6U2JUBdkSoq0/Zibw2AAiUotZBqBZYngK/ArS/t8rsbIGSNl0iZa4RAOJ
         Y08Ju4wvqWPO6KFzs4V8umLIu3l5BWKbHqnyu6S8v+LgktTyYPPLnIMfJFmnAnVgmwPk
         jTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832284; x=1791437084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQud+U/q09OAASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=;
        b=k+9SF4kcHo+jIefxIu4S50TRzMFkw/1alSXPS/3E3At1hJngAULBiw3L5Ll0fCp/7t
         Ugrdxt1xG+8gxunggS2K7BClFUu3UKVccDBJO4FsLvuREkt9WRej2tv0ODaDdCxy2Kyr
         O2OKOI3jK1qZYAddCF5sqy87xIfnjyGByXGwRME4+m+5zhuH3LrnitbhBPozAWFZtsXf
         LtctOJ3latHuTq1yONZFruvLVppttJMkWk0AYWZ3WTcxfOqn1qrFTYg1XckbR2EU8uhK
         /bYmAh7EWs322dhg3LNBqaR3mSZRxhTqnrJuIaXHzNF9v4+sHKXMRqQTmGBRsipqCl48
         x8Vg==
X-Forwarded-Encrypted: i=1; AKwUvByVeNmVHdcJmHph2RsrdGI5lLewXAMXh860EpAQ0oBAYTD/j0Hw5OqXeSmaSZgUxogiDrHykt8dviwRuA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJJYwRcA2xBDM+ji+vCYBJeIClFHzlec2ltoPUl0AX8TeXE5+qp
	dTDDU3r0zO5RsjhYQbyAT9IKyn/FOPPRrv35yjPfMYIIQDjC+x9vZTNU5QrwnT4hP3arLnGImCv
	seQcCvqVqp93ZjQq4aUFRzqxt0Zm5R0tz0q0+tAqwsrPKjlGg2xuFstMz0yrFUfXQeSTldSxRCR
	chMq4=
X-Gm-Gg: AYBFou3wYtT2P/aNPVXTOXR+fEsifKgppYg1HZX/KL5O5tlFyalvE/Gv1e1qxaJcItc
	6HAJDdHnOWPbq4DDnFjUc5+sETeOb/PT+XpbHqyqiaj8jH1qrTjG47EETyL8BAjfjp4HK/tiKzV
	kfsUUdEPqrWc2snD6BSYrR9XBC8oSuQ70M72zK1O7DMls7Q6NMuYhYZNWRs+gqejenZA4ulY4w7
	0NCxVquauL34/X+dgPysT/4FpUWGTSuHA18w6F2C2s8aF2VT11aN9TD2ZdeG4xcwlYOTNtgKzhk
	xP/y30EX5IXp/apvqGBv510Z6Ks4BpDkLvVZ2SCIcaSq6zMsT12w77TiuioMbiFXIkpSi6nnWa0
	CgSTt+OXxeAAU1pI+PAJ/b3r4OXmTSAqPP2w00qdV3EtTRe3hG/QJf8BA8hzJ0xMuDPlcJNMGki
	SpA0uwCusZ0ey9n9hvH557qliW
X-Received: by 2002:a17:903:3d06:b0:2e2:d02d:a171 with SMTP id d9443c01a7336-2e2e4b595e3mr31892845ad.19.1790832283787;
        Wed, 30 Sep 2026 22:24:43 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2e2:d02d:a171 with SMTP id d9443c01a7336-2e2e4b595e3mr31892775ad.19.1790832283277;
        Wed, 30 Sep 2026 22:24:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:42 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Thu,  1 Oct 2026 10:52:21 +0530
Message-ID: <20261001052243.3042627-11-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: TM2RpBZxfThvo_w9rBElG_aBM7nJjL-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX5hBLX20VjGx3
 onS7taJF0aJEoGyFfN+pdblkAom6xOFDHGW10nOWVXyQhWphoIc6S4izN8X1Eve6OGI/Ipqsn72
 Nvdd/tofsa8jDDqjPoDBPhsCm/Fw4fz1Ii2mr9xEyv3Q/W6NFSPftunq0iA+H4YL6fUGT/udvV7
 tPaea9LtF08UkukPc+WZbJ1oruAtALP/GWOReuvdsJTl7SiRS/SpCv6alJQZG/i4UjTgZMssMD8
 R6QNwf5hF6NCIIllRnGSxujRlYSJZlKM/mkRumM/E5EBKNHkx7+bd8CnzEeAC06vh9xLFAx1NpZ
 sNGWAopM66hEAarN3IjKsL1PeoSp0mOuJufRid9xrwfX/2B6Pdz1gSsdmQXUqWEIyf4GQyHDSkF
 h/KX2Asvxxo2KBhxgyipa6zjrGb96Jg6DBX3mnHA28PZpQGpL8lz5Rz7pPAJ8mfZcXD36o0qte5
 wTBRHrUGBe/uaDf5QAg==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdee9c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX0PPnSsc1ny84
 fbBc5Knw/dKX4ISOIuY8Fe795PBBrX03AEjdWGQBxZ41E4cnQmSoLnhbJmZFdkXamwtgs51G5Ht
 J1Fv+c23+tu+ZRuh4R8NEBRBgZTjuyY=
X-Proofpoint-ORIG-GUID: TM2RpBZxfThvo_w9rBElG_aBM7nJjL-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222445_986071_CBAA6E75 
X-CRM114-Status: GOOD (  12.22  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..7319421dcf7c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -306,6 +306,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
