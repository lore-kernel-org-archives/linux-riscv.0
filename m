Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59759CAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4Hpm6f0J1VCxBe8Uwgs/++TjKEcSGN4beN87PVVF8s=; b=JhGjeZs5IFmp5u
	yE6EptECNA9CW6ns4yB8QEYSSAycFuQ57PZf/vuJ+zq4JrX8/2QoieslTwp2b9yWxd9OxsmM93TC4
	i1C83Y7p6qnALP1WYUzXwxi7KXizFJvqKspK+WUjE4CQevScZrBs4nkMbSgEpjAoZmj5mXtz9bzQ1
	hD8kA1c9vWqrdNt3FX542bHOrxaUlwqd98Sf4Re3l+9KXUTNVdcodh1vnXfKeeJ9MdTpAq0q7gywq
	kRKcF6kkpxF9M5hyx20kCNI5Ip1d2JGO60biYqqgLxj5O4VM4WTbReXqhf2BHVoTIpjXFp8kL6puu
	a+F5+aqkN/VUnKg7Bw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bxZ-00000009kEn-1VK8;
	Mon, 22 Sep 2025 08:31:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bxW-00000009kDd-3sbO
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 08:31:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3ef166e625aso1996416f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758529901; x=1759134701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97lwVNlj4fcnM/Rf6y7n2gTeJuJTiJv3CIcVJBpEWgw=;
        b=XxZNCuy3A5PNZT6nq1h04QBnZEhxvxi2hc9nvxcPfNXZSwq3ZR0qrIGFeqEyGzItCD
         oEr2h9xZocKGbXcMzdUjqtqB4837cTBqVoDOktO+E/bjGNDIVJcjXL8VOVj5mGUN0Mnx
         6oCLqtOHk3O6nTKJXKG95Ta4c17hWVnSx+FEd9tAePHgtgT7eaxXwbW+P9b8AhjNyp/V
         VhvYLaEta//f2n70K7jzmEEcwuSn4ZBMIx8B41+g6eYyMvFE9+Wt4aVNogG2yUTYkEHm
         LE0+mqsXBbuFSPzaRd6rMh5rU7GdFTv+W5gFedc0p2oLwVS9yKEAhBKIKhRfmamdfGrZ
         ObLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529901; x=1759134701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97lwVNlj4fcnM/Rf6y7n2gTeJuJTiJv3CIcVJBpEWgw=;
        b=plJgSig4uHK3y4G7h6UHHq2TVU5SPKsCTTEFbFTUk9l9tjwctUmtecyxBHooPspehy
         EbFBfvTwPbemAgA+yCTZx/qYg2XgicPvCYCBphWI2Cj0T/a0D8fg2M2/k+xzI1v9e6O+
         6jNCycPihQd7MuggDWgbwq4wjokC0ItNGn+qx4gTzrdXh4pGbiHjYYpySamWrSXwzlQl
         V/z7cTSdiE446Svfmo9f00uhGlhw78kMS7s9E6qZ3BZlrB4g40F/2AiU6FV0d53RMk4H
         AxguHz82KqObyvPUVujRTXEdThNsM1/rFi0RzahszhLeXzDfYcCfAyTwfWMZSJ6JJkcY
         qGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDF7FVPRJVDKGK771D13kgvi/nwkV+jWgVQDmzZMjgXTXkPks5mg9/cKfNo8nE1o73lLf/muE5BM78BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysPKPyTNQfeq1ftB+CIjBWu8kCZ+nDd+9hJ4x59Sq4WG98QuY1
	jmF8YCXDlFSJYKZhyiUT55qbk7N4kQ5g2+yo9GxdqL9R9lpYMxo3MVoFRnPnAjLJqVw=
X-Gm-Gg: ASbGncsGhCzXPo80ll57BOrGBPGtqddhDPM/7NPHRJfxRmvJ8KeEVXbSS6pix+4nf2D
	1iFDNB6M/RXz4DZ0oP5ej+iT+imxM9iNNFN8067gdIxJf5Ug/ziOQrLoItefqSea4ayJDO2WYnl
	kKESCBdWm2+lPFewyPbZdio2JxEYlnrSt/W/jwvI4XvVQoSUq2/QFf1uULJIFHqatAHqjlEkdpu
	74WUI6slAZKMKtja5ypEbHB4PPrVV44PGSXm+kr11Bh8hrxWq7fHFGdGvbuSjaD2gLQPcAYoZR0
	cgiI2wuZL5mOPz28YxKZ4w75RRy2geogE2kX/N+ODz9MBxBKyuvWIGdI8thPdcRJ40v+Jz5x4Vb
	acWwZCtmdiKzUGxUk0fv9mq7m1kgBcnw0hpbSzf7waJ5eTSMGFtuqwv5lQwmqVVVtZ1I=
X-Google-Smtp-Source: AGHT+IF0qMgnELSsh/SaUjjhvEZ5H2dsiw2RvHN61r4yu8dmqfDrHJsQn6VYJ97UynNVG/ZYSAEKyw==
X-Received: by 2002:a05:6000:420e:b0:3e4:f194:2872 with SMTP id ffacd0b85a97d-3ee8435a56fmr9939669f8f.31.1758529900679;
        Mon, 22 Sep 2025 01:31:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fc00a92sm19031245f8f.63.2025.09.22.01.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 01:31:40 -0700 (PDT)
Message-ID: <52792fdf-e12f-4de5-ad9e-069a0f2fef42@rivosinc.com>
Date: Mon, 22 Sep 2025 10:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, conor@kernel.org, atishp@rivosinc.com,
 ajones@ventanamicro.com, apatel@ventanamicro.com, mchitale@ventanamicro.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com>
 <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
 <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
 <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_013143_145605_BC0AD9E9 
X-CRM114-Status: GOOD (  23.71  )
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

CgpPbiAyMi8wOS8yMDI1IDEwOjExLCB5dW5odWkgY3VpIHdyb3RlOgo+IEhpIENsw6ltZW50LAo+
IAo+IE9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDM6NTLigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIENsw6ltZW50LAo+Pgo+PiBPbiBGcmks
IFNlcCAxOSwgMjAyNSBhdCAzOjE44oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPiB3cm90ZToKPj4+Cj4+Pgo+Pj4KPj4+IE9uIDE5LzA5LzIwMjUgMDk6MDAsIFl1bmh1
aSBDdWkgd3JvdGU6Cj4+Pj4gVW5rbm93biBOTUkgY2FuIGZvcmNlIHRoZSBrZXJuZWwgdG8gcmVz
cG9uZCAoZS5nLiwgcGFuaWMpIHdoZW4gdGhlCj4+Pj4gc3lzdGVtIGVuY291bnRlcnMgdW5yZWNv
Z25pemVkIGNyaXRpY2FsIGhhcmR3YXJlIGV2ZW50cywgYWlkaW5nIGluCj4+Pj4gdHJvdWJsZXNo
b290aW5nIHN5c3RlbSBmYXVsdHMuIFRoaXMgaXMgaW1wbGVtZW50ZWQgdmlhIHRoZSBTdXBlcnZp
c29yCj4+Pj4gU29mdHdhcmUgRXZlbnRzIChTU0UpIGZyYW1ld29yay4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+Pj4+IC0tLQo+
Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICB8ICAxICsKPj4+PiAgZHJpdmVy
cy9maXJtd2FyZS9yaXNjdi9LY29uZmlnICAgfCAxMCArKysrKwo+Pj4+ICBkcml2ZXJzL2Zpcm13
YXJlL3Jpc2N2L01ha2VmaWxlICB8ICAxICsKPj4+PiAgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9z
c2Vfbm1pLmMgfCA3NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICA0IGZp
bGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
Pj4+PiBpbmRleCA4NzRjYzFkNzYwM2E1Li41ODAxZjkwYTg4ZjYyIDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NiaS5oCj4+Pj4gQEAgLTQ4MSw2ICs0ODEsNyBAQCBlbnVtIHNiaV9zc2VfYXR0cl9p
ZCB7Cj4+Pj4KPj4+PiAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMg
ICAgMHgwMDAwMDAwMAo+Pj4+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfRE9VQkxFX1RS
QVAgICAgICAgICAgICAgIDB4MDAwMDAwMDEKPj4+PiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xP
Q0FMX1VOS05PV05fTk1JICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDIKPj4+Cj4+PiBX
YXMgdGhpcyBzdWJtaXR0ZWQgdG8gdGhlIFBSUyBXRyA/IFRoaXMgYSBzcGVjaWZpY2F0aW9uIG1v
ZGlmaWNhdGlvbiBzbwo+Pj4gaXQgc2hvdWxkIGdvIHRocm91Z2ggdGhlIHVzdWFsIHByb2Nlc3Mu
Cj4+Pgo+Pj4+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX0hJR0hfUFJJT19SQVMgICAw
eDAwMDA4MDAwCj4+Pj4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9QTVVfT1ZFUkZMT1cg
ICAgIDB4MDAwMTAwMDAKPj4+PiAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0xPV19QUklP
X1JBUyAgICAgMHgwMDEwMDAwMAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jp
c2N2L0tjb25maWcgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPj4+PiBpbmRleCBl
ZDViNjYzYWM1ZjkxLi43NDZiYWM4NjJhYzQ2IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZmly
bXdhcmUvcmlzY3YvS2NvbmZpZwo+Pj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2Nv
bmZpZwo+Pj4+IEBAIC0xMiw0ICsxMiwxNCBAQCBjb25maWcgUklTQ1ZfU0JJX1NTRQo+Pj4+ICAg
ICAgICAgdGhpcyBvcHRpb24gcHJvdmlkZXMgc3VwcG9ydCB0byByZWdpc3RlciBjYWxsYmFja3Mg
b24gc3BlY2lmaWMgU1NFCj4+Pj4gICAgICAgICBldmVudHMuCj4+Pj4KPj4+PiArY29uZmlnIFJJ
U0NWX1NTRV9VTktOT1dOX05NSQo+Pj4+ICsgICAgIGJvb2wgIkVuYWJsZSBTQkkgU3VwZXJ2aXNv
ciBTb2Z0d2FyZSBFdmVudHMgdW5rbm93biBOTUkgc3VwcG9ydCIKPj4+PiArICAgICBkZXBlbmRz
IG9uIFJJU0NWX1NCSV9TU0UKPj4+PiArICAgICBkZWZhdWx0IHkKPj4+PiArICAgICBoZWxwCj4+
Pj4gKyAgICAgICBUaGlzIG9wdGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIGRlbGl2ZXJpbmcgdW5r
bm93biBOb24tTWFza2FibGUgSW50ZXJydXB0IChOTUkpCj4+Pj4gKyAgICAgICBub3RpZmljYXRp
b25zIHZpYSB0aGUgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMgKFNTRSkgZnJhbWV3b3JrLiBX
aGVuIGVuYWJsZWQsCj4+Pj4gKyAgICAgICB1bmtub3duIE5NSXMgY2FuIHRyaWdnZXIga2VybmVs
IHJlc3BvbnNlcyAoZS5nLiwgcGFuaWMpIGZvciB1bnJlY29nbml6ZWQgY3JpdGljYWwKPj4+PiAr
ICAgICAgIGhhcmR3YXJlIGV2ZW50cywgYWlkaW5nIGluIHN5c3RlbSBmYXVsdCBkaWFnbm9zaXMu
Cj4+Pj4gKwo+Pj4+ICBlbmRtZW51Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUv
cmlzY3YvTWFrZWZpbGUgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlCj4+Pj4gaW5k
ZXggYzg3OTVkNGJiYjJlYS4uOTI0MmM2Y2Q1ZTNlOSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlCj4+Pj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9yaXNj
di9NYWtlZmlsZQo+Pj4+IEBAIC0xLDMgKzEsNCBAQAo+Pj4+ICAjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4+Pj4KPj4+PiAgb2JqLSQoQ09ORklHX1JJU0NWX1NCSV9TU0UpICAg
ICAgICAgICs9IHJpc2N2X3NiaV9zc2Uubwo+Pj4+ICtvYmotJChDT05GSUdfUklTQ1ZfU1NFX1VO
S05PV05fTk1JKSAgKz0gc3NlX25taS5vCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdh
cmUvcmlzY3Yvc3NlX25taS5jIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9zc2Vfbm1pLmMKPj4+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjQzMDYzZjQy
ZWZmZjAKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9yaXNj
di9zc2Vfbm1pLmMKPj4+PiBAQCAtMCwwICsxLDc3IEBACj4+Pj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKwo+Pj4+ICsKPj4+PiArI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4+
Pj4gKyNpbmNsdWRlIDxsaW51eC9ubWkuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3Jpc2N2X3Ni
aV9zc2UuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVnLmg+Cj4+Pj4gKyNpbmNs
dWRlIDxsaW51eC9zeXNjdGwuaD4KPj4+PiArCj4+Pj4gKyNpbmNsdWRlIDxhc20vaXJxX3JlZ3Mu
aD4KPj4+PiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPj4+PiArCj4+Pj4gK2ludCBwYW5pY19vbl91
bmtub3duX25taSA9IDE7Cj4+Pj4gK3N0cnVjdCBzc2VfZXZlbnQgKmV2dDsKPj4+PiArc3RhdGlj
IHN0cnVjdCBjdGxfdGFibGVfaGVhZGVyICp1bmtub3duX25taV9zeXNjdGxfaGVhZGVyOwo+Pj4+
ICsKPj4+PiArY29uc3Qgc3RydWN0IGN0bF90YWJsZSB1bmtub3duX25taV90YWJsZVtdID0gewo+
Pj4+ICsgICAgIHsKPj4+PiArICAgICAgICAgICAgIC5wcm9jbmFtZSAgICAgICA9ICJwYW5pY19l
bmFibGUiLAo+Pj4+ICsgICAgICAgICAgICAgLmRhdGEgICAgICAgICAgID0gJnBhbmljX29uX3Vu
a25vd25fbm1pLAo+Pj4+ICsgICAgICAgICAgICAgLm1heGxlbiAgICAgICAgID0gc2l6ZW9mKGlu
dCksCj4+Pj4gKyAgICAgICAgICAgICAubW9kZSAgICAgICAgICAgPSAwNjQ0LAo+Pj4+ICsgICAg
ICAgICAgICAgLnByb2NfaGFuZGxlciAgID0gcHJvY19kb2ludHZlY19taW5tYXgsCj4+Pj4gKyAg
ICAgICAgICAgICAuZXh0cmExICAgICAgICAgPSBTWVNDVExfWkVSTywKPj4+PiArICAgICAgICAg
ICAgIC5leHRyYTIgICAgICAgICA9IFNZU0NUTF9PTkUsCj4+Pj4gKyAgICAgfSwKPj4+PiArfTsK
Pj4+PiArCj4+Pj4gK3N0YXRpYyB2b2lkIG5taV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQo+Pj4+ICt7Cj4+Pj4gKyAgICAgcHJfZW1lcmcoIk5NSSByZWNlaXZlZCBmb3IgdW5rbm93biBv
biBDUFUgJWQuXG4iLCBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+Pj4+ICsKPj4+PiArICAgICBpZiAo
cGFuaWNfb25fdW5rbm93bl9ubWkpCj4+Pj4gKyAgICAgICAgICAgICBubWlfcGFuaWMocmVncywg
Ik5NSTogTm90IGNvbnRpbnVpbmciKTsKPj4+PiArCj4+Pj4gKyAgICAgcHJfZW1lcmcoIkRhemVk
IGFuZCBjb25mdXNlZCwgYnV0IHRyeWluZyB0byBjb250aW51ZVxuIik7Cj4+Pj4gK30KPj4+Cj4+
PiBJJ20gZGF6ZWQgYW5kIGNvbmZ1c2VkIGFzIHdlbGwgOykgV2hhdCdzIHRoZSBwb2ludCBvZiB0
aGlzIGV4Y2VwdAo+Pj4gaW50ZXJydXB0aW5nIHRoZSBrZXJuZWwgd2l0aCBhIHBhbmljID8gSXQg
c2VlbXMgbGlrZSBpdCdzIGEgYmV0dGVyIGlkZWEKPj4+IHRvIGxldCB0aGUgZmlybXdhcmUgaGFu
ZGxlIHRoYXQgcHJvcGVybHkgYW5kIGRpc3BsYXkgd2hhdGV2ZXIKPj4+IGluZm9ybWF0aW9uIGFy
ZSBuZWVkZWQuIFdhcyB5b3VyIGlkZWEgdG8gYWN0dWFsbHkgZm9yY2UgdGhlIGtlcm5lbCB0bwo+
Pj4gZW50ZXIgaW4gc29tZSBkZWJ1ZyBtb2RlID8KPj4KPj4gVGhlcmUgaXMgYW4gaW1wb3J0YW50
IHNjZW5hcmlvOiB3aGVuIHRoZSBrZXJuZWwgYmVjb21lcyB1bnJlc3BvbnNpdmUsCj4+IHdlIG5l
ZWQgdG8gdHJpZ2dlciBhbiB1bmtub3duIE5NSSB0byBjYXVzZSB0aGUgc3lzdGVtIHRvIHBhbmlj
KCkgYW5kCj4+IHRoZW4gY29sbGVjdCB0aGUgdm1jb3JlLCBhbmQgc3VjaCBhIHJlcXVpcmVtZW50
IGlzIGNvbW1vbiBvbiB4ODYKPj4gc2VydmVycy4KPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4g
Q2zDqW1lbnQKPj4+Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IG5taV9zc2VfaGFuZGxlcih1MzIg
ZXZ0LCB2b2lkICphcmcsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4+ICt7Cj4+Pj4gKyAgICAg
bm1pX2hhbmRsZXIocmVncyk7Cj4+Pj4gKwo+Pj4+ICsgICAgIHJldHVybiAwOwo+Pj4+ICt9Cj4+
Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IHNzZV9ubWlfaW5pdCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gKyAg
ICAgaW50IHJldDsKPj4+PiArCj4+Pj4gKyAgICAgZXZ0ID0gc3NlX2V2ZW50X3JlZ2lzdGVyKFNC
SV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9OTUksIDAsCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG5taV9zc2VfaGFuZGxlciwgTlVMTCk7Cj4gCj4gU2hvdWxkIHdlIGFkZCB0
aGlzIFVOS05PV05fTk1JIGV2ZW50IElEIGluIENoYXB0ZXIgMTcgb2YgdGhlIFNCSSBzcGVjPwoK
SGkgWXVuaHVpLAoKSWYgeW91IHdhbnQgaXQgdG8gYmUgcGFydCBvZiB0aGUgc3BlYywgdGhhdCBz
aG91bGQgaW5kZWVkIGJlIHN1Ym1pdHRlZApmb3IgcmV2aWV3LgoKVGhhbmtzLAoKQ2zDqW1lbnQK
Cj4gCj4gCj4+Pj4gKyAgICAgaWYgKElTX0VSUihldnQpKQo+Pj4+ICsgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoZXZ0KTsKPj4+PiArCj4+Pj4gKyAgICAgcmV0ID0gc3NlX2V2ZW50X2VuYWJs
ZShldnQpOwo+Pj4+ICsgICAgIGlmIChyZXQpIHsKPj4+PiArICAgICAgICAgICAgIHNzZV9ldmVu
dF91bnJlZ2lzdGVyKGV2dCk7Cj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4+ICsg
ICAgIH0KPj4+PiArCj4+Pj4gKyAgICAgdW5rbm93bl9ubWlfc3lzY3RsX2hlYWRlciA9IHJlZ2lz
dGVyX3N5c2N0bCgia2VybmVsIiwgdW5rbm93bl9ubWlfdGFibGUpOwo+Pj4+ICsgICAgIGlmICgh
dW5rbm93bl9ubWlfc3lzY3RsX2hlYWRlcikgewo+Pj4+ICsgICAgICAgICAgICAgc3NlX2V2ZW50
X2Rpc2FibGUoZXZ0KTsKPj4+PiArICAgICAgICAgICAgIHNzZV9ldmVudF91bnJlZ2lzdGVyKGV2
dCk7Cj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPj4+PiArICAgICB9Cj4+Pj4g
Kwo+Pj4+ICsgICAgIHByX2luZm8oIlVzaW5nIFNTRSBmb3IgTk1JIGV2ZW50IGRlbGl2ZXJ5XG4i
KTsKPj4+PiArCj4+Pj4gKyAgICAgcmV0dXJuIDA7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRp
YyBpbnQgX19pbml0IHVua25vd19ubWlfaW5pdCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gKyAgICAgcmV0
dXJuIHNzZV9ubWlfaW5pdCgpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtsYXRlX2luaXRjYWxsKHVu
a25vd19ubWlfaW5pdCk7Cj4+Pgo+Pgo+PiBUaGFua3MsCj4+IFl1bmh1aQo+IAo+IFRoYW5rcywK
PiBZdW5odWkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
