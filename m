Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3804EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 02:00:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A85265279
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 02:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A85265279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=UwPk8Gn4gw9EIG0aekRPabPOrcwe8vuC8GpBSHwuT3o=; b=qZp1W5QgKWcq6WtPO7yXMepS7
	IW07vEumEb6fRg42mWI0oaQ6nuH4DJ4lOyMVvvz5WUIdBzwaktDOGJbGtYpw0IiAK9QXs1xg/KDIw
	DpXHZbhgarZzYEtIlARHiPn07S4QAF1G010VFZfsBtnsI46TJMYTj7v1BqYKPsaI6hbnG8lopnAae
	l+vjs2SKSAhDbznY9oCs9RbrxJr+aGXaIMIJ9CRYSyAKGvPJvJSXnHd7zmmb0UZ9YgQFfVtM9XMsZ
	PDQow3MYgRCwpPWxbr7RrwAQn33gP//TF3ZvWeQPzcwsnSu/zalX0hLOky+h5vlk1ENHxl5QmDjRq
	jTSz8wA1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJRfA-003cXL-3n; Tue, 09 Mar 2021 01:59:56 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJRf4-003cWc-Mx
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 01:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615255191; x=1646791191;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=ychGX+bnZ1wf1rr3Alq35763Z0og+YVgCQPv4PL149A=;
 b=feyqWlSzkOFgpnIEnytEjmuQzZawtJfRwBisPLHmVbzs6KHdTFjKhb3q
 X8b7NdtNVsbO3uQWHgDQ1pFJgR5JccQEdnm5VO2tIiiNFzDutG/8GSUkb
 RCzf7w0b/KKbw4zPg/z0v78oferFCmWnQYB0+oHLIq38mljd/hLMWBK51
 irKAkVRbjx+50QVskJZsfoS5MIRhUARcUm3n3Ehb/nBni25tcK6UC1fOr
 U5KrbCPZxXw9cOR3IuAbt6jnlKwhT4UVkl7CXgWOTQrYDueyUjXOiKROi
 ++YE73kTnqpNWMrhl6ucmLhm5GquQh0Av7P/k9ksm7ls6VD72PmxwVSZz A==;
IronPort-SDR: iB7yQEpaaHQ9+VSMuZ+ttaxJtlx6H4nDir5BESen9j44raQ4HwVyrAN8DdsmSiULHv1FOWCAsX
 N1ZbbxxTi8s/tWBVFzraTBPk8CxifibI/Sc8wezKHR8j2ni/dC+R3xsq/Fcbd3zYTPK4noxVVQ
 T+ZteDoQJysxqotFrlfbpeCcuh1OkyYYeehRYXeWfdTtvMkOXDSSt+FMBJ8hcA7+jLvyaJrJs4
 EzuU+wb6MmnLAkX2FrnRH3aR61vsHK8yru9s+NmLQ4DV1ZMEvv8mPmtzejc3LBb3kGumof4nlw
 xv8=
X-IronPort-AV: E=Sophos;i="5.81,233,1610380800"; d="scan'208";a="162830547"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
 by ob1.hgst.iphmx.com with ESMTP; 09 Mar 2021 09:59:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI7e18eFGTi9XLXS0yayMVr+6VuNunIFY09DI3m5uTrmhAzN3Y7u7S70jnosbnoVDX+g1b4CH0pqHQnjJTLzgXG26ry4frggkaJ4Wvir1RZCHUzT+wvVUaXui8fuIJ38NFkCobsbYYIrA2o3TSaUEGT07EGNMP9Q376FitMitEx9kzIN8H2Yf1iAF1NhMhKTQNQ14HirQJfbv9IW/JEc65E2kw34y4ThASSjmcTybHMpDPJdL73nrkAVLk+aKSoWzTEoCsr+HwhzryuRMHWdplNvjHkdAIQ+KV+l1gFb2VqmCnqXwLMRaSlSLh0KByQCFCTcqCZh9Ae/TuAezqu3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm3AxgVL4WYdjqKGxLsDG3gMRMZP6gaAfJIifyl4v7o=;
 b=NzD9wC9Xw1g7275HaGJHv8x8tXXaUoBcBt4YVec5fwCotqRCMHCL907lTnZlNsAmiJ41T63d7cADN8153vrLaqu1yKDKplu90XzEfK5I9a389XXXUp7COc0IEWSJpdy7/q5vrJ68YGgWcUXGkHtpXI3HjgwvwSeqRDkb+05TxI8EHeu9xR39RkQGGYrTwfAgmB9tzwXATNcKLYycS/yMJXWs7ZLJf6E1u4Fvca0kX0CSQ3EFJdvwoZgNIuFSDSoN8APjloS4nhrZKUaHkXcyzF05eu3a4eLiAA5eLnrgkohl6HfaH7qYmnThWdeN4GcFzZFFjPvQGPJK9cmcc96b4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm3AxgVL4WYdjqKGxLsDG3gMRMZP6gaAfJIifyl4v7o=;
 b=CMlhhxWFxd9Gmr1iRKnitGEnsB5PCT6GdJ1+ZQiK/dn+Yzzo7FW2ZyJh48fxVQuYDP7oWgH4CpLYaZdoknOBv2MyDcppBiV8yipIOsIpVqzJdoVBOW7fqutGjo0+j0C5DqHHeTKLOz6U+aaxHRo6TdoOmaa0NnlHngfE0r72EMs=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6515.namprd04.prod.outlook.com (2603:10b6:208:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 01:59:43 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::e9c5:588:89e:6887%3]) with mapi id 15.20.3912.026; Tue, 9 Mar 2021
 01:59:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vincent Chen <vincent.chen@sifive.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "Frank.Zhao@starfivetech.com"
 <Frank.Zhao@starfivetech.com>, Atish Patra <Atish.Patra@wdc.com>, Anup Patel
 <Anup.Patel@wdc.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "alankao@andestech.com" <alankao@andestech.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
Thread-Topic: [RFC patch 2/4] riscv: Get CPU manufacturer information
Thread-Index: AQHXE890v2l8U/a0jEaIFZCk1pLShw==
Date: Tue, 9 Mar 2021 01:59:43 +0000
Message-ID: <BL0PR04MB6514E563EE2CF6BD00919971E7929@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
 <BL0PR04MB6514006678BE79B275DCE744E7939@BL0PR04MB6514.namprd04.prod.outlook.com>
 <CABvJ_xid8CoOV5p4aUL-t-wzj_h6cXB+zOJOGsKm9a1+ASFewg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b5c2:5e8e:bd4a:dfce]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5b36e87e-033d-4c80-50e5-08d8e29f0214
x-ms-traffictypediagnostic: BL0PR04MB6515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB6515CB2206A9C2CD0D3C6D9EE7929@BL0PR04MB6515.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rw6LS217c74qe9QWqxIgzrIYBlDSjtUth8TslPHSX99SB+Vk+K3eT7rRBzSD5AIc+I/568gImevJxHXnzKyZTU/Zs5bsRTH4ipXROJGT2o6k/OGZd6I9YlkfcMqR28cYM5KZoYnjW3ituPmg6tPwjMINx7ECFcRd+wIz7uhlr6e8RCyzeA5lTGW0kQsE+aDMuJe4/jvExFqiUItEPXvLG4GCOY0mzOqJhQWN/BOrFOu8AYx32te9UPHcOm4fxw3dJ5072rtIdz7IAbCagulyHve7PgalU8qokHsRII7NFbtqtF4q6kxyl3/JBO8nTmG63cZ2nqxMn+lV/bFDTIcHpRiNJ8QnODMP0mVV44W3J+lnRxY73wxV9DJi2Vs3psjxli4X9DlP1sg2VUY+3qO3OEkvR+iJNv0d0q5MLXa6E+KNkbJWsY9Ro8ohum5RUfipMa7PctXw06JXbzFFCC4ofNQJDxUlsrzRON76zwvGBcdlGN2JXna5o4MXPJ9rULEKIZQIMgGZDW2CtDlxEVpNWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(8676002)(6916009)(186003)(4326008)(2906002)(54906003)(66556008)(8936002)(76116006)(91956017)(33656002)(9686003)(55016002)(64756008)(478600001)(7696005)(5660300002)(86362001)(52536014)(66946007)(66446008)(83380400001)(6506007)(66476007)(53546011)(316002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UAC5iDfUmnMx+nQWWBLpjygheiGcvZ01ZoxFIgaYHFSuJWgwOySVWpgEhVFo?=
 =?us-ascii?Q?D8K430+S1Z1ZbBq56DbaPm/H61lzrcMoyRTIgnwLZngokgBzs6O48KZYSQ/l?=
 =?us-ascii?Q?r33TISlnUFUBEvgoPGdCEbOGAXYiAL7MMBJCh4LnEkhICQppZk7Ty4vmibTj?=
 =?us-ascii?Q?h1QtqDMNtc3QcihuoaNS7N6NEUYqj71G6waIekLI0uVwB+x1KqB24uRRu4ch?=
 =?us-ascii?Q?tXRX0m9HfeKAzPZonQnJRgCNGrm4Z/NYNz8+Qvjxe//kYi2eO0nQ1yRZWZZd?=
 =?us-ascii?Q?77ezhrWSEIMd8vP01EbAEPFLTn4uvt6jPOqZN1AV6bSUUGpf0njfcBTTT/Dc?=
 =?us-ascii?Q?7tnzA6DXE9n6VqV+S6EtwKu6KzV+vL2ySjZcLeOq1f/jpVDTPOW3M9eKigK5?=
 =?us-ascii?Q?oJzph6Am6f8Hu0UTORcPeoWWeYtbbJ2Oy5e1xDNF8ErCXxAzms8wwqJPGVCD?=
 =?us-ascii?Q?7ShtW187p5MVQSlRE+2BDnCrtjJdoh+LXCCYAGHkR2OkDYDvJxqajheQtLZL?=
 =?us-ascii?Q?XW+RoJwu2t6rtimCm1JPB1yZvHwo/IumRU7u/pysHWSjPLFI9ImCAyDNA5k1?=
 =?us-ascii?Q?rgH2N3quSJlTHSGkWsA9Io4yh+NKvzAN54rWzx7R/KJUMLIwoadU7RyouYJZ?=
 =?us-ascii?Q?QJcDd+AgEgiJF7mkdPohEtwBWt9jmb1VpGRZpEmKhhqWInU7mJiAlY6Rt7IL?=
 =?us-ascii?Q?Rv4LIEWGTuiMd1F1NRL/r/uTUkvv35RjCrSZtCsy0ldtxc5eXfeq+n8DpEjt?=
 =?us-ascii?Q?iR8z86CKlA8+zcYpwJTVzSM1L1yzEyFZl8MP62gj+CYgHoRQJqUP2EUxS9mA?=
 =?us-ascii?Q?Rdc3oTbgWvpKVqs6yUHrFPPPPn0VKT5E3zzuhTZiKrItVKw+pPEMwj6oLoWC?=
 =?us-ascii?Q?Ff+0RW9jhJbINNezRJn/VcMSDIwo05awNGa9/stEVLopNHrduGqZE189f4Y0?=
 =?us-ascii?Q?q/yqYB4LKSSUPtSWw1BiYC5O0kt0L8XTN0LxcVNo6IqQ37PFl0Bx/axVFbbQ?=
 =?us-ascii?Q?voB8GbgFfzp2b1/CFs4JCPHjCofeqNQAmK2tvjU4kTORmdpDEEbx+g9FojdD?=
 =?us-ascii?Q?MWeNTozH8/o6x70dACOihM3okdD9Ekq7O0xomMxwaozmIAO0eMZMv3/edqDu?=
 =?us-ascii?Q?liDPR02u/umRq9r/GJwnKoevm+hwDL1rocnl7rYS9CzRNGUArl+rAbZ/phEw?=
 =?us-ascii?Q?ZBne2iWnmuBN7sa0tt3Zrv9+5r3mLPWZgesC/sPiZ0o7ThaXbHxv2EAFTUAj?=
 =?us-ascii?Q?n51un+Oj9ZYFPv7j8EKocarAOKi6zyngqSQ+DbZRwiUcZi3DGHZ64smio+cp?=
 =?us-ascii?Q?SYCrxOknJ7mhavmw3xm0HbL/iK8S/K+vXGHT37dWTf0lV/j4FmTljgScQvaH?=
 =?us-ascii?Q?0KZFNLqSd300Lh3qUUif5eHb61gH5W1/q9spymRUTtizVLhdMA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b36e87e-033d-4c80-50e5-08d8e29f0214
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 01:59:43.4741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgaqeb5v1E18EMzOsOT5Jmwwkz1sZBZNQk+0Zp6Mj98hlS5C588C9SNHcjMUIN1LyCGXvKu/QEDnDBXJn6puLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_015951_351068_347AE029 
X-CRM114-Status: GOOD (  18.18  )
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

On 2021/03/09 10:25, Vincent Chen wrote:
>>>  #endif /* _ASM_RISCV_PROCESSOR_H */
>>> diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
>>> index f494066051a2..03dee6db404c 100644
>>> --- a/arch/riscv/include/asm/soc.h
>>> +++ b/arch/riscv/include/asm/soc.h
>>> @@ -10,6 +10,7 @@
>>>  #include <linux/of.h>
>>>  #include <linux/linkage.h>
>>>  #include <linux/types.h>
>>> +#include <asm/hwcap.h>
>>>
>>>  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)                     \
>>>       static const struct of_device_id __soc_early_init__##name       \
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index ac202f44a670..389162ee19ea 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -12,6 +12,8 @@
>>>  #include <asm/hwcap.h>
>>>  #include <asm/smp.h>
>>>  #include <asm/switch_to.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/csr.h>
>>>
>>>  unsigned long elf_hwcap __read_mostly;
>>>
>>> @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>>>  bool has_fpu __read_mostly;
>>>  #endif
>>>
>>> +struct cpu_manufacturer_info_t cpu_mfr_info;
>>> +
>>>  /**
>>>   * riscv_isa_extension_base() - Get base extension word
>>>   *
>>> @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
>>>               has_fpu = true;
>>>  #endif
>>>  }
>>> +
>>> +void riscv_fill_cpu_manufacturer_info(void)
>>> +{
>>> +#ifndef CONFIG_RISCV_M_MODE
>>> +     cpu_mfr_info.vendor_id = sbi_get_vendorid();
>>> +     cpu_mfr_info.arch_id = sbi_get_archid();
>>> +     cpu_mfr_info.imp_id = sbi_get_impid();
>>> +#else
>>> +     cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
>>> +     cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
>>> +     cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
>>> +#endif
>>
>> Why ? reading the registers will work with M-Mode too. It was there before when
>> we temporarily had the builtin DTB lookup based on vendor/arch/imp (see defunct
>> soc_lookup_builtin_dtb() in 5.11).
>>
> Sorry, I cannot fully catch what you mean.
> I agree that reading these registers will work with M-Mode, so I used
> the macro csr_read() to read these three registers when the kernel run
> in the M-mode.
> The definition of csr_read() is here:
> #define csr_read(csr)                                           \
> ({                                                              \
>         register unsigned long __v;                             \
>         __asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)        \
>                               : "=r" (__v) :                    \
>                               : "memory");                      \
>         __v;                                                    \
> })
> I guess that #if"n"def CONFIG_RISCV_M_MODE may mislead you. #ifndef is
> really unfriendly to read. I will change #ifndef to #ifdef in my next
> version patch.

You are right. I totally misread this :) It was my morning and I needed more
coffee ! Apologies for the noise. This looks fine.

> 
> 
>>> +}
>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>>> index e85bacff1b50..03621ce9092c 100644
>>> --- a/arch/riscv/kernel/setup.c
>>> +++ b/arch/riscv/kernel/setup.c
>>> @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
>>>  #endif
>>>
>>>       riscv_fill_hwcap();
>>> +
>>
>> Nit: I do not think the white libe is really necessary here.
>>
> OK, I will remove it.
>>> +     riscv_fill_cpu_manufacturer_info();
>>>  }
>>>
>>>  static int __init topology_init(void)
>>> diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
>>> index a0516172a33c..58f6fd91743a 100644
>>> --- a/arch/riscv/kernel/soc.c
>>> +++ b/arch/riscv/kernel/soc.c
>>> @@ -6,6 +6,7 @@
>>>  #include <linux/libfdt.h>
>>>  #include <linux/pgtable.h>
>>>  #include <asm/soc.h>
>>> +#include <asm/hwcap.h>
>>
>> Why is this necessary ?
> 
> I forgot to remove it when doing code cleanup. Thank you for the
> reminder. I will remove it
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
