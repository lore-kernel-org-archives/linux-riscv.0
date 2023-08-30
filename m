Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C67C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pft8pjPlRFOoZgLULc5nGna/S22HQ7xW1O9iB/L2jrs=; b=zZKQk3e1tDgbrI
	oIutA6ZqP1g5jWiddTGkKbYQQECoG82QgnI5O9UxqIfYAvs0MEe2ZrEdb/PREBGeesClU+kdg96gH
	X6N7+epoX00i/hnMrlrVSj5vxEj8iOa1lRdxd+A5kZDpFrqTtwiDSXPWACncecL6YW7uU979IPikm
	Siph/z6NPxVtozlZtpw2rfGMCYJPUJTUeDIlq2oLs9pWWx35OrbieDnMDcgBhJazEafdXFH2VKMB7
	ka7JvwGX5Oxc9GGhbg/UeLUlizCJfaZa9xvbXfatv/uVJKp4LwsGMT8DDByGpEYA4Jr3JciOCHsaq
	ilYFtIzeFt01qrFYAqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbKSo-00DUPR-25;
	Wed, 30 Aug 2023 12:38:26 +0000
Received: from mail-he1eur04on061b.outbound.protection.outlook.com ([2a01:111:f400:fe0d::61b] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbKSk-00DUNs-2q;
	Wed, 30 Aug 2023 12:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV8mPRMaR1P1rFQgy90FKbO/pA1JI7UIbXfKBiXscyc=;
 b=0HECq+n//99ifwPs3hI25BCyHpAMZZ8HmFsRml8mk4x3kt/6OnDOi0++4f4yiddYjjNsBjMCJOjEsd4G99DKZetc2Bd2gbKzDK5+zZn2ix5flWm/lmTGQdA+R4aDSPQ/iIILQXAQ84ofVyyJel8VLLMUe53rn3fOi/T1LN4B7c8=
Received: from DB8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::28)
 by DB8PR08MB5420.eurprd08.prod.outlook.com (2603:10a6:10:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Wed, 30 Aug
 2023 12:38:03 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::60) by DB8P191CA0018.outlook.office365.com
 (2603:10a6:10:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Wed, 30 Aug 2023 12:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Wed, 30 Aug 2023 12:38:03 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Wed, 30 Aug 2023 12:38:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3df13224b1ec5d9
X-CR-MTA-TID: 64aa7808
Received: from 0e08af961bde.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A930DF65-6BEA-493C-90C7-95D9A52A42EA.1;
	Wed, 30 Aug 2023 12:37:53 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e08af961bde.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Aug 2023 12:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhSWutMyJ1kSENpbrpQZWrTUeJcqMGO4/nJxBzKoKGP0b6PqtRgz5sDosrqxeop9uSlq9j3tuOcMK6o0LqkrUvJHHYUHIRWSGGzDGdzy1Aac7no8MMAszMVgNaBmMnI9qdyQ+gHK2PmHUd+SaZCPaCIhbsIC7o7kVMPYD7RM9zjYE1zIIZmnkV5Xz8fFJhpQMlncfrpEBrYaqvDdbu9MRD9YeaQDSPQyFrrzExx7sH2fffliO5redpoLN9mHYDvHvgJerd88+4mLhtn66jOo2Bs/Bg/D4uJgfJGpREZHdJte5ZNgZ5biUDkxYpB9Q+sUwl1IN2iVZkaRCM+zKWKBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV8mPRMaR1P1rFQgy90FKbO/pA1JI7UIbXfKBiXscyc=;
 b=lQK7A0ALSYRQUMmHvrZQnrtBr+hFioYgWXxmg1snXS7uh4KqhyKprV8TFxLa4ZyS3qD79XkY/6K4oJGKEk6/OuOILUIF/eHJCtY0aD/sgmsDla5CVMCuKgLHq2+w3hEAyUE/XVCOy3sQSq7Iwz+0/H7x2T1aA92LC1SwwMQwcn9e9smMCCwJsIJaGiSPxyL/CqHyA02aDWgc52H4YrJnPsJ+8VS+tzEIHDj6c8SDe41xoZ1IqkIym6kTiO1QU0fcjXLlhTM/KQ12FUD9AgHlO8v/KnH3Swjom6ww2P9aJ0HaswUG/gakTJzvqZ/0YMiqg9vT3/ysEYDpUs72bVU5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV8mPRMaR1P1rFQgy90FKbO/pA1JI7UIbXfKBiXscyc=;
 b=0HECq+n//99ifwPs3hI25BCyHpAMZZ8HmFsRml8mk4x3kt/6OnDOi0++4f4yiddYjjNsBjMCJOjEsd4G99DKZetc2Bd2gbKzDK5+zZn2ix5flWm/lmTGQdA+R4aDSPQ/iIILQXAQ84ofVyyJel8VLLMUe53rn3fOi/T1LN4B7c8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by DB9PR08MB6393.eurprd08.prod.outlook.com (2603:10a6:10:25a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 12:37:50 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2%7]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 12:37:50 +0000
Date: Wed, 30 Aug 2023 13:37:33 +0100
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <ZO84DWEiYk6dU3iR@arm.com>
References: <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
 <ZOY3lz+Zyhd5ZyQ9@arm.com>
 <ZOZEmO6WGyVAcOqK@arm.com>
 <ef7272d2-d807-428f-9915-6fc9febadb5c@sirena.org.uk>
 <ZOd6lzj29VksAp7L@arm.com>
Content-Disposition: inline
In-Reply-To: <ZOd6lzj29VksAp7L@arm.com>
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7179:EE_|DB9PR08MB6393:EE_|DBAEUR03FT040:EE_|DB8PR08MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: f7dbda40-a013-4865-4f13-08dba955f42e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cNAz/hpoSFm1p+4pzfjNhQORnvLX83LoV7Dl6XnLmgKDXaFe7I534uViSj2bd9s10w48rqzxrYplFxgNc7FdiEc1GUnB64H+HOwxGLH/tJnOiwFpSi5H+PI1JomPuA7qc9w7QaCk715nxzM43D9AxcFICBrMqX4BTR9lRFwma2UtGIVW6Tzxaokhcv0S4WUwNexlDEzrNLCGL4FbAFv6KPXSvguOW2KaDaVUCYUxDgx/RBUlCNOVQFPynPi8L4ishHm9WtCFo+ts836y7LBNdIDkMB0ROfSdTZCGXbXtrHKPwiJC5Ak87QNHll69wBuooBIv4yhX1E77m2XcEzAPVg3+sJ4reRSPYyMjQGNbgqMhkqp51gNpsRYt9Fev3FVjZPesSL95AfLo/+iP76S4IjHWQCiQtXZTgvs0wk72TGWm0cC0fYgzA7u94Xc4KNDxSmFB95ECMHksq5CWgN0PhzMcgrk2n/tZSyFNDJSb0qmUqmqQ7kjPmLcAPQ8Sp06tJPsO0Eg8jIWYziWfJI+K0k056IZiOaNWd/vwlJ714qpIHYn2kniuJnsIOVmQ9TNb
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(6486002)(6666004)(6512007)(6506007)(83380400001)(478600001)(2906002)(26005)(110136005)(7416002)(41300700001)(66476007)(66946007)(66556008)(54906003)(316002)(8676002)(8936002)(5660300002)(4326008)(36756003)(2616005)(38100700002)(86362001)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8116f766-498c-49e6-ce34-08dba955eb68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LH3qPqHKMlNHTlcJvfq985h2iH0ECOV5683r54FISOoSXVwmCf/Sh6X90nICXNAqx2xw7VIjd2lotgbqGSkDGoRERprNVPIbqsZq+wbvYkBmvIWBpiRcd4vL5WuVOX3jxqqubC+Doku5tSRsuzqr5A0qX6AlXVwdIa9jD/Y6SUz4/LV6S2wFakCoFsRFWgXCjh1eaF6GyKeNF7n01evlokGMrUL/I0+v2+YNRB4M9THbUORLXKm0LfPm+fLbQmYotnR9N3h38jikJBUHkJik8f7Em1k2HnyQAgeG8tdMFwbRgZUOqx1Ff/hAXtmso5d2vWyyoszq3FRgc2/zf6Bf8kPTjtD1pT+wc+JDm1t5WacoExWX4v3c83sINKn25MVqRoaIK3Aufa/Rm3crX32HKZ6pd4NTn1igzeZEhcBCW4q/UTGgbMStmt3HmtUCdy2A7db/ZJefriVAD7QwpXYIZtTJHLw/zbO1IoecawDQwDo02VOSUCdrxou7q+dPpPSkA90qF2Lp3ZQp6tfSgQFshMfx1DXVG8CV2S4dBonDRjVahCX8c/hVrMHaPV0llX69owCURrvNpTD/4HRx9tjG4otGm9nxtSzHWwTeOXOan/0txZvUuWyN5N3X7uxq18r1csztZHFmowbjT7ek1qlgOaIwBQLS30Jfwq0siHUf4yK8WOVF7ld46hlH5MCtMpbQV1iqpOq1whgs41MMYLAI2F8nhc4OPh2cZY/w6WMzRGXgFLJfNh8raVfsEN9TfFWe
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(6666004)(47076005)(6512007)(2616005)(83380400001)(4326008)(8676002)(81166007)(356005)(8936002)(6486002)(5660300002)(82740400003)(6506007)(478600001)(450100002)(86362001)(36860700001)(36756003)(110136005)(70206006)(70586007)(336012)(54906003)(316002)(2906002)(66899024)(40460700003)(26005)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 12:38:03.5484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dbda40-a013-4865-4f13-08dba955f42e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_053822_947837_980B03EE 
X-CRM114-Status: GOOD (  14.76  )
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

The 08/24/2023 16:43, Catalin Marinas wrote:
> Is there a use-case for the unlocked configuration to allow disabling
> the GCS implicitly via a clone syscall?

how would you handle clone or clone3 without gcs specified?
(in the cases when clone creates a new thread with new stack)

(1) fail.
(2) allocate gcs.
(3) disable gcs.

the problem with (1) is that it requires changes to user code
(this only affects code outside the libc doing something special
since raw clone thread cannot call into the libc, all executing
code have to be tightly controlled. i don't know how common this
is, but i at least expect it in test code for system level tools
like debuggers, strace, valgrind, qemu-system, seccomp filters
etc. if it appears in actual use then that's a deployment issue
for distros: note that changing clone to clone3 is non-trivial:
it requires fallback logic and may have to deal with seccomp
filters).

problem with (2) is that the size policy and lifetime management
is in the kernel then. (since only special cases are affected i
guess that is ok, but i assumed we want to avoid this by moving
to clone3 and user managed gcs).

the problem with (3) is escaping the security measure, however
it only applies to very special threads that can always decide
to opt-in to gcs, so i don't see this as such a bad option and
at least bw compat with existing code. (in my threat model the
attacker cannot hijack clone syscalls as that seems stronger
than hijacking return addresses.)

so i guess the answer depends on how much headache failing
raw clone may cause and i don't know that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
