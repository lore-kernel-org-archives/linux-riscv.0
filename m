Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A961FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 23:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7501C2085A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 23:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPVyQTGB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="N9EW2oYM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Xsx/gLg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7501C2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=nzzX8imD41LW24pDpNvSnPGxcg/7QCYyHOB7WyjDqC4=; b=SPVyQTGBRRkhvG
	/S1vHUPleg8wmLTfrxoicxwek7m8gFh43P4f40VQvf8Xhktjve2lsKd5UZ5crZ4FTbnzdyO3rACSM
	6FVd4/TviRI1LCW37vogZwZmiBgMBp/AdSyrYxtwyCMeMyVkR692whGhQznrx5PRdxoYNuseOylYv
	jwnatF+7nS9xm0qxa2q7bapz/PrJsNVucu2y7vOTWGs1fMOR1hBrctuaWn01cT7ie5c5f4qgEB3jn
	8fFFfIAfeftIS95N9VPycZcRytNAaTEEDwsS9P3cNRrqBGSaJ4hZZRJ9OmP/V3qZOtt/V46UT8WGp
	N+bGJoCDWBhwTPBgz5lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Ocd-0001Gu-AF; Tue, 19 Mar 2019 23:58:19 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Ocb-0001GT-3z
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 23:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553039898; x=1584575898;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=1xbRE7RXwMsrL7OpNmu/OPP0tnPKkuIPjpcNe7WNrO0=;
 b=N9EW2oYMilZOhjxHz8Za+IkCmQlqSUrKzXz2IDF5MFu+/lslv0zQH6it
 wKHKHmUsyxCW3VDw5gwaFNTG+r8IzrttTysnQ96+NAupp7x0fTShn66tK
 z9WInc9Fd2QmleRejrmmAc1CKI1NXo8jIlN1doZ6FZcVS34oQZ/X6/3i/
 ubMgQVlH80JmI0RapXzFlxPz83NbOlVPYWsI3O+G1cv9r4o0eAyVu+61E
 bSp8SEOv1XL4+4J88yDP5m0hET4Yf2iiwtfTyfDL9cAAC7kx7sBcJqT1P
 X0TD5MKWcJAcQqV2Xn1RpXvh8xrnfpFwTNE++6rhXaUOEf4y4Z4OV8ETD w==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="108837836"
Received: from mail-co1nam05lp2057.outbound.protection.outlook.com (HELO
 NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.57])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 07:58:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5Xzhrhd1L7g3aeBeMLj4COBGerd5O8zk0xX1wijCuE=;
 b=Xsx/gLg+D9f4DOsY8ehwGdyq5fJwIgyzXE8YjzTc/72UmLafDheoMXECj0GMWSu6Az1NXCjguVkd3065B+fZ0CM7I7LFLC07lN42v8QFqAXhIH4w2HSdnUUhNHAmS/P0o258GAs5Vhp2e0mdhjEzORS2GiT7ohIQcNRK3oGt13M=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB5766.namprd04.prod.outlook.com (20.179.58.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 23:58:10 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::7c30:6437:71e2:e32e]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::7c30:6437:71e2:e32e%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 23:58:10 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Atish Patra <Atish.Patra@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [v1 PATCH 4/4] RISC-V: Support nr_cpus command line option.
Thread-Topic: [v1 PATCH 4/4] RISC-V: Support nr_cpus command line option.
Thread-Index: AQHU3qIAiA88vIkHh0W9ePhVGAezdw==
Date: Tue, 19 Mar 2019 23:58:10 +0000
Message-ID: <BYAPR04MB58168FE99AA058FB79A0650EE7400@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190319222028.4293-1-atish.patra@wdc.com>
 <20190319222028.4293-4-atish.patra@wdc.com>
 <BYAPR04MB5816217E1BD06F0EB68E15A7E7400@BYAPR04MB5816.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97cf0687-572f-4135-6b12-08d6acc6bd82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR04MB5766; 
x-ms-traffictypediagnostic: BYAPR04MB5766:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5766CF42416FCE41B1E5DBF4E7400@BYAPR04MB5766.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(14444005)(71190400001)(52536014)(54906003)(8936002)(71200400001)(256004)(229853002)(9686003)(76176011)(55016002)(186003)(53936002)(68736007)(6246003)(7696005)(446003)(110136005)(99286004)(66066001)(93156006)(316002)(486006)(476003)(81156014)(86362001)(8676002)(305945005)(2906002)(7736002)(3846002)(25786009)(33656002)(81166006)(97736004)(4326008)(72206003)(2501003)(102836004)(53546011)(74316002)(26005)(6506007)(105586002)(5660300002)(6116002)(106356001)(6436002)(14454004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5766;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BdGKXHqCcPenwDvuMU1hZ6YshlKtzImK19iz3zMOVFuvjbCAoHLZyzmNlO1dDPlZst8AbtIhjC2feQlv6ybzgoDPNdCZDsF6Ny7tPCnEta1FXvEARj5dX6vH30qIPdIDm5VNLBYL4ykki516WlCNd8QS2u/ZOCONt63LxoCjvIbn/vq7ncetoTvCX25h+t8I69iK60IxjtjoG/IVr487lIVotpGkijRFau4FO1D3oPMZz26ACqKnertgEZbibtgm9kO7amr/D79D9rdbF5/0kU+5rmbilVohCHzVJLvMaDq9e0jFq4nok1LX1sAS+2cC+S6hcNFsQWoM9Pn2urP45e6vgqJkOvBMJndACXWR/Kry4Mevlv56MSqqnTzG8UiTQXUh+XIV/qcySjV6K0xE0QvPzF5k5Y3gSLDQv79RQ5g=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cf0687-572f-4135-6b12-08d6acc6bd82
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 23:58:10.1215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_165817_297681_63BB9602 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2019/03/20 8:56, Damien Le Moal wrote:
> On 2019/03/20 7:20, Atish Patra wrote:
>> If nr_cpus command line option is set, maximum possible cpu should be
>> set to that value.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>  arch/riscv/kernel/smpboot.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>> index 609475c5..a8fe590c 100644
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -86,11 +86,19 @@ void __init setup_smp(void)
>>  		}
>>  
>>  		cpuid_to_hartid_map(cpuid) = hart;
>> -		set_cpu_possible(cpuid, true);
> 
> This looks weird: the code being changed does not match what patch 3/4 did.

Arg... Ignore this one. My bad. Morning here, I need more coffee :)

> 
>>  		cpuid++;
>>  	}
>>  
>>  	BUG_ON(!found_boot_cpu);
>> +
>> +	if (cpuid > nr_cpu_ids)
>> +		pr_warn("Total number of cpus [%d] are greater than configured via nr_cpus [%d]\n",
> 
> "The total number of cpus [%d] is greater than nr_cpus option value [%d]\n"
> 
>> +			cpuid, nr_cpu_ids);
>> +
>> +	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
>> +		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
>> +			set_cpu_possible(cpuid, true);
>> +	}
>>  }
>>  
>>  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>>
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
