Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B4606A32C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQ6CrDyz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaYkzIRx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqPrMg3r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q1Gkfz6bwprKvp5K5mqELjinthTT0MWISEb9vWKXvfY=; b=nQ6CrDyz08yQktezdc2USXrVmE
	Cb4PwoYVtiwlwPVLNqMXUxoq1GMLFShGJ9X+/QgCdblj1VmOX3IGznwyDkfcmqpHdyuh6bQPIw6SE
	AWiUJxZuUQ0PccWObZu29GpbPKTVY0gGXxXf5n5o+e8+tfUXL7wd9ZLIM+k6BhNVki3cerC4QiS/0
	EczVdHn48wTZTaRNhBBZr8W5Kepo6BcULUeZyRptAydl9G/E/MGmdiHrMdby6Z8564CF3S2V5GSM/
	LGToo4jDAnLras3CbwE3KbISlVH57plBBYM0NqkDZ8QbAHRP0Z8OtcSuP6IYwmACnvD87wqp4omAH
	hET4I+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWE1-0000000Cf2q-3dOH;
	Thu, 26 Nov 2026 09:57:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDx-0000000Cexv-11oI
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwK92175589
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfRhNGzjGAC
	5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=; b=aaYkzIRxZXcJHaBdp4jSIfCz+5E
	K9xoSbeJbEiDpHz4gtJpWdjdyov6gHHWrrkQO3k8I11CiQ6Na3E4om/F9mLwupcP
	c/PHwgQ1UE2fYyE7tPwyGYqJnTitMHI7qnEP1maElN9pmdh/MhhPQL9cvEeSp38N
	r0rfMzpSagZezwfmgx+2aJZ9ABqQQ8b1Rj4WAMC5X6woy58gCOXVExbNJJe9VLX1
	rUV+OA31IPMSegN9BiKGZtpnUx/A+32Gzh3u5nkMoHGLEjMKPxTBPlPJxmvIAlUW
	H2SACXO3ed8XcaOt79X/jlAZfJWl/zC9ywh1g6cO+wStKnspMPvxiRZ38Qg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuvrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso4452868a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687024; x=1796291824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
        b=DqPrMg3rlXRZYb3zxdylJDbw+EYKqpmKQCTBF4GnNbAr8DSPs2FDfhOL2a+wsApftL
         hKnSfs4izODcHlpR+1b5mUHIHhHYeXgFhSECwZWhEk5AlajfLdV7z+c/n8ns03eE73Lg
         mZW7RidDNuHHFJaIFXQ+meoyWyJ+KvMnpn7TTRY1obdXsUNTgWespNg87+ZWNUJYVbq9
         KqXE69scxDP5n7+Z2yQjqfxwVgMTDT9zyPRf05MbrdlsFRupe5/auln6zbWy3m1Nf7wA
         4UT0y/KxKlTIBU29Ywox4iIJ29iTx68OTQkTJEibWhjCe/YmerB/TzHd+8HBFTt9QPeP
         D/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687024; x=1796291824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
        b=R+J5v3QZFu8sVLQre/JNJsL4d9i/mAA7HqrmjYtfynu/X536vzwT9jHe5DzuVXcQPQ
         zMpDv9H2wy4bEPdvIfiuE6A1TdQqf5G0Q91J3RT9DlXIxaeqKieVzb1a7w9SqDMMcXmW
         hjqZ3XhL4Gkcy2d+5xS3LCBgosUCIT5/LctfQcknroO/XYD9hmUfn7OFOneyYJZAXte2
         yFKelUO0NE0pmj4p5VgYpcBvgof8kjFoG5JfN+ehRq1mrVTPcr4JCl5OeHAJSS9UQWON
         svXZGfMAMOd6FV0s0IqW6q8vu1v898a2cJzh8sf6ZPe0SsFNCQ9KN7Qf+lly0Fldvhlr
         4pNQ==
X-Forwarded-Encrypted: i=1; AL+hErFTbcquBMCcFYXaHlwCjxwr4KfILLPgauhDhS1zRrH85QUgmDOB2XsZBRl7UpFaSWBHrCeBdhs7Z8FeGw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9404cw4THKyyRbzjxci5po6ngX0iOO4vrSvXWIhb/tYI++1oaT
	8n4gdGBb5kQ6TIOaF6nGoRo+ljX2jk5DWTOXhAK+X0zr2zrPZr/FfsxKyCf+0qUwPwKC1pvArU0
	ewb8W72iF1bHfQ/0F8oXbYdgsaIaZTy3PS4cy3V7U8HUf9gOixO0XaVI7dLaB6VCPPqpU1YM=
X-Gm-Gg: AZFdTZdWyobYEiEAf5CTYPvg5x5xZVv30jtaU1bUaGs/hCn88JvvJ2rR+WeqM9EaTX3
	ggxeYUolVRv9D7YlevNuQSL20GK/uT6vkfyu0i05zcLQCn9lnDJn3hXtxhxZ5BPnUN6SOPfDkF+
	1e/0Idxe04zPsp7FacVNzaIst1jFdPGz0etEAxXeNhU98KyNUl9ClICr9SPWPrLa8TGwVHoC0z1
	VI/ZNp5P4KbyIAVwMiVV0RXsRgfNireHmHtMcA1QbovUaF7RFfWt5ZMHWMv6PU9D+ujpPDe/xQX
	uQw4oLudS+5Oo5uo/S/Z8BvEkD3Nd5tqwShcx5/+nRU/CifcNiWJltGFs90avwEhlZsRc4Rd2Z2
	tGI9VnMXfjF0XIfVoJD3Fsl/fv430xmE6NCrm/BZQn1YbSd2O48UE0/9PKMGionLl9h2qGCRvyO
	ekREhse0Y0QMqO+BwComDolmnTYUv56sqe5vp5IUtuKgXBH3f/Bmvi7e7dfVI7P6sViOXIJeJG6
	g==
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr18227861a91.40.1795687023967;
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr18227849a91.40.1795687023520;
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 08/14] perf: Add gtrace AUX buffer trace format type
Date: Thu, 26 Nov 2026 15:25:29 +0530
Message-ID: <6a984b05685f80e6d2f5ab57f0fdb1f79fbcce6c.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: AR_99K9_QTY6vbHTrSLncO5Wugr0vgnC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX31gt18E4tgj1
 dmMJab4eG90YnWgWQAn8Uad3kXXTU7/kOSIa68UmV62/K+pXfVxhfaB95IQezFxyeO6rz69JfT1
 62kdL6K08k47j8c5zlSV7mdSQpXDYqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX1vxlpQldnVHU
 h1eAepY69JsKEs0++IluwAHfxg7Ttxw3vfKP8rUmcLR7ryURcih16tsQc0OMVA3JTQEilWwuBYC
 2wQSjISdvK9iNOZUYGZrmUhjxN8nNGGwUqA8Afz3rr0TosF1jANy96AqDKwAq+Gh+qKJuMYzRPP
 VujCdoR246OM6kyVU5epKKEcnjPfQxJ49u2lyj2qKx5FrZtNbjYgYQCOu5q5K8b+YdcrsNoAYfF
 Nv8CeyK62hXGfTkRxY43G4Th2CpT/mZKc3nGSxhm1FM7gUG4NRXzWljli9igYvVy9IfFvSigMfk
 K/pPPqBJkgyrudDnyq26PI5BRIUP+fHJcVm/Q+qV/z71A+mt2ggHxj1AKWlj0D7MzQEDa3FTbvp
 edkhKFi8RveLuSDsASh0kPz8s8/MyZUCnB/jG6oDK631BxYp4bER/gEDuEW9yp/rsxBeALDlDyY
 eP8X5JoeG2b5ITFV3Qg==
X-Proofpoint-ORIG-GUID: AR_99K9_QTY6vbHTrSLncO5Wugr0vgnC
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080270 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EjOQMhZftjg6WCmXgxIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015705_336313_1DE80B57 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h       | 5 +++++
 tools/include/uapi/linux/perf_event.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index c49fc76292f7..dfbda95a0d23 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1352,6 +1352,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index c49fc76292f7..dfbda95a0d23 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1352,6 +1352,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
