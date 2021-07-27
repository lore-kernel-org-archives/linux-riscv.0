Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F19C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3429361001
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3429361001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUUuDQrxBDuXmtGYsP1W3xYCA5kdq9rYatAJYP/rAdE=; b=lyFnsJIRMth3Rg
	8/NL78rg0A3j32KklFgVIFB7zakj2wueF4irrJ5JnnKZzLTLPFk3vxw18qPvTJCzQ6ljXfPABSEwg
	FLKCiCtW6yCtWFTtZfIrANAnEFMVawD33dd8afdJYc8qTJWhVncguB2vvp+XszzqPjs+ltvpwkGqX
	ewZNFEcN6EfDHrig44sXTA9cqPIRiiI8SHsMjkeJfbjhuJ2yOcfr6jSDG6JAMiBrFpHX3K25TN5Gi
	GtBRd/G5j83IXlDheKRNM8gKBKPXpguv6cuhU5MgRwthxzAhoSIOLKDqIIQRTuUu75qiWzbNF54pc
	Al5+QdQSiclk8DD9sq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8HSM-00Dogr-Hu; Tue, 27 Jul 2021 07:24:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8G4I-00DUsT-La; Tue, 27 Jul 2021 05:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627365354; x=1658901354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8WjELUyEWFgOO9PJfLTe7LIuvVnMx7WB9bialeDHDlM=;
 b=nbozV5A4L7VBcIwcv193uOmqYONdcLQTvu+Tlrd7dt28ntFI7BWIJbRh
 OWnQwlQbx+4ycLlC1c+KYzCnFVjvXWWK6i5oRA+NEOk4mGWoQm2ozwLhy
 EQt5qIVr/nP1WSqm15ypVv/VSJuSnXSbR1R2A9OLYOgUJqNNJqE/3XitB
 UzosWl/JMQ7KHqb+15Z8+zNXw4iEiQ8cld6G430tNc3LfhT/dXmuNuGtb
 WwzYqY7y3g+KEIazYZS40v1WA/3dCnDXhEbKThcUVFxXBRfAXF/mGSXhT
 39BjhkyHE1ySdOFoeAjyIZBYl5fGP3ul38QiFRGEttPGUI3S/TERJ39Dj w==;
X-IronPort-AV: E=Sophos;i="5.84,272,1620662400"; d="scan'208";a="176146089"
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2021 13:55:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCXbq4L+SdLRhgtqitCKtH8/5G8qBopxR4NEJKj/nr5xvEIp/O0fMCH7sP9lyfzXfl/sfGkaubfXXYrEtjmS+s+pobkswx9BvUTLz7OyIdBnl1r96Pi5G7ydgQqO0quuRN5h7yNg0McQxe3Fbtl68mwCj+nAYQA5sWXc4Fi7IZeo0wF7YfSOY0Wj8VkuHlxTVsDTa5KaCtCh7NH88yrIW3q16YuMpiR8Z0RE+JhOa8TScOhVMrpyqP1DgS/83TEWGrJD6ykcCnMP0ERYQEI9OuHTvTWB0BAcYoP+1RLghmgYM1WKzALwyAY8IWd9Onf3ZeJ5fx8/GH3UQLyTaPQEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHS3rsJ7aNjjgERKEoyEmsnZwdhhC6uxjhr7XZvP+S0=;
 b=LIhPKODJI9i4CcwEV/wIG6a09NQalR6g6BN/7g15GOMMg6ABy1DJ940AcZygoecTrBGZpKoiru60R6A2h1ZePpkXqEFJZLA1AutY0Q9Nj0uxUOo1wEXOgelK+QXgAv9lwJBN4qka0/FJSMk15Hn92PFm662DAcYGMdL0ayuh9c5R+/7iiJIpgyLfX9FcHs7iGWwh36ApNbVU5AhVHmHfGROv2sAqrFWplrn3/mV4aVYHK0IIoAxsf5Uu1KH+NICgVIKinq4a41Yc91cws7J2v/BNFJSSoKgk60kGZ4kakTSEVxWyCnRrVc0S6BAm1nBKeHm0PeZ4TcCZhwNwxfoeww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHS3rsJ7aNjjgERKEoyEmsnZwdhhC6uxjhr7XZvP+S0=;
 b=OSjAY4+T2+SbesrQLMDaW3l5UMmGZ8B5NmoWcaBA+yuMphq/I2uqgW9TTNMVMAsg2r2k5wJFQOzHU8o4OE+CGJnaE/zey4PFJg8XN3XW5/R7qPh4QU3HX2nXJypQMk8TSL3dJrLFpmyPQIZVUpBLi0YG1NBj9tiCfuYSX+plH7I=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8377.namprd04.prod.outlook.com (2603:10b6:303:140::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 05:55:52 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 05:55:52 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v19 08/17] RISC-V: KVM: Handle WFI exits for VCPU
Date: Tue, 27 Jul 2021 11:24:41 +0530
Message-Id: <20210727055450.2742868-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727055450.2742868-1-anup.patel@wdc.com>
References: <20210727055450.2742868-1-anup.patel@wdc.com>
X-ClientProxiedBy: MA1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::16) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.179.229) by
 MA1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Tue, 27 Jul 2021 05:55:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f608aaa7-2b2d-4164-3436-08d950c330de
X-MS-TrafficTypeDiagnostic: CO6PR04MB8377:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB8377CB8592A1CE87788AC7E78DE99@CO6PR04MB8377.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bewYLB+Dy6tOE8vyB/R3U/mNzircnyDfRPqDW0aWN+xfsQIiCmiBlJSlXah2SaFBTWdZV0ks4eiNawXq8yMxQlbdKO2ibRofZE7yRUdcWNA/yUrXJD67Yyb6GY6MeVz1C32npFoeTaJkz+lVPPyT7MbjrEYF9D8TM0idgwXBL4wRbmh5I61Rv/IJX6QAYVoWIfcw7AKkN2wxFC/yKlQ5fOBBhwOvUpmdNCC4wyN8DhPApF7TH7bWCPG2kPv88/uIPN8FtXP5gFquzXmd+tUk9GhWPr1mstpRZYXyQ5lhjwjV/qtKj29oj5STks7l8EisPjRP/2Rn6ZHx5EX4/vgQQer1cnu7DBDE8Zzw7AwR8631hQ6uhs7qBaJQOIeHQN19zmRTb42gXIL3ZAE1q4KhQLDuSX9FaQ3GKFUG8GfU4PGsoeZx0cFP4xljP+ndBcTQrNYZDkescT73+dHE2VFFrZBxOTQnA3/lNrDiWk/7AJIFUWtI+GHVERDkdSFu8d/CYFc87eP7FiLEk9KvSc5TIYEvBLRZyFEL/NJwGV6qZJQPWPBZOp8IBOjPanvP8Pmo1/zi34FE73FoLOqItNSmeaFe83X3NCzCHI6jQWdXJBCwLxvHX7+yT41Kd9OZo5kNLPEZv8uDr9MraiD3mjlIYWrDfK3Y4BlywZZp3cd5bI1/UVsqFw6a8tvvMAQxLZccfuPEZpfsjLUUXw8UkRMxCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(52116002)(26005)(66946007)(54906003)(5660300002)(6666004)(956004)(2616005)(8936002)(186003)(38100700002)(316002)(36756003)(508600001)(8886007)(7416002)(66476007)(2906002)(1076003)(110136005)(86362001)(44832011)(83380400001)(8676002)(4326008)(66556008)(55016002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JWUHCsMKg4d5fXiYl5eEXEYtve4s9pXsQQNVxuQueY4MufxoExu4rPCWx2Xt?=
 =?us-ascii?Q?c2zAtolVevC2Tb/XH5tuPKpjtzavdHDQC/eoh+CQyYDLRJqjbBAJuRoUfsst?=
 =?us-ascii?Q?sJ3JF3F+fi6rQkD8r9WcM4m7DevR7Zin+JF1rsavaOTxQXIxXP/T72L40hrd?=
 =?us-ascii?Q?BXQWFCzC9B4I6Zbs55pmBDUuJOOKDgq5I4JgAGpyCXyQpJm2j/7HBKTc9Liv?=
 =?us-ascii?Q?Dl9OjjVXm1FRZFCT3hc7pWGDjJbyhkUs5ef0+4DfqORIVc3vMf1Jimzqz7gq?=
 =?us-ascii?Q?6XkrsX86l9MVA6MiEJy66kzoWIHATndLbOrs/PyPiVG9YfM2MpCnXTU7aL93?=
 =?us-ascii?Q?i/P3N3edw493W/awT6PEUcgyywnT1CAGHuDNv1spr7UIYDMFkJDUyhjhPA0I?=
 =?us-ascii?Q?0xMG4sRyecYeKzVDuCSXFdb1tQw+TI96nY1CX8HeW2wMfDfLJwx6HdqMoEP/?=
 =?us-ascii?Q?0t6wTPdJ3PhMvJPYvqWIJEHKz4tvxAYFE4h4jBl3sNsCDrfFYGvQrRW7Nquj?=
 =?us-ascii?Q?YZ8D6AreRgBsO9RmQXPcTo9Jxu/KI3c344RGKdsueZTY5Dh2Yjkcr5nYYpR5?=
 =?us-ascii?Q?KkLdUZjPNQhJUT3r3QzOO9ZQ7eZSQvetT1ftdR3K0i4Aaa30982DT5jgHxqG?=
 =?us-ascii?Q?QP9dAuCgd7LfqqAHbqJcNnm1Z5YK2+GC56e49EM24vqSevFhgQUEu1Rc3PbB?=
 =?us-ascii?Q?ePb4+CixMreSup1tjMp5g+VhAOlQXvzIsbrT5pn5VH4pTr+zypKcEAQQDjzo?=
 =?us-ascii?Q?dPYevJDyoncG4wcMlP8sVVKkbkSn4Y7keFjPz2xRlWKNEspj0RONh8htFTot?=
 =?us-ascii?Q?E34Y0xK2+hZuHGY4UgTGl9QojhLdZXHssdZ16RU3u1rs/+H9wDldCvifsc+W?=
 =?us-ascii?Q?dDqF4QQ+VEOWRkSEkq6ekwVqhoDOpmKE8Awrjun/zhCpY+DJxy/6E2WLSR1P?=
 =?us-ascii?Q?PEBd4hOJxldciOLws+jZqxYFeQhARv0dmyBnuaPtOgchEViLKCu4xgjlvdLC?=
 =?us-ascii?Q?z+dWrQ3GFe2oi8RSmXWwDcH0YcZ0CnEJ8wVovgInD39OSzenFjF+rKjOGN9v?=
 =?us-ascii?Q?unVrc631Y0TkXxuStUH0ytqqha0aF3eCCHZ20h7NJ/NeMp4y+MXt7Wrkr1tI?=
 =?us-ascii?Q?ZZGvrBvtvIrUP0eESmGjNLohJlt5X4Gp3LsIKGazXlxaKXWAxrzv88LsM1SC?=
 =?us-ascii?Q?m9Xk0SroPtgt1avTYzEk4oB043De+k7HU10gZSsV275XSNLfwga4YD10yvdr?=
 =?us-ascii?Q?3qNKKGE0cVMdClJs1eAMrq0lyFKJeLFBEv5wj7hQJK+DmDYZjFFSqsPGLMdu?=
 =?us-ascii?Q?A/C2B0e8cAEezNB6fo2ubXu5?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f608aaa7-2b2d-4164-3436-08d950c330de
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 05:55:52.1525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UV2bUveUtLfrgpzXjUmue0sro84IjF6g1FGBQ4TAOypvhPSM8IKtUC0WH0buJewcTyZOzddA45C7DIIs9qm6Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_225554_882620_E7207522 
X-CRM114-Status: GOOD (  15.72  )
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

We get illegal instruction trap whenever Guest/VM executes WFI
instruction.

This patch handles WFI trap by blocking the trapped VCPU using
kvm_vcpu_block() API. The blocked VCPU will be automatically
resumed whenever a VCPU interrupt is injected from user-space
or from in-kernel IRQCHIP emulation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/riscv/kvm/vcpu_exit.c | 76 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index dc66be032ad7..1873b8c35101 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -12,6 +12,13 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffff00
+#define INSN_MATCH_WFI		0x10500000
+
 #define INSN_MATCH_LB		0x3
 #define INSN_MASK_LB		0x707f
 #define INSN_MATCH_LH		0x1003
@@ -116,6 +123,71 @@
 				 (s32)(((insn) >> 7) & 0x1f))
 #define MASK_FUNCT3		0x7000
 
+static int truly_illegal_insn(struct kvm_vcpu *vcpu,
+			      struct kvm_run *run,
+			      ulong insn)
+{
+	struct kvm_cpu_trap utrap = { 0 };
+
+	/* Redirect trap to Guest VCPU */
+	utrap.sepc = vcpu->arch.guest_context.sepc;
+	utrap.scause = EXC_INST_ILLEGAL;
+	utrap.stval = insn;
+	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+
+	return 1;
+}
+
+static int system_opcode_insn(struct kvm_vcpu *vcpu,
+			      struct kvm_run *run,
+			      ulong insn)
+{
+	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
+		vcpu->stat.wfi_exit_stat++;
+		if (!kvm_arch_vcpu_runnable(vcpu)) {
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			kvm_vcpu_block(vcpu);
+			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		}
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+
+	return truly_illegal_insn(vcpu, run, insn);
+}
+
+static int virtual_inst_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
+			      struct kvm_cpu_trap *trap)
+{
+	unsigned long insn = trap->stval;
+	struct kvm_cpu_trap utrap = { 0 };
+	struct kvm_cpu_context *ct;
+
+	if (unlikely(INSN_IS_16BIT(insn))) {
+		if (insn == 0) {
+			ct = &vcpu->arch.guest_context;
+			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
+							  ct->sepc,
+							  &utrap);
+			if (utrap.scause) {
+				utrap.sepc = ct->sepc;
+				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+				return 1;
+			}
+		}
+		if (INSN_IS_16BIT(insn))
+			return truly_illegal_insn(vcpu, run, insn);
+	}
+
+	switch ((insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT) {
+	case INSN_OPCODE_SYSTEM:
+		return system_opcode_insn(vcpu, run, insn);
+	default:
+		return truly_illegal_insn(vcpu, run, insn);
+	}
+}
+
 static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			unsigned long fault_addr, unsigned long htinst)
 {
@@ -596,6 +668,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
+	case EXC_VIRTUAL_INST_FAULT:
+		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
+			ret = virtual_inst_fault(vcpu, run, trap);
+		break;
 	case EXC_INST_GUEST_PAGE_FAULT:
 	case EXC_LOAD_GUEST_PAGE_FAULT:
 	case EXC_STORE_GUEST_PAGE_FAULT:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
