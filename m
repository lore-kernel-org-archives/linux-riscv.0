Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4436C369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1ICrOVAG+4EqVYm0MRoupgu5GwvDh+iD2aqNfmYLB0=; b=0lHhIfc2Jp2WLj
	V4XysRdNvUZ/G1unXY8E5SEgcx2pNsTmZAvWQMxi9ouJw/8iGB3/UC+zAqKiGkg+2z9j2hNjKvNzL
	hWHfKFBwNrOfQQtJ/oICvAAV6/ljq5QhVDPRyLHSdqqXv9XSwVm484X2EnmR2N1LuDRFSqy59aeQz
	PwAzst1XmWLof4SqVxr/dBcAYp5lZHBtiOgbRv7wA/1sebodIBnWJ+k1xhRK/LQ/cxedwLj6/KuTA
	agWc+jNZL7ZyN+7nUL/x4UdlikUT/GW0O/82oTZcxOYeCrYE+1glDE3EWQqkxFsMmsWqQJCeFWbek
	UHtgU6ENvoM62bZ5C4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52sh-00000009fvJ-3mnQ;
	Wed, 16 Apr 2025 13:32:47 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52se-00000009ftj-18nP
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 13:32:46 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250416133237euoutp02f50b58503d85751c13a7add7610f1863~2z8asHG1k0565305653euoutp02f
	for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 13:32:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250416133237euoutp02f50b58503d85751c13a7add7610f1863~2z8asHG1k0565305653euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744810357;
	bh=kUFo/wLgztnLDigBiEFrgBwls65G+AeX0yLfanf6yv0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mupRYoNxftSMT8sljLcHjRIHg/DDpOP+gsLFvSjf9+5Bgs70dDQkmYBXLHJuQgRxg
	 OdvJ/8xSH6MfwDiTbjFB8xHD6oH8LCggTBg1VYNWyU7v6yOAZV2a3ApUUm5r5Hc/A9
	 QMDcDrk2jzNVgWggOw68D5TfhAHU/k0Qs10Hq6zI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250416133237eucas1p1db9410bcc5acc1b3167bb93a320f6030~2z8aPC9Ga0435904359eucas1p1N;
	Wed, 16 Apr 2025 13:32:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id EE.C7.20397.571BFF76; Wed, 16
	Apr 2025 14:32:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250416133236eucas1p1d8f879ffa1724d77d3f8cdcefde84535~2z8ZttCPT0165501655eucas1p1o;
	Wed, 16 Apr 2025 13:32:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250416133236eusmtrp1b0d189806d8483166b7cd28317c2a477~2z8Zs0mqn0448804488eusmtrp1W;
	Wed, 16 Apr 2025 13:32:36 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-4e-67ffb1759f3c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 0D.D8.19654.471BFF76; Wed, 16
	Apr 2025 14:32:36 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250416133235eusmtip2b6501e479374913edd639f525f91f50e~2z8YmWHan0900709007eusmtip2v;
	Wed, 16 Apr 2025 13:32:35 +0000 (GMT)
Message-ID: <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
Date: Wed, 16 Apr 2025 15:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
	Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH+d3e3l7Qkmu14RexY6tOGQ7Eucdvm+AeLrkJcRNdYjRZZpWb
	6gQKfTidMwMGtkJhFsbUClIYAdLwKo+uEKALsrYE1ugGk2kLZoAUpAKr4MStznJx47/P+Z5z
	ft9zTn4kR6An1pPHU5WMPFWSLCZCcLPtkTNaZXoijR0tWo0cNyswVNvpxNC972YJVNbj5KLh
	X1owNDA/Q6D68es85OnMxNGkfphAv7aXEMiX3wOQ2ZdNoLoeNw+Vz7XiqNLSDtC581Vc5B52
	4Egzk8FBpQ+KOehJh4WHrty38lDLtI6L7HUHULb1W/wdSHcuGHC6Te/m0dq2fkA3Gc8TtOu3
	DoK+2ptIj+TZMbq58is6u86G0d/8E0vPdA0SdEGLEdDNfWdoX9Nze0MPhexMYpKPn2Tk2+IP
	hxyb7vdy02ybTrUPNWMZ4OaGXBBMQupVOFDagOWCEFJA1QB49Z5uOXgA4MSoD2cDH4D1ngbu
	s5au2UqCTVQDWKr5CwskBJQXQPWiLMB8Kh66PBUgwDj1Ihy+3U+w+hrYe3kMD7CQioAjty7x
	AryW2g8bHy4s1ayjtsLKikFOwIBDNRKwMLNqyZlDhcFbY2VLZgT1CrxTXbakB1OJsN+Yx2Nr
	IuDXrVeWmiFVGgJvqBcJduzd8HKhncfyWjhlb1nmDbCvSIuzLIN3Wv/ksPwlbNPal/lt6HIG
	3iGfGrwEG9q3sfK7cDJzghuQIRUKh7xr2BFCYaH5IoeV+VBzTsBWb4bF2vz/TJ01ZuwCEOtX
	XEW/Ykn9imX0//saAG4EYYxKkSJlFDtSmc9jFJIUhSpVGnNUltIEnn7fPr993gJqpuZiugFG
	gm4ASY54Hd/5hl8q4CdJTn/ByGWfylXJjKIbhJO4OIxfYc2RCiipRMmcYJg0Rv4si5HB6zOw
	s/HvRYrUo5GrErHJl8PTB+XuIIyOO/nT0EePwk18/R9B2k/ix5Jrd1mu/RAFRBPbs5raHx+M
	UZZcX6zy/N5x/8iHyqCsCI3j7KGChQ+irEKl7uPdTt2N1+27asvjeI/HX8iNpfzizP0pp7mr
	VUIyp1Oo/zl6QH0gwRpJ70kTWcZH1bb8aVtc9JYzJ/blVLWmN0s/2/qjbqffEHo7rHHzNUPe
	hXnj7N33TcNHs++6RM2hGz0JsrGRfTsONg2SRy5lac3lRYZZh//Nt9Amnnmq4LBX4Y3fonn4
	vXDKSrkTxmzpLv2qkkRH/ZCbfH7uNcPemlp6wHSqq1hUfTEp6u9ekxhXHJNsj+LIFZJ/Ae0k
	Y0QtBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsVy+t/xe7olG/+nG2x/p2lx4voiJos1e88x
	Wbye9oHNYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxeDnrHpvF5V1z2Cw+9x5htNj2uYXN
	Yu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi7v3TrBYdLxvYLaY+2Uqs8X/PTvYLWa/289useXNRFaL
	42vDLVr2T2FxkPDY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9bB7zTgZ63O8+zuSxeUm9R8va
	Y0we/X8NPN7vu8rm0bdlFaPH5tPVHp83yQXwRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY
	6hkam8daGZkq6dvZpKTmZJalFunbJehlvDnzlrXgmErFrhubmRoYr8t0MXJySAiYSOz7sISt
	i5GLQ0hgKaNEx/XpbBAJGYlr3S9ZIGxhiT/XuqCKXjNKPNuynRUkwStgJ3HnxSJGEJtFQFXi
	3u0zbBBxQYmTM5+ANYsKyEvcvzWDHcQWFgiW2PD9G1iNiIC2xJJFV5lBhjILbGKTWLVyPjvE
	hgVMEu9WHwKbyiwgLnHryXwmEJtNwEjiwfL5YJs5BQIlzqzqBmrgAKpRl1g/TwiiXF6ieets
	5gmMQrOQ3DELyaRZCB2zkHQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJEZhuth37uWUH
	48pXH/UOMTJxMB5ilOBgVhLhPWf+L12INyWxsiq1KD++qDQntfgQoykwLCYyS4km5wMTXl5J
	vKGZgamhiZmlgamlmbGSOC/blfNpQgLpiSWp2ampBalFMH1MHJxSDUzcGy7sjDoYbr79X0vd
	wRkHsvjkNQ6rJvkcZy30+/7P0mI385ZJp6w4NvT9mXNy0u7m5J8vvsZrex2eeGbzxIIjM6TC
	3PYL6QkF/XqjnLtN+nlNwDxWr3abn7y3hWsyrn+2nROxNsPm6aVZa+bYtipXOKfpvNq77Mob
	pZ7D0ut1fzH8KSrpcVrgIO67X8dw6h63hxVyycWPQk5xHUisOP1tWsS/be+v1D07U+q3zULZ
	qPm101Up/vMGG36/iztygO3U58uuW3T4zj1aWDzBM3f9rH1hbfcsy4SZDnftPeP/+t/a6Ct/
	pIOq/T2OaskfXhwt48rcN8lkTdAUn2232o4XrdrXGWua+dk/5p27UPxDJZbijERDLeai4kQA
	hHVuJcADAAA=
X-CMS-MailID: 20250416133236eucas1p1d8f879ffa1724d77d3f8cdcefde84535
X-Msg-Generator: CA
X-RootMTR: 20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
	<20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
	<20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
	<CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_063244_567921_25036D7F 
X-CRM114-Status: GOOD (  27.78  )
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

CgpPbiA0LzE1LzI1IDE4OjQyLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiBPbiBNb24sIEFw
ciAxNCwgMjAyNSBhdCA4OjUz4oCvUE0gTWljaGFsIFdpbGN6eW5za2kKPiA8bS53aWxjenluc2tp
QHNhbXN1bmcuY29tPiB3cm90ZToKPj4KPj4gSW50cm9kdWNlIGEgbmV3IGRldl9wbV9pbmZvIGZs
YWcgLSBwbGF0Zm9ybV9yZXNvdXJjZXNfbWFuYWdlZCwgdG8KPj4gaW5kaWNhdGUgd2hldGhlciBw
bGF0Zm9ybSBQTSByZXNvdXJjZXMgc3VjaCBhcyBjbG9ja3Mgb3IgcmVzZXRzIGFyZQo+PiBtYW5h
Z2VkIGV4dGVybmFsbHkgKGUuZy4gYnkgYSBnZW5lcmljIHBvd2VyIGRvbWFpbiBkcml2ZXIpIGlu
c3RlYWQgb2YKPj4gZGlyZWN0bHkgYnkgdGhlIGNvbnN1bWVyIGRldmljZSBkcml2ZXIuCj4gCj4g
SSB0aGluayB0aGF0IHRoaXMgaXMgZ2VucGQtc3BlY2lmaWMgYW5kIHNvIEkgZG9uJ3QgdGhpbmsg
aXQgYmVsb25ncyBpbgo+IHN0cnVjdCBkZXZfcG1faW5mby4KPiAKPiBUaGVyZSBpcyBkZXYtPnBv
d2VyLnN1YnN5c19kYXRhLT5kb21haW5fZGF0YSwgd2h5IG5vdCB1c2UgaXQgZm9yIHRoaXM/CgpI
aSBSYWZhZWwsCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KCllvdSdyZSByaWdodCDigJQgdGhp
cyBiZWhhdmlvciBpcyBzcGVjaWZpYyB0byBnZW5wZCwgc28gZW1iZWRkaW5nIHRoZSBmbGFnCmRp
cmVjdGx5IGluIHN0cnVjdCBkZXZfcG1faW5mbyBtYXkgbm90IGJlIHRoZSBiZXN0IGNob2ljZS4g
VXNpbmcKZGV2LT5wb3dlci5zdWJzeXNfZGF0YS0+ZG9tYWluX2RhdGEgbWFrZXMgbW9yZSBzZW5z
ZSBhbmQgYXZvaWRzIGJsb2F0aW5nCnRoZSBjb3JlIFBNIHN0cnVjdHVyZS4KCj4gCj4gQWxzbywg
aXQgc2hvdWxkIGJlIGRvY3VtZW50ZWQgd2F5IG1vcmUgY29tcHJlaGVuc2l2ZWx5IElNVi4KPiAK
PiBXaG8gaXMgc3VwcG9zZWQgdG8gc2V0IGl0IGFuZCB3aGVuPyAgV2hhdCBkb2VzIGl0IG1lYW4g
d2hlbiBpdCBpcyBzZXQ/CgpUbyBjbGFyaWZ5IHRoZSBpbnRlbmRlZCB1c2FnZSwgSSB3b3VsZCBw
cm9wb3NlIGFkZGluZyB0aGUgZm9sbG93aW5nCmV4cGxhbmF0aW9uIHRvIHRoZSBjb21taXQgbWVz
c2FnZToKCiJUaGlzIGZsYWcgaXMgaW50ZW5kZWQgdG8gYmUgc2V0IGJ5IGEgZ2VuZXJpYyBQTSBk
b21haW4gZHJpdmVyIChlLmcuLApmcm9tIHdpdGhpbiBpdHMgYXR0YWNoX2RldiBjYWxsYmFjaykg
dG8gaW5kaWNhdGUgdGhhdCBpdCB3aWxsIG1hbmFnZQpwbGF0Zm9ybSBzcGVjaWZpYyBydW50aW1l
IHBvd2VyIG1hbmFnZW1lbnQgcmVzb3VyY2VzIOKAlCBzdWNoIGFzIGNsb2NrcwphbmQgcmVzZXRz
IOKAlCBvbiBiZWhhbGYgb2YgdGhlIGNvbnN1bWVyIGRldmljZS4gVGhpcyBpbXBsaWVzIGEgZGVs
ZWdhdGlvbgpvZiBydW50aW1lIFBNIGNvbnRyb2wgdG8gdGhlIFBNIGRvbWFpbiwgdHlwaWNhbGx5
IGltcGxlbWVudGVkIHRocm91Z2gKaXRzIHN0YXJ0IGFuZCBzdG9wIGNhbGxiYWNrcy4gCgpXaGVu
IHRoaXMgZmxhZyBpcyBzZXQsIHRoZSBjb25zdW1lciBkcml2ZXIgKGUuZy4sIGRybS9pbWFnaW5h
dGlvbikgY2FuCmNoZWNrIGl0IGFuZCBza2lwIG1hbmFnaW5nIHN1Y2ggcmVzb3VyY2VzIGluIGl0
cyBydW50aW1lIFBNIGNhbGxiYWNrcwoocnVudGltZV9zdXNwZW5kLCBydW50aW1lX3Jlc3VtZSks
IGF2b2lkaW5nIGNvbmZsaWN0cyBvciByZWR1bmRhbnQKb3BlcmF0aW9ucy4iCgpUaGlzIGNvdWxk
IGFsc28gYmUgaW5jbHVkZWQgYXMgYSBjb2RlIGNvbW1lbnQgbmVhciB0aGUgZmxhZyBkZWZpbml0
aW9uCmlmIHlvdSB0aGluayB0aGF04oCZcyBhcHByb3ByaWF0ZS4KCkFsc28sIGFzIGRpc2N1c3Nl
ZCBlYXJsaWVyIHdpdGggTWF4aW1lIGFuZCBNYXR0IFsxXSwgdGhpcyBpcyBub3QgYWJvdXQKZnVs
bCAicmVzb3VyY2Ugb3duZXJzaGlwLCIgYnV0IG1vcmUgYWJvdXQgZGVsZWdhdGluZyBydW50aW1l
IGNvbnRyb2wgb2YKUE0gcmVzb3VyY2VzIGxpa2UgY2xvY2tzL3Jlc2V0cyB0byB0aGUgZ2VucGQu
IFRoYXQgbnVhbmNlIG1heSBiZSB3b3J0aApyZWZsZWN0aW5nIGluIHRoZSBmbGFnIG5hbWUgYXMg
d2VsbCwgSSB3b3VsZCByZW5hbWUgaXQgdG8gbGV0J3Mgc2F5CidydW50aW1lX3BtX3BsYXRmb3Jt
X3Jlc19kZWxlZ2F0ZWQnLCBvciBtb3JlIGNvbmNpc2UKJ3J1bnRpbWVfcG1fZGVsZWdhdGVkJy4K
ClsxXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hMzE0MjI1OS0xYzcyLTQ1YjktYjE0
OC01ZTVlNmJlZjg3ZjlAc2Ftc3VuZy5jb20vCgo+IAo+PiBUaGlzIGZsYWcgZW5hYmxlcyBkZXZp
Y2UgZHJpdmVycyB0byBjb29wZXJhdGUgd2l0aCBTb0Mtc3BlY2lmaWMgUE0KPj4gZG9tYWlucyBi
eSBjb25kaXRpb25hbGx5IHNraXBwaW5nIG1hbmFnZW1lbnQgb2YgY2xvY2tzIGFuZCByZXNldHMg
d2hlbgo+PiB0aGUgcGxhdGZvcm0gb3ducyB0aGVtLgo+Pgo+PiBUaGlzIGlkZWEgd2FzIGRpc2N1
c3NlZCBvbiB0aGUgbWFpbGluZyBsaXN0IFsxXS4KPj4KPj4gWzFdIC0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL0NBUER5S0ZxPUJGNWYyaV9TcjFjbVZxdFZBTWdyPTBGcXNrc0w3UkhaTEtu
Kyt5MHV3Z0BtYWlsLmdtYWlsLmNvbS8KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6
eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBpbmNsdWRlL2xpbnV4
L2RldmljZS5oIHwgMTEgKysrKysrKysrKysKPj4gIGluY2x1ZGUvbGludXgvcG0uaCAgICAgfCAg
MSArCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvZGV2aWNlLmggYi9pbmNsdWRlL2xpbnV4L2RldmljZS5oCj4+IGlu
ZGV4IDc5ZTQ5ZmU0OTRiN2M0YzcwZDkwMjg4NmRiNjNjNGNmZTViNGRlNGYuLjNlN2EzNmRkODc0
Y2ZiNmI5OGUyNDUxYzdhODc2OTg5YWE5ZjE5MTMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvZGV2aWNlLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9kZXZpY2UuaAo+PiBAQCAtODgxLDYg
Kzg4MSwxNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZGV2aWNlX2FzeW5jX3N1c3BlbmRfZW5hYmxl
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICAgICAgICAgcmV0dXJuICEhZGV2LT5wb3dlci5hc3lu
Y19zdXNwZW5kOwo+PiAgfQo+Pgo+PiArc3RhdGljIGlubGluZSBib29sIGRldmljZV9wbGF0Zm9y
bV9yZXNvdXJjZXNfcG1fbWFuYWdlZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gCj4gQ291bGQgdGhp
cyBmdW5jdGlvbiBuYW1lIGJlIHNob3J0ZXI/CgpNYXliZToKCnN0YXRpYyBpbmxpbmUgYm9vbCBk
ZXZfaXNfcnVudGltZV9wbV9kZWxlZ2F0ZWQoc3RydWN0IGRldmljZSAqZGV2KTsKc3RhdGljIGlu
bGluZSB2b2lkIGRldl9zZXRfcnVudGltZV9wbV9kZWxlZ2F0ZWQoc3RydWN0IGRldmljZSAqZGV2
LCBib29sIHZhbCk7CgpSZWdhcmRzLApNaWNoYcWCCgo+IAo+PiArewo+PiArICAgICAgIHJldHVy
biBkZXYtPnBvd2VyLnBsYXRmb3JtX3Jlc291cmNlc19tYW5hZ2VkOwo+PiArfQo+PiArCj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgZGV2aWNlX3BsYXRmb3JtX3Jlc291cmNlc19zZXRfcG1fbWFuYWdl
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgdmFsKQo+IAo+IERpdHRvPwo+IAo+PiAr
ewo+PiArICAgICAgIGRldi0+cG93ZXIucGxhdGZvcm1fcmVzb3VyY2VzX21hbmFnZWQgPSB2YWw7
Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBkZXZpY2VfcG1fbm90X3JlcXVpcmVk
KHN0cnVjdCBkZXZpY2UgKmRldikKPj4gIHsKPj4gICAgICAgICByZXR1cm4gZGV2LT5wb3dlci5u
b19wbTsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcG0uaCBiL2luY2x1ZGUvbGludXgv
cG0uaAo+PiBpbmRleCBmMGJkOGZiYWU0ZjJjMDljNjNkNzgwYmIyNTI4NjkzYWNmMmQyZGExLi5j
ZDZjYjU5Njg2ZTRhNWU5ZWFhMjcwMWQxZTQ0YWYyYWJiZmQ4OGQxIDEwMDY0NAo+PiAtLS0gYS9p
bmNsdWRlL2xpbnV4L3BtLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9wbS5oCj4+IEBAIC02NzAs
NiArNjcwLDcgQEAgc3RydWN0IGRldl9wbV9pbmZvIHsKPj4gICAgICAgICBib29sICAgICAgICAg
ICAgICAgICAgICBub19wbToxOwo+PiAgICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIGVh
cmx5X2luaXQ6MTsgICAvKiBPd25lZCBieSB0aGUgUE0gY29yZSAqLwo+PiAgICAgICAgIGJvb2wg
ICAgICAgICAgICAgICAgICAgIGRpcmVjdF9jb21wbGV0ZToxOyAgICAgIC8qIE93bmVkIGJ5IHRo
ZSBQTSBjb3JlICovCj4+ICsgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgcGxhdGZvcm1f
cmVzb3VyY2VzX21hbmFnZWQ6MTsKPj4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBk
cml2ZXJfZmxhZ3M7Cj4+ICAgICAgICAgc3BpbmxvY2tfdCAgICAgICAgICAgICAgbG9jazsKPj4g
ICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKPj4KPj4gLS0KPj4gMi4zNC4xCj4+Cj4+Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
