Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6A4C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzSLErC10EqRx499lMimAX9wqbcuvRuzwaTB28g72ts=; b=Vs5IqO+0k9MYyb
	FSg3/ym+MjlJMBYva9Rtsogr6OhyopqQR1BSFk7FwAXZJBI0H2IFJGTYh08uk/RX4SOtkRprXKP5r
	Irn7bmQTcgyZ6g7C3WicQkj7VhxljbZmoT8wRWwKH93/RB2gyEKSXFryyl0JrlAOUT9fITmxCG155
	HCP7vipdKxij95C5dflsQzcdqMCYJcUzeql237YQZj4EYjJEDmYOyIqBJPHP5IJfBBAhHlQi+xFCb
	GfJPdIhpXAvguJX9+kUBpVw4dNK+/AZ7VnmJCLzd8ZjfY6zCN4Va+7trPz4+F3fx74mfy+/88gi2Q
	tuBmNNBk7HSI9twTJ9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV0N-00HNt9-GV; Mon, 18 Jul 2022 17:58:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV09-00HNjm-Kq; Mon, 18 Jul 2022 17:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658167069; x=1689703069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y/8l/bz5Iz4FtUSX5tUa7HYGZ39Af4QahKR3DbNV8ps=;
  b=wmXaVmOR3A6AaDeo9YBe2aRR8FaoV/jTufDzprKoa9/P0fL8ofJk25Kr
   pmtN28gHCCk50jkeFrEFsAeEhd27pUCEEVGFvd/biRIq3fThr8QQiNNaV
   DT9lpP7JR93gKdn59Er3iijd3UrqQYd0SLvWrxBqGjqdqdLvQqWyTXB9P
   j5Hfw9owir+g+wW+XKLvsk7KBOxqEaslnYyfoH7l+eYDad0FhBARgavmb
   7tPMe5GSdzIomgGqPxHm+jn9p6OvZbRbeT6uLR55xbHJlrQlX6r2O3Roo
   5bqg/o7LpN8Wcmb4EpjBDBhZc1n2soDCwUqM3GA9ppGS7UD20hQyULNxK
   g==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="104989725"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 10:57:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 10:57:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 10:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgImFNO4QHU/bGuis/iq7eJytKN9BZde5hiLDKkFGzuGSsNDr4sIRjMB+kFzAg7jj4XUiy7xtPCHza+fI8CRESwWjOr8bH9ZuurqajPnRxUQzq4tRnj28MXDYKS5QQ1nd9Dv+82PcNi7hL7Vu1EijWBV6BaIYC3kvItzuxLElYI/jkTjiFWVRRqnz6rncWp1UI2v+xGpuKhZwXVcl87298+hnFnJUFOyzQ/9WDkDl3mYvpH3S6Kc+t2b9ORt+cZsKjhV8TdYX31wKdLtCZ2MRBKkj73cXBfGen7QV9vEyc/ZTiTTPdBUwlh7q0L0KHNKuJHi05vU4T0iUtf/EUjP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/8l/bz5Iz4FtUSX5tUa7HYGZ39Af4QahKR3DbNV8ps=;
 b=ZLPkkSD42+v61FYQb7rtDqXzlcE7ZCCNh6iRkxuAK+Y5C7/PA/BQwwpc41XaEa9y8B004evCcN5gdOmDG70vJ/FIsUK059fIGmAswclun7ZwVDCCwEO+3SufiT2DQs1K9XCKiOE3vTpQuJmsIN5sEhjiC9dAgRdlaiSMmpEr0s8ttBkrXRnXIUHaFDnWQBhhbSnDtuqVQQ4Ek0wpMx1htHGWK8//5KwL0XojogfKFD7bol4x4rVVNcZa6VLGFlOfmaBxc7qqs2QNV64rPevi1fZNRk/oRaRXufkkuWQcLswRms+OuTc4GaMYvAcaYKTxY3H5MOUnaNFumQ4mp0OELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/8l/bz5Iz4FtUSX5tUa7HYGZ39Af4QahKR3DbNV8ps=;
 b=ulbSk0ufAxe/ppnUxbCPUW5Tul40R8uxKGQ5qr85pmLEjEYwb6ugEJ+OrcKAZmcQK133D0lWAQktxLlT77wc3nt0jO/3gubOsSGLq3MMxys93/R7E/9puvCg7uXHz52J0IWXRtevXKPFZbBuFdWeUhg4nUGUVADz6w209pouUa8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4368.namprd11.prod.outlook.com (2603:10b6:208:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 17:57:33 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 17:57:33 +0000
From: <Conor.Dooley@microchip.com>
To: <linux@roeck-us.net>, <sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <Conor.Dooley@microchip.com>,
	<gregkh@linuxfoundation.org>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <ionela.voinescu@arm.com>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Topic: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Index: AQHYlr1LjktvAhTwm0O5ibr9nGIi2q2EbdiAgAAEYgA=
Date: Mon, 18 Jul 2022 17:57:33 +0000
Message-ID: <0744c97a-bb4e-0985-7f86-f98965b5d3c1@microchip.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <20220718174151.GA462603@roeck-us.net>
In-Reply-To: <20220718174151.GA462603@roeck-us.net>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b366c22-c61a-43f6-c6ec-08da68e6fd98
x-ms-traffictypediagnostic: MN2PR11MB4368:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MC9Xt0Cu5N7wEip9WvE8GRGpzAJAyKHuJr94KFw7VQlMpqtqP+93OYKHzdyiOBvYalrVpWI45pcdkIw7+4piHVpN6ni9bS+u4GvRpQvp2lJIxmLCBKNa/lT2aRd3pyuMMRyKXCM9HQPjxGzzHR6Ceuwguw8i4fNQeA+/JW56Wy4+gkAo5d5bHbEY+qQgQk55xMnHW9ZfGItxeqJZmY4Sl1NRqJJPvGz43MZx6xwdIGlXYTx4bcDM4OQyiR8VQr01hPB6azfFd3Jw0jdXt+m9/+HnUaltN0E0vJnWjS9Lu+gl4I38V/2BGKkOYwx9Q1cslPjdYmCjnevR2XgK8U4vvjfMtnJ7F9IU1nxFV/qGPxboIxfe/lKMnNXJPXF4a7nTHi1CFIzF0RaBGSho8FV9WL1SkRFf1shaalrmSXDneTbvVzd9IF0FLmnXs6QkjUQUa2VpTyzv4PdOoJ4Djxr/g3+gXmrhnI/akT56tgNfmgr1ZLyndXs/Ggig0sIcevOKSyX4U0MDQqKDeuSUuFCgNrX7deA6EyGhGWGjwOCPNonZkq2AVFreF8HF0P+ouqBJQ22cNy/ZHKr53hqGkT81yISwRkeRcuiLRtPAS95Fig1SqIVS8FFRn//S9wchtSNx7ZG51hzAbqqW3j70IkkNxMPzQDIpa42u77TuPRLKbkhc9gKoKSp5tnHoNIbUdyYLLessBh21OT7S7zv9MWiML/FCxECLjHLTyppQK+xppqjzvQQ9jYx/x774v8pwFPzH6tWCwqA32oqalTNvsq9RHdo8GlS/WT92nPFDOOEKAuhS0RWc3UL/F/CwHh4CCVYibBR9+sxWAimUAHf9pi+3NqU4tA2QLCmWRC8YIu1ncsk+KrkxqQ4nMQ6jCjTHf5ic
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(346002)(376002)(39860400002)(122000001)(316002)(91956017)(76116006)(66946007)(38070700005)(66556008)(31686004)(38100700002)(36756003)(54906003)(71200400001)(4326008)(8676002)(64756008)(66476007)(110136005)(66446008)(26005)(2906002)(41300700001)(186003)(6512007)(83380400001)(2616005)(8936002)(7416002)(5660300002)(6486002)(31696002)(86362001)(53546011)(6506007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9QVTRJWW85dGVEYXVUb3UyME1uTXo4andXdHVVVnVVMUp4WFNqVzVuOFpW?=
 =?utf-8?B?U3l0b2xrMjBpWnZiR0pheTN2cmI1Ni9EWkQvSXJKUkxuWkJ5UVRrM1J5WmVN?=
 =?utf-8?B?NFRUVnFoT2pYeDM3R29nSmt4UWlyRFRyRUJIL2dBL3dCYUNiRG9aeHJRZVhG?=
 =?utf-8?B?TzRpdFF1MUo1OFdodTVXNWExMzdvbWxFR3gzaHVHNnhLSWZIQmtVRHNiTUxq?=
 =?utf-8?B?ZnYxcG4reGhodWlycGpieXdiVVNyRGNFWUtpMGQwVlVDUlpjNjRKNEVDNi9V?=
 =?utf-8?B?eVY5Y2hQTC9LNEtKdm5qRlZoa1I1cTYwd2cxellDWHZDVllheGRqckl0N1lT?=
 =?utf-8?B?RVFEK1VEbWNXRVFITU9HaUlyWUgyT3JNVTBVZWNEcndmcDkrQzJUTHg5YXhq?=
 =?utf-8?B?ZHdWU2x2UStpT1lnVkJMOGpYbXJPQzY0cFhBUTBkR2M1L1ZQakxweEVzeDdL?=
 =?utf-8?B?eXR2cEhUWkxLU0hsTThVZWxIVHlUajBueEhLQmFMMHRXVDBUWlRBRHBDVzZz?=
 =?utf-8?B?NlZQemdub3hvUDBRS3A1eE1BNE5pVWVTb3N2enlHYlg4TXJ2RkMzR1IzNG05?=
 =?utf-8?B?ckMrK1pBM0NwaXQzUHUvUXBMcWxQVnBNcUMrOXk0YVpDK3Zieit1c1MxTmxI?=
 =?utf-8?B?NFFGRk51dzlyeWFNdVVMZFBiTU9PK05ScEdDM3pxTG1RTGtzcHJkUG5ZWXVL?=
 =?utf-8?B?aGpKL3loSHlDZ1lGczB1RGRZSzZlNTJ5RHR0UzY2dDg2QTFsaGdaT2svRUdF?=
 =?utf-8?B?dFExVVdORFBwT1hQTk1BemZpczZDQ3NxT01CSVh0Y0tHSFZqSmp5dThXaisz?=
 =?utf-8?B?SlRLK2lsRVo1VjVZQTg2RTk4Y3grYWtqQWsyMmxUejRaZk1Fd3hlR2FvaXE2?=
 =?utf-8?B?RDhLOTZoakk1WEJKdmtlYUxjaVR0eURyY0w0UjZ0TjNtZkZPNlp1N1llUGJS?=
 =?utf-8?B?TllHUFdXUE1ublZvNXA0Skg4bXozdkpnbDV4aHFza3dMY3drUHlSWjNhRE1R?=
 =?utf-8?B?cFdPd1RUWWcvemExMkRVdnF6QUVPTEdXSXI1Y01kbCsrSEpNcU9nVFRWMm5S?=
 =?utf-8?B?cGxuOWgrSnB5UW1ZZG5PLzNaS2ZVTUpNRDN2NHJYVzE4aHlRN09uK0NpeXR3?=
 =?utf-8?B?dGpMazVHbXY2ajZ2TDlZanN2djFLRWNwOTM0UVZVTkdETVdSM25GV2VLWVZ3?=
 =?utf-8?B?clkvaGVuMWdPUG1JaDk5ZU1SOVB3dDB5NTNsVjZKQWZGd01XSVR3alJ3bnhy?=
 =?utf-8?B?enF5dERuc0FXOXZNanFzR3puY0drUC9BTnVoVzBBeUlJanRDSDk5SGxpcjgv?=
 =?utf-8?B?RG1MV2dQRmVCMjB6Q3NwdEFJZWRkT1I0S1BvUHQ2TUhZbzNmci9qMEhXb1pZ?=
 =?utf-8?B?SEZ1MlY3UGVPTHRQd2ZSZU5GVkVhS2xCaGxvQVgxaTY4K3gyUlNCb3FFMHFK?=
 =?utf-8?B?YlYwYWlvS0UzM2lyZWJsS3BaUU5ydlZreXVWRmRjNkZvS1dRZlFtRDRncmJE?=
 =?utf-8?B?cCtWNW5KeTV5YS81TU1WczRULzViejZBTEhkbmc4WWYyREJ3Q1l1WGoxTCtQ?=
 =?utf-8?B?RkozUDhjZnpnOGxYbUhDOG54ZlJCVFVlQUFZL0JRamlUOC81b203VERCdnR5?=
 =?utf-8?B?Y1JYalg0c0NsSCtwUE42Tjh0Wjh6WjJsSUl4UFBIbFhpdVYvOS91Qkh5VGJT?=
 =?utf-8?B?UzZsUm9VSFhmc3BSVjZ4cTJweTVJM1NXVFI5YitLd3UyTkl5Vmc4Q2UrV2pm?=
 =?utf-8?B?ZjhCejlDQjJNRVhwN1BMZHBMcjZRQUJKYUw3ZXk3eHJWbjBqa1RXeGNuTEpZ?=
 =?utf-8?B?cFNocHNwcExvb1NNWWpCOTFiQTFzeVJ1ams4S2pqVEtmempuVXpJZnFkOERa?=
 =?utf-8?B?S2NJampqbkZzVU1nRDMvbGdCVVhWSWVCU09DQWtsQVNoam95NDlPVFhodFli?=
 =?utf-8?B?Q01KWHlMdlB4aDRNQmIxKzZ3QlZSbEpwYk5SVU8za0VrMkhTN1J1UjZubU82?=
 =?utf-8?B?ZGhiRGYxUStPelpTbnk2NklNNWlkWjBTMXBVVHplM0daaEp6M2p1dXlnbVRs?=
 =?utf-8?B?THJYNE1TTWRhR3pJYkhpVk1EN1VFTUs3L3JZeERUZEhSWWdwNGJOTDVuZnBp?=
 =?utf-8?Q?uWHSyQw7pmlYQHYGfFzy8ojVR?=
Content-ID: <D7DAC3101C868A4F98FC71B9DFB49D46@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b366c22-c61a-43f6-c6ec-08da68e6fd98
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 17:57:33.2292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RsfSntLuxeSd7vi0UpRKoXynJIZ6clO8ksMTD7TnowKQPvfP1Onlv/6XANPwhs3w9SI5yCFfmGfvR1bhSAaYRhqpQv/T9cRPjX7yzxKML1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_105750_021317_93D2CE4D 
X-CRM114-Status: GOOD (  24.37  )
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

On 18/07/2022 18:41, Guenter Roeck wrote:
> On Wed, Jul 13, 2022 at 02:33:44PM +0100, Sudeep Holla wrote:
>> init_cpu_topology() is called only once at the boot and all the cache
>> attributes are detected early for all the possible CPUs. However when
>> the CPUs are hotplugged out, the cacheinfo gets removed. While the
>> attributes are added back when the CPUs are hotplugged back in as part
>> of CPU hotplug state machine, it ends up called quite late after the
>> update_siblings_masks() are called in the secondary_start_kernel()
>> resulting in wrong llc_sibling_masks.
>>
>> Move the call to detect_cache_attributes() inside update_siblings_masks()
>> to ensure the cacheinfo is updated before the LLC sibling masks are
>> updated. This will fix the incorrect LLC sibling masks generated when
>> the CPUs are hotplugged out and hotplugged back in again.
>>
>> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>  drivers/base/arch_topology.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>
>> Hi Conor,
>>
>> Ionela reported an issue with the CPU hotplug and as a fix I need to
>> move the call to detect_cache_attributes() which I had thought to keep
>> it there from first but for no reason had moved it to init_cpu_topology().
>>
>> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
>> cpu in the secondary CPUs init path while init_cpu_topology executed
>> detect_cache_attributes() for all possible CPUs much earlier. I think
>> this might help as the percpu memory might be initialised in this case.
>>
>> Anyways give this a try, also test the CPU hotplug and check if nothing
>> is broken on RISC-V. We noticed this bug only on one platform while
>>
> 
> arm64, with next-20220718:
> 
> ...
> [    0.823405] Detected PIPT I-cache on CPU1
> [    0.824456] BUG: sleeping function called from invalid context at kernel/locking/semaphore.c:164
> [    0.824550] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/1
> [    0.824600] preempt_count: 1, expected: 0
> [    0.824633] RCU nest depth: 0, expected: 0
> [    0.824899] no locks held by swapper/1/0.
> [    0.825035] irq event stamp: 0
> [    0.825072] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    0.826017] hardirqs last disabled at (0): [<ffff800008158870>] copy_process+0x5e0/0x18e4
> [    0.826123] softirqs last  enabled at (0): [<ffff800008158870>] copy_process+0x5e0/0x18e4
> [    0.826191] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [    0.826764] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.19.0-rc7-next-20220718 #1
> [    0.827397] Call trace:
> [    0.827456]  dump_backtrace.part.0+0xd4/0xe0
> [    0.827574]  show_stack+0x18/0x50
> [    0.827625]  dump_stack_lvl+0x9c/0xd8
> [    0.827678]  dump_stack+0x18/0x34
> [    0.827722]  __might_resched+0x178/0x220
> [    0.827778]  __might_sleep+0x48/0x80
> [    0.827833]  down_timeout+0x2c/0xa0
> [    0.827896]  acpi_os_wait_semaphore+0x68/0x9c
> [    0.827952]  acpi_ut_acquire_mutex+0x4c/0xb8
> [    0.828008]  acpi_get_table+0x38/0xbc
> [    0.828059]  acpi_find_last_cache_level+0x44/0x130
> [    0.828112]  init_cache_level+0xb8/0xcc
> [    0.828165]  detect_cache_attributes+0x240/0x580
> [    0.828217]  update_siblings_masks+0x28/0x270
> [    0.828270]  store_cpu_topology+0x64/0x74
> [    0.828326]  secondary_start_kernel+0xd0/0x150
> [    0.828386]  __secondary_switched+0xb0/0xb4
> 
> I know the problem has already been reported, but I think the backtrace
> above is slightly different.

Aye, I got a different BT on RISC-V + DT - but that should be fixed in
next-20220718. This is a different problem unfortunately.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
