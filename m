Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE50C00A5A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 03:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9V0pdwjZhcs6eVYoubiM8kMM7mcYjdvMLTo2jgj0tU=; b=t1LVaChuaYtJId7tCoczgATdeg
	kEO5BPWVQkQ8WzrDsfmq3bgag6o7IApAZvYfMaHMY16QdeZasXe5Q2Kr/o7fEyN5qS/BZIoEtOHR0
	3LJSbVktnFBUrAjMvsYHZuG8u/So3m10U6XsNroj6ifhbfQLeiQaEbHwnOnjyBtsW3AXFgWYAt3Dc
	ujMGmQb9GT1z5kYb3BZ6cn2Cb3INTE2drH29SANDnF/nJ9NkyWpCSlnzqF+AlR9kBaFfA142hp/Zc
	iAuCWZX67iZ35tq0MI6IMaIg+GKZRusUVlMBiSuxr2vyMAQOU8AvrL83ojZT3LWX7y7KTtg3GGzuZ
	Wbg2doQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzJK-00Gmb8-Gb; Wed, 18 Jan 2023 03:40:26 +0000
Received: from alt-proxy28.mail.unifiedlayer.com ([74.220.216.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzJH-00GmZV-GY
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 03:40:25 +0000
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
	by progateway1.mail.pro1.eigbox.com (Postfix) with ESMTP id 055101004F889
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 03:40:19 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id HzJCpXceKm332HzJCp1q1B; Wed, 18 Jan 2023 03:40:18 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=AuArYMxP c=1 sm=1 tr=0 ts=63c76a23
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=RvmDmJFTN0MA:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=j6bprNooAAAA:8
 a=VwQbUJbxAAAA:8 a=k-0BSgzrAAAA:8 a=8pif782wAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=KHgYp95wfjvyuvFtNcsA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=ABifrie-J5MA:10:uccc_2email_address a=fS_Hu1hw59wj44055X5l:22
 a=AjGcO6oz07-iQ99wixmX:22 a=IbN6WrKXhHvVD0qv-cjL:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Dsk2ToZt4XFGnIHBNHoAGt4pEqikOVBofH2/6gpFWzY=; b=jLlT9u+B0M91kqLRyWnVxcTLtW
	AqbGlgoWQmgJ1KG0lOLXx2LheAVJlkB3ptUsYFXuz7Nfk/nQOwerSklSmk3tt1IMZGwPzpNrCzwWq
	91T2HFfodRkVM0m0Y3jMGBQRzJ/xVc219Rvui/uq/MXKItZeqmHIlwo66SQMUQSXLlFzyMV2jPQ7m
	hS18U3Z7fQCScfPG5/j87urc/7z68YcTw1PSWRebfN7eyLQHVXxp2sMDe3PUo8aKKTG/WKmqFrbjX
	CrfrUlPfK1bG60r5rL5mCs+DzudAGHjL6IALRGcffGIUFpUqpolDKZqWjFO5anoyBwem0zAG2M2bP
	7SlTCEEw==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:51852 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1pHzJB-002l9E-Tg;
	Tue, 17 Jan 2023 20:40:17 -0700
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
 <c0866553-d1a0-c76f-dea1-db3efceb7129@w6rz.net>
Message-ID: <937b64a0-63b6-680d-9f4f-24cfe36197a8@w6rz.net>
Date: Tue, 17 Jan 2023 19:40:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c0866553-d1a0-c76f-dea1-db3efceb7129@w6rz.net>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1pHzJB-002l9E-Tg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.47]) [73.162.232.9]:51852
X-Source-Auth: re@w6rz.net
X-Email-Count: 7
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_194023_639141_E9003E27 
X-CRM114-Status: GOOD (  27.55  )
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

T24gMS8xNy8yMyA1OjQ2IFBNLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4gT24gMS8xNy8yMyA3OjA4
IEFNLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4+IE9uIDEvMTcvMjMgMTozMiBBTSwgTnlsb24gQ2hl
biB3cm90ZToKPj4+IEhpIENvbm9yLCBKZXNzaWNhCj4+Pgo+Pj4gdGhhbmtzIGZvciB5b3VyIHJl
cGx5Lgo+Pj4KPj4+IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4g5pa8IDIwMjPl
ubQx5pyIMTTml6Ug6YCx5YWtIOS4iuWNiDM6MjTlr6vpgZPvvJoKPj4+PiBPbiAxMyBKYW4gMjAy
MywgYXQgMTg6MzIsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+
ICtDQyBVd2UsIFRoaWVycnksIGxpbnV4LXB3bQo+Pj4+Pgo+Pj4+PiBIZXkgTnlsb24sCj4+Pj4+
Cj4+Pj4+IFBsZWFzZSBydW4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiZWZvcmUgc2VuZGlu
ZyBwYXRjaGVzLCB5b3UgCj4+Pj4+IG1pc3NlZAo+Pj4+PiBib3RoIG1lICYgdGhlIFBXTSBtYWlu
dGFpbmVycyB1bmZvcnR1bmF0ZWx5IQo+Pj4+PiBBRkFJSywgdGhlIFBXTSBtYWludGFpbmVycyB1
c2UgcGF0Y2h3b3JrLCBzbyB5b3Ugd2lsbCBwcm9iYWJseSAKPj4+Pj4gaGF2ZSB0bwo+Pj4+PiBy
ZXNlbmQgdGhpcyBwYXRjaHNldCBzbyB0aGF0IGl0IGlzIG9uIHRoZWlyIHJhZGFyLgo+Pj4+PiBJ
J3ZlIG1hcmtlZCB0aGUgc2VyaWVzIGFzICJDaGFuZ2VzIFJlcXVlc3RlZCIgb24gdGhlIFJJU0Mt
ViBvbmUuCj4+PiBJIGdvdCBpdC4gSSB3aWxsIGJhc2UgaXQgb24gZ2V0X21haW50YWluZXIucGws
IHJlLXNlbnQgaXQuCj4+Pj4+IE9uIEZyaSwgSmFuIDEzLCAyMDIzIGF0IDA0OjMxOjEzUE0gKzA4
MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+PiBBY2NvcmRpbmcgdG8gdGhlIGNpcmN1
aXQgZGlhZ3JhbSBvZiBVc2VyIExFRHMgLSBSR0IgZGVzY3JpYmVkIGluIHRoZQo+Pj4+Pj4gbWFu
dWFsIGhpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGZbMF0uCj4+Pj4+PiBUaGUgYmVo
YXZpb3Igb2YgUFdNIGlzIGFjaXR2ZS1oaWdoLgo+Pj4+Pj4KPj4+Pj4+IEFjY29yZGluZyB0byB0
aGUgZGVzY3JpcHRpb25vZiBQV00gZm9yIHB3bWNtcCBpbiBTaUZpdmUgRlU3NDAtQzAwMAo+Pj4+
Pj4gTWFudWFsWzFdLgo+Pj4+Pj4gVGhlIHB3bSBhbGdvcml0aG0gaXMgKFBXKSBwdWxzZSBhY3Rp
dmUgdGltZcKgID0gKEQpIGR1dHkgKiAoVCkgCj4+Pj4+PiBwZXJpb2RbMl0uCj4+Pj4+PiBUaGUg
YGZyYWNgIHZhcmlhYmxlIGlzIHB1bHNlICJpbmFjdGl2ZSIgdGltZSBzbyB3ZSBuZWVkIHRvIGlu
dmVydCAKPj4+Pj4+IGl0Lgo+Pj4+Pj4KPj4+Pj4+IFNvIHRoaXMgcGF0Y2hzZXQgcmVtb3ZlcyBh
Y3RpdmUtbG93IGluIERUUyBhbmQgYWRkcyByZXZlcnNlIGxvZ2ljIHRvCj4+Pj4+PiB0aGUgZHJp
dmVyLgo+Pj4+Pj4KPj4+Pj4+IFswXTpodHRwczovL3NpZml2ZS1jaGluYS5vc3MtY24temhhbmdq
aWFrb3UuYWxpeXVuY3MuY29tL0hpRkl2ZSUyMFVubWF0Y2hlZC9oaWZpdmUtdW5tYXRjaGVkLXNj
aGVtYXRpY3MtdjMucGRmIAo+Pj4+Pj4KPj4+Pj4+IFsxXTpodHRwczovL3NpZml2ZS1jaGluYS5v
c3MtY24temhhbmdqaWFrb3UuYWxpeXVuY3MuY29tL0hpRkl2ZSUyMFVubWF0Y2hlZC9mdTc0MC1j
MDAwLW1hbnVhbC12MXAyLnBkZiAKPj4+Pj4+Cj4+Pj4+PiBbMl06aHR0cHM6Ly9lbi53aWtpcGVk
aWEub3JnL3dpa2kvRHV0eV9jeWNsZQo+Pj4+PiBQbGVhc2UgZGVsZXRlIGxpbmsgMiwgY29udmVy
dCB0aGUgb3RoZXIgdHdvIHRvIHN0YW5kYXJkIExpbms6IHRhZ3MgCj4+Pj4+IGFuZAo+Pj4+PiBw
dXQgdGhpcyBpbmZvcm1hdGlvbiBpbiB0aGUgZHRzIHBhdGNoLiBQb3NzaWJseSBpbnRvIHRoZSBQ
V00gcGF0Y2ggCj4+Pj4+IHRvbywKPj4+Pj4gZGVwZW5kaW5nIG9uIHdoYXQgdGhlIFBXTSBtYWlu
dGFpbmVycyB0aGluay4KPj4+IEkgZ290IGl0LiBJIHdpbGwgZml4IGl0Lgo+Pj4+PiBUaGlzIGlu
Zm8gc2hvdWxkIGJlIGluIHRoZSBjb21taXQgaGlzdG9yeSBJTU8gYW5kIHRoZSBjb21taXQgCj4+
Pj4+IG1lc3NhZ2UgZm9yCj4+Pj4+IHRoZSBkdHMgcGF0Y2ggc2F5cyB3aGF0J3Mgb2J2aW91cyBm
cm9tIHRoZSBkaWZmIHdpdGhvdXQgYW55IAo+Pj4+PiBleHBsYW5hdGlvbgo+Pj4+PiBhcyB0byB3
aHkuCj4+Pj4+Cj4+Pj4+IEkgZGlkIGEgYml0IG9mIGxvb2tpbmcgYXJvdW5kIG9uIGxvcmUsIHRv
IHNlZSBpZiBJIGNvdWxkIGZpZ3VyZSBvdXQKPj4+Pj4gd2h5IGl0IHdhcyBkb25lIGxpa2UgdGhp
cyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCBJIGZvdW5kOgo+Pj4+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1wd20vQ0FKMl9qT0cyTTAzYUxCZ1VPZ0dqV0g5Q1V4cTJhVEc5N2VTWDcw
PVVhU2JHQ01NRl9nQG1haWwuZ21haWwuY29tLyAKPj4+Pj4KPj4+PiBUaGF0IERUUyBkb2N1bWVu
dGF0aW9uIG1ha2VzIG5vIHNlbnNlIHRvIG1lLCB3aHkgZG9lcyB3aGF0IHRoZSBMRUQgaXMKPj4+
PiB3aXJlZCB0byBtYXR0ZXI/IFdoZXRoZXIgeW91IGhhdmUgeW91ciB0cmFuc2lzdG9yIG5leHQg
dG8gZ3JvdW5kIG9yCj4+Pj4gbmV4dCB0byBWZGQgZG9lc27igJl0IG1hdHRlciwgd2hhdCBtYXR0
ZXJzIGlzIHdoZXRoZXIgdGhlIHRyYW5zaXN0b3IgaXMKPj4+PiBvbiBvciBvZmYuIE1heWJlIHdo
YXQgdGhleSBtZWFuIGlzIHdoZXRoZXIgdGhlICpQV00ncyBvdXRwdXQqIC8gKnRoZQo+Pj4+IHRy
YW5zaXN0b3IncyBpbnB1dCogaXMgcHVsbGVkIHRvIGdyb3VuZCBvciBWZGQ/IEluIHdoaWNoIGNh
c2UgdGhlCj4+Pj4gcHJvcGVydHkgd291bGQgaW5kZWVkIG5vdCBhcHBseSBoZXJlLgo+Pj4+Cj4+
Pj4gVW5sZXNzIHRoYXTigJlzIHdyaXR0ZW4gYXNzdW1pbmcgdGhlIExFRCBpcyB3aXJlZCBkaXJl
Y3RseSB0byB0aGUgCj4+Pj4gUFdNLCBpbgo+Pj4+IHdoaWNoIGNhc2UgaXQgd291bGQgbWFrZSBz
ZW5zZSwgYnV0IHRoYXTigJlzIGEgdmVyeSBuYXJyb3ctbWluZGVkIAo+Pj4+IHZpZXcgb2YKPj4+
PiB3aGF0IHRoZSBQV00gb3V0cHV0IGlzIChkaXJlY3RseSkgZHJpdmluZy4KPj4+Pgo+Pj4+IEpl
c3MKPj4+Pgo+Pj4gVGhpcyBpcyBhIEhpRml2ZSBVbm1hdGNoZWQvVW5sZWFzaGVkIExFRC1QV00g
bGF5b3V0Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZERAo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fX19fCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFzCoMKgwqDCoMKgwqDCoCAvwqDCoCBMRUQKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcwqDCoMKgwqAgLwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLS0KPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBfX19fX18KPj4+IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwKPj4+IMKgwqDCoMKgwqDCoMKgwqAgLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIF7CoMKgwqAgLS0+wqDCoMKgIHwtLS0tLS0g
UFdNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHxfX198X19ffAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdORAo+Pj4KPj4+IC0gdGhl
IHdhdmVmb3JtCj4+PiBlLmcuIGR1dHk9MzBzLCBwZXJpb2Q9MTAwcywgYWN0dmllLWhpZ2ggPSAz
MCUsIGFjdGl2ZS1sb3cgPSA3MCUKPj4+Cj4+PiBWCj4+PiBeCj4+PiB8Cj4+PiB8IC0tLS0tLS0t
LS18Cj4+PiB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4+IHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfAo+Pj4gfF9fX19fXyB8X19fX19fX19fXyA+IHQKPj4+Cj4+PiBXaGVuIFZDQyBp
cyBoaWdoLCB0aGUgTEVEIHdpbGwgYmUgaWxsdW1pbmF0ZWQsIHdoaWNoIGlzIGFuIGFjdGl2ZS1o
aWdoCj4+PiBsb2dpYy4gVGhpcyBpcyB3aHkgd2UgbmVlZCB0byByZW1vdmUgImFjdGl2ZS1sb3ci
Lgo+Pj4KPj4+IFNvLCBhY2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGluZywgVW5sZWFzaGVkJ3Mg
RFRTIHNob3VsZCBhbHNvIHJlbW92ZQo+Pj4gYWN0aXZlLWxvdy4KPj4+Pj4gVGhhdCBkb2Vzbid0
IGV4cGxhaW4gdGhlIGRyaXZlciwgYnV0IGl0IGRvZXMgZXhwbGFpbiB0aGUgZHRzIGJlaW5nIAo+
Pj4+PiB0aGF0Cj4+Pj4+IHdheS4gUGVyaGFwcyBhIEZpeGVzIHRhZyBpcyBhbHNvIGluIG9yZGVy
PyBCdXQgb25seSBpZiBib3RoIAo+Pj4+PiBwYXRjaGVzIGdldAo+Pj4+PiBvbmUsIG90aGVyd2lz
ZSBiYWNrcG9ydGluZyB3b3VsZCBsZWFkIHRvIGJyZWFrYWdlLgo+Pj4+Pgo+Pj4+PiBUaGUgbWlu
KCkgY29uc3RydWN0IGFwcGVhcnMgdG8gaGF2ZSBiZWVuIHRoZXJlIHNpbmNlIHRoZSBSRkMgCj4+
Pj4+IGRyaXZlciB3YXMKPj4+Pj4gZmlyc3QgcG9zdGVkLgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+
Pj4+IENvbm9yLgo+Pj4+Pgo+Pj4+Pj4gTnlsb24gQ2hlbiAoMik6Cj4+Pj4+PiDCoCByaXNjdjog
ZHRzOiBzaWZpdmUgdW5tYXRjaGVkOiBSZW1vdmUgUFdNIGNvbnRyb2xsZWQgTEVEJ3MgCj4+Pj4+
PiBhY3RpdmUtbG93Cj4+Pj4+IG5pdDogcy9zaWZpdmUgdW5tYXRjaGVkOi9zaWZpdmU6IHVubWF0
Y2hlZDovCj4+PiBJIGdvdCBpdC4gSSB3aWxsIGZpeCBpdC4KPj4+Cj4+Pj4+PiDCoMKgwqAgcHJv
cGVydGllcwo+Pj4+Pj4gwqAgcHdtOiBzaWZpdmU6IGNoYW5nZSB0aGUgUFdNIGNvbnRyb2xsZWQg
TEVEIGFsZ29yaXRobQo+Pj4+Pj4KPj4+Pj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDQgLS0tLQo+Pj4+Pj4gZHJpdmVycy9wd20vcHdtLXNp
Zml2ZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMSArCj4+Pj4+PiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0
aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IC0tIAo+Pj4+Pj4gMi4zNi4xCj4+Cj4+IEkndmUgdGVzdGVk
IHRoaXMgcGF0Y2guIEZvciBzb21lIHJlYXNvbiwgdGhlIGhlYXJ0YmVhdCBmdW5jdGlvbiBubyAK
Pj4gbG9uZ2VyIHdvcmtzIGZvciBEMTIuIFRoaXMgaXMgbXkgL2V0Yy91ZGV2L3J1bGVzLmQvOTkt
cHdtLWxlZHMucnVsZXMgCj4+IGZpbGUgY29udGVudHM6Cj4+Cj4+ICMgRDEyIExFRDogaGVhcnRi
ZWF0Cj4+IFNVQlNZU1RFTT09ImxlZHMiLCBLRVJORUw9PSJkMTIiLCBBQ1RJT049PSJhZGQiLCAK
Pj4gQVRUUnt0cmlnZ2VyfT0iaGVhcnRiZWF0Igo+Pgo+PiAjIEQyIFJHQiBMRUQ6IGJvb3Qgc3Rh
dHVzCj4+IFNVQlNZU1RFTT09ImxlZHMiLCBLRVJORUw9PSJkMiIsIEFDVElPTj09ImFkZCIsIAo+
PiBBVFRSe3RyaWdnZXJ9PSJkZWZhdWx0LW9uIiwgQVRUUnttdWx0aV9pbnRlbnNpdHl9PSIyNSAy
NSAyNSIKPj4KPj4gVGhpcyBpcyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmUvbWV0YS1z
aWZpdmUsIGJ1dCBtb2RpZmllZCBmb3IgCj4+IHRoZSBtdWx0aV9pbnRlbnNpdHkgZHJpdmVyIGlu
dHJvZHVjZWQgaW4gTGludXggNi4wLgo+Pgo+IEkndmUgaW5zdHJ1bWVudGVkIHRoaXMgcGF0Y2gg
d2l0aCBzb21lIHByaW50a3MuIFRoZSByZWFzb24gdGhlIAo+IGhlYXJ0YmVhdCBkb2Vzbid0IHdv
cmsgaXMgdGhhdCBzZXR0aW5nIHRoZSBMRURzIHRvIG1heGltdW0gYnJpZ2h0bmVzcyAKPiBjYXVz
ZXMgdGhlIHZhcmlhYmxlICJmcmFjIiB0byBiZSBzZXQgdG8gLTEgaW5zdGVhZCBvZiAwLgo+Cj4g
WW91IGNhbiB0ZXN0IGl0IHdpdGg6Cj4KPiAjIC9iaW4vZWNobyAiMjU1IiA+IC9zeXMvY2xhc3Mv
bGVkcy9kMTIvYnJpZ2h0bmVzcwo+ClNvcnJ5IGZvciB0aGUgbm9pc2UsIEkgZGlkbid0IGFwcGx5
IHRoZSBwYXRjaCBjb3JyZWN0bHkuIEl0IHdvcmtzIGZpbmUuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
