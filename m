Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E3C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOdMWv1odEb2YdASAWPkH1p8ePX+/mFG7+QwN7EyH+c=; b=WGy6gl2XIwqqWr
	6YkH8fNTjZWoSQ+crE5QrX1RAonq7my9bGlOwJMn7E4HHLPXXhyQyFkmE36OtRwMOSHINWQG8MORY
	u9GurhTeB7olWdbQGO32SFJn5LoWLYGPL8ne9I+o07oCt+S+L1R2OVWyUInIXCWg1Eliw3tOumquR
	kOBOg55Uk32ripkuf2nGPTEINtUQOEUqXexo5+kiYR2uZMsZX4bXb6JTTizqulatWYXDz5Y0ygg/r
	nciSYeg+ObM8IqhGBO79cK6JXHybo2n+8Ke6YSmhsMJU0ATYG3yB6uSarrO8zzGXRbLglVe2egcJ4
	sITDBDt+CC6itF+mpWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevFZ-00000002CpN-3CdD;
	Wed, 01 Jul 2026 13:45:13 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevFX-00000002Cob-0LWa
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 13:45:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufiCkIodUstiLJtnynRWTMW3Ja7iGq2a8PWgUBch66KDs181zLfEUPDT/tB582MCjKpbOj9i8aMK3TsY3os9DMPdv43BEuZGac7O1a4AhiLO6xNss22bg2CB+8qW9HZgA5R1Qo53/kJTgPz9OMObEMxCbPWLexBqRLMZ/F9dFZLhoukorMn4s9v+tWAmqPgUfx3a9X6YUSj2Ctv7O7fwqndQKnFdg4jWl8KPbQN4BKauyDk3JM9nhVK2Y3WDbobjxQCqiMwXaE1tTZnLDfjOtJ6zm6BWh4n7bKPY1RT04ub7CvDOwPPpAkO3OqETXnwtFHvd0MdyZDlJ22bBXi5gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHcYZaOuwX+fbf1W4KEKK55wxqsesZ+6j9yL/3aH3kA=;
 b=FXVHWv10haikQmYnC6udckE1JmS7JQ3kIzs8DV0ScT/BS0DlmgoK5MRMZKzG9VTmvh51HUmj4q03a4JFdy4lvsS+Fy4GoZilQzh970Ahh+1Ly0Exm3iXKDZwX2yqjIx0ifTHF085M87Y5S7QQLUM9/FZ4PpCmAZgqhQVRsx1WzZcG+uTK65i4JjPvLHOTltLAY0/ZYx0xJl/E0MX7ysTKHelCOIixx35oQtxUPUcKvRcmQn4lDTFR+xwA8he6rFhAR9wR8cn74vG92DukB9NIGuDrWdknpNyy/JnoYMhA7S3G7tEKgW/At4zXRnBO4VgrhaSDOslx2+A+hFB8wxTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHcYZaOuwX+fbf1W4KEKK55wxqsesZ+6j9yL/3aH3kA=;
 b=e3JQcuRkojq7nj2yU4PBRNu5LErwRbORa5YXNkW9FTemVwwr4K4ulfWlu7I2tsgC1+Gb9HSN65c/m8n3Hj44H2nytI2XYSAeDhJxwYlS3tBZQ1ND3KJR8d9wYI5lbDurnbn2EgZV4iRcuX7MAG21Wxltj7Tfxv9nWGWYFIQDucsK3w4KybZNYZFYW6I09ZcEXMrZCxxqR2REHq8XhZUChQNhKmF2tcKgMM72NUJ2hyP5vbhHt4uGpQqdJZOm5E38bmvHVW+dHm5qq8pdXYQEk+7mzfxBxCicZ7FIpSdntKbn9KDeP8PKFoPCJ3m1p+ywcGl91soDsyzb1pVBdfwKlg==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by DU0PR09MB6096.eurprd09.prod.outlook.com (2603:10a6:10:404::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:45:03 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 13:45:02 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Djordje
 Todorovic <Djordje.Todorovic@htecgroup.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "macro@orcam.me.uk" <macro@orcam.me.uk>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>
Subject: Re: [PATCH v2] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Thread-Topic: [PATCH v2] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Thread-Index: AQHc91TyNI1Ix3DNNESPJxgTEBAs3rZY0PAA
Date: Wed, 1 Jul 2026 13:45:01 +0000
Message-ID: <9cc0632e-4b40-40fa-8c37-858825a52dbe@htecgroup.com>
References: <20260608-p8700-wfi-v2-1-77efc7459f3d@htecgroup.com>
In-Reply-To: <20260608-p8700-wfi-v2-1-77efc7459f3d@htecgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|DU0PR09MB6096:EE_
x-ms-office365-filtering-correlation-id: 48c4039f-5b15-437c-a9a8-08ded776f2f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|38070700021|5023799004|11063799006|3023799007|6133799003|56012099006;
x-microsoft-antispam-message-info: xOo9yzdhLm1N8lVghqyyVGp/PIBoPyn2LO7NDrK1xLw8gdifcnmv993RtHUPmnRQj4MCaFw9j0apYRyfiiZ3gRss9X5U/3nSSJ2AILw4IDhrvRMESoGKzEWPVkqXwz2wd0beDzobmctKL1kTviAy6WJNqT/0oRrkk8czsFBJRi6Z/0xJBaoFOW3YX4VCCJm1fs9v/36wGOo7h6IUIFEnFxWTwgRBU6wHNc/ugXA2i1cf4BdnVrW80Ih3BhtV6aNPHuTusmYT/vfscB2GfUj1fKrfpBdrlW1oEbLGOG8CEtamt5kp7cfW0qy6iKcQiIDPjVgliX9XyBnkrIVNVHyGhKzOWcRItoptBCXS5lUakouiKcOE4zY3zffQOqOfJvp3f5cI25V6Uuw6d7RK59Oma0QpLiO9Bg2G2xjl3OOWZtKZ3oSzBclMvgTGGSpzwW3Rl3LdoY3dyGCdw0mGhgfl8IDOhRl7sPCSj7ueGLjBtHRfsRgM2si012eh7WXWco0RhWtkYY4gp5Hy9fG9AiFM0IaeNu8TaezRPPigEOBpPOBZSwjzyqD5tgRnu7ykccOK40IMpzePOQy6L6BpWgYHRzmR/k+JTp65VP5K7wPBvsJ67G5NCReY1CTqX1+Ud9FvVlFcuzmCdb5kCdUzPLrQVUdJAlw1S/QhoZ1D+bBS5nPcBeZVFsFCw/pCjS2Fp36Y5m3vnTrXX33pi+xpBvbML0QX25bL1gAMsyOAbx/7EU4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(38070700021)(5023799004)(11063799006)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWJ4ekl4eENMVU51aUtoUmlwcENDVWhwdkc5QUlwVURYUkdFZmFDMWlqdktW?=
 =?utf-8?B?SWxrWHdXVnp1WEVIdWM4WkZ3a0U2dnIxbHVSbnJxRzVXTnpET2ozN0thS1Yz?=
 =?utf-8?B?aERaTjMvZEFPZ2djVHlNbFdYQVdtZjhmbm4ydmc3VWRLcmJUdnJIOXNKRTgv?=
 =?utf-8?B?UUxsbW9Rb29ZZWZIbzV3ZmZIY3pjZ3Q3OWFZTkt1MzJCMnltVzRVN01NVkh2?=
 =?utf-8?B?bDB4VHY1cjVTeUR2VXBqWklFSGw3SDcwOHNMb2s0S2RINUs5UDc0cm9PTGov?=
 =?utf-8?B?bllIZ29GZGlEL3F3NzJ1c2RSc0NNRmxMM2pkeXZIUENxaktQdEhVOGxwQWNN?=
 =?utf-8?B?TU1XRGE3ZkFSRzJmcWdpMTFTMXFIN3Jtb0dNWXdWa3Mwa2wzMUhlVDdpK1Jp?=
 =?utf-8?B?NXArQ3YxSXhTclU2Z0g1WnJ5aFZTVjNkelZHT2ZHd1Mxc2o3cWdibnFpSm04?=
 =?utf-8?B?UWptZ3ZUazJFcy9GTjJDVUFUZ2NpeTRTMzNtM2NLeHYwdTFqT1Rnd2htZWRQ?=
 =?utf-8?B?aXptWDBiKzE4cjA0cEZlbUgrSnUyd3BOeXpZblFsakllczZFMVphVTJzbmZt?=
 =?utf-8?B?TU5aSjRkeFBmclc4bnkrN0NNSm55RmZRQ2ZHWlZUbmlVaTdwUERTSXhvSWJt?=
 =?utf-8?B?akJ5akVMWnUxWGJGQmV6Vm1qZStFN2ZGczJGZFhsMFJJQXM3ZC9La1pTZ2o4?=
 =?utf-8?B?bGtNMlNxVnZoMEJlSlZzbEpsY3l1Z1M1SzBsVS9tUGxiRzZCSy8zK2NrQ0xN?=
 =?utf-8?B?NGdzdUtRMGFXcjE4YVRmSkp5Qlp0OTlNcFh0QW0zY3E5NTVZLzZaQzVyT0FC?=
 =?utf-8?B?c2ttMk9kMkcyUFlYVlJpM2ZNZjBzbERodVhIM3VLekNDR2ovend6WkRLWlZm?=
 =?utf-8?B?MWJBUG5HWTM0bFlWdk82NUF6RjUzVldpUFNzQTlXSWhzbFBvS0xPN3plNGsw?=
 =?utf-8?B?TUNEWkV4Y1hpZXUzbTdaUHRyNEliUktROEpkVDdmbTh0YzdQZlo4QlZZWVhr?=
 =?utf-8?B?WU5SWExXVTB2R0pTelFSQ0draklVSzhCVXVaN0gxZVg3WFhoZlRZU202Qnh5?=
 =?utf-8?B?cXg4anlGVWh2WVIwRlIzdEp1dEJFRGNOKytGN2hheTdTejhWNzQrRlRHR0hE?=
 =?utf-8?B?VDhaeElHWWRmK0MwaiswTUJLQ1VIRmluNWgwcXIvM0NHaHNGK3FXYlVXMEM5?=
 =?utf-8?B?L0w4THd6NWgzT1hjaUNNRGRjcS9CT3VJQWxnYjRUZTdONmhZdm4vNGMvQkpS?=
 =?utf-8?B?djIwU09mbnI0YWRKZ2txcTJudEFNaUdCMmR4dGtOMEl1bWw2NlFJNnNnZVdW?=
 =?utf-8?B?MnVlQjFJd1NsOTdOc0RXcXp2eDZyTmxpSmVrK2dnVHFtQVZ3L3VBeUZDcGZ3?=
 =?utf-8?B?bTdjK3RXZy9ZNnBpWUhWR1Q4aDROTyt5Q0ZzeWlEOXg0ZDJ6QmJyMVBNTEJK?=
 =?utf-8?B?eGtnSk4xYTUrTlVkQ3dNM01RTGd0YlJmUHhERm52dlUrSGFtNDc4K2M4NDJ6?=
 =?utf-8?B?RXdBaXNHcFVRdFpiUUZncVlBK1k0Z3FINUVocTdEM216Rk1PeGx5NUpKbHhD?=
 =?utf-8?B?a0dvM1lINGx4RzNMR2k4cFNINGRlWFAwVUc0YStWQzljMUhEYWkydUlEc1Fa?=
 =?utf-8?B?SnVDMXgxenhOcTVKcmNoWi9Kbk90SjhleVNsaUt1N0s3VzdRdjN4L0tYTVpn?=
 =?utf-8?B?V3pDUlc0ZytBalM1NFZXU1lKRmdyQlFoQ0dBSnJnUTNSTThiazFhaGF3RXhU?=
 =?utf-8?B?SUI3TWxzaXN6a3p6SjlsL2VHNWJPQWFhdng1eUZiOEV2Q2l4NVdZYjVIb1pN?=
 =?utf-8?B?cVVwWHhlbDl2WFhkSHR4WWJRNml3a1c3Wi9Eb01kb0ZJRlJCYk5IUUdrWDFC?=
 =?utf-8?B?LzJqdHpOaHJ4WDFic29WS0l2UXR5MmN5Q3NVSzlwZ3QzVThnbFlkZWhBbHhR?=
 =?utf-8?B?MmNoZy8zOVpUZzRWbmZCaGhwdzhUTzg2VUN5NlhIYkluZDdCNHBxRHhBenl0?=
 =?utf-8?B?MzRCMHJ6NlRJcStFUzh6WUt0VVFYd2JSOUhSZ2RQYW5VSmRPYkgyRFl3R0lR?=
 =?utf-8?B?OFhuNzZjVFF4amJzeExDaVRtaStXdjlTa2FBWk5iSURoZTNnelFTUUZaZVVa?=
 =?utf-8?B?dE1nakoreE1zRTBkWjBVRWhQWkZtZzdXYnBlNG5ESnVlTUxETldLdzhlUlNP?=
 =?utf-8?B?OUdMR2FRajk5eko2NWh4RlJWWXpzNFVUTHhtcnowMGcyMThwcXZHaXNiWExC?=
 =?utf-8?B?R2ttWWpzWXRpVnFsU05nSis2dmg3MFltbFNuRVQ3WmdzVEtKMFV1WGFkWUpC?=
 =?utf-8?B?TmRKUThCbGdreWk2UGJhTWRLdHA5MWtoejdqbTQ2YUptTThzRWdUM0RZQlZW?=
 =?utf-8?Q?Vwik9zemm/AXNQZ0=3D?=
Content-ID: <3EBEFAEEC484FF46A8961BD2E434EE13@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c4039f-5b15-437c-a9a8-08ded776f2f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 13:45:01.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v78E7W0TP5BcX5VuotYTWJ4pyyfEWRB+O1ox3sAvRBFrpvHzc/o/g19+BJNnPGOfat+jFWUI95tM9p3nA5SQezjEroM9sGZgtH1Ai9nnGtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR09MB6096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_064511_306217_D33A5D6F 
X-CRM114-Status: GOOD (  25.69  )
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

On 6/8/26 16:41, Aleksa Paunovic via B4 Relay wrote:
> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>
> The MIPS P8700 has bugs with the WFI instruction. This errata
> uses the RISC-V alternatives framework to patch all WFI
> instructions with the MIPS P8700 pause opcode (0x00501013)
> at runtime when running on P8700 hardware.
>
> Two call sites are patched:
>  - arch/riscv/kernel/head.S: secondary hart parking loop
>  - arch/riscv/include/asm/processor.h: wait_for_interrupt()
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
> This patch was tested on QEMU configured with eight P8700 harts,
> as well as on the MIPS Boston board, configured with a single P8700 CPU.
> Errata application was tested by disassembling with GDB on QEMU
> and inserting an illegal instruction on the Boston board.
> Correctness was tested with a combination of kselftests
> and torture tests (rcu, locktorture), along with coremark testing.
> ---
> Changes in v2:
> - Replace .insn with .4byte in ALT_WFI macro
> - Add explanatory comments
> - Link to v1: https://lore.kernel.org/r/20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com
> ---
>  arch/riscv/Kconfig.errata                    | 11 ++++++++++
>  arch/riscv/errata/mips/errata.c              | 14 ++++++++++++
>  arch/riscv/include/asm/errata_list.h         | 33 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list_vendors.h |  5 +++--
>  arch/riscv/include/asm/processor.h           |  3 ++-
>  arch/riscv/kernel/head.S                     |  4 +++-
>  6 files changed, 66 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c945d086c7d0266b685f9506d58b0662af071c4..cc75e6f70513d08afeedf650b14dba83eea84632 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -44,6 +44,17 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
>
>            If you are not using the P8700 processor, say n.
>
> +config ERRATA_MIPS_P8700_WFI
> +       bool "Replace WFI with mips.pause for MIPS P8700"
> +       depends on ERRATA_MIPS && 64BIT
> +       default n
> +       help
> +          The RISCV MIPS P8700 has bugs with the WFI instruction.
> +          This errata replaces all WFI instructions with the MIPS
> +          P8700 pause opcode to avoid these issues.
> +
> +          If you are not using the P8700 processor, say n.
> +
>  config ERRATA_SIFIVE
>         bool "SiFive errata"
>         depends on RISCV_ALTERNATIVE
> diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
> index e984a8152208c34690f89d8101571b097485c360..67b59f8c1708ea8b7a040f7939e111b8f30e6a75 100644
> --- a/arch/riscv/errata/mips/errata.c
> +++ b/arch/riscv/errata/mips/errata.c
> @@ -23,6 +23,17 @@ static inline bool errata_probe_pause(void)
>         return true;
>  }
>
> +static inline bool errata_probe_wfi(void)
> +{
> +       if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_WFI))
> +               return false;
> +
> +       if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
> +               return false;
> +
> +       return true;
> +}
> +
>  static u32 mips_errata_probe(void)
>  {
>         u32 cpu_req_errata = 0;
> @@ -30,6 +41,9 @@ static u32 mips_errata_probe(void)
>         if (errata_probe_pause())
>                 cpu_req_errata |= BIT(ERRATA_MIPS_P8700_PAUSE_OPCODE);
>
> +       if (errata_probe_wfi())
> +               cpu_req_errata |= BIT(ERRATA_MIPS_P8700_WFI);
> +
>         return cpu_req_errata;
>  }
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 6694b5ccdcf85cfe7e767ea4de981b34f2b17b04..5c936882c42a90bac2bf40369a795d067a86d31d 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -25,6 +25,16 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),                    \
>             __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),       \
>             SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,                    \
>             CONFIG_ERRATA_SIFIVE_CIP_453)
> +
> +#ifdef CONFIG_ERRATA_MIPS_P8700_WFI
> +#define ALT_WFI                                                                \
> +ALTERNATIVE("wfi; .rept 7; nop; .endr;",                               \
> +       ".rept 8; .4byte 0x00501013; .endr;", MIPS_VENDOR_ID,           \
> +       ERRATA_MIPS_P8700_WFI, CONFIG_ERRATA_MIPS_P8700_WFI)
> +#else
> +#define ALT_WFI        wfi
> +#endif
> +
>  #else /* !__ASSEMBLER__ */
>
>  #define ALT_SFENCE_VMA_ASID(asid)                                      \
> @@ -53,6 +63,29 @@ asm(ALTERNATIVE(     \
>         : /* no inputs */       \
>         : "memory")
>
> +#ifdef CONFIG_ERRATA_MIPS_P8700_WFI
> +/*
> + * A WFI instruction after a mispredicted branch can result in erroneous address translation
> + * on the MIPS P8700.
> + * The number of MIPS_PAUSE instructions required was determined by measuring
> + * Coremark performance on a one-core, two-hart configuration.
> + */
> +#define ALT_RISCV_WFI()                                                                                \
> +asm volatile(ALTERNATIVE(                                                                      \
> +               "wfi\n" /* Original RISC-V wfi insn */                                          \
> +               __nops(7),                                                                      \
> +               ".rept 8;" MIPS_PAUSE ".endr;\n", /* Replacement: mips.pause for P8700 */       \
> +               MIPS_VENDOR_ID, /* Vendor ID to match */                                        \
> +               ERRATA_MIPS_P8700_WFI, /* patch_id */                                           \
> +               CONFIG_ERRATA_MIPS_P8700_WFI)                                                   \
> +               : /* no outputs */                                                              \
> +               : /* no inputs */                                                               \
> +               : "memory")
> +#else
> +#define ALT_RISCV_WFI()                \
> +       __asm__ __volatile__ ("wfi")
> +#endif
> +
>  /*
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
> index ec7eba3734371a2d8b68fbd4cbd88a8e7135a413..4505317a6b949be602f507547fc9cd495c923e32 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -22,8 +22,9 @@
>  #endif
>
>  #ifdef CONFIG_ERRATA_MIPS
> -#define        ERRATA_MIPS_P8700_PAUSE_OPCODE 0
> -#define        ERRATA_MIPS_NUMBER 1
> +#define ERRATA_MIPS_P8700_PAUSE_OPCODE 0
> +#define ERRATA_MIPS_P8700_WFI 1
> +#define ERRATA_MIPS_NUMBER 2
>  #endif
>
>  #endif /* ASM_ERRATA_LIST_VENDORS_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 4c3dd94d0f63844fecc32a7e2c1a184113ee49d9..ae4faed371c16ba33f31373561de03e89d35d04c 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -17,6 +17,7 @@
>  #include <asm/alternative-macros.h>
>  #include <asm/hwcap.h>
>  #include <asm/usercfi.h>
> +#include <asm/errata_list.h>
>
>  #define arch_get_mmap_end(addr, len, flags)                    \
>  ({                                                             \
> @@ -176,7 +177,7 @@ extern unsigned long __get_wchan(struct task_struct *p);
>
>  static inline void wait_for_interrupt(void)
>  {
> -       __asm__ __volatile__ ("wfi");
> +       ALT_RISCV_WFI();
>  }
>
>  extern phys_addr_t dma32_phys_limit;
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6fe8a32e24c8ce7e0badd63469d2c387..14935e8eec2639844c45bd37db29db74fee38a22 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -16,6 +16,8 @@
>  #include <asm/scs.h>
>  #include <asm/xip_fixup.h>
>  #include <asm/usercfi.h>
> +#include <asm/alternative.h>
> +#include <asm/errata_list.h>
>  #include "efi-header.S"
>
>  __HEAD
> @@ -196,7 +198,7 @@ secondary_start_sbi:
>          *  - receive an early trap, before setup_trap_vector finished
>          *  - fail in smp_callin(), as a successful one wouldn't return
>          */
> -       wfi
> +       ALT_WFI
>         j .Lsecondary_park
>
>  .align 2
>
> ---
> base-commit: c369299895a591d96745d6492d4888259b004a9e
> change-id: 20260415-p8700-wfi-9083b1d87d22
>
> Best regards,
> --
> Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>
>
Gentle ping.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
