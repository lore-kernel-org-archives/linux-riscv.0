Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0290FC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 02:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVHRRHy91x8s7x+NQmyt+nnApMnEHPRDpPEy7iOHjdc=; b=OuX8/MsrExAWqw
	iYNVwiqXfYX8cU7pSLSNbQs4oD2fOWKMBLtUdZh+tjSh0FJhMBsUb/+5pkoWzs9x00VVlf3wy/2eA
	X3JdtGeRwaAOVoZ7Ec1iAzeYrAiuyEfhEG8FXNsfvOaiwVGLdt+Q7vzw/WAXGBPGtLufAsDUooFPa
	ilGi8hthQtzJUQFqALT0gWJCNOF+LgJbyf7aDr4hhSovln0Azv539na88NfYlnwpGpYk9iuHqKd0r
	+6p1SDKCrhEKsD1sMqsb4JzpNsejhWK3rTqQXsIDvsrjgneI1TGdbv+TAxHeAdCtKP1F1qqJbVKlU
	PZT66OGgBfliSqPngKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pykgq-004AdJ-05;
	Tue, 16 May 2023 02:45:28 +0000
Received: from mail-dm6nam10olkn20820.outbound.protection.outlook.com ([2a01:111:f400:7e88::820] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pykgn-004Abd-16
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 02:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9DjbJPCDI3CJr4+UjVUrWMZMTpyhZ/FBH9ElDj61B11j/4GcBRO3NauSCMVnUrY08K4opCDbzzS40KJQeaUmcYHSL7knkEtqpk6tmt+jXoTqjfQEpLkvoDZ6hlPJX5tQ1/wIV5Dv5VOlN7VQKOXbc4tyvFY7A9H66jte2BZX938tXpuUjLsLRISQ8RT20+q6x/iy+X0aQi9nbjloq9iV+gIDxpt00DXm8B6D4cFLL0TPMPcVEXMIsjBh4LOyadu15PauvdpfFo+yZkWG0ENQiM2XrhpT9Zf1SVqYH7Rw/N3NNtpOO9tfSjz2s35AVVBuNBDsEfcupgQM82FzYeiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bO2caqLVL4na9vRhaLRzHMHo8PPCtDQLUiJLAMxFQKg=;
 b=UN12aogekRIBQhWdK4xmZjiYleSs386yBpf7WHRutoNjLQo4KPkOhdZpOMZuKA7Ih6qv5Xrw+Ga8XpGkFHqyuere//WbPliPqiFJBSxVkuQGNQqDgywUTA08cJ4Tm4Fxj0EZg/WMf5yuG5FLmksJTuDLlmJ2Yt6ZvLExiD0eq6uJ8Y9sJFoGHwtDe7AMbnuHO15tMxcNU8rRBVTiOjZhL4Ht3eUcnO7eLde7+y5SQFSoxxM514j3onSQIKLl7tSgce16IHVlXyv9wBeELH+LJCFnfoJy9bzNNEBn78alWcqwbZlYWjY8wgZaB9jcySzR3na4RyFIspwsT/z0/Mux+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO2caqLVL4na9vRhaLRzHMHo8PPCtDQLUiJLAMxFQKg=;
 b=C5tOhjacTtRW6M1eTnK8VOe2RiW9FPkJfLRdnkJWOeADFBY3PgbBVe6bu/H3taDp+g97ha5z+YpJ3/AoMR5I+s/xdxApWYEocuFbNUikElYEvw2B2Dw05oyt9RqBt6Xu/tNGV4ymHgfBnMaJXkpYquhf7Mn3mJ32eOaZzEUueX/2wUTxzIHTj0WtqQNQBgQXTKRCQKMKsF4I111tk2Q06DT0Ps63A6heiDJgBSSI71k0k/CSHvrW0zjSorB/2rY3BhiiDlTmu/q3Zwu/zdYoHoULj2ZIbArjvP1kHytqIwPTNHchP+249Nv6EcVRFZZ2KY1DAzibYYlJWkhjOGnyXw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB4457.namprd20.prod.outlook.com (2603:10b6:510:13d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 02:45:21 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::4770:9e0f:7f59:1989]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::4770:9e0f:7f59:1989%6]) with mapi id 15.20.6387.021; Tue, 16 May 2023
 02:45:21 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH 1/2] perf tools riscv: Allow get_cpuid return empty MARCH and MIMP
Date: Tue, 16 May 2023 10:37:13 +0800
Message-ID:  <IA1PR20MB4953E8FFED81D5733DDFDA2DBB799@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516023714.306240-1-inochiama@outlook.com>
References: <20230516023714.306240-1-inochiama@outlook.com>
X-TMN: [xFPXv+togL8Ze0Iu4euHMYKGdBZiYK9Ci3fEUiOKbZg=]
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:  <20230516023714.306240-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d51821-b946-402d-3499-08db55b79747
X-MS-Exchange-SLBlob-MailProps: 	AZnQBsB9XmqZFoN70z2Nlv7ldomxpsZ90jNkArboxeBTfSDhMBSZt1qSs0G+DrhPF+GEPwxJR7lSVkxivYiW4ZcjdcYHySOS1ddLYZtI4sBah6430phEx1akXvI25rH2YrhsRJwXlfSloYs8G5+mIUr3fHflS2RTgi8DgU9rKFwZey6qQMh/d1mxk56MT0Glwolh8SMWUGzPF+qph2kY+l16zp/nD0t5FIYGX06agCjJM6xLP6Ar6pDFOLr72zkq8LJqxPhJlNIfZ9TFDRuquksZpez4r99EU+0+MyQrPp9pJPD4aKvRVlUuoWna7D5k99woyMNwY1O4ffbSKEbyQF8YDGwMZr/5wfu1WGQddM76bJRdGBCx3XQyIEElKWd3jG/l+oavQI2Z5HWUunZ0SQq4hXIikGHojNfJo2Pmvq/21qtxtxulYnIHFIaOtX9l7XbHhEtfVjxmtE2Cij55G6osL5s2W+0gU9aa7Tw4ZP6PX01owQ6pTHEADq+rnL4Xk9x0WWIEKKclwCVxEBU5dR1iretWOxpbYFfnFoyxoMSz+2I8pPjnz/B3LGV6QWGeKB6hPIlNbXOsflOyjG9al7QmncdJrWnFHpKuDIptC9qW5gWMYwz7w5ezie38nVWg+2qEm06hwjYY0RV3olwF5c5d9KEXgLRuMDi26XPCa6/hhDmnlq8w3th+s23/zK13PQzmnFRbQng1BdXfnBsE7lHKGatTup4QN+7cqt2eFhs2sj6P7Vdm/V7+noli7A2G7wR2/JNJVoQ=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OdHqWTCVUsQlJu1e1uwoHa3MDOrew5raTGYgnAPCXgHHRWBrjllbxJ+J5sWJ9FfYDHCxNjKr0b66Aez25z58VdtOdA+/29V8ujnh5SCdPZ+XiDWQqAK1MAkeo7VrQPkxW6Vh81P6ai1ICsog7utzxICv/A4a3JnetWbsB9hRQtpUDnOHgprE2QbRkxF5bridikm8bZYXhWc1jFH198JyNsWouVu6iJnb7XVTCWlkdVEa44ftRijToqnkMHBHS39mDNslPKu2dC1RjRpfWj4Fg4gVyI511R5exDBihx7TRtUsReN1IS+vs2pdpVU+SgTsXOOOn13RNI2VB093Vx32AwigNQlLmZ+PqXDPBnnRwyDol8+GoWWd6RcfV1JeTSTn/bHB15CvN6in9ZI1xUEOkAPW/8rN1HDoLqqJsP56oN4rJVy5yAwOP6CI6ITxgCCENJ1/RfPh0ohDcQP8mZoIZABC+hP/tOSHApAI8l7uMY8y8blVPXh9N4xvR6TpztghTiVoZjLBpqm99xBU3ycjjpMaWUdnhdkrOI+vx+M2QUg9jqExGoQvftvaoZXwm7eKjkK/nKTX2xFqVpP3r/ebR3ek9+lqbFbSXFNBQDxizZ4QqtM63O0M2Kongf1PNxh4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?SXCR4KKy/H7vGwmgs0JiFSdr7xbcLxRcwykkurC9mdBcwlA7MiYgRdg+lgKo?=
 =?us-ascii?Q?LuNLZVRTmVJUKapq2nNXpHqBg/Gg0zWK7VYqM8hcxeKMMsM5PjfNZon6VicY?=
 =?us-ascii?Q?utKGXRuWA7ggxir0CPaipr66eDBDSxXTvFLqAo0B5FuOJZjHPpmgL65J2B1D?=
 =?us-ascii?Q?W26JHAOxJlNqkrQTb/K0faOJSfBU6kQkYCzUYNDNVXeKw6C/GyKENXTn9fli?=
 =?us-ascii?Q?+Fi+trCjZeJY7mGzogS1eBy8q6aPVPfLC8JmQo13eKpuWWxA+MP5G1P8mv/X?=
 =?us-ascii?Q?Yijt85cZ9KUg9SFE7r8hx/2F8sb+VLv93fThsmCYgTwqQ1cOpfzVs8OIRib3?=
 =?us-ascii?Q?WzZ+18/+WjQM15EGq/cMwX50tplhLyAHDt2+BZKfBI8xjycrZ1n4a778en3v?=
 =?us-ascii?Q?UWelavL3eP4ls5ZOsALmubYMMEhQSk9IzVds0k5WS9CdRUTxVsdYpgKMCUT1?=
 =?us-ascii?Q?OHM3klg/485rgRifD8me4NF/WqIgoYS3bQw9aFYeVm8SdIHwN81YBmAfBb+2?=
 =?us-ascii?Q?2RQEyOA5mlAHgNEsyUH74fhqFp5JOeA/2szktPRHSpwleUPwYA8RngYT2S7v?=
 =?us-ascii?Q?g9mAQnQKmT1iE4o4bgXzlvuG8509Jzpljabnu0o0zI3ayKsgoO8kPXQEZ3uD?=
 =?us-ascii?Q?RlGLNdnxHiw7bzcznTTGGNqPHbWiR/+rvFbihRAcPdjrzEeF461Fi1qC2zDU?=
 =?us-ascii?Q?2lW922lFHe03V9WVPYYMgnDyJ5u4etcTQnO3rqU7e58aFIJFG4jAdOZXU2nT?=
 =?us-ascii?Q?YIjPzzX4cWzyswg0xES7hAMtaIHi9292X7fmTG7rX0lbq3Dz6Ru++GCNEcBt?=
 =?us-ascii?Q?w1SqOLH/Oia6UycXZe89iEvr4usZ3OPzy4i06YibniGOyRp5QePBZRrulki3?=
 =?us-ascii?Q?sXf9mTcQNWX5RSwK+af0FcX4oJcawG42Swmgm2qbZmjeetDM+S7+MKKu7bDM?=
 =?us-ascii?Q?NZmGAXJ2iaWgiVBXYJmm91gZbOcgnhtKoTMPoPLCTVr8hI5o2W80qwfR3GQK?=
 =?us-ascii?Q?Qt4d1O9z+I0RBUOHznzfku4knXxqIEB1Gb+3qI4PfB0IFsDdPP1dQjoqrAUh?=
 =?us-ascii?Q?OARBnm0xeZemKUkBTNxZsU0XgIjsuWUdhNU5y2ibSCgJNCtTOCXLfqtQCTJd?=
 =?us-ascii?Q?g1R3tgbOSvBHLYgMKTGLrWEh+XsozQtPXIh/fhfBrn2ehWo0adrht0p7C1nK?=
 =?us-ascii?Q?rHV80qtKUnVB9p2ZXIGLfx4Sm0nqlpg1xfjAgLvqRhGXEamKOyTI0OqHcEw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d51821-b946-402d-3499-08db55b79747
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 02:45:21.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB4457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_194525_386040_BF6F7D2D 
X-CRM114-Status: GOOD (  10.28  )
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

The T-HEAD C9xx series CPU only has MVENDOR defined, and left MARCH
and MIMP unimplemented.

To make perf support T-HEAD C9xx events. remove the restriction of
the MARCH and MIMP.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 tools/perf/arch/riscv/util/header.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
index 4a41856938a8..031899c627f6 100644
--- a/tools/perf/arch/riscv/util/header.c
+++ b/tools/perf/arch/riscv/util/header.c
@@ -55,18 +55,13 @@ static char *_get_cpuid(void)
 				goto free;
 		} else if (!strncmp(line, CPUINFO_MARCH, strlen(CPUINFO_MARCH))) {
 			marchid = _get_field(line);
-			if (!marchid)
-				goto free;
 		} else if (!strncmp(line, CPUINFO_MIMP, strlen(CPUINFO_MIMP))) {
 			mimpid = _get_field(line);
-			if (!mimpid)
-				goto free;
-
 			break;
 		}
 	}
 
-	if (!mvendorid || !marchid || !mimpid)
+	if (!mvendorid)
 		goto free;
 
 	if (asprintf(&cpuid, "%s-%s-%s", mvendorid, marchid, mimpid) < 0)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
