Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98ACC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 15:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6ujXM34kwbmJxkT7lX0u5GyKZdAySF/VShSrJYxi6Q=; b=VeA06tZFD9jR4+
	U8xhG63GBEE8EKRFT7D+3F6E0aJLciTdU316w9MIxxIQF3+CtGI7HkuS+sq5vAZ+hnS8jftBx0u+c
	7QbVloIe+RMgwgtb/hE5auO6YY2DPWT1KBk/+BZlX1Top7e1vvFtZTD5CTgPabkelA/W29mAlz3A4
	akWdJDkjFHCUdYmKlVgoXB448duEQBbAupbkaIvShd2BdRsuhuwn0nezfynxzraaqcGlhN7j8+YVM
	Agk/Hi5h8jF88G6EWoikyZt7rsRjaSVkev2i+N8AOjQ8xNLsPDlR/6DhC+2AwMx+PoetJdByLXHPU
	EU2HUzWGawa0KYfvVWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXhQ-00000005rKM-0Ngl;
	Thu, 01 Aug 2024 15:26:40 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXhO-00000005rJD-0zD0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 15:26:39 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-44fe76fa0b8so721421cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722525996; x=1723130796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJsisVlXsYheO37snVaNoupjzpA6f699hMvkHk44PW0=;
        b=TWc1VWJhGZgY9/F8r7B4lMF5WvHgWPouYkT415R8e11u0j/6ifoYrfK8oBTHzaiWp8
         dRe91N7sOEP/5EX8BkCVVtKsgMe+Ry0TYVv2EUQiLJXvsbMUKa8UdCkoZQpasizM31lm
         Atcu7tYsBJDzkwyHg2JC1CNDSIe6QifykiTMheJu609ee1IT4ILmYEiANJnAO5ZCnp6P
         jmbfsQDQAnrEpsCi6xTcHAOXd8mZZqt3AB4A+FHfNEZzGm21tDBH1iRzc1fzO3E+w8Mr
         zG8+5KyJNmtsQyqcjHkvqrb0OJRpGpadWZGDN0NbRVSQXS2f88LtvlJaIGvW+q53dwp0
         Jk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525996; x=1723130796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJsisVlXsYheO37snVaNoupjzpA6f699hMvkHk44PW0=;
        b=RoNLB/MLmB5sYbbiyAh0GRAOiiA5Wh4osvLqtxbE1+4tTdmF3glkK0Ro7Jw2Iey+9j
         37XBBhiFgi4tU936jfFIWpEGwfIi9yU/oE+1eCqwKz8vs//HP/7W9ZZNifYcBQrSvwIo
         EnBgRx2r0KR+Py0uSUyFNM3N3dPcZBYF4wxKnt7cn4z0fZ6+7FNeBKX8WEGjucYAXoyo
         6bcv/MOLilWnVyWZ/yenl1naM8VzRWYWe8KyHS83FIKlRdGepD2EysWAT2MS3gJPlatg
         038o7NLdgLvfhu40ESZ0wejLmZRV39Z2JpPetY4Ha1TvjkYnqtiSnhypT6NjH5ggfjfP
         oF8g==
X-Forwarded-Encrypted: i=1; AJvYcCUjMFuFq7XjK/guVmqm19tFRpM8SUDgQ0PQ0mxn4PiejVkVaIG+KIF4D9/eRcDGNEeHompjZomSMTKZS7qZ/8ad8a5vadkEIICKPRBKGpuo
X-Gm-Message-State: AOJu0Yzo2gEyG1kfEwhUGL1lA1B+/SPi7iTmSN57IrPpyYPFq32SXJ+T
	IoYxlVqW2kfPuKE1QlZmPi6/H9Fa7YZhOCwY2INPfexKDNhuI25zBy1gmyIaYi4079cfY6wDVBR
	oVfFCgfxhoMtgSZKUrfPqm8Y8oTyxvBKZBxTf
X-Google-Smtp-Source: AGHT+IFMASjGXKSuF0FnLFzbAgMwMf9+e1XvKKegyCNSTZDeHUACfQPHE9S5FaA15pCyPsL9NbtKplB7rSftZhJoQzg=
X-Received: by 2002:ac8:7d8c:0:b0:447:d7ff:961d with SMTP id
 d75a77b69052e-45181e6e4f1mr2046151cf.9.1722525996159; Thu, 01 Aug 2024
 08:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240719115018.27356-1-eric.lin@sifive.com> <20240729181927.1712841-1-atishp@rivosinc.com>
In-Reply-To: <20240729181927.1712841-1-atishp@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Aug 2024 08:26:24 -0700
Message-ID: <CAP-5=fUJh6zzpiFcYwxMjxk7O3eOZWTVvzOB_zt+twcbnZMYXA@mail.gmail.com>
Subject: Re: [v2] perf arch events: Fix duplicate RISC-V SBI firmware event name
To: Atish Patra <atishp@rivosinc.com>
Cc: eric.lin@sifive.com, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, dminus@andestech.com, locus84@andestech.com, 
	jisheng.teoh@starfivetech.com, inochiama@outlook.com, n.shubin@yadro.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_082638_282202_4E59BA32 
X-CRM114-Status: GOOD (  11.50  )
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

T24gTW9uLCBKdWwgMjksIDIwMjQgYXQgMTE6MTnigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiA+IEN1cnJlbnRseSwgdGhlIFJJU0MtViBmaXJtd2FyZSBK
U09OIGZpbGUgaGFzIGR1cGxpY2F0ZSBldmVudCBuYW1lCj4gPiAiRldfU0ZFTkNFX1ZNQV9SRUNF
SVZFRCIuIEFjY29yZGluZyB0byB0aGUgUklTQy1WIFNCSSBQTVUgZXh0ZW5zaW9uWzFdLAo+ID4g
dGhlIGV2ZW50IG5hbWUgc2hvdWxkIGJlICJGV19TRkVOQ0VfVk1BX0FTSURfU0VOVCIuCj4gPgo+
ID4gQmVmb3JlIHRoaXMgcGF0Y2g6Cj4gPiAkIHBlcmYgbGlzdAo+ID4KPiA+IGZpcm13YXJlOgo+
ID4gICBmd19hY2Nlc3NfbG9hZAo+ID4gICAgICAgIFtMb2FkIGFjY2VzcyB0cmFwIGV2ZW50LiBV
bml0OiBjcHVdCj4gPiAgIGZ3X2FjY2Vzc19zdG9yZQo+ID4gICAgICAgIFtTdG9yZSBhY2Nlc3Mg
dHJhcCBldmVudC4gVW5pdDogY3B1XQo+ID4gLi4uLgo+ID4gIGZ3X3NldF90aW1lcgo+ID4gICAg
ICAgIFtTZXQgdGltZXIgZXZlbnQuIFVuaXQ6IGNwdV0KPiA+ICAgZndfc2ZlbmNlX3ZtYV9hc2lk
X3JlY2VpdmVkCj4gPiAgICAgICAgW1JlY2VpdmVkIFNGRU5DRS5WTUEgd2l0aCBBU0lEIHJlcXVl
c3QgZnJvbSBvdGhlciBIQVJUIGV2ZW50LiBVbml0OiBjcHVdCj4gPiAgIGZ3X3NmZW5jZV92bWFf
cmVjZWl2ZWQKPiA+ICAgICAgICBbU2VudCBTRkVOQ0UuVk1BIHdpdGggQVNJRCByZXF1ZXN0IHRv
IG90aGVyIEhBUlQgZXZlbnQuIFVuaXQ6IGNwdV0KPiA+Cj4gPiBBZnRlciB0aGlzIHBhdGNoOgo+
ID4gJCBwZXJmIGxpc3QKPiA+Cj4gPiBmaXJtd2FyZToKPiA+ICAgZndfYWNjZXNzX2xvYWQKPiA+
ICAgICAgICBbTG9hZCBhY2Nlc3MgdHJhcCBldmVudC4gVW5pdDogY3B1XQo+ID4gICBmd19hY2Nl
c3Nfc3RvcmUKPiA+ICAgICAgICBbU3RvcmUgYWNjZXNzIHRyYXAgZXZlbnQuIFVuaXQ6IGNwdV0K
PiA+IC4uLi4uCj4gPiAgIGZ3X3NldF90aW1lcgo+ID4gICAgICAgIFtTZXQgdGltZXIgZXZlbnQu
IFVuaXQ6IGNwdV0KPiA+ICAgZndfc2ZlbmNlX3ZtYV9hc2lkX3JlY2VpdmVkCj4gPiAgICAgICAg
W1JlY2VpdmVkIFNGRU5DRS5WTUEgd2l0aCBBU0lEIHJlcXVlc3QgZnJvbSBvdGhlciBIQVJUIGV2
ZW50LiBVbml0OiBjcHVdCj4gPiAgIGZ3X3NmZW5jZV92bWFfYXNpZF9zZW50Cj4gPiAgICAgICAg
W1NlbnQgU0ZFTkNFLlZNQSB3aXRoIEFTSUQgcmVxdWVzdCB0byBvdGhlciBIQVJUIGV2ZW50LiBV
bml0OiBjcHVdCj4gPiAgIGZ3X3NmZW5jZV92bWFfcmVjZWl2ZWQKPiA+ICAgICAgICBbUmVjZWl2
ZWQgU0ZFTkNFLlZNQSByZXF1ZXN0IGZyb20gb3RoZXIgSEFSVCBldmVudC4gVW5pdDogY3B1XQo+
ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1k
b2MvYmxvYi9tYXN0ZXIvc3JjL2V4dC1wbXUuYWRvYyNldmVudC1maXJtd2FyZS1ldmVudHMtdHlw
ZS0xNSBbMV0KPiA+IEZpeGVzOiA4ZjBkY2I0ZTczNjQgKCJwZXJmIGFyY2ggZXZlbnRzOiByaXNj
diBzYmkgZmlybXdhcmUgc3RkIGV2ZW50IGZpbGVzIikKPiA+IEZpeGVzOiBjNGY3NjlkNDA5M2Qg
KCJwZXJmIHZlbmRvciBldmVudHMgcmlzY3Y6IGFkZCBTaWZpdmUgVTc0IEpTT04gZmlsZSIpCj4g
PiBGaXhlczogYWNiZjZkZTY3NGVmICgicGVyZiB2ZW5kb3IgZXZlbnRzIHJpc2N2OiBBZGQgU3Rh
ckZpdmUgRHViaGUtODAgSlNPTiBmaWxlIikKPiA+IEZpeGVzOiA3MzQwYzZkZjQ5ZGYgKCJwZXJm
IHZlbmRvciBldmVudHMgcmlzY3Y6IGFkZCBULUhFQUQgQzl4eCBKU09OIGZpbGUiKQo+ID4gRml4
ZXM6IGY1MTAyZTMxYzIwOSAoInJpc2N2OiBhbmRlczogU3VwcG9ydCBzcGVjaWZ5aW5nIHN5bWJv
bGljIGZpcm13YXJlIGFuZCBoYXJkd2FyZSByYXcgZXZlbnQiKQo+ID4gU2lnbmVkLW9mZi1ieTog
RXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTmlraXRh
IFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIFYx
Ogo+ID4gIC0gQWRkICJGaXhlczoiIHRhZyBmb3IgZXZlcnkgcGF0Y2ggdGhhdCBjb3BpZWQgZmly
bXdhcmUuanNvbgo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KClJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpUaGFua3Ms
CklhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
