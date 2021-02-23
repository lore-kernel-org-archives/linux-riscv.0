Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F44C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:32:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986E564E31
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 986E564E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=nUyLTYO+1JRCTK1d26b3BGbpaeN9KG/nZf9dTZCeA2E=; b=G+hkiUYLh42y8SdtBYsy+bDKC
	NuGXDeElb4zuZpw3sfrngW1GsrwgBoGSi74WKfjHrj82LNORnKvuTCch1JFtjT3QRy5BXOzIbiNQB
	JyOulfsljq1IOmxqKsfGB43XFgW33nhwVHKUotvkIN1rAMfvXHyCgyG7y//0eQMjkcorgWDmSNe5f
	+7Pigl3aM3C+gwizfHsgZqXv+UF5TvrPSanXk4XoJ0q0VNqqbG3czchVEl5tDVz6GTxe+Fckd0xCK
	EYI9AAFRlxs7VhaKKO/3nj8f5iMwojKb0WZF9FDNlhTCZi+tMEMc2eXa6eVv4B/94rfwh2aTjK/DH
	FEdg++UWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENUO-000695-De; Tue, 23 Feb 2021 02:31:52 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENUL-00067l-IQ
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 02:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614047509; x=1645583509;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=j+rKteXbGMMzfxvx+/zP/X7zNuhN4wedSNH2obDpBT4=;
 b=JoDtrJMclnyuUCl2zXTXfS3Z5apQNYDtVDJ+xDAjcHLF+W1PwVhyaSGY
 lIxdfoNLhTN/FlqAdjTPkcX/xjGuo37ydnNPSaUlp9CVemcd29VuxW7p1
 3xzpTU/lFQjqN0gZrXFDMvOrcnPvFVBpwnomZD8MED8LoOqcWCl+Hl+/4
 LB8vv1OA0nfx0q5fnNGPKhr3SKv8qOkapC0WtHhHJn3zYv87AqwJ3puHF
 mQpFTYI5tuAmHACoXDs2H9rmJBqeXMkWdfnUFtu8QwpndEzfXqBi5kx7R
 q5gkf/TPckqq4gto6MIQH0UwfU2WYEOGeAHeIwp03PpnnfVQy/zpDRa4b w==;
IronPort-SDR: QWv1jWGmiryQZuKyEleu4nz3+yKpoJfHDqgpT2D5kAi+ZGsVIySpYbZHKgOWPA7gqJVrl1UiD4
 6l4xpz1b0nzZjcvFl9QZHKSw8PRrhxG2sKBgTFcj74wfNMwtEgdm2fIx6IVFCLKTfxZKUqZIJp
 savI4xXUjkwT8L/c2pYfZUATHJPczrMmRY5LSucLalqG7yEhqqKpRLfPilejxPtp4sYdO9XUis
 zfHQjvMh6Ci+wKSxBAvMe3umpwzHPi5y8U8fun1525Mvy6dnz9lxVZKACeQGYKyah1pD71igbh
 uHM=
X-IronPort-AV: E=Sophos;i="5.81,198,1610380800"; d="scan'208";a="161722631"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
 by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2021 10:31:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwthOSxo1yoSRB2RumHN5Kql9eqXPp7jh6V84mNQzKfWajIAqDP5LTBq9UBy9hCgURgFfVtOxA/yUEtX8SfVxRE9L8EO8yYNuD4UeqsB9+68VZaSEYpRcluhydq3fus15RNLz1B2SqzHqGdPS3+SS/zfT8ckxy9Y2XZeVGpxqxNxgSrpuHheOyC261zZjgUS/Ce1ypi6I9Twwk95lVmHU0lPKrcmRC3ID4/p3ZAMmYlB1Bg14FKbEJy1BtBQ5iJoJYLbyEymJ6V7v6LfjwC1hK3mtaa/OWQ5Xsp80Y3diFTPXdwznqYT/5IE7kDUpWYR7yMFCWkWwO8I7ucY89odgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvIbPOtDKRwLYjnlL0chJiOPPXGABfO9ZoVM4sZn2qQ=;
 b=V2A+T9yUxZKa7ALcwHiM6oHRO/+zCJOB0N9e0xtoFYcthKHo3t3usoCAi2pdSqc65/6MqMn5GJhptr/AEbaH99OUi8Uf24kI7+arbPPj6L2dIShgsWhyV5wzgj+U254k2FNa2mmYbZvcmFHLFE9BEqt/nOW3TwA+4Rk/O3ZBf0cXuZ+5zmRmMYkSAG8EAFsSuoMigVqu6g53f66ZOJROqRZC3apVTy2OLWY4SZ6qnUDYfMiww/qR67i+ucRpYRRGJuQ3FsVEwpwvBAMotnRqesKYacToZstHp8q7oZkrrLzHT6zMk8qs2UUDYgW4DSG+2owqnLvOP0bJ0UZGapjuwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvIbPOtDKRwLYjnlL0chJiOPPXGABfO9ZoVM4sZn2qQ=;
 b=BALU2/yF3/YhGgr34Etl5DlSzqxB81TEGlL14bHX0igGYg7s6hFeiIjpaDqcQljWKWSGOTJFNhYBpJ3djLLVq4ZE1sjj7w3a58d4/U0UnvUZI+gIz4UEnrWhf/Vlq8LM+YVzTWF81HYSBKm0tx15iJDgbw7zYQA890YGc0G8HCg=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4737.namprd04.prod.outlook.com (2603:10b6:208:46::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Tue, 23 Feb
 2021 02:31:44 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887%3]) with mapi id 15.20.3868.032; Tue, 23 Feb 2021
 02:31:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] soc: canaan: Sort the Makefile alphabetically
Thread-Topic: [PATCH] soc: canaan: Sort the Makefile alphabetically
Thread-Index: AQHXCYpQmyabUmitjUCciSxzijbTpQ==
Date: Tue, 23 Feb 2021 02:31:43 +0000
Message-ID: <BL0PR04MB651408C561B5E4B6889F6841E7809@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210223021858.3809234-1-palmer@dabbelt.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:d62:14b1:5eac:b029]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dae17d1f-9ca7-4771-5d32-08d8d7a32906
x-ms-traffictypediagnostic: BL0PR04MB4737:
x-microsoft-antispam-prvs: <BL0PR04MB4737B45A56AFA203BE38A896E7809@BL0PR04MB4737.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vERKYmpDe0K3GS0E4dDTRJNSVEyymoVcJ+VrbdK9/518vsd86GJLiRGutzWBu3mlUgghpqlZC+UxuZVpviYwqxevb0aFjGsJ5QNGZXwF6V65EMV9c0/OZPI49Tz/DekYwdx/Rja8cbDZx3AOMjjLrQic35ENN1FtyAI/PojFikGpXkyNH/FglSOvPVOg1XAwBTXVZ3khjCq8a+z25DWtyBzkGrpSg2b2rZ/n9TdJ57ffopm6YO2uuQjTHSE1pAwjfHOyY/yx2hIyLVgAosGf2ZC3A8UxuyCWWS5YcHZgnRLQeK44No2Sk7LBeUztlTYxC2m18QRELtzITWAfrCJmnul56IMQUpxO8Maes3zXTyZJv6LLZElUA+th06HaA3fzLyGrhyqTz+MUkfGmtEwhpxO1hI9tM0IhKuc9F78/rzp5vuiuBvgyNucp7LT0R9+MDJ2ED+TkqSXJ6+F15bMrb8unmvNqzpfhEbZqBS9wXR2p8EoEcWwryZB+Aj04QySEol0PYlLq4xuj822H+IJOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(9686003)(110136005)(8936002)(2906002)(66556008)(316002)(83380400001)(52536014)(86362001)(186003)(91956017)(66946007)(54906003)(64756008)(33656002)(53546011)(8676002)(66446008)(4326008)(66476007)(5660300002)(55016002)(478600001)(71200400001)(76116006)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kgpvLoPD+isIOkNS5Jxx18ulxJYND8Tz1hoSovvvTLh4wLIfxDL1Ycbg4utU?=
 =?us-ascii?Q?/GOiPuSb+DCq0I6dncFZ0oXQdUjSJu9e+VYG3uBrPsKDvipvn1RQKsN2NFb+?=
 =?us-ascii?Q?cS0w1s9T/TtxL+8kbR4BfZ9Hfr4xAWDJ5TeD8fsHAHlgeLYtvesfC6OiMycb?=
 =?us-ascii?Q?Heeybq6/MzZs7p0C815tM+MREhfVROGvPvQjwjqbtwhVw3jfGnz6bRzAnPmj?=
 =?us-ascii?Q?GV73vaVf4Se4OkcwKOEQwjz3Z3zQT8PGABcpS+YNDkVOAON/2c/XzEgY6pjH?=
 =?us-ascii?Q?8MfD8SBkQUIO/1VRf7NpUbq+H/G6SzNdkqh2a93yyTITiRQeDU4fzeraZi0g?=
 =?us-ascii?Q?M6zBJ8L0LKaInBddA2/nvMT0Tg6N1AxoSnzPsR70DKOZmmPcIlm6J4TBE9S4?=
 =?us-ascii?Q?AkfzRpCS9PKgK/Ckd66GiZ4dZtLNy8F0eO78q467pKbjppGjGpCVu2USdj96?=
 =?us-ascii?Q?sOrjku7whtNXAVRMxhAtLdQntUhPkuuvtS0JFl23fKtRbmeDlQF8+Ak2crnx?=
 =?us-ascii?Q?lI4ek3EEVPkPRss4KJB7UZCbpR5cb4Zrb4AzGK/QqZJUdOH51nWH0DfWjG9+?=
 =?us-ascii?Q?uGq3vEXpdR4YZi7EJ5pSNkrdSAOn3zOoqFYCY/pfARvVeOKMaO8Vgn55MdEm?=
 =?us-ascii?Q?WVp1v0hUbjaW4XXqfq7UOYAlTWN/Vi0WcfZoxmVkI6uLNcYR6RrBw8eV3Svo?=
 =?us-ascii?Q?AtBmPC90IA3aAmguJhYalO8V/hO8+SRomQaf9sdRl+s5dtBJu81i0uCSUwMU?=
 =?us-ascii?Q?SxoUMxCy6fMiPtVqQqWoDTZKU1SInKcA9ceW5cTAqC4ITUQKzpyBis8cSRMs?=
 =?us-ascii?Q?EGhQfD/eNSm//rY1dgp5Pb9PthNTlV0AO+cIYpNtwKvZZ5j22ELY9+VjcAm9?=
 =?us-ascii?Q?Bl/KRUMsq8U/dPSefH68RSZUEamq4j73XLC6rIGs36TJKN5WxrsYw3/lbXi3?=
 =?us-ascii?Q?6NtVNoCm6Tf+eLK7CFCC3dE9FkzVheI+ZITmiKcnJNgwj1ZHUzIvF8zhCe3b?=
 =?us-ascii?Q?J2OPbYlrzF9zA7Qn/sebodOY5cppmkEwQhDPSh5K0qwUm66DzQWotjBqhYpv?=
 =?us-ascii?Q?vU2m496BI0vlAo8XwOKEyMF+f4OSM5yvJZfb4cL41ZFyIbovooZIzgkR90Kq?=
 =?us-ascii?Q?S5eSlR1RXV7e9+/2HT1pao/yd7heVXljBL8Tm/Ult9T1PvWS2VZ9OBG3vanZ?=
 =?us-ascii?Q?Fb+ah3R/ofmVr2FCYHRrKNon5Jfdc9DCTiT9fc6ckHUHnyR/2sPoomEhILC5?=
 =?us-ascii?Q?2AeDjaiDlopazn502JHP6EWxIEq9fkDAyPxzGrWKuVLz39XfvE94rqWPsWAL?=
 =?us-ascii?Q?/beUDTreYNOFBsCbWTksBJ7zYWo+uabNQcPlXM+N11bu0nn6ADCRoT75zNR4?=
 =?us-ascii?Q?kHDEJdskvqZI5e0pGZTFwynbKDbMuNy3Pgmw/GT0PqbjXfyRcA=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae17d1f-9ca7-4771-5d32-08d8d7a32906
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:31:44.0022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CfV32aaRukJxOjM0dVwsdfLZuKUMKpLd9SXxZw5v+e3wsH6wvrKTYDfIyDUmJWbzzb3hnxl7Pb2B2AEunsMRJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_213149_965930_1C258CAA 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: "peng.fan@nxp.com" <peng.fan@nxp.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "pczarnecki@internships.antmicro.com" <pczarnecki@internships.antmicro.com>,
 "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/23 11:19, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> The rest of these are alphabetically sorted, and leaving it this way
> causes a merge conflict.
> 
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> ---
> 
> I missed this when reviewing these patches, but happened across it when
> test merging from Linus' tree.  It goes back a way so I'm hesitant to
> rebase this one out just for cleanliness, but if I have to go back that
> far before sending the merge window PR I'll squash it in.
> ---
>  drivers/soc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index fa7071246546..34b23645be14 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_ARCH_ACTIONS)	+= actions/
>  obj-y				+= aspeed/
>  obj-$(CONFIG_ARCH_AT91)		+= atmel/
>  obj-y				+= bcm/
> +obj-$(CONFIG_SOC_CANAAN)	+= canaan/
>  obj-$(CONFIG_ARCH_DOVE)		+= dove/
>  obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
> @@ -29,4 +30,3 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
>  obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
>  obj-y				+= xilinx/
>  obj-$(CONFIG_ARCH_ZX)		+= zte/
> -obj-$(CONFIG_SOC_CANAAN)	+= canaan/
> 

Yes. Should have sent that... Thanks.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
