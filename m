Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD04ECD9B5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzgttvN6Z7Fe4d+5sItjXpq7J3U/PEVYDQqKAM8wWUA=; b=Oqwkw7LwmTBlAN
	/4Gp2MSkwuW+kOkJNjfLntu5p2Su+pzPC/AU7zeymBrKFFJR8VnZIVFjyNpV6iDj8/TLfnBPcO3Pp
	9GDry1UBD+DmVoPwil/iZlPVonz/yN+IJMYg8IRdC+RCc/1QxIt39NLZVp73FvWlCaMGMnk/2fUKO
	4CYj6Fxdrtb/O2KbRQpZWublrXboPG4fSrpejEyhA4pZAgXZ5nYuWhzDAySZGn4pFzp8y/cZfdXy5
	0Na1CUhUN0pAdHbznf/O1Fapv3RIIc4ow+ESQGz6YiadLAd7XwLwTdwJJ1Bhb6uQ8PKwosImL8gkc
	GJJlMXTcDSq273EgAS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dm-0000000Ae0j-3W0w;
	Fri, 06 Feb 2026 00:24:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dj-0000000Adwk-2NY0
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615MXPj6989438
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=khQx4CnsxrI
	KfW3vEXmfF4aXf0Jm31HPz3k9tr+YE8w=; b=PpX1Y8rD9eCF+HPoploepd+UF1f
	cY0MLRNcqfLL+8T6C1IMkKvwqzLGVaELpX8hmiFfQGQ2pwytDZlB32/aRXxmLwDM
	Bc0h1e4DYg59rW2qlxhgICN9n6O9OkarS48OOTJ5BB7/ChFM4HgvSfNtkA9TdWZW
	ayH1rccBJUbroPN2YtFDN5XzX8SH5+lyGP9c/IcdXwUgNlzl1L8/3uxJ5X5pPGH2
	NlRiGxLl5IOtFuFDPv9PdkZelEIkjiN7/JDwPULc+DMqj5ng3M8YWWKaH6GxdLDn
	qXj62R4SYSmiJkvlIOAgRjfU3LgUT9d6GAmst+vnZ0jBhf11DPpsAzdFGbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4vxhstqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b75222e9easo8352860eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337442; x=1770942242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khQx4CnsxrIKfW3vEXmfF4aXf0Jm31HPz3k9tr+YE8w=;
        b=crqb6RSYPIcmRXaIRhBWkL9pCsBHKP+9pBLNiCPkxZkN4nYRiMoY5IKk00d21mpICV
         bgA7EzIyGYClfdB3rF4HqAaKbJslVy1UPZXN2Fvqol+oFu6uepZmHyXQSdtq90eECyjp
         Fwhf1DFrVzmppPbCHn52lHEfsrGcqm/0tAPZCj3mjdk1DRPJnNrBAjEZEUZg7FmGY9WP
         MNUnNSWReA7CpzxHW9pVs0lIWPPhOcqOav4DFl8styNRNSzHKdAGwDtXu2PybAMFlxJt
         UqOb0e4ZA1LQZRqo67XMcGVdhdInVLOlNhqFoFxGuc6r9Yp1Ll8pj07rE1+mUH2n3zaf
         dMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337442; x=1770942242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khQx4CnsxrIKfW3vEXmfF4aXf0Jm31HPz3k9tr+YE8w=;
        b=C6pks69vjV1QQormvwhDfRHCAvJmaIfyhVojHAegOmik212cqmUG5uTLxS75FiSqJG
         DDkbLSmDhSnsrWk7g6skLHFEh7RO25sj1OCj67RCS6tuPWAHxaFE2pZGBaVaZd1le9ln
         O6FUy7s1qioHnlbPcW58VeJCFS/2QMTnqbAgZw3He0Bu5jDZy/542xlO8RBMqwqX/QjM
         Fqarnfu2HmyDWod7GhhfmljV63QB7vwFVpNtiS2P/4SfVNbXDAwHoIqeG4CoK3FsCWBl
         NLTNYnW/PWJT+8NiE8zy1HSoeMMecwzTBsRFnvar/v2R2/X5OMJiRz/OFqDgcXsUn2Pg
         52uA==
X-Forwarded-Encrypted: i=1; AJvYcCXAuz1lSG4f7KS0nnjM+1LJ2eQhQmgiv3oC8gD+Ty3WNng6SJLlL+xrgL/P4QTlYkcRX8tRkFqxa0oBOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9R60Yf/WHD1YfoWQ2npn88f+bvh+My/nBU9nFvvFw1Hb5i268
	1sr2TmbYyT/3E+VU683X2cGMfocNPY9u5R4bpti3FeDMSQ5WXRvtR9N2zzKI/cO1j8DgHePl+sI
	HM8Q8rafb5mElL1+ekwm1lJqvzSipXQ3c/L58Hkyg6d5RMEWMT+cwLZdvHx9smaQi51C9TJU=
X-Gm-Gg: AZuq6aKi5AJ+0qlPAmfNcTqJ7fprx/tX3jY3qpBNSsoCh1B/oPtPGF9Kyx28eO5bIrk
	6NYO/d9G1i89wRZK0yx46phpJcpEw4Ln6rBnnFI2pd2UaiXYfyX3CAfyhsvriDJUCkqkjk9Pr1B
	7/Obe9BOr2kPzJJzW1CLgl7HhMmgig0H8YPFf1EZDi4Vlt7LgGnfcKjg/kQ1NI5WzkHbcjM3SXD
	YYsj0yEZC/9Gy7bsfkfLD1hrbsPHZ8hsRyhiVnQtJDUWm14tSlJQYk+qkQFANXiqojHBs29edg1
	5fftC3HxIgJQLyugE8cO7TSDjSet5gGEPDTmi4oQU5oj9nPqa3/73EKRt5j3b2c74KTfnnDh9E1
	yyu6vSveWALB+vVn7cT6xVrA2sp7k1uQ=
X-Received: by 2002:a05:7300:e7a4:b0:2ab:ca55:b762 with SMTP id 5a478bee46e88-2b856a45fdbmr432288eec.41.1770337441609;
        Thu, 05 Feb 2026 16:24:01 -0800 (PST)
X-Received: by 2002:a05:7300:e7a4:b0:2ab:ca55:b762 with SMTP id 5a478bee46e88-2b856a45fdbmr432268eec.41.1770337441051;
        Thu, 05 Feb 2026 16:24:01 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af6452sm700373eec.9.2026.02.05.16.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:00 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 05/11] riscv: hwprobe.rst: Replace tabs with spaces
Date: Thu,  5 Feb 2026 18:23:43 -0600
Message-ID: <20260206002349.96740-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=698534a2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DjeV1u91x-28HgnErZYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: iyQf8Kdt4iUUJk2YSIXD3JVt3gVWB9jD
X-Proofpoint-ORIG-GUID: iyQf8Kdt4iUUJk2YSIXD3JVt3gVWB9jD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfXzTznidG/nF3g
 h6ipIeFBzHLW2QjG4eocEGOZIGwNMJCwLG8Z5rmKVQFikigtYHSj1D9d5bq2C1iHlPFDvTsQuGz
 3oeDJqx+nKiyabY3CT2dy+1fK2OOdeAPte2kCUygvvQogoPWac0KyC91Jq7KCdLijjF+j/pOrYB
 oh4aQqwFz/xnO28JSWhHCknCJeQ5LJvsQ9OJUii8+rX1yZeI7R/s5iQ+hoTHqcfmtChBobFkM0b
 rkZQ/cM50wlLXftURFu60N39R6BLI0v0dl9/2JnVFfJv85EeavNpVaZONEsZHR11G7l8kE+7ktE
 ZKdpLw5cgBPx8Q6Jyy2iGApoz/d+4gyhZpnyGe3DZf7oW6Qix8/I5n3VD+KEOBSnJO/3N37Mu7M
 UZOHOmvo5Z0kxS7wxCYT/00dBI7VVSa3kj3i+q2FXux301isSy6Tyq6imPKl8J4xJ/3ASvOcAKj
 X5tLFDLw0n6UxIqj1HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162403_713306_1B5881AC 
X-CRM114-Status: GOOD (  12.99  )
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

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 0598c9ddd73f..4484f2a7f798 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -362,7 +362,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
         extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+        commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -375,19 +375,19 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+        Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+        Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
