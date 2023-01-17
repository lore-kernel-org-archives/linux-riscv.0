Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E402BC3DA78
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9+v2vwjj6/rBO5hvB+R0iBI1qaxZsIj5h3aOLzxj5M=; b=qQ8HMsJsmzvTVrJGW/Niad3FSN
	5lG9N3oJ+n+kI1GM9K+WtwgA7V4WIywgAzk8aep7Q9xGudYwNZ2LiJqafcYj6A/W5gLEFUTv8jTWo
	DeGOYWDuliwq7ewK7x4jP+T98jZB8fiRiOiYTGsGIRXCKf28eVFPG4wXRIgbXyBqXggtg9xZs4pvD
	rWRexaSuRfUDJXlJgLgsSzezsOIY2JkU8rTm3nK0Uw4Tt2lB6VXIFZj9E2fTijKh6/VNU6mHksFY+
	BD95KtF5FDF0wFsdSVBBY54i2Z8xKryrkHVT25WIpUTe2+FXOXgufr1b/HLpEnF9OjXPKqZi88Wij
	OnaSw0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHnaf-00ElWX-Jk; Tue, 17 Jan 2023 15:09:33 +0000
Received: from alt-proxy28.mail.unifiedlayer.com ([74.220.216.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHnab-00ElOC-7M
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 15:09:31 +0000
Received: from cmgw12.mail.unifiedlayer.com (unknown [10.0.90.127])
	by progateway1.mail.pro1.eigbox.com (Postfix) with ESMTP id 9125C1003F436
	for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 15:09:03 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id HnaApj4XR6FFIHnaApNEMs; Tue, 17 Jan 2023 15:09:03 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=AdV0o1bG c=1 sm=1 tr=0 ts=63c6ba0f
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=RvmDmJFTN0MA:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=j6bprNooAAAA:8
 a=VwQbUJbxAAAA:8 a=k-0BSgzrAAAA:8 a=8pif782wAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=9yQLS_lEidnesFFjoOcA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=ABifrie-J5MA:10:uccc_2email_address a=fS_Hu1hw59wj44055X5l:22
 a=AjGcO6oz07-iQ99wixmX:22 a=IbN6WrKXhHvVD0qv-cjL:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wbZT1gpHALhRw4FFTDIH4R5KGNlIwHFfOmLRykYKWHA=; b=jjt84+iZZHebKJvxUGy0MrLofL
	tGfwysnqduUoDKBUQjVrStTU87S0CDlydewqG0OJmwqQQ/6i+wb02qBANaeIac9+oEzrqLNZ2Hf21
	yPWCQ7cwFxCPrpBIWru1s8W5Hi11YlE+XYmRegNe4Ds2gK4lGGOmKpp4SugYXFgo2pGLKwj3rHooE
	EyMB6d1yxei62ngO9ooDqDm6I2cAFRNgWvDjsbGGHYC0YMMSIl9qS8JqoKfJuCN0mZrh/PB85nsTo
	Vpne+rVxvnuWp/VunSMQpblr7hU1IvvYQWjQsJfw2Yk1VGuB+ds0nsjaj2kjk2L2ggTTo7eHTrc6s
	QraNtfEw==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:51708 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1pHna9-002785-HM;
	Tue, 17 Jan 2023 08:09:01 -0700
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and
 algorithm
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
From: Ron Economos <re@w6rz.net>
Message-ID: <eb1ce3b1-309f-ca1c-f24b-bdbcfa7c494b@w6rz.net>
Date: Tue, 17 Jan 2023 07:08:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk-WJMOc-h9V47CyMQpyXZ5hDrtOPnPE2QKkJKzMhjh+Cg@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1pHna9-002785-HM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.47]) [73.162.232.9]:51708
X-Source-Auth: re@w6rz.net
X-Email-Count: 7
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_070929_423787_1C73AAF9 
X-CRM114-Status: GOOD (  29.57  )
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

T24gMS8xNy8yMyAxOjMyIEFNLCBOeWxvbiBDaGVuIHdyb3RlOgo+IEhpIENvbm9yLCBKZXNzaWNh
Cj4KPiB0aGFua3MgZm9yIHlvdXIgcmVwbHkuCj4KPiBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpy
dGMyNy5jb20+IOaWvCAyMDIz5bm0MeaciDE05pelIOmAseWFrSDkuIrljYgzOjI05a+r6YGT77ya
Cj4+IE9uIDEzIEphbiAyMDIzLCBhdCAxODozMiwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwu
b3JnPiB3cm90ZToKPj4+ICtDQyBVd2UsIFRoaWVycnksIGxpbnV4LXB3bQo+Pj4KPj4+IEhleSBO
eWxvbiwKPj4+Cj4+PiBQbGVhc2UgcnVuIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgYmVmb3Jl
IHNlbmRpbmcgcGF0Y2hlcywgeW91IG1pc3NlZAo+Pj4gYm90aCBtZSAmIHRoZSBQV00gbWFpbnRh
aW5lcnMgdW5mb3J0dW5hdGVseSEKPj4+IEFGQUlLLCB0aGUgUFdNIG1haW50YWluZXJzIHVzZSBw
YXRjaHdvcmssIHNvIHlvdSB3aWxsIHByb2JhYmx5IGhhdmUgdG8KPj4+IHJlc2VuZCB0aGlzIHBh
dGNoc2V0IHNvIHRoYXQgaXQgaXMgb24gdGhlaXIgcmFkYXIuCj4+PiBJJ3ZlIG1hcmtlZCB0aGUg
c2VyaWVzIGFzICJDaGFuZ2VzIFJlcXVlc3RlZCIgb24gdGhlIFJJU0MtViBvbmUuCj4gSSBnb3Qg
aXQuIEkgd2lsbCBiYXNlIGl0IG9uIGdldF9tYWludGFpbmVyLnBsLCByZS1zZW50IGl0Lgo+Pj4g
T24gRnJpLCBKYW4gMTMsIDIwMjMgYXQgMDQ6MzE6MTNQTSArMDgwMCwgTnlsb24gQ2hlbiB3cm90
ZToKPj4+Cj4+Pj4gQWNjb3JkaW5nIHRvIHRoZSBjaXJjdWl0IGRpYWdyYW0gb2YgVXNlciBMRURz
IC0gUkdCIGRlc2NyaWJlZCBpbiB0aGUKPj4+PiBtYW51YWwgaGlmaXZlLXVubWF0Y2hlZC1zY2hl
bWF0aWNzLXYzLnBkZlswXS4KPj4+PiBUaGUgYmVoYXZpb3Igb2YgUFdNIGlzIGFjaXR2ZS1oaWdo
Lgo+Pj4+Cj4+Pj4gQWNjb3JkaW5nIHRvIHRoZSBkZXNjcmlwdGlvbm9mIFBXTSBmb3IgcHdtY21w
IGluIFNpRml2ZSBGVTc0MC1DMDAwCj4+Pj4gTWFudWFsWzFdLgo+Pj4+IFRoZSBwd20gYWxnb3Jp
dGhtIGlzIChQVykgcHVsc2UgYWN0aXZlIHRpbWUgID0gKEQpIGR1dHkgKiAoVCkgcGVyaW9kWzJd
Lgo+Pj4+IFRoZSBgZnJhY2AgdmFyaWFibGUgaXMgcHVsc2UgImluYWN0aXZlIiB0aW1lIHNvIHdl
IG5lZWQgdG8gaW52ZXJ0IGl0Lgo+Pj4+Cj4+Pj4gU28gdGhpcyBwYXRjaHNldCByZW1vdmVzIGFj
dGl2ZS1sb3cgaW4gRFRTIGFuZCBhZGRzIHJldmVyc2UgbG9naWMgdG8KPj4+PiB0aGUgZHJpdmVy
Lgo+Pj4+Cj4+Pj4gWzBdOmh0dHBzOi8vc2lmaXZlLWNoaW5hLm9zcy1jbi16aGFuZ2ppYWtvdS5h
bGl5dW5jcy5jb20vSGlGSXZlJTIwVW5tYXRjaGVkL2hpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGlj
cy12My5wZGYKPj4+PiBbMV06aHR0cHM6Ly9zaWZpdmUtY2hpbmEub3NzLWNuLXpoYW5namlha291
LmFsaXl1bmNzLmNvbS9IaUZJdmUlMjBVbm1hdGNoZWQvZnU3NDAtYzAwMC1tYW51YWwtdjFwMi5w
ZGYKPj4+PiBbMl06aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvRHV0eV9jeWNsZQo+Pj4g
UGxlYXNlIGRlbGV0ZSBsaW5rIDIsIGNvbnZlcnQgdGhlIG90aGVyIHR3byB0byBzdGFuZGFyZCBM
aW5rOiB0YWdzIGFuZAo+Pj4gcHV0IHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGR0cyBwYXRjaC4g
UG9zc2libHkgaW50byB0aGUgUFdNIHBhdGNoIHRvbywKPj4+IGRlcGVuZGluZyBvbiB3aGF0IHRo
ZSBQV00gbWFpbnRhaW5lcnMgdGhpbmsuCj4gSSBnb3QgaXQuIEkgd2lsbCBmaXggaXQuCj4+PiBU
aGlzIGluZm8gc2hvdWxkIGJlIGluIHRoZSBjb21taXQgaGlzdG9yeSBJTU8gYW5kIHRoZSBjb21t
aXQgbWVzc2FnZSBmb3IKPj4+IHRoZSBkdHMgcGF0Y2ggc2F5cyB3aGF0J3Mgb2J2aW91cyBmcm9t
IHRoZSBkaWZmIHdpdGhvdXQgYW55IGV4cGxhbmF0aW9uCj4+PiBhcyB0byB3aHkuCj4+Pgo+Pj4g
SSBkaWQgYSBiaXQgb2YgbG9va2luZyBhcm91bmQgb24gbG9yZSwgdG8gc2VlIGlmIEkgY291bGQg
ZmlndXJlIG91dAo+Pj4gd2h5IGl0IHdhcyBkb25lIGxpa2UgdGhpcyBpbiB0aGUgZmlyc3QgcGxh
Y2UsIGFuZCBJIGZvdW5kOgo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcHdtL0NB
SjJfak9HMk0wM2FMQmdVT2dHaldIOUNVeHEyYVRHOTdlU1g3MD1VYVNiR0NNTUZfZ0BtYWlsLmdt
YWlsLmNvbS8KPj4gVGhhdCBEVFMgZG9jdW1lbnRhdGlvbiBtYWtlcyBubyBzZW5zZSB0byBtZSwg
d2h5IGRvZXMgd2hhdCB0aGUgTEVEIGlzCj4+IHdpcmVkIHRvIG1hdHRlcj8gV2hldGhlciB5b3Ug
aGF2ZSB5b3VyIHRyYW5zaXN0b3IgbmV4dCB0byBncm91bmQgb3IKPj4gbmV4dCB0byBWZGQgZG9l
c27igJl0IG1hdHRlciwgd2hhdCBtYXR0ZXJzIGlzIHdoZXRoZXIgdGhlIHRyYW5zaXN0b3IgaXMK
Pj4gb24gb3Igb2ZmLiBNYXliZSB3aGF0IHRoZXkgbWVhbiBpcyB3aGV0aGVyIHRoZSAqUFdNJ3Mg
b3V0cHV0KiAvICp0aGUKPj4gdHJhbnNpc3RvcidzIGlucHV0KiBpcyBwdWxsZWQgdG8gZ3JvdW5k
IG9yIFZkZD8gSW4gd2hpY2ggY2FzZSB0aGUKPj4gcHJvcGVydHkgd291bGQgaW5kZWVkIG5vdCBh
cHBseSBoZXJlLgo+Pgo+PiBVbmxlc3MgdGhhdOKAmXMgd3JpdHRlbiBhc3N1bWluZyB0aGUgTEVE
IGlzIHdpcmVkIGRpcmVjdGx5IHRvIHRoZSBQV00sIGluCj4+IHdoaWNoIGNhc2UgaXQgd291bGQg
bWFrZSBzZW5zZSwgYnV0IHRoYXTigJlzIGEgdmVyeSBuYXJyb3ctbWluZGVkIHZpZXcgb2YKPj4g
d2hhdCB0aGUgUFdNIG91dHB1dCBpcyAoZGlyZWN0bHkpIGRyaXZpbmcuCj4+Cj4+IEplc3MKPj4K
PiBUaGlzIGlzIGEgSGlGaXZlIFVubWF0Y2hlZC9VbmxlYXNoZWQgTEVELVBXTSBsYXlvdXQKPgo+
ICAgICAgICAgICAgICBWREQKPiAgICAgICAgICAgICAgICAgfAo+ICAgICAgICAgICAgICAgICB8
Cj4gICAgICAgICAgICAgX19fX18KPiAgICAgICAgICAgICBcICAgICAgICAvICAgTEVECj4gICAg
ICAgICAgICAgIFwgICAgIC8KPiAgICAgICAgICAgICAgICAtLS0KPiAgICAgICAgICAgICAgICAg
fAo+ICAgICAgICAgICAgICAgICB8Cj4gICAgICAgICAgICAgICAgIHwKPiAgICAgICAgICAgX19f
X19fCj4gICAgICAgICAgfCAgICAgICAgICAgICAgfAo+ICAgICAgICAgIC0gICAgICAgICAgICAg
fAo+ICAgICAgICAgIF4gICAgLS0+ICAgIHwtLS0tLS0gUFdNCj4gICAgICAgICAgfF9fX3xfX198
Cj4gICAgICAgICAgICAgICAgIHwKPiAgICAgICAgICAgICAgICAgfAo+ICAgICAgICAgICAgICAg
IF9fCj4gICAgICAgICAgICAgICAgIC0KPiAgICAgICAgICAgICAgR05ECj4KPiAtIHRoZSB3YXZl
Zm9ybQo+IGUuZy4gZHV0eT0zMHMsIHBlcmlvZD0xMDBzLCBhY3R2aWUtaGlnaCA9IDMwJSwgYWN0
aXZlLWxvdyA9IDcwJQo+Cj4gVgo+IF4KPiB8Cj4gfCAtLS0tLS0tLS0tfAo+IHwgICAgICAgICAg
ICAgfAo+IHwgICAgICAgICAgICAgfAo+IHxfX19fX18gfF9fX19fX19fX18gPiB0Cj4KPiBXaGVu
IFZDQyBpcyBoaWdoLCB0aGUgTEVEIHdpbGwgYmUgaWxsdW1pbmF0ZWQsIHdoaWNoIGlzIGFuIGFj
dGl2ZS1oaWdoCj4gbG9naWMuIFRoaXMgaXMgd2h5IHdlIG5lZWQgdG8gcmVtb3ZlICJhY3RpdmUt
bG93Ii4KPgo+IFNvLCBhY2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGluZywgVW5sZWFzaGVkJ3Mg
RFRTIHNob3VsZCBhbHNvIHJlbW92ZQo+IGFjdGl2ZS1sb3cuCj4+PiBUaGF0IGRvZXNuJ3QgZXhw
bGFpbiB0aGUgZHJpdmVyLCBidXQgaXQgZG9lcyBleHBsYWluIHRoZSBkdHMgYmVpbmcgdGhhdAo+
Pj4gd2F5LiBQZXJoYXBzIGEgRml4ZXMgdGFnIGlzIGFsc28gaW4gb3JkZXI/IEJ1dCBvbmx5IGlm
IGJvdGggcGF0Y2hlcyBnZXQKPj4+IG9uZSwgb3RoZXJ3aXNlIGJhY2twb3J0aW5nIHdvdWxkIGxl
YWQgdG8gYnJlYWthZ2UuCj4+Pgo+Pj4gVGhlIG1pbigpIGNvbnN0cnVjdCBhcHBlYXJzIHRvIGhh
dmUgYmVlbiB0aGVyZSBzaW5jZSB0aGUgUkZDIGRyaXZlciB3YXMKPj4+IGZpcnN0IHBvc3RlZC4K
Pj4+Cj4+PiBUaGFua3MsCj4+PiBDb25vci4KPj4+Cj4+Pj4gTnlsb24gQ2hlbiAoMik6Cj4+Pj4g
ICByaXNjdjogZHRzOiBzaWZpdmUgdW5tYXRjaGVkOiBSZW1vdmUgUFdNIGNvbnRyb2xsZWQgTEVE
J3MgYWN0aXZlLWxvdwo+Pj4gbml0OiBzL3NpZml2ZSB1bm1hdGNoZWQ6L3NpZml2ZTogdW5tYXRj
aGVkOi8KPiBJIGdvdCBpdC4gSSB3aWxsIGZpeCBpdC4KPgo+Pj4+ICAgICBwcm9wZXJ0aWVzCj4+
Pj4gICBwd206IHNpZml2ZTogY2hhbmdlIHRoZSBQV00gY29udHJvbGxlZCBMRUQgYWxnb3JpdGht
Cj4+Pj4KPj4+PiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEw
MC5kdHMgfCA0IC0tLS0KPj4+PiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxICsKPj4+PiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gLS0KPj4+PiAyLjM2LjEKCkkndmUgdGVzdGVkIHRo
aXMgcGF0Y2guIEZvciBzb21lIHJlYXNvbiwgdGhlIGhlYXJ0YmVhdCBmdW5jdGlvbiBubyAKbG9u
Z2VyIHdvcmtzIGZvciBEMTIuIFRoaXMgaXMgbXkgL2V0Yy91ZGV2L3J1bGVzLmQvOTktcHdtLWxl
ZHMucnVsZXMgCmZpbGUgY29udGVudHM6CgojIEQxMiBMRUQ6IGhlYXJ0YmVhdApTVUJTWVNURU09
PSJsZWRzIiwgS0VSTkVMPT0iZDEyIiwgQUNUSU9OPT0iYWRkIiwgQVRUUnt0cmlnZ2VyfT0iaGVh
cnRiZWF0IgoKIyBEMiBSR0IgTEVEOiBib290IHN0YXR1cwpTVUJTWVNURU09PSJsZWRzIiwgS0VS
TkVMPT0iZDIiLCBBQ1RJT049PSJhZGQiLCAKQVRUUnt0cmlnZ2VyfT0iZGVmYXVsdC1vbiIsIEFU
VFJ7bXVsdGlfaW50ZW5zaXR5fT0iMjUgMjUgMjUiCgpUaGlzIGlzIGZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL3NpZml2ZS9tZXRhLXNpZml2ZSwgYnV0IG1vZGlmaWVkIGZvciB0aGUgCm11bHRpX2lu
dGVuc2l0eSBkcml2ZXIgaW50cm9kdWNlZCBpbiBMaW51eCA2LjAuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
