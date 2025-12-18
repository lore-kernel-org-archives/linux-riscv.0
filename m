Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FF0D66BB3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 05:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNBVQZQT/KvwGZXUbEM776gg+3XFuObU72FFM4twQEY=; b=O801Aj2tj2Yqqm2M3flFLwrmGa
	L84cfIeo4IdUjSIw7ONedw+fZY7Ns7kVu+mRoxC/lFyOHzmQQe6ozIpEP7qGSsyCVALXSrLccFmiv
	br4OCc5pMJDxiGwQjWd7c0+iVqUcQ0vHR2TtMyBsozATZSxoVvPYxryTFkkkAxH9gmpWsVU21KfhJ
	a5zhNqz2cryeLBK/PQvMhNzGPh2PnlDbd3alP1lDXI9INb1v1ESOgwhod9iBE/YNRD02knil79DAK
	iCTPk5obDD1GjROwKJfgfCzE6+Kf5BShRIt4qm5LOEaM0HwXzn9eln1yt5fZo7+z8PpdUQOOhCwxd
	q/8K+MgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW6Qx-00000007pgf-0lOJ;
	Thu, 18 Dec 2025 05:20:15 +0000
Received: from fossa.apple.relay.mailchannels.net ([23.83.208.62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW6Qu-00000007pfm-0VQi
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 05:20:13 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 02D81541C30;
	Thu, 18 Dec 2025 05:20:04 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (100-107-170-83.trex-nlb.outbound.svc.cluster.local [100.107.170.83])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1101C5419FD;
	Thu, 18 Dec 2025 05:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766035203;
	b=T6UYayAImNjpUQl9BsKz1aNBgoWJ5myD++IrSEARY9YDwiVDpYDkDhTJCmKZGFeK97nSog
	cfQNZiHGyylqr44XE7frr+ZHGx0JlhlxCM409h7HYKQhGEfVIBBgW9PtER6n/uqdtHDfUI
	P1O+9JaNarsqn6asWeGBDCCm3Rks/Zun3MVcaUC+UTQi3YHqat+k/Z+SkUYp02g8taYS6C
	1SuqdyDFGBlp8aCESYI3ECAFijXKreNQzFvU1wnTEG7raurO6APmI8gtLGkWqjkAW6YLQN
	zMWwJbBQLpxhwdGGO2cJyo5kFOY+Pcl9MDwzTf05IQZuQJgbZHkT6ShPytgNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766035203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=827uBClYHQtcIGgEbq2eIKbC78u/C6gZqrk6W1bQxP8=;
	b=i6yrtwskaQFovGAzY85hXtwes+ovwGduovXX3cMuAypOtBIA8+XFri57ykVX1C9WYEEVst
	yKgcnyf07SQGhXjRmwrq/1DZ4PIlpbV9zPbKjxVCIEQX0TdOz+a1q0eB9EFQcVaq6mnoMH
	WJ7K9qWy3jSCkoI0taY9GAkb8ATd8twaiNRA4Q3ccdjY/VendubrEdtAS+C7aL1uYUZdYn
	HrqPsL3qhM5AEIx1tJ6I5Nv4/GT2buITmCl+o1r02vfIkt4GUnQlDwiIH6vPV3LOMHJu19
	C1jA8m14+ehG0EaPWc3gNjHd13RuYWRpz7AIw/FCbuQDZOMO8eAy/X+Vfb4/zg==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-8qb89;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Good
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Dime-Cold: 7d49361d0c977742_1766035203791_3298572509
X-MC-Loop-Signature: 1766035203791:2481837790
X-MC-Ingress-Time: 1766035203791
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.170.83 (trex/7.1.3);
	Thu, 18 Dec 2025 05:20:03 +0000
Received: from [IPV6:2001:861:4450:d360:6f03:783f:9b5b:57c1] (unknown [IPv6:2001:861:4450:d360:6f03:783f:9b5b:57c1])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWzWM3wgGz13TY;
	Thu, 18 Dec 2025 05:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766035200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=827uBClYHQtcIGgEbq2eIKbC78u/C6gZqrk6W1bQxP8=;
	b=PBLKgBbCEFX2EzhikHtNt6y2EdqLDPsbAHik76tLWxFi8SmT8/OJxYndwZMga48HRCjE+b
	K6yXyLadhEGeIJEYTI8b4F3uqnNeckcuOWzvHE2AE9Q7qeqxhD9Oa84cI/ECkbq+IMGbSZ
	Lk/LaxNjGMa4cWMAYFJYinE1zwlxXMW1rJnvZfpWbSAj6id6CHhQALxuzW1tHBGn1JHP8f
	+hkqSqv/0It2OB71Jb151HI2Hgh9OFfhLp4dFurkPhQSihY/C6l85NpBu2+DQSPNNDyCXd
	GyePc5Wm3AvFkJ/uDPgRSODuhNvLMlpnPYbuZH+5xnJ10zl+AyvszKVvUmHt0A==
Message-ID: <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Iker Pedrosa <ikerpedrosam@gmail.com>,
 Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Johannes Erdfelt <johannes@erdfelt.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
 <20251217221004.GD31109@sventech.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251217221004.GD31109@sventech.com>
Date: Thu, 18 Dec 2025 05:19:59 +0000 (UTC)
X-CM-Envelope: MS4xfO7TNksNoyf3VQXFm04vIjgKg6IL0PmZjlNBIuZWS32Vvksnljtul/xly8xrriIi0qV4X5qST33Eg/OQz/1kr1CGvEDxlqSefmzgQ9V1JDPUivNtAPmo 3cY/oKw1USJDNP+sQHoMbqgBxJNmQqVUS5ENwABZ7NvqTipagGDzx7qe1zHNSgY2gLZnxQK7q5Wm8LjsAWdx/avbDukD3wbiNnkaAQnYf8pIciQHpSDYshQF xZx8mEHm3VevXDuk/d9dOrfDU4uJgb/O8AZYzPd0xqF9mCRQJG92waaVquxLZUCCI18YCQhbHqf00pvKqWseucN2p3sJHsb0xMEQ4o1fE3y9Z038ZYScAK5k ZdJyrERKNNJBfTukJrYOhd8U7X3jJCxs9AuT14mSoPRsA4ZF7CzcOtjDc8XGLNtJh8qSKCslC4ZWf6O6u9fiiku0l4xLbKtgUz5gXedoEFwJkwx8O+XhYQHc DBh/+2AW0rJpMYh5UPDSTRd32dryV/rQnGAxraDi5f0JF+7kSqhgK4EUNsXKWPHa253Sur//GkwvtnRVJV1H+/qaqRIhkWL4VM6y5Gj3MKLcihhWuNYv/7Xw 7+/oQlk62vbmiVnOzyTE+NV5
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=69438f00 a=TJDTwvido1ACHfu3sFfMdQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vugxpd_pAAAA:8 a=VwQbUJbxAAAA:8 a=-Yt9tNsTAAAA:8 a=d70CFdQeAAAA:8 a=ZKHfcdMH9WpjBBK8v7oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=dlIDbnWlQMEhdIxAeUMX:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_212012_524877_E69D2241 
X-CRM114-Status: GOOD (  15.98  )
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

SGkgSm9oYW5uZXMKCk9uIDEyLzE3LzI1IDIzOjEwLCBKb2hhbm5lcyBFcmRmZWx0IHdyb3RlOgo+
IE9uIFdlZCwgRGVjIDE3LCAyMDI1LCBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5h
Y2tlckByb290Y29tbWl0LmNvbT4gd3JvdGU6Cj4+IFdvdywgdGhhdCB3b3VsZCBiZSBhd2Vzb21l
IGluZGVlZCwgYWxsIHRoZSBtb3JlIGFzIG15IHRpbWUgaXMgcXVpdGUgbGltaXRlZC4KPj4gUGxl
YXNlIGRvIQo+PiBJJ2xsIGhhdmUgYSBsb29rIGF0IG90aGVyIGFzcGVjdHMgaWYgSSBjYW4sIGxp
a2UgVVNCIGFuZCBQQ0kgRXhwcmVzcy4KPiBJZiBpdCBoZWxwcywgSSBoYXZlIFBDSWUgd29ya2lu
ZyBvbiBteSBSVjIgYm9hcmQuIEkgYmFzZWQgaXQgb24gdGhlIEJQSQo+IEYzIHBhdGNoZXMgYnV0
IFJWMiBhbHNvIHJlcXVpcmVzIGVuYWJsaW5nIDMuM3YgZm9yIHRoZSBNLjIgc2xvdC4KPgpHcmVh
dCwgcGxlYXNlIHNoYXJlLi4uIEkgbmVlZGVkIHRoaXMgdG9vIG9uIE9yYW5nZSBQaSBSMlMgdG8g
ZW5hYmxlIHRoZSAKdHdvIDIuNSBHYiBFdGhlcm5ldCBsaW5rcyA6KQo+Cj4gSSBoYXZlbid0IGV2
ZXIgc3VibWl0dGVkIGEgRFQgcGF0Y2ggYmVmb3JlLCBidXQgSSdkIGJlIHdpbGxpbmcgdG8gY2xl
YW4KPiB1cCBteSBwYXRjaC4KCgpTaGFyaW5nIGlzIGFsd2F5cyBhIGdyZWF0IG9wcG9ydHVuaXR5
IHRvIGxlYXJuLiBIZXJlIGFyZSBteSByYXcgbm90ZXMgCmFib3V0IHRoZSB0b3BpYzoKCiAgKiBN
b3N0IGltcG9ydGFudGx5LCBydW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIG9uIHlvdXIgcGF0Y2hl
cyBiZWZvcmUKICAgIHNlbmRpbmcgdGhlbQogICogVmVyeSBpbXBvcnRhbnQgdG9vLCBydW4gIm1h
a2UgZHRicyIgYW5kIHRoZW4gIm1ha2UgZHRic19jaGVjayIgdG8KICAgIHZhbGlkYXRlIHlvdXIg
Y2hhbmdlcwogICAgU2VlIGh0dHBzOi8vc3RhdGljLnNjaGVkLmNvbS9ob3N0ZWRfZmlsZXMvb3Nz
amFwYW4yMDI1LzU5L1N0YXR1cyBvZgogICAgRFRTIFZhbGlkYXRpb24gaW4gTGludXggS2VybmVs
IC0gS3J6eXN6dG9mIEtvemxvd3NraSUyQyBRdWFsY29tbSAtCiAgICBPU1NKIDIwMjUucGRmCiAg
ICA8aHR0cHM6Ly9zdGF0aWMuc2NoZWQuY29tL2hvc3RlZF9maWxlcy9vc3NqYXBhbjIwMjUvNTkv
U3RhdHVzJTIwb2YlMjBEVFMlMjBWYWxpZGF0aW9uJTIwaW4lMjBMaW51eCUyMEtlcm5lbCUyMC0l
MjBLcnp5c3p0b2YlMjBLb3psb3dza2klMkMlMjBRdWFsY29tbSUyMC0lMjBPU1NKJTIwMjAyNS5w
ZGY+CiAgICBmb3IgcmVhc29ucyB3aHkuCiAgKiBZb3Ugd29uJ3QgYmUgZW1iYXJyYXNzZWQgaWYg
eW91IGFscmVhZHkgcGFzc2VkIHRoZXNlIGZpcnN0IHR3byBjaGVja3MgOykKICAqCgogICAgRm9s
bG93IHRoZSBEVFMgY29kaW5nIHN0eWxlOgogICAgaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZGV2
aWNldHJlZS9iaW5kaW5ncy9kdHMtY29kaW5nLXN0eWxlLmh0bWwKICAgIC0gTm9kZXMgb24gYW55
IGJ1cyBzaG91bGQgYmUgaW4gYXNjZW5kaW5nIGFkZHJlc3Mgb3JkZXIKICAgIC0gSWYgbm8gYWRk
cmVzcywgb3JkZXIgYWxwaGFudW1lcmljYWxseSBieSBub2RlIG5hbWUKICAgIC0gInN0YXR1cyIg
cmlnaHQgYmVmb3JlIGNoaWxkIG5vZGVzCiAgICAtIHByb3BlcnRpZXMgb2YgdGhlIHNhbWUgdHlw
ZSAobGlrZSBhbGlhc2VzKSBpbiAibmF0dXJhbCIgb3JkZXIgKDEsCiAgICAzLCAxMi4uLikKCiAg
KgoKICAgIERvbid0IGVuYWJsZSBmZWF0dXJlcyBhcyBzdGF0aWMgKGRlZmF1bHQgeSkgaW4gS2Nv
bmZpZywgdW5sZXNzIHlvdQogICAgaGF2ZSBhIHZlcnkgc3Ryb25nIHJlYXNvbi4gT3RoZXJ3aXNl
LCBpdCBtYWtlcyB0aGUga2VybmVsIGJpZ2dlciBmb3IKICAgIGV2ZXJ5b25lIGVsc2UuCgogICoK
CiAgICBXaGVuIHlvdSBzdWJtaXQgZmlyc3QgRFRTIHN1cHBvcnQgZm9yIG9uZSBib2FyZCwgc3Vi
bWl0IHRoZSBEVFMgaW4KICAgIG9uZSBjb21taXQuCiAgICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNTEwMTAtY29uZmlkZXItcmF2ZW4tMGFkN2E4MTBlNWRlQHNwdWQvCgogICogSWYg
c29tZW9uZSByZXBsaWVzICIyIDwgdiIgdG8geW91LCBpdCBtZWFucyAiUGxlYXNlIHNlbmQgdjIi
CiAgKgoKICAgIEluIGNvbW1pdCBtZXNzYWdlcywgZG9uJ3QgY29tbWVudCBvbiB3aGVyZSB0aGUg
RFQgaXMgY29taW5nIGZyb20KICAgIChkZXZpY2UgdHJlZSBpcyBzaW1pbGFyIHRvLi4uKQoKICAq
CgogICAgUmVmZXJlbmNlcyBzaG91bGQgYmUgbGlrZSB0aGlzLCBmb2xsb3dlZCBieSBhIGJsYW5r
IGxpbmUgYmVmb3JlCiAgICAiU2lnbmVkLW9mZi1ieSIKCiAgICBbMV0gaHR0cHM6Ly90aW5rZXIt
Ym9hcmQuYXN1cy5jb20vc2VyaWVzL3Rpbmtlci1ib2FyZC0zLmh0bWwKICAgIFsyXSBodHRwczov
L3Rpbmtlci1ib2FyZC5hc3VzLmNvbS9zZXJpZXMvdGlua2VyLWJvYXJkLTNzLmh0bWwKCiAgKgoK
ICAgIEtlZXAgdHJhY2sgb2YgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieSB0YWdzICh1c2luZyBi
NCB0byBtYW5hZ2UKICAgIHlvdXIgYnJhbmNoIGFuZCBzdWJtaXNzaW9ucyB3aWxsIGhlbHAgdHJl
bWVuZG91c2x5KQogICAgaHR0cHM6Ly9iNC5kb2NzLmtlcm5lbC5vcmcvZW4vbGF0ZXN0LwoKICAq
CgogICAgRXhwbGFpbiBXSFkgeW91J3JlIGRvaW5nIHNvbWV0aGluZyBpbiBhIGNvbW1pdCBtZXNz
YWdlIChLcnp5c3p0b2YKICAgIEtvemxvd3NraSkKCiAgKiBJZiBhbnl0aGluZyBpcyB3cm9uZyBv
ciBjYW4gYmUgaW1wcm92ZWQsIHdlICh0aGUgTGludXgga2VybmVsCiAgICBjb21tdW5pdHkpIHdp
bGwgYmUgZGVsaWdodGVkIHRvIGd1aWRlIHlvdSwgc28gdGhhdCB3ZSBlbmQgdXAgd2l0aAogICAg
c29tZSBjb2RlIHRoYXQncyBlYXN5IGZvciBvdGhlcnMgdG8gbWFpbnRhaW4gYW5kIGV4cGFuZC4K
ICAqIFNwZWNpYWwgZ3JhdGl0dWRlIHRvIEtyenlzenRvZiBLb3psb3dza2kgZm9yIGFsd2F5cyBi
ZWluZyB0aGVyZSB0bwogICAgaGVscMKgIG9uIERUIHBhdGNoZXMgOikKCkknbSBhbHNvIGF2YWls
YWJsZSB0byB0ZXN0IHlvdXIgcGF0Y2hlcywgYXMgSSBoYXZlIEJhbmFuYSBQaSBGMywgT3Jhbmdl
IApQaSBSVjIgYW5kIFIyUy4KCkkgaG9wZSB5b3UgY2FuIGRvIHRoaXMgaW4gdGhlIG5leHQgZGF5
cywgYmVjYXVzZSB0aGVyZSdzIGEgZ3JlYXQgd2luZG93IAppbiB0aGUgbmV4dCBkYXlzIGZvciBj
b250cmlidXRpb24sIHdoZW4gd29yayBzbG93cyBkb3duIGR1cmluZyB0aGUgCmhvbGlkYXlzIDop
ClRoYW5rcyBpbiBhZHZhbmNlCkNoZWVycwpNaWNoYWVsLgoKLS0gCk1pY2hhZWwgT3BkZW5hY2tl
cgpSb290IENvbW1pdApZb2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcgY291
cnNlIC0gTGVhcm4gYnkgZG9pbmc6Cmh0dHBzOi8vcm9vdGNvbW1pdC5jb20vdHJhaW5pbmcveW9j
dG8vCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
