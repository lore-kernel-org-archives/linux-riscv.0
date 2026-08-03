Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77FCC55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHmnblykLE7TcliS0329AM2H8lp/QV7F+ugRG6TNkuQ=; b=Aj4nSA9q470+0L
	wLBayX4tDS0QW+Vh54suFC2ekpDQfFaup6FCndogh0WoU/c/sjrIPL0owooa2ASqK4sBU7z7aP1va
	5s1iIWA2d+owsfA1AaFqHcR0C2R8AD22arX76z3MgIHRKtE3ZkLoZNH8cyRhqeyZVzmznZn14lm5c
	YD8C4b1WQGUEZgyWKJtL+8SJwo0+uSVobV1PFrF3oSiSbPfbhkfH0NRI+B159JQeCaoa/qGVLjKzP
	Y17rGj6IP/wsWOIPUCzd6UbKxo7bVRSN+ys4JPZV2F1buFAqZuFime8u5r4qGz8OxR8zGQNEws3IP
	EzO/NdpIK8AOhn3H6IPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt3A-0000000HFfu-1vl5;
	Mon, 03 Aug 2026 13:49:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt37-0000000HFdj-4BFU
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:49:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRgnf534000
	for <linux-riscv@lists.infradead.org>; Mon, 3 Aug 2026 13:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k9yYLX6bWd+
	q10JuHmJUx1dKs4VyCUKLaw59KlrlBNo=; b=f4uHXHYweK104ld9QyrsJ5cf3Bc
	JHbUilgYXFVq7xAomMRnaX6uYW6eIMo8HHCqXLJd0r7+k+iygf242qzZYa5SWynC
	zW7p3BmCCRtXPuiZXTmGgqDXxbE0QI1Ot5iD+3CA1zuIbVkCNvul2j3FT1/pKhhC
	LWPDuaYdVnm9Xdfw8OqyTVsMc1AEWUKEhvD2nZsfuicApZR/nDV6iw9SiJoHtj1W
	6khGRvQPwWzIBJaDVVyv7qIJvGma3Nl4c9WI9qYdxaclaZba3OC/Ts4PqzrrzWkh
	bLr7+qofjx2pdhmSd06JBa4CjXS5COxgll9EA+6hP/sS9PUSxCcub2M8xnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r1qb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 13:49:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3928953a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785764988; x=1786369788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9yYLX6bWd+q10JuHmJUx1dKs4VyCUKLaw59KlrlBNo=;
        b=Jw/VbjUTmRo3Ef6G+BImpQukOCkiHN3wxSHge9kXlzfJGWXH1pAL6PkxXikhqQwc1I
         VhVDK0vDaR4XYDEwoZ2AnvDSQjmx7Kbeqz2Jj/zmsp9ivJtb5MizPIYtYuElvg+G0Ywo
         cg4sbZb9SvPYEHY+oo4aerMSpq/La5yC9DMr+MsDS5GfqWC0IFxoDVkGPH6eo+KLsKfN
         QUMDMTK3IwrR6rvsFbS8uSXVemNby7TPAEtUyt0jDWRJCKlqILZtmwqmpXkvVUfpxPkM
         +r2o5PY/PpcrP0PSl3pfIsATHfUkIeNbIjeHz6GE/xfqV3gbW6O8zjBtk2Q+yCO2iRys
         j3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764988; x=1786369788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9yYLX6bWd+q10JuHmJUx1dKs4VyCUKLaw59KlrlBNo=;
        b=mbcC13Q/tWi7+hm5Go8QTPWcXTrsfJNuANcWD6Ad8R1qS9H9ib86/o5ZkMHWxShNpg
         1LB9i5UfZH0Kmvd5cAvF809knXQepgXi9xGOoGC2sAtXU+Lu+SJSj5/KkDQl5wursZgB
         2D0WG1RqhoUev+Yh9F8l/FB2VecRkuyo73EeJv50W2An52GQpy6MgV8RE/qRZhf+taCX
         wsfskurbZT85lIFGTO+p+c9TdvTm6A4Nf2PU6/lENgVsd2l82BbHBemk4UbJF4git9bY
         WZVBEDY7dNcjlOmjPFzyz7LoP0SF2nZaFG9F9iKgwLpihiwzlN96Wi7RZIECogfquzcX
         uJpA==
X-Gm-Message-State: AOJu0YwREyKsg/msXxYZr6fiRFdDCayvrN90HwkpeCkjEqjUejzdg2Jx
	kvnCF0RbgBOU7vTCE+VM3zlGXkldjI9fpR1ZMoOTWuSBJWpX8zA7ys3gGCj0M+u68K2T4++fEX9
	oCfaUdp9ahBFVdfThdLJLWCJcXiuAD0IZ/lNHf1r917lBYUaM3gv1pSUBBOvoeqfhhWjgo2sjwm
	/iSio=
X-Gm-Gg: AR+sD13LOUcS1/j2qZbsIxPmt2/aG7m7i8fBF/PjMOkj8DuHvEAm5/4Tlm2dofqqAZK
	VWp7jRMD/csDRwa+iSUighXipyxcaFERX460YsAS2NJImzLVzonIVVtgWouJU/9+vRGuLWSCsss
	OZoe42L1c0diZ2vMDuIJbuOrlu1cVt/s5hgf27ah3DHfaJY02g/h6P97uajCxHb6DPFVEeX1lL1
	uxsMiVVkRyvUfhnXqu21PijTej1J9jsvDJEg1RuYfAocnozo8PRdnhzX3yfA4jN7GZhuvc0Zizm
	13eNFlWHBPUzHkn5tGMA4N6CNSouBx1Cn1AHsqPu9w6ASRkCXskHdAA2vo2SJq3iIkIoEaWMIX4
	sDbropl+yqSc0F7xMX11Fl1WPPtzG7uAFlKzWP6CB2MNTxTd0BE0yOl5G+PELDY/VwUvwnE0o10
	5LBmdRv9m0NuKFeu3WVOhy/rsg
X-Received: by 2002:a17:90b:2dc4:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fbc3f807cmr9813149a91.4.1785764987843;
        Mon, 03 Aug 2026 06:49:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc4:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fbc3f807cmr9813110a91.4.1785764987258;
        Mon, 03 Aug 2026 06:49:47 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm39278870eec.30.2026.08.03.06.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:49:46 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
        jtaubepe@redhat.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v6 5/5] MAINTAINERS: Add entry for RISC-V Debugging
Date: Mon,  3 Aug 2026 19:19:13 +0530
Message-ID: <20260803134913.2013674-6-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a709c7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=8h6Es3YqzoBqtYBhd2sA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: uI7KzVJAHm8cqVQwWiCWrV_LtMmWXT7T
X-Proofpoint-GUID: uI7KzVJAHm8cqVQwWiCWrV_LtMmWXT7T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfXzIRndVS/d8V+
 YI0uX6/zXozO6nwvIKCAM160UmGg4dIOrP91ZzlmMnq+UqE/f5vnA5k3FFTo4Plt3U+yEQigd/O
 1bA5mXj+ek/9rG3/QMjKX9HgrPNt98I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX9n7WakoPaGVT
 awwVgzNkZXkm1HJUWA/hq3/AM16Waq3ywfadigIL7nowhDAwBqM4qoMbjZ3TpC4NMkJHHoLZjZv
 ndsMC8j2QYJp9He2wtIJVpA8CFNfVxDahc5yBoz+IEgjULfcKJbXdVCPElUTQ2ffwi34R4CytBl
 uqNk5ZjaPJZ3Bi5NNQLCPZ1fmuU/3RO5oUTDEQuNbGzNuSkl6NKyI3kXpF3bmXKmcxDpN7GBqd/
 TGs5F9mP1f6FyX3stAH6wSiOougVAEtCFSLP/y946f4m5sNExGoBd9NQXtFJnGhiNmibQQH67Tb
 FM6iv87Zo5tONzvhUb/KFIK6ZMe78uW0OwSjqrnyGEvOXvDlWmralCQ0RfRv28kDVBiovrvCLvR
 L4y7XLvkqWQwseWAybjJmZLAuPbFu1biugVTggwn92A2hz/g85Y6hqGII84Xy06/p+e4fxoaz3p
 pxFQEQay4MMLN4lqbgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064950_151219_8CDE84D6 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Added myself as maintainer for the RISC-V inline debugging with sdtrig extension

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..fc59ab4f7684 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23311,6 +23311,15 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
+RISC-V DEBUGGING
+M:	Himanshu Chauhan <himanshu@thechauhan.dev>
+L:	linux-riscv@lists.infradead.org
+F:	arch/riscv/include/asm/hw_breakpoint.h
+F:	arch/riscv/include/asm/perf_event.h
+F:	arch/riscv/kernel/hw_breakpoint.c
+F:	arch/riscv/kernel/perf_*
+F:	drivers/perf/
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
