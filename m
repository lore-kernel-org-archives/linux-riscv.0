Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E47CC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 13:40:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975B761243
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 13:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975B761243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CTsuno5FUPyd5dna/iKgZjw7dLm6T4wogb05RdlsVBg=; b=NCZGwX+twOhZnnIcEwS66/XKL
	NZiS9ZacFg8FGRaviPrWw4bdj08X+d9P96MuW7QrEWEACOYbHAcIQ5wld2cTn6SSXK4KSvHEW+CMa
	ic8l8SJ3wCSsqY9gEBX2ZdfgrY89+5xajJBfTBKi8//IPdedehCXmAXosWP84X6iKUOBU3SFDnKi9
	k/iECPNQs3crBDNl2+VDFQA4eYy8IueXZerSMGJ+XB3WNSLvUC4ED687jiT7ws/TDAGvenQLC84Ik
	/gmHkkMzkait5wtTekWmx4CQjtGgfMavl25WBwJOe5OfcU7xZmNI7+wh0Nh6PHI0synlffBcQdYTT
	8OPqFwRxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRxY2-009iLv-6s; Thu, 01 Apr 2021 13:39:46 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRxXx-009iIZ-4e; Thu, 01 Apr 2021 13:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617284380; x=1648820380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=K//GaWv7rt7hYHyfefRoVebDYTYVTL2ikJx5QoP0H9o=;
 b=eT5SS0z+/5x4ZyxykakZL+Q0dgbvvgunkpx4//YZ6I2q/gCsYCxgQv6V
 3bzzhrRoZ5fylwMf8h7oNvbfx06BOYiue5PK3kSbLxILvj4oEZRO8hTbK
 eK45bdYtV/nsSyaqlTI2EQS+EssvB2vT0fK9TejFR10xKG4cHrvRPXPPl
 Q34Nmp4X3yEky/5k6WkZYeCxWZSYU8DePd7r6Bo2/2gYeysg6vmVYoztk
 C75nRLvLxOJtK+ddvb4P7aarG/yrxA/GLlac/Ul8Q91AGPgBrOKp/32P7
 xvz5Pyy+BrMC64ubzGhdyuKPLUwscU4WfkXOMLocGZLCCMenqHbRHBHFg w==;
IronPort-SDR: p/gusi04Ax0txOcTvIGmUq6oZUpDS1xjGcfmgGv37yzKkHjZipH2n2W0tYD9YTaBOowRdAgKKI
 YQhUmXvHhWvVNcsjSoqKsgNRG1zbbsHEjBvpfTjb7VJeCoZh1XR9nKgJzIldrlpASoNFBMdzGb
 zLxUhl0SummZUAMPzZ0OuzkHfovxhJFlBz9l/xnKCmF4lx0Oc0IKqnGyqGNUJO72Jih7ssqHfJ
 fYcpWHE3bjgGrJKROnSd7fnHZB6W88blavzmvm9qFrK4CbE7DU8kWcrZdBE6391lxHmSoYqEj5
 w6E=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="163561294"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 21:39:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+qZFIpXGm7dn0KwUOcnLBYtI2S+MmA5c8orabtWXwWYteUg362OxYXJyXEljTo6gdYswltvsnCU7AaqYd+PUm44rRE+HWSQ9nzqxVl6GkGacsGnADvA2XS2QebSNKv6kJQmVXQlgyDCE3Ubjf52ZZNsK+r49Q+tgcPdzTqRIitIRqbeqHV6hRFeqF5eYl0DlBDJkTXWfziJNqtSRZNURfdM2o6oCtfTMMf32TkA1JS6/4YvhfQvxuUGNklIzIN4zLY8HE2MbYJ37DezE2Lib2yn6OSiVF+PR/SewI1dpD28futhPuEw/I0HNvfQy6/HSbUzt8XcpJnvrfuQmNlXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVSJJDx4EVGydi8wpNAR6fsCvzWqMgFEvHW9FHbn9zI=;
 b=Ybf5iAsXCLc3lkxnunULEoV2VhlYQsqlKnDYEP0mTehi+Z7xuCV9fMqdLbh7JNmROnHZIz9/1Eh3jgim0biz3fFD58fMlnoDa/8DrCqSPZIcnBRA1WDcM9b7yjTpJ9qVwFtII2enNl/VSiLDVE5TmjL43KZfcbryRAXRMUiW4xdIZH4XDSiB4Jr5U5Yr7Y/+D0NuhELIqE7ndMid3JO1Z27jETxMXQEtAsVmUaCaHOHGgJsXDn+SBbjURqUXUbJqNjCW2e7PEcU2Bx329aJHZZwn/GfHdwhzlQQKgTs9cFvq6dcdTqwf9aMVCqn77ve9ae+SUIXNpeVFHXC06Gx7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVSJJDx4EVGydi8wpNAR6fsCvzWqMgFEvHW9FHbn9zI=;
 b=twMFedXbQlxO/B2SeXEmvTMO2b5alQqyhmchtbXKzF6PkzjQBeFUlI5HP/JLm43TiJVNYM08yYoCbRR5g4LrF8iXYaCorhwzCWfzrkoWENxzdiL5gBys6Ab3kM0AwKPaAiVYRqSb0dipuxlq06OVxZoA3leVvL4nV7BcTmF5gpA=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR0401MB3624.namprd04.prod.outlook.com (2603:10b6:4:78::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Thu, 1 Apr
 2021 13:39:36 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 13:39:36 +0000
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
Subject: [PATCH v17 17/17] RISC-V: KVM: Add MAINTAINERS entry
Date: Thu,  1 Apr 2021 19:04:35 +0530
Message-Id: <20210401133435.383959-18-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401133435.383959-1-anup.patel@wdc.com>
References: <20210401133435.383959-1-anup.patel@wdc.com>
X-Originating-IP: [122.179.112.210]
X-ClientProxiedBy: MA1PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::20) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.112.210) by
 MA1PR01CA0104.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 13:39:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d06a3c-159f-4237-5998-08d8f5139741
X-MS-TrafficTypeDiagnostic: DM5PR0401MB3624:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR0401MB362468BCC57FDBA55A17F6778D7B9@DM5PR0401MB3624.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSSfPP65X1Vi7Hzt54ise3OHxCJWEVBUC8W3lBLrlemX1/qYYU4lR8Ap9ykKJkqrpOX8d9j8tbJYW83BA3YjZeT9mOSTOsSyuIrBL9AXETxUaN/awPYY/2mYkFjOWRRuw+RDBhOyZJIwiohjf+CGw1Pz6awejnTrC8DdCdQSNlr0G5C7G5s5vf+kOlM2UGZVUnexlM0O4Kqeua1BoTWqsKjAyIxOyhPD36U3bX2NubEW0WKwwVYEDom4ovaC4haoJtPhWW3FuCPdL+3HFsMRB7pvFNGML/+aCCNo411NNVtF9mOfzfz0fIwCIZdHQoGuvg2hAyV008dig/oakuIYq+rrHwwXwvfBqnMMZYTOR6S5QeB9YpBq4KbN8ycztNQdptv9NbFbzEYHMIMpWeIuQMKZSlEQxWW3WkdbOI8ZZe/lE1OuBhRGDUT3vNQVtCczZ6lPF9jRX+cV59J1LnZy/gQLau63uq0/PLpjWeaBlobP/Jij4e04XdNL2gnVHTzJbrXff7YK7g0BtPAXwdjF/jS9Acx4aCmYZRyyKpnEg1BEfkDtoCJROzu+LSlEjHSg+lCwWRss3yH3j9TSvXtTlccQ2I5KFfpkWqixsVM1uq99XVBwKwr+rNKjypSxJ725sJNUIbQVL/Ksjj0BXrZL0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(5660300002)(55016002)(956004)(2616005)(7696005)(8886007)(38100700001)(86362001)(26005)(44832011)(4326008)(7416002)(8676002)(66476007)(66946007)(478600001)(36756003)(1076003)(316002)(54906003)(110136005)(186003)(16526019)(8936002)(6666004)(52116002)(66556008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L0qIx2hjDv8BMfTApSB7mOoO2Y55xQqctNPTd1DeCsUsNJqEFwPvDZ/LWLtc?=
 =?us-ascii?Q?KpP255iP1k+eR80PonNeMuNQhq0LpzRePoxI1mICAZ/NGf0aZWrsULr5Mv7U?=
 =?us-ascii?Q?/meV10QVNj7tkhLb6XqAm0ROvj0vwwXzCcgrOBzCUSFaqLrReORI3g1TLwLz?=
 =?us-ascii?Q?2FSzPCPpQPw5y1jelgcygi2+B2ceRzEBxyr59SH2LrxZBIf9iJ5khmeoOocx?=
 =?us-ascii?Q?4mk9fR9y/xkO4YSOSggnAgz+frXE6EXe3tfKBOqbNqAO1/mDAVqTV7/Qjf+j?=
 =?us-ascii?Q?zFkJi/B7B0PAzkYd8MOHnpIhqs4w54z+u59+WpC/tbphCVByaIfFMiCeYfpu?=
 =?us-ascii?Q?GS/euhedPx5cMOEGuLLl6kWIoMRLSBqCV4wumu6O6qxqPlAFA/QhhgiVxAdF?=
 =?us-ascii?Q?+QwupGKMVIEhev9S7TirpMZAA4QcMV9cdgBkG0NYHXwk5L7udu7Bd3lwwni5?=
 =?us-ascii?Q?rk+PZckaELFKG/mrDmzUDsjN7EI6tXSgkleMVEeFpSBmg6vJDKLM5yX5wcfx?=
 =?us-ascii?Q?dnOOfsq7i4EB7egQrFOcQJvjSKbWrjPJpmy4FtjKfpJo3QDCG/eA3QL8N2su?=
 =?us-ascii?Q?2eo6DGIqDeXWnwnPrDu394g3A7N8eBdcTVh2G8lvWn8yAyGha87MxeYM30ON?=
 =?us-ascii?Q?ukIDOOJFbaHDMFk+5dbKa6Mbrv0SOirgdWVYQutl28zUl2H/MC1oPMDAmSlW?=
 =?us-ascii?Q?NUBKoanW1u2y9++JeaPHaVmvqeA4UW6ZFIBCAd+AIUw7A9a57m3PZFe2ppEN?=
 =?us-ascii?Q?zMuQzkDFZaormIYsoa8J4hI9h4TNrwNFXbXw0zTvFWLF31Fpx6M1avRt4rWD?=
 =?us-ascii?Q?VvxXIyxb0y8rgkos9S2ZwWGgCVMqSFxkTOPGmX6L6S21xJoT4d46uhUWszmm?=
 =?us-ascii?Q?tmQ9FTHJdp8IPQ97TXXI7JpnwDtxIcyVMKZUmZuzWuLWR/Gcy/A2KyUTZCQJ?=
 =?us-ascii?Q?QO1YSBMAXfbo19brVAsdI1vyr+xPrbpNnGxnreLglzCDH3tlIbsa+ey5mk2r?=
 =?us-ascii?Q?gDxOZ1dIdZU6Aw4QANV6QJ9lZdFWlOp4Fishlfrvht93C4S43ZKLzBzKB/8j?=
 =?us-ascii?Q?iCns9xXSei9ySvOLvYaI7JNloXRccPSyfcsM7RYntYw+uFdjsHncGiQg2CZB?=
 =?us-ascii?Q?LUuS0Ef+r0yqMBSqGjw2/ywzCrBEsZBgxjI5fLyJRH6Un5cGpl+fO/eZ6l3o?=
 =?us-ascii?Q?LfLBpMPLq2KA1q3N7ksrbg95seuuBgVob0LGI2GDogmPj1L6z2YE7aA9/PsG?=
 =?us-ascii?Q?NobUK3uXzYiFuheTA7+gl2t83rUwcauHLOAB+OFvglXgNnm0ewxknk2c4SFk?=
 =?us-ascii?Q?5XMg6jXJ+AXTnYzTlEKdsexF?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d06a3c-159f-4237-5998-08d8f5139741
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 13:39:36.7558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1f8UcOg6CR/fP3KUNHa4/+1fBqdMswug1EBMHkDpjOfxH/CjiKz9HEBX9q0hFGQe4Nq+vOUEWFEMHSgi75zjXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_143941_615696_B9EF276B 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
index fb2a3633b719..3d1aa899fc4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9796,6 +9796,17 @@ F:	arch/powerpc/include/uapi/asm/kvm*
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
