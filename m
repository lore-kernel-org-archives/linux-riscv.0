Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882ABC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DibcGjMZhFzKOraEV8MyBeiWMZGkh0v+FmHn3B/OGxo=; b=2DEUaKADlmjflj
	ua2iXOzOfmpMt3kkWH75UtS5WxGyM9LDBi8R6sdouxBM8K/JOnv+nulfQFdFjPcJjrtWiOHNtU1uP
	pormtSugofySP/nqLBCg+lMVTYbHpptWez3LaHd0BtPUNob4a3BBpnYZcqnmbab69T0vrLl9/wtMp
	/Z0HA2TDXqhJHXkyWa68N0kVQvm9c3/O4SBzJZQlWuo3OGV0rmChP0x24qq/nbVrq1wtrEhGH0DnL
	6EIczhAUW4lP3LzLAfdFnEsiPtyXOatB2ryVy0SeubkTkjejwYFzZGWx65aAih1gh2ZbYyEHV/89q
	woV/YWDyEz4X+tkdJTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaWA-00BLwd-V6; Wed, 11 Jan 2023 12:47:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaW6-00BLvW-FB
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673441263; x=1704977263;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sAWsv6vIBR+5KzFa7nFmKTXsQ19slic4+Z2oVm/M8fg=;
  b=mt08yYj0PNienMZ2qQSfkjmtx++JgzJNUbgV+P1dXuCsJOU9B3b26D+W
   L+uyzL2dFJic8vgChSnZG6fScIqs0TKl/itnwaBqBXyqKIEhnPC0z2uyz
   z098yx5xJ6T309FtDKN4KQZWGLUHqlQCHKhByB7Lq1n/BnrrNccMp4QXv
   uCZsdEZYn/EeLO00OqpiybaQuCmPRpVfayq8hwYgWDkr1AZqKyOrAHbyX
   5I3r8p1Y82ll7TzlQGxJdZJraRNqTH+lroMA++zblC4rIHA/3gkX5jAo1
   XoF3RfhvQPjhxJYX86GDcUcn0vVp/bl6BiR7PfvNGHIFltwNxX6P4GSco
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="196327404"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:47:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:47:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 05:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxJVooLJDKPv7sTy9SHopVeC0E2mFfOr8VJhopQ8X5gPf5+53QfZ+8XtaRbZr4KW5VJqdh/9s7QUg+Kq3dhQYsjDCZWdvfBDEtryTimUjkw8i+s6WFfgnWaLignoVguRsby6I+CXqSQSI9OfyZ/UkLcLgpsP4XFnM/ZqZaSXury4j1eLv6Uyr6LXg0SMkK5B8mCmtVg6PbXGZy2+h7+ZO21TRDZ4lMOPadIyGPTvdjVp/MsU8N9SyGVTXGX8W3HT2OwgShlmp9seqaqtFj1QPNZoFtLIyztk3eVVxXQ08orcnonRx3nmR+KqS7BsK6U5WtkYODEP7QRGhIjV72ofFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAWsv6vIBR+5KzFa7nFmKTXsQ19slic4+Z2oVm/M8fg=;
 b=hRy8mbIC6exhtTYnFO8aZrGIrr8+B2k+6iRfTjOef2XTLpY0SKfKj8dqdp7/zxq/49EowvQJb7ds1pu1qt8coIN/YXs5h+aZDXEzx83+j7JGdmFmR7ZSYKuZi/6AN6efit+hdb4pHQtAxEvN6Xs/T4iqXAICkSqRnwXoQnNZ7vq8n9v8YYrvYzZav3iAEhysShq9CNBj8xku8zsaTlM9bi5AdpT2lRFUIE7ziiGVa14Hk9yFLDlblxWwzgjtclPPzOZCjhauVA50hZRD3f973cmEUEP6ySC+1147HiIF8yFxymxVlCSLcpyDJVinV0HAThDcuiOLALKx2eW6eRlkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAWsv6vIBR+5KzFa7nFmKTXsQ19slic4+Z2oVm/M8fg=;
 b=TNvCoLSTiRl2Sb7Xr7jXHLzInAL6tsJ6cubOOroI+7sSJOz5pFzDqZW4BXQyhi08DQicKGJqwWbU9iwht49byKyOiSEkE6sKrkmssbGkEmsxMUXkq+k+c3clMdvzI6DVVedVQcxQBkuSKXRicCWk9Funf1bJZfildbK6oAjeOi8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5376.namprd11.prod.outlook.com (2603:10b6:5:397::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 12:47:39 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::3758:fd2d:5bd1:9758]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::3758:fd2d:5bd1:9758%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 12:47:39 +0000
From: <Conor.Dooley@microchip.com>
To: <Conor.Dooley@microchip.com>
CC: <Daire.McNamara@microchip.com>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: microchip: add the Aldec TySoM's
 devicetree
Thread-Topic: [PATCH v2 3/3] riscv: dts: microchip: add the Aldec TySoM's
 devicetree
Thread-Index: AQHZJbolD5ijyqHylUaI95XFLibJE66ZKjkA
Date: Wed, 11 Jan 2023 12:47:39 +0000
Message-ID: <20491221-8440-e12f-cf29-f90e2b980076@microchip.com>
References: <20230111124106.2417152-1-conor.dooley@microchip.com>
 <20230111124106.2417152-4-conor.dooley@microchip.com>
In-Reply-To: <20230111124106.2417152-4-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM4PR11MB5376:EE_
x-ms-office365-filtering-correlation-id: b1efbde8-5ce1-468e-399e-08daf3d205b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1D3yFSCOJLt/GsmuD3LD38I/0vesk4VJ3+t6ghJcPWud+NHSnOpeyr41yTWLas6M8E/mlMw+IMC/QM9/hkfi5aBrvd7Lc25TClWBfQQD0QrbaSbU2bapqzeeko4emEl3fUvd8thj4WnbXGU4zF1/y+hdwierVDxuxSz3WRkhPkTjDPTLJWeVeLacLvpOUSaUFGCmW6R4UInYS9R//8lMFBoWH8CcF7CluQvD4ivCv+ZUJeYe4wO7U9Lhll3yzjcKuqjMbFFxxTuPJq3WdLeT9JBVR4H7oz2LNUxelLB373r6bBlabpQ6dSJNalQTorStN5ojp0/CAMRq9dkRQ2n6TffV4B6wCTOYXHDFhpEtyJj+MRt2MoVMkmJAyKiw+0iTd4cuVMq2iLk0KQIkJFsJXr4atkTwLiqF8ipE/2dyxlSvR+5z8PXuwZqXOHf3wCT3sgQOVsxLQ7KGMOyJstlIAkHCnOKr/6c1dSbWMQiBx8zUzse2WWdRrsEv7Zc/iN/ZVWbPM6ix4sPCmPvFTuhTshHFxnEVILNqPYpyiTaaFf/N0b8FUdBsaJzCh/lTJFOoUAvyiMxuFof0R1twfT6401uSLr3P6PIR7/4TEXa0kJASzcVIJq6LUmLv2xgUZZNrQbS2pr+IpUsKa16PYfYvhz+nX5tiW3pjdiJUoNY32JURcA9P/mr+gxLWcQRNeOtxOKL/M9bsZLbAmjjusLJ/2F1FE3KiatyvlezinNOJRcXjOY9kXC6KPep6V+f1DA15HGOLjzReMFdZDMra3LzC0dQRYSyiNs4om2kNHmqJFtw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6029001)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199015)(76116006)(8676002)(64756008)(66946007)(66476007)(66556008)(316002)(4326008)(91956017)(37006003)(38070700005)(54906003)(2906002)(5660300002)(66446008)(8936002)(71200400001)(41300700001)(36756003)(966005)(83380400001)(53546011)(31696002)(6486002)(478600001)(6506007)(122000001)(38100700002)(2616005)(26005)(6512007)(86362001)(6862004)(186003)(31686004)(6200100001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjlSNUFRMzR6T25TK3VFUGRVaTRnaUFnN1NiaEo4eVJVMTRmS3hCUnRKWm44?=
 =?utf-8?B?Q3pWQkZlVDNmaWM2YUFYTHo0VWppb2xxbWJLbnlxZXhxVTNrME54aWNkbVZn?=
 =?utf-8?B?Y2xRdWU5K2tPMGxNdWRURWlpaG9aVWRoVTRiNWJvdkJVOUYwWHdGZFNGTkF6?=
 =?utf-8?B?RkVNMXRHNCtWN1ZLWTJsZzk3c0p5dVB2bzBPem1zWmp0WGIzNDE2Z3l2cmli?=
 =?utf-8?B?bVFOQ24zSkNzVmJwTVlJdXhlK3BOdi94VTZUTG5sWXV6YlBoQURkd3VkcVc3?=
 =?utf-8?B?WUV4OHYvK3Y5clJSc1VYQ2doQWJ3OHdQVmh3NERkUDNBZWEyZ042dFJpelNP?=
 =?utf-8?B?UU1WR3Z0RG12aHdiRHhjSTA5ZHVKWU5aa0k0S3ROOUVtV3p0QUF3MUJGRG5E?=
 =?utf-8?B?SUc4RkNnc1BCajRaTW9DSkFrMEZpZUFHdW14QS9yUGxIR2prdU45QWp0alJS?=
 =?utf-8?B?VDZUcWIvd1FOY0ZmSHRFZHNrblMva2g5QXJ6RGh2L1VUeFFJSjdsaWZoenRI?=
 =?utf-8?B?WjFuUGE4am5UQ2l4OU1TN0dGUHlKYThjV0lyOVd3ZFpmZjE2d0ZYNFNDYWFk?=
 =?utf-8?B?d0JCM0JRM3FBS0d0TXRtYmRZTjNvV2FZNk9zQjZKYktHN2lneDNCRURQbDVT?=
 =?utf-8?B?UWR2ak1jUXd0VjNFZ2d2YldxVThvSnJQVHdadkZSZkxsdzNhWDU2TCthQStE?=
 =?utf-8?B?QWFJaWtydGlRL0Y3ODB5U3MvZTBYUHplVEFYT094dGpLUk9LbXV4cUd6cThY?=
 =?utf-8?B?WlR0eDRJSyt3ZmV4cU1pY01DZTRiY2ZoZlozTDBFOXdWM0FRQzNROWUvOVE1?=
 =?utf-8?B?SndYN3RqRGg5YUh0dEExc3AxWTB2NFlJWVNsMHl3bHQrZWNNT05sbEVybjlM?=
 =?utf-8?B?eHlTYURNRUIxUUZJeUc5d2lvV05oRVo1WGx5dDl2TkJyYmFiOThvaXMwdHlz?=
 =?utf-8?B?Wkg2bEhoalRvWjJvMzU3MUtxbkVnTGpLQThEbHFVRWdMMEtHdStvdU5HUUwx?=
 =?utf-8?B?YXgyTVdNR2ZicFIrQWc3UERoVGhZc0E5TGJXUi8rNUNlbXl1d25MdkkrWkVM?=
 =?utf-8?B?SXIxdE5VWkVsN3ZuYTBucnZEUEJLcnNCdzdVU1Q0VGRLblpua095Z0pmbzVZ?=
 =?utf-8?B?NDJ2Y0JDWlR4QW9BeHl6RGZ5ZExBUHFRdGxFaG1wdjZESTEvbG91aWtlQ2Rk?=
 =?utf-8?B?VkIrVjc4bGNIV2pqaXNiTEZEZEQrNytFYW82U01NMndPdmRaYXpaUTgwNTlF?=
 =?utf-8?B?ZlNBczNlY2pMT0Rlb3MxYnFtbDlSZ2NRRndBamxQMURydjNTUUM0ZVRiWmNP?=
 =?utf-8?B?TGV6T01mSnIycjByVkpOOE1nRXo4OFV6MHZtSjRERjJsaTVQcHh4SEJjTG1v?=
 =?utf-8?B?OENhMGRyM3piazU5WEhaaDFJeWR0OW5NeUpoc3RXMjNHL2JUaXFhRGJTN0hE?=
 =?utf-8?B?UEt4QUV1dFlxK1M0clJmZWtsT0lMVTArczZxcW16S1hLcnhGRXhJYzkvQUsv?=
 =?utf-8?B?Z1VMYmU5dVFGcWRjU3BXWU5xWkVzQ2t3ck5EZVQzUDk5K055alFBQXVYblRr?=
 =?utf-8?B?SnZseGxoRnJvTmdsYXdqTTNPR3MxRzZyeXNweU8ySHJINU13Nk45MTNqbkta?=
 =?utf-8?B?SitFMXcrMGwxNUZKb2NuN09tLy8yc3ZkWjJ2SUk3YmcyUElWdzVyUGozeThI?=
 =?utf-8?B?TXlnVmZ6clY2cjEvOWhYcXJwb095emx6UG1oYWJRWHh6Z05IQjVtUmhQRlRr?=
 =?utf-8?B?dXRXQ243ZlIrVGJRNmV4bjBLM2xZV3YvbnNQZi8zSE5meFJHZHBTQXV6WkhM?=
 =?utf-8?B?OThlMkZTSUdLajJmZERqZWkvL1IySUszcHd2K3QvbUNoTVFmZmhLcUVpSmgz?=
 =?utf-8?B?ZVdQbzhKODBNQjJ3ekFndnlUVGdpZWlSQjY3b1UrVEJQZ2hxMFdSdjVNS1dK?=
 =?utf-8?B?TDllTVgvbzlzdk5rdEJkY0s0T3A3N2wydGNOWWM4Rk9aQ1J2SzZROS96dmpi?=
 =?utf-8?B?d0g1U0Z6OTBGZzYyOENydUY2T1lzSzdXeVhReGU0ODE1b1JTZjVaUCtWZzZH?=
 =?utf-8?B?V25WbVVsaXVHTmd5Q0ZvSnNYZ3lHOFlsMEhoVXM0czBrekpZVzMrcmN4WVVn?=
 =?utf-8?Q?21s8tHeaXqGk1Dem7K1ejS/Da?=
Content-ID: <7B57A3E4FC1AAC4391C3088C50EDD438@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1efbde8-5ce1-468e-399e-08daf3d205b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 12:47:39.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ph10zals9Okc0wXqlIaRdEj/AQZ+aW0AzVATE1Exxcw3ZlU82oQ80vLfZOknfqQnSZ795zc3/m7MJQDjjiZjTxDW6nFikfIEtRC975Nz+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_044742_793270_C43DC81A 
X-CRM114-Status: GOOD (  22.44  )
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

On 11/01/2023 12:41, Conor Dooley wrote:
> The TySOM-M-MPFS250 is a compact SoC prototyping board featuring
> a Microchip PolarFire SoC MPFS250T-FCG1152. Features include:
> - 16 GiB FPGA DDR4
> - 16 GiB MSS DDR4 with ECC (Although only 2 GiB is mapped in the
>    FPGA design)
> - eMMC
> - SPI flash memory
> - 2x Ethernet 10/100/1000
> - USB 2.0
> - PCIe x4 Gen2
> - HDMI OUT
> - 2x FMC connector (HPC and LPC)
> 
> Specifically flag this board as rev2, in case later boards have an
> FPGA design revision with more of DDR available for use in Linux etc.
> 
> Link: https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m_mpfs250
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - removed some extra cells properties
> - changed filename compatible to rev2
> - dropped pcie from fabric.dtsi, does not appear to be mapped to the MSS

Heh, no I didn't. Meant to though!
Removing it will have no functional change though, as it is disabled.
I won't resend to drop it, unless something else needs to be changed.

> ---
>   arch/riscv/boot/dts/microchip/Makefile        |   1 +
>   .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  47 +++++
>   .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 165 ++++++++++++++++++
>   3 files changed, 213 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> 
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> index 7427a20934f3..c54922a325fd 100644
> --- a/arch/riscv/boot/dts/microchip/Makefile
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -3,4 +3,5 @@ dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
>   dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
>   dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
>   dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
>   obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
> new file mode 100644
> index 000000000000..51d0c5176b9e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2022 Microchip Technology Inc */
> +
> +// #include "dt-bindings/mailbox/miv-ihc.h"
> +
> +/ {
> +	fabric_clk3: fabric-clk3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <62500000>;
> +	};
> +
> +	fabric_clk1: fabric-clk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	pcie: pcie@2000000000 {
> +		compatible = "microchip,pcie-host-1.0";
> +		#address-cells = <0x3>;
> +		#interrupt-cells = <0x1>;
> +		#size-cells = <0x2>;
> +		device_type = "pci";
> +		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
> +		reg-names = "cfg", "apb";
> +		bus-range = <0x0 0x7f>;
> +		interrupt-parent = <&plic>;
> +		interrupts = <119>;
> +		interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +				<0 0 0 2 &pcie_intc 1>,
> +				<0 0 0 3 &pcie_intc 2>,
> +				<0 0 0 4 &pcie_intc 3>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
> +		clock-names = "fic0", "fic1", "fic3";
> +		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
> +		msi-parent = <&pcie>;
> +		msi-controller;
> +		status = "disabled";
> +		pcie_intc: interrupt-controller {
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +		};
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> new file mode 100644
> index 000000000000..e0797c7e1b35
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Original all-in-one devicetree:
> + * Copyright (C) 2020-2022 - Aldec
> + * Rewritten to use includes:
> + * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "mpfs.dtsi"
> +#include "mpfs-tysom-m-fabric.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define MTIMER_FREQ		1000000
> +
> +/ {
> +	model = "Aldec TySOM-M-MPFS250T-REV2";
> +	compatible = "aldec,tysom-m-mpfs250t-rev2", "microchip,mpfs";
> +
> +	aliases {
> +		ethernet0 = &mac0;
> +		ethernet1 = &mac1;
> +		serial0 = &mmuart0;
> +		serial1 = &mmuart1;
> +		serial2 = &mmuart2;
> +		serial3 = &mmuart3;
> +		serial4 = &mmuart4;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial1:115200n8";
> +	};
> +
> +	cpus {
> +		timebase-frequency = <MTIMER_FREQ>;
> +	};
> +
> +	ddrc_cache_lo: memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x30000000>;
> +		status = "okay";
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x00000000 0x0 0x40000000>;
> +		status = "okay";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		status = "okay";
> +
> +		led0 {
> +			gpios = <&gpio1 23 1>;
> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	hwmon: hwmon@45 {
> +		status = "okay";
> +		compatible = "ti,ina219";
> +		reg = <0x45>;
> +		shunt-resistor = <2000>;
> +	};
> +};
> +
> +&gpio1 {
> +	interrupts = <27>, <28>, <29>, <30>,
> +		     <31>, <32>, <33>, <47>,
> +		     <35>, <36>, <37>, <38>,
> +		     <39>, <40>, <41>, <42>,
> +		     <43>, <44>, <45>, <46>,
> +		     <47>, <48>, <49>, <50>;
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "gmii";
> +	phy-handle = <&phy0>;
> +
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	phy-mode = "gmii";
> +	phy-handle = <&phy1>;
> +	phy1: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +	phy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&mmc {
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&mmuart1 {
> +	status = "okay";
> +};
> +
> +&mmuart2 {
> +	status = "okay";
> +};
> +
> +&mmuart3 {
> +	status = "okay";
> +};
> +
> +&mmuart4 {
> +	status = "okay";
> +};
> +
> +&refclk {
> +	clock-frequency = <125000000>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	flash@0 {
> +		compatible = "micron,n25q128a11", "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-max-frequency = <10000000>;
> +	};
> +};
> +
> +&syscontroller {
> +	status = "okay";
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "host";
> +};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
