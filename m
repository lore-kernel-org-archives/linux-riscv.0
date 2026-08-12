Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E06BC5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eUVlUiJm0GG7MNQLDBK94Y8Y90f2G7S8sNI4kidCw4=; b=eMcG5c9SJ6NzkM
	W1N92f+GTbeTr6f/0nNdPMCcwoXsv7unWOgRz0Ky7LyrU9bjTuxzwdWN+So4Wup529WqoFf4KMi64
	dYte2GZIU5m85EkUBAyE7JQ3flDRtpxKk4go3IeKuyD9kofMQxiuFlR3aNTMVFU23ndrqtd56VTt2
	3bOQaan/9c2sHz52ONsv1MxEWW8ECuxUt841YsyZMBXNuiBZntcwDdjKBYLj/gXJICmSuhKGdXz66
	khfYOcgSpCK3XaRCG7W2o368URoQjJBhEJO+hvW+Ez0r9Gx1tm9hdzr6KDcPc2gV7b10fDYgGCXcV
	m3A/NPpHbVpBdpGS1JtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUP-0000000H9uy-0I5b;
	Wed, 12 Aug 2026 23:36:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUI-0000000H9qA-1xaG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:36:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMWn21024425
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=; b=eSISGCsTZhuESIeM
	OiUriQPxzY2s2V0MY9WDyLkqzsmVpZnNG10keHVUCjDiFYRrlVgif6nrx962OF0F
	LXar5f2fXWLH0r14Hbz8U/TmpVVEfG7HHhMGub4qz7LmqnrJQeHirLinATHOMhtQ
	ejVwUfP6txuX6htC+lNT5Xwx9oBW4YMhNVj1L01TSq7SkfXP+RBzmUYJjaZ8ic/1
	XrQPQ1J7TEVEWY7bbLz8jPe47CvAbBg/HLf9pvbhlRM/0tV+oZJH3Rqcr+d13K/I
	VrmiGC2Sd/aEGj1wsMao5nQrZGal/Ym+A4f/CcnDjoddrS1enzqecAoLHaarE8j2
	7WcqZg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04gthd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso2516545ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577756; x=1787182556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=;
        b=htadlunKU5lBVrmVZxZu3ILCCLI7/gxFxbdR3fYRCGtSHFg54Ip76UXxdpiC9CTJWl
         KdAjpm18SU84PXZQv0ZgOby8IRl2apx78IKC/QrAx0NMQz+U6tyMwQP1BytsGJU/3CZH
         LMEMFdlji+LU2JLcuesRX9HT9R6GQYrd99FUaodpshhbmK+SJhBTlsAKo31GncyJyvFa
         vW3UR8elP4tlE7ctYc95z9O0JIlUG3YMEpM8p7o2Png3gyej/PPKk+rZMEkcWCrxlRMx
         7l2nOt80sL/ZfUHpQFd4Id4K60la6JyaO/AJJ7YDz7kod77nVbsBkuoY0EZZPgiE/tkS
         ci0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577756; x=1787182556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=;
        b=YvcGjM5WpQAy9jWg4xBO4vNS5yiM07uoiBorRZA4JOrSQ3n6Gh6QOYSGFWFjXGaDgg
         RxkYCRqfoIToI4H6CcftHXby2a0yqq5RMQon2MVkVlj1uxRElm2F/eYkmYVVcfNsJQKO
         bfwpw/pIhNXJjysc8McNGuY9o19aKht7q2P5TsUSRhe1LuOocbi0z14tTTnlpXXsXw9R
         i4MpxrVJ+GZVWAGdD0Ml20IjQk+7pRYoPvukcZDcYjrV0UP6ueS46My5SIFV0lbncyHW
         LuNAP9XAD8GMVsF45n7sVcqD8MNnB7MPTyrqwBxz6m2pxoP8HWz2INleFlLv5QhBV4I/
         w9vA==
X-Forwarded-Encrypted: i=1; AHgh+Roe7LPlvk18JPaVOjQD5SzMdHmGvHeabmyQ5KllupegvRyECTSWW294iMiPTIhBzKuhiTf9U0wEZ81gQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysgKwqwXsioJBenp0vZ/zfRqZ861SwyU78+KyVzfGT/hLDZLht
	8OcG3eJcrl3FaC4agqSJIOS3bztgFHm2B0ddIpXUX//JrKzfWTNa70546n2SAT1W4LROGbNTyg3
	JNiGiZ6um89lNpMuDGicZFsfBFsmbvJYF0DiaPEjOAiuwFMux4k1oSAOS0drruaoVLz/SbZc=
X-Gm-Gg: AR+sD12/MeGvenQh5JfkZwQ7cfyhKzwfwGWFQ7XrmqzO1GTyAI/Cajv3F+dCOeEypDn
	BrfCr1r/yjqdMoJsEUug34apj0PyrUCzWaTolSDThv1kbU8Xt4LV6fcc0i7LgG0rjwpEw633TY5
	T+o4H/JUwnCQzefHFY9HN/dYvbKCf7eN9jqI38fMq1t2nZGKP9S3uDSOS6HzqL/KtvaIFhT0gki
	FwyKyzsIuW2klJf9IjXOAGNZ7w9V6Hj/33nDlwB44M2ry86+exRml6wtQJa7sATV37vl3Jngiij
	XHz6LTo4qa7U7N/777YIT2gO7ZJ24Lu53R3zTuR2hLU8lcUW53qGSiEAdtYteA==
X-Received: by 2002:a17:902:db11:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d37e86ae4emr13015305ad.17.1786577756330;
        Wed, 12 Aug 2026 16:35:56 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d37e86ae4emr13014995ad.17.1786577755873;
        Wed, 12 Aug 2026 16:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:55 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:54 -0400
Subject: [PATCH v6 08/11] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-8-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=WJTJFyxuRvfcgUEXUDYQIHOAlpEPJJlnDq2dMpcawTc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrGrivyN7P8q399daxNvduthVmLbWt0/4Sw9Bu5VF
 t/OJNp3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETsLBgZDjm52U9sdMzzlXC4
 MCvRTEc/cW/XtDk/PmlXtLD5Rv1cxvA/671i0Jp7ziqvXv3eG6pQwhB5eo5C7OGUh7urA5xnKcU
 zAgA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX2E0RgGrwgr21
 OTSb4EBphNJJJUX22xDYWdPtS2dAhwGh5qZGGgYYc5a4mNL2TLbQCtn6g2ec+tMh9g0D9DOZO9q
 ekpPRB8MYwXllMm3h437grl8OpN9NoX1mf09B28fY27ezH24fGJphHulpE2FnfjQpNGCjwTuwPE
 fHCes0C1RFtEHqM/P2CnCOk4FUGhI7rIjnJeB4oGqrhUM/XRyjakGMwzaipN7LiY/aZpLiZvZiK
 TD8T14ssvU5yCEmy8n5ptqoZgzcfepeICpXJK9BpWabvrlqYPZfbAP4a7IaLIFVPw+uF/HMdgPA
 Vu2IH0fV+nKCwthoIN0/LcrUa+Ru2FvepIxLT5vxEuxq/AuZKKXT7ZE8RrwyJZAvFZcZCDOcycL
 FQOojJByePdl525oFMUjJw/sE0LgtKbH02LRWpSQxqNDjcM7jcKk70bolhaQfRM2a97Zecf9q28
 HY7Nppu5h/bHox/+b8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXxNoy5ijj5qFL
 y/lfEDja6jUY46r//e8n/ws9ZUNrDQqlGqhGJY7ZBvRkoAH3lX5sn8wzcJTZF3LdTKXs6oxgVVM
 1GGY+VkOlwtHhHq6gfKiNwS/2axX9+s=
X-Proofpoint-ORIG-GUID: T3Nz2OadBHhpyp5Gncw8VnC-xqJxD1dg
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7d035d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T3Nz2OadBHhpyp5Gncw8VnC-xqJxD1dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163600_524759_CE46ACA0 
X-CRM114-Status: GOOD (  13.79  )
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
index 49a386d74cd3..da9089695ed6 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -217,6 +217,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
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
index b2df7f72241a..5d9cb108a623 100644
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
