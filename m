Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72085C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pYKejcIdv6vyMLF66e4331i74pmrm8l9i/FtRDy9qI=; b=wybNxyq33OIsiy
	SwHYwIVPPSKbiwbvNcHicAvatPucnq+FFVAtTt+ZYv5fzBDlb9w+6drIhCmW+3Zr6wnF592CBuBx9
	ynlV7TcsvbaEo601AsfnBuDlQ0ogxR7DapvyW/OKRgPMyVPmc4tkfCvtZjyiM2QvRx7fKhXcHJ1TY
	YmC/BGYvx22cyfrK0Qrs3KY5urlOkhf7uWcGZd9YLKyLNy/WfWpEsKuvw1WLYNp7DPsCjE3tiyJqw
	XeDDY5dmAE8klVJnAO2l6LW4jv3ABakGY7mQXFjHLYwvUkUHVToQBiG4k1+begGByFbcqAnuoZ2uG
	Uoc601txuTqppFE41/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMI2-006kCd-Ux; Thu, 08 Sep 2022 18:30:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMI0-006k9p-Ia
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662661812; x=1694197812;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=IU1E73PySiuNerKQY4qBD9q6n2T50CGNHPOKh6Evcdw=;
  b=09H14IDzhDYBctn31LsuZZYqZtZBD6B8hDFF/xsgDhu5g11c1N5BgFTV
   QA/KTnppUxWsMDJqMZxH6y7ezbrQ/ttY0jCMJuHXOyoipLdSS6PbmMHj5
   vi8sJB7eNm7FyEnDtNE6k8U9UMQnrTxLi5ltVMvkeYM3Ac8v0IqVD/lJW
   jIsDJWc4+fttF2wJZs9VbohoUphh8+G2r94vS+wFeKvsr0Cn/D6tzosn2
   xOelnQXLPuxctbLPka1dGK9JaO2ggjMlxn65kmHX/GZx0dgRjWBNyHdkX
   jpelkkTDza72QgIU3dfZrAhRwn8o974PZSkNBaoWPat6dUss5c3w6kzNV
   A==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="112806485"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 11:30:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 11:30:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 11:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcRUJmIGad7S1n+UmOFmfyYsErXDXXOzQqchgUlUMN51ZMSQMPUmh8AFPCcGseakYXAZ6YCKGfs1v+uA5Dzj7aS+x8vU9VJNZEkTlMbKYwIdgk8RcrXarP/FmmG7BD4/M9GsC29GfC86m0hKDHmIPR6ox0g6a69I9GKFTxIxH6E+Hvyf4i6ri5agv1RTBAGLqxJWV4lO8Y7TYZ67dx58BNlM+GFXWntbvZ2xBUt18U9wDCqE9t1zYXcuUeZdcCIP9UYCTT/qEm2/TcIBsSQ3GAgugsjAMIwMO+UFl1/fN/d86tIgM5+VH00Qoa+zYJMoC50IQBNQgzd+lXaNSzsbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU1E73PySiuNerKQY4qBD9q6n2T50CGNHPOKh6Evcdw=;
 b=gWzr4CtVDi8cgyOCgepXbc84HUXFNfl4Gt4sP2uz25L6QRgS0I7ow22O0wy5V188RQbJJ3gOzKX6k2rmceEqkmDAmqPe3axSTml5oO0Bh1KyAWSDfmsHS/IPLq6WPSHr0NaYar35su8vdTWUeiQuXbPZQVEOrdV5335Tlh9Ebe0q5FWsoDBkTL1S4cf2Lzhfot//TuKt1btz/7xBKVLZfxMg/8inBRRfG7OpOTHof60sWhLJ6z6wRPAtyVxGERp1ApCe6do5CFOqrlmNPSlamzK/TshvCOfNJ5k6HgNmoRTx/Hk9Hdl/PpDg1NkZYkfiRrLi6ZPSeFrD0K7bQP7V3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU1E73PySiuNerKQY4qBD9q6n2T50CGNHPOKh6Evcdw=;
 b=uafBEyPnk0myRfEnUt5JBqCwpjQsQUsj99bgOEMCju0XhDiC+q6NkY1ZKrzX2pwFm7ap75C1q/GalZZ31vNiQgsUVf4VEIueRaSbxijOYrmMNgGl5ZuPnOxpt340Wbb/NpqCUfn5sUxXMhp1w9M9qwXtN3UPptyXcAHtLfvlDfI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB3941.namprd11.prod.outlook.com (2603:10b6:a03:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 18:30:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 18:29:59 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] soc: sifive: ccache: reduce printing on init
Thread-Topic: [PATCH v3 4/6] soc: sifive: ccache: reduce printing on init
Thread-Index: AQHYw5GW0XsKvKb260KJ1lynBPOtY63V2t2A
Date: Thu, 8 Sep 2022 18:29:59 +0000
Message-ID: <26842418-9b85-3be6-6800-b6e8e409fa30@microchip.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
 <20220908144424.4232-5-zong.li@sifive.com>
In-Reply-To: <20220908144424.4232-5-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|BY5PR11MB3941:EE_
x-ms-office365-filtering-correlation-id: d3260fcf-5618-4606-db07-08da91c8235b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +KvG26NuE2JpiePI38SySLjC0NuV8sWqLZ+w6w/G2Ba0hHg7YsxwO41FuyCiXv+l0twnoSTmfz4hUUgn5jkibTjbYg5Bzfl9pPQNEoYZxZra3u/PFmzHXGMdcIATci5SI1+DURL56XhBguMok2ztAxrFeoKiUC4NhtHC8XU51CijUH2dCmBBUMcK1opb356XP3liAIsfGobkgNn3dmXXD0vzO9+4jMcUqlceuLRXfVeyxHJuJ5EnLgOcuMNcaIjWDa1uK+dt2v26cpWBwvIgwmA1ivKCqK5byc/vdXN+JEowj4WbcG9RCNL2S1pCZTQCCO1Tf6yRlh6Fs5ltg12H4Exg4jhjief0/RGR6wuKZ98yTIfoxqKvfW8ngtzBoDqw9NuU9MOZsSeCRU6VAtln+eoARv9N1PnbqXCWtKnWf/9IuVlZD1Q2E0eswvycElfBj97zwG7QIpP/15GC0GQh3GQl7HgLTCl0lMRTyyAFuAMPvhxVHPl/n5j7mj3vtHrxXXOYZeDCh96S6sXN4zO/FPwZ2uOcHs/XiAvDgByPTY69piuq2knvlTF8BrGjp3iVhushImQWGPcteXaiJOiGICbu/jsIcSvmQ1zOvu9OXqybLgO0WOXOqq3mK1AZkSVDkG3Z+6kuFYXA1q7JP3o6SKHuJZ/PQR5YKj4KyOzzBZmJQVHOZDgQsaOWFzD0u+QhZQ2c/+iFoWJkass9q+SxVYTK3KKGGciEJK0ps/JEVIpXLF77yvFDHfA05ucAsqAMRgaqxh1MYGRXanBmQeHuhDAHfXCFh1i6PK0lF3FpummGvugHHZ24bD2/X0P1HAGgtJ9wObIEX23ueMQsQxerz7HZI+2KeT87hONEMvVNIX8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(376002)(366004)(39860400002)(6506007)(6512007)(26005)(53546011)(6486002)(71200400001)(41300700001)(478600001)(83380400001)(2906002)(186003)(7416002)(5660300002)(8936002)(2616005)(110136005)(316002)(76116006)(8676002)(64756008)(66446008)(66556008)(66476007)(66946007)(91956017)(38100700002)(122000001)(36756003)(921005)(38070700005)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3A5VkFLTDFkOEdHTkhxV3lLbkZKRFFVNjlBR05sY2txYllqN0ovWHRpSjMw?=
 =?utf-8?B?Y3ZTOFJhNEVReDhJejRlcE5STHVjcGpQNStnVUI1eUE0YXJCa1drcGxZYi9B?=
 =?utf-8?B?Ry9WZTUrU0ZLcFJNNklvRi9KTHdEK3huUTRZWFQvUlplV2x4TjRxZG9IMDVS?=
 =?utf-8?B?M3VJMlJjSGJCcmFIanBnNFl3MTJhZ1Zzd0t2RDNrQkFacTNiOFdTWXo5Ty9X?=
 =?utf-8?B?WEhSNTBxUEZYUVdDenhmSERod2pKL0JOcnRTMkRCR0QvUTBBR1d2cXBKMWNy?=
 =?utf-8?B?N1pZU21iYXIyWlhGZjdnOXJXaGRRbzV1WGE1VDNkTHF4dEJXMGI3RTJGc1Zz?=
 =?utf-8?B?cUh4QjhaTEJCZXBWdFVDcUNPNk5zWC81NHpxdForVmJsWU1uZWNRR3k2Wm05?=
 =?utf-8?B?bVRKZDNZUlh1N2lncHF5ZjRsNUYzVHFHZVFXN3Z0SWplN2dGcXdzL2d4d2VD?=
 =?utf-8?B?WjUrRHNiVjl1K25Ib2Q2K21yRXo0NUJDYjYrUFdDcW5IZTZ3a045SkxUYnYz?=
 =?utf-8?B?cjlyRjJQdUs2OWVQQ3M2K0hpR3puS0JqK2taSnlYL1VqYXFhTlNsQk5lT0xo?=
 =?utf-8?B?NFJoQ0hZUk8xbm0xaTMrZDF1d2JRQVJibGtJdFV5ZHJpUkpISlBGL2lmQlR1?=
 =?utf-8?B?bGd3S2pGWVFmZkxobVRlUkJqTmJPSkJrckhUdDRVRzB0U1FWZDdTRnFMN2gz?=
 =?utf-8?B?amQ1NHRqeHhYcFBXNFpQQ2ZwY3dYSGFyU0tZZHB1L1lIQyt4Wmo3RDhraVBV?=
 =?utf-8?B?VFpOcDhzWUtlMWd2SnBZV043ZlEyeHFVU1o0U0gwTTFzY0hqUng2c0hkVjZI?=
 =?utf-8?B?c2lraWo3U3FKU1pJQWFCOXlIVTRTKzJGSk1pWk85VkZTYlJCT28yNDJYRkV3?=
 =?utf-8?B?ZTRBV044RVpjQ3d6di80Zmc4dlpOZE9IZE1tS2RIZFpDTlNYa283cDhMeSsw?=
 =?utf-8?B?aVRMVnIxaGVjQStwd09IVy9DbmtYL0d2aU5yS21MQm5pb29QcFd1WUppalpU?=
 =?utf-8?B?NXQweUUzREhpR1o0akVXd3lqRDR3c0cyS2UvMnVJT3ZJYUljRk40Y2x0RGty?=
 =?utf-8?B?clB1NTZiREc3YmZEelhBZUMxaTQ2VWh1c3p4RG1CRXdWbHhMSTRFSXZ4b09j?=
 =?utf-8?B?TlFKVGcwR0IycXlpeVRRV3I1Ujl3dEJ1UEVTRzdaODdKSlo5aFBtY2QxYmlY?=
 =?utf-8?B?SitlTnpGZzNrdW5oUHVmZGlGeGtFL1BNZ1BRTHNBYVNXNWVVK3pjdmRNNVNC?=
 =?utf-8?B?aENBOGRTeHlrRm05SytDNXpBSTBpblRydDZ3Mzlhby9VQjh6cnVWOUdXbkp1?=
 =?utf-8?B?ZjZCTXJoaWVIbTZTNTJiU0lVSTZPV3JWbEUzQ2MzMDlIUFVBNzdTL09aWlFz?=
 =?utf-8?B?NWkzSll0ZXpLMkhDWUYxczA2VHVaUlVBMUFjT3VyMDBFV2V0YUpJd29wRmM1?=
 =?utf-8?B?ZmNBZktlM0JvSzg5M010T2NIczdzbzMyOEZidzhSajZKdngxTTd3amhabGM4?=
 =?utf-8?B?WTg1NlV6NXNlVng1TVVKTjFZbUg5UmFIcVlZSXJyMFZvc21yOUJ5MnBSYjE0?=
 =?utf-8?B?K0tUaW9KY3NXeGxldzgyV2Z0VDJlb016K09pUlZhS2czR3dUUlkydFEzblJk?=
 =?utf-8?B?ODhieGYwRjg4Qm9FckpCVXF0aGw1YjlTbGhiTHQvSVNubTEwSER2YTRzczZp?=
 =?utf-8?B?NjE5TTM0MWVPeHFmZkpFNWo0YzJaRDNVQ3lnSjFoMzROVVhNRWcycW01QW1L?=
 =?utf-8?B?Tnd0S0tRYmNHRGNZK3F2d01FK3F1ZWpqTGdhVll5V3QrMzEvekx3azlicGQ2?=
 =?utf-8?B?dmJzdTRaUFdmOWFZVkdLVCticCtIUnYwbVpVRUFpK25GbnBSbFNYeWlDeFJP?=
 =?utf-8?B?NVJrNzNSNnYwQk0ybVBKckFPVE5rUzFZRE1BSCt6YmRLMEU4Q08vWjlTMXlE?=
 =?utf-8?B?ME40UUM0RUcwYVlZYWN3WXdFL0VOek96cGRnc2VIa3E1QkhuMXQ3a2lzVjkz?=
 =?utf-8?B?dko0S1htdXZzdWtFY1JlVUFLeSt5WitBZXlrMUdtMXFRQXUvL2NaQk5oNXQ5?=
 =?utf-8?B?M3F3ME5KRGUxVkc5Y2J3MzFQcC9RVzBXdzRPdGlubzVoMFJ3NDQ2TXNodDlX?=
 =?utf-8?B?TnlmOXBpa0QvL0FCTnZ4a2ZOYTlpd1JiRFdyZFFuaVFKR1JaVlZLOHZXam9Q?=
 =?utf-8?B?UkE9PQ==?=
Content-ID: <6FAE92DB2DBFE14B9683EEF881FA530F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3260fcf-5618-4606-db07-08da91c8235b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 18:29:59.8898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rY9xmhX283OcknXWYxXsWpwf0Rt1lCe/K7y4EeWL4Ajdq5MDPT6YZm5Qr8KrR/fZqqSSpqa34NLOxoAcUi01c7yLmCNrvNU2fNjBesYBCCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_113012_706443_39D69A9C 
X-CRM114-Status: GOOD (  18.69  )
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

On 08/09/2022 15:44, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Ben Dooks <ben.dooks@sifive.com>
> 
> The driver prints out 6 lines on startup, which can easily be redcued
> to two lines without losing any information.
> 
> Note, to make the types work better, uint64_t has been replaced with
> ULL to make the unsigned long long match the format in the print
> statement.
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 690c19489317..58d14f11a63a 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -81,20 +81,17 @@ static void setup_sifive_debug(void)
> 
>  static void ccache_config_read(void)
>  {
> -       u32 regval, val;
> -
> -       regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> -       val = regval & 0xFF;
> -       pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
> -       val = (regval & 0xFF00) >> 8;
> -       pr_info("CCACHE: No. of ways per bank: %d\n", val);
> -       val = (regval & 0xFF0000) >> 16;
> -       pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
> -       val = (regval & 0xFF000000) >> 24;
> -       pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
> -
> -       regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> -       pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
> +       u32 cfg;
> +
> +       cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> +
> +       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> +               (cfg & 0xff), (cfg >> 8) & 0xff,
> +               BIT_ULL((cfg >> 16) & 0xff),
> +               BIT_ULL((cfg >> 24) & 0xff));

From v2:
Could we use defines please for the register shifts please?

Other than that:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +
> +       cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> +       pr_info("CCACHE: Index of the largest way enabled: %u\n", cfg);
>  }
> 
>  static const struct of_device_id sifive_ccache_ids[] = {
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
