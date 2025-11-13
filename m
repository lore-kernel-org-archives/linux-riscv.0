Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAAFCD8C85
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIPdiO/RIUlRVJESnvKta0pJvZ5aMDIuatUb6KUiTuQ=; b=sLWnmKIKDY8c2ii+SfLmDJNmY5
	2oJUPYpiPvxBTlbp/0Ea2HBeLK8xcG1bk9m3Swoobo+Qm7e9/wejboZ6776Qi2e36OCJuSVxV2mex
	sW/yO2sWgM1M7drIGPe0BeTbhqt4t8sIT8sXPpDVFYVotrwvnpVK6XASmfO7JzAhpSovKGu6h5Bzh
	UZOhyTgiM4zuyr6wWkWZwSqN5G/PRaSMdutUyG0pXUFgoX5EzJPoHTuB5ahUGJk+2bg1O07ZRHiWg
	UbR4TjLc/aRYCIj2+Wq5Jeb9sKg6EgL/muxJNzvCJvyiDlZTroIkryAnVmz+e8eMkiJFO7QtCTXSc
	vv5+jBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZOM-0000000Ajf0-0coe;
	Thu, 13 Nov 2025 15:37:46 +0000
Received: from insect.cherry.relay.mailchannels.net ([23.83.223.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZOJ-0000000AjeU-36vL
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 15:37:45 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D4863460E7B;
	Thu, 13 Nov 2025 15:37:42 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.98.43.10])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 74840462AAB;
	Thu, 13 Nov 2025 15:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763048262;
	b=WfN9pjWKCLWylrFj+CTL6zpWw5MbGns6LqA1inBPHVl0alyjR4M+0jZULuosCRooXJupq4
	dyWFoEhXB8pT0rZs8sjqqYKgnhcyCkYIGk4OduogSRIj1tJHJBPMjbyU9lvQUcgEhmgvT5
	ZxOn8MvW2m3OVKZljyG47M3k8TwF3gl1Xt9BYsNsE2E/52vxiBld7S7aa1W3rFQv6LtI5b
	qxnmOIKRDYLS+WupN29UVjJIqXa8mWqrFlVTHGGDGyOYMbLiXid9mO7tHuDPu6MW7aiFlS
	32S8X/jamUJmTI1Nm0VjXi1rQEG8N8pn+2ptIY9YXhHdQSo/Dd7b7bacen3UpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763048262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=RLzGjijAU/vFlwllSrp/plQWYmo7ZirLidDII9/zecY=;
	b=bMJ6ZfEx8FlM4RNsTCCAXVeZqt6d3/mSK9044VkgE/d26CmSPIp5PrIr8Al5H4zj80bb66
	gQmenIiYKGocU5xSY2838QYvRfOdPLIQqOQZSofOFRLiRSk0vpeorqbnQ+TCDuDQoyx4GF
	NiNhbb2TahporgRvzdKJMj8i/nFCPvf8pokgWgP/t/G13RACUGqtkRCvrRRXj1uRKHUrhU
	vfeS5JxysjqWNVRcQc20mw6A+S67ALL10MKxQW3A+6ZbjLZAsyZO4lgttTyBvMJKqdcmEQ
	AlSx1ZCBDoCEvafojbAKRKGymmh6CMyAbpLM9KxF+OlKxm0pTIv/ydqokhyXsQ==
ARC-Authentication-Results: i=1;
	rspamd-dd986fb9b-fznqz;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Good
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Lonely-Reign: 774cccee34596b8a_1763048262648_2896961944
X-MC-Loop-Signature: 1763048262648:987442191
X-MC-Ingress-Time: 1763048262648
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.43.10 (trex/7.1.3);
	Thu, 13 Nov 2025 15:37:42 +0000
Received: from [IPV6:2001:861:4450:d360:cade:11b7:4e69:5c21] (unknown [IPv6:2001:861:4450:d360:cade:11b7:4e69:5c21])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d6kt50vCQz3xF7;
	Thu, 13 Nov 2025 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763048258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLzGjijAU/vFlwllSrp/plQWYmo7ZirLidDII9/zecY=;
	b=bqKXDbY1clyKL0zMRudEmMHQphlIbXIKPgJisbZjhly3m94Hv2FxMw63bIB8Kq60nJSmCH
	Wdxe8Jb2ACuiU78/nk8sZ7r0HgzDC5hWU3AW+LSi1Z9RNhZ0n4QAHiLXew3qVoFj7hptZC
	irbxbgG9WZmehyTeu0Bmmxx2TpH3bw5Pr6Z5QCRZsE2NsvYieOftcllyEA5ht6+C6urHwp
	pfV+YAoXk64+GrAZlkdPvDMonew//YJkREZfBzy7vGZwNnMVf4bGvSZKMT/B1pEBxCU9Ue
	pzef4i3gdSC9G8wIiYrA1VFfWgvDVkAU1inBQeK2lWJH7O3N0ibTtWSOeAAvbg==
Message-ID: <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
Date: Thu, 13 Nov 2025 15:37:32 +0000 (UTC)
X-CM-Envelope: MS4xfHmhrsb8bA0VkPMAIGI8nk/pQZRBKxgooQgAy9xq5AQS+n2VYLvF9tS+o9QewDLs199PBagyXd+kzGLzsycivcn6G96O73hf6rzwtH8CvrD23ld4rEux 6WpN5zIiQZDWT/SaXXgHWBRQOvzvefNl68fWuCsPhgy5/9iTzGd/k/LzppksccW1wT1L9YYvzs1yORb2PIu1dbJHVnQGWQ7yziUDj74M8VjJkO5mdTlIVLLg 06iA2+CeDBLtFJyID4AjkMB2/jleSANjnNKuyQXtQDbcGPMPE5eKPkzvJXb86OW1g9/tJXlbpRW9cADuzMorZqLXpTtUvEoywcASBaBn+TIX1i4rAeGPWMRU /VBX2EXRD8DR1nmRWipNu3HTvSnSDASAQFNWg9mZRLD3d93+f0LrKfhzfIstiqh7XhVU1LKS1m25o/8aiZB8HhOUCA1eW97hMOV8OBhErL/3ryEdPKMdnz1R Vhp/1X5E3fUDf4MJrjkp4fEu1lYXLpC6caC/relwCnmSreApXcqj5OQE4gQQwgF2KT8TJtTj+Dg1gFEsUryxkWPCKGR0F/gMEeBR8xXCZAeAb+SP9bLjhBZr GVTqfehO4S4u1226xXnjF38cV2DH4BF3yddbcXgHaYPywY/gJ2fl+QZhXt7CLzO359OpRWXadJ5smXIs6Ae19IJ+DnQgNh7BPkWGJlAg9yMCrWnxLt/Mcu6R 4dquFGHti7Y=
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6915fb42 a=SdTD4+BzWsD3271SwPFwqg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=hXZgYZo4AAAA:8 a=hVukwZAqnudBvs4O1UQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22 a=37BJPeUnzxYkbV1yBC-1:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_073743_983435_000A1C41 
X-CRM114-Status: GOOD (  21.52  )
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

SGkgVHJveQoKVGhhbmtzIGZvciB0aGUgZml4IQoKT24gMTEvMTMvMjUgMTQ6MjEsIFRyb3kgTWl0
Y2hlbGwgd3JvdGU6Cj4gVGhpcyBjb21taXQgYWRkcmVzc2VzIHR3byBpc3N1ZXMgY2F1c2luZyBp
MmMgZGV0ZWN0IHRvIGZhaWwuCj4KPiBUaGUgaWRlbnRpZmllZCBpc3N1ZXMgYXJlOgo+Cj4gMS4g
SW5jb3JyZWN0IGVycm9yIGhhbmRsaW5nIGZvciBCRUQgKEJ1cyBFcnJvciBObyBBQ0svTkFLKToK
PiAgICAgQmVmb3JlIHRoaXMgY29tbWl0LCBCb3RoIEFMRCAoQXJiaXRyYXRpb24gTG9zcyBEZXRl
Y3RlZCkgYW5kCj4gICAgIEJFRCByZXR1cm5lZCAtRUFHQUlOLgo+IDIuIE1pc3NpbmcgaW50ZXJy
dXB0IHN0YXR1cyBjbGVhciBhZnRlciBpbml0aWFsaXphdGlvbiBpbiB4ZmVyKCk6Cj4gICAgIE9u
IHRoZSBLMSBTb0MsIHNpbXBseSBmaXhpbmcgdGhlIGZpcnN0IGlzc3VlIGNoYW5nZWQgdGhlIGVy
cm9yCj4gICAgIGZyb20gLUVBR0FJTiB0byAtRVRJTUVPVVQuIFRocm91Z2ggdHJhY2luZywgaXQg
d2FzIGRldGVybWluZWQgdGhhdAo+ICAgICB0aGlzIGlzIGxpa2VseSBkdWUgdG8gTVNEIChNYXN0
ZXIgU3RvcCBEZXRlY3RlZCkgbGF0ZW5jeSBpc3N1ZXMuCj4KPiAgICAgVGhhdCBtZWFucyB0aGUg
TVNEIGJpdCBpbiB0aGUgSVNSIG1heSBzdGlsbCBiZSBzZXQgb24gdGhlIG5leHQgdHJhbnNmZXIu
Cj4gICAgIEFzIGEgcmVzdWx0LCB0aGUgY29udHJvbGxlciB3b24ndCB3b3JrIOKAlCB3ZSBjYW4g
c2VlIGZyb20gdGhlIHNjb3BlIHRoYXQKPiAgICAgaXQgZG9lc24ndCBpc3N1ZSBhbnkgc2lnbmFs
Lgo+ICAgICAoVGhpcyBvbmx5IG9jY3VycyBkdXJpbmcgcmFwaWQgY29uc2VjdXRpdmUgSTJDIHRy
YW5zZmVycy4KPiAgICAgVGhhdCBleHBsYWlucyB3aHkgdGhlIGlzc3VlIG9ubHkgc2hvd3MgdXAg
d2l0aCBpMmNkZXRlY3QuKQo+Cj4gV2l0aCB0aGVzZSB0d28gZml4ZXMsIGkyYyBkZXZpY2UgZGV0
ZWN0aW9uIG5vdyBmdW5jdGlvbnMgY29ycmVjdGx5IG9uIHRoZSBLMSBTb0MuCj4KPiBGaXhlczog
NWVhNTU4NDczZmEzMSAoImkyYzogc3BhY2VtaXQ6IGFkZCBzdXBwb3J0IGZvciBTcGFjZW1pVCBL
MSBTb0MiKQo+IFRlc3RlZC1ieTogQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0
Pgo+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3Bh
Y2VtaXQuY29tPgo+IC0tLQo+IENoYW5nZWxvZyBpbiB2MjoKPiAtIGhhbmRsZSBBTEQgYW5kIEJF
RCBlcnJvcnMgc2VwYXJhdGVseSBpbiBzcGFjZW1pdF9pMmNfaGFuZGxlX2VycigpCj4gLSBtb3Zl
IGNsZWFyX2ludF9zdGF0dXMoKSBhYm92ZSBzcGFjZW1pdF9pMmNfaW5pdCgpCj4gLSBtb3ZlIGNs
ZWFyX2ludF9zdGF0dXMoKSBmcm9tIHhmZXIoKSBpbnRvIHNwYWNlbWl0X2kyY19pbml0KCkKPiAt
IExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTEwMy1maXgtazEt
ZGV0ZWN0LWZhaWx1cmUtdjEtMS1iYjA3YThkN2RlN2NAbGludXguc3BhY2VtaXQuY29tLwo+IC0t
LQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1rMS5jIHwgMTkgKysrKysrKysrKysrKy0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1rMS5jIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1rMS5jCj4gaW5kZXggNmI5MTg3NzBlNjEyZTA5OGI4YWQxNzQxOGY0MjBkODdj
OTRkZjE2Ni4uZDQyYzAzZWY1ZGI1OTg0ZWE4ZTA2YjNkN2ViNDg1YjRmODk5ZTYxNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMKPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWsxLmMKPiBAQCAtMTU4LDExICsxNTgsMTYgQEAgc3RhdGljIGludCBzcGFjZW1p
dF9pMmNfaGFuZGxlX2VycihzdHJ1Y3Qgc3BhY2VtaXRfaTJjX2RldiAqaTJjKQo+ICAgewo+ICAg
CWRldl9kYmcoaTJjLT5kZXYsICJpMmMgZXJyb3Igc3RhdHVzOiAweCUwOHhcbiIsIGkyYy0+c3Rh
dHVzKTsKPiAgIAo+IC0JaWYgKGkyYy0+c3RhdHVzICYgKFNQQUNFTUlUX1NSX0JFRCB8IFNQQUNF
TUlUX1NSX0FMRCkpIHsKPiArCS8qIEFyYml0cmF0aW9uIExvc3MgRGV0ZWN0ZWQgKi8KPiArCWlm
IChpMmMtPnN0YXR1cyAmIFNQQUNFTUlUX1NSX0FMRCkgewo+ICAgCQlzcGFjZW1pdF9pMmNfcmVz
ZXQoaTJjKTsKPiAgIAkJcmV0dXJuIC1FQUdBSU47Cj4gICAJfQo+ICAgCj4gKwkvKiBCdXMgRXJy
b3IgTm8gQUNLL05BSyAqLwo+ICsJaWYgKGkyYy0+c3RhdHVzICYgU1BBQ0VNSVRfU1JfQkVEKQo+
ICsJCXNwYWNlbWl0X2kyY19yZXNldChpMmMpOwo+ICsKPiAgIAlyZXR1cm4gaTJjLT5zdGF0dXMg
JiBTUEFDRU1JVF9TUl9BQ0tOQUsgPyAtRU5YSU8gOiAtRUlPOwo+ICAgfQo+ICAgCj4gQEAgLTIy
NCw2ICsyMjksMTIgQEAgc3RhdGljIHZvaWQgc3BhY2VtaXRfaTJjX2NoZWNrX2J1c19yZWxlYXNl
KHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMpCj4gICAJfQo+ICAgfQo+ICAgCj4gK3N0YXRp
YyBpbmxpbmUgdm9pZAo+ICtzcGFjZW1pdF9pMmNfY2xlYXJfaW50X3N0YXR1cyhzdHJ1Y3Qgc3Bh
Y2VtaXRfaTJjX2RldiAqaTJjLCB1MzIgbWFzaykKPiArewo+ICsJd3JpdGVsKG1hc2sgJiBTUEFD
RU1JVF9JMkNfSU5UX1NUQVRVU19NQVNLLCBpMmMtPmJhc2UgKyBTUEFDRU1JVF9JU1IpOwo+ICt9
Cj4gKwo+ICAgc3RhdGljIHZvaWQgc3BhY2VtaXRfaTJjX2luaXQoc3RydWN0IHNwYWNlbWl0X2ky
Y19kZXYgKmkyYykKPiAgIHsKPiAgIAl1MzIgdmFsOwo+IEBAIC0yNjcsMTIgKzI3OCw4IEBAIHN0
YXRpYyB2b2lkIHNwYWNlbWl0X2kyY19pbml0KHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMp
Cj4gICAJdmFsID0gcmVhZGwoaTJjLT5iYXNlICsgU1BBQ0VNSVRfSVJDUik7Cj4gICAJdmFsIHw9
IFNQQUNFTUlUX1JDUl9TREFfR0xJVENIX05PRklYOwo+ICAgCXdyaXRlbCh2YWwsIGkyYy0+YmFz
ZSArIFNQQUNFTUlUX0lSQ1IpOwo+IC19Cj4gICAKPiAtc3RhdGljIGlubGluZSB2b2lkCj4gLXNw
YWNlbWl0X2kyY19jbGVhcl9pbnRfc3RhdHVzKHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMs
IHUzMiBtYXNrKQo+IC17Cj4gLQl3cml0ZWwobWFzayAmIFNQQUNFTUlUX0kyQ19JTlRfU1RBVFVT
X01BU0ssIGkyYy0+YmFzZSArIFNQQUNFTUlUX0lTUik7Cj4gKwlzcGFjZW1pdF9pMmNfY2xlYXJf
aW50X3N0YXR1cyhpMmMsIFNQQUNFTUlUX0kyQ19JTlRfU1RBVFVTX01BU0spOwo+ICAgfQo+ICAg
Cj4gICBzdGF0aWMgdm9pZCBzcGFjZW1pdF9pMmNfc3RhcnQoc3RydWN0IHNwYWNlbWl0X2kyY19k
ZXYgKmkyYykKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiA2ZmE5MDQxYjcxNzdmNjc3MTgxN2I5NWU4
M2Y2ZGYxN2IxNDdjOGM2Cj4gY2hhbmdlLWlkOiAyMDI1MTExMy1maXgtazEtZGV0ZWN0LWZhaWx1
cmUtNjM0ODNlNDUxNjhiCgpUZXN0ZWQgc3VjY2Vzc2Z1bGx5IG9uIE9yYW5nZVBpIFJWMi4KClRl
c3RlZC1ieTogTWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1p
dC5jb20+ClRoYW5rcyBhZ2FpbgpNaWNoYWVsLgoKLS0gCk1pY2hhZWwgT3BkZW5hY2tlcgpSb290
IENvbW1pdApZb2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcgY291cnNlIC0g
TGVhcm4gYnkgZG9pbmc6Cmh0dHBzOi8vcm9vdGNvbW1pdC5jb20vdHJhaW5pbmcveW9jdG8vCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
