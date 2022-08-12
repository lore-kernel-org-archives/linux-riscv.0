Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E767C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OPWewVUA+4E2Klr3Az6QGX0tlemEtwyjHlLozzMlFJQ=; b=BcR5FH8RLjwyvi
	FqBTzUF77GjYsaDjLA2Lg4Xav8sL8el1X3dPD3Xh939db44Hswe1qWQ3UKs7nTw4ntWjc88VilCAP
	T8vxGBn9lz9o5C02A68rS5dO5nKA3jhgfHOcdgVu0Lc48jCpcEP2pAdu67RT7PB5aTuyhhxJyE3Nh
	IrBn/g7lrX4Tk3G4DYfacO4fHHBksg0mNzG7YX3cqKo/DjDPguAi9Tr/IsFJ9AACi0OKghBMdbIM4
	K25FYBnfiYbK9X5OdLMRcRrz1xnmV9by01+zi3BAyblLAOBq85a1Nxh+ayc+R32bp0RflB9+PG3zk
	nJ60M8EgR6LlO5e1P3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXRH-00AoSM-R9; Fri, 12 Aug 2022 16:23:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXRE-00AoRI-AR
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660321388; x=1691857388;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=qMSn72skwdtli6YwoKY0DFQQCBCBJjj++FxCmgDWwiU=;
  b=cFnW1qVUwZXhUIp68iPex7PnXVtKHKaSTmzb2/gGynB27vnD+UIzXfVp
   bs3u+vt05sR3VofTjdHMyg+pqLPJd9PjdTPOgMOTILBHMVxmHH+rHFtCE
   OAodmCQcE0afTZW2DO7sCurrSTOBnsEZB3AysUkStIw/Mhr5a3Qpyomwa
   QJqHQw1DF7eohvL30rAffvwAexz2oEdgpKISw9m1WzeYNJaRkzjQhDpfV
   PBg5jzgw1HnqbMDkEOEadJOJNyWtTmMBr9i1w+WPFRF1qq0n7ymDql+D8
   OFWxswisFpX4EIDBW3IePPOU7BaCcxWYiC2An/GKy4qnR7hVs7/E7QohE
   g==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="176172976"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 09:23:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 12 Aug 2022 09:23:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 09:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhAT5YdrB9YQQqiZeHmNeUK22utaPADO+3icryjUYf/pXk22jEVvNPCGKAP6AX7yjWUPYL994Mo8VTY+BDycJLG8+CGBLHMZUQnM7jdIHSdZatkrC1ZNIRQ6caFKEwDeSv/MkrxNaRenDQuloiu6fiuabmj55LZBCM/1OaNl6IubLU+ayASydOHJ07YQi6M8848lGiUIrqSp9Oioh9W00fF0YEq/BtNGKxRqBad6vFF8hirpZ2h4JyAghfH3FLBVOLDFV4aWFF77INtDRxozJ8hxN5u3smPWFLO6bQHzJgX0E9lO0mLdlGfgeK3EcJBHn6SicJZAaSQ7Tak88T3ZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMSn72skwdtli6YwoKY0DFQQCBCBJjj++FxCmgDWwiU=;
 b=WzOpEp4gp3DEek/T1WyNibyVU+85LL0uPLS3eXZvPvHHYqwMGjvTvPzesgPIk9hOCl9GM3cWt/omLVNB5PvOtfYW8DmwEMdbNwfsrZQnEp30HFhFvZW2YMLBgvgKuJ6L9775isjVOeSmvEJncDdpo3XQ/QAicijIHDfOeNMFjk6nIQg+KaegqsUiC4VofxOh6nhBrBSf+uiZEUp6eX7xrBPwY4bobdH2dSQKrPyp66Cpzjv56PEL4oNRj7EZJxw4Zbozs4KPoov4HCmem5BUMb3lhgSGhbQbqgmzdh4LSWBfTt6ZO/vMcyTKVl1Quupld3hxyeqBCGKvDOAXlmTmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMSn72skwdtli6YwoKY0DFQQCBCBJjj++FxCmgDWwiU=;
 b=Bk9Cq+2R50f3hshECM0ZBKifUhyjHl98vkIPdiSMY7hG5c4akX8uH9OocJ/og2e4bana9YhkP6T6JFk25S4DoxgVYA1TRmfxOAi7aJ/I8VPFVLRVxAU14sqIQP8mMC7O/F4pSxzVl1mPTyMsrMB7fgHwhbniFqqMPZhh+Iku3JY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2998.namprd11.prod.outlook.com (2603:10b6:a03:84::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 12 Aug
 2022 16:22:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 16:22:50 +0000
From: <Conor.Dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
Subject: randconfig linker errors
Thread-Topic: randconfig linker errors
Thread-Index: AQHYrmfEuq3Hqx3KP0WjIRTBQgQgDw==
Date: Fri, 12 Aug 2022 16:22:50 +0000
Message-ID: <47c9157f-9f2c-6e6b-19e0-e4c4707b1a2c@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6af519ea-ad1a-4ca3-19fe-08da7c7ee6f9
x-ms-traffictypediagnostic: BYAPR11MB2998:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nrOi7r3yH0IN9CIa11yrWYfbD2F+0xHz1htcoL8EeF7AZ3Z/FGMvdNJJnS87l2idY1Heh0gdGDIf9LxQRH3fkY1NcNenf4/xcrYtw9pFix4dkFPqHociGLGuX+7Y5QU1WX3wMTKNBNYe5CisGJycv/43Q8vbOGe1zTUKL9Ns69aQ0TA+xrNDDkpLggvYSaKNYwTY4J4Bcz/m78pw7x+zFC9qW40D68Upes9L/ZzSck4YcrQbE2Y/YwJXC56kyXnmgypGjlZYSQVC1jjfTSb9Xl5c6J5r6/xs8mg4W19XzPo1HnB6BVMQ90qHYu5lXB/HY7ZO4ttP8Jz2AGDsc88cmGn2ZDPLWhQAMxGFJWKZPwSFhqItMZ4DoCKrN5bYim99humiMtykYybnJk853dwWxaqr15P8VE80PTzcKWgvEVw1xGKLG6nCvGIK+9cmKlR2+YmHv1NFAzOveJ2onRx/L47eX/wvDdDjueFVyowgB6A+5LgUm6GwicgJr9lvpU3hB4ckkXv8M3TtsqLC+dBVf8ax2L7AAZA4WNutcENY2hAcr9a+a2hTUuIm3VruUHxnPtWTWXeRoxKVgMJqC09YaxPHEh6z2kLYOfL3vehDuwF1LC5DUK11JluTG2E3fTP07KCCdQ7rmGys1uVeGRrQKZeKvD1cac/B77W7VYhELoW/utzOSQjXwvNOSfkr7oT7Rgb28UGCDDJa9+3su4FRb16iLV0SH0Jzya545vEH3boF/fqCvXVk5kZntAmtITno95Ktx6nnCYSoo3z8N9PSqw4tDrX8ko5978wxyDJV0w3ZgBsSK0zOE/08NrMQN7IOT+dHeR7T190jme9b+VEZ6qx4Rkr5akHQxTv4zeJi5EvtNMM36Z/kxIFXXn2whpY+4vO6smauFCg/mxJtjHk9eg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(366004)(136003)(39860400002)(316002)(6506007)(3480700007)(122000001)(6916009)(36756003)(38100700002)(91956017)(66476007)(41300700001)(66946007)(26005)(7116003)(6512007)(64756008)(71200400001)(38070700005)(66556008)(66446008)(76116006)(8676002)(86362001)(31686004)(83380400001)(8936002)(2616005)(478600001)(5660300002)(2906002)(6486002)(186003)(31696002)(133083001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHAvdE5wM2xzcGQyUkFCSG5kL0lldStES3JKQzQ1aUlYbHdlOW5uLzViV3lh?=
 =?utf-8?B?VlVFU211ZFpmM3JhZFNtb2w1d0ZPMzdGUTZBRG05K3UrcGJ3K0lHbFF3bkQy?=
 =?utf-8?B?a0NSV2NuSEVjR0dBZitLeE1Yd3ZaK3JUbG8wanhqb0Q3UERBMzR5TVAvditE?=
 =?utf-8?B?SGMxM3k5NU4rK3lmeVNoVkZhVUFMbFdGQmg1KzZheGFvOEFxQzh4TWZXYTk3?=
 =?utf-8?B?bkRvdkhDQjFEeHNQZnRlSFNLRCt5UTRSaDY2WWVrajV1QXV1Qzg2UFFHWWsr?=
 =?utf-8?B?d3NRK1RmM1h3MzZVZjZZQ3dkL0FtVDA3eGNYaGZNbzN5NkNNMWZVelNZSFJ1?=
 =?utf-8?B?NUYxd0xNbjhEY3UwL1BJZmxDelc5a1dkNndPRkVZclF6a0NzeS9JcXVEL3Rn?=
 =?utf-8?B?Vjl4YTVQRWhvcUh3MVViZnJmVjRUYm9pUkRleU9KbGxEVHg2eUlCKys1UG1B?=
 =?utf-8?B?NFJyQXkxT2QvbmpyRFZ2bmFFK2RzSnRTSHZqc0t5TnZxU2RJU081S2VBbWJp?=
 =?utf-8?B?Ky9ZRE40MXVUWUJ0bU9ESk1uUzNPQmMrZGJ5YkN1M3orMXB5UnY2R2Y5ZG1P?=
 =?utf-8?B?VkhIaHlrRHJOZC8zTk9rRjJWQzJ3N0pNbTl5dFZLTkQ0VjU2TUMvSXhHZFBo?=
 =?utf-8?B?NjQ1enZlRUVGeFpJZ2l3bTc2TFVOSG44Smo5Vkc4aE1kZXVQQitZQ3VZcHZI?=
 =?utf-8?B?ZHp6UDUzVHpIOXNBZk5HUVlrMk5sSGRoSUhDamlVbW1LU1l5Uk5pUzQ0bXlk?=
 =?utf-8?B?Wko1ZldkRXNYNkxQMDBxNFJlNE1xamtwWmRiUkFCSlVkb0JXdG1KTU10bHFw?=
 =?utf-8?B?RGNkVmN5SlByTVFPVzM2NTNRb2F2TDNEc2M0ckk1ZVpaSC8zYTZOV1FBYkVj?=
 =?utf-8?B?K3RYYkZYc0xQKzJtQzFMQmNXUlI5ei9wb2o1Tnl1RGwveXE5a2NjV2lEd0dm?=
 =?utf-8?B?bkJjSzlJN1RJTFZaUmJZMWMyQ3lWNkZWTm5qaW1LN2FUbzMzK21KV2wwTkZm?=
 =?utf-8?B?SVl1RUU4YmIwN3JBSWQzRUp6Z2ZxdWQxd0JSNXg3dHdsYTJPTHJyTHNCTjVp?=
 =?utf-8?B?SWV0K2VyODlvc2Y2bkRXQ1BsZjRTU2VxSkRxRlFMVHJ1S29sQW95dWpiZmlU?=
 =?utf-8?B?YkFQY2hMNVVUY3RkYXBJY2NER1hjL2wwWTVycUJtSnB6cTNodzUrVWQ0ZExr?=
 =?utf-8?B?bG9JZmcyUEVRdEZXSzBrU3JyMFl4L040YlBWSkQ1SHk3aHJqWkcybzhWaG1N?=
 =?utf-8?B?YmRnUnlPSmdTOWovWDJLVmJhSStNWExKcDBOSEtmbDVxcE53MkdoUWpRYVJa?=
 =?utf-8?B?OWttVVhpd280d3BJQ1EycHRIQUpxR2ROTDI2dEV5WkczSTR1QytQK2dqS3FO?=
 =?utf-8?B?aUpjYlREQmJIWkZ2SklMaDRwb2Q4T0JJOVBSaW03NFRBRDE2NlhidTZnTXNZ?=
 =?utf-8?B?QS9NbGZUVDgxN2V5MXRtNmtQVVZqc09FV3V6V3RlSzU0S25jWjVhYzVhL3NM?=
 =?utf-8?B?SSswWUVpYTI3MHJyWmp1Vkc4T0JlTllGTUh1TWprR1hDK0NCZGNzVlhkVHV1?=
 =?utf-8?B?d1QvUVVTRVcrNDVMQTZib0NyeUlyYlI3ejB0cE1XMXYydGxYdmp3THZxbjNv?=
 =?utf-8?B?dDB6TGU0SEhWL3J1ZlkxS0pwV3pRRjM2QnUrZlVENzVwRDVXUTUwdWJRRGd3?=
 =?utf-8?B?YkJOa1cvbHBNcms5NG9nalA2dXltejNqMnl5R1lleUtCTjZPejg3QW5jd0o5?=
 =?utf-8?B?SjBSajNBbFpEdDNlbjkwZGtMVUNvdU9FamxqbFgvRTJsQ2ExTHB4bTlzNXBH?=
 =?utf-8?B?UExKQng4TlFRdmV5UEpSeTIxWWhsdnIvZGlSaGx1M3FQd1ZINWxRZnRxbHRC?=
 =?utf-8?B?R3BoWnRoOC90TUMvZnphMVBrWGxpNXBMeVV1MFlhN0FKa1hqa1dFODRidkFH?=
 =?utf-8?B?aWZXTnFWRDgxS1hlL1YvSDRqYy9KdTk3S2FvbWFXWUFpVE5ZcXFzdmtDOWlF?=
 =?utf-8?B?WXB5L2pxejNwMWdVMVNEM3B2TDZiUHAzZFArVXVWM3NwNG5LS1lCbFd1RmIx?=
 =?utf-8?B?aUptRGNpeE1wVXMvTFBLVEtrQytJUis5N2lXZFJQL0dIbi85Q1BBVHQvMEt0?=
 =?utf-8?Q?E8wJbjoNlpLU+tJJC+FYV8/uW?=
Content-ID: <FC369B5B63CFC24D89C7018D247D7E4E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af519ea-ad1a-4ca3-19fe-08da7c7ee6f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 16:22:50.8842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gaQV938WoDL3L1MliWfn7BitpyyYzzpiNq15fzCyuksBQz1wdLhJYQeD3ux3dUVyDykhJNyvHmmetyMyWzWMznnPcZ50bCd2XBetaO+2sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_092308_714577_43F80C60 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Hey,
Seem to have run into some randconfig failures, which seem to be
replicable as far back as at least v5.19, on riscv/for-next as of
5cef38dd03f3 ("dt-bindings: gpio: sifive: add gpio-line-names").

The base config is one I downloaded while looking at the LKP
reported zicbom problem & I just pressed enter on all config
prompts after that..

Linker errors are kinda beyond me, so throwing it up here :)
Configs are attached.

With GCC (riscv-gnu-toolchain 2022.03.09)
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  CC      .vmlinux.export.o
  LD      .tmp_vmlinux.kallsyms1
riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8): undefined reference to `compat_sys_fadvise64_64'
make[2]: *** [/stuff/linux/Makefile:1165: vmlinux] Error 1
make[2]: Leaving directory '/stuff/brsdk/work/linux'
make[1]: *** [Makefile:219: __sub-make] Error 2
make[1]: Leaving directory '/stuff/linux'
make: *** [Makefile:153: random-config] Error 2

With clang/llvm 15:
HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CALL    /stuff/linux/scripts/atomic/check-atomics.sh
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/riscv/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /stuff/linux/scripts/checksyscalls.sh
  LDS     arch/riscv/kernel/vdso/vdso.lds
  AS      arch/riscv/kernel/vdso/rt_sigreturn.o
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
  AS      arch/riscv/kernel/vdso/flush_icache.o
  AS      arch/riscv/kernel/vdso/note.o
  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
ld.lld: error: section .dynamic file range overlaps with .text
>>> .dynamic range is [0x760, 0x88F]
>>> .text range is [0x800, 0x12B9]

ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
>>> .text range is [0x800, 0x12B9]
>>> _ftrace_annotated_branch range is [0x890, 0xBEF]

ld.lld: error: section .dynamic virtual address range overlaps with .text
>>> .dynamic range is [0x760, 0x88F]
>>> .text range is [0x800, 0x12B9]

ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
>>> .text range is [0x800, 0x12B9]
>>> _ftrace_annotated_branch range is [0x890, 0xBEF]

ld.lld: error: section .dynamic load address range overlaps with .text
>>> .dynamic range is [0x760, 0x88F]
>>> .text range is [0x800, 0x12B9]

ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
>>> .text range is [0x800, 0x12B9]
>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
  VDSOSYM include/generated/vdso-offsets.h
llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory
  LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
  VDSOAS arch/riscv/kernel/compat_vdso/rt_sigreturn.o
  VDSOAS arch/riscv/kernel/compat_vdso/getcpu.o
  VDSOAS arch/riscv/kernel/compat_vdso/flush_icache.o
  VDSOAS arch/riscv/kernel/compat_vdso/note.o
  VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
  VDSOSYM include/generated/compat_vdso-offsets.h
  CC      init/main.o
  CHK     include/generated/compile.h
  CC      init/do_mounts.o
  CC      init/do_mounts_initrd.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  HOSTCC  usr/gen_init_cpio
  CC      init/init_task.o
  CC      arch/riscv/mm/init.o
  UPD     include/generated/compile.h
  CC      arch/riscv/mm/extable.o
  CC      arch/riscv/net/bpf_jit_core.o
  CC      certs/system_keyring.o
  AR      arch/riscv/kernel/probes/built-in.a
  CC      kernel/sched/core.o
  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
ld.lld: error: section .dynamic file range overlaps with .text
>>> .dynamic range is [0x760, 0x88F]
>>> .text range is [0x800, 0x12B9]

ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
>>> .text range is [0x800, 0x12B9]
>>> _ftrace_annotated_branch range is [0x890, 0xBEF]

ld.lld: error: section .dynamic virtual address range overlaps with .text
>>> .dynamic range is [0x760, 0x88F]
>>> .text range is [0x800, 0x12B9]

ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
>>> .text range is [0x800, 0x12B9]
>>> _ftrace_annotated_branch range is [0x890, 0xBEF]

ld.lld: error: section .dynamic load address range overlaps with .text
>>> .dynamic range is [0x760, 0x88F]
>>> .text range is [0x800, 0x12B9]

ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
>>> .text range is [0x800, 0x12B9]
>>> _ftrace_annotated_branch range is [0x890, 0xBEF]
  OBJCOPY arch/riscv/kernel/vdso/vdso.so
  GEN     usr/initramfs_data.cpio
llvm-objcopy: error: 'arch/riscv/kernel/vdso/vdso.so.dbg': No such file or directory
make[5]: *** [/stuff/linux/arch/riscv/kernel/vdso/Makefile:53: arch/riscv/kernel/vdso/vdso.so] Error 1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
