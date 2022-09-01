Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FBFECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rR3RtcUc7KRERVRoFFIanCp9rMmTlec8s+3rPYJLOo=; b=J1Eg37bvrCUEDI
	wr0Nnl3Ky0Z7JNiAbuHtXX3GUV3UMcm1HGN0I4hjoPv345RlzD5q4q8Y7D0f5Lqb+RE57t8I8Pb1f
	n0A/6TxSsYgcsnE2CSwUIDNqFStOlYlw4K7MldWOE0R/l6m79i6r2/H4opIkfaScPmU/Fs/vi+T1k
	+EWG1UClS7jqQx4ROdqlTdHk+qT0/WocRLrZjiTbSQ1r6S3UoLIaNhlH3Hd4SagcOIksK6ePGHgJk
	zCSaAsetj22lbsvMh73PlHg2itG8ylaXVmWUo8yE4dxHnO05GGNvNfgYFG92u+U7r0lwsdHjqjHf2
	pe+S0FkHYFCoav3vFHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTnGi-00DP29-8z; Thu, 01 Sep 2022 16:42:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTnGf-00DP0o-5m; Thu, 01 Sep 2022 16:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662050533; x=1693586533;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/OOJf/IbuVmCXNoMeeMPjAzrIBVmDkkOgYDzXOC2FjA=;
  b=1zBt8x2RzO8eAEzkCOIZT5qENkZxRowPvo+z10691zGBG2XI0CcAsXTf
   aSXWfD6yJ6/Uowkg1XuiOUaV8+6AwL1baje1xexh4rp3i8rzbTlH9nb2f
   ZjZjFijZFcb2faPo5E36+dphIw3TGSZ6eM5NumBSfscHzyIKkGnssxYo3
   Sry7wzEwpbsu1l4HhSeISgt9XjhVs4DYawbpWJjXCzX8GvAyWiSO3KOpa
   ttR4CKJK//SajYgHVaYnFJeXumSS5VBXB5dlvXWxj2d1IjMj4uOSiYIJZ
   47u7FdUXW/YOGskMzh8kRVlIHT3OgRjupwr0QG3aGc5DU67JCkq0PktlK
   g==;
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="111788135"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Sep 2022 09:42:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 09:41:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Sep 2022 09:41:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTBnWIuuyjn7s1UC3lnP7TTfBTSrtigl0Vgghb3d33FKiOEElS6u4OsM4B20urXIREa6xZ7PlFHlLcA5sDPY4niwFqNGN8Qg7VytYLC7IaplLotrr/j04mGqH9nKJVQZNVuJQODCyJmdFW1y3QeK/xuxb2+erY43ojHzryGqhYmVIY5DyyZ74RY0ZQj46GIgk/Gf9xDF2APzWVNfYt5OXScKz3nur1kOdjq0ZmAhMjYWSaE73v3SsAO49dyWAODKkx+F1UnNctFxtLQKQ92rMNWpLF/nXcjoZbKze7MWKqpB5WziYbk6j70vGzGY5/1+AcxgiqZLSultK1oxgHpOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OOJf/IbuVmCXNoMeeMPjAzrIBVmDkkOgYDzXOC2FjA=;
 b=Q8h6m572I3WNTmePUvQJ5rJPFIIxOEko+k65XqgsRWpHL0j8Bcejc7es0EMeCZMPHUsPqm5kQhKaExeXFfPPBQEiGq8CTrkkGHkMB6jQrno90vVzVkhmuTznDfO5/S5xfqCq9bwjYATf2MAFTMfZO7VY960PzMlxJQNQbUe5xpa+z6V1Nt2H7XPswxmzc0FekILXhkVXVddYGP/XIvMJgWLqgEJDase3GwufeGY9FWsc0l0TBz3V6zeb5Jt2mV3SeiuQFPmGZHkdLhj+3ErlZwOVuDZSlnx8sIoz+Ak5ZtnPXch6s1hKwpZnraBvbdd7u23uKTTDIkQGuqqTbWwE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OOJf/IbuVmCXNoMeeMPjAzrIBVmDkkOgYDzXOC2FjA=;
 b=McIFnrjxA9s3dzHk3YbXKEdivEdE4Zhua90OZslcvZdoSMZ1iJEpGsqL15YDwyn+LhWKnlcteB2f3AdKYfDH8W6QBZn4vMSVBamXockbCfLbq4M0wGl0/VbgSO2SdNyqTunu/udpIoc9FTT4MLn03IJa5bIfFtFf/E7j55avA1U=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2925.namprd11.prod.outlook.com (2603:10b6:805:cf::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 16:41:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 16:41:53 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<bigeasy@linutronix.de>, <tglx@linutronix.de>, <rostedt@goodmis.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Thread-Topic: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Thread-Index: AQHYvWTJWdidtLbFYESs6cM+7jS71q3KyLAA
Date: Thu, 1 Sep 2022 16:41:52 +0000
Message-ID: <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f27817b7-cba8-40a4-3df4-08da8c38dffe
x-ms-traffictypediagnostic: SN6PR11MB2925:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MVZoOgicjx4zM/guofublhxjf24irPKvIP3KhQMSYOq8MtDSE1Mqt59hAG+u78DHjMy9wWgem+9L0IlbbU58ve0ZUSHBHZSeEKLXF1JCGvqVlJSOTrrLfEXZtXr3kBO5zwKlO63hYKIxBJ2s870j0/9bv8LHObF2RKShqgHQdPWDX4rmUCaSgtG6W3oVoROnLwAPzoEU/cH3w1CfNUkpKYYPGLzAbYTJMLkLPedMusHvTMK5dBWXCnUt80Jr/+D9PGm9J0kTJabIXV7844p6GX2ozJNg0USjTBTMBJ8qvP35f/+pDCmG/vENcmiciV0X5S1cg5PngdAT+N/0toqZ5Zu7fWkG1XqFtBzCFkn8Ir8WgrdxBfpoqogUtB3k2DtdxAhmyDhEiL1ZYI7QB+yJZNu0SuyE7QsjH4gwN2JEmK7can3ThjVIS8h0Ibt2/cmhheKmCYEXwTxc6FX17bIVN4o9F6OXXqAKg3gg1PwEuR8TxGuiF5pxd1ILp2Gs7Atw65fm0aIF25sMpHlJGta7iRyRgJLp4W7MlruA26Vx8p+5aWqRGN3Hms9yEgV28/5AbLN+G36JzxdPlIDO8fAaeTt4f7DcF6kxjs69bCP4pb6UnJflqyuTvRk3Znan5GEUZzz8et1MCUqGVyfuPmGEvaDV6jepirmeCNk2EmDOzyqmgBZlJTFWg+g8pIfCBAOiGdP/vLRoBOKlnlN7JVwwnB4HhYd0oGjIxShqdjRYKKtwd0y+c1/IFpIZ3uLiD0BEfaQeaJlVLOUlE8zggllJ2Bj1ySJEAfN+CHBIKl7O+08U3dmQMirfRbugigcqPv8kRnhF9pSEzblcBHjrJFqCg1G+McrrvyRYY9EXfyF9M+4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(376002)(396003)(366004)(136003)(36756003)(83380400001)(186003)(2616005)(38070700005)(91956017)(54906003)(316002)(31686004)(966005)(71200400001)(6486002)(110136005)(26005)(6512007)(31696002)(2906002)(86362001)(53546011)(6506007)(5660300002)(7416002)(8936002)(41300700001)(478600001)(66446008)(66556008)(8676002)(66946007)(76116006)(4326008)(64756008)(66476007)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y29adkxrYUVLcGl3bDNLajhnNXoyendhSTRvTXNpa1JXZ3VTL0Fabjhic04y?=
 =?utf-8?B?WUVoQUJMMzJSMlhsQVlOLzNvQUhKY3ZnNzVQcTlxUWUzdXVOSkpUTjE0TU15?=
 =?utf-8?B?dVU1eGgyM0p1MDBQSnhTSGNIaFU5OXhibjBBYnFhRkVQQjBjQzVBU3RUQjNn?=
 =?utf-8?B?Tmp2Mm9IU2c2QWJYTXJGSkxYSlg3aS9mSzNEeC9yZC9GSVVXWGRIbkVwY1hZ?=
 =?utf-8?B?U1N5TWl2SHBNNEJDeGJFWUZiTVpCUHdyTzRTZjNHdlE5eDFQM0tNcFRrK0pP?=
 =?utf-8?B?SUErOCtPS0F6aGVtUlA4Uno0bnFYeExyWTh4S3E4NHdiVGgydTR1Q2FUTGJB?=
 =?utf-8?B?N1R6VTQxcVdpUWlUcVNoVFhuLzdqN3ZIV1ROUXM2T2lPa0U4VUhCUUFUZzhx?=
 =?utf-8?B?NW43YkpnVFRWMTdtRE1wZmpaZnErb0FQL1dLL0tYaEk0WjdodjhucVl1VTZN?=
 =?utf-8?B?MGlVMWFJYklROXZLVW9VS3pXZjBJOC9wUVFSRnJ0TDdFNDh6Y1ozM0E2WW5I?=
 =?utf-8?B?SlQzS0k4cncrOHF3MFNqeGdSeFJGL0tqSUxzOWhCcVIrU3FNWE1oSUFUWUJy?=
 =?utf-8?B?SjdYNHp2dGYvcjBVL3V3a3NwOVFvb0U1NmRQdVFGbTNpdkladUlEbExuOFI4?=
 =?utf-8?B?eWg0elNwYjRtMEpWSnZjMWVOSUdydDRvUWErWElQdzVsUlNYVEV3YURCRU8v?=
 =?utf-8?B?WnRITTZUd09wS0J2RGVrNXBOeXJCSFdjdWFkL1dJZzVoT0VqbUdUSklpQ0Jj?=
 =?utf-8?B?NmlleXZpR1hEWTlyZ0xBMm5LV3NONGdpd0xjR09tMStWR0RSaTlvK0NDcEgr?=
 =?utf-8?B?MDlUTm0za2tsaFBLeG5xWmIxUUM4UUY3dnU5ZDVWSjhMTWZrc0NXZXcxTnhE?=
 =?utf-8?B?R0VLUDdCS2FQeGc5Q3c0STQvaitRN2VEZGF2Z2xXd1BuRVM1NFE2M0VwaVkw?=
 =?utf-8?B?QTZyRndyYS9uT1RFUjR0NEpaZ2tkMDJoV01hZFpuVk5hamZwZVFidEdHUVJH?=
 =?utf-8?B?a28yVlduSU9XU0ZWQU9TMGQ2bnRLZFpxQ0lsWU50ZlRoY3JXMkRleGdCVUtp?=
 =?utf-8?B?MGJSdVloMEgvdDNSZFJmYXR2MXhCS1JvR1NqZVJWWU04bU5oU011Y28xUTlY?=
 =?utf-8?B?Q1JUVUxwMUM5c0hsdUNGbnFFRHBJTG1tRk1wZjRXSWFGK3hKQysyL1QxZ2Rp?=
 =?utf-8?B?MUw5VkFVV1ZzdkU4bSsxdDg0TTg2R1hENXJ5cjV0NTZ6RGZzUVNpL0plQU1N?=
 =?utf-8?B?T3Q1Z050ZTgyRU1yd24vdEFUY2VRL3lDRWZMcWVhSkV3RTYvNE13LzlzUHdW?=
 =?utf-8?B?N1JhVnF3MGZrdDl6V2hhY041c25hUVJYY3ljWjVPbUE5Yk5VQXIzZXR2MGV2?=
 =?utf-8?B?QWhYQzA5WW5LSTVaZ0hFWE9zdmJ0WjNpYUtSOEJJV240d3JHbVpkelRyWndx?=
 =?utf-8?B?eHhwdFY4OUlRd3FWS3BBeGpvRWgxeDI5T3Ztd0ZkZkovR0JpK1M1dk5abFZH?=
 =?utf-8?B?NVdJQ3UyaHJobzdFSUpTVitsclFvd0dmYzdPdWFwUzdYNVczeFA2cDF5Wlp5?=
 =?utf-8?B?M3dvTlBFZzZVNEpIc3VnVGFnaGxsaER0dEhkd1VHOGZReXFtaVdnaU1JOFJ3?=
 =?utf-8?B?Z0xVejVoNzFlUmFtcXBIc3BxWHJGVUo2cTFLN2pjWEtoSERvUkt1R2lzUS94?=
 =?utf-8?B?Ni8wVSsrclo4MEpVeGg4RndWQ3M5dTZCQmFpdlgySERoNnkxSy9zN3Zja284?=
 =?utf-8?B?QW1INW5qRFRJNDdyanZnZmt0TmJoNmJ6R2d4RGVDU3dPUk5CQUc5QnBSYXd0?=
 =?utf-8?B?ZUdsNGF6cnVGTXdJUHFCYXRNeXpDOGxjZzBwY01JR1R4bDQyVWdYbW1ydm43?=
 =?utf-8?B?WkN5SFdOVkJObTJ3QzFRODB2Yy9HYi9JdFBHempnNU5sTzdnYkNCMzlseWlw?=
 =?utf-8?B?WC8wWHJXRUJrMVA2eGpGaHlYcWprb0NCWDUrOHc0OGVrL25SQnZaQ09vM2Zv?=
 =?utf-8?B?SjNVRVUwcGJYNG9EUzF2Uld5NVg4bWJmV1B5bEI0MEh1YmFEbzMzYVVjT05H?=
 =?utf-8?B?QjdNZ0dxRFQ5NXdoalBhaDNOOGY1a0hISS9YOWVKYnRUbHFLSE5NU0tlTFJk?=
 =?utf-8?B?MWNmQllCTXFKeDBuWEZ4Wm9OL1UwVHdvUktwZjZqMWdlTk90aEg3R3RNanpj?=
 =?utf-8?B?L1E9PQ==?=
Content-ID: <100FD227D367FC458DAFCC4097D47609@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27817b7-cba8-40a4-3df4-08da8c38dffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 16:41:52.9916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yhCF0NuxkSPYAdLGggwD97FeIeROhGrf0zdXu2nY0a6nP8lSI5Lpc/M9FUZa5eZqOt40h9GmoNqGS3CDYpRpgW7mSzTS60nyzLBS4QxCaPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_094213_548952_5FF4CC24 
X-CRM114-Status: GOOD (  20.59  )
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

On 31/08/2022 18:59, Jisheng Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This series is to add PREEMPT_RT support to riscv:
> patch1 adds the missing number of signal exits in vCPU stat
> patch2 switches to the generic guest entry infrastructure
> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> RT
> patch4 adds lazy preempt support
> patch5 allows to enable PREEMPT_RT
> 

What version of the preempt_rt patch did you test this with?

Maybe I am missing something, but I gave this a whirl with
v6.0-rc3 + v6.0-rc3-rt5 & was meant by a bunch of complaints.
I am not familiar with the preempt_rt patch, so I am not sure what
level of BUG()s or WARNING()s are to be expected, but I saw a fair
few...

Thanks,
Conor.



> I assume patch1, patch2 and patch3 can be reviewed and merged for
> riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
> and finally merged once the remaining patches in rt tree are all
> mainlined.
> 
> Since v1:
>   - send to related maillist, I press ENTER too quickly when sending v1
>   - remove the signal_pending() handling because that's covered by
>     generic guest entry infrastructure
> 
> Jisheng Zhang (5):
>   RISC-V: KVM: Record number of signal exits as a vCPU stat
>   RISC-V: KVM: Use generic guest entry infrastructure
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>   riscv: add lazy preempt support
>   riscv: Allow to enable RT
> 
>  arch/riscv/Kconfig                   |  3 +++
>  arch/riscv/include/asm/kvm_host.h    |  1 +
>  arch/riscv/include/asm/thread_info.h |  7 +++++--
>  arch/riscv/kernel/asm-offsets.c      |  1 +
>  arch/riscv/kernel/entry.S            |  9 +++++++--
>  arch/riscv/kvm/Kconfig               |  1 +
>  arch/riscv/kvm/vcpu.c                | 18 +++++++-----------
>  7 files changed, 25 insertions(+), 15 deletions(-)
> 
> --
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
