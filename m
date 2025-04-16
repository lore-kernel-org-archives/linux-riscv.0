Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC5BC369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvNEbMJJmd5K41g9nN7RuW18FmAW/rvcyd9/Xnw+x8c=; b=JRDYpL1VAiTBek
	querJVnTVuIcKDVUzS48DwQalE7qfm6AniGJx8iaiCfKPeJJg1yayiNA25JQ96OJeHkeMdwsEMYiN
	6sxNLQboDApFKbKg2s7Obp7D1GfCqSRhGVRBB774fV3UeC6BjtlCdxJX9GZsWAD1I9wQn4Z3Aiu5/
	pKeYvTrLv6io9ID5cOJlJ/TcLgE/+0f9S3VTgNiRQvBO6veX/fQ0AZ+1vOMiGhJdR3pRT/rJ03x0L
	/y8oinKyXVJ4AUWDB2V/6tr1YR0kqnorNhCP9G0jsKdX2fkXNE1B6qbaMLoCnKTdYveHQQe9lPl30
	ANjo1HUCD7vRw4v9aDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u517w-00000009NEB-2z6h;
	Wed, 16 Apr 2025 11:40:24 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u517t-00000009NDX-2jfD
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 11:40:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250416114017euoutp025b8d865a52d76a4b9724ede991ce6940~2yaVnHhG80874908749euoutp02B
	for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 11:40:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250416114017euoutp025b8d865a52d76a4b9724ede991ce6940~2yaVnHhG80874908749euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744803617;
	bh=iOkOVT8MZOfj07enU9xlf2VRxKNwm4FnBqFYN8+mP38=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=H61Hgze5bsWiXUDEhCP9qk7plZqbYybFrRDuOaki+xRNR4tlXnED4xj6My5jnm6Aa
	 EN2k0iBvPt3DGBgD3AEw8lwEXLhDdCnMKAO3En4fQIEJwIMPdypkNWO8Bygn+rTkVw
	 Sin3fLhkR45xM8rrYbFrJQWpS3/7TyFsCET6viqk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250416114017eucas1p214e415a9c51977ab5661c72e5380aabc~2yaVRTdZH0471104711eucas1p2S;
	Wed, 16 Apr 2025 11:40:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.4E.20397.1279FF76; Wed, 16
	Apr 2025 12:40:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250416114016eucas1p1d5d662177196380940a4bbca0a68bb15~2yaUmqB071098910989eucas1p1Q;
	Wed, 16 Apr 2025 11:40:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250416114016eusmtrp21a7c9a3c416a8cc033c5b0ec9bdf518c~2yaUkpMPe1096310963eusmtrp2s;
	Wed, 16 Apr 2025 11:40:16 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-a6-67ff97212e29
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.16.19654.0279FF76; Wed, 16
	Apr 2025 12:40:16 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250416114015eusmtip14313da5dadc3c50b0ad139c80a4d9581~2yaTc4QMD0718907189eusmtip1o;
	Wed, 16 Apr 2025 11:40:15 +0000 (GMT)
Message-ID: <fe445d04-b488-4f11-a14d-9dfda07e3e88@samsung.com>
Date: Wed, 16 Apr 2025 13:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
To: Conor Dooley <conor@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Philipp
	Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt
	Coster <matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250415-tycoon-naming-20ba5a55c469@spud>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGc+69vb1UIZfC5BQWKyxjc8uwoJsn2YbDuO2abJn6D5khcZ3e
	1EZKWQvINuOYMKUIEywIFqHFKB+dFYZtpQ1tJyKt6dahYxX5FIdOq4AM3dBAmeXqxn/P+5zf
	ed/nPTkULqwjYyl5Vg6rypJmJpACwtrz+Nc34qsXZBLDmAh5rp3E0BmHD0MtVUYS3Tv2gET6
	bh8PjVw1Y6jv0RSJzt7q5aM7jm8JdFc3QqLf7CdINFPWDZB1pohEpu5hPmqYthDoVIcdoIOa
	Rh4aHvEQqHiqAEd1D6twtNDZwUe1ky4+Mt+v4CG3KR0VuSqJ90SM428Dwdh0w3ym1PYzYNqN
	GpIZ8neSTP3lrczoYTfGnDv1DVNk6sGYI/MSZsr5O8l8bzYC5pz3a2amfeWWiO2Cd3axmfI8
	VrUm9TPB7tPWQ7zs+3H5+q7MAtCyogSEUZBeBzUltVgJEFBCuhlA/2wPzhUPAXTeLMdDlJCe
	AVCrZZ7f+OOHcR4HNQEYHLtIcsUEgJq2KiJEhdOpcLT4MQhpgn4Z2m4F+ZwfCS8fH19kXqDF
	cHSg5qlPUVF0BjQG9obsaPol2GfSgVBPnB4kYWOxdpHH6Rg4MK7HQpqkU+CNJj0vpMPo9XDW
	dxZwjBgWWmoXV4B0gwB6Dl8ludiboMd8Bed0FAy4zXxOvwgXbFxTSCvhDctfz5h90Fbqfqbf
	hkO+J2QoKE6vhq32NZydBp0H+hfzQzoC9k9EchEi4FFrNc7Z4bD4oJCjE2FVadl/Q33NVqwc
	JOiWPIpuyZK6Jcvo/p9rAIQRxLC5aoWMVa/NYvcmqaUKdW6WLGmnUtEOnv5gb9D9qAM0B6aT
	ugBGgS4AKTwhOty3PigThu+SfvkVq1LuUOVmsuouEEcRCTHhJ13fyYS0TJrD7mHZbFb1/BSj
	wmILMHmnx3p+U+vtmYLESNd+sFr4T6RRMZAbn3fJK5m+rtbvI4/PX7MpN9xZVkfPLUuRvFoZ
	e89SvcfZ9sD14xl9ouXTKx8UReT21ASTxd4G+Zwxdl1cIENEbWDEH15Ku96aN3HEsTmd9X9+
	fiFN0uuqMNTY34xyRDsDfb+k9uK35Yr9a4+aa8vmK5WyYyU7g7Z+w4XZlVK2KcX00Y6MVVu8
	oo0BZdvWQJh9c/b2A/XJRj95aLDeb9C89f7r6fjdyULjcpP24qqKj4V/DsVv7JzDn5h1KfIV
	F5ZP/uTc9u4Jd4V8m9b4SSMUCE6/4isn8kWF+TeHW1iqoewL8UCOoW1wLIFQ75Ymv4ar1NJ/
	ARmwujQwBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsVy+t/xu7oK0/+nGzw6pWVx4voiJos1e88x
	WaycuorN4vW0D2wW84+cY7W4d2kLk8WVr+/ZLNY9vcBu8WJvI4vFy1n32Cwu75rDZvG59wij
	xbbPLWwWa4/cZbdY+HEri8WSHbsYLdo6l7Fa3L13gsWi430Ds8XcL1OZLf7v2cFuMfvdfnaL
	LW8mslocXxtu0bJ/CouDpMfebwtYPHbOusvu0bPzDKPHplWdbB53ru1h85h3MtDjfvdxJo/N
	S+o9WtYeY/Lo/2vg8X7fVTaPvi2rGD02n672+LxJLoAvSs+mKL+0JFUhI7+4xFYp2tDCSM/Q
	0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j6bZ21oI30hXzD+U0MK4U62Lk5JAQMJF4
	vPoJaxcjF4eQwFJGiRct61khEjIS17pfskDYwhJ/rnWxQRS9ZpTYuPciE0iCV8BO4n7HT0YQ
	m0VAVWLn03/sEHFBiZMzn4A1iwrIS9y/NQMozsEhLBAjsepVOUhYREBZ4sraWYwgM5kF7rJJ
	zP75jQliQRuTxPVru8GuYBYQl7j1ZD7YMjYBI4kHy+eDxTkFzCV+nFvHCDKUWUBdYv08IYhy
	eYnmrbOZJzAKzUJyxiwkk2YhdMxC0rGAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYNLZ
	duznlh2MK1991DvEyMTBeIhRgoNZSYT3nPm/dCHelMTKqtSi/Pii0pzU4kOMpsCgmMgsJZqc
	D0x7eSXxhmYGpoYmZpYGppZmxkrivGxXzqcJCaQnlqRmp6YWpBbB9DFxcEo1MPkvPrVvrm/R
	Uns380g9VTeJhKiZZk7VV57NOBN3bqvM6zyvjOTA45dvShoU8D58MuVNbpLHzva9V5gfqt+v
	WiFm0bmTz6bZI+eHmsuVhf8qpmjkGJx4V8V1gbv4ucfe/0nn86w8rdK0P5Vaz2hae3ad7D7b
	L/9ZvL6b7zQK6RDxE/fvuBoiFlJ84u6NRx+2rchX1OAW0YjaPj/txYp6tSe3FnBNy9P1s/iU
	qXVcrbI4dcvVqGW7HDmF3uewt62Ps64RT8mdV7v1xk6N/5pNz+Uf8ifxrIh+/8Hza5DYxjcq
	bjL9x9yyQyet2Oy81fHL5c29c1IrWQ782K7tp6ygabcn1SrljWeG2aGLaVyvlFiKMxINtZiL
	ihMB7u4zXMMDAAA=
X-CMS-MailID: 20250416114016eucas1p1d5d662177196380940a4bbca0a68bb15
X-Msg-Generator: CA
X-RootMTR: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
	<CGME20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948@eucas1p1.samsung.com>
	<20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com>
	<20250415-tycoon-naming-20ba5a55c469@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_044021_956731_D723E295 
X-CRM114-Status: GOOD (  20.58  )
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

CgpPbiA0LzE1LzI1IDE4OjM4LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMTQs
IDIwMjUgYXQgMDg6NTI6NTZQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+IEV4
dGVuZCB0aGUgVEgxNTIwIEFPTiBmaXJtd2FyZSBiaW5kaW5ncyB0byBkZXNjcmliZSB0aGUgR1BV
IGNsa2dlbiByZXNldAo+PiBsaW5lLCByZXF1aXJlZCBmb3IgcHJvcGVyIEdQVSBjbG9jayBhbmQg
cmVzZXQgc2VxdWVuY2luZy4KPj4KPj4gVGhlIFQtSEVBRCBUSDE1MjAgR1BVIHJlcXVpcmVzIGNv
b3JkaW5hdGVkIG1hbmFnZW1lbnQgb2YgdHdvIGNsb2Nrcwo+PiAoY29yZSBhbmQgc3lzKSBhbmQg
dHdvIHJlc2V0cyAoR1BVIGNvcmUgcmVzZXQgYW5kIEdQVSBjbGtnZW4KPj4gcmVzZXQpLiAgT25s
eSB0aGUgY2xrZ2VuIHJlc2V0IGlzIGV4cG9zZWQgYXQgdGhlIEFPTiBsZXZlbCwgdG8gc3VwcG9y
dAo+PiBTb0Mtc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24gaGFuZGxlZCB0aHJvdWdoIGEgZ2VuZXJp
YyBQTSBkb21haW4uIFRoZSBHUFUKPj4gY29yZSByZXNldCByZW1haW5zIGRlc2NyaWJlZCBpbiB0
aGUgR1BVIGRldmljZSBub2RlLCBhcyBmcm9tIHRoZSBHUFUKPj4gZHJpdmVyJ3MgcGVyc3BlY3Rp
dmUsIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgcmVzZXQgbGluZSBbMV0uCj4+Cj4+IFRoaXMgZm9s
bG93cyB1cHN0cmVhbSBtYWludGFpbmVycycgcmVjb21tZW5kYXRpb25zIFsyXSB0byBhYnN0cmFj
dAo+PiBTb0Mgc3BlY2lmaWMgZGV0YWlscyBpbnRvIHRoZSBQTSBkb21haW4gbGF5ZXIgcmF0aGVy
IHRoYW4gZXhwb3NpbmcgdGhlbQo+PiB0byBkcml2ZXJzIGRpcmVjdGx5Lgo+Pgo+PiBbMV0gLSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvODE2ZGI5OWQtNzA4OC00YzFhLWFmMDMtYjlhODI1
YWMwOWRjQGltZ3RlYy5jb20vCj4+IFsyXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8z
OGQ5NjUwZmMxMWE2NzRjOGI2ODlkNmJhYjkzN2FjZkBrZXJuZWwub3JnLwo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+PiAt
LS0KPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24u
eWFtbCAgICAgICAgfCAxMSArKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvdGhlYWQsdGgxNTIwLWFvbi55YW1sCj4+IGluZGV4IGJi
YzE4MzIwMDQwMGRlN2FhZGJiMjFmZWEyMTkxMWY2ZjQyMjdiMDkuLjZlYTMwMjljMjIyZGY5YmE2
ZWE3ZDQyM2I5MmJhMjQ4Y2ZiMDJjYzAgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLnlhbWwKPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1h
b24ueWFtbAo+PiBAQCAtMzIsNiArMzIsMTMgQEAgcHJvcGVydGllczoKPj4gICAgICBpdGVtczoK
Pj4gICAgICAgIC0gY29uc3Q6IGFvbgo+PiAgCj4+ICsgIHJlc2V0czoKPj4gKyAgICBtYXhJdGVt
czogMQo+PiArCj4+ICsgIHJlc2V0LW5hbWVzOgo+PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBj
b25zdDogZ3B1LWNsa2dlbgo+PiArCj4+ICAgICIjcG93ZXItZG9tYWluLWNlbGxzIjoKPj4gICAg
ICBjb25zdDogMQo+PiAgCj4+IEBAIC0zOSw2ICs0Niw4IEBAIHJlcXVpcmVkOgo+PiAgICAtIGNv
bXBhdGlibGUKPj4gICAgLSBtYm94ZXMKPj4gICAgLSBtYm94LW5hbWVzCj4+ICsgIC0gcmVzZXRz
Cj4+ICsgIC0gcmVzZXQtbmFtZXMKPiAKPiBHaXZlbiB0aGVzZSBhcmUgbmV3IHJlcXVpcmVkIHBy
b3BlcnRpZXMsIGhhdmUgeW91IG1hZGUgc3VyZSBpbiB0aGUKPiBkcml2ZXIgdGhhdCB0aGVpciBh
YnNlbmNlIHdpbGwgbm90IGNhdXNlIHByb2JsZW1zIHdpdGggb2xkZXIKPiBkZXZpY2V0cmVlcz8g
SSB0b29rIGEgYnJpZWYgbG9vayBhdCB0aGUgZHJpdmVyLCBhbmQgaXQgX2xvb2tlZF8gbGlrZSB5
b3UKPiB3ZXJlIGZhaWxpbmcgaWYgdGhleSB3ZXJlIG5vdCB0aGVyZT8gSXQgd2FzIGEgYnJpZWYg
bG9vayB0aG91Z2gsIHRiZi4KCkhpIENvbm9yLAoKR29vZCBwb2ludCDigJQgYnV0IGluIHRoaXMg
Y2FzZSwgdGhlIGRldmljZXRyZWVzIGNvbXBhdGlibGUgd2l0aCB0aGUKZHJpdmVyIGhhdmVu4oCZ
dCBiZWVuIG1lcmdlZCB1cHN0cmVhbSB5ZXQuIEluIGZhY3QsIHRoZSBUSDE1MjAgUE0gZG9tYWlu
cwpkcml2ZXIgY3VycmVudGx5IGRvZXNu4oCZdCBldmVuIGNvbXBpbGUgYWdhaW5zdCBtYWlubGlu
ZSwgc2luY2UgdGhlCnJlcXVpcmVkIGNvbW1pdCBbMV0gZGlkbuKAmXQgbWFrZSBpdCBpbnRvIDYu
MTUuCgpUaGF0IHNhaWQsIERyZXcgaGFzIHF1ZXVlZCB0aGUgRFQgY2hhbmdlcyBmb3IgdGhlIG5l
eHQgcmVsZWFzZSBbMl0sIGFuZAp5b3XigJl2ZSBxdWV1ZWQgWzFdLCBzbyBhc3N1bWluZyB0aGlz
IHNlcmllcyBsYW5kcyBpbiA2LjE2LCB0aGVyZSB3b27igJl0IGJlCmFueSBvbGRlciBkZXZpY2V0
cmVlcyB0byBzdXBwb3J0LiBBcyBhIHJlc3VsdCwgSSBoYXZlbuKAmXQgYWRkZWQgYQpmYWxsYmFj
ayBwYXRoIGluIHRoZSBkcml2ZXIgZm9yIG1pc3NpbmcgcHJvcGVydGllcy4KCklmLCBob3dldmVy
IHRoaXMgc2VyaWVzIGRvZXNu4oCZdCBtYWtlIGl0IGluIGZvciA2LjE2LCB0aGVuIHllcyDigJQg
d2XigJlkCm5lZWQgdG8gcmV2aXNpdCB0aGUgZHJpdmVyIGFuZCBhZGQgYSBmYWlsdXJlIHNhZmUg
cGF0aCBmb3IgY2FzZXMgd2hlcmUKdGhlc2UgcHJvcGVydGllcyBhcmVu4oCZdCBwcmVzZW50LgoK
VGhhbmtzLApNaWNoYcWCCgpbMV0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0
MDctc3luZXJneS1zdGFmZi1iMWNlYzkwZmZlNzJAc3B1ZC8KWzJdIC0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL1olMkY2cDZNUURTOFpsUXY1ckB4MS8KCj4gCj4+ICAgIC0gIiNwb3dlci1k
b21haW4tY2VsbHMiCj4+ICAKPj4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiBAQCAt
NDksNSArNTgsNyBAQCBleGFtcGxlczoKPj4gICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aGVhZCx0
aDE1MjAtYW9uIjsKPj4gICAgICAgICAgbWJveGVzID0gPCZtYm94XzkxMHQgMT47Cj4+ICAgICAg
ICAgIG1ib3gtbmFtZXMgPSAiYW9uIjsKPj4gKyAgICAgICAgcmVzZXRzID0gPCZyc3QgMD47Cj4+
ICsgICAgICAgIHJlc2V0LW5hbWVzID0gImdwdS1jbGtnZW4iOwo+PiAgICAgICAgICAjcG93ZXIt
ZG9tYWluLWNlbGxzID0gPDE+Owo+PiAgICAgIH07Cj4+Cj4+IC0tIAo+PiAyLjM0LjEKPj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
