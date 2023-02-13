Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F609C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ym/lv9XVxRef9r4whJ73bTn7svRXHSv6xoPrWepZsJQ=; b=hAuTmxAKhkIUQQ
	rht56SJMIavHyJmdJH9h2n8VhJXcFcbh0jbDMuWHNm0H2sqnjIQExeVRN/QB1741bT/FacRBHuIka
	4900swrv7HS2i4fZLjpCur7kGYE/gYI0VUT0RGuiktddUA809PaCLKK9TgG3erBW4OVlS8JO+CIKi
	bzd4dSJxGctZwtv6LBie0xs/4qDjb9+zgE0xYzfxOM4QZzZaxCJmJ9k49x5OPBzHzzYracTbcyLKX
	XoU84TZm3FQLXzEawj8EUil++ayhdm9s/mdDiCIkS9+5Db9JYuTJBnhgbh7RkIDQmFY5bunNswt7F
	zh2RAw9JuvDTqeSJiy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaj9-00FC0I-He; Mon, 13 Feb 2023 15:26:47 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaiy-00FBwV-9E
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:26:38 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-16debd2786aso5663861fac.7
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7yELkiR2oF+S0aR1NPW+7CGFtZ20FpkybhZSpxXCee0=;
        b=Qxf5UPKXwHm4PWReB1pZJaVYWkqns9VodIfHhUTIWTvNY7tJ1UxdOqoSijFfZzBa9x
         2QgdqT7b9uz9er+yQSdLBgYmh1h1ot4i1O2dEiEioS+fY0Ffu1gYeAX4jaQAWtTTnq6B
         /zo+EGYvXpHGWN58t/B1kN5kXCbmlgtLo1WLn1YGkbfLgRtngz5mKcNihgAUWaxfOZsb
         aX04qN1ERubx//JTo0jMCUuFaiWIrCogE+g6rl7XDTwv0vxnbNaqrEnH+zeof+l8UPqb
         NMxOC3J3VKe6wP4hbpX/qH1MuG+SEeUgqwsZR1bTyCYyyUD31+RnXGJrFIRV+lSIX4Sx
         K+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yELkiR2oF+S0aR1NPW+7CGFtZ20FpkybhZSpxXCee0=;
        b=y+CYADifMAJF6PhLVCG2KechW68kNYO89w46+IIwWoJlW01lSMOiI7wwq1yg1GFJpD
         PspelqMxUsNxd0x5tGw/d7f4EdaUfhuHVeykSCjDslqvUN6RMy1kJ35Z/aPyF3OhUNcU
         P4UDGMuVbzUYxIAJGUW6++8p1k4OuNzV0bpEjr/YlXDMUPvwhqxxpHpWv/o+4mzGDEp6
         AgZ0nEGGNWF0TIIcMuGu0E5KmfRXHpzSEPRtdbpkKlatA0vF883v85vM5JbMo5eJmIaq
         9jDSUB0+Bs2Y0RpASq/2gvj6cPvsTWlKo6g7y2Q8zbiM8akRfS4osxbWztXLW2jOqEIx
         xRlA==
X-Gm-Message-State: AO0yUKVI6kOtoH7eRZujAPzI7ZqPL0uhyTfkUZRYATenmkX90o+pX5H/
	LKsFiJkn7Eet296AWfe7bJQ=
X-Google-Smtp-Source: AK7set+fs1fzdnl8TAqiYz2Wf25PErDsXjTA024UYWFNgLh96ARchjNIVDJSopFWPy6bg5CO+xOFqg==
X-Received: by 2002:a05:6871:4f15:b0:16b:5b0b:ed08 with SMTP id zu21-20020a0568714f1500b0016b5b0bed08mr4700308oab.27.1676301992620;
        Mon, 13 Feb 2023 07:26:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a19-20020a05683012d300b00686574e98d6sm5285465otq.72.2023.02.13.07.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 07:26:31 -0800 (PST)
Message-ID: <499cfd09-0c16-af51-ad17-55d6425ded8e@roeck-us.net>
Date: Mon, 13 Feb 2023 07:26:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
 <8feda5d9-8510-acbf-1ec2-3a0e67df0adc@starfivetech.com>
 <690da4a4-b4df-f316-e948-38c857237095@roeck-us.net>
 <d5ff24d3-317e-0cb1-24e7-5aac20d81305@starfivetech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <d5ff24d3-317e-0cb1-24e7-5aac20d81305@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_072636_349638_C9B8DE97 
X-CRM114-Status: GOOD (  45.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8xMy8yMyAwNToyOSwgWGluZ3l1IFd1IHdyb3RlOgo+IE9uIDIwMjMvMi8xMCAyMzoyOCwg
R3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gMi85LzIzIDIzOjAxLCBYaW5neXUgV3Ugd3JvdGU6
Cj4+PiBPbiAyMDIzLzIvMiA2OjQ2LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+IE9uIE1vbiwg
RGVjIDE5LCAyMDIyIGF0IDA1OjQyOjMyUE0gKzA4MDAsIFhpbmd5dSBXdSB3cm90ZToKPj4+Pj4g
QWRkIHdhdGNoZG9nIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4+Pj4+Cj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+
Cj4+Pj4KPj4KPj4gWy4uLl0KPj4KPj4+Pgo+Pj4+PiArTU9EVUxFX1BBUk1fREVTQyhub3dheW91
dCwgIldhdGNoZG9nIGNhbm5vdCBiZSBzdG9wcGVkIG9uY2Ugc3RhcnRlZCAoZGVmYXVsdD0iCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgIF9fTU9EVUxFX1NUUklORyhXQVRDSERPR19OT1dBWU9VVCkg
IikiKTsKPj4+Pj4gK01PRFVMRV9QQVJNX0RFU0Moc29mdF9ub2Jvb3QsCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgICJXYXRjaGRvZyBhY3Rpb24sIHNldCB0byAxIHRvIGlnbm9yZSByZWJvb3RzLCAw
IHRvIHJlYm9vdCAoZGVmYXVsdCAwKSIpOwo+Pj4+Cj4+Pj4gSSBkbyBub3QgdW5kZXJzdGFuZCB3
aGF0IHRoaXMgbW9kdWxlIHBhcmFtZXRlciBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIGZvciwKPj4+
PiBhbmQgd2hhdCB0aGUgInNvZnRfJyBwcmVmaXggaXMgc3VwcG9zZWQgdG8gbWVhbi4KPj4+Cj4+
PiBUaGlzICdzb2Z0X25vYm9vdCcgbWVhbnMgd2F0Y2hkb2cgcmVzZXQgZW5hYmxlZCBzdGF0dXMu
IElmICdzb2Z0X25vYm9vdCcgaXMgc2V0IHRvIDEsCj4+PiBpdCBtZWFucyByZXNldCBpcyBkaXNh
YmxlZCBhbmQgZG8gbm90IHJlYm9vdC5PciAncmVib290X2Rpc2JsZWQnIGluc3RlYWQ/Cj4+Pgo+
Pgo+PiBUaGF0IG1lYW5zIGl0IGRvZXMgbm90aGluZyA/IFdoeSBsb2FkIHRoZSB3YXRjaGRvZyBp
biB0aGUgZmlyc3QgcGxhY2UgdGhlbiA/Cj4+Cj4gCj4gVGhpcyBmZWF0dXJlIGlzIHVzZWQgZm9y
IGRlYnVnZ2luZywgc28gdXNlciBjYW4gY2hlY2sgdGhlIGNvdW50ZXIgcmVwZWF0ZWRseQo+IHdp
dGhvdXQgcmVib290aW5nIHRoZSBzeXN0ZW0uCj4gCgpEZWJ1ZyBvcHRpb25zIGFyZSBub3QgYWNj
ZXB0YWJsZSBhcyBtb2R1bGUgb3B0aW9ucy4gUGxlYXNlIG1ha2UgaXQgYSBkZWZpbmUKaWYgeW91
IHRoaW5rIHlvdSBuZWVkIGl0LgoKPj4gWy4uLl0KPj4+Pj4gKwo+Pj4+PiArLyogaW50ZXJydXB0
IHN0YXR1cyB3aGV0aGVyIGhhcyBiZWVuIHJhaXNlZCBmcm9tIHRoZSBjb3VudGVyICovCj4+Pj4+
ICtzdGF0aWMgYm9vbCBzdGFyZml2ZV93ZHRfcmFpc2VfaXJxX3N0YXR1cyhzdHJ1Y3Qgc3RhcmZp
dmVfd2R0ICp3ZHQpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgcmV0dXJuICEhcmVhZGwod2R0LT5i
YXNlICsgd2R0LT5kcnZfZGF0YS0+aXJxX2lzX3JhaXNlKTsKPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+
PiArc3RhdGljIHZvaWQgc3RhcmZpdmVfd2R0X2ludF9jbHIoc3RydWN0IHN0YXJmaXZlX3dkdCAq
d2R0KQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgIHdyaXRlbChTVEFSRklWRV9XRFRfSU5UQ0xSLCB3
ZHQtPmJhc2UgKyB3ZHQtPmRydl9kYXRhLT5pbnRfY2xyKTsKPj4+Pj4gK30KPj4+Pgo+Pj4+IFRo
ZXJlIGlzIG5vIGV4cGxhbmF0aW9uIGZvciB0aGlzIGludGVycnVwdCBoYW5kbGluZyAob3IsIHJh
dGhlciwKPj4+PiBub24taGFuZGxpbmcgc2luY2UgdGhlcmUgaXMgbm8gaW50ZXJydXB0IGhhbmRs
ZXIuIFdoYXQgaXMgdGhlIHB1cnBvc2UKPj4+PiBvZiBldmVuIGhhdmluZyBhbGwgdGhpcyBjb2Rl
ID8KPj4+Cj4+PiBCZWNhdXNlIHRoZSB3YXRjaGRvZyByYWlzZSBhbiBpbnRlcnJ1cHQgc2lnbmFs
IG9uIHRoZSBoYXJkd2FyZSB3aGVuIHRpbWVvdXQsCj4+PiBhbHRob3VnaCB3ZSBkbyBub3QgdXNl
IGludGVycnVwdCBoYW5kbGVyIG9uIHRoZSBzb3Jmd2FyZSwgYnV0IHRoZSB3YXRjaGRvZwo+Pj4g
aW5pdGlhbGl6YXRpb24gb3IgcmVsb2FkIGFsc28gbmVlZCB0byBjbGVhciB0aGUgaGFyZHdhcmUg
aW50ZXJydXB0IHNpZ25hbC4KPj4+Cj4+Cj4+IFRoYXQgc2hvdWxkIGJlIGRvY3VtZW50ZWQuCj4+
Cj4gCj4gSSB3aWxsIGFkZCB0aGF0IGluIHRoZSBjb21tZW50cy4KPiAKPj4KPj4gWy4uLl0KPj4+
Pj4gKwo+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+ICvCoMKgwqDCoCAqIFRoaXMgd2F0Y2hkb2cgdGFr
ZXMgdHdpY2UgdGltZW91dHMgdG8gcmVzZXQuCj4+Pj4+ICvCoMKgwqDCoCAqIEluIG9yZGVyIHRv
IHJlZHVjZSB0aW1lIHRvIHJlc2V0LCBzaG91bGQgc2V0IGhhbGYgY291bnQgdmFsdWUuCj4+Pj4+
ICvCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgIGNvdW50ID0gdGltZW91dCAqIGZyZXEgLyAyOwo+
Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGNvdW50ID4gU1RBUkZJVkVfV0RUX01BWENOVCkgewo+
Pj4+Cj4+Pj4gY291bnQgaXMgYW4gdW5zaWduZWQgaW50LCB3aGljaCBpcyBwcmV0dHkgbXVjaCBl
dmVyeXdoZXJlIGEgMzItYml0Cj4+Pj4gdmFsdWUuIFNUQVJGSVZFX1dEVF9NQVhDTlQgaXMgMHhm
ZmZmZmZmZi4gSG93IGlzIGFuIHVuc2lnbmVkIGludGVnZXIKPj4+PiBldmVyIHN1cHBvc2VkIHRv
IGJlIGxhcmdlciB0aGFuIDB4ZmZmZmZmZmYgPwo+Pj4+Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBk
ZXZfd2Fybih3ZHQtPmRldiwgInRpbWVvdXQgJWQgdG9vIGJpZyx1c2UgdGhlIE1BWC10aW1lb3V0
IHNldC5cbiIsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dCk7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB0aW1lb3V0ID0gc3RhcmZpdmVfd2R0X21heF90aW1lb3V0KHdkdCk7
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjb3VudCA9IHRpbWVvdXQgKiBmcmVxOwo+Pj4+Cj4+Pj4g
VGhpcyBpcyBjb25mdXNpbmcuIEZpcnN0LCB0aGUgdGltZW91dCByYW5nZSBpcyBjaGVja2VkIGJ5
IHRoZSBjYWxsaW5nIGNvZGUsCj4+Pj4gd2hpY2ggbWFrZXMgc3VyZSBpdCBpcyBuZXZlciBsYXJn
ZXIgdGhhbiBtYXhfdGltZW91dC4gbWF4X3RpbWVvdXQgaXMKPj4+PiBzZXQgdG8gdGhlIHZhbHVl
IHJldHVybmVkIGJ5IHN0YXJmaXZlX3dkdF9tYXhfdGltZW91dCgpLgo+Pj4+IFRodXMsIGNvdW50
ID0gdGltZW91dCAqIGZyZXEgLyAyIHdpbGwgX25ldmVyXyBiZSBsYXJnZXIgdGhhbgo+Pj4+IFNU
QVJGSVZFX1dEVF9NQVhDTlQuIEV2ZW4gaWYgaXQgZXZlciB3YXMsIGl0IGRvZXNuJ3QgbWFrZSBz
ZW5zZQo+Pj4+IHRvIHVzZSBhIGNvdW50IHZhbHVlIG9mIHRpbWVvdXQgKiBmcmVxIGluIHRoYXQg
Y2FzZSwgaWUgYSB2YWx1ZSB3aGljaAo+Pj4+IGNvdWxkIGJlIHR3aWNlIGFzIGxhcmdlIGFzIHRo
ZSBzdXBwb3NlZCBtYXhpbXVtIHZhbHVlLgo+Pj4KPj4+IENoYW5nZSAnY291bnQnIHR5cGUgdG8g
J3U2NCcuIEFuZCBpZiAnY291bnQnIGlzIGxhcmdlciB0aGFuIFNUQVJGSVZFX1dEVF9NQVhDTlQs
Cj4+PiAnY291bnQnIGlzIGVxdWFsIHRvIFNUQVJGSVZFX1dEVF9NQVhDTlQuIERvZXMgdGhhdCBz
ZWVtIE9LPwo+Pj4KPj4KPj4gVGhhdCB3b3VsZCBub3QgY2hhbmdlIGFueXRoaW5nLiBUaGlzIGlz
IG5vdCBhYm91dCBvdmVyZmxvd3M7IEkgd291bGQKPj4gaGF2ZSBtZW50aW9uZWQgdGhhdC4gY291
bnQgY2FuIHN0aWxsIG5ldmVyIGJlIGxhcmdlciB0aGFuIFNUQVJGSVZFX1dEVF9NQVhDTlQuCj4+
IFBsZWFzZSBkbyB0aGUgbWF0aC4KPj4KPiAKPiBJIGdldCB5b3VyIHBvaW50LiBJdCBoYXMgY2hl
Y2tlZCB0aGUgJ2NvdW50JyBiZWZvcmUgdGhlIG9wcyBvZiAnc2V0X3RpbWVvdXQnIHNvCj4gSSBj
aGVjayB0aGUgJ2NvdW50JyB1c2VsZXNzbHkgaW4gdGhpcy4gSSB3aWxsIHJlbW92ZSB0aGlzLgo+
IAo+Pgo+PiBbLi4uXQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKHRtcl9hdGJvb3QgJiYgc3Rh
cnRlZCA9PSAwKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdGFyZml2ZV93ZHRfc3RhcnQoJndk
dC0+d2R0X2RldmljZSk7Cj4+Pj4+ICvCoMKgwqAgfSBlbHNlIGlmICghdG1yX2F0Ym9vdCkgewo+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyoKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKmlmIHdlJ3Jl
IG5vdCBlbmFibGluZyB0aGUgd2F0Y2hkb2csIHRoZW4gZW5zdXJlIGl0IGlzCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogZGlzYWJsZWQgaWYgaXQgaGFzIGJlZW4gbGVmdCBydW5uaW5nIGZyb20g
dGhlIGJvb3Rsb2FkZXIKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBvciBvdGhlciBzb3VyY2Uu
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdGFyZml2
ZV93ZHRfc3RvcCgmd2R0LT53ZHRfZGV2aWNlKTsKPj4+Pgo+Pj4+IElmIGl0IF9pc18gcnVubmlu
ZyBmcm9tIHRoZSBib290IGxvYWRlciwgdGhlIHdhdGNoZG9nIGNvcmUgaXMgbm90Cj4+Pj4gaW5m
b3JtZWQgYWJvdXQgaXQuIElmIGl0IGlzIHN0YXJ0ZWQgaGVyZSwgaXQgaXMgbm90IGluZm9ybWVk
IGVpdGhlci4KPj4+PiBUaGlzIGlzIHVudXN1YWwgYW5kIHdpbGwgbmVlZCB0byBiZSBleHBsYWlu
ZWQuCj4+Pj4gV2h5ID8KPj4+Cj4+PiBJcyBpcyBva2F5IHRvIHJlbW92ZSB0aGUgJ3N0YXJ0ZWQn
Pwo+Pj4KPj4gWWVzLCB0aG91Z2ggb2YgY291cnNlIGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGUg
d2F0Y2hkb2cgaXMga2VwdCBydW5uaW5nCj4+IGluIHRoYXQgc2l0dWF0aW9uIGFuZCB0aGUgd2F0
Y2hkb2cgY29yZSBpcyBpbmZvcm1lZCBhYm91dCBpdC4gQWxzbywKPj4gdGhlIHdhdGNoZG9nIGNv
cmUgaXMgc3RpbGwgbm90IGluZm9ybWVkIHRoYXQgdGhlIHdhdGNoZG9nIGlzIHJ1bm5pbmcKPj4g
KGkuZS4sIFdET0dfSFdfUlVOTklORyBpcyBub3Qgc2V0KSB3aGVuIGl0IGlzIGV4cGxpY2l0bHkg
c3RhcnRlZC4KPj4KPiAKPiBXaWxsIHJlbW92ZSB0aGUgJ3N0YXJ0ZWQnLgo+IAo+Pj4+Cj4+Pj4+
ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICsjaWZkZWYgQ09ORklHX1BNCj4+Pj4+ICvCoMKgwqAg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHdkdC0+Y29yZV9jbGspOwo+Pj4+PiArwqDCoMKgIGNsa19k
aXNhYmxlX3VucHJlcGFyZSh3ZHQtPmFwYl9jbGspOwo+Pj4+PiArI2VuZGlmCj4+Pj4KPj4+PiBJ
IGRvIG5vdCB1bmRlcnN0YW5kIHRoZSBhYm92ZSBjb2RlLiBXaHkgc3RvcCB0aGUgd2F0Y2hkb2cg
aWYgQ09ORklHX1BNCj4+Pj4gaXMgZW5hYmxlZCwgZXZlbiBpZiBpdCBpcyBzdXBwb3NlZCB0byBi
ZSBydW5uaW5nID8KPj4+Cj4+PiBUaGVyZSBtaXNzZXMgYSBjaGVjayBhYm91dCAnZWFybHlfZW5h
YmxlJyBhbmQgYWRkICdpZiAoIWVhcmx5X2VuYWJsZSknLgo+Pj4gVGhlcmUgbWVhbnMgdGhhdCBk
aXNhYmxlIGNsb2NrIHdoZW4gd2F0Y2hkb2cgc2xlZXAgYW5kIENPTkZJR19QTSBpcyBlbmFibGUu
Cj4+PiBUaGVuIGVuYWJsZSBjbG9jayB3aGVuIHdhdGNoZG9nIHdvcmsgYnkgJ3N0YXJmaXZlX3dk
dF9ydW50aW1lX3Jlc3VtZScgZnVuY3Rpb24uCj4+Pgo+Pgo+PiBJIGFtIHF1aXRlIHN1cmUgdGhh
dCB5b3UgYXJlIHN1cHBvc2VkIHRvIHVzZSBwbSBmdW5jdGlvbnMgZm9yIHRoYXQgcHVycG9zZSwK
Pj4gc3VjaCBhcyBwbV9ydW50aW1lX2dldF9zeW5jKCksIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSwg
YW5kIHBtX3J1bnRpbWVfZW5hYmxlKCksCj4+IHNpbWlsYXIgdG8gdGhlIGNvZGUgaW4gb21hcF93
ZHQuYy4KPj4KPiAKPiBJIHdpbGwgdXNlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBhbmQgcG1fcnVu
dGltZV9wdXRfc3luYygpIHRvIG9wZXJhdGUgY2xvY2tzLgo+IAo+PiBbLi4uXQo+Pj4+PiArI2lm
ZGVmIENPTkZJR19QTV9TTEVFUAo+Pj4+PiArc3RhdGljIGludCBzdGFyZml2ZV93ZHRfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+
Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RhcmZpdmVfd2R0ICp3ZHQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHN0YXJmaXZlX3dkdF91bmxvY2sod2R0KTsKPj4+Pj4g
Kwo+Pj4+PiArwqDCoMKgIC8qIFNhdmUgd2F0Y2hkb2cgc3RhdGUsIGFuZCB0dXJuIGl0IG9mZi4g
Ki8KPj4+Pj4gK8KgwqDCoCB3ZHQtPnJlbG9hZCA9IHN0YXJmaXZlX3dkdF9nZXRfY291bnQod2R0
KTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHN0YXJmaXZlX3dkdF9tYXNrX2FuZF9kaXNhYmxlX3Jl
c2V0KHdkdCwgdHJ1ZSk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCAvKiBOb3RlIHRoYXQgV1RDTlQg
ZG9lc24ndCBuZWVkIHRvIGJlIHNhdmVkLiAqLwo+Pj4+PiArwqDCoMKgIHN0YXJmaXZlX3dkdF9z
dG9wKCZ3ZHQtPndkdF9kZXZpY2UpOwo+Pj4+PiArwqDCoMKgIHBtX3J1bnRpbWVfZm9yY2Vfc3Vz
cGVuZChkZXYpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgc3RhcmZpdmVfd2R0X2xvY2sod2R0KTsK
Pj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtz
dGF0aWMgaW50IHN0YXJmaXZlX3dkdF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+PiAr
ewo+Pj4+PiArwqDCoMKgIGludCByZXQ7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHN0YXJmaXZlX3dk
dCAqd2R0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBzdGFy
Zml2ZV93ZHRfdW5sb2NrKHdkdCk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBwbV9ydW50aW1lX2Zv
cmNlX3Jlc3VtZShkZXYpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyogUmVzdG9yZSB3YXRjaGRv
ZyBzdGF0ZS4gKi8KPj4+Pj4gK8KgwqDCoCBzdGFyZml2ZV93ZHRfc2V0X3JlbG9hZF9jb3VudCh3
ZHQsIHdkdC0+cmVsb2FkKTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHN0YXJmaXZlX3dkdF9yZXN0
YXJ0KCZ3ZHQtPndkdF9kZXZpY2UsIDAsIE5VTEwpOwo+Pj4+Cj4+Pj4gSSBkbyBub3QgdW5kZXJz
dGFuZCB0aGlzIGNhbGwuIFBlciBpdHMgZGVmaW5pdGlvbiBpdCBpcyBhIHJlc3RhcnQgaGFuZGxl
ciwKPj4+PiBzdXBwb3NlZCB0byByZXN0YXJ0IHRoZSBoYXJkd2FyZS4gV2h5IHdvdWxkIGFueW9u
ZSB3YW50IHRvIHJlc3RhcnQgdGhlCj4+Pj4gc3lzdGVtIG9uIHJlc3VtZSA/Cj4+Pgo+Pj4gVGhl
IHdhdGNoZG9nIHN0YXJ0IGNvdW50aW5nIGZyb20gJ2NvdW50JyB0byAwIG9uIGV2ZXJ5dGltZSBy
ZXN1bWUgbGlrZSBhIHJlc3RhcnQuCj4+PiBTbyBJIGRpcmVjdGx5IHVzZSBhIHJlc3RhcnQuCj4+
Pgo+Pgo+PiBUaGF0IGRvZXNuJ3QgYW5zd2VyIG15IHF1ZXN0aW9uLiBUaGUgInJlc3RhcnQiIGNh
bGxiYWNrIHJlc2V0cyB0aGUgaGFyZHdhcmUuCj4+IHN0YXJmaXZlX3dkdF9yZXN0YXJ0KCkgaXMg
cmVnaXN0ZXJlZCBhcyByZXN0YXJ0IGhhbmRsZXIsIGFuZCB0aHVzIGV4cGVjdGVkCj4+IHRvIHJl
c2V0IHRoZSBoYXJkd2FyZS4gSXQgaXQgZG9lc24ndCByZXNldCB0aGUgaGFyZHdhcmUsIGl0IHNo
b3VsZCBub3QKPj4gcmVnaXN0ZXIgaXRzZWxmIGFzIHJlc3RhcnQgaGFuZGxlci4gSWYgaXQgZG9l
cyByZXN0YXJ0IHRoZSBoYXJkd2FyZSwgY2FsbGluZwo+PiBpdCBvbiByZXN1bWUgd291bGQgYXV0
b21hdGljYWxseSByZXNldCB0aGUgc3lzdGVtIG9uIGVhY2ggcmVzdW1lLgo+PiBTb21ldGhpbmcg
aXMgd3JvbmcgaGVyZSwgYW5kIHdpbGwgaGF2ZSB0byBiZSBmaXhlZC4KPj4KPj4gSSBfc3VzcGVj
dF8gdGhhdCB5b3UgdGhpbmsgdGhhdCB0aGUgcmVzdGFydCBjYWxsYmFjayBpcyBzdXBwb3NlZCB0
byByZXNldAo+PiB0aGUgd2F0Y2hkb2cuIFRoYXQgd291bGQgYmUgd3JvbmcuIEl0IHJlc2V0cyAo
cmVzdGFydHMpIHRoZSBoYXJkd2FyZSwKPj4gbm90IHRoZSB3YXRjaGRvZy4gUGxlYXNlIHJlYWQg
RG9jdW1lbnRhdGlvbi93YXRjaGRvZy93YXRjaGRvZy1rZXJuZWwtYXBpLnJzdAo+PiBpZiB0aGVy
ZSBhcmUgcXVlc3Rpb25zIGFib3V0IHRoaXMgY2FsbGJhY2suCj4+Cj4gCj4gVGhhbmtzIHlvdSBm
b3IgcmVtaW5kaW5nIG1lLiBJIGZpbmFsbHkgdW5kZXJzdGFuZCB0aGF0IHRoZSByZXN0YXJ0IGNh
bGxiYWNrIGlzIHN1cHBvc2VkCj4gdG8gcmVzZXQgdGhlIGhhcmR3YXJlIG5vdCB3YXRjaGRvZy4g
VGhpcyB3YXRjaGRvZyBkb2Vzbid0IHJlc2V0IHRoZSBoYXJkd2FyZSwgYW5kIEkgd2lsbAo+IHJl
bW92ZSB0aGF0LiBCeSB0aGUgd2F5LCBpZiBJIGRvbid0IG5lZWQgcmVzdGFydCBjYWxsYmFjaywg
d291bGQgSSBzdGlsbCB1c2UgdGhlCj4gJ3dhdGNoZG9nX3NldF9yZXN0YXJ0X3ByaW9yaXR5JyBm
dW5jdGlvbj8gVGhhbmtzLgo+IAoKTm8uCgpUaGFua3MsCkd1ZW50ZXIKCj4gQmVzdCByZWdhcmRz
LAo+IFhpbmd5dSBXdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
