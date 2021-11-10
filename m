Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF11FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 12:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3C0610A0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 12:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E3C0610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHOn2bQEwiSZIb1fYc3JbEULH0kpKcsXP/CIPMB6Jh0=; b=tRZb/91RkHaybn
	uXDs+oyzmbAioBOS90k806ID2/h2k4ruq0mBQ+GXg+VQoCczFx+9HFNbWwP7cxaglitKmNpqRMY02
	glBGA49a2/Pt0kZhn7uT77UnvAdBoAMips51bxu3lN71MsYPb3/fPZEdH2CKm/Sz1oKNoNZMEjRRg
	BN/EFsn6+QPID/C/Z2Y1J71q0sGfUUdMsx0e3/zuPsx6JJRAtIUMqIgXvjm0shzD8bYngWm9u/Jt1
	DJlAFf+tYVN0ofD7bMy/Pmm4bznuWA6aw3eF9QnJz59T64poi053miO32N2gEMfn3yp/sG8jUCEE8
	APAne+rEY74RR9/pnTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkmNt-005Ldu-8I; Wed, 10 Nov 2021 12:07:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkmNq-005Lcy-1Y
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 12:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636546038; x=1668082038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sxmu2/efoOQF5UrmlDKX6s/aNSfKC7WCyam4rSYtIFY=;
 b=BA1EeKC5XXxj1qpNycLMGNKF0EhQaHQ+4Vnej7uYjzChzQPw3ZkPnIDO
 aoGVZl2sDmETv42Cwwy73xb7U5XDLZcnpdQ+NJsdq49ICrA4KfLlFw/Ec
 Ln2rRBlUK6WIV+qSwgOvEg+c8mQmFVlCMByzK34zrto0qca9jShP9FApd
 3ios9P7ojGf59E2PXSpl6dbBoeZ8qDgwubjL2SHhJXp0xAXEpRMGdET7Y
 f48eOEq3ecOv1NlQlEyLxtzTCw3uavCtMqaR08I7YBc+/S/i/5tFVJOJL
 ceGPk0sJXSUmnpIeswf0TUabAORjRrH7RjoI98fN6kZCIXuzbhWNuF9uv g==;
IronPort-SDR: 0JmUshwCzULV67u5tP3LGxI5gb39IjlpsTQjlMvuB1YDqzdJkRxBPp+UYoGQkEfD1CWy+jySKm
 BDioA0ApyEUAWLgcHLMwZgFoR09JXf7uCHdH0IpULI1tXlGoeXYqvR0IZu5Gyb+xYrT1hKdwMP
 zgi0ugw3Y/HHzC5XeFaByTtAhJgbPkm3ZTVKCD0vHVfG43/V5NKgnh8b6ve/kFGvaefL+W18YA
 NQy2AoFJi+8lygfV2TkQ0NyCbdjfw4gIwRrUVQWOHltxa8tyKP9OaLs/vWicv/p9eFyNK+vxd9
 kuowg5ofhRt2pY7Smj5yzaUu
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="151426868"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Nov 2021 05:07:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 05:07:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 10 Nov 2021 05:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmG/DD4eMa8kguKJF3bv2v2lBq3HQhUwaoYUi4dB23tbhVtYIYKcmt2irKf63oUdcgNn/wIqFui9K4vkviC+vaTtYWp0n6+WH/QqN3RgbrJJz169JRSsfS2OsqLWoi/FMEz/EBPVspa1zPRnQSGu+GhckpF3f0u2boFvYKp6V4O2yBxsD+m+vvU4r0Tv04m2ZpcRfvyIxrQ3e56w+pZxq2a8JNY+TOg8vBcg3fx/g5Gdgp0pPOGaDj6UpyORLyoPB2oteIXve9cDgdpo8ylpmC4OLvxfiWmX3syLneBZvpXT8bFPYuxa4r5rKKErihV8nTvo6/AuL4wmy9a0NuBETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxmu2/efoOQF5UrmlDKX6s/aNSfKC7WCyam4rSYtIFY=;
 b=XwZyjLWtPys7hCJsT3rH0tnEWCGkD6Fkqi/fka/591Zyxgk7vnvXnoUXRYvCDHG2xE2/sUzlXaL6nmUM5Dj2eoeq3M5Lbngk+0ty+Cc2DLqxCz5K/7UUpVo0nsv3DTttoWxVqCf9pNnxaOpXtZymtjLOSr6Z+IcIVfDlvgZUa163hq7Cx5i0HvAV5oMcUFBq6ZYpbeGCsTys4GKi7Z8ns+UQftVzVrqMTMPgQDKa6KbqHCizXhmmdzV8Qh6S4pDiq8a1RfTx/cJ4mBPHxwgZ2bEJcx9//xMsKOhHJYfcTtuib/LZGM7DQ8do8uYkVGA1vq/2O6axAmLAv2O5MJ8s4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxmu2/efoOQF5UrmlDKX6s/aNSfKC7WCyam4rSYtIFY=;
 b=qSjVLZx+twjtqpFP2DN6B0ybCWs2g0sS+humxnfhJJ8+YK7lx8ITjmivMDlm1XpaOVX3bksAopKK0lrZt9QFbD8xWk4WOMOQdS9KyCw7KoMZrVmz9/pSdgAzTiDAxSadx6SylUW2gQOBAhT+SDgW8PYFVRB2bOLV8bqkgkI0Vio=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB2016.namprd11.prod.outlook.com (2603:10b6:300:26::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 12:07:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 12:07:10 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <linus.walleij@linaro.org>,
 <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
 <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <geert@linux-m68k.org>, <bin.meng@windriver.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2yk8h5UAHwUis11m3Urxauav6KQUAgAKEvoA=
Date: Wed, 10 Nov 2021 12:07:09 +0000
Message-ID: <2d1dc0ab-f3fa-15c6-1aeb-e825a714aba0@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <01fdf2cf-26ae-b062-178b-4b9a23cd5803@canonical.com>
In-Reply-To: <01fdf2cf-26ae-b062-178b-4b9a23cd5803@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831db819-b3f2-496b-fad1-08d9a4429f8b
x-ms-traffictypediagnostic: MWHPR11MB2016:
x-microsoft-antispam-prvs: <MWHPR11MB2016369AA12B94518155CE7298939@MWHPR11MB2016.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: icf3wugeLq2uz3MWli8HcxfOvyMgDP+crx6pQypEdMDqWgSU8YxkbIDvPVkEscaw58FmSd1tqqfdzdJ6rcIyk50m5/yOzSsit2+4kRa4/nVsFc1IK/L5y8mE4xg+xN5xTtjNkkL3wG7/ueo+GohIW/e50+UaPtOVYeRhIssjtoO/xNK8pvx77078e2Ow1jZOhJOBLGGG3HgHhk/t0ljfNN6sWTA6oBuAZEIKAUhxz5vAAKYC0YCBqjwgzB/SUDpF0kdzCGHYEuEKmxS8R01iiYWb1r8mQ0mmwcajILv0YNwxOUSonWbVNzKHaFhEmagUVfPkawGRCbJ766TicqrHWc5IyfZFwmwiFJMe2zW6YDuoI3Li229qrZYjNlNmIY76rmkIOMw2etmRQ0WEeGuxmxua7xtmRm+f+uwSwaIJ7Jd72cU0zF15KY8unHqbN8DHlMzyE0lRunObVYz2oZV0gsRKSHKgFERXQiMn8h8VRv0iZPg/HSCa8qXwZYX6aPSR6PC8w35DksjhB+8unZmeEuMT41MIfnAnsuAGuJCAVzpEh1L8qdac5DTKawmzWNxdd3xjZc2TrK+GTUcSwKhYOsa4nDTgCuQxnBCcFJJ+ENp98UjPj/zh5Ar4YfdhK9mSru+wx/+hPuemI2JP8OmcUsaMnDDdHDS64tZhBs7FCINwhxz+ZfJNJZ/9FmMA5D0mhQG9RjAH3gW8imbeZZvqAG6VB2fQb4kFFh5aj1fcObkZaFNzVZo1nO35SQcjvXk7Qpw+/99aCyBBPjJ+28PZDnkbU/Ht48Nbt6gFyx8Z7aQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(76116006)(8936002)(83380400001)(36756003)(8676002)(110136005)(38100700002)(2906002)(38070700005)(71200400001)(5660300002)(26005)(53546011)(91956017)(6512007)(6506007)(508600001)(64756008)(86362001)(66446008)(66946007)(4326008)(66556008)(6486002)(186003)(7416002)(921005)(122000001)(15650500001)(31686004)(316002)(31696002)(66476007)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djlpeFdIVW8yMlpiWE5kTEMyeUt1bFZCdzhONURKWkl0cGNGa29XNG9tTElJ?=
 =?utf-8?B?eXdZUU41TWVEUXc4VGE5d3ZSeExYYVN4UjRNTW9raUMxVldVWnF1UHJVc283?=
 =?utf-8?B?YjR1K3Y4TmFlNS9pbkZVVGQ0dDRWWjJteU9uUDlZUEF0QitnaUdYa0RLajdK?=
 =?utf-8?B?ZDRPSW81MHlqNC9IbXdZZlFGNHE5bWlTY1hwdlRSaE1LaU91RXVhUWhXVWJI?=
 =?utf-8?B?c1lZcGF2MkIrQndWanV0ZTFGTDVEODhyZmYrNTVHTkREZExFSGtuQ2R1bmww?=
 =?utf-8?B?d0hmZHlHd01iZWt3SEhXRytFckdLRGNrbmZsZHVzMnVRQllIUVZURng1OEtl?=
 =?utf-8?B?RExITjNKZHdFTEJrUm52dExqQUM2TTQxWU9DZUpETnZ3TGdnL3RlOGVBWFpY?=
 =?utf-8?B?NG5oS2ZJZW53cmRuS2laVFoxbDg2dkp3TnBSKzNkT2NEVkszUEsrc0hTOFVs?=
 =?utf-8?B?aTBnOUlKSzlXTHcrSmcwTW5wWTFNOXpXQWR4S0lrb3BkVHhFQzZpQmRBQWRT?=
 =?utf-8?B?NlF1a3lTdHFZTS9LQVlnY1RZaHlEYUlVVXBaRThBcXBkZlBUdDRXTXVQdG01?=
 =?utf-8?B?bEQyTnRzWHVVWExzZVlOalBXemxHNHBBU2twMUdhVUJsd0RSS2ZmTFF1Yzlz?=
 =?utf-8?B?VjEzK3NzSzlBL0FtTUxjSW1OYjliYWN3alZrcmZ6MWJObzlKQ2tIelUrN09n?=
 =?utf-8?B?dDJaaXpMUmpQVE5temlBTzdYOW85Wlg5Smxqb0pLM2tHcmhsYS8zY3hObXdB?=
 =?utf-8?B?b3BidXh1QWRMKzBGQkVPcWQydUgwT2RIcmxsRnc1bEsxOHI2cVNZSjdFNFhm?=
 =?utf-8?B?UmhQTHFaMFhlWTFpalhZYm8wR0phVzM1aDRWc0N3clRaSldaV2tEamE1aldv?=
 =?utf-8?B?aWIrTkxZa3lwbDBDU1JCN3BvbkV6YnI3WjYvSXZJeGdPWEEreDMzam05N0lh?=
 =?utf-8?B?cmZCVWdKbzhmb1dKMnM0aWR5cHkvV1hpdURDVUwwWkFSazJMTSt3N1dlenVo?=
 =?utf-8?B?TDlkb09PL0Fwc3k3Nk5lTldBdmNxMmtqQ2dnWUdJUTc5S0NJMFdCY3ZBL0U3?=
 =?utf-8?B?a2RCczlnWFQ1cjlZT0NsSS8xeVpxWTVQRWZXOHFrRzNyRTVLN1FHbjdpNVAx?=
 =?utf-8?B?MHRjQ1FTb05yNEJEYnFWWURHMUFJRmVZelNqZWhxdUkvZnlNZ2J2SGVvUHV2?=
 =?utf-8?B?QXdkQlVrWUFzTm5DVklnM05OZy9FOW5uc21kQnJ4UTJ6VFdQNDhxRDBnQU1Y?=
 =?utf-8?B?bmprMWE2NDlwS0lDOG1HMkNHMlR6WEpZSkx5SHh2UlFMWjFId3dyb3ZCbzNm?=
 =?utf-8?B?NnMydVpnSVdGZDdmU0RJVCswYmx5R1c3VG5TRUxkRmg1TTJPLzJyQVBnNnVa?=
 =?utf-8?B?OW9obFJPOFljSHNTaExweDV6N2RPQU1LTkxHS1dNczA1b1NpSHRCSFBURytG?=
 =?utf-8?B?SmlxeVhpL1ZTcndHUnl4QUNEMDY5eS8xM3pWcjFZNktmWWVzZUV6cE5BZUU1?=
 =?utf-8?B?bnc1RDFYMEx3Zk5seDFuU3I0Y0R0V1lnbXBRUlhHTUEyd21zdTR0N3JtQ3Zs?=
 =?utf-8?B?TmpDYy9EbjI1SWJqUElYTzRBOVN1R1VjcnZYQkgxeTFXNnZxWHpRVGJSTFVx?=
 =?utf-8?B?QXNlem9rZDVRMnRPR3lwYlp6WURVZ3NlVGRMcDhHUnY0dkxPTGF5dnlGeVR0?=
 =?utf-8?B?YVhsb2Q1Rno0WHcyMEpKZEwzUFNLTzl0R0MvQW1zbk4wMFpnbGZJN1AvWmN1?=
 =?utf-8?B?d3ovM3FtNndHS3REZDB2K3VlMmdlWE1GNkduMnVmZ21JV3EwbXpGejZ0RE9C?=
 =?utf-8?B?MFVPYXRaVGlMRzI3eHNVeHd3S3Z1VTd0enNzTVZxZDZWeEg1UEpKL0pXeVRn?=
 =?utf-8?B?cGNERjkvL1dUQWxIWDBuV05TQkxFbmwxOWlrVVJpd0wvVUNma05UTTVtRkZ5?=
 =?utf-8?B?VzRTMlJCR1R3VkxlRFNieUhPQnNWTmRzaEYvZ1VFU0lCRzl6WC8vSytFbEwx?=
 =?utf-8?B?WEx0bXpMdG43ZmgrRUxMeE5SbUxDZ3FScXdOSWJnWTI1YWsrUk1qUE1SaDFB?=
 =?utf-8?B?SVdPMEtKMTdWbFA5b2dEQ3pWc3dPTVpFTGVEMDhOZ1ZoNGNrMFlCSGIrYS90?=
 =?utf-8?B?d3h3Q09jaWRQMFlWSUtjUWErbFZoSStKZ3RUcE1Fb3o3bFVhUGl0WVJUSTN5?=
 =?utf-8?B?YTU1VTBhbjhtOFMzSHc3WmtNQW0zTklEQmxIcHVjMkszZFIvZXNiaDNpaCtX?=
 =?utf-8?B?TDE0RSt5WmVMbXlCMzVVUnVGcVl3PT0=?=
Content-ID: <55BC135F98201D4896166A1B421AB670@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831db819-b3f2-496b-fad1-08d9a4429f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 12:07:09.9570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKE7pdjyW6zJofiGdgxyIxxe4mcdEeS1qZpoG5zuwfAV/Ak1uyBnnI+FdzezOQdwY1fGP04MZAm5fBTlwaFjOhF0cTDd5DD1BN+/RqtIRbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_040718_218621_638119C4 
X-CRM114-Status: GOOD (  23.30  )
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

On 08/11/2021 21:40, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Update the device tree for the icicle kit by splitting it into a third part,
>> which contains peripherals in the fpga fabric, add new peripherals
>> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
>> map which have been changed.
> 
> This should be multiple commits because you mix up refactoring (split)
> and adding new features. The patch is really, really difficult to
> review. I gave up in the middle.
> 
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../dts/microchip/microchip-mpfs-fabric.dtsi  |  21 ++
>>   .../microchip/microchip-mpfs-icicle-kit.dts   | 159 +++++++--
>>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 333 ++++++++++++++----
>>   3 files changed, 428 insertions(+), 85 deletions(-)
>>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>> new file mode 100644
>> index 000000000000..8fa3356494f1
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>> +
>> +/ {
>> +     fpgadma: fpgadma@60020000 {
>> +             compatible = "microchip,mpfs-fpga-dma-uio";
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             reg = <0x0 0x60020000 0x0 0x1000>;
>> +             interrupt-parent = <&plic>;
>> +             interrupts = <PLIC_INT_FABRIC_F2H_2>;
>> +             status = "okay";
>> +     };
>> +
>> +     fpgalsram: fpga_lsram@61000000 {
> 
> Node names go with hyphen, but actually you should not need it, because
> the name should be generic, e.g. "uio".
sure, will change it to uio.
> 
> However there is no such compatible and checkpatch should complain about it.
yeah, this and the pac1934 i didnt send bindings for - erroneously 
thought i might not have to do so. ill get a binding sorted out for both 
of these.
> 
>> +             compatible = "generic-uio";
>> +             reg = <0x0 0x61000000 0x0 0x0001000
>> +                     0x14 0x00000000 0x0 0x00010000>;
>> +             status = "okay";
>> +     };
>> +};
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> index fc1e5869df1b..4212129fcdf1 100644
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> @@ -1,5 +1,5 @@
>>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> -/* Copyright (c) 2020 Microchip Technology Inc */
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>>
>>   /dts-v1/;
>>
>> @@ -13,72 +13,187 @@ / {
>>        compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>>
>>        aliases {
>> -             ethernet0 = &emac1;
>> -             serial0 = &serial0;
>> -             serial1 = &serial1;
>> -             serial2 = &serial2;
>> -             serial3 = &serial3;> +          mmuart0 = &mmuart0;
>> +             mmuart1 = &mmuart1;
>> +             mmuart2 = &mmuart2;
>> +             mmuart3 = &mmuart3;
>> +             mmuart4 = &mmuart4;
> 
> Why? Commit msg does not explain it.
changed to match all of our documentation
> 
>>        };
>>
>>        chosen {
>> -             stdout-path = "serial0:115200n8";
>> +             stdout-path = "mmuart1:115200n8";
>>        };
>>
>>        cpus {
>>                timebase-frequency = <RTCCLK_FREQ>;
>>        };
>>
>> -     memory@80000000 {
>> +     ddrc_cache_lo: memory@80000000 {
>>                device_type = "memory";
>> -             reg = <0x0 0x80000000 0x0 0x40000000>;
>> -             clocks = <&clkcfg 26>;
>> +             reg = <0x0 0x80000000 0x0 0x2e000000>;
>> +             clocks = <&clkcfg CLK_DDRC>;
>> +             status = "okay";
>> +     };
>> +
>> +     ddrc_cache_hi: memory@1000000000 {
>> +             device_type = "memory";
>> +             reg = <0x10 0x0 0x0 0x40000000>;
>> +             clocks = <&clkcfg CLK_DDRC>;
>> +             status = "okay";
>>        };
>>   };
>>
>> -&serial0 {
>> +&mmuart1 {
>>        status = "okay";
>>   };
>>
>> -&serial1 {
>> +&mmuart2 {
>>        status = "okay";
>>   };
>>
>> -&serial2 {
>> +&mmuart3 {
>>        status = "okay";
>>   };
>>
>> -&serial3 {
>> +&mmuart4 {
>>        status = "okay";
>>   };
>>
>>   &mmc {
>>        status = "okay";
>> -
>>        bus-width = <4>;
>>        disable-wp;
>>        cap-sd-highspeed;
>> +     cap-mmc-highspeed;
>>        card-detect-delay = <200>;
>> +     mmc-ddr-1_8v;
>> +     mmc-hs200-1_8v;
>>        sd-uhs-sdr12;
>>        sd-uhs-sdr25;
>>        sd-uhs-sdr50;
>>        sd-uhs-sdr104;
>>   };
>>
>> -&emac0 {
>> +&spi0 {
>> +     status = "okay";
>> +     spidev@0 {
>> +             compatible = "spidev";
> 
> 1. There is no such compatible,
> 2. You should have big fat warning when booting, so such DT cannot be
> accepted.
this one was an oversight from me, that compatible has never been 
"spidev" on its own in our internal stuff and i mustve accidentally 
dropped a vendor string while making these patches.
> 
>> +             reg = <0>; /* CS 0 */
>> +             spi-max-frequency = <10000000>;
>> +             status = "okay";
>> +     };
>> +};
>> +
>> +&spi1 {
>> +     status = "okay";
>> +};
>> +
>> +&qspi {
>> +     status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +     status = "okay";
>> +     pac193x: pac193x@10 {
> 
> Generic node name. Looks like compatible is not documented, so first
> bindings.
> 
as above
> 
>> +             compatible = "microchip,pac1934";
>> +             reg = <0x10>;
>> +             samp-rate = <64>;
>> +             status = "okay";
>> +             ch0: channel0 {
>> +                     uohms-shunt-res = <10000>;
>> +                     rail-name = "VDDREG";
>> +                     channel_enabled;
>> +             };
>> +             ch1: channel1 {
>> +                     uohms-shunt-res = <10000>;
>> +                     rail-name = "VDDA25";
>> +                     channel_enabled;
>> +             };
>> +             ch2: channel2 {
>> +                     uohms-shunt-res = <10000>;
>> +                     rail-name = "VDD25";
>> +                     channel_enabled;
>> +             };
>> +             ch3: channel3 {
>> +                     uohms-shunt-res = <10000>;
>> +                     rail-name = "VDDA_REG";
>> +                     channel_enabled;
>> +             };
>> +     };
>> +};
>> +
>> +&mac0 {
>> +     status = "okay";
>>        phy-mode = "sgmii";
>>        phy-handle = <&phy0>;
>> -     phy0: ethernet-phy@8 {
>> -             reg = <8>;
>> -             ti,fifo-depth = <0x01>;
>> -     };
>>   };
>>
>> -&emac1 {
>> +&mac1 {
> 
> I gave up here, it's not easy to find what is effect of refactoring,
> what is a new node.
yeah, ill split it into several patches - probably one for the 
splitting, one for the new defines, one for the changes to existing 
nodes and one for node additions.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
