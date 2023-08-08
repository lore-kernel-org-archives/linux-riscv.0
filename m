Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564EBC001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T10wWBAoYc924O7eVFVCMp2eAItFxkpz6Sfi7HOgXa4=; b=wLG061ME4ekgNS
	0Jyg3rZLdCVzvDDJIZ1bdt+/WMOlX8jH0xwIFPKD0Rm9Bwm2ksnRy56mk9/LLyBF218fKvfBi1rLF
	qflbrSlVdQ9xSttfwnU6ghK52WX6Th9V4E2mhNH8eHjhWdUIdYIiBdZ+lcKoZhXh/W/ZlGl2vE7or
	zuWWzikGjmoxyiMh76N12xHKF5jij+txFAcdnjvLhntN9fZRs2ZWlWODmg2lRXXGQMZ8j/H0MU9gE
	vWqNddC3ak60Z5AlV7v+ez3i+/wFM0Uwgdd6i+XvC6Tufj8/sVvvk/IBOt86nXDe4JdvNOQcF0pFA
	/dXGrAuXYDMntSCfGt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJwj-002EW7-39;
	Tue, 08 Aug 2023 10:28:13 +0000
Received: from mail-am7eur03on20625.outbound.protection.outlook.com ([2a01:111:f400:7eaf::625] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJwg-002EUt-2Q;
	Tue, 08 Aug 2023 10:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE5kPNIMlO4tcZ4nCWzcUYTT04UQF69YFkcWGymoffY=;
 b=cw6GYSFjV2cbwC9Apj0Lx0DyfNq9stmyh259w3IoSM3ItTNiw/QxIFXbE/X+RtemITZeaKjiiiVJgn/h2nF9/5xzunGqX8mOTDNjFckztylCXXQz4323AiOQ9H74kvgKnyU3iCGqYebQGYwWAHYUEf6+kDkkeOhn7+WdAPftMaM=
Received: from DU2PR04CA0310.eurprd04.prod.outlook.com (2603:10a6:10:2b5::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:27:45 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::9d) by DU2PR04CA0310.outlook.office365.com
 (2603:10a6:10:2b5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Tue, 8 Aug 2023 10:27:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.16 via Frontend Transport; Tue, 8 Aug 2023 10:27:45 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145"); Tue, 08 Aug 2023 10:27:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f1ba2880768a8a7
X-CR-MTA-TID: 64aa7808
Received: from ac7166f9e101.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8898ABC7-85A1-4579-8BB4-BB77337FCF53.1;
	Tue, 08 Aug 2023 10:27:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac7166f9e101.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Aug 2023 10:27:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsemYnMKlTdajE97yZpVtiHGovEaRuF6z/BOMUHkeg1nIEBf45gp7He5utI5N8cJ4EFPRt5dALNO1R5JpO1XBXMOgaom4YfcaKCOcv50H+sLMTmuUfGeQ7Ntif4rj/1TePlNs+J0LNS7hbfjxAZExE+mj1raXvakjCJa9M1hX4IHBIpwBo4KEeEn9xrxOtMozf9MvTwJtZmtSfYXk6B5Rm9eKrMslwObE5hy2YVgf6nS161pgwLASCoEoDprfZhebIa8f8H6lMZX/TkUvpKSiwJZHlvEm+1SdiV+S84brIuItTBpvA5G65qgKyV6UcoS5LHJ6jkvgXhjtXLVHEe7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE5kPNIMlO4tcZ4nCWzcUYTT04UQF69YFkcWGymoffY=;
 b=HM8HI7gP+xw5gj2zv7iNNiuSn4crolZjxTLpjlTGq73gb4lqCd88Pg4XQ/qnLGAibwlYiR2FlO1TY0SSsBjaFdtt+cCx6AzM9Y3Th1HA0KgtJvDVpUB6TeQTquTfueXSGbG6t7QV7oJtCVmlG2ydR1c7cRjO/kUGb9jbyFoiFI4XESpO0OT6Qab1Yq10SP3yCljoeRpF95Xkbf6rQVszwcRCrP0HTce1NdLOV9HpSL95GubO2nN5a6zrY2BQsiYArbVRRPlWTWuR3i7Wxa5A/jY6CN1eexhjBwtbiRwuzM681+WS5OJ7lhkO12jnpSifdH2ZobMvMRIXdCQLew6Bug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE5kPNIMlO4tcZ4nCWzcUYTT04UQF69YFkcWGymoffY=;
 b=cw6GYSFjV2cbwC9Apj0Lx0DyfNq9stmyh259w3IoSM3ItTNiw/QxIFXbE/X+RtemITZeaKjiiiVJgn/h2nF9/5xzunGqX8mOTDNjFckztylCXXQz4323AiOQ9H74kvgKnyU3iCGqYebQGYwWAHYUEf6+kDkkeOhn7+WdAPftMaM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by PAWPR08MB9688.eurprd08.prod.outlook.com (2603:10a6:102:2ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:27:31 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:27:31 +0000
Date: Tue, 8 Aug 2023 11:27:16 +0100
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/36] arm64/gcs: Provide support for GCS in userspace
Message-ID: <ZNIYhC8L97J4B3KA@arm.com>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230801141319.GC26253@willie-the-truck>
 <09b7a94d-cc88-4372-85de-52db26bc2daf@sirena.org.uk>
Content-Disposition: inline
In-Reply-To: <09b7a94d-cc88-4372-85de-52db26bc2daf@sirena.org.uk>
X-ClientProxiedBy: LO4P123CA0689.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::14) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7179:EE_|PAWPR08MB9688:EE_|DBAEUR03FT015:EE_|AM7PR08MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: cebbc477-c150-484c-182c-08db97fa1b2d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9cLDC1fUdsJEOGiuPVBjxW2Q1857Uegdfr0Jm2ggFbE+jiifRedqBudePRSxqsB4XQ6GHpP8h3OuK40TyQKga5Rud2k0nGu/WLA56N9jDUM9kisrWMxh1PG9bvysG7Ux313pexYzM3yq8Ofx7yi+Yr6TGnWqqWfDt/R9Qj0laqC93TW18GEQ6GnMHEg7Gl8KLHDn8wPLz+K+uZ3xYaLoO8bJ48r2UTVMiDM3RQRhqpOOgbnkHkk4xNgbjdfHGDLtkSTeGFpkgMM6fUP6WpxFX9palb31LAlcJe009WsnAQoCJXs3fcXcckW6kL60ENSUbaaExSxXfTvd4nQGNgJEP8YXejtm2PHkbPvhbZXxEBPRyf58nhfw3m5XsAkYS+EXG/Na3YvpShP84kVHap8aac9MOiHV0TyxbDEZYGJhU1CkZMgCWneqdfMQHrK9PLYR9uPiBoJ94im9gZW+4IoKETNmxegyNkoxCxDiR++HojFOrYZIe9rG807GboXk2EijNCJAACtdV8Q5QJT49KfUqGHxJq+BHYHlfQTOt+3l11NmsJzGKJpaGZ+DcGMkQIlD
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(186006)(1800799003)(451199021)(2616005)(36756003)(6506007)(26005)(6486002)(6512007)(6666004)(478600001)(54906003)(38100700002)(110136005)(66946007)(66476007)(66556008)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(7416002)(2906002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9688
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 904beafb-c8f7-4eb8-9f6c-08db97fa124a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfUdIi/Bt+1lr5WMDqQ4Miz1Ws6RCBm43RsxrpLBFwu1NJtNR6nj1uBJybIEdyMJ/wmBj2arXH+RmgBupFzh8vWfpu8jWlR7v7bytjUEj61pB1oH+brK5HGwsHpXrIYY5HEDtgr+b3OxwJs9ubNCdk7PAgoKGFhabdz4hOTYHdhg8h6YKyJuw6HFz40XhKTME2trmpt0kWH905WhNK8trcuPNjhCp3m253ZZH0qBIdv//X82kAf4d/FdRfCh5MyRjsjYjBCTiK/AonAWSIraNkcdMW5nhhWvhHc4FrvWB6bJiGmdXkmrkpnOBOME/GwsOnBNLLfXGhVCc4Ub3LNIoa8ePhqjTRKFvZBoS/vdmEQKPKjB7ig5heiHNLofh0vgtCrP3Bw3R00FU8Z1pihTXL3eIRR4JXp6/UQrKKS3BLT/r4kmYMZhSkoLmYkQXoSyeaXxcoQAzkB7nCP2p19zm+JuTDuwnC1fGJ07pi4OKhhwxOaQsXHd2Ou+QijIVt/bfpcN1EgcYAnKcmxfWZBLQ5a2yB/wJy8aecONherW0Ct1ypuud0N5hJ6dnzrlkYSYlEv7B5h/whAJGQKRJHZu82IYf6+Xpwxt2ZS44xnroknSJjmJ2W4q2QaHsu/kfe7bw2aCK8/xG0SPBc9v3Qb8ErQAj0iMrarB0HvAmUEnl7LJ9N9mznJqFmihVM7Thv+YSQ9M8dBp5wAgbfE4v6kixEqSQQc8In4Q84SxSOCe9UiYG7eP7OQa0LEBrhDRndvI
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(186006)(1800799003)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(2616005)(36756003)(6506007)(26005)(6486002)(6512007)(6666004)(81166007)(478600001)(356005)(54906003)(82740400003)(110136005)(336012)(70586007)(70206006)(450100002)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(40460700003)(2906002)(36860700001)(83380400001)(47076005)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:27:45.5990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebbc477-c150-484c-182c-08db97fa1b2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_032810_813240_71577044 
X-CRM114-Status: GOOD (  24.31  )
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

The 08/01/2023 16:09, Mark Brown wrote:
> On Tue, Aug 01, 2023 at 03:13:20PM +0100, Will Deacon wrote:
> > On Mon, Jul 31, 2023 at 02:43:09PM +0100, Mark Brown wrote:
> 
> > > The arm64 Guarded Control Stack (GCS) feature provides support for
> > > hardware protected stacks of return addresses, intended to provide
> > > hardening against return oriented programming (ROP) attacks and to make
> > > it easier to gather call stacks for applications such as profiling.
> 
> > Why is this better than Clang's software shadow stack implementation? It
> > would be nice to see some justification behind adding all this, rather
> > than it being an architectural tick-box exercise.
> 
> Mainly that it's hardware enforced (as the quoted paragraph says).  This
> makes it harder to attack, and hopefully it's also a bit faster (how
> measurable that might be will be an open question, but even NOPs in
> function entry/exit tend to get noticed).

clang shadowstack seems to use x18. this is only valid on a
platform like android that can reserve x18, not deployable
widely on linux distros.

with gcs the same binary works with gcs enabled or disabled.
and it can support disabling gcs at runtime. this is
important for incremental deployment or with late detection
of incompatibility. clang shadowstack cannot do this. (and
there is no abi marking so it is easy to create broken
binaries.)

android uses fixed 16k shadowstack, controlling this size
from userspace is missing from the current gcs abi patches.
the default gcs size can be huge so this may be an actual
issue for gcs on android where RLIMIT_AS, RLIMIT_DATA etc
are often set i think. but the fixed size has its problems
too (e.g. there are libraries, boehm gc, that recursively
call a function until segfault to detect stack bounds).

i think the clang shadowstack design does not allow safely
switching between shadow stacks. bionic has no makecontext
so code that does userspace task scheduling presumably has
to do custom things which would need modifications and likely
introdce security weakness where x18 is set. (this also means
sigaltstack would have the same limitations as the current
gcs patches: shadow stack overflow cannot be handled if the
signal handler itself wants to use the same shadow stack. one
advantage of the weaker software solution is that it can be
disabled per function however a signal handler may indirectly
call many other functions so i'm not sure if this helps in
practice.)

as usual with these sanitizers we cannot recommend them to
users in general: they only work in a narrow context. to be
fair shstk and gcs are only a little bit better in this case.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
