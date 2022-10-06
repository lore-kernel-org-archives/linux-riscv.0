Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30249C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=da/+TXXr1wE2hTp9JPxRagVh1m5TX5sXO78us8NBRAI=; b=ovpzFUk01RshBv
	jwW+lWywZdz6SWO4VmvacYXD3y2zqU5yZ/PJx1twQadA9JiMSHSTgFVfnkuuj4vUTRTbbZQXb2MJ/
	fRm9BO1XbuF4mCgSknfSlNRK3c0SwhFxt5HnJmgNmyp7o0zt7TkUuAdVrAFyu2TzsxglmlbIDC1VI
	t2QzSZY7rWxUK0VzYw+oxQK3qJIQXsoibYnOtt38BkjGKSN3HHpoASAqA2B/O/t2d3vaxPnZSUAnn
	JhsD9/JPJzqPbg0mZHE/ezDZ5Rtlkl3tXrTJMs1CnD/yEaJ3vyunwS9nX3ynljIxK5+O400NT5Nlc
	FNMCD0rbh9yy79QsSZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQF3-002P3m-Rp; Thu, 06 Oct 2022 12:44:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQEz-002P03-St
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 12:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665060282; x=1696596282;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YtAPYqdbe6KFpGivhQyA3QsdfT8W8JjbxK/fO7ywXps=;
  b=rkn3IyhhKFwCwxXDmYX9S1pfBJ2ZdwYjk1zh1kPA02smO5e/FtLY1qmd
   Rsct8Xei12z8y7zQIH1fkuu760kkOVzkFi8xgSfKVVLsGwHNmvZHar2Gm
   dhJQsd5wvSikErY34ExzmGPpKdUSqgTqR3aprwwbzJoKx7/nY7HHpdrjb
   UDV6FD4xcuv/ELbNL9GNgwjc4xGVSONwsuPr3gF6YQ1ayWpqPMHFmlLYn
   OuyxZSrKsGMFJIdf1GRW6l2fjLyQ/5BbZOAS8qxKmDngooPKTOweFWEus
   DH2TgihhOaNGG5ypyrd3cjo4eFuOMdsuMLkmIYaRATlOeTR3/Wv/nau8S
   A==;
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="183458492"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Oct 2022 05:44:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 6 Oct 2022 05:44:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 6 Oct 2022 05:44:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VU6Fu7rHDPG1pWM571GLS0odAhEh13oS84UGnKTeaxIzrMQS1cx0hhMCt7DH4Zr/GteNjN+uC96NUeizO45FN9KIzM9EskjYN/Giyd4b32Nhtn7iKU5ci7kN8nOi07qLFyuUBSVSTxPqiqV4atLpcHIgtPcAm8+srIdKG4naSlww7QNBlk+mbbkQ1gHbECnEAegnJkner5GNmszIoAWeczL0ZIrXspZnQPNHZpeVhf2wHeKprRx6qBXGxpXIocO206T6IOm+52EQEBjAJjqthdFDxM3hqMLy42e/5Pq3Cn3oJKJ1xxcKhe7x3jEyoNzpLFS9tsg9wRZPR0oJiAdsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtAPYqdbe6KFpGivhQyA3QsdfT8W8JjbxK/fO7ywXps=;
 b=JXaknLpWPVky+IvuvQCV/4+d6JcSWeNkuhQKEsxn4Vt8XsNw3TBPK/BGs7s8WRKqzP4E5c6FOPHbSD90b8h2GY4BmfryXtHVV1M+cXG7n81aaHx96NtEQCnJcQ9BqncLXQ4u+0RJ6YFtZvtaQZ0RUo5WauKWXA2+fbxWy+61fBP/9Xp5NtFWqyXOFPhpySyoXKMY2x2Uko78IOP4PlmrWwccl13we2bl2zDGNv66ThNCgK2h4XrlWdI9SJnX1AlnQCQi/ImCxHMDerg4ACLa9wM+tJHo1IXFb3HlBBceyYsgLLar6Da2B2io9R6uC8YgXdzY28K2KDObNGUOudqnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtAPYqdbe6KFpGivhQyA3QsdfT8W8JjbxK/fO7ywXps=;
 b=Q5xR4wu/OdeJ0livQ7F3f625IY6C+Ha1Tfs9tq/Q5AK08a6i+nphHkT0/5moyeAtU63deXh3BxqRUiiJkQnf3oVa/M68X69TmdwcwVDvesP4mPk/7uBivlroRRrG+u/fEzkqNAV7zlRIuegADxqDSb36dBm/HpMozK2goN4NtYc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 12:44:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::68c0:270e:246d:618a]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::68c0:270e:246d:618a%3]) with mapi id 15.20.5676.033; Thu, 6 Oct 2022
 12:44:32 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>
CC: <peterz@infradead.org>, <jpoimboe@kernel.org>, <jbaron@akamai.com>,
	<rostedt@goodmis.org>, <ajones@ventanamicro.com>, <ardb@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<nathan@kernel.org>, <ndesaulniers@google.com>, <trix@redhat.com>,
	<samuel@sholland.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy asm
 constraints
Thread-Topic: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Thread-Index: AQHY2VAAtGkNzk3lJEyGSzgFFGtvJ64BT1sAgAAAsAA=
Date: Thu, 6 Oct 2022 12:44:32 +0000
Message-ID: <4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
References: <20221006064028.548-1-jszhang@kernel.org>
 <20221006124144.abaz74g7nxrb5hxj@kamzik>
In-Reply-To: <20221006124144.abaz74g7nxrb5hxj@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DS7PR11MB6293:EE_
x-ms-office365-filtering-correlation-id: ca57509b-ff0b-40d1-d115-08daa798848e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: is2g3FrY98qRV9NBf22igTtgkfUpsY67q4ttqikXr/MI+8EHZ7n3Cpcm/9I4lxL2fzTj3X0eYoxFB58PyEyGlMBY5221flarKYFrITH+zZl/g/4VZ056e19xIqIR/TbZx1n93C8fCUR+JcFlKylCtXva7wqObqNs4PVi0cI2MvJYnGTQSdk2wbrLAf9EX21oGIsB5Q3glkOdsvtUm6Do9RGE92drngR/qQ9l8qCeGY2/OnR12etIhbXxC649lzRYFmmw+DkiQtHPahjjGwJ1WBtx0UBZUuQHrc3ZlewGspe1MBo/+gWSJ83lJOSlw82D/EwyL1VNq4XOcMkd6/FKWfyFOBXfNw+l+RviXNba+mVeffPBQ/tXWFJUm/gLqBcxsLGgL0f8YQZvE6EycqJJrqJ7Aa1Rj1Mznj8dV3kYudEcmo9Taw1NaXU1+3EKv5t+FAtaIZISNZOdcKZzZ/2MetIzcfmLRvLXeCt4OScUWa3tA8QPqQdwyL2uV3x2g3tzUWO2d5LBT2q/biQLnBx7hqsj3ZiiSuD6Xjcv0TrhGmOddX3Q8HZbreUxHginTHTvdcs8xXHzHxvYB6XsRKIx+TcqbN7YbTT+fga0mIpUDIEJK2vpsCmoeC3Exgkiur38lV7RNxV4iOn8UH0m2TtocPF3d69wqqyqep3CQMbqNtX1vRMzQZBNVzyAsDlcnThZ7yZEWMr3lh2HmqhLutRt/Ac3y0XkNhgm5XcUzONy/t5kXEgyDl4wCmMABQWQO2wIq5aIee24T4kBaXXDxqgZ3yK+pGB0WxB/urCrkAQ5nfeRiAfreaOokey6gemFcajlz6y860GrePMXwLY3s0Kt4mFclLwbTEyLRNyK9Ow+jfpgD5pR2aXVOlBUfjeEvLFW+YAUNrPvMFoA9DxXaB+fJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(2616005)(2906002)(41300700001)(7416002)(8936002)(66556008)(64756008)(66446008)(66476007)(38070700005)(66946007)(31686004)(91956017)(31696002)(71200400001)(4326008)(8676002)(86362001)(54906003)(76116006)(6916009)(316002)(966005)(6506007)(53546011)(122000001)(38100700002)(6486002)(478600001)(186003)(5660300002)(83380400001)(6512007)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkdHUWl0SVFUd29oampFU2F3b0pXQ2ZHZXR0Tml6dG1QUTRMQzY2bTBqUnQv?=
 =?utf-8?B?dXVTTGhPdU5ITDl5ZVA2TVdvTVdDT3RUM0NPNEErOTZZNEVabzZGRWxIV3Z2?=
 =?utf-8?B?UlJuanBGWWZuQ3pxZXovSU4wNHlsTmxxVmg0VVprZkUvUEk2SXZJdXhvL1ln?=
 =?utf-8?B?Z1RTKy92SFJkUE1TN3B5T3ptY1E0dVR1UDZDTnA1Z1ZQTFBqano2WFlmNGdZ?=
 =?utf-8?B?UHIxemhWRmFWQ24wWUhTZGpRQTg5T3B4WTNadEs5TWp6UE1vS0VwVldVRUFw?=
 =?utf-8?B?UlI1ZUtWY1VOalpmUUdMWS9KaXhzRkRuZFJIcm41eWNNTjZrODg2MCswWk5J?=
 =?utf-8?B?ZHVHZmRaVGJreTFPT1Bua2JERm5mTXZ5aytvZmZicE50WTBrS3d3anFQbVlH?=
 =?utf-8?B?cHZVejlXMWI5UHU5L2FNUkQrUnB0ak1OTTZOaWY4ZmZVR2VsaElXT1hFMy9C?=
 =?utf-8?B?Q0tyb0tCUlBVUmFxQUc0MUFldUJNMjBYZkV2Nzd2MFU1V1lwbUVhYXhjS1RT?=
 =?utf-8?B?YjVjNVpCb1Q2R2tqamtFME1pV1dYTHd1anFiMCtacHRtbUdVRzBaaXFmbis5?=
 =?utf-8?B?VEs5Y092ZnBONXRwZnhnV09STVhyZktzeDYvVGRaYzZzN013MUNWS24zR1hi?=
 =?utf-8?B?bUtBOFo2YTJVNWlJUkhSVGtFMDd4NjhLaDBIRDRSTzQwekVWWHArMVpwOHRC?=
 =?utf-8?B?QzN0QzdaT0xMbVY2THlWbkxXYzNidFBmWHdCMFgvQTY4TkR1UHJGT2VQNm9P?=
 =?utf-8?B?ZDM0blR5eVhUeHhJZGZjUWZTUC9KVkVraE4zRDVBUTVONmxtUjVkR2dtVVlX?=
 =?utf-8?B?U3pDSmFGc0hRcHJtcVdRZUpnbDJ6NzhGT2hzY0V0YytEZXp2STBLMmtza2JF?=
 =?utf-8?B?QWpueEtNQmRFdThicEZKQjc5d2VhMHBFTmxJWlptbmtwVUdZRHRNYnNBbGxC?=
 =?utf-8?B?eUo3Sm11d2Z2ZUwwUEwvbnFud0RCQzEyR3p4MGYxTEU0bUtKZCtYaVVCb09W?=
 =?utf-8?B?MDc0ajhSQnhYdE1yMlVnQ1NtSzlSa29QdGZjOC80SDVyTmx5OFhEOENHaGN0?=
 =?utf-8?B?Mm83YWszWngwbEFqQ3cyQm1Ydk10YTg1L0lzNTJ0QkFCU1ZnUFhNOUlDYm9O?=
 =?utf-8?B?TWhobVczQ0tUWitRTXNrS3V2TjVlVWF3ZU5oNThCZkw4K3hFdis3YWhIcmRZ?=
 =?utf-8?B?aUcvckRUeU4zZkljakJoamNnWTJtajE2alI4SnoreTlneWloQyt3cjA1YytF?=
 =?utf-8?B?YW51TGFDYllubFRtNWMrVFAyUnhEdnA0R0gvcUpmT043SGJRdFo2YUlPRFc2?=
 =?utf-8?B?bEdENi9RRitjdVpSelovbWlLSTg5aTU0TFpzR3pCSndOZk1DZktBeThZb1ky?=
 =?utf-8?B?T2kxbFlrOUQ0U1MvdlAvUFBwb2c4amJSVXczTXZodmdhOW5lMzZpVVpaVy9v?=
 =?utf-8?B?MWlmaXVPU3NvNWNLWlo1b2QxcWZEU1NwalBNWWtHbnNQMmxsSFBPZWZMNGNT?=
 =?utf-8?B?TVU3QVlKaE5pNmpEQzhST2VyckdvYVZmU0VJVFh1bGVkWHU5dTdkMkRsKzA3?=
 =?utf-8?B?Uit6NU01dU14SVdYVFRYaHBlWHpWRTVQb0xjRnFvdXc0MTNGUUcxRmhCR21W?=
 =?utf-8?B?N0ZXRDVSWjBBbEZVa3RJclBRc3E3VktScHJuWHZ5cUpzVS81MlVXM04xNVND?=
 =?utf-8?B?S1pJZVJRSHVJYUZ6VEVWRE1ERHNBK0xwK3cyWjJuRzFHMXZTV1R2dUdkVjdk?=
 =?utf-8?B?MHRyZ3FoQ2hQQ1RnSllZWTMzYW1TT1RsQjEzOTJTMHg3MlY1NVhaZUIrWSts?=
 =?utf-8?B?d09FUVh4RGVCV3lxSFlReDJZSW9ENWJRRnVBR1lqNzBEcXZXaEh2QTRtWFZZ?=
 =?utf-8?B?Y0tXV3VqYTFKVTFLRWs2SDVzaVBUaHgyRXNWMElrVEsxU1VqeWZjSERZTDla?=
 =?utf-8?B?MWxCMmVWRHhjS25vUHpqdVkwSHo4eHJPZXZYSzkzNnVJaDhJcUdoZHYwU2lU?=
 =?utf-8?B?RmlrWGhBZ2VyTHRLUithMlE5S1NpSWFZTG5lTk1PcnJIa3VlSzdiNm1ZY1l0?=
 =?utf-8?B?bGIrUEUyN3lvNGEyMStLRVNxeTVZZGFvUGY0QnRUK3F2bHlQSlIzTHhyZmRr?=
 =?utf-8?Q?xVZFLG0DtzHRaUqQmk3qrFJey?=
Content-ID: <10AD530EF786764EADAC39DBEA46ED11@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca57509b-ff0b-40d1-d115-08daa798848e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 12:44:32.7010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: luSvYgPcqREs4RV4tt3J1Uitr/za/u66RprWw078L6lG1pN/5UU09yl8bad9LP5WvBhGBiuoB+4vbYWNt82M/k6OmOjm1VKMbHuVe8oDGpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_054442_218095_18A53F1A 
X-CRM114-Status: GOOD (  17.51  )
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

On 06/10/2022 13:41, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Oct 06, 2022 at 02:40:28PM +0800, Jisheng Zhang wrote:
>> Samuel reported that the static branch usage in cpu_relax() breaks
>> building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]:
>>
>> In file included from <command-line>:
>> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
>> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
>> probably does not match constraints
>>    285 | #define asm_volatile_goto(x...) asm goto(x)
>>        |                                 ^~~
>> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
>> 'asm_volatile_goto'
>>     41 |         asm_volatile_goto(
>>        |         ^~~~~~~~~~~~~~~~~
>> ././include/linux/compiler_types.h:285:33: error: impossible constraint
>> in 'asm'
>>    285 | #define asm_volatile_goto(x...) asm goto(x)
>>        |                                 ^~~
>> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
>> 'asm_volatile_goto'
>>     41 |         asm_volatile_goto(
>>        |         ^~~~~~~~~~~~~~~~~
>> make[1]: *** [scripts/Makefile.build:249:
>> arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
>> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
>>
>> Maybe "-Os" prevents GCC from detecting that the key/branch arguments
>> can be treated as constants and used as immediate operands. Inspired
>> by x86's commit 864b435514b2("x86/jump_label: Mark arguments as const to
>> satisfy asm constraints"), and as pointed out by Steven in [2] "The "i"
>> constraint needs to be a constant.", let's do similar modifications to
>> riscv.
>>
>> Tested by CC_OPTIMIZE_FOR_SIZE + gcc and CC_OPTIMIZE_FOR_SIZE + clang.
>>
>> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
>> [2]https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/

Hey Jisheng,

Could you please make these normal link tags.?
Also could you please add the reported-by from samuel & a fixes tag?

Thanks,
Conor.

>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>>   arch/riscv/include/asm/jump_label.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
>> index 38af2ec7b9bf..6d58bbb5da46 100644
>> --- a/arch/riscv/include/asm/jump_label.h
>> +++ b/arch/riscv/include/asm/jump_label.h
>> @@ -14,8 +14,8 @@
>>
>>   #define JUMP_LABEL_NOP_SIZE 4
>>
>> -static __always_inline bool arch_static_branch(struct static_key *key,
>> -                                            bool branch)
>> +static __always_inline bool arch_static_branch(struct static_key * const key,
>> +                                            const bool branch)
>>   {
>>        asm_volatile_goto(
>>                "       .option push                            \n\t"
>> @@ -35,8 +35,8 @@ static __always_inline bool arch_static_branch(struct static_key *key,
>>        return true;
>>   }
>>
>> -static __always_inline bool arch_static_branch_jump(struct static_key *key,
>> -                                                 bool branch)
>> +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
>> +                                                 const bool branch)
>>   {
>>        asm_volatile_goto(
>>                "       .option push                            \n\t"
>> --
>> 2.37.2
>>
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
