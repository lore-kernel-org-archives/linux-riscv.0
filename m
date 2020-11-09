Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44DAC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 11:41:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24722206B6
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 11:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1vxegoM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="P2ERmECi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="U/K03Vzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24722206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KJj2a62Nk6hiAyjM6nzvsksRYnaEo0rdg2NZ/nPCOVQ=; b=I1vxegoMQf95lLTIsaabMdsXP
	W85bp37IQPZp2uL5K73i5uKKxjV+P7/dHFgWrCHiSUWUPjL7u0BZNTXpD1GvPjtj5k06KAKITKDc7
	nierVzJ4+0CCUAjzI8F8UwOW1iFKMo+rPPYVExKCBYr48zpZz3QORpH6c73hPNM9NSz+/9mNPUI3g
	dljGB85r7yx/mo/oXxzzBkPEE+kRriypjW9cK5B7Plh4HjNPaqAH7UT65ZbLmAfoJKm9E7JooO1SI
	DKaUfeA/5AkRCyJsCy0fLcLS3L09ZAZRzfuqv5opGKnOsW1ak1PQgEePe5Xxqr4hEswO/Ll0lUphd
	o2/i+SM/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc5XK-0008CR-I2; Mon, 09 Nov 2020 11:40:38 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc5Qa-0004fH-Sb; Mon, 09 Nov 2020 11:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604921621; x=1636457621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EK/5efwN5ctponF7YeDfvp60Cq6LVz8yReJHQCaEMVs=;
 b=P2ERmECikZit+j6QGcrezpTpVIvxtNWj0uy2RNY5abGKQyyGLAyqx+ND
 r+hX4gB/mWRva1iSkQ+QgKfWOLnAZ+i+fSSv1QLcvphTRSGYN/mmxdngp
 hlLTdhUnAwOJoeeBGxkc7q5MWe+HgdylGcx+gs8wTBzBbBrBnRgKQxBX8
 wDExko1Zlzgb0wIFmfLPCu4a6PwX+mXPZQuBlghQo0hO4oExzSewtbsb/
 YDm+iaBFkl7QdAr1w3+A3RJXmkXkwPZIzwzWwM1a9u0aje2F9oYRPD+98
 WIOL0Cgal7NdQfqFFSG+rHlQw261nqBlbhxe2M+if8SgseLZdgLx/BqN5 g==;
IronPort-SDR: 5OsgOFmcNpuDX+iGQU/SXNXhGRW0s8qPXfQxakRsreICA8y6GRqz24PhRyP0W7+QIdvOb1w5xb
 SmVfKgJutSpSJpolF1TShM5OnqfmhwBaTLN/13fMY8ZOoManuFqTeP4VPaPrkeeTDZgY8y4tr2
 jFqt3g0/h3WKGl0JFvyhcvmut02xTS1BTDQyn3OVTc9m2En2cX89Ux1Ij0jP9gtf80gNoCYVfQ
 mpKYKbraGcpKKEGVQCAAfjJAW0I8qgqgOWWM6RS7brSo59KaUVdZrErzLZ9Y+fUCXaULqlBkTE
 q3o=
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; d="scan'208";a="153382732"
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2020 19:33:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj/EXjXoK2jnIkFLtSDAgl5lBRdh9P7U1lhGwZH/ftgEcpUllXWf//NZYfzRMOwWKobYf+0A32wMd4K8cANVM/rvqQiN4hBCZBWdvNM057BYHv1+SD645Jo9oZbe6QmdbazpBlxeNYNL6HrTMU/ZVX6r4skm4MG5ozb6bcFcb2TjrP38VXsTMNocL8q+VnOm86Uj4jA1fNyezq/2ve/SJ43EMni9ij0n9MRPhgutsOHtkGkvRjkcVS4ozhzDCKN63raTRmxMGup+jXBVuU2hChU8IjgVinrTnRRmZJPbAsOo1u1YQcgxjMil16JCK78dHFrB2TEZkg80hA6LELEG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHs+gj89i8AEy86hjmH6iBGFS+byJUeIDojUGHCPg8A=;
 b=kidGzpkKltVf+Ohh7S++9COw1NQGk1K2Cy075ZwhgTMy8WQ5WvP6ETq57S8msV9SWG7fCfJ0bQ1oTG0X+S2LiZjQ1XPTtvh1LTcKHw//DtbmNGnj3q7upX4qEV+/qmM+2YTKzxQcwXsF2Lh8RlHWl+NlEotwzWWWrt29AXqwKVT+yXsJJe4+jmpOjBEHpKfqibeInVCSNQs4qOdU4LhhGDLcm2/FdokEMUeqzA3id0HP04PhZnE78P2Ek1oHAFlanoTHMDrs31VAuGHmqT44Yu7lekF7YivZHtAyuImJji5GUIVUSHMRLy6ROtCX1n0C62Jo0LGO0HnxdI9FB3zc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHs+gj89i8AEy86hjmH6iBGFS+byJUeIDojUGHCPg8A=;
 b=U/K03Vzht8AbUctdjvK/Lrs06LS9s9B81/yNeTmnzHxEQHqZgfv/b5OWCYoB/i6ZPunZVjLgB2Vt933kbQ44+ueA+BPTy7ta55DIKP4ZFk2skM1mbktcLDfolpIHv9Kcw9JL5ydDXm8tZn8jWNirmyfF0hyYbcbgDgeRhsknlqs=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB3866.namprd04.prod.outlook.com (2603:10b6:5:ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 11:33:36 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::d035:e2c6:c11:51dd]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::d035:e2c6:c11:51dd%6]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 11:33:36 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v15 01/17] RISC-V: Add hypervisor extension related CSR defines
Date: Mon,  9 Nov 2020 17:02:24 +0530
Message-Id: <20201109113240.3733496-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109113240.3733496-1-anup.patel@wdc.com>
References: <20201109113240.3733496-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.188.68]
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.188.68) by
 MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 11:33:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc26e639-e8d5-4553-0466-08d884a34bdc
X-MS-TrafficTypeDiagnostic: DM6PR04MB3866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB3866983AA1F5233060533CEA8DEA0@DM6PR04MB3866.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:11;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjUh8ZJftseg4VCfPREzifnvfncaK7UURBvxBSr15J2h4d4wAIHBLLMnFQduBZhzWY2aXgqmvGWvVkPuRm2LrN6kKqJKaCGQYeqSfwnK6RbwHHMo+ZjTTOrJfty5osOt697nQmrP6VLTbgnR5H+MpPL4E4zexDjCTchctRdmRcWvSOmwJf9WymXjKFq4swWeejQF5AM9jLGNuf8vAr+8aEfvlmgw2vGM/A1PpvgVTPSpkr6pm/Aj5HrlEsUxYL4rx4cGgVZdWNJWshvGwEGsgNhrCcFezgmpU8t9oAau46BYN4Xr5rCIVKNrFcihU8h44Ch8FlhVG2oNK9XS4/qzCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(55016002)(7416002)(83380400001)(1076003)(44832011)(16526019)(186003)(316002)(26005)(8676002)(110136005)(54906003)(5660300002)(52116002)(7696005)(956004)(2616005)(478600001)(66476007)(66556008)(4326008)(66946007)(6666004)(2906002)(36756003)(86362001)(8886007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: D/Pg7N2nxqBRXQ+NPe+eHa5Z+UQSQ9ZuY7Qbh51UeeK5Ld31ZsNAuObqmYkBl6Ekip8YQ0WCzVz9FJ4VkN2RRS4lgzMMs6WWwY8+A93LCXew0lx3a6LWmFT8A1PC4uya7leTKZuSlySee8HVBl891+OKafvDHxCtg6qzit2kZ+rMuc4ONdrf9nZi75R1kvcoH+slAcpCbnkJT9HD2bVgKpVbJ17MGcz3Dz3af5NxpptswKO7VMygGEju24/m221dXLNbrolSEEvfJYfBn8FO+ZU+WkuXSXYNFnoz6gTGPPhXCIJpED7LEYOCs4kSZjrT+McIXjQ/9m0VEELtuLPOHg9jmAIP722Hyseu58HvMj9iPPpxj8cJUYmu0vJDBru3OWVvX0720isPe7TLXrfzJM0zwwAL72wEXrS0fUF/fcrGSWOP7u11TEDrgfC10UBQLyYSJHybJywSVMD/kiOsYwqY55I/RaaWjoRA5gGxBcmvBPYcAT07tKDg5QIqf7DIG5LTb/SjXS0aRrOLxdWBaouC512hvSxAQBR6quEOuVjb2LgQa+WfYxp+INSNFkmqrCj1kQtWM9deQKCiByC/CT7GcKOYtuvritnLBJoupci7kdiwkiGkEN0UIeF9sJ3frDMC4PYziyu6v7tyZyHFFw==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc26e639-e8d5-4553-0466-08d884a34bdc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 11:33:36.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Wf+XYY7RTcdrJEEJk8ed/9lK+t7JZK19rLpU6+0ZoTe+2WuTpQLKPyxa7bcu96uKfCcQ6kdcL0so5d05ICZ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_063341_237061_E93C7CED 
X-CRM114-Status: GOOD (  15.20  )
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

This patch extends asm/csr.h by adding RISC-V hypervisor extension
related defines.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/asm/csr.h | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index cec462e198ce..bc825693e0e3 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -30,6 +30,8 @@
 #define SR_XS_CLEAN	_AC(0x00010000, UL)
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
+#define SR_MXR		_AC(0x00080000, UL)
+
 #ifndef CONFIG_64BIT
 #define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
 #else
@@ -52,22 +54,32 @@
 
 /* Interrupt causes (minus the high bit) */
 #define IRQ_S_SOFT		1
+#define IRQ_VS_SOFT		2
 #define IRQ_M_SOFT		3
 #define IRQ_S_TIMER		5
+#define IRQ_VS_TIMER		6
 #define IRQ_M_TIMER		7
 #define IRQ_S_EXT		9
+#define IRQ_VS_EXT		10
 #define IRQ_M_EXT		11
 
 /* Exception causes */
 #define EXC_INST_MISALIGNED	0
 #define EXC_INST_ACCESS		1
+#define EXC_INST_ILLEGAL	2
 #define EXC_BREAKPOINT		3
 #define EXC_LOAD_ACCESS		5
 #define EXC_STORE_ACCESS	7
 #define EXC_SYSCALL		8
+#define EXC_HYPERVISOR_SYSCALL	9
+#define EXC_SUPERVISOR_SYSCALL	10
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_INST_GUEST_PAGE_FAULT	20
+#define EXC_LOAD_GUEST_PAGE_FAULT	21
+#define EXC_VIRTUAL_INST_FAULT	22
+#define EXC_STORE_GUEST_PAGE_FAULT	23
 
 /* PMP configuration */
 #define PMP_R			0x01
@@ -79,6 +91,58 @@
 #define PMP_A_NAPOT		0x18
 #define PMP_L			0x80
 
+/* HSTATUS flags */
+#ifdef CONFIG_64BIT
+#define HSTATUS_VSXL		_AC(0x300000000, UL)
+#define HSTATUS_VSXL_SHIFT	32
+#endif
+#define HSTATUS_VTSR		_AC(0x00400000, UL)
+#define HSTATUS_VTW		_AC(0x00200000, UL)
+#define HSTATUS_VTVM		_AC(0x00100000, UL)
+#define HSTATUS_VGEIN		_AC(0x0003f000, UL)
+#define HSTATUS_VGEIN_SHIFT	12
+#define HSTATUS_HU		_AC(0x00000200, UL)
+#define HSTATUS_SPVP		_AC(0x00000100, UL)
+#define HSTATUS_SPV		_AC(0x00000080, UL)
+#define HSTATUS_GVA		_AC(0x00000040, UL)
+#define HSTATUS_VSBE		_AC(0x00000020, UL)
+
+/* HGATP flags */
+#define HGATP_MODE_OFF		_AC(0, UL)
+#define HGATP_MODE_SV32X4	_AC(1, UL)
+#define HGATP_MODE_SV39X4	_AC(8, UL)
+#define HGATP_MODE_SV48X4	_AC(9, UL)
+
+#define HGATP32_MODE_SHIFT	31
+#define HGATP32_VMID_SHIFT	22
+#define HGATP32_VMID_MASK	_AC(0x1FC00000, UL)
+#define HGATP32_PPN		_AC(0x003FFFFF, UL)
+
+#define HGATP64_MODE_SHIFT	60
+#define HGATP64_VMID_SHIFT	44
+#define HGATP64_VMID_MASK	_AC(0x03FFF00000000000, UL)
+#define HGATP64_PPN		_AC(0x00000FFFFFFFFFFF, UL)
+
+#define HGATP_PAGE_SHIFT	12
+
+#ifdef CONFIG_64BIT
+#define HGATP_PPN		HGATP64_PPN
+#define HGATP_VMID_SHIFT	HGATP64_VMID_SHIFT
+#define HGATP_VMID_MASK		HGATP64_VMID_MASK
+#define HGATP_MODE_SHIFT	HGATP64_MODE_SHIFT
+#else
+#define HGATP_PPN		HGATP32_PPN
+#define HGATP_VMID_SHIFT	HGATP32_VMID_SHIFT
+#define HGATP_VMID_MASK		HGATP32_VMID_MASK
+#define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
+#endif
+
+/* VSIP & HVIP relation */
+#define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
+#define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
+				 (_AC(1, UL) << IRQ_S_TIMER) | \
+				 (_AC(1, UL) << IRQ_S_EXT))
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
@@ -98,6 +162,31 @@
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
 
+#define CSR_VSSTATUS		0x200
+#define CSR_VSIE		0x204
+#define CSR_VSTVEC		0x205
+#define CSR_VSSCRATCH		0x240
+#define CSR_VSEPC		0x241
+#define CSR_VSCAUSE		0x242
+#define CSR_VSTVAL		0x243
+#define CSR_VSIP		0x244
+#define CSR_VSATP		0x280
+
+#define CSR_HSTATUS		0x600
+#define CSR_HEDELEG		0x602
+#define CSR_HIDELEG		0x603
+#define CSR_HIE			0x604
+#define CSR_HTIMEDELTA		0x605
+#define CSR_HCOUNTEREN		0x606
+#define CSR_HGEIE		0x607
+#define CSR_HTIMEDELTAH		0x615
+#define CSR_HTVAL		0x643
+#define CSR_HIP			0x644
+#define CSR_HVIP		0x645
+#define CSR_HTINST		0x64a
+#define CSR_HGATP		0x680
+#define CSR_HGEIP		0xe12
+
 #define CSR_MSTATUS		0x300
 #define CSR_MISA		0x301
 #define CSR_MIE			0x304
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
