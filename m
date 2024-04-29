Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E05C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7tSIQ8oeZPSsJGrWC+De4X8XPSrOtnA6VloTg/PYno=; b=R3o+XTQ2vFgahK
	K3yBpi1R9gsv0WNPA64wwlcM6rsFOZXwGVyB3/ARBkFwzIc1s91i6cYfVNb/ukE2HTVh+BEpoqsQo
	vwls4qN/qY71Ltvi4kkcE4HNIUbkvULaeUfgufriKgfRmLH39agw/luzxu38uo0wVukKoLtyr2fUn
	ZiwAhV262sNZ4KrSMXibJM0j07dDLpYE2+DETMJEdkujk0u74Oyb8ao1aahUKf4+/GiLEYoa9PiSS
	rj/st5xSJqOSedPTnBaVcfpTHwvNCGXxs8KlwJ2vQHppK8IOPQUGb1+J2j1lDwUMC4xIDXWt2PqVU
	+gCaiRjQnNmKONxk4dYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1P6s-00000002Qja-1rEn;
	Mon, 29 Apr 2024 11:23:50 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1P6p-00000002Qj0-0phl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 11:23:48 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso7212981a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714389824; x=1714994624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KI8jwSeT1iJj/UBYCVNCpYpjMdWJYZrUv0ljjTWL48=;
        b=D1uNwn5eGS15FvkuYJerzTGrLp06lENi6+5RWbcovmRzlsvKjFtZaz0QbubFdnziRY
         i5soPBlrUGHgV0zI18Jy0/KK/z7PnvXmpe1uOEvOjtLgCDPDVQ0Qfgo8AI0PdUC/OnEd
         H2CmY+pL5LsLsbTxZRz2qMXCyQHVRQ4MQ/gXSGmBW8pzKHcCPjtwqVgog6UGLR3/22Xu
         /wCmpV0419xrUhpr2a7AetmnIiqRpCdSfmsLs/lDzRgKLeMPChEnLHmkKXeryAD/GmAn
         WTRtBOlGKp3wWuwXUJ2rc4HZ06eRGAkrc7yE4PFUhP0X7Cqe0QrqDL+/rbIUQ9kDj+1X
         03mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389824; x=1714994624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KI8jwSeT1iJj/UBYCVNCpYpjMdWJYZrUv0ljjTWL48=;
        b=QuGavLF1B4GDjvTU6IARv/x5ENX4RojaDKIVkjQl3fCtqrslH69o4aarHSk3WADrlF
         1OaMO11U/nip8rcA/PamDWekTYgVedVeI/7pETeBv3PAF+u6PdudYOBpdJezfquOBgrX
         WqDOwNolgKRucjC14XImiihUWelIVNrSDEnCvqaToRPL+cvtosmiW2XU0R3tkg7MWZAR
         V2KicH1Lz2jOklu/xG2G7Ntpw1E3DWsuCdeJEB6EnkDv3JhstmyRBbUlZQOoMIYjYbEd
         jkq5mrz7OO0a4nWiHtGDGrdIGyKZeJBpLP12MjPeQdQuQaaVTkaV2Fdcpy/NN8CbQDLQ
         plug==
X-Forwarded-Encrypted: i=1; AJvYcCVbthhbFz9FOgZP2XOw6oLUnJVgF414fLKzFIjdg2tdby5nQdAVMLNXjaMUdPRnUukSYPaAbtusvU9292S3KqykNJhuWIBvBlpitcowAdN7
X-Gm-Message-State: AOJu0Yw+3pRJ7jRVYtgKwT0JaImL2NeaHHAzmKdVdzbx9xJAzi2Nq6eI
	LnncmVlX4cbMvLvvYWfh4jYuuo+K80JC0OhSil2AxWT5ewoFqE0doEOYq2UHLyifpudk74VazBw
	s4DbuvcoSe0s9Y1dRaDsLil2o0lQ=
X-Google-Smtp-Source: AGHT+IG2L6VHSgjPSI/ILsTX8RnUhW7ZCUeTXF2zruE9lvX81lsZxzWjLYduBB8ybTFePpHpcWjpPPLOGxbnBtFwaHY=
X-Received: by 2002:a50:8a89:0:b0:568:a30c:2db5 with SMTP id
 j9-20020a508a89000000b00568a30c2db5mr5612851edj.40.1714389824240; Mon, 29 Apr
 2024 04:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240429103346.59115-1-libang.li@antgroup.com> <20240429103346.59115-6-libang.li@antgroup.com>
In-Reply-To: <20240429103346.59115-6-libang.li@antgroup.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 29 Apr 2024 19:23:32 +0800
Message-ID: <CAK1f24n4usJm4=e0+jrTxGtRjqTJZvn4gBp8d_vU=p2CrU=TsA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] mm: Add update_mmu_tlb_range()
To: Bang Li <libang.li@antgroup.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, david@redhat.com, ryan.roberts@arm.com, 
	libang.linux@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_042347_279463_F19A0E90 
X-CRM114-Status: GOOD (  19.78  )
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

SGV5IEJhbmcsCgpPbiBNb24sIEFwciAyOSwgMjAyNCBhdCA2OjM24oCvUE0gQmFuZyBMaSA8bGli
YW5nLmxpQGFudGdyb3VwLmNvbT4gd3JvdGU6Cj4KPiBBZnRlciB0aGUgY29tbWl0IDE5ZWFmNDQ5
NTRkZiAoIm1tOiB0aHA6IHN1cHBvcnQgYWxsb2NhdGlvbiBvZiBhbm9ueW1vdXMKPiBtdWx0aS1z
aXplIFRIUCIpLCBpdCBtYXkgbmVlZCB0byBiYXRjaCB1cGRhdGUgdGxiIG9mIGFuIGFkZHJlc3Mg
cmFuZ2UKPiB0aHJvdWdoIHRoZSB1cGRhdGVfbW11X3RsYiBmdW5jdGlvbi4gV2UgY2FuIHNpbXBs
aWZ5IHRoaXMgb3BlcmF0aW9uIGJ5Cj4gYWRkaW5nIHRoZSB1cGRhdGVfbW11X3RsYl9yYW5nZSBm
dW5jdGlvbiwgd2hpY2ggbWF5IGFsc28gcmVkdWNlIHRoZQo+IGV4ZWN1dGlvbiBvZiBzb21lIHVu
bmVjZXNzYXJ5IGNvZGUgaW4gc29tZSBhcmNoaXRlY3R1cmVzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QmFuZyBMaSA8bGliYW5nLmxpQGFudGdyb3VwLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9w
Z3RhYmxlLmggfCA1ICsrKysrCj4gIG1tL21lbW9yeS5jICAgICAgICAgICAgIHwgNCArLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxl
LmgKPiBpbmRleCAxODAxOWYwMzdiYWUuLjczNDExZGZlYmY3YSAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L3BndGFibGUuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4gQEAg
LTczNCw2ICs3MzQsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfdGxiKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdCAqcHRlcCkKPiAgewo+ICB9Cj4gKwo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFk
ZHJlc3MsIHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBpbnQgbnIpCj4gK3sKPiArfQo+ICAjZGVmaW5l
IF9fSEFWRV9BUkNIX1VQREFURV9NTVVfVExCCj4gICNlbmRpZgoKSU1PLCBpdCBtaWdodCBiZSBi
ZXR0ZXIgdG8gdXNlIGEgc2VwYXJhdGUgZGVmaW5pdGlvbiB0byBkZXRlcm1pbmUgd2hldGhlcgp1
cGRhdGVfbW11X3RsYl9yYW5nZSgpIGlzIG92ZXJyaWRkZW4gYnkgYSBzcGVjaWZpYyBhcmNoaXRl
Y3R1cmUuCgpUaGFua3MsCkxhbmNlCgo+Cj4gZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0v
bWVtb3J5LmMKPiBpbmRleCA2NjQ3Njg1ZmQzYzQuLjFmMGNhMzYyYjgyYSAxMDA2NDQKPiAtLS0g
YS9tbS9tZW1vcnkuYwo+ICsrKyBiL21tL21lbW9yeS5jCj4gQEAgLTQzOTYsNyArNDM5Niw2IEBA
IHN0YXRpYyB2bV9mYXVsdF90IGRvX2Fub255bW91c19wYWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1m
KQo+ICAgICAgICAgdm1fZmF1bHRfdCByZXQgPSAwOwo+ICAgICAgICAgaW50IG5yX3BhZ2VzID0g
MTsKPiAgICAgICAgIHB0ZV90IGVudHJ5Owo+IC0gICAgICAgaW50IGk7Cj4KPiAgICAgICAgIC8q
IEZpbGUgbWFwcGluZyB3aXRob3V0IC0+dm1fb3BzID8gKi8KPiAgICAgICAgIGlmICh2bWEtPnZt
X2ZsYWdzICYgVk1fU0hBUkVEKQo+IEBAIC00NDY1LDggKzQ0NjQsNyBAQCBzdGF0aWMgdm1fZmF1
bHRfdCBkb19hbm9ueW1vdXNfcGFnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiAgICAgICAgICAg
ICAgICAgdXBkYXRlX21tdV90bGIodm1hLCBhZGRyLCB2bWYtPnB0ZSk7Cj4gICAgICAgICAgICAg
ICAgIGdvdG8gcmVsZWFzZTsKPiAgICAgICAgIH0gZWxzZSBpZiAobnJfcGFnZXMgPiAxICYmICFw
dGVfcmFuZ2Vfbm9uZSh2bWYtPnB0ZSwgbnJfcGFnZXMpKSB7Cj4gLSAgICAgICAgICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVw
ZGF0ZV9tbXVfdGxiKHZtYSwgYWRkciArIFBBR0VfU0laRSAqIGksIHZtZi0+cHRlICsgaSk7Cj4g
KyAgICAgICAgICAgICAgIHVwZGF0ZV9tbXVfdGxiX3JhbmdlKHZtYSwgYWRkciwgdm1mLT5wdGUs
IG5yX3BhZ2VzKTsKPiAgICAgICAgICAgICAgICAgZ290byByZWxlYXNlOwo+ICAgICAgICAgfQo+
Cj4gLS0KPiAyLjE5LjEuNi5nYjQ4NTcxMGIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
