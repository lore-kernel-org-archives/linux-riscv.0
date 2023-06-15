Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3B4EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNP0pjLOrHTXJZpZeT2DNcadinpPXunW4vMCnc0wvLc=; b=3OOICl26Q78z6V
	DDr+CwbHk3P+EMpYFXzJ36EWrRUEpekH0SUsgFiVRBgkRUgGjyBTXasJcJngdZihrtXCfbrPCtZy/
	ll85tViJ0uUtHv6A3QdFSn5NAnCNAOg1ItmFyfSKHGTqEjYiRoFZbA7j3/ZYVyXhHb0PQUuy8gAca
	p5gXtIjtNTV3OyhkyqRRIjZL/1JJmzbrqX2pgaWesgOcQAk///mQBllPPV4j+GvzIpnIiH//PlNuw
	n0/xxv2W5laPkpWmtIc1o0RxQ2jh7PgOkAkyeSwgiBT5UrtEfmEv9c3RPOaem7rYwiET1SZEsWwRO
	3BxZu/dnYcJBzpEG4lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iR1-00EB0E-2f;
	Thu, 15 Jun 2023 08:34:27 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iQy-00EAyJ-0T
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 08:34:26 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b43a99c887so9061611fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686818062; x=1689410062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOUuXh6LkHViNleXIOakwtRWdQ9JIjITkUXKZrXdE44=;
        b=dsFsxX9NzLHxh8ziw/gPNEVf2K7Iiy/Q308RAWmRpFaYqIQJ1r5328jelF+drS0JS2
         +2hKkC13N/IuU48umjqUbsFQwa0tGqHeuulBLsC34FvZRp39kpROk+zItB1aZtjKli6H
         douxZUHkvyYCrvyNZqPjqVgd7R+ClO2B1t5FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818062; x=1689410062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOUuXh6LkHViNleXIOakwtRWdQ9JIjITkUXKZrXdE44=;
        b=LUb1YVweg4pMDk6LdIoRj6dPGf5OLqIHjwGI0TRpJRP8xRAH3PJn6bgArQnXEudeUa
         OQTm2iElKK+7+lO+vLRRwzBfzvE00kC3jx+0tv3QQ3BxfbD5LaQQxi+xbptNXJW4xb93
         0qAPpXci24lz+Jari81Q1rQeid62xqqzkb0LGV7/7ISHylDNnlvfst18poENdn7RpSRk
         KdcvQ1uUESLZwV0XGomONY6Tgl4GDLeznlGBXX2jAMnDHCcqHHllyN1PgppDV7VtoD54
         AoCnoZdYidIqyJpTIv4MeqGgDlrMFM0XUwu9UEn6cJJOX+Je4f+zJt4FPetXKZ3ivEl7
         hRyw==
X-Gm-Message-State: AC+VfDwWWcVl4X7MNQmxaOfLAQUKDb3N1NV/OqVH3K9Re8IM5s/Iae8d
	1HIiIRaX6UjWw2+qdL0lgg3WF/Rx/dvlQymMkRg2
X-Google-Smtp-Source: ACHHUZ7Re7eG1GNlDD8M+Z7LAqeY4hwZD9akdA2bTvqq2esGdprdeu7d9Y69jONfiP1qhBujHcI2VjHNjyziGs1ljxE=
X-Received: by 2002:a2e:7c15:0:b0:2b1:d6bf:d8b2 with SMTP id
 x21-20020a2e7c15000000b002b1d6bfd8b2mr9598864ljc.22.1686818061744; Thu, 15
 Jun 2023 01:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-5-alexghiti@rivosinc.com> <20230531-49ed4c2054db0abbacd03632@orel>
 <6d9fefd9-472c-b8d3-d871-b81bfdbe4f6d@ghiti.fr>
In-Reply-To: <6d9fefd9-472c-b8d3-d871-b81bfdbe4f6d@ghiti.fr>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 15 Jun 2023 01:34:10 -0700
Message-ID: <CAOnJCUJhfzotL5ErjCKTfGjH2kw5W-e6VdwR37KZa-N_M9NDBQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drivers: perf: Rename riscv pmu driver
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_013424_189250_7E322641 
X-CRM114-Status: GOOD (  22.72  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTI6MjXigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4KPiBPbiAzMS8wNS8yMDIzIDE2OjA5LCBBbmRyZXcgSm9uZXMg
d3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMDo1MzoxNUFNICswMjAwLCBBbGV4
YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPj4gSW4gYWRkaXRpb24gdG8gYmVpbmcgbW9yZSBwcmV0dHks
IGl0IHdpbGwgYmUgdXNlZnVsIGluIHVwY29taW5nIGNvbW1pdHMKPiA+PiB0byBkaXN0aW5ndWlz
aCB0aG9zZSBwbXUgZHJpdmVycyBmcm9tIHRoZSBvdGhlciBwbXUgZHJpdmVycy4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
PiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgfCAyICstCj4g
Pj4gICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jICAgIHwgMiArLQo+ID4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfbGVnYWN5LmMKPiA+PiBpbmRleCAwZDhjOWQ4ODQ5ZWUuLmZmZTA5ZDg1NzM2NiAx
MDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4gPj4gKysr
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYwo+ID4+IEBAIC05NSw3ICs5NSw3IEBA
IHN0YXRpYyB2b2lkIHBtdV9sZWdhY3lfaW5pdChzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUpCj4gPj4g
ICAgICBwbXUtPmN0cl9jbGVhcl9pZHggPSBOVUxMOwo+ID4+ICAgICAgcG11LT5jdHJfcmVhZCA9
IHBtdV9sZWdhY3lfcmVhZF9jdHI7Cj4gPj4KPiA+PiAtICAgIHBlcmZfcG11X3JlZ2lzdGVyKCZw
bXUtPnBtdSwgImNwdSIsIFBFUkZfVFlQRV9SQVcpOwo+ID4+ICsgICAgcGVyZl9wbXVfcmVnaXN0
ZXIoJnBtdS0+cG11LCBSSVNDVl9QTVVfTEVHQUNZX1BERVZfTkFNRSwgUEVSRl9UWVBFX1JBVyk7
Cj4gPj4gICB9Cj4gPj4KPiA+PiAgIHN0YXRpYyBpbnQgcG11X2xlZ2FjeV9kZXZpY2VfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+PiBp
bmRleCA3MGNiNTBmZDQxYzIuLjNiMGVlMjE0ODA1NCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJz
L3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwo+ID4+IEBAIC04OTcsNyArODk3LDcgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+ICAgICAgaWYgKHJldCkKPiA+
PiAgICAgICAgICAgICAgZ290byBvdXRfdW5yZWdpc3RlcjsKPiA+Pgo+ID4+IC0gICAgcmV0ID0g
cGVyZl9wbXVfcmVnaXN0ZXIoJnBtdS0+cG11LCAiY3B1IiwgUEVSRl9UWVBFX1JBVyk7Cj4gPj4g
KyAgICByZXQgPSBwZXJmX3BtdV9yZWdpc3RlcigmcG11LT5wbXUsIFJJU0NWX1BNVV9QREVWX05B
TUUsIFBFUkZfVFlQRV9SQVcpOwo+ID4gU2hvdWxkIHdlIGluY2x1ZGUgInNiaSIgaW4gdGhpcyBu
YW1lPwo+Cj4KPiBJJ2Qgc2F5IHRoYXQgaXQgaXMgc2FmZSB0byBkbyBzbyBhbmQgSSB1bmRlcnN0
YW5kIHlvdXIgcG9pbnQsIEBBdGlzaCBXRFlUPwo+CgpBY3R1YWxseSwgdGhlIGFyZ3VtZW50IGlu
IHBlcmZfcG11X3JlZ2lzdGVyIGlzIGFib3V0IHRoZSBwbXUgaW5zdGFuY2UKbmFtZSByYXRoZXIg
dGhhbiB0aGUgZHJpdmVyIG5hbWUuCkJvdGggbGVnYWN5ICYgU0JJIFBNVSBkcml2ZXJzIGFyZSBq
dXN0IHdheXMgdG8gYWNjZXNzIHRoZSAiY3B1IiBwbXUgaW5zdGFuY2UuCgpJbiBmdXR1cmUgd2Ug
bWF5IGhhdmUgc2VwYXJhdGUgZHJpdmVycyBmb3IgY291bnRlciBkZWxlZ2F0aW9uCmV4dGVuc2lv
bnMgdGhhdCB3b24ndCB1c2UgdGhlIFNCSSBQTVUgZXh0ZW5zaW9uCmF0IGFsbCBmb3Igc3VwcG9y
dGVkIGhhcmR3YXJlLiBIb3dldmVyLCB0aGUgUE1VIHdvdWxkIHN0aWxsIGJlIGNwdSBwbXUuCgpU
aGVyZSB3aWxsIGJlIGRpZmZlcmVudCBTb0MgUE1VIGRyaXZlcnMgd2hpY2ggd2lsbCBoYXZlIGRp
ZmZlcmVudApuYW1lcyBiZWNhdXNlIGl0IHdpbGwgcmVwcmVzZW50IFNvQyBQTVUgaW5zdGVhZCBv
ZiBjcHUgcG11LgoKPgo+ID4KPiA+PiAgICAgIGlmIChyZXQpCj4gPj4gICAgICAgICAgICAgIGdv
dG8gb3V0X3VucmVnaXN0ZXI7Cj4gPj4KPiA+PiAtLQo+ID4+IDIuMzcuMgo+ID4+Cj4gPiBPdGhl
cndpc2UsCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+CgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
