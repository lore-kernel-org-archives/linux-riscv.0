Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C004CCA485
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3SkhJxiIIJLosTnrhd+cU/JrQCMzjBuUd5szzOwqzg=; b=p+0pC5kP+tNCCE
	LTHjDzVq0ZjwRVzihPdaNKxKrOWrxakwaMNzOQm4hEZzy0eGomM+gYtO8gAtAAagUDGr0nD846GYG
	kwlxKbg0CP8FGrIiA2NVrjqiXC+K8wnBdIgcyIVBdKrc6+tcC3j/xhiI7EhLqACj3m1tAPRi7AWl6
	ZGgXLxo+gulSwUBbc6RBD/D3gy/bpMvVr7hqpMFKbJTDJJKrQFmc/v5BRqbcTdPoZsZjyV7isSH/t
	eNaOUYoOyWeSyAu0Ac7gZfoZKRFIId1UG9I+G8Eu5Yj4/PEHnfqLsD5xwbJM53kpEgROIK4qGmwei
	GSKFaKpkc1Jing6RRcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA2M-006ECD-A4; Wed, 20 Jul 2022 13:46:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA2I-006E8L-58
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 13:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658324807; x=1689860807;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VX78MYSmEIN4HsGfGWqX1d1mKjVFaTp4p6cOrI5T1ts=;
  b=viiXkz5YpeUka8yryWsmx19lgf2CpC+Zdq3EKJkVyiBhLhUGvMTAtunH
   gx8McoZ8/DJoMPGzkRSSSHmA+zg7S6f4Eej09j2hLf/xRjQUbvIciDwos
   u0ASNS7h227efanKdR73p+rqKbhOqFnSUxirKtbCb10Byv5g+0xdRKIGC
   DDaOY7NpqxtgmYVMuvZCsn+BtXGf0MExIIGtJ4lw/w7nMDnLZDv2leaMr
   96FBcj7h/99tLmhQaEOKB7GD0qzuO10SHXFaiX8Reb7bUByqTBP30wsle
   T0a1lSIT546Pybj2djRYhMRyiPyHt66Nza4BS4tCjY9n5FNkLQN7RsvsM
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="172908208"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2022 06:46:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Jul 2022 06:46:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 20 Jul 2022 06:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iewdeQTgB12JmpP3q6p5AFS3hH/jBKG1x7H+TIhNJeDzJU2WnKNrS+qRAmrOYfwFo/bkmV2XNmfJLspTBEKi9zHd2hKJBPmDU62J3neHmLtWTPqSgGrASZBoBrGvdKtW//+HfTA9GQZX7PA9geXvEtkWnlWYxLCDmpbXWG37HY9YAqaZMgUu0k2XnyuNrZT/oMD6sqivsy4K1UlZtVo3E2zg7QK2j1r3/usNWGtvmRQMZEvgwKVhSq8WOtkEoa9z6a11baufcodbZqtN+m/728Lgt+Xf+UvDgbTAkZsim7c9n327zwnX3M/BBWdlYqTJA1PFIdKnNYtfDOhrumwBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX78MYSmEIN4HsGfGWqX1d1mKjVFaTp4p6cOrI5T1ts=;
 b=cjiTPoFxQ1jfAUzJv/ZvSfkvIXue1540cC0eWpGy/f2IsyxxyyG4I2JWButY5F+JdVTrYNnrXxyM71KPKRoigKqjLSosHffjK0LB53mpO3q5EAj6xQI8ZSBA4XEFKLn0pDCYwAoQuNwDk2tj5xeB5m3MO3+EIvXetTdP7FRporOOKi4vNzk9vbUe6/nsval+nD+1mgssrPjDRyw4WA1qvGkoH+aV1WTH8kItJWL5ne9Id6woyV9p4Dym3MHJUDpx4tKFKj3ukBnTzXqDvhFyMB+h4M4mt8QndlVWOZvqonpC6s49XW+h8CR6D4zmxVHyjeIGl3DlulzEK56nSMPVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VX78MYSmEIN4HsGfGWqX1d1mKjVFaTp4p6cOrI5T1ts=;
 b=mZJSRNomBDQpn6vEiM3V/CG32Iqu82leiy4CT8SfgbAOPEswcdg5lFMF/OiJU9Bu3akWAMs8mW+q15dVoUrdbqTUDW2qM4v7HhNwbHTeDqhqexOHqBgD+jzV8n4KayldFYxBwVXsycPpQZDWEEqu5c3H6RxXtZJUnOBXjpLBEoY=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 13:46:26 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:46:25 +0000
From: <Conor.Dooley@microchip.com>
To: <sboyd@kernel.org>
CC: <palmer@dabbelt.com>, <robh+dt@kernel.org>,
	<Daire.McNamara@microchip.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2HXw2A
Date: Wed, 20 Jul 2022 13:46:25 +0000
Message-ID: <ee72b966-433d-ae9e-4544-44ad1fd1abad@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae19ab9a-43a1-4e91-79b2-08da6a563d7e
x-ms-traffictypediagnostic: LV2PR11MB6072:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r56X+wxcq0etRZbkTghMZN8lMlJYeCxiW5gN3vwxb58Cp1iUtOPhveEEYC5Tv6KfVdXvBaRvgBjpjMOylEH/0wnTodII/wnFYkSJYP7BPwrqF4zn38iI4RUhl9Wui0GKpXva7ODT6qrxHXNBxjq4RdQEESVCS1SJZYm8P44qVTsaRxdJBF9m/hwPcl1oAP90a9CUu+oyR31kfbVr9qoFZukP4nI204TgiQcTPoHP6iB1ZEgZVAHs69Yb8z9rO8NP3ZcQFlTgaNSsw8uNx1thOwM16RnnhYlPpPRKBGUzIYVgpctKrZeV3oZuEQL/lanjk4H3e/RT3xTRcnisAkq7GjvSl0Zqr+/7TLpriHeevs/ZFnZNmAndft5waTqtoS8YIOdqL8sItMkqvUDVT3TKZDOKU5uRQRsnypwWwZvyUN6GPe8hlOghFlqFGWjRbAxF6pZk/P5ihj9+M3zuJqGkLFApYmMh0uJ0715BZSWERiHnJHGjB5s9PQM/8OjkPwf755a7ulvEjkjgs6RfQw7YfNY3JJdZAbNbza9laURwbm728FfuJbZFn5uo9og3ywMjo9LiucwBYJVu37dn2UZ6Wt6CXu/cIvtW7pFqwLzC6rgO0w6zTvYMrQ61GLy4ll2OgIEBO9VdFkGG2wN2oogicfIOzAJDT2j+4xon/DfPOLInxsT8nQrhKAhsN0pd+PceE9v4eCGQailw38DtQwh726MxpnxA6uqWF/hhq9dEM6mB7SlOZ2zO7q16eMBYkv6bGGIvNqMGWY1U/b9KdkzoXsFrM6E3rfgdU2dUcFWFZ2OO8HQCC0mEcQuJiaXLqA8O22ETapgwMTjmltt6b82K5fhqNr96E6JW8IpkdCWwn16tLt3enSHw+v2Uiw+FiHarDCaQy3d9+KdPS3UVBUfdRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(396003)(39860400002)(136003)(6512007)(6506007)(31686004)(2616005)(71200400001)(53546011)(83380400001)(41300700001)(966005)(26005)(5660300002)(186003)(478600001)(6486002)(316002)(8936002)(8676002)(91956017)(54906003)(38070700005)(64756008)(76116006)(66556008)(66946007)(66446008)(6916009)(66476007)(122000001)(4326008)(2906002)(38100700002)(31696002)(7416002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEIwZUFXSGNWbmxCbjFLU05KVm85cVROZG5rTVBPc1EyVTBITnVNcmxHbXlP?=
 =?utf-8?B?cVRzNDgwRXFOaG4xZDNPNENaelVkdGJvczFpYlgyZU5ycUxSVmdKMVlKeG9Y?=
 =?utf-8?B?cTBWVGFSWXVqbmxtTjd6VlB1ODdnWUc3dHVxMnB4S2kvWHYyTktmd1NmT0dX?=
 =?utf-8?B?bU5Za2w1TzRTaTk4cVZORTFlTndiSzFubnRTMFlFZWRoZ3RVN0FwbDZmZFJR?=
 =?utf-8?B?Y1JsekxuZTh5dTRwVUlpaVFkR0RMOTRXbFlnV2JPK3lROE5idWppbEcwekVI?=
 =?utf-8?B?NThKczZGTmVFVjZ4N25xMmdTRFFNTnp0bnE1ZTc0dEpEZ3BMMGI2QmlDK2Ny?=
 =?utf-8?B?eEFJVDlPVnpkT2ppSGJlV01JdkVpVHlxN0lSdlV1WVMzaUc0ODlVN1RzMHFh?=
 =?utf-8?B?dkxMWXBFQXZoOXgzaWxROFNNZ3VFbzlDVWdTM2d0K3ZMVlFGMkRnZXptMGtU?=
 =?utf-8?B?QVd6UkEwc2FXdThBNlQrMS9pVS9INWN4VVdwTWUvejdIS2tHcDZWdTVOdXRL?=
 =?utf-8?B?YkdYNWduN09wOE5ya3B4aEMxZkZ6SFJ2Z1pBU1BJNSt2bkVXUVZTSyttN21r?=
 =?utf-8?B?NGFNUHdCc0ZJTjY2SndzalBWS0Z6eGZIQldDSFpnRTZLejUwOGpqalFOdkJB?=
 =?utf-8?B?YkF6TVJXVUhiOWRCRnNaNGRNYko2d0gyRkIwcmNLT2c0QXhYS1lBY2NlSEhz?=
 =?utf-8?B?TENWU3ljUytIWWIwL1ZpWGdqNFo1NjViNFcwWFJOekl4T3loaXYvSWdMc21V?=
 =?utf-8?B?ZXJ6NDlwQ3ZBbWlFNW1LTUg2RHgvZ3lyMVBWckpvckJnUnZwazRMTGgvdVMw?=
 =?utf-8?B?YWdYcUFHcktGaEN1RHhqb25sUWxGWWhMRzdvRURxakVsNXg1QnRFVWNWNTF2?=
 =?utf-8?B?SUszTlZCTXVTS2Q3SU5iZ2lWUnA4aitVVFF0OWxsMWJON05JQjBJY2Y3dGQz?=
 =?utf-8?B?cjNHVnUyZENmUHpQeWQ1RDFOMXQ4TmlQb0pjYWtkWG5qOFpORmtxbWg3ZWJy?=
 =?utf-8?B?QXdoSS9FOWxtRWJrNGNGeW5LYzJrdjZLY0hYTEQvd05yeE9OUUhkS1JCaW94?=
 =?utf-8?B?QXBORUhuQUF6NnRHQ3hEME9SRzJETldBN0RkVjdBN1RyRGlsVGdFbm5nN2tE?=
 =?utf-8?B?Qmw4MUJBbzRRTWhaaEhIdHlmdnEyclRYeVZqNDg1dEF5MVZxcDBvaTUzK2Ux?=
 =?utf-8?B?TStNbndkcFU2V3JLRTh5cndKTXdTeDRBOTBoTTZQMndycXdMZHhnVkx4QmhB?=
 =?utf-8?B?M1VNbXVGYjcvRkI0YmY3QncxWWYzQ3NuQnN1VU1FTzBrK1Zta1hDbWFlUExK?=
 =?utf-8?B?WGdIcDJVTEJnYXp5WUFZbmJEZzF3a1I0L3Q5akxYUWhsckg5REpYUytvMUNQ?=
 =?utf-8?B?blQwY3pydUUwRUVRdkJQU2hVdzRGdUVCSVh2Sm9wcTRUVXBWeC91QkoxcTZk?=
 =?utf-8?B?L1MrNysvSjNWdFZBNCtMcmQrdmczcGNqdHp4elJJUDF0eXlvUUxOc1FTVko2?=
 =?utf-8?B?cmtpS2IrSlVBZkx0bFZsU09PZ2ExVUd5UzVBUE5lUXRYbUlQU3pCQmNrS3px?=
 =?utf-8?B?cE1Jc3N1RnVTbVl4bkNuOU80MHVQaXphVHNKZ29VUjdvSEJra1Q5SUE1YXZy?=
 =?utf-8?B?K0xTSGhqa3NOcVpkZmFtUDNtZ0pHQkxiRGdJODRvT2dCZERTYlpqd0t1QlM3?=
 =?utf-8?B?cHFxWU9LSDY2YzVtY3ZHbWc4YmE2T0pLbjRXMzc1TjNHdUZNRXN0czVOaVpN?=
 =?utf-8?B?NmhJNnpaWVNiZ2ErRjNnV0ZPR1VSYkQ5bHFmRFcvTWE1NlZ3aFY0dGY3QUlO?=
 =?utf-8?B?ZjJOZytNZUtnTmRzdU9NcnF5d3dlNUZkWkNiOWc3RmR2UUxsSllQTHQ1V3Vy?=
 =?utf-8?B?aGFzZXFhdjF6bWNJSENPK0RIYlRjV2VJSjBCbWJRd0pEMkp0aTZxU3RrZlRB?=
 =?utf-8?B?MUsrVHpnMzJ1WVBEZEt4MUZNdU9HcTY1TmtDVkpVTVM3aTFSVEhWbWRSRTYw?=
 =?utf-8?B?ZjV5Tlc5MlJvVVhvQm9rNHg0enYzQVlQMllKT0xXQ0J3c1l1WGcrOE02d1BK?=
 =?utf-8?B?N1lndlJ5dUZLMkVGbmE4UnNudlpLOU9XZm9tUHBkWGhRMXYyVVpBOVFtbDdk?=
 =?utf-8?Q?zWETkQ2b01PyPL1Yk0Yk+J3PU?=
Content-ID: <0636A56930088849848797144B4E2809@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae19ab9a-43a1-4e91-79b2-08da6a563d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:46:25.7464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THwG4l2jtEogE+aiRi7xwWAvGjZHNa0XM0GsY9h9C+8BhBtF2+Rw699Kq8+6s79SDF9m1h1KgwN4Nk6lfn/0EjICHoPDGDYRMC81oi538OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064646_486604_4A85CFD2 
X-CRM114-Status: GOOD (  24.77  )
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

On 04/07/2022 13:15, Conor Dooley wrote:
> Hey all,
> I know I have not sat on the RFC I sent about the aux. bus parts
> for too long, but figured I'd just send the whole thing anyway to all
> lists etc.

Hey Stephen,

Any comments on the clk/auxdev side of this series?

Thanks,
Conor.

> 
> Kinda two things happening in this series, but I sent it together to
> ensure the second part would apply correctly.
> 
> The first is the reset controller that I promised after discovering the
> issue triggered by CONFIG_PM & the phy not coming up correctly. I have
> now removed all the messing with resets from clock enable/disable
> functions & now use the aux bus to set up a reset controller driver.
> Since I needed something to test it, I hooked up the reset for the
> Cadence MACB on PolarFire SoC. This has been split into a second series
> for v2:
> https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/
> 
> The second part adds rate control for the MSS PLL clock, followed by
> some simplifications to the driver & conversions of some custom structs
> to the corresponding structs in the framework.
> 
> Thanks,
> Conor.
> 
> Changes since v1:
> - split off the net patches
> - clk: actually pass the spinlock to the converted dividers & gates
> - reset: added a spinlock around RMW access to registers
> - reset: switched to BIT(i) macros
> - reset: used local copies of some variables as pointed out by Philipp
> - reset: dropped the success printout
> 
> Conor Dooley (12):
>    dt-bindings: clk: microchip: mpfs: add reset controller support
>    clk: microchip: mpfs: add reset controller
>    reset: add polarfire soc reset support
>    MAINTAINERS: add polarfire soc reset controller
>    riscv: dts: microchip: add mpfs specific macb reset support
>    clk: microchip: mpfs: add module_authors entries
>    clk: microchip: mpfs: add MSS pll's set & round rate
>    clk: microchip: mpfs: move id & offset out of clock structs
>    clk: microchip: mpfs: simplify control reg access
>    clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
>    clk: microchip: mpfs: convert cfg_clk to clk_divider
>    clk: microchip: mpfs: convert periph_clk to clk_gate
> 
>   .../bindings/clock/microchip,mpfs.yaml        |  17 +-
>   MAINTAINERS                                   |   1 +
>   arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
>   drivers/clk/microchip/Kconfig                 |   1 +
>   drivers/clk/microchip/clk-mpfs.c              | 379 +++++++++---------
>   drivers/reset/Kconfig                         |   7 +
>   drivers/reset/Makefile                        |   2 +-
>   drivers/reset/reset-mpfs.c                    | 157 ++++++++
>   include/soc/microchip/mpfs.h                  |   8 +
>   9 files changed, 386 insertions(+), 193 deletions(-)
>   create mode 100644 drivers/reset/reset-mpfs.c
> 
> 
> base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
