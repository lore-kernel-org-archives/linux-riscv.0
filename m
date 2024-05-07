Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508ABC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 05:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8un4EogaDj3AqDBb7UDQXjxHIDRC731uaGjqwSnaieQ=; b=EB01DA7ZO4iwGH
	gIrAkbZlK/fyiiNGkguYqx5Qbb7y7S/ClLVVWNBm1K6jpdkKM2gsvaJFd/J1XcfNgXyDV8x2E24AB
	qDggUbDQctR/8YkOjgJ+R5MKDf0KL12vyD8lpdtc3JSeJw3T7VCqUQnlkt289WsCfMH4vw87w9ren
	b09l/ILAp/l67VlE3h/Ofm8wIiS88vCGP8WN8QrLTYYl8CFj5hzDWSkCViHhGC0ogPZlUc57WTNnm
	GpzTkC4IuChS+j0L/FW/pEimdb/MBcir/kyEW1/sgNfNUep2WH3c2Vc0nlrpOZliWbM4oek/WkjUl
	2RnS75Nf4cFTRBcT2v0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4DZd-00000009icY-3WDY;
	Tue, 07 May 2024 05:41:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4DZb-00000009ibp-0m1Y
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 05:41:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-34ddc9fe497so1613533f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1715060463; x=1715665263; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kbiGw1I98ggTGFKbaoTCIzpEx78I5vq+dQ9nXNzCpI=;
        b=jik6CGx2VP9LWdTTC/EjSLytPJJEO9/lXsdHG7eu4mU6etphr4jGIj2V7qTad66JDZ
         AWVO2H+SsovruuUO/Sn5+W78uqH4dsfNc/W/Pv7cQ3sJ/lIPgoFEO4MU7OyB5Nva5BX+
         HQ6ZnJKI+Sqn1my4q5KTW44N2WgWDdYEpkX8WaK5j1gqv7yCclQioZbKZ/rSTQa5eyhH
         ts7hd9xIKP8hCZy8fu9a84/3+iO4nI9J3b2F/Y0hw7gBZhD3Ft3npYsFG+5/UgdnPimH
         0Z+ot7SSlhYh2QfOnc2w0ImT5w2rFQOT/WO2N9PyMn78eJBuM4kIxjQmzjEdzGP/pKI/
         piBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060463; x=1715665263;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kbiGw1I98ggTGFKbaoTCIzpEx78I5vq+dQ9nXNzCpI=;
        b=Plsxu/rNrCrvxOVXuUoxyfZP/rke4taSRUI2pQj4KT4+aff6eovf5LptkNzGYlnxZ/
         4VvE2E0vt5mV4xw9QNKzT4hpqCYbNgPNA8xEau22FEep4Tbud0yTqMy86GuE/Fka+uet
         TPOBowT65Yj4PtiEOQebRJ2LiIelQ0ziXi/S5iU40XySlo9u7OK5/zq/hgCdrsQhkqhj
         HX9Af9p5dL41WMfaumw8qhAs34jAUzlHllz6EMuYCfHQneiwGmP+oDLTbxqwf1kxXOT7
         FWROJag/IN0l9eMiblpo+Ax2RGhv28azU8YqS16xzV74SVKqWTn61SqkLc9aazkGlRgo
         T6RA==
X-Forwarded-Encrypted: i=1; AJvYcCWlBgfCpFsYmhx2pSqyNHf0NbpbIOLEi3dRle9MGAmhPlw1oWxz6pZBsMdQLIrLGVAljkcL9HEafYFhL/TpYcxW1/JRdNcl6u/I5w/Yjw0M
X-Gm-Message-State: AOJu0Yz6aGl1QuzQY68vyl6p5SQO3wWk3ZlqANZswN0GsV7u/ofkir+7
	w54RkIov3ajKO8e3Tb59qc2jcJpWKElOgxayZZZPukyPQauRzC2wO5ggQ4JN6uI=
X-Google-Smtp-Source: AGHT+IHa+esdspnEOsUVcm0d3XG+402oGNO03Ku//0E0dzUqeLQ+nfmICyWShJi63tMEMr3wfdEZ2A==
X-Received: by 2002:a5d:4044:0:b0:349:f220:a1cd with SMTP id w4-20020a5d4044000000b00349f220a1cdmr10272654wrp.27.1715060463126;
        Mon, 06 May 2024 22:41:03 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d4903000000b0034dbbcf01f5sm12014714wrq.42.2024.05.06.22.41.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2024 22:41:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 4/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT
 Kconfig option
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240506-compile_kernel_with_extensions-v1-4-5c25c134c097@rivosinc.com>
Date: Tue, 7 May 2024 06:40:52 +0100
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Song Liu <song@kernel.org>,
 Xi Wang <xi.wang@gmail.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <11F5B269-05DD-448E-9F85-878E84A5654F@jrtc27.com>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
 <20240506-compile_kernel_with_extensions-v1-4-5c25c134c097@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_224107_319769_97F73C39 
X-CRM114-Status: GOOD (  24.93  )
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

T24gNyBNYXkgMjAyNCwgYXQgMDI6NDAsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+IAo+IFN2cGJtdCB3b3VsZCBub3QgYmVuZWZpdCBmcm9tIGhhdmluZyBQ
TEFURk9STV9TVVBQT1JUU19SSVNDVl9JU0FfU1ZQQk1UCj4gc28ganVzdCByZW5hbWUgUklTQ1Zf
SVNBX1NWUEJNVCB0byBQTEFURk9STV9NQVlfU1VQUE9SVF9SSVNDVl9JU0FfU1ZQQk1UCj4gYW5k
IG1vdmUgdGhlIGRlZmluaXRpb24gdG8gS2NvbmZpZy5pc2EuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBhcmNoL3Jpc2N2
L0tjb25maWcgICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0KPiBhcmNoL3Jpc2N2L0tjb25maWcu
aXNhIHwgMTcgKysrKysrKysrKysrKysrKysKPiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25m
aWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCA5YzNhNDM0Nzk1M2IuLjIyMzAzYTNhYjU5
ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tj
b25maWcKPiBAQCAtNDg0LDIzICs0ODQsNiBAQCBjb25maWcgUklTQ1ZfQUxURVJOQVRJVkVfRUFS
TFkKPiBoZWxwCj4gIEFsbG93cyBlYXJseSBwYXRjaGluZyBvZiB0aGUga2VybmVsIGZvciBzcGVj
aWFsIGVycmF0YQo+IAo+IC1jb25maWcgUklTQ1ZfSVNBX1NWUEJNVAo+IC0gYm9vbCAiU3ZwYm10
IGV4dGVuc2lvbiBzdXBwb3J0IGZvciBzdXBlcnZpc29yIG1vZGUgcGFnZS1iYXNlZCBtZW1vcnkg
dHlwZXMiCj4gLSBkZXBlbmRzIG9uIDY0QklUICYmIE1NVQo+IC0gZGVwZW5kcyBvbiBSSVNDVl9B
TFRFUk5BVElWRQo+IC0gZGVmYXVsdCB5Cj4gLSBoZWxwCj4gLSAgIEFkZCBzdXBwb3J0IGZvciB0
aGUgU3ZwYm10IElTQS1leHRlbnNpb24gKFN1cGVydmlzb3ItbW9kZToKPiAtICAgcGFnZS1iYXNl
ZCBtZW1vcnkgdHlwZXMpIGluIHRoZSBrZXJuZWwgd2hlbiBpdCBpcyBkZXRlY3RlZCBhdCBib290
Lgo+IC0KPiAtICAgVGhlIG1lbW9yeSB0eXBlIGZvciBhIHBhZ2UgY29udGFpbnMgYSBjb21iaW5h
dGlvbiBvZiBhdHRyaWJ1dGVzCj4gLSAgIHRoYXQgaW5kaWNhdGUgdGhlIGNhY2hlYWJpbGl0eSwg
aWRlbXBvdGVuY3ksIGFuZCBvcmRlcmluZwo+IC0gICBwcm9wZXJ0aWVzIGZvciBhY2Nlc3MgdG8g
dGhhdCBwYWdlLgo+IC0KPiAtICAgVGhlIFN2cGJtdCBleHRlbnNpb24gaXMgb25seSBhdmFpbGFi
bGUgb24gNjQtYml0IGNwdXMuCj4gLQo+IC0gICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRv
IGhlcmUsIHNheSBZLgo+IC0KPiBjb25maWcgVE9PTENIQUlOX0hBU19aQkIKPiBib29sCj4gZGVm
YXVsdCB5Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5pc2EgYi9hcmNoL3Jpc2N2
L0tjb25maWcuaXNhCj4gaW5kZXggMzc1ODViY2Q3NjNlLi41MGUyMTdkYzU3MTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLmlzYQo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5p
c2EKPiBAQCAtMTY4LDMgKzE2OCwyMCBAQCBjb25maWcgUExBVEZPUk1fU1VQUE9SVFNfUklTQ1Zf
SVNBX1NWTkFQT1QKPiAgbm90IHN1cHBvcnQgU3ZuYXBvdC4KPiAKPiBlbmRjaG9pY2UKPiArCj4g
K2NvbmZpZyBSSVNDVl9JU0FfU1ZQQk1UCgpIaSBDaGFybGllLApEZXNwaXRlIHRoZSBzdWJqZWN0
IGFuZCBib2R5IHlvdSBoYXZlbuKAmXQgcmVuYW1lZCBpdCBpbiB0aGlzIHBhdGNoPwoKSmVzcwoK
PiArIGJvb2wgIlN2cGJtdCBleHRlbnNpb24gc3VwcG9ydCBmb3Igc3VwZXJ2aXNvciBtb2RlIHBh
Z2UtYmFzZWQgbWVtb3J5IHR5cGVzIgo+ICsgZGVwZW5kcyBvbiA2NEJJVCAmJiBNTVUKPiArIGRl
cGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUKPiArIGRlZmF1bHQgeQo+ICsgaGVscAo+ICsgICBB
ZGQgc3VwcG9ydCBmb3IgdGhlIFN2cGJtdCBJU0EtZXh0ZW5zaW9uIChTdXBlcnZpc29yLW1vZGU6
Cj4gKyAgIHBhZ2UtYmFzZWQgbWVtb3J5IHR5cGVzKSBpbiB0aGUga2VybmVsIHdoZW4gaXQgaXMg
ZGV0ZWN0ZWQgYXQgYm9vdC4KPiArCj4gKyAgIFRoZSBtZW1vcnkgdHlwZSBmb3IgYSBwYWdlIGNv
bnRhaW5zIGEgY29tYmluYXRpb24gb2YgYXR0cmlidXRlcwo+ICsgICB0aGF0IGluZGljYXRlIHRo
ZSBjYWNoZWFiaWxpdHksIGlkZW1wb3RlbmN5LCBhbmQgb3JkZXJpbmcKPiArICAgcHJvcGVydGll
cyBmb3IgYWNjZXNzIHRvIHRoYXQgcGFnZS4KPiArCj4gKyAgIFRoZSBTdnBibXQgZXh0ZW5zaW9u
IGlzIG9ubHkgYXZhaWxhYmxlIG9uIDY0LWJpdCBjcHVzLgo+ICsKPiArICAgSWYgeW91IGRvbid0
IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgWS4KPiAKPiAtLSAKPiAyLjQ0LjAKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
