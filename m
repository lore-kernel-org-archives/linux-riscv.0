Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3542AC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cvgmTqYoRTeDXbNRwlGyLhVhDy1dw4qC/VH6teGJZE=; b=dWCkKxe+MCVV97
	clOvvOos+Ij6vgx5ETuOd/YpO1SFfAcWwb9BMh0siO/uvYjBK3vhC20w4k6tlmjJydIjl/HTwIuVf
	klbzz0JsYy2kLO11K240yM6jeR8TP7vJ9CLeUK245/H/VW6IvgNooHKz4IzeQtNOFkIrQuiiJqk9a
	b36u0QaXj1OWZmNTddLBuzOvU2GHPJffR6FP+WMarl3UUHdls24vlHnifSmqcID77nzU8vtd8UBBK
	3eF8ecVfCwZBySr2XxMNMSMhxaTG8VdSJj+Mg6tfPyUXk7/A1zhnxVgvnAf2zbd7n6iMVJdZLCRfp
	LKOysceJGIwvF5Dm4OTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkEc-00000009glK-390x;
	Thu, 27 Jun 2024 08:12:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkEZ-00000009gke-3ASy
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 08:12:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so7927421e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 01:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719475915; x=1720080715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msK5wFfGDF/WutTur9LQCLii2ycv1OFon1M4QxMP/sI=;
        b=RSBZLJYt8S+Xt3p5VtCIGYny6FycyYexcJaVgOk4X+Yw/b67lyhesVZGQwsaNk/R6R
         SbfW3vioAlDy0PQ+ILa8PVaWY/KiNq+ON5d8imjztVSTIXXw5JN540aEe0htYRHZ3Vqo
         bCDps7uQSIlj5gyYs8/abfTFOGAr/1EHl2etqMTjhR4RiXGcWvOJw/Vpzc3K3emvIIvi
         zFDOe6564CW17U0TypGaDr1l4wwMAFJ+mb8q/EPWiFT+Dtew1Q+9150h04EQ2oVteXPv
         MhcUUWARKwQcwLX23rkUtoBvhytNX/TXwtlbCi7yoyKBTi5MGEbc5pDN9hUmAcryPpnv
         FzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475915; x=1720080715;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msK5wFfGDF/WutTur9LQCLii2ycv1OFon1M4QxMP/sI=;
        b=aEl3B9Ck8uSaVSD9S/Bn7bjhsBl6jNMPOrk44L2pttab7xl/I/uZTTxCzRbXFBpDx2
         2Kl1MWlkcN4YElXA59yqMmn6EZ+jFj/Zbsyj8xS08xZIZ6LldiyoC95/yqkvgNHg3uyz
         kzKqXeyPPffNzT0mN/vVSTVrgBtl2zNMswG/uguZFU+QYABFhPC8rVAiDVwSXQHlACZX
         lJTBZNXyX7zYXu1BvxXJHIKEK+NKVeYy2/WKf0QOcP9s2OUkvZWmUOXo8Bic5NS0mwZK
         XOjWyjMs2CM3VA4n6lHDe0xaxTQp5nVmEyujtM1V6M9TufiIrHYqQ4yqwBj77bv0ru7q
         iS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWI51pJydeUJSbhifQqPUv0VAjfqb4ekuy7Mwinr+fJIZLmDW2w8HD1g9UZkomauwbWcRb6Y+iCKvFYJ7qQDbxUlkAiop2cja7nC5oj0WL
X-Gm-Message-State: AOJu0YxyzuGQYKo/hR9RRn9ABYuRJQNzQG0QrJWybuX8RNAYNKONOrwE
	kZGyTAdxef6ljfFl5W9z76MTTrJ7ciqqKYM+CO9ZV0dMk1OH1rGLV36jUtGEPX8=
X-Google-Smtp-Source: AGHT+IEDopEuSNAPoRqMq46CO/kVJCKi+X7E3kF8387qXA6YgPT43ltjyIFnDOjv4772zX4xLAWpIA==
X-Received: by 2002:a05:6512:348c:b0:52c:86d7:fa62 with SMTP id 2adb3069b0e04-52ce061b1femr9639838e87.23.1719475914653;
        Thu, 27 Jun 2024 01:11:54 -0700 (PDT)
Received: from localhost ([149.71.16.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-425649d7055sm14715715e9.0.2024.06.27.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 01:11:54 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v3] RISC-V: Provide the frequency of time CSR via hwprobe
In-Reply-To: <CAEEQ3wmV56GUNmOMV3ydkKjRu3Jt4Vw9Nb5r-0KYiF9d5tF6fw@mail.gmail.com>
	(yunhui cui's message of "Tue, 25 Jun 2024 10:08:59 +0800")
References: <20240622025514.66537-1-cuiyunhui@bytedance.com>
	<CAEEQ3wmV56GUNmOMV3ydkKjRu3Jt4Vw9Nb5r-0KYiF9d5tF6fw@mail.gmail.com>
Date: Thu, 27 Jun 2024 09:11:53 +0100
Message-ID: <8734oyoldi.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_011159_831572_6682837D 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: costa.shul@redhat.com, aou@eecs.berkeley.edu, samitolvanen@google.com, corbet@lwn.net, Anup Patel <anup@brainfault.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jesse@rivosinc.com, conor.dooley@microchip.com, evan@rivosinc.com, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, andy.chiu@sifive.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, cleger@rivosinc.com, linux-riscv@lists.infradead.org, jrtc27@jrtc27.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gQWRkIHB1bml0
IGFuZCBzdW5pbCBpbiB0aGUgbG9vcC4KClRoYW5rcyBmb3IgbG9vcGluZyB1cyBpbi4KCj4gT24g
U2F0LCBKdW4gMjIsIDIwMjQgYXQgMTA6NTXigK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+Pgo+PiBBIGhhbmRmdWwgb2YgdXNlci12aXNpYmxlIGJlaGF2aW9yIGlzIGJh
c2VkIG9uIHRoZSBmcmVxdWVuY3kgb2YgdGhlCj4+IHRpbWUgQ1NSLgoKSXQgd2lsbCBiZSBoZWxw
ZnVsIHRvIGFkZCBtb3JlIGNvbnRleHQgdG8gdGhlIGNvbW1pdCBsb2cgLSBlc3BlY2lhbGx5CmZv
ciBzb21ldGhpbmcgdGhhdCBpcyBiZWluZyBleHBvc2VkIGluIGEgdXNlciB2aXNpYmxlCmludGVy
ZmFjZS4gU29tZXRoaW5nIGxpa2UgYmVsb3cgLQoKICAgIFRoZSBSSVNDLVYgYXJjaGl0ZWN0dXJl
IG1ha2VzIGEgcmVhbCB0aW1lIGNvdW50ZXIgQ1NSICh2aWEgUkRUSU1FCiAgICBpbnN0cnVjdGlv
bikgYXZhaWxhYmxlIGZvciBhcHBsaWNhdGlvbnMgaW4gVS1tb2RlIGJ1dCB0aGVyZSBpcyBubwog
ICAgYXJjaGl0ZWN0ZWQgbWVjaGFuaXNtIGZvciBhbiBhcHBsaWNhdGlvbiB0byBkaXNjb3ZlciB0
aGUgZnJlcXVlbmN5CiAgICB0aGUgY291bnRlciBpcyBydW5uaW5nIGF0LiBTb21lIGFwcGxpY2F0
aW9ucyAoZS5nLiwgRFBESykgdXNlIHRoZQogICAgdGltZSBjb3VudGVyIGZvciBiYXNpYyBwZXJm
b3JtYW5jZSBhbmFseXNpcyBhcyB3ZWxsIGFzIGZpbmUgZ3JhaW5lZAogICAgdGltZS1rZWVwaW5n
LgoKICAgIEFkZCBzdXBwb3J0IHRvIHRoZSBod3Byb2JlIHN5c3RlbSBjYWxsIHRvIGV4cG9ydCB0
aGUgdGltZXIgY291bnRlcgogICAgZnJlcXVlbmN5IHRvIGNvZGUgcnVubmluZyBpbiBVLW1vZGUu
CgpXaXRoIHRoZSBjb21taXQgbG9nIHVwZGF0ZWQsCgpBY2tlZC1ieTogUHVuaXQgQWdyYXdhbCA8
cHVuaXQuYWdyYXdhbEBieXRlZGFuY2UuY29tPgoKVGhhbmtzCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBFdmFu
IEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+Cj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3
cHJvYmUucnN0ICB8IDIgKysKPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oICAg
ICAgfCAyICstCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSAr
Cj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgNSArKysrKwo+PiAg
NCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+PiBpbmRleCBkZjUwNDUxMDNlNzMuLmVjM2M5
OTQ3NGVkNyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+PiBAQCAt
MjMzLDMgKzIzMyw1IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPj4KPj4gICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19TSVpFYDogQW4gdW5zaWdu
ZWQgaW50IHdoaWNoCj4+ICAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBibG9j
ayBpbiBieXRlcy4KPj4gKwo+PiArKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfVElNRV9D
U1JfRlJFUWA6IEZyZXF1ZW5jeSAoaW4gSHopIG9mIGB0aW1lIENTUmAuCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdwcm9iZS5oCj4+IGluZGV4IDE1MGE5ODc3YjBhZi4uZWYwMWMxODJhZjJiIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+PiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+PiBAQCAtOCw3ICs4LDcgQEAKPj4KPj4gICNpbmNs
dWRlIDx1YXBpL2FzbS9od3Byb2JlLmg+Cj4+Cj4+IC0jZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFY
X0tFWSA3Cj4+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA4Cj4+Cj4+ICBzdGF0aWMg
aW5saW5lIGJvb2wgcmlzY3ZfaHdwcm9iZV9rZXlfaXNfdmFsaWQoX19zNjQga2V5KQo+PiAgewo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPj4gaW5kZXggMmZiOGE4MTg1ZTdh
Li41MDUzYTliMTg3MTAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aAo+PiBAQCAtNzQsNiArNzQsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4+ICAjZGVmaW5l
ICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLICAgICAgICAgICAo
NyA8PCAwKQo+PiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRSAg
ICA2Cj4+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX01JU0FMSUdORURfUEVSRiAgICAgIDcK
Pj4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfVElNRV9DU1JfRlJFUSAgICAgICAgOAo+PiAg
LyogSW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+
Pgo+PiAgLyogRmxhZ3MgKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4+IGluZGV4IGU0ZWM5
MTY2MzM5Zi4uM2Q0N2VkYzA0YTNmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfaHdwcm9iZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPj4g
QEAgLTgsNiArOCw3IEBACj4+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPj4gICNpbmNs
dWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+PiAgI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+Cj4+ICsj
aW5jbHVkZSA8YXNtL2RlbGF5Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+PiAgI2luY2x1
ZGUgPGFzbS9zd2l0Y2hfdG8uaD4KPj4gICNpbmNsdWRlIDxhc20vdWFjY2Vzcy5oPgo+PiBAQCAt
MjI3LDYgKzIyOCwxMCBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNj
dl9od3Byb2JlICpwYWlyLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9
IHJpc2N2X2Nib3pfYmxvY2tfc2l6ZTsKPj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+Pgo+PiAr
ICAgICAgIGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfVElNRV9DU1JfRlJFUToKPj4gKyAgICAgICAg
ICAgICAgIHBhaXItPnZhbHVlID0gcmlzY3ZfdGltZWJhc2U7Cj4+ICsgICAgICAgICAgICAgICBi
cmVhazsKPj4gKwo+PiAgICAgICAgIC8qCj4+ICAgICAgICAgICogRm9yIGZvcndhcmQgY29tcGF0
aWJpbGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZhaWwgdGhlIHdob2xlCj4+ICAgICAgICAgICog
Y2FsbCwgYnV0IGdldCB0aGVpciBlbGVtZW50IGtleSBzZXQgdG8gLTEgYW5kIHZhbHVlIHNldCB0
byAwCj4+IC0tCj4+IDIuMjAuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
