Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB48DC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 00:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1U7gGRPbmRgqcZ6avUUykIj12iaMY+g4yp/tDkeAsE=; b=CgqFPUGrybZGfhRI/x6lFU7mq0
	5Rewpo8063fReWsjJtlbI89CsZQYjzYaUNhVJXjeoSvlCW+YQ+Xec3XAambeDVwoMLj8hq/on1n0J
	jCsfaR6qKwCJtHe3oIdAx+qI66vshUlEX6rQwNLq19084Sv/ejSRq/J0nNn1WKpdZ7YjljkCTecFX
	B3PatYfps7pP9VpdiODm5qEo0bhE7uH49ZupN2eBLdUx2RWI9zMMiPcj1SlnFLBKHuP0BhGeMNmfO
	OZx6DaFeTnjX0kpeL9H0aTqDXKiPx1QhYqLwe3F05//KYYvd6oxCLwTuPXB1HLT2/G+J+PEo2Fz7A
	EHtMIIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjJd-00A4vw-Pz; Wed, 08 Jun 2022 00:12:53 +0000
Received: from outbound-ss-820.bluehost.com ([69.89.24.241])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjJb-00A4ue-5O
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 00:12:52 +0000
Received: from cmgw12.mail.unifiedlayer.com (unknown [10.0.90.127])
	by progateway2.mail.pro1.eigbox.com (Postfix) with ESMTP id 0DD3210048195
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jun 2022 00:12:49 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id yjJYnOP6OX35IyjJYnACyK; Wed, 08 Jun 2022 00:12:48 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=LPCj/La9 c=1 sm=1 tr=0 ts=629fe981
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=JPEYwPQDsx4A:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=RudyytyL_DxIq4wlthoA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=AjGcO6oz07-iQ99wixmX:22 a=nmWuMzfKamIsx3l42hEX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AFc4b+RBT46WI3QejiWcwvr+sEfKp2r/9zyP6eQJ2qM=; b=oEg/9GyhqVPg4k0DLQciPL3Xkc
	ckOu+Xb2obXE9Wi4V6TbRLgNIrD/lDb1WUXCezHAqDMgkHgOZ+WUeIWd0i75tordp4AGUROc7JQuU
	xoecucEXfTz0Fh0Fz0+Cfxf2gUPuZKIGwMD24zPLOR1jdlYHNcaDKcYyKNSElvy8sidB6KU8Rfqz6
	V+25T79pRabnb6OBcYGjRXC/bweh3t6bXgmeAGPRvOK+T/je97vaqWNVZ2Jux6LvoSy1pfMUoDwds
	lbVTDbUO7S1OTLJSed8qdxh4qKmbIuA5HsG9Utes1OjyRTGgRYIzQokTVE3WzHSSptUMuOHGbWIQ6
	Nyv3h2wA==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:54124 helo=[10.0.1.48])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1nyjJY-002WuX-AZ;
	Tue, 07 Jun 2022 18:12:48 -0600
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
 <d7c8ee82-ce85-5d55-2865-4b610c9d3b9d@w6rz.net> <827324415.0ifERbkFSE@diego>
From: Ron Economos <re@w6rz.net>
Message-ID: <06c46bde-5d3f-9123-93b4-9e0f3824ac3a@w6rz.net>
Date: Tue, 7 Jun 2022 17:12:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <827324415.0ifERbkFSE@diego>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1nyjJY-002WuX-AZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.48]) [73.162.232.9]:54124
X-Source-Auth: re@w6rz.net
X-Email-Count: 3
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_171251_316208_EBE0F87B 
X-CRM114-Status: GOOD (  22.96  )
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

T24gNi83LzIyIDQ6MzYgUE0sIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+IEhpIFJvbiwKPgo+IEFt
IERpZW5zdGFnLCA3LiBKdW5pIDIwMjIsIDIyOjQ2OjUyIENFU1Qgc2NocmllYiBSb24gRWNvbm9t
b3M6Cj4+IE9uIDUvMzEvMjIgMTA6MTMgQU0sIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4gVGhl
IGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA5MjgyZDA5OTY5MzZjNWZiZjg3N2MwZDA5
NmEzZmViNDU2Yzg3OGFkOgo+Pj4KPj4+ICAgICBjc2t5OiBNb3ZlIHRvIGdlbmVyaWMgdGlja2V0
LXNwaW5sb2NrICgyMDIyLTA1LTExIDExOjUwOjE1IC0wNzAwKQo+Pj4KPj4+IGFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Pj4KPj4+ICAgICBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IHRhZ3MvcmlzY3Yt
Zm9yLWxpbnVzLTUuMTktbXcwCj4+Pgo+Pj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDc2OTlmN2FhY2YzZWJmZWU1MWM2NzBiNmY3OTZiMjc5N2YwZjc0ODc6Cj4+Pgo+Pj4gICAgIFJJ
U0MtVjogUHJlcGFyZSBkcm9wcGluZyB3ZWVrIGF0dHJpYnV0ZSBmcm9tIGFyY2hfa2V4ZWNfYXBw
bHlfcmVsb2NhdGlvbnNbX2FkZF0gKDIwMjItMDUtMzAgMTY6MDQ6MzcgLTA3MDApCj4+Pgo+Pj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+Pj4gUklTQy1WIFBhdGNoZXMgZm9yIHRoZSA1LjE5IE1lcmdlIFdpbmRvdywgUGFy
dCAxCj4+Pgo+Pj4gKiBTdXBwb3J0IGZvciB0aGUgU3ZwYm10IGV4dGVuc2lvbiwgd2hpY2ggYWxs
b3dzIG1lbW9yeSBhdHRyaWJ1dGVzIHRvIGJlCj4+PiAgICAgZW5jb2RlZCBpbiBwYWdlcy4KPj4+
Cj4+Pgo+Pj4gSGVpa28gU3R1ZWJuZXIgKDEyKToKPj4+ICAgICAgICAgcmlzY3Y6IGludGVncmF0
ZSBhbHRlcm5hdGl2ZXMgYmV0dGVyIGludG8gdGhlIG1haW4gYXJjaGl0ZWN0dXJlCj4+PiAgICAg
ICAgIHJpc2N2OiBhbGxvdyBkaWZmZXJlbnQgc3RhZ2VzIHdpdGggYWx0ZXJuYXRpdmVzCj4+PiAg
ICAgICAgIHJpc2N2OiBpbXBsZW1lbnQgbW9kdWxlIGFsdGVybmF0aXZlcwo+Pj4gICAgICAgICBy
aXNjdjogaW1wbGVtZW50IEFMVEVSTkFUSVZFXzIgbWFjcm8KPj4+ICAgICAgICAgcmlzY3Y6IGV4
dGVuZCBjb25jYXRlbmF0ZWQgYWx0ZXJuYXRpdmVzLWxpbmVzIHRvIHRoZSBzYW1lIGxlbmd0aAo+
Pj4gICAgICAgICByaXNjdjogcHJldmVudCBjb21wcmVzc2VkIGluc3RydWN0aW9ucyBpbiBhbHRl
cm5hdGl2ZXMKPj4+ICAgICAgICAgcmlzY3Y6IG1vdmUgYm9vdCBhbHRlcm5hdGl2ZXMgdG8gYWZ0
ZXIgZmlsbF9od2NhcAo+Pj4gICAgICAgICByaXNjdjogRml4IGFjY2Vzc2luZyBwZm4gYml0cyBp
biBQVEVzIGZvciBub24tMzJiaXQgdmFyaWFudHMKPj4+ICAgICAgICAgcmlzY3Y6IGFkZCBSSVND
LVYgU3ZwYm10IGV4dGVuc2lvbiBzdXBwb3J0Cj4+PiAgICAgICAgIHJpc2N2OiByZW1vdmUgRklY
TUFQX1BBR0VfSU8gYW5kIGZhbGwgYmFjayB0byBpdHMgZGVmYXVsdCB2YWx1ZQo+Pj4gICAgICAg
ICByaXNjdjogZG9uJ3QgdXNlIGdsb2JhbCBzdGF0aWMgdmFycyB0byBzdG9yZSBhbHRlcm5hdGl2
ZSBkYXRhCj4+PiAgICAgICAgIHJpc2N2OiBhZGQgbWVtb3J5LXR5cGUgZXJyYXRhIGZvciBULUhl
YWQKPj4+Cj4+IEFuIGlzc3VlIHdhcyBmb3VuZCBvbiB0aGUgSGlGaXZlIFVubWF0Y2hlZCB3aXRo
IHRoZSA1LjE5LXJjMSBrZXJuZWwuIFRoZQo+PiBmb2xsb3dpbmcgd2FybmluZyBvY2N1cnMgZHVy
aW5nIGJvb3Q6Cj4+Cj4+IHJpc2N2NjQga2VybmVsOgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IHJpc2N2NjQga2Vy
bmVsOiBXQVJOSU5HOiBNaXNzaW5nIHRoZSBmb2xsb3dpbmcgZXJyYXRhIG1heSBjYXVzZQo+PiBw
b3RlbnRpYWwgaXNzdWVzCj4+IHJpc2N2NjQga2VybmVsOiAgICAgICAgIFNpRml2ZSBFcnJhdGFb
MF06Y2lwLTQ1Mwo+PiByaXNjdjY0IGtlcm5lbDogICAgICAgICBTaUZpdmUgRXJyYXRhWzFdOmNp
cC0xMjAwCj4+IHJpc2N2NjQga2VybmVsOiBQbGVhc2UgZW5hYmxlIHRoZSBjb3JyZXNwb25kaW5n
IEtjb25maWcgdG8gYXBwbHkgdGhlbQo+PiByaXNjdjY0IGtlcm5lbDoKPj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+
PiBJJ3ZlIG1hbnVhbGx5IGJpc2VjdGVkIHRoZSBwcm9ibGVtIHRvIHRoaXMgY29tbWl0Ogo+Pgo+
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvY29tbWl0Lz9pZD1mZjY4OWZkMjFjYjEzMDk4MzA1YmFlM2Y4ZDBjMDA2NWRm
MmUyZmMxCj4gaG1tLCBvbiBmaXJzdCBnbGFuY2UgSSBjYW4ndCByZWFsbHkgc2VlIGhvdyB0aGF0
IHNwZWNpZmljIGNvbW1pdCB3b3VsZAo+IGFmZmVjdCBTaWZpdmUgZXJyYXRhcy4gUGF0Y2hlcyBk
aXJlY3RseSBiZWZvcmUgdGhpcyBvbmUgZGlkIGNoYW5nZQo+IGFsdGVybmF0aXZlIC8gZXJyYXRh
IHRoaW5ncyB0aG91Z2guCj4KPiAoMSkgRnJvbSBsb29raW5nIGF0IHlvdXIgb3V0cHV0LCBpdCBz
ZWVtcyBhdCBsZWFzdCBDT05GSUdfRVJSQVRBX1NJRklWRQo+IGlzIGVuYWJsZWQgYXMgdGhlIGdl
bmVyYWwgc2lmaXZlIGVycmF0YSBjb2RlIGlzIHJ1bm5pbmcsIGJ1dCBhcmUgdGhlCj4gaW5kaXZp
ZHVhbCBlcnJhdGFzIGFsc28gc3RpbGwgZW5hYmxlZCBpbiB5b3VyIGNvbmZpZz8KPiBUaGV5J3Jl
IGRlZmF1bHQ9eSBmb3JldmVyIGFuZCB3ZXJlbid0IHRvdWNoZWQgYnkgdGhlIHN2cGJtdCBzZXJp
ZXMsCj4gYnV0IGl0J2QgYmUgbmljZSB0byBrbm93IGhvdyB0aGUgY29uZmlnIGxvb2tzLCB0byBz
ZWUgaWYgdGhlIEtjb25maWcKPiBzZXR0aW5ncyBhcmUgc3RyYW5nZSBzb21ld2hlcmUKPgo+Cj4g
KDIpIEdvaW5nIGZyb20gdGhlIGxpc3Qgb24KPgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9sb2cvP2g9ZmY2ODlmZDIx
Y2IxMzA5ODMwNWJhZTNmOGQwYzAwNjVkZjJlMmZjMQo+Cj4gY291bGQgeW91IG1heWJlIGNoZWNr
IGlmIGl0J3MgcmVhbGx5IHdvcmtpbmcgd2l0aCB0aGUgcGFyZW50IG9mIHRoZQo+IGNvbW1pdCB5
b3UgZm91bmQuIChpLmUuIHBhdGNoZXMgYmVmb3JlIHRoZSBzdnBibXQgYWRkaXRpb24pLgo+Cj4g
QWxzbyBqdXN0IHRvIGJlIHN1cmUsIGl0IHN0aWxsIHdvcmtzIGNvcnJlY3RseSB3aXRoIDUuMTgs
IHJpZ2h0Pwo+Cj4KPiBUaGFua3MKPiBIZWlrbwo+Cj4KWWVzLCB0aGF0IGNvbW1pdCB3YXMgc3Vy
cHJpc2luZy4gSSBhbHNvIHRob3VnaHQgaXQgd291bGQgaGF2ZSBiZWVuIG9uZSAKb2YgdGhlIHBy
ZXZpb3VzICJhbHRlcm5hdGl2ZXMiIGNvbW1pdHMuIEJ1dCBJIHRlc3RlZCB0aGVtIGFsbCwgYW5k
IHRoZSAKd2FybmluZyBvbmx5IGFwcGVhcnMgd2l0aCB0aGUgImFkZCBSSVNDLVYgU3ZwYm10IGV4
dGVuc2lvbiBzdXBwb3J0IiAKY29tbWl0LiBJbiBvdGhlciB3b3JkcywgImdpdCBjaGVja291dCAx
MDA2MzFiIiB3b3JrcyBmaW5lLCBidXQgImdpdCAKY2hlY2tvdXQgZmY2ODlmZCIgZG9lcyBub3Qu
CgpJIGhhdmUgdGhlc2Ugc2V0dGluZ3MgaW4gbXkgLmNvbmZpZzoKCkNPTkZJR19FUlJBVEFfU0lG
SVZFPXkKQ09ORklHX0VSUkFUQV9TSUZJVkVfQ0lQXzQ1Mz15CkNPTkZJR19FUlJBVEFfU0lGSVZF
X0NJUF8xMjAwPXkKCkNPTkZJR19SSVNDVl9BTFRFUk5BVElWRT15CgpJJ3ZlIHVwbG9hZGVkIHRo
ZSBjb21wbGV0ZSAuY29uZmlnIGZpbGUgaGVyZToKCmh0dHBzOi8vd3d3Lnc2cnoubmV0L2NvbmZp
Zy01LjE5LXJjMQoKSXQncyBiYXNlZCBvbiBhIG1vZGlmaWVkIHZlcnNpb24gb2YgdGhlIFVidW50
dSAyMi4wNCBjb25maWcgZmlsZS4KCkxpbnV4IDUuMTggKGluY2x1ZGluZyA1LjE4LjIpIGlzIGZp
bmUgKHdpdGggdGhlIHNhbWUgLmNvbmZpZykuCgpZb3UgY2FuIGFsc28gZmluZCBtZSBvbiBpcmMu
bGliZXJhLmNoYXQgI3Jpc2N2IHdpdGggbmljayBkcm1wZWcuCgpSb24KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
