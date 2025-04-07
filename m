Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E02C369A1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQhFyfKtvGchfx4tODUVL618eedZCgxUmwo9igBE8fg=; b=foj97C+7USkTaL
	EXurLECri82JdIDJ7NaN3k3idBACJVe+FIF41XqQpZfYW0ufnjUax/3HfRELse9n5CvKBgJpUUtnz
	zQoKJpt/4LgQyeXnd0qNzvXbE+NMO+p24lgoqgF2PWa3nb4ZuhajL2ssMKPS+6ZgkP7ClpbFj7+33
	PiZwU01jOeBszF+ItJciFjdAQ7nfWwQFYSYGQ5cGSZbcDWWKzcphTyrQY2AhlADDM+sudDdxpNqNr
	zcpCE0PXHjMdsmvo8emD9e991deinaFePDrXDNOPZZn4Xjawm0hVwipI33A68YShy94sKy0ENylJB
	xuWS0PxpDvmImQxRvp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pMV-00000001D5s-1Iib;
	Mon, 07 Apr 2025 16:30:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oR3-00000000y8Y-0FCZ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 15:30:56 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250407153045euoutp0178e64a427b07fa2f626ec25ff89dcf20~0Ev-DhX2A3224232242euoutp01-
	for <linux-riscv@lists.infradead.org>; Mon,  7 Apr 2025 15:30:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250407153045euoutp0178e64a427b07fa2f626ec25ff89dcf20~0Ev-DhX2A3224232242euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744039845;
	bh=9BJwn0vOy9yNn3qw/uCGoiDM3pU2h+s/V7Z34pEXRKg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oxR1oq0J6B9cuI62mqsNxNAhoctPfuf1Ejxo77Cpwv9b7v9eumbp2qMIJrwvnqHiU
	 GLxhjx3Yao98fp9hQxWsvKUQm7zxcJ5g8xTgZIHet0Exsfp+fsozqqBb7XPOsZPHMA
	 hZZaEZ7LPa2dkTgU64rivvpKJyol6fDpAxlGr9JU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250407153045eucas1p13848b86d799dfe9a1dc8b46f6a994482~0Ev_rcnSk0589105891eucas1p1f;
	Mon,  7 Apr 2025 15:30:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 6E.E4.20821.4AFE3F76; Mon,  7
	Apr 2025 16:30:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250407153044eucas1p18bba34f155a00e71f0206dd1d5fe2a7a~0Ev_L3n_H0589505895eucas1p1o;
	Mon,  7 Apr 2025 15:30:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250407153044eusmtrp237527516d1ec56985d56984a6f1070d3~0Ev_K1g1C2636926369eusmtrp2X;
	Mon,  7 Apr 2025 15:30:44 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-9b-67f3efa4e2d0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.52.19654.4AFE3F76; Mon,  7
	Apr 2025 16:30:44 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250407153043eusmtip164cc046b905ec84519a877f1240e86c0~0Ev9SdbDZ1954519545eusmtip1g;
	Mon,  7 Apr 2025 15:30:43 +0000 (GMT)
Message-ID: <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
Date: Mon, 7 Apr 2025 17:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
To: Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Z/BoQIXKEhL3/q50@x1>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7djPc7pL3n9ON7h+08zi2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOz+Nhzj9Xi8q45bBbbPrewWaw9cpfd
	4uIpV4u7906wWLy83MNs0TaL3+L/nh3sFv+ubWSxaNk/hcVB2OP9jVZ2jzcvX7J4HO74wu5x
	78Q0Vo9NqzrZPDYvqfdoWXuMyaP/r4HH+31X2Tz6tqxi9LjUfJ3d4/MmuQCeKC6blNSczLLU
	In27BK6M47dECuYLVsw8e5qtgfEPbxcjJ4eEgInEgtvvWboYuTiEBFYwSqxYvY4ZwvnCKNE8
	u5UdpEpI4DOjxJ2VyTAdLYuXMEEULWeUaF20CqrjLaPE3YmngGZxcPAK2Ek8nCsL0sAioCKx
	YO8zJhCbV0BQ4uTMJywgtqiAvMT9WzPAFggLhEhsONPGDGKLCChInFtxCWwBs8ByZomFezaA
	FTELiEvcejIfbBCbgJHEg+XzWUFsTgEliYX/WpggauQlmrfOBjtIQuAVp0TnyyusEGe7SNzd
	2AllC0u8Or6FHcKWkfi/E2KohEC+xIOtn5gh7BqJnT3HoWxriTvnfrGBPMYsoCmxfpc+RNhR
	YtLvTWBhCQE+iRtvBSFO4JOYtG06M0SYV6KjTQiiWk1iak8v3NJzK7YxTWBUmoUUKrOQPDkL
	yTOzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZg0T/87/mkH49xXH/UOMTJx
	MB5ilOBgVhLhtTz1KV2INyWxsiq1KD++qDQntfgQozQHi5I476L9relCAumJJanZqakFqUUw
	WSYOTqkGJrme3bFHNrz0W55vFm0wq3rB9GNvPLbPc3m8ZdG6mldzfy79O9Vj5s//rTENSYdX
	X55YpNnxSifPdJf2ty2Keu+ufVcu2Mga2fX878K2hXKtOa8eHOU3vsjCGL5j19yr2y04lm7y
	eDJnl7mGwXaRi1atqslR59K4/dfeusZq+USm8eahnZ/CTXQKeVcZbd814eb26wyPJy03Y9xR
	Zc0SsPyApvl/9divu6LELF8w5T8K96jxqNVZLbfLhjPnY5h3goyx9VuxQ9nXs8+u7rNV2HJ0
	ivL7A+8kc8xOc/2Wb4/evejiVN4ZJZcD94q+7J81Tcz/pMjM38kWrvt5C7ZO/x3w8b3B+wzW
	7D2S4Z81r+UqsRRnJBpqMRcVJwIAox2IGAkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42I5/e/4Xd0l7z+nG7QcE7N4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	uHjK1eLuvRMsFi8v9zBbtM3it/i/Zwe7xb9rG1ksWvZPYXEQ9nh/o5Xd483Llywehzu+sHvc
	OzGN1WPTqk42j81L6j1a1h5j8uj/a+Dxft9VNo++LasYPS41X2f3+LxJLoAnSs+mKL+0JFUh
	I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j+C2RgvmCFTPPnmZr
	YPzD28XIySEhYCLRsngJUxcjF4eQwFJGiZV7b7FCJGQkrnW/ZIGwhSX+XOtigyh6zSix7+46
	oCIODl4BO4mHc2VBalgEVCQW7H3GBGLzCghKnJz5BKxXVEBe4v6tGewgtrBAiMSGM23MILaI
	gILEuRWXwBYzCyxnlnjw6itYQkjgLqPE4+teIDazgLjErSfzwYayCRhJPFg+H+w4TgEliYX/
	WphAbmAWUJdYP08IolxeonnrbOYJjEKzkJwxC8mkWQgds5B0LGBkWcUoklpanJueW2ykV5yY
	W1yal66XnJ+7iRGYJLYd+7llB+PKVx/1DjEycTAeYpTgYFYS4bU89SldiDclsbIqtSg/vqg0
	J7X4EKMpMCgmMkuJJucD01ReSbyhmYGpoYmZpYGppZmxkjgv25XzaUIC6YklqdmpqQWpRTB9
	TBycUg1M2ffOfgtd1jv3iEFK70rmW9n5Zw3n2e2q+TkpVdPj3p/M7xnvT06eKm+tqGkjFm+z
	+aHQNcbMplOdl2QUWf/se3pKYeecDaapupGiCUJVSm0eiQ9dbnoe8325wudWfuqcqvBbhu/E
	evyq//2O+LnRq1tcuanYOSzn4u3Ntn4/V+VGbzttu1DOYGImxyIT+wnbVJbyz5G/UB74LNGh
	/wFvsTojk2pRmvuRi66uT5iuHTXNTu8o6GP+sMo9edvvPFe/Ld8F9Td9+bAyJTtwU+/HFPk9
	/w7JNbi2fbMvYIo21LwZEnb5ioSr6Z+81Mv9yQc7rnumC01VONSwl9PfcFKXScrvlgveBn4H
	ZzAfMlJiKc5INNRiLipOBADznayFmwMAAA==
X-CMS-MailID: 20250407153044eucas1p18bba34f155a00e71f0206dd1d5fe2a7a
X-Msg-Generator: CA
X-RootMTR: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
	<20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_083053_670882_D8C4F7D5 
X-CRM114-Status: GOOD (  23.01  )
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

CgpPbiA0LzUvMjUgMDE6MTYsIERyZXcgRnVzdGluaSB3cm90ZToKPiBPbiBUaHUsIEFwciAwMywg
MjAyNSBhdCAxMTo0NDoyNUFNICswMjAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4gVk8g
Y2xvY2tzIHJlc2lkZSBpbiBhIGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlIGZyb20gdGhlIEFQIGNs
b2NrcyBvbiB0aGUKPj4gVC1IRUFEIFNvQy4gQWRkIHRoZSBkZXZpY2UgdHJlZSBub2RlIG9mIGEg
Y2xvY2stY29udHJvbGxlciB0byBoYW5kbGUKPj4gVk8gYWRkcmVzcyBzcGFjZSBhcyB3ZWxsLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1
bmcuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kg
fCA3ICsrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4+IGluZGV4IDUyNzMzNjQxNzc2NS4uZDRj
YmEwNzEzY2FiIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUy
MC5kdHNpCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPj4g
QEAgLTQ4OSw2ICs0ODksMTMgQEAgY2xrOiBjbG9jay1jb250cm9sbGVyQGZmZWYwMTAwMDAgewo+
PiAgCQkJI2Nsb2NrLWNlbGxzID0gPDE+Owo+PiAgCQl9Owo+PiAgCj4+ICsJCWNsa192bzogY2xv
Y2stY29udHJvbGxlckBmZmVmNTI4MDUwIHsKPj4gKwkJCWNvbXBhdGlibGUgPSAidGhlYWQsdGgx
NTIwLWNsay12byI7Cj4+ICsJCQlyZWcgPSA8MHhmZiAweGVmNTI4MDUwIDB4MCAweGZiMD47Cj4g
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBJdCBpcyBncmVhdCB0byBoYXZlIG1vcmUgb2YgdGhl
IGNsb2NrcyBzdXBwb3J0ZWQKPiB1cHN0cmVhbS4KPiAKPiBUaGUgVEgxNTIwIFN5c3RlbSBVc2Vy
IE1hbnVhbCBzaG93cyAweEZGX0VGNTJfODAwMCBmb3IgVk9fU1VCU1lTIG9uIHBhZ2UKPiAyMDUu
IElzIHRoZXJlIGEgcmVhc29uIHlvdSBkZWNpZGVkIHRvIHVzZSAweEZGX0VGNTJfODA1MCBhcyB0
aGUgYmFzZT8KPiAKPiBJIHNlZSBvbiBwYWdlIDIxMyB0aGF0IHRoZSBmaXJzdCByZWdpc3RlciBm
b3IgVk9fU1VCU1lTIHN0YXJ0cyB3aXRoCj4gVk9TWVNfQ0xLX0dBVEUgYXQgb2Zmc2V0IDB4NTAu
IEkgZmlndXJlIHlvdSBkaWQgdGhpcyB0byBoYXZlIHRoZQo+IENDVV9HQVRFIG1hY3JvcyB1c2Ug
b2Zmc2V0IG9mIDB4MCBpbnN0ZWFkIDB4NTAuCj4gCj4gSSBraW5kIG9mIHRoaW5rIHRoZSByZWcg
cHJvcGVydHkgdXNpbmcgdGhlIGFjdHVhbCBiYXNlIGFkZHJlc3MKPiAoMHhGRl9FRjUyXzgwMDAp
IG1ha2VzIG1vcmUgc2Vuc2UgYXMgdGhhdCdzIGEgY2xvc2VyIG1hdGNoIHRvIHRoZSB0YWJsZXMK
PiBpbiB0aGUgbWFudWFsLiBCdXQgSSBkb24ndCBoYXZlIGEgc3Ryb25nIHByZWZlcmVuY2UgaWYg
eW91IHRoaW5rIHRoaW5rCj4gdXNpbmcgMHhlZjUyODA1MCBtYWtlcyB0aGUgQ0NVX0dBVEUgbWFj
cm9zIGVhc2llciB0byByZWFkLgoKVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQuCgpUaGlzIHdh
cyBkaXNjdXNzZWQgc29tZSB0aW1lIGFnby4gVGhlIG1haW4gaXNzdWUgd2FzIHRoYXQgdGhlIGFk
ZHJlc3MKc3BhY2Ugd2FzIGZyYWdtZW50ZWQgYmV0d2VlbiBjbG9ja3MgYW5kIHJlc2V0cy4gSW5p
dGlhbGx5LCBJIHByb3Bvc2VkCnVzaW5nIHN5c2NvbiBhcyBhIHdheSB0byBhYnN0cmFjdCB0aGlz
LCBidXQgdGhlIGlkZWEgd2Fzbid0IHBhcnRpY3VsYXJseQp3ZWxsIHJlY2VpdmVkLgoKU28gYXQg
dGhlIHN0YXJ0IG9mIHRoZSAweEZGX0VGNTJfODAwMCB0aGVyZSBpcyBhIHJlc2V0IHJlZ2lzdGVy
IEdQVV9SU1RfQ0ZHCkkgbmVlZCBmb3IgcmVzZXR0aW5nIHRoZSBHUFUuCgpGb3IgcmVmZXJlbmNl
LCBoZXJlJ3MgdGhlIGVhcmxpZXIgZGlzY3Vzc2lvbjogWzFdCgpbMV0gLSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMWIwNWIxMWIyYTgyODdjMGZmNGI2YmRkMDc5OTg4Yzcuc2JveWRAa2Vy
bmVsLm9yZy8KClJlZ2FyZHMsCk1pY2hhxYIKCj4gCj4gLURyZXcKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
