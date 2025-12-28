Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB17D3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ev9OPOlOctywGDuXEBAtavhoPSN1NNNMITy3AA6b11I=; b=fzPW4NMC1jQU4q
	r+k9XH5zUodvtbn5bjFJrWIvB3tMg3brmel+gvw9bgTJn9Yx8sufvPS4plzbHe23ZbDwEIl9bO2fj
	39/2axYipX+Yor1iIWMnVHRHV02i9tWaLodFqp6uAKq8Ob7pLeN7IemTk7o8t490LS2vyhAp3XTlx
	pJoecpYBxTlXnUEe7HCM6BxDu0IZoiv26q/pQhr4BiCClK1eWrX0KeXMOSGkkbHKLefdWAVYl/xe4
	iTH1v10+Dg0MiYbBAD51NJpSL2NLkJFjHwY8kBG76d1g6n2GUR4pDZsu9MDiV1YWYDIIrDy6YTsf3
	yJE7McE+CSXfvUF9+hMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrSD-00000002nb3-4A8o;
	Sun, 28 Dec 2025 14:09:06 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrSB-00000002naf-3BiT
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 14:09:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b76b5afdf04so1244739266b.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 06:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1766930942; x=1767535742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wENYKXj8v8Lv7v7Vm8H4H6KHnkMPmApWIlL9wZb85ms=;
        b=RzTI4bJkn4D668ybby8DnQfgleCH3mRs8ZQOGlN3fXLXyFjTW9a9ugLfuqXH4OPiqu
         dfs+Z9nz4yPiZ4NdQcYMyV+DaMm/ATrLkRr8crezGyPogW6yftvF288lBr97lp8AYutu
         GSJg2EcON3K2M3l9dWiO91vrh+tIENKkHzzkWfS2k5vaHe46DNQEq+V26db8QHCSV4TK
         3Cc+IHeUlQzc5B/D/qtJOumuo4Sc98jDhW0ZYWz9tJmvzhjS7yaWWO+lTk3SQblaSulS
         BMjImZ8lKqz7RRmPcp0aUeGU9MseX0Fcrgnpgaa7ehzQiRpQroZ/MvNvKHzPGxC4WgHu
         pinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766930942; x=1767535742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wENYKXj8v8Lv7v7Vm8H4H6KHnkMPmApWIlL9wZb85ms=;
        b=Lr3AEpVNd8jq0RnK2c3d8jgVwlZWOK4bGinNnTGo71I8d6bTDD29doP1WgH+gukdXg
         fNubwfVJzB2XsfEQeUaBpoX6GefhR1E2dwT7uW9SfMlCnQ7e68/fDRxxSWCWG0zv9dt0
         I1Cqhs/S+qBM7lacjiTxwSA+e2xj9k+7cgwAVSa5G6h8bXD1Jv1ZJD8u0uW4a3lS3cCV
         N26yLtnlXYIP04uaj5/x7A6/9dqfFmQH06j/wePSmcbTGyaOJcgnT/y18KBi/bjJMNdC
         30IRQ+/nfgas1Fam6QE+mvZEKvGpGSKyeJMniiK24+8I7C0zUhcDAlPgotIlsrA7Md2x
         HTyg==
X-Forwarded-Encrypted: i=1; AJvYcCXxeIsBqKKrsl89AOyTkXUlhT5uRGAOonsro1yq3ih39SLAsawHOtw1G/r1YrJU+tlg9cnyCoD1VSgXmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YygSvFRsPERyJsS7QPHhd3AjEwjyToKqZP76E/N/tJ8eAjhzrwn
	fghfVNc/H7cM1UP4ggRFLZO4L0gbQKjGIXod9UqCbf5LsX9Vi3teWd6dKusnrO1v7tFkODSTToM
	6j5yn5JyYyoqYVxuf25XZb+CLi7meb4DBhv/6/+cbjA==
X-Gm-Gg: AY/fxX45oAxFcxWRMJugU3tX+tCcVuzr0osefXgTMKTGQe173x8Stt4biuee6ws+tgo
	9SW4yUBMl7nAiyr5TRorYRvXetFYGfCoQGVMjTJaE8TVnqGgHoY8ql8QJvWpj7KtvNkvo3VUV9B
	heRKw7L2JIhQjdu+HwVwX1LoEeUSWutKiaAy10onEfySvm5zTghPPF6dsswZfNXovQqXNRYB+iW
	1m3gR2YzoPJPp9Y6aWvmePXpyEhnE/VWRtgoJashsBNV2L2UKceO56aqB0oGFtN0pHLyaBQ+lcz
	WKXpsVrNXGIPYSzb1wD+Gs3NAiw=
X-Google-Smtp-Source: AGHT+IEjsldh+CLtWqZeqn36ACHg83XtpfBWMbLxblwHEVSKXRiecHtKxbhkM0NgyJ/BPAt9mxg9SSDU0HRkxTA/ztw=
X-Received: by 2002:a17:907:c02:b0:b73:7184:b7d3 with SMTP id
 a640c23a62f3a-b80371f3a9bmr3208584566b.58.1766930941739; Sun, 28 Dec 2025
 06:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20251223-zk-missing-zknh-v1-1-b627c990ee1a@riscstar.com>
In-Reply-To: <20251223-zk-missing-zknh-v1-1-b627c990ee1a@riscstar.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Date: Sun, 28 Dec 2025 15:08:50 +0100
X-Gm-Features: AQt7F2rwM6cdgvlCkbjBzFCt_wHDJQJ_76o6tAioFRUFGLsMUZCUV24Az5_9JQE
Message-ID: <CADGDLFiMAJzvySC0FjY1=aAn_XgGAQnhrLd0SWKaSAYcgYFc-Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpufeature: Fix Zk bundled extension missing Zknh
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_060903_892764_E2A9B982 
X-CRM114-Status: GOOD (  16.53  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgMzo0NOKAr0FNIEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlz
Y3N0YXIuY29tPiB3cm90ZToKPgo+IFRoZSBaayBleHRlbnNpb24gaXMgYSBidW5kbGUgY29uc2lz
dGluZyBvZiBaa24sIFprciwgYW5kIFprdC4gVGhlIFprbgo+IGV4dGVuc2lvbiBpdHNlbGYgaXMg
YSBidW5kbGUgY29uc2lzdGluZyBvZiBaYmtiLCBaYmtjLCBaYmt4LCBaa25kLCBaa25lLAo+IGFu
ZCBaa25oLgo+Cj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgcmlzY3ZfemtfYnVuZGxl
ZF9leHRzIG1hbnVhbGx5IGxpc3RlZAo+IHRoZSBkZXBlbmRlbmNpZXMgYnV0IG1pc3NlZCBSSVND
Vl9JU0FfRVhUX1pLTkguCj4KPiBGaXggdGhpcyBieSBpbnRyb2R1Y2luZyBhIFJJU0NWX0lTQV9F
WFRfWktOIG1hY3JvIHRoYXQgbGlzdHMgdGhlIFprbgo+IGNvbXBvbmVudHMgYW5kIHVzaW5nIGl0
IGluIGJvdGggcmlzY3ZfemtfYnVuZGxlZF9leHRzIGFuZAo+IHJpc2N2X3prbl9idW5kbGVkX2V4
dHMuCj4KPiBUaGlzIGFkZHMgdGhlIG1pc3NpbmcgWmtuaCBleHRlbnNpb24gdG8gWmsgYW5kIHJl
ZHVjZXMgY29kZSBkdXBsaWNhdGlvbi4KPgo+IEZpeGVzOiAwZDgyOTVlZDk3NWIgKCJyaXNjdjog
YWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3Igc2NhbGFyIGNyeXB0byIpCj4gTGluazogaHR0
cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjMxMTE0MTQxMjU2LjEyNjc0OS00LWNsZWdlckByaXZv
c2luYy5jb20vCj4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIzICsrKysrKysr
KysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCBiMDU3MzYyZjhmYjVm
OTJkOWE2MDhiMjIzNjY2ODMxZDc2OWE4MDVjLi5mNTg1NWFmMDQ1M2Q1Y2UyMDZmOGM4MjAxYWQx
MDhkZmU0ZDMwMGZiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0yNzksMjMgKzI3
OSwyMiBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X2FfZXh0c1tdID0gewo+ICAg
ICAgICAgUklTQ1ZfSVNBX0VYVF9aQUxSU0MsCj4gIH07Cj4KPiArI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pLTiAgICAgIFwKPiArICAgICAgIFJJU0NWX0lTQV9FWFRfWkJLQiwgICAgIFwKPiArICAg
ICAgIFJJU0NWX0lTQV9FWFRfWkJLQywgICAgIFwKPiArICAgICAgIFJJU0NWX0lTQV9FWFRfWkJL
WCwgICAgIFwKPiArICAgICAgIFJJU0NWX0lTQV9FWFRfWktORCwgICAgIFwKPiArICAgICAgIFJJ
U0NWX0lTQV9FWFRfWktORSwgICAgIFwKPiArICAgICAgIFJJU0NWX0lTQV9FWFRfWktOSAo+ICsK
PiAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96a19idW5kbGVkX2V4dHNbXSA9IHsK
PiAtICAgICAgIFJJU0NWX0lTQV9FWFRfWkJLQiwKPiAtICAgICAgIFJJU0NWX0lTQV9FWFRfWkJL
QywKPiAtICAgICAgIFJJU0NWX0lTQV9FWFRfWkJLWCwKPiAtICAgICAgIFJJU0NWX0lTQV9FWFRf
WktORCwKPiAtICAgICAgIFJJU0NWX0lTQV9FWFRfWktORSwKPiArICAgICAgIFJJU0NWX0lTQV9F
WFRfWktOLAo+ICAgICAgICAgUklTQ1ZfSVNBX0VYVF9aS1IsCj4gLSAgICAgICBSSVNDVl9JU0Ff
RVhUX1pLVCwKPiArICAgICAgIFJJU0NWX0lTQV9FWFRfWktUCj4gIH07Cj4KPiAgc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByaXNjdl96a25fYnVuZGxlZF9leHRzW10gPSB7Cj4gLSAgICAgICBS
SVNDVl9JU0FfRVhUX1pCS0IsCj4gLSAgICAgICBSSVNDVl9JU0FfRVhUX1pCS0MsCj4gLSAgICAg
ICBSSVNDVl9JU0FfRVhUX1pCS1gsCj4gLSAgICAgICBSSVNDVl9JU0FfRVhUX1pLTkQsCj4gLSAg
ICAgICBSSVNDVl9JU0FfRVhUX1pLTkUsCj4gLSAgICAgICBSSVNDVl9JU0FfRVhUX1pLTkgsCj4g
KyAgICAgICBSSVNDVl9JU0FfRVhUX1pLTgo+ICB9Owo+Cj4gIHN0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgcmlzY3ZfemtzX2J1bmRsZWRfZXh0c1tdID0gewo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6
IDk0NDg1OThiMjJjNTBjOGE1YmI3N2E5MTAzZTJkNDlmMTM0Yzk1NzgKPiBjaGFuZ2UtaWQ6IDIw
MjUxMjIzLXprLW1pc3NpbmctemtuaC0yNjJmZmVkNzc0ZDIKPgo+IEJlc3QgcmVnYXJkcywKPiAt
LQo+IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+CgpIaSBHdW9kb25nLAoKTmlj
ZSBjYXRjaCwgbG9va3MgZ29vZCB0byBtZToKClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+CgpUaGFua3MsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
