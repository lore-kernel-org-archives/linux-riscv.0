Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D18C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:Subject:
	MIME-Version:Date:Message-ID:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjCubFP8wVMGRfnhIQiMK7NaOgT89k30uflszyR6VXY=; b=2pdTOdupCcgHXD
	FaMVr0NGoqFeG5HLo4ocoKo3U1O/I8A999VS5c+uZMfCai5T0BM2Y6/E3O7nu2EpbU5hIxRcGIIFU
	uiHsXx0kf5LTHWco/IQXrO1VnpurOOJpDLT3Clws/YjddK4cTqiAe3XRimFjaft9Pa6gcZNq6W4tz
	02Z5tmCMaGZHmSJQDKbAjsp5llad+ZTjAXBez/RbJwKsev8uveu1K/K6gKZgCwPZL+vZiqdh+1Cxt
	y2VY3pmZ2AGIocdYE3jUfNnvNzMirpKVRPQGKF8g5YoWeHCGZRCdV1B6G0MuHJe42QrIDUONo+81q
	2i7BzQH9peAxVRGoiR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUzI-00000000Amy-3126;
	Mon, 10 Feb 2025 14:42:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUwA-00000000ANT-0iDg
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 14:39:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-438a39e659cso30372195e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 06:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739198341; x=1739803141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zo0VN4ey+NCxOpRRNUPLhuYri5JxBmbs9To1sFVTXQI=;
        b=QMZ26qJmo8M11mWW9r85TObiOKeJJ4xH+2jBaKyNIk/RNRdIFNE0p6aqFH49pk34Pd
         5kfblGS8DQwzQC0i90ybFfqReI92Zrjky3tbjhI4S21ovPhj9AVZi6pv408VexYhqZEL
         yuds8ALvvpkkhCMvRu3Ed04T/etyPaS4L5Dlj8KSlRNjdyrptwV/YLBgRFKtVvLUc544
         fWr7+b5G1/RbjjmU4mKqA7Z4B3r9YYXLTkWxcfBXjudCNyTeeUM+EzVfqu48Te3wgj8X
         RI16Trga1ec8u36DB7bLJG7oDmYK51VUEBn85r3CLqSDno77TTHtW7G8wlo2wpMochP9
         mvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739198341; x=1739803141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo0VN4ey+NCxOpRRNUPLhuYri5JxBmbs9To1sFVTXQI=;
        b=WEzuOPJ7zZnEc2Gczs4LM7+uvNJtKUAJeE3iey+YVcFlqLoEdqQ4fPqV2bxve3eVSh
         D9FoqbaGc7doXxmFgMYphWpUfXK6dT7r2DqbeFUwTOMlyzk4EQ8zzjPlKL7u9RcCXtqX
         Zz8R5I5jCUMlCv1h5UJWwvHKl23beEG24++l3Qz5gYbqejBtNRheHichQMhVWNCsiJot
         /Y3t0AiEUeTlic/t0AoYe0HNwjobi2bMhQ+5H0SywK6srvl7j7N2FHB5/4JO4gFceMzs
         iUerh4qhO1GlCETaXW6/wVso7URcvHo/ro9nfpUv/Y8lhbLhyvl8Wwwk9gIB440OYh3W
         vLqg==
X-Forwarded-Encrypted: i=1; AJvYcCUprBXyNZkRTncpEP3+6sd7oknB2X3/d64bdYgeEaiiAjOjnzC2P4C3HXNigsmMNrCC0jFuoYu+JKFlHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjNjeDzTTbxd09yQTXUPnNJ482kdj09VKfomn0VzJ7nGOh28XL
	x6g2Y7WyEYNWQzL2KXvE47zZOtu/mbq2sVaSYUpfJApfcpU/1kvC7HVCBWUbtYQ=
X-Gm-Gg: ASbGncu9thD6fPcPkMREBrL6NZMjKMk/A/MIlIaZ7pBVNEGR//NnMvMaIErBeuBCKYx
	ku7Jm/5enupq9oHgIK6JrY2BnLvbrPSju5h2kD0yRiURVQSWIHl8Y1zNRU6vPUJ2r82tzZ9L0W6
	JeB8h+DxwfFYw1IeuYzyF73TU47uSc2U2BEmTUix/ukHPjIvAu6jcfhfiuOEmleBuFXkSRy8zq7
	hCz/+B/IC2VjQJhk/wD9E8yjRlEMTTqqplN75vQ6o6NRKqugNoYVdzc4mi2DYzUe/W6vQ71ljgo
	v30XLp9ijAnKfIOZ09nEFEOPSJ3QLgWNQ7NIbH6EovtVmmdVA7AiWClBusfn
X-Google-Smtp-Source: AGHT+IGm5AlxQcuKzP0PEYl2wRs1l7PkvTwrGGHXffc7rJgV/RWXIbNwUCK7tjW///sMOC1+p0rrnA==
X-Received: by 2002:a05:600c:56d0:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-4392dfbd5d8mr83693895e9.13.1739198340511;
        Mon, 10 Feb 2025 06:39:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm45103195e9.23.2025.02.10.06.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:39:00 -0800 (PST)
Message-ID: <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
Date: Mon, 10 Feb 2025 15:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Jesse Taube <jesse@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241206055829.1059293-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063902_206674_18AE1522 
X-CRM114-Status: GOOD (  15.32  )
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

CgpPbiAwNi8xMi8yMDI0IDA2OjU4LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IEFkZCBwYXJzaW5n
IGZvciBaZmJtaW4sIFp2ZmJmbWluLCBadmZiZndtYSBJU0EgZXh0ZW5zaW9uIHdoaWNoCj4gd2Vy
ZSByYXRpZmllZCBpbiA0ZGMyM2Q2MiAoIkFkZGVkIENoYXB0ZXIgdGl0bGUgdG8gQkYxNiIpIG9m
Cj4gdGhlIHJpc2N2LWlzYS1tYW51YWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90
byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oIHwgMyArKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMyArKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCj4gaW5kZXggODY5ZGEwODIyNTJhLi4xNGNjMjlmMmE3MjMgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gQEAgLTEwMCw2ICsxMDAsOSBAQAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WklDQ1JTRQkJOTEKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NWQURFCQk5Mgo+ICAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfU1ZBRFUJCTkzCj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkJGTUlO
CQk5NAo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGQkZNSU4JCTk1Cj4gKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aVkZCRldNQQkJOTYKPiAgCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElO
VVhFTlZDRkcJMTI3Cj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCBjMDkxNmVkMzE4
YzIuLjVjZmNhYjEzOTU2OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMzQxLDYg
KzM0MSw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtd
ID0gewo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NWX0lTQV9FWFRfWkFDQVMp
LAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemF3cnMsIFJJU0NWX0lTQV9FWFRfWkFXUlMpLAo+
ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZhLCBSSVNDVl9JU0FfRVhUX1pGQSksCj4gKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6ZmJmbWluLCBSSVNDVl9JU0FfRVhUX1pGQkZNSU4pLAoKSGkgSW5v
Y2hpLAoKWW91IGNvdWxkIGFkZCBhIHZhbGlkYXRpb24gY2FsbGJhY2sgdG8gdGhhdCBleHRlbnNp
b246CgpzdGF0aWMgaW50IHJpc2N2X2V4dF9mX2RlcGVuZHMoY29uc3Qgc3RydWN0IHJpc2N2X2lz
YV9leHRfZGF0YSAqZGF0YSwKCQkJICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRt
YXApCnsKCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJ
U0NWX0lTQV9FWFRfZikpCgkJcmV0dXJuIDA7CgoJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cn0KCiAg
Li4uCiAgX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoemZiZm1pbiwgUklTQ1ZfSVNBX0VY
VF9aRkJGTUlOLApyaXNjdl9leHRfZl9kZXBlbmRzKSwKCgpCdXQgSSdtIG9rIHdpdGggdGhlIGN1
cnJlbnQgc3RhdGUgb2YgdGhhdCBwYXRjaCBzaW5jZSBJIGhhdmUgdGhlIHNhbWUKdGhpbmcgY29t
aW5nIGZvciBvdGhlciBleHRlbnNpb25zIGFzIHdlbGwuIFNvIHdpdGggb3Igd2l0aG91dCBteQpw
cmV2aW91cyBjb21tZW50IGZpeGVkOgoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50Cgo+ICAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoemZoLCBSSVNDVl9JU0FfRVhUX1pGSCksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWkZITUlOKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpj
YSwgUklTQ1ZfSVNBX0VYVF9aQ0EpLAo+IEBAIC0zNzMsNiArMzc0LDggQEAgY29uc3Qgc3RydWN0
IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJU0NWX0lTQV9F
WFRfU1VQRVJTRVQoenZlNjRkLCBSSVNDVl9JU0FfRVhUX1pWRTY0RCwgcmlzY3ZfenZlNjRkX2V4
dHMpLAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2ZTY0ZiwgUklTQ1ZfSVNBX0VYVF9a
VkU2NEYsIHJpc2N2X3p2ZTY0Zl9leHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6
dmU2NHgsIFJJU0NWX0lTQV9FWFRfWlZFNjRYLCByaXNjdl96dmU2NHhfZXh0cyksCj4gKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dmZiZm1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZCRk1JTiksCj4gKwlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6dmZiZndtYSwgUklTQ1ZfSVNBX0VYVF9aVkZCRldNQSksCj4g
IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZoLCBSSVNDVl9JU0FfRVhUX1pWRkgpLAo+ICAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZITUlOKSwKPiAgCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZLQiksCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
