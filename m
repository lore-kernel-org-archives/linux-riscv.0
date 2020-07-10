Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E02C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 08:28:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64403207DF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 08:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ZIF7FRR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rDiCHbIe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="SFz9HKu4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64403207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JTZ/YA4BtkVZ4bTGZpr9XM9zuIvSE/TWDHXIxRM3T8w=; b=1ZIF7FRRxYWDYDiRXM+cmBBVI
	HGR6GyhLMjn3EkdYJIIwWIZl5lHlKIKvVgq3tEmbxTf9IGnN7dy405SsRjEJoUJO+NabCRrGrawuZ
	oMADCkiUebf2aCKmMRv51KE2js9vvxbq7PxYqreSWT84vq3hHsAkmCyG2yHz4BUZ85zsyiSgiWLPi
	v/QIs6boT3XwmybtOSciL0pQrldlwta/MW6zykVnepekPEgSfn/wb4iv/e7zl3cjE9re3tNEbHxxl
	3TqQcQF4NDOYPmnfOapXdNCIu+NjIqIrK1eWfZ15sKJksqLX2wCCRkOO9S9Y61FHYV0wz9oWx21dF
	t/oHODpUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtoOD-0003C1-RK; Fri, 10 Jul 2020 08:28:13 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtoOB-0003Ag-EK; Fri, 10 Jul 2020 08:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594369692; x=1625905692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FsmLAUNJnyElJzelbNbYBjIrZmYTW3L+bojP7QKU8CE=;
 b=rDiCHbIeDaFsBbmrk3PnOfNZVjTmN4lLwKd0MNmoKh9unb5ALRhpahxw
 Z3KF6+U1IvLrIMP4SZlDtx+4I/bNNIBMMDa9KXFZQVLmVkCLfflCrrQYU
 M8qN7Q4cLbOY4SUwxZKJ18kB0hQcI2CF4wxPmSl97xK6mjdiHo9X8fIOK
 ZPkSkgPNVD/8sp8YM/WB0vxKvixokWkSJOlVIOVgv7RAuGEEkeOsyiM2t
 pk5PfkdyMMjFNw3yLHCQ84Y5CcBHmYEXPEkC1p6RpSG8wgOJRLZb4RHY9
 LTbtAgbrpGPcX4syrAomai4f+3SXNknuwt0wKcnG6yQvJcvh/evIEY8Rc g==;
IronPort-SDR: zEtxTHRHamAYHIMe+JfyE3xwhjcs3BVk/wDk2alWH0JOKqd4tRxC3VYg0RbWkWObeOSdjfh5Fn
 0ZHoEPqHBOTAIAyn3MVGPHLoEW2NHpIbWT4TqVAQZnnWto9g8qwIZf9+4YQ9cAVZdkhaoIR0rz
 mXj11Zr1IRYUf/yZ9/fMEezRXY8yQvEAaaCiBYGtyVAR0k1z5+WaudWP1ACtXIZIzO3C8e1Njh
 1gYDTXiiXXhlj1ATZDvQueiOa2ihjDm8PLzlLDU9GU7YAnqLB27bZlLyS9Isea9Gf7PNf2/zfd
 d1Q=
X-IronPort-AV: E=Sophos;i="5.75,335,1589212800"; d="scan'208";a="142275750"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jul 2020 16:28:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vjo/quYU1CNHtxhyKR8wSPFL/GOa7I1Z18p0lyfqJKyhe8qtfOtgWrE3YDNYp6vXxKRV7xbGhLJdeBIE+ST6PqO9rse1EidCE9+yBcbKa/xA6y8uZLr6wfmoUXzzm7FLN4VzVu8NgVe29aQx7cH7Ykz0SgSnjIH7hkmItIUhFar2iIso32Ws8cmvI3iGU+MnvKV+ERg5DPa5LoMSlZM14C99ZOeMrUXy5P+t9LlGbahTTBUs0MhrR2DZg/HnynkGaBFf7/hxVJXnguyba+QjNTUH9iN51hOYtv7lJXFRx93uzcqqyyHAWSLyDYempyGFD9uAXOddzMLhzHaeCwAs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yol6RQPIRFzOTIFJgzOje+3ZjgwAoUvD850p6DKKkcQ=;
 b=UHVGozb5OIwbs166hnPRtWGduvGWqDuHNRjDnsggn1yqx93WNZacSzL6lpOGIzKQ2kKKWlUsWkIuLD6MFoBXO4uyXBwTH1ZlAhxOC5A0ynspes1noEVczh4pVKmkX3nGCBghwO1fk2WtagdbfT6PNDREVddEjTjQJ6UmHbRRTm8ct//+lc32e15X2EkOUjgcpMr4bjnrKy/fRkGWHA31S+w594rkhxni+SXr2WxC2jaQXK6O4/mwQ0GMeGa1GBV+ykTEAcugpI4MNSZm0q95sbT2A0Lq48J+jHbhbzmI2aRVBNMXDu9EaZ2H74dzbvPALQRw3b+w/6xX4MKzWJZNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yol6RQPIRFzOTIFJgzOje+3ZjgwAoUvD850p6DKKkcQ=;
 b=SFz9HKu4JbDWOiVtGIeeIhKzmKEtiSPC0Wlh4TlRiW3FXY7dt9kK49hyqt0j/WxiDdjaJpPj7tpWOr10VjEVn1bNcwO2+c5D4MAad6ycnSPovQBbIKXBhehFH6QOqwHtuwk56Q4TGHL3I310x5J/cct0z1Fz/qmnXNjy+lFPbow=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0461.namprd04.prod.outlook.com (2603:10b6:3:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 10 Jul
 2020 08:28:09 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 08:28:09 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v13 17/17] RISC-V: KVM: Add MAINTAINERS entry
Date: Fri, 10 Jul 2020 13:55:48 +0530
Message-Id: <20200710082548.123180-18-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710082548.123180-1-anup.patel@wdc.com>
References: <20200710082548.123180-1-anup.patel@wdc.com>
X-ClientProxiedBy: PN1PR0101CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::21) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.15.57.207) by
 PN1PR0101CA0035.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Fri, 10 Jul 2020 08:28:03 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.15.57.207]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0568c300-6fb0-47ce-01e1-08d824ab2d02
X-MS-TrafficTypeDiagnostic: DM5PR04MB0461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB04613979B543AF3D5C789AF68D650@DM5PR04MB0461.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 046060344D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vus08HEcRS+fdNNaiSZYzSfs62tPLglanaS0Upa3KbHP1oboCnflXSdq2ouvRHce3Y0+4PBncoIkiNBTBpaPzGHYcmLzUOGP4P3O1cPkFGGX0/kF1I0HnrhJA0gPckz99kfgceAPAhHfcAwsb3EfBnnZ5yQTn/6lm1Enu5SKtJG5F+C/EhcKmT8j0I/xqoMg6hj4cCpbuYtCWDj+duzcAlO11hCVJ2ZtelvxU5ARfHIVllcN3OGxLhpA7pHYqNLcmhf3eJFMD3lvGRY1nEUq703ErGBM5PCZ4vKTuHBI0/rbadqXeVPta49lPdv96arfRMD2UJfxqc+1zA9yDa0Now==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(2906002)(316002)(110136005)(54906003)(7416002)(478600001)(6666004)(86362001)(8936002)(5660300002)(7696005)(4326008)(2616005)(26005)(956004)(52116002)(8886007)(8676002)(186003)(66946007)(66476007)(55016002)(36756003)(66556008)(44832011)(16526019)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: uxGBJCGx1jgfvbKlcgIvyNcyTbCJEr+AStuslTIejiwH+4LpVe9Zx0jin6/wcI90ROiTJOfwtWwq+esrJ3dWraSVLKyQPKwoWvn+p2++8n1TfPZXE88qWB0FMgt/ydneB6Mx9tbSA+UZnGeraSzu9CIuFSH15IlxtZhEWy8bJAL32/FOf7uaJsZT7lEeFsLZw9lc6Sqoi41adkdEMjSNxLAaA/T1suTWLJavq1DzpSkWEy6/329//4LkdKOFOIlO0qBKV0oETluIPkEXshw+Lo110njKR86vQE8e3v36KKQ4qNvmp/POfxsawB1pjpOlASsgeIKG2qOFBwdir5R6h1DzrQwk+/eOwsdNBGe7bpZTNzyEcT02CPVcyPjUF+dgN+cjJlHwgZ96GkrIowJa1dfEETcBoAHPjEzt+VaP2P8r8K26NZXrMKMJ9f1jYKXlzbyijQ60ROQQT/8dwV5BLudSR+gxyd+U4sYy1xUgOj0=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0568c300-6fb0-47ce-01e1-08d824ab2d02
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 08:28:09.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3GQrGiOVdn1yDMeaqvr9C3gHdY8qdT0iDmck1B9MJPJ14F3/kC2HYGTEJmJRO0PIexdSqAhd+ovdGr2xSO6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_042811_691886_D595EE9B 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, kvm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, kvm-riscv@lists.infradead.org,
 Alexander Graf <graf@amazon.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for KVM RISC-V and Atish as designated reviewer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d4aa7f942de..9a3e6e688479 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9459,6 +9459,17 @@ F:	arch/powerpc/include/uapi/asm/kvm*
 F:	arch/powerpc/kernel/kvm*
 F:	arch/powerpc/kvm/
 
+KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
+M:	Anup Patel <anup.patel@wdc.com>
+R:	Atish Patra <atish.patra@wdc.com>
+L:	kvm@vger.kernel.org
+L:	kvm-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://github.com/kvm-riscv/linux.git
+F:	arch/riscv/include/asm/kvm*
+F:	arch/riscv/include/uapi/asm/kvm*
+F:	arch/riscv/kvm/
+
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@de.ibm.com>
 M:	Janosch Frank <frankja@linux.ibm.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
