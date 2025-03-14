Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB9C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYexE4eGZsPbkd7+DLJ/g9R5MxCzTuxLkZ5SPJthzYI=; b=PnPZUuAfkFwgJC
	LQJMQ4ira36QzmWf8U61oeRKCvP2SFS6jp71PLOYRm2+zd0TP+LXSYgpjqotZG/wdFHXS4u6ostWr
	jQI+SU0i4W/1BR6owYqtu3QtE6NaaQ9v1zYpBxvHlJrNhv12Hrkp3QnLcGn7Hfbzr8nuimPmDTxcr
	xcQTWolN8oL+L2UAAXJgJ23E64/cqU3ZQZDBCoHMxRr85cfDYi+FFFP6giFcoH+L9QRcxRsmKzkqe
	YcFgJvGMfNAa6sZXqa4Y3Yn9aKlRHPGVwlOm9/b4deadMUKNTPx52/F7654HPduVIuSK0OU/D3lIV
	Qt7tbXJf/EGAubrT3keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Vf-0000000E3Yn-3tbt;
	Fri, 14 Mar 2025 11:47:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Vd-0000000E3Xs-3517
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:47:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1994248f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952844; x=1742557644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzikXcMBGZjkkMXY0vzLgpXOZlJlOHrf1lUiKHrI63E=;
        b=bYX7NYu1GpB7UPMZQXY0rX86V5oD6yD95dQikUAvGwDJulDlDdDeapFVGLocie25Pq
         Ty1XkEyByqapil9gY4Xqmtp7zaRhjJSPdyvaYn1/30FoMXTakKfR2kV+6/SkAb/7/3CD
         nbMVh0uUzFoYrJA/lEPlzrXSYr91+7uWPVvSPjjfPfFpZrVXLfELMrZ3Cau9otnUyrGt
         SLLB3+6ES1i9Yn9xoYn2bboxGT/IBH0454p1ZlKphLnF60V6tNtKxh9oLnUjOygBF88p
         ciR5giuZKlvfQzQZ7IySPPt/obpaAwQ+3569SusA/ajQDXRy5JNjzsiszUrj03SGJAzE
         KMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952844; x=1742557644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzikXcMBGZjkkMXY0vzLgpXOZlJlOHrf1lUiKHrI63E=;
        b=S2o2b0TK0H0x5GlRLuHQDEiUYDFGYDLyNMz/45/pCkpveGRoOYu8DvEckFtopTjACB
         /rkNbXvF1/rzKkHdCYc3xtZyyCNVWjziCv843yA6ZS/gYPnyVKcPhNeJlIYujHHpJGwY
         1HsEkSIGFAwPjrNoNz1fbxyYLvtQetHup5IMZP2sHFGdUpIY1h/fnG8MWB0Ex1FeIhHz
         Qo7anK03tLB3YZKh4gHGp0Vr5UgQahmKzwtGzQ4ZShsqYjGr0YBmQbGxRMKAAGe9DeMN
         mlYd+cl8aqSiV/2rmGgFfliIFrlrwXHFYS0peI+kKTxXepdIQpB87hZK/oN+CjZBwU3F
         4uJw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Cl63ztX+5YJ6Lv4T2zLb9TQnCRaSH/xXxTfug+RJDN8YvgeQOVNd0ZeBjzApy4qGKuNWT47xjL92qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YztQ8hOAFKu08tdvaoi6/90Qsb/TSllkL2IuOJep3dWKBSzL++N
	UXuC0SXS5PqFgc4Pg3OOMLiPLfbYgELwK6vRO5QxybjcMOxAcB+JTuUurfNziio=
X-Gm-Gg: ASbGncuXpMwYeAQgdFhzBDvlKR6kn0Ydi3SpwR13VX+AGgozEyqGZl1kS0KlT6vPRrl
	rlZHE/WRQgHLjwe1/StXo3Fe3PcGOM+kkEB8tK+Cx+M6aUrfdXv9JTxvG4+uStC0E+aki0ZKy5K
	OKy8T3m/f4i5F/fe0Qb9x/XBOVOQyX9LfnvADBXkxC0bBaYCt3bPFDlaFMSV80x/XB63GYVa8Tg
	C3eAqDIp9RROFFT97GvMJufEHzs6MzIKqglyf5FeAMm0Z8NIc/FoYHi2SaSrQEm7bsL8Iqqs3a9
	YTlBoal3GYTGt+Z2jBlYmUF1uYSfGvMIPJM/DhxF8lsz2FcY+0QMjxipFeECbXfLWxcjggda9/7
	i+4grA/5BvlwtTA==
X-Google-Smtp-Source: AGHT+IGtfAcAmGZVPhIyucY33egMDOBZySQ+8fr8l7lHLk072SvheDgQHi3fAYh9SVsSUmw9CF0urA==
X-Received: by 2002:a05:6000:2cf:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3971c97ba0cmr2373277f8f.17.1741952844036;
        Fri, 14 Mar 2025 04:47:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb9ccsm5371909f8f.96.2025.03.14.04.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:47:23 -0700 (PDT)
Message-ID: <f0945e93-7ac0-4217-8095-93fff303bdf2@rivosinc.com>
Date: Fri, 14 Mar 2025 12:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef for
 misaligned_access_speed
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-7-cleger@rivosinc.com>
 <20250313-a437330d8e1c638a9aa61e0a@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-a437330d8e1c638a9aa61e0a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044725_765421_DF3C2AB7 
X-CRM114-Status: GOOD (  14.33  )
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

CgpPbiAxMy8wMy8yMDI1IDE0OjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTNQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBt
aXNhbGlnbmVkX2FjY2Vzc19zcGVlZCBpcyBkZWZpbmVkIHVuZGVyIENPTkZJR19SSVNDVl9TQ0FM
QVJfTUlTQUxJR05FRAo+PiBidXQgd2FzIHVzZWQgdW5kZXIgQ09ORklHX1JJU0NWX1BST0JFX1VO
QUxJR05FRF9BQ0NFU1MuIEZpeCB0aGF0IGJ5Cj4+IHVzaW5nIHRoZSBjb3JyZWN0IGNvbmZpZyBv
cHRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMg
fCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiBpbmRleCBmZmFjNDI0ZmFh
ODguLjdmZTI1YWRmMjUzOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
Ywo+PiBAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGln
bmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICAKPj4gIAlwZXJmX3N3X2V2ZW50KFBF
UkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7Cj4+ICAKPj4gLSNp
ZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUwo+PiArI2lmZGVmIENPTkZJ
R19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAo+PiAgCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWduZWRf
YWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQ7
Cj4+ICAjZW5kaWYKPiAKPiBTdXJlLCBidXQgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9B
Q0NFU1Mgc2VsZWN0cwo+IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCwgc28gdGhpcyBp
c24ndCBmaXhpbmcgYW55dGhpbmcuIAoKSW5kZWVkLCB0aGF0IGlzIG5vdCBmaXhpbmcgYW55dGhp
bmcgKGhlbmNlIG5vIEZpeGVzIHRhZyksIGl0IGNvbXBpbGVzIGFzCmEgc2lkZSBlZmZlY3Qgb2Yg
S2NvbmZpZyBkZXBlbmRlbmNpZXMuCgo+IENoYW5naW5nIGl0Cj4gZG9lcyBtYWtlIHNlbnNlIHRo
b3VnaCBzaW5jZSB0aGlzIGxpbmUgaW4gaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoKQo+
ICJiZWxvbmdzIiB0byBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKCkgd2hpY2ggaXMg
YWxzbyB1bmRlcgo+IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRC4gQW55d2F5LCBhbGwg
dGhpcyB1bmFsaWduZWQgY29uZmlncyBuZWVkIGEKPiBtYWpvciBjbGVhbnVwLgoKWWVzLCBhcyBJ
IHNhaWQsIEknZCBiZSBhZHZvY2F0aW5nIHRvIHJlbW92ZSBhbGwgdGhhdCBpZmRlZmVyeSBtZXNz
LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAKPj4gIAo+PiAt
LSAKPj4gMi40Ny4yCj4+Cj4+Cj4+IC0tIAo+PiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
