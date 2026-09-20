Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879B9C982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8ypz7ZGDeTpk3RZxICzHWB/dUJ0Lyx7zriPcXKvGGI=; b=4LL+esYlWCdC4R
	vtoT7N1zMsCHSKM5zSpHOQBBNlDg4XexlHQ3g2bPaZfo3Sdgv3d8i3fJ3EqpWJmqZYeYj6JWjveSP
	x5ltsbWcm1qtig9SG7oP+KREo1BovGqE7miQoNBERjuqb1CjOENcu7fkfrh/0WSyfLRd1eUbSApFa
	7fxh1URV/QG0WM4jaEdaYl1WiWu5++8f/CLXkhx3yF8sILE3S8VHDMJNx2ErtrBrX5rTpYgoNEur5
	mXoFqdhcRN6uX4qj7rPPs2X9MYY0kSaZH2fVC7CT96tkut+eVve9DaaUt7ZX+hmpbIbyfwdKWL6Ct
	QEOUVPVDE/8EwmA0e9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bq7-0000000H1Ug-377q;
	Sun, 20 Sep 2026 07:19:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bq6-0000000H1ST-0Bn1
	for linux-riscv@bombadil.infradead.org;
	Sun, 20 Sep 2026 07:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=; b=d5/vGQP4rnCj3NAmAgcfSIflSE
	k9ZCgbsWzLV2x+gqy50Q2PBx0gR8L0rPEwYKz440+8S7bUMETWeLsENoGb6AQWG6Y64aGc48s8D9l
	u7Z8pm4jOdEGvsNizmQT1olEvcNsl+f4UvZmd0yABCrrKXlDTZDAAmv0kPwdXO42l59jnS2eKH+yD
	yfGZa/9Xog59MmqW6nrD9pZsY7KU6954VD3I1QOQ2LcnO09L1FxzlI5MgmoH6aQ0QYn+MxeCp+FUJ
	ydCLblNyEkuhiiwhy1HLHJsKmGM/HjY3+BTonahnvvA1hRqvEncTUukZe8IvI23DMuk4tCELISbYh
	NqHQqA1w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Bq1-0000000BF0H-2JSE
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:19:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K5517S826150
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=; b=Ji9dB3kQ9pXQRV6U
	gKOfAccNEGUioPAO6HLB3san9AM2oQq4Qmrt7i5NS7f7XZeD8HJ+SKBop6FU9BpJ
	jMQc5QCeQshIWKSlNVSk3ksJENOtFF+M8Rz1S/5IA8WhcYiXCmcz+pIFNumrl3Dy
	grlJB/5PwGWJ1sbCXYjaz/w4u2ZGZyY1i+1LhzReVJ36Nn+yg6U2AlYAL95SIZya
	F0YLZo1tdPWb3x7/0blqgLVNg+Igntw/fxOiFXnNqOfWt0zftivt/dxNJUsu6AAe
	vk9WWpS3kFK2Z3pBp8qIldjtBNtbrZjGW8PBIWJAJg6XvDd/zpFlQL61did31olN
	BZw/fw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82dtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso30693695ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888786; x=1790493586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=;
        b=UolkorXjw51I+y4xkPanu7kzocrjgAI6efN0eDEzGbPq5Fd90gjvNUrRY/BZ+9+5Ly
         eTNP/iCZ51m83wDm/n0ddYuBI98oCARRtsTJqPGSaPDaR20a6fh4wlghZoSaW7Th+fYD
         k/hKr5LYru1c/Aj+T7g1oihVy9a6qnmOklPLzIJun/0Lfx3J13/ou1OLFVGJT309uHIW
         kjeYq7RTa7SaN9if7CoV2eugAz2oIy45ItmN/5J2Esz2e3vuni93+yJr/+ccxyhuBA13
         2QfhjeLS5gbSu+S7ZCmLloO+3tHKbANiytiwK1YOSffaFr7xPtr4rP6uxjz3QwABLVjN
         gkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888786; x=1790493586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwFEtfBjggCgKkBijtjyuel976Tg6Zs390SSgwRh0iU=;
        b=0XHPEGhagdbRjwh8SzXZU0JPXz98NyPHhDZsBZK/nDAEiXR/KJAX+XHRKl+o+dNFut
         HIzooyabApOk1z5905GCGlG835eCHhiDyVBIZFO/3SF7yt1SUq3OrG79ahNLCwY4KEAD
         G0NEOg/x0LpJWS72/MYp/Rbac/oKk9JM0wVQfcMWXDrlHldNGoN3HCC1f8pGesTsIjU0
         RCS+CsmzqadKwuqOZZCvLk7n13vPNkTci0WeWKS1f8NTb0aZN2fjm9bWM5fXTTeEYrv1
         rXBRv5XxnYyLK1CYgWoJeOrjVaKD9TM7ZMmLTbkSRVfjgTXf/Y59ATfiCfuR/HDUBffW
         0WiA==
X-Forwarded-Encrypted: i=1; AKwUvBxmMpywSVqvN9h0t6+BWWb5ByKsehCA4Z/RnKH3hT+Ujf4iEpyLg6IiQB080IqLiJKKynwZ2HRoaCFJFA==@lists.infradead.org
X-Gm-Message-State: AFuF++nRXNy6R0fpsW4kcWoOWKgbmL5SzkJ43i9QtLXmR41dtbSGWpVN
	9NI3BROYG7/XYxpR4+qenibGCGfrrhKkr4oz6G0L23ccOOAiMr50DsjpQjzdstMN/yJVqvgUApC
	buxB8OTXVs/RtTIJwBqM8YRyMjo7ShNufR9AECVF1Yr8GbjsedPjK9YDDNrphbjEM+suNTPE=
X-Gm-Gg: AYBFou3OJ1OpcawvuWYIVWIZeF/4bEWyhkhmXcQQIX5B0bEpvdIyj+eCS0KBkjCg/Ou
	w/2XJ/2rvmO6B7JKetDypOOGBBs7xia7Rhv09hlISaG2HxRRds5ij2RB0FkEKVGbhTe5YdIB8fU
	TYXCgJaK5uwg7HwpqBppxm012Oj06JwEdA1oiIsIFJdy864LMmk3WQOBGUKviwk8rPKDdK7OROb
	uNM42XnDoG3OdPTvsfGLXk2pPdK7EueGrQ87qsB2BqOPhSdfFyvXldyDdEGXBp01qcFhSCw1NmH
	MO3qgkWtDfrK+uqCRFW+1Wyy9ZHTDwKoUMLPxqv7hvkldoD4nwqk0HhN0Dk=
X-Received: by 2002:a17:902:e80f:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2ddb1adef68mr123445035ad.9.1789888786388;
        Sun, 20 Sep 2026 00:19:46 -0700 (PDT)
X-Received: by 2002:a17:902:e80f:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2ddb1adef68mr123444895ad.9.1789888785968;
        Sun, 20 Sep 2026 00:19:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:45 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:28 -0400
Subject: [PATCH v8 08/11] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-8-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=Py+tkwh2uQDfg05jm/Hhva5ZsBCsjH6Y+7RDGQCi6IQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HacEjtS4xvTMTV8vbzt5xt8z0Tf2/jNhfHp9e8lTw
 X0sF+bv7ChlYRDjYpAVU2Q5fLQle+srn2jf55w/YOawMoEMYeDiFICJdOxh+O8TZOfXtXHJOyP9
 Ffva//xsMUs8X/6aJ8jYp7TBLksq5C8jwwpFfq5zpUHJsktlmH3YDXkOqs28HytYtzH6WaKz7Q4
 uTgA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: tUcj4HIqaaetskKxnWCmyOQbTm8guzzX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX3Sm+QARV0ecq
 pPdn/p4TBq4uAG7IpfOAVeuhjdEdhotaD47wnfmXwLXHBTNbj/kSfyOkbuRlme4cM5hg8dZrm7o
 ZQTsNtLPQ4q/CsqWhiGujQs7c3FKPgc=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf8913 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXwOYozAwcl9w8
 zzAF6dAqplObVMzRp/dk5fnYwB2cz1p2P4LM7fM9WOmMTTiYwK7XvCZRfSq4aQoD1+i1H3p2rVX
 3SU/10cNeV/Pin/ekT1ET8zNSgKzNqzCIC5qLgpK//RTPO2dMtD0miIhuQKDEku+H8IsqS/Fz/j
 IMprhuOUWVfe9hl4rTs96XEPDZV8gLg+/wRTyRai1anBlKT5YUtro8BMo6eG5oG1vU/6bYu+bMr
 97YiyAtVJeF0/psBux2+cpaiy4eyQ7+YaG36Ca9HzDWUoZd0sCs1EotwkMpmQO2vtUe85/ETYKK
 zh6mt1SNVYx35gl0LWqxq1oZACrRs8HWN84rWNplm7wbWnkTI/JWMcTJ1gPQFVkyOzVa360A6bY
 l2bOSk1OoM+b8NPQGqJvH7vBzos9uKdd61KlbfPDhVynJE7PRD9HcaRQssL8SHunWlFRA4UH3tk
 riWiVI8289+BcRjcx0g==
X-Proofpoint-GUID: tUcj4HIqaaetskKxnWCmyOQbTm8guzzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081950_646657_4D624CF2 
X-CRM114-Status: GOOD (  13.78  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: No change.
v6: No change.
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 815715c67f94..fafc8f88c69a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -225,6 +225,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..34c1d498d1ca 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
