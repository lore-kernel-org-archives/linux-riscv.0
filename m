Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A09606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 02:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s8LjaFZR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nop8ZZz5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8Ikxixf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=15darm/YhO/ZhIRgnGqaaoslLpi2mVjxxVjPJ6VU0MY=; b=s8LjaFZR3ulihpW0USXJjfaWW8
	6K8bNk4dBtzslGxGyDWE+AaVpul7DoBluWsvyfOQpDIj82lk7lcp28ucCteHJyEIZMAxi6gMnJ9WV
	FUDab97KxVaLdW3DiWKMGBtPuVPJBMLx3ok+Cq1fUtuFQWCQplcjtQozdDkZ7L+1t2hDDZF6vwuOR
	QEDWmeFJjqbFbYa54AgERnawi9dVaAGQhRuipwm3GQSigovlJOdHxPegdBUvKVANR2ayNl492bg0f
	X1Zx0Jh0F6zP1wRt+rFTufqZiBQ6m12J0oJIdYo/JByq9n1HGp7IgkjJJtiyI9lpoI/TF0OdjQJSf
	YTRjYW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWMi-0000000E5mP-0QPD;
	Sat, 07 Nov 2026 02:41:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWM6-0000000E5YL-0IHe
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 02:40:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Ap4B2563318
	for <linux-riscv@lists.infradead.org>; Sat, 7 Nov 2026 02:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3GIOH+/c8Zl
	wAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=; b=nop8ZZz50KWkS8urDJT3hxpTV4k
	BAEPCnNgvlCV5nW/ALTCX9VJTey5w3I10a/mjLDouG3WOysCbGYEzn7gNFkNg8M/
	nzpOsFkzTU0Z/dY4mPagcZ7QvQcIjZqzc44YLqeoKSxhr7/j/HR9z2FI+0DuoyDV
	i1bCmfL8UTAFZpvehzU413xo0+FAgXLAC7BKlCtlyydehZhLOkP/Qs49TEO2o2Rm
	Tt6kwxWKzdvHE5kMzJ0E0bXvcpYIna7EiRYtn8YmVfbrX5esD/ex4wFvDxncrpOF
	kmJbd5Xw6pX9NV4pmdQJWV8D0BfLJPqH+N0rZNvJ+7Dyq9HYKMns1MG1JZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxs8300-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 02:40:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso2876056eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 18:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019233; x=1794624033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
        b=P8IkxixfRWg0XEREvWnlWcqqaB/0d3Y1+3k3aX994Q3xO8CyStyJpf8Ye0ZyXWY/N9
         IZ4eURxzuktU4DD6nN33VUfcSPgNwMUEym1shcVyn0MwUCH6cRUEVFX6jDw5dMeFqv3x
         DRQjHfJLsqnjy53HpOzPbp+sXtmjSBlV2kXd75gSom16ImIZRCr+3tjcmihRrq4lra8G
         zoowgxiGxYGrTpPNOHDCbuN+0uQfHiiPFrzypDDRoTotnZBGpiQJJzYkLzTp/tlvS5Xm
         qhFSDnH8NC2A1bMsMA76YCX1/ZCGaNQ4yV8AOq2g46FAzI2mBOdR8kp/gbdWIjuT/LD3
         gCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019233; x=1794624033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
        b=nwGyeyFuhqOxRhKPugtQ9R0TJCuqGmLg1EWkq7AFkTrWkGNhuSRjC0a4WxUohrPn+P
         iqIIqZBvuVR72dn/rzZDl1ZFJF32E8ILwb9aJweS3hjowjvExn7hyEGN7+iFxnQlKVNQ
         bbUeGj22LL3JQ/aIzrz+ST2kP3tXr23w2NnQVk1g0JSAkK+uGubVmM+5c06WMVlzXozb
         o+5faCfxW/9HOshTWU+aFB0HKnzIVTTqbScfC6d6NXGpK5ctWD2e7bjhdnrfClAsTuGt
         q3lEMmuCun8ACvojhaPSc6My/wo+favpEF6ZaiqEjT7BF/7SiwVAuv9N5mfPSskZchHb
         0j9w==
X-Forwarded-Encrypted: i=1; AL+hErH34hsU2Vltpy235snQdXyoKxbxBLm7sJilkpFBBmuXura2sE81b4IxlK0r48C6StBZu3zUJqEOMi6uqg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9AZbl4aW/GWdsau6gkwGQTC6qNSpdr3nr7hun4YUSlacowsgt6
	/3ggB+gcK+Ogf+wPfkVv/+wedAtai85b0kvH1qIaeuXIs04zNBbYf99w/mYj595RzGiws4OVE6g
	w5ljx336uSWBwlfvEdkJEk1KRZQobB89u57ieCIYYQJFTBAWfLZvni+PVYhIttbDE5yf6NHM=
X-Gm-Gg: AYBFou26h1yd4tQe0ci970QRb46wyT5Fq5CzorBdNfK4m2tt/T/+gs9Tv+mvISwhhTl
	9PteAyhf/kC5NDQ/4U6zg81ytaXpPh4W7+CLQ+RzpfpoCEH6gyDjgG1W5swpcMcGc9NKfjC1sTG
	sqei/VghUQ98l1h1nUuMkoFE+YX0D0shFCk3cWn9n0OVmc5fX1X0hR9ASbl5iLkrIys+57P+IY3
	94qfPBEKfDPeF5VQ7nxypTCPANbdNWorPtLwIWtFxTSykFuRYhOtOh0AABRHfuU0+PeIwiQkkLj
	ndFjpvvAie0kiiHoz13odzWy9Ui+qdt1kW9rHADaqfxcahk9eLiNrIeJOQVTFvroVSJ5fFE4f4y
	4xY0z7f5HfMa0qL4KZeLiem/YwClKx+C/TZBSazcFvSS66s4Z8VC1mP2cIZcO4QawWFf9fYLSFp
	Tr3qYl74uotDMbCXBj7Pr0xeNtTjYdqVMFEMXkKBLxSrhNssXPcuNPqP+rqFuykw6hwQ3Qkfh0N
	g==
X-Received: by 2002:a05:7301:d805:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36f6fc79169mr4866617eec.0.1794019232610;
        Fri, 06 Nov 2026 18:40:32 -0800 (PST)
X-Received: by 2002:a05:7301:d805:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36f6fc79169mr4866588eec.0.1794019232016;
        Fri, 06 Nov 2026 18:40:32 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:40:31 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 8/8] perf tests: keep bp_signal memory accesses visible
Date: Sat,  7 Nov 2026 08:09:17 +0530
Message-ID: <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: e0mNDPJTxbuFaXFk6xlWP-4iZnBkJbns
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX9WTBHHOyWHFJ
 1iCqokSz6nYUd65flaUkUON+5iBf+IfC4cks6XZJ4BsTZ7/1nwDWyu3IAtvGUnlw+mvFpFmQZ4u
 w9vYx6BnhCG64SjyE7P/H/guIVWZxGI=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6aee8fa1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tsqkxpHE8OKeFbBeJjEA:9 a=O8hF6Hzn-FEA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX5OvGEmIRRpR2
 NFuy7NLev2lTcF4bA8vasDYZ/6SMPHGGXwypseB5zvpvA4rR7SQxlDkfqq7s5/LPtQSyLgn057X
 Znb4r1xAT7X/KQEirvZ9mV6wDhLgZ7ps+FIWDzvxH4cTCXJPD4MfF8Zb3GC5Wj/8ufhqK0fEUMU
 5mdNBU/5bVAQ5xZCfhF4nsI1y1VI/uB2qR1de37tSPW5K+qWOTICIVYtuhDt7h5XckzMeFPOGdz
 6AQ6ge5882poiokrJppOItImyjhaxn5E9Mh8xRxNAlyfqQ/TbJGzxqqAYPValCzmRuSFiUmr1j+
 LSDGsy33uko76nNRzxfcjUUccgSiL9vduBIUN7IWftulOLM+OTFbKWBatDH9HTk31CmSu55SJsg
 WWChbxT6gPWAgJUACtMF24n4WDBdqHMYH8jYcytiQwXkaYtcdNcEL0srg42mabfWu0lOES75ALy
 4hIyqWwqMs8adG8DzWw==
X-Proofpoint-GUID: e0mNDPJTxbuFaXFk6xlWP-4iZnBkJbns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_184039_476847_4BEC31AE 
X-CRM114-Status: GOOD (  14.99  )
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

In the breakpoint signal handler test, a breakpoint is set on
__test_function. Keep that helper as a real call target so the breakpoint
has a stable address.

The test also relies on the watched variable being accessed as distinct
memory operations. Use READ_ONCE() and WRITE_ONCE() for those accesses
instead of making the object volatile, so the source marks the exact
operations that must be preserved.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/perf/tests/bp_signal.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
index f580ba7486b1..2e4f7747d32f 100644
--- a/tools/perf/tests/bp_signal.c
+++ b/tools/perf/tests/bp_signal.c
@@ -36,15 +36,14 @@ static int fd3;
 static int overflows;
 static int overflows_2;
 
-static volatile long the_var;
-
+static long the_var;
 
 /*
  * Use ASM to ensure watchpoint and breakpoint can be triggered
  * at one instruction.
  */
 #if defined (__x86_64__)
-extern void __test_function(volatile long *ptr);
+extern void __test_function(long *ptr);
 asm (
 	".pushsection .text;"
 	".globl __test_function\n"
@@ -54,16 +53,19 @@ asm (
 	"ret\n"
 	".popsection\n");
 #else
-static void __test_function(volatile long *ptr)
+static noinline void __test_function(long *ptr)
 {
-	*ptr = 0x1234;
+	WRITE_ONCE(*ptr, 0x1234);
 }
 #endif
 
 static noinline int test_function(void)
 {
+	long value;
+
 	__test_function(&the_var);
-	the_var++;
+	value = READ_ONCE(the_var);
+	WRITE_ONCE(the_var, value + 1);
 	return time(NULL);
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
