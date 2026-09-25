Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A55EC9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouO0rTQotMP23uwmbFfntw1GYc2qI8WRSWxjLGE28Yc=; b=VkAwVlQfyVXWYy
	rzzJ7KUePO98rkdDCNtfSC/GmIkRZ6elXhrPQMXnGAJOSoy8Js0NKxJMm7mHjJnATCderOinpXxAg
	5l+zV3RoG3YaYfrNzYNTVNT6GYccl2MBCjhk8TNE1gl8BBDCHiJGU5aDmRhy+KKqif/hzJgWA56iU
	nS8ruZOmlcvJghoWA51OyWqQFF4Zb1eTi65plOoblOO3HRgaeXxA4k236830MFmgN31XyB0EEXjKu
	ygJTktgrwKhoigm5OJuh3l13H6+Neqr6EGC1XZyWTrl5VlHAj/P4KAdFDegBtHHq8Rpu2kPM/rU5Q
	EL9+XHntAB+IWdebsDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA79X-0000000Dd2d-2bJ9;
	Fri, 25 Sep 2026 14:43:55 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA79U-0000000Dd0w-1DCm
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 14:43:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff23af865so6492575e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790347430; x=1790952230; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtEfZGf6pOZoZKp7BZybV8NV7US5hG1rb4KkghHs3uw=;
        b=lCA2udjPwjPc9I348g363kftzOqRYNIPemAwhjtZkiUOm89+P21hOFbcrbqaXaEn34
         Sk/dAkvlM1jaLLLwZCl1za3RR716gDQ/BXsCdby4GGlsC7T0mOFdfaX/YjD6YfhjeBfr
         MLWo4dHQdJoHTcrYkzKEwgwiK1kvemMYBosVcG9AGX4bgBAVIK9atikw6rzXSBEI+DWu
         Foo42RvfPHc4menlZG9kdgxodfAElo9JdjAdgpKKbBhjgDcrTFcvzkgYMlY4VDkOXQWv
         ogd3UYgHrCJEwTyFOhRCujMKKjQOGiU5PY9VbUM5MmYh3RZkQEgufmvab4OGtffww/nZ
         OzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790347430; x=1790952230;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DtEfZGf6pOZoZKp7BZybV8NV7US5hG1rb4KkghHs3uw=;
        b=GhMfvN/JdkGCnOhWWwNnhkUIzwGPcMlQE8JrtKG3baB1nVAQG4/sJVrs2+Vl8luOmv
         9oTvG+yhGO/YXsckxmkQ09FNCJyJOStsStaSvUtaCgIu2L6G4oJfdKw5WM8l4A9l46pp
         yUEiA+foa06htfXWmfDzA18WjwOkqORIHDaUo9JQsRpfYSgYAUY0MRxX37bYcNPqqoDl
         Gi2ta3s+2WgAmT7FhRnJncQykc+Eu/Ctk8pWO9kdwK6LheyRGgBdlK12apVl5OXjTBm7
         t6UUq9z6T7hfnWzhJmVBJoKiQN6g2a+aD0VmflKhzW8oaUG2QT2U9CMyJx3m4LF6FIW5
         kCJA==
X-Forwarded-Encrypted: i=1; AKwUvBy7ud0TsZydh2i4vkShVWHMbCR7GUbu2tAW8F7TPL4rBY/EVDbvUfJe/A9C4glIe3r9h14WX9xLIgvgng==@lists.infradead.org
X-Gm-Message-State: AFuF++mxy5Nwvkxre1/nxQjcw/WPgwh0Hxr+Lud9NZzoZgkG7JRCUol0
	U83lmFsmOG3EWwCb/IZzXXx+6/SVLRoVRoTa/lAAEH8buXupd1JzHbMGWQSIq8b0KRc=
X-Gm-Gg: AYBFou3ganhjvi6HB+YWB19d8E0w751/JxxQ3XBeFMEmZ/rz/gOYNTSP/qIlM2YcFE9
	+DflsBZM7hhSW4Sg00L3gItTdYeYWEm+axCpC4dZLAbEYuc8XJZv+1L+1OsMhe9oAcij+g+tX5S
	xtK7bwTBMfBC82v2vGxXEiDHNt6w8gjTHTiocjGuJTnSCC6bJC1MmKVCfBkl28rDB/rlK54XBrX
	7ToiIWX+5dK0g/dZXLccKRa3v7TjG8Ho2x0mfdThu4qFZsCNnrVhTR54UCbN+oGovvjncV84Jk6
	qVWFWolUm9HzKQeRiAwCShF4sWRAftR5NaDQQFx7R6lMKSklXZFlqszI3l7hh+VGeHbavI3jRk1
	jalybv45FHBJ+6D3HUukCzWrTSr7QXTYiO4NyUkcKpyDKyHq1PIe+8aIEM2CKUBfefrUbTx9wx1
	c4pMniMGJhXUQL1xNQlrPU/JQfO7ZZxCPeAbMJeVxiiAdPGOctnfQx3G6cTYdhqqMyyF1XFVd73
	sCRFJHpt6abiRnDAQ==
X-Received: by 2002:a05:600c:c8f:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49fe66bdf3bmr105928135e9.3.1790347430286;
        Fri, 25 Sep 2026 07:43:50 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm7104435f8f.16.2026.09.25.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:43:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu
 <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock
 to the PHY PLL
In-Reply-To: <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
Date: Fri, 25 Sep 2026 16:43:46 +0200
Message-ID: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_074352_345971_66B4507B 
X-CRM114-Status: GOOD (  21.27  )
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

T24gZGltLiAwOSBhb8O7dCAyMDI2IGF0IDIxOjE0LCBDb2R5IEthbmcgPGNvZHlrYW5nLmhrQGdt
YWlsLmNvbT4gd3JvdGU6Cgo+IFRoZSBBUE1VIGVEUC9EUCBwaXhlbC1jbG9jayBtdXhlcyB3ZXJl
IHBhcmVudGVkIHRvIGEgcGxhY2Vob2xkZXIsIGJlY2F1c2UKPiB0aGVpciByZWFsIHBhcmVudHMg
KHRoZSBEUCBQSFkgUExMcykgZGlkIG5vdCBleGlzdCBhcyBjbG9ja3MgeWV0LiBUaGV5IGRvCj4g
bm93LCBzbyBwb2ludCBlYWNoIG11eCBhdCBpdHMgUExMIGFuZCBsZXQgdGhlIHBpeGVsIGNsb2Nr
IHJlYWNoIHRoZQo+IGNvbnRyb2xsZXIgdGhyb3VnaCB0aGUgY2xvY2sgZnJhbWV3b3JrLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ29keSBLYW5nIDxjb2R5a2FuZy5oa0BnbWFpbC5jb20+Cj4KPiAtLS0K
PiB2MjoKPiAtIG5vIGNoYW5nZQo+IC0tLQo+ICBkcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazMu
YyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMy5jIGIvZHJp
dmVycy9jbGsvc3BhY2VtaXQvY2N1LWszLmMKPiBpbmRleCBjYjBjNDI3N2Y3MmE4Li5hZmJiYmQ3
OTc4MjZkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMy5jCj4gKysr
IGIvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWszLmMKPiBAQCAtOTM3LDEzICs5MzcsMTMgQEAg
Q0NVX01VWF9ESVZfR0FURV9GQ19ERUZJTkUodWZzX2FjbGssIHVmc19hY2xrX3BhcmVudHMsIEFQ
TVVfVUZTX0NMS19SRVNfQ1RSTCwgNSwKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3Bh
cmVudF9kYXRhIGVkcDBfcGNsa19wYXJlbnRzW10gPSB7Cj4gIAlDQ1VfUEFSRU5UX0hXKGxjZF9w
eGNsayksCj4gLQlDQ1VfUEFSRU5UX05BTUUoZXh0ZXJuYWxfY2xrKSwKPiArCUNDVV9QQVJFTlRf
TkFNRShlZHAwX3BsbF9weGNsayksCgpoaWRkZW4gYmVoaW5kIHRoaXMgbWFjcm8gaXMgYSAuZndf
bmFtZS4gQmFzaWNhbGx5IHRoZXNlIGFyZSB5b3VyIERUCmlucHV0IG5hbWVzLiBZb3UgY2FuJ3Qg
Y2hhbmdlIHRoZW0gYXQgd2lsbCBsaWtlIHRoYXQgYmVjYXVzZSB5b3VyCmJpbmRpbmdzIGFyZSBz
dXBwb3NlZCB0byBiZSBzdGFibGUuCgpZb3Ugc2hvdWxkIG5vdCB1c2UgcGxhY2Vob2xkZXIgbmFt
ZSwgZXZlci4gTm8gbmVlZCB0byBtYWtlIHRoZQpuYW1lIHRvbyBzcGVjaWZpYyBlaXRoZXIsIGZy
b20gdGhlIGJlZ2lubmluZyBpdCBzaG91bGQgaGF2ZSBiZWVuCnNvbWV0aGluZyBsaWtlICJwaXhl
bF9wbGwiIG9yIHdoYXRldmVyIHlvdXIgZG9jIHJlZmVyIGl0IHdpdGguCgoiZXh0ZXJuYWxfY2xr
IiBpcyBub3QgZGVjbGFyZWQgaW4geW91ciBiaW5kaW5ncyBBRkFJQ1QsIHNvIGF0IGxlYXN0IGl0
CnNob3VsZCBiZSBmaW5lIHRvIHJlbW92ZSBpdC4KClRoZXJlIG5lZWQgdG8gYmUgYSBkdC1iaW5k
aW5nIHBhdGNoIGRvY3VtZW50aW5nIHRoZSBuZXcgbmFtZSB5b3UgbmVlZAphbmQgdGhlbiB5b3Ug
Y2FuIHN0YXJ0IHVzaW5nIGl0IGluIHRoZSBkcml2ZXIuCgpJbiB0aGUgZnV0dXJlLCBwbGVhc2Ug
dHJ5IHRvIGRvY3VtZW50IGFsbCB0aGUgaW5wdXRzIG9mIHlvdXIgY29udHJvbGxlcgppbiB0aGUg
YmluZGluZ3MuIEV2ZW4gaWYgeW91IGRvIG5vdCB1c2UgdGhlbSB5ZXQsIHRoZXkgZXhpc3QuCgo+
ICB9Owo+ICBDQ1VfTVVYX0dBVEVfREVGSU5FKGVkcDBfcHhjbGssIGVkcDBfcGNsa19wYXJlbnRz
LCBBUE1VX0xDRF9FRFBfQ1RSTCwgMiwgMSwgQklUKDEpLCAwKTsKPiAgCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGVkcDFfcGNsa19wYXJlbnRzW10gPSB7Cj4gIAlDQ1Vf
UEFSRU5UX0hXKGRzaTRsbjJfbGNkX3B4Y2xrKSwKPiAtCUNDVV9QQVJFTlRfTkFNRShleHRlcm5h
bF9jbGspLAo+ICsJQ0NVX1BBUkVOVF9OQU1FKGVkcDFfcGxsX3B4Y2xrKSwKPiAgfTsKPiAgQ0NV
X01VWF9HQVRFX0RFRklORShlZHAxX3B4Y2xrLCBlZHAxX3BjbGtfcGFyZW50cywgQVBNVV9MQ0Rf
RURQX0NUUkwsIDE4LCAxLCBCSVQoMTcpLCAwKTsKPiAgCj4KPiAtLSAKPiAyLjQzLjAKPgoKLS0g
Ckplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
