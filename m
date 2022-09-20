Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76AEC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw7A5Fl2Dzsx9Cp5A2UJRNmDRAIw8IJXn025nBj9ric=; b=CAhwCUr2vaHJM1
	rXYTXQqJshD4U0UQCn0gQJ+QHq2hEKMSNM8qqNecQFCJqsDvvdQSuKiniWwTxFpNloXPstlFnEHP8
	0aOJ6stTyNRw77ZziwBU4/ddU4tLU2j2lY1aGaTRVQHLjVRAigA0fpXu2kg1olhOjxJSVBdkUnJBD
	ip0pGrex48o7r9Wxjs87yEJdb1KYNxfkYtJj9LvcU/iLDCxqUkrZWXGtdp9cqoV1pECL0oXGyqGSc
	hsg5hLkRtexFfvndYXGFhBs3DOcydwEQeF1HQk6bkhU/AIYa7f6F7qoAy77mUUo0WwtbbkxS27nOV
	EgH87UblYHkGdgqWAS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafh3-0052su-Bj; Tue, 20 Sep 2022 16:01:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafh0-0052pg-9K
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 16:01:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id q21so4502352edc.9
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=cj5jDAOuRb643FcjEkM+RL+KZt0WpMxjAAW86S8m0FM=;
        b=RtWwLQ3NILLqWUMusnAEfpfVe4fRPoNbB+AXULUHr9z0ocjjarY1xwbSv30ctxSvRm
         UipqA/tpW7nmSgJxRB5j3HZ2u2cUTAzlV7p1ebzVSPIokCHnSR9rdbbmsfFNljspDRIx
         72uZqmUdgyEOxhXvfev7pkErERbgjrgEGq8W9mCpm29JfZV8dk07//BAMYdb2LUwgJF7
         1I7gebrrhGTobNsny6KH6I8+KkkBKWC9f4lOMmBdTOAKbuBg/u8d7F1tLsrBAqx0mGKq
         uWGzZHGGT7nO/2uX8hUya27Pve2ga8Sq/D/Jemx8OOp8p3YNPH476xh2WIeIKKB5kq11
         GWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cj5jDAOuRb643FcjEkM+RL+KZt0WpMxjAAW86S8m0FM=;
        b=wLr6GxIg74zjsdEqpyxVAr8sm2i10GwOcor6rCwQS7yTiN8zmcsv8SXL1a+86vtrWq
         KGx9bVWFX19jjl7qrVA1XP4/9ZHsvJGrbrBxpu2/lTYSLMfqu/qoeixvjN0EcPlP69ja
         nD1eRJ0Fht7DejIn9w9Oayprm0Jjc+o1zm7VM8/QvPOLjs1up8Zm7TbzFjTW8wGKLsZz
         7wUJcD5KqX2tFfBp3502ehgJw8udQp0NVeNPmoWgHIiCdGmLKoJzIuw4sn/fQRrRn3Gq
         fXBmfAGEbtnyLY6ZJLLVgWuIyMXha8jW3LPDhdRt/dM1IceNINsTvQCvr/8LMPFxRm7u
         nVlw==
X-Gm-Message-State: ACrzQf0U/MIIO5m/1U9hBMnKE7AtFvcUcY13y4mWvIVyfi8/9QffAOZq
	lqGUhpfOjyj9drF9zVujf9CMiShM76OzWqhmKE686w==
X-Google-Smtp-Source: AMsMyM4dmMvnErNdT+EG50rOMSs4+6GMISDdeQKsh40zP/cThOB7W4z3fdNkTClhloLrKI8Q3nD4WYWYaxSIRuB8I74=
X-Received: by 2002:a05:6402:34cc:b0:451:62bf:c816 with SMTP id
 w12-20020a05640234cc00b0045162bfc816mr21023549edc.213.1663689706573; Tue, 20
 Sep 2022 09:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220919223915.5146-1-olof@lixom.net> <20220920061434.ettul5ae2bw6mxme@pengutronix.de>
In-Reply-To: <20220920061434.ettul5ae2bw6mxme@pengutronix.de>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 20 Sep 2022 09:01:34 -0700
Message-ID: <CAOesGMhYLOZ8_hRmw7mY-2bTf65N-06g_YVm2fr-cnV=Y3widA@mail.gmail.com>
Subject: Re: [PATCH] serial: sifive: enable clocks for UART when probed
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_090150_344766_1B76A069 
X-CRM114-Status: GOOD (  22.97  )
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

T24gTW9uLCBTZXAgMTksIDIwMjIgYXQgMTE6MTQgUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIE1vbiwg
U2VwIDE5LCAyMDIyIGF0IDAzOjM5OjE1UE0gLTA3MDAsIE9sb2YgSm9oYW5zc29uIHdyb3RlOgo+
ID4gV2hlbiB0aGUgUFdNIGRyaXZlciB3YXMgY2hhbmdlZCB0byBkaXNhYmxlIGNsb2NrcyBpZiBu
byBQV01zIGFyZSBlbmFibGVkLAo+ID4gaXQgZW5kZWQgdXAgYWxzbyBkaXNhYmxpbmcgdGhlIHNo
YXJlZCBwYXJlbnQgd2l0aCB0aGUgVUFSVCwgc2luY2UgdGhlCj4gPiBVQVJUIGRvZXNuJ3QgZG8g
YW55IGNsb2NrIGVuYWJsZW1lbnQgb24gaXRzIG93bi4KPiA+Cj4gPiBUbyBhdm9pZCB0aGVzZSBz
dXJwcmlzZXMsIGFkZCBjbGtfcHJlcGFyZV9lbmFibGUvY2xrX2Rpc2FibGVfdW5wcmVwYXJlCj4g
PiBjYWxscy4KPiA+Cj4gPiBGaXhlczogYWNlNDFkNzU2NGU2NTUgKCJwd206IHNpZml2ZTogRW5z
dXJlIHRoZSBjbGsgaXMgZW5hYmxlZCBleGFjdGx5IG9uY2UgcGVyIHJ1bm5pbmcgUFdNIikKPiA+
IENjOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+
ID4gQ2M6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmlj
YWwuY29tPgo+ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPiBD
YzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9m
Zi1ieTogT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20ubmV0Pgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy90dHkvc2VyaWFsL3NpZml2ZS5jIHwgMTQgKysrKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2
ZS5jCj4gPiBpbmRleCA1YzNhMDc1NDZhNTguLjc1MWY5ODA2ODgwNiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NpZml2ZS5jCj4gPiBAQCAtOTUwLDIzICs5NTAsMjggQEAgc3RhdGljIGludCBzaWZpdmVfc2Vy
aWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgICAgICAg
IGRldl9lcnIoJnBkZXYtPmRldiwgInVuYWJsZSB0byBmaW5kIGNvbnRyb2xsZXIgY2xvY2tcbiIp
Owo+ID4gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjbGspOwo+ID4gICAgICAgfQo+ID4g
KyAgICAgY2xrX3ByZXBhcmVfZW5hYmxlKGNsayk7Cj4KPiBUaGUgcmV0dXJuIGNvZGUgb2YgY2xr
X3ByZXBhcmVfZW5hYmxlKCkgbXVzdCBiZSBjaGVja2VkLiBBbHNvIHRoZXJlIGlzIGEKPiBzaW1w
bGVyIHBhdGNoIHRvIGZpeCB0aGF0IHByb2JsZW0uIEkgZGlkbid0IHRlc3QgYnV0IEkgZXhwZWN0
IGp1c3QgZG9pbmcKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKPiBpbmRleCA1YzNhMDc1NDZhNTguLjRiMWQ0
ZmU4NDU4ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKPiArKysg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKPiBAQCAtOTQ1LDcgKzk0NSw3IEBAIHN0YXRp
YyBpbnQgc2lmaXZlX3NlcmlhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihiYXNlKTsKPiAgICAgICAgIH0KPgo+IC0g
ICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOwo+ICsgICAgICAgY2xr
ID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gICAgICAgICBpZiAo
SVNfRVJSKGNsaykpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAidW5h
YmxlIHRvIGZpbmQgY29udHJvbGxlciBjbG9ja1xuIik7Cj4gICAgICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKGNsayk7Cj4KPiB3b3VsZCBiZSBlbm91Z2ggYW5kIGFsc28gY2FyZXMgZm9yIGRp
c2FibGluZyB0aGUgY2xvY2sgb24gcmVtb3ZlLgoKWWVwLCB0aGFua3MgZm9yIHBvaW50aW5nIHRo
YXQgb3V0LiB2MiBzZW50IG91dCAoYWZ0ZXIgdGVzdCkuCgoKLU9sb2YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
