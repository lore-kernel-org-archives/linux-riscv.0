Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40926C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=708LOVFSozBZplbhiBnRHHqk778/+Z8T/OnqbxJWNG8=; b=lwYHYumfSvmntA
	C7iL9i+zYep9/hsvSZD6e8XgQPQ4HPdbpzsDfhvoY4mN7dwejBqL66jgMaeJNmFjC0zTvJcGEZzQf
	Afia/JLhlV01gwmgErIddYm8L40Av8+gfjlQ4hB/kCqVijiIUxk9Mf4i/TEfgOj02kL53ivLmNSwt
	++Odl0QPuyVJTege0NWovx+ZqvrjrC6tzEfjWTsufCvLnaYbJHAUCQSzhQ8x6iji7rNXdfcjNHGGa
	uo6zU5lUE9ADy5GiP/XopsYNQGbGgZ4mYVCxxtZpnIDWVqlgAO+viYhZqY72GSVA0xHVgjK3ymm58
	qa88gN1I9+n+SHgbuisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wwn-0000000EFHH-3niO;
	Thu, 24 Apr 2025 13:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vkP-0000000E2v2-3O3C
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 12:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=; b=q53AQtOg9OizBZHjiI7LJmltkc
	ZPDPNgBdR3K7KVNCLDWd6gxBFYiyQ1sxtXXZThGowicFIZ5myP52NUlotp7JGIWBrfSqXzgLr4y9R
	psDhMycZZgJpvxlwkLNoHhHz9i1nvfFWUJQ74XYXHTGduP4QbpZ2a+3cuoPki7bMb0rEDOgCSITMc
	99LlBiCJK7am1Bp1Ka5Nmqd+i4tkycCjocJ9kZi0CmAVUhI6DFWcqwi+q+9h7xZYJHBAqV1kseAK9
	lLlXgNAKK0swd2MYvhzZ7f5ek3BK2e12AgC5q8n4vSTOdpfdhuBpfZkLbKzRDSQGCYISVvSa8VcxX
	iBUBmDWA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7vkM-0000000Bmtw-2waG
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:32:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso997987f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745497922; x=1746102722; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=FS5HjmdEwxUlYYv/rduNTydAjnALP7BAtbqc9dsZlQnbimHvBrbgErwQkwB2YUdGtT
         sWmJVspyIC8c6uqFuXHdq7UaXgmGGP3QrYA1dttcRowpNF7VWPWFOYD8Is+z3az/Q0Bz
         XfrpZrYuzo5zuVJWKbFjgj6KU/q9B3hHC7B2BO4/DmrA34StgjC+xEFWnQJtE7YFHdFg
         FbuA4dM1NixAUap/dJz9ycJoco1uzBOJA7mZfq4VK++czQ65FK5iBDPjWlqOkqG3S9R+
         5MX34wLvFu2wNj7En3gN3h+PDc1lAn/jVU+E27aLFZJZ/MnyxfL2QGVejZVUyoa74dmu
         mu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497922; x=1746102722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=uqSp5G0KNLCJyhz6bnp0fdjlvsTJIUoC8JfdD4QVQzJLmxdinmoMcziKVd/MHOSoQQ
         vM1JmjyV3uTYRuCHAyLOZlvLLU7TqkuKqW/x6cpTW9vGAohC06xwy8y1pVkplVTvHZMT
         Hi50UdoambPwljmH9LuKDllpLjr/WmERyVXXcqDXYNDK/Esmagz2oA42m9DU6PcdY4Kx
         Ag/CycuWQf/yziIw9HbTrG1tmePqMhqrzc7guEz/Fxcp4DXp4/AvHL95XUFT0mNXVYr6
         B0yNfZa/cJoLRewvwEBBv8198olejXQ36PpuqRzQBSfIfQSqzsy9841QeCewm6A9pIsT
         TzVw==
X-Forwarded-Encrypted: i=1; AJvYcCXFNGxUN9BzN6ld7ToUE14dTo41/6ONL5o9QRXQK2W/i/oS30S+zfmI2c1bpOUorWMmY6LOxxF5OHYSSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFP9Ti58sLa0TmqlkXNrGT88EVexPG+xNivZX0nwToFx1R/cns
	fF4rryREhmVBdJUlR+WxxFRD0HV3w68WHvW8E/XOqIQI2C2oq49LdESUIhs1SbE=
X-Gm-Gg: ASbGncs/VLuVmgk3SIb/vducNaL2mk0uWUrACZO1Pd4pStz21ZWVTe82lzkqa13SmP+
	7lMdmIJ+8m+7fmHZ3ivJ1ToUhKtDFT/DLg+izNSK3MD+QiRA2TrtqzJHa7sn8GVu5B6fAvyMINH
	wT15b8qC4VGE9A6Jquw9SicMuazH4T/bZc99Kf718ztObk/oudyDJMwjWZLpwHeuLJFbR/8ZHwh
	0b8SR6PRXnTMC3+FVDoj0p9ikIDMVINDxe5pAZgZnVPkDPg+wxeMtQtRQrn8xdmVERsnrZqYO3y
	KJ3I4StxnkduO0rVFjrhAmGXu1o47TuUoH1TfrXs6K8DeY2tbNlbq9V/cQnRCsdMdJtEC/ITuEh
	Y858n9wtmAw==
X-Google-Smtp-Source: AGHT+IFbJZjPmuMD3YIQwLoJ857azwRhf/epJ6CxLQ+gyc15vU+Ezwb55G76EYJKFKkcG3RmozFEJg==
X-Received: by 2002:a05:6000:2911:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-3a06cf5ede6mr2159263f8f.25.1745497922377;
        Thu, 24 Apr 2025 05:32:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4b52sm1997065f8f.55.2025.04.24.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:32:01 -0700 (PDT)
Message-ID: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
Date: Thu, 24 Apr 2025 14:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-c85c9d2f189fe4470038b519@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133207_037544_A95E6AF4 
X-CRM114-Status: GOOD (  14.34  )
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

CgpPbiAyNC8wNC8yMDI1IDEzOjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTcsIDIwMjUgYXQgMDI6MTk6NTBQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGlzIFNCSSBleHRlbnNpb25zIGVuYWJsZXMgc3VwZXJ2aXNvciBtb2RlIHRvIGNvbnRyb2wgZmVh
dHVyZSB0aGF0IGFyZQo+PiB1bmRlciBNLW1vZGUgY29udHJvbCAoRm9yIGluc3RhbmNlLCBTdmFk
dSBtZW52Y2ZnIEFEVUUgYml0LCBTc2RibHRycAo+PiBEVEUsIGV0YykuIEFkZCBhbiBpbnRlcmZh
Y2UgdG8gc2V0IGxvY2FsIGZlYXR1cmVzIGZvciBhIHNwZWNpZmljIGNwdQo+PiBtYXNrIGFzIHdl
bGwgYXMgZm9yIHRoZSBvbmxpbmUgY3B1IG1hc2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCB8IDE3ICsrKysrKysrKysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YyAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAyIGZp
bGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+IGlu
ZGV4IDdlYzI0OWZlYTg4MC4uYzhlYWIzMTVjODBlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
Pj4gQEAgLTUwMyw2ICs1MDMsMjMgQEAgaW50IHNiaV9yZW1vdGVfaGZlbmNlX3Z2bWFfYXNpZChj
b25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4+ICAJCQkJdW5zaWduZWQgbG9uZyBhc2lk
KTsKPj4gIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0KTsKPj4gIAo+PiAraW50IHNi
aV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9u
ZyBmbGFncyk7Cj4+ICtpbnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFz
a190ICptYXNrLCB1MzIgZmVhdHVyZSwKPj4gKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVl
LCB1bnNpZ25lZCBsb25nIGZsYWdzKTsKPiAKPiBJJ20gY29uZnVzZWQgYnkgdGhlIG5hbWluZyB0
aGF0IGluY2x1ZGVzICdsb2NhbCcgYW5kICdjcHVtYXNrJyB0b2dldGhlcgo+IGFuZC4uLgo+IAo+
PiArLyoqCj4+ICsgKiBzYmlfZndmdF9sb2NhbF9zZXQoKSAtIFNldCBhIGZlYXR1cmUgb24gYWxs
IG9ubGluZSBjcHVzCj4+ICsgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8gYmUgc2V0Cj4+ICsg
KiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAo+PiArICogQGZsYWdzOiBGV0ZU
IGZlYXR1cmUgc2V0IGZsYWdzCj4+ICsgKgo+PiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFw
cHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+PiArICovCj4+ICtzdGF0aWMg
aW5saW5lIGludCBzYmlfZndmdF9sb2NhbF9zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcg
dmFsdWUsCj4+ICsJCQkJICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKQo+PiArewo+PiArCXJldHVy
biBzYmlfZndmdF9sb2NhbF9zZXRfY3B1bWFzayhjcHVfb25saW5lX21hc2ssIGZlYXR1cmUsIHZh
bHVlLCBmbGFncyk7Cj4gCj4gLi4udGhhdCBzb21ldGhpbmcgbmFtZWQgd2l0aCBqdXN0ICdsb2Nh
bCcgaXMgYXBwbGllZCB0byBhbGwgb25saW5lIGNwdXMuCj4gSSd2ZSBhbHdheXMgY29uc2lkZXJl
ZCAnbG9jYWwnIGZ1bmN0aW9ucyB0byBvbmx5IGFmZmVjdCB0aGUgY2FsbGluZyBjcHUuCgpZZWFo
IEkgdGhvdWdodCBvZiB0aGF0IGFzIHdlbGwsIGxvY2FsIGhlcmUgcmVmZXJzIHRvIHRoZSBmYWN0
IHRoYXQgdGhpcwpmdW5jdGlvbiBhcHBsaWVzIGZvciBhIGxvY2FsIGZlYXR1cmUgKGFzIGRlc2Ny
aWJlZCBpbiB0aGUgU0JJCmRvY3VtZW50YXRpb24pIGJ1dCBhZ3JlZWQgdGhhdCBpdCdzIHJlYWxs
eSBtaXNzbGVhZGluZy4gQW55IGlkZWEgZm9yIGEKYmV0dGVyIG5hbWluZyA/CgpUaGFua3MsCgpD
bMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
