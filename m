Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34946C00A5A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGhzWfKabqmEPiltvkzHspVuM/ea5wHIwxtJOIqgHlQ=; b=4/1wmPsn4ppj9BekqBAb/xC5Cm
	+kQnI8d+O5ZxMO8U9bgx60y2JX9Ue8W7na/vj4d9JpnrQ0272wrbrTLprJyvAQId4jpUyslchwyi7
	N/mLqTDe4CIFPkldRuW4beUuX/agdHV6khSV54avhA/z28IbUl2i9Yjl3HBMcDUXu9IztKob9h25Y
	LbEkLcHuicln3NnJFs5wXmx67ayis59KTKeRb6DQAVDnE83O20yNK+fOs9v14xEEp6BDlLER1mJap
	pz+FuqsJPGhw9ZeiuhwxTkCr3YhT5MMtySGS13g8/QAd9lGAL1DYoBFNEjI0zq13x1JmSYt58wGhD
	GN/GbBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxYP-00GVDE-Si; Wed, 18 Jan 2023 01:47:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxYO-00GVCz-GX
	for linux-riscv@bombadil.infradead.org; Wed, 18 Jan 2023 01:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=icgEua7ZisqWoh1buhiqS6oOGBZ/RXFOAmFuObwimdY=; b=gM7sUNcXxYIZeh6LoU8ClBUCYY
	sWrsYUl9wBR1WIGomHaa5K74B0BlWXu8cldWYYzojCO0XFipVXmjSmzcqfkpE3hYCruhGIpasBCoM
	LxGAXoyNqEOSUQC5wqc5rdIc12eHzEpffZWXfTNhdAUCMfAEgG5qJwUvIGHRpGy6p+cnt7RleaNpB
	MOilF40wyHl+0Ef5qX1MdPkBcbwKMbgNkLEGwML79PyeAC9hWVc2S2dXo50p1rUoY0NJBTYbZ7hTt
	34z6iyJL780p+Ez3ZeIvfO0dh4BooJ4/4eB0FQD17lOmHhTw5jCE73ogxkUPXc/NFzq2AAMlNN4U7
	P1QXHhWg==;
Received: from outbound-ss-761.bluehost.com ([74.220.211.250])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHxY5-0067XO-1g
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jan 2023 01:47:39 +0000
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
	by progateway8.mail.pro1.eigbox.com (Postfix) with ESMTP id 83CF010043B57
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 01:46:48 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id HxXMpWdGam332HxXMp0rHZ; Wed, 18 Jan 2023 01:46:48 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=AuArYMxP c=1 sm=1 tr=0 ts=63c74f88
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=RvmDmJFTN0MA:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=j6bprNooAAAA:8
 a=VwQbUJbxAAAA:8 a=k-0BSgzrAAAA:8 a=8pif782wAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=fKPdyXKGdRffcDw4d2UA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=ABifrie-J5MA:10:uccc_2email_address a=fS_Hu1hw59wj44055X5l:22
 a=AjGcO6oz07-iQ99wixmX:22 a=IbN6WrKXhHvVD0qv-cjL:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=icgEua7ZisqWoh1buhiqS6oOGBZ/RXFOAmFuObwimdY=; b=zktliHvR59KFTfKEiJBmtH+tGK
	tJOcn0wJcoyO0bcNEVwh05VxHhiROR9HEPdS4UN2ixN5xjUNgw9douYccGMzWu8aV4yjD1GmNt4we
	9gGz3JxJjL0n74OcULqGxpMtNGC+Z3s8KKLsj6gSaUgE2P/ZBjBxO0yZ7AIp77pvPPj9gvI0HLzIs
	HeeiuITEHFK67taZY7t1cv6lJUaE0Z7kfpHWwYZJTsyhWQaC0cPJYUxINnUwp2hr6lAV9ErBJHEcJ
	KSB82gqBgM4oqjn7Wv0aWVvcuNryvV1fqvowheze1k5bGTEDba5xO87RUa4/4IFyH9rPNOimHT559
	8MtjSAgg==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:51822 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1pHxXL-0024Sn-Ft;
	Tue, 17 Jan 2023 18:46:47 -0700
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and
 algorithm
From: Ron Economos <re@w6rz.net>
To: Nylon Chen <nylon.chen@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, nylon7717@gmail.com,
 zong.li@sifive.com, greentime.hu@sifive.com, vincent.chen@sifive.com,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org
References: <20230113083115.2590-1-nylon.chen@sifive.com>
 <Y8GjySjm9OjoZvCF@spud> <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
 <CAHh=Yk-WJMOc-h9V47CyMQpyXZ5hDrtOPnPE2QKkJKzMhjh+Cg@mail.gmail.com>
 <eb1ce3b1-309f-ca1c-f24b-bdbcfa7c494b@w6rz.net>
Message-ID: <c0866553-d1a0-c76f-dea1-db3efceb7129@w6rz.net>
Date: Tue, 17 Jan 2023 17:46:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <eb1ce3b1-309f-ca1c-f24b-bdbcfa7c494b@w6rz.net>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1pHxXL-0024Sn-Ft
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.47]) [73.162.232.9]:51822
X-Source-Auth: re@w6rz.net
X-Email-Count: 7
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_014734_796878_A310DFA6 
X-CRM114-Status: GOOD (  27.05  )
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

T24gMS8xNy8yMyA3OjA4IEFNLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4gT24gMS8xNy8yMyAxOjMy
IEFNLCBOeWxvbiBDaGVuIHdyb3RlOgo+PiBIaSBDb25vciwgSmVzc2ljYQo+Pgo+PiB0aGFua3Mg
Zm9yIHlvdXIgcmVwbHkuCj4+Cj4+IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4g
5pa8IDIwMjPlubQx5pyIMTTml6Ug6YCx5YWtIOS4iuWNiDM6MjTlr6vpgZPvvJoKPj4+IE9uIDEz
IEphbiAyMDIzLCBhdCAxODozMiwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPj4+PiArQ0MgVXdlLCBUaGllcnJ5LCBsaW51eC1wd20KPj4+Pgo+Pj4+IEhleSBOeWxvbiwK
Pj4+Pgo+Pj4+IFBsZWFzZSBydW4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiZWZvcmUgc2Vu
ZGluZyBwYXRjaGVzLCB5b3UgCj4+Pj4gbWlzc2VkCj4+Pj4gYm90aCBtZSAmIHRoZSBQV00gbWFp
bnRhaW5lcnMgdW5mb3J0dW5hdGVseSEKPj4+PiBBRkFJSywgdGhlIFBXTSBtYWludGFpbmVycyB1
c2UgcGF0Y2h3b3JrLCBzbyB5b3Ugd2lsbCBwcm9iYWJseSBoYXZlIHRvCj4+Pj4gcmVzZW5kIHRo
aXMgcGF0Y2hzZXQgc28gdGhhdCBpdCBpcyBvbiB0aGVpciByYWRhci4KPj4+PiBJJ3ZlIG1hcmtl
ZCB0aGUgc2VyaWVzIGFzICJDaGFuZ2VzIFJlcXVlc3RlZCIgb24gdGhlIFJJU0MtViBvbmUuCj4+
IEkgZ290IGl0LiBJIHdpbGwgYmFzZSBpdCBvbiBnZXRfbWFpbnRhaW5lci5wbCwgcmUtc2VudCBp
dC4KPj4+PiBPbiBGcmksIEphbiAxMywgMjAyMyBhdCAwNDozMToxM1BNICswODAwLCBOeWxvbiBD
aGVuIHdyb3RlOgo+Pj4+Cj4+Pj4+IEFjY29yZGluZyB0byB0aGUgY2lyY3VpdCBkaWFncmFtIG9m
IFVzZXIgTEVEcyAtIFJHQiBkZXNjcmliZWQgaW4gdGhlCj4+Pj4+IG1hbnVhbCBoaWZpdmUtdW5t
YXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmWzBdLgo+Pj4+PiBUaGUgYmVoYXZpb3Igb2YgUFdNIGlz
IGFjaXR2ZS1oaWdoLgo+Pj4+Pgo+Pj4+PiBBY2NvcmRpbmcgdG8gdGhlIGRlc2NyaXB0aW9ub2Yg
UFdNIGZvciBwd21jbXAgaW4gU2lGaXZlIEZVNzQwLUMwMDAKPj4+Pj4gTWFudWFsWzFdLgo+Pj4+
PiBUaGUgcHdtIGFsZ29yaXRobSBpcyAoUFcpIHB1bHNlIGFjdGl2ZSB0aW1lwqAgPSAoRCkgZHV0
eSAqIChUKSAKPj4+Pj4gcGVyaW9kWzJdLgo+Pj4+PiBUaGUgYGZyYWNgIHZhcmlhYmxlIGlzIHB1
bHNlICJpbmFjdGl2ZSIgdGltZSBzbyB3ZSBuZWVkIHRvIGludmVydCBpdC4KPj4+Pj4KPj4+Pj4g
U28gdGhpcyBwYXRjaHNldCByZW1vdmVzIGFjdGl2ZS1sb3cgaW4gRFRTIGFuZCBhZGRzIHJldmVy
c2UgbG9naWMgdG8KPj4+Pj4gdGhlIGRyaXZlci4KPj4+Pj4KPj4+Pj4gWzBdOmh0dHBzOi8vc2lm
aXZlLWNoaW5hLm9zcy1jbi16aGFuZ2ppYWtvdS5hbGl5dW5jcy5jb20vSGlGSXZlJTIwVW5tYXRj
aGVkL2hpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGYgCj4+Pj4+Cj4+Pj4+IFsxXTpo
dHRwczovL3NpZml2ZS1jaGluYS5vc3MtY24temhhbmdqaWFrb3UuYWxpeXVuY3MuY29tL0hpRkl2
ZSUyMFVubWF0Y2hlZC9mdTc0MC1jMDAwLW1hbnVhbC12MXAyLnBkZiAKPj4+Pj4KPj4+Pj4gWzJd
Omh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0R1dHlfY3ljbGUKPj4+PiBQbGVhc2UgZGVs
ZXRlIGxpbmsgMiwgY29udmVydCB0aGUgb3RoZXIgdHdvIHRvIHN0YW5kYXJkIExpbms6IHRhZ3Mg
YW5kCj4+Pj4gcHV0IHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGR0cyBwYXRjaC4gUG9zc2libHkg
aW50byB0aGUgUFdNIHBhdGNoIAo+Pj4+IHRvbywKPj4+PiBkZXBlbmRpbmcgb24gd2hhdCB0aGUg
UFdNIG1haW50YWluZXJzIHRoaW5rLgo+PiBJIGdvdCBpdC4gSSB3aWxsIGZpeCBpdC4KPj4+PiBU
aGlzIGluZm8gc2hvdWxkIGJlIGluIHRoZSBjb21taXQgaGlzdG9yeSBJTU8gYW5kIHRoZSBjb21t
aXQgCj4+Pj4gbWVzc2FnZSBmb3IKPj4+PiB0aGUgZHRzIHBhdGNoIHNheXMgd2hhdCdzIG9idmlv
dXMgZnJvbSB0aGUgZGlmZiB3aXRob3V0IGFueSAKPj4+PiBleHBsYW5hdGlvbgo+Pj4+IGFzIHRv
IHdoeS4KPj4+Pgo+Pj4+IEkgZGlkIGEgYml0IG9mIGxvb2tpbmcgYXJvdW5kIG9uIGxvcmUsIHRv
IHNlZSBpZiBJIGNvdWxkIGZpZ3VyZSBvdXQKPj4+PiB3aHkgaXQgd2FzIGRvbmUgbGlrZSB0aGlz
IGluIHRoZSBmaXJzdCBwbGFjZSwgYW5kIEkgZm91bmQ6Cj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcHdtL0NBSjJfak9HMk0wM2FMQmdVT2dHaldIOUNVeHEyYVRHOTdlU1g3MD1V
YVNiR0NNTUZfZ0BtYWlsLmdtYWlsLmNvbS8gCj4+Pj4KPj4+IFRoYXQgRFRTIGRvY3VtZW50YXRp
b24gbWFrZXMgbm8gc2Vuc2UgdG8gbWUsIHdoeSBkb2VzIHdoYXQgdGhlIExFRCBpcwo+Pj4gd2ly
ZWQgdG8gbWF0dGVyPyBXaGV0aGVyIHlvdSBoYXZlIHlvdXIgdHJhbnNpc3RvciBuZXh0IHRvIGdy
b3VuZCBvcgo+Pj4gbmV4dCB0byBWZGQgZG9lc27igJl0IG1hdHRlciwgd2hhdCBtYXR0ZXJzIGlz
IHdoZXRoZXIgdGhlIHRyYW5zaXN0b3IgaXMKPj4+IG9uIG9yIG9mZi4gTWF5YmUgd2hhdCB0aGV5
IG1lYW4gaXMgd2hldGhlciB0aGUgKlBXTSdzIG91dHB1dCogLyAqdGhlCj4+PiB0cmFuc2lzdG9y
J3MgaW5wdXQqIGlzIHB1bGxlZCB0byBncm91bmQgb3IgVmRkPyBJbiB3aGljaCBjYXNlIHRoZQo+
Pj4gcHJvcGVydHkgd291bGQgaW5kZWVkIG5vdCBhcHBseSBoZXJlLgo+Pj4KPj4+IFVubGVzcyB0
aGF04oCZcyB3cml0dGVuIGFzc3VtaW5nIHRoZSBMRUQgaXMgd2lyZWQgZGlyZWN0bHkgdG8gdGhl
IFBXTSwgaW4KPj4+IHdoaWNoIGNhc2UgaXQgd291bGQgbWFrZSBzZW5zZSwgYnV0IHRoYXTigJlz
IGEgdmVyeSBuYXJyb3ctbWluZGVkIHZpZXcgb2YKPj4+IHdoYXQgdGhlIFBXTSBvdXRwdXQgaXMg
KGRpcmVjdGx5KSBkcml2aW5nLgo+Pj4KPj4+IEplc3MKPj4+Cj4+IFRoaXMgaXMgYSBIaUZpdmUg
VW5tYXRjaGVkL1VubGVhc2hlZCBMRUQtUFdNIGxheW91dAo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgVkRECj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19f
X18KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcwqDCoMKgwqDCoMKgwqAgL8KgwqAgTEVECj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcwqDCoMKgwqAgLwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0tLQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgX19fX19fCj4+IMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4gwqDCoMKgwqDCoMKgwqDCoCAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4gwqDCoMKgwqDCoMKgwqDCoCBewqDCoMKgIC0tPsKg
wqDCoCB8LS0tLS0tIFBXTQo+PiDCoMKgwqDCoMKgwqDCoMKgIHxfX198X19ffAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHTkQKPj4KPj4g
LSB0aGUgd2F2ZWZvcm0KPj4gZS5nLiBkdXR5PTMwcywgcGVyaW9kPTEwMHMsIGFjdHZpZS1oaWdo
ID0gMzAlLCBhY3RpdmUtbG93ID0gNzAlCj4+Cj4+IFYKPj4gXgo+PiB8Cj4+IHwgLS0tLS0tLS0t
LXwKPj4gfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IHzCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+PiB8X19fX19fIHxfX19fX19fX19fID4gdAo+Pgo+PiBXaGVuIFZDQyBpcyBoaWdo
LCB0aGUgTEVEIHdpbGwgYmUgaWxsdW1pbmF0ZWQsIHdoaWNoIGlzIGFuIGFjdGl2ZS1oaWdoCj4+
IGxvZ2ljLiBUaGlzIGlzIHdoeSB3ZSBuZWVkIHRvIHJlbW92ZSAiYWN0aXZlLWxvdyIuCj4+Cj4+
IFNvLCBhY2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGluZywgVW5sZWFzaGVkJ3MgRFRTIHNob3Vs
ZCBhbHNvIHJlbW92ZQo+PiBhY3RpdmUtbG93Lgo+Pj4+IFRoYXQgZG9lc24ndCBleHBsYWluIHRo
ZSBkcml2ZXIsIGJ1dCBpdCBkb2VzIGV4cGxhaW4gdGhlIGR0cyBiZWluZyAKPj4+PiB0aGF0Cj4+
Pj4gd2F5LiBQZXJoYXBzIGEgRml4ZXMgdGFnIGlzIGFsc28gaW4gb3JkZXI/IEJ1dCBvbmx5IGlm
IGJvdGggcGF0Y2hlcyAKPj4+PiBnZXQKPj4+PiBvbmUsIG90aGVyd2lzZSBiYWNrcG9ydGluZyB3
b3VsZCBsZWFkIHRvIGJyZWFrYWdlLgo+Pj4+Cj4+Pj4gVGhlIG1pbigpIGNvbnN0cnVjdCBhcHBl
YXJzIHRvIGhhdmUgYmVlbiB0aGVyZSBzaW5jZSB0aGUgUkZDIGRyaXZlciAKPj4+PiB3YXMKPj4+
PiBmaXJzdCBwb3N0ZWQuCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gQ29ub3IuCj4+Pj4KPj4+Pj4g
Tnlsb24gQ2hlbiAoMik6Cj4+Pj4+IMKgIHJpc2N2OiBkdHM6IHNpZml2ZSB1bm1hdGNoZWQ6IFJl
bW92ZSBQV00gY29udHJvbGxlZCBMRUQncyAKPj4+Pj4gYWN0aXZlLWxvdwo+Pj4+IG5pdDogcy9z
aWZpdmUgdW5tYXRjaGVkOi9zaWZpdmU6IHVubWF0Y2hlZDovCj4+IEkgZ290IGl0LiBJIHdpbGwg
Zml4IGl0Lgo+Pgo+Pj4+PiDCoMKgwqAgcHJvcGVydGllcwo+Pj4+PiDCoCBwd206IHNpZml2ZTog
Y2hhbmdlIHRoZSBQV00gY29udHJvbGxlZCBMRUQgYWxnb3JpdGhtCj4+Pj4+Cj4+Pj4+IGFyY2gv
cmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDQgLS0tLQo+
Pj4+PiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4+Pj4gMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gLS0gCj4+Pj4+IDIuMzYu
MQo+Cj4gSSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaC4gRm9yIHNvbWUgcmVhc29uLCB0aGUgaGVhcnRi
ZWF0IGZ1bmN0aW9uIG5vIAo+IGxvbmdlciB3b3JrcyBmb3IgRDEyLiBUaGlzIGlzIG15IC9ldGMv
dWRldi9ydWxlcy5kLzk5LXB3bS1sZWRzLnJ1bGVzIAo+IGZpbGUgY29udGVudHM6Cj4KPiAjIEQx
MiBMRUQ6IGhlYXJ0YmVhdAo+IFNVQlNZU1RFTT09ImxlZHMiLCBLRVJORUw9PSJkMTIiLCBBQ1RJ
T049PSJhZGQiLCAKPiBBVFRSe3RyaWdnZXJ9PSJoZWFydGJlYXQiCj4KPiAjIEQyIFJHQiBMRUQ6
IGJvb3Qgc3RhdHVzCj4gU1VCU1lTVEVNPT0ibGVkcyIsIEtFUk5FTD09ImQyIiwgQUNUSU9OPT0i
YWRkIiwgCj4gQVRUUnt0cmlnZ2VyfT0iZGVmYXVsdC1vbiIsIEFUVFJ7bXVsdGlfaW50ZW5zaXR5
fT0iMjUgMjUgMjUiCj4KPiBUaGlzIGlzIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL3NpZml2ZS9t
ZXRhLXNpZml2ZSwgYnV0IG1vZGlmaWVkIGZvciAKPiB0aGUgbXVsdGlfaW50ZW5zaXR5IGRyaXZl
ciBpbnRyb2R1Y2VkIGluIExpbnV4IDYuMC4KPgpJJ3ZlIGluc3RydW1lbnRlZCB0aGlzIHBhdGNo
IHdpdGggc29tZSBwcmludGtzLiBUaGUgcmVhc29uIHRoZSBoZWFydGJlYXQgCmRvZXNuJ3Qgd29y
ayBpcyB0aGF0IHNldHRpbmcgdGhlIExFRHMgdG8gbWF4aW11bSBicmlnaHRuZXNzIGNhdXNlcyB0
aGUgCnZhcmlhYmxlICJmcmFjIiB0byBiZSBzZXQgdG8gLTEgaW5zdGVhZCBvZiAwLgoKWW91IGNh
biB0ZXN0IGl0IHdpdGg6CgojIC9iaW4vZWNobyAiMjU1IiA+IC9zeXMvY2xhc3MvbGVkcy9kMTIv
YnJpZ2h0bmVzcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
