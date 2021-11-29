Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE412C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AD3JRQ8y4T0eCywx7F/GDNSjS0q2qjE/X/hTzIk8IZY=; b=hrtm40b1KcpBtw
	atsPxb4G81eL8ax7f/2zcFyIte7PutxQxhCmekNobK68/ATpIw0nA6p+8B8gN5/HMafZymPkQAYED
	5WkPQwAVLISkNz0O10cn5tF3JGRFsYAS6cSbBDGiFTD7uIzfefBJO3zB6yj6O5WUYrGALK93HbEgq
	DS72HIPTYdPlefMspHzAfCwhEvw3fLcKJ7elrWWAH/zfm0zqDiLhHsfJYUYbsWsC+GrDBQmmFkZy5
	NSGcOi+QiQfywVWOHyLxGrrMJPSziz6mpZbPfr0mJIAwDmGfPmoM99mZieZLe6zdGtTKLBfhEg6A3
	6eGfTVVYNQ3jsFRvp69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrbjn-0004sV-HO; Mon, 29 Nov 2021 08:10:11 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrbjl-0004rt-4L; Mon, 29 Nov 2021 08:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638173409; x=1669709409;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=T67MY6GR8X13j2v+9AJiXYhJEpPEH5eeMLKeBlhYYvw=;
 b=TJ7MBJvDXy+N3c9HbVdh2yLh2UyepyzuoZa76x0n1jfOt0eyzDg0/M5H
 Z6BF/j+LSIkbmqbfiH7H5VGGaBKH5+XJAtBc0UFDaGF6ZjomSK3Ngv38z
 OEh4x+9mmWS8kpUJxDyCh1PakNxzs14RMZplbMb74AG3smwHHWLpkXWcm
 0chIZ8+YHWYJPxd/0yzGXv2NqIGnR4WNz/kOmdEm0OAtqkKllduw9WC3e
 2z7QyKgjoNB4p5ADqLlRICxANxl9c1UTquf6wV/ur4WOuX82fWdHEG8/U
 bn8LZAkyzlvzuLuWx2Rr6KX4utQv+5aSKXx4r9dQHWuYyO8d5dloHD6uO Q==;
X-IronPort-AV: E=Sophos;i="5.87,272,1631548800"; d="scan'208";a="290889279"
Received: from mail-dm3nam07lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2021 16:10:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezdO7McVhfdAtXR6EtvqBvDDgIxj5CKtcH9Jn2hA70BrTi+hCsEgrTkQ91ZWr3C4XKRfAhDw5/JNvIXlAxcuGZFif2H6HR/TgKTyHbAmOft2MEEFGDzZFnxDwT3kN7S1Wq7Jm9ngz1Y5kNDqr5CiQqYR9azMLnw/IGyWlYBfVzEHz/eiqbujfyPGOrhkYiFKaF2GiXPrVN9OXaTR9WfbxGvqAb5vd4U6u2IJ34a+GlHiy508k8ErKW1Z6pw6ZSNWt3X/M2tL/okYAfbsV28Er0V91Dyv0igchBdLLUE7dfxwzBqYeCkzPYO2RG0pAuQAfAudb2WYe/La6KeXVtnaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT+Fbugsqq70YZkmiMf9tAQrLPwIVM1ElImwgpu/DQI=;
 b=dlIl2sRx9jsPdKB/6vKYa1dbMS785ndUe3hgAoBzmCKRjjBWbpsoy8u89q5oiX1Q0EjqlPchx6fZwaNBoy2Up4tf3X9hbBNorRfh+3kpTbflg9oIs5mB9nXdf7Re3AVLHZEydEyEFE5cVW7kBtyFZFpjEGNdWTR5gRg72osVwb1NS4Px1k2wk9gizZEGxiR8Sfj18IXsGQ4tl7PLFfKP42ePXIw3e7U4Av6mG7QRmYtZdYiqRYr90ZnXMqWEiedWGKz0S0sIMpv5LRIrnpjs95ZIxTrBXs/i5kAaHnBINMQVIS1ljXJ2Q2T693ZoWbHCUVhFT4klA8HAWLrUDBCDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT+Fbugsqq70YZkmiMf9tAQrLPwIVM1ElImwgpu/DQI=;
 b=qZtWOANoE/db+QlGQyMb5GtRnlEemdUcuVcml8QMhX8WIgAl65CZPNO+rqo04y12LEkSPZtbYNwMqGaFZTxc2GDMBN6m7Kcikph6FxPEBtSUNeadAUxkEb72HGCShH8Qu1f/RejKSVMTPzQptpqgO6zD8u9BzSJHyXPo+izHseY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8380.namprd04.prod.outlook.com (2603:10b6:303:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 08:10:03 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 08:10:03 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 0/4] KVM RISC-V 64-bit selftests support
Date: Mon, 29 Nov 2021 13:24:47 +0530
Message-Id: <20211129075451.418122-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MA1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::34) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.150.114) by
 MA1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Mon, 29 Nov 2021 08:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fe9c7b8-94e2-46c3-f545-08d9b30fa54d
X-MS-TrafficTypeDiagnostic: CO6PR04MB8380:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8380CA8DBD69728C85CB7BE58D669@CO6PR04MB8380.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jhzQlMx/QoQjZ5ZuRv0x/3DqAAzxPpg7heINfJj9UBkZ+hbLpCVkLTNfjRNxgDtOhebP8w9fMNBASQUioHMeezTGrhkUjrR2xDPnfaZ3v64RWLAeYUei42SCSAfgK2IVspdIBiF5QnYE6lz14WX3A3ipMnhl0HgNB4zeTLWTzxuxvzb5i/A5OCyW4bU8JxOmIgCRa3BTd7g7hgzElw+XZWlXAx9ib3B44vCrin5KbMsqyZVvmYH0N6woKOo2+wbgq7U2uH0XWxFEPy02uDBxsIoIe9mZsrpGrBR6ktQsaq74I7AjB68EwGUbe4NlnKLTvnNRfjtK3IHPp1dhlHaURIJBFkhrOGBm4RRioYcjfbpt4HlPfVp27BnPj+BiaNxE5EXSKLQtmHhjO1k7XGLaLGJyDWyXbRSoFoek9nY8rV4sO8mKM7jfkNgWO9MBnp8I2/4+TypjwNih4VnHUePRG4jtbFaD13O8AwFKpy2SxbqqygLe+vBaBSdu9doodtBQTbX59ma/T1vPA2eTv+xmrRdPp7jOHwZxOPUzXwi+qlsQ9sYVSskVuTFgPVQXs0Lifdpp8Yhok5Ckn82umAZ0MqQRDoZApaV+wiouLiOUnBo7r0ICbzSJo8rsWb8jjgUKtctDiblwVu3JBfFm1hnR2Sj1dNrSvN6xzTLEn2adM3MZyGk0dZ2BsJL1zYbBVBTn9oQ2BQeOFhj+ioNReNABWRFaUZpgJmWTeRfofgcZLobErGP91Hjj19cllmNTTuJyBI5TYgekqKkTkqDLVwF6bb4FiqqUhlR6hbet6GcD5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016003)(52116002)(6666004)(966005)(8676002)(186003)(316002)(82960400001)(38350700002)(7696005)(508600001)(66946007)(66476007)(8886007)(66556008)(38100700002)(8936002)(1076003)(110136005)(4326008)(83380400001)(5660300002)(26005)(2906002)(86362001)(44832011)(7416002)(36756003)(956004)(54906003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4d1wMmJuVFHV9BOPYS5RmmcGJFwpO08GFh36M8+Sp4ljPi26ggo8jN0kawvP?=
 =?us-ascii?Q?YS+XhAfeBvpcItwE7lD2bgBBzsmQMtt1a4/R8CaEU09yST3DWrTYyl8j4jP2?=
 =?us-ascii?Q?iG7KsK+mbgYjVWoM5XM2FrVurdTCcr4tzQBmdpeOXl/In6YMQxCXBPEpJUxV?=
 =?us-ascii?Q?vOJxCFYXKgIX2IPQXH71/j09NRHcpRIUvjMgqYCGVeJFEOT2eBB9K5mZktxM?=
 =?us-ascii?Q?b+0VPGlfjAS5Rabj57Y2Qf9bjZAsDCKkNfGZKDwiyHQSJVqjqPVdzfYdB7KY?=
 =?us-ascii?Q?vyhgOejEqUiWdQ8kdMJw2USa8nJhmlDvRfdz0vCJvtypmPsS+yI/spTOeoWz?=
 =?us-ascii?Q?gq3+e8yMjl+Evm0FZyKSo3gMF87FAR/Ied2DmwuqLq4TNugi7kfXooubb/CI?=
 =?us-ascii?Q?60tIbQ3fwthSc5dX20lwOrWHXkLjGGpikjTocYaxhBUl2NI98Bz53NjRJpbW?=
 =?us-ascii?Q?UqYGI7meEO5Kp39ct6liAk9LuBVRp6BuslHcbyTyWTYbNhoidEU+p4jS4Mx5?=
 =?us-ascii?Q?b5Lx6zoAetGq2tto7sdhUM4pKonYV3pST/PkU7A6sql0/98hwlJ8UvfnKIqu?=
 =?us-ascii?Q?bn4C3iLNxN1e6oCrVj0t8b0xpwCFeP1jhu9ZuJdj497k8gro+uSeVnCBfS4+?=
 =?us-ascii?Q?S9SWkv17n7Pa6g0WlV6VxHl//nTY/fvizKNLdN+NM3XYVbCsM5uUNXdIHQIf?=
 =?us-ascii?Q?3qMGIM+gLMcWH2mzFFozBM+TLTd3OO8HD4xhA1+LWet7Is+vZoFYodI1xm9K?=
 =?us-ascii?Q?5anG2lYIuiHZckDzpdRyNqR8kcUXeWwCLDY+0tI3FOTqugLMTgfCvtGoyUXP?=
 =?us-ascii?Q?Z9ARr7F4ALHvP7YtlHT6Q5BQ9/ocgdtjfg/0Vljc62fQy+4PR43UOCEI/5R9?=
 =?us-ascii?Q?kVxJvf8v3P8+wL0JvFM8QVXGGIlJt/Cobha//dhwztgFTJN4GmM4goJM+eRB?=
 =?us-ascii?Q?Ikz15x21vwbhyFm5T+M9FywoQJqtwrwoblsTOSgLjWKcsQ1D5mxU3zM7JohG?=
 =?us-ascii?Q?HRLPC05G+4D7F8PxeluQtEXhIzi06mU1/Dyn/KWmB7sc6Dk6K1OsXbVHRyPD?=
 =?us-ascii?Q?mKrW99F53qv6XFzRvVqR2E+f17cODsTbCKkLY5GhcUmcvCf+sC9D+iiEY+e7?=
 =?us-ascii?Q?pPInHGfS6XZdyxxup1POPaQ6J2rpeKy6O/Z6mJQFXZuLGnYLHKwHD6XFDFDD?=
 =?us-ascii?Q?IbMTMGfsG/qai374mhJ/n0pdfFsyV5wZYzSJSNTVaOBHOF4zkU2oTRiZM5kd?=
 =?us-ascii?Q?AcBFW357ZZV2RTYNvRp8QGmjHDdd0jm40KyhpF0XvRL5fvAEb12eKiWM3wM6?=
 =?us-ascii?Q?xfxbybyOs12lIqNitC1zus84xRL0GhafX1aaoueO7Ea/cTo4HdaBT2WLz2hh?=
 =?us-ascii?Q?GlBSOgUpmZUo/k7Xc3lrDZgukJgi/phD2697CCasq3NGgfyYDgBp3hjqY1sb?=
 =?us-ascii?Q?g0Eaf9Mb7VQD5pVOQBPm8gI26s523spfvxvQSACs3RopNEfXkbEK1b6ebvvY?=
 =?us-ascii?Q?KkPf8NwgAcy9v0H2gjEaDuEKkIzzuLPFpxBg8UZeaaqG7UlOZa1uD0vAyD3U?=
 =?us-ascii?Q?tgEKzIfjFD1xJ1MPVp+4PsNwvoGKl1SnfXF1kJISTzZBuZwWBbKwy1Jm6ENT?=
 =?us-ascii?Q?AfHcMgScpIfIIgMLX5ra+M0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe9c7b8-94e2-46c3-f545-08d9b30fa54d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 08:10:03.2072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbV1J521NpwmV6DfkhkVvwix8YpgaFZ1WRKL0c3Tc0J5Wmz7xhh5/pxmoaOmNrEHUfLOTVBw+OoyHtANEFjUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_001009_286017_4A29AC31 
X-CRM114-Status: GOOD (  12.65  )
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

This series adds initial support for testing KVM RISC-V 64-bit using
kernel selftests framework. The PATCH1 & PATCH2 of this series does
some ground work in KVM RISC-V to implement RISC-V support in the KVM
selftests whereas remaining patches does required changes in the KVM
selftests.

These patches can be found in riscv_kvm_selftests_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Renamed kvm_sbi_ext_expevend_handler() to kvm_sbi_ext_forward_handler()
   in PATCH1
 - Renamed KVM_CAP_RISCV_VM_GPA_SIZE to KVM_CAP_VM_GPA_BITS in PATCH2
   and PATCH4

Anup Patel (4):
  RISC-V: KVM: Forward SBI experimental and vendor extensions
  RISC-V: KVM: Add VM capability to allow userspace get GPA bits
  KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
  KVM: selftests: Add initial support for RISC-V 64-bit

 arch/riscv/include/asm/kvm_host.h             |   1 +
 arch/riscv/kvm/mmu.c                          |   5 +
 arch/riscv/kvm/vcpu_sbi.c                     |   4 +
 arch/riscv/kvm/vcpu_sbi_base.c                |  27 ++
 arch/riscv/kvm/vm.c                           |   3 +
 include/uapi/linux/kvm.h                      |   1 +
 tools/testing/selftests/kvm/Makefile          |  14 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  10 +
 .../selftests/kvm/include/riscv/processor.h   | 135 +++++++
 tools/testing/selftests/kvm/lib/guest_modes.c |  10 +
 .../selftests/kvm/lib/riscv/processor.c       | 362 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  87 +++++
 12 files changed, 658 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/include/riscv/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/ucall.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
