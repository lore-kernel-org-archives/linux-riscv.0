Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7328C3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 00:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tsl75zfrN53lWWEx5yXDvR4qz+04FIJYq/pmrsHSzgk=; b=UQxgRPTvbGFzOkuuSeTNorHgAG
	OPsYu+qRqRwHAjDiAftWXxn1kVjeQ7BQ1FJo9NRbQBTxpCyk5DrXht21k6pCUkl+C+hiNtS7BFGuT
	RAwbKRddK7dTwIHxZTlJIJ3UxfZ1mNIKKSWhXYRhyMjhvLSGc8GB1GymVYDXlzUhw+cjHEN5+WqQ/
	GYdpjHDYB9zMtqCGWtiHT7lM+e0FxNLJfZ7SfBV62EgfSor8dLSzVk8GJToOrBebSwXRZRIFuDKYI
	aNhZukZaU3VNXhCxLfxR6lmJ4lw+oqvbyZxOC4ebHjYQWUmAAGLUGxCaxKX0AS1+K3XHg7TR9kxTP
	no3k3SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQytm-00000005SNP-1ss0;
	Tue, 09 Jul 2024 00:40:02 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQytj-00000005SML-0J0w
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 00:40:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No66V0CAZMOAm/1Zy8Q1K8jWq6KFLlQnaYrpOVdUnvOQU2pHJUYvqdH+FnmZEPA5gv7cSgbEK9pN1sUtfTkHCSiUVXFUlpywm/iB2qFPIYr2+1i3X04u3FzScAgthwCdI5Px/cc6+oSZLZy7gfFVMFyWFzo5T1o2fDpwMQ78P5c0vOmkNjySSPdiPzWziyQAP35nk4X/aL19708pQjwt8HzsKX7A34Cjt2CopjDeKU8u5ELDxG9qzZfDHNN8lF6v4chRgfOMuBGbnbM+1sK3t8J6qciriSBv1Ho368tdZpgdeL0ndRHN001/vC3Qs4pSIGxOPc90WxmJVr/LubI2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG2o5ljPTihO7gz3s+pylEdhEQ2uZ627BSUHS9W5EpE=;
 b=P4qgXUdM+O0VUjgShvzXnWxz1q0rhLrfSJ+bHaDenlASeZ692k8JkTtKKeNCaaoGCoiKYh5N4X+Gv5xni/icm9hmnq/gqb/1ezmRiqxDidVg4i2dWyvFMcvWpTkoSj33YnAofEsmEaLksr3WAK7qr4re5MS21vGSxrB4n2EBSTAcgm5Bser11qTYPOniFKx/RMxp4tlaiFQfSs4HiT3AeaThgKS+A1PizU5OlGfy5jO7pjdpPyDHqbVabPYP+Bz18Y26PYTPuTOhA2ElZ8F66H0tMVwl8pn9aBbxEn/pBiPGcHV9Gu2o5WDWb9clqiu8s0FpVbt5svOLkONhKOo7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG2o5ljPTihO7gz3s+pylEdhEQ2uZ627BSUHS9W5EpE=;
 b=Y0SnmP9xSHOqtiWQjs2ogHlBk5pNBt89cF9ThMjrYOSEIZwb8KnQCv5IvngnTO7Y9RzekkRVC8MbZrBBRQXkuvNiiV+zi+UPUM0pTtAcE+W5v19fcDPJbl3xr85irj9YYmSPZrfsRtb2CjVKz8Ji9ZlipdOs02s4hB2ddIcgpWCuDBgom8ovYKLaTTShPcJmQQ554nom9PPiTKiOQGjq+khzW+CCpnSCjTHOKo1fyJFlXLvSTDlj+MolDabB68Dub73d5+Sa8iFIW8UQPCG3xk12fquwxdQI0J++6SqKNJo8F+skqDtDlxjcKfbRyHHez2C7gSt3PpA+NsJU0X4npQ==
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
 by PN2P287MB0191.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:39:35 +0000
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d]) by PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 00:39:35 +0000
Message-ID: <PN1P287MB281861EA2B1706B430D2FA3EFEDB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 9 Jul 2024 08:39:29 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
 inochiama@outlook.com, xiaoguang.xing@sophgo.com, haijiao.liu@sophgo.com,
 chao.wei@sophgo.com, unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.11
X-TMN: [VP5tBzbNW9uApk1/Eznifzi3/u2BMPvE]
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:214::7)
X-Microsoft-Original-Message-ID: <93944853-9fd2-4d31-a04e-6d2c6ad8ffd0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN1P287MB2818:EE_|PN2P287MB0191:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee43d21-d8f6-4665-1952-08dc9faf9aa4
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|461199028|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: an/VZ7ih0lhm/A9NDyxFhwMYjDOF4Zd+b2iKYfKkAvnTX/0OH/x/KXb+I0hzHqvChtb90/MUWUi7gvXmSmAqiILHftmqjvqv3/T4ADO8wiYuYj6SVjqOO4aAkBMEkI9cEyaSxKv2apSNpkLOJ1rIpwCiEEgQFyg2kdMs3sclMFWPAaG50OBABPMp0r+lF88bQrIYpbcHPHxQeXUm7NyuNAJsCfha2SinnCT5V4EoU4XaEWMNElZ/gWfR5FFJwfd8BKAahHqFxhu58gHXoxNuufqWebfjrJcqb5/FxW9Us0rTJsjiEZVGO3j+YoelG/dmLAlWTD3sK6jsTrP5DwfHmSO/r0yCzBSvRalziBNyueZ6BWyqg4el43l41ttdoh428WbCBDB7lu8FiKZYkRgKpiuewpTolAiu1raq1FlgAjPPh1ygiX/5i9yDNnvEsTnoS11BvelzSb2FdnFqJ5DK4S4e0S2QqNg6DdIXlQATfm59O8KaIkEI4o4gQzxt+URYCZ1VU7pr66dN9ZhyZyXoxSI1fGP6spCngjxdCXINdJg8mGEvXqRtvn+mAa14iIrwzjsovqFTtrvexJBMxqbXH5d9hC4CwXBf9/v/CTAIrPxbuuzIkR4A9tsW/7C8G8jhluQvpGqV6XfzqeFifWxo+oo8TkuyXeEaTv5kL57aEj15FxlxiyZkW+0FQ7W3SlFWteE3Y8CVcWqsf2maVZN+cQwqPm7edfLUgw5MY01Sr78ffhRjv7sLUoyYqUrbklTmzg1l2dhsuuvyfrByBPBXa0IMtAXi75bb46SKaOkrAnY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lOM1pvZEVzRCtYWEJLellrUWxkRUl2eXk0ZWxXYXVGQkgrNm1GTjBEQVJO?=
 =?utf-8?B?MG1YemZtTTUvVUVZLzdQcWh3WDZNYmx3VWVobUJrTHlrN0ovWHJoaTZVQWNY?=
 =?utf-8?B?bnFNWDI0UlZpb3BzdVpMVGp4bm9xL1FjSC9FTUtjM0lJNUI3VUVKVFduK2xZ?=
 =?utf-8?B?TjkvZFVJZkxxMGJGL1FRaVNqQ3FiN1NIOTFReVJJL1l5OGdGbHRkdmNEV2xj?=
 =?utf-8?B?eEdyUUdZdk1kTk0zMEFRUE1qYWQyU1NSK0NaVnU0WUxSU01WcUFRcEFxYVpG?=
 =?utf-8?B?ZGdXVk91S2VhMlIrenNGQS9RMnVLNUU2L1p2ZmJFaThXclhqYnR6anhia1Nx?=
 =?utf-8?B?WEhDS0xFU3NMaDAvYWhaYWtCamJkSXJLdWMwaTI5MGpEeWNnVzZwazdDMEhN?=
 =?utf-8?B?MmRTVUpBMVVueUg5NE5LWVV6WWh2eVRMcEM5UUxHUGlyazZpZ0N5ZnVwNGd4?=
 =?utf-8?B?UktFdlhKbkQ4dUZoUktSaGg5Q1NGUExxaC9LbEJ3aUIxMGg4UVNJaE95eWdt?=
 =?utf-8?B?WDlLSjlwaEZkOG1obk1INElyUTkzWWxCdHRQZlg0L3RZelZXbVNnM1ZvUW53?=
 =?utf-8?B?RU9lL3dCS0wxdmNaTnUxeklybmlESWJXK3ZtWElYd0xiZVgrM0tJNjExTUo1?=
 =?utf-8?B?LzgydWxNMGYvMkJUR256cDNyUDZtMC9STTZuV2crTDBSakQ5WkpIeVdXSWVz?=
 =?utf-8?B?STBqK0pwcTZ0c1JlMWdVSU1hZjZscUsweUZqTVhiaWQ4OHoxUlBZM2VSc2xI?=
 =?utf-8?B?WlkwajJiUDk5QkxsaVZKR0ZicW5WMFBUdUswZE1uUS90Rk1OSURuTjZrUVNx?=
 =?utf-8?B?Z2tpenBjRTc0TUlxdGtaMW55M1c1SFFpcUl0VUtWQjVER2JkTnptUC93MDkx?=
 =?utf-8?B?eHhyakMwb3dKQU5HSi9wYi93NDJOWENzKzVLdVE1WVMvRmgzaFZWeWl1WDhi?=
 =?utf-8?B?UDU5bXhQM3o3R0JSOUNYN2g2MHBZQWhhUkowZFZtNUMwOUJKSHQwdDAwQzQ1?=
 =?utf-8?B?cUI3eTgwSXBZaE1KM0ErbnE2V1I1d1BSY2h5YVhwSWM0d0U3U2pFSFQzanFv?=
 =?utf-8?B?VVpSN0xZN0tKZ201MkMrWkg5SStERDNiZlI3cmp0OGZrU3dRbUZ6YUZsNUkx?=
 =?utf-8?B?UUZTTCtETW5KTVVFdTUyb1dSb25xMmxoUVFzZXI4Z2p2UjdIdnRtN1JIZENt?=
 =?utf-8?B?bk52OXpEV2hUUkloWG1YVXk4MUs5cWY1eTUwbE5VZE50WVpReE55Nk9OMUVt?=
 =?utf-8?B?aHVoMUNuS3Yzc3piQis4dWloSnhHS0dBaDlKUnpWbTQrQXJRZWVBTFdBRktw?=
 =?utf-8?B?RDBVM3ZZQXM4YU5hMjhHQTRteUV2ako3blBXaU9NRkkzbTk1MTZDR2xHcUJy?=
 =?utf-8?B?bDk0bHFVamJMcHhQSHRZUTV0WlI2eElOZk5GeEdMeEJ5MGYxK1g1cGU4T2ta?=
 =?utf-8?B?WUZLZmYzTmJybUk0ZHVGb3ByUWN1OHlEM05vQWZrYzFHZUxCZ2tTdWtqNmE4?=
 =?utf-8?B?QWFsKzR3NW5qK2MvZWNsZVhuRFRmeldYNWNmQnJ3NjB0dzdpcEdadFozRzkx?=
 =?utf-8?B?N2lPR1RpMzlUV2o0ZVd1KzNzNkg2OWJLczd3OTBmZ1M3WUEyNHZmWUVFZkZJ?=
 =?utf-8?B?eG5rN3JsUzgrYTNhL0p2eitrbmlKTU5IRXd1VEJjL2lETjdIY0s2VkhIRUM5?=
 =?utf-8?Q?FsRbL/IoZwjf+AIDhmh8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee43d21-d8f6-4665-1952-08dc9faf9aa4
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:39:34.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_173959_147213_1E18291F 
X-CRM114-Status: UNSURE (   6.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgoKSSBo
b3BlIHRoaXMgUFIgaXMgbm90IHRvbyBsYXRlLCBiZWNhdXNlIEkganVzdCBnb3QgdGhlIG1lc3Nh
Z2UgdG9kYXkgCmZyb20gU3RlcGhlbiB0aGF0IHRoaXMgY2xvY2sgZHJpdmVyIHBhcnQgaGFzIGJl
ZW4gbWVyZ2VkIGludG8gY2xrLW5leHQuCgpKdXN0IEZZSTogCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2L2I4ZGJkZGUyNDEyZDk3NGJhYTI0NjExYjE2Y2RhNWY3LnNib3lkQGtl
cm5lbC5vcmcvCgoKVGhhbmtzLApDaGVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2ZhY2ZhYmQwOgoKIMKgIExpbnV4
IDYuMTAtcmMxICgyMDI0LTA1LTI2IDE1OjIwOjEyIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9saW51
eC5naXQgdGFncy9yaXNjdi1zb3BoZ28tZHQtZm9yLXY2LjExCgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gYjEyNDBhMzk1MTFiOTIwNjI5M2I4MmFjMzcyYzUxMTRkNmUxNTgyMToKCiDC
oCByaXNjdjogZHRzOiBhZGQgY2xvY2sgZ2VuZXJhdG9yIGZvciBTb3BoZ28gU0cyMDQyIFNvQyAo
MjAyNC0wNy0wOSAKMDg6MTk6NTIgKzA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJJU0MtViBEZXZpY2V0cmVlcyBm
b3IgdjYuMTEKClNvcGdobzoKQWRkIGNsb2NrIHN1cHBvcnQgZm9yIFNHMjA0Mi4KClNpZ25lZC1v
ZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaGVu
IFdhbmcgKDEpOgogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBhZGQgY2xvY2sgZ2VuZXJhdG9yIGZv
ciBTb3BoZ28gU0cyMDQyIFNvQwoKIMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQy
LW1pbGt2LXBpb25lZXIuZHRzIHwgMTIgKysrKysrKysrKysrCiDCoGFyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjA0Mi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1NSAKKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogwqAy
IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
