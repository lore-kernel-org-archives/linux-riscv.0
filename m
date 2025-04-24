Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1070C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDc4NT1a5gl+M11V9xvlbwDr/2CvwQnLVzE1D5/7Zvo=; b=MNUEMemLW9zEkb
	rtwi3vurXJYvtHxfeY6/Gk27wn4NVb/54ArsSaQYDH91o53YlzbBvdCZzdKFmAaq5tel1814s1rcg
	zPzhdj3qtw9HQg572l1O/3yNKUh1w1W73Q5+43EBBbXYe4jcUw4v8eaLWnCOpC1BaOu3UVe0G6NOK
	NO88rXcFT/bAlhbCmuugW6i6ZAfhzI4ITA8N8E4PpRm5PzMw8QZ9KcWWnds+KFhY9VHJ0qPKSygDY
	hDUqDVv12wogCdzVLstRnwommSdPf9gPomvwhQWPwmRPfatOwX1/2WkNyZwsWezaIaJMJR69z/uxY
	XoMRFtc2xDxbkIIUrAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wx6-0000000EFSb-2TM8;
	Thu, 24 Apr 2025 13:49:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vpO-0000000E3Rh-2B4d
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 12:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mXBQ/2qXvZB57eFvN07u42A0vH9tPCFMfppvAtJvXGM=; b=DNGyRwh7oOkJ4NigSgPeqyq0VO
	EY9i314/aosoVipUHQe9Q3KOUFngjo9WLnENSlI5gcWn0EqW8zIl9oAg1QHAxB4UO9WREh/pTwSYY
	ZfcijkwgqBBXB+x2p7ZBs4rPOp/EkylU5Vq19siSrnlFPqWyRCDhyFgPMnIOGr+wfLmC6AQmyVkk4
	cv1p9jSE7J6myeqXMqXJNUEB/d8L2lip6nchH6+P5HPDur7W3Pb91Ay768CacjqIkxjelL3uJgCf9
	RShUnnknVVwXboAc78Cv1vMCBog4TTugdRLXrBVKBdVafp4uxggiXGw1dPxVgfryTAXtFvezu/Vnf
	J3vH1Ghg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7vpK-0000000Bn4J-3u4Y
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:37:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so729427f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745498232; x=1746103032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXBQ/2qXvZB57eFvN07u42A0vH9tPCFMfppvAtJvXGM=;
        b=W2DjgAu5AzVZYmXa2yrPmKM848vlmiXBH7nXQQZIEWb8PKiLuMDjLOmT0T2ILDgEkW
         j+SYVByQy9/KZumGILIjUoM8DJhURUvwUJftBHAVT+gLJuKibP/iNHoh/SyUNgRqwOZg
         GwrHRdFi+uZn1FSes0UtwUKpKLL3OfWfgG6o8CfCV0PDg3c6xS+vxzxNB4sX5J6oJDGJ
         LTuPM2W3fLcAlDHdtk55BHs7yfTbrnHJP0fnrpoas9KSAeR0bCoD8cRTwT1DtecRohJ7
         aVYcrTgf0ZWCGmze0Ln5XT3w1xJR0HbJGES50trnqDQOmXrVlUBpS1SiFldia9RRNXD4
         vpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498232; x=1746103032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXBQ/2qXvZB57eFvN07u42A0vH9tPCFMfppvAtJvXGM=;
        b=NuJkdOpPACzpUWGAqBOqUkb24tul/LbJUfbUVOpSVThmEP6Tuj+kbsgVZz/KGVuVp2
         x0LweIpSTfMSRom1FDAIEU8muV9MqLYNc4A3R97wnskS+Jges2E8migyrlTw5a7BAqd2
         HDNmvX8qqQ2+VB/SNG9TQd1JYnJbUWFQ0MMKo/m5g2U1HwOxQV8i15Q+Toeg14VbwahG
         I7zJpcWH1Rq+z7Apx4tCz331RON8fUapjZ5tzoriSM44Dq39U402LXSKEsIMP2LybPvq
         y3YeMLLaFnHWhz1aBZo6KI8OHvRItWJegMjtibstV7dvD90wLwlIu8eSoUIcITKtmB6+
         b26w==
X-Forwarded-Encrypted: i=1; AJvYcCUk8spnsB0WNwXqiaPDLiq4xg2MJ6g30j1fOoO9TIqHJC2XoQLLG51EnlQR+hyLn7zMYGWDfqzRdOK6sw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrk/nwm5PbK1uiryjeseqLiKwgWocQ0lTx95QM4xFDI3dVEC9d
	9WOt00ADUVJ/KoS4xuEvI/YujerHfZRm7fX/iOe40c19ySALNkLcegfRQwPXekM=
X-Gm-Gg: ASbGncsXkQCXkbMZ1bV50Ah7N6NH5Z5nYPlHnrfZROvRSUpZVT+/FOBHkVXUUd/BaO5
	hmcjXXh7JXHQBFSCczdDMI4N9luZkLS/p2NX8Bfu3+axV9igDmUhpPr6wSA23xONxiV1kEHBrmV
	qmStuAO2JEjPACLnT4umpaxPl+710yj8/DI2RMO835VEXUPJr2saYU1NEpjlzkb8kAhyWW8jGAq
	YiQzdRvOt5Wuyke6X7wD+fC6HfhCFlBXu5nt0z9dTLgpZlz/AxcGVpXGd4wQZpS9v5XkXhWaLeM
	+U0EMbqfHiQQb/Dj9rj5HVa/ruT4fec0HoCoqfPCnsiMRtQmBKNMdbHikeV9vr0kQ5nWGwzspIb
	7NwTbDD/ohg==
X-Google-Smtp-Source: AGHT+IFQHcJdwFRaXmEWb0g3t5DToUnDgaUuyc1wuadZLcOAY6FK4EOtEA/saYPalIta+MsOsrAKYA==
X-Received: by 2002:a05:6000:18a8:b0:391:241d:a13e with SMTP id ffacd0b85a97d-3a06cfab52fmr1726627f8f.48.1745498232082;
        Thu, 24 Apr 2025 05:37:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d532551sm2004598f8f.65.2025.04.24.05.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:37:11 -0700 (PDT)
Message-ID: <ddd4ba8a-27cf-4174-a578-b28961bdf1a5@rivosinc.com>
Date: Thu, 24 Apr 2025 14:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-14-cleger@rivosinc.com>
 <20250424-ae24464169f7143c509cbab5@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-ae24464169f7143c509cbab5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133715_060217_6C065EE8 
X-CRM114-Status: GOOD (  16.10  )
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

CgpPbiAyNC8wNC8yMDI1IDEzOjM0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTcsIDIwMjUgYXQgMDI6MjA6MDBQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBT
QklfRldGVF9NSVNBTElHTkVEX0RFTEVHIG5lZWRzIGhlZGVsZWcgdG8gYmUgbW9kaWZpZWQgdG8g
ZGVsZWdhdGUKPj4gbWlzYWxpZ25lZCBsb2FkL3N0b3JlIGV4Y2VwdGlvbnMuIFNhdmUgYW5kIHJl
c3RvcmUgaXQgZHVyaW5nIENQVQo+PiBsb2FkL3B1dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiBSZXZpZXdlZC1ieTogRGVlcGFr
IEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyAgICAgICAgICB8ICAzICsrKwo+PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwg
MzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAzOSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gaW5kZXggNTQyNzQ3ZTJjN2Y1Li5kOThlMzc5
OTQ1YzMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+PiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKPj4gQEAgLTY0Niw2ICs2NDYsNyBAQCB2b2lkIGt2bV9hcmNoX3Zj
cHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4gIHsKPj4gIAl2b2lkICpuc2g7Cj4+ICAJ
c3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+PiArCXN0
cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPj4gIAo+PiAgCXZj
cHUtPmNwdSA9IC0xOwo+PiAgCj4+IEBAIC02NzEsNiArNjcyLDcgQEAgdm9pZCBrdm1fYXJjaF92
Y3B1X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+ICAJCWNzci0+dnN0dmFsID0gbmFjbF9j
c3JfcmVhZChuc2gsIENTUl9WU1RWQUwpOwo+PiAgCQljc3ItPmh2aXAgPSBuYWNsX2Nzcl9yZWFk
KG5zaCwgQ1NSX0hWSVApOwo+PiAgCQljc3ItPnZzYXRwID0gbmFjbF9jc3JfcmVhZChuc2gsIENT
Ul9WU0FUUCk7Cj4+ICsJCWNmZy0+aGVkZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVE
RUxFRyk7Cj4+ICAJfSBlbHNlIHsKPj4gIAkJY3NyLT52c3N0YXR1cyA9IGNzcl9yZWFkKENTUl9W
U1NUQVRVUyk7Cj4+ICAJCWNzci0+dnNpZSA9IGNzcl9yZWFkKENTUl9WU0lFKTsKPj4gQEAgLTY4
MSw2ICs2ODMsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPj4gIAkJY3NyLT52c3R2YWwgPSBjc3JfcmVhZChDU1JfVlNUVkFMKTsKPj4gIAkJY3NyLT5o
dmlwID0gY3NyX3JlYWQoQ1NSX0hWSVApOwo+PiAgCQljc3ItPnZzYXRwID0gY3NyX3JlYWQoQ1NS
X1ZTQVRQKTsKPj4gKwkJY2ZnLT5oZWRlbGVnID0gY3NyX3JlYWQoQ1NSX0hFREVMRUcpOwo+PiAg
CX0KPj4gIH0KPj4gIAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndm
dC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+IGluZGV4IGIwZjY2YzdiZjAx
MC4uMjM3ZWRhZWZhMjY3IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+IEBAIC0xNCw2
ICsxNCw4IEBACj4+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5oPgo+PiAgI2luY2x1ZGUg
PGFzbS9rdm1fdmNwdV9zYmlfZndmdC5oPgo+PiAgCj4+ICsjZGVmaW5lIE1JU19ERUxFRyAoQklU
X1VMTChFWENfTE9BRF9NSVNBTElHTkVEKSB8IEJJVF9VTEwoRVhDX1NUT1JFX01JU0FMSUdORUQp
KQo+PiArCj4+ICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgewo+PiAgCS8qKgo+PiAgCSAq
IEBpZDogRmVhdHVyZSBJRAo+PiBAQCAtNjgsNyArNzAsNDEgQEAgc3RhdGljIGJvb2wga3ZtX2Z3
ZnRfaXNfZGVmaW5lZF9mZWF0dXJlKGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGZlYXR1cmUpCj4+
ICAJcmV0dXJuIGZhbHNlOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+
ICt7Cj4+ICsJcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKCk7Cj4+ICt9Cj4+
ICsKPj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9u
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPj4gKwkJCQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25m
aWcgKmNvbmYsCj4+ICsJCQkJCXVuc2lnbmVkIGxvbmcgdmFsdWUpCj4+ICt7Cj4+ICsJaWYgKHZh
bHVlID09IDEpCj4+ICsJCWNzcl9zZXQoQ1NSX0hFREVMRUcsIE1JU19ERUxFRyk7Cj4+ICsJZWxz
ZSBpZiAodmFsdWUgPT0gMCkKPj4gKwkJY3NyX2NsZWFyKENTUl9IRURFTEVHLCBNSVNfREVMRUcp
Owo+PiArCWVsc2UKPj4gKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPj4gKwo+PiAr
CXJldHVybiBTQklfU1VDQ0VTUzsKPj4gK30KPj4gKwo+PiArc3RhdGljIGxvbmcga3ZtX3NiaV9m
d2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+PiAr
CQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPj4gKwkJCQkJdW5zaWduZWQg
bG9uZyAqdmFsdWUpCj4+ICt7Cj4+ICsJKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAm
IE1JU19ERUxFRykgIT0gMDsKPiAKPiBUaGlzIHNob3VsZCBiZQo+IAo+ICAgKGNzcl9yZWFkKENT
Ul9IRURFTEVHKSAmIE1JU19ERUxFRykgPT0gTUlTX0RFTEVHOwoKSHVtIHllYWggaW5kZWVkLCBJ
IGRpZG4ndCB0aG91Z2h0IHRoYXQgc29tZW9uZSB3b3VsZCBvbnkgZGVsZWdhdGUgbG9hZApvciBz
dG9yZXMuCgpJJ2xsIGZpeCB0aGF0LAoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICsKPj4gKwly
ZXR1cm4gU0JJX1NVQ0NFU1M7Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3Zt
X3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPj4gKwl7Cj4+ICsJCS5pZCA9IFNCSV9G
V0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+PiArCQkuc3VwcG9ydGVkID0ga3ZtX3NiaV9md2Z0
X21pc2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQsCj4+ICsJCS5zZXQgPSBrdm1fc2JpX2Z3
ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4gKwkJLmdldCA9IGt2bV9zYmlfZndmdF9n
ZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+PiArCX0sCj4+ICB9Owo+PiAgCj4+ICBzdGF0aWMg
c3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKgo+PiAtLSAKPj4gMi40OS4wCj4+Cj4gCj4gVGhh
bmtzLAo+IGRyZXcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
