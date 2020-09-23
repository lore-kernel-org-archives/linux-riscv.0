Return-Path: <SRS0=huAv=DA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B127BC4727E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 00:28:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F912085B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 00:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vo3gOjen";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Civ7fDQ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="OfF/ZP8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38F912085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=jpfQJnj+XXY9dA6wSYY8zFmZ9UUXn+B97crglsjWZ1w=; b=Vo3gOjenuAodhy7eyMe3yg1vg
	1uk5My0FwgqNJa3Fz8rxEd2FvpQnAGFIYTU0TbEkjJMpciGRLOqbi7xhKLBTSZSdFrlst0dUR3qbp
	VbGgoBHWP8HBHOjOJIwoyzW/fGA/rh7Z7ge9/PK0LVyT1azKDPqkQu7nyjPK063Y7BaqfnoZD7d/b
	tCxQWxpN62jmmq87wPojuUtUnHxAJ/Iqb8msDjSDtugfZEkbLm0028a5VkjBbN0tUp6bQ2YrXAg35
	+ysMEVh8S9Twqglw3YIGUbxRh2+LCBhpZ2Kvn1njvbmTAwlta9MMU5zp2/KTl254MTzrrWnhm2Kox
	rAJQOTeiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKsdT-0003gR-JL; Wed, 23 Sep 2020 00:27:51 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKsdQ-0003fI-R1
 for linux-riscv@lists.infradead.org; Wed, 23 Sep 2020 00:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600820869; x=1632356869;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=F4CZK/JuOSq9IWHN8+/h7kv/igPrBlwEmNb6BSXPVm8=;
 b=Civ7fDQ3P3WcOdj7TO9tTs19tiYYSUlJSbBfywwHaigKguJIHhMCJJEB
 T09Epce8AAWIHbzomFM4c9ylkV11jWxHZ4BpmcIZ98GL0Pt1KbWN6MEjU
 +mTuzuPqv70eetG4p3NjOTF1lLmdEt8u2Avt1xHSDku1hQP+6AdDxAqZy
 TzkfeP+D2k/ECdVLrlpOHfKcb+XC76pfSxce62v89wgPPqf4xs+erzE3Z
 r0FMW9/LatuSi9OuM1tdI+9M7lo2LgmQPrzrTC0TiZmGaf/51jLG9OvsG
 PQdioW9dFXYhoO2lpOVv3ISQfe50+0uewFJVkcPnF3PHXhlLZz7O+LwlG A==;
IronPort-SDR: pi0alN4S+u2c4lzqRoOSEevoVYcQ2eltmlI7eUp2haEPTJhObtcVeTNcuojzz9cS1MTUWUkdDp
 yh3eEXJXgWupcIzod3xsB0AXksUYexh317dOHj27vVoepFnH+pBqNJtIRlbeo7gGyUrkk0b8In
 W3C3qk5mTFMVx02gE8epLRqjTsTuaSZwt//EgimesmanbAqRTYSAYOLBJ/gV685aGwDokRFaO9
 Frj6SobiI+uNdtMMw2XhfAzOrqL1zzWt/zdFSmYotncK2HR9m3u5hPIIlFiMtyk0nX1VVfivu1
 kLk=
X-IronPort-AV: E=Sophos;i="5.77,292,1596470400"; d="scan'208";a="152405983"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2020 08:27:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzHhkM12F3ml2mOVCsXf1Pm9RxSdWFmumw0JQGsZ9MTdGoFj0MUXgbLBYokFK998cq5omzH9qlVYCJ+zSTats9HHL45e87/r9ALJ7wYfboSYDjaRKMCpgSlO/w9gDRXELQNn/d9VJRHNUMjHJ6vwgtJ22dE8zDlDq6Kf5tgzrcP7SHLAWTv4YFnc6NKz/9XSfcmxLOgd7M6z+61ekoZVLRpM0M9WFnDhJJgOhTTbr5Ws5/dYd+zwwL1v9nklOamwV1GrknqwyQ7/NCxs/b8aZE1RbFbG+8ttfjEnGugmOvdUivCmGzz5rP/Y8hVMxFlX8TbWbjbuiL8pNxEZa7cSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/UhHn0L3JF0bFKT1wRUHHPOe89fnDUItWqnpJUMKe0=;
 b=jf5t1AS+Oy5kKHD0XsJ9UNnHK16M53R3PT5AGfO7/1ZtEuQzuisS16FNaf+orZikwyUbPwqIBuKrGXAtwnz4qOAFGuC8nKFPa2UtFG6wu5E3k7NTDZ2kdHJVFHDcX7LGwHY3uRb09WHAec4dLVy/9eK6eoft1FZQEy6zWnYRQcKJez9xBwyK0RIXodc10rJQwYK59ELJt1PqyxVLRxRrOZjfGI4rNPFRgRuS0eNchq/M1dh70yARNGA4T1n78AEHWyYFB+djGUdVMVfg3DF3t3cOiGO9VCnbXp7M8mQEq/tTVGlzGEVgV0VAADFMICBptstSIo1WfiYofRLRMTcavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/UhHn0L3JF0bFKT1wRUHHPOe89fnDUItWqnpJUMKe0=;
 b=OfF/ZP8SBDJpIdgHcrpVXCSlte6yIxdjOHsoAHrhvSJfbg0PQC25vLUuDO4PJv+icYbIUO9a8ocjr1JvkpzJ3X4b1GCOZNj7ZjPzPQqtMtQv9efbxkwacLG4Ty0HWkM8vodBmDnYcPjZVnOdb45HwNLZqrnc2huhggcJtdaLElo=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0968.namprd04.prod.outlook.com (2603:10b6:910:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 23 Sep
 2020 00:27:43 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3391.024; Wed, 23 Sep 2020
 00:27:42 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 5.8 20/20] riscv: Fix Kendryte K210 device tree
Thread-Topic: [PATCH AUTOSEL 5.8 20/20] riscv: Fix Kendryte K210 device tree
Thread-Index: AQHWkCU53Yt83wGZ7keUFBY/2Egj+g==
Date: Wed, 23 Sep 2020 00:27:42 +0000
Message-ID: <CY4PR04MB3751BE40C3EC0BD2F392E9EEE7380@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200921144027.2135390-1-sashal@kernel.org>
 <20200921144027.2135390-20-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:dc1c:cac6:da47:3b6b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16895b07-74c7-49cf-dc1a-08d85f577c8b
x-ms-traffictypediagnostic: CY4PR04MB0968:
x-microsoft-antispam-prvs: <CY4PR04MB09684CDCB73D40D098B39EDCE7380@CY4PR04MB0968.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrVsM8C9eoXaahcQCUDzYo+cksumtuWEmFC5bOklNZX1J/gYUeGCBQczlbzaG2GGV/WwqWhAXPjaAEkzIJkneHJrLKsZpCcg7srYiu5Clr5jHoRG2fmuk1p2eVIB+Rx3pFmMYNVJF2ibbbRdGBAdkTQ4ZsjSYfx/KtfoE12XbmwowVJFIjzkrHFu0s9RoGQEAwjJMzTSaELvkkGaegh3DMt3HIL2/VJ0viUjHbjSU9oqnA7ACHpBsmpJMuHT2SpoqNX6rI42Nkh2RCp2PvTtwkk0BvRrzEtsDI+8Slf8XGVA08KPvZLvaPKkoHGFzPyxV46GubY2uz24Y6NmwjWouGAgIAIsEpx8pXHitE8pXso3DkhTslCbIcvrOEIhxFQB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(76116006)(66556008)(66446008)(9686003)(66946007)(64756008)(2906002)(52536014)(5660300002)(55016002)(33656002)(53546011)(86362001)(478600001)(91956017)(66476007)(8936002)(7696005)(83380400001)(6506007)(4326008)(110136005)(54906003)(316002)(8676002)(186003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QfKBrDPUKPFASs1Yi9neGRTgMxBXHCF2hR0Ba2xrWHEMSV0kAsqpzCNyaGl/40oP2+WsBZsPodPSFw/QGg4uCnm7lT8kyvsRriQmtQMTeK4arLiAZwPZDJqI+LWJyELZ/91PL4YCBsKqhD8kaY7eRTXlUi0n0LIz5zJjCErQJE6Fk/Z7jHzEM8S8oYbioE3aZvJQK5JmA4+PmbIoGEBiO84mhVyLUPlh7XKHRy+R5ITPXYCuQsccw79/w/3RBu1T5R4ghuAd85iF9uA+mMeFS1AHTWC5KIZomA4LnGwLtumtqfy+kZkTA3wie0s1seQJmiHALZMvF5CHRH+jSvzEvOidkFxGGI7dpbv2jqDMeYHomJ9lyvXGD2Q9SPuV+ol5M/bhPwZKdwhyDJa8ZdvdsCkB5I4kRGsaTbKFoSxIVqT4WBlF3e5Uovoq2voMwtzWOZeqtFnMj8WzrhHNHOh7B5LCi1LwUOD3SSkcSWnBBGiQDnyupeKZi3vQvkLFJHLXhMFn+Sw9/ZE0M5C9e6jlWqW4intGw9uFk2r/wy/Xi/lxvP6d6tXnjrXPgknsgIRMi8wikyPB/V8tq/AQsiMfaAI07l7dEmYTAQYucyp0Xa2xGSi6GTANHzm9EyxQjVDtZh2Xr8Uo/gWHpXBuObKwiFrriP/ZkYHTdzdd67eGy6PtqXFwkf0D8VvMsA3FoOwuVNf9D9gfq9PmFCRVWxVgzQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16895b07-74c7-49cf-dc1a-08d85f577c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 00:27:42.6230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wDChNX9KNFM0OWBSh35Ua8GXznxxyW6IRsgTOL7MRStf8ZQ/g6IyU/+1KUEJt3tjXjcSQ1Zuj1fPEo2ysb+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_202749_226894_E1F71445 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/21 23:41, Sasha Levin wrote:
> From: Damien Le Moal <damien.lemoal@wdc.com>
> 
> [ Upstream commit f025d9d9934b84cd03b7796072d10686029c408e ]
> 
> The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
> (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
> inline with the sifive timer definition documented in
> Documentation/devicetree/bindings/timer/sifive,clint.yaml.
> The device tree clint entry is renamed similarly to u-boot device tree
> definition to improve compatibility with u-boot defined device tree.
> To ensure correct initialization, the interrup-cells attribute is added
> and the interrupt-extended attribute definition fixed.
> 
> This fixes boot failures with Kendryte K210 SoC boards.
> 
> Note that the clock referenced is kept as K210_CLK_ACLK, which does not
> necessarilly match the clint MTIME increment rate. This however does not
> seem to cause any problem for now.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/riscv/boot/dts/kendryte/k210.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
> index c1df56ccb8d55..d2d0ff6456325 100644
> --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
> +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
> @@ -95,10 +95,12 @@ sysctl: sysctl@50440000 {
>  			#clock-cells = <1>;
>  		};
>  
> -		clint0: interrupt-controller@2000000 {
> +		clint0: clint@2000000 {
> +			#interrupt-cells = <1>;
>  			compatible = "riscv,clint0";
>  			reg = <0x2000000 0xC000>;
> -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
> +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
> +						&cpu1_intc 3 &cpu1_intc 7>;
>  			clocks = <&sysctl K210_CLK_ACLK>;
>  		};
>  
> 

Sasha,

This is a fix for a problem in 5.9 tree. 5.8 kernel is fine without this patch.
And I think applying it to 5.8 might actually break things since the proper
clint driver was added to kernel 5.9 and does not exist in 5.8.

Best regards.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
