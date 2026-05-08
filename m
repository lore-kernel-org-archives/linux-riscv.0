Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306DDCD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BXPn0GOJtVn4boMEYydmo+DL4fRgj3owoYNo7JdkbLI=; b=knlh7wawUi8ooJ
	y+CCo2E5+ypmppQNtyUuWGhhTuPiqw4azs/JutCydMn9zw88aYJ1f5s50Z0uxxWH5zUgIOiu47RqA
	F7+1alnjVtntBijvDiidhX3bXsyS1PGJIKjeUjG0nBudATbJxbQSOREHpezJVfOZIgpXAiAn1KXOz
	vrgeJkAaXRe7VjyPh6es1DS3qSgtEg8FGlpODWMLGiK7LEgk6ihf/uJOwF0+1zzyXDR+YAoiynlLd
	ZXd/A/fnWi5B/oIyYfgxPvP9aZSm+8QyfvlV9z424V2xrRjhP5BfzkCE1mj4gHlQj+FLnbpayzMzG
	753LGroBa1Z+WG75PiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfh-00000007Xyg-1TKv;
	Fri, 08 May 2026 21:23:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSff-00000007Xxt-172F
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 21:23:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648L5g29318043
	for <linux-riscv@lists.infradead.org>; Fri, 8 May 2026 21:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PlbMjBqGuJdYSGZkU4MUuEB+aZERXuCnNc/
	qXM66qQY=; b=QtlXwfYWM7+kz54uH0JcGtsMF0t3FZyRYSgq/6H++zDD51S2g+P
	enSb70kvKijhnz9MvhXsqvcACkwJ0DIc2utAKbqWyJwMF85CXY7X3vafZFweAJ1V
	6xCyRdEeh1KLs6G34MHF2RJjTjcGllFkuniTvfY4p4ftjhnQzaISy6oluKiuaxOr
	u+ZjR2oA5K2R6+cHDMxirudnGmGjgPJ39qHmabTQVYXVdkv8Im+AQjvjTaZq4c6f
	CInbP349r/xm0xnfDprxKo4Nj+n+LEEw5oNC1zO1lvHIBcwGBp+44UV1PPpxnS6P
	/QD+xzIAH5vmVtQPBp0WMYojCEEi0O1sf8g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc03728-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 21:23:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so3610146eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 14:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275421; x=1778880221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PlbMjBqGuJdYSGZkU4MUuEB+aZERXuCnNc/qXM66qQY=;
        b=TVUt1u+T4XiKlgDvqyoehBkFz7dR0OnLE1oQAI0Ran3hr5WaGHSwaD9jh9dtI4AiCZ
         NkmDNbgfmorHoxqRYLPskODlO6UR73eirXhkHyc2rmBCUwdRNOQBdLD7WinakRgeSP31
         OXRtDwrQOG3tkywPj9QlLH4jJ3Pf0LdLPEToHauVHTOrI9WFIohmLC2II7cKjzu7047z
         zYlBhUHvjPbO5d22/ZsMgJh0cABnq8en/LhnpW29QIBRrufUYI32RY7zOpdSz0JeY7yl
         tBE9R9qzPTWjz9mdSuXABGoK4b5Fc3JhX6gMHzoMhCvTo29+EjzMk0By3VzBp1bGb13R
         YXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275421; x=1778880221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlbMjBqGuJdYSGZkU4MUuEB+aZERXuCnNc/qXM66qQY=;
        b=jng+2AphQ+xGfa7plZGdhk9TIVKi32s1R1u69JDbavgwUmQW7p+Dge2+X0NDFmacmg
         /lhZkm66dikPN+ClHUAXQ2ici2ajwHL+ScLZTIc+BeUjcEUzuWiLd9axov4apgPDwPWg
         18kwaEa95lAeJqMxj78kUqxOZMSh9GbDpjvOjqlVhreALUKfJTIU7wd77SwK3m8iR55J
         3TWVSlibu1xi+j03rfzrxVySmfnAzhpD1H5itR4h6S7u+WIya9b0kzUwa5y5/W8FHm5x
         1w3yhwkEeztOPw24XchIy4XjOmq8hqzloUzK/ShUNVfxAWoRdSPPnD3k5hNjjTO/QN2o
         S0ng==
X-Gm-Message-State: AOJu0Yw/1ySOHstn+RlhAf1GsKm+LdAE14MpGNN4U8KtjPzciuz8msbB
	W6fhJ56RmLKLHLXL/eIDopE2Sbp4+WXVJzT69CyMRxzLMcLhQk28cjtWhPNfNAgs0yNNm4cZu1s
	ceA5GvPAU8sUQY6TuspFwA0bRgcmK6ufzFZ17sjvk89xg+5NnGGeU63rHTq+Lkt0xi7CIr2FzzZ
	w2Spo=
X-Gm-Gg: Acq92OEoSn22qfsS1enMpH31aetEMdWoJgp523TWW8n5qmK2ofgG0fyxujb9f83i6hk
	2ojQENH20Feove8G4bg5pL6ocUh0ax6xsNLHOEVwF6wphsRorA1S6NvlKEC4b4u/2c5tMmVjLmG
	nswI4xVkLQQpt6Wr1QKBLgATubyxKuhQCeOT6HRmgg+gBs6wGw1XioTRBw/r8FWsnkiDUZr1QOh
	08m0iedzzphvdtIIZ53zFk3czqxkwpC/F9fKll3pfvzVsHokTAq3QLycJq2x3x0tsIasDnl6TA7
	D5qYv0cL+dbAYJ0G+6sGWfCwqt8VK66bVS4zFFWLUR2sjBS6meC7LER8ApprssUTdkSzeFb2Mic
	RdODJ6QH7z/6vyxYw4neDUzHlp+oQ1ks=
X-Received: by 2002:a05:7300:2216:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-2f5482663b5mr7637737eec.2.1778275421242;
        Fri, 08 May 2026 14:23:41 -0700 (PDT)
X-Received: by 2002:a05:7300:2216:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-2f5482663b5mr7637721eec.2.1778275420681;
        Fri, 08 May 2026 14:23:40 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm4075754eec.2.2026.05.08.14.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:23:40 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tjeznach@rivosinc.com, joro@8bytes.org,
        will@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org
Subject: [PATCH 0/2] iommu/riscv: Enable IOMMU_DMA
Date: Fri,  8 May 2026 16:23:37 -0500
Message-ID: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMSBTYWx0ZWRfX/UDurygLbR7z
 58Mjz+175YYW5qQ24IczvaNsIPWL7IT4FsHUuTNR3hcyChVXji1NEhtB/98e/8RN8rBd81qGtus
 gO7/i21KBuUk5Ak+TFQ0v5zo8pGu24Jg/hrYwRMLl4Ap7zF61+dzb46ldhM6Kk2+B1V8ZHkzBag
 P2/DD5cgRIbLRtuWgTCN4InePof/Ubt3ImPmBf0oznnNxqtXD0yY3IjHYbrY6TY5jjZhF+Ygt4l
 jk/8y6JA3whVxdMnclpRF17xsgQRku752oEQsf9qeny8yp0EOTEh9L4q++Xa+/NZlU+Au9anEFm
 Xou8uQ/7gq2tA6JUxuDTv6CyAOYewy6prN0/Zuat8LBT/8fzsY5Or63u1fxfKVZpEdYHBVo2oSN
 nsFbYaJJS1A4VY1nF0dutixawzLIEq//X58aSyG+tUvOARpfQa04I6Y0jZPxw7uZt2e4qTTIkub
 l3WcPN3Ntg2XOtTO25g==
X-Proofpoint-GUID: Rvtq0Ok0vRStOPmFGUwIGn0VDHw9JkXd
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fe545d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vm3i78yGLUWP3Dov9wMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Rvtq0Ok0vRStOPmFGUwIGn0VDHw9JkXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_142343_312704_7E306976 
X-CRM114-Status: GOOD (  10.17  )
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

Arguably long overdue, let's start using paging domains. One blocker
to enabling IOMMU_DMA was that platforms with IMSICs would fault on
MSIs - Patch1 handles that. And, since QEMU is still one of the most-
used riscv platforms, another issue is that commit 69541898b71a
("iommu/riscv: Enable SVNAPOT support for contiguous ptes") exposes
a bug in the QEMU RISC-V IOMMU model. A patch for that is now on the
QEMU list[1].

Rest assured that the irqbypass work will get a v3 posted soon. This
series can be independently merged though since we don't need irqbypass
to enable paging domains and deliver MSIs for host devices.

[1] https://lore.kernel.org/all/20260508205129.377032-1-andrew.jones@oss.qualcomm.com/
 

Andrew Jones (1):
  iommu/riscv: Map IMSIC addresses for paging domains

Tomasz Jeznach (1):
  iommu/dma: enable IOMMU_DMA for RISC-V

 drivers/iommu/Kconfig               |  2 +-
 drivers/iommu/riscv/iommu.c         | 34 +++++++++++++++++++++++++++++
 include/linux/irqchip/riscv-imsic.h |  7 ++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
