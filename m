Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A44AC5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADv9frTEyH0llkM9kzRMMcAPPXqtUl4M+qs3+TiQHg8=; b=bnuG1HnxOOrHlG
	tOle5r+pViMfAfs6tKShEHD9/7n6P6zli/4u/HYjGRS7nrOQtJ/gG1l8OFegtJ49ONX8WHO0ZyVvS
	aqFcvav5p5dHJcEzXLqgFA5LV0zNn6gYyTqVWqXSiHZLDY9ZSM990CrqsZavNxzacAd+85jYgUufE
	Xs14e2nGBE03nL2kTlmGjbM73zja68SRJ/qoWJQwbLbg4kaYy16LaIRjcs9xpUhJoh1XmFCsj5GG0
	ZqitThkmBo1O0WTGCWpol0pDQoVzh/lI8lTEX/oeGnCalpre1fUpX9H7Yc+OqwzvoNPjUaG1VMN4G
	G5sv752M3f09aOAbfoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrc-0000000CEy2-18tI;
	Mon, 10 Aug 2026 15:24:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRra-0000000CEwm-2xpv
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:24:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj6pn2816489
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vmqn2TDyzfw
	u0fkZONzvlv8i/iDMucucBNwgndeXY1c=; b=JwBHuqx1ezeASHdBGbjA3CZVxEF
	HdGE8BTeAZKYsZbgiaYxiPL9ywBLbMknPbYF9pUEhQKENnGyZ5Y4HZu+HKwC9VLQ
	sRW0lvLLMeJRgzkoSSvI5WbRN1k8tv0wy+b96kug4l6EHSY5TVmVOhBU6zohAgNg
	GJSUhiiFIgZla0MrUxSj3U4LukviPwAVEu8tVzXO+HfpkqdNe6WhF807yzVxAgU9
	JCtoTrRSBPprLBWZ3BIXfZB/GtxAMyqXVTFoOqFf9B/Q/pvIM/1OlvSqYUrsjTTP
	5CLWcf9T0rAA+Lb/QAfnAXZop8AQWoS6a4mdnl5H1r312mcN+d85eIBgmyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kk9c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1807842b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375469; x=1786980269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmqn2TDyzfwu0fkZONzvlv8i/iDMucucBNwgndeXY1c=;
        b=LC4G+3d0jCZ1BftsAsSt/VH/YNgQbm208XMplQXeNVL3SAXevdPKUrP6tE8dwI+/FO
         68hNhYBMnnrk8KQgZCiKTqbjCbbaDuWc51vwNuhykj4Ze++oWoXMq659h+Kv8LAu8Tmo
         dScRcdgMO7c+AJkwapFfHnqwfVqPjsGwojQYQ6o+hSMjVih0liio/7tgDclPanw8BqQZ
         W5JGs9+Gjbzb7mmUzyv1NpC28An0fodNRrGBhZQnX2IgRKzu/YgFF3AZi2VU0qdMhmkU
         LRIwdte083LKp1XmheLlDwFMlZnPWAcxzRWX+9RyKndmHnJ+ImabV7ADhplCS7zgf6s+
         wv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375469; x=1786980269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmqn2TDyzfwu0fkZONzvlv8i/iDMucucBNwgndeXY1c=;
        b=Qj21XZ7pjWc27is5ldirpIUWE9Bqa1HjfQHlPtR2/oQBwOIv86KOZ9Q68znj45x4f/
         DxsJGL9yXhWoSjSsXbWCacn6p70xOfZBkPiC+hTWIvLqYymMkwoyVTZca+ELxuN9m2oh
         O9yMjIRNvv7+myGaDX2MbuCy/0623cvw0R1neKEz6nr8uGdI8iv/UbYrUdYeD+5KPdnM
         g8HGwpq930hmw7e9QucX7SJownP0LfcEPMsxpgEE4LsVXxk2HmzvAQnVl4Cy/ONQykIB
         35IFqHw1gL97+HtqFF3gnMy9Isu7OkIG74f5R1O9dnmzZeDdgp96z+S8H7+cQcc0QQBb
         qnXA==
X-Forwarded-Encrypted: i=1; AHgh+RpZOgcrfY3HSit6/oiOfxkujU/4R73dG3gOJBVsfAb4TmPVqmngxCY24XDxWct2zDjhjeXxyfQR7aHKgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGRjHjc6HjgMx5/viKHO+qMLhs36trt7tI33HTlsy/Ukw1q9ZE
	EhXd29ZVPzkkQ06hNeuKdbxf28WBHMhrKIqQShLdgxyWmFUK8QqqlF72jubd/czdCJefPVuakKk
	DXG5xDeOKWevPUkWmLvX46g6Ck+duE3+oA0K68km2mjVSW9nyIyGux252thJe1BISNGKMG3s=
X-Gm-Gg: AR+sD12uk5a20kF3cTxG1x868H8nARMqjCVQVWa8a/BUUs2N8BD46jAzeshW8kvDne+
	o8wm1TOmsbb9Fi2KNtn8HYCjBJJZzKalAd2y6BspnpPwXhrR9gKLbCZF6o+44Ju38OEX/A26EWR
	XNmbLqw2R/YSo0ZAAtv9KFlVGIT34To7CnXrv9P1WBRPuahmvTVNLFVZQ99vN2jQ2g7mu5pcwM1
	XgRgKU/yXOl1re1Sen6uut1PPKnp6OMxEovSL5bbbAVqmVrxmK122incyDJEzNYOmWJ+u+g1vU6
	ClFjfJ057Rze6OWiGWVeD7D32u4gXbIvWMP9NGvw1FKS5SmNX7GC7vaA0R42HB7U/9biYVo4JzI
	Or7WoD0ogD8HuWUog18kApvYs4JImz+LGq/VufhJ7j7h/yxroUiQ1DlLbk/B92tBywskqgnjnHb
	GCOR7jICKOHASzyc/S9lLdeihy0g==
X-Received: by 2002:a05:6a00:1a89:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-84f6b9aae50mr19277142b3a.15.1786375469448;
        Mon, 10 Aug 2026 08:24:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a89:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-84f6b9aae50mr19277094b3a.15.1786375468952;
        Mon, 10 Aug 2026 08:24:28 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:28 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/14] perf: Add gtrace AUX buffer trace format type
Date: Mon, 10 Aug 2026 20:52:10 +0530
Message-ID: <20260810152223.3946743-9-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: tgjnh0NBt2TgTCFwz_8WNaLjbYn0pN8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+Pbwfj5o87hl
 8T/2Pz6tgyGk02uHvzxg51JlERQszBUrfK0xPxX0ubnC6Uvfs4fkV3Fb41OxVRiOSyXpIxvvGEZ
 rljK7u/w/6Nx7su0QRU57h2c609ud+6CU1uvfKrb+RtQF19XBFIBpAwmSnOgeFyIIAymF6VNEqs
 2ac3ZA8QAWziXiBaAhd50qwUiowvE6kwG8Ma8xyQYRnemCjdK239PzGN1BxHcVm88ACPjznQJzx
 AWmyN8hk0ZeNCQ6kU/d9ApOFVEEPEx9hfHXZW8ioir2fdiuB5FXNZE1G3ebKnLQnX9wwZa6dVis
 dFqRsXD2cFaYi/t3OblmGg96M9LA4PmFSofiflJdO3iglK/tB/fpVqKeKOjv6MifR3bMWi6ab5s
 dtFkkXZaGlOS/Qk5qaPPwmxN4I/E6kFZpbWLtRkzu/AUkIPghE3d16em3cAqB1hhyUPOCvZ5RFp
 nWmR0LW3+o/6+MH+2PA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX1DiC7IqdmESd
 5dJHN3FAMmmJP6syKbjETUFYInoztdh1HfD6S06M1irPNY9xh/vrOLFJnesZlhdhCpWk2L0qglr
 QW5WlS/grEjz9B2nJrgOrW7Wrdv0OZQ=
X-Proofpoint-GUID: tgjnh0NBt2TgTCFwz_8WNaLjbYn0pN8p
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79ed2e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6jy1HB2Bu3O3gCBx7RsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082430_807321_DC9935B7 
X-CRM114-Status: GOOD (  13.89  )
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

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8d697f..ca2d8614a780 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1311,6 +1311,10 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
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
