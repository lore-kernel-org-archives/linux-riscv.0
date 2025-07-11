Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A218C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IysNGJmIV5F39ym5dB7n3GFN9TohQlVQPs4nVKpQ7Is=; b=DDiyafo/rw4yQD
	X/83N9NG1n4t145naFr70PcFX0akUW6cujrq1ibh6yVG+NcMMbwphf/farynjxo3atYIE4LbIDeA/
	sDs3MEapWLLOsWIJdb1Tr64gDHeH1tjr2iXr6cqI48HSQNPbHZ6Fq3eaL6CFf4emsOeeKSgJe0pqU
	+HSQFRekaDWGUqAnKoUWClqDNt1W1uEa7cWY2nVNl/uHb6KuXiXF3iOX7a8TKigfwLkkPvty+bcS/
	siqGm7naG4Rq1DubLBP+79VCKrx4J6y+mCwrfZ93zZPEQvtey/oDLbfaqY8VV6+mWa0mDfWQc3nGA
	UcEQR1a9iOqyu4m5eD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBgF-0000000EZP9-3qAm;
	Fri, 11 Jul 2025 11:12:39 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAZ1-0000000EPsO-2Kvw
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:01:08 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so2852267a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752228065; x=1752832865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omyblvVpTb38AizFlaRpVve2Yn1R+eSTb0zPNz8hz+w=;
        b=e/w1jo2RlePS5bDS8C5q1c1WplausoxzUkhPen3ywmJ/bqs1c9JADKBJ/IaJIRI8Ql
         3+LfI+DUD1f8p/RkPQlGnKynpCi7LviiQfrOXZF20LM3rUT54Y/5ySAkMGUwncBgzRgi
         psQFwAN1+jGmzqsk9Maa+f7H69QUMcoLmkUbLdI8ioGIwbrKfqKsqow21tn1t/c1bUPX
         pjM8LqWr2dAEHSvGrJdDrNait8ieCjrx5L7kYthcFSQEXh3LxqR7xGPeaA3wYVVX3Rxw
         j1ln3iSXQmn5KouFqKIGzjlP3yx3Bgd+NqDzjKQ6Ld/G5SYE+X3Ns4sd4NMm7Lo0eMUy
         mshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228065; x=1752832865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omyblvVpTb38AizFlaRpVve2Yn1R+eSTb0zPNz8hz+w=;
        b=piq82CIU5BA53pIFa/3tsozbE5Saa8z4XrUh48qCBjtOzVQMnGjM0oKe3god/y+ZHR
         O3NKE+8tKhoRrLPWe677CIZpIQ2aqHmoUhuSPHxm4ZCHaJfCY0mxOyx++zf2fi0uRIub
         sC9iWdQkILWHDZDMYFnMKnGnbGq0OBqY8U38a8AwoVaG8eMqGLoyLFSdnQJVTJAihAnC
         8l9IY8nJlwzYt9eAk5nnUQ5VCFNaYul+7RWnJ4BILI7HpxV+wbV0QBO5i5a0eqtrJ/qd
         Hqza4UQLiw5Eys+ImpinSPk1Fme4L2j97tGEm14MbdD9J04TRIrQUdTCangjLZmR+xWo
         Q4cA==
X-Forwarded-Encrypted: i=1; AJvYcCUDC/sNjYHNLNfho3V5sE1w3MNdmd1n/KAgaxxv4AfAyUu0rwGMdty0BAtuuwyKkgTX8tyv4WNA0C2SKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG2u7j25HPVtkrDvVhWj9bzqhVmX8CeqK/HLX4fSPjpJGpViDQ
	hk7kS8uK+zfPefN4xXlENoQigym6WMbuB6mCw4fppYA+eb1NlT6Mw6Pcd+bKANw16SkrMYuPtpz
	2z9isfo+LU2YfsI4NOsVnW4/q8zSVqgc=
X-Gm-Gg: ASbGnctLWnLDLfA9M+QXtHUMdILuEaYPnYrDjDI13GjviDxcTQ5cKthMXX7zCVsDkJk
	c7FgJ5ek7Yu+pcwMYa6GuZifO4rdW2NCAlzQ8YzR8/7Tozz7env5eUYPhL5Qklyy40mlygUJAxZ
	Xm9TE/bBtx/Ws4vUFTPtaWjpzEHQM0Ih4TCSQWha3j42KL+LH34FSMuEodAORK0TBh310KDMHW1
	UFnlQ==
X-Google-Smtp-Source: AGHT+IH6/qM6p9/RL4gGjutDzuH70Bym/Rj8wG0AwwKyB95laFU6RGGzgMZDomgQ58EICecTg0oNC3IN9s9bePDyCLM=
X-Received: by 2002:a05:6402:34d5:b0:607:26b4:6959 with SMTP id
 4fb4d7f45d1cf-611e760a9c0mr2223799a12.7.1752228064976; Fri, 11 Jul 2025
 03:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
In-Reply-To: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 11 Jul 2025 18:00:52 +0800
X-Gm-Features: Ac12FXyaJKrR-9Ah14lDbFtYFAfCE9b58o7FuUmW9mz6wqCA0xjHLslJFwJa4LU
Message-ID: <CAFTtA3OMVwC14t4R65oSWotv0Nx5q0Rpbb_9xHNEkBgN9AoYoQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a race condition
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Yao Zi <ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_030107_594700_58551167 
X-CRM114-Status: GOOD (  17.72  )
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

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCA0OjQ34oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEFzIHJlcG9ydGVkIGJ5IGxvY2tkZXAsIHNvbWUg
cGF0Y2hpbmcgd2FzIGRvbmUgd2l0aG91dCBhY3F1aXJpbmcKPiB0ZXh0X211dGV4LCBzbyB0aGVy
ZSBjb3VsZCBiZSBhIHJhY2Ugd2hlbiBtYXBwaW5nIHRoZSBwYWdlIHRvIHBhdGNoCj4gc2luY2Ug
d2UgdXNlIHRoZSBzYW1lIGZpeG1hcCBlbnRyeS4KPgo+IFJlcG9ydGVkLWJ5OiBIYW4gR2FvIDxy
YWJlbmRhLmNuQGdtYWlsLmNvbT4KPiBSZXBvcnRlZC1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlr
YW5nQGlzY2FzLmFjLmNuPgo+IFJlcG9ydGVkLWJ5OiBZYW8gWmkgPHppeWFvQGRpc3Jvb3Qub3Jn
Pgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYUdPRE1wcTdU
R0lOZGR6TUBwaWUubGFuLwo+IFRlc3RlZC1ieTogWWFvIFppIDx6aXlhb0BkaXNyb290Lm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+Cgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyB8IDE2ICsrKysrKysrKysrKy0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2Uu
Ywo+IGluZGV4IDRjNmMyNDM4MGNmZDlkNmM1MWYwZTQzNDBjZDY3NDE2MGI4M2E2MTAuLjIyZTdi
ZGY4ZGUyYjZjYTk1MGNmMmM4YjczNGJjODJlYTQ2YmE4YmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvZnRyYWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+
IEBAIC0xNCw2ICsxNCwxNiBAQAo+ICAjaW5jbHVkZSA8YXNtL3RleHQtcGF0Y2hpbmcuaD4KPgo+
ICAjaWZkZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNFCj4gK3ZvaWQgZnRyYWNlX2FyY2hfY29kZV9t
b2RpZnlfcHJlcGFyZSh2b2lkKQo+ICt7Cj4gKyAgICAgICBtdXRleF9sb2NrKCZ0ZXh0X211dGV4
KTsKPiArfQo+ICsKPiArdm9pZCBmdHJhY2VfYXJjaF9jb2RlX21vZGlmeV9wb3N0X3Byb2Nlc3Mo
dm9pZCkKPiArewo+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZ0ZXh0X211dGV4KTsKPiArfQo+ICsK
PiAgdW5zaWduZWQgbG9uZyBmdHJhY2VfY2FsbF9hZGp1c3QodW5zaWduZWQgbG9uZyBhZGRyKQo+
ICB7Cj4gICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9D
QUxMX09QUykpCj4gQEAgLTI5LDEwICszOSw4IEBAIHVuc2lnbmVkIGxvbmcgYXJjaF9mdHJhY2Vf
Z2V0X3N5bWFkZHIodW5zaWduZWQgbG9uZyBmZW50cnlfaXApCj4KPiAgdm9pZCBhcmNoX2Z0cmFj
ZV91cGRhdGVfY29kZShpbnQgY29tbWFuZCkKPiAgewo+IC0gICAgICAgbXV0ZXhfbG9jaygmdGV4
dF9tdXRleCk7Cj4gICAgICAgICBjb21tYW5kIHw9IEZUUkFDRV9NQVlfU0xFRVA7Cj4gICAgICAg
ICBmdHJhY2VfbW9kaWZ5X2FsbF9jb2RlKGNvbW1hbmQpOwo+IC0gICAgICAgbXV0ZXhfdW5sb2Nr
KCZ0ZXh0X211dGV4KTsKPiAgICAgICAgIGZsdXNoX2ljYWNoZV9hbGwoKTsKPiAgfQo+Cj4gQEAg
LTE0OSw2ICsxNTcsOCBAQCBpbnQgZnRyYWNlX2luaXRfbm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwg
c3RydWN0IGR5bl9mdHJhY2UgKnJlYykKPiAgICAgICAgIHVuc2lnbmVkIGludCBub3BzWzJdLCBv
ZmZzZXQ7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gKyAgICAgICBndWFyZChtdXRleCkoJnRleHRf
bXV0ZXgpOwo+ICsKPiAgICAgICAgIHJldCA9IGZ0cmFjZV9yZWNfc2V0X25vcF9vcHMocmVjKTsK
PiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gQEAgLTE1
Nyw5ICsxNjcsNyBAQCBpbnQgZnRyYWNlX2luaXRfbm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3Ry
dWN0IGR5bl9mdHJhY2UgKnJlYykKPiAgICAgICAgIG5vcHNbMF0gPSB0b19hdWlwY190MChvZmZz
ZXQpOwo+ICAgICAgICAgbm9wc1sxXSA9IFJJU0NWX0lOU05fTk9QNDsKPgo+IC0gICAgICAgbXV0
ZXhfbG9jaygmdGV4dF9tdXRleCk7Cj4gICAgICAgICByZXQgPSBwYXRjaF9pbnNuX3dyaXRlKCh2
b2lkICopcGMsIG5vcHMsIDIgKiBNQ09VTlRfSU5TTl9TSVpFKTsKPiAtICAgICAgIG11dGV4X3Vu
bG9jaygmdGV4dF9tdXRleCk7Cj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IC0tLQo+
IGJhc2UtY29tbWl0OiBkN2I4ZjhlMjA4MTNmMDE3OWQ4ZWY1MTk1NDFhMzUyN2U3NjYxZDNhCj4g
Y2hhbmdlLWlkOiAyMDI1MDcwOC1hbGV4LWZpeGVzLTFlNzE5Yjk4OTlmMwo+Cj4gQmVzdCByZWdh
cmRzLAo+IC0tCj4gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
