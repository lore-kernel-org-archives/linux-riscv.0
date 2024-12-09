Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8C3E7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QUFDjRczj1+9Uj7KU9PkMzTz+Gmps9aH0E2Ek8TkPQ=; b=oLAEt37WNlUd8N
	RPMry6LK5q00+8ErwUC6SLBQN2ru5wUPXyeOwdO6qyP4hVKPbxtq2QvnXFBR6uG4IJWFgFaqQSIGc
	MtYQ+YOhfmSXKDrIuUC0jTPIYXOkS/ErtK9MP6sT7QCnAabYPJCWAj5XHrMfJkPM4hEOe6Y5Aqs2x
	jSl2qoVSncPVWjjMn2JVfUbuONPne6K1RRy0ia+JbGuLgl4bG98khTcBNI+NRTnSTCnDk6sMfeh8s
	ege7swTOfcTpYBzHZWaUWldXb0d7avRH9jedVILkr/TLs6iPqXd6LscHMsWMxSi3RAZtYw3XB/rdu
	b4+rj9eaJZhsc9Kx9Lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgZi-00000008Y1u-2yLx;
	Mon, 09 Dec 2024 16:25:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgZf-00000008Y0y-3k4y
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 16:25:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2352959f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 08:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733761530; x=1734366330; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L2pxOWI3xrkwAHNRcOrURto35zEibdpN2tF3/Hg076U=;
        b=lU/T/jR9Dt10Jd1caL9QR2mxMH+WKhggV0sM6HPDNWxC9azVJeTRKWUiq1oHaJvr10
         ATLg5AGBiTGsQ0NEmCcUxEnNLT6ZOmOo6CN1pO8BDqcoxJ7ZxBq2TrSaaGUVqJthB9i/
         EnsRU4z7Ga40L+syacoXK1dtoBGt+wCHlNrcWHjt6Guk+DIutsf3w627OiA3wH0v78Mi
         KGKUmHUSVD9w8U9G/G/uU7h3SqjrGEuGDgRlRSzHeyut5PZOkfoUUT3Fx0iWA8wh/6Mm
         1OtLaf4TKGL19vU94i8jgWnS1/XtpKiXm+JNaHy9Ch7ozYmRjLZ5+xGXlk04Ch7g9xqe
         qOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761530; x=1734366330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2pxOWI3xrkwAHNRcOrURto35zEibdpN2tF3/Hg076U=;
        b=HymkqJrnWKkmlSI71FbrKlBjYnQtUhYZWIuPJzUpS+VWo2TRo26nHztZE4N0zffcRj
         BMH5IHpidKdqr3plyXg7ECV+m3hcG9j/sT1x6Ns7xYvew3lyhV0leFhKGartnVbkxlpQ
         EUI/4++qhQah+RXhzOVS6qJgyGllaymOsiywrJqrn5EPeJNjwrW2kgo7tS/OyoOJTA6C
         IGhKSjt8B1DPQQQz/049VYuIKhfARN3+xnfUt70dzPnSWGn7RZNjwK7YW4b84KlfN6jN
         Ivz6BP+etmPkpV7yr87TVB+Yj/Qrnf1dcNs3SWBvhxPUJhRwxQd2RZy8PfOiKvWBB2Dk
         BAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm5oUsSCOtNtexPyasZt7n/9rFW+EjG0HQEQL38iPIVKDf4NSVPBHnrV1nejvHM0Z6pSN4bKronZHmzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXBLWZktc2puPBDRLS31Nj+fsCjzli/J59A2nqYq4hHFo8ZdEW
	J4o5Y8QK+TEO8Tmxyq5aALnZtgOxNqh449UlVbGRWuV6a3L8aUR7eN4ZZgZWzbI=
X-Gm-Gg: ASbGncvN1mEIpux1I6dllo42Wd+YH+zjHzWtrqO+lCwouYhmO+jbAnTh0CrBuDOlaz+
	TStKe+iT9GThQnP0khHUT1vSZg8uNYb2KrX3GWD/UtT02j4sHHkR2ZOb2B617aD9WNqi7saSFPx
	QOiRVYpq4TYil7/+66ct+dziKT33VlV+fafqgapCnSkV2ncvfwEryg+dLU/P2DMDjqkbDjUuN+9
	w6N1FQzuiRMWzlDArKKxnSrc506H1FgCp4CL4ek22g4ljNSwZpQ1Z0C/5gcqx716fTLryf4r8Hg
	VsG1LMG3Eflw
X-Google-Smtp-Source: AGHT+IG0YRY/AI+hYtU/jY/moJvUMH8alDa4Bfs7WysfLm7PTeWvvswR1hSEHB/r4Jz0ywy3oKLk4w==
X-Received: by 2002:a5d:64e6:0:b0:385:f220:f798 with SMTP id ffacd0b85a97d-386453d269dmr814304f8f.6.1733761529729;
        Mon, 09 Dec 2024 08:25:29 -0800 (PST)
Received: from localhost (dialin-242125.rol.raiffeisen.net. [195.254.242.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219096d8sm13826119f8f.78.2024.12.09.08.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:25:29 -0800 (PST)
Date: Mon, 9 Dec 2024 17:25:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v5] riscv: selftests: Fix warnings pointer masking test
Message-ID: <20241209-393e756fd92bdfe890b1d4ae@orel>
References: <20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_082531_931846_EBF62E9E 
X-CRM114-Status: GOOD (  23.05  )
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

T24gRnJpLCBEZWMgMDYsIDIwMjQgYXQgMDk6NTI6MTFBTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IFdoZW4gY29tcGlsaW5nIHRoZSBwb2ludGVyIG1hc2tpbmcgdGVzdHMgd2l0aCAt
V2FsbCB0aGlzIHdhcm5pbmcKPiBpcyBwcmVzZW50Ogo+IAo+IHBvaW50ZXJfbWFza2luZy5jOiBJ
biBmdW5jdGlvbiDigJh0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGzigJk6Cj4gcG9pbnRlcl9t
YXNraW5nLmM6MjAzOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3Jp
dGXigJkKPiBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkg
Wy1XdW51c2VkLXJlc3VsdF0KPiAgIDIwMyB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEs
IDApOyB8Cj4gICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5j
OjIwODo5OiB3YXJuaW5nOgo+IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkg
ZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUKPiDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51
c2VkLXJlc3VsdF0KPiAgIDIwOCB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+
IAo+IEkgY2FtZSBhY3Jvc3MgdGhpcyBvbiByaXNjdjY0LWxpbnV4LWdudS1nY2MgKFVidW50dQo+
IDExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCj4gCj4gRml4IHRoaXMgYnkgY2hlY2tpbmcgdGhhdCB0
aGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gZXF1YWwgdGhlIGV4cGVjdGVkCj4gbnVtYmVyIG9m
IGJ5dGVzIHdyaXR0ZW4uCj4gCj4gRml4ZXM6IDc0NzBiNWFmZDE1MCAoInJpc2N2OiBzZWxmdGVz
dHM6IEFkZCBhIHBvaW50ZXIgbWFza2luZyB0ZXN0IikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjU6Cj4g
LSBObyBsb25nZXIgc2tpcCBzZWNvbmQgcHdyaXRlIGlmIGZpcnN0IG9uZSBmYWlscwo+IC0gVXNl
IHdyYXBwZXIgZnVuY3Rpb24gaW5zdGVhZCBvZiBnb3RvIChEcmV3KQo+IC0gTGluayB0byB2NDog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNS1maXhfd2FybmluZ3NfcG9pbnRlcl9t
YXNraW5nX3Rlc3RzLXY0LTEtMGM3N2ViNzI1NDg2QHJpdm9zaW5jLmNvbQo+IAo+IENoYW5nZXMg
aW4gdjQ6Cj4gLSBTa2lwIHN5c2N0bF9lbmFibGVkIHRlc3QgaWYgZmlyc3QgcHdyaXRlIGZhaWxl
ZAo+IC0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNS1maXhf
d2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rlc3RzLXYzLTEtNWMyOGIwZjk2NDBkQHJpdm9zaW5j
LmNvbQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBGaXggc3lzY3RsIGVuYWJsZWQgdGVzdCBjYXNl
IChEcmV3L0FsZXgpCj4gLSBNb3ZlIHB3cml0ZSBlcnIgY29uZGl0aW9uIGludG8gZ290byAoRHJl
dykKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4
X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12Mi0xLTFiZjBjNTA5NWY1OEByaXZvc2lu
Yy5jb20KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gSSBoYWQgcmV0ICE9IDIgZm9yIHRlc3Rpbmcs
IEkgY2hhbmdlZCBpdCB0byBiZSByZXQgIT0gMS4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0
cy12MS0xLWVhMWU5NjY1Y2U3YUByaXZvc2luYy5jb20KPiAtLS0KPiAgLi4uL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYyAgfCAyMiArKysrKysrKysrKysrKysr
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9p
bnRlcl9tYXNraW5nLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRl
cl9tYXNraW5nLmMKPiBpbmRleCBkZWU0MWI3ZWUzZTMuLjUwYzRkMWJjNzU3MCAxMDA2NDQKPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMK
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5n
LmMKPiBAQCAtMTg1LDggKzE4NSwyMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ZvcmtfZXhlYyh2b2lk
KQo+ICAJfQo+ICB9Cj4gIAo+ICtzdGF0aWMgYm9vbCBwd3JpdGVfd3JhcHBlcihpbnQgZmQsIHZv
aWQgKmJ1Ziwgc2l6ZV90IGNvdW50LCBjb25zdCBjaGFyICptc2cpCj4gK3sKPiArCWludCByZXQg
PSBwd3JpdGUoZmQsIGJ1ZiwgY291bnQsIDApOwo+ICsKPiArCWlmIChyZXQgIT0gY291bnQpIHsK
PiArCQlrc2Z0X3BlcnJvcihtc2cpOwo+ICsJCXJldHVybiBmYWxzZTsKPiArCX0KPiArCXJldHVy
biB0cnVlOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNj
dGwodm9pZCkKPiAgewo+ICsJY2hhciAqZXJyX3B3cml0ZV9tc2cgPSAiZmFpbGVkIHRvIHdyaXRl
IHRvIC9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlzYWJsZWRcbiI7Cj4gIAljaGFyIHZhbHVl
Owo+ICAJaW50IGZkOwo+ICAKPiBAQCAtMjAwLDE0ICsyMTIsMTIgQEAgc3RhdGljIHZvaWQgdGVz
dF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZvaWQpCj4gIAl9Cj4gIAo+ICAJdmFsdWUgPSAnMSc7
Cj4gLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gLQlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90
YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gLUVJTlZBTCwKPiAtCQkJICJzeXNj
dGwgZGlzYWJsZWRcbiIpOwo+ICsJaWYgKCFwd3JpdGVfd3JhcHBlcihmZCwgJnZhbHVlLCAxLCAi
d3JpdGUgJzEnIikpCj4gKwkJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKGVycl9wd3JpdGVfbXNnKTsK
PiAgCj4gIAl2YWx1ZSA9ICcwJzsKPiAtCXB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiAtCWtz
ZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAw
LAo+IC0JCQkgInN5c2N0bCBlbmFibGVkXG4iKTsKPiArCWlmICghcHdyaXRlX3dyYXBwZXIoZmQs
ICZ2YWx1ZSwgMSwgIndyaXRlICcwJyIpKQo+ICsJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbChlcnJf
cHdyaXRlX21zZyk7Cj4gIAo+ICAJc2V0X3RhZ2dlZF9hZGRyX2N0cmwoMCwgZmFsc2UpOwo+ICAK
PiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4
ZWNmMGIzNwo+IGNoYW5nZS1pZDogMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2lu
Z190ZXN0cy0zODYwZTRmMzU0MjkKPiAtLSAKPiAtIENoYXJsaWUKPgoKUmV2aWV3ZWQtYnk6IEFu
ZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CgpUaGFua3MsCmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
