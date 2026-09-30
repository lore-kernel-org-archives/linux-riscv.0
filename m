Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6ECA5FBB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6fiIaNT6c0yeg18qx6kStHz1tdcM0PS5YhYl3BT0b0=; b=LOte422QHsLF/q
	g+sJFPX+gtdVtT40vfwtwG17JSr007f3J/vHvGuM9v/nBEgLVGH5k1dzQEAs8JRUlzx5m2r6C7vV5
	9oPqD6uGasidRD/BQs85SlF5tHGgbKDtd428hdNQGVl2XstO0qbdMpIZn4eJXstkgTRxe7ezvO/Xr
	A39wHM5h+fjCUs86XoBJ0Xs/3Dq5AuuSy0GI7U8c5qNPD3FgIAMax8ooSqXOtjCUhN8g7LwY+ifnT
	yFPkyy73LIjBZC/lzs4uItCcbzfNj60KphOSC31hJzff1Vjhm0G7RxhtUJRmCysF1jgEKWGzII3I2
	gpB7HcQTVNHYLIpnmPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnzG-00000005ALC-2CNV;
	Wed, 30 Sep 2026 06:40:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnzB-00000005AIk-0J38
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=A81eQh/mNmHiDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=; b=r+y6pyToPDFpyXVMYdJPydTxyZ
	kkCBTBwojz1weGRlpa0QwAQl6dDruZFVrT6cZWYuMC/xNFWu2yjSETJJuKE/oe6vY2OWKPaUAZ4a9
	rGJ76VxgNwSGJV68tdLoY74scHgj3P07cVdl5v8vPaOs7P18q4PoT0iCZBnTTPna+eYJELLEMhXfZ
	3GGig49M+cU3h1r2HclfMBVwXzkV6XlUVnSwPzYEcpTOI3hoH4b+JwtI25uX8VKIPZRzWRbuykv0q
	y5umD1GdPZwlHVKd+JdQaNQ1uOW26eIijG/gfBZnaOmPJPrnCarifX8W66PbzsnI5AOsknYvP3wqz
	3LTHJiYA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnz7-00000008KXl-1Nk7
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:40:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U2PJDV1522429
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A81eQh/mNmH
	iDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=; b=JB6bR8SxkavlYwB2R2oAFmSYfik
	qKiA3JBjyRFOAPxaSr5FAZwumsoNDZ1EvxiRgA+4MI1J3Kx+qcfwsgvuB3f4H7KU
	08cfYrOQlhiOXoiy+ydVHJZFv/78wYZAf/8UHvC6ERJXGTkExFi16p5V8ePitYqL
	glLVF3QnbZboWXc+TWf+vgs3xwqCytSL8jzaGmCYOHYfwJ3sCx23qV9Q+/yJr8uf
	dmWxEhQIBG/s/SPzgqx+ezFDxSvnIIHy/cGb1bd3WPkpErDxd81pq1HDv0oBWVZD
	ZCDmM0/3AT0B29KbG3EB5XNZvXGSt5rrJiEM6dQaMOfvJHXNy6osd4zq1KQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjgy4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:40:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-142f4306744so3888824c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750407; x=1791355207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A81eQh/mNmHiDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=;
        b=WUCSUS967n1f+ZQqzJ0Xa4bcEsGP/5JNk9kFouBRRp7R1+C+hocMRk9e9denpzv2Yt
         BVoLhx7S6QFq4p/Mwc5P3MLGD+HNeZkDMTZ4Vr92M+2UCE4IRZg9wqAd38Wv+3dLPpRu
         qY1VldIZn4u/vN3VYTm93tcnLeE+9/cSQCJvs6vImpU7FRCcp0B9P2vrYaZ9YvAvZWQ/
         dKbFaV2jlPg6/1JxYHr0EGw6GEqFlbyIJdndPdgPCIknHeeJuNEXZcRVU7hqGyZ4JlbB
         AN2IAkPV7mH46Xkd/0/AVHZv7sbfAR3O1LcU72LGr0LWm8Wh05FlArKP/7oN8JC7sDI3
         WZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750407; x=1791355207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A81eQh/mNmHiDTVrzFWMP6oC61Wb5fR8bGkTk+ZPckI=;
        b=oOe4BloaQnNpE58j+Zf6OlZhd6DxH1JFwNg8uUuKBCKigyr3HM8F1lZTSetzsqFdbo
         NUn6y0r47FJxCHLmbchmLrKI1SMb7foGY0TOjkTWMD59yhGtRUkKrtGUxNwXf8BwVcCK
         mcJyet+FJ4VlhMiSXYtGZ3tKkv+SMFQTujPTpD02Y+9Be+RifJje8gAW1u+LbpHFGVEQ
         +rInQrz1+pe73gW+7m42/Y8E0/vnqH9RVv2uy3lsF1aPrGR+yQ8SdM5P6muw+8JVkyK2
         LBtmhgNMrMk7OjTXgH8NCzol4vI2lS8KMj6JNvuwNDYu4oiijPsAojShL+9MtP1GbdMY
         e7sw==
X-Forwarded-Encrypted: i=1; AKwUvBwwFoE4zfauYYt7WuYBqNroU2KVD8hVGY7FRSbPEMQix0ymSQ86Q+BunJY7JjHuD5kWCPMouVBO9ykh4g==@lists.infradead.org
X-Gm-Message-State: AFuF++mBw3boPLziNuCxt2OEWWhdwTmStrS/3xteuF1d4rp1h5s7WAnn
	CmflF0DBqEB7W/nYSjLPTcsScmAZXzKAdV/p0LgWl6Zj5o8YLPa0TKpoeFN/QBberHQlEciCsrq
	9kLlfVsLtr9EqIbxxl27+ImIsgS3ntgJ6PjroCw/SrhFLPD8W7AXDSDz6VjpBAdd3k6wWVJA=
X-Gm-Gg: AYBFou3+hyoxWF5IN/w5KMU4nQ+9Cw7EdC6uNlQnu5JLM0jKuPdchtmISFNTQTFJkst
	5kM1nPWld5RinLFoKawZIzgvlATlJG4rj8b0d3lemAVllQl/PSbhN+W2DWsdxuG4i2a7kaX0YnR
	RipPPctBscxDYfbkSkTYqcPhYd1MT9csHEySdH5QiTBsHqFdNBQ+zCjR3w1bN67H//IaKYjUbO4
	qN0gaSzVtEc65Bkll69tPvyumwi7drsphg0yF6j7XAa6JgvlPm+iyoAlxTWjdl6/h12WqQRw28O
	o1139plPu9uhrg2ilFk0VDrhKfLjpHTHFTbbySKE8sTnsmenNf53SrCpsCyXAt6G5Gypclfur+G
	jK4ZrGX/ohSv/UAIoAI2TmXlN4pajQTFnZjBHGAQd+kaG/YoV0xl0cj3injXXS15Y5Zlz1cw9UZ
	XFr8gecH2UyJsg8359pX5pXn9n
X-Received: by 2002:a05:701b:2515:b0:148:306c:971 with SMTP id a92af1059eb24-14d323344b3mr394983c88.22.1790750406449;
        Tue, 29 Sep 2026 23:40:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2515:b0:148:306c:971 with SMTP id a92af1059eb24-14d323344b3mr394953c88.22.1790750405907;
        Tue, 29 Sep 2026 23:40:05 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:40:05 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 7/8] perf tests: add noinline to __test_function
Date: Wed, 30 Sep 2026 12:09:18 +0530
Message-ID: <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX6DP2ViJwpI93
 tsHkbykDndoM3K9OwzIxPAgROGKszTErhzfdtu2DJiaWDU7Bxk3VX/2GO6aRBDn6t2IS/7VgO3t
 ZwBsmdTf5obQ1PuE5DbDzWb+KsmzECY=
X-Proofpoint-GUID: 7ZhDQ4mIP2AxYgKZ1Ky_5mAkzF8x3PCp
X-Proofpoint-ORIG-GUID: 7ZhDQ4mIP2AxYgKZ1Ky_5mAkzF8x3PCp
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcaec7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nkb_lb6KKDW8e-7fnV8A:9 a=O8hF6Hzn-FEA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX9mj7mHpV6/KA
 jjfqp+kcgwulIVE+tjIcDBLgslAF2rluCa6qn3GI7g1xwaFtEPZcRjNPoOZlxmPTxyF8COKUraV
 lzanAXlKx8soivCMy/4GyhV9kbn0F8R6dM4RAfPNQHjXUvPQg0gCSI9PYBpGYR+l1miLjWmXJ70
 0xgMdXxAjy4rl4zJk6pNy2jc8E74tO/qjDB5mSCVQ0U+qNsLHWfeHvFDU2wXeZHsSb/MXidZe0V
 tM5uJBoCRwPmOi3YmS/fpKmoxs0EMoVJ0XMriLtY5HIXz3Q9iqNbol+/YC2LqFyD+Tuwy9iAX5L
 0rc8FaeiCXt+3pixEHS6C6Ho8wq6gKue3DOoByjFg0QC5gDqwA9EtCmdh58w2DYCxgGP62b3uyw
 hJOhmYcBwdfgSS+lWenrL9lAAJp3i5XMbwoLybFls1ooc8hnYxkOMgHIng4+D9SYFvEnSoT+oir
 EkgUfOV21rbIhBNemDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074009_681979_078E53E5 
X-CRM114-Status: GOOD (  11.46  )
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

In the breakpoint signal handler test, a breakpoint is set on
__test_function. Compiler may optimize and inline __test_function.
This causes failure in the test.

Add noinline to __test_function so that it is not inlined.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/perf/tests/bp_signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
index f580ba7486b1..cc4a27224884 100644
--- a/tools/perf/tests/bp_signal.c
+++ b/tools/perf/tests/bp_signal.c
@@ -54,7 +54,7 @@ asm (
 	"ret\n"
 	".popsection\n");
 #else
-static void __test_function(volatile long *ptr)
+static noinline void __test_function(volatile long *ptr)
 {
 	*ptr = 0x1234;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
