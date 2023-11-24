Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C0AC61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/tc8I7TW/vO3kbSWQu2vne/AqiVFOxZouI3ZCrcUmQ=; b=Q5/U203plSA/KA
	im8AGkmRJUE+hQ6UiA/gs+llkDbXGJIi1G0lQB+qpvtSzf1v8gMnTUIj2RB/LtHVvyEItpW/RXSmg
	5ZP0y/XluKc9lWXg2mB3Nug7VX1idZXITvZAx8i4kcK0YSXmjEEtNrtLwpkUZ7Kv5mLXwRasc55DF
	UF9iKVXmGm8Hq8mQ9DvAogMYFuVXvs6PnmtLahaSPBn9YaQHiGj40F5lN60oYKp4dvzwiZKJ44TH2
	hIUcR/4nsCQelN8+ebbWmjwJvd7fwqzs2RA+F3A/4/QAlL4ZFjcZJwQWjPUgWJVy67beAMKPqTC1H
	R9oWAnBNFyLmJNpT10CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XjG-007Ue9-08;
	Fri, 24 Nov 2023 15:04:26 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XjC-007UbE-0b;
	Fri, 24 Nov 2023 15:04:23 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7c44f5f3ca2so552860241.0;
        Fri, 24 Nov 2023 07:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838257; x=1701443057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/uTADgd8yavomJvu4FPF4hVWKDAN545TEF230idRIM=;
        b=M8f6v1xqIWskrKXc6xWNeW7rGJ4zS9POy9nMSJ0VzOvrv0JFGXgvXNMZFvmaxVxjM/
         s1nsAO7vff5go1Zc7Rd3IsgcYlokgOm9WJysae4meX3IzHyvcdu3c7r0pXd/Y6ysVfBm
         i8bIYVm9Tuqv3X8YPUWPEg2e3GV4XQedKj5rw9bsIpFwQ4s3UgtslsWcAisPDDQg+tQS
         Yv1qsC2QqqZBNqjzcrg6ziEQ0fWX6lwZ4EUcZlfTIlqfDKp1A+p16dsn1NkZ4N325heR
         uzXlYJeaWqfYQmXgj3dmVyW0rdeEuaCqCls7yzOXAITOi7EWOcn5Cxeq1F0el0g2pOej
         Ek0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838257; x=1701443057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/uTADgd8yavomJvu4FPF4hVWKDAN545TEF230idRIM=;
        b=U3+ZVmCG7zaOU0bE8i0RqFiIQKNh4Wcd+lyCKPL65SCBTf4d40hm9/s6vuAetMEFh1
         kV7RNFFdbqxP/ETMxe7pjLoVAw3OZQuMr3MTnmx9ahU8YMj2oWDS2Z6jieW37VtxZ40O
         6p5sd3f+rC74GiufeCtkr+I+kC9YzQFwW2v2BSMxT0wockY2E9UgyTBC/NjJawXjKsBr
         wihOD6cZDIeNc+jyu/YONHwI7bAp1z3SjzLh4jyaQ4bfYBpO8ggoCOEIuxFxPJOmonmi
         2ayqO++XSbz4Pc/n0VuLGEbwOlcyeqi8Y3HWqK4rw442a87vtHPVbVURPRYgIBkZi2/s
         f4dQ==
X-Gm-Message-State: AOJu0YzGvPjbwrCKauJFJ9jD1FM/qCqwDDzhF1czoj/ZmmlL1spM4mDF
	5SerfJGg39txGw2OUaRmYmp0dokdYbj/xyAcQgA=
X-Google-Smtp-Source: AGHT+IGn6rzI1NHfvj2S91FrsEfWhu1mpfJ9nScpB8mMaoymohn6mrpA57mTUjJApelr8DTsyC/emZM0XfrDO6gs3Qc=
X-Received: by 2002:ac5:cde1:0:b0:4ab:fbff:a811 with SMTP id
 v1-20020ac5cde1000000b004abfbffa811mr2973431vkn.14.1700838257213; Fri, 24 Nov
 2023 07:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-5-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-5-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:03:51 +0000
Message-ID: <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_070422_222982_21BD1F2D 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTI6MTjigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPHBl
dGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkICJhbmRlc3RlY2gsY3B1LWludGMi
IGNvbXBhdGlibGUgc3RyaW5nIHRvIGluZGljYXRlIHRoYXQKPiBBbmRlcyBzcGVjaWZpYyBsb2Nh
bCBpbnRlcnJ1cHQgaXMgc3VwcG9ydGVkIG9uIHRoZSBjb3JlLAo+IGUuZy4gQVg0NU1QIGNvcmVz
IGhhdmUgMyB0eXBlcyBvZiBub24tc3RhbmRhcmQgbG9jYWwgaW50ZXJydXB0Cj4gY2FuIGJlIGhh
bmRsZWQgaW4gc3VwZXJ2aXNvciBtb2RlOgo+Cj4gLSBTbGF2ZSBwb3J0IEVDQyBlcnJvciBpbnRl
cnJ1cHQKPiAtIEJ1cyB3cml0ZSB0cmFuc2FjdGlvbiBlcnJvciBpbnRlcnJ1cHQKPiAtIFBlcmZv
cm1hbmNlIG1vbml0b3Igb3ZlcmZsb3cgaW50ZXJydXB0Cj4KPiBUaGVzZSBpbnRlcnJ1cHRzIGFy
ZSBlbmFibGVkL2Rpc2FibGVkIHZpYSBhIGN1c3RvbSByZWdpc3Rlcgo+IFNMSUUgaW5zdGVhZCBv
ZiB0aGUgc3RhbmRhcmQgaW50ZXJydXB0IGVuYWJsZSByZWdpc3RlciBTSUUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gLS0t
Cj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gTmV3IHBhdGNoCj4gQ2hhbmdlcyB2MiAtPiB2MzoK
PiAgIC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+ICAgLSBGaXhlZCBwb3NzaWJsZSBjb21wYXRp
YmxlcyBmb3IgQW5kZXMgSU5UQwo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIEFkZCBjb25zdCBl
bnRyeSBpbnN0ZWFkIG9mIGVudW0gKFN1Z2dlc3RlZCBieSBDb25vcikKPiAtLS0KPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDYgKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IGlu
ZGV4IGYzOTJlMzY3ZDY3My4uNTAzMDc1NTQ0NzhmIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gQEAgLTEwMCw3ICsxMDAs
MTEgQEAgcHJvcGVydGllczoKPiAgICAgICAgICBjb25zdDogMQo+Cj4gICAgICAgIGNvbXBhdGli
bGU6Cj4gLSAgICAgICAgY29uc3Q6IHJpc2N2LGNwdS1pbnRjCj4gKyAgICAgICAgb25lT2Y6Cj4g
KyAgICAgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IGFuZGVzdGVjaCxj
cHUtaW50YwpnaXZlbiB0aGF0IHRoZSBmaXJzdCBwYXRjaCByZW5hbWVzIGFuZGVzdGVjaCAtPiBh
bmRlcywgZG8geW91IHdhbnQgdG8KZm9sbG93IHRoZSBzYW1lIGhlcmU/Cgo+ICsgICAgICAgICAg
ICAgIC0gY29uc3Q6IHJpc2N2LGNwdS1pbnRjCj4gKyAgICAgICAgICAtIGNvbnN0OiByaXNjdixj
cHUtaW50Ywo+Cj4gICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlCj4KUmV2aWV3ZWQt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KCkNoZWVycywKUHJhYmhha2FyCgo+IC0tCj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
