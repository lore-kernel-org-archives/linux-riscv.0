Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81551CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzLFj3+mWd2QWhcE88HXLrPdcKQQ/4zPuwJOHcoDDdM=; b=1nYzpSaUfgLsxQ
	DdVVsjXKd2ij4XYgrnK8rYzrPkSl99fHoDATxx6btCIQVRMuUQ5mOxAob5uosu0sdB1xDS9xqMUXQ
	rn1WsFBEorHkAdo3GwEqSshIExrK2+SANA4ST3kdWXF+d0EanIraWGGFX2/vHXxTfczNeyEAOJdyy
	higxHySz+5o+y9/7BCL/rrBfompL5yr82CtK4b6bXL5EJQGZ7k3+dIXCQs24vXO3B6trPd7NIcPmN
	H8Hzh81/b5Qqd++DSBvMQ+lJ2IGyqTVlOwJRe9RR92/RAPej1CtxsqGy2+Bt2tCAdgXpeVce/E1de
	p81WEzYg5nFeZesha/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqPp-00000005UFF-2Ev3;
	Thu, 23 Oct 2025 08:11:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqPm-00000005U9I-2c9j
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 08:11:20 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3BC763F5D1
	for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761207070;
	bh=Z5SN8O79YRYmCSSNpNrgkSyaMZl3w3aJ8IKWpZBuE5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=LpZRdNUSRtsAvL3Io8c8//MJqNYvI5wvP4zRaxGveT67MYyx9MOOsL7iJMjMq6DkO
	 i83tj6LyW7inSIZUptRUrifLcct5YPnIHzuBFk1bLjGZR4cw8wYkO1+ZejXHLeTNyc
	 PKeJ++eMgBel/xZoMjJJr74L2ysZmKFHMgUNuUtKf0xdeAcAvJI6YEkNY/RVigQgQv
	 w8weM55QeLdctgovwLP+bFBGXT+PZfa2ISzkUxNMvJvefHpwi1szncZYdavvldgsyb
	 cMMdtHBK4VNHU6Cw+z6seXVETNXbuplXK6/cqnfjA/fL5rfQ6iPXugu3UnmpBAP3qb
	 rtcZiNQlpaDipHty7HQz1zsrhCZ94Ebdzmros9sk9izEVe/sBeDO1hmrB4NgWeIPSV
	 QxTvazE9h4a+hzOg7/b8KV9Cq5uDDOpSTpwvgeIdGg/kpfwbwGlWGh9g/x6cvcr0KA
	 S4WTYkmI6+oTqEZEx8j5tONe4e+f91QZAAhQAfyvMjyOFghU/YgZqKgeJu/yOjo/fU
	 3C2hcxA+aZZs92LI67i6c8AbQexgQOU+s/CmROV5E0zfykUdPsGkTLE+97Ma+7txWY
	 WrlFy020KRS4XPQOXdCgPHAEBWfEnD5ffvO5s0RGsneC99k0+DwlwXJpHAlIScwfMe
	 1enUyQm4xl1DCOOHJGPRbyj8=
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42814749a6fso248164f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 01:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207069; x=1761811869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5SN8O79YRYmCSSNpNrgkSyaMZl3w3aJ8IKWpZBuE5c=;
        b=M9GOmOTe6V0ShZaSKdS9+VXZzsHCEJf54Fe8gci3852z7f7txZuNEvnJ9qDUtkh1fp
         LHz65VUJ0L9OO+CZ1mLfs27o0MV9Bc3Ew7cd7siOHOENbNRLI9/EQMVUO5qeTDzCM6Ai
         KS0dqUAlSMcoyV2sWtMULk9Li6nOqViOzCnuMM8ul/cfakzj+f6E031HR4hfq7lmqwJF
         KrU9nP9wqq1QBABvyMcH2OI8yIWFOjfQZWJ6mpUJX06/hlND3WfPLnwlVl/nRJz4vfha
         SgjX5cQ/+TeVDcSjlD8MNVngVmO23dk18XjBr2jlJrGjOS42+2hTz+NMXgYBp28hqwWZ
         m/qQ==
X-Gm-Message-State: AOJu0YxHEHKACKhrJ5UG8rAISK5MzDQWh1gaTd6PuDI4IGUWWDMrPnWH
	NQRiFDM5Id8b6qdFdwLmLpxaNr+3TkMJm56y3ovPztmaZ2GfjpqryYQRazVKwkVW7zoiaAqbH5n
	AedRQYSqbhrO5SpIZDYLvlDfXz9xemhROLJeoB6rZ/Hm2lTZLS9IU+9LvGJ44frSIh4KPHKAwXp
	H0XIxiK1z5Ng==
X-Gm-Gg: ASbGncvcydY8/3b/qn8kGWcT464uTGf4jyJ7TFMCgR54z8V9S4FccJfEOqrwMKU0Yuo
	63XhMBYL3mG/RM3Oz6JhfoG58xEJs68Uma0iO15da63Alz4zXnUu9SJyUZ8O+5aafYmJsgzf3Jb
	lCWylrDBvA6SsU6pGtLuSdCxe9WlS3Hn2jogbqfq9xC/0BuGd1RI7AZ7ZYRhL6VFT3SP5Dw58HC
	7o/l1Td3JfeXfy6tOvKbnx+31AwhArchXeMPwYJIho89c9wRca3d1NDBkA57059AGDrMJIMUz5F
	8uDGgqXnjeGVowxcciRjUSXCIptZi9s1EO3gekCfZ8XKtTs19mnEIz0AD6FMYUeEVX2OME/Z7qW
	wXQw2bnT0Y17HqiChui9Wfn/Ok1U9tup5nnan6IWcXSwku877z96PVvZfEKBUc9o=
X-Received: by 2002:a5d:5c89:0:b0:3ec:d7c4:25b6 with SMTP id ffacd0b85a97d-42704d78abfmr17575454f8f.27.1761207069396;
        Thu, 23 Oct 2025 01:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4lM0Aosb5M4emD0MUgVZEES7YYuTxTxi5d+yu262Bbn7yJS0L3y2j+jUfDJDn0IFEpYEaXw==
X-Received: by 2002:a5d:5c89:0:b0:3ec:d7c4:25b6 with SMTP id ffacd0b85a97d-42704d78abfmr17575413f8f.27.1761207068944;
        Thu, 23 Oct 2025 01:11:08 -0700 (PDT)
Received: from ?IPV6:2a00:2381:43b9:32:c6f5:a3d6:39ca:b30e? ([2a00:2381:43b9:32:c6f5:a3d6:39ca:b30e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897f57b7sm2622170f8f.16.2025.10.23.01.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:11:08 -0700 (PDT)
Message-ID: <22b5f8d0-c2c1-4072-b311-5750c8c6a045@canonical.com>
Date: Thu, 23 Oct 2025 09:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com,
 alexghiti@rivosinc.com, cleger@rivosinc.com, zong.li@sifive.com,
 valentin.haudiquet@canonical.com, jesse.huang@sifive.com,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
 <418119d5-4892-4697-a0ab-6a76302fea77@canonical.com>
 <aPl48xlYTohtI648@debug.ba.rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <aPl48xlYTohtI648@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_011119_149649_F8CD91FD 
X-CRM114-Status: GOOD (  24.52  )
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

T24gMTAvMjMvMjUgMDE6MzgsIERlZXBhayBHdXB0YSB3cm90ZToKPiBIaSBIaWVucmljaCwKPiAK
PiAKPiBPbiBUdWUsIE9jdCAyMSwgMjAyNSBhdCAwMToxMzozNlBNICswMjAwLCBIZWlucmljaCBT
Y2h1Y2hhcmR0IHdyb3RlOgo+PiBPbiAxMC8yMC8yNSAyMDoxOCwgRGVlcGFrIEd1cHRhIHdyb3Rl
Ogo+Pj4geDg2IGhhcyBwcm9jLzxwaWQ+L3N0YXR1cyB0byBzZWUgdmFyaW91cyBydW50aW1lIGNo
YXJhY3RlcmlzdGljcwo+Pj4gb2YgcnVubmluZyB0YXNrLiBJbXBsZW1lbnQgc2FtZSBmb3Igcmlz
Y3YuIFRoaXMgcGF0Y2ggaW1wbGVtZW50cwo+Pj4gc3RhdHVzIGZvciBzaGFkb3cgc3RhY2sgYW5k
IGxhbmRpbmcgcGFkIHN0YXRlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8
ZGVidWdAcml2b3NpbmMuY29tPgo+Pj4gLS0tCj4+PiBUaGlzIGlzIGp1c3QgYSBvbmUgcGF0Y2gg
YnV0IHNlbmRpbmcgaXQgYXMgUkZDIHdpdGggY292ZXIgbGV0dGVyIHRvIHNlZWsKPj4+IGZlZWRi
YWNrLiB4ODYgaGFzIGBhcmNoX3Byb2NfcGlkX3RocmVhZF9mZWF0dXJlc2AgdG8gZW51bWVyYXRl
IHN0YXR1cyBvZgo+Pj4gYXJjaCB0aHJlYWQgc3BlY2lmaWMgZmVhdHVyZXMgb24gcnVudGltZS4g
VGhpcyBjYW4gYmUgZG9uZSB1c2luZyBwcmN0bAo+Pj4gYXMgd2VsbCBidXQgZnJvbSBxdWljay9z
Y3JpcHQgcGVyc3BlY3RpdmUgYGNhdCAvcHJvYy88cGlkPi9zdGF0dXNgIGlzIAo+Pj4gbW9yZQo+
Pj4gZGVzaXJhYmxlLiBJbiB0aGlzIHBhdGNoLCBzaW1wbHkgYGFyY2hfcHJvY19waWRfdGhyZWFk
X2ZlYXR1cmVzYCBpcyAKPj4+IGltcGxlbWVudGVkCj4+PiBmb3IgcmlzY3Ygd2hpY2ggcXVlcmll
cyBzaGFkb3cgc3RhY2sgYW5kIGxhbmRpbmcgcGFkIHN0YXRlIGFuZCAKPj4+IHJlcG9ydHMgYmFj
ay4KPj4+IFRodXMgaXQgaXMgZGVwZW5kZW50IG9uIHJpc2N2IHVzZXIgY2ZpIGVuYWJsaW5nIHNl
cmllcy4KPj4KPj4gSGVsbG8gRGVlcGFrLAo+Pgo+PiBUaGlzIGxvb2tzIGxpa2UgYSB2YWx1YWJs
ZSBhZGRpdGlvbi4KPj4KPj4gU2hvdWxkbid0IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBmaWVsZHMg
YmUgaW4KPj4gL3Byb2MvPHBpZD4vYXJjaF9zdGF0dXMgYW5kIG5vdCBpbiAvcHJvYy88cGlkPi9z
dGF0dXM/Cj4gCj4gSnVzdCBmb2xsb3dpbmcgd2hhdCB4ODYgZGlkLiBJIGJlbGlldmUgc2hhZG93
IHN0YWNrIGFuZCBsYW5kaW5nIHBhZCBhcmUgCj4gdGhlcmUKPiBpbiBhcm02NCwgeDg2IGFuZCBy
aXNjdi4gU28gcHJvYmFibHkgL3Byb2MvPHBpZD4vc3RhdHVzIGlzIGJlc3QgcGxhY2UuCj4+Cj4+
IFBsZWFzZSwgYWRkIGEgZG9jdW1lbnRhdGlvbiBwYXRjaCBhZGRpbmcgdGhlIFJJU0MtViBzcGVj
aWZpYyBmaWVsZHMgdG8KPj4gIjMuMTLCoCAvcHJvYy88cGlkPi9hcmNoX3N0YXR1cyAtIFRhc2sg
YXJjaGl0ZWN0dXJlIHNwZWNpZmljIGluZm9ybWF0aW9uIgo+PiBpbiBEb2N1bWVudGF0aW9uL2Zp
bGVzeXN0ZW1zL3Byb2MucnN0Lgo+Pgo+PiBTaG91bGQgeW91IHN0aWNrIHRvIC9wcm9jLyovc3Rh
dHVzLCBwbGVhc2UsIGFkZCB0aGUgZG9jdW1lbnRhdGlvbiB0byAKPj4gRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2Ly4KPiAKPiBXaWxsIGRvLgo+IAo+Pgo+Pj4KPj4+IElmIHRoaXMgcGF0Y2ggaXRz
ZWxmIGlzIHNlbGYtc3RhbmRpbmcgYW5kIGdvb2QgZW5vdWdoLCBJIGNhbiByb2xsIAo+Pj4gdGhp
cyBwYXRjaAo+Pj4gYXMgcGFydCBvZiByaXNjdiB1c2VyIGNmaSBlbmFibGluZyBzZXJpZXMuCj4+
Pgo+Pj4gT1IKPj4+Cj4+PiBJZiB0aGVyZSBpcyBhc2sgZm9yIG90aGVyIHJpc2N2IHRocmVhZCBz
cGVjaWZpYyBmZWF0dXJlcyB0aGF0IGNvdWxkIGJlCj4+PiBlbnVtZXJhdGVkIGluIHNpbWlsYXIg
ZmFzaGlvbiwgd2Ugd2lsbCBuZWVkIGl0IHRvIGJlIGRvbmUgYXMgc2VwYXJhdGUgCj4+PiBzZXJp
ZXMKPj4+ICh3aXRoIGB0aHJlYWRfZmVhdHVyZXNgIGFkZGVkIHRvIGB0aHJlYWRfaW5mb2ApCj4+
Pgo+Pj4gRXhhbXBsZSBvdXRwdXQgYmVsb3cuCj4+Pgo+Pj4gTmFtZTrCoMKgIGNhdAo+Pj4gVW1h
c2s6wqAgMDAyMgo+Pj4gU3RhdGU6wqAgUiAocnVubmluZykKPj4+IFRnaWQ6wqDCoCAxMzMKPj4+
IE5naWQ6wqDCoCAwCj4+PiBQaWQ6wqDCoMKgIDEzMwo+Pj4gUFBpZDrCoMKgIDEyOQo+Pj4gVHJh
Y2VyUGlkOsKgwqDCoMKgwqAgMAo+Pj4gVWlkOsKgwqDCoCAwwqDCoMKgwqDCoMKgIDDCoMKgwqDC
oMKgwqAgMMKgwqDCoMKgwqDCoCAwCj4+PiBHaWQ6wqDCoMKgIDDCoMKgwqDCoMKgwqAgMMKgwqDC
oMKgwqDCoCAwwqDCoMKgwqDCoMKgIDAKPj4+IEZEU2l6ZTogMjU2Cj4+PiBHcm91cHM6IDAgMTAK
Pj4+IE5TdGdpZDogMTMzCj4+PiBOU3BpZDrCoCAxMzMKPj4+IE5TcGdpZDogMTMzCj4+PiBOU3Np
ZDrCoCAxMjkKPj4+IEt0aHJlYWQ6wqDCoMKgwqDCoMKgwqAgMAo+Pj4gVm1QZWFrOsKgwqDCoCAx
MDc4OCBrQgo+Pj4gVm1TaXplOsKgwqDCoCAxMDc4OCBrQgo+Pj4gVm1MY2s6wqDCoMKgwqDCoMKg
wqDCoCAwIGtCCj4+PiBWbVBpbjrCoMKgwqDCoMKgwqDCoMKgIDAga0IKPj4+IFZtSFdNOsKgwqDC
oMKgwqAgMTQwMCBrQgo+Pj4gVm1SU1M6wqDCoMKgwqDCoCAxNDAwIGtCCj4+PiBSc3NBbm9uOsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMTYga0IKPj4+IFJzc0ZpbGU6wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAxMjg0IGtCCj4+PiBSc3NTaG1lbTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
IGtCCj4+PiBWbURhdGE6wqDCoMKgwqDCoMKgIDkyIGtCCj4+PiBWbVN0azrCoMKgwqDCoMKgIDgz
MjQga0IKPj4+IFZtRXhlOsKgwqDCoMKgwqDCoMKgwqAgNCBrQgo+Pj4gVm1MaWI6wqDCoMKgwqDC
oCAyMzEyIGtCCj4+PiBWbVBURTrCoMKgwqDCoMKgwqDCoCA0MCBrQgo+Pj4gVm1Td2FwOsKgwqDC
oMKgwqDCoMKgIDAga0IKPj4+IEh1Z2V0bGJQYWdlczrCoMKgwqDCoMKgwqDCoMKgwqAgMCBrQgo+
Pj4gQ29yZUR1bXBpbmc6wqDCoMKgIDAKPj4+IFRIUF9lbmFibGVkOsKgwqDCoCAwCj4+PiB1bnRh
Z19tYXNrOsKgwqDCoMKgIDB4ZmZmZmZmZmZmZmZmZmZmZgo+Pj4gVGhyZWFkczrCoMKgwqDCoMKg
wqDCoCAxCj4+PiBTaWdROsKgwqAgMC8zMTc3MQo+Pj4gU2lnUG5kOiAwMDAwMDAwMDAwMDAwMDAw
Cj4+PiBTaGRQbmQ6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFNpZ0JsazogMDAwMDAwMDAwMDAwMDAw
MAo+Pj4gU2lnSWduOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiBTaWdDZ3Q6IDAwMDAwMDAwMDAwMDAw
MDAKPj4+IENhcEluaDogMDAwMDAwMDAwMDAwMDAwMAo+Pj4gQ2FwUHJtOiAwMDAwMDFmZmZmZmZm
ZmZmCj4+PiBDYXBFZmY6IDAwMDAwMWZmZmZmZmZmZmYKPj4+IENhcEJuZDogMDAwMDAxZmZmZmZm
ZmZmZgo+Pj4gQ2FwQW1iOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiBOb05ld1ByaXZzOsKgwqDCoMKg
IDAKPj4+IFNlY2NvbXA6wqDCoMKgwqDCoMKgwqAgMAo+Pj4gU2VjY29tcF9maWx0ZXJzOsKgwqDC
oMKgwqDCoMKgIDAKPj4+IFNwZWN1bGF0aW9uX1N0b3JlX0J5cGFzczrCoMKgwqDCoMKgwqAgdW5r
bm93bgo+Pj4gU3BlY3VsYXRpb25JbmRpcmVjdEJyYW5jaDrCoMKgwqDCoMKgIHVuc3VwcG9ydGVk
Cj4+PiBDcHVzX2FsbG93ZWQ6wqDCoCAzCj4+PiBDcHVzX2FsbG93ZWRfbGlzdDrCoMKgwqDCoMKg
IDAtMQo+Pj4gTWVtc19hbGxvd2VkOsKgwqAgMQo+Pj4gTWVtc19hbGxvd2VkX2xpc3Q6wqDCoMKg
wqDCoCAwCj4+PiB2b2x1bnRhcnlfY3R4dF9zd2l0Y2hlczrCoMKgwqDCoMKgwqDCoCAwCj4+PiBu
b252b2x1bnRhcnlfY3R4dF9zd2l0Y2hlczrCoMKgwqDCoCAzCj4+PiByaXNjdl90aHJlYWRfZmVh
dHVyZXM6wqAgc2hzdGtfZW5hYmxlZCBscGFkX2VuYWJsZWQKPj4+IHJpc2N2X3RocmVhZF9mZWF0
dXJlc19sb2NrZWQ6wqDCoCBzaHN0a191bmxvY2tlZCBscGFkX3VubG9ja2VkCj4+PiAtLS0KPj4+
IMKgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGXCoMKgwqDCoCB8wqAgMSArCj4+PiDCoGFyY2gv
cmlzY3Yva2VybmVsL2NwdS9NYWtlZmlsZSB8wqAgMSArCj4+PiDCoGFyY2gvcmlzY3Yva2VybmVs
L2NwdS9wcm9jLmPCoMKgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAz
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+Pj4g
aW5kZXggZjYwZmNlNjliNzI1Li5iMzJjMTE2NjdkODEgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9NYWtlZmlsZQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUK
Pj4+IEBAIC03MSw2ICs3MSw3IEBAIG9iai15wqDCoMKgICs9IHZlbmRvcl9leHRlbnNpb25zLm8K
Pj4+IMKgb2JqLXnCoMKgwqAgKz0gdmVuZG9yX2V4dGVuc2lvbnMvCj4+PiDCoG9iai15wqDCoMKg
ICs9IHByb2Jlcy8KPj4+IMKgb2JqLXnCoMKgwqAgKz0gdGVzdHMvCj4+PiArb2JqLXnCoMKgwqAg
Kz0gY3B1Lwo+Pj4gwqBvYmotJChDT05GSUdfTU1VKSArPSB2ZHNvLm8gdmRzby8KPj4+IMKgb2Jq
LSQoQ09ORklHX1JJU0NWX01JU0FMSUdORUQpwqDCoMKgICs9IHRyYXBzX21pc2FsaWduZWQubwo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS9NYWtlZmlsZSBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdS8gCj4+PiBNYWtlZmlsZQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uMmI0NzRmYjQ5YWZlCj4+PiAtLS0gL2Rldi9udWxsCj4+PiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUvTWFrZWZpbGUKPj4+IEBAIC0wLDAgKzEgQEAKPj4+
ICtvYmotJChDT05GSUdfUFJPQ19GUynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IHByb2Mubwo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS9wcm9jLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHUvcHJvYy5jCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi40NjYxMTkwYzQzZDEKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdS9wcm9jLmMKPj4+IEBAIC0wLDAgKzEsMjggQEAKPj4+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Pj4gKyNpbmNsdWRlIDxsaW51eC9zbXAuaD4K
Pj4+ICsjaW5jbHVkZSA8bGludXgvdGltZXguaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvc3RyaW5n
Lmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4
L2NwdWZyZXEuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvcHJvY19mcy5oPgo+Pj4gKyNpbmNsdWRl
IDxhc20vdXNlcmNmaS5oPgo+Pj4gKwo+Pj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkK
Pj4+ICsKPj4+ICt2b2lkIGFyY2hfcHJvY19waWRfdGhyZWFkX2ZlYXR1cmVzKHN0cnVjdCBzZXFf
ZmlsZSAqbSwgc3RydWN0IAo+Pj4gdGFza19zdHJ1Y3QgKnRhc2spCj4+PiArewo+Pj4gK8KgwqDC
oCBzZXFfcHV0cyhtLCAicmlzY3ZfdGhyZWFkX2ZlYXR1cmVzOlx0Iik7Cj4+PiArwqDCoMKgIGlm
IChpc19zaHN0a19lbmFibGVkKHRhc2spKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNlcV9wdXRzKG0s
ICJzaHN0a19lbmFibGVkICIpOwo+Pgo+PiBBY2NvcmRpbmcgdG8gRG9jdW1lbnRhdGlvbi9hcmNo
L3g4Ni9zaHN0ay5yc3QsIHg4NiBpcyBhdm9pZGluZyB0aGUgCj4+ICdfZW5hYmxlZCcgcG9zdGZp
eCBoZXJlOgo+Pgo+PiB4ODZfVGhyZWFkX2ZlYXR1cmVzOiBzaHN0ayB3cnNzCj4gCj4gSSBjYW4g
Zm9sbG93IHNhbWUgYW5kIHVzZSBgc2hzdGtgLiBXZSBkb24ndCBoYXZlIGB3cnNzYCBiZWNhdXNl
Cj4gc2hhZG93IHN0YWNrIGlzIHdyaXRlYWJsZSBieSByaWdodCBpbnN0cnVjdGlvbiAoc3NwdXNo
IGFuZCBzc2Ftb3N3YXApIGluCj4gcmlzY3YuCj4gCj4+Cj4+PiArCj4+PiArwqDCoMKgIGlmIChp
c19pbmRpcl9scF9lbmFibGVkKHRhc2spKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNlcV9wdXRzKG0s
ICJscGFkX2VuYWJsZWQgIik7Cj4gCj4gV291bGQgeW91IHByZWZlciBzaW1pbGFyIGhlcmUuIEp1
c3QgImxwYWQiPwoKVGhhdCB3b3VsZCBiZSBjb25zaXN0ZW50IHdpdGggd2hhdCBpcyBkb25lIGZv
ciB4ODYuCgpCZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCgo+IAo+Pj4gKwo+Pj4gK8KgwqDCoCBzZXFf
cHV0YyhtLCAnXG4nKTsKPj4+ICsKPj4+ICvCoMKgwqAgc2VxX3B1dHMobSwgInJpc2N2X3RocmVh
ZF9mZWF0dXJlc19sb2NrZWQ6XHQiKTsKPj4+ICvCoMKgwqAgaXNfc2hzdGtfbG9ja2VkKHRhc2sp
ID8gc2VxX3B1dHMobSwgInNoc3RrX2xvY2tlZCAiKSA6IAo+Pj4gc2VxX3B1dHMobSwgInNoc3Rr
X3VubG9ja2VkICIpOwo+Pj4gK8KgwqDCoCBpc19pbmRpcl9scF9sb2NrZWQodGFzaykgPyBzZXFf
cHV0cyhtLCAibHBhZF9sb2NrZWQgIikgOiAKPj4+IHNlcV9wdXRzKG0sICJscGFkX3VubG9ja2Vk
ICIpOwo+Pgo+PiBXaHkgZG8gd2UgbmVlZCBhbnkgZW50cnkgZm9yIGFuIHVubG9ja2VkIGZlYXR1
cmUgaW4gCj4+IHJpc2N2X3RocmVhZF9mZWF0dXJlc19sb2NrZWQ/Cj4gCj4gYWJzZW5jZSBvZiAi
ZmVhdHVyZV9sb2NrZWQiIGlzIGNvbnNpZGVyZWQgdW5sb2NrZWQsIHRoZW4gSSBjYW4gZHJvcCBp
dC4KPiAKPj4KPj4gQmVzdCByZWdhcmRzCj4+Cj4+IEhlaW5yaWNoCj4+Cj4+PiArwqDCoMKgIHNl
cV9wdXRjKG0sICdcbicpOwo+Pj4gK30KPj4+ICsjZW5kaWYgLyogQ09ORklHX1JJU0NWX1VTRVJf
Q0ZJICovCj4+Pgo+Pj4gLS0tCj4+PiBiYXNlLWNvbW1pdDogM2E4NjYwODc4ODM5ZmFhZGI0ZjFh
NmRkNzJjMzE3OWMxZGY1Njc4Nwo+Pj4gY2hhbmdlLWlkOiAyMDI1MTAxNy1wcm9jX3N0YXR1cy1k
ZjFhZWRjODVjN2MKPj4+IC0tIAo+Pj4gLSBkZWJ1Zwo+Pj4KPj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
