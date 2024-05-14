Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC229C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVylsh5jgs5mM2uPEfVGgeiY4eaB4n8Jsq/JK10w8QI=; b=Ox4NoLBwN68kNV
	Hd2AVGxkz4fxDE8QGsyeY1vixBi/BW8TwKsp3TtGjotbfmqI1IoCe8czEoG+GA9+0HIFKNPIvXV11
	lZq3PQQPqBxV4gysPUVm4Wm770SXvAraYCyOsHgxzTfPpg2bLp8kdi+My8mANO4C2rP5NN0i2+o3U
	0OrhZmk4uKrrwAgm4P8EpOAZkVD7gVrB5Vd3nN+rczRjSBExUvqVTRRwxelV1OMDxH61vSi3gVrUe
	KenkTvwjw2KBgBbhnS/rDCGN5Y5UTOhmf8QWAtxKzBBFgBPvaF2rTD/XlxGZBntyXXsWBFvUIVmpp
	+MbloRkGwmP+jecGtC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6nBG-0000000FJ5v-1YKJ;
	Tue, 14 May 2024 08:06:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6nBC-0000000FJ4x-1qTH
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 08:06:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-420197fba0eso2035895e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715673992; x=1716278792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjopg8Hd6ezoM2VPeWMeiUlmhpM5PP4esFYOJITTIpM=;
        b=M903BIS0p0DekfgE87mGsWk9D8Jo9z/MuBow0nm98Vmdqc43XikjnIw1fy3Lz9v9qG
         eBt92i+rIQvbjCTgkiBvsD5FcxBCIUbunc69mQq2PjUXxUMWlt3gN/yvFs918cJ9bHdK
         QikOLxlgaTH65Rb7AUVa+77oHA2RguLcGJTf3AAzRFqcD3zhS2GK8bM0TyiaS4TWb4cZ
         irh3OLmKmWEhZELBqvKNUiWwRwgEMh9QrCT5IBOPqh9BTkrFbLNA/WE70XLdP9zOulNW
         DHZfbDZehhqFyHiHuQE2TZ0wv4aX1JA0RieNm+H8Hs5sC+9hdPGAOPxYPM0TWrDJ6ysq
         HE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715673992; x=1716278792;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pjopg8Hd6ezoM2VPeWMeiUlmhpM5PP4esFYOJITTIpM=;
        b=tF32v/lGf6/7VI99cc1q+Sn6KLvvUFoliMad+J6C3yPXjzlphIHWdodlojdgVOpaEF
         SJLBIItYbSdLMdXBKL9a5lKY54GEWM+MDUhBVv/BzU7CZQ/m73HFPBR5Rk5SG2McPRTL
         S9BxUwkQgi6bPhamezxG11a6UrX50VMDOLGT+KATaGOHn+kiDt2YrUYEZik+4i+UzsYv
         +EhRj02k2nOBEJ89fw7KmrP99uV/KPNKndR8waOtaEEcxFT7POAH7vl20E/9b5uT8CVm
         uTB0CTg1/osAzmvf0f6gSyUQREduY+5xJmop6SQi11jF4iVvh+M2nB204DYPtFIZ0kvG
         ZEng==
X-Forwarded-Encrypted: i=1; AJvYcCVlo7pczqL809vR1W1FRbi1/pyWu0OFlcZTfDTsHxohjL341tPgTVCjRvCYwz3azywb2kb1zVxKX7Z/A2i+v+eTT78yGM+kqfPJR1ALi/Zb
X-Gm-Message-State: AOJu0Yz472NLSGX2X3ihDo10wpvs4HxsMlZwjq5TJfz1ARQwhVqUdXgR
	vvM2MqoN4sp0hiH98l7cI+HEpZtNXQtsWbWioDXU2fpN2EmGLKoqyL8ODnSzuuQ=
X-Google-Smtp-Source: AGHT+IHrTYyJeDAN6oeeNkuklJ3k4rzrTPEj0NJCPsHETslMiuk4YMPVJXS8JcMds7tACAEYtoHs+w==
X-Received: by 2002:adf:ff92:0:b0:34d:8ccf:c9ce with SMTP id ffacd0b85a97d-3504a967162mr8354223f8f.5.1715673992206;
        Tue, 14 May 2024 01:06:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9? ([2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896b0bsm13038230f8f.46.2024.05.14.01.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 01:06:31 -0700 (PDT)
Message-ID: <e33b8eba-85f0-44b7-8a6f-802a6979f6c8@rivosinc.com>
Date: Tue, 14 May 2024 10:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Subject: Re: [RFC PATCH 5/7] riscv: add double trap driver
To: Deepak Gupta <debug@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-6-cleger@rivosinc.com>
 <Ziw//90J0WfOY/tl@debug.ba.rivosinc.com>
Content-Language: en-US
In-Reply-To: <Ziw//90J0WfOY/tl@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_010634_530706_4D3686A6 
X-CRM114-Status: GOOD (  25.48  )
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

CgpPbiAyNy8wNC8yMDI0IDAxOjU5LCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDQ6MjY6NDRQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgYSBzbWFsbCBkcml2ZXIgdG8gcmVxdWVzdCBkb3VibGUgdHJhcCBlbmFibGluZyBhcyB3ZWxs
IGFzCj4+IHJlZ2lzdGVyaW5nIGEgU1NFIGhhbmRsZXIgZm9yIGRvdWJsZSB0cmFwLiBUaGlzIHdp
bGwgYWxzbyBiZSB1c2VkIGJ5IEtWTQo+PiBTQkkgRldGVCBleHRlbnNpb24gc3VwcG9ydCB0byBk
ZXRlY3QgaWYgaXQgaXMgcG9zc2libGUgdG8gZW5hYmxlIGRvdWJsZQo+PiB0cmFwIGluIFZTLW1v
ZGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KPj4gLS0tCj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmjCoMKgwqAgfMKgIDEg
Kwo+PiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWfCoMKgwqDCoMKgwqDCoCB8wqAgNyArKysKPj4g
ZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZcKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IGRyaXZlcnMv
ZmlybXdhcmUvcmlzY3ZfZGJsdHJwLmMgfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPj4gaW5jbHVkZS9saW51eC9yaXNjdl9kYmx0cnAuaMKgwqDCoCB8IDE5ICsrKysrKysK
Pj4gNSBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKQo+PiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdl9kYmx0cnAuYwo+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC9yaXNjdl9kYmx0cnAuaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4gaW5k
ZXggNzQ0YWExNzk2YzkyLi45Y2Q0Y2E2NjQ4N2MgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+
PiBAQCAtMzE0LDYgKzMxNCw3IEBAIGVudW0gc2JpX3NzZV9hdHRyX2lkIHsKPj4gI2RlZmluZSBT
QklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1BJRcKgwqDCoCAoMSA8PCAyKQo+Pgo+PiAj
ZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUkFTwqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwMAo+
PiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9UUkFQwqDCoMKgIDB4MDAwMDAw
MDEKPj4gI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9SQVPCoMKgwqAgMHgwMDAwODAwMAo+
PiAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VwqDCoMKgwqDCoMKgwqAgMHgwMDAxMDAw
MAo+PiAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkXCoMKgwqAgMHhmZmZmMDAw
MAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnIGIvZHJpdmVycy9maXJt
d2FyZS9LY29uZmlnCj4+IGluZGV4IDU5ZjYxMTI4ODgwNy4uYTAzN2Y2ZTg5OTQyIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9maXJtd2Fy
ZS9LY29uZmlnCj4+IEBAIC0xOTcsNiArMTk3LDEzIEBAIGNvbmZpZyBSSVNDVl9TU0VfVEVTVAo+
PiDCoMKgwqDCoMKgIFNlbGVjdCBpZiB5b3Ugd2FudCB0byBlbmFibGUgU1NFIGV4dGVuc2lvbiB0
ZXN0aW5nIGF0IGJvb3QgdGltZS4KPj4gwqDCoMKgwqDCoCBUaGlzIHdpbGwgcnVuIGEgc2VyaWVz
IG9mIHRlc3Qgd2hpY2ggdmVyaWZpZXMgU1NFIHNhbml0eS4KPj4KPj4gK2NvbmZpZyBSSVNDVl9E
QkxUUlAKPj4gK8KgwqDCoCBib29sICJFbmFibGUgRG91YmxlIHRyYXAgaGFuZGxpbmciCj4+ICvC
oMKgwqAgZGVwZW5kcyBvbiBSSVNDVl9TU0UgJiYgUklTQ1ZfU0JJCj4+ICvCoMKgwqAgZGVmYXVs
dCBuCj4+ICvCoMKgwqAgaGVscAo+PiArwqDCoMKgwqDCoCBTZWxlY3QgaWYgeW91IHdhbnQgdG8g
ZW5hYmxlIFNTRSBkb3VibGUgdHJhcCBoYW5kbGVyLgo+PiArCj4+IGNvbmZpZyBTWVNGQgo+PiDC
oMKgwqDCoGJvb2wKPj4gwqDCoMKgwqBzZWxlY3QgQk9PVF9WRVNBX1NVUFBPUlQKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUgYi9kcml2ZXJzL2Zpcm13YXJlL01ha2Vm
aWxlCj4+IGluZGV4IGZiN2IwYzA4YzU2ZC4uYWQ2N2ExNzM4YzBmIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2Zpcm13YXJlL01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvTWFrZWZp
bGUKPj4gQEAgLTE4LDYgKzE4LDcgQEAgb2JqLSQoQ09ORklHX1JBU1BCRVJSWVBJX0ZJUk1XQVJF
KSArPSByYXNwYmVycnlwaS5vCj4+IG9iai0kKENPTkZJR19GV19DRkdfU1lTRlMpwqDCoMKgICs9
IHFlbXVfZndfY2ZnLm8KPj4gb2JqLSQoQ09ORklHX1JJU0NWX1NTRSnCoMKgwqDCoMKgwqDCoCAr
PSByaXNjdl9zc2Uubwo+PiBvYmotJChDT05GSUdfUklTQ1ZfU1NFX1RFU1QpwqDCoMKgICs9IHJp
c2N2X3NzZV90ZXN0Lm8KPj4gK29iai0kKENPTkZJR19SSVNDVl9EQkxUUlApwqDCoMKgICs9IHJp
c2N2X2RibHRycC5vCj4+IG9iai0kKENPTkZJR19TWVNGQinCoMKgwqDCoMKgwqDCoCArPSBzeXNm
Yi5vCj4+IG9iai0kKENPTkZJR19TWVNGQl9TSU1QTEVGQinCoMKgwqAgKz0gc3lzZmJfc2ltcGxl
ZmIubwo+PiBvYmotJChDT05GSUdfVElfU0NJX1BST1RPQ09MKcKgwqDCoCArPSB0aV9zY2kubwo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdl9kYmx0cnAuYwo+PiBiL2RyaXZl
cnMvZmlybXdhcmUvcmlzY3ZfZGJsdHJwLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi43MmY5YTA2N2U4N2EKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9k
cml2ZXJzL2Zpcm13YXJlL3Jpc2N2X2RibHRycC5jCj4+IEBAIC0wLDAgKzEsOTUgQEAKPj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPj4gKy8qCj4+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjMgUml2b3MgSW5jLgo+PiArICovCj4gCj4gbml0OiBmaXggY29weXJpZ2h0
IHllYXIKPj4gKwo+PiArI2RlZmluZSBwcl9mbXQoZm10KSAicmlzY3YtZGJsdHJwOiAiIGZtdAo+
PiArCj4+ICsjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5o
Pgo+PiArI2luY2x1ZGUgPGxpbnV4L3Jpc2N2X2RibHRycC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L3Jpc2N2X3NzZS5oPgo+PiArCj4+ICsjaW5jbHVkZSA8YXNtL3NiaS5oPgo+PiArCj4+ICtzdGF0
aWMgYm9vbCBkb3VibGVfdHJhcF9lbmFibGVkOwo+PiArCj4+ICtzdGF0aWMgaW50IHJpc2N2X3Nz
ZV9kYmx0cnBfaGFuZGxlKHVpbnQzMl90IGV2dCwgdm9pZCAqYXJnLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiArewo+PiAr
wqDCoMKgIF9fc2hvd19yZWdzKHJlZ3MpOwo+PiArwqDCoMKgIHBhbmljKCJEb3VibGUgdHJhcCAh
XG4iKTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+IEN1cmlvdXM6Cj4gRG9lcyBwYW5pYyBy
ZXR1cm4/Cj4gV2hhdCdzIHRoZSBwb2ludCBvZiByZXR1cm5pbmcgZnJvbSBoZXJlPwoKSGkgRGVl
cGFrLAoKTm8sIHBhbmljKCkgZG9lcyBub3QgcmV0dXJuIGFuZCBpbmRlZWQsIHRoZSAicmV0dXJu
IDAiIGlzIHVzZWxlc3MuIEl0J3MKYSBsZWZ0b3ZlciBvZiBhIHByZXZpb3VzIGltcGxlbWVudGF0
aW9uIHdpdGhvdXQgcGFuaWMgaW4gb3JkZXIgdG8ga2VlcApHQ0MgbW91dGggc2h1dCA7KS4KCj4g
Cj4+ICt9Cj4+ICsKPj4gK3N0cnVjdCBjcHVfZGJsdHJwX2RhdGEgewo+PiArwqDCoMKgIGludCBl
cnJvcjsKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyB2b2lkCj4+ICtzYmlfY3B1X2VuYWJsZV9kb3Vi
bGVfdHJhcCh2b2lkICpkYXRhKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBzYmlyZXQgcmV0Owo+
PiArwqDCoMKgIHN0cnVjdCBjcHVfZGJsdHJwX2RhdGEgKmNkZCA9IGRhdGE7Cj4+ICsKPj4gK8Kg
wqDCoCByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlRfU0VULAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTQklfRldGVF9ET1VCTEVfVFJBUF9FTkFCTEUsIDEsIDAs
IDAsIDAsIDApOwo+PiArCj4+ICvCoMKgwqAgaWYgKHJldC5lcnJvcikgewo+PiArwqDCoMKgwqDC
oMKgwqAgY2RkLT5lcnJvciA9IDE7Cj4+ICvCoMKgwqDCoMKgwqDCoCBwcl9lcnIoIkZhaWxlZCB0
byBlbmFibGUgZG91YmxlIHRyYXAgb24gY3B1ICVkXG4iLAo+PiBzbXBfcHJvY2Vzc29yX2lkKCkp
Owo+PiArwqDCoMKgIH0KPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBzYmlfZW5hYmxlX2RvdWJs
ZV90cmFwKHZvaWQpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGNwdV9kYmx0cnBfZGF0YSBjZGQg
PSB7MH07Cj4+ICsKPj4gK8KgwqDCoCBvbl9lYWNoX2NwdShzYmlfY3B1X2VuYWJsZV9kb3VibGVf
dHJhcCwgJmNkZCwgMSk7Cj4+ICvCoMKgwqAgaWYgKGNkZC5lcnJvcikKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAtMTsKPiAKPiBUaGVyZSBpcyBhIGJ1ZyBoZXJlLiBJZiBgc2JpX2NwdV9lbmFi
bGVfZG91YmxlX3RyYXBgIGZhaWxlZCBvbiBhbGwgY3B1cwo+IGJ1dCBsYXN0IGNwdS4KPiBUaGVu
IGNkZC5lcnJvciB3b3VsZCBub3QgcmVjb3JkIGVycm9yIGFuZCB3aWxsIGJlIHJlZmxlY3QgYXMg
aWYgZG91YmxlCj4gdHJhcCB3YXMgZW5hYmxlZC4KCmNkZC5lcnJvciBpcyBvbmx5IHdyaXR0ZW4g
aW4gY2FzZSBvZiBlcnJvciBieSB0aGUgcGVyLWNwdSBjYWxsYmFja3MsIHNvCml0IGlzIG9ubHkg
c2V0IGlmIGVuYWJsZWQgZmFpbGVkLiBJcyB0aGVyZSBzb21ldGhpbmcgSSdtIG1pc3NpbmcgPwoK
VGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gSXRzIGxlc3MgbGlrZWx5IHRvIGhhcHBlbiB0aGF0IEZX
IHdvdWxkIHJldHVybiBzdWNjZXNzIGZvciBvbmUgY3B1IGFuZAo+IGZhaWwgZm9yIG90aGVycy4K
PiBCdXQgdGhlcmUgaXMgbm9uLXplcm8gcHJvYmFibGl0eSBoZXJlLgo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
