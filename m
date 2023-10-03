Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1C3E75436
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFPXz3agDP+1dopwH/tf2KG9pT1RVtz0h7EdYL+kbLc=; b=NDTLU9OMPrFCFn
	wVY0EdKAEoGe1+cvMsstBa4G1jNrKVLx6OCeCz7Jw64Y2P5ZC1c+TffENikD+Dd8z39NtnoeAhGu1
	PfKGCAuL6i0Sk0/tCpjYixTfEM1qRPj4NQ/4PJ9qUPneoLPaWI4uZ3bDFCBq4NCcW2X0bohCum49O
	2xQDE3WbcV2WgS1Amj/Lwbif/FkkN11ljm+/rUVUQNwlW2lDwkYpbRsH7l5p1gl3KJ3FAstMnRfPg
	6vi0JD8r9tvbHFkbakgg4QELzXydI3KQwLnZFXvPhp2pfYpJ9NPK1Isfo64fE5s6pXvv1w5DVNM/X
	awm1MrVIk/eEEFuHfh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnb3G-00EAvo-0e;
	Tue, 03 Oct 2023 08:46:46 +0000
Received: from mail-am6eur05on2062e.outbound.protection.outlook.com ([2a01:111:f400:7e1b::62e] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnb39-00EAue-38;
	Tue, 03 Oct 2023 08:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3FR+XsUkAb07K1BsVq2myWzXOMLFKW2bf9kUJfgJso=;
 b=lZ2lksXhDK5uw9p/vLR7uXp8ivWY4qjD425YWW/ouRf7tL+7GbDeFZYHCRASIk6n8iAJV47wmY/YIbnjM5T+o4QAfGv+wTJuGpDE1Leq7EGSgu1cTeZlzthuXvCU0bXb7BPjXMHWyc0lD+WTDCw4+ZxAZwgcqL182RIJyjW6mqw=
Received: from AS8PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:20b:331::14)
 by AM0PR08MB5444.eurprd08.prod.outlook.com (2603:10a6:208:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 08:46:27 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::59) by AS8PR04CA0159.outlook.office365.com
 (2603:10a6:20b:331::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 08:46:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.21 via Frontend Transport; Tue, 3 Oct 2023 08:46:27 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211"); Tue, 03 Oct 2023 08:46:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74118f93a405798c
X-CR-MTA-TID: 64aa7808
Received: from 52bafdcfe683.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A54C3ABA-CB31-4A35-8381-D2F938FA5FC2.1;
	Tue, 03 Oct 2023 08:46:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 52bafdcfe683.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Oct 2023 08:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt0RuRQA74jRHar8hfIU8lWwKaxJJdgG7jU4y66nEz9F2dES0A07DTYyVA9YARASp27b+3J7SQ1r7vaULpD+ify3FzLSaLTimmqBcCGjBoVTkvW3dzlpW+3L5QJjaCdeW3Z9KxaFENt1wCtoJ+4KCh5MO2Ke3ZgnWTTlbaLgjUlWjXrWq/BFbWVWfVNkO3f3TZT4cas3VGeyk19TlN3ehO8SqmbQsU4g41ELgk49sv+wE2ZiKM/D2z1TF38cZBJdIejMfa+Kjn61R3AmzCQ60zfD+ljtiX5dVlZMVHTJr6EdjpejMDy+EXIbtorNAqanBBLkvjdY/eqWwIxhGO6jcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3FR+XsUkAb07K1BsVq2myWzXOMLFKW2bf9kUJfgJso=;
 b=ciZ5mG++PRC7FIN/Iy2iHL3l5ro6QNpIJ2VtESA1Zcu3pdn8eWFdfiOBxcRsLU0pGZ59n40gCs4DdH4pXsWo20ABIhYvinj3dRzFny04QGZLKGc+8CruI35Bfa8wLtwqY76JZst+8hN7+VgezkHh6T4HTQwdoyeQUuMrx8YlY9amvDpunvLmhfyJtUUeCaLfIkgKzyscIALCZAJ294KrPlylurdD8p00lew0+OSWaOd137HX/6ysG0JeVfbXc1I9wc/azx6QWiTgs+gNGLirxVT7qwfDT84jDIYBj8KnbyNwKKUriwx2ys+R1C4Rz4h89rRxk30efmO214sswyS/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3FR+XsUkAb07K1BsVq2myWzXOMLFKW2bf9kUJfgJso=;
 b=lZ2lksXhDK5uw9p/vLR7uXp8ivWY4qjD425YWW/ouRf7tL+7GbDeFZYHCRASIk6n8iAJV47wmY/YIbnjM5T+o4QAfGv+wTJuGpDE1Leq7EGSgu1cTeZlzthuXvCU0bXb7BPjXMHWyc0lD+WTDCw4+ZxAZwgcqL182RIJyjW6mqw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by AS8PR08MB9219.eurprd08.prod.outlook.com (2603:10a6:20b:5a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 08:46:13 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::e34a:7a41:96db:8aba]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::e34a:7a41:96db:8aba%4]) with mapi id 15.20.6838.029; Tue, 3 Oct 2023
 08:46:11 +0000
Date: Tue, 3 Oct 2023 09:45:56 +0100
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
Message-ID: <ZRvUxLgMse8QYlGS@arm.com>
References: <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <ZOYFazB1gYjzDRdA@arm.com>
 <ZRWw7aa3C0LlMPTH@arm.com>
 <38edb5c3-367e-4ab7-8cb7-aa1a5c0e330c@sirena.org.uk>
Content-Disposition: inline
In-Reply-To: <38edb5c3-367e-4ab7-8cb7-aa1a5c0e330c@sirena.org.uk>
X-ClientProxiedBy: LO2P265CA0320.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::20) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7179:EE_|AS8PR08MB9219:EE_|AM7EUR03FT063:EE_|AM0PR08MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: dd608600-2ec9-446f-4373-08dbc3ed3b6c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lwz41uy8E/+WYL8kGSYOQ7mGoDrnRSVYD4GEiKcfSwpcMkhTiU2OvEIShlAK/0Rn8kKzfIwUPAMvNSZ3kwd5qUo4tFhzEXYDYp2R4X1ciXWgSi82QZEGxcG5VGpZyPeNViZom/Lyqk4g1qiMh5R5x0NK3kEaH5lWdu7NYCjtTGsBzL5i8zvNZQC0EwL9143mKDhTFjEHV/SeOrQlWrrCbL+t6+0qCPhvDkTNnznixNI7Ex82DjnirYqZ83iSw3/cYW5bo5WINLQ/2ZEJKwJYBbeLfoSZw3bvh5WLX6bS2HWWHYseErTct5OpUHcHcBuVQko2g4TYWJppYzuTIltaBsSTraiq0rhIkxUsSd2oiQoIdHYjzKFQGy//A4/2NItSpmFcfY1lJ7I5/Aj+CaVy6+O4wZiNjA/j4L+nvowg0YrGcl3Xd2aUjbOfjJa4A5zemg+SskQy0or+qhnwb4VzxWEYEap+ugQ8b5W0yxYbfiep935qeI9+mBYyW/LDz7yl7GGfOB0PWumcBx4391y7Qq3b54j2pygwE3hpU+ISirp9Pw+bH1HXCs1pQDmzv/Z5
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(8936002)(8676002)(4326008)(26005)(2906002)(478600001)(316002)(66556008)(66946007)(54906003)(7416002)(6916009)(66476007)(6486002)(41300700001)(6506007)(6666004)(6512007)(36756003)(2616005)(83380400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9219
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ced56863-5bee-4f49-b9e1-08dbc3ed31e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkDUX2qiF1UZaLrS4tqnzN0zvkcRTTph7N6nhWrvDbL6BvkZcmXlO4Bguqb61KuO1NW3DG1/sOmu28CmfAuj6uN07dfUoCcHrjsg33pgk0TPBFGUSPN3sQYV0Lmk6GQUmtiLeLx1V5JBqllalqypZALc8o3AvtRyXjxqXjsTmrk5GqterDGL+dADuz1HPbMwBMyJtvgP0w7Cn2CTa74NqUtKxUqvFncuOqE/7TlSKeh1vcXaQRjR+ZHQnpCVK2DiIXL+AD7250V6JZRzLZoAeFqV6Pyyvjju6lLxFQgx/fCjLYVqh7aB7sucJb45zr2Sp3TV36QXWkpgjM1c+hUovwdk3Y8KwEObsJz9BVooxVOZVzbG/GX8vCLlLeMZlJY1f0zl3Ql1Vz7peJE6pij4Tp4q2ckMFW4G131awaH1PMHMC4CxeB8s+3sxOjwtcA4n1E/C9X40ZmCYqdOP35EjeIK6SSb1rkvo5PTTljzJnj/AoEuPzjxQL0QeItbtzMGxeoWwffg3mnmPwbEk2kygfzCG3fD1n+bVu0frDllavqfNyJmf0+VJmmMm9fn/xEJAWpUhgmII6IsXJaNQmigNQmhVJSMWWRRUR1R0UBeFteYnVQWKoY1KzE/ve8aMBwV8RiRB9kK+EDBQb5PwO06bdmhRSlbLRGvCoaIeXSU4hjh9bfwN2RMRADgOMulMQpsbG6L41Q4JgwW2GylgAl+w3YqpSb6IEkIq33NUD5Si47WqKSutXt90tno9uO9Qil8Q
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(40480700001)(70206006)(8676002)(70586007)(4326008)(8936002)(6862004)(54906003)(40460700003)(83380400001)(356005)(81166007)(316002)(36756003)(41300700001)(450100002)(2906002)(5660300002)(86362001)(82740400003)(6486002)(2616005)(26005)(336012)(36860700001)(6512007)(478600001)(47076005)(6506007)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 08:46:27.3579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd608600-2ec9-446f-4373-08dbc3ed3b6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5444
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_014640_088975_F60C4D38 
X-CRM114-Status: GOOD (  30.29  )
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

The 10/02/2023 20:49, Mark Brown wrote:
> On Thu, Sep 28, 2023 at 05:59:25PM +0100, Szabolcs Nagy wrote:
> > The 08/23/2023 14:11, Catalin Marinas wrote:
> 
> > > > and there is user code doing raw clone threads (such threads are
> > > > technically not allowed to call into libc) it's not immediately
> > > > clear to me if having gcs in those threads is better or worse.
> 
> > i think raw clone / clone3 users may be relevant so we need a
> > solution such that they don't fail when gcs args are missing.
> 
> Are we sure about that?  Old binaries shouldn't be affected since they
> won't turn GCS so we're just talking about new binaries here - are there
> really so many of them that we won't be able to get them all converted
> over to clone3() and GCS in the timescales we're talking about for GCS
> deployment?  I obviously don't particularly mind having the default size
> logic but if we allow clone() then that's keeping the existing behaviour
> and layering allocation via clone3() on top of it which Catalin didn't
> want.  Catalin?

clone3 seems to have features that are only available in clone3 and
not exposed (reasonably) in libc apis so ppl will use clone3 directly
and those will be hard to fix for gcs (you have to convince upstream
to add future arm64 arch specific changes that they cannot test).
where this analysis might be wrong is that raw clone3 is more likely
used as fork/vfork without a new stack and thus no gcs issue.

even if we have time to fix code, we don't want too many ifdef hacks
just for gcs so it matters how many projects are affected.

> > userspace allocated gcs works for me, but maybe the alternative
> > with size only is more consistent (thread gcs is kernel mapped
> > with fallback size logic if gcs size is missing):
> 
> If we have size only then the handling of GCS and normal stack in struct
> clone_args would be inconsistent.  Given that it seems better to have
> the field present, we can allow it to be NULL and do the allocation with
> the specified size but it should be there.

i see, then try the original plan.

> > the main thread gcs is still special: the size is provided
> > via prctl (if at all).
> 
> Either that or we have it do a map_shadow_stack() but that's an extra
> syscall during startup.

an extra syscall is not too bad for the gcs enabled case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
