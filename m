Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45452D4336B
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 06:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCOEahXr8ACt9NVdF5ytlIYWpKoBqJo8sBjJvgrv1J0=; b=s5vIqFNpVrhCnwwTk1M2H5c109
	Bnj/SYSQbIWnPn43oVV3Hz+eI2t703uBITcH7ckpzF/bJFPvJw2aI8BddOTIu2p2T6O0x0uCqprpU
	JVpDD3b3fAAA/HsgTlba5HtD1nRODLKBf8HEkvFcrBsf7EEamHkwxndeo8cnkjLr0+aLggWPcTd/M
	8cMU2qytBkq7+EJDoB4EKZ9jGb4WGDMXFuPbE+cplLdaCrNITBqMBkSIGA8KUGzXZJKmbMZwi32Bz
	DUcGna6Ik6isX7+DF9fV7AjMyP+oJ+wqLTlVUzaPpxqpth+NuPMasEVbzET1jUwX22vl9YChMftL0
	/2vMQi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwsX-00000000AnI-1w2b;
	Fri, 12 Dec 2025 06:43:49 +0000
Received: from duck.ash.relay.mailchannels.net ([23.83.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwsU-00000000Amv-33KT
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 06:43:48 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6D86B4C0A0F;
	Fri, 12 Dec 2025 06:43:44 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (100-102-46-239.trex-nlb.outbound.svc.cluster.local [100.102.46.239])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8A66E4C1052;
	Fri, 12 Dec 2025 06:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765521824;
	b=d1NoUJf8zyqAuetLFfQX0/EUet1rk7SEaTudz4k7nQvMW+IgATReljKmUr2pXgrA6Ji6Dc
	9jYj8+UcPHfAEvusAMDnS2ZxAuZ/gsFDGsiz7NuM4oAfhiAS/wfmhEjH5KC0C5TAfMnwC4
	z639DHAbW8pvRmGmJoHfnJD0q0G97mR6LeamU2DojFcEw1S6iynM/f3TkBbvlqjwtnxHCh
	uExbJcAzK7vSdvsyP35+SIDhHPowbg44NckgLQygx6aB2vde+a8EXQ2+r0BQQ0G/83M/rZ
	cXPICjIKnUmQsZUD0T023VcqF1YQRAs2J99eElwNcc2/af+CqIvF6gW8oAWEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765521824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=F6xBIEupjOzdAW/+2rQgYdIjPkkbnltD1vqRLqWTTio=;
	b=upLU73e6mM+/WoWy/yNKqthCW+mlo8Ih19PaDhoAVy3kP7gPgeXXgGpun655+RWfDV2mPA
	AWfFKumccoVdGDfJj+rVi2ZUCoKQAS1Slk6po3Rj7QiYaQfXcNw3kGthTti8BfStSqfdTE
	l2Yf8z6aNy2PWs/ozsGgNucxNDl2r/MYPj6wRfS89sR3JY2Zqzue9LbDmaahBeg4B96YiW
	GKi8SRfN1fxBJYEeBkyjvYa5ziqAvEkytbFELnFrxnAfCdWrJQWKvkYkeuk4z5gt38ogot
	tZ4qnWkW7HzyOO8/hMNgbVQiFIQM9hlxrWRas5CnYiOIt6FvKq2g952wk2NnEg==
ARC-Authentication-Results: i=1;
	rspamd-9c757c4bc-c4qcg;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Society-Ski: 45a8d5554df4279c_1765521824313_2733346603
X-MC-Loop-Signature: 1765521824313:754056090
X-MC-Ingress-Time: 1765521824313
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.46.239 (trex/7.1.3);
	Fri, 12 Dec 2025 06:43:44 +0000
Received: from [IPV6:2001:861:4450:d360:fd3:3d4:e594:13ce] (unknown [IPv6:2001:861:4450:d360:fd3:3d4:e594:13ce])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dSKfj305mz1xmB;
	Fri, 12 Dec 2025 06:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765521821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6xBIEupjOzdAW/+2rQgYdIjPkkbnltD1vqRLqWTTio=;
	b=ER4HQdUtK9/M6lgymsRY3RmJ66o5iM/VReZoYc74WVSW1CmnDNo8tHuPgF9yOWy5fNCNsm
	N0hcRTxYU9Qm6grAq2u/Q/rzVSDIZjCvjM+q8LBW7rptgu7XDgzs8PRLY/g29dd2YEtsuE
	Sx4r7EqV/pN2brO7Czlp5Kwdj9iv+Gpc9ydQ4N/iMExCHH3jxce5G0uyYwOYMVKhTjFhAU
	XihFILtAilj5HwurmtfMCKKZTqXLE6QZzmJgcELCW0rplXGFaDZhRZveay5NUTsHJiNwvw
	mByySzXX2pjUn/jL0VtsKvrVmcpqkndqRY/sHFEubVwYIxuVhDMOcdDyAubaTA==
Message-ID: <16c8f942-9860-43bf-a865-5de3ae955abc@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: SpacemiT k1: Linux crashes setting up smp with mainline U-Boot
To: Junhui Liu <junhui.liu@pigmoral.tech>
References: <4d2e1302-723e-4f3f-ad28-586e6b4749ed@rootcommit.com>
 <1244329d-b842-4894-93d5-0c3c41c1eb9e@pigmoral.tech>
 <5965fad0-ab24-4db4-9ee4-647fe503a8ff@rootcommit.com>
 <fb38c759-b7e0-4cff-91f6-7ad3e4313f55@pigmoral.tech>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <fb38c759-b7e0-4cff-91f6-7ad3e4313f55@pigmoral.tech>
Date: Fri, 12 Dec 2025 06:43:40 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=693bb99d a=QP3xoUG9GEOTSEwqU1iSNg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=p1gkwz4iQemVi0H4obcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfO+mAbdbU5OdsGgo4ViAHkhxMHdocPexZ51LP2jEAGAxeATZQ+RFvzK4mPXTngrqXweAWR2cYiEbvJDtCi7WAxNp1Lz9CSvsw21Y63PZblJahS63gasv 9z0rM1pdMwWZa7FFSq+KFaAyhYNOx7G2WHX8XsrDq9+MuZ3E/KZ3eKd/nI41l+rc1pjo9iw1LRTRR4USAfrQK0xr/rJfUHAvqMO0IWvdbTZc7kGnQm9WAz56 W7mv4VhVuqK9S/svEg2vQzBP+FuNjce17qY4TGzsvmAluQ3LfqUgteMn4cV58geP/bN0DBfNcYp0PlV3TlVmBHt0+Z/wEM5iXDWUdDiJwv0YK/Z9ePB1/BUC KZrWs0OuwKQUMS7uVKy32Hmp6n1oqQXUiM+biAjwVRO0y/Ijru+peg68Vwp/AmusuFHlyMTv
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_224347_128250_71CCD885 
X-CRM114-Status: GOOD (  15.08  )
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

SGkgSnVuaHVpCgpPbiAxMi8xMi8yNSAwNjo0MCwgSnVuaHVpIExpdSB3cm90ZToKPiBPcGVuU0JJ
IHYxLjctODktZzUxZmU2YThiCj4gwqAgwqBfX19fwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgX19fX18gX19fXyBfX19fXwo+IMKgIC8gX18gXMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC8gX19fX3zCoCBfIFxfwqAgwqBffAo+IMKgfCB8wqAgfCB8XyBfX8KgIMKgX19fIF8gX18gfCAo
X19fIHwgfF8pIHx8IHwKPiDCoHwgfMKgIHwgfCAnXyBcIC8gXyBcICdfIFwgXF9fXyBcfMKgIF8g
PCB8IHwKPiDCoHwgfF9ffCB8IHxfKSB8wqAgX18vIHwgfCB8X19fXykgfCB8XykgfHwgfF8KPiDC
oCBcX19fXy98IC5fXy8gXF9fX3xffCB8X3xfX19fXy98X19fXy9fX19fX3wKPiDCoCDCoCDCoCDC
oCB8IHwKPiDCoCDCoCDCoCDCoCB8X3wKPgo+IFBsYXRmb3JtIE5hbWXCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDogQmFuYW5hIFBpIEJQSS1GMwo+IFBsYXRmb3JtIEZlYXR1cmVzwqAgwqAgwqAgwqAg
wqAgwqA6IG1lZGVsZWcKPiBQbGF0Zm9ybSBIQVJUIENvdW50wqAgwqAgwqAgwqAgwqA6IDgKPiBQ
bGF0Zm9ybSBJUEkgRGV2aWNlwqAgwqAgwqAgwqAgwqA6IGFjbGludC1tc3dpCj4gUGxhdGZvcm0g
VGltZXIgRGV2aWNlwqAgwqAgwqAgwqA6IGFjbGludC1tdGltZXIgQCAyNDAwMDAwMEh6Cj4gUGxh
dGZvcm0gQ29uc29sZSBEZXZpY2XCoCDCoCDCoDogdWFydDgyNTAKPiBQbGF0Zm9ybSBIU00gRGV2
aWNlwqAgwqAgwqAgwqAgwqA6IHNwYWNlbWl0LWhzbQo+IFBsYXRmb3JtIFBNVSBEZXZpY2XCoCDC
oCDCoCDCoCDCoDogLS0tCj4gUGxhdGZvcm0gUmVib290IERldmljZcKgIMKgIMKgIDogLS0tCj4g
UGxhdGZvcm0gU2h1dGRvd24gRGV2aWNlwqAgwqAgOiAtLS0KPiBQbGF0Zm9ybSBTdXNwZW5kIERl
dmljZcKgIMKgIMKgOiAtLS0KPiBQbGF0Zm9ybSBDUFBDIERldmljZcKgIMKgIMKgIMKgIDogLS0t
Cj4gRmlybXdhcmUgQmFzZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgOiAweDAKPiBGaXJtd2FyZSBT
aXplwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IDQwNyBLQgo+IEZpcm13YXJlIFJXIE9mZnNldMKg
IMKgIMKgIMKgIMKgIDogMHg0MDAwMAo+IEZpcm13YXJlIFJXIFNpemXCoCDCoCDCoCDCoCDCoCDC
oCA6IDE1MSBLQgo+IEZpcm13YXJlIEhlYXAgT2Zmc2V0wqAgwqAgwqAgwqAgOiAweDU1MDAwCj4g
RmlybXdhcmUgSGVhcCBTaXplwqAgwqAgwqAgwqAgwqAgOiA2NyBLQiAodG90YWwpLCAxIEtCIChy
ZXNlcnZlZCksIDEzIEtCIAo+ICh1c2VkKSwgNTIgS0IgKGZyZWUpCj4gRmlybXdhcmUgU2NyYXRj
aCBTaXplwqAgwqAgwqAgwqA6IDQwOTYgQiAodG90YWwpLCAxNDY0IEIgKHVzZWQpLCAyNjMyIEIg
Cj4gKGZyZWUpCj4gUnVudGltZSBTQkkgVmVyc2lvbsKgIMKgIMKgIMKgIMKgOiAzLjAKPiBTdGFu
ZGFyZCBTQkkgRXh0ZW5zaW9uc8KgIMKgIMKgOiAKPiB0aW1lLHJmbmMsaXBpLGJhc2UsaHNtLHBt
dSxkYmNuLGZ3ZnQsbGVnYWN5LGRidHIsc3NlCj4gRXhwZXJpbWVudGFsIFNCSSBFeHRlbnNpb25z
IDogbm9uZQo+Cj4gRG9tYWluMCBOYW1lwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgOiByb290Cj4g
RG9tYWluMCBCb290IEhBUlTCoCDCoCDCoCDCoCDCoCDCoDogMAo+IERvbWFpbjAgSEFSVHPCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoDogMCosMSosMiosMyosNCosNSosNiosNyoKPiBEb21haW4wIFJl
Z2lvbjAwwqAgwqAgwqAgwqAgwqAgwqAgOiAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDAw
MDNmZmZmIE06IAo+IChGLFIsWCkgUy9VOiAoKQo+IERvbWFpbjAgUmVnaW9uMDHCoCDCoCDCoCDC
oCDCoCDCoCA6IDB4MDAwMDAwMDAwMDA0MDAwMC0weDAwMDAwMDAwMDAwN2ZmZmYgTTogCj4gKEYs
UixXKSBTL1U6ICgpCj4gRG9tYWluMCBSZWdpb24wMsKgIMKgIMKgIMKgIMKgIMKgIDogMHgwMDAw
MDAwMGQ0MDE3MDAwLTB4MDAwMDAwMDBkNDAxN2ZmZiBNOiAKPiAoSSxSLFcpIFMvVTogKFIsVykK
PiBEb21haW4wIFJlZ2lvbjAzwqAgwqAgwqAgwqAgwqAgwqAgOiAweDAwMDAwMDAwZTQwMDAwMDAt
MHgwMDAwMDAwMGU0MDBmZmZmIE06IAo+IChJLFIsVykgUy9VOiAoKQo+IERvbWFpbjAgUmVnaW9u
MDTCoCDCoCDCoCDCoCDCoCDCoCA6IDB4MDAwMDAwMDBlMDAwMDAwMC0weDAwMDAwMDAwZTNmZmZm
ZmYgTTogCj4gKEksUixXKSBTL1U6IChSLFcpCj4gRG9tYWluMCBSZWdpb24wNcKgIMKgIMKgIMKg
IMKgIMKgIDogMHgwMDAwMDAwMDAwMDAwMDAwLTB4ZmZmZmZmZmZmZmZmZmZmZiBNOiAKPiAoKSBT
L1U6IChSLFcsWCkKPiBEb21haW4wIE5leHQgQWRkcmVzc8KgIMKgIMKgIMKgIDogMHgwMDAwMDAw
MDAwMjAwMDAwCj4gRG9tYWluMCBOZXh0IEFyZzHCoCDCoCDCoCDCoCDCoCDCoDogMHgwMDAwMDAw
MDAwMjYxMGI4Cj4gRG9tYWluMCBOZXh0IE1vZGXCoCDCoCDCoCDCoCDCoCDCoDogUy1tb2RlCj4g
RG9tYWluMCBTeXNSZXNldMKgIMKgIMKgIMKgIMKgIMKgIDogeWVzCj4gRG9tYWluMCBTeXNTdXNw
ZW5kwqAgwqAgwqAgwqAgwqAgOiB5ZXMKPgo+IEJvb3QgSEFSVCBJRMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDogMAo+IEJvb3QgSEFSVCBEb21haW7CoCDCoCDCoCDCoCDCoCDCoCA6IHJvb3QKPiBC
b290IEhBUlQgUHJpdiBWZXJzaW9uwqAgwqAgwqAgOiB2MS4xMgo+IEJvb3QgSEFSVCBCYXNlIElT
QcKgIMKgIMKgIMKgIMKgIDogcnY2NGltYWZkY2J2eAo+IEJvb3QgSEFSVCBJU0EgRXh0ZW5zaW9u
c8KgIMKgIDogCj4gc3Njb2ZwbWYsc3N0Yyx6aWNudHIsemlocG0semljYm96LHppY2JvbSxzdnBi
bXQsc2R0cmlnCj4gQm9vdCBIQVJUIFBNUCBDb3VudMKgIMKgIMKgIMKgIMKgOiAzMgo+IEJvb3Qg
SEFSVCBQTVAgR3JhbnVsYXJpdHnCoCDCoDogMTIgYml0cwo+IEJvb3QgSEFSVCBQTVAgQWRkcmVz
cyBCaXRzwqAgOiAzOAo+IEJvb3QgSEFSVCBNSFBNIEluZm/CoCDCoCDCoCDCoCDCoDogMTYgKDB4
MDAwN2ZmZjgpCj4gQm9vdCBIQVJUIERlYnVnIFRyaWdnZXJzwqAgwqAgOiA4IHRyaWdnZXJzCj4g
Qm9vdCBIQVJUIE1JREVMRUfCoCDCoCDCoCDCoCDCoCDCoDogMHgwMDAwMDAwMDAwMDAyMjIyCj4g
Qm9vdCBIQVJUIE1FREVMRUfCoCDCoCDCoCDCoCDCoCDCoDogMHgwMDAwMDAwMDAwMDBiMTA5Cj4K
Pgo+IFRoZSBsb2cgYWJvdmUgaXMgZnJvbSBteSBPcGVuU0JJIGJvb3QuIEFsdGhvdWdoIEkgaGF2
ZW4ndCBoYWQgdGhlIHRpbWUgdG8KPiB0ZXN0IGJvb3RpbmcgdGhlIG1haW5saW5lIGtlcm5lbCB3
aXRoIG1haW5saW5lIFUtQm9vdCB5ZXQsIEkgbm90aWNlZCBzb21lCj4gZGlmZmVyZW5jZXM6Cj4K
PiAxLiB0aGUgdmVyc2lvbiBwcmludGVkIGluIG15IGxvZyBpcyAiT3BlblNCSSB2MS43LTg5LWc1
MWZlNmE4YiIgKHdoaWNoCj4gwqAgwqBjb3JyZXNwb25kcyB0byB0aGUgbGF0ZXN0IGNvbW1pdCAK
PiA1MWZlNmE4YmM5NTgxNjZmZjc5ODA1Y2Y2OWJhZmU1ZTI5Nzc3NmY0KSwKPiDCoCDCoHdoZXJl
YXMgeW91ciBvdXRwdXQgc2hvd3Mgb25seSAiT3BlblNCSSB2MS43Ii4KPiAyLiB5b3VyIGJvb3Qg
bG9nIGRvZXMgbm90IHNlZW0gdG8gbGlzdCB0aGUgSFNNIGRldmljZToKPiDCoCDCoFBsYXRmb3Jt
IEhTTSBEZXZpY2XCoCDCoCDCoCDCoCDCoDogc3BhY2VtaXQtaHNtCj4KPiBJIHBlcnNvbmFsbHkg
c3VnZ2VzdCBjaGVja2luZyB0aGVzZSB0d28gcG9pbnRzOgo+Cj4gMS4gQWZ0ZXIgdXBkYXRpbmcg
dGhlIE9wZW5TQkkgcmVwb3NpdG9yeSwgcnVuICJybSAtciBidWlsZCIgdG8gY2xlYXIKPiDCoCDC
oHByZXZpb3VzIGJ1aWxkIGNhY2hlIGJlZm9yZSByZWNvbXBpbGluZy4gVGhpcyBlbnN1cmVzIHRo
YXQgYWxsIHRoZQo+IMKgIMKgbmVjZXNzYXJ5IGZpbGVzIGFyZSBlZmZlY3RpdmVseSBpbmNsdWRl
ZCBpbiB0aGUgYnVpbGQuCj4gMi4gQ2hlY2sgaWYgdGhlIGNvbXBhdGlibGUgaW4gVS1Cb290J3Mg
ZGV2aWNlIHRyZWUgKHdoaWNoIHNob3VsZAo+IMKgIMKgYmUgdXNlZCBieSBPcGVuU0JJKSBtYXRj
aGVzIHRoZSBvbmUgaW4gdGhlIE9wZW5TQkkgY29kZSAKPiAoc3BlY2lmaWNhbGx5IGluCj4gwqAg
wqBwbGF0Zm9ybS9nZW5lcmljL3NwYWNlbWl0L2sxLmMgYW5kIGxpYi91dGlscy9oc20vZmR0X2hz
bV9zcGFjZW1pdC5jKS4KCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgaGVscCEKSXQgdHVybmVkIG91
dCBJIGNvcGllZCB0aGUgb2xkIGltYWdlLCBub3QgdGhlIG5ldyBvbmUuIE15IGFwb2xvZ2llcyEK
Ck5vdyBpbmRlZWQsIHRoZSBidWcgaXMgZ29uZSBhbmQgSSBjYW4gYm9vdCBtYWlubGluZSBMaW51
eCBvbiBtYWlubGluZSAKVS1Cb290IGFuZCBtYWlubGluZSBPcGVuU0JJLgpJIHdpbGwgcHVibGlz
aCBZb2N0byByZWNpcGVzIChtZXRhLXJpc2N2IGxheWVyKSBpbiB0aGUgbmV4dCBkYXlzIHRvIAph
bGxvdyBldmVyeW9uZSB0byBidWlsZCBzdWNoIGltYWdlcy4KClRoaXMgd2lsbCBoZWxwIHdpdGgg
c3VwcG9ydGluZyBvdGhlciBLMS1iYXNlZCBwbGF0Zm9ybXMgdG9vLgpUaGFua3MgYSBsb3QgZm9y
IHlvdXIgY29udHJpYnV0aW9ucyzCoCBndWlkYW5jZSBhbmQgcGF0aWVuY2UuCkNoZWVycwpNaWNo
YWVsLgoKCi0tIApNaWNoYWVsIE9wZGVuYWNrZXIKUm9vdCBDb21taXQKWW9jdG8gUHJvamVjdCBh
bmQgT3BlbkVtYmVkZGVkIFRyYWluaW5nIGNvdXJzZSAtIExlYXJuIGJ5IGRvaW5nOgpodHRwczov
L3Jvb3Rjb21taXQuY29tL3RyYWluaW5nL3lvY3RvLwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
