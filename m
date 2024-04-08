Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48697CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 11:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gt1M8YEEMrKyd7OFHrN9uOUmw28wc7kh70oGWqXXi0g=; b=G2xj/bF7kA0OWk
	RnltmhDhU+vqjETrYL06GxBTekJeSnkrhzBUapQUqbn7D7fItFMh2EW50YeqJ4EKweqmQrXEU3wlG
	+tJIC2pJSFIFLIuQLZaH1PFgBC8wLwinEntoCsZYj9MAnCGHd9SLu/5m/HlCcb+KleSyNfa2HtboU
	iEUOhkpqCKLD6oBaYKNyr90hzTEpIgKFY0gabk0vdRyEkAOPTetCE0iBV9zRpMWhSbNNJl5gd002Z
	6Ztnsl+J2Wpw4O02LEvQyCHYby7GatS91RSg/4/MnzTK+OWVcrRGsGh41Xi9weJSy/waY6MSSz4s7
	UH7e8nrvRtHZq3Y6JmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtn2R-0000000FN8w-4Bnj;
	Mon, 08 Apr 2024 11:19:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtn2O-0000000FN6v-17f9
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 11:19:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-343c8d7064aso570881f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712575181; x=1713179981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSk7g629HcnobUYtS9ld5wkokmcC8tpl1DGu7N0oFPU=;
        b=xH3uLdWCO5WGmcNxoshjgcBix9ykvbjUIFgzBQg4xr9W4YI1UO6WZn1vuMLTMU6j8D
         qi3S53nk2goE5kABm/U1m4R+LkixwkibJYxVm5e1hVlU7fwpNNpH1jBN1vQdSkeLs684
         0W08PeZk1R3tdKylfA2ioE/yYQ3vpOkfivkUconOuy9m8hRP4aXEzL512NJK8LCWBPQv
         qAx62bIkjZeXqZKTIZtWu9Y+5GUncSOEFaz0SHCHo6K+9BAO/ItZ4OMPc+jyFqhAkKkc
         IdVsRocsAFr+3kLpGgm2IuZRdCUKWwGQuF1YuskGjcYAOoIyxn0kUp90abAJ7FgNU4xI
         7vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712575181; x=1713179981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSk7g629HcnobUYtS9ld5wkokmcC8tpl1DGu7N0oFPU=;
        b=cDNgxWVxpQf9XGdpZpg0FyXCrz+2gCS7gkP5vNL8CFv4mGFDaPcEFrr7fKQ6OUzWra
         SeHjFo67ewzBEm75r+yHkK2XWtYsCnaJOF1D50dpQ0I1JEClt6T/NoFwAJ1uq+Fswb8k
         u24LKVQQ33TpxarJpnP9s5AcfZJfbaEWFwJs9naQSy3eJbZLxWtWB2SDhrnTZsIdc3IA
         +m/k2VUA5oV21MY2j+6A7LbdwRJQm+8es/7Ae2FpyCaPdehTKQoEXyiIcQB6eJflsBT8
         WIZwWcvxKKWg64io2aQbkPspwKIjV27pmVJsNX317ZmvOp2mLPnvhPmqqFDrlU6PGVkH
         xgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Pe2ZawMkoQ/hFCs6p4NiZlTaouCBajRpxbknr2in9u0X5nr/MEhvPw9E1lJkfD1tRMfXw4unQImAmn27WCXZ12+RCj2h2Gsl7ZhEgdss
X-Gm-Message-State: AOJu0YxPDsm2G0xY1MY746668XweJ5GWTUyoG5WJDX2+OEEnDvxwCz0d
	pB28UCPqS8YdbMt6ifNOrab8gJHSGT2tJ5ADBkLTNip4X8ksHuS9PfeLMFzxOzE=
X-Google-Smtp-Source: AGHT+IFsrqlt8EPvaHLsA1X/PyCnOOmKPkgttAzXmXfIr/HqmjcOS9we1W6RxidEv01fKclvnQ/mqQ==
X-Received: by 2002:a05:600c:4fd4:b0:416:5c22:1200 with SMTP id o20-20020a05600c4fd400b004165c221200mr2651159wmq.4.1712575181415;
        Mon, 08 Apr 2024 04:19:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6327:edd6:6580:3ead? ([2a01:e0a:999:a3a0:6327:edd6:6580:3ead])
        by smtp.gmail.com with ESMTPSA id dr20-20020a5d5f94000000b0033ea499c645sm8885921wrb.4.2024.04.08.04.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 04:19:40 -0700 (PDT)
Message-ID: <89d4a24c-db24-487b-8c5c-bdc1fa2d42b4@rivosinc.com>
Date: Mon, 8 Apr 2024 13:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
 <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
 <20240408-6c93f3f50b55234f3825ca33@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240408-6c93f3f50b55234f3825ca33@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_041944_448238_54DD05F7 
X-CRM114-Status: GOOD (  23.46  )
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

CgpPbiAwOC8wNC8yMDI0IDEzOjAzLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MDgsIDIwMjQgYXQgMTA6MDE6MTJBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwNS8wNC8yMDI0IDE5OjMzLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+PiBPbiBGcmks
IEFwciA1LCAyMDI0IGF0IDg6MjbigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIFRodSwgQXByIDA0LCAyMDI0IGF0IDEyOjMyOjQ2
UE0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+Pj4gVGhlIFppbW9wIElTQSBleHRl
bnNpb24gd2FzIHJhdGlmaWVkIHJlY2VudGx5LiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQKPj4+
Pj4gZm9yIHBhcnNpbmcgaXQgZnJvbSByaXNjdixpc2EsIGh3cHJvYmUgZXhwb3J0IGFuZCBrdm0g
c3VwcG9ydCBmb3IKPj4+Pj4gR3Vlc3QvVk0uCj4+Pj4KPj4+PiBJJ20gbm90IHN1cmUgd2UgbmVl
ZCB0aGlzLiBaaW1vcCBieSBpdHNlbGYgaXNuJ3QgdXNlZnVsLCBzbyBJIGRvbid0IGtub3cKPj4+
PiBpZiB3ZSBuZWVkIHRvIGFkdmVydGlzZSBpdCBhdCBhbGwuIFdoZW4gYW4gZXh0ZW5zaW9uIGNv
bWVzIGFsb25nIHRoYXQKPj4+PiByZWRlZmluZXMgc29tZSBNT1BzLCB0aGVuIHdlJ2xsIGFkdmVy
dGlzZSB0aGF0IGV4dGVuc2lvbiwgYnV0IHRoZSBmYWN0Cj4+Pj4gWmltb3AgaXMgdXNlZCBmb3Ig
dGhhdCBleHRlbnNpb24gaXMgcmVhbGx5IGp1c3QgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsLgo+
Pj4KPj4+IE9ubHkgc2l0dWF0aW9uIEkgc2VlIHRoaXMgY2FuIGJlIHVzZWZ1bCBpcyB0aGlzOi0t
Cj4+Pgo+Pj4gQW4gaW1wbGVtZW50ZXIsIGltcGxlbWVudGVkIFppbW9wcyBpbiBDUFUgc29sZWx5
IGZvciB0aGUgcHVycG9zZSB0aGF0IHRoZXkgY2FuCj4+PiBydW4gbWFpbmxpbmUgZGlzdHJvICYg
cGFja2FnZXMgb24gdGhlaXIgaGFyZHdhcmUgYW5kIGRvbid0IHdhbnQgdG8gbGV2ZXJhZ2UgYW55
Cj4+PiBmZWF0dXJlIHdoaWNoIGFyZSBidWlsdCBvbiB0b3Agb2YgWmltb3AuCj4+Cj4+IFllcywg
dGhlIHJhdGlvbmFsZSB3YXMgdGhhdCBzb21lIGJpbmFyaWVzIHVzaW5nIGV4dGVuc2lvbnMgdGhh
dCBvdmVybG9hZAo+PiBNT1BzIGNvdWxkIHN0aWxsIGJlIHJ1bi4gV2l0aCBaaW1vcCBleHBvc2Vk
LCB0aGUgbG9hZGVyIGNvdWxkIGRldGVybWluZQo+PiBpZiB0aGUgYmluYXJ5IGNhbiBiZSBleGVj
dXRlZCB3aXRob3V0IHBvdGVudGlhbGx5IGNyYXNoaW5nLiBXZSBjb3VsZAo+PiBhbHNvIGxldCB0
aGUgcHJvZ3JhbSBydW4gYW55d2F5IGJ1dCB0aGUgZXhlY3V0aW9uIGNvdWxkIHBvdGVudGlhbGx5
Cj4+IGNyYXNoIHVuZXhwZWN0ZWRseSwgd2hpY2ggSU1ITyBpcyBub3QgcmVhbGx5IGdvb2QgZm9y
IHRoZSB1c2VyCj4+IGV4cGVyaWVuY2Ugbm9yIGZvciBkZWJ1Z2dpbmcuIEkgYWxyZWFkeSB0aGlu
ayB0aGF0IHRoZSBzZWdmYXVsdHMgd2hpY2gKPj4gaGFwcGVucyB3aGVuIGV4ZWN1dGluZyBiaW5h
cmllcyB0aGF0IG5lZWQgc29tZSBtaXNzaW5nIGV4dGVuc2lvbiBhcmUgbm90Cj4+IHNvIGVhc3kg
dG8gZGVidWcsIHNvIGJldHRlciBhZGQgbW9yZSBndWFyZHMuCj4gCj4gT0suIEl0J3Mgb25seSBv
bmUgbW9yZSBleHRlbnNpb24gb3V0IG9mIGRvemVucywgc28gSSB3b24ndCBjb21wbGFpbiBtb3Jl
LAoKTm8gd29ycmllcywgeW91ciBwb2ludCAqaXMqIHZhbGlkIHNpbmNlIEknbSBub3Qgc3VyZSB5
ZXQgdGhhdCB0aGUgbG9hZGVyCndpbGwgYWN0dWFsbHkgZG8gdGhhdCBvbmUgZGF5LgoKQlRXLCBh
cmUgeW91IGF3YXJlIG9mIGFueSBlZmZvcnQgdG8gbWFrZSB0aGUgZWxmIGR5bmFtaWMgbG9hZGVy
CiJzbWFydGVyIiBhbmQgYWN0dWFsbHkgY2hlY2sgZm9yIG5lZWRlZCBleHRlbnNpb25zIHRvIGJl
IHByZXNlbnQgcmF0aGVyCnRoYW4gYmxpbmRseSBydW5uaW5nIHRoZSBlbGYgYW5kIHBvdGVudGlh
bGx5IGNhdGNoaW5nIFNJR0lMTCA/CgpUaGFua3MsCgpDbMOpbWVudAoKPiBidXQgSSB3YXMgdGhp
bmtpbmcgdGhhdCBiaW5hcmllcyB0aGF0IHVzZSBwYXJ0aWN1bGFyIGV4dGVuc2lvbnMgd291bGQK
PiBjaGVjayBmb3IgdGhvc2UgcGFydGljdWxhciBleHRlbnNpb25zIChzdGVwIDIpLCByYXRoZXIg
dGhhbiBaaW1vcC4KPiAKPiBUaGFua3MsCj4gZHJldwo+IAo+Pgo+Pj4KPj4+IEFzIGFuIGV4YW1w
bGUgemljZmlscCBhbmQgemljZmlzcyBhcmUgZGVwZW5kZW50IG9uIHppbW9wcy4gZ2xpYmMgY2Fu
Cj4+PiBkbyBmb2xsb3dpbmcKPj4+Cj4+PiAxKSBjaGVjayBlbGYgaGVhZGVyIGlmIGJpbmFyeSB3
YXMgY29tcGlsZWQgd2l0aCB6aWNmaXNzIGFuZCB6aWNmaWxwLAo+Pj4gaWYgeWVzIGdvdG8gc3Rl
cCAyLCBlbHNlIGdvdG8gc3RlcCA2Lgo+Pj4gMikgY2hlY2sgaWYgemljZmlzcy96aWNmaWxwIGlz
IGF2YWlsYWJsZSBpbiBodyB2aWEgaHdwcm9iZSwgaWYgeWVzCj4+PiBnb3RvIHN0ZXAgNS4gZWxz
ZSBnb3RvIHN0ZXAgMwo+Pj4gMykgY2hlY2sgaWYgemltb3AgaXMgYXZhaWxhYmxlIHZpYSBod3By
b2JlLCBpZiB5ZXMgZ290byBzdGVwIDYsIGVsc2UgZ290byBzdGVwIDQKPj4KPj4gSSB0aGluayB5
b3UgbWVhbnQgc3RlcCA1IHJhdGhlciB0aGFuIHN0ZXAgNi4KPj4KPj4gQ2zDqW1lbnQKPj4KPj4+
IDQpIFRoaXMgYmluYXJ5IHdvbid0IGJlIGFibGUgdG8gcnVuIHN1Y2Nlc3NmdWxseSBvbiB0aGlz
IHBsYXRmb3JtLAo+Pj4gaXNzdWUgZXhpdCBzeXNjYWxsLiA8LS0gdGVybWluYXRpb24KPj4+IDUp
IGlzc3VlIHByY3RsIHRvIGVuYWJsZSBzaGFkb3cgc3RhY2sgYW5kIGxhbmRpbmcgcGFkIGZvciBj
dXJyZW50IHRhc2sKPj4+IDwtLSBlbmFibGUgZmVhdHVyZQo+Pj4gNikgbGV0IHRoZSBiaW5hcnkg
cnVuIDwtLSBsZXQgdGhlIGJpbmFyeSBydW4gYmVjYXVzZSBubyBoYXJtIGNhbiBiZSBkb25lCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
