Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF81AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqVkbFA2i0SXGpVhq+etrDC4QWeylurfwOos/OReVxE=; b=BfW8JuZL0gTH28
	KnzftpDwPyrj6GxZNiny+9pYoL9RuCirLTfGNwztgnnZ0dA1jwlW/2c+Z8RwwArTjCrAKHfy0OGoE
	RRyK8Lr2LW8n/uo/KxzhwF7Ke1yYFr0C/VjhZZd9kbAluJSN6TRdHRFcGRKWEU+5M7bc1nKxhEGFl
	VgrGFzJRWKG2r8Ta8MXs0xDggSfhtgfCaC58Z+lgLcaQj8w7AAR8OkzDB7fA7ydwz+D9uWSsLVhIA
	L3pqgrgrxl8QUaCErq/Qswz3KPfIesirTFYahgtbXxh/ZL+p0eF+NlJrCQ0OpzrhS3ek9CigupVNn
	TSdwXL6hRJJNcP9Mk1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJ2T-009ayy-V5; Fri, 15 Apr 2022 10:18:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJ2P-009avt-1i
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 10:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650017929; x=1681553929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rByQCXCHqslh58SAbmIK0js/50YI0hjP4DuLwWJ+XJk=;
 b=bz5QupibXUK4qwTzCJRrt7w0s8cVc7wJBajC+OqC880o+xBs5q79Cyo+
 GqXB6uvoldCDFgmqhCejyAer+4WkdXu4Fk4u02ezNh3UldkPVjdGqIzhi
 +ESLJgmWs16IWmj9BbK9IlOZgSAOTcEM4ni8fBK7Os4A38wM5DAE84/Yd
 IkyA6KQlWhS6XiwEbNZRHsKRVypiUbhqLM5Hi7onV9VHsTOs5HliTzARC
 ylGthzl/z0/5jJw0bTspSxY1HROIWS2j3T5C8oJV5K2Swh4twD4u/YEkx
 K/q6yBQle23eOUeuOuooj0muagjGhs6JOxUettfp00R9kI73FPdEdXhyW g==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="160214243"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 03:18:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 03:18:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 15 Apr 2022 03:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WarULwrmn5wYenKXIWnli62sNMTTL+qqk1m/w3SWiTIbpyKBozDvEv05mXIeM0Ej6canQH71SQx7rXBkrwBKApnzJQR2G5E82pmalVLs6DOdhyDDZdraGoc8ouC8SosD9ux55LNGNs1FQ0H4ebmyw/LOUGdD4r7akN0mv5dbKIJ9pNtq6IkPglDMYIfOrKTvwUW94GVNkzeB3wQg/uEz1d6b6oa59YuoL05nN4gUedQhRgz3Vrb5qksm742DlGs5B6qBm7+cCRtQcks+XFJlZ8MyR+1Bck8W6aZZ63x7MORZNcsxcTAMZCDPIOzln/CLyOVvBNLkcfQUZxJ3FAHw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rByQCXCHqslh58SAbmIK0js/50YI0hjP4DuLwWJ+XJk=;
 b=Bwt1cTgCaC9u3rL++Evh3aSFunFKbha2EyMQXM3cKFC/crk6B7y9BYZQgAY7gEn8WbTmaBaS0dgN6fsg0zhlA8hCypdpAwyeq9UGChuzDeBe1XPwHIIQQ/hLlkyH8flMm8KtJInYbUGtzmOq47HYYmN6wRKH7wMHALXsvA5CnvQ0zrU9M2jT9GtCSqIUQqj1ZgQaAa9Te7hf1qwyRTXmQN197uyjrrBbhBBMS3kZ9+efox911XU7zqgN+0Yc/k03bA20wlvfPxjbYXVOvTpq7nVlfGyKKDQx4HWl3+LtyIMBrl/m0tzgIMThI1WXmjfGl6zK3G5qw2E8Y85BIlwBjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rByQCXCHqslh58SAbmIK0js/50YI0hjP4DuLwWJ+XJk=;
 b=kndocQmkrCxMjGP+4ezDQFBAt+9nnKZ7w6zoGG3EIUU9MrnVJfVdUAicONeCLisJ27dKSz7XDx/wj1cUUCyVhO98NoXp+UmP5XPxwQN6aCxJ4ixjiTURPhYpAHTppVYDIABLnNkmbbc2STxdFsl64ET15Snp7eY2Vw1kEqrdepU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SN6PR11MB3422.namprd11.prod.outlook.com (2603:10b6:805:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 10:18:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 10:18:42 +0000
From: <Conor.Dooley@microchip.com>
To: <herbert@gondor.apana.org.au>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: hwrng: mpfs - Enable COMPILE_TEST
Thread-Topic: hwrng: mpfs - Enable COMPILE_TEST
Thread-Index: AQHYUKQdOKs793R880+LzEocloZDpazwwvmA
Date: Fri, 15 Apr 2022 10:18:41 +0000
Message-ID: <cf6b0236-32d7-09c3-db00-702a2a92bf71@microchip.com>
References: <20220408100911.1638478-1-conor.dooley@microchip.com>
 <20220408100911.1638478-2-conor.dooley@microchip.com>
 <Ylku27J41IMmMe7x@gondor.apana.org.au>
In-Reply-To: <Ylku27J41IMmMe7x@gondor.apana.org.au>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d9d4d5d-187b-49fd-6304-08da1ec950da
x-ms-traffictypediagnostic: SN6PR11MB3422:EE_
x-microsoft-antispam-prvs: <SN6PR11MB34223ACCB919F15D89BD797398EE9@SN6PR11MB3422.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eDT4CIWGj37jjdQLbtopNFSXG/O5e4/nzxlX95v407YjPRo6zOf72eyTMjWeMm+BeHO9x7Ik5KB6+PUoJvdnlgKixSNQiXknXVJzVjV90eIa+ji945JEnh/JmGZZAxvd8i/DuGaD5bwLKCUBrQdXE3wu5Goc7igZGhdyYI+ERSPPb0+rLp2tNWyxYSUa9VN69rmwCCfcMWt7CQzs38KmQcrTHvX5nlz7hAbhgd7veuu/Ado71POLAsnsuN5lpinPtu6r/lrHGueSIjo2xYTeXI0jy0mXNvjnueaAGYU/7aQkIurhZQmaLhrjV0db7ghiqtknTzji5xLhMtgvF6dr9TBcKrqt1IIoxBjd76gh0Ih+duz4HD+ERA78a3xZ+M2qjn3PukWlYEmG6WX1MAG3gVOBGMDbRg15w6wGMyEs2Un168wFH2VOUSH3kB2DdFWcj8LIqmqoK0M6UBFBqQY4Dd9Equmprb5Wzfab123bgnmFM0kBx3u7oRXH6dI8IK83Szjd/LH9dpFbInAphmgZwxP7uWrBevHpXhiAATZEHBPyKmJf7/As1LP+zHF7DGmesh7+jbnMRVJxauLm+OTP/D85jIfS9PGt8ByYUlmCgJ6UF8eZZ5Lk5iYTK08f51AEfA8JcQJ43OicPd7moWCvezIlj2hOlVb2Ea/OCn09Y5bnHhx7YUHHTHyKFjjFFUpjQ6owUN2APMOIijmd9JQwMETojAzggyH+GEohFfoCHPfPzRCXMePMPo+BD/vTFfAuBJrHhhrlwqxkUqk+2YjDSDxovgajeyGVbQ4rYyrvWnIFadZrEoBoL0fnl5Jrcf8z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(53546011)(66476007)(64756008)(66446008)(6512007)(6486002)(6506007)(508600001)(26005)(31686004)(36756003)(186003)(38100700002)(71200400001)(38070700005)(66946007)(2906002)(8676002)(4326008)(5660300002)(76116006)(31696002)(54906003)(86362001)(316002)(4744005)(8936002)(91956017)(6916009)(122000001)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2szcGZuaUI3NjQwbXdLbTc4MnExUko5MTVJZ0thS2F0allycGdNNGFwK1Nv?=
 =?utf-8?B?b3Y1NHdvMDdZN0RObzlPVGM2enBTZ2RRQXdpaklHTHVaanFKL1dERHlWbll1?=
 =?utf-8?B?bXhMNnVTUiswMnZOeVBoemRBeG9ScVVpRkk0MDd4MmdTSkhKU1Rac2Y3bTNB?=
 =?utf-8?B?dGVHVkIzZHJZWURjSzM3K01WUGJYTmk1OFBjcVYzbEVubjV5ZUtTYWczVTlI?=
 =?utf-8?B?Z2VVNnZNNUh3Y1JOQ0RXdUhkYzAwOVQvaHpSeUxReEF0ellkNWZGV2NlTmp2?=
 =?utf-8?B?anNOK1lHUVVhV1VacmdzbkE0Qk9DOXNIbTBFOFZDbHU0K21VMDRZSW1oNFZP?=
 =?utf-8?B?T0VYL3QycnlhSFJkS3ZGU29tREVzV0NkdFZJelU1M2tMRGJBZjhoTlZsMVNy?=
 =?utf-8?B?OEJDTUk1cG5rbzBOUHlWUGJDdk5tMTd5ek9BWXllM0lXVFlTcWF2bXlRZlg5?=
 =?utf-8?B?T2J3a0xwTUF2Q3BwbzlKM2NENEh0amEvZXJoZmlIRm1oaUY1SXZkZzBjQXcw?=
 =?utf-8?B?N3FpZkV4Q0VQc2hUa3V5WWJtWWlLdVkvYWNMVHpaY3hqNGJqTzZ2cEpQZnFW?=
 =?utf-8?B?R00rQUhtRU1CaVBsWGhBL3Y4aWhqTDE0RTQ5dHM5ckFvdE4wdEsyWEVySmxG?=
 =?utf-8?B?WHR3N2ZPVWtqS2djMHhqK2tnVjJJTHJrS3dpaFhKZU1xWW1haEYrd3k5ZEpX?=
 =?utf-8?B?MXBlY2J5Tk9HVkNkZGdBekYwVFU3Q2h5dEY5TTUrQkxWNkc3b3M3eFRCTFpZ?=
 =?utf-8?B?SjJybFZwREl6eEhIMzVEYmkrUkRGOTVBTnlabW9ac25GdVBKRVF6Nm1reVAr?=
 =?utf-8?B?VTZqcDNtaU43SVlvTzk2L0FRS3dyTkx3MW9STVhNU3A0SHo4a3ZmM0VXQTFB?=
 =?utf-8?B?S3A3ellOaHZQMitOWTlDRytGYWdrMjJlbHhvS3pVbUk1a3ZJWWxNL1hTT3NQ?=
 =?utf-8?B?Z213WEdrUmsyUjV5bEhHdm9YRW5oMVQwTXlKS1lMOVN2VWVaSDdXQ0o4L0gx?=
 =?utf-8?B?eWVzaHMrWkczcjU5ZFRuSW45Tm11MUhQZklPSWdYVWNJOHg1NW1pMThkWStx?=
 =?utf-8?B?UGVnQ0RkOUVmdmNtZW5IK0EwQmlIMExITzJQazh4MEYyRTRRN1Bzcml0TTU1?=
 =?utf-8?B?cWpRSW93YWhpcHRxZXRqMkM1cFpsWHdQQlRIdUJrTTllQUZ4WVI1SVdNdFQ2?=
 =?utf-8?B?RW9kajNFRU1MNE5BVEtydUczT0RtT2dqZU9jS204eTZ6UE9QdWJubEJSQ2V5?=
 =?utf-8?B?SWIvbTRyVmEyUFNscFZCR2pReHh3b2kvU0lmMzNkZkNKV09aM3JQUVhFVGcz?=
 =?utf-8?B?RnBqWE5SeTVlUkdZRm55V2J2czBCK3NBMTdBU0c4R3U4dkw0eVJrQVhaQ3Ni?=
 =?utf-8?B?VHRZb1cwVmx4dCtXRmNFSWZtdkE0Vldzc04rUGNXRDljaHJNU3FWWVFadkg3?=
 =?utf-8?B?MW1hT2F0bC9INkx5eXMyNUZLcFNlbXJFVTNsMm5HQUlRejFzNU5rQVhZb0JU?=
 =?utf-8?B?ZzZMWXdaUVhZYUtkTTBOMnZvZHpuSCtqOUt4UXBDaHJtUDBXendXSHZINS8z?=
 =?utf-8?B?TVFaVXVRb094eXNIcVUrSHRFWUo1T2s0QjB4N0xFUUNoczgxRVhtYjR5WU1M?=
 =?utf-8?B?bDhPWWdWcXhoek0zcGpBUTNhd0JtN2E3SjB3MGg5bStXOUpqdUZyTzliNjR3?=
 =?utf-8?B?MjRJWisvTnoxclJCQWJ1ZGxjTkk3d2tVOUdRRC9CMDNpVmVvK0k5VkRsM3dJ?=
 =?utf-8?B?aXdFV2FRYmtNckVKQ252NWs4L2M3TzlLS1NuTFZWQXRxN2l2cERYa0duUUp1?=
 =?utf-8?B?MXZlbS9lVDJQTDl4cURYU1JJdE9vVEJsVjUyRnlxNWVjZWRlbStPMWF1Y2kr?=
 =?utf-8?B?MDRIc0IrRlM0VzJLaTdLc0xZaktYSXBsemtjRzlSdnlKK2NqQWhBK0cxR3RZ?=
 =?utf-8?B?SUpjcnlYVjJFazJ4RGxuKys2dXYzZWdUMGZlMHNBbWFtSGwyTU5MM293SVlS?=
 =?utf-8?B?SnlmY3NwQm5zMHRFWGxzSk5Xb2E1Vmc1SS9NdmNXRGxPd21CdHc0MGptdzVC?=
 =?utf-8?B?aVhiY2RXYmZnSGNXd1R4SGxVaE5tTFNIY2ZXb01FUzI4RGttbWw2cE41b29S?=
 =?utf-8?B?Qk8yaE4vRmxZZFZRZU9FU0RwY1FubW9yOC8zR2ZqUTdHVy9OeVVFcVhmbTBV?=
 =?utf-8?B?TlVmZjlIaGNnNUFyc2Z5d2xySzJscjJJRUY5YmhOWUJtdUdNeXRpeXFnSFYv?=
 =?utf-8?B?WDdOQ1V3cEtEMDRtNkVUYWJWYUVxQzFlLy8wMEl2VGJrUm0weFo2ZnZ0QzB5?=
 =?utf-8?B?bE9rV2hWZyt1N1ZjbWQ5L2FwajVpeGpiZ2xLZ0RZdmpDSThnRUUrUT09?=
Content-ID: <7151962A4196A84D971C05310B2E3B10@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9d4d5d-187b-49fd-6304-08da1ec950da
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 10:18:41.9158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mg9+2idQrv9HvO73gI5wnytBE0UFRFLuI9s3NbOInH5pjXwcAnEElzRr5bSCcy8+H4fLUiobdQlAVPIfB7GjtIn0PGhPkPbh669uV7I0mKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_031849_405520_0BE7BD85 
X-CRM114-Status: GOOD (  12.19  )
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

On 15/04/2022 08:37, Herbert Xu wrote:
> The dependency on HW_RANDOM is redundant so this patch removes it.
> As this driver seems to cross-compile just fine we could also enable
> COMPILE_TEST.

Sorry about that. Compile test makes sense to me too.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com

Thanks for applying my patch :)
Conor

> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
> index 18aa97974b8b..dad084c0ecee 100644
> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -387,7 +387,7 @@ config HW_RANDOM_PIC32
>   
>   config HW_RANDOM_POLARFIRE_SOC
>   	tristate "Microchip PolarFire SoC Random Number Generator support"
> -	depends on HW_RANDOM && POLARFIRE_SOC_SYS_CTRL
> +	depends on POLARFIRE_SOC_SYS_CTRL || COMPILE_TEST
>   	help
>   	  This driver provides kernel-side support for the Random Number
>   	  Generator hardware found on PolarFire SoC (MPFS).
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
