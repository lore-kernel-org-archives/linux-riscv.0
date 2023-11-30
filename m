Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9518AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQeC6MiL6YW4oabj6rY0mPsd/p49o28gSTyHb6zmNSI=; b=M8NGI28igW7MdK
	X9WRKg8g8XSnrh+eYtMUxWstQpkY+C+2T2DAUOYV8ONbIiTjAFHTzra+O+5VFwYQOUzTIgcO4tAt2
	SAVjRt0dLlPnkxgwOMbDlqZ/n7MoHM5mMwEFm4V+Ue/0x89hiGNyJQHcra35cjZsPXv9m2VO3Tya3
	UeL65iKP5cqyQhiDxQHx+Inr0vrcjgbGU29PwH/VUZwMJ+iAAO+WsHQFzddEVKt7voUfwB3kY/lH8
	pGyXnluTMPhguaePEt8+WKxGYS58SPzzYbFLaao/S8Ek30MLdKYhj3QpyqSTwkLd/Oy3RO15jDtOP
	R1EHPCG9RD+ALV425ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gCr-00ArTe-2R;
	Thu, 30 Nov 2023 12:31:49 +0000
Received: from mail-mw2nam04olkn20824.outbound.protection.outlook.com ([2a01:111:f400:7e8c::824] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gCp-00ArSY-1a
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEoikunJrgnm2Uj78oCnb65gz0bpOlFoiZZ5qtZMaWXj1QdwaBZ3n1oFQ2dt+290kwr3sInPXagU344+FR5ACkH3PrH4ijBD7lbS/87JVni+azf02KPvos8C2soE5hKrwb5i+YzteqFRY5RVeuIFLLh4J7bTcTVCZU7QGxmt/7dDyJxNfQ4KnDMwELLZz8g1QTVeZkVH+zPBYMXMOEOnbyu58FaC7W27icjWdBy4RI4NjOFGi+ipcPNpXF8n1gLOcEkpu1R1ME2dnWwZdh1dAIQvW5DjstczLqgT04DCsbalWtCU1QJfCkX15VrPLEMuHxt4BunKzcW8Q6t7Ela4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLY6imZlpcFd/2/Q/j0Q9FTyVg1Cj7UY2Gu2cJAB+68=;
 b=KZqyxbfoR/RBIGTxef+w0Dxc09UCDeNSMjHBqdwPiBdBdfptzIkNdax21hN646M8fWHwmJBxJs8+m/DYoceK5rEJMKu7Rd7PtJs4eazJCUF0RmcCaf4lLLK3Jx/mNtaVwwPYIz2D8o1qQmTRVR+T0bhcSksN/zfRbKIG4WPDZOTfcuWZbT5qBnj56ygJJeNXSlAXTaCEC55Vs56lDTZHkBfoAtVPfcaTWcQ3mJVDvSjSoZLrwnalrfcJXN/z3gVdqhycB8kMN7CUpa+ZNul3Ml7oip4fFgN12FlxaR1XHNGFNCZxw2xuQLtveC5fS1WYqvur+xbEuznfXDLek32B2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLY6imZlpcFd/2/Q/j0Q9FTyVg1Cj7UY2Gu2cJAB+68=;
 b=q3gAR2pY12LgPTmpOhxouZ2/J5JohS7+g5WLQN1I6YX4HdZT+0LQwKyreJ6yWxPKhsFu8N2B/9Okl3PYxhI7BWhRLNXI47N5Jd81NeeJ9zRCd4oShptDiTi+x0b1KbO313IQOiNiofjPTiOmnDqlZAXKG6uhBOEp8Omqs2c8U18Iyum3+4be9SsYldwFLsRyiuW7WwqAawhj123CFIKxsy2ND4GM5G4Rtu7i3W7Ucu1mkjX+spYaAAlmO0hGlEdSwh787Q1ljVIelg3IigWxKkL7zomYppkMZFtPenkeMlt3NvlQ5QgN8OnrvzOGvr8AE9YjrBwgvHGIWVKEFebJfg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB5125.namprd20.prod.outlook.com (2603:10b6:806:251::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 12:31:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 12:31:42 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Thu, 30 Nov 2023 20:31:31 +0800
Message-ID: <IA1PR20MB4953AAFDF51FFF198C7F9FCABB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK9=C2UWwHVCvgXG0kNLt86JTk7P6p-EdPLS3F8Z5qnSpCPLkg@mail.gmail.com>
References: <CAK9=C2UWwHVCvgXG0kNLt86JTk7P6p-EdPLS3F8Z5qnSpCPLkg@mail.gmail.com>
X-TMN: [aKV9JTU2CKlQnxHoIv8eVrUwXrD43LEIwaH8XKrgvYU=]
X-ClientProxiedBy: BYAPR02CA0058.namprd02.prod.outlook.com
 (2603:10b6:a03:54::35) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231130123132.376154-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a9458a-0453-4543-98f6-08dbf1a04e83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KEOHYi3VgyJmY9kK+MDzBDFOVI/ySTWYmEcNJ1J364oHaCmSsInRiQ+RlzpM0uXK9sxD6ZTA6P8vDFXVxAPPeHx9Ygg8Oas9a7g6g7Xwp9IGsV44z0BNdGsYote7FIr30JnIyNedBxWgWgGtukQNFO/4kzVM9SIYTF09uMu9cD7qy5yXH2+HTIY2csfs2NADvP1NFHsCNqPLIWBtAKqDozQyG0zUUGa7elOMBjZK1fDej5F/VgK2Mx3tqxzxNMj7ARcx2KaBUAoOwVGMsvi/TgwQ6SXqsE4InHL+C0b76DTvXU6QmDHJViwtU4gVe3aWVYzm8IUHHe7KX+E0DQMaucq0CB2e1PIQ6NptUrGARQGSxTs+0GM++u2fXKjMP1gFUdjfYxp/JREj+GuQHfdsno/n5ETEWESfphWZmn4KvnuwYfBWuXzKRiZSLis5Nf+mprBeyKqydqRSS00OSIlx4OGz+T7Xeo1fghz5GC8QSBSLxaLQhUyK03bZvoO3VDrGOqqhGXqZLSqjelc5uhlMSyy8Vi/Ddpan5R/6eJJcbalcmKfIFCTwjI3HkhHsCB3lQqf4BKY6hxxY0LiJnRxHLB1S5Fy0y2Ao4ftF5IKoQP11FNZVPWUoqSmtEd674h1x
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lLNTdxNnJhZE0xMlVVUnJYWGlDa1c3cnVZNGoyUkJPZGxiYkxvaGFwdCta?=
 =?utf-8?B?TllXRDFRS3hmVVNiajFOSGxpRG1RWS9NRXBQNDd4cSs0d1dPbFZLMDg2aHo1?=
 =?utf-8?B?MmpaQmJ6dVJEVklXSzByWHlubzMwdWJzeVlyZUs3TzhPTkJXMC9tMjhTZklt?=
 =?utf-8?B?RGFlWFVFNlJqSGc1aEhTcitUd2JyR1o1Y2lTUCtHazM5WC9CUXZrY3dnVjE5?=
 =?utf-8?B?QmNYbk1ucnNMRGVaOHNDL0wyemcxaGVydUxQMkYwVFNVL3ZOK08vVTZqWEFP?=
 =?utf-8?B?Z0FVTXJNTlRZdTRSaklyQ212K3BPc1hrRk45WGd2RjVxa1p3UzQ5MTV3QkFP?=
 =?utf-8?B?ZHk3cTdJc0lBc3Vvd04vNVpPZkVra3JOd2pVc3VZeVlUZ3ZwU3c0aHF0aFV3?=
 =?utf-8?B?aDY4SnFNZVU1cEliVFdjSGhGVEo1dG1XY3VodEo1bjdpOTVDalJtTytvVGxL?=
 =?utf-8?B?WnhQOFFCaHdTU01wdlUvN3g0UUVIN1FjbElxZVhVZGpScytjSCtNYXJHOVl5?=
 =?utf-8?B?Y0p0aU11a1AyMUU3L0E1M1Bhd1RoL2QvYm9HOTJWeWpQdlhWYjU4M3VhanpY?=
 =?utf-8?B?S3JHR1UxTTlRWExHQ3NCeWJmTzVoMWpqSDZKOXdmNXF6bDRGV0xobCtCNExq?=
 =?utf-8?B?YWhoeGNHc0t6UjVIZDZpSFFqREYvZUsyTFRKS2FzekRGRFZJTjFob2JSeWUr?=
 =?utf-8?B?VmphQ3JidENTK0FJTEVSK1pXVy9uQVp5Uys2ODM0ZU1VUjFYVjRSRm11OTZX?=
 =?utf-8?B?RWxTWTR1MFI2cUVHU1kreGQrcGFFYi9rUEc5RDNVbGZ1Tk85UlkreTNKdTlM?=
 =?utf-8?B?b3lWMVJoWENxUW9qWEpaSW1kWks4OFpRd2ZTSjZnRnY0bGl0dXJrTGI5elQ5?=
 =?utf-8?B?ZVMvYkJDZlcyRU9ySXd6MzBEWVUvU0EvL0tUWjE3bkNZVEF1OUxmUVFoMW8r?=
 =?utf-8?B?OUlvNUZ6c2lYc2NIMURVUkNQTlNlcHpxU0ZrL1ZQeXhKR1VKVGNocllQeEI4?=
 =?utf-8?B?MmdLaUhQaVN1R0R6TnVDU3BoK3BtOVB0UnpQRXQycE9sem55NmxzU05TYjJH?=
 =?utf-8?B?SHpzOFJSWGNnUHMzUWZ5ajZ1NlZVdVQvcVJzM0lKUmRMYStiQml2WmFxYTVr?=
 =?utf-8?B?TVU5Z08xRUNKeG03VnAzVXUvOTFEQlhaZXB0NGJnK2F3OFVRNlVCckJIS3Z2?=
 =?utf-8?B?a3JVN3ZQaHFwUzFnRnlPcHRnUGl4d08xTGJ4bkliaWhPbnhnWFBHVVFxZ01t?=
 =?utf-8?B?bkR5V1hKWFZueFRvYk1HeHNqRjgvTnQ0MWdqVXZDdXMwZHFDSW8wcCsvSWMr?=
 =?utf-8?B?MzlNeHBDVG9wQjcwcHh4Q1orcHF4WjNDOGs4WEdzRlptZlBkRTZVQnRPN1dP?=
 =?utf-8?B?M0FBaDZvNnNraStzN0NHRE5EWHFYbFNTTlphckVramI0Qkxxd3BGZHgxL1g4?=
 =?utf-8?B?Mms1ditmcktmRkdENkJsZGRCdldoU09wNlJGYWxkUHR5RzlKd04xNURnd1o3?=
 =?utf-8?B?VW5wQmdxZ2hWeEFZeXRSb2JBZjhrN0x2b0J6NitiR0k3UDQ3UFVFWDVwR1E3?=
 =?utf-8?B?VlJyczRhaVFNSkx3cEhyWlhFTkJwUzZUV1AwWmNWSUVuZGlJQnoyamIzcmI2?=
 =?utf-8?Q?qIlIEIStWkbdpAAlnIYg7SKd+BvMrEdE8lo+UxZ0TOXA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a9458a-0453-4543-98f6-08dbf1a04e83
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 12:31:41.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB5125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_043147_690796_B299579E 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pk9uIFRodSwgTm92IDMwLCAyMDIzIGF0IDU6NDDigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwNToxODoxNVBN
ICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNTox
NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+Pj4+IGFu
ZCBhZGQgc2VwYXJhdGUgInJpc2N2IiBwcmVmaXhlZCBEVCBiaW5kaW5nIGZvciBSSVNDLVYgbXRp
bWVyLgo+Pj4+Cj4+Pj4gRG8geW91IGtub3cgb2YgYW55IHVzZXJzIGZvciBhICJyaXNjdixtdGlt
ZXIiIGJpbmRpbmcgdGhhdCBhcmUgbm90Cj4+Pj4gY292ZXJlZCBieSBleGlzdGluZyBiaW5kaW5n
cyBmb3IgdGhlIGNsaW50Pwo+Pj4KPj4+IFZlbnRhbmEgVmV5cm9uLXYxIGltcGxlbWVudHMgYSBt
dGltZXIgcGVyLWNsdXN0ZXIgKG9yIGNoaXBsZXQpCj4+PiB3aGljaCBpcyBjb21wYXRpYmxlIHRv
ICJyaXNjdixtdGltZXIiIChpLmUuIHdlIGhhdmUgYm90aCBtdGltZQo+Pj4gYW5kIG10aW1lY21w
IE1NSU8gcmVnaXN0ZXJzKS4KPj4KPj4gT2theSwgdGhhbmtzLiBJIGd1ZXNzIGlmZiB2ZXlyb24t
djEgRFQgc3VwcG9ydCBzaG93cyB1cCAob3Igb3RoZXIKPj4gc2ltaWxhciBkZXZpY2VzKSB3ZSBj
YW4gZ28gYWhlYWQgd2l0aCBhICJyaXNjdixtdGltZXIiIGJpbmRpbmcgdGhlbi4KPj4gSSBoYWQg
dGhvdWdodCB0aGF0IHlvdSBndXlzIHdlcmUgZ29pbmcgdG8gYmUgdXNpbmcgQUNQSSB0aG91Z2gs
IHNvCj4+IEkgZ3Vlc3MgdGhlICJvdGhlciBzaW1pbGFyIGRldmljZXMiIGFwcGxpZXMuCj4KPldl
IHVzZSBBQ1BJIGZyb20gRURLMiBvbndhcmRzIGluIG91ciBib290LWZsb3cuIFRoZSBib290aW5n
Cj5zdGFnZXMgcHJpb3IgdG8gRURLMiAoc3VjaCBhcyBPcGVuU0JJKSB1c2UgRFQuIEluIGZhY3Qs
IEVESzIKPmFsc28gdXNlcyBpbmZvcm1hdGlvbiBpbiBEVCB0byBwb3B1bGF0ZSBzdGF0aWMgcGFy
dHMgb2YgdGhlIEFDUEkKPnRhYmxlLgo+CgpZZXMsIEFuZCB0aGUgRURLMiBpbXBsZW1lbnQgb2Yg
c2cyMDQyIHNoYXJlcyB0aGUgc2FtZSBib290IGZsb3csIHdoaWNoIGlzCmFscmVhZHkgaW4gdGhl
IG1haW5saW5lIEVESzIgcmVwby4KCj5SZWdhcmRzLAo+QW51cAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
