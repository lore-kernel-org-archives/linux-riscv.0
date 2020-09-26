Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A4C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 04:35:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2852075E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 04:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ue7QzFHR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EkgXmk9m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="BE9XIvFv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE2852075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qzv6qzwMVDsj4kBf0GIOeLuxly/rZUOpF64n6jq7kFI=; b=Ue7QzFHRZqMZvUdAJcFP2y6kT
	YJNW32baALk4uFxAn6jQIQ9qGL6Ad4GyMs/pBWzJBcUJtbcAdUhuW/1fD3TMQpJVUxoV4E6bYF6MU
	dqklyt2Yja1jvwOtfFnlB2q7oIWgvzEpAmq0i3YUPhrc5mqIVVAnlXPG1X1udKKBoUHFbvY1ryK2x
	mLBbfyAswX5SX2NSLvVNxmOQEgQFyPDFAavAr/bLdW0l6nxZ3U6OAK7JzhjO6t2YYHmMBJoI0/Rnx
	hQGTRSMBEXgkzazdauihm4q3Z0+Yf7VYN9iToqwd8KK/4eryU+ULlP5EVbJCumH4jE0JwYkBO/Iex
	43scAYajg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM1vQ-0007F5-7N; Sat, 26 Sep 2020 04:35:08 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM1vO-0007Eh-A0
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 04:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601094906; x=1632630906;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pIoLDN9Uvg57CkDEvrGWpBPrreQe2c5hNprev5L4gs8=;
 b=EkgXmk9mZCoPwkaE+2FoQ3tRRVVI9m/2tGMQ/QU2RMgxvbctmvCPIfxf
 cBzdRkgVaHDy5tiaIIpCRi3Nc4YJrx16UKYa/Ec+JugYFPKRO/KdbTChF
 N6ZIRVvPwvuBeCVxvWvLG30mRmahZmY4Wn0qAJOdu/ENoO/JVEkwdAFRo
 8r7EVxz6cJySCbT/ZgwO+02Vsouzfc5S94KapciaS+XvpgstuVVZjt9mM
 se1CbQb8+ix1hT0cA9SwzjKXLDbWzGglhkEXSxf2y6ecHSFlw9UdF5KMM
 4YIsfr98qJrSTRCLJE+dgELACy8uccrWRrlYlXYgLqTVnFiU71WQXnb1r A==;
IronPort-SDR: XKH66uIxifvPyNeKm4g2o16hQ6+5uqYE21Q3Pr2eBYgYosS1POpbPaOZiKxsuKWE7CR0nDWsPK
 OQ/K78zBQ10ZTjY0Usl/KY8/incu+U27L6RD2hKQUhdNoXIZpSOwGZSqig5Nam+XVUOQIN7GMV
 apT8bcrBLMbo7V+ZhPVMO7rkz9C+xQ7s902t9GN8YYcVBNQComj9a3MEJ3YWxpv6nyxeuu2s3+
 4sHArr9Qea5IusTPygSUirCMjpiqmTXUCcxOvs0dPy/zjku40ELFGw2lNoE9D5SvFCnCKpA1Yz
 uRA=
X-IronPort-AV: E=Sophos;i="5.77,303,1596470400"; d="scan'208";a="148244306"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 12:35:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJIA2wemB6KQmZpNKps3D/EaEev9KhiTVPKsqdlk39XZLZNSE6Fxr84Ljf0xdfmC7dd7DKc1jmgjNnhaHGrholptugS/fQMvlTLdOT3csRB2ovv1t3CRHFKJN9NuuiLNEAqoVJLqwq6mss9XXZCdx7y9U8QM4rTCyT1n++6aanjG+lKyUzPmxjd/QZoD0LVwYpzPh6iLt3Ogc9KCEABbpt06y57UMIeSkj3udVvmsMexTjBm3NeVVdsTg3VS4LHq/s+pzTO98LqvdPrMj906FjEaRM21r3SoHTy53IcIBn2V0gTQogR+3wc+gbtfdj1P6zaknjXfVQ8Z3q1QvCEqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FRbs1XD1VFreMmb6fbiSWAKqUYy0ol1Gup9kRkUlfw=;
 b=HacSqdlMmb3RWP81B6z5FsN7Tuakd8hEbyH8Gkh9+5puENEXNcwpZ0WC8PGfVWGXRYxPPqetqbURfuAxFiKRPyagwMW5pDqRHuGHcD1oL5uN2DUWxih6Asz0UI4Op4CZNO1Xyp28M7rlevbDYm0bS/yl+qnSmFBneoDRMEyuNdI/prwZXqnnO4leqBh7p3kVg7jKAy4cdJ9oLsJep+Prozfhq/QyI7IlaW875EmIXlq2YhT1RA9+mtWx811YS1D3T/NBAnYPIJsQKp+XB6VZJrPIaXTeXyRmlpbHdyPhN54UyyW87IkOJLR9YsiA2BZyhnD6JBHAt1/QZ/ym/3pDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FRbs1XD1VFreMmb6fbiSWAKqUYy0ol1Gup9kRkUlfw=;
 b=BE9XIvFvXWG6jPHeCB8d6K4OeaCJEtbsqGLNkGN3EaKUwvgluZs8//hqICMtePNd0dopXkE9HBk8WMEdG+F5U8yASZEokn+MxwgQ+CHkVkyrm1OUG6saeX3ah0LOSeuuY9F90KfXLYm7MFtRWAkVzZ3RR3VXpDQdUUe2nSowPkA=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6361.namprd04.prod.outlook.com (2603:10b6:5:1e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sat, 26 Sep
 2020 04:35:04 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3391.020; Sat, 26 Sep 2020
 04:35:04 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>
Subject: RE: [RFC PATCH] RISC-V: Use SBI SRST extension when available
Thread-Topic: [RFC PATCH] RISC-V: Use SBI SRST extension when available
Thread-Index: AQHWky9myNjW22P19EaZyMWbu6RR4al6Vj3g
Date: Sat, 26 Sep 2020 04:35:04 +0000
Message-ID: <DM6PR04MB620119FCC5EFE2D32AE833778D370@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200925113057.725911-1-anup.patel@wdc.com>
In-Reply-To: <20200925113057.725911-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.179.118.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9c55b253-cb46-496c-93c7-08d861d58a0c
x-ms-traffictypediagnostic: DM6PR04MB6361:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB6361FE07BBAE0BC9EF8693308D370@DM6PR04MB6361.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCi3rxZBaYAm6+XREtFWC/bL1ZxFlxM9cnvPKLP+2/2VMfTeVYw3sMRpcC9mvQNyGW3KpWY9ygE/1mRovn6E5HdKxF14Im9M0UrLUuz+muRE6a38EJMxYiPDLmioxIA26+Xy0AKt+AqkApxSGvaqzOjAMDwx3+apUjcuYAyFsU/L8rr8/zDinbC8Vb6EsW0T0Qz+8Nnh2xyDg+a8XWAH+geamqLa+TaIf81EITEXJuqbqg2QETV50nbl3ZPlhvqA1fcmIc4NrnNgMajXt4tGaunhAG8wQJ4GYq2gCgTK9alYM1/5C0tIXR9JLftxMiXnfD+8bfCtJn63s9idnKYePRC0rSAuOvxugMDhtvvJZxrKggMtx2IuVb21nYWMXD8RhqtlRElC/d5KvYihEGE9KEkm7/JA2rZlr27ceTqERs+Jz7bWhsrhsbQ/pcMB7XoIQKF5vuHALoaT2BNh+0mG9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(6506007)(53546011)(54906003)(110136005)(55016002)(33656002)(26005)(316002)(8936002)(186003)(7696005)(76116006)(66946007)(83380400001)(5660300002)(8676002)(478600001)(9686003)(71200400001)(966005)(52536014)(2906002)(64756008)(4326008)(66556008)(66476007)(66446008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JvYPmL9xF7eZR7hUjuQr1hmDnX4vRq5lFMJfigk/DB+Y3F9KczeKo82Ge8wnQP3l2lrEFO+Hqnh/X86SXVyQCXTsgp81maxoyZVsnLwapTfw7l8PA71YUcgeu6gPE5XO2WeK8ZGNzb5NF9QYjbhdyQ2L/yVIv2y9OqcB+yjMPgqBRcBXC0UX+UpEd/HCalGNx+eaDGXDU3sLGmxNujzO6zmKpVhpLnGJ6jmd4sSdJSIy51tsg8JfrnRNb+jsrbVZ7AWI4RIsOCw4jWzgFtStY820f37jJIXWnQ4z8lBme6jzooizO2G4JjzmMDWOltl+iUliT9mKt7K74ko2+fksolPGYnsgWHZb9HSnC0JuiC+OwtOU8R0STDudIt7Y/bhOnTQgHusIkQhmkdqKv2VTRr4oQo59wOY8uQqtn5zY8/JnAB9Zy67rSOmJUFzvSoFJpUjruYbHvt6n0qojKXO8W74/K0gAZV1q5UgIEChcSpBFnJ4LXNT7uoEOKrCs0uXKfiQ4BWG2CJ9N0iCOse8NwCe6SXc6Z1LiPSrgMwcYKNrf9XStwuFhYmHKtO+hvBt8vAuxLlHgJflahxFgbWNTVeZR2D9IZ0pxJ0Ows6MmyGQLnABc1Nvf39bQLUCgBpLiSZvgtFqzqnISrRlF2mHV6w==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c55b253-cb46-496c-93c7-08d861d58a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2020 04:35:04.4034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+Bwrpf+Cw4QBFD4/qXYze1gZKOjLh1pUMTtUjlmTJNGIIzWDhA7k3Ez7/0Qe9D7JpA06Zm/Q2hhZ7SZchPwGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_003506_472418_985C60C2 
X-CRM114-Status: GOOD (  22.03  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 25 September 2020 17:01
> To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> Albert Ou <aou@eecs.berkeley.edu>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Anup Patel
> <Anup.Patel@wdc.com>
> Subject: [RFC PATCH] RISC-V: Use SBI SRST extension when available
> 
> The SBI SRST extension provides a standard way to poweroff and reboot the
> system irrespective to whether Linux RISC-V S-mode is running natively (HS-
> mode) or inside Guest/VM (VS-mode).
> 
> The draft specification of SBI SRST extension is available in
> srbt_v1 branch of: https://github.com/avpatel/riscv-sbi-doc.
> 
> This patch extends Linux RISC-V SBI implementation to detect and use SBI
> SRST extension.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  7 +++++++
>  arch/riscv/kernel/sbi.c      | 25 +++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h index
> 653edb25d495..2fcecec7dd0c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
>  	SBI_EXT_IPI = 0x735049,
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
> +	SBI_EXT_SRST = 0x53525354,
>  };
> 
>  enum sbi_ext_base_fid {
> @@ -70,6 +71,12 @@ enum sbi_hsm_hart_status {
>  	SBI_HSM_HART_STATUS_STOP_PENDING,
>  };
> 
> +enum sbi_ext_srst_fid {
> +	SBI_EXT_SRST_SHUTDOWN = 0,
> +	SBI_EXT_SRST_COLD_REBOOT,
> +	SBI_EXT_SRST_WARM_REBOOT
> +};
> +

I referred older SBI SRST extension draft where we have separate
function ID for shutdown, cold reboot, and warm reboot.

I will send v2 patch as-per latest SBI SRST extension draft.

My apologies for the noise.

Regards,
Anup

>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c index
> 226ccce0f9e0..865e028a9a4b 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -7,6 +7,7 @@
> 
>  #include <linux/init.h>
>  #include <linux/pm.h>
> +#include <linux/reboot.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> 
> @@ -501,6 +502,23 @@ int sbi_remote_hfence_vvma_asid(const unsigned
> long *hart_mask,  }  EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
> 
> +static int sbi_srst_reboot(struct notifier_block *this,
> +			   unsigned long mode, void *cmd)
> +{
> +	sbi_ecall(SBI_EXT_SRST, (mode == REBOOT_WARM || mode ==
> REBOOT_SOFT) ?
> +		  SBI_EXT_SRST_WARM_REBOOT :
> SBI_EXT_SRST_COLD_REBOOT,
> +		  0, 0, 0, 0, 0, 0);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block sbi_srst_reboot_nb;
> +
> +static void sbi_srst_power_off(void)
> +{
> +	sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_SHUTDOWN, 0, 0, 0, 0, 0, 0); }
> +
>  /**
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
>   * @extid: The extension ID to be probed.
> @@ -593,6 +611,13 @@ int __init sbi_init(void)
>  		} else {
>  			__sbi_rfence	= __sbi_rfence_v01;
>  		}
> +		if (sbi_probe_extension(SBI_EXT_SRST) > 0) {
> +			pr_info("SBI v0.2 SRST extension detected\n");
> +			pm_power_off = sbi_srst_power_off;
> +			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> +			sbi_srst_reboot_nb.priority = 192;
> +			register_restart_handler(&sbi_srst_reboot_nb);
> +		}
>  	} else {
>  		__sbi_set_timer = __sbi_set_timer_v01;
>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
> --
> 2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
