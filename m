Return-Path: <SRS0=KFOV=NP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC749C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  4 Nov 2018 15:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58BC32082E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  4 Nov 2018 15:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mUMr6sSi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bdivH5wU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58BC32082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hpe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XVOdP3pDDdKJQIwvXnOVCXWpHcpPEz/HZDwTQqGpZs=; b=mUMr6sSiV9okf9
	IIWfx0e8Z+PLw+Nk7dZZgcpVgw/H8zix1vE7KYsYlykonRuMhyGhTUT2hotXiRAzBU0zyZjkZzPht
	+fsPlMoEjBI035LBCXzXB7V9qhivhvbttVNv0otOBxzEtnzb66AfSGTrFZrOVC0/vdUVU44fJvWH/
	S9JCnuw0L5XTTIWoDw/PbGfXjddnTRZAQAn1Fbn7WL0+YXsXyzB4B5BwGb1ygjSNnuxkPbBS4CkjK
	8jHQAjg8W0zsZ/YD/fSVLtB43WX2a1phQQZTJcXy1z0BIMQk95fPxlpMumrNFVcGrq9GECkaX8TWg
	qR3lgDt3joVU2ypjKEUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJJv2-0008UK-93; Sun, 04 Nov 2018 15:02:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJJv0-0008TE-Ip
 for linux-riscv@bombadil.infradead.org; Sun, 04 Nov 2018 15:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sT/hqO8hUAF+7cuYUFZIxJi84ETYasmKW0CxuvdAmMA=; b=bdivH5wUgslx3W0T9/zY87URZ9
 0tv3rqeqKDy1PcRay5en2J1wDarpu5BYSLDnS2weHRayqK6bAjKK4rLR5BwvYoZfczWt1c/mwQ4Nw
 mOw24U+xyGqjcBVdvom40NcAlonxg6BNi2zu9awVUTsAC1j7uXa93Gh9DBAkncQo7f5gCefyroHHU
 Cw+YuekI2459IqdT8K9A644T0SbdH1TAXVjEElm+6wti2Yitsp35gjUsxqpHBb5viZ98TOt3grwd7
 jHBCu1v7xYvae9EcRrE/icQh9bugL3b4ooC2eu6NmYM0otwYTzMDTS+KfChfoZpwn41UFxK2x7ENK
 311G3HCQ==;
Received: from g2t2354.austin.hpe.com ([15.233.44.27])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJJWg-0002tO-Cf
 for linux-riscv@lists.infradead.org; Sun, 04 Nov 2018 14:37:20 +0000
Received: from G2W6311.americas.hpqcorp.net (g2w6311.austin.hp.com
 [16.197.64.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 7E82F137;
 Sun,  4 Nov 2018 14:36:34 +0000 (UTC)
Received: from G9W8677.americas.hpqcorp.net (16.220.49.24) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sun, 4 Nov 2018 14:36:34 +0000
Received: from G2W6311.americas.hpqcorp.net (16.197.64.53) by
 G9W8677.americas.hpqcorp.net (16.220.49.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sun, 4 Nov 2018 14:36:33 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.241.52.12) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Sun, 4 Nov 2018 14:36:12 +0000
Received: from DF4PR8401MB0956.NAMPRD84.PROD.OUTLOOK.COM (10.169.87.13) by
 DF4PR8401MB1018.NAMPRD84.PROD.OUTLOOK.COM (10.169.87.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.30; Sun, 4 Nov 2018 14:36:10 +0000
Received: from DF4PR8401MB0956.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::e014:5f67:4942:a313]) by DF4PR8401MB0956.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::e014:5f67:4942:a313%3]) with mapi id 15.20.1294.028; Sun, 4 Nov 2018
 14:36:04 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Atish Patra <atish.patra@wdc.com>, Olof Johansson
 <olof.johansson@gmail.com>
Subject: RE: SBI extension proposal
Thread-Topic: SBI extension proposal
Thread-Index: AQHUcUbctwM8nXMZUU6atK0+B4IP1KU5tZ+AgAACy4CAABgfgIACMiUQgAESPYCAApZSUA==
Date: Sun, 4 Nov 2018 14:36:04 +0000
Message-ID:
 <DF4PR8401MB0956729F215102E717E8AE27FFC90@DF4PR8401MB0956.NAMPRD84.PROD.OUTLOOK.COM>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
 <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
 <cf729ca1-3ad0-8fe8-5cfa-d09d6c28d831@wdc.com>
 <TU4PR8401MB09581F92A2F7C0C7FFFA190EFFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
 <7da86c7a-d06a-82ae-ef01-35efeeda7c3a@wdc.com>
In-Reply-To: <7da86c7a-d06a-82ae-ef01-35efeeda7c3a@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abner.chang@hpe.com; 
x-originating-ip: [111.250.149.93]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DF4PR8401MB1018;
 6:8IJZO6evgB3xgELY+HGYDsXGHAz+0ky6hJYJQIDW/IvMdSnUsm7/swhrV9MBHin7qlf5bKv1CGaSTPM5Cyjx/Whh/re/dMO0SaQrnuv1yuS4Dj6+sefAFCVmvKexy1CzDEucVM8IReUrd/C6axlipOd1i0+jATzdI9FARBunbZjR/nR//S868IzwDqOEP5eqWU3SroZrDc4+pp9iaZejsGAiKEaFlaDWR6qCaEGJurbkta9La+4W2jryCadijj8BCgwJgKTy3It8jv/3X5L1ylPdy0aufIvDPmjqoyuTraHexSwvuisUag0/EeaENkLJ9QKZRdXODUvqTvH2x0WKXYoQLUUKlm828925cARl4lNECfQCwGkTsV/iLZYBXJ3JOAwXUfLt0UghF5rPaTZbwYnigB4vAjUrHBqX1p9pQqso/p6D+Qh8P8knsfaBD0u0bSUhiZVFj467LiRWh+g24w==;
 5:xD85WJL9YartOR+igLLLdEEbnczv4ozp3tfTl2jFpdqbQHiiPti8gcm+5yFF98BewEOMEQF7/UBOjV3NTJaFhh4n1BSeoqU5pFltL1ThHwGPw0gQQRdZCnNzV1ELCP+TxMlbQ2I8/+OyK7DvHtJYwJ7eXQ+0gmcOyfSLN6zoU9E=;
 7:7qgLBx0A5AWLW0EGGLe/I/rgxZZlilBMmyQkRRqi7PcUQ0BCMmtejhQ3czDYY61E+MGEBkrIAsMoeGxQcQcr7oHi1OF45JmmVj72EebQSdKHVB9w7TKo+GyXpzQKQKjjRO5Ppx8RSJ9iHruqR9U0xQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(376002)(136003)(39860400002)(13464003)(199004)(189003)(256004)(14454004)(25786009)(486006)(14444005)(74316002)(6246003)(476003)(71200400001)(446003)(106356001)(11346002)(26005)(71190400001)(105586002)(6436002)(2906002)(7416002)(7736002)(305945005)(3480700004)(39060400002)(68736007)(55016002)(53936002)(9686003)(4326008)(33656002)(6116002)(3846002)(66066001)(561944003)(6506007)(53546011)(99286004)(76176011)(102836004)(7696005)(8936002)(478600001)(97736004)(54906003)(110136005)(316002)(229853002)(93886005)(86362001)(186003)(7116003)(2900100001)(5660300001)(8676002)(81156014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DF4PR8401MB1018;
 H:DF4PR8401MB0956.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 9ed62a9b-61a1-4544-afd3-08d64262d972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:DF4PR8401MB1018; 
x-ms-traffictypediagnostic: DF4PR8401MB1018:
x-microsoft-antispam-prvs: <DF4PR8401MB1018C47A65078E61B6DF3CBFFFC90@DF4PR8401MB1018.NAMPRD84.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(258649278758335)(180628864354917)(227479698468861)(222181515654134)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:DF4PR8401MB1018; BCL:0; PCL:0; RULEID:; SRVR:DF4PR8401MB1018; 
x-forefront-prvs: 084674B2CF
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: qnzfaM9Em8rac4DOwjq/YXEyI5g/NRKz8e+u6eXNWaPHCtZmaP2wiMt+R4GIa+XbKKazMV/eYCgq8oU5CD/bAj0xhifqx71QjFmI80247j/BO+ntvaEtp2rFUJ4mZOyrc5l+Lwi+o6MkuGXzbYbv5Tb7So87FAUc6M8n7sFjDfyHkm/1Lbcl6vTjpPmkLOq7HZxthPxnoZvtkB9B64Z8wn0TCTs5oUqSL7FhJrpCjXK8f4P/+6vdEE9WS8M0opeCA81SAx/wSLuJR/hqpobmB5H9tchNduzXmAVAREtjjOP+FUXN/7fh6CnT5iKjh44iXWS5Z9oLxHDCFCNpibtO/Ru1BJDsjalJXZhVnl4hK78=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed62a9b-61a1-4544-afd3-08d64262d972
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2018 14:36:04.0913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1018
X-OriginatorOrg: hpe.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181104_143718_674855_0D1E083D 
X-CRM114-Status: GOOD (  33.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "zong@andestech.com" <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Andrew Waterman <andrew@sifive.com>,
 "alankao@andestech.com" <alankao@andestech.com>, "Chen,
 Gilbert" <gilbert.chen@hpe.com>, "anup@brainfault.org" <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "rjones@redhat.com" <rjones@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "vincentc@andestech.com" <vincentc@andestech.com>,
 "mjc@sifive.com" <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181104143604.l1daa4cprBlxy30S_GHZcosfeQspDZx8_q3VaBVrOyY@z>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXRpc2ggUGF0cmEgW21h
aWx0bzphdGlzaC5wYXRyYUB3ZGMuY29tXQ0KPiBTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgMDMs
IDIwMTggNjozMSBBTQ0KPiBUbzogQ2hhbmcsIEFibmVyIChIUFMgU1cvRlcgVGVjaG5vbG9naXN0
KSA8YWJuZXIuY2hhbmdAaHBlLmNvbT47IE9sb2YNCj4gSm9oYW5zc29uIDxvbG9mLmpvaGFuc3Nv
bkBnbWFpbC5jb20+DQo+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+Ow0KPiBBbmRyZXcgV2F0ZXJtYW4gPGFuZHJl
d0BzaWZpdmUuY29tPjsgcGF1bC53YWxtc2xleUBzaWZpdmUuY29tOw0KPiBoY2hAaW5mcmFkZWFk
Lm9yZzsgem9uZ0BhbmRlc3RlY2guY29tOyBhbnVwQGJyYWluZmF1bHQub3JnOyBEYW1pZW4gTGUN
Cj4gTW9hbCA8RGFtaWVuLkxlTW9hbEB3ZGMuY29tPjsgYWxhbmthb0BhbmRlc3RlY2guY29tOyBB
cm5kDQo+IEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+
IHZpbmNlbnRjQGFuZGVzdGVjaC5jb207IG1qY0BzaWZpdmUuY29tOyByam9uZXNAcmVkaGF0LmNv
bTsgQ2hlbiwNCj4gR2lsYmVydCA8Z2lsYmVydC5jaGVuQGhwZS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBTQkkgZXh0ZW5zaW9uIHByb3Bvc2FsDQo+IA0KPiBPbiAxMS8xLzE4IDExOjMxIFBNLCBDaGFu
ZywgQWJuZXIgKEhQUyBTVy9GVyBUZWNobm9sb2dpc3QpIHdyb3RlOg0KPiA+DQo+ID4+Pj4+IC0t
IGludCBzYmlfaGFydF91cCh1bnNpZ25lZCBsb25nIGhhcnRpZCwgdW5zaWduZWQgbG9uZyBzdGFy
dCwNCj4gPj4+Pj4gdW5zaWduZWQgbG9uZyBwcml2KQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBCcmluZ3Mg
dXAgImhhcnRpZCIgZWl0aGVyIGR1cmluZyBpbml0aWFsIGJvb3Qgb3IgYWZ0ZXIgYQ0KPiA+Pj4+
PiBzYmlfaGFydF9kb3duIFNCSSBjYWxsLg0KPiA+Pj4+Pg0KPiA+Pj4+PiAic3RhcnQiIHBvaW50
cyB0byBhIHJ1bnRpbWUtc3BlY2lmaWVkIGFkZHJlc3Mgd2hlcmUgYSBoYXJ0IGNhbg0KPiA+Pj4+
PiBlbnRlciBpbnRvIHN1cGVydmlzb3IgbW9kZS4gVGhpcyBtdXN0IGJlIGEgcGh5c2ljYWwgYWRk
cmVzcy4NCj4gPj4+Pj4NCj4gPj4+Pj4gInByaXYiIGlzIGEgcHJpdmF0ZSBkYXRhIHRoYXQgY2Fs
bGVyIGNhbiB1c2UgdG8gcGFzcyBpbmZvcm1hdGlvbg0KPiA+Pj4+PiBhYm91dCBleGVjdXRpb24g
Y29udGV4dC4NCj4gPj4+Pj4NCj4gPj4+Pj4gUmV0dXJuIHRoZSBhcHByb3ByaWF0ZSBTQkkgZXJy
b3IgY29kZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gLS0gaW50IHNiaV9oYXJ0X3N1c3BlbmQodTMyIHN0
YXRlLCB1bnNpZ25lZCBsb25nIHJlc3VtZV9lbnRyeSwNCj4gPj4+Pj4gdW5zaWduZWQgbG9uZyBw
cml2KQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBTdXNwZW5kcyB0aGUgY2FsbGluZyBoYXJ0IHRvIGEgcGFy
dGljdWxhciBwb3dlciBzdGF0ZS4gU3VzcGVuZGVkDQo+ID4+Pj4+IGhhcnQgd2lsbCBhdXRvbWF0
aWNhbGx5IHdha2UtdXAgYmFzZWQgb24gc29tZSB3YWtldXAgZXZlbnRzIGF0DQo+ID4+Pj4+IHJl
c3VtZV9lbnRyeSBwaHlzaWNhbCBhZGRyZXNzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiAicHJpdiIgaXMg
YSBwcml2YXRlIGRhdGEgdGhhdCBjYWxsZXIgY2FuIHVzZSB0byBwYXNzIGluZm9ybWF0aW9uDQo+
ID4+Pj4+IGFib3V0IGV4ZWN1dGlvbiBjb250ZXh0LiBUaGUgU0JJIGltcGxlbWVudGF0aW9uIG11
c3Qgc2F2ZSBhIGNvcHkNCj4gPj4+Pj4gc28gdGhhdCBjYWxsZXIgY2FuIHJldXNlIHdoaWxlIHJl
c3RvcmluZyBoYXJ0IGZyb20gc3VzcGVuZC4NCj4gPj4+Pj4NCj4gPj4+Pj4gUmV0dXJuIHRoZSBh
cHByb3ByaWF0ZSBTQkkgZXJyb3IgY29kZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gLS0gaW50IHNiaV9o
YXJ0X2Rvd24oKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBJdCBwb3dlcnMgb2ZmIHRoZSBoYXJ0IGFuZCB3
aWxsIGJlIHVzZWQgaW4gY3B1LWhvdHBsdWcuDQo+ID4+Pj4+IE9ubHkgaW5kaXZpZHVhbCBoYXJ0
IGNhbiByZW1vdmUgaXRzZWxmIGZyb20gc3VwZXJ2aXNvciBtb2RlLiBJdA0KPiA+Pj4+PiBjYW4g
YmUgbW92ZWQgdG8gbm9ybWFsIHN0YXRlIG9ubHkgYnkgc2JpX2hhcnRfdXAgZnVuY3Rpb24uDQo+
ID4+Pj4+DQo+ID4+Pj4+IFJldHVybiB0aGUgYXBwcm9wcmlhdGUgU0JJIGVycm9yIGNvZGUuDQo+
ID4+Pj4+DQo+ID4+Pj4+IC0tIHUzMiBzYmlfaGFydF9zdGF0ZSh1bnNpZ25lZCBsb25nIGhhcnRp
ZCkNCj4gPj4+Pj4NCj4gPj4+Pj4gUmV0dXJucyB0aGUgUklTQ1ZfUE9XRVJfU1RBVEUgZm9yIGEg
c3BlY2lmaWMgaGFydGlkLiBUaGlzIHdpbGwNCj4gPj4+Pj4gaGVscCBtYWtlIGtleGVjIGxpa2Ug
ZnVuY3Rpb25hbGl0eSBtb3JlIHJvYnVzdC4NCj4gPj4+Pj4NCj4gPj4+Pj4gLS0gdm9pZCBzYmlf
c3lzdGVtX3NodXRkb3duKCkNCj4gPj4+Pj4NCj4gPj4+Pj4gUG93ZXJzIG9mZiB0aGUgZW50aXJl
IHN5c3RlbS4NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBpcyBhIHNsaWdodGx5IHdlaXJk
IG9uZSB0byBwdXQgaW4gU0JJLiBUaGVyZSdzIHVzdWFsbHkgb3RoZXINCj4gPj4+PiBhY3Rpb25z
DQo+ID4+IG5lZWRlZCBmb3IgX3N5c3RlbV8gbGV2ZWwgc2h1dGRvd24sIHN1Y2ggYXMgZXh0ZXJu
YWwgcG93ZXIgcmVndWxhdG9ycy4NCj4gPj4+Pg0KPiA+Pg0KPiA+PiBUaGlzIG1pZ2h0IGJlIGJl
Y2F1c2Ugb2YgbXkgbGltaXRlZCBrbm93bGVkZ2Ugb24gcG93ZXIgbWFuYWdlbWVudC4NCj4gPiBJ
biBBQ1BJLCBpdCBkZWZpbmVzIHRoZSByZWdpc3RlciBibG9jayB0byBwdXQgcHJvY2Vzc29yIGlu
dG8gZGlmZmVyZW50IGxldmVscyBvZg0KPiBzbGVlcCBtb2RlIChzdXNwZW5kIG1vZGUpLiBIb3dl
dmVyLCB0aGlzIHJlcXVpcmVzIGFkZGl0aW9uYWwgcG93ZXINCj4gbWFuYWdlbWVudCBjb250cm9s
bGVyIG9yIHByb2Nlc3NvciBDU1JzIG9uIFJJU0MtVi4gSWYgd2UgZG9u4oCZdCBjb25zaWRlcg0K
PiBBQ1BJIGFuZCBIL1cgY2FwYWJpbGl0aWVzIG9mIHBvd2VyIE1HTVQgb24gUklTQy1WIGF0IHRo
aXMgbW9tZW50LCB0aGVuDQo+IFNCSSBmb3IgcHJvY2Vzc29yIHBvd2VyIG1hbmFnZW1lbnQgbWF5
IGJlIG5lZWRlZC4NCj4gPiBNeSBxdWVzdGlvbiBpcyBjYW4gU0JJX2hhcnRfdXAgKCkgdG8gZXhl
Y3V0ZSAic3RhcnQiIGV2ZW4gdGhlIGhhcnQgaXMgbm90IGluDQo+IFN1c3BlbmQgb3IgRG93biBz
dGF0ZT8gSSBhbSBhc2tpbmcgdGhpcyBiZWNhdXNlIG9uIFVFRkkgd2Ugd291bGQgbGlrZSB0bw0K
PiBoYXZlIFNCSSBmb3Igc3VwZXJ2aXNvciBtb2RlIGZpcm13YXJlIHRvIGludm9rZSBmdW5jdGlv
bnMgcHJvdmlkZWQgYnkgTS0NCj4gbW9kZSBkcml2ZXIsIGp1c3QgdHJ5aW5nIHRvIGxldmVyYWdl
IFNCSV9oYXJ0X3VwICgpIGZvciB0aGlzIGludGVudGlvbi4NCj4gSG93ZXZlciwgIlN0YXJ0IiBp
cyBkZWZpbmVkIGFzIGFuIGFkZHJlc3MgdG8gZW50cnkgaW50byBzdXBlcnZpc29yIG1vZGUuIFdl
DQo+IG1heSBuZWVkIHRvIGFkZCBhbiBhZGRpdGlvbmFsIHBhcmFtZXRlciB0byB0aGlzIFNCSSB3
aGljaCBpbmRpY2F0ZXMgdGhlDQo+IHByaXZpbGVnZSB0byBleGVjdXRlICJTdGFydCIgdGhvdWdo
Lg0KPiA+IEZvcmdldCB0aGlzIGlmIHRoaXMgU0JJIGlzIGRlZGljYXRlZCBmb3IgcHJvY2Vzc29y
IHBvd2VyIG1hbmFnZW1lbnQuIFdlDQo+IGNhbiBwcm9wb3NlIG5ldyBTQkkgZm9yIGFib3ZlIGlu
dGVudGlvbi4NCj4gPg0KPiBpbnQgc2JpX2hhcnRfdXAodW5zaWduZWQgbG9uZyBoYXJ0aWQsIHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgcHJpdikNCj4gDQo+IEl0IGhhcyBhbHJl
YWR5IGEgb3BhcXVlIHRoaXJkIHBhcmFtZXRlciB0aGF0IGNhbiBiZSB1c2VkIHRvIGFkZHJlc3Mg
eW91cg0KPiBjYXNlLiBJc24ndCBpdCA/DQpBY2NvcmRpbmcgdG8gdGhlIGRlc2lnbiB5b3UgaGF2
ZSBmb3Igc2JpX2hhcnRfdXAoKSwgcHJpdiBpcyBwcmVwYXJlZCBieSBjYWxsZXIgYW5kIHBhc3Nl
ZCB0byBzdGFydCBpbiBzdXBlcnZpc29yIG1vZGUuIE1lYW5zIHNiaV9oYXJ0X3VwICgpIGlzIG5v
dCBuZWNlc3NhcnkgdG8gdW5kZXJzdGFuZCB0aGUgY29udGVudCBvZiBwcml2LiBUaGUgY29udGVu
dCBvZiBwcml2IHNob3VsZCBiZSBmdW5jdGlvbi1kZXBlbmRlbnQgYW5kIG5vdCBhYmxlIHRvIGJl
IHN0YW5kYXJkaXplZC4gSSB0aGluayB3ZSBjYW4ndCB1c2UgcHJpdiB0byBhZGRyZXNzIG15IGNh
c2UuIFdlIG1heSBuZWVkIGFkZGl0aW9uYWwgcGFyYW1ldGVyIHdoaWNoIGluZGljYXRlcyAgdGhl
IHByaXZpbGVnZSB0byBleGVjdXRlICJzdGFydCIuIFdpdGggdGhpcyB3ZSBjYW4gYXNrIGhhcnQg
dG8gcnVuIHNwZWNpZmljIGZ1bmN0aW9uIGluIGVpdGhlciBtIG9yIHMgbW9kZSwgYW5kIHNiaV9o
YXJ0X3VwKCkgd2lsbCBiZSBtb3JlIG5pY2UgYW5kIHBvd2VyZnVsIHRvIGZpcm13YXJlIHdoaWNo
IGhhcyBpbXBsZW1lbnRhdGlvbiBvZiBwcml2aWxlZ2UgbGV2ZWxzIGR1cmluZyBzeXN0ZW0gYm9v
dC4NCg0KPiANCj4gPj4gV2UgYWxyZWFkeSBoYXZlIGEgc3lzdGVtIHJlc2V0IGNhbGwgaW4gU0JJ
ICYgUFNDSSBhbHNvIGhhZCBzeXN0ZW0NCj4gPj4gc2h1dGRvd24NCj4gPiBJcyBzeXN0ZW0gcmVz
ZXQgY2FsbCBkZWZpbmVkIGluIFNCSSBzcGVjIGFzIHdlbGw/IEkgZG9u4oCZdCBzZWUgdGhpcyBp
biBHaXRodWIuDQo+ID4NCj4gU29ycnkuIEkgaGF2ZSBtYWRlIG15c2VsZiBjb25mdXNlZCB3aGls
ZSB3cml0aW5nLiBZb3UgYXJlIGNvcnJlY3QuDQpJcyBTQkkgc3BlYyBvZiBTaHV0ZG93bigpIGFs
cmVhZHkgZnJlZXplPyAgV2UgbWF5IG5lZWQgcGFyYW1ldGVyIHRvIGluZGljYXRlIHRoZSBzaHV0
ZG93biB0eXBlLCBmb3IgZXhhbXBsZQ0KLSBQb3dlciBvZmYNCi0gQ29sZCByZXNldA0KLSBXYXJt
IHJlc2V0DQoNCj4gDQo+IA0KPiBSZWdhcmRzLA0KPiBBdGlzaA0KPiA+PiBmdW5jdGlvbi4gQXMg
cGVyIG15IHVuZGVyc3RhbmRpbmcsIHRoaXMgQVBJIHdpbGwgcHJvdmlkZSBhIHdheSB0bw0KPiA+
PiBoYW5kbGUgYWxsIGNvbW1vbiBzdXNwZW5kIHJlbGF0ZWQgb3BlcmF0aW9ucyBvbiBtYWNoaW5l
IG1vZGUuDQo+ID4+IEluIGNhc2Ugb2YgdmlydHVhbCBPUywgaXQgd2lsbCBub3QgcmVzdWx0IGlu
IGFueSBleHRlcm5hbCBwb3dlciByZWd1bGF0aW9ucy4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+
DQo+ID4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
