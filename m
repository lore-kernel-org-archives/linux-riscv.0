Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7632AC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 11:49:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB7923333
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 11:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB7923333
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QiWmbK5rBjVoqH4lmFUm0yuDLFzVWLT/Hgy9stLiJ3U=; b=zoNxn+lAWohIC1iMxq1vtBuId
	68UF2I160DkCnk382+F+kDHGBxTfRfONw7lQyfHU0lWpTUlSDDpcaUXuNbULus5xqz0JAUCO701Ds
	7ouhnNJ4wvd+G8yh3Kq+aAoO435zj5+XFPztpOOUqCXyNgtwerApkAmfI9Dmc0cAFbjh9E9XpwKFT
	oVlRMi0DVK75evOxdY6iS65weAsB6JnhBpwBTEUj2HRA+S8Sv5FqIUM5khrh6fAuhWA+tYpI0A5j9
	pOPUaIjy3E9ZpOaEcnmuJbEjTB1nQm7PEJqR/k2bNBDLcmFJujF0ZC7zYevPvY2Z4faI+NitFiMHe
	v4Nfv8mKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxTnJ-0006RE-NO; Thu, 07 Jan 2021 11:49:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxTnG-0006QV-Ug
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 11:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1610020171; x=1641556171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gApnIG5PTdde8OY4Ed0wW3Ht/LR5Cgna6Gr8s96GlRQ=;
 b=uv2vZiN3vz2O+rPoTjkIZ5Citspi9enPq0v1o0WyyFdjIh9a7hCjCUVt
 AmAJtWVBjS1TkuSzG6MuGwEbW8At1/e3TkVVL13tXt7odZAKR9tJVZPf2
 904yJjQ8JXhDp26YyhSRVJv0lSsouu9zLXr/6TLLsWyJhhgoOp/W0ZkzO
 4sCO0BLTgbHcdcDbJl1bjL8oP4OTES0mEetKHFcdFypZ9PIZC13Adia4M
 oSH7KbFW14MHZrY0aDnOnbj+pNSEcmK8BLD0p/1G20m57CWbA/3ewUztm
 c+2s797zEiII+LEL8LE7Ocs2hn5bn8LJynjI8l930xI/5g5Japr2og5Ui Q==;
IronPort-SDR: 4OKRBAxK5C5WacSgzs6Oi+BpX0fovXVvURsnOBreK6WY0GW4XQUz9nk0YNo/qqNKeXG7bHCPig
 enEj18w6dSblf6gJdBXWQfRQZyVeXgN9hY815KifxLd25QCA99qJRA//VgDhxWe5J6keItssP+
 sWD6KIPrp+1qWjL0YVL4WM+okwojjShqFqjVCDOZb9t5wQGeHrjDPyAgrLFoN8zQPddliugwPZ
 XVW2vLfPRMLWgRB9c0mP1+KjvfSmcPKjq4KOv28NcQ9nzkUXeLuYfDcOas8uQh0DfNntfYV8up
 Uow=
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="104580391"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Jan 2021 04:49:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 7 Jan 2021 04:49:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 7 Jan 2021 04:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLQ+l1p5cAGKrYxxRzRUMIuvLHOU3PUYu+C/m9gaEY2Mb45OGoBCgeyUR5fW7N5SW86w96tF3fKmgqfvagoxa+WxFDwUPl5xSjF3AShkICTMFNoa5EFQKTJ0GVpeyzaGUAOW4bzzuKBZgJHgMWp1XQ6ypBQrRkF9tA6Awd2KPE6055uX2155eXghPZECOKzF6NyQk6/B98/n1uzx1cIFZYyapBedhuXY8NJMxzwXHyj26xjNghOyFLHsvmZ42iYuSCKtTjHdPg8jcbm40aHgJC5WSXqZnpsUF5tzs3LW4F1PTBOdd65398n4h4SKHqtHw+MYlkfllCYEJzmH/tO6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gApnIG5PTdde8OY4Ed0wW3Ht/LR5Cgna6Gr8s96GlRQ=;
 b=CBZBUXKtXSlzgaMNSOnne3Xqa/fltQWpuIqwI3iN9FVtqUTRsIcq4LB2+/GexStPirxh/6crvdQPUflmD/PUTP4VZDmiQdYPdzmSpUeMDw2/B1iiG9nSn9mbQPTHUBZ9mt39J+S6OyClfqCFvCTwqxS4pN/KewQIP+jyFJM+K2OcwIRL3N0aEmOFyGhYr/sm95AnxIyBvRUKM2RSMFKLGRrfILvA7+bpkAkUBQOHCjk0kpteXh70tkqvERPDIIztk42Zry/WkH6d+8pfRc/Q4FLB7yJFCPVbKCL2Gxsq03TaAsGqd699DHcOjorNZP51f10tJ8DcjK8IdSgJRidN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gApnIG5PTdde8OY4Ed0wW3Ht/LR5Cgna6Gr8s96GlRQ=;
 b=YJmUwm6Fhpvl8oL5gXWfG2DLIZ58p++7wxV9d0V5lTq8shmdYp6WuKbFQqC29nH2N+tRXORgEHtJCHeXSITCAoogEhb0sCH+rBD30L2he5cPVEUveWCdsq23ipnSXui6+7zOADl8gS2WGaA/oSXuG8wkVIgUdylIIeVmCfhbaBY=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (20.178.231.96) by
 DM5PR1101MB2251.namprd11.prod.outlook.com (10.174.105.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21; Thu, 7 Jan 2021 11:49:24 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::2d16:756c:541c:7aa5]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::2d16:756c:541c:7aa5%6]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 11:49:24 +0000
From: <Cyril.Jean@microchip.com>
To: <atishp@atishpatra.org>, <Conor.Dooley@microchip.com>
Subject: Re: [PATCH v3 0/5] Add support for the PolarFire SoC system controller
Thread-Topic: [PATCH v3 0/5] Add support for the PolarFire SoC system
 controller
Thread-Index: AQHW5GHKDRIvkjapkUynKUBj5I8a8qocDYSA
Date: Thu, 7 Jan 2021 11:49:24 +0000
Message-ID: <d4b226e5-2eb8-e418-b4d7-9f04abcd40bc@microchip.com>
References: <20201223163247.28923-1-conor.dooley@microchip.com>
 <CAOnJCUKw=UBt27XQoVxU=BXtEU0Nf6D2AnmsuyNVJGvJpVUMGw@mail.gmail.com>
In-Reply-To: <CAOnJCUKw=UBt27XQoVxU=BXtEU0Nf6D2AnmsuyNVJGvJpVUMGw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f7c071a-4022-44aa-3060-08d8b3024792
x-ms-traffictypediagnostic: DM5PR1101MB2251:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB22517BE3858BA8DE4700F15A9EAF0@DM5PR1101MB2251.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nDKdz3RBTmFENedeo9C17snt/QfWkAolfZJufopPXr+UP+cldWM5Jo5ZpVNiD2YUZGC0KlGRVcWiEBmXYN4OwbXjGa5EFREIwZF92Be5Lm5mY8forCDiPoIqPoFmH54fZ4ok5pR3TVf0w6X+MG2EeC7hSxNifENxV6af62Lhoc+suAgScOT1O8fgkU2fWxlNU5ye7Knvvy+T9T8HjsVAO6/9KdfSm8bhA9vDS58DhlS5+QeTEX2kebrqZbpdcDREEL4i62VgJCvtVp2fJsQOmfGX4yo82Rex+zIakebKebMRcfDEtxOp+TiSmuB6fyLWj/IWqDFyeF0vWJM/3DW3Y7avpdbb58ui0akrr+S1qSr3TwjB5UvWS2k5skWDOMoW3OSWx4mgYKRcHwUxjxhFufVuiDVQYJeJ43rmpgLYAgmFTFLTamM8zZMYn/Zjj1o4Z9S5gtjBEkRSXN+wLsrgrJduPGPcRRrCkpJYUHocY0QJDSy515p3MucwWpKOGPQNj2InxjBzIuBjUHXGNSI5uWL5IBVntagUQWEScxIvt5M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(346002)(376002)(366004)(6486002)(966005)(7416002)(6506007)(8676002)(478600001)(83380400001)(31686004)(6512007)(2616005)(53546011)(66556008)(66476007)(5660300002)(66446008)(64756008)(107886003)(186003)(26005)(2906002)(86362001)(66946007)(8936002)(6636002)(4326008)(91956017)(110136005)(54906003)(36756003)(316002)(76116006)(71200400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YlBudE9GNlFqbkpVQytDL3BjcWlkRDl1S0RJdDBtQ1hONURXVGNWUDJSVUR3?=
 =?utf-8?B?ODVDVzR5bWdiUnlpZnZKcEZiTWlTQ3RiQUJhZlF2N1UydERQSWZjbFpmd2hV?=
 =?utf-8?B?UXBENjBxd3Jab25KQ3JUeG1kZGF5U1h4NlN4UkdsbHpDak1Memd2YS82TjBG?=
 =?utf-8?B?N2o5T2hLS1YzTU9GampxdXN4MmhKZndIVHVMcldiMVRKcDVRNTZKbllmQjF2?=
 =?utf-8?B?c3VPT3c3NktCaTRsWkhNeUplWE1CSEFBRmtqNDJJMDFoNklETXhleS9wQlNP?=
 =?utf-8?B?SlV1Z0N3Mzcwa0tZY0MwZWVPVk1JSjZ4NmhKZjBWa3ZVdXZpWjJrMWdhNEtk?=
 =?utf-8?B?ZHRkN0I2d0dTeThTTW80eGtpRWRWUHVUVGhDK2xmSTVIcE9lSUlGNXRIc3Nr?=
 =?utf-8?B?ekZ0NUJBTmdWUFNiMUxueTJYZEtsdmJianV3WnVyUjRiOWJKeUtMSVRmaGMw?=
 =?utf-8?B?czFZcnFKK0JjTDd5SmNhdWRqUDZmbkpjRXZROFdKZFpYOUxNWTlaOEh5Q3BQ?=
 =?utf-8?B?K0FlNVhkUkx5clJOMzhTc2x1WUVTTHdnNm1WZFNCamRYYzVnRk1LeC8xQWJW?=
 =?utf-8?B?eUpHZ2s2aWl5c1RiQjFMNi9uOHppMFhlbXpBSW41Qnh2cDlQdWp1cTRacWVx?=
 =?utf-8?B?WGJPL0h4WGtMS0czREdFU05adkZqVDFsWUQ5NjB3QnRvb3N2Yll3SThJTmps?=
 =?utf-8?B?TVJOc3pmdVhVTlpOSjRDRExhRHlZZVRRY0crVngybm02VTZkajlmNDE0L1VL?=
 =?utf-8?B?M2VwVER0RS9jdURvMzByNEFDQjByaC95dXIzdGpBTU84cUoyN0hhMUhTL204?=
 =?utf-8?B?REJUN2VNSEtIRFArQW00WkxIdlBVVHZHSGl3RnFYMVBDclRkVDNsQnFFSFpH?=
 =?utf-8?B?UjR3bkp0Wm9iMHlxZUloSitCWG5IVUdxbVRCTE96MXpLVVNWdnMxL29qR3F3?=
 =?utf-8?B?SGFjTWdYdFpYZzdnUllEM0pMalBNT0NrNzFqWGtwSkF6dnloYkgxMlBvbGFq?=
 =?utf-8?B?TWZDdzNOcDUzTHFXaHlQYm50WFMza1lzbHRlWVhJbUNhTTNPQS9CYURNNUFn?=
 =?utf-8?B?aHpUMVhLTGZGekdraGtBR0FTQU91ZXphcjhPT2pVeUpMVHBNVlVsTTNzb1lE?=
 =?utf-8?B?WVdQRUg1YUlBSmJGWVlQaUpJeG5WRm1SRmdxZU9QYUwwZkx6K1RFRkYxalJD?=
 =?utf-8?B?WEpuUDlPODZMdG9RZXRnaXpoNE5YbVp0YVdza2ljMDVFRnNMa2hQRUlDd1NS?=
 =?utf-8?B?VUxTRU5NV3ZrN0VWODZMOFkrSHdpdG50MUhWRE5SQW42OVp5WVM3NjR3ZXJU?=
 =?utf-8?Q?kocF4mzGbVWDs=3D?=
Content-ID: <1C7E9503FCE13E4AA954C99F8F9302A4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7c071a-4022-44aa-3060-08d8b3024792
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 11:49:24.3315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mpvua+kaXm0+hpKxIkgA7GszMCH2VsQi34LHz3HO5SXKQWJIHdjzqC0Pqo/N/MrkXguOntVATcugWAAU0SzUuuhhjR6qo24WS6cLbXFut/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_064931_284208_57F4C319 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 Lewis.Hanly@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, jassisinghbrar@gmail.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, anup.patel@wdc.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/6/21 7:25 PM, Atish Patra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Wed, Dec 23, 2020 at 8:33 AM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This patch series adds support for the system controller on
>> the PolarFire SoC, using the mailbox framework. A Microchip directory
>> in the SoC subsystem has been created to hold the mailbox client
>> driver and will be used for future service drivers.
>>
>> This directory is included by the kconfig option:
>> CONFIG_SOC_MICROCHIP_POLARFIRE, so this patch series depends on Atish
>> Patra's PolarFire SoC support patches which introduce that option.
>>
> What version of clock driver are you using? I am waiting for an
> updated clock patch to post the next
> version of the basic soc support series.
v2 clock driver should be available shortly. It should only require two 
changes in the basic soc support series (pfsoc -> mpfs naming changes).
>> It further depends on the MAINTAINERS entry created in the same series.
>>
>> Changes from v2:
>> * Further reworked dt bindings to satisfy errors and feedback
>>    (hopefully phandle array is the correct type for the mboxes)
>> * Full maintainers entry moved to Atish's PFSoC support series, this series now only adds mailbox driver
>> * Converted config options from MPFS to POLARFIRE_SOC so they are more recognisable
>> * Further simplified driver code from feedback
>>
>> Changes from v1:
>> * Squashed header into first patch
>> * Fixed DT binding warnings & small fixes
>> * Cleaned up drivers from feedback
>>
>> Conor Dooley (5):
>>    mbox: add polarfire soc system controller mailbox
>>    dt-bindings: add bindings for polarfire soc mailbox
>>    soc: add polarfire soc system controller
>>    dt-bindings: add bindings for polarfire soc system controller
>>    MAINTAINERS: add maintainers for polarfire soc mailbox driver
>>
>>   .../mailbox/microchip,mailbox-mpfs.yaml       |  47 +++
>>   .../microchip,mpfs_sys_controller.yaml        |  34 +++
>>   MAINTAINERS                                   |   1 +
>>   drivers/mailbox/Kconfig                       |  12 +
>>   drivers/mailbox/Makefile                      |   2 +
>>   drivers/mailbox/mailbox-mpfs.c                | 285 ++++++++++++++++++
>>   drivers/soc/Kconfig                           |   1 +
>>   drivers/soc/Makefile                          |   1 +
>>   drivers/soc/microchip/Kconfig                 |  10 +
>>   drivers/soc/microchip/Makefile                |   1 +
>>   drivers/soc/microchip/mpfs-sys-controller.c   | 127 ++++++++
>>   include/soc/microchip/mpfs.h                  |  51 ++++
>>   12 files changed, 572 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml
>>   create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
>>   create mode 100644 drivers/mailbox/mailbox-mpfs.c
>>   create mode 100644 drivers/soc/microchip/Kconfig
>>   create mode 100644 drivers/soc/microchip/Makefile
>>   create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
>>   create mode 100644 include/soc/microchip/mpfs.h
>>
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
> --
> Regards,
> Atish

Regards,

Cyril


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
