Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36EDC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGI0LrmbIUtay9jNUf0mrmY5LTyYtohsNiJAb7jS/Pc=; b=19LOlcxtx3a+q9/ZFg0OXIbTET
	jloajZffCexCnpn5UEqizwptDnwAL3qxzqlk49cOpXJ2QYONLBS+xkCJ0UzVE3NQbpAP4ULklaiCw
	ps0xRmbEwU3SPCAgQkMVzvht+KyqOdhzBiuzac90huVbS+YiN1eioRuKvt8dITTnXP/bNAS7nXmKf
	0kuSy9gQkbsfmtWlFAgR9/H13sKd7BcwoWrI4PLfxQi1BiRnT79FUrZkUwhkRXGpomDw3U6tluJoz
	83+hQq2T44L+FoipaoTCYsqtjPmctxyvOJEXo6WEw00bU3QeimekJ9mPhPg8qg+9FscAvWoRgSf+C
	2Ya2HzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruycQ-0000000DVhl-1ZV5;
	Thu, 11 Apr 2024 17:53:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruycM-0000000DVg9-4A4u
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 17:53:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso112271b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712858023; x=1713462823; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNBRHOyPI+Ix6+A4cvuQZL/n3YEyzqDCW+Z4zO41EyQ=;
        b=nC3DIa98VDikl4Hf2uTMHctwJY5HehnfFhGqnPglk3gTuF/wi9geYZqA3Q1pEJbd5S
         aAZT6GEmU/C4vrq/enq1S/msDijLDefT69V6TdPWh/8gictPSwziD/28dj3w2rozknd8
         7HJA9AsAxStY0pwiVekjzAY8YLJlZ+XJ4kD3LJnuxs21m5OmeOyccUglPA6PUQEUP0IP
         hmXoD/oR5CgqDMdtC0Pte7EZOiqSkKMMm5iqgQ/ixb5yAxOU5Pe+1kt6PUAfOm2MMDnq
         MYMtpwrykJYus40wtr9KnQ2GjDb3X34HfGRVw1uvlh5QpWL/JxXLoGYlWEgJprGkvBaJ
         jPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712858023; x=1713462823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNBRHOyPI+Ix6+A4cvuQZL/n3YEyzqDCW+Z4zO41EyQ=;
        b=BBghB/76XxOlN9/pFzwJzFyQcN8XRRfSDFKWBzFgUlicyxsA9exxlZrGk+z6V+HijC
         XrGvZCtm9qcRcTC1i/KV6232QEC9BIngQTtRWPfi4+CL78INzlulyd6SB6nWbmjoQrDC
         lfNZP7R6sJaQ1nJPeHN2Ai9RccXDO3gWbuAXhTVsGqLcaQPAnP7libN+Qv6h/afzfC5k
         xywNeUVYaZW5nTZ18CcC5us0W6n79VzG/f4LOTwBvdbzRIp5r+3LlZPchPUZuOC5vXV8
         qquS6dKbJunleBCcTnmGdg0ole6UCoQtkB4wkZG/919PCPknmYk76jToasmm3pe0d5h/
         N+Lg==
X-Gm-Message-State: AOJu0YxlZ5I3QatWJ8iXdRbSHjelf/lX+9MkuFszSFxHA95qZUW5f6fC
	oYXzDqno1/wbEnQvhepkKPJPer1RyKPqeN9cJ9E6wntZcgbNTQWwyaYaTMfRRu8=
X-Google-Smtp-Source: AGHT+IHvTlKfIjzPeOBTC79yWowwoTcXJYi0DJrQEFv7vxDpvjIWBOVWUaYo1AptR3Y6sfvrZ3mgAQ==
X-Received: by 2002:a05:6a20:5648:b0:1a7:4b6f:7934 with SMTP id is8-20020a056a20564800b001a74b6f7934mr552627pzc.17.1712858022568;
        Thu, 11 Apr 2024 10:53:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a25-20020a63bd19000000b005e43cb66a7asm1356148pgf.87.2024.04.11.10.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 10:53:42 -0700 (PDT)
Date: Thu, 11 Apr 2024 10:53:39 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com,
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com,
	cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	waylingii@gmail.com, sameo@rivosinc.com, alexghiti@rivosinc.com,
	akpm@linux-foundation.org, shikemeng@huaweicloud.com,
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com,
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com,
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com,
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com, falcon@tinylab.org,
	viro@zeniv.linux.org.uk, bhe@redhat.com, chenjiahao16@huawei.com,
	hca@linux.ibm.com, arnd@arndb.de, kent.overstreet@linux.dev,
	boqun.feng@gmail.com, oleg@redhat.com, paulmck@kernel.org,
	broonie@kernel.org, rick.p.edgecombe@intel.com
Subject: Re: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
Message-ID: <ZhgjoyObf+nMihA4@debug.ba.rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
 <20240409061043.3269676-3-debug@rivosinc.com>
 <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_105347_192803_85A2F561 
X-CRM114-Status: GOOD (  17.08  )
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

T24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMDU6MTU6MTdQTSArMDAwMCwgU2FtaSBUb2x2YW5lbiB3
cm90ZToKPk9uIFR1ZSwgQXByIDksIDIwMjQgYXQgNjoxMuKAr0FNIERlZXBhayBHdXB0YSA8ZGVi
dWdAcml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gU1lNXyogbWFjcm9zIGFyZSB1c2VkIHRvIGRl
ZmluZSBhc3NlbWJseSByb3V0aW5lcy4gSW4gdGhpcyBwYXRjaCBzZXJpZXMsCj4+IHJlLWRlZmlu
ZSB0aG9zZSBtYWNyb3MgaW4gcmlzYy12IGFyY2ggc3BlY2lmaWMgaW5jbHVkZSBmaWxlIHRvIGlu
Y2x1ZGUKPj4gYSBsYW5kaW5nIHBhZCBpbnN0cnVjdGlvbiBhdCB0aGUgYmVnaW5uaW5nLiBUaGlz
IGlzIGRvbmUgb25seSB3aGVuIHRoZQo+PiBjb21waWxlciBmbGFnIGZvciBsYW5kaW5nIHBhZCBp
cyBlbmFibGVkIChpLmUuIF9fcmlzY3ZfemljZmlscCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vbGlua2FnZS5oIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2xpbmthZ2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
bGlua2FnZS5oCj4+IGluZGV4IDllODhiYTIzY2QyYi4uYmI0M2FlN2RhZGViIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2xpbmthZ2UuaAo+PiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2xpbmthZ2UuaAo+PiBAQCAtNiw3ICs2LDQ5IEBACj4+ICAjaWZuZGVmIF9B
U01fUklTQ1ZfTElOS0FHRV9ICj4+ICAjZGVmaW5lIF9BU01fUklTQ1ZfTElOS0FHRV9ICj4+Cj4+
ICsjaWZkZWYgX19BU1NFTUJMWV9fCj4+ICsjaW5jbHVkZSA8YXNtL2Fzc2VtYmxlci5oPgo+PiAr
I2VuZGlmCj4+ICsKPj4gICNkZWZpbmUgX19BTElHTiAgICAgICAgICAgICAgICAuYmFsaWduIDQK
Pj4gICNkZWZpbmUgX19BTElHTl9TVFIgICAgIi5iYWxpZ24gNCIKPj4KPj4gKyNpZmRlZiBfX3Jp
c2N2X3ppY2ZpbHAKPj4gKy8qCj4+ICsgKiBBIGxhbmRpbmcgcGFkIGluc3RydWN0aW9uIGlzIG5l
ZWRlZCBhdCBzdGFydCBvZiBhc20gcm91dGluZXMKPj4gKyAqIHJlLWRlZmluZSBtYWNyb3MgZm9y
IGFzbSByb3V0aW5lcyB0byBoYXZlIGEgbGFuZGluZyBwYWQgYXQKPj4gKyAqIHRoZSBiZWdpbm5p
bmcgb2YgZnVuY3Rpb24uIEN1cnJlbnRseSB1c2UgbGFiZWwgdmFsdWUgb2YgMHgxLgo+PiArICog
RXZlbnR1YWxseSwgbGFiZWwgc2hvdWxkIGJlIGNhbGN1bGF0ZWQgYXMgYSBoYXNoIG92ZXIgZnVu
Y3Rpb24KPj4gKyAqIHNpZ25hdHVyZS4KPj4gKyAqLwo+Cj5JIGhhdmVuJ3Qgc2VlbiB0aGUgY29t
cGlsZXIgaW1wbGVtZW50YXRpb24gZm9yIGZpbmUtZ3JhaW5lZCBaaWNmaWxwCj55ZXQsIGJ1dCBp
biB0aGUga2VybmVsIGF0IGxlYXN0LCB0aGlzIHdvdWxkIGlkZWFsbHkgcmV1c2UgYXMgbXVjaCBv
Zgo+dGhlIEtDRkkgcGx1bWJpbmcgYXMgcG9zc2libGUuIEZvciBleGFtcGxlLCBzaW5jZSBvbmx5
IEMgY29kZSBoYXMgdHlwZQo+aW5mb3JtYXRpb24sIHdlIGxlZnQgdGhlIHR5cGUgaGFzaCBjb21w
dXRhdGlvbiBmb3IgdGhlIGNvbXBpbGVyLCB3aGljaAo+YWxsb3dzIGFzc2VtYmx5IGZ1bmN0aW9u
cyB0byBqdXN0IHJlZmVyZW5jZSB0aGUgYXBwcm9wcmlhdGUKPl9fa2NmaV90eXBlaWRfKiBzeW1i
b2wuCgpGaW5lLWdyYWluZWQgY29tcGlsZXIgc3VwcG9ydCBoYXNuJ3QgbWFkZSBpdCBpbiB5ZXQu
CgpGb3IgcmVmZXJlbmNlLCBjb21waWxlciB0aGF0IEkndmUgYmVlbiB1c2luZwpodHRwczovL2dp
dGh1Yi5jb20vc2lmaXZlL3Jpc2N2LWdudS10b29sY2hhaW4vdHJlZS9jZmktZGV2CgpIb25lc3Rs
eSBzcGVha2luZywgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IGtjZmkgcGx1bWJpbmcgaGFzIG1hZGUg
aXQgaW50bwpyaXNjdiBhcyB3ZWxsLiBJIHJlYWxpemVkIHRoYXQganVzdCBhZnRlciBzZW5kaW5n
IHRoZSBwYXRjaGVzLgoKSW4gcHJpbmNpcGxlLCBJIGFncmVlIGl0IHNob3VsZCBjb252ZXJnZSB3
aXRoIHNvZnR3YXJlIGJhc2VkIGtjZmkgc2NoZW1lCmFzIG11Y2ggYXMgcG9zc2libGUuIEhvd2V2
ZXIgYmxvY2tlciB0aGF0IEkgc2VlIGlzIGBoYXNoYCBpcyBwbGFjZWQganVzdApiZWZvcmUgZnVu
Y3Rpb24uIFRoaXMgYnJlYWtzIGZvciBjb2RlIG1hcHBlZCBhcyBleGVjdXRlIG9ubHkgc2NlbmFy
aW9zLgpBbmQgaWRlYWxseSB3b3VsZCBsaWtlIHRvIGhhdmUgaW1tZWRpYXRlcyBhdCBjYWxsc2l0
ZXMgaW5zdGVhZCBvZiBsb2FkcwoocHVyZWx5IHBlcmYgcmVhc29uIGFuZCBub3Qgc2VjdXJpdHkp
LgoKQnV0IHllcyBpbiBuZXh0IHZlcnNpb24sIEknbGwgdGFrZSBhIGxvb2sgYW5kIHRyeSB0byBj
b252ZXJnZSBhcyBtdWNoIGFzCnBvc3NpYmxlLgoKPgo+U2FtaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
