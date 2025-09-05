Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A35CA1010
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ePqgGaKC9c/gBBpoGu5srXznrk/mqDF6wlnpfJWp7M=; b=fvEijFzp1l0WQK
	cxlXF2g1fHBkp+nIy1vhTFSdK2Gj+xAL2rLEkbB9BIFbrOI6oSqM8aZIPCQyEtf5AojDRWPk26sy4
	S4RDpRXHDxN1aPoVzdVlLlY67IUvYn5WzlWUP0D9vYFqSVGvbjMi7PxfKJVdtogMU02G/kT8bIW8/
	/dBrehUShgs2KcVabATPiQmIjHoYJU85jA7S5WXNwTslVh2HY2zo+QQGBlpfnV2RYckbDKCzSQbNt
	q984uo6R8XedBX2aSLS7NHEatLF+xLqVJWDouK6Jrx40IUW0l8lUhD73uAB9RPoaH42jk0N9uQUKY
	OjtWt9fSP3wdwDLZR3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQoW-0000000Haqd-0OKB;
	Fri, 05 Sep 2025 07:24:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPwr-0000000HHYY-0MRu
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 06:29:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso1533056a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757053764; x=1757658564; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FW7lMn0AUODjA3RFU0eDriejARFtJxq8hraVOainqwI=;
        b=B0yVgS18IU4kx5MGjmogTcT8aGfnQnyUc+f1NiBpwcfFc6OEQnqWq5E+zWCthjFhEI
         ZlHDO1EOKZC/ZivMQiGAjnPy+OaM5ATT0n0sS5BioQZOmw7NXbRm8lZdjiG9I/xmzDC6
         86INNdVvVKJ82+nTmL4K4OepyhYDEfht1Ap6opC9q6uxbSZ3RfD2AXTvJf8Z7WxyU+tF
         xtuI66Pn18RjWnhqyz0RBuzn+aqknNAxo8KBwtAjdny7AxttwwoWPNG3+MhRqCLTB7QB
         KZuGIyH0LoyMPSEyTCt4ZCYmNo/KiR821f8XiYCaoMsoA65uUNpBrm2qcCJpnXWytQix
         JHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757053764; x=1757658564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FW7lMn0AUODjA3RFU0eDriejARFtJxq8hraVOainqwI=;
        b=fBqMjzNbDLpNpZob1TZMZ9EEi6f0RE4Si5sO9Ymhosmgm8TeRY92GPPRJE/9dF5wxC
         mVsCGb/7TfMiYjpAu5CXGfKhtA1+gVijKgei1lhYt//bSeJVQdnUHBfWQcQ5slk7vVtp
         EUr46g0zfl8ELa81m3wASoZIDJ64Y57bZvBlqgDPCZNdnjR5tp+62G0BYRjHADFgWFvX
         BPE4t4JF39EfShhi/+MfPKo9DOLikl2tqIQvhUm0Y9E3jySLBc1HISR4qI5F/5h5/sD5
         qbmGBMbbinhzFckmlCSjU0a1MYXhivfQCtrx6EOp9SvTCMofop1tKIRVc2Fcl7J+KDu5
         +/ng==
X-Gm-Message-State: AOJu0YzeUnUlJL0p/KdOWDjzkJeQZTrAW4c+o22BtqYMOz+fhGwTVJw8
	KKYuLUIjq/FCpn30Qc9+hdg+DnjlFjXUJASvE2Dl67nQ/7v1OA5PqKztdddV8ZjKg7k=
X-Gm-Gg: ASbGnctYtS4CdF360gg9cjKW30JxFRHdw6wuU1b5r3uIcbAV4gdz58M7slrQm7RyjUH
	1ndrqdpQzIc/IbqGEyTnkKKYdDioaMUlFL0P9bAuP1DJpU7/XvWe9VPdrgK5SSBf1Iz9hzahZru
	iLtNwYqjQkDDaCMS+oROB6S+mYJhuKWT35WFqVdfKY8pRQMXLGSxuAcHF4P7tqBofT3n2vqNiME
	RzwYcradBFWjSdNc2oQGN1kjEq+9qb5tjMwn+6G262e6tPSbumesJcyTutGRDBKTiqvI2DWUNz3
	Mm+xDXl+a7QaP3UHs8J7uATAPqaX5vNcgSTaoHkf76zxvfknTyYMTEbSSv3TOsoMlT8B7YMQNo6
	GA6HIQZQ/ADl3kqFzGGihGI2lmfKb34PI1h6xKGXDjEgV8xWDgK0ez+Heig0cYCBT8RY=
X-Google-Smtp-Source: AGHT+IGc3VU32PsX6C7ClVKA+lvc5cDeezn9b8o7ZgcI2xpiH2XwVhQRzLUpHdISHH74OneKcDaSiQ==
X-Received: by 2002:a17:90b:3d87:b0:32b:65e6:ec39 with SMTP id 98e67ed59e1d1-32b65e6f260mr9655069a91.21.1757053764191;
        Thu, 04 Sep 2025 23:29:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b694fa438sm6229629a91.29.2025.09.04.23.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:29:23 -0700 (PDT)
Message-ID: <97fb026b-54d7-42ec-a57c-51c8c8c44a76@rivosinc.com>
Date: Fri, 5 Sep 2025 08:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: Fix sparse warning about different address
 spaces
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
 <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_232925_237960_06216C7C 
X-CRM114-Status: GOOD (  13.91  )
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

CgpPbiAwMy8wOS8yMDI1IDIwOjUzLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gV2UgZGlkIG5v
dCBwcm9wYWdhdGUgdGhlIF9fdXNlciBhdHRyaWJ1dGUgb2YgdGhlIHBvaW50ZXJzIGluCj4gX19n
ZXRfa2VybmVsX25vZmF1bHQoKSBhbmQgX19wdXRfa2VybmVsX25vZmF1bHQoKSwgd2hpY2ggcmVz
dWx0cyBpbgo+IHNwYXJzZSBjb21wbGFpbmluZzoKPiAKPj4+IG1tL21hY2Nlc3MuYzo0MToxNzog
c3BhcnNlOiBzcGFyc2U6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDIgKGRpZmZlcmVudCBh
ZGRyZXNzIHNwYWNlcykgQEAgICAgIGV4cGVjdGVkIHZvaWQgY29uc3QgW25vZGVyZWZdIF9fdXNl
ciAqZnJvbSBAQCAgICAgZ290IHVuc2lnbmVkIGxvbmcgbG9uZyBbdXNlcnR5cGVdICogQEAKPiAg
ICBtbS9tYWNjZXNzLmM6NDE6MTc6IHNwYXJzZTogICAgIGV4cGVjdGVkIHZvaWQgY29uc3QgW25v
ZGVyZWZdIF9fdXNlciAqZnJvbQo+ICAgIG1tL21hY2Nlc3MuYzo0MToxNzogc3BhcnNlOiAgICAg
Z290IHVuc2lnbmVkIGxvbmcgbG9uZyBbdXNlcnR5cGVdICoKPiAKPiBTbyBmaXggdGhpcyBieSBj
b3JyZWN0bHkgY2FzdGluZyB0aG9zZSBwb2ludGVycy4KPiAKPiBSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwODE2MTcxMy5SV3UzMEx2MS1sa3BAaW50ZWwuY29tLwo+
IFN1Z2dlc3RlZC1ieTogQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+Cj4gRml4ZXM6
IGY2YmZmNzgyN2E0OCAoInJpc2N2OiB1YWNjZXNzOiB1c2UgJ2FzbV9nb3RvX291dHB1dCcgZm9y
IGdldF91c2VyKCkiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vz
cy5oCj4gaW5kZXggNTUxZTc0OTA3MzdlZmZiMmMyMzhlNmE0ZGI1MDI5M2VjZTdjOWRmOS4uZjVm
NGY3Zjg1NTQzZjJhNjM1YjE4ZTRiZDFjNjIwMmIyMGUzYjIzOSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oCj4gQEAgLTQzOCwxMCArNDM4LDEwIEBAIHVuc2lnbmVkIGxvbmcgX19tdXN0
X2NoZWNrIGNsZWFyX3VzZXIodm9pZCBfX3VzZXIgKnRvLCB1bnNpZ25lZCBsb25nIG4pCj4gIH0K
PiAgCj4gICNkZWZpbmUgX19nZXRfa2VybmVsX25vZmF1bHQoZHN0LCBzcmMsIHR5cGUsIGVycl9s
YWJlbCkJCQlcCj4gLQlfX2dldF91c2VyX25vY2hlY2soKigodHlwZSAqKShkc3QpKSwgKHR5cGUg
Kikoc3JjKSwgZXJyX2xhYmVsKQo+ICsJX19nZXRfdXNlcl9ub2NoZWNrKCooKHR5cGUgKikoZHN0
KSksIChfX2ZvcmNlIF9fdXNlciB0eXBlICopKHNyYyksIGVycl9sYWJlbCkKPiAgCj4gICNkZWZp
bmUgX19wdXRfa2VybmVsX25vZmF1bHQoZHN0LCBzcmMsIHR5cGUsIGVycl9sYWJlbCkJCQlcCj4g
LQlfX3B1dF91c2VyX25vY2hlY2soKigodHlwZSAqKShzcmMpKSwgKHR5cGUgKikoZHN0KSwgZXJy
X2xhYmVsKQo+ICsJX19wdXRfdXNlcl9ub2NoZWNrKCooKHR5cGUgKikoc3JjKSksIChfX2ZvcmNl
IF9fdXNlciB0eXBlICopKGRzdCksIGVycl9sYWJlbCkKPiAgCj4gIHN0YXRpYyBfX211c3RfY2hl
Y2sgX19hbHdheXNfaW5saW5lIGJvb2wgdXNlcl9hY2Nlc3NfYmVnaW4oY29uc3Qgdm9pZCBfX3Vz
ZXIgKnB0ciwgc2l6ZV90IGxlbikKPiAgewo+IAoKSGkgQWxleCwKCkxHVE0sCgpSZXZpZXdlZC1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQ2zDqW1l
bnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
