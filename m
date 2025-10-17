Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A52CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6R6ict5IfYWbEjfn3iM2DqDjftkhVJNNQE43La58M8=; b=Exm9Vwi3Xba3IG
	8tAHzBHsI4uhU7qQGi4SIccpEmh27gi6bYN39GMsSBAo8k1ftZ+qNAlLQkxHx9W9nIpLX25H/H2jb
	IWjA6KQz8QPonv2dyxT7WZEf7KZcev18A1q7+gVmrABeREnonXWA+mYVG8Jfx1/bFKejqpZba9H+t
	KP+dMn9QtmCs3jYU4JK9MpYDv2r9Cri/JNLZ6iGXUMvKZYKuXoUlLI4+0cqix7rYBbYfohO5YFVTM
	733E8ul4pagJYRImqgSw4Ao/FRkrjdtvnVLykq3BCqWXKV47Nc2E/1IyJdy1pyYI7RUgXfBW1J71I
	303+D8ph5w9GNhD+Hv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eWB-00000006v47-0wJK;
	Fri, 17 Oct 2025 07:04:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eW8-00000006v3l-2ZAP
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 07:04:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f5d497692so2118850b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1760684687; x=1761289487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tBllN1KPXGz1kwWkEqmZXoXM1+36pBPLJkHM98NsOQ=;
        b=o/3Gt321kCjBk3jd687bKG6MKk3NniLBt2oLDG5lSx394KyjRLEMublOBH4VfKMnw1
         YO1E9n0V44/6HUuEPoEiIOvxAebZYF34xhza9ju0jhsmDcq12ynn5sDt6J/nyp/GYFyI
         zT0m3sEL1hHseNxGvnZOLT4Eh51045sF+eqUcIhgjjQCkTCDkODBDEsp3UeUwfy+IhuL
         /z7BxamhbxeesrJPu4AAFyB6Kkoh/0E84MTVP0XigL2lTrFxu4LlUzQzyLfW6mOVPVMB
         4M8SLjxEkEc1Q7DYKkXu8As8ckFZwDZdp88+mv6dNSFlcW1yVLbVBJOXaIuCWObi7LA5
         M/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760684687; x=1761289487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tBllN1KPXGz1kwWkEqmZXoXM1+36pBPLJkHM98NsOQ=;
        b=tMOVgX1BCu5b/6+HWq3ayCyvlWt9nBp1JhtdSXxfPulvr2qyRMq6/dRo3DmfyCq50q
         OqECKMnHgx/dwFlCG1TRpWCzk+zkddzOVYjcYNHSSvwDlk893CVcxxbW28Hw39PctX1E
         uppjP3s8aRuHsu4b1PNkusWpPJj/0RZ6caoOTpgj9rKidL1usjLwCIo06g0vA/hvFqBu
         yNVVKJXceq9qRtIi3KFqY9YZ4qO5pELFx1Bqu6argP7hZe4wucm5lAqn+Ym9XvipsDSU
         znOgBYSFsQClTdCnVojXS0g2/fpymvaDY5hBmtfLtxtQaDaJ42Qi+ohyrjaax/d3d0Wm
         srzg==
X-Forwarded-Encrypted: i=1; AJvYcCX0js29ozQrzxBIiwJKcbULxDS91yzweXbeIdUCY7yrTcwJT7saGE9R/0XsKtHstsCyMeMiisNe9MHGZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJH4vJWZQ312ENk4aH15Ir3f1/Yy7exoP+CG8/3sEU8yMhbegv
	8+FCvnydrqWwMeUIqVnRAkYrfBOs1MLA87ND9yjeTZojCMLonGL851Br1keRyBIMqt7tNdo9Bb1
	sGceYlN+4KFyrxMFqIVp8xx44LvS+S14oUXFlBzCE9+r3Y2sD+lw1
X-Gm-Gg: ASbGncv24u13JWLzcpSYElF9buBMZiyoqryAecJrEGT84Sb2Ka1gfvf6MabWnNsyQ0S
	S4WSX4jKMCCRwpmLnhRL8oIxcKDPT1wOpobyWiLo4pNP9cSE8p5ekaCiUzphwqSsPCLRP0jcyq0
	vupQFBpCQgp5rTnR0/cQBWDzNGKDIGjaozVh0TotImtD5jq86XLXpriMl3QCByMRxkn4oGSkvW+
	QN+X1T7+C+KyU/Xs8X89o7EUB+sTP+HXMU2nxHQ9TGla4G+PfYPaRH+393FaQjnZ7Lw2Xx4B2e8
	0ERV7CIOsFxI2hYa6M13gqzgRtMTW7FNjCdb+t4=
X-Google-Smtp-Source: AGHT+IFCshVxKTQarSYu+mbLMq9+cdps146TZixf/9pY/HK3AnNs9jHylKnsUq6JcPr+g9YcoZphbOzJ+VMIjriDxuQ=
X-Received: by 2002:a05:6e02:3e04:b0:430:c394:15a3 with SMTP id
 e9e14a558f8ab-430c528d628mr41557595ab.22.1760684336325; Thu, 16 Oct 2025
 23:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Oct 2025 12:28:44 +0530
X-Gm-Features: AS18NWDRRpVn-G-IgqIpz7eW2arnxdgcUvLxINosb7XYvEXa1letznEamlVSgow
Message-ID: <CAAhSdy2UcmoPLF0CGBrsF1bRdJe-X05YA7UQOVffxBjZTourMA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Read HGEIP CSR on the correct cpu
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	guoren@kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_000448_652866_92F42D93 
X-CRM114-Status: GOOD (  18.53  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgNjo1N+KAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIGV4ZWN1dGluZyBrdm1fcmlzY3ZfdmNwdV9haWFfaGFzX2ludGVycnVw
dHMsIHRoZSB2Q1BVIG1heSBoYXZlCj4gbWlncmF0ZWQgYW5kIHRoZSBJTVNJQyBWUy1maWxlIGhh
dmUgbm90IGJlZW4gdXBkYXRlZCB5ZXQsIGN1cnJlbnRseQo+IHRoZSBIR0VJUCBDU1Igc2hvdWxk
IGJlIHJlYWQgZnJvbSB0aGUgaW1zaWMtPnZzZmlsZV9jcHUgKCB0aGUgcENQVQo+IGJlZm9yZSBt
aWdyYXRpb24gKSB2aWEgb25fZWFjaF9jcHVfbWFzaywgYnV0IHRoaXMgd2lsbCB0cmlnZ2VyIGFu
Cj4gSVBJIGNhbGwgYW5kIHJlcGVhdGVkIElQSSB3aXRoaW4gYSBwZXJpb2Qgb2YgdGltZSBpcyBl
eHBlbnNpdmUgaW4KPiBhIG1hbnktY29yZSBzeXN0ZW1zLgo+Cj4gSnVzdCBsZXQgdGhlIHZDUFUg
ZXhlY3V0ZSBhbmQgdXBkYXRlIHRoZSBjb3JyZWN0IElNU0lDIFZTLWZpbGUgdmlhCj4ga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZSBtYXkgYmUgYSBzaW1wbGUgc29sdXRpb24uCj4KPiBG
aXhlczogNGNlYzg5ZGI4MGJhICgiUklTQy1WOiBLVk06IE1vdmUgSEdFSVtFfFBdIENTUiBhY2Nl
c3MgdG8gSU1TSUMgdmlydHVhbGl6YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8
ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
YyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggZmRhMDM0NmYwZWExLi4xNjhj
MDJhZDBhNzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC02ODksOCArNjg5LDEyIEBAIGJvb2wg
a3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2hhc19pbnRlcnJ1cHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICAgICAgICAgICovCj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+
dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAtICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+IC0x
KQo+IC0gICAgICAgICAgICAgICByZXQgPSAhIShjc3JfcmVhZChDU1JfSEdFSVApICYgQklUKGlt
c2ljLT52c2ZpbGVfaGdlaSkpOwo+ICsgICAgICAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ID4gLTEp
IHsKPiArICAgICAgICAgICAgICAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ICE9IHNtcF9wcm9jZXNz
b3JfaWQoKSkKCkdvb2QgY2F0Y2ggISEhCgpJIGFncmVlIHdpdGggR3VvIFJlbi4gV2Ugc2hvdWxk
IHVzZSAidmNwdS0+Y3B1IiBvdmVyIGhlcmUKaW5zdGVhZCBvZiBzbXBfcHJvY2Vzc29yX2lkKCku
IEFsc28sIEkgdGhpbmsgd2Ugc2hvdWxkIGFkZApzb21lIGNvbW1lbnRzIGZvciBmdXR1cmUgcmVm
ZXJlbmNlLiBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMKYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0
aGlzIHBhdGNoLgoKUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9yIExpbnV4LTYuMTgKClRoYW5rcywK
QW51cAoKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSB0cnVlOwo+ICsgICAgICAgICAg
ICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gISEoY3NyX3JlYWQoQ1NS
X0hHRUlQKSAmIEJJVChpbXNpYy0+dnNmaWxlX2hnZWkpKTsKPiArICAgICAgIH0KPiAgICAgICAg
IHJlYWRfdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwo+Cj4g
ICAgICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi41MC4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
