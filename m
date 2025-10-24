Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C75CCCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 05:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btapSVVxcGmY487ldAvjST04yFh0292SSTU7nR9AWwI=; b=vFVTp9DgadHnkVDs2XsXINXuaD
	eKSQgoGGAf+nOcBGpnU0YQqMXJE1kxmLEavVQzBcfEs3g1tUmaTCr9Qmim9eVebXhwabVMnmksSQb
	MGmW56Eot3dezF54Tcxt0jMYWPPaBa5gGg5TNcgkhDvBtW4XZmFlGG2/oqwAcCZseKMPXsAYBZZVj
	3HMF3v1CJFn9l3pgOwzGeTi4PBmzdgnTNio+aHNPoKdMx+T9IG4yzpawURV2RXzhbzyyuylPQ5bc8
	E/2ch/9XGnWFyuZJUAyXpXjR5VVCow/iOZigURg9cayz0bid5XfihAVQM0RMFwSF01NkBjqfz0/+h
	EKPqgeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCATy-00000008Hgp-37c5;
	Fri, 24 Oct 2025 05:36:58 +0000
Received: from olivedrab.birch.relay.mailchannels.net ([23.83.209.135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCATv-00000008HgS-3AFR
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 05:36:57 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9D5977011DA;
	Fri, 24 Oct 2025 05:36:52 +0000 (UTC)
Received: from fr-int-smtpout16.hostinger.io (100-120-36-240.trex-nlb.outbound.svc.cluster.local [100.120.36.240])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B38B37013E2;
	Fri, 24 Oct 2025 05:36:49 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761284212; a=rsa-sha256;
	cv=none;
	b=b/WzV4gfay+Pe9swLXwg1BAeMIWgPdjKg/i/Z86jbeFKZ9ikGMiv2/A5F0I/RGoUSWbaUn
	fmrh69M9kymfHXuL+gMJqyo4K1xPNZK1ktu9BNNM8mI348HX08ZcTzJZ5Sv7Y+1NBiI+2n
	hgoSdL1y/GP90iDz26uRhvOk8oAg55TxQPCjVlcI0Q7c26N/zWZ1Sr2NqHNwWvdpCOG5C5
	dmLGDvCk4cCc+FuFuJmQsbc8EvoFVs9R/YcgrPgG1OUf5Xgj17T/od04pXhAATGEIzjA+1
	IT0TtskMwRUdPA9cVB/w2FhZvYOdsEdTGY3gPrgJqx5q2sOwWuu6UIcfGT/xTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761284212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=m+jmNyQWZBcblKYPZ3ycDCnnIPIWB9tc/exRDbXcZRo=;
	b=vDL2UXdDo9utHFjl85WxPe1uTCS19sNvdUZCH5a7ziNXa6jDiceN37dc/yCxu+ftaqKJW+
	Bt1qmfFB0O8XhHiAiuR8F67sJK3lcnNaMDoLaiz5irTxOSYeIsAlXZVZBeA0JVfnEQBvMM
	7mxaHaEFMbSJNVyLx5dziFnJO4+wj+tG08HiLu0Xy1zsGTnWBjDPJQ0GmY4bFleRplVwt/
	r0QRtDpQc2iAkSg0uFiLftNEfLykukWYaeGqiW+1Aq9W35a2MtLSawNjYUkkUwZ6Mc06Ex
	GHWcOLRWJaY5Q55HaGE3/Y/ETsuDLohO7wOr+YnYVYVw4rvuMOq3sV3vV/xAhA==
ARC-Authentication-Results: i=1;
	rspamd-9799b5d46-qbw44;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Wide-Eyed-Tangy: 4cde82cd0636ecea_1761284212448_955200319
X-MC-Loop-Signature: 1761284212448:4195139562
X-MC-Ingress-Time: 1761284212448
Received: from fr-int-smtpout16.hostinger.io (fr-int-smtpout16.hostinger.io
 [148.222.54.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.36.240 (trex/7.1.3);
	Fri, 24 Oct 2025 05:36:52 +0000
Received: from [IPV6:2001:861:4450:d360:d885:d256:90f4:37e9] (unknown [IPv6:2001:861:4450:d360:d885:d256:90f4:37e9])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ctBV70kGsz1xqt;
	Fri, 24 Oct 2025 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761284208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+jmNyQWZBcblKYPZ3ycDCnnIPIWB9tc/exRDbXcZRo=;
	b=NJoC/nRdeOXSohiI2Wm/8SE37/h+g51k2R7uUj9rzyCdlDAmCMIChCgyzFmW7bj81vcYeB
	xwSsjkXnF2rteunVYMoSpon+Nq1j/Q5Tl2m2Yvn856jfMr5SDZ06slPxF3E4uuDf04mhNK
	aQCsTbaYq5Ul6+JKDMoyUn19UoViiFzJ1Je56U+BhLH1FEiEquxQw1iup6bmS1mrRSdVsA
	zr6yE/QfPrsJCULqUMQGz1s22NUhUZKmvWVfKMiY7yZqVsRgJekkDRfX8c5Cfw2n6K4/vR
	QlcMurkM2YoN3vXt5dJSo47tl1wFc07fmU7kGW7tWmtLpD0JtJpg2hTWtHAoSw==
Message-ID: <5fbb09f4-22e6-4073-a4e5-95165d3dabbb@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <emil.renner.berthing@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
To: Conor Dooley <conor@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
 <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
 <f8a55f89-2612-49e3-88c6-acb523ac74d3@iscas.ac.cn>
 <20251023-lizard-sharpie-70f2a000327f@spud>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251023-lizard-sharpie-70f2a000327f@spud>
Date: Fri, 24 Oct 2025 05:36:47 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=68fb1070 a=ionIEas4mvD8rQvtymOzTQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=7mOBRU54AAAA:8 a=5cO6JjuxQmC9w7LMcdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=wa9RWnbW_A1YIeRBVszw:22
X-CM-Envelope: MS4xfNe+tets3r1BS4pYBmVh6c0twctKSh2zgiakf4nsiN6CqS9OYk6XR0kKjCma2OVyrySVoBx/PLD2Rr+z9wy9LG+U+Bm8+ETzOGcqvzAImfWJ+PyLqT7J QYMBtEEVxeN67cehomKRfQw9QODJGJp3D8FBM83Y58hmW5MhzN8wG2SgKSofzMhdBS19xEuWllYF2JtNOKAb/Wld1v4brM5nV3KQpPpwXKWz6xv3WlyGdjOY mK4SU/Ba+P7PLWvJ/r2UgGRiB2UIuJn9H10QqevjxXGHA7MtpcEVq1kzjNHIKWjZOQs6R3U9Gs856AVcmLjkcLiuhsy1JyTbsOBJ+Ks0fKZJ0TGtt+ra+/RQ iLEQlPc7mSeOKqPnx2kGx7E8fWnt2vNasRt1VcbY4GLURtXMLLNOZnf3XSWGBTegwCBRoldMJl94zsAW9FCz0gPcuPDMcQ352rPu9hGrtEq833sEzOdvf+Qo D6UtkG9fcFiXfMQ6/gEyMbbm9Ve4WQaKTRRJObQE1kieXtVtz5JUbP6kpBrSFGu0uNHpliotLQTwtJ9QI4Ew8Bnv+uNdSv853SSudd2vTsncMbh0BrkHwvqH W2YbH6Nd4cXwkp4M6Es3wKiZAb3DR+xyhZmCzwCO2Cp+pp6fep5xLQ6Ox0/cN37NEOp5skb8HtZxrkUEqnlKIK9XsD2DseUUuloB3xtme69mL6vvE19CIWGG k0iqYRHjCglexxSxaEFIby4Ze9IkZS8Uy4lRJ4xdhu8B1EgZFGFVg4rqX6hEyNC0LTmmjSzt7AGqfn7VQbZ+SMMW8BILNlgjKWYTfewMVQ0CCajSI7SnFw==
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_223656_078889_9E1EC41A 
X-CRM114-Status: GOOD (  16.70  )
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

SGkgQ29ub3IKClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCk9uIDEwLzIzLzI1IDIwOjMwLCBDb25v
ciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMDE6NTg6MjJQTSArMDgw
MCwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+IFRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgcGF0Y2gg
YW5kIHRlc3RpbmcgcmVzdWx0cy4gT25seSBzb21lIG5pdHBpY2tzCj4+IGZvbGxvdy4KPj4KPj4g
T24gMTAvMjMvMjUgMDQ6MTgsIG1pY2hhZWwub3BkZW5hY2tlckByb290Y29tbWl0LmNvbSB3cm90
ZToKPj4+IEZyb206IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rj
b21taXQuY29tPgo+Pj4KPj4+IFRoZSBPcmFuZ2VQaSBSVjIgYm9hcmQgc2hpcHMgdHdvIFJHTUlJ
IGV0aGVybmV0IHBvcnRzLgo+Pj4gRWFjaCBoYXMgYW4gZXh0ZXJuYWwgTW90b3Jjb21tIFlUODUz
MUMgUEhZIGF0dGFjaGVkLCB0aGUgUEhZIHVzZXMgR1BJTwo+Pj4gZm9yIHJlc2V0IHBpbiBjb250
cm9sLgo+Pj4KPj4+IEVuYWJsZSBQRE1BIGZvciB0aGUgU3BhY2VtaVQgSzEtYmFzZWQgU29DIGlu
IHRoZSBPcmFuZ2VQaSBSVjIgYm9hcmQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBP
cGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+Cj4+PiBDQzogRW1p
bCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGdtYWlsLmNvbT4KPj4+IEND
OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KPj4+IENDOiBWaXZpYW4gV2FuZyA8d2FuZ3J1
aWthbmdAaXNjYXMuYWMuY24+Cj4+IEZpcnN0bHksIGl0IGlzIHVzdWFsbHkgc3BlbHQgIkNjOiIs
IHdpdGggb25lIHVwcGVyLWNhc2UgQyBhbmQgb25lCj4+IGxvd2VyLWNhc2UgYy4KPiBJIGRvbid0
IHRoaW5rIHRoaXMgbWF0dGVycyBhdCBhbGwsIHRoZSBnaXQgdG9vbGluZyBhdCBsZWFzdCBkb2Vz
bid0Cj4gY2FyZS4KPgo+PiBTZWNvbmRseSwgIkNjOiIgc2hvdWxkIG5vdCBiZSBuZWNlc3Nhcnkg
aW4gdGhlIHBhdGNoL2NvbW1pdCBtZXNzYWdlLgo+PiAgRnJvbSBEb2N1bWVudGF0aW9uL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdDoKPj4KPj4gIMKgIMKgIElmIGEgcGVyc29uIGhhcyBo
YWQgdGhlIG9wcG9ydHVuaXR5IHRvIGNvbW1lbnQgb24gYSBwYXRjaCwgYnV0IGhhcyBub3QKPj4g
IMKgIMKgIHByb3ZpZGVkIHN1Y2ggY29tbWVudHMsIHlvdSBtYXkgb3B0aW9uYWxseSBhZGQgYSBg
YENjOmBgIHRhZyB0byB0aGUgcGF0Y2guCj4+ICDCoCDCoCBUaGlzIHRhZyBkb2N1bWVudHMgdGhh
dCBwb3RlbnRpYWxseSBpbnRlcmVzdGVkIHBhcnRpZXMgaGF2ZSBiZWVuIGluY2x1ZGVkIGluCj4+
ICDCoCDCoCB0aGUgZGlzY3Vzc2lvbi4KPj4KPj4gSWYgeW91IGxvb2sgdGhyb3VnaCB0aGUgZ2l0
IGxvZ3Mgb2YgTGludXgsIENjIHRhZ3MgYXJlIHJlYWxseSBub3QgYQo+PiByZWd1bGFyIG9jY3Vy
cmVuY2UgZXhjZXB0IHRob3NlIG1hcmtpbmcgcGF0Y2hlcyBhcyBzdWl0YWJsZSBmb3IKPj4gYmFj
a3BvcnRpbmcgdG8gc3RhYmxlLgo+IElmIHBlb3BsZSB3YW50IHRvIGhhbmRsZSBDQyBsaXN0cyBi
eSBwdXR0aW5nIGl0IGluIHRoZSBwYXRjaGVzIChpdCdzCj4gd2hhdCBJIGRvIHdoZW4gSSBoYXZl
IG5vIGNvdmVyIGxldHRlcikganVzdCBwdXQgdGhlbSBhZnRlciB0aGUgLS0tIGxpbmUKPiBhbmQg
Z2l0IHNlbmQtZW1haWwgd2lsbCBzdGlsbCBwaWNrIHRoZSBDQ3MgdXAgYnV0IHRoZXkgd29uJ3Qg
ZW5kIHVwIGluCj4gdGhlIGhpc3RvcnkuCgpPaCB5ZXMsIHRoYXQgd2FzIG15IG1pc3Rha2UuIFRo
ZSBDQ3Mgd2VyZSBuZXZlciBpbnRlbmRlZCB0byBtYWtlIGl0IHRvIAp0aGUgZmluYWwgY29tbWl0
cy4KVGhhbmtzIQpNaWNoYWVsLgoKLS0gCk1pY2hhZWwgT3BkZW5hY2tlcgpSb290IENvbW1pdApZ
b2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcgY291cnNlIC0gTGVhcm4gYnkg
ZG9pbmc6Cmh0dHBzOi8vcm9vdGNvbW1pdC5jb20vdHJhaW5pbmcveW9jdG8vCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
