Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC0CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 05:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xC+SbS7jmMYZvvKHsbS2bM/zMVjjxi0gC7RHNBQMcxM=; b=EZAI4Q/cs8tion
	gMUChs4M5FDPKsKZCSBnuDoDDnQF8IoXTVsJYDtxeSGGYu7p6WD6HM9Y+7pOMthFvUT5O5fvV/Nff
	OkzEQYJaMt0URAnRoqP7prBYZ0tFDfeWiC9PcXy7+z01IdQzylM3T5VKKovfKgIY2nuL7y9RAPJMg
	fNwRurECxth2RMVTMUxegmFIXGwYnn4W7VbqV0oQF3QkeDdXPsfABaUQp4W1tJpl/2Ahw2tSsRnM2
	OqueCFKe2+17sh/CseU4gsDRXcgFlT3J1OZABaIiEChaVui7FzUiln1vEEQLiVUM6FPO1ylYbg+4z
	BODApgMIJ7GBTnp4wJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrt2F-0000000E4LS-0r4z;
	Wed, 03 Apr 2024 05:19:43 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrt2A-0000000E4JB-2Gyo
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 05:19:40 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6151e2d037dso17128007b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 22:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712121576; x=1712726376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOCPtamLjLlH08r18iAQXT/wFMDp/bp5k+lkBS2A+NA=;
        b=QGWH09e5cHBlxTlXi8s1pYIlZa7qtINlnxQHLZnZ8A5rvnO1G3lixyOTdjfrxT0JOQ
         3a0hw+EqEL0jfQWOkwaMOFiB2/8Sl4Z0H7ImLyATzMhhnH+g6GBeDhSwtOGtWc7p0pgD
         5uGSRWLR8hznD8LFvtRiHb0s7wBfnJKxGNOuqqzdUUqMcEDXgMcGP5/CoZyXzWcyWelX
         Zle5xbNODc1MTHERLarTQiiCysd1FfJxK2oBCsg/pNI314d4k+f5HeR0fKTXU8Gt5mCT
         Xlvn4rLdP0OcQ0zTDlAyOnRjUimKeD7sXmG66o1vhlDZcguYz/OnpVrXTLrzABzl96JQ
         HmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712121576; x=1712726376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOCPtamLjLlH08r18iAQXT/wFMDp/bp5k+lkBS2A+NA=;
        b=kTaECChBgPUp+Z/p0IAqBFPHUMM29DVwF8+xmwYJn8jEMf9lZnnmnVu8oNIkxFMGdV
         vR/TE98MTH1BDAN1aq/z+iZk/NfY/cpXeEbEUTbyyuaPpV6puEB3Jqe7cH/7CiOmroA6
         CcJCXmN2utgpMqtnl0Jt3h5nsPEN6Q1b6JSbs39mVa7hiPX47+QoStq+hTlAB1Qbo3hd
         6DsB6gmmo8j+pt85IH6NhcVVsU6okTblu1zPF14K2oleusM4QkMsusF+LOnRBskCKxmX
         hqONWbE4rM1K5kOkoKoCY1wkZiyLsUK8lv9xF82OawNqU3SwT2s3NXS9fevzp95mlOGS
         c/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWznlF+XZ348d4xitlbUl7VFcJQppS0FvHGd4YqGrjeW9ixrhZm2Fermc7uIdrbg9w7U5Y6dqtu0XTn09pYSSu8BuAB2K/l4VEjevuoD3fM
X-Gm-Message-State: AOJu0YxJk5VTAyyPSSwpoViQtDdHCH69FO3jwuXkGy6119J/Jonmki8u
	WeKrU9m0sXJkRLxa/PVB2N7/E7x/1Z6PIrl7hYO2Cg2lPYNebv4RATOQlazupoy7N1vN4AQgOMd
	Ub4Qk7Vx1Arw0WDfO1lxLlrHgi3fsYG0jdctV
X-Google-Smtp-Source: AGHT+IEJD8vOOP43KF1PpQ1T71ZD6SCj2BgL2gMSdVC5sN3CPZR49WeMv1XyVA8LGXp+Tn6qsT8p7RXANK7YyUBgKFY=
X-Received: by 2002:a05:6902:521:b0:dcc:54d0:85e2 with SMTP id
 y1-20020a056902052100b00dcc54d085e2mr12598047ybs.24.1712121576118; Tue, 02
 Apr 2024 22:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-3-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:19:25 -0700
Message-ID: <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_221938_617393_37B54DA0 
X-CRM114-Status: GOOD (  17.38  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdm1fZmxhZ3Mgb2Ygdm1hIGFscmVhZHkg
Y2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0IGlzIGEKPiBiYWQgYWNjZXNzLCBkaXJl
Y3RseSBzZXQgZmF1bHQgdG8gVk1fRkFVTFRfQkFEQUNDRVNTIGFuZCBoYW5kbGUgZXJyb3IsCj4g
bm8gbmVlZCB0byBsb2NrX21tX2FuZF9maW5kX3ZtYSgpIGFuZCBjaGVjayB2bV9mbGFncyBhZ2Fp
biwgdGhlIGxhdGVuY3kKPiB0aW1lIHJlZHVjZSAzNCUgaW4gbG1iZW5jaCAnbGF0X3NpZyAtUCAx
IHByb3QgbGF0X3NpZycuCgpUaGUgY2hhbmdlIG1ha2VzIHNlbnNlIHRvIG1lLiBQZXItVk1BIGxv
Y2sgaXMgZW5vdWdoIHRvIGtlZXAKdm1hLT52bV9mbGFncyBzdGFibGUsIHNvIG5vIG5lZWQgdG8g
cmV0cnkgd2l0aCBtbWFwX2xvY2suCgo+Cj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdh
bmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlh
biA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L21tL2ZhdWx0LmMgfCA0
ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vZmF1bHQuYyBiL2FyY2gvYXJtNjQvbW0vZmF1
bHQuYwo+IGluZGV4IDliYjlmMzk1MzUxYS4uNDA1ZjlhYTgzMWJkIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtNjQvbW0vZmF1bHQuYwo+ICsrKyBiL2FyY2gvYXJtNjQvbW0vZmF1bHQuYwo+IEBAIC01
NzIsNyArNTcyLDkgQEAgc3RhdGljIGludCBfX2twcm9iZXMgZG9fcGFnZV9mYXVsdCh1bnNpZ25l
ZCBsb25nIGZhciwgdW5zaWduZWQgbG9uZyBlc3IsCj4KPiAgICAgICAgIGlmICghKHZtYS0+dm1f
ZmxhZ3MgJiB2bV9mbGFncykpIHsKPiAgICAgICAgICAgICAgICAgdm1hX2VuZF9yZWFkKHZtYSk7
Cj4gLSAgICAgICAgICAgICAgIGdvdG8gbG9ja19tbWFwOwo+ICsgICAgICAgICAgICAgICBmYXVs
dCA9IFZNX0ZBVUxUX0JBREFDQ0VTUzsKPiArICAgICAgICAgICAgICAgY291bnRfdm1fdm1hX2xv
Y2tfZXZlbnQoVk1BX0xPQ0tfU1VDQ0VTUyk7CgpuaXQ6IFZNQV9MT0NLX1NVQ0NFU1MgYWNjb3Vu
dGluZyBoZXJlIHNlZW1zIGNvcnJlY3QgdG8gbWUgYnV0CnVucmVsYXRlZCB0byB0aGUgbWFpbiBj
aGFuZ2UuIEVpdGhlciBzcGxpdHRpbmcgaW50byBhIHNlcGFyYXRlIHBhdGNoCm9yIG1lbnRpb25p
bmcgdGhpcyBhZGRpdGlvbmFsIGZpeHVwIGluIHRoZSBjaGFuZ2Vsb2cgd291bGQgYmUgaGVscGZ1
bC4KCj4gKyAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPiAgICAgICAgIGZh
dWx0ID0gaGFuZGxlX21tX2ZhdWx0KHZtYSwgYWRkciwgbW1fZmxhZ3MgfCBGQVVMVF9GTEFHX1ZN
QV9MT0NLLCByZWdzKTsKPiAgICAgICAgIGlmICghKGZhdWx0ICYgKFZNX0ZBVUxUX1JFVFJZIHwg
Vk1fRkFVTFRfQ09NUExFVEVEKSkpCj4gLS0KPiAyLjI3LjAKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
