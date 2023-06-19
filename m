Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5590CEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GCWIlFv2BQp+ZpF7N7IuAgovMU16jFa0I4A5MKxUahE=; b=qbQM8nEsfjTS39lyJKFU+c/76x
	F9GVIncVXldXks3D1eAbQUesyX41Agvw6itnNay+OghkUGuTzikO/DiWNs1Rnki4mKqTRST1gXx1L
	sWUKVJgn94diVeu4xF9hwnguLzDfm0f0XuJ5H5STiIrEDutx4GrKFr7UZVfUc36/OO75Lydx88qoD
	n/IOtCNsTE+wme2W0/DRrJdBAscqKNDcYq7HcBfmpknJdyDUha9gRVpS0TmIGIdSwJi1Lbj1dH9fV
	3RJT4EXk3hcLAolfmwnGj2302jIt3nyzDxOntgsgeiR6IObJk1PKfdaO9hCZNbCZL8VadJJp/rxv3
	5FIEt9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKCC-009HFj-1S;
	Mon, 19 Jun 2023 19:05:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKC9-009HF9-1U
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:05:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b50394a7f2so21318775ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 12:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687201544; x=1689793544;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LomlquJS+JNYy3P55fAL46oKzCdyQVsdgNtJzxw6b94=;
        b=Y3c8jjBKqeunLpJ5nXt9Gxw3TtmzTb2gju9kc2iMyofOXILV+vIsJZaHjLiAGyc7pj
         yaZGamhfxS7CuFXxX8wXnrgamPGNnm52wmCA9pVwP6d84neB/XAhra1k7dRUpIubXDik
         OKTNcYcaLZWRXSrSm2p5N34HvvUsovMUNRKmvizMgVmcCm6qeGo3V83hDk07sgrgozyp
         KUNuOcg2927lVTuIYLutEk0u9ZZQPmPgOjUGhRXz+RCiFR2t8l0+0jbBxEXQ0OUcYRYZ
         TG3Tk7H0NpQ2TluyA9IwG4sb7+FgubyWVVxQC4X/o75PSb41J7axM4o3pyYVjvOAnAf6
         lBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201544; x=1689793544;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LomlquJS+JNYy3P55fAL46oKzCdyQVsdgNtJzxw6b94=;
        b=ixI0KeoCHZe6n+/Vm7IXP/k+UXKRwyiVkNsG73wNsK8dMrtAnSAGOMUG4i5vt9jePt
         2kVpt2THchWHrLDBG0DtMcYwf6xYXiv955I6xoIOGnZLa5MH1guwgPM2/y2hqdQvK8Wa
         9R3NLJ0shIaoeiw51oCH/q1qdHDJYW6tl4/r/4cJMJPd0Uih24KzrMSLUkiC+6HJVJE1
         frzKnD8ynmnjjvyWMC8MD8b47yJ+EHun229ZuU56oEkJGOKkXncR+Ny7poU7Sy613bLL
         58ojB2nNWDgrMTL7aUbONyzcFNxxQg3TOMhL5uKZJViiDTtuwFxYAVGYJgbHVYaUgJDw
         EaLw==
X-Gm-Message-State: AC+VfDwcZ3scAz3ic2Haf3hiEZxMeKgei2PYliv9BtBThsG1CdDurZ2a
	YjPMp0HA5JFpTQfvI5W51TVkWy9W3JY0Jq/blpY=
X-Google-Smtp-Source: ACHHUZ76GYZQt7pcnyThR9XwGm5cOmokvNREJNkUHscen7j8EwtozpGMjHJIwqXjnd0g7Nbwmc6aeA==
X-Received: by 2002:a17:903:41cf:b0:1ac:8837:df8 with SMTP id u15-20020a17090341cf00b001ac88370df8mr10077368ple.6.1687201544103;
        Mon, 19 Jun 2023 12:05:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y1-20020a170902b48100b001b20dc1b3c9sm171041plr.200.2023.06.19.12.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 12:05:43 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:05:43 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 12:05:38 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <87v8fjjmyn.fsf@all.your.base.are.belong.to.us>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: bjorn@kernel.org
Message-ID: <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_120545_500652_64E78097 
X-CRM114-Status: GOOD (  18.27  )
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

T24gTW9uLCAxOSBKdW4gMjAyMyAxMjowMToyMCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+
Cj4gWy4uLl0KPgo+Pj4+ICsJCXJpc2N2X3ZfdnN0YXRlX29mZihyZWdzKTsKPj4+PiArCj4+Pgo+
Pj4gTm90IG9mZiwgcmlnaHQ/IElzbid0IGl0IF9fcmlzY3Zfdl92c3RhdGVfY2xlYW4oKSB0aGF0
IHlvdSdkIGxpa2UgdG8KPj4+IGNhbGw/IFNvbWV0aGluZyBsaWtlOgo+Pj4KPj4+IHN0YXRpYyB2
b2lkIHZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4gewo+Pj4gICAgICAg
IGlmICgocmVncy0+c3RhdHVzICYgU1JfVlMpID09IFNSX1ZTX0RJUlRZKQo+Pj4gICAgICAgICAg
ICAgICAgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPj4+IH0KPj4+Cj4+PiBDb21wbGVt
ZW50ZWQgYnkgYSAhViBjb25maWcgdmFyaWFudC4KPj4KPj4gSSB0aGluayBpdCdzIGp1c3QgYSBx
dWVzdGlvbiBvZiB3aGF0IHdlJ3JlIHRyeWluZyB0byBkbyBoZXJlOiBjbGVhbiAKPj4gYXZvaWRz
IHRoZSBrZXJuZWwgViBzdGF0ZSBzYXZlLCBidXQgdW5sZXNzIHRoZSBrZXJuZWwgZGVjaWRlcyB0
byB1c2UgViAKPj4gZHVyaW5nIHRoZSBzeXNjYWxsIHRoZSByZWdpc3RlciBjb250ZW50cyB3aWxs
IHN0aWxsIGJlIHVzYWJsZSBieSAKPj4gdXNlcnNwYWNlLiAgTWF5YmUgdGhhdCdzIGZpbmUgYW5k
IHdlIGNhbiBqdXN0IHJlbHkgb24gdGhlIElTQSBzcGVjLCAKPj4gdGhvdWdoPyAgSSBzZW50IGFu
b3RoZXIgcGF0Y2ggdG8ganVzdCBkb2N1bWVudCBpdCBpbiBMaW51eCwgZXZlbiBpZiBpdCdzIAo+
PiBpbiB0aGUgSVNBIHNwZWMgaXQgc2VlbXMgd29ydGggaGF2aW5nIGluIHRoZSBrZXJuZWwgYXMg
d2VsbC4KPj4KPj4gVGhhdCBzYWlkLCBJIHRoaW5rIHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJl
IG1pZ2h0IGJlIHRvIHplcm8gdGhlIFYgCj4+IHJlZ2lzdGVyIHN0YXRlIGFuZCBzZXQgaXQgdG8g
aW5pdGlhbDogdGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNlIAo+PiBmcm9tIGFjY2lk
ZW50YWxseSByZWx5aW5nIG9uIHRoZSBzdGF0ZSBzYXZlLCBidXQgd2UgY2FuIGFsc28gYXZvaWQg
dGhlIAo+PiB0cmFwIHRoYXQgd291bGQgY29tZSBmcm9tIHR1cm5pbmcgaXQgb2ZmLiAgVGhhdCBs
ZXRzIHVzIGdpdmUgdGhlIAo+PiBoYXJkd2FyZSBhIG5pY2UgY2xlYW4gaW5kaWNhdGlvbiB3aGVu
IHRoZSBWIHN0YXRlIGlzbid0IGluIHVzZSwgd2hpY2ggCj4+IHdpbGwgaG9wZWZ1bGx5IGhlbHAg
dXMgYXZvaWQgdGhlIHNhdmUvcmVzdG9yZSBwZXJmb3JtYW5jZSBpc3N1ZXMgdGhhdCAKPj4gb3Ro
ZXIgcG9ydHMgaGF2ZSBoaXQuCj4KPiBGV0lXLCBJIHRoaW5rIHRoYXQncyBhIG11Y2ggYmV0dGVy
IGlkZWEgdGhhbiB0dXJuaW5nIFYgb2ZmLiBJIGFsc28gbGlrZQo+IHRoYXQgaXQnbGwgcHJldmVu
dGluZyB1c2VybGFuZCB0byByZWx5IG9uIHByZS1lY2FsbCBzdGF0ZS4KCk9LLCBhbnlvbmUgZWxz
ZSBvcHBvc2VkPwoKV2UncmUga2luZCBvZiBpbiB0aGUgd2VlZHMgb24gcGVyZm9ybWFuY2UsIEkg
dGhpbmsgd2UnZCBuZWVkIEhXIHRvIGtub3cgCmZvciBzdXJlIGlmIGVpdGhlciBpcyBhbiBpc3N1
ZS4gIFNlZW1zIGJlc3QgdG8ganVzdCBwbGF5IGl0IHNhZmUgV1JUIHRoZSAKdUFCSSBmb3Igbm93
LCB3ZSBjYW4gYWx3YXlzIGRlYWwgd2l0aCBhbnkgcGVyZm9ybWFuY2UgaXNzdWVzIGlmIHRoZSAK
ZXhpc3QuCgo+IEJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
