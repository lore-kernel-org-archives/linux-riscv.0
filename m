Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AD3C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 00:12:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4813D64E3B
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 00:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4813D64E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=yGcjWyIOtcfFBGXuaivjZnn7jbGLbctfY4rNc14Y4g4=; b=cMXCsItg6Va/se0qFlto4SCww
	K9mKcrccHW3B4oAMxORHeIGWLHUSkNqK2QB36sPj/tKwkp7cYk6s/OoEJDL8uKE5GkgNUecIPVBzm
	TXpGW/8yoa6TG64ThTYAS26zHPGiglWWB+ZygdVUljVdl7IJe5z3a+A1+FX+W0zwb/9CKwywQ19JP
	sBtNYFVd0zDQFnggkdZGRJwlZGT2XTMmA9N0TU+J9PQ/3Eci53UIHrDxjQSu8lKofafv/3pwDzk3i
	FjtLjlDGSw44Zdozpi+jRcINOUX4F9ybHlnW0QJqPcQ+IyIDqwhNeW/dLEaH2YYjEuuQhYzKdLjgJ
	ox/YE7VmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Gdu-0006vm-BM; Tue, 09 Feb 2021 00:12:34 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Gdr-0006ui-5F
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 00:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612829551; x=1644365551;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=rO/aF9n4fxH00COtJzMqKJoYnsKc6I8pfyjnydn4vEk=;
 b=el1V/CLLKFZtuASdAHx/HjhB6AkAKExKGKJcRy6dLRUr0j6zstSsGOgE
 s641S0nlo3nyJv+BCQ0k+M4MoTpur530sKG7rzez53nJQkGslUMgGTgW9
 7PIAfer9RgtQf2pWlYDXoHKm107Fwl3c7GZKlbZOjXwCdHlLVCNIUkVSO
 bvA9bpT//BLADz2LNdJWFFEfS5OuQJ9/Wb/cLGT1CAvhwBvZ6L+huz0Rl
 mb98CS/hpufQiJsvEFaDU84Gn9rpINFJc9tMGf01hjJoH2nz/95xKGLwN
 6JXRrGQvQuyXcl62z1h5KqUV1Tz7lrC9DfDW32g2Ygy9Qv0eWkAZTn2oz Q==;
IronPort-SDR: MrXtvUP8+UoZMXx11xymA+u+1oVgcU0bFax11u6YpyECNlQ0xBFaOxHxihLBiLZvSlWjlPp7WY
 lH0NswquC41YjBTDa3Yd1SIJ6VBgZxnTrQpPYXXoUqgv45xSIPt00x3O9VbGOQD9sCp03tGF03
 UNcSg9Z860d1aPw8gTMZxWynncJqlbVQtNThAsZmeFbchUaopfLe4T72E2IGGFr4Mpk0gL5p5X
 u/S37c8P1WLwLKAfNqIgrYYJrFrYIeOW0MYbfKbLbZ0BV8+sDLR38Yh/r41fb6rPgMftyRm85N
 nB8=
X-IronPort-AV: E=Sophos;i="5.81,163,1610380800"; d="scan'208";a="163947997"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 08:12:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI6itkZfkFBcDiPgSBSA53Z5H6jLjfnGmyFcrJ4mP889XNZPz9wCNLAHZGlVnDXcBtATAWL9Qr6MgY/Bal98P/zRj9UtvP5Si0H8jisqICvvsv2eHXYSCkDw4h8HAajnj0+9swiC+ysuoS7aOQs2L7nI/UzGdA6macTlAov6Z9tsdEFxXaELDil4WVZvHssFZA9TIY5C6smcIqJlQ3yEPd/yJvtiyRwWJOlfuXR0AbxOGiOOGR0Rh/MBJIHBHkRZjsqlyrBTNYdGm3DG5GICIEJ93COpBbamMjgz19BuWOums1HbOAx8/4/z9FwL2y7IB+dNj1+Rnby4482wTvr1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZotScWMt7wvaCT/hhhY0zfPyqf7EcpaBtbTyVMtr4mo=;
 b=mB5pige70FcijXBREoCnvo2SOfcH8hE7rAV9JavZeCda/a6XkjsvCjCYaI+tcRk7Xit83zfJWyA5FkO6E/Db/Jt9wX3pSWEc7Y3iYTA2MbtaRbcbf2vx8PUtpvdyehtTJJAHV8R6ThLTsR4yG6clwyy7CvVbd01ecJu+lN+6hDqKExLbUzZRYe3qDDoFsw5SMUIVpJqZhuhrqAZ7JBilKq+O6zLPvs22LF8kOepKVTb/v0oXwoJl+yTzGM0DEQ4v6ZASEOamYKgbnusERAW/bGhH8KG4rx+Y0yeI0HQaC+L4/IGu8V2RQvFh2rpnhidiifN+TeNtS9sY3Q0g6HiZrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZotScWMt7wvaCT/hhhY0zfPyqf7EcpaBtbTyVMtr4mo=;
 b=G8UrHMxGR/JnnLvYieb7iF/rTRkUPHoYIeSN42mnIOLRziLcP7GAJFyiuz9B5YtQm+iI+M3Z+mQxJdG4uiIl9y6fbYbpnoMb36D4dJblDpZgzl50gKflTBxXR/iQRwjOcLDQZldq0BOthGtJUVVOFBqrJLNwxOsXfbVO/2qOR4s=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6672.namprd04.prod.outlook.com (2603:10b6:208:1e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 00:12:26 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 00:12:25 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW+4xeGC09t/jMzkSSVnIpB80beA==
Date: Tue, 9 Feb 2021 00:12:25 +0000
Message-ID: <BL0PR04MB6514520081461B1E1461ABA3E78E9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <aab05bea310fbdbac38990656647dd0fbf3c8323.camel@wdc.com>
 <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
 <a924468e-9d6e-d66f-403c-77d7e0422651@gmail.com>
 <BL0PR04MB6514747C7AD8FA7E56D61CB9E78F9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <e451a093-a37f-6078-d158-965b7fce4ebf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f420:fabe:ea5e:e152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79200ccb-490c-44a1-779f-08d8cc8f616a
x-ms-traffictypediagnostic: MN2PR04MB6672:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6672CC316615636E0C5B48C3E78E9@MN2PR04MB6672.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zxXVmQWKwzp3mZZYPyQxvkNti6t3jUUDldYgBn0S23IEihoiBumkzIjMifV5yCm+1dwvvD/ntEsSoqjsIIsxNTzuLlDZ5e/hmr0yLSAVIdijju+Neq2+fzjLRaPbpoTQbyq3zkANW/rqHMU9Eu4YVVJ1z6VkqmSw2VDzoGoUweIFO+wU3C3USbosjW8ljwx7hTcXLnTIoJrPhsVtPFjvfiqgXB0cT+xQfWqORVFY0hNczqbwoplMvprsz+cXABB4y/622om8VNKFDvb8KMiL7fjWKTVw2YppWu5K+QHig/x7UTAGCgTYhrdPzhpMoeQbgG2ECYdVn1/4sdUzbd0Olw8NCS+eNnzPUQf/Nvmm97a/Xcn3wrzafLctI3viYEV0Y8MtN7MN1QGKFqU9LDz009BjkhzUAaSCvMJgwjJkzurtrWZ2q5vb+fQr89M224gCoAuSc+qCRGNBbm4Ay8Qrw66GvrbTUOFcROCm7oSvs+hCcYQ5Ttp2bBNa+oETWiDu+Sog7iKcE6hC4UXcXJ2Y8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(4326008)(33656002)(53546011)(6506007)(83380400001)(186003)(478600001)(7696005)(5660300002)(66476007)(15650500001)(9686003)(2906002)(8676002)(64756008)(66946007)(86362001)(316002)(66556008)(54906003)(8936002)(71200400001)(52536014)(91956017)(110136005)(76116006)(55016002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hpzSQ2VszRdsfYQlUecnPntSEND4Uz95g+XZSmkZNdYjV/L1IyHg2zURo7dN?=
 =?us-ascii?Q?GkJHCETpt8TNwB83m9vMryrj2Y2qv6nQkuX7aZttu004j7NzVc3ov/vHyiVW?=
 =?us-ascii?Q?3Tg5C+VFLBIv3JiJpNoB5+RBQimBgglqJT33T1XoMhxK7rx5NdosXAvSPk7W?=
 =?us-ascii?Q?jbCWdtNi546B1wiCVkyUn4XDlYUR2UDsC06ztKUbvlh6mZzwL6BQNZf+/do1?=
 =?us-ascii?Q?pF6w6cbuMwSvfZyXs+KwjoL2W0sDF6SJjfvN1jv31kk0MHle1y5qwiWnTjYI?=
 =?us-ascii?Q?EtSL6hHjt7eAEArM3RxMw48KnlEWLI99PSxdoCR+VRvxFe+VTaxXyzgdpBkY?=
 =?us-ascii?Q?zzpZj421QiWz8UiqwL9uLZv8Wmb9nyFaH1FLlAY/3HwLBmj8sSbwl+XoTQJg?=
 =?us-ascii?Q?DD413WDjEY0H0LNDrtyM0/tVFLixokBgeVMV0SZ93B7yy13xvkHhDc62tXxO?=
 =?us-ascii?Q?W/Ltp6Pu7/t0QfyBqodAKIFOWN16NcXLTMXYbClE308oTHDO482dMASPc5+W?=
 =?us-ascii?Q?i6vJ01m65OqGwfMb/b9tN0RYPg8WQ9DQo+BGkdSkpk29bUp6d9v9GUjz5Bqv?=
 =?us-ascii?Q?RW/JsHq4l+dfaZskpd235UntZRea7tf1A8iPtRawP30aG7KAOqqtgs4rdqBE?=
 =?us-ascii?Q?pPSHNprs+P/VxbMMmA3R45cy6uBo/f5Z2vSVDRnFaVsmRO+B/OLHvZvJBGwk?=
 =?us-ascii?Q?qCOTn7P8PX7MsEscaMIcbE75hXC2J8g7MQLFjacwXF4nMDdATylSij3NYOUK?=
 =?us-ascii?Q?Zx3jcWchAfsHm7YfWuoxNgvuOcHsZj4NDXac5VG8AVzDm6CzEkkgyNW+rdN4?=
 =?us-ascii?Q?P7F4FPXhtZsh3iZXBKfbcNegu+TDgiIyyYX9xtjdoLRzJkChxC4RjuCXJ6Uq?=
 =?us-ascii?Q?/ZnaxCi5ygsrv+VfiFaR+0RnkIfbP3ZYZPxnpev5FdJsg8rkIQbqTBs9yCPC?=
 =?us-ascii?Q?ysAGAUxFVKZhSagGAtf3C4wzz/rbDcM+XR3oCQ8eo7cRSexSf+dNzwkB7TYZ?=
 =?us-ascii?Q?n8b6QfjRqkI5dARsuoAMfCDIgsGhw0ZDiJ9o9VRD3rWvor2dKFln03I5DS1Z?=
 =?us-ascii?Q?FKykzpNYpBPqcl/Eaeye8R5PFis7Cnj87h8OVrtXb7RsHRFrEELcd+HO8A6/?=
 =?us-ascii?Q?kL37Dev9Q8u9ikm7ME77DKz5hejuCMuFDtvdEWUf3W7hd8nrkLfFvJSW2gQZ?=
 =?us-ascii?Q?pwdt92BHjAYFA3/EYBzeg2vSzNquO4wmaTbVQSzbNPsxEa5RNbgSHh+D5Jb1?=
 =?us-ascii?Q?wyntSpu4aYSeiBLdMearIXJEOpNGVLHCDBPSjC4ejRedX1LSSHJr2KkPH5o+?=
 =?us-ascii?Q?RTO5vZLZ/+O065jfFoxAKdly9Cs3V5wpEw2rfv/2rhOo0PoYIrjOfO/ZH35F?=
 =?us-ascii?Q?m3zFRIQeNrpPfeyYHJOrPsWzFkiDtWk98Ef0r8l6W6j95/zPHA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79200ccb-490c-44a1-779f-08d8cc8f616a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 00:12:25.8646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkAWNu6BrHmQeoMg3OngeKNNUp+9HDZzE9TBQCmpwBjliq8+xlMDojmkdsffeIMX7CIqxaLs1sP9h1hylX8x9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_191231_599077_0C0F733A 
X-CRM114-Status: GOOD (  22.63  )
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
 Anup Patel <Anup.Patel@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/09 8:05, Sean Anderson wrote:
> On 2/8/21 5:55 PM, Damien Le Moal wrote:
>> On 2021/02/09 7:53, Sean Anderson wrote:
>>> On 2/8/21 3:00 PM, Rob Herring wrote:
>>>> On Fri, Feb 5, 2021 at 6:13 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>>
>>>>> On Fri, 2021-02-05 at 14:25 -0600, Rob Herring wrote:
>>>>> [...]
>>>>>>> +                   otp0: nvmem@50420000 {
>>>>>>> +                           #address-cells = <1>;
>>>>>>> +                           #size-cells = <1>;
>>>>>>> +                           compatible = "canaan,k210-otp";
>>>>>>> +                           reg = <0x50420000 0x100>,
>>>>>>> +                                 <0x88000000 0x20000>;
>>>>>>> +                           reg-names = "reg", "mem";
>>>>>>> +                           clocks = <&sysclk K210_CLK_ROM>;
>>>>>>> +                           resets = <&sysrst K210_RST_ROM>;
>>>>>>> +                           read-only;
>>>>>>> +                           status = "disabled";
>>>>>>
>>>>>> Your disabled nodes seem a bit excessive. A device should really only be
>>>>>> disabled if it's a board level decision to use or not. I'd assume the
>>>>>> OTP is always there and usable.
>>>>>
>>>>> Please see below.
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +                           /* Bootloader */
>>>>>>> +                           firmware@00000 {
>>>>>>
>>>>>> Drop leading 0s.
>>>>>>
>>>>>> Is this memory mapped? If so, you are missing 'ranges' in the parent to
>>>>>> make it translateable.
>>>>>>
>>>>>>> +                                   reg = <0x00000 0xC200>;
>>>>>>> +                           };
>>>>>>> +
>>>>>>> +                           /*
>>>>>>> +                            * config string as described in RISC-V
>>>>>>> +                            * privileged spec 1.9
>>>>>>> +                            */
>>>>>>> +                           config-1-9@1c000 {
>>>>>>> +                                   reg = <0x1C000 0x1000>;
>>>>>>> +                           };
>>>>>>> +
>>>>>>> +                           /*
>>>>>>> +                            * Device tree containing only registers,
>>>>>>> +                            * interrupts, and cpus
>>>>>>> +                            */
>>>>>>> +                           fdt@1d000 {
>>>>>>> +                                   reg = <0x1D000 0x2000>;
>>>>>>> +                           };
>>>>>>> +
>>>>>>> +                           /* CPU/ROM credits */
>>>>>>> +                           credits@1f000 {
>>>>>>> +                                   reg = <0x1F000 0x1000>;
>>>>>>> +                           };
>>>>>>> +                   };
>>>>>>> +
>>>>>>> +                   dvp0: camera@50430000 {
>>>>>>> +                           compatible = "canaan,k210-dvp";
>>>>>>
>>>>>> No documented. Seems to be several of them.
>>>>>
>>>>> There are no Linux drivers for these undocumented nodes. That is why I did not
>>>>> add any documentation.
>>>>
>>>> Documentation is required when dts files OR Linux drivers use them.
>>>>
>>>>> make dtbs_check does not complain about that as long as
>>>>> the nodes are marked disabled.
>>>>
>>>> 'disabled' should only turn off required properties missing checks.
>>>> Undocumented compatible strings checks are about to get turned on now
>>>> that I've made it work without false positives.
>>>>
>>>>> I kept these nodes to have the DTS in sync with
>>>>> U-Boot which has them.
>>>>
>>>> That's a worthwhile goal. Doesn't u-boot require documenting bindings?
>>>
>>> Generally, no. Usually if the bindings differ from the kernel they are
>>> documented, but usually the device trees are just imported straight from
>>> the kernel. This is a bit of an unusual case in that the device tree is
>>> being imported from U-Boot instead of the other way around.
>>>
>>>>
>>>>> Keeping them also creates documentation for the SoC
>>>>> since this device tree is more detailed than the SoC specsheet...
>>>>
>>>> It's already 'documented' in u-boot it seems...
>>>
>>> I would like to keep Kernel and U-Boot device trees in-sync. However, if
>>> there are significant divergences, that becomes more difficult.
>>
>> Sean,
>>
>> Are you OK with removing the nodes without a driver ? I think they are the same
>> for the kernel and U-Boot but I have not checked in detail.
> 
> I suppose. The 8285 uarts should be kept as iirc someone was using them.
> Same with i2c. WDT has a U-Boot driver, and probably has a Linux one too
> (I haven't checked). I believe the timers also have working drivers, but
> I haven't tested on Linux.

Yep, all of these are supported and work. I used i2c a lot for my biped robot
and robot arm control. The watchdog timers also work but I did not enable the
drivers by default in the kernel config.

Preparing v18 with the updated dtsi then. I do not think we need to change the
dts for the boards. Will check.

Thanks !

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
