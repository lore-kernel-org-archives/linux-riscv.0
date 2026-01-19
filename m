Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69BBD4A5F4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVPKyII3Wb4hby6cPjOWz5jp/mzxxhqQmw91Jm90Q6Q=; b=N/rIlwaCEaGZUD
	mOrHn6FmmSw0CCSUk8OPLmaEFpq4zhh796SEg4UldGd25YtGRbvHOOT0VqfkX6dXZ9w9RCbgCFC0q
	wXdcq0yZhlt2BMV0nRH+S55EXVlg/rhbhk0UgGNrCFwk/lC7uUaC2lqP1JbwxR95jQmx8+W18TSSi
	mcoDAAVCdBMVnSi0kBgOJ1YGQLpgA8RHQYE5wuhpUe0enQUuFkHKT2NNOX/vUvmkm4GbLuYKgSMjQ
	u5wA3C7TR94VX1IhV4xrA0elkuNr34MEAIHliFv3nx/Q3fjPFuGVs1vRiTH4wytNzReoAcj1ez2ut
	JyLWpfCu/2IoVQO7PMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjiV-00000001TgU-3qcI;
	Mon, 19 Jan 2026 07:30:27 +0000
Received: from mail-northeuropeazon11012025.outbound.protection.outlook.com ([52.101.66.25] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjiS-00000001Tfz-31du
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 07:30:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM2xViUue5Oxn819UsI2iwGBkU/WyqAAS5/fV4FaO+7sjD+ZOknHPEaJDP2f0zhMEBEsV1Dywh8OJBA8u08NqLKplkOAjEJ0bx9DVG4sf/5vEN54uxnaxTvlrV5+EgwEHrhCgaVr6anYQEdyii0OLq0CJQutDo1w1rjiTzptDKePXuqEwYmrQabONHG6y2ujlmUHM+7H3UDty2JTYYZG1bEIZ/5cZ9885L58upnCQs1WZKIMmMs/dNLBwHuL38lws1wyDNJJxzqBOQMPH4r+Em0cDr4Z10fS3tX5oXRaWkFciOBu1Vwz628wtANrA1RYJiNPOLJsIZ6fHSDubdvkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmRkLoBVNk2Vr13kDW2yMhroyzZamp3I4qG/Bb6a47w=;
 b=mCYSfMI4rmBrSuwSzivkmwV8f+hldvWgcOJDZQKuAKWFc/qUGAt2lufr6rI8z2rc/KafqK42yLDNZalSZHWT8rrq3avnL5+vguycwByYvXRR44pIjT4xWAqXMtStaWCcdGGmm8IjMTtbVrnb1dvR8d+BQqvoJarb+dq1fij3cVeXEnSg4szGxrzr0zrDv/KPHHQPTyreN3RGLlVNg2CHlFGAKL9VmzkH6/2ycKKn9Dk+aTNvFNFgN6p/6qD3II++rdDYRUMN9ELg68F0yypLU1tvvdXi1Lr0yzV70pqYrBrTmmu2G3LYa2E7nVc4ozu+YfnRepTCAJAGzf0sumMbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmRkLoBVNk2Vr13kDW2yMhroyzZamp3I4qG/Bb6a47w=;
 b=kkXM/Io9Hm+4FFKxaWD0SkT0x2XTLkxwyU5XEslHDv3EiiOJCzMUz5tqOpWUYg4hoY8eXXSY9/9ieeJxKr22mH4iVY9tPCm67JGSy+DDmyluHzOj1SmqipP2aoyvWNoraHzI9KNI2BI6syP6Hp4lHBNWqHNhVkSBoPdybv825jA=
Received: from AM7PR09MB4183.eurprd09.prod.outlook.com (2603:10a6:20b:11f::9)
 by GVXPR09MB7149.eurprd09.prod.outlook.com (2603:10a6:150:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.7; Mon, 19 Jan
 2026 07:30:16 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::4e7:45ef:d8f1:6fbb]) by AM7PR09MB4183.eurprd09.prod.outlook.com
 ([fe80::4e7:45ef:d8f1:6fbb%4]) with mapi id 15.20.9542.007; Mon, 19 Jan 2026
 07:30:16 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary
 Guo <gary@garyguo.net>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Chao-ying Fu <cfu@mips.com>, Aleksandar Rikalo
	<arikalo@gmail.com>, Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"olof@lixom.net" <olof@lixom.net>
Subject: Re: [PATCH] riscv: support CPUs having only "zalrsc" but no "zaamo"
Thread-Topic: [PATCH] riscv: support CPUs having only "zalrsc" but no "zaamo"
Thread-Index: AQHchScIwaUkg3MdjkegNUlaat/TfbVVnPAAgAJx3CY=
Date: Mon, 19 Jan 2026 07:29:16 +0000
Message-ID: <AS2PR09MB6296A1D1EF4ABD1C45202440948BA@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20260114072552.731974-1-vladimir.kondratiev@mobileye.com>
 <8afa0702-4d30-86e2-5afb-a7c113a92dec@kernel.org>
In-Reply-To: <8afa0702-4d30-86e2-5afb-a7c113a92dec@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR09MB4183:EE_|GVXPR09MB7149:EE_
x-ms-office365-filtering-correlation-id: 76cd04a2-c974-4ceb-da21-08de572c976a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ww+9yy/9pr/gEmMd02LFZ11+0Yd7X+1S0i7WDChmPMdQAsnOsRdItpWE16?=
 =?iso-8859-1?Q?REaiPvn3aez6cAkfV1eJVOQ4rqayp6/0TW+vPetpOGLKAbgmojLcRCxyg5?=
 =?iso-8859-1?Q?vnsphUrdiTdtrxPKOk7Kbz33hEppOy0modbMfKI1tpn7at385QBmvHBSLI?=
 =?iso-8859-1?Q?5cK5Yy9C04AnT4Cu3KhkRnRXER/bsN4CIVCzg0mGdS8Kud4KUcHVipbwrk?=
 =?iso-8859-1?Q?UITZx31YN4Km3aO/yDZ1mHk/cqr4qHJmkdJbwLO5GiX1VNnJtVWbrrA9Rc?=
 =?iso-8859-1?Q?CYtR2TBTGweCigJfYLTs1r1sqDqas1VjJKiEF9Qt+C8GI6x3oVcK4F8hYE?=
 =?iso-8859-1?Q?71jf4a4O1eS/eMCZHYf4D64WIbQJ63rYhY7GjaPbeG1/SVCtZS15S68AdM?=
 =?iso-8859-1?Q?926Qg0+xWpr6aS/RAOijazypg9+qtm4TivTS1B+wRTupjhEbnRGJzE+lLa?=
 =?iso-8859-1?Q?kNorU0vDhcr2MzR9a50Gsyy0uLzuAi76tNLhN9BQFS3aZOqc0Ap/crE/nW?=
 =?iso-8859-1?Q?C1q8HuO8+BKa9c5FYQdOcGzzCwwUhIWzqBQzzEZjGOSPqN4qpoHA6coAQs?=
 =?iso-8859-1?Q?v+qYmFEh/Kgn6vVmskRV0yhIZ1wa9yw7yFAFTJ61Yr//9T/9wiToGw0y7m?=
 =?iso-8859-1?Q?UXDOP0JYNqPLDJG4UGiy+FHlGF51rR+6p7YD5u1e34XxZMkqg0IDRc6+9x?=
 =?iso-8859-1?Q?y689X5owRQdEcUD8wA+lgEV/VnNgkWsrU02918sSmwf8osu4VrMaD1CNFA?=
 =?iso-8859-1?Q?1pz/gdTPatBVOGcYR7LVQ1ShQG/c0g+DHrh4vnjOhjjOfJ/fMNZ+8Eri97?=
 =?iso-8859-1?Q?kKqrnL3+NHzfZ8DZ0GmbKRFNAhvI2hiCzXoF82/p90eqFp3k7NIT2cTgct?=
 =?iso-8859-1?Q?1oSDttEFKVz/P6gKknV1F2aRGtpC/YFYucsY+k4XYz6vtHaX6TKgCx+fP2?=
 =?iso-8859-1?Q?gbnKhh0zQTfdBD9AH1ry78ry3NgQJnd+8hU1NTvULK49cxUI9g1KGzID2d?=
 =?iso-8859-1?Q?6/Ty/zpkL9p5AumBNCc0EjnoUr7Jj6HWbaGBzT8Jv05kEn/9yyizQ9n93i?=
 =?iso-8859-1?Q?maP/4ucCKgJWqTpvkS0ympvWoMTvmzwDTKpWue3a135wLid3K/akMMxpzl?=
 =?iso-8859-1?Q?hmEPl4VoMZOSv1udwZtKyhf3gkzkzKaMRC7EXWO8ZrlGbxolxjk3yyJ2S9?=
 =?iso-8859-1?Q?u+IxK3vx8Dy2b/dFNoI9MbGogxN7BtazSCnvYJODBgxdQ4XOb0JrFiSXNF?=
 =?iso-8859-1?Q?6ZCCcPtkruPRqnRMRLawfiMNlgt6FsP0Fm9xjBchj7kxQe849hV9i94DIC?=
 =?iso-8859-1?Q?mLa9SfalCPRNSmT48wZdgx3whcdqiyiR6PnPczeGDBLqZaKs+3LwSTTz7d?=
 =?iso-8859-1?Q?u+8lvvzKaA3+ic/5N5biQQGmeYGSzC79iknddnhZP3TZYlmChYLTUl/c/i?=
 =?iso-8859-1?Q?Yu7zsF/1oj991aQRs76dglxduvoumqh2E26e0fbnH/KxjCd3EIFjQp18ca?=
 =?iso-8859-1?Q?oXhNzdKh+oGoMngW6n5L/O9zcngD0/Q+sDXwCXk7KeGUqR435RE+eCUxQZ?=
 =?iso-8859-1?Q?HP0KrB/NW6F02K9O/nU5mv31CL0EYAH+c3S1CIPn/Pj2njojwEhxL2vvGl?=
 =?iso-8859-1?Q?raWWTi19sl5nFq7oUCi+w4Jqs2gCdaLMHHN9SVcqUk4XTMPJtnNVR2eW/D?=
 =?iso-8859-1?Q?7nTr+eyWa4rVpIbDAdg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR09MB4183.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ra3fH5cA021BRxkSNqsCpcVeP04FhLclAABscaGDIjmI4S/9nP0YI1ovp9?=
 =?iso-8859-1?Q?Yq051fHWm02uqIxP7XuD2RYawBzEYx65jw5i1t3CDLWAT/v++rIOUoGTUn?=
 =?iso-8859-1?Q?7qJTOugBgGrl4JwNZf9ES+yXbA1yIBPF7lxb2cYhcuy81OELxoAD/HgQU0?=
 =?iso-8859-1?Q?8fFa0dRr3KrNw/4iG3B9IADO/VZJjFFqrgRkj7R9UoPnKjeHlxrPrj3vYz?=
 =?iso-8859-1?Q?g6mw79bYgtaf+3Xv427n9AI2qCeFxLTBytvwwqe2nFRxNVVj9btoj67YKQ?=
 =?iso-8859-1?Q?TyOEf9g4V5Ec0A4ZFYem2x4zQ3sJMIoFLyYC6pPxSFROZbwDFJA+a38iUV?=
 =?iso-8859-1?Q?ZnizPpeB/97HSgZ7sYmifTODnM1iDChSZdRDHiQyiRXDxn7H5O//JfVye8?=
 =?iso-8859-1?Q?JDWawV63ROjNMpZgOjuqPxZDOBAgnQoRWTO3MjDyQaZmXnkETA0OY1nL0x?=
 =?iso-8859-1?Q?JVvKBzG5ucJeHS5mYIaKrLZg5tecn1zRW8Q91nhmT7dRSDbHP7ifVVRLU8?=
 =?iso-8859-1?Q?isS3Qivf7u/6RyA8xySzLsPH459/m3H2RaZpf96WCwz4UZwSgyF3+IpdCp?=
 =?iso-8859-1?Q?horK5+4Em7lSc7sqJ5qpxMyt/xXGB8YzpUKYnUmosdIqbH+Poj5e8wY7tS?=
 =?iso-8859-1?Q?EDaUXx3/svyBFsdE0QH/g5udvK/DXy1qRC4702ZuucmrLyZD0CLl1sCSNh?=
 =?iso-8859-1?Q?mPJM1qEga39GPfvlC64PVWBty4Ta2kTgtL0PCk/imO6zUdVhXZ7zV3T8I3?=
 =?iso-8859-1?Q?tQE9+FZdX6r9G/ny0k1/eOFfIpVOLhSGHdliiMxvpfddndQmX3wQhpMJ9X?=
 =?iso-8859-1?Q?DDsg3ngq1QnRpRZFnRkn3F8mEhyHUY3SbOhrDQ224qTSw2ZqaDqrbBiNio?=
 =?iso-8859-1?Q?i6EeBMGhF2OJr6d6Ekb9VkMVdzTo6j3heOizcIhUB7INe5ruiiKb5S+TsG?=
 =?iso-8859-1?Q?hTSe+VTZZqmKjj3AlyKolysFr0hdoE5BcGOZk5TURQ4hannu0idGVoi88q?=
 =?iso-8859-1?Q?kyeanf6oA9pVMHZneODaQAkmo5rnUAs+n+rorLRN0Z0opVDc1BdRI4mDzA?=
 =?iso-8859-1?Q?v//MerxIwtMAVSjwMxVUfALAp9MLlcvnCnJqSTiSON28djojPfhYmY+L4C?=
 =?iso-8859-1?Q?zVGHO7Dq6FyRdyiFev3ym/whhFeqLPQ/q/L+8guUFCUReqQq6R8v66yVUm?=
 =?iso-8859-1?Q?SHHiesVezBHSDIb3NxMfekLfsSgd/TtfxOfC9xTUQ6AEgPl7Jl73qt+9dy?=
 =?iso-8859-1?Q?zzMUZ0gb9dXzvPtePqTUwH9ZQTY1VbHdFdx8mBhNuNKU6l2SN8gISJAvRO?=
 =?iso-8859-1?Q?Log/4X0FkgPWG9R6WUWHWIaSV6L+W79R9cqOn9/3gRMQTsyM73UX0eEp/o?=
 =?iso-8859-1?Q?WlJwO5LkKL2I5g/078xIaurAOEb7zAVX34A76BWmc5k1eHgIsfedQ/hVIc?=
 =?iso-8859-1?Q?GRLsKP0xRItJuMorJ5ZOBmMepCdIY3ElMPzWqpG8nupQwUDmMVdTS5I+P9?=
 =?iso-8859-1?Q?9dv8V3jWPpIol/q6ob1LJcvRLf07mjreL3OjboH9ltOx1FMyf46fSxHJOJ?=
 =?iso-8859-1?Q?PrsXneO85Hzwok6ct2izhJ0uD57Q6KxY8Ew9125GVkDmI12TJUKtE1Cwh2?=
 =?iso-8859-1?Q?zYJisYmgL0eI3N5KA5Hk2zWbaFqwOD2pdTF4QrGF31qnZX9/sqEgLX1nEK?=
 =?iso-8859-1?Q?b8Q1e830YyaTZr2GTRdcYLMyskFfs2NbWSaVOemfHS4Oz/8zZPlyyFcMaJ?=
 =?iso-8859-1?Q?GTEatoU5F2peyzchjY5AFu8GxbvxnqrH6wCbq77zEsSs8U?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR09MB4183.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cd04a2-c974-4ceb-da21-08de572c976a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 07:29:16.0963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cpZXcFe8wMod7bMgUo2CdfaOm1+Zya8GnyYnoMmt/MmLWglwQeR0H6HbI1oKEJCmUJrZxOJj6UqyWBO+HrjTCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR09MB7149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233024_974280_44C0EE94 
X-CRM114-Status: GOOD (  24.23  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> > Historically, "a" was first, and Linux was relying on "a";
> > then "zaamo"/"zalrsc" was introduced. It is possible to implement
> > most atomic operations with either AMO or LR/SC. AMO if more efficient
> > however more complex flows are possible with LR/SC only.
> >
> > Platforms supporting only part of atomics starting to appear.
> > Notable is MIPS P8700 CPU [1] having only "zalrsc".
> =

> Are there any others?

I don't know, I am working with the Mobileye platform only

> Are development boards available yet for these kinds of designs?

Sorry, no. Mobileye does not release (as of now) boards to the public, it
works only with automotive companies

<skip> =

> > Implementation is generic, inspired by the patch [2]
> > by developers listed below, implementing similar patch as errata
> > for the MIPS P8700 CPU
> =

> This doesn't look like an erratum.=A0 The designers of this core just cho=
se
> not to implement A support in this CPU, and that's why that AMO_II bit
> exists in the mipsconfig6 register, correct?

Absolutely agree; this is why I re-factored this as a generic feature
rather than errata.

<skip>
> I guess the proposal here is for the upstream kernel community to weaken
> our A support requirement to support these special cores that only support
> LR/SC?=A0

Yes indeed. In fact, any AMO instruction may be re-implemented as an LR/SC
sequence provided memory area is LR/SC capable; opposite is not true.
Actually "a" is not a real requirement to implement atomics, we just need
some way to do so, and "LR/SC only" is sufficient.

> If so, I suppose the question is, should anyone in the upstream kernel
> community care about this case?=A0 It wouldn't be enough for the kernel
> alone to support this.=A0 A special userspace would also be needed.

Userspace should provide "-march=3Drv64imc_zalrsc" instead of "-march=3Drv6=
4imac"
for all compilation; this will instruct compiler to use LR/SC for atomic_t =
and alike

<skip>
> If we take these changes, it increases the complexity of the upstream
> kernel, and increases our testing matrix as maintainers (and, in theory,
> for any patch submitters, who should theoretically be testing their work
> on the configurations that we support).=A0 It's not clear what the gain
> would be for the broader community.=A0 As maintainers, we're already
> considering stripping out other code that doesn't seem to have significant
> community support, like no-MMU, for similar reasons.
> =

> On the other hand, if boards with Zalrsc-only cores seemed popular in the
> marketplace, and some sort of support existed in common userspaces, such
> that we could be sure that there was some sort of commitment to maintain
> this across the entire ecosystem, the discussion could be more favorable,
> I guess?

I understand the argument, but I can't say for all risc-v community or how
important is Mobileye chip to justify special support.
CPU vendor is MIPS, perhaps they can share arguments about decision to
implement only LR/SC but not AMO.
Good if people crafting LR/SC only platforms will comment here. =


> =

> Palmer might have some other thoughts here.

Thanks, Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
