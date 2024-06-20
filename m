Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9170C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 00:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rqjLTBSKdeft2ya5HFlCSAY3sZY9ryqVBbOPPBNRd4=; b=namcRBMCAQI4yd
	LvxB9qaE641PIm0RosopLSESEs9HS4+rumB4Aehdfmc7rZwFYJBJ2i0bbGcBLhZIB1scux8kulXtV
	1L6W2tBqaAnq42a5jM7m2o3hM2DIrXtc2l6QIXERq+ec34KlJRSKUT2aKftSj03ajOUfTkmyJkvER
	nackhZOV262T70DLuVhF5NtN1P6QyWKb9ddwWgM5epG6bWrtm9BDw7aRAlTFvcmmTNatrANXSGmfb
	gSj6GLyuc6tduy6nk9vOoCocKtVHc2i+F/aY0l3koUTrhWlmG/DyVTHDQz2iWxCMlxcg3/KCyWJm8
	fsZ8oaMjqiPvoQ3d3dhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5GF-000000035tu-0FCb;
	Thu, 20 Jun 2024 00:02:43 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5GA-000000035tA-3AAm
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 00:02:41 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c2c91c9279so62529a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 17:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718841758; x=1719446558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmEnzCfhw4+kf66WwT7z0PCQSHQsh8LMjnuOH1bhp4M=;
        b=TcPA1+1R/OFxqPpdVkGOmbjjyA+uzbKzi4K5UMB1VQCBB7bPKO/tOLY57o+lWbwPBh
         8uf21vB8qlZoFj7zjfLx1VL+Wzd0XlzzNQP6FifQpP2Kb4cFvmW/rn2w/aZe1wgA2hPP
         ygE2Y3ujLjOSAUHT32MknkVflLgpfI6aD2jybrmxWSTrNjjKQQ99SqfYoRWvgyVacpk8
         GcLr0IKJPFuady8lKaip38d7rH+twUhYUkFTyQ/h8/S/pXBG/1Aa2H/Gm+5B5dzYsnLh
         Rr3B4UvF+TuDs5GMLdXHwC4taWfw69+PuGFqT6L6MW7X31bnZNda6c94iTHJoWWGakfP
         mI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841758; x=1719446558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmEnzCfhw4+kf66WwT7z0PCQSHQsh8LMjnuOH1bhp4M=;
        b=BibfqzjdfOXKV1xu8x5m5Hh+qT3L2UkAAyQMvCHs+Hzt3T6wUumLWyNYO9KEnAP0iq
         1rYdh0IuarjBCmFgH7jNMUee8lIemVjfYagleTxJ9IXF4Qjcf1ct/BrKU+zH2g54L3qh
         Kapiwwus0wMLfs1dL6YD27pJCmZNT1KcteuITSHb+89LWBTHZTiWBuJLxKcmnotj62Ol
         He4ajIcP3PENeRecJfiHqP73cvCdPyeDSOix6mziR05RQ/dqHpET87fNWI/rChQ4GdNw
         1nBWf5lwLRVHA4q+/KPFscyxkUtT/hM86rtpqKfzKg5Nwl1Nv7T/ezKKMP1q5bmu1CXh
         EpMw==
X-Forwarded-Encrypted: i=1; AJvYcCWFavOPoq6XAQc2O2imYXkBcyd4lZ3sVuQum5EoCKlirENW3bssn6dRRATC/I/rm8yrKSRd9+Cr+nyYcxBUZHy0vwfIXgoksvhGkaWh6c9/
X-Gm-Message-State: AOJu0Yz4mHAhXIuCuBRR5416HCL4/3dnTCyeqsQ8aK7vBOX1XquadavV
	CYrdtSA+xgwJl0lq8FDW4hUhw8nsx8wQ2mnW8VepnVed5fjLEJkCBtovt/BddNyktEiBZzI/+Hj
	4QpgcDpvrE+L0hzgiSHWIqGxe0xnm1OINrGZu
X-Google-Smtp-Source: AGHT+IHYX3vliRVrsmoB0EDQ2BRZZRzZMQiuiJHi/weJF3V9+Z+ue117XEcEjBHBAW1NYoYcEBNysniOEZmXy/iJPXA=
X-Received: by 2002:a17:90a:fa01:b0:2c4:d63b:cdf with SMTP id
 98e67ed59e1d1-2c7b5c83afcmr3848050a91.1.1718841757779; Wed, 19 Jun 2024
 17:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240616170553.2832-1-jszhang@kernel.org> <20240616170553.2832-4-jszhang@kernel.org>
 <ZnMPhcaTKFRbbE1i@debug.ba.rivosinc.com>
In-Reply-To: <ZnMPhcaTKFRbbE1i@debug.ba.rivosinc.com>
From: Cyril Bur <cyrilbur@tenstorrent.com>
Date: Thu, 20 Jun 2024 10:02:27 +1000
Message-ID: <CANtDSipXbYSuz6NakbXw-8k0_ZN5hdT7VWMushXvQ5VB0Am_Ng@mail.gmail.com>
Subject: Re: [PATCH 3/6] riscv: convert bottom half of exception handling to C
To: Deepak Gupta <debug@rivosinc.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, Clement Leger <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_170238_822153_49F188CB 
X-CRM114-Status: GOOD (  17.66  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMzowNOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDAxOjA1OjUwQU0g
KzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPkZvciByZWFkYWJpbGl0eSwgbWFpbnRhaW5h
YmlsaXR5IGFuZCBmdXR1cmUgc2NhbGFiaWxpdHksIGNvbnZlcnQgdGhlCj4gPmJvdHRvbSBoYWxm
IG9mIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgdG8gQy4KPiA+Cj4gPk1vc3RseSB0aGUgYXNzZW1i
bHkgY29kZSBpcyBjb252ZXJ0ZWQgdG8gQyBpbiBhIHJlbGF0aXZlbHkKPiA+c3RyYWlnaHRmb3J3
YXJkIG1hbm5lci4KPiA+Cj4gPkhvd2V2ZXIsIHRoZXJlIGFyZSB0d28gbW9kaWZpY2F0aW9ucyBJ
IG5lZWQgdG8gbWVudGlvbjoKPiA+Cj4gPjEuIHRoZSBDU1JfQ0FVU0UgcmVnIHJlYWRpbmcgYW5k
IHNhdmluZyBpcyBtb3ZlZCB0byB0aGUgQyBjb2RlCj4gPmJlY2F1c2Ugd2UgbmVlZCB0aGUgY2F1
c2UgdG8gZGlzcGF0Y2ggdGhlIGV4Y2VwdGlvbiBoYW5kbGluZywKPiA+aWYgd2Uga2VlcCB0aGUg
Y2F1c2UgcmVhZGluZyBhbmQgc2F2aW5nLCB3ZSBlaXRoZXIgcGFzcyBpdCB0bwo+ID5kb190cmFw
cygpIHZpYS4gMm5kIHBhcmFtIG9yIGdldCBpdCBmcm9tIHB0X3JlZ3Mgd2hpY2ggYW4gZXh0cmEK
PiA+bWVtb3J5IGxvYWQgaXMgbmVlZGVkLCBJIGRvbid0IGxpa2UgYW55IG9mIHRoZSB0d28gc29s
dXRpb25zIGJlY2FzZQo+ID50aGUgZXhjZXB0aW9uIGhhbmRsaW5nIHNpdHMgaW4gaG90IGNvZGUg
cGF0aCwgZXZlcnkgaW5zdHJ1Y3Rpb24KPiA+bWF0dGVycy4KPgo+IENDOiBDbGVtZW50Lgo+Cj4g
SSB0aGluayBpdHMgYmV0dGVyIHRvIHNhdmUgYXdheSBjYXVzZSBpbiBwdF9yZWdzIHByaW9yIHRv
IGNhbGxpbmcKPiBgZG9fdHJhcHNgLiBPbmNlIGNvbnRyb2wgaXMgdHJhbnNmZXJyZWQgdG8gQyBj
b2RlIGluIGBkb190cmFwc2AsCj4gYW5vdGhlciB0cmFwIGNhbiBoYXBwZW4uIEl0J3MgYSBwcm9i
bGVtIGFueXdheXMgdG9kYXkgd2l0aG91dCBDUFUgc3VwcG9ydC4KPgo+IEFsdGhvdWdoIHdpdGgg
U3NkYmx0cnAgWzFdIGV4dGVuc2lvbiBhbmQgaXQga2VybmVsIHN1cHBvcnQgWzJdIGZvciBpdCwK
PiBJIGV4cGVjdCBhc20gY29kZSB3b3VsZCBjbGVhciB1cCBgU0RUYCBiaXQgaW4gbXN0YXR1cy4g
V2hlbmV2ZXIgYFNzZGJsdHJwYCBsYW5kcywKPiBJIHRoaW5rIGBkb190cmFwc2Agc2hvdWxkIGV4
cGVjdCBuZXN0aW5nIG9mIHRyYXBzIGFuZCB0aHVzIGNhdXNlIHNob3VsZCBiZSBzYXZlZAo+IGF3
YXkgYmVmb3JlIGl0IGdldHMgY29udHJvbCBzbyB0aGF0IHNhZmVseSB0cmFwcyBjYW4gYmUgbmVz
dGVkLgo+CgpJcyBhIHBvc3NpYmxlIHNvbHV0aW9uIHRvIGRvIGJvdGggb3B0aW9ucyBKaXNoZW5n
IHN1Z2dlc3RlZD8gU2F2ZSB0aGUKY2F1c2UgYmVmb3JlCmNhbGxpbmcgZG9fdHJhcHMgYnV0IGFs
c28gcGFzcyBpdCB2aWEgc2Vjb25kIHBhcmFtPwoKPiBbMV0gLSBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3YvcmlzY3YtZG91YmxlLXRyYXAvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC1yYzEvcmlzY3Yt
ZG91YmxlLXRyYXAucGRmCj4gWzJdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
NDE4MTMzOTE2LjE0NDI0NzEtMS1jbGVnZXJAcml2b3NpbmMuY29tLwo+Cj4gPgo+ID4yLlRvIGNv
cGUgd2l0aCBTSUZJVkVfQ0lQXzQ1MyBlcnJhdGEsIGl0IGxvb2tzIGxpa2Ugd2UgZG9uJ3QgbmVl
ZAo+ID5hbHRlcm5hdGl2ZSBtZWNoYW5pc20gYW55IG1vcmUgYWZ0ZXIgdGhlIGFzbS0+YyBjb252
ZXJ0aW9uLiBKdXN0Cj4gPnJlcGxhY2UgdGhlIGV4Y3BfdmVjdF90YWJsZSB0d28gZW50cmllcy4K
PiA+Cj4gPlNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
