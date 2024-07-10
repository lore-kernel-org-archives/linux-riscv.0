Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D44C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vDm13SLUwq9xuEFaXmcwkKLhzIuWEO81HkynAwR3fM=; b=LzJ5r3DHg4Jnuu
	8W45a6GZcWV/j3SwoC4bQ9PQoLQglOtVJw9WMSxcY08LWPvTFXSDabirz9uZ+BM5X50tMfZbErb6V
	HASB0pXvqafr8rp3JPsTQf2DaRwywi41jjmJz66pSIF7FEpcIygb5KPlNmcYg5Ld/Tan5UbRqTW0n
	5ThDHVy4t+BGX037b2tsllSxQAq6rTy3QNKevWYULsen0BJCWi8yzCxPI9d4wQFCn1Myk51ioqoGE
	Xhqv7C55x3JqyaN8k9yBop9s4IquTSStHBslEE0NZID4DsYSsWYUse+Ra1Wx2cqag22CggCbCM9wf
	rbPgnn4WH7aoxMaytQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZkC-0000000B3Ke-2gus;
	Wed, 10 Jul 2024 16:00:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYiW-0000000At65-1PBq
	for linux-riscv@bombadil.infradead.org;
	Wed, 10 Jul 2024 14:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=CyVGlwzuzuGKiV0owa0etd+4OLLbOyDrUS+h4uRqiWY=; b=qIpOdoZhlJ/2ikrT27bRAU9X0+
	eyI2UjP8luc/U9N8wwpeEEK1zIec7nuB5zXGJRx/1U00bXaUVq2SSb7/2+p27JWKMfH0ebc0MO+0X
	NOhty9Dj/zSqkQWn8BRc72b+2MEyNs9cpK9P+i16JKRFRYR3KMwBcJpL3wJI78pyIqU4eCdfp8Pbh
	ednrn0Za73MAw2pUUstlGrnc6d24vjRdlyh/+8kVFSQpix5iP4D56auCfU6JGgUsOvsKWqbWD9eLA
	CXxkyVy4WHTH7ipEBlwcME1mExqOO54XF0Ez0joY6tOSs1QAUbCAdEfV/R1kc6ZgyFk3qQClMKSYh
	ybnCFPkQ==;
Received: from mail-vi1eur05on20600.outbound.protection.outlook.com ([2a01:111:f403:2613::600] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYiQ-00000000urD-346B
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 14:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpONcsikXYfzeY80OseljXfvZmFvFSXYJuOgfeJ8iecrpJVNyyNHpMLV1jzdJDbN6zMC48RnasJeAjyLdjU0pkmeFAeGRmRWL1qY3uyqiPxJc1ZxQfAB+GAMH2J4sG+DnOQkBGWiHOizJTVY1I2E6Ecw/qEU0bxyP3oKeW+IfZfE1SOTIfnqD+VFq3RzN3v0Jw7so7AHnEp4t8ChtFrFq8ciXoAgzMpUOxNB08qqmvUyC7jBkyejbXKybNfHBcbWyoguBXfidNu1GCk5vOxYg+yZWos1xh3NEKg+e6rxM/QBrkg9i2RUH7mGkL5ZtHjtrmS8BZLNp6Ugo9aqTQZRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyVGlwzuzuGKiV0owa0etd+4OLLbOyDrUS+h4uRqiWY=;
 b=JylKtpd9SHUfH+f6RmbLWIO/3KJUK8VVxmyqFo92O5ti1kBnc3sdMXZxxytHzs01vw/qgwjQhuAV6oQ7sjJr++TaQya9PPTHdpYTTWXlxEzKEco4JYWcOhwYswo2ldrS5ZBWycinucRb9byboQedxK1TTKUv8I4W8bE3wB6gTWe7TmDwEeeZz6ex+0HseC+Dfb5YTXiLu/ubDyAwwMVUEc4uHaahR/iR7pTyCD1safPkD8LcH2rSk57R3DJYSASWHnYm0bnaakSbbPbT53aJsf9bQCY1NlRoI6TWNInE9Vk7/oyK5NFtMb8ilLCPobJng7vGVhxFaWDpNTPSE72/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyVGlwzuzuGKiV0owa0etd+4OLLbOyDrUS+h4uRqiWY=;
 b=MTsT9q1FP9ih0ngzNXpwFAfzRxXQQwmfvtwOfHb248JroFNrK3RjNcWsZO7AFEb76W73fEtG3Rnl6N2JmAIhuT4tRuGnYIp4rGmPTZd1kr25KXbENvOPF2OFajKVUmXgN59FGq3rNj6BSuk/CNXB0cWLTKhxeOLtVeuUvorRE9N+auCUJn52QoAj16R5HfKsYlhUJAo3+g5tcw49VP7bARakxoFyg7scaTrmRETdUPgINQ+jMPy3p5xGCwBcXjoIWbyGBzvvBCX4GNS/KT3wxKffzisi655ZZCcaJdEdIEFGvEAdJqZ6no8sug7QWPWIU0ApKZnFafcL9NaCf/kvJQ==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by DBBPR07MB7434.eurprd07.prod.outlook.com (2603:10a6:10:1ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 14:54:36 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 14:54:36 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Peter Xu <peterx@redhat.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>
CC: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Oscar
 Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Thread-Topic: [PATCH v2 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Thread-Index: AQHa0p4D2W7MMhCsM0ethL853L/GprHwCroAgAACMoA=
Date: Wed, 10 Jul 2024 14:54:36 +0000
Message-ID: <b37a0bb5-ba6f-4db3-af8f-83e06eec086d@cs-soprasteria.com>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
 <f69941b076bf8fec89b6bec5573fdb79483c2a75.1720597744.git.christophe.leroy@csgroup.eu>
 <Zo6e1ILgDn6nuhGC@x1n>
In-Reply-To: <Zo6e1ILgDn6nuhGC@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|DBBPR07MB7434:EE_
x-ms-office365-filtering-correlation-id: 9455967d-8a77-463a-a5fa-08dca0f037a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U2MyRGdSdGs1WGRMcXZ0QnZwY0l2VW0xdDlweVhyTnNua1o1VGdRcDErS1I4?=
 =?utf-8?B?WHpMbTdtUDNBNGt4RG1penl4SGdkR0RmM3Nzc29GUG1aMm1CMkUzT2dMLzVp?=
 =?utf-8?B?SGZ3WitDTlJqME9vZzBYbzFoV1AyazdSS2U5cCs4UFREUnltY2MwRjRGUldY?=
 =?utf-8?B?REtYVUhGRmo4SHJKcEkrM0l4U2VHRFA1QWE1azJjVXlNV2N4SU5Sb2g4VE9h?=
 =?utf-8?B?WHU3RjMwS1d6SlNtOEVBaktCME14QU1QVStSSG1iV2dOQTdBSXBHbCtqRDJn?=
 =?utf-8?B?QjVpS1ZwMm1SWG1NbzNHa2RRNDdDT0wwdDl6a2pkWGt4OVVmZHhQQ1VzZ1dE?=
 =?utf-8?B?c3lFYVdUYW85UW1YSTdIRXBpRnQweFdhVGFaVWEvSjhWZEd3UlhVTHczS3JC?=
 =?utf-8?B?VUMrVjN0MGJxd2xnMmdxdWduUFVLOWQ5NGFBUGtFZTh1ZGhQL0pWdmdFRmk2?=
 =?utf-8?B?RDBVSmkwZzZvYkJaN1AvaGRLaGxua1o3aGhPS2xvMDZEQVFReTZ0U1A4NkVK?=
 =?utf-8?B?OEpVRFRHQzdIU1k4N2ZMVUZFdGNMeHc4VzlBZDVQZFpnbkQ0a0J1YUM3NnNt?=
 =?utf-8?B?SmlRem5ETmZENjFYWmROckhPN0RYVzRRRGdVTHVJTGVPQmhHQnlpMldpWjRC?=
 =?utf-8?B?M0dVV0JyMXVLZ3p6OGoyZGFDOGZ2WkNIVEVPWHlWZVgxNVBRY3BxWVREbmpE?=
 =?utf-8?B?UkdkeUFFUDdZN3J1OUp5cWM3aWE2R0k4eFdkQzBzeXE5OWprVUYrVFVrM1hJ?=
 =?utf-8?B?Z2IrZ0htUXBjUElqNWRYdE5rUFlVdHVPc29XNW5ST0NmMU1RaFFOSW1WWFJ1?=
 =?utf-8?B?VjJZMkxTYTBma0RZK2o1S2dId096L2dLM3BuRVFNWkNFUmJhempOYXI2NEMy?=
 =?utf-8?B?OCtZZUR4bWl6L2puS1VoWDA2Mis0UXp4RjI3a28vUU54MTRiQ0hVZG9aMG9x?=
 =?utf-8?B?elRNRjFLNzlta2ZMTk1tSWt2amZVR1ZHYUIxUG9zQjJmTU1KL0hqd0JkYmI3?=
 =?utf-8?B?YnJlOVlyekJ5SjRPd0QxdzFuUlp1UjRndktVM1dXUjJPN1ZRakw2NEJ3ekll?=
 =?utf-8?B?NzNNcjAvSzJ3dmZlZjhCYm9jSjBuNEkzWXJ5S3czYlVyS2lKSUZ4eHE3RnlQ?=
 =?utf-8?B?dzgxUUthVDFiOElSY0VlNE1lcXpHSUYrRTJUczlwV3dlV2ZwUU9OeVpvUEV3?=
 =?utf-8?B?dTY3U0hmYUVURVJsam8raUlVdXVWVnN0Vk80Vng4VXFyU2srQWZMRk1DQ3dq?=
 =?utf-8?B?ZlhSTTk0dGZ4SXRabTB0cnROOEhBaEN4cXBrUm1iTXIrT21MRW9rNUdvYyth?=
 =?utf-8?B?ZVlacGFabWMzdUJnK0pESC93NG1qN2R3QTJ3ck9KbGF5NWtBZk5sekpOVUFx?=
 =?utf-8?B?bS9LVTBCTGtxQis2R3lOS3dWd1hEVTJqcXM5WUZZVnE5bUJJZC9qVTF1WmlU?=
 =?utf-8?B?TG93azJ2cHpLcEZKRHhUYnVwVjBZQzBDelZTYTE3cWNCa1ZLYm9pRXFrcS8y?=
 =?utf-8?B?YzNvVzkwZFVSMlNkcVRselY2N3JpejlQQnRDY3ByZDd5NllSRFFnYWx0VnpM?=
 =?utf-8?B?VTdQVXRNWHlaZ25oN01WRURtRlVNMDZIdTNqQVRVRGlLQVI3V0svM1VPTnRr?=
 =?utf-8?B?UXRLZ1I3SmZEdEZJcEZXM0ZUcHlvVENXRGdOdjZScklrZ05IbkNCMmJlZmJS?=
 =?utf-8?B?a0gyMngvelI5dEhsQVIxRVB5UFRtWGF2NlhKU3cwMDJOVkZ4VEZFVDdTTWov?=
 =?utf-8?B?b2VnMG1DU0hHcVlXNjgrS2Q1MGhOcm9SQWtucE9mcTVwUFVBU3BzNFlSajh4?=
 =?utf-8?B?TGl2anIxOFB3ZlBxTmtTUEdIZ3YxWmVhZWE0M3hhT2dSK09sZjlrNUJJMCtZ?=
 =?utf-8?B?M3VtR0JEY2s2b0M0SXJrZFR2TmFQT1FYaW1sOXVXMktHekE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzNpQ3dGWThtdzQxY3lxZmVvUktubU1NL3NKU2hZZ2hzTlp0MFBJeVU3a3V2?=
 =?utf-8?B?cVV5RVJEUXZTdjZiZU4wbzMzK05yR05NdG5qT21acGxqaEFtdENXbUVFUURL?=
 =?utf-8?B?MEN5dm5hckFrM0JWMzRIREoyY0MveXRlQm9TWlBjLzVacnk4cGlkbTlXazBT?=
 =?utf-8?B?MHh2SkRiV1IyRTBEWkRTZFI5NUhjZzNtN0lKaUVVdmRFR1lYb3JVSWY5Zjk0?=
 =?utf-8?B?bmY4NkNCdDQ0UDZ6MUZuUnEvNkpNR3RzcVhnYkN6MTF4aTRHNUpSczFzWVZ6?=
 =?utf-8?B?QlJnb1lHbXRsdWE1SksxVUNHV0JzSkNWNVpmQXJkbW0rMlp4czRHNGg4SlV1?=
 =?utf-8?B?WkZWek1WNjdXTm9JSW1PYjFiM3RFOHh5Y0Y0WHh3c0xvSnJrdUtxM255V1hz?=
 =?utf-8?B?VkJwTGxHODdTUi9GOHpVL05KMzFDKzNjRVp2UnlhWWF1bzhJZHBTL01Qazhr?=
 =?utf-8?B?UmJkV1I1Kzd0ZTRSaGxKQ0xFVkF0eGZFL3Q4NWduaVRrd05SZ1QwZmZkNDB1?=
 =?utf-8?B?VWxsNG9MVVJyUUVrdWhScXlEMi9ITkNqSzJFS3pvdWVHeitVeGVac1h3anRh?=
 =?utf-8?B?Wk5QVXNISWdFVHFKNjdCQjZWR1hueVpva3ErS2YxU09nRC94Sk5UYjNFUVBT?=
 =?utf-8?B?MXJGTTlseU9wZmdveTNLZUNLM0NoTTdwZEw1Q1QxV2c4U1d3NXd4T3dGTXhn?=
 =?utf-8?B?NndlTmVJekpHcS9zdy9URW0xWVFvenAvdXBhUkt5ZkNrc0lybm1vK0Ird3Vn?=
 =?utf-8?B?eCtBVDdzcDFxZ2JxS2FJZ3FXcFFHV0JwWkR2VmxHTlFJTTdOcWMzK2ZSQ2Zj?=
 =?utf-8?B?Y0tPMzA0cktOOUlFNXlRc0g1RFpuaVVYb0xoYmpURENUb2NPTDFISlNuU1dT?=
 =?utf-8?B?OE1BeGgvSkV5RWFhVTk2S0pzTHJPYVUxL0hOaitRL09VbGNxNnFCWDVScXNp?=
 =?utf-8?B?UHJoY1FGaklNdWViWnRxQ0MzSzJIMUdQalM3QUJUZVFZSk9zT3BNK0UvRFI1?=
 =?utf-8?B?MFdzMkhVYTVZUmlyem1RRngzS1JBbnh2dUNEYmFBeVpubThiT0tnTXF1OXc4?=
 =?utf-8?B?MWF2VjlXUTU0eFV0dVZENVlxSnZNcHhwNVZ5MXNLYmxEalFMZjc5cHl0eFV1?=
 =?utf-8?B?Y0VMSU1yem11YW5OU3A2V2RDZWlWVDg2WVhoOUhPbEpndEFwdDBNMy9IeVFO?=
 =?utf-8?B?Q2tnQ0I1ZVVpR2N3dlhJOVVHS1RKRTNTazhSSmdCemYrc2hyWUFvNktQR1k2?=
 =?utf-8?B?R0p1bkhPQUVBVlZCWmROdk1WeGdoL3Z2enBEY1ZOZWlwZytDR0VBcDJaVUJy?=
 =?utf-8?B?RjJIdW9uRTRrVDdKd3llcmJPQ0ZtNnZxWGk1cnZnMk8zNUlGT2Nldy9yampR?=
 =?utf-8?B?alcwMnloTTh4OFhGeHRnMzk4MTZHbStONjBHbHNESTBaajVEczdWbEd2cXRr?=
 =?utf-8?B?bmdhR1ZQb1AvZllRcDcyakJMQnZaUUc4emhYZ1Nlbmt6VlMvRXRyVXhOZlFN?=
 =?utf-8?B?OERYcHh4QVZ2dHVrSEZtZkZxVW9BOXN6ZnNkQTFycHExSkZjYlExUVRHOUk4?=
 =?utf-8?B?UERkSk9SY1poZUJTaGVzem0yd0NWald1V0pIcEZReC9NWE1xd0Vydi9panZ0?=
 =?utf-8?B?YUV3TFhoMU9zMHdITWEwT0pBdkV3TmlYZVl5cUZPTGxUc09yRlRBRHdZWW1T?=
 =?utf-8?B?dmxwamcxQVJodTlDMWk2ZmppcDZZZHl6SzYrYjlUR3dHTldocFM5VFBNQ3Zt?=
 =?utf-8?B?elFJbm5wN0JQdFhEUFpaQ2xFa3JCVnlsTXhoY1ZQcVFWcGdMakRxMFIyWW5o?=
 =?utf-8?B?QlpjTnRocHVCaDJCZElkZXRkTHlMcWtlWTNpeGRlSUd5R2FENkpQWDlYRDdP?=
 =?utf-8?B?V0tXVWkvSjhhTXRKa0tIaGx0cThlV3pVeUFCdFl4ZG0wWTNNTzdhdERiS1g3?=
 =?utf-8?B?MlNrTDRzaWhKL3RqWTQzcUNhOEFMK25zVmRjSmlEa1FDaDhkK0t2V08vTHFw?=
 =?utf-8?B?TVhKU29zdU01dngweWJxWVgxZXp5K3VLam4wdTI1QnR3Mklyb2Z0R1VpZGNP?=
 =?utf-8?B?VlRmbS9TUlFIZDVoY0VqQTF3QUVGYVlGejdtQlF5YlNNb3U1eHkzZ2xOT21q?=
 =?utf-8?B?dVkrRFpvTDFEU25Eb28wVFZMckpWbXdsUHRyL2xockJYU0lFaUU3NmVOS3NZ?=
 =?utf-8?B?eHc9PQ==?=
Content-ID: <5806D9955A280647B6F4A462EF8D03BB@eurprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9455967d-8a77-463a-a5fa-08dca0f037a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 14:54:36.5791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hs3wcWN/LHzVyKzmQiPR9vi0JlgQphPB+lyv12Dx7SDsPYYI3PokjOo+ZQ1Ev/2faVmX3noOVeFa/TXQLR0HrIqzpOdSMXBaBw2sDTfjVAIla22OXH2B3hq8dO46rjB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7434
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.128.88.81
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DBBPR07MB7434.eurprd07.prod.outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_155443_244448_AA9E4D0D 
X-CRM114-Status: GOOD (  11.61  )
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

DQoNCkxlIDEwLzA3LzIwMjQgw6AgMTY6NDYsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFdl
ZCwgSnVsIDEwLCAyMDI0IGF0IDA5OjUxOjIyQU0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+PiBDb21taXQgMmM4YTgxZGMwY2M1ICgicmlzY3YvbW06IGZpeCB0d28gcGFnZSB0YWJs
ZSBjaGVjayByZWxhdGVkDQo+PiBpc3N1ZXMiKSBhZGRlZCBwdWRfbGVhZigpIGluIGluY2x1ZGUv
YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oDQo+Pg0KPj4gRG8gdGhlIHNhbWUgZm9yIHA0ZF9s
ZWFmKCkgYW5kIHBnZF9sZWFmKCkgdG8gYXZvaWQgZ2V0dGluZyB0aGVtDQo+PiBlcnJvbmVvdXNs
eSBkZWZpbmVkIGJ5IGFyY2hpdGVjdHVyZXMgdGhhdCBkbyBub3QgaW1wbGVtZW50IHRoZQ0KPj4g
cmVsYXRlZCBwYWdlIGxldmVsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gdjI6IEFkZGVkIHBY
ZF9sZWFmIG1hY3JvIGFzIHdlbGwgaW4gYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BYZC5oIHRvIGNv
aGFiaXQgd2l0aCB0aGUgZmFsbGJhY2sNCj4+IC0tLQ0KPiANCj4gVGhhbmtzLiAgSSdkIGRyb3Ag
dGhlIGlubGluZSBmdW5jdGlvbnMsIGJ1dCBubyBzdHJvbmcgb3BpbmlvbnMuDQoNCklubGluZSBm
dW5jdGlvbnMgZW5hYmxlIHR5cGUgY2hlY2tpbmcuDQoNCldpdGggYSBtYWNybyB5b3Ugd291bGQg
YmUgYWJsZSB0byB3cml0ZSBwdWRfbGVhZihwZ2QpIHdpdGhvdXQgdGhlIA0KY29tcGlsZXIgbm90
aWNpbmcgdGhlIG1pc3Rha2UuDQoNCkFsbCBvdGhlciBoZWxwZXJzIGluIGFzbS1nZW5lcmljL3Bn
dGFibGUtbm9wWGQuaCBhcmUgZnVuY3Rpb25zIHNvIGZyb20gDQpteSBwb2ludCBvZiB2aWV3IGl0
IG1ha2VzIHNlbnNlIHRvIGtlZXAgdGhlbSBhcyBmdW5jdGlvbnMgbm90IG1hY3Jvcy4NCg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQoNClRoYW5r
cy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
