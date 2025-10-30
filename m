Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417C7CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D52S3SukNOlm1B0lC0UCGP+fUWPgCtf1g/9iK1J95oQ=; b=DI6Gp8xXSVR30LKekBQzCVYr7I
	rrWTP147wWU5m/22Wt4pDz7+BHptvG6RlYVfCy0GFHaJ6rwlHmaw/xzigJY5QiTW+DvIN7QYuZjrQ
	lgrrqRs25preBg4Po9CMhAyBlb1FmQ1hAvWrHPCnbHpn0uUAUCcQHxJ+I6SbvFOjieHwBpvVO0i/Y
	5coIw3MJ5AMxPP5c47w+PtlvTT7J6i5tBFmbVHuBzfeuRkBNHmP1M1HUmP5Sj+bNfAtY+amAbjkuq
	gHGYo564brh8nipXDH7B6wMBUXOmqPb8+tEawCzhk2/mofq0omhALWxLduSppIPDFGGMyWcLUQCUE
	jxGFwcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZIX-00000004q3T-1rPu;
	Thu, 30 Oct 2025 20:31:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZIW-00000004q3K-2xfl
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a/3w0tSYmbrdB8Bc4VelKk3WHGunz92aPVIP7o7nUFc=; b=dXuE47xxYSACDDYJgsu+f2w1T9
	bmEbnzNnj11+TwB20aTQQgzQIlvolSqvWZB3ONaWPCm54WJIZmlgVzZgE27otXB6VdOAvrDhzKSYz
	yDH2SWkSCzorIYcB9nUmS3/wSfepn90r7WRmfycpO2Cff5EhKjJkLJkkVXixz51itJH6VEMOeJ3/p
	QiNuDWEJ8Ea9muMsjzj13om86DtbpCb6vPG32QocxMlmFBF5PGmJbRUYMHb87BEVJ77kyJ3UJoavv
	oIQ5qBnNOXWP0pFyE6vTPxIjoyk6T8bdMqWpPl9/fmhrtlCM428VMnqSBS6xcQAVk1+gfXgRApAdA
	oLS/4dZg==;
Received: from slateblue.cherry.relay.mailchannels.net ([23.83.223.168])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYQj-00000009xgR-3cQF
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:35:32 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2FD83122527;
	Thu, 30 Oct 2025 20:30:51 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.121.213.161])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D7509121E4F;
	Thu, 30 Oct 2025 20:30:47 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761856250; a=rsa-sha256;
	cv=none;
	b=W4sLALF+qWRi6YFhm9pKU0AhFcAeETFdMSMjeuNgQOOe30Svjb5143UUVJioNqozSV0J9m
	NuBzhcujJx3fTIqg5ENq3I84VIy5IDJOvDb/youv2e3Y7+j7OEQxlXu7LkuOm05vejeglH
	sf1W0o6qYupVeOHlLL7gBwoJIg6oCRh94JG9QgwhUtMmTjUArSjSLZxQJmL5v4fbcLoW2+
	f3kCCOhw4XU2p9DeiKcB+MrJkC138i+ozw5mQbD02j5+Oc/JlrpJXkoLX6v65+xeFXYqpa
	urNLiw9HSRIvQHFihW94tf5m64SXUoYvAvhYVhP2nJuUNm/3J7/qOnsEYnR5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761856250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=a/3w0tSYmbrdB8Bc4VelKk3WHGunz92aPVIP7o7nUFc=;
	b=bNxOHqPHJFk4pM9jx7Fekg0BHSeXHBdSyjGJVawywlQhTDcYZxUCVMR04hvlq7tgFK9Z66
	lqU+bsxS8CAyYaRvYjDYoqGj2uXohbt5/ntKBlzGzljYIB8FWLbqKUwsy0pM2aK8SDbUp3
	RMiJizSUdyFnMDP+XxoLt27fDvYWqdNkt2d4hF0gOAWgO4F0qqd5Lb+bfRIV+zEuyYHJoD
	zlcrGKUrw2tPDLxfVW+PskBJ2mh7U1LoVsFuiZLqllpqVPILPZ3c3+YXUNVDyRevPxFzK7
	WzgSXd0HwUkU1mbPawObgvyXZOxJ+GDkcxOaVX8mB9V46MReFnBO6k8ndqtuQA==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-w6swn;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Thoughtful-Abortive: 7dfbeef6333ef82d_1761856250704_2966912137
X-MC-Loop-Signature: 1761856250703:941208266
X-MC-Ingress-Time: 1761856250703
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.213.161 (trex/7.1.3);
	Thu, 30 Oct 2025 20:30:50 +0000
Received: from [IPV6:2001:861:4450:d360:c0a5:3392:2a75:70e6] (unknown [IPv6:2001:861:4450:d360:c0a5:3392:2a75:70e6])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cyG2q1f02z1xmj;
	Thu, 30 Oct 2025 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761856246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/3w0tSYmbrdB8Bc4VelKk3WHGunz92aPVIP7o7nUFc=;
	b=KUb3umUme+l1IZqbe9VYEU0d+/Tfpt4Xuvf0mIDDtIk8O+OnQAIooo1HyJSHxZqyjWcZqn
	cGHfiM9bVWL+WnYI9ArPL/DGnwDQ/s7J/VfTILVwUpdva5klS/XbnbpT0BDmm3v6m/72bF
	7QFl8Mj8QC5g4yxhkznK8yPVWhyQr2lbsWffIJVQfKrVHAM6PZQ/K37EiU+COSbyYiuiF1
	HRXfyl34zjYy4OAAmGG9U4kb3C2Hkal5BtqaVuODDxmVAfA0U3tbotkkKV9koXDewL/Y4f
	avu5mRahhaTp0+H1XrAdEvR57RErj1vhld5vLOrBSzZyKd+Mb2137TUde7dz3g==
Message-ID: <b0624cd1-c223-459b-81dd-ddfe05ea23bf@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: spacemit: Implement emac_set_pauseparam properly
To: Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@gentoo.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <20251030-k1-ethernet-fix-autoneg-v1-1-baa572607ccc@iscas.ac.cn>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251030-k1-ethernet-fix-autoneg-v1-1-baa572607ccc@iscas.ac.cn>
Date: Thu, 30 Oct 2025 20:30:42 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=6903caf6 a=oMt8lXEVxmMAvUTv2ASLGA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=J2c-WwRuk2R10H0XxeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDFDEgdfardwUXzuBuR06atOkE6SSVOwQrmHHmrTNGXJHeYVxusT/9hE/NioNVKaOlepWagMqC+D5Q3T+2W962ludmIA2u9300rs8JLhqXRwlpqzwX4M MFf9UPIPfXHJfXSpraVAWY8YGDgne+pB6Y5OJB5/31YRJwyqp74hdJvfkhD6a4n2C62p4rdwS1YlgxDn8wrQ5A6qEtA++lEeEkkz2voj7dVCNaQB9JZpZn/n 713oZYTAyiLt10pcr3UunZS+Ev+jNOaVHzEQoX1ni/lvpd72LCBAhDjM2R3yeeRKYV/2fsesLhRDWzca9vPv+tHPlU93czUqLAbU41gCK5wXoeKMW0TiXAyM usj45M9xNUSqrdkVAh/Hc9ZlaqhO89H97nYT5Qm4DI5Kly6w6nN40dlkDAJ29s59eFgaxQbloaJXKfZ4m3AVXs+hz9/2m664ih8Ou/xV+1035TLnYiG4VqYs 0OHFRS6Ul1DiFJAfrEDxjLSF26kNxaDUQUAMcOqU4k4vg4Yplljoj8j5HP7nIXlIUXo6mxX1cMjWD7xMPgHqNsiNS5WeX/hBSgkVxHLIMrPW9iJCu2OLJqK3 bdcZokvTk9RTFkZwBJvMPI8spnmBdooBlYmWSuNgjy6ybm6PTnd7Vzv5PpTClndSPRGQE7CphIsPUsDGrqfBnWG/cLpfLjFHY3o35c7IGMoQRp9Xi9ASUStV iX7CBJQYXDg/Qxx4zRdXOVLJqsXdkCN+LPtLk4aocTmA0PhtGdy4EWfVB81hxdfOT0kZZrUazI//H1Hiqsm8sW+si5CIzBgJux7NrupIzSP0C1RTSk0VFIEY 9KkcrGnThmWQSvMeNrg=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_193530_340911_BE34BD1F 
X-CRM114-Status: UNSURE (   5.98  )
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

Ck9uIDEwLzMwLzI1IDE1OjMxLCBWaXZpYW4gV2FuZyB3cm90ZToKPiBlbWFjX3NldF9wYXVzZXBh
cmFtICh0aGUgc2V0X3BhdXNlcGFyYW0gY2FsbGJhY2spIGRpZG4ndCBwcm9wZXJseSB1cGRhdGUK
PiBwaHlkZXYtPmFkdmVydGlzaW5nLiBGaXggaXQgYnkgY2hhbmdpbmcgaXQgdG8gY2FsbCBwaHlf
c2V0X2FzeW1fcGF1c2UuCj4KPiBBbHNvIHNpbXBsaWZ5L3Jlb3JnYW5pemUgcmVsYXRlZCBjb2Rl
IGFyb3VuZCB0aGlzLgo+Cj4gRml4ZXM6IGJmZWM2ZDdmMjAwMSAoIm5ldDogc3BhY2VtaXQ6IEFk
ZCBLMSBFdGhlcm5ldCBNQUMiKQo+IFNpZ25lZC1vZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVp
a2FuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3NwYWNlbWl0
L2sxX2VtYWMuYyB8IDQ4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKClRlc3RlZCBv
biBPcmFuZ2VQaSBSVjIgdGhyb3VnaCBwZXJmb3JtYW5jZSB0ZXN0cywgb24gCmh0dHBzOi8vZ2l0
aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0cy9mb3ItbmV4dC4gTm8gcmVncmVzc2lv
bnMgCmZvdW5kOgoKcm9vdEBvcmFuZ2VwaS1ydjItbWFpbmxpbmU6fiMgaXBlcmYzIC1jIDE3Mi4y
NC4wLjEKQ29ubmVjdGluZyB0byBob3N0IDE3Mi4yNC4wLjEsIHBvcnQgNTIwMQpbwqAgNV0gbG9j
YWwgMTcyLjI0LjAuMiBwb3J0IDQ5OTQ4IGNvbm5lY3RlZCB0byAxNzIuMjQuMC4xIHBvcnQgNTIw
MQpbIElEXSBJbnRlcnZhbMKgIMKgIMKgIMKgIMKgIMKgVHJhbnNmZXLCoCDCoCDCoEJpdHJhdGXC
oCDCoCDCoCDCoCDCoFJldHLCoCBDd25kClvCoCA1XcKgIMKgMC4wMC0xLjAwwqAgwqBzZWPCoCDC
oDExMyBNQnl0ZXPCoCDCoDk0NiBNYml0cy9zZWPCoCDCoCAwwqAgwqAgMzM5IEtCeXRlcwpbwqAg
NV3CoCDCoDEuMDAtMi4wMMKgIMKgc2VjwqAgwqAxMTIgTUJ5dGVzwqAgwqA5NDMgTWJpdHMvc2Vj
wqAgwqAgMMKgIMKgIDQ0NyBLQnl0ZXMKW8KgIDVdwqAgwqAyLjAwLTMuMDDCoCDCoHNlY8KgIMKg
MTEzIE1CeXRlc8KgIMKgOTQ4IE1iaXRzL3NlY8KgIMKgIDDCoCDCoCA0NDcgS0J5dGVzClvCoCA1
XcKgIMKgMy4wMC00LjAwwqAgwqBzZWPCoCDCoDExMiBNQnl0ZXPCoCDCoDk0MSBNYml0cy9zZWPC
oCDCoCAwwqAgwqAgNDc1IEtCeXRlcwpbwqAgNV3CoCDCoDQuMDAtNS4wMMKgIMKgc2VjwqAgwqAx
MTIgTUJ5dGVzwqAgwqA5NDAgTWJpdHMvc2VjwqAgwqAgMMKgIMKgIDUwNSBLQnl0ZXMKW8KgIDVd
wqAgwqA1LjAwLTYuMDDCoCDCoHNlY8KgIMKgMTEyIE1CeXRlc8KgIMKgOTQ0IE1iaXRzL3NlY8Kg
IMKgIDDCoCDCoCA1NjcgS0J5dGVzClvCoCA1XcKgIMKgNi4wMC03LjAwwqAgwqBzZWPCoCDCoDEx
MyBNQnl0ZXPCoCDCoDk0OSBNYml0cy9zZWPCoCDCoCAwwqAgwqAgNjAwIEtCeXRlcwpbwqAgNV3C
oCDCoDcuMDAtOC4wMMKgIMKgc2VjwqAgwqAxMTIgTUJ5dGVzwqAgwqA5MzkgTWJpdHMvc2VjwqAg
wqAgMMKgIMKgIDYwMCBLQnl0ZXMKW8KgIDVdwqAgwqA4LjAwLTkuMDDCoCDCoHNlY8KgIMKgMTEy
IE1CeXRlc8KgIMKgOTM2IE1iaXRzL3NlY8KgIMKgIDDCoCDCoCA2MDAgS0J5dGVzClvCoCA1XcKg
IMKgOS4wMC0xMC4wMcKgIHNlY8KgIMKgMTEzIE1CeXRlc8KgIMKgOTQwIE1iaXRzL3NlY8KgIMKg
IDDCoCDCoCA2MDAgS0J5dGVzCi0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0g
LSAtIC0gLSAtIC0KWyBJRF0gSW50ZXJ2YWzCoCDCoCDCoCDCoCDCoCDCoFRyYW5zZmVywqAgwqAg
wqBCaXRyYXRlwqAgwqAgwqAgwqAgwqBSZXRyClvCoCA1XcKgIMKgMC4wMC0xMC4wMcKgIHNlY8Kg
IDEuMTAgR0J5dGVzwqAgwqA5NDMgTWJpdHMvc2VjwqAgwqAgMCDCoCBzZW5kZXIKW8KgIDVdwqAg
wqAwLjAwLTEwLjAywqAgc2VjwqAgMS4xMCBHQnl0ZXPCoCDCoDk0MCBNYml0cy9zZWMgwqAgwqAg
cmVjZWl2ZXIKCmlwZXJmIERvbmUuCnJvb3RAb3JhbmdlcGktcnYyLW1haW5saW5lOn4jIGlwZXJm
MyAtcwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpTZXJ2ZXIgbGlzdGVuaW5nIG9uIDUyMDEgKHRlc3QgIzEpCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFjY2VwdGVkIGNv
bm5lY3Rpb24gZnJvbSAxNzIuMjQuMC4xLCBwb3J0IDQ3ODM0ClvCoCA1XSBsb2NhbCAxNzIuMjQu
MC4yIHBvcnQgNTIwMSBjb25uZWN0ZWQgdG8gMTcyLjI0LjAuMSBwb3J0IDQ3ODQwClsgSURdIElu
dGVydmFswqAgwqAgwqAgwqAgwqAgwqBUcmFuc2ZlcsKgIMKgIMKgQml0cmF0ZQpbwqAgNV3CoCDC
oDAuMDAtMS4wMMKgIMKgc2VjwqAgwqAxMTIgTUJ5dGVzwqAgwqA5MzQgTWJpdHMvc2VjClvCoCA1
XcKgIMKgMS4wMC0yLjAwwqAgwqBzZWPCoCDCoDExMiBNQnl0ZXPCoCDCoDk0MSBNYml0cy9zZWMK
W8KgIDVdwqAgwqAyLjAwLTMuMDDCoCDCoHNlY8KgIMKgMTEyIE1CeXRlc8KgIMKgOTQyIE1iaXRz
L3NlYwpbwqAgNV3CoCDCoDMuMDAtNC4wMMKgIMKgc2VjwqAgwqAxMTIgTUJ5dGVzwqAgwqA5NDIg
TWJpdHMvc2VjClvCoCA1XcKgIMKgNC4wMC01LjAwwqAgwqBzZWPCoCDCoDExMiBNQnl0ZXPCoCDC
oDk0MiBNYml0cy9zZWMKW8KgIDVdwqAgwqA1LjAwLTYuMDDCoCDCoHNlY8KgIMKgMTEyIE1CeXRl
c8KgIMKgOTQyIE1iaXRzL3NlYwpbwqAgNV3CoCDCoDYuMDAtNy4wMMKgIMKgc2VjwqAgwqAxMTIg
TUJ5dGVzwqAgwqA5NDIgTWJpdHMvc2VjClvCoCA1XcKgIMKgNy4wMC04LjAwwqAgwqBzZWPCoCDC
oDExMiBNQnl0ZXPCoCDCoDk0MiBNYml0cy9zZWMKW8KgIDVdwqAgwqA4LjAwLTkuMDDCoCDCoHNl
Y8KgIMKgMTEyIE1CeXRlc8KgIMKgOTQxIE1iaXRzL3NlYwpbwqAgNV3CoCDCoDkuMDAtMTAuMDDC
oCBzZWPCoCDCoDExMiBNQnl0ZXPCoCDCoDk0MiBNYml0cy9zZWMKW8KgIDVdwqAgMTAuMDAtMTAu
MDHCoCBzZWPCoCDCoDY0MCBLQnl0ZXPCoCAxLjA0IEdiaXRzL3NlYwotIC0gLSAtIC0gLSAtIC0g
LSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtClsgSURdIEludGVydmFswqAgwqAgwqAg
wqAgwqAgwqBUcmFuc2ZlcsKgIMKgIMKgQml0cmF0ZQpbwqAgNV3CoCDCoDAuMDAtMTAuMDHCoCBz
ZWPCoCAxLjEwIEdCeXRlc8KgIMKgOTQxIE1iaXRzL3NlYyDCoCDCoCByZWNlaXZlcgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTZXJ2
ZXIgbGlzdGVuaW5nIG9uIDUyMDEgKHRlc3QgIzIpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpUZXN0ZWQtYnk6IE1pY2hhZWwgT3Bk
ZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29tPgpUaGFua3MhCk1pY2hh
ZWwuCgotLSAKTWljaGFlbCBPcGRlbmFja2VyClJvb3QgQ29tbWl0CllvY3RvIFByb2plY3QgYW5k
IE9wZW5FbWJlZGRlZCBUcmFpbmluZyBjb3Vyc2UgLSBMZWFybiBieSBkb2luZzoKaHR0cHM6Ly9y
b290Y29tbWl0LmNvbS90cmFpbmluZy95b2N0by8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
