Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F9C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S56NWawbbGnhNzyNGunv13uXXjhVk8HT/hnyVj9bvSU=; b=r0DONmsef3oE4A
	Wq/2vNSzszq1aZmHndN11AJXI3jO9YOo1ykzJn5p/ZoqZAJ5qcMIjkdOGMhencFi3K9NJlssQtIBJ
	LLWEtCL7Uq+BNxyn4oFiLs1XPM3nXyHqJG/JDdmobDbkkwMseGHwKzFDYtAP0I5JftlNoLP1b7XvB
	+KXIM3l1hU3x6Z9atq4++0uiU437uM0rb2tO7p4wl4WjnCpxIoWTzsDfxnQwjssXzOhyKrTdl8Y0T
	jizGaKTdA57ShHT04VmspdVV2zpUEoJJv5yQg1QuewWfpa5vf27eK2iWNKiWrG8n5GWUMJqJdqoLG
	mhI+TcSButK3IchkyGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPw1-00EyNR-0o;
	Mon, 31 Jul 2023 10:15:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPvx-00EyLM-1k
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 10:15:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso3998574f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690798523; x=1691403323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EG3iuoYl2Yyk7UzsEc9LvQqrnR5PB3HBwoWOS4ckXVc=;
        b=JwLZ45qZwpOVPkXVdWIjIpyNCmwYH3dD8Ou7rl1pivlSHmOAShFMtPSrushNT6kmaq
         0dvPQPJk9qUs4AvASoH4gYvejhe/vSpJ4yXyYZyySjdQGekmCa/rEJCpbcQYWU/E8P3S
         AlJhoAOq/XPyByQrKiIkNk/OrNEA5ye2AzKSbO1oFASt+UzRwFIPWKYe3WuZmxeQvDGd
         /Fldg0QEg6p7DZ7btLj4ScOMseJMGHIDA9pso+oYxo3L4B91PFlYyvSd5DbmYHBcFOoi
         vHMqeQ0nYL/ARSHDJmf9aL3oEsBkBmeXhnms5OSIg/VaUgDVI2kRDsctBYp8rqkmYenw
         IuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690798523; x=1691403323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG3iuoYl2Yyk7UzsEc9LvQqrnR5PB3HBwoWOS4ckXVc=;
        b=mBZE4aBEV6jVYHLmERT5/N1dwBLDCexI5iNIS4q2f5PzeQtXYDmJujcLdpSqJCgevr
         dfy2KJ5NZGM39OYwHbIDedEOccE+tAx/T7StPxaGhxJv6briYjSCev9v9riRthbH35f8
         yfQ3u9K6hPFV6LuFrXgxFXHaatm5dbPJU+CpGKXWUSOkUxrw1J02I4t68p+Wra7YVtRg
         UocdJcFDe0NCaC5FS9JadrJ18aang4jMmle7QYRR29DqL2Ay2YmziNUhfuaSLneDO4yr
         pg1Yw1IfaxDP2iOuw6sbu4cw/uaPdxzmkCEGfEPsN4rHtHg0Xxtdb0wyCdb5rvjfheWX
         IlKA==
X-Gm-Message-State: ABy/qLY64o+gcXvYu6t2o0kGriGp1VSnpPazykUPIjPotzqFRNYVew21
	GmDqELO3GFTc/8tKiROe8M5IDGw7RR3/oX8Bz75gRQ==
X-Google-Smtp-Source: APBJJlFxSlRHvyoI0m2LL342krCpCaswj8cTM0vLfwdYwEDfTBUig6/z+ede7/AhGalI5Gom70ZQdsAskFXQlQqiPT4=
X-Received: by 2002:a5d:43c3:0:b0:30f:af19:81f3 with SMTP id
 v3-20020a5d43c3000000b0030faf1981f3mr5506063wrr.41.1690798523303; Mon, 31 Jul
 2023 03:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com> <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
In-Reply-To: <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 31 Jul 2023 12:15:12 +0200
Message-ID: <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
To: Ian Rogers <irogers@google.com>, Palmer Dabbelt <palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230731_031525_766763_586C0BD1 
X-CRM114-Status: GOOD (  24.79  )
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

SGkgSWFuLAoKT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNzo1M+KAr1BNIElhbiBSb2dlcnMgPGly
b2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCA3OjI4
4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
Cj4gPiByaXNjdiBub3cgc3VwcG9ydHMgbW1hcGluZyBoYXJkd2FyZSBjb3VudGVycyBzbyBhZGQg
d2hhdCdzIG5lZWRlZCB0bwo+ID4gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhhdCBpbiBsaWJwZXJmLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+
ID4gLS0tCj4gPiAgdG9vbHMvbGliL3BlcmYvbW1hcC5jIHwgNjUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYyBiL3Rvb2xz
L2xpYi9wZXJmL21tYXAuYwo+ID4gaW5kZXggMGQxNjM0Y2VkZjQ0Li4zNzhhMTYzZjA1NTQgMTAw
NjQ0Cj4gPiAtLS0gYS90b29scy9saWIvcGVyZi9tbWFwLmMKPiA+ICsrKyBiL3Rvb2xzL2xpYi9w
ZXJmL21tYXAuYwo+ID4gQEAgLTM5Miw2ICszOTIsNzEgQEAgc3RhdGljIHU2NCByZWFkX3BlcmZf
Y291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPiA+Cj4gPiAgc3RhdGljIHU2NCByZWFkX3Rp
bWVzdGFtcCh2b2lkKSB7IHJldHVybiByZWFkX3N5c3JlZyhjbnR2Y3RfZWwwKTsgfQo+ID4KPiA+
ICsjZWxpZiBfX3Jpc2N2X3hsZW4gPT0gNjQKPgo+IFRoaXMgaXMgc29tZXRoaW5nIG9mIGFuIG9k
ZCBndWFyZCwgcGVyaGFwczoKPiAjZWxpZiBkZWZpbmVkKF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxl
biA9PSA2NAo+Cj4gVGhhdCB3YXkgaXQgaXMgbW9yZSBpbnRlbnRpb24gcmV2ZWFsaW5nIHRoYXQg
dGhpcyBpcyByaXNjdiBjb2RlLiBDb3VsZAo+IHlvdSBhZGQgYSBjb21tZW50IHJlbGF0aW5nIHRv
IHRoZSBfX3Jpc2N2X3hsZW4gPwoKSSBndWVzcyBBbmRyZXcgYW5zd2VyZWQgdGhhdCBhbHJlYWR5
LgoKPgo+ID4gKwo+ID4gKy8qIFRPRE86IGltcGxlbWVudCBydjMyIHN1cHBvcnQgKi8KPiA+ICsK
PiA+ICsjZGVmaW5lIENTUl9DWUNMRSAgICAgIDB4YzAwCj4gPiArI2RlZmluZSBDU1JfVElNRSAg
ICAgICAweGMwMQo+ID4gKwo+ID4gKyNkZWZpbmUgY3NyX3JlYWQoY3NyKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsoeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgIHJl
Z2lzdGVyIHVuc2lnbmVkIGxvbmcgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gKyAgICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiY3NyciAlMCwgIiAjY3Ny
ICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgOiAiPXIiIChfX3YpIDogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgIDogIm1lbW9yeSIp
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Cj4gVG8gYXZvaWQgdGhlIG1h
Y3JvIHBhc3RpbmcgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBnbyB3ZWlyZCwgY291bGQgdGhpcyBi
ZToKPgo+IF9fYXNtX18gX192b2xhdGlsZV9fICgiY3NyciAlMCwgJTEiLAo+ICAgOiAiPXIiKF9f
dikgLyogb3V0cHV0cyAqLwo+ICAgOiAiaSIoY3NyKSAvKiBpbnB1dHMgKi8KPiAgIDogIm1lbW9y
eSIgLyogY2xvYmJlcnMgKi8pCj4KPiBBbHNvLCB3aHkgaXMgdGhpcyBjbG9iYmVyaW5nIG1lbW9y
eT8gV29ydGggYWRkaW5nIGEgY29tbWVudC4KCk5vIGlkZWEsIEkgc2VlIHRoYXQgaXQgaXMgYWxz
byBkb25lIHRoaXMgd2F5IGluCmFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmguIEBBdGlzaCBL
dW1hciBQYXRyYSAsIEBQYWxtZXIgRGFiYmVsdCA/CgpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMh
CgpBbGV4Cgo+Cj4gVGhhbmtzLAo+IElhbgo+Cj4gPiArICAgICAgICAgICAgICAgIF9fdjsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gK30pCj4gPiArCj4g
PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY3NyX3JlYWRfbnVtKGludCBjc3JfbnVtKQo+ID4gK3sK
PiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAg
ICAgIHtcCj4gPiArICAgICAgIGNhc2UgX19jc3JfbnVtOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICBfX3ZhbCA9IGNzcl9yZWFkKF9fY3NyX251
bSk7ICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOyB9Cj4gPiArI2RlZmlu
ZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ID4g
KyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgICAg
XAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDEsIF9fdmFsKX0K
PiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0sIF9fdmFsKSAgICAg
ICAgIHtcCj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0gKyAwLCBf
X3ZhbCkgICAgICBcCj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0g
KyAyLCBfX3ZhbCl9Cj4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVt
LCBfX3ZhbCkgICAgICAgICB7XAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19j
c3JfbnVtICsgMCwgX192YWwpICAgICAgXAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFk
XzQoX19jc3JfbnVtICsgNCwgX192YWwpfQo+ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVh
ZF8xNihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAge1wKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9j
c3JfcmVhZF84KF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgIFwKPiA+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSArIDgsIF9fdmFsKX0KPiA+ICsjZGVmaW5lIHN3aXRj
aGNhc2VfY3NyX3JlYWRfMzIoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgIHtcCj4gPiArICAgICAg
IHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMCwgX192YWwpICAgICBcCj4gPiAr
ICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMTYsIF9fdmFsKX0KPiA+
ICsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyByZXQgPSAwOwo+ID4gKwo+ID4gKyAgICAgICBz
d2l0Y2ggKGNzcl9udW0pIHsKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMihDU1Jf
Q1lDTEUsIHJldCkKPiA+ICsgICAgICAgZGVmYXVsdDoKPiA+ICsgICAgICAgICAgICAgICBicmVh
azsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gcmV0Owo+ID4gKyN1bmRl
ZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyCj4gPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRf
MTYKPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF84Cj4gPiArI3VuZGVmIHN3aXRjaGNh
c2VfY3NyX3JlYWRfNAo+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIKPiA+ICsjdW5k
ZWYgc3dpdGNoY2FzZV9jc3JfcmVhZAo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdTY0IHJlYWRf
cGVyZl9jb3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVyKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0
dXJuIGNzcl9yZWFkX251bShDU1JfQ1lDTEUgKyBjb3VudGVyKTsKPiA+ICt9Cj4gPiArCj4gPiAr
c3RhdGljIHU2NCByZWFkX3RpbWVzdGFtcCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJu
IGNzcl9yZWFkX251bShDU1JfVElNRSk7Cj4gPiArfQo+ID4gKwo+ID4gICNlbHNlCj4gPiAgc3Rh
dGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlciBfX21heWJlX3Vu
dXNlZCkgeyByZXR1cm4gMDsgfQo+ID4gIHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkg
eyByZXR1cm4gMDsgfQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
