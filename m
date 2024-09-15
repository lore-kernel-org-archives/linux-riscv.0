Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05236C35FE4
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7ohvAfQklh8xQvky8mkNtbbCUIQy7M9YO0enSExCoA=; b=OjOW467yoeA8VF
	IgV95EC2XcgWJVeDMTvCjg1Ai3zyWqR9ZFF2uISQv8qyRq7bHkpl37YP/xWuLD2dkANwA96dCBh2l
	mmVimnghxwTUo9z6u+Ejbd+eA5IFQ/CI9U3xjLz1dCn40d4e7jum+kKMUdF6L2bhMjlbDtmJGVSjN
	Gqx69qdYljK1XsGQ0c+dxdkjCxD5UKXlLZg6pFAOMxGx1JM2NKX9Yan+2zCL6ycPaF5RvRHSxxih6
	B3JCSGLex/qOhgaA0dMZhkMey0SW0vy7J1SzwDVtHSmfoDcwTej990CfwGn4zmbvht4TIqpsgIKqh
	t1bKdcft2awmaaNlUDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spnZf-000000021b8-2201;
	Sun, 15 Sep 2024 11:37:51 +0000
Received: from mail-uksouthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c205::1] helo=LO3P265CU004.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spnYX-000000021W9-2XbY;
	Sun, 15 Sep 2024 11:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDYC44T82BF3P0bIDu+AoxB436CwvwyxefGOAw+SlkUKac6P9TjvL5BSeEMBJ5b6RBVqYbSa6kvnvtBlxfw7PD8IxzWjK6HrcEiqk92gbgnftq69Ww6dA0TVXoeGWK9tVep7xKiQuUmt8B0MoFeGT1Fl6ijIcAgjzqz6WOs3Yyn36XQb12aTbkbsBWrzxVVmIuAgx4DHklpxMhyQpqoXBhGxZP+M1IfP0MtuEwN67XMgCYhYHr8B2kX1e7AjPQqN9kpBEudAb6DhMmKZnpLQ9WP95lMJi7s8o4bsHGagBfBYNRCUim5WbHfWRquhr3OzTxvUVFBMb6zxJ0WIQfwvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vplj/AlF4e/0OqqFV8cOHA8JHT9DcEC7HzbjSBijD/U=;
 b=P3T/z1jMiPdmkDXpKc4iYaBBnNd9lQQBFbRvT5Yb0MuyEWzCFMtEWOqlljn1s/H5y7urDkUQru6hYgliBPNUws8oud6rsdrrvG5SdtL4mKaVzg+5T2eiZCzkoNx++uyjQ+eyacH6Glr2+oQLUyExCvS8amnnIBGrrhduyQquiLXciGb+GeHNPQNouXJGXClL0tDzbvhBxD0CHSZ/x5lX6EJje8W1gHz3i5G8xh0FH1wL+cyLDxcuYVNXUBxdC2HA5zz20kjtca20qE+fOc3jpYH1z7OY2Foew/fBcu/pcW4R3lQ5V2yqIBAh8XakmHjljFbaH6t3rvqB7fYm1wg7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vplj/AlF4e/0OqqFV8cOHA8JHT9DcEC7HzbjSBijD/U=;
 b=jll0n45m01bqoUjkXxXI4z/7rUCSk8k1JFGQ+DDRscafVA515/hlWtmm50arkucKSkr8Gzh4ZiLFwqyi+aSsvu99NLdHffeoKII6X2GYMSFFmAu+OiELemIe5itvCqtzSekAe44mE06noEkfKuIEjc4UKDp/o094eqHYySKsYlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO8P265MB7450.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sun, 15 Sep
 2024 11:36:29 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 11:36:28 +0000
Date: Sun, 15 Sep 2024 12:36:26 +0100
From: Gary Guo <gary@garyguo.net>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Conor Dooley <conor@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe
 <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, Nathan
 Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown
 <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240915123626.1a170103.gary@garyguo.net>
In-Reply-To: <c7c5a16b-d033-4b46-8994-259c55bfd8b1@gmail.com>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
	<CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
	<20240913-shack-estate-b376a65921b1@spud>
	<CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
	<c7c5a16b-d033-4b46-8994-259c55bfd8b1@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO8P265MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d002efc-2305-4760-cc2a-08dcd57aa354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d0aq6IQynploul1+etuDdVfsjgPiZi/Lmb+OnbMKTaReAS6XaCEcotSmVzO1?=
 =?us-ascii?Q?WugN4war74W+BSAitzPI8MrI82EuRD6ZaFr2kd7cwpWtKle58qKfkAS07r53?=
 =?us-ascii?Q?ZrWbK8MLiJZKe4HsHh06UwjWSlf4rTLSAck5icm8VHUIRo5xBK6W2YoL9ANl?=
 =?us-ascii?Q?aHVGT9U0jQckVpVixrKn+7G6aIhYE3zdBr4AnSYGUslsWVRHcD3EiZiOOwIH?=
 =?us-ascii?Q?dMMVrOTWbHhBmKxIakHrypREeIqyx2u16HVIpvAXccDtlZn0JmvIY77sqbmx?=
 =?us-ascii?Q?ixPk5zsJ5RImM9vrBoTW5gYY529wzs0id52Rr6qz+zPHBtXdfAYhdIHPehEo?=
 =?us-ascii?Q?HzZhZoWonaN4TC5azqBVgAebH3l1s4MF07McRgUyhwcmGCm3ustyNqBS5vXx?=
 =?us-ascii?Q?EH0KARikT+HI7mgSu6wzoO4rrp6G9Pmn75FkhH1nbdrC7OtOwPdSohtHpyLw?=
 =?us-ascii?Q?n52vOeCXg+r5OZzSZXOTpQ64X0lV03Z2E8hwaSzGpIL5raM5nnG2VsktPGLn?=
 =?us-ascii?Q?YtLCHoOJWFq5UbQSKCH70R1GQMCWpJIsZWo6TEMmqMHVnk4TYxoO2CIiyyIc?=
 =?us-ascii?Q?olb3zeKFfW1i5igvcLNFgNS7MPmy1YRAZnMX0sxMSnWDicYyzblSpOEFDTKR?=
 =?us-ascii?Q?oCy47eXs1hlVGi3l2aPDXiPkwDBwCPuFAN3RTabOOrHJlzEdRCwhV1+yMV2W?=
 =?us-ascii?Q?qEC0ocie9oMZzCv83DEVMKhmsEOxxoacRzYfVu2idJHAZnxppmK/Q4qNZeyj?=
 =?us-ascii?Q?5ZmRHlLNWegS2Txwf+FmYlz/PfIHXvald1I8zmrnATIdm20YMalaPbGO1tMW?=
 =?us-ascii?Q?Iy1dStkVprvn55Yzj4gxSNQWXXg/AzZl7uh9FgE8mG5l3JA1eQ42YPz/raEY?=
 =?us-ascii?Q?fR3E/cav9MEDPP6MppEGRLeCVvS9fCxfYhIBMgU9TbHYtUV7KEp59fdBPj5+?=
 =?us-ascii?Q?sDWvKRxkIR2VNlbCwJ/h6xEdMHWg76gi4Fo5gtHtR1qTRUBUA5wFCa0WybTl?=
 =?us-ascii?Q?OiD/aoEAwKtth9gbO6slT2sDRueFYQR0v7NDF/fdR19Y6sRuSUtTRfGICPOX?=
 =?us-ascii?Q?ONe7ruUR4VCNh3YMkJRnMqCAwAHPz/gs1LEF8IxRwmvwQHMVF0BF6NHU7FHP?=
 =?us-ascii?Q?S4GDrd1MClhYr+k0ilvfMG+FpBYwdX5JXobV8zQfvBbrt09eAgjac2dxPry3?=
 =?us-ascii?Q?rDnZ0CuTNujwwX2Whk3iDi0AT3m66rTV0AxVPlRQYfia1TWmhQ/kVELQP3D8?=
 =?us-ascii?Q?LpjUPUwroywXto3dHKTmKh67jfsTRNQ+JV1xPPTCTdD7FUlZuPh33yfkyYma?=
 =?us-ascii?Q?B1UKvkWCedLL0JTL6x5wJSm2Iykv0cMR6LXzXzrEK6AbCjefqugrP4SV4HB7?=
 =?us-ascii?Q?OcqL7Js=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MlZxSgADvAa7pYLO1cG8qUUr83GGUXRYxxrXv/Vb77mHffSaU05VbPqfYwB0?=
 =?us-ascii?Q?6wcJCpB/N+2N2oC3AKk8HsjsQJpmvLrFnq4KVLfHxXOTz0cwW7k3tInXsJ9p?=
 =?us-ascii?Q?TwehResb8JbpoSI3bHjRmyxzZNfwFUxcIebIDVhK07h+MpPGtWF3KCdCvLx2?=
 =?us-ascii?Q?LhYURq1kGj71775UyImTn3+rmdUB6HfLGtgHAd60WYdHRRPnG93/Hc1/i6tY?=
 =?us-ascii?Q?g/8x0TUr178nORjzjboFh5mUTqsYrqbmtfArkbMccy4z6a+pzAXgN65jCOAC?=
 =?us-ascii?Q?x3p9At0JhquejH51UKlgdVjE9ZIXf2fasu505vrf3fy/+PD/3LOObe9rPbqQ?=
 =?us-ascii?Q?QybdbsBJvGzHMSavRYijYkM0Nenir0Nu+ixi1R9aGqj0AaX71b2JzDuxrgJ8?=
 =?us-ascii?Q?Wkb2IBkTDvDi1/6OrCrBcZggKWaDpX0n8nohEwn/0xGWOwDcAbSStiroKA1R?=
 =?us-ascii?Q?POfE+bVbOZzPH4GrHvpSZ0R2S6hp2w+UQ/1Hr38sD+tPnCnj1yTaiMaENa3/?=
 =?us-ascii?Q?ozhw9eDI08J0f3SIOaEee75cmU7CP38uSSPmH0veqH/14lqz25c6vA/M16RL?=
 =?us-ascii?Q?QsGIaNa2sZ/q9mIfry3m4mIoj4/AnwyoSwE4l4Dx/xgbsnZBPamX8ECPjiJC?=
 =?us-ascii?Q?KErrf3aZR9snWzB+0zoD2yOpuuyXcibglKlQYw6QGvt/6fLOYyRdZlZnJrZf?=
 =?us-ascii?Q?ClivAaQ5Ntlg7Tccr4ucf9O4AYvsrXA7NI6rMxXYRrhwB1sA3nZiq5URgKbs?=
 =?us-ascii?Q?ZOdRTNUCAtFxIeUryPvySVMW1erRUkAHYW0Hb3nqlugTZQaG3to1qkTAEP31?=
 =?us-ascii?Q?WHfRxk1VJ8PuIjyTKKXjkV93AurEqdVK1YGtA4R1Ubix92lI4toEFNyfl5BM?=
 =?us-ascii?Q?aKVwZZLY4bbiXmJnP7A4V7dRDFJrXGjl73aybpAypiHI/q94xctSshG93hOv?=
 =?us-ascii?Q?3FeufXikhe/ueCs1UZQgz3m4Q7BNcHUWq5q4sEkIgyOgld67fsHSHixiEYJe?=
 =?us-ascii?Q?oIDNlYf/SigzmKZvLxMmij1IHU9ZIUOJfNfZ7Qf61kj3CbxUwc8oE7fRYudC?=
 =?us-ascii?Q?tFHSsY22DFd4uRmkeBnubHLUKZQMg+iii5LSKyXp0bmPAjvnlEpTlDqbhKD2?=
 =?us-ascii?Q?IGIukjmZlw6KpZav48DCB7furZSEnCC1WjrUogyj3yUyXbLcRRf912BGhJov?=
 =?us-ascii?Q?8IXGpEiq4lGrjCePRPX1RZ1FJhYRsGPUNIyWNEIyd5k0/3PJcZ5CopUOa+hO?=
 =?us-ascii?Q?G3hbdXup9vUsm4EbmvquMe7spsXB4G7QgccFyZHOUu/yRvvCJLkl6lfDghdm?=
 =?us-ascii?Q?gw1epfDPTNMo5HvCQxUVvTChO9nR9EUYHmTAosQnxDGKTLndKyMIxwT79YCB?=
 =?us-ascii?Q?T1Cgi5uA99iqZsxeKzXOGs2qx7No3t1Bz8bihuMl6AoOcNtpFsuuxvJiPycF?=
 =?us-ascii?Q?2DLZ/2NX0PJv9aN3h95e4DwxzugH1OsLTIOpYcxuDp7NeVZfLti87N2VhTGN?=
 =?us-ascii?Q?Quj6FPT5gcpCrZQzmbn9aT/OUJYlwhSUGrG5rDGicr5tCMiAUR+dSqZjetV3?=
 =?us-ascii?Q?rXEWZJHueOp/xQZyyZFSprya/9so9wdjG+ZEXf24+TwYc141hTGky2Mug0bW?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d002efc-2305-4760-cc2a-08dcd57aa354
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 11:36:28.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 901vbxLaMxcVZSaSdYD5UX15C4InlzcQg9evPZWVbU/57XUPbfpzVdEODYmi1GzmGa1s8QCHP+8elK17YWaemg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_043641_699885_D59B7C18 
X-CRM114-Status: GOOD (  12.64  )
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

On Sun, 15 Sep 2024 09:32:44 +0200
Dirk Behme <dirk.behme@gmail.com> wrote:

> Yes, it is unrelated to this change. It is PREEMPT_RT usage related. I 
> think we could add something like
> 
> #ifdef CONFIG_PREEMPT_RT
> void rust_helper___mutex_init(struct mutex *mutex, const char *name,
> 			 struct lock_class_key *key)
> {
> 	return __mutex_init(mutex, name, key);
> }
> #endif

There's no need to use `ifdef` here (we don't want to try replicate all
ifdefs). Simply add a helper is sufficient. We have logic in
rust/bindings/lib.rs to prefer externed function to helpers if an
externed function exist.

Best,
Gary

> 
> to helpers to fix
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/rust/kernel/sync/lock/mutex.rs?&id=6d20d629c6d8575be98eeebe49a16fb2d7b32350
> 
> ?
> 
> Explanation: Looking at
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mutex.h?#n52
> 
> we have (simplified)
> 
> #ifndef CONFIG_PREEMPT_RT
> extern void __mutex_init(struct mutex *lock, const char *name,
> 			 struct lock_class_key *key);
> #else
> #define __mutex_init(mutex, name, key)			\
> do {							\
> 	rt_mutex_base_init(&(mutex)->rtmutex);		\
> 	__mutex_rt_init((mutex), name, key);		\
> } while (0)
> #endif
> 
> So in the CONFIG_PREEMPT_RT case bindgen doesn't resolve the macro 
> what could be fixed by adding a helper.
> 
> Dirk


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
