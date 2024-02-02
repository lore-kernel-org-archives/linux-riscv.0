Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6476AC48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhyWrAhm00lfAl1QkPMBnaHU1eddPNCCUOL2utykvoE=; b=PlOoGmqXE8BM59
	Dgq+dGVYPFPZq/5yHBO99kxklU8CWeAPHO8SyMxOuJ2BZgVcgXrPqxuDO7m++ZccpA6lYHq0dMgjd
	5KneuFBXogT6wcg3yIWFGqxFdaOVBlSNUlCUf/AydGBgS2zbrWJIeCgcw1q/iDbFB4CpZJg5aP94T
	sxgboL2g8CATuIhCEiLTUYbS48nK101OsNBBf3JW1D2iEbIB1DvqBT6WhRiazWYSJKUOLhR/wIcd1
	PGp15vjUuiBt5qc4X7GAzwdLeSZcAl9ez5v3Bj9GecruJeduly9/ZSKHqyhEuRj3MHj9rky2qhVjF
	L9/4Hflhs4hnFMMwK8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVop9-0000000AkfX-03Me;
	Fri, 02 Feb 2024 08:22:59 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVop2-0000000Akbv-46qZ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 08:22:56 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-59a1e21b0ebso464740eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 00:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706862167; x=1707466967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of+2VS6dyzD16ALuDPAa9WDdPy6fg9Ys9tT8Ytug3g4=;
        b=QrgOZt0i4PohTqFcdZSfTR9rnLoys2VifEHriIQgi/1y3WXOHu+grgaHk662tqx/J6
         A0eFQxh56+XE/6KhI/p2PQort4DarzxWVYB/zUHBQkUJq5KPabhcHOsuKsRaTHQS4EFN
         aU21pokakpAm0/NSkppCSQY5B51ag9OuWbP2oSCqXG6aEApiuQGTodRwhkG6Q7+OVKLx
         OzJbgYqdhhGofBLPLsXGwAaR5hDzVt4OLXjgyCGFzvREynGbhzcUHocm32WiEcxz570h
         JzcZE3dga6OlERo4W6qF8TNa5JQUMTR+F6D9VN3xoqyyBvqqY22YNCdJY6jNdovW0AUG
         WmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706862167; x=1707466967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of+2VS6dyzD16ALuDPAa9WDdPy6fg9Ys9tT8Ytug3g4=;
        b=SXFgvYwXw74DV5nAtO3A1OjmJHWsUk2rTMt2tHB/Esn6TKaj+oJm4hGzOEFsokm6u6
         BUTOp8vHMSLlAE+MmHpHILhUAs+BGn0yqvPzbA+sWOy+iJYP0oddfmpHP92MBI/F5Y/2
         0Idfbhx13UTp0OwwElZAMycbpKIBfc5wwRbccbFGnQzcM2mCxxRto7EK3N0L50GQ2zl7
         DjtIaXQuGgY04XDOlrM3vhu5uDCFR0YWmqzTFyTI1Ig76jG/D7nKB3tG7nmnRBfWHIux
         1VopEnVxTp5FLTAhQZiLp20vdFpiu6oSjm5AWuM4SQa3gvJP+jyLdwCfEd56ZyQRVaKE
         dD0Q==
X-Gm-Message-State: AOJu0YwgiPr5YYbNDlWi4jIDroyDuTSbvJ4YzQGTzZMk6WQXeANmSqVK
	xF8MPMBcouORmOKt8AqNV0ySZoEp1jNvs4g8N4KIgTYKTxg1O/fTb7Pn4ZyJSA9+ygh+0K+RQ8g
	L
X-Google-Smtp-Source: AGHT+IEqFgJjxsho51lgtlCQHbrRjML9//5X83vR4EP4Q6fKUc3ZeWRRAaFSJm8yIThVMvRZf7pMXw==
X-Received: by 2002:a05:6808:144e:b0:3bf:bbd7:c770 with SMTP id x14-20020a056808144e00b003bfbbd7c770mr1842892oiv.0.1706862167503;
        Fri, 02 Feb 2024 00:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW3DGFuK/LBFiPor3fjHm3Swk3yg/Ka5eaAjYPzEU+qprxT87NNjvtfixg9RxSNf9ML3AtgHiQlRFhUhc1jxHt2VpPEl4Fc+V/ILNHjw3IDJlHW4qxg6DK4VzqrYRAN4Ec2m4UnlPYE4zcCOCaLUloy5HfRHSibwCcwqkciUoU6snY57i0C7wdR3E/5wFLD3x1Dcb+1BXTbifx7Tqu8IrB04TXsXdSBTYGnjFRshKEVF2FEvj8Z0Xsi0kePgrdeplDwmC3UJq9s8kflXCsw50+rLpH8HgwJnwfPFygJ/N+Kww==
Received: from ?IPV6:2a01:e0a:999:a3a0:6d51:959f:bb28:92? ([2a01:e0a:999:a3a0:6d51:959f:bb28:92])
        by smtp.gmail.com with ESMTPSA id a21-20020ac844b5000000b0042bfbdb46f9sm603925qto.91.2024.02.02.00.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 00:22:46 -0800 (PST)
Message-ID: <701d3350-93d3-4235-aaf7-04c6492420a7@rivosinc.com>
Date: Fri, 2 Feb 2024 09:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export VA_BITS
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robin Ehn <rehn@rivosinc.com>
References: <20240201140319.360088-1-cleger@rivosinc.com>
 <ZbxUUsKdKIPI8Fb/@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZbxUUsKdKIPI8Fb/@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_002253_610800_183DB1C2 
X-CRM114-Status: GOOD (  21.13  )
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

CgpPbiAwMi8wMi8yMDI0IDAzOjMyLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gVGh1LCBG
ZWIgMDEsIDIwMjQgYXQgMDM6MDI6NDVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
PiBTb21lIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgKE9wZW5KREsgZm9yIGluc3RhbmNlKSB1c2Vz
IHRoZSBmcmVlIGJpdHMKPj4gaW4gcG9pbnRlcnMgdG8gaW5zZXJ0IGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24gZm9yIHRoZWlyIG93biBsb2dpYy4KPj4gQ3VycmVudGx5IHRoZXkgcmVseSBvbiBwYXJz
aW5nIC9wcm9jL2NwdWluZm8gdG8gb2J0YWluIHRoZSBjdXJyZW50IHZhbHVlCj4+IG9mIHZpcnR1
YWwgYWRkcmVzcyB1c2VkIGJpdHMgWzFdLiBFeHBvcnRpbmcgVkFfQklUUyB0aHJvdWdoIGh3cHJv
YmUgd2lsbAo+PiBhbGxvdyBmb3IgYSBtb3JlIHN0YWJsZSBpbnRlcmZhY2UgdG8gYmUgdXNlZC4K
PiAKPiBtbWFwIGFscmVhZHkgc3VwcG9ydHMgdGhpcyB3aXRob3V0IGEgbmVlZCBmb3IgYXBwbGlj
YXRpb25zIHRvIGtub3cgdGhlCj4gdW5kZXJseWluZyBoYXJkd2FyZS4gSWYgYSBoaW50IGFkZHJl
c3MgaXMgcGFzc2VkIGludG8gbW1hcCwgaXQgd2lsbCBuZXZlcgo+IHJldHVybiBhbiBhZGRyZXNz
IHRoYXQgdXNlcyBtb3JlIGJpdHMgdGhhbiB0aGUgaGludCBhZGRyZXNzLiBJIGRlc2lnbmVkCj4g
aXQgdGhhdCB3YXkgc28gdGhhdCBzb21ldGhpbmcgbGlrZSB0aGlzIHdhc24ndCBuZWNlc3Nhcnku
CgpPayBldmVuIHRob3VnaCBwcm9iaW5nIHRoaXMga2luZCBvZiB0aGluZyBpcyBwcm9iYWJseSBu
b3Qgd2hhdCBtbWFwIGlzCm1lYW50IHRvIGRvLiBJTUhPLCBwcm9iaW5nIHRoaXMgdGhyb3VnaCB0
aGUgcmVndWxhciBod3Byb2JlIGludGVyZmFjZSBpcwpwcm9iYWJseSBtb3JlIGNvaGVyZW50IGJ1
dCBtYXliZSBSb2JpbiAod2hpY2ggbmVlZHMgdGhpcyBpbmZvcm1hdGlvbikKY2FuIHJlbHkgb24g
dGhhdC4KCkNsw6ltZW50Cgo+IAo+IC0gQ2hhcmxpZQo+IAo+Pgo+PiBMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9tYXN0ZXIvc3JjL2hvdHNwb3Qvb3NfY3B1L2xpbnV4
X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlzY3YuY3BwI0wxNzEgWzFdCj4+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4KPj4gLS0tCj4+ICBE
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMyArKysKPj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oICAgICAgfCAyICstCj4+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jICAgICAgIHwgMyArKysKPj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlz
Y3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPj4g
aW5kZXggYjJiY2M5ZWVkOWFhLi42ZjE5OGM2ZWQ0ZjAgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKPj4gQEAgLTIxMCwzICsyMTAsNiBAQCBUaGUgZm9sbG93aW5nIGtl
eXMgYXJlIGRlZmluZWQ6Cj4+ICAKPj4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJ
Q0JPWl9CTE9DS19TSVpFYDogQW4gdW5zaWduZWQgaW50IHdoaWNoCj4+ICAgIHJlcHJlc2VudHMg
dGhlIHNpemUgb2YgdGhlIFppY2JveiBibG9jayBpbiBieXRlcy4KPj4gKwo+PiArKiA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9LRVlfVkFfQklUU2A6IEFuIHVuc2lnbmVkIGxvbmcgd2hpY2gKPj4g
KyAgcmVwcmVzZW50IHRoZSBudW1iZXIgb2YgYml0cyB1c2VkIHRvIHN0b3JlIHZpcnR1YWwgYWRk
cmVzc2VzLgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+PiBpbmRleCA2MzA1MDdkZmY1ZWEu
LjE1MGE5ODc3YjBhZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3By
b2JlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPj4gQEAgLTgs
NyArOCw3IEBACj4+ICAKPj4gICNpbmNsdWRlIDx1YXBpL2FzbS9od3Byb2JlLmg+Cj4+ICAKPj4g
LSNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDYKPj4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9C
RV9NQVhfS0VZIDcKPj4gIAo+PiAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X2h3cHJvYmVfa2V5
X2lzX3ZhbGlkKF9fczY0IGtleSkKPj4gIHsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCj4+IGluZGV4IDlmMmE4ZTNmZjIwNC4uMmE1MDA2Y2RkYjdiIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPj4gQEAgLTY3LDYgKzY3LDcgQEAgc3RydWN0
IHJpc2N2X2h3cHJvYmUgewo+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VO
U1VQUE9SVEVECSg0IDw8IDApCj4+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
TUFTSwkJKDcgPDwgMCkKPj4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NL
X1NJWkUJNgo+PiArI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9WQV9CSVRTCQk3Cj4+ICAvKiBJ
bmNyZWFzZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hlbiBhZGRpbmcgaXRlbXMuICovCj4+ICAK
Pj4gIC8qIEZsYWdzICovCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+PiBpbmRleCBhN2M1NmI0
MWVmZDIuLjMyODQzNTgzNmUzNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X2h3cHJvYmUuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4+IEBA
IC0yMDIsNiArMjAyLDkgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3Qgcmlz
Y3ZfaHdwcm9iZSAqcGFpciwKPj4gIAkJaWYgKGh3cHJvYmVfZXh0MF9oYXMoY3B1cywgUklTQ1Zf
SFdQUk9CRV9FWFRfWklDQk9aKSkKPj4gIAkJCXBhaXItPnZhbHVlID0gcmlzY3ZfY2Jvel9ibG9j
a19zaXplOwo+PiAgCQlicmVhazsKPj4gKwljYXNlIFJJU0NWX0hXUFJPQkVfS0VZX1ZBX0JJVFM6
Cj4+ICsJCXBhaXItPnZhbHVlID0gVkFfQklUUzsKPj4gKwkJYnJlYWs7Cj4+ICAKPj4gIAkvKgo+
PiAgCSAqIEZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHksIHVua25vd24ga2V5cyBkb24ndCBmYWls
IHRoZSB3aG9sZQo+PiAtLSAKPj4gMi40My4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
