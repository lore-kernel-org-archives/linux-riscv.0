Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE284C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWVRk7veF4I8F7QYQ+dpXnjlM9Gq3kAuJ8KFw3q3hL8=; b=X9Lyc4PmW959Vx
	OoZ0WofSB9RNLX21Z0jLau4A3PxgB+0hrdPAjkt/LaL8EatLhqgNBroepp8BhfPdneWCdDZlDrpm7
	NucPdZMonxwB2GTqsV80RwBHyEg4URmqzOhqoCsfD85g+7faKxScLN98xtioRv5MSqZKtIsE05FpK
	rlL85m+2cJQ88ArxqL9cuiXOp2M2yvG9IPuW7Vskcm1eP1We+c/M+mYdS5Z6ZVOgKHG+NjhQLxEwx
	I7XJQIEtw5p3+7xetiyBYbWQvjij7Mvr5lNxMjm/mQvULEZ2HMvdIJGeS4CvRGdhua0bfGeWPfXMf
	EA08KsvDvb0Vgg4xp5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5oL-007kWV-0i;
	Thu, 10 Aug 2023 13:34:45 +0000
Received: from mail-he1eur04on0621.outbound.protection.outlook.com ([2a01:111:f400:fe0d::621] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5oH-007kTz-35;
	Thu, 10 Aug 2023 13:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+P9sNH71xdSnZ55Qo8IbTCdoxxs3507AZMmWWiXwUw=;
 b=F4+wkQUcBHKCO/A4R1XJta6zjFmSKXiFu9mKNvAJXJD+5dYMfB52TEBZ6ra5Ez+33wCxefCVHGH+N5kqq43Ng9LYKyP+/70CiPEjGLqjCj4xveTZ2nX2lLT6IRVkeIRlEsHWE+SWY18qp7tr56vtklxG8WFt2XAlTTjCQmELJ3I=
Received: from AM6P195CA0044.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::21)
 by PAWPR08MB10060.eurprd08.prod.outlook.com (2603:10a6:102:35a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:34:32 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::8d) by AM6P195CA0044.outlook.office365.com
 (2603:10a6:209:87::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Thu, 10 Aug 2023 13:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 13:34:32 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Thu, 10 Aug 2023 13:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6232d1537c072f4d
X-CR-MTA-TID: 64aa7808
Received: from 4f57aa4cdd8d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F6073716-51A2-4679-AE41-BE0783E28F7A.1;
	Thu, 10 Aug 2023 13:34:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f57aa4cdd8d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Aug 2023 13:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CatSmqqjzAZCflAR1k5JOY+OJ96XDQulOzQC1575kYhYLTj4QTFtfQas4aOilIt+pqQbF/b/rc3l5jMFeOsfh0Mrkulmx8zBKX+AZGSuVu/oCb0pgCh95J0SW3kULmNoqE0BcZ2SH2MTH9hy3VLukE09xHAUZduu59tlOqSqkoqcwH7A1P+97mNDSBw90t3ASrYGLaQYha8mb4qeVxTlvYZ3XJFXviYprmyXhSypKhC6HL9yAjIKPi8uWcqAkGh/Mgoska5RFt9AGiKoH6CsbukU9FkmrTylA+bFH+DYp/FQxjWV0+8qNTGWBy1EGwGQTe1u1GqLgCx7PzI2t6CiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+P9sNH71xdSnZ55Qo8IbTCdoxxs3507AZMmWWiXwUw=;
 b=MEFpRYa0KQ/mEvv2vLSq+IH4Sn2FzsHR/Ks7ajfKrUGQVjj5kiXInFwhZ7cUoBbpvFC/6J56et8gQ0r1UP71DnfnFPJH5fqfOoxTVsIaSB1dMQfZneXgrBZ+h2x/Va+YQZXhuNZ6JXVEODF9QI7mGZ2eH+JfIJW1vnGoMZjpFlU/5a9f4oUY6z4/6bQfTo6ZvG+msVVI9AjXgm6mbBvWRqLdaysevDjAdbb6dhMXtxQksO0R2GYV1DqK/Q2XDbmSI0G7+1aJjZsye+3eF4V416Ax6SPTtPstIMwU/1GQNWn69kOqlo5oxECrffJ2+i7YmzBTWmOdRcwcaCDfIba1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+P9sNH71xdSnZ55Qo8IbTCdoxxs3507AZMmWWiXwUw=;
 b=F4+wkQUcBHKCO/A4R1XJta6zjFmSKXiFu9mKNvAJXJD+5dYMfB52TEBZ6ra5Ez+33wCxefCVHGH+N5kqq43Ng9LYKyP+/70CiPEjGLqjCj4xveTZ2nX2lLT6IRVkeIRlEsHWE+SWY18qp7tr56vtklxG8WFt2XAlTTjCQmELJ3I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB7172.eurprd08.prod.outlook.com (2603:10a6:102:20a::19)
 by DU0PR08MB9251.eurprd08.prod.outlook.com (2603:10a6:10:41a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:34:18 +0000
Received: from PAXPR08MB7172.eurprd08.prod.outlook.com
 ([fe80::5a76:5272:2887:31cb]) by PAXPR08MB7172.eurprd08.prod.outlook.com
 ([fe80::5a76:5272:2887:31cb%3]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 13:34:18 +0000
Date: Thu, 10 Aug 2023 14:34:04 +0100
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZNTnTGb341TSMuvA@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZNSmFmYFHDw3NvvP@arm.com>
 <4e215e53-c7d1-4338-8df9-3f9bf783ced9@sirena.org.uk>
Content-Disposition: inline
In-Reply-To: <4e215e53-c7d1-4338-8df9-3f9bf783ced9@sirena.org.uk>
X-ClientProxiedBy: LO4P123CA0359.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::22) To PAXPR08MB7172.eurprd08.prod.outlook.com
 (2603:10a6:102:20a::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR08MB7172:EE_|DU0PR08MB9251:EE_|AM7EUR03FT004:EE_|PAWPR08MB10060:EE_
X-MS-Office365-Filtering-Correlation-Id: b1043b03-3f7f-4668-7b91-08db99a687a5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1u+TtOmUJAeU4mMlYJ++WwKp0ZjgMJfsb2Oh+2S4sGn9ZcSvZU638r2FbTdRMQwmBe5G/jZi1Fx/3iIpOqgmOgYHR+96qrID5w2MoPvWPKFhgxfC0jdItUrjnDomx+Yr35LLYvbtxthEcGZS7oPOdJKlxhG9QXld4XWHyusWOgA/IacC84b53xiiwCVUJGWPg7zp4iQkBUIM9ZdT74G4i0OOn//oqUPJEhC6H5Ail1RGCpa1FoEZjC8rBWOmB6gpg7GmgWNjqeqnHke9IJCBmOFd7nTYDhROopD/6GKTudqEbTcYmfWwsthg3EIPSBU3uECP80JzZVST8mt00FMpySLk27f01ojn5sdIDQkczIWizzTSDvnAV3nn85SRc1jX2V+uQc2vo02vQILlPaG0WWVkpjntYBf1WpmYuNv+IMCn3ooNR39QJFg7io0zbckytpnOJs+dCrkOcslFJT6Fg6py/qncFbsk58jEp8BCrypuoctfil+TLlgbfr0c8140QdP1o3XoIynwPGxoCfLie4j9CpFePYXpbupkulDSf8h+RmkWpEC+VAUNCiRL4qTD
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7172.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199021)(1800799006)(186006)(8676002)(8936002)(6506007)(26005)(41300700001)(36756003)(83380400001)(2906002)(2616005)(38100700002)(86362001)(7416002)(66556008)(6916009)(66476007)(66946007)(6512007)(4326008)(54906003)(6486002)(478600001)(5660300002)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9251
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f616eb5a-34c7-49ec-379e-08db99a67f62
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5IHU2t9AZfLNn7VQ8nUXy6nvoVkDdQb1oN9nb6A31JL/MObMpFXrEJ3EgAHK5/Aq2ccoxse8bxivUefEOTbT9YBMJCgsvRs3rvX1gt8DooPO98kCnrkXRR6wwNZ21fG/D8ceBulhabpJ2AUuvRL40Q6oTfa+J+sXoeoy9bCEw53KIvOPnnqizPpdTaWw9diOrusKb4UaOTTalmMt9csBNfoeF8TupsZy+76SKxFOyuYNwZyVgkO6wkD/s3hD02inCwsmOeC1FTQwNO9u6Xmd5zZ/JrWvfOlD3eLCQ4DyhL9RUPqfm16fPBUKJZkpzOV95ym1kgf01f5NJ6NsL/cKBAvCKsBCy53sf5UDk6H/baNW2WTNakYjbeifXbz8aWpyJiEqkKJze/CzzakzGZM/96lNhx1kMifyWBxlXA/6kPWgLgW0Wat1YfDBlhz+3RFx6w14eFvH53r/OzrZ8TxIUJIAu0yJscdMRbNBSADMbKRMUtBL8onY6uEgMnC94hz8uND/YQ8G3LKZ1Y3bc6UlZaxjXr9fZ8kM2fiyfeLxbD6DG8cdhXKc0q6W/POzfnRmngF22ODUS8FjO5mXAcmfcsmaozb6nlcXbbLZeuPNU3zQ0/YLeje0vC+MXecVyq6awQ7aVwZMzWMK6Zrc0tbF5UpDwWgffQMgfHOrEKbud3Yv5bbmCQqC3TQuU6volPSm2DT9BYCr5LVL49YD5UrW/2UV+i8Zbl3DmVKu0L3v4s=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(186006)(1800799006)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(336012)(86362001)(82740400003)(2906002)(41300700001)(2616005)(6512007)(6486002)(6666004)(478600001)(26005)(6506007)(54906003)(47076005)(40460700003)(70586007)(70206006)(450100002)(81166007)(40480700001)(8936002)(8676002)(6862004)(83380400001)(36860700001)(4326008)(356005)(316002)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 13:34:32.1666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1043b03-3f7f-4668-7b91-08db99a687a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_063442_000942_F7721742 
X-CRM114-Status: GOOD (  18.22  )
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

The 08/10/2023 12:41, Mark Brown wrote:
> On Thu, Aug 10, 2023 at 09:55:50AM +0100, Szabolcs Nagy wrote:
> > The 08/09/2023 16:34, Mark Brown wrote:
> 
> > > It's actually based on bitrot that I'd initially chosen a smaller value
> > > since it's likely that functions will push at least something as you
> > > suggest, the patches now just use RLIMIT_STACK.  I'll fix.
> 
> > the pcs requires 16byte aligned stack frames, with 8byte per gcs entry
> > there is no need for same gcs size as stack size in userspace.
> 
> I agree that it's going to be excessive for pretty much all
> applications, I adjusted it to match x86 as part of the general effort
> to avoid divergence and because I was a bit concerned about non-PCS
> cases (eg, JITed code) potentially running into trouble, especially with

is that even possible?

16byte alignment is not a convention but architectural:
access via unaligned sp traps (at least in userspace).

it is possible to use bl such that the stack is not involved
e.g. if there is no bl/ret pairing, but if we base the gcs
size on the stack size then i'd expect one stack frame per
bl/ret pair with 16byte alignment, or is there a programming
model possible that uses 8byte stack per bl?

> smaller stack limits.  It's not an issue I have super strong opinions on
> though, as you can see I had implemented it both ways at various times.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
