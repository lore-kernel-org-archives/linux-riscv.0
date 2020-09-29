Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA11AC4727C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 15:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ACB620773
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 15:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2irRomKo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="WER2Am0Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ACB620773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VdIcJBJJ+rDJRpQ6J1hve33fXxH2aLDt5bStumOpCtE=; b=2irRomKoDx5c+vYP0jMB8gbfNc
	pmoMzA9upnDub+o+Og3w9tZiVq3fSIHlfhnqa/hvIEjB0XEZ9Rcjj7XfyPSFIreYktOVdASCOEgZ4
	Zmsnv/wanqYB0A43OY/XrXyY8OmxA8eDKrk/dI/R31RZSTUoa43VCRmN8oT+CIy2xWRdsOuxjyo6I
	4mri4UihoNhRt92wyMYp+Dhbt1ogWGGFTqja2ARHZj+Le+TOEQLn/tm78Qp+yjvBKCLahK+TE1DkZ
	wP/NBNZX1s/7ZH3Xo9VuOUoQeu1cqOfrbIUcPDCkHMpciLCc1MB88bBM9Eo3JtyoXtLDaVZn4Jj9T
	dcfq2JPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNHd5-0003Wp-BL; Tue, 29 Sep 2020 15:33:23 +0000
Received: from mail-dm6nam10on2060.outbound.protection.outlook.com
 ([40.107.93.60] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNHd2-0003WE-Dg
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 15:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI4Y/0yHCWStf7oFZ5CwHmxb+Bqg2YYY8lo31w2acD7phgHDufqA4iKgnWtH/410UypN8G2Lxg02Xpfn9a+K/o5zBFDOPu7zMGCH/of2HIVW+8lYb0YPh/SaRd/sms1HmbmbipxQMeDhvKlJjCWOhyXnKVRXCbsIN1SfgF5dAGQRsvWj9gtr1u/KZofcEgzwvNbI0aPlwjs0FYkPo+X83tho5dT69Dz9ml22NhOEkGfdSgRiD+LsShd6dcyuRW9XAN6aSkZ6OpT1EKS9BCB9wX1UOWcgk2cx6NvWiwta46UL72wS+kHtpUWWrUNmpHN/TC1JmPGuljq7DmQtNpmn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lMwUKHY0HwJSRlo3ZkJ4M+LWgdzzvglZW9E+Yz9Fmg=;
 b=Jf8DYB+gWW78bo9PelF0TaCTfJMjc7utu/65K3RvAg8qXdiDkICU5B8fpX4Np5YyT3kk/zPX6MtcGD81W6Tr4ns9mYChUrzkOgSuCvuYGAQP3SXj9m6qaD7kkBt1k6AcWYHDqmxYf3hglCDtLdg4L2Zd+fNCoHxU/Fr5UCvxBH2Cg0Peari3uJJJ79jkgz73dNffaFeROYLKbGSZyG0o7MZsUxGiIuknFMhn0XTj+iHqbbn9VogM8DiCJ+PHOuirXUGkJQseVBjE1FIJT/VzgitdW/2aqaa6fd3ToFE9yKE7/gx1iXI0sl7JUCUNf2jWasHASkU6oJUbpC0TUem45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lMwUKHY0HwJSRlo3ZkJ4M+LWgdzzvglZW9E+Yz9Fmg=;
 b=WER2Am0YrV2VCVlEIUB9aFUEuDCWnCjX684eZB8em/b0dbLv0H5yjUAAvkuEC13gNxSOX4SdVxPp0bPiyPXJUrmp2YTPmW22L/KcHG+sBDKVldlgCWLaK4c9eQ8mFMMbstPF9hMVop5EldK7WwyaBUHwXjXsfSVwfLfSrZD+8mM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB2412.namprd13.prod.outlook.com (2603:10b6:5:c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.14; Tue, 29 Sep
 2020 15:33:17 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 15:33:17 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 0/3] convert sifive's prci, plic and pwm bindings to yaml 
Date: Tue, 29 Sep 2020 21:02:08 +0530
Message-Id: <1601393531-2402-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: SG2PR02CA0101.apcprd02.prod.outlook.com
 (2603:1096:4:92::17) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 SG2PR02CA0101.apcprd02.prod.outlook.com (2603:1096:4:92::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3433.32 via Frontend Transport; Tue, 29 Sep 2020 15:33:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0030f13-b013-4fe9-51b4-08d8648cfc5c
X-MS-TrafficTypeDiagnostic: DM6PR13MB2412:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB241220A6916416124787537E97320@DM6PR13MB2412.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElqgfvzYSvh5W5WyPUKoEqLPn2qlthWJ925s+zyEIJu4/1cPeg/WwsPeAGV4n2mm0eoKB34ABkuscxsy8qv9kPLMzUu5rj8VYQb0T9nN3lMLv9GRxt7Qfbu6H3bOazAWJ/6RsF/E1BhamhHBE1RDwD5T3tLfSI4ZEkUY9eMygekbNH2AMsDXfApdPDNFi/JeOFjAkLGv9pbAiJyyqSKeCkWtxn4ekRSr5XONSq+kGIE4xhx/NR/O9prxa1joxDXrBPbN61HrxbOM+vIvR4q05yc0ao13IluIIw0KX/cJ+sKSenhJJpmTdIvAUCIqnUlQy5F4gbD0G7X79caRF9vVq6yxfPAci2vGMXLfjoDWV7lk0zOCgZZfM9t9mYu6ywwz9e6hVr8HNODPZUZienTKTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(346002)(376002)(39850400004)(6512007)(966005)(44832011)(83380400001)(4326008)(66946007)(7416002)(52116002)(8676002)(4743002)(83080400001)(2906002)(5660300002)(107886003)(6506007)(66476007)(66556008)(83170400001)(36756003)(8936002)(2616005)(478600001)(6486002)(956004)(316002)(186003)(16526019)(26005)(42882007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Py1YppiDjdYD3ePTPkBjQcm0yhRpHg8bnkSYooKaqATFKBA4pfaIsfk6igMzLUvkvX/2aDNBgTKk4jYIFc9McMDhdrzFXnvQi+80vLK4wnOuy6FPdAvm+gDumVPozn46+2tRbQSPjC2WyUK4X+PVP3bSnn/F/GEy4i7YT4F6EU5jrR1Aub6fl4mzFRZJ9rzutsMuKoTlJPa2uegSagXOMlSGebkP7cKmIjaxv6eiLqOMvEJphOgcWICvTuun9jxw60eru+8HyQ02QJi9PJJrnri9dshuODVjIbzoH4p2VfcNRjdGZDzjCBgH6EnWd4sHhZSboe/wX6hN3hV6k3qQLkObqFRXO9+4p1ROfGIXByJsxC48n6bF+vzH7CrxWwWMy7IN9G4ni2NgmuREy75hPKoOomjG1lJtxGO7D6I3+DUmyVSzjdnf9rhVVr/lqv7D9C9LhAgqjOYbZ+c8XSlFG8HydpBhhVvwjguUtvb/3caP/iGGohvmfqfIMTY1wHUOAY+PZqABQ0QRCOgK9gty7XmuuCdqpX9s32wH36nDixTFJj3oIEWgI2igXphxPNq4ojdbJEVanYOudKJnhyNEGh91OhJJwxm8VWFI64OL4anGkdlezHfB2f49b0qyNZgg71jRSzrHKbTUo5WVxaa1KA==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0030f13-b013-4fe9-51b4-08d8648cfc5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 15:33:16.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JkEql8VXESfwjdCg0e9bF7k7kU6cECmuLP1L3eWWCWze4gltd4nrINuFdatR5tYhQzH7PKUB5J4dNAKPpGHxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_113320_575630_26D79B0B 
X-CRM114-Status: GOOD (  10.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net,
 linux-pwm@vger.kernel.org, sboyd@kernel.org, maz@kernel.org,
 mturquette@baylibre.com, u.kleine-koenig@pengutronix.de,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, Sagar Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, thierry.reding@gmail.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The prci, plic and pwm controller bindings are in txt format. Here,
we convert them to yaml format.

These patches are tested on commit a1b8638ba132 ("Linux 5.9-rc7")
I have added the log of dt_binding_check for these IP block's
on 5.9-rc7 kernel here [1] in case someone want's to refer it.

[1] https://paste.ubuntu.com/p/7BRfJXckkV/

Additionally the default log of dt_binding_check on linux-5.9-rc7 without
these patches can be found here [2].

[2] https://paste.ubuntu.com/p/ys5XNn38VP/

Patch History:
============================
v2:
-Incorporated suggestions as per discussion from here [3]
 [3] https://patchwork.kernel.org/cover/11769499/
-Rebased patches to 5.9-rc7

V1: Base version.

Sagar Kadam (3):
  dt-bindings: fu540: prci: convert PRCI bindings to json-schema
  dt-bindings: riscv: convert plic bindings to json-schema
  dt-bindings: riscv: convert pwm bindings to json-schema

 .../bindings/clock/sifive/fu540-prci.txt           | 46 ----------
 .../bindings/clock/sifive/fu540-prci.yaml          | 60 +++++++++++++
 .../interrupt-controller/sifive,plic-1.0.0.txt     | 58 -------------
 .../interrupt-controller/sifive,plic-1.0.0.yaml    | 97 ++++++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 --------
 .../devicetree/bindings/pwm/pwm-sifive.yaml        | 69 +++++++++++++++
 6 files changed, 226 insertions(+), 137 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
