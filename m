Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB40BCA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zHuOlOQmUmu+3i28YwdCIuIOnGSM7pwoOG1+kBMALc=; b=efy4ABQ6su0JlX
	UVTWLcCFD4xtehhkPj2/Fv9BLCHkW0j2YbwKHvLyNyYBqYBn9O+pxJ910+0dyPfVdHto5w7H0YXjj
	sb3fcJsTgK4S8aUx4fPU22xi1DsHmNjj0L02tgIQSYrLG/d4rUqussmc+/+x4CJr4R9loOGgn2eba
	fsE5FFzz2hsP6y9Mf3WJauJsFiviYIcex3j/Mvm3JF209IvhoFCZPwk9HUopSoImg1dXkKP1NNNwe
	CqPTDrOc7O9TnQQE2b/Vv/EAgj51hIUTMDbYnnWbstQrb1TVesBvmSYQB0SvqyklpF+fp2Nr529Kf
	BAkhFKgIaG4WfXxbzcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnzz-00000005Ae5-0iUI;
	Wed, 30 Sep 2026 06:41:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnzx-00000005AdP-3bEQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s+fRCN/HDGvHbTVltets/a+FtP+655QYnFd7sM9T9IE=; b=evMQSCqqJGtdzYf2mPuSOj2nz6
	w7H/x1MtRf6LCc+z5dTLyoafiMrR6ENWjMV05KunZxfYHNjaepo4WsBbDpT2ekIGw8ShIQRtcZFif
	58tdihym9axduSUP0qdNR2Hes1af8/AoHcIa2IIqtO0rYlKkyKCSsmbtDcqsHFQChfIM2qd9GIPb5
	Wts6L8qn5kO085cB9gqjCxEhv9ifB7oJ6LY2aEe0WRxtr61uZmJbAv0CVUjQUqmXLxeTNiVZPNIOZ
	3uQ7TT/FQAuwXrS8X8AOG3lI//KbT+bVnfwDw8EJPSwKiFUPY5amOBa4LhrbEn0TT2ZRqTjEsAbK3
	KtwwyHLQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBnzN-00000003QNK-0rtH
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:40:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1AQg91264055
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s+fRCN/HDGv
	HbTVltets/a+FtP+655QYnFd7sM9T9IE=; b=cTXtMncVx8F9bZEKQ/5WPNqofvn
	H8hvw+EMPs1XuYSMyK2b1qKcaeTLGmsEBlIsDbNG7l69KFdiEf9g+p9g2ITntvP2
	1Y8Ny3t0aitLBUNCYe4ySVOaOqBDHVa7xDX4bVpJWMy78sgRwwZDHep82RBNqVDt
	y9B4xYvvAFjHip/4FT+EI4HssNnxBNm2g9ioVTs2K/tdeshhuLWmCudnC/fXvUfr
	Rca8PiE412FQA221ZWRsIm4lgo+2QejOES524WTJUW/9872Ws8/702XFj21F4iqx
	W7nIOrPBDCiSSobgfByaCo9Lt+s3bHIsMuJLWf+vMpzzPyXI9MU1p6g6c1A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheh913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:40:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so2186113c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750412; x=1791355212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+fRCN/HDGvHbTVltets/a+FtP+655QYnFd7sM9T9IE=;
        b=XYpKsHwRQmp7+DjekbUjWtxlNKRA8iOOB/Uyu08gGDwuVwANvIThMYvxiBKapFgBZE
         q0+UvfbLzb2Dv6YVMLMtqywyenqEU+dUgN8WlzVXRVBr1J93kb8G9sAfoWNEd2McYKtD
         5HuVGRxQxOzhfRDc+C79T+Hr+vHdly6Ja9vni0EkhKzpenEosXME3vscsCoEaua9JTna
         S9HCd8MLrs6eFYSkrIEkvNxzM0ylZcwp0LiItzg5gOfD/iGtzYWcsEvuYD5OpPfmJTNc
         wd3mvIvK+g7gwpqMaPWX9J53pDdGZsHjw20Df1ztFtgh0nXVdx1EcdF/3gU+Zdbbm1JM
         7PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750412; x=1791355212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+fRCN/HDGvHbTVltets/a+FtP+655QYnFd7sM9T9IE=;
        b=sDIPnGsXA2IZPD77OReWz/ZKOacum8C75d7oIp2zLQnuxHHQbfL6FMR3ic+fnbgzLi
         DdyYxyE6In46WYd+bQyXAWGbykvt3hFyevb/TIZTVKzivz977CsOeGNQPSi5V9Tr6Q9m
         WnO+AQjlXeXX6N8fe+gFqiU92T31pFG/dIbXnY27/iT6mIBR84jtWtMQ0bJpLCnP8CCR
         VIljpOC6dBH7KzSYN6RUa5qfkpflabIl3S519Yu2SzUd6Gw3Up/AWVffI0iRgbWUPR/U
         zn63tfHwr4WQ/v0DEARiLZ9T0S3vcdLfQofMLWHRECZDm80qqzDJrStubWTajOBnQywt
         YQ6A==
X-Forwarded-Encrypted: i=1; AKwUvBwHPP5erT/54JXb9A2+OX63ZAKE1UyS4RczjRyLTNmr9CjwW+R/IDvTcHb9ltbCfWAPHVDlBlyUDF0y5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mTCclsBiFCDjeNHNATGvyPdlam8o1zrT/zAyVMJhmaAjGJFX75
	+6zQ6XatcjmiKBFjuTC6TC0RGmUD19wrCAIWiLBlMBpuOmGMzUykN9BBi/lyKWXbFS5W161N7lR
	khMA0lnmA8g21kO+UFTSQ4A6tS5x60KTPH8sxlWocAJFrTXJSduVt5P1rptkvXC7LnerpsRcMJT
	vbswA=
X-Gm-Gg: AYBFou07Cqu1KEZbGUNn2rFSnnLU0ZH6AkcJFezNg7rOUpUEnLNk3dVN7wet0p892a0
	/8Xwutm1t/NejH3wX7Qpx/04H8W+R1VLEjrhN05isoZC4tSNdx8CgPljpZe8DEbWHZvCqU4LQlz
	EYq8DRgzr7wyh1JKDkbdzrIEgUx9NFg0pgFj3FzVD+kLHbI5nSrUu6pwV/pGvnAbh2L4+ZW79Nc
	5hxKaMvD75y4rqDi0e+wpyy3yAF+XLzYq5tUkqKL5nzj/gMhe8XVuvmvev9nx5WYna+Hjy24CF0
	yE7PjokzCOpoph/MmDuzdwriGnsw/4h9v1enc/O6a279pfzXvFqW7kKRuetvKYXLPSMKN8x486+
	2KeDtWKwfwJTHlZ0tm5JxOX3MahCuYyMPAECXxwQ/0f7V2CdMHfBv+QpwXwG142F3bT8Iv9P+n+
	7SHzy9b/hZz3P3OWlcJCNYTVH0
X-Received: by 2002:a05:7022:eb51:10b0:143:271a:3df2 with SMTP id a92af1059eb24-14d33f3dbf2mr303349c88.44.1790750411723;
        Tue, 29 Sep 2026 23:40:11 -0700 (PDT)
X-Received: by 2002:a05:7022:eb51:10b0:143:271a:3df2 with SMTP id a92af1059eb24-14d33f3dbf2mr303315c88.44.1790750411139;
        Tue, 29 Sep 2026 23:40:11 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:40:10 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 8/8] MAINTAINERS: Add entry for RISC-V Debugging
Date: Wed, 30 Sep 2026 12:09:19 +0530
Message-ID: <20260930063919.608911-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: hyH8he_TRnRh6pbBxHrK_a8UxbigERDj
X-Proofpoint-ORIG-GUID: hyH8he_TRnRh6pbBxHrK_a8UxbigERDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXzzpsLnwob2ue
 ULPjkJVKwJd9aSxbMpAsh5dpjEyBvZIzUnNTkr0rtYw1wSurhd61pMZ7LT4CFal+/XIl0xNwtIj
 PixFDihjYZTBK6WNjpTQkvLVjgFB1TofFvsfHzbgfd0qGv0PnL4VptBOap/vbF5E/WAZPnmI9c7
 znhJ7SP29/Jqke3P8C7W643tWO3Zo3dOxbMCQ2y7nOTOyIQ0qV2Nlqwj9tuqzIZgVVX+s1Zl37w
 DeXuzR3fjUyQds2rMdTzcLx8mZQWQWzMJqwhYOOHWoNDArBR9vBofepQN8kiLZoEZWDIJERMduQ
 KGUe3EKj4AJTys7+8VUel2HMZ4fssg8WaOlQqMkAswjWKyIeSVRrjT2Ndjgp+44CEzCKJB53Whq
 C36pwCGY0e/XJzogFggDuT9i6CbK9hL8WG2oquNJ0w7GVJYd66YLTfBeBgDQq8FtUF9SuyoUAq2
 Wu6b7lr3VgLUi3/9Hqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX2t+bBMMw5tTw
 ANDmImW7p8IuJWMHBtTOFYgQZAZ5ys3RX1IXo4sCr2zx18Mo805XV3d6DWxjdfe9Vr1wO+MY2qV
 qpNLjBBt/AkqCcUBJNCY3CAOhi/mpuA=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcaecc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=8h6Es3YqzoBqtYBhd2sA:9
 a=vr4QvYf-bLy2KjpDp97w:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074030_710623_16EFBB33 
X-CRM114-Status: GOOD (  12.31  )
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

Added myself as maintainer for the RISC-V inline debugging
with sdtrig extension

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..01631359f0ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23586,6 +23586,17 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
+RISC-V DEBUGGING
+M:	Himanshu Chauhan <himanshu@thechauhan.dev>
+L:	linux-riscv@lists.infradead.org
+F:	arch/riscv/include/asm/hw_breakpoint.h
+F:	arch/riscv/include/asm/insn.h
+F:	arch/riscv/include/asm/perf_event.h
+F:	arch/riscv/kernel/hw_breakpoint.c
+F:	arch/riscv/kernel/perf_*
+F:	arch/riscv/lib/insn.c
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
