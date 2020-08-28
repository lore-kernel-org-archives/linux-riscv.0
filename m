Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4297CC433E7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 16:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0607C208C9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 16:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="piIF1B3h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="eblrhkig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0607C208C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rcadcCN+R5sfHvKN6yX4QFuE72DCBbBOIL24mC9oZOE=; b=piIF1B3hs/ZLD7uvlu+vb+j+kL
	VweLodT3ljD94sY2F3SAkt0aj5Pqseui2nHax9WQGxPhlFlTAmVy3MUdqiz0NclJpeL2vzacoFt5Y
	8Z8G2d1/s6u55+XLZnXtJGmAM8PaZzOQlQI9U5AZHg8X7MC4JZCIAxaAf9sj1CQd+7MfDWCB/ZclT
	cjY4StHw7gBZ3JRoBdvT2111QNmrZYNLipiI7QRvIt3te7ZbEUc3LUEyyHGytgkmwLwz+ZdIHCOB4
	henLkxk8jd40Mo4ZoWFUbq+bh3Q0gJ8MfRFPhUBs1tCn1t2HT4lldhUAVcKno3OAgJ+aWH9WmnHsY
	OO8G8H4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBgom-0008V2-Md; Fri, 28 Aug 2020 16:01:32 +0000
Received: from mail-eopbgr760048.outbound.protection.outlook.com
 ([40.107.76.48] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBgoa-0008QK-Cl
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 16:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVqBWjC823IcSO78EYTQ87e5lbDIZd3cIV8QYJXi4yan0nXTfRUYOK/rL9O0zwY8RnNhydj/ApYqiw1xxRrlmJjSSWBE1MbN8bOdHXQFR2MdVrRb/EKAP7ERPMrW/ZfAmQZhrw4CGPBmR8h7zamvHP4rKQFOxgtYV3dr06l5gJGPUr+CeiCxwZo3jcJK/8dnO2wrjGKaupFDjubPv0Z0GNx2f+Y3bkf5HDWX0L7B0ZMgEFpeicAlftUMk5BWgmJwdlzRgC/B3V2pwK/4hKMEBkWTAsiJpqOySpdoMzj9ERuKO/naHMVEiDxQu+9ehU4S7rBQEbn2AZ3jzgYNAwVDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENWppkERbh7WaRSqkIkXzXh1zSRU7ETAdfCt/ptph20=;
 b=ndjjbo7AaRJ8mVaZVK1KTAz1mw1W7uNTA90Vi5ZnY0lc+MHQ71bcyjXSBOA0l1wKTuonVFIvie/Td1L8Eh0bvpwwIA85htLzUtjElkEGbmcOe9TBGPtekUHNKipA6eReu/kTArvA+3sc2trjcpnhgYBbBv4uSDSKbSVhNJWeeRT3kZaZbOLbVsg5tiFurzwYh9xcK1mLg2zr94J1RzFi9P6/GITWaAcYOH5BwdkzsEEdRAqs6hcrB56bp8qAHTc+LuaPoDMiungZFPk5JqHAuZlWzWUXwNFA5hfPPueujEfSJiWFLQ2yy5ebRp3m6f3Sf106EKRkEednexLoixkh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENWppkERbh7WaRSqkIkXzXh1zSRU7ETAdfCt/ptph20=;
 b=eblrhkigIUs2OOU2NC6iN7KzxoTqrh3HbqXTAv8lLIw7AtTf8+3g5Sq7050Qs2XfAF6BmMkwJMMKmimkvnTS+EhkZ0JEvTdjAS/PJQzLBsUUoCXRmZU/iI0oocd+jQ9ohAt4OJ5oU++RUUiNu1N44w/dELbxo4cdEM6D7yjZfuk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR1301MB2105.namprd13.prod.outlook.com (2603:10b6:4:33::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5; Fri, 28 Aug
 2020 16:01:13 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f570:90c6:f6d5:c078]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f570:90c6:f6d5:c078%7]) with mapi id 15.20.3326.019; Fri, 28 Aug 2020
 16:01:13 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] convert l2 cache dt bindings to YAML format
Date: Fri, 28 Aug 2020 21:30:52 +0530
Message-Id: <1598630453-31125-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35)
 To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 16:01:10 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db5c5527-351b-4a35-4a8f-08d84b6b9663
X-MS-TrafficTypeDiagnostic: DM5PR1301MB2105:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1301MB21053B755163821E7C948AC897520@DM5PR1301MB2105.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrgSi+1sZkgILUo94dRusGEmTf2rBy1gKd8Vxs5Ai20YS8JKcxl8xFcCtGSn5VN051Kb+MT91ZIhRXKsTi8bcOFrvxCp+7uXPw3EUO6fBycSEZFOhR6ClPbFJZM/ooeKTcobrtvbtHm3X5c0jCqy4fFSEEeEKjcFMIPJeljr9bb065hcuq8+tE8TWiQvKY+vuGK1uH32dzEnvI9UCvsucP61DmY6eOWdbPZaIvnFqUsK4II3MurRIbX8NfAnLxSL4N6t10A5gBz9D5eEzmyz2ik+KQcai67kLcDh2MIyW7U3kSUa/FWttH6o6Nb6qUOn3yWB6ZoYmk4Q5AcB44IJUnXEALbVlwwDK3OLCWKj0tUTy6P/vnMZXcaW/33jxap2gcalO1VnjfhjC+8ReW/tzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(39850400004)(136003)(107886003)(186003)(478600001)(36756003)(966005)(42882007)(52116002)(5660300002)(83380400001)(2906002)(83170400001)(4326008)(6916009)(44832011)(2616005)(66946007)(6666004)(956004)(6486002)(8936002)(4744005)(26005)(8676002)(66556008)(66476007)(316002)(16576012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ieIn45z++cHh5sT1lDexQa61n074pEsK7CnRktkRM4/NlmygDODVdRJ4TumiGYTBKnNoV6tn47iqHPF0vcDGLRHHDpBDMGa2fZzDbLfhJm6Zl1z4iNcIWVGRNhgvMSTQgCQSq0tJEQE5MpwnZmtWnc+7M8shIXkDIDWn+dtDtTcptzcUTx2R6AI9Q0I8rPdZkfRcwBgzghOiqHb4U2DHwLTfLzcHKFxSZ7OtyjU9omspORGev0uWV3Cy3s2KtzOLAdHqaAjViiHRs7iVgelxcfPpnOihHI3isXhHnlM22Hi3aAxUS6704Z4kw7QTOsBfRi9Jg++91nFjStstZZNXNj9hkIDpqtZOaH4mtG9E3wQdwh5EGnIrHg4dGMl4CqtTTRMIPdHv4zJSjl8Lf0vru3+WRDum/1rjboljwwR4cXgkWUUNqQ5fVR6D+3nSszuG0Byv5jUt3ZJxZPlfnVszY9niW0fO6Af0S8tpBJWCenvJ5WuJIPrAdOruuGb9jILgrVbuJRlsNzGOF0uTLn82au3aphJThq99Laehb0B9t7BQ/KMyfnwGbc+WEnhU9FutT3h/PsqLV9Yy8EIfRfXrM4u2Qy6E/gSKudjdq06oYjIY0OWIXL4E01H5Y7WYOIVl928wP3sw1R5+liB01fI4FQ==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5c5527-351b-4a35-4a8f-08d84b6b9663
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 16:01:13.4205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQS4gEZDGpeAOY+YUX20N+UHpTGi78kUuavPEy45x15NWFiKW8F+k/YIlu+h+ZrO64NyrPeSCdo2HAUavfMLGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1301MB2105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_120120_656910_DA2F443E 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, yash.shah@sifive.com,
 robh+dt@kernel.org, palmer@dabbelt.com, Sagar Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch is created and tested on top of mainline linux 
commit d012a7190fc1 ("Linux 5.9-rc2")

Reference log of "make dt_binding_check" is available here[1].

I was able to reproduce the error after excluding the DT_SCHEMA_FILES
option. Just in case required the failure log is here[2].

[1] https://paste.ubuntu.com/p/R5b52vCkKJ/
[2] https://paste.ubuntu.com/p/gwYY3hd9Rx/

Change History:
====================
V2:
-Fixed bot failure mentioned by Rob Herring
-Updated dt-schema and kernel as suggested

V1:
Base version

Sagar Kadam (1):
  dt-bindings: riscv: sifive-l2-cache: convert bindings to json-schema

 .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 92 ++++++++++++++++++++++
 2 files changed, 92 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
