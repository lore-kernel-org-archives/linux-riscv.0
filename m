Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DDAC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 19:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qht3MYE9CSVArm509g1u25AtXZHURlzJ8pZ67t0qVTA=; b=fKZveex9CRD7KB
	QMsI8LsZXEbLmYbVCjO+yJkqJbRsdAwMlcnZMLArJkiwUMDWRfgk/lm5N1rQyJOgAcOw/BA9utsGD
	FBrVAC+5ep3UIDtNr+9hc2SBj4t/D6PcOHTlic0dyZwcu+gilckI97ut7e/4e3zlpmp0sLYlDr2l+
	ie/eUAeBLiCHeOZXpZIiyeSRU6N+u2Mou2XgZ+LKUmctQUPhhITXlPc4ljC7b3gJzMK5gWDCvgVMc
	jODymhCmRY1eBqNrOrzN7gqouHvXI4gJlTfZuSmDD5bp4JEyxhO8nkmJoMB94WO1nk9e9A1ewx2xa
	SOgfhK/o6BMOU6oJoY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGOnM-00BG1c-3B;
	Mon, 03 Jul 2023 19:01:08 +0000
Received: from mail-dm3nam02on20602.outbound.protection.outlook.com ([2a01:111:f400:7e83::602] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGOnJ-00BFzu-1o
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 19:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWHTfUER0G1yzIw6Jb03bhEMYf83btcHKVSAhM+m1dW++TNgALlmlFSQh3Z3/A0Nxk3KhvXRVpCD5Czzf739KyOC9rwN80+ClhWm0LzIZkpe47FbRGo3i6RQZ6reK5kFnK4oH7P2b0E7LD7i8nf8CKlm8aBqD0s6+/5qqsBwVJFepNgwFDcXqzGqtgCB2ZwlaOxJqJwIo11ey9ox967zVYZ1eH3xSp819mLlI2t5mLvVl3sm5L7A5vuyHnCCyQSpPELq5fIwD8dHzUD5tGq+h2QRd8Zg4qbxGgWR+Jbq08yHbIndNCeQbVtsn8OUCVsViIxhyRc2zni9zSuEr0z0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4hQEngljiBuMGKa7/H9dnFsqTDES+zur4iQU7FQ8DQ=;
 b=ZJo8jDgFfu0SyKE3qFMeywdlpaQSmgGeXtNgpVP62mjM4rXftmaFu+WQHuEkO2ZUztu6dcLbSkIVwPEhoyXp+gE7dsMACbyIbUk2v1Bb2SDqbAacd7C/v2iZLAmZR5o9JId/49gVUlWP0V7M4/F8i1TmekaJDJ6dmhzplAheLZan/c88V5yBIEAtw9Xfti+t3PnrlgtplCrtR8VEH5X1NMmrG1jK9mfrc4rbFsi+H1fLQoglqzECeLc3K+ITn2G/Ht/lf6MJhlHZ0q6dASM8NAyAvSaDJWVEJ2ZEM86+tKPy94hkGCHJlI1LllACg2HDtCv0GKOMxWF8xoLnxGODOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4hQEngljiBuMGKa7/H9dnFsqTDES+zur4iQU7FQ8DQ=;
 b=PiitQvUBS87MkQGzcVGcZ75MR0DFV5AVGzybDB2IF+gMqWElRfVwV2VLPROo5Q0yHEiBafeiwB0LiNHm/o+iIUPuE4RxSz92YBe9J0gROuDPu76HYEg1DgO5sYgC5vkCGrgPb+f9Q+SLymTKKU3V2cfuiaj/DnVTpSjdiqiX6NbX7CINTRwv0E7R22FTxjFw3RXyyr/EFkBCepbzn21WvpXc+KRt23Mbl+UhNoQOpUpwLR/gUa5KFzFjh1eQDeFzevLAdpTMlq/uiIVDlIpaterJb2GwT79fZwAPdpuIaFfbVMHIL1E/iFvs69s03OUtq/7RiHKZUxAik0MgAKKNeg==
Received: from MW2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:907::19) by
 CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Mon, 3 Jul 2023 19:00:57 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::a5) by MW2PR16CA0006.outlook.office365.com
 (2603:10b6:907::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 19:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.43 via Frontend Transport; Mon, 3 Jul 2023 19:00:57 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 3 Jul 2023
 12:00:46 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 3 Jul 2023 12:00:46 -0700
Received: from sandstorm.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Mon, 3 Jul 2023 12:00:46 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, "Hugh
 Dickins" <hughd@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Qinglin Pan
	<panqinglin2020@iscas.ac.cn>, <linux-riscv@lists.infradead.org>,
	<linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, John Hubbard
	<jhubbard@nvidia.com>, James Houghton <jthoughton@google.com>, Ryan Roberts
	<ryan.roberts@arm.com>
Subject: [PATCH] mm: riscv: fix an unsafe pte read in huge_pte_alloc()
Date: Mon, 3 Jul 2023 12:00:44 -0700
Message-ID: <20230703190044.311730-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|CH2PR12MB4056:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4e77db-9892-4e80-754c-08db7bf7d583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZ/X1yu/X+S35lK9SWQbBh7EdONin+46gQ2X3K0kv3oyW8HBMG2cR1PT/qf5Gqpb+bTJ+Ti7y5QMYZHT5ew07m9XvGQ0w6KoJlqRz/9/lR2hN84u1fFeGMjfVtAUn82k3/k+T5dewCyEWbqEXMMKipESNqOhLahPIHbu7MoYIrRni8LJuMWup58MQQlVLeGL9fOWRFm6LsSuYH8VERoDLDi3lsWRgR8mxy6gGUrwKnQCItlsjPu+WX+gnY3t5VOa44q06Aw6Npsf0ihoRpN0XvK5wJm93/KqptgGRthRBIIDjqxk2hwacrj04yio3FZ9atiw9SftgQBLeyDtxYlTk/AE3LfDNwUvKbjx0Ns/CM1r9npngen7fqZdHmft82JjnK0PBNJzYbXZ6cbDCcIKUVFZUWw2sLgwWJXcVi+R/jIRlbBtXfUZOL/2agZxWK7CwdcHbrFjtkaXSh1VzKHFNRqC3VKt8hRf2DSZzlKsVcrCmAAfPKaFVtgl3TePEe4Yh9i39WogSOrRvmiffk0Q9cujFiy2CIRshci81htOlv7F/RHYNtTa8QmgamepUg1mVql+JLK4eBQuDW8D+Y37T9RT8qqepyOo+8hS5/eeJYGy1B4PTgZQLjFtDLuFWFXM/mz5BXg+Bmm7JGe20NXNJbyArpnS2ZsHYyB5lWQULII6Byahzu7I+jBLWym57IiHSDn6rL39uB72Lc3frBNft+aqc/ZiddYM261XpbSBXGbOGGRPuNG1vk3p+O3/V33hU/0sCmOYT692ASVi5PrQcPNK6ARyiNWuq8sXnnWHrJw=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(336012)(54906003)(316002)(8936002)(47076005)(41300700001)(426003)(82310400005)(8676002)(40460700003)(40480700001)(36860700001)(356005)(83380400001)(82740400003)(70586007)(6916009)(70206006)(7636003)(4326008)(36756003)(26005)(966005)(186003)(86362001)(478600001)(5660300002)(7416002)(1076003)(2906002)(7696005)(2616005)(14583001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 19:00:57.1420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4e77db-9892-4e80-754c-08db7bf7d583
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_120105_626372_9DA628FC 
X-CRM114-Status: GOOD (  14.27  )
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

The WARN_ON_ONCE() statement in riscv's huge_pte_alloc() is susceptible
to false positives, because the pte is read twice at the C language
level, locklessly, within the same conditional statement. Depending on
compiler behavior, this can lead to generated machine code that actually
reads the pte just once, or twice. Reading twice will expose the code to
changing pte values and cause incorrect behavior.

In [1], similar code actually caused a kernel crash on 64-bit x86, when
using clang to build the kernel, but only after the conversion from *pte
reads, to ptep_get(pte). The latter uses READ_ONCE(), which forced a
double read of *pte.

Rather than waiting for the upcoming ptep_get() conversion, just convert
this part of the code now, but in a way that avoids the above problem:
take a single snapshot of the pte before using it in the WARN
conditional.

As expected, this preparatory step does not actually change the
generated code ("make mm/hugetlbpage.s"), on riscv64, when using a gcc
12.2 cross compiler.

[1] https://lore.kernel.org/20230630013203.1955064-1-jhubbard@nvidia.com

Suggested-by: James Houghton <jthoughton@google.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 arch/riscv/mm/hugetlbpage.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 542883b3b49b..96225a8533ad 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -73,7 +73,11 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 	}
 
 out:
-	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
+	if (pte) {
+		pte_t pteval = ptep_get_lockless(pte);
+
+		WARN_ON_ONCE(pte_present(pteval) && !pte_huge(pteval));
+	}
 	return pte;
 }
 

base-commit: 0a8d6c9c7128a93689fba384cdd7f72b0ce19abd
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
