Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3162EC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqORkOGnLnXQM4yO0jaIfh3VlB1N/os3R6EKGaUSzh4=; b=SwfqKFbcvet38d
	25hCKb+3VQ6zKDee7ozqUYfawMOYj6ZeTMEWSWEhfEA84+NflwSv/1ksLzemWtyBvopKBgtkdpV7A
	Wosphp8YDQjvzi+/OwuBm7zwckGYE0/gQTwtpABqCMkf8T+SW6WF5rIq/GNGO7343NQtwjXwwk8cO
	kjScyVkfm/8JdR6drSam97wCNpQi5gf0cJmlGFpk0E3F2Hj3aOU7aeyYCR71pNx0CkdUD/AvPaOKf
	aXwWQO6RJNXlp1C0zyEfs8/bTIOe0YtryMrJVO0xO6JKFJ50hbEXEzTzKCPQub+bvXGojasmqL+cN
	STjmuDEdSgOslRmeKwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRfN-004Kqz-1c;
	Fri, 28 Jul 2023 17:54:17 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRfL-004Kpr-1d
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 17:54:16 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-348c7075afcso6625ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690566854; x=1691171654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9AAgjBmyD799jjvKnH8ZnrCuWVbFIsU8j6BR3fo8nI=;
        b=IFMJ07Jo5MYfc9jdSIkyL82QFEQawGu9euKN/ce2G+5PIx7+8KWxnLSHh3Gx9HO21J
         4w8Kpw2y8qhWKSAJInH+bR9CThehc0Y7cOfD+MTByzzM/5BLVWzh1IWBCm/iBaBgTh9R
         TTGw3M5cIz6sGBFiX5FYij5Ev94R6UNdOAlIZWq+34Lb76z+T791T2SSNcp3mkHi5WMK
         FmTcRrU4bNODUY54dsMvzb7wYn9nWETgzSbQS6mazUnuxsTBfk0AqYpSf97+JPE0qmcJ
         HG8wpPiIfPRYEyB3j1d+PjRP6zV+9iqjFl8ilKpJ0Z0I/T19cOCa8S70OzmDe2qXRkmr
         460w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690566854; x=1691171654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9AAgjBmyD799jjvKnH8ZnrCuWVbFIsU8j6BR3fo8nI=;
        b=fV/wH56y0orZRM0+L6GaE3IBnEx7sC5C3RVtSeKZpvJGPkRPAae/RupkX3n+dRVZet
         jGxsbX4W3GZr81l77g/+i0HPv3byaD94cnsx91/hwzd2Yyc2WmrN/GG055G0BNgUwb8P
         jUsW0P5HGEVefGjUJu2ZQLRKw1vUs/d6e0khzIkM5HJd/GeH7m3mskeAHMZL3bbIDLn1
         JyGuUwlfEYNInvdffEP7mRIDWr93Yh9QxACA1bZZlptliLVan86xsX0VFMxUR+v8CA+n
         S44HNE9zaPeqQYArUFyIi32e/AWpAi5qdbCazPTAUCmeHH3ALLa5T1+MPcbxqpGsshXX
         lL4g==
X-Gm-Message-State: ABy/qLZbU9W525+nwKDsqEwMyq/T6XyuJMEpAVhhoodfUhNqTzAOM+VD
	MSMOLpx6whryUnRmRbW/fRld1JIPwH5aGhFmtwVdPw==
X-Google-Smtp-Source: APBJJlH/oBIkVtQyGOMeYkPz/oJFbJ6Z643p7i54IVii3VDnaU3OEiAeI27Lip+S4Yd4zw51VVx8Ytw/k/UXxrnWNE0=
X-Received: by 2002:a05:6e02:156d:b0:348:d8e1:50c2 with SMTP id
 k13-20020a056e02156d00b00348d8e150c2mr11186ilu.15.1690566853890; Fri, 28 Jul
 2023 10:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com> <20230727141428.962286-11-alexghiti@rivosinc.com>
In-Reply-To: <20230727141428.962286-11-alexghiti@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 28 Jul 2023 10:54:02 -0700
Message-ID: <CAP-5=fXvqJk9hA51pDSXodEWSP4DzN+RJ1scpyzJOrxk2w5kjg@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_105415_543993_CBF046B3 
X-CRM114-Status: GOOD (  15.56  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNzozMOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiByaXNjdiBub3cgc3VwcG9ydHMgbW1hcGluZyBo
YXJkd2FyZSBjb3VudGVycyB0byB1c2Vyc3BhY2Ugc28gYWRhcHQgdGhlIHRlc3QKPiB0byBydW4g
b24gdGhpcyBhcmNoaXRlY3R1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgo+IC0tLQo+ICB0b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jIGIvdG9vbHMvcGVy
Zi90ZXN0cy9tbWFwLWJhc2ljLmMKPiBpbmRleCBlNjhjYTYyMjk3NTYuLmY1MDc1Y2E3NzRmOCAx
MDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+ICsrKyBiL3Rvb2xz
L3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jCj4gQEAgLTI4NCw3ICsyODQsNyBAQCBzdGF0aWMgc3Ry
dWN0IHRlc3RfY2FzZSB0ZXN0c19fYmFzaWNfbW1hcFtdID0gewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAicGVybWlzc2lvbnMiKSwKPiAgICAgICAgIFRFU1RfQ0FTRV9SRUFTT04oIlVzZXIg
c3BhY2UgY291bnRlciByZWFkaW5nIG9mIGluc3RydWN0aW9ucyIsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIG1tYXBfdXNlcl9yZWFkX2luc3RyLAo+IC0jaWYgZGVmaW5lZChfX2kzODZfXykg
fHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQo+ICsjaWYgZGVm
aW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2
NF9fKSB8fCBfX3Jpc2N2X3hsZW4gPT0gNjQKClNhbWUgY29tbWVudCByZWxhdGluZyB0byB0aGUg
Z3VhcmQsIHdoeSBub3QgZGVmaW5lZChfX3Jpc2N2KSA/CgpUaGFua3MsCklhbgoKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgInBlcm1pc3Npb25zIgo+ICAjZWxzZQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAidW5zdXBwb3J0ZWQiCj4gQEAgLTI5Miw3ICsyOTIsNyBAQCBzdGF0aWMgc3Ry
dWN0IHRlc3RfY2FzZSB0ZXN0c19fYmFzaWNfbW1hcFtdID0gewo+ICAgICAgICAgICAgICAgICAp
LAo+ICAgICAgICAgVEVTVF9DQVNFX1JFQVNPTigiVXNlciBzcGFjZSBjb3VudGVyIHJlYWRpbmcg
b2YgY3ljbGVzIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgbW1hcF91c2VyX3JlYWRfY3lj
bGVzLAo+IC0jaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBk
ZWZpbmVkKF9fYWFyY2g2NF9fKQo+ICsjaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChf
X3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKSB8fCBfX3Jpc2N2X3hsZW4gPT0gNjQK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgInBlcm1pc3Npb25zIgo+ICAjZWxzZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAidW5zdXBwb3J0ZWQiCj4gLS0KPiAyLjM5LjIKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
