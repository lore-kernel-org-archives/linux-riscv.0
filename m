Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A7DE7716D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76zcIeIrjEicuviG3LbtK70fgGEVjGvQuph/W6tiXf4=; b=ukEDFlTjRSqVe7
	KnSFB/dHKN3TXZueb1iv3OqFZeHnIz5AALJOPrcKs3yifrw5gsEavE8ybhHabvBCmJNpalKChY/Ih
	FiQIeutZFgkE8dje+rC/dqQhbiGNfTPhwSiVz/oD9m1GV5na+2wQVp3wGxQa9NnATT+QrZxVzOaqZ
	YwHJO7SdSFHnC9Zu/KQ4I2Y2Fi4xV1KoPTTo72AJ0LSmdDjIWz9gx4aZv1cuucxOWHun8P9CixX12
	0wcQuOlBoGH89Xspy1oBaqqWwVxyQ8U70eZs7AyMBY7YLk/qFuNN0m6M3lqQPd0yo02tSh2FzqYKt
	lF56rGy5O1e1vvZPi3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImuB-0000000CGJM-1UHh;
	Wed, 04 Dec 2024 10:46:51 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImie-0000000CDlt-1ozX
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 10:34:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241204103450euoutp012d4a1015b048fcc9cdad425d12b15276~N8uOZDZsm0341303413euoutp01V
	for <linux-riscv@lists.infradead.org>; Wed,  4 Dec 2024 10:34:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241204103450euoutp012d4a1015b048fcc9cdad425d12b15276~N8uOZDZsm0341303413euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733308490;
	bh=+l4e4Tyx2I1+OfNbhG6k6rLroWYsZg5fA2FLlIaEGO8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Y9oq+kJh1NjEmC3cKfnL87LEyhDPwJlYY36WdYQKcTWseq9ldAwyDAmy2E0v/+3aM
	 aRkIAxhCYk5kGS6rsmx4ZV6ExB56kNi/GHmbQ1K0Di3cY/brn/Uqo6oeCfQTMkf14e
	 c1FtfNQDk7r7D+TXRKTo3d6aIdDaHCfXrOOW99K0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241204103448eucas1p2787f6ba041d5859d798f8a0fe36e5869~N8uL0vWCQ1075110751eucas1p2M;
	Wed,  4 Dec 2024 10:34:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id A0.27.20821.84030576; Wed,  4
	Dec 2024 10:34:48 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241204103447eucas1p1290a8da81821da986015bef31ccf0e3c~N8uLKQQUG1362813628eucas1p1r;
	Wed,  4 Dec 2024 10:34:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241204103447eusmtrp2cae4b6f1f36a5e73397910cd66cdf731~N8uLJMXGw1364613646eusmtrp2t;
	Wed,  4 Dec 2024 10:34:47 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-fe-675030486f50
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 0E.BB.19654.74030576; Wed,  4
	Dec 2024 10:34:47 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241204103446eusmtip11cf57501b24c5ce7d747834870a33315~N8uJ2BqPW0744207442eusmtip1a;
	Wed,  4 Dec 2024 10:34:46 +0000 (GMT)
Message-ID: <17df9341-e299-40bb-81ae-f4c7296d73ac@samsung.com>
Date: Wed, 4 Dec 2024 11:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 13/14] riscv: dts: Introduce power domain node
 with simple-bus compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	frank.binns@imgtec.com, matt.coster@imgtec.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
	jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <9b75bc06-2a28-4c16-8e2b-90f824f7f79f@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGc+693FtK6i6FjRPKhjbqhM0C0y0nmTFKht7plqAzTkjc1oy7
	goNiWnCbOkVgDKEQcBi2FikiswRhfLOWFVlaQhFYmSAgFRA3PqwDS6UaRcFRLm7893s/zvO+
	z5vDw4W/kf68OHkSq5BL48Ukn2hqf2LdzIRGykILCwnUMViKocanagpVtlgxpG2zeqDR3gYM
	3XjoINEvE39S6G7LGQINlF+gUFp7NYns6lES9fTUUMipGvVAfc1FJJrLaQOoaS6dRFVtIxS6
	6GwkUJm+GaCMs5c90PXOCGTvU+EoQ/0Sem7UU2hxoJZAmvutFGqYzvdAlqqPUXprAbHjVcZx
	8zuKmbbbCcac6aKYlkclBGNQj1CMytANmLqKsyQzPGAkmeJr+5jb2RaMqS87zaRXtWOM42o/
	yeQ2VACmN22QYuq7TkR6R/O3xbDxccdYRcj2z/ixw/n51NH+V77uzAlPAQZhFvDkQXorbF5w
	EFmAzxPS5QA6OswYF7gAnC45Q3LBHIAL2iyPF0++r7lEuFlI6wDsnvyEa5oB8GqnGbgLAno7
	TBkswtxM0Ovh5Zw7GJf3htd+Gl9+/DIdCG/bfqTc7EN/Aa3TRuAW8qULCPi4tAV3F3D6VwA7
	ugUc+0HbuHZZiKTfgmM67fJGnkvDJjLSMa4nEKY1anC3EKT/4MNUzf0lD7yl4D04mUtzDnzg
	PUsDxXEAfG7gNCGdCMcaH+Acn4QGlWWF34XD1vllGZwOgtXNIVx6JzTdGMM59TXw5ow3t8Ea
	eK6pcCUtgJkZK5feCM+rcv4bai1vwvKAWL3qKOpVHtWrvKj/n1sCiArgxyYrE2SsMkzOfiVR
	ShOUyXKZ5PPEhDqw9L+7Fi0P9ODCPafEBDAeMAHIw8W+gv1vRMqEghjpN8dZReKniuR4VmkC
	Ih4h9hNsiAlkhbRMmsR+ybJHWcWLKsbz9E/BNGtPHyYLiwcroxxvjxzhRWvG+tcNhn14ULAr
	fMelqFvG2oX5Ge/wLQGS3N3PNMWWouy4U2al0EUaNpTeUYrq19rvnkg2TlHOpLnAlCsx62d2
	NpuGrlQeqXk0tMlLFHqovriosLog9dRj0Lfb1v/zROytzOzyLVZzmmeDLejZ3pI83WuVXnsj
	giW2YP1+L/zJlP5Y42amurd2q8/TqbzFvyt0hz6qfF2Hr0s9f2D6uGzW/2H8NtX7Q3SF9EDZ
	fJ7zr+vmtoN73gyV/+OaDZuM3hQlAnPqD3b5iuS6i++IZ0/WHdaJkgP0feO/72F7vnX5au2t
	o3muH7pmtRE6m3+IM2hATChjpWHBuEIp/RevMK9jTgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsVy+t/xu7ruBgHpBq3XRS1OXF/EZLH19yx2
	izV7zzFZzD9yjtXi3qUtTBZXvr5ns1j39AK7xYu9jSwW11bMZbdoPraezeLlrHtsFufPb2C3
	+Nhzj9Xi8q45bBafe48wWmz73MJmsfbIXXaLhR+3slgs2bGL0aKtcxmrxcVTrhYvL/cwW7TN
	4rf4v2cHu8W/axtZLGa/289useXNRFaL42vDLVr2T2FxkPV4f6OV3ePNy5csHoc7vrB77P22
	gMVj56y77B49O88wemxa1cnmcefaHjaPeScDPe53H2fy2Lyk3qNl7TEmj/f7rrJ59G1Zxehx
	qfk6u8fm09UBglF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZll
	qUX6dgl6GXcmTmQvuCpWcarXqYFxp1AXIyeHhICJRPuGxSxdjFwcQgJLGSW+PvrCBJGQkbjW
	/ZIFwhaW+HOtiw2i6DWjxI5pjWAJXgE7iYbrc8AaWARUJJb1PmSCiAtKnJz5BKxGVEBe4v6t
	GewgtrBAmsT0LW+YQAaJCExhkVj96B8ziMMssJ1RYsPMqYwQK/4xSrw6uooNpIVZQFzi1pP5
	YGPZBIwkHiyfzwpicwKtftrWAhTnAKpRl1g/TwiiXF6ieets5gmMQrOQHDILyaRZCB2zkHQs
	YGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJEZi0th37uWUH48pXH/UOMTJxMB5ilOBgVhLh
	DdIOSBfiTUmsrEotyo8vKs1JLT7EaAoMjInMUqLJ+cC0mVcSb2hmYGpoYmZpYGppZqwkzst2
	5XyakEB6YklqdmpqQWoRTB8TB6dUA9Omyf9PFs306Fn62kAy+BOLoUpJnqbZmRzrxB/yn4N8
	InJWFNytqhBdli2bsEI+PPpmWviHH7czDjTcjQptmulfNE/9ldGMn4bnxZN9j0uvO863SnXP
	7Wlb57wsfZOV171aaanMJK3vi6SKGaKr0zpW9/Fsy/8iUJ1xdq1MkKeGwbsIhyqn7yWr115y
	me8hKHj+1oaEdy6N8oqCC+a2iTZZCv49FdW0jT1u2cngmx93TT7ftudNJtvXrduFzgtJ5scs
	Nkh6bnxg8sVfOppXtus6XUnPX5gvlfrfSC/pqE/9opctF5sfB/zpvTtp3/cbdqWPHPS+unAw
	HMz/cSHX1+yIwo0LvySNtFadVkwUb1FiKc5INNRiLipOBAAdHNKv4wMAAA==
X-CMS-MailID: 20241204103447eucas1p1290a8da81821da986015bef31ccf0e3c
X-Msg-Generator: CA
X-RootMTR: 20241203134206eucas1p10ca2d7bb12afbd082d5f8a9ad85f94bd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241203134206eucas1p10ca2d7bb12afbd082d5f8a9ad85f94bd
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
	<CGME20241203134206eucas1p10ca2d7bb12afbd082d5f8a9ad85f94bd@eucas1p1.samsung.com>
	<20241203134137.2114847-14-m.wilczynski@samsung.com>
	<9b75bc06-2a28-4c16-8e2b-90f824f7f79f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023456_973892_693B6CC2 
X-CRM114-Status: GOOD (  26.25  )
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

CgpPbiAxMi8zLzI0IDE2OjUyLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDAzLzEy
LzIwMjQgMTQ6NDEsIE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+PiBUaGUgRFJNIEltYWdpbmF0
aW9uIEdQVSByZXF1aXJlcyBhIHBvd2VyLWRvbWFpbiBkcml2ZXIsIGJ1dCB0aGUgZHJpdmVyCj4+
IGZvciAidGhlYWQsdGgxNTIwLWFvbiIgaXMgbm90IHlldCBhdmFpbGFibGUuIFRvIGVuc3VyZSB0
aGF0IHRoZSAnYW9uJwo+PiBub2RlIGFuZCBpdHMgY2hpbGQgJ3BkJyBub2RlIGFyZSBwcm9wZXJs
eSByZWNvZ25pemVkIGFuZCBwcm9iZWQgYnkgdGhlCj4+IGtlcm5lbCwgYWRkICJzaW1wbGUtYnVz
IiB0byB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBvZiB0aGUgJ2Fvbicgbm9kZS4KPj4KPj4gVGhp
cyBjaGFuZ2UgYWxsb3dzIHRoZSBrZXJuZWwgdG8gdHJlYXQgdGhlICdhb24nIG5vZGUgYXMgYSBz
aW1wbGUgYnVzLAo+PiBlbmFibGluZyB0aGUgY2hpbGQgbm9kZXMgdG8gYmUgcHJvYmVkIGFuZCBp
bml0aWFsaXplZCBpbmRlcGVuZGVudGx5LiBJdAo+PiBlbnN1cmVzIHRoYXQgdGhlIHBvd2VyIGRv
bWFpbiBjYW4gYmUgbWFuYWdlZCBhcHByb3ByaWF0ZWx5IHVudGlsIHRoZQo+PiBzcGVjaWZpYyBB
T04gZHJpdmVyIGlzIGRldmVsb3BlZC4KPj4KPj4gVGhpcyBjb21taXQgaW50cm9kdWNlcyBzb21l
IGVycm9ycyB3aGlsZSBydW5uaW5nIGR0YnNfY2hlY2ssIGFzIHRoZSBhb24KPj4gZG9lc24ndCBo
YXZlIHRoZSBkdC1iaW5kaW5ncyB5ZXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxj
enluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8IDExICsrKysrKysrKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290
L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LmR0c2kKPj4gaW5kZXggMzlkMzkwNTkxNjBkLi41OGY5M2FkM2ViNmUgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+PiBAQCAtNiw2ICs2LDcgQEAKPj4gIAo+PiAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+PiAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGsuaD4KPj4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9wb3dlci90aGVhZCx0aDE1MjAtcG93ZXIuaD4KPj4gIAo+PiAgLyB7Cj4+
ICAJY29tcGF0aWJsZSA9ICJ0aGVhZCx0aDE1MjAiOwo+PiBAQCAtMjI5LDYgKzIzMCwxNiBAQCBz
dG1tYWNfYXhpX2NvbmZpZzogc3RtbWFjLWF4aS1jb25maWcgewo+PiAgCQlzbnBzLGJsZW4gPSA8
MCAwIDY0IDMyIDAgMCAwPjsKPj4gIAl9Owo+PiAgCj4+ICsJYW9uIHsKPj4gKwkJY29tcGF0aWJs
ZSA9ICJ0aGVhZCx0aDE1MjAtYW9uIiwgInNpbXBsZS1idXMiOwo+IAo+IDEuIE5vLCB0aGF0J3Mg
bm90IGEgYnVzLgoKSSB1bmRlcnN0YW5kIHRoYXQgdXNpbmcgInNpbXBsZS1idXMiIGZvciB0aGUg
J2Fvbicgbm9kZSB3YXMgbm90CmFwcHJvcHJpYXRlLiBTaW5jZSB0aGUgJ2Fvbicgbm9kZSBpc24n
dCBuZWVkZWQgZm9yIHRlc3RpbmcgdGhpcwpwYXRjaHNldCwgSSB3aWxsIHJlbW92ZSBpdCBhbmQg
bW92ZSB0aGUgcG93ZXItZG9tYWluIGRldmljZSB0cmVlIG5vZGUgdG8KdGhlIFNvQy4gRnV0dXJl
IGNoYW5nZXMgdG8gdGhlICdhb24nIG5vZGUgd2lsbCBiZSBoYW5kbGVkIGluIGEgc2VwYXJhdGUK
cGF0Y2hzZXQuCgo+IDIuIFBsZWFzZSBydW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBmaXgg
cmVwb3J0ZWQgd2FybmluZ3MuIFRoZW4KPiBwbGVhc2UgcnVuIGBzY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS1zdHJpY3RgIGFuZCAocHJvYmFibHkpIGZpeCBtb3JlCj4gd2FybmluZ3MuIFNvbWUgd2Fy
bmluZ3MgY2FuIGJlIGlnbm9yZWQsIGVzcGVjaWFsbHkgZnJvbSAtLXN0cmljdCBydW4sCj4gYnV0
IHRoZSBjb2RlIGhlcmUgbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4gRmVlbCBmcmVlIHRvIGdl
dCBpbiB0b3VjaAo+IGlmIHRoZSB3YXJuaW5nIGlzIG5vdCBjbGVhci4KPiAKPiBTb3JyeSwgdGhp
cyBwYXRjaHNldCBpcyBub3QgcmVhZHksIHVubGVzcyBieSBSRkMgeW91IG1lYW50IC0gZG8gbm90
Cj4gcmV2aWV3LCBiZWNhdXNlIGl0IGlzIG5vdCByZWFkeS4gVGhlbiBpdCBpcyBmaW5lLiBCdXQg
dGhlbiAqY2xlYXJseQo+IGV4cHJlc3MqIHRoaXMgaW4gY292ZXIgbGV0dGVyLCBzbyB3ZSBrbm93
IHdoYXQgeW91IGV4cGVjdCBmcm9tIHVzIChhbmQgSQo+IHdvdWxkIG5vdCB3YXN0ZSBteSB0aW1l
IHRvIGdvIHRocm91Z2ggYWxsIHRoaXMpLgoKTXkgaW50ZW50aW9uIHdpdGggdGhpcyBwYXRjaHNl
dCB3YXMgdG8gZ2F0aGVyIGZlZWRiYWNrIG9uIHRoZSBvdmVyYWxsCmRpcmVjdGlvbiBvZiB0aGUg
Y2hhbmdlcy4gSSB1bmRlcnN0YW5kIHRoYXQgY2xlYXJlciBjb21tdW5pY2F0aW9uIGluIHRoZQpj
b3ZlciBsZXR0ZXIgd291bGQgaGF2ZSBiZWVuIGJlbmVmaWNpYWwuIE1vdmluZyBmb3J3YXJkLCBJ
IHdpbGwgZW5zdXJlCnRoYXQgdGhlIHBhdGNoJ3MgcmVhZGluZXNzIGFuZCBleHBlY3RhdGlvbnMg
YXJlIGV4cGxpY2l0bHkgc3RhdGVkLgoKVGhhbmtzIGEgbG90IGZvciB5b3VyIHJldmlldy4KTWlj
aGHFggoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
