Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431E1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FA5A60F58
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FA5A60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI+KXewmxBGQLuX4ROcdpODxgEHwUJ+ZFGnIcqddUFA=; b=pcWWmkxqKKh2b4
	cIBKcuzQUSRxc+RlZ2/cxXZev295wAROv3xy/XjK+PijgUBInmDWNKnfNK5tIAy4g2y8ZpJ8tzkWR
	DbnNQu0MUxXe2Ax2g4laDwKPQmUzwsxaiTKHqGlzb7Xkj3YEkJkgbZp0BzoAtjXKjRszr4FqTyqKI
	Qdf61IP66n0tO3XL4YE6LvFsf5HkayWb+RDhZt7kcxaBCVihJzlO1/NxZYru5HUCRNJah/rkg8Dw4
	rRa/FfJiU+fQqRTRHmtQ33A3tLFombcxcmQwUeSDYnXJkMDxaYNl9pqVa4KnCyCnYpubhxxXhwKDF
	LBvN/fe/ibw9y3++/L8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUp0Z-002T6Z-3b; Mon, 27 Sep 2021 11:41:19 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUp0V-002StC-9c; Mon, 27 Sep 2021 11:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632742875; x=1664278875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zj/tGYmtZVm6a51wl2lIJIgMOBOrzie8elVRo2zbppI=;
 b=OTBQKEXuwJNIRhwAdDP0ONzhK+Osgm+JfY21eeNMLlOMAdi08ovJmg18
 HjPQ0NdvXXJKtnIrGuDWV/wGsKZbJUOo2ksvK+qBdR8ZWPwC6iosjEmQ1
 CyJB7CgNzVXeb3mOOPhY6zXK9BgJgr3pVHcH8VCgsSLcbKxeimadsrnkD
 6o1NwUlornNX9w+zIZY3S4MYFM5W+Ll+bR3gu3meM4pKsYYuu+F3oSQbp
 5KTnq4V6TZZfXS8luUlqcb1qCfyRK2YeLKMUr5QPEaAedOYTaUTFQJxFS
 4n0Lt1vLmqHw5asrLnAXhMrMM/AOV8UlHZub6xF5G47sw4C3FfPt7HmJH w==;
X-IronPort-AV: E=Sophos;i="5.85,326,1624291200"; d="scan'208";a="292706488"
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2021 19:41:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kO8cbpc7OCLLC4hn1k0nPce1Q9MTaIXVvz7+XhykeNXGf4S0LQKMVvjOFdSAPCtPpGQ8Gkusm5rFLFgpQs4dh3I6F3egTwLqNRevibx4agOUQbggZLHCiYiRZNJ4eS2Rxsb3SRyLDhmOAazAl9fpMaEFC8/A0Ds0hlIoRKBomlOK9Et8ENAXBGVf1lo5f41PwV9pe+VYU0VrwZWIFY7eijrUOrVNiufN8Hgn+/DGYNuB9i3kLQcVDsTSNYPtx8CHg9fn2NIFmOzQQjz8I2b54wuDlIfC/6RmMa5zN2hRsPovhiDBQJyiyxgK4CElbStxY8hJbJxb0tAYaqilE9pIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=g7W/ch2YPTyzPWSYztXYEr2bmR1iK8lpRxyLXnzUkgc=;
 b=J9jf1r3w9qrhKlZfSQ/PBfKfIngudNeDWyLxJXGhh/ehLH7zwENFVYHaTImgle65iAjb2Cy0J27Vz9hHSbUosito4DocFuAQDaF9rUSErNSCUbaxMsRN3kCw609sTe74GT9PU1GI001tWY+NAjr5c0/rzm7dm8+2QhTX/xlki1seEZYawwt+zj3g2twNhqTValt1iBvZhnA5quXrcyRa8JQF0aB0GIkykU4YGbXEBAFBTfZrEK49tLuvk8C4TGhiuvT1fqhaVCk+OJGO0XEIMAc+m8Cxz6txY8NxLIXlWVGPluM+CQgWyUUJQ0x3wJUA+s5LkSL3VE2vwJO4vKFNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7W/ch2YPTyzPWSYztXYEr2bmR1iK8lpRxyLXnzUkgc=;
 b=NHU1GbbNTCD8KpiRzKHpNofm3kgcLsoucYzwg5KuBJ8WGhvTSpKTUvfI6VVBphOfJ8fyAP3jt4xAh+ggsrJx32Dow/BHtU2E9PIsiy75T+qchqwsBbfKnXsx0rmFSk07JLkzD/FM9n5IDaSVAdGSealNhafy3JUIapMxc24tjwA=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 11:41:11 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:41:11 +0000
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
Subject: [PATCH v20 06/17] RISC-V: KVM: Implement VCPU world-switch
Date: Mon, 27 Sep 2021 17:10:05 +0530
Message-Id: <20210927114016.1089328-7-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927114016.1089328-1-anup.patel@wdc.com>
References: <20210927114016.1089328-1-anup.patel@wdc.com>
X-ClientProxiedBy: MAXPR0101CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::13) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.75.205) by
 MAXPR0101CA0051.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 11:41:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a00b7b7-12fe-41e8-08a8-08d981abb428
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78413F4F694C5ECA9A6DC3C48DA79@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WupsN7uZKipj3dl1FXoUUWrTElZyEVdLhDgIJBVi4Ze4KOvXbSkKj9jpcFBuBpPEI6QKCs8huXZW3lKjzgG34NYpASgOWNvO7MUgZsnoNEeXSH89Sposg3GAzKu0dfYbdCdvz38UsGo4a3cKq9EgDMsAwJKXc7TlI1lukwAftfFgFBjrDESPm+eKfbnyh5TDtKiCmxfitSRBG4cQeRpllObf5fhiX1WS1ABxtPE1QJKeEs3wjNGMzCZK4RErEwMqxCy+x1c6kzJhjR/+GR6Irf5JWkjKixLZCrrVa2QdHtI+1nTnC2JkC3R8mD31tup7pxVJgNYBmD/yNP/fXlYWuXycExVu38yv759JZr5+HMedayM2yqkROOZilv+OMBp8/JGD6H2RtDV4eGBKX+z2XYL37wGrB6OaiL4aRfx1hmapWvviEUkyiwxGBeOJCXbmL/6lUqpo9j6nZCdtt6xMk717cLZ3887nhWagWfKDuGvrJNH+I3vGJXedmJhjBdT5KnFicHQ4kNvLnovbJPPuLzg9wkbV7DFYS3ltH+Mcp6iTw0Gb8zZwOFma5d4toAXs0+xbmaNUXgGil12xcZZ3HkuNPj9eY4O2Lm2SKKgy45+UBt33KazCds0u2W3aIV8py+e3iNsDh9U04o8WpC+XYazAVOfl1UA1+6+pAmZypxy6KeXaWqTiI2wwoln6Wkbt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(316002)(110136005)(5660300002)(1076003)(66556008)(83380400001)(30864003)(66946007)(66476007)(36756003)(38100700002)(38350700002)(55016002)(86362001)(508600001)(44832011)(8886007)(2906002)(8676002)(956004)(2616005)(7696005)(8936002)(7416002)(4326008)(26005)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/1rzDwdVL/Wgq5zEDkSnrpur6Er6HdsJCnzVQ4CQj7mY82tbnwEvjWmFj0A?=
 =?us-ascii?Q?aZ2o99+foBaJ8lLsjesU2zDN6rCo8yTvwehuBOugjTluTpo2uGdepXnU1Tx9?=
 =?us-ascii?Q?RyfBQht1VCvUAInbDbwZxr5VMTXiSn3pDpc1n1JXUHzoMCsnnoMNQ0jDScew?=
 =?us-ascii?Q?7Uf2CnpT33OCGiMmnGa/IYt2fQOfH1uNZ/9YpUmMAEssIDwsnmDJer8UmIIY?=
 =?us-ascii?Q?07idIHV8UrASHEp0AFHtf54LC9GEtpSTcIhL1O/l9A+PsRtcKfAlgkuSj+JG?=
 =?us-ascii?Q?XnVvbKBrNkNm2HkFWNYTSs2EsbPE4taECnjfcLDhtHSZUjWQl5MvvejaB8Sf?=
 =?us-ascii?Q?K1j8q0yIMoeVQjFTYKgGk+OwCFcd2gqzjiZRbKk4nvfFB49iw0LxtaFFP77j?=
 =?us-ascii?Q?XlGV+alBeiBV3r/Ixes11zUvVhg5DHI50bcvWukvR75lc/u1t7Ds6dyoue56?=
 =?us-ascii?Q?pQTxkZkjWLAk/2OMsadS4pAX57zPFGOI9fRg5bdWKPoBczO4Ex+tB7iAJQDH?=
 =?us-ascii?Q?jtFVbrbmp8pgiGhVjUVHt5amlyJnDgE7HeXsXlDQaSSSuVEF5/Ac2PMurHvB?=
 =?us-ascii?Q?mUzZJkaeoguzA0p9n/tPmpSai5KIaM/HGtCUYX6qWmSfvgLxhjD0JlOYT73a?=
 =?us-ascii?Q?bkp6GeaD8mZbPyYLLRp8DLqK/EF1dMvksyRV+EiRnapt67SB/hbw0U1JU7N8?=
 =?us-ascii?Q?GBnv3J2GXBjuYQ5R2By8RCYC9ZeeJL1LyT6p+z6HDz7AJARgBvfQ2nmSmY1F?=
 =?us-ascii?Q?4eLOq8xKny0L0qOePSV7Q/nqOA8YVBI6aCAeOsmXWd0dXu0FGzjJkpp0Vvij?=
 =?us-ascii?Q?PtejoR1B9dXB8huH1GN1+J3rQYyZqR4i2QBm9KRu9VJRYc0I3M0H5smMM0mc?=
 =?us-ascii?Q?6C3ScB1WUh6+dDmI6Jh9w5p+ZB9SUKvqBI90+5TNawIpqmfUj+dyu8ON0fgz?=
 =?us-ascii?Q?ThH2Xs4KF6Hdn3xOOmJju/ZZfGfeoQ2tqEnb3p47vPDD6z6PwAWJ0xg69Dvg?=
 =?us-ascii?Q?nSJ4HkxLnbmQHKRC+k6e4Wf4jNvoxtZTNMem+xk+8dvV2z+ruHCaxXe9CgbA?=
 =?us-ascii?Q?6KCJ/cd3vI57UhlcDv+2wDoyhAtRugOu9wFBYPsI5Juo6dTZcZYkLL5pJQUO?=
 =?us-ascii?Q?n4g3jHeM298s6k/LF/egOutxlvan2oeHEJrRewVKaW4OgkKhl6Dg5LPY2hVY?=
 =?us-ascii?Q?7tBRUqj+xtbvv178SP00sS0XdVasGDwPQxyU7Weq+yHGd22VHelUxDexj0TA?=
 =?us-ascii?Q?wi/YihcmrekD2gtzDt9DL8wnMXqNh0ebd0l0ACsSu9q0zQlriG7BjScF0ZIr?=
 =?us-ascii?Q?7LHmquPhps8BActE2prevtgq?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a00b7b7-12fe-41e8-08a8-08d981abb428
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:41:11.2713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6d+UH9TWNmk14m0ZQAI5v79GIPhfb/OHUv9pcIAukiMPkdQ5xYS0rLL99i3O+PTXazlqMm5XbPyZVFrYHwSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_044115_457584_A73E370B 
X-CRM114-Status: GOOD (  13.40  )
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

This patch implements the VCPU world-switch for KVM RISC-V.

The KVM RISC-V world-switch (i.e. __kvm_riscv_switch_to()) mostly
switches general purpose registers, SSTATUS, STVEC, SSCRATCH and
HSTATUS CSRs. Other CSRs are switched via vcpu_load() and vcpu_put()
interface in kvm_arch_vcpu_load() and kvm_arch_vcpu_put() functions
respectively.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/asm/kvm_host.h |  10 +-
 arch/riscv/kernel/asm-offsets.c   |  78 ++++++++++++
 arch/riscv/kvm/Makefile           |   2 +-
 arch/riscv/kvm/vcpu.c             |  30 ++++-
 arch/riscv/kvm/vcpu_switch.S      | 203 ++++++++++++++++++++++++++++++
 5 files changed, 319 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_switch.S

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index e307528bbdbf..8ef0ca100e75 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -115,6 +115,14 @@ struct kvm_vcpu_arch {
 	/* ISA feature bits (similar to MISA) */
 	unsigned long isa;
 
+	/* SSCRATCH, STVEC, and SCOUNTEREN of Host */
+	unsigned long host_sscratch;
+	unsigned long host_stvec;
+	unsigned long host_scounteren;
+
+	/* CPU context of Host */
+	struct kvm_cpu_context host_context;
+
 	/* CPU context of Guest VCPU */
 	struct kvm_cpu_context guest_context;
 
@@ -163,7 +171,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			struct kvm_cpu_trap *trap);
 
-static inline void __kvm_riscv_switch_to(struct kvm_vcpu_arch *vcpu_arch) {}
+void __kvm_riscv_switch_to(struct kvm_vcpu_arch *vcpu_arch);
 
 int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 90f8ce64fa6f..2fac70303341 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -7,7 +7,9 @@
 #define GENERATING_ASM_OFFSETS
 
 #include <linux/kbuild.h>
+#include <linux/mm.h>
 #include <linux/sched.h>
+#include <asm/kvm_host.h>
 #include <asm/thread_info.h>
 #include <asm/ptrace.h>
 
@@ -111,6 +113,82 @@ void asm_offsets(void)
 	OFFSET(PT_BADADDR, pt_regs, badaddr);
 	OFFSET(PT_CAUSE, pt_regs, cause);
 
+	OFFSET(KVM_ARCH_GUEST_ZERO, kvm_vcpu_arch, guest_context.zero);
+	OFFSET(KVM_ARCH_GUEST_RA, kvm_vcpu_arch, guest_context.ra);
+	OFFSET(KVM_ARCH_GUEST_SP, kvm_vcpu_arch, guest_context.sp);
+	OFFSET(KVM_ARCH_GUEST_GP, kvm_vcpu_arch, guest_context.gp);
+	OFFSET(KVM_ARCH_GUEST_TP, kvm_vcpu_arch, guest_context.tp);
+	OFFSET(KVM_ARCH_GUEST_T0, kvm_vcpu_arch, guest_context.t0);
+	OFFSET(KVM_ARCH_GUEST_T1, kvm_vcpu_arch, guest_context.t1);
+	OFFSET(KVM_ARCH_GUEST_T2, kvm_vcpu_arch, guest_context.t2);
+	OFFSET(KVM_ARCH_GUEST_S0, kvm_vcpu_arch, guest_context.s0);
+	OFFSET(KVM_ARCH_GUEST_S1, kvm_vcpu_arch, guest_context.s1);
+	OFFSET(KVM_ARCH_GUEST_A0, kvm_vcpu_arch, guest_context.a0);
+	OFFSET(KVM_ARCH_GUEST_A1, kvm_vcpu_arch, guest_context.a1);
+	OFFSET(KVM_ARCH_GUEST_A2, kvm_vcpu_arch, guest_context.a2);
+	OFFSET(KVM_ARCH_GUEST_A3, kvm_vcpu_arch, guest_context.a3);
+	OFFSET(KVM_ARCH_GUEST_A4, kvm_vcpu_arch, guest_context.a4);
+	OFFSET(KVM_ARCH_GUEST_A5, kvm_vcpu_arch, guest_context.a5);
+	OFFSET(KVM_ARCH_GUEST_A6, kvm_vcpu_arch, guest_context.a6);
+	OFFSET(KVM_ARCH_GUEST_A7, kvm_vcpu_arch, guest_context.a7);
+	OFFSET(KVM_ARCH_GUEST_S2, kvm_vcpu_arch, guest_context.s2);
+	OFFSET(KVM_ARCH_GUEST_S3, kvm_vcpu_arch, guest_context.s3);
+	OFFSET(KVM_ARCH_GUEST_S4, kvm_vcpu_arch, guest_context.s4);
+	OFFSET(KVM_ARCH_GUEST_S5, kvm_vcpu_arch, guest_context.s5);
+	OFFSET(KVM_ARCH_GUEST_S6, kvm_vcpu_arch, guest_context.s6);
+	OFFSET(KVM_ARCH_GUEST_S7, kvm_vcpu_arch, guest_context.s7);
+	OFFSET(KVM_ARCH_GUEST_S8, kvm_vcpu_arch, guest_context.s8);
+	OFFSET(KVM_ARCH_GUEST_S9, kvm_vcpu_arch, guest_context.s9);
+	OFFSET(KVM_ARCH_GUEST_S10, kvm_vcpu_arch, guest_context.s10);
+	OFFSET(KVM_ARCH_GUEST_S11, kvm_vcpu_arch, guest_context.s11);
+	OFFSET(KVM_ARCH_GUEST_T3, kvm_vcpu_arch, guest_context.t3);
+	OFFSET(KVM_ARCH_GUEST_T4, kvm_vcpu_arch, guest_context.t4);
+	OFFSET(KVM_ARCH_GUEST_T5, kvm_vcpu_arch, guest_context.t5);
+	OFFSET(KVM_ARCH_GUEST_T6, kvm_vcpu_arch, guest_context.t6);
+	OFFSET(KVM_ARCH_GUEST_SEPC, kvm_vcpu_arch, guest_context.sepc);
+	OFFSET(KVM_ARCH_GUEST_SSTATUS, kvm_vcpu_arch, guest_context.sstatus);
+	OFFSET(KVM_ARCH_GUEST_HSTATUS, kvm_vcpu_arch, guest_context.hstatus);
+	OFFSET(KVM_ARCH_GUEST_SCOUNTEREN, kvm_vcpu_arch, guest_csr.scounteren);
+
+	OFFSET(KVM_ARCH_HOST_ZERO, kvm_vcpu_arch, host_context.zero);
+	OFFSET(KVM_ARCH_HOST_RA, kvm_vcpu_arch, host_context.ra);
+	OFFSET(KVM_ARCH_HOST_SP, kvm_vcpu_arch, host_context.sp);
+	OFFSET(KVM_ARCH_HOST_GP, kvm_vcpu_arch, host_context.gp);
+	OFFSET(KVM_ARCH_HOST_TP, kvm_vcpu_arch, host_context.tp);
+	OFFSET(KVM_ARCH_HOST_T0, kvm_vcpu_arch, host_context.t0);
+	OFFSET(KVM_ARCH_HOST_T1, kvm_vcpu_arch, host_context.t1);
+	OFFSET(KVM_ARCH_HOST_T2, kvm_vcpu_arch, host_context.t2);
+	OFFSET(KVM_ARCH_HOST_S0, kvm_vcpu_arch, host_context.s0);
+	OFFSET(KVM_ARCH_HOST_S1, kvm_vcpu_arch, host_context.s1);
+	OFFSET(KVM_ARCH_HOST_A0, kvm_vcpu_arch, host_context.a0);
+	OFFSET(KVM_ARCH_HOST_A1, kvm_vcpu_arch, host_context.a1);
+	OFFSET(KVM_ARCH_HOST_A2, kvm_vcpu_arch, host_context.a2);
+	OFFSET(KVM_ARCH_HOST_A3, kvm_vcpu_arch, host_context.a3);
+	OFFSET(KVM_ARCH_HOST_A4, kvm_vcpu_arch, host_context.a4);
+	OFFSET(KVM_ARCH_HOST_A5, kvm_vcpu_arch, host_context.a5);
+	OFFSET(KVM_ARCH_HOST_A6, kvm_vcpu_arch, host_context.a6);
+	OFFSET(KVM_ARCH_HOST_A7, kvm_vcpu_arch, host_context.a7);
+	OFFSET(KVM_ARCH_HOST_S2, kvm_vcpu_arch, host_context.s2);
+	OFFSET(KVM_ARCH_HOST_S3, kvm_vcpu_arch, host_context.s3);
+	OFFSET(KVM_ARCH_HOST_S4, kvm_vcpu_arch, host_context.s4);
+	OFFSET(KVM_ARCH_HOST_S5, kvm_vcpu_arch, host_context.s5);
+	OFFSET(KVM_ARCH_HOST_S6, kvm_vcpu_arch, host_context.s6);
+	OFFSET(KVM_ARCH_HOST_S7, kvm_vcpu_arch, host_context.s7);
+	OFFSET(KVM_ARCH_HOST_S8, kvm_vcpu_arch, host_context.s8);
+	OFFSET(KVM_ARCH_HOST_S9, kvm_vcpu_arch, host_context.s9);
+	OFFSET(KVM_ARCH_HOST_S10, kvm_vcpu_arch, host_context.s10);
+	OFFSET(KVM_ARCH_HOST_S11, kvm_vcpu_arch, host_context.s11);
+	OFFSET(KVM_ARCH_HOST_T3, kvm_vcpu_arch, host_context.t3);
+	OFFSET(KVM_ARCH_HOST_T4, kvm_vcpu_arch, host_context.t4);
+	OFFSET(KVM_ARCH_HOST_T5, kvm_vcpu_arch, host_context.t5);
+	OFFSET(KVM_ARCH_HOST_T6, kvm_vcpu_arch, host_context.t6);
+	OFFSET(KVM_ARCH_HOST_SEPC, kvm_vcpu_arch, host_context.sepc);
+	OFFSET(KVM_ARCH_HOST_SSTATUS, kvm_vcpu_arch, host_context.sstatus);
+	OFFSET(KVM_ARCH_HOST_HSTATUS, kvm_vcpu_arch, host_context.hstatus);
+	OFFSET(KVM_ARCH_HOST_SSCRATCH, kvm_vcpu_arch, host_sscratch);
+	OFFSET(KVM_ARCH_HOST_STVEC, kvm_vcpu_arch, host_stvec);
+	OFFSET(KVM_ARCH_HOST_SCOUNTEREN, kvm_vcpu_arch, host_scounteren);
+
 	/*
 	 * THREAD_{F,X}* might be larger than a S-type offset can handle, but
 	 * these are used in performance-sensitive assembly so we can't resort
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4732094391bf..9e8133c898dc 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -10,4 +10,4 @@ KVM := ../../../virt/kvm
 obj-$(CONFIG_KVM) += kvm.o
 
 kvm-y += $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/binary_stats.o \
-	 main.o vm.o mmu.o vcpu.o vcpu_exit.o
+	 main.o vm.o mmu.o vcpu.o vcpu_exit.o vcpu_switch.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a15d97f3e5f6..64f74290a90f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -565,14 +565,40 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
-	/* TODO: */
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	csr_write(CSR_VSSTATUS, csr->vsstatus);
+	csr_write(CSR_VSIE, csr->vsie);
+	csr_write(CSR_VSTVEC, csr->vstvec);
+	csr_write(CSR_VSSCRATCH, csr->vsscratch);
+	csr_write(CSR_VSEPC, csr->vsepc);
+	csr_write(CSR_VSCAUSE, csr->vscause);
+	csr_write(CSR_VSTVAL, csr->vstval);
+	csr_write(CSR_HVIP, csr->hvip);
+	csr_write(CSR_VSATP, csr->vsatp);
 
 	kvm_riscv_stage2_update_hgatp(vcpu);
+
+	vcpu->cpu = cpu;
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	/* TODO: */
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	vcpu->cpu = -1;
+
+	csr_write(CSR_HGATP, 0);
+
+	csr->vsstatus = csr_read(CSR_VSSTATUS);
+	csr->vsie = csr_read(CSR_VSIE);
+	csr->vstvec = csr_read(CSR_VSTVEC);
+	csr->vsscratch = csr_read(CSR_VSSCRATCH);
+	csr->vsepc = csr_read(CSR_VSEPC);
+	csr->vscause = csr_read(CSR_VSCAUSE);
+	csr->vstval = csr_read(CSR_VSTVAL);
+	csr->hvip = csr_read(CSR_HVIP);
+	csr->vsatp = csr_read(CSR_VSATP);
 }
 
 static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
new file mode 100644
index 000000000000..5174b025ff4e
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/csr.h>
+
+	.text
+	.altmacro
+	.option norelax
+
+ENTRY(__kvm_riscv_switch_to)
+	/* Save Host GPRs (except A0 and T0-T6) */
+	REG_S	ra, (KVM_ARCH_HOST_RA)(a0)
+	REG_S	sp, (KVM_ARCH_HOST_SP)(a0)
+	REG_S	gp, (KVM_ARCH_HOST_GP)(a0)
+	REG_S	tp, (KVM_ARCH_HOST_TP)(a0)
+	REG_S	s0, (KVM_ARCH_HOST_S0)(a0)
+	REG_S	s1, (KVM_ARCH_HOST_S1)(a0)
+	REG_S	a1, (KVM_ARCH_HOST_A1)(a0)
+	REG_S	a2, (KVM_ARCH_HOST_A2)(a0)
+	REG_S	a3, (KVM_ARCH_HOST_A3)(a0)
+	REG_S	a4, (KVM_ARCH_HOST_A4)(a0)
+	REG_S	a5, (KVM_ARCH_HOST_A5)(a0)
+	REG_S	a6, (KVM_ARCH_HOST_A6)(a0)
+	REG_S	a7, (KVM_ARCH_HOST_A7)(a0)
+	REG_S	s2, (KVM_ARCH_HOST_S2)(a0)
+	REG_S	s3, (KVM_ARCH_HOST_S3)(a0)
+	REG_S	s4, (KVM_ARCH_HOST_S4)(a0)
+	REG_S	s5, (KVM_ARCH_HOST_S5)(a0)
+	REG_S	s6, (KVM_ARCH_HOST_S6)(a0)
+	REG_S	s7, (KVM_ARCH_HOST_S7)(a0)
+	REG_S	s8, (KVM_ARCH_HOST_S8)(a0)
+	REG_S	s9, (KVM_ARCH_HOST_S9)(a0)
+	REG_S	s10, (KVM_ARCH_HOST_S10)(a0)
+	REG_S	s11, (KVM_ARCH_HOST_S11)(a0)
+
+	/* Save Host and Restore Guest SSTATUS */
+	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	csrrw	t0, CSR_SSTATUS, t0
+	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
+
+	/* Save Host and Restore Guest HSTATUS */
+	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
+	csrrw	t1, CSR_HSTATUS, t1
+	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
+
+	/* Save Host and Restore Guest SCOUNTEREN */
+	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	csrrw	t2, CSR_SCOUNTEREN, t2
+	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+
+	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
+	csrrw	t3, CSR_SSCRATCH, a0
+	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
+
+	/* Save Host STVEC and change it to return path */
+	la	t4, __kvm_switch_return
+	csrrw	t4, CSR_STVEC, t4
+	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
+
+	/* Restore Guest SEPC */
+	REG_L	t0, (KVM_ARCH_GUEST_SEPC)(a0)
+	csrw	CSR_SEPC, t0
+
+	/* Restore Guest GPRs (except A0) */
+	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
+	REG_L	sp, (KVM_ARCH_GUEST_SP)(a0)
+	REG_L	gp, (KVM_ARCH_GUEST_GP)(a0)
+	REG_L	tp, (KVM_ARCH_GUEST_TP)(a0)
+	REG_L	t0, (KVM_ARCH_GUEST_T0)(a0)
+	REG_L	t1, (KVM_ARCH_GUEST_T1)(a0)
+	REG_L	t2, (KVM_ARCH_GUEST_T2)(a0)
+	REG_L	s0, (KVM_ARCH_GUEST_S0)(a0)
+	REG_L	s1, (KVM_ARCH_GUEST_S1)(a0)
+	REG_L	a1, (KVM_ARCH_GUEST_A1)(a0)
+	REG_L	a2, (KVM_ARCH_GUEST_A2)(a0)
+	REG_L	a3, (KVM_ARCH_GUEST_A3)(a0)
+	REG_L	a4, (KVM_ARCH_GUEST_A4)(a0)
+	REG_L	a5, (KVM_ARCH_GUEST_A5)(a0)
+	REG_L	a6, (KVM_ARCH_GUEST_A6)(a0)
+	REG_L	a7, (KVM_ARCH_GUEST_A7)(a0)
+	REG_L	s2, (KVM_ARCH_GUEST_S2)(a0)
+	REG_L	s3, (KVM_ARCH_GUEST_S3)(a0)
+	REG_L	s4, (KVM_ARCH_GUEST_S4)(a0)
+	REG_L	s5, (KVM_ARCH_GUEST_S5)(a0)
+	REG_L	s6, (KVM_ARCH_GUEST_S6)(a0)
+	REG_L	s7, (KVM_ARCH_GUEST_S7)(a0)
+	REG_L	s8, (KVM_ARCH_GUEST_S8)(a0)
+	REG_L	s9, (KVM_ARCH_GUEST_S9)(a0)
+	REG_L	s10, (KVM_ARCH_GUEST_S10)(a0)
+	REG_L	s11, (KVM_ARCH_GUEST_S11)(a0)
+	REG_L	t3, (KVM_ARCH_GUEST_T3)(a0)
+	REG_L	t4, (KVM_ARCH_GUEST_T4)(a0)
+	REG_L	t5, (KVM_ARCH_GUEST_T5)(a0)
+	REG_L	t6, (KVM_ARCH_GUEST_T6)(a0)
+
+	/* Restore Guest A0 */
+	REG_L	a0, (KVM_ARCH_GUEST_A0)(a0)
+
+	/* Resume Guest */
+	sret
+
+	/* Back to Host */
+	.align 2
+__kvm_switch_return:
+	/* Swap Guest A0 with SSCRATCH */
+	csrrw	a0, CSR_SSCRATCH, a0
+
+	/* Save Guest GPRs (except A0) */
+	REG_S	ra, (KVM_ARCH_GUEST_RA)(a0)
+	REG_S	sp, (KVM_ARCH_GUEST_SP)(a0)
+	REG_S	gp, (KVM_ARCH_GUEST_GP)(a0)
+	REG_S	tp, (KVM_ARCH_GUEST_TP)(a0)
+	REG_S	t0, (KVM_ARCH_GUEST_T0)(a0)
+	REG_S	t1, (KVM_ARCH_GUEST_T1)(a0)
+	REG_S	t2, (KVM_ARCH_GUEST_T2)(a0)
+	REG_S	s0, (KVM_ARCH_GUEST_S0)(a0)
+	REG_S	s1, (KVM_ARCH_GUEST_S1)(a0)
+	REG_S	a1, (KVM_ARCH_GUEST_A1)(a0)
+	REG_S	a2, (KVM_ARCH_GUEST_A2)(a0)
+	REG_S	a3, (KVM_ARCH_GUEST_A3)(a0)
+	REG_S	a4, (KVM_ARCH_GUEST_A4)(a0)
+	REG_S	a5, (KVM_ARCH_GUEST_A5)(a0)
+	REG_S	a6, (KVM_ARCH_GUEST_A6)(a0)
+	REG_S	a7, (KVM_ARCH_GUEST_A7)(a0)
+	REG_S	s2, (KVM_ARCH_GUEST_S2)(a0)
+	REG_S	s3, (KVM_ARCH_GUEST_S3)(a0)
+	REG_S	s4, (KVM_ARCH_GUEST_S4)(a0)
+	REG_S	s5, (KVM_ARCH_GUEST_S5)(a0)
+	REG_S	s6, (KVM_ARCH_GUEST_S6)(a0)
+	REG_S	s7, (KVM_ARCH_GUEST_S7)(a0)
+	REG_S	s8, (KVM_ARCH_GUEST_S8)(a0)
+	REG_S	s9, (KVM_ARCH_GUEST_S9)(a0)
+	REG_S	s10, (KVM_ARCH_GUEST_S10)(a0)
+	REG_S	s11, (KVM_ARCH_GUEST_S11)(a0)
+	REG_S	t3, (KVM_ARCH_GUEST_T3)(a0)
+	REG_S	t4, (KVM_ARCH_GUEST_T4)(a0)
+	REG_S	t5, (KVM_ARCH_GUEST_T5)(a0)
+	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
+
+	/* Save Guest SEPC */
+	csrr	t0, CSR_SEPC
+	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
+
+	/* Restore Host STVEC */
+	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
+	csrw	CSR_STVEC, t1
+
+	/* Save Guest A0 and Restore Host SSCRATCH */
+	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	csrrw	t2, CSR_SSCRATCH, t2
+	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+
+	/* Save Guest and Restore Host SCOUNTEREN */
+	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	csrrw	t3, CSR_SCOUNTEREN, t3
+	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+
+	/* Save Guest and Restore Host HSTATUS */
+	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
+	csrrw	t4, CSR_HSTATUS, t4
+	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
+
+	/* Save Guest and Restore Host SSTATUS */
+	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
+	csrrw	t5, CSR_SSTATUS, t5
+	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
+
+	/* Restore Host GPRs (except A0 and T0-T6) */
+	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
+	REG_L	sp, (KVM_ARCH_HOST_SP)(a0)
+	REG_L	gp, (KVM_ARCH_HOST_GP)(a0)
+	REG_L	tp, (KVM_ARCH_HOST_TP)(a0)
+	REG_L	s0, (KVM_ARCH_HOST_S0)(a0)
+	REG_L	s1, (KVM_ARCH_HOST_S1)(a0)
+	REG_L	a1, (KVM_ARCH_HOST_A1)(a0)
+	REG_L	a2, (KVM_ARCH_HOST_A2)(a0)
+	REG_L	a3, (KVM_ARCH_HOST_A3)(a0)
+	REG_L	a4, (KVM_ARCH_HOST_A4)(a0)
+	REG_L	a5, (KVM_ARCH_HOST_A5)(a0)
+	REG_L	a6, (KVM_ARCH_HOST_A6)(a0)
+	REG_L	a7, (KVM_ARCH_HOST_A7)(a0)
+	REG_L	s2, (KVM_ARCH_HOST_S2)(a0)
+	REG_L	s3, (KVM_ARCH_HOST_S3)(a0)
+	REG_L	s4, (KVM_ARCH_HOST_S4)(a0)
+	REG_L	s5, (KVM_ARCH_HOST_S5)(a0)
+	REG_L	s6, (KVM_ARCH_HOST_S6)(a0)
+	REG_L	s7, (KVM_ARCH_HOST_S7)(a0)
+	REG_L	s8, (KVM_ARCH_HOST_S8)(a0)
+	REG_L	s9, (KVM_ARCH_HOST_S9)(a0)
+	REG_L	s10, (KVM_ARCH_HOST_S10)(a0)
+	REG_L	s11, (KVM_ARCH_HOST_S11)(a0)
+
+	/* Return to C code */
+	ret
+ENDPROC(__kvm_riscv_switch_to)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
