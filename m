Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11934C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDWr10LYGEeh2dJ73aMFvvJF/F4Scxf4C60Xl/yIE4w=; b=C1MlxxzBwN3rL4
	dnCmcInT8aNJsDpkSjl5vTHAo0L70s2sILdkI95ARHqBbc0usTaxoGi7d3aFJXnabaktlfP3eLLf8
	/qXMidQJ3ootSCVEhkQUqCPM3HkwA+Egoo3G/14LXSuHEFr2Tm1c+8sogL/6+REA1cS4JVPUSMDIz
	ix7q0mUAdmVvyd8o5Jv8QT2imPtYzoKSpLpcTRllE5nWx08MrGxpr/sUCLiv/5zEOSzQAMIYbYGOz
	2Mvxw4sg5qmnSloMUUR0e1tRfbT/2V3P947+7c0h4mrgylJHrtrhtk9hxD6yoAjuPbtyRxIVB2f6D
	cxWQ+0MORfmdLGeA5EUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82cU-0000000FFCK-1h3Y;
	Thu, 24 Apr 2025 19:52:26 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TA-0000000Eumb-0o2T
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-30828fc17adso1359291a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516079; x=1746120879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH77kPPOP+qp5pa2Cr8pgAGSaFmjEWdE92nKDczco64=;
        b=nXhMy+mU1cG+qFEGV6py1bJton3tWlj3YVrWKCij5H2X9IdaTLvNBs6eRhCuSBi7Iu
         VkZyc0XFr3qOljSnYlYJniT+TEgFcgyF9N/AokYetA8/6zwjXDGiMun9BKSo4MXJdj0i
         vvTKHy4GGMNFq46khhoNLRfHhdI8yMDheVUUrMEuAwihBK5zRgzRjU3WNWtHxf/n1PoU
         G9Q053YhZ8PjbNhboesWW0laVdxZXIuteiCpc3PhavJ1QEO/beXSEpmU/XapsgwQkaAX
         DBzb339Rr1jI0Kf+th+Aq2O6fvHeCg99M+XJwC7VEOeY6dxzVIGmMrnCC4G8lkTqJCUZ
         +5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516079; x=1746120879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH77kPPOP+qp5pa2Cr8pgAGSaFmjEWdE92nKDczco64=;
        b=ABnbNycDRFFcvZ99vZjvmxgyM31CWb8DehhzQO8CjijGOPtCfNPUzM/TZSOrp/UBB4
         ewyheqh5GAOCpMhgBSavDVx5ctEUkU0dEbaGKQao45sx39gs1Whe8jP3QD2XRFpKM9SP
         +2XSxd6ea0exvdll6MaDC1mylNimqmb+AuoWcaFpkM1nPcK/fB9qb8xq1dlS3L7PYIHA
         Rjtf3/6f9vmD3OQY+weddXsGzUd6QShAYYYeumtf/YAlc1EAOCpkBs+sKUTmQyhi2Dfg
         HTXmOim1rT4g/KQgNzOdo0PhQBnVG0V9BzMu+oZFo0C87lT3rl5twHyH8ESLUjB+RmHj
         eVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNsxN78qajF/59zsH9v3hE18SCwIJ3JjuwY7Qs8hPZgeSundwB0CzAktzHqpg737uPhy9CkICBRP3SZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIeqVJXeGC7cBzvrWb23CM66L9S7PvZ5+jn0OBD4Zh2wJPz8l9
	C5q0PfaGeJT/z4J6EW+3ypMsfiwrtmc470Ya0PunkBzx2FDY479RRov+ySS9EPs=
X-Gm-Gg: ASbGnct6V0v8hrctFDvrfSlZvyqDpuUDsKlYCuJzpDLUXH/P4d8tQsM0h3KLNMtiEfX
	Npyg4gtQnTk83JNM8Gh1MLHZFkq7+ElNvD0OrF9/8H83Oa77ptLsPMzSm6a5sJu1f6iDMIyI3kU
	8jSpsujxwSlGnTrdaLTdBQGLLIRZ9ZoczQH4ZdSWEJs3MD/Nm8BqeOqwiExqX+0bQOsCgMNCqkl
	Ag4VEhm4D7bI7xlP9ie8PWne9nU6l1Kc0/okxX6KskvZxReGK4KESwCrbWwhDvy/KoFNQ4yHBxT
	DTXSQFxzC0CxJH0ytaRnXAQQEZuXHu0FMQT9ew2Qrw==
X-Google-Smtp-Source: AGHT+IFi4Le7AzhhmTTIRr2FvD3j5KIgFxeLHXA7hAgbxEuSLsG1Fq72dIzoCsCCWJEHQANRW1hXVg==
X-Received: by 2002:a17:90b:1d4f:b0:2ee:f22a:61dd with SMTP id 98e67ed59e1d1-309f56fa88cmr642762a91.32.1745516079316;
        Thu, 24 Apr 2025 10:34:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 24 Apr 2025 19:31:54 +0200
Message-ID: <20250424173204.1948385-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103440_222252_A16E8CD9 
X-CRM114-Status: GOOD (  11.71  )
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

c2NoZWR1bGVfb25fZWFjaF9jcHUoKSB3YXMgdXNlZCB3aXRob3V0IGFueSBnb29kIHJlYXNvbiB3
aGlsZSBkb2N1bWVudGVkCmFzIHZlcnkgc2xvdy4gVGhpcyBjYWxsIHdhcyBpbiB0aGUgYm9vdCBw
YXRoLCBzbyBiZXR0ZXIgdXNlCm9uX2VhY2hfY3B1KCkgZm9yIHNjYWxhciBtaXNhbGlnbmVkIGNo
ZWNraW5nLiBWZWN0b3IgbWlzYWxpZ25lZCBjaGVjawpzdGlsbCBuZWVkcyB0byB1c2Ugc2NoZWR1
bGVfb25fZWFjaF9jcHUoKSBzaW5jZSBpdCByZXF1aXJlcyBpcnFzIHRvIGJlCmVuYWJsZWQgYnV0
IHRoYXQncyBsZXNzIG9mIGEgcHJvYmxlbSBzaW5jZSB0aGlzIGNvZGUgaXMgcmFuIGluIGEga3Ro
cmVhZC4KQWRkIGEgY29tbWVudCB0byBleHBsaWNpdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRl
eCA2YmI3MzRhYmY5YTQuLmUxZmUzOWNjNjcwOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtNjEwLDYgKzYxMCwxMCBAQCBib29sIF9faW5pdCBjaGVja192ZWN0b3JfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogewogCWludCBjcHU7CiAKKwkv
KgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVsZV9vbl9l
YWNoX2NwdSgpIGlzIHVzZWQgc2luY2UKKwkgKiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0
cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpCisJICovCiAJc2NoZWR1bGVf
b25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQpOwogCiAJ
Zm9yX2VhY2hfb25saW5lX2NwdShjcHUpCkBAIC02MzAsNyArNjM0LDcgQEAgYm9vbCBfX2luaXQg
Y2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAog
c3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5OwogCi1zdGF0aWMgdm9pZCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBf
X2Fsd2F5c191bnVzZWQpCitzdGF0aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkKHZvaWQgKmFyZyBfX2Fsd2F5c191bnVzZWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKIAlsb25nICptYXNfcHRyID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNz
X3NwZWVkLCBjcHUpOwpAQCAtNjcxLDcgKzY3NSw3IEBAIGJvb2wgX19pbml0IGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRl
ZCBzaW5jZSB0YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAq
IENQVS4KIAkgKi8KLQlzY2hlZHVsZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKTsKKwlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
LCBOVUxMLCAxKTsKIAogCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdSht
aXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
