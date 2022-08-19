Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A548CC25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TugVTRvUfTlAWueOeHBqMSyC/zjO67U3FHEjxSeRnsg=; b=LWoPEYqgq15ff1
	Jl6sb01KcgNGigujGIx28ilLs+QTSq4IjVBkoydSz5DBAhpBkX8//dCnvBgyMIXYLbtAASZW8bDnr
	s77tcW6hbw1LxkpslfEIqbFGzaJJpB0/CUtJ74ln1PX3oCHVXcnHAh0NK+MW9a1xc/JrmhT7by+E1
	vrCG46TlFAerqCvof8B+r8Dfyk4kbLBgjSziBWzOq1ERgCXzgoFsHjWwqKQDT+Yx6StUuj0KoJWGv
	AIDe//6S0TQ4sz9mKgzwGyLJEIjV7HNnMdsBAj9zSNpyKcfREP1Ki/KwLqoEBsRfNhzdrqSGuoFf4
	fgHtPGNnhqdpDvzFk41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOw7E-0034Eg-Vv; Fri, 19 Aug 2022 07:08:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOw7B-003471-1b
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 07:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660892900; x=1692428900;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=v6TVVvHk51PdKaaDlQxjAefUIvYlk3nhHfoqoe2x5rg=;
  b=Ps5Li9MA0FcLQW0zs2SMWYLCBX1FRxEO6nfBn3UviebuqpLOU7Oai4L+
   EeQZghFTH0Sbf45IiiLC2xBwvTZ/kRHIu6YUtTZVH7XOxCA2LXZBYSfcd
   o3wUqhddziScNBV0YtMAaOgxIoEMwNouitFMcbCYQ/9fnpWjIsvuq4Acx
   gR8Ar/N38hP2/DB1hCVoPVeHfENG68EY0UQcvKTvHCznluO6Io2/pgd7R
   rUf/E83rn4R3Y/pbyrXrC36XhC/nJd0CSOFmhAqryMV3BHVcB0QoOURYd
   cq09nxK3yuI7Je+Rx4iYCwdTztWyOW877SwiPuU4GHJAC445Wy25BfBg6
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="173168197"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 00:08:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 00:08:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 00:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F135j/A1H7P4nhn/ZemXq2RZX0KEbzwRbIMwVePnPM9dYMe4lpqg4vJSjZDsq1JHtLv9x+AhcWKrrISMj/xqloqyGInqE3lI7lLOgEhVNKJTeJYEPv80hASqtP/SmsYdXVdhXWDIoyievpdCv39r7bZ7+hjRe0nFuj2TBjqUo80CUx4LGOuHmw+CkZ4Ic2CdgHmfaVud7TKAKunaGbJc9SAKfKYYOeNncI5NMrYmXApF1oQ+ksd2xndxs94mFJKqF/SBJCXCv4K3rEj4UJbs5asOrWDSw5kCBCzheYizdvHTzdGFgxliJB/IKy+cYCTDuOw/U7Pe+hm0RxlxXgmIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6TVVvHk51PdKaaDlQxjAefUIvYlk3nhHfoqoe2x5rg=;
 b=hjL6vzOmzxhO7lMqgzvWNXN4wmUQWFVDAuuPiRsXisIqyKyos1VqPY2M47gYeH47sRHzOoWOX2SG5FBzNrdgq8TtOFsD4mvNPjnro1E3r3HcnOrvXL5B5/GgKiKknB67wNN2wBvo8CkPfHN+ttmjZAuy8UEPcaXHLSLMZwCURraEgDtWb1Fh3J5dlrL+SNxxFDpU7I1gmPq6+METakUWeG6I2UfKsrvtU55NimBOK9zgsFS/KEA2CQIWNCkZB6Sxx2liqyu612FWu93DfVE240WNnwkTNIsy2KQ3uY/PRB2ulb6wy6onWUFTfXXHYGnyXMJqMYWXS50wEanUG3nTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6TVVvHk51PdKaaDlQxjAefUIvYlk3nhHfoqoe2x5rg=;
 b=ciMcKLwacrBYEBiAZenDR4n2e9NQ8OdfREDbczl2xTorPtnNp0K3BG8CSSgQ9XxIBe7AxkTyEQmQS57UYjnpr9OHQvvNgWos61A1UqViMvXMb+ajvO7zJfBN6zFvqP6x2d2yhSB8LDpx7O6ZTBjqXo5dmvAceDojM2lhzk5qreE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4349.namprd11.prod.outlook.com (2603:10b6:208:195::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 19 Aug
 2022 07:08:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 07:08:10 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <ben.dooks@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <sudip.mukherjee@sifive.com>,
	<jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Topic: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Index: AQHYlwUDWewAM0BLJUeq97TdYernnq19aZYAgCz094CAAAVQAIAEXu0AgAa8KwCAAIfOAA==
Date: Fri, 19 Aug 2022 07:08:10 +0000
Message-ID: <71ddab3b-a38e-7957-d3cb-65d6ba64c4ef@microchip.com>
References: <mhng-192f7819-dbb8-4cd0-af6c-ef89d5579a14@palmer-ri-x1c9>
In-Reply-To: <mhng-192f7819-dbb8-4cd0-af6c-ef89d5579a14@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7125e94-0a43-4958-4796-08da81b19346
x-ms-traffictypediagnostic: MN2PR11MB4349:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uf7ScBpikJWjsh+zhAMXmGwoC2PJBEoWH8ib+p2VwTDAzkNZdaRqILi3pPBi5YYgiM9n2YozsoCiw+SSTw5wK4HMDPqroZR0rCS2ETqr926Lh0wFZzsZFH5MndRFA0S5ny1itor6Owtt6EJudVZd4JX3OQVLApOrxKWZjgfgtNZouqDuyTRmsfFcx+B61Qkqo/ZUohh+bOsf83528S3HmLpOjfouSSsF6xUsX78RytDTRcDnjj98hUzPsXFVwZLQzLvJBwKzOW654VXgZrEX57I+gxOe6gtV8te3PQiJUYbAx2+Bdzwlh6gA8PMBHTTuIiTb02OQZZFI2rug4Z/xVYcwJ4sVxpWHzqxu8YG5rESVAUhPTSPfwgHtoMBJ6qkhkrvRendzzyZeJw+tzJiJGQgr14XqVjUd24sM0GWqAn9tU8Khx7uzJP5iadbkN4pH/P9Owz9a8vIfnLfLuqKaetg3uc7VBndGX0zMTa+3l0zs+6Ykm1CtgB2ot8k09LTa3eXOj8J1C8ycjpD3uYEfq1HwnXMP0+s/TTEjRK5rHH3un/hJpMF7Z0NHWdWEFTSbLN46+qdnvfYV9OQqJWf9vfgV8fWA8VEdmCeec5eR1+fmJaFvD32ed++nYCPTWvwTK3a48qjx/xDcBzvVm2zuRBZot2zGwS6yHpbcBlkudFQ6FVl8/QmW6KLcomrQLHiniDbEndDfYmW4I7yxoC25dew8n9ZC9EpMdPcf0kr4YiQ0HE1vmJ31BoaoyBTMRm4Zs3+G1aBu8nESiM5/PUSw/2lOkosAq/tBzHjNvzyIHmzucZASQ+XqkLLLTruhS848pY5eZMgXLc9Z8dslANSohQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(136003)(346002)(366004)(31686004)(66946007)(186003)(41300700001)(66446008)(2906002)(64756008)(66556008)(8676002)(4326008)(91956017)(76116006)(66476007)(83380400001)(36756003)(316002)(54906003)(2616005)(38100700002)(122000001)(6512007)(110136005)(31696002)(8936002)(6506007)(38070700005)(478600001)(26005)(5660300002)(53546011)(6486002)(71200400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVBIc2M0MzVvWmE5YWpZNU8weXNFSnZpaWF4bkVoc0RhcWk1SUVpOWgzcUNG?=
 =?utf-8?B?bzQ3OXZHNzBsTjFoaitQUVF1N1JReWk0YTRlcDkzN24wd3dpL3ZwbUV6SnZt?=
 =?utf-8?B?MFFDdXlFS25PTlBDLzZ4SVVNaExGZ1B6M3NrTGk0c1hNQzl0OGQwZFBUOG5w?=
 =?utf-8?B?Um5vZzNnWHVvMktNb1hCSUNYQm1mQTVoR0pKVTlVSGZvSzR0ZWU5QlhST29P?=
 =?utf-8?B?NkJPRWhlVC9VTVByOHhUV1JncTRBRi9IVEF4cDIyaWc3YlE2d2NvRFlNNm94?=
 =?utf-8?B?Z3Rkb3poV09pM3YyN0x0bXhQTDE4V0I1dnBrRW9IOTBRbUZEVmFXV0tVVUo4?=
 =?utf-8?B?ME9YdFgzUDZtOVVzaEk3NEp3eEs3aUl5UnpWQU9QWTJJWXd5QzBhUTlpTXFU?=
 =?utf-8?B?NzZ0dHBrQ2ZFalUxUXJQR2ZlNXN6QUNkcjArV3JudHNMTGMwTzVZR2NqUkN1?=
 =?utf-8?B?ZTB0U3NBWjNnNU1NMlFuakk0WWM4Qm82SzRhWStFeTkzaEdpd0ZFeDZ5YXQv?=
 =?utf-8?B?TE1aVXh3bjBOZE1yY2lpTEhUaW5TekhXSUZ3aG5lclJFZGswQ1d2cll1dmww?=
 =?utf-8?B?eFNid3QwSHRIdzBBS1JGOExNY280L2pscWE2aWdCWWtZbzF2TDFTK1p2b3J1?=
 =?utf-8?B?TEdVcFZGK2FmTFBpeHdMSjA1SUg4WWtKU0NPVGU0Qi90dGE3T3FjQWFPY0Q0?=
 =?utf-8?B?QnNDTFFEWS9wOSs4b0FYVHk2MjQyczBkVy9OUVB3NmxCODlZckl0T2VEbWh4?=
 =?utf-8?B?RlV5bi9lZEV4VlkrWkdMMWRHVjJicUtibmFaVFY5RTFzQXlUV3pQVGJPaTE2?=
 =?utf-8?B?YmpVN0FSSGV5WG9ZZ0JBT0pxblZPanV0cVI1b2VjNC9RMGNLZm8rWThjRWZt?=
 =?utf-8?B?S29EU3RPaVBXRmM1U3czSXRqbVNpSnduSytqeU9mRGVOaEgzSmh4RFpvOFFt?=
 =?utf-8?B?LzFGQ3dUNHRkQXQvNm9CYy9tRmxlWFpodlRsTDMwbUlROTc2SGRvZzVyaVVx?=
 =?utf-8?B?TUozTXNUVGtxbWkzM25wb1ZlZUphemN1Tzg4QUhITkZSWW00eENHSGx3ZjBU?=
 =?utf-8?B?U3R5Z3VDaW9GYlZ6NDNIc0pGOW52Vm5RN2ZMdnlla2hzazNjeXErY0pYb2Vp?=
 =?utf-8?B?eDcxdW0yTnk0aW50Rm1FWXlXdHFUSnZwQ2MxdmpjZ1Q5YXJka1N5RkpTaFVl?=
 =?utf-8?B?MHE2UDVueEpMdUpUV2dnRFh6SmsrMnhhaFMyOXBjbVk1eU8yUmF2VThwOWo5?=
 =?utf-8?B?bTZDQ0R0Vm9CZDY0c3luOGZGRUZTS2NtdWdJRkcvREN3MG5EYzJiRGJCODZk?=
 =?utf-8?B?a3pIdUtiUmNSNFFmWFlzditpNUp1aXRoeExNRHVsYnVlQTdkU2lvaGsyWFF0?=
 =?utf-8?B?VmVRUCtHWEFRblQzVDdzZ1ZlY1lNdWt2TmJEU2RCZ2FKakZYOE92REFPdkFZ?=
 =?utf-8?B?Qmw1NHRVbDJSN1JJZ2R3RVZFYW50WXJiMlZDeW9xcThOUU0yRmNsZ0VQaUM5?=
 =?utf-8?B?OFZFWGVZL1JkRklSckh0VDZjUE9MZGZNbmRMdWY4cjNnU2MrSFdDZXpoVHZD?=
 =?utf-8?B?WHVFK0szS3VZZE1GMjY3YjlUUWZ2aEJ3N2JLWFhSY2JBdTNhQm1zWFJ2ZjE0?=
 =?utf-8?B?dUVGVzQ2UXc1Y21tSGg4bGpRTXhBTGZWbEQyTndGRDg4NUdCREMvZG9Ob0x0?=
 =?utf-8?B?dTZVQ1lWcG9UKzVYVjZWbXk3MlZlNVFDcDA4amlGbml4OTAwdkVHeFI5bHdR?=
 =?utf-8?B?YUYvVks1L3BYYmNSVUR6TXZxZ3NYU1dmZnVBZlJuaDFxKzBLWTRhb1pDSWRs?=
 =?utf-8?B?UjJjUnlhWko5bkN6SkNKbUhjMDZyUW5WMTZCdEJrZVFwTGVucGN3OEcvR1Ax?=
 =?utf-8?B?T0VEKzdhKzM0aWpDdjdQNWhCS1ZQWlJuK2w0azNrZWl0azQvWjlwbkw2M09J?=
 =?utf-8?B?R2tZTktVNnRXOVFldDJRclkyRzFVVno2YTl0VWxWNTZQODdUUnhHMUUrU1lL?=
 =?utf-8?B?K2NVMjJ5Y0dxamhZWUl5bFdRU3o5RG9DbzEySm80THEzQThGKzVHdlFRZGgw?=
 =?utf-8?B?QUQxa2FTRlJqeGVka0UySUZWTWNIdzRQZjBXTDFJRnhUcE05NE5FYlNxZkR0?=
 =?utf-8?Q?RpUPlvfrxfnTvUpoCaaGcoD4V?=
Content-ID: <00796D3ABA7A21489857B0FAF5CFC958@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7125e94-0a43-4958-4796-08da81b19346
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 07:08:10.6241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yylLojgDmvFR/Z4lPbPifB3oM7928HBFYplx/Zd4jfYMJDthBvtk6BteEFI0M2aUp8mXLzsNstK6GY5I7lumIaeAIlCW09G9VFLiuXG3KC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_000821_516462_EDA8D414 
X-CRM114-Status: GOOD (  20.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvMDgvMjAyMiAwMDowMSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gU3VuLCAxNCBBdWcgMjAyMiAwOToxMDo0
OCBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAx
MS8wOC8yMDIyIDIyOjI2LCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+PiBP
biAxMS8wOC8yMDIyIDIyOjA2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToNCj4+Pj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4+DQo+Pj4+IE9uIFdlZCwgMTMgSnVsIDIwMjIg
MjM6MzQ6MzYgUERUICgtMDcwMCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
Pj4+Pj4gT24gMTMvMDcvMjAyMiAyMzowNiwgQmVuIERvb2tzIHdyb3RlOg0KPj4+Pj4+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIHZkc29fZGF0
YSBpcyBkZWZpbmVkIGJ5IGhhcyBubyBkZWNsYXJhdGlvbiBhcyB0aGUNCj4+Pj4+PiBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvLmMgZG9lcyBub3QgaW5jbHVkZSBhc20vdmRzby92c3lzY2FsbC5oDQo+
Pj4+Pj4gZm9yIHRoZSBkZWZpbml0aW9uLiBGaXggdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2Fybmlu
ZyBieQ0KPj4+Pj4+IGFkZGluZyBpbiB0aGUgYXNtL3Zkc28vdnN5c2NhbGwuaA0KPj4+Pj4+DQo+
Pj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jOjQyOjE4OiB3YXJuaW5nOiBzeW1ib2wgJ3Zk
c29fZGF0YScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4+Pj4+Pg0K
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQHNpZml2ZS5jb20+DQo+
Pj4+Pg0KPj4+Pj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+DQo+Pj4+DQo+Pj4+IFRoaXMgb25lIGdpdmVzIG1lIGEgYnVuY2ggb2YgYnVpbGQg
ZXJyb3JzLCB0aGluZ3MgbGlrZQ0KPj4+DQo+Pj4gSG1tLCB3aGF0J3MgeW91ciBkZWZjb25maWcg
Zm9yIHRoaXM/DQo+Pj4gSSB0ZXN0ZWQgd2l0aCBteSBkZXYgZGVmY29uZmlnIGFuZCByaXNjdidz
IGRlZmF1bHQgb25lIGF0IHRoZSB0aW1lIGJ1dA0KPj4+IHNhdyBub3RoaW5nLiBUcmllZCBib3Ro
IGFnYWluIG5vdyAmIG5vIGVycm9ycy4NCj4+DQo+PiBSZXByb2R1Y2VkIGl0IHdpdGggcmlzY3Yt
c3lzdGVtcy1jaS4NCj4+IExvb2tzIGxpa2UgaXQgaXMgaGFwcGVuaW5nIG9uIG9uZSBvZiB5b3Vy
IDMyIGJpdCBkZWZjb25maWdzIHdoZXJlDQo+PiBDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxM
IGlzIG5vdCBzZXQuIEluIHZkc28uYywgdGhlIGluY2x1ZGUgb2YNCj4+IHZkc28vZGF0YXBhZ2Uu
aCBpcyBndWFyZGVkIGJ5IENPTkZJR19HRU5FUklDX1RJTUVfVlNZU0NBTEwgYnV0IHRoZQ0KPj4g
b25lIGluIGFzbS92ZHNvL3ZzeXNjYWxsLmggaXMgbm90Lg0KPj4NCj4+IEFkZGluZyB0aGUgc2Ft
ZSBndWFyZCBhcm91bmQgdGhlIGluY2x1ZGUgdGhlcmUgZml4ZXMgdGhlIGJ1aWxkIC9zaHJ1Zw0K
PiANCj4gRG8geW91IG1pbmQganVzdCBzZW5kaW5nIGEgdjI/wqAgSXQncyBhIHRvdWNoIGVhc2ll
ciB0aGFuIHRyeWluZyB0bw0KPiBzcXVhc2ggc3R1ZmYgaW4uDQo+IA0KDQpCZW4gc2VudCB0aGUg
cGF0Y2ggc28gSSBkaWRuJ3QoL2Rvbid0KSB3YW50IHRvIGVuY3JvYWNoIGJ5IHNlbmRpbmcNCmEg
djIuDQoNCkJlbiwgRldJVyB3aGF0IEkgZGlkIHdhczoNCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRz
by92c3lzY2FsbC5oDQppbmRleCA4MmZkNWQ4M2JkNjAuLmU4MmNlOTdkMjdkMiAxMDA2NDQNCi0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oDQorKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaA0KQEAgLTUsNyArNSwxMCBAQA0KICAjaWZu
ZGVmIF9fQVNTRU1CTFlfXw0KICANCiAgI2luY2x1ZGUgPGxpbnV4L3RpbWVrZWVwZXJfaW50ZXJu
YWwuaD4NCisNCisjaWZkZWYgQ09ORklHX0dFTkVSSUNfVElNRV9WU1lTQ0FMTA0KICAjaW5jbHVk
ZSA8dmRzby9kYXRhcGFnZS5oPg0KKyNlbmRpZg0KICANCiAgZXh0ZXJuIHN0cnVjdCB2ZHNvX2Rh
dGEgKnZkc29fZGF0YTsNCiAgDQpCdXQgSSBub3cgSSBhbSBub3Qgc3VyZSBpZiB0aGF0IGlzIHRo
ZSBjb3JyZWN0IGFwcHJvYWNoLg0KVGhlcmUncyBhbiBBUkNIX0hBU19WRFNPX0RBVEEgaW4gdmRz
by9kYXRhcGFnZS5oOg0KDQojaWZkZWYgQ09ORklHX0FSQ0hfSEFTX1ZEU09fREFUQQ0KI2luY2x1
ZGUgPGFzbS92ZHNvL2RhdGEuaD4NCiNlbHNlDQpzdHJ1Y3QgYXJjaF92ZHNvX2RhdGEge307DQoj
ZW5kaWYNCg0KSSBkaWQgYSBsaXR0bGUgbW9yZSBkaWdnaW5nIHNpbmNlIHdoYXQgd2UgYXJlIGN1
cnJlbnRseSBkb2luZyBpcyB0aGUNCmV4YWN0IHNhbWUgYXMgd2hhdCBhcm02NCBkb2VzLi4gSSBz
cG90dGVkIHRoYXQgaW4gb3VyIEtjb25maWcgd2U6DQpzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVND
QUxMIGlmIE1NVSAmJiA2NEJJVA0KDQpXaHkgZG9lcyB0aGF0IGRlcGVuZCBvbiA2NEJJVD8gU2hv
dWxkIHRoYXQgaGF2ZSBiZWVuIHVwZGF0ZWQgd2hlbiB3ZQ0KYWRkZWQgdGhlIGNvbXBhdCBzdHVm
Zj8gSWYgdGhhdCBpcyB0dXJuZWQgb24sIEkgY2FuIHRyaWdnZXIgdGhlIGJ1aWxkDQplcnJvciB3
aXRob3V0IGFwcGx5aW5nIEJlbidzIHBhdGNoLg0KDQphcm02NCBhbHNvIGhhcyBhIGNvbXBhdCBz
eXNjYWxsIGZvciBfX05SX2dldHRpbWVvZmRheS4gSSBkb24ndCBrbm93DQphbnl0aGluZyBhYm91
dCBjb21wYXQsIHNvIEkgY2FudCBjb250cmlidXRlIGFueSByZWFzb25zIGFzIHRvIHdoeSB3ZQ0K
ZG9uJ3QgaGF2ZSBvbmUsIGJ1dCB0byB0aGUgdW50cmFpbmVkIGV5ZSBpdCBzZWVtcyBsaWtlIEJl
bidzIHBhdGNoIGlzDQpleHBvc2luZyBhIGRlZmljaWVuY3kgaW4gb3VyIGNvbXBhdCBzdXBwb3J0
IHRoYXQgbWF5IG5vdCBoYXZlIGJlZW4NCm5vdGljZWQgYmVjYXVzZSB3ZSBoYWQgR0VORVJJQ19U
SU1FX1NZU0NBTEwgZGlzYWJsZWQgZm9yIDMyQklULg0KDQpFaXRoZXIgd2F5LCBJIGRvbid0IGtu
b3cgZW5vdWdoIGFib3V0IHdoYXQncyBnb2luZyBvbiBoZXJlIHRvIHNlbmQgYW4NCmFjdHVhbCBw
YXRjaCwganVzdCBlbm91Z2ggdG8gbWFrZSBzb21lIG9ic2VydmF0aW9ucy4NCkNvbm9yLg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
