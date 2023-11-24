Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26481C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49a4M3Hl1WPEYQup4TOQW82OrKtxg8GSfil2wmpLUC8=; b=OFC8Cvo4hAcsA6
	9GyemYW4GqHxJX0WLIAqS2cdAapD/s0pUNF45gMu5K7p+NOHFIRxlPuY7H2fFOPJkoqG+ATREANWM
	/m6ajfxxY08nr3FG/6qneczlnx+iT3XjloiYKzC2Q4YEvBhGyI9/huHd8XZgJUoTSxbvqiTW1XdhM
	Z8HBxFfV1spxzs/J1kTtlDqjbfzohhmEFR1Pj455ChHYbdzsuCGZldxsnERV427Qbj3pbFEAIr3rQ
	r/g+XoogU8M9rod1fMnyfVX06l6eCh6+2864+stescFP9lvBuEkDP/5aoH1jbDxEut85dbAiHO2GV
	VMpkDvjqUE4vr7nrr02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Xmc-007VKO-0f;
	Fri, 24 Nov 2023 15:07:54 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XmX-007VJ1-1U;
	Fri, 24 Nov 2023 15:07:50 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7ba8e3107c9so540752241.1;
        Fri, 24 Nov 2023 07:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838467; x=1701443267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cD4XTfLDfdBaVvLQQvVIb/DdNn7sLhHYoYCs/LHKvs=;
        b=HEAIqhzraGmUrmOQ5LPa2l47STnlSB5cHAraAnT05+/SxhjRJGvCMIsdBHtB4LSa8I
         Gzmvu2YfFMO7dHv7X7t58CiZreK6zvjd3d9J38zWnVOgDVvuN+joi13dVu0n3iq0qUfZ
         vPwTNOkrlqUfkEf+8YKuAc2wK7FBqwkKGY6yuaAmlEQhsuw98Rsbor4BbSK9o5Hddqie
         76zDHkib7cinmEVJVxu3VYoQW7Ah5uuqXUqgrkga2eOiwTnuq5uHzMix55Q9+LWEgP1S
         wAT/EjeCyvUquO0VeNeS2uNktJNGiC9oStNCOUt3O+LcEvT/lvLWLV1uwzrBLPQalKuD
         fZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838467; x=1701443267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cD4XTfLDfdBaVvLQQvVIb/DdNn7sLhHYoYCs/LHKvs=;
        b=d6Z+vwAtTUeLoF8VsOpNuFwspHjt4IUfhMRv4hzqt4Eg1GWVW+CyEsyN9gCLX+A8ZO
         iw2Roqiv1dhpKpLeQIfhpQFozTmYYWa1ZY/ze8i9d+afOoVJKyypC+aqszCXuKgawrI/
         hxzZL7p1hfSp5noi9e5K5SBbZ+yZ1We1jhGhDgpXuCvFOaS+xojDQ4XDxPs9hhLbVt7N
         oVhV1TmrR4ouqduzAMFIWMivbGt9+RD4vLkcvj9a+FAO1ksn+czKEMf9xJpiMF9Bij6/
         1EEfEUgLCZvlJIwAa26UXJyDC4id7x4DP+WKE5/RdLFPl/UWqKs+O3O4oV0L5bUwgXER
         3OeQ==
X-Gm-Message-State: AOJu0YyJ+gIJeWQY+Mv1jK74lK0Snu+AnjBZ4Usfqd5kOmB7gqepc3cT
	h2Zdr3ylPwRRSe+dMoZr0bbZotgNzMHdagAKIu4=
X-Google-Smtp-Source: AGHT+IGwXCccI84TpN5xF2DxNx/5Qx0U4TpwtpfvD5tAf/GoEOLYxxD2REsWw4Dlpn477SB/DfDmefE9drxOV1y67p8=
X-Received: by 2002:a05:6122:903:b0:49a:466c:199e with SMTP id
 j3-20020a056122090300b0049a466c199emr3335155vka.2.1700838467503; Fri, 24 Nov
 2023 07:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-11-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-11-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:07:21 +0000
Message-ID: <CA+V-a8s2Ep3cC_qJ-a=3xf+D_90SJKe_MObywmnm6UJzEbvA6w@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] dt-bindings: riscv: Add Andes PMU extension description
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_070749_497462_8ACD4401 
X-CRM114-Status: GOOD (  12.73  )
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
dGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnQgdGhlIElTQSBzdHJpbmcg
Zm9yIEFuZGVzIFRlY2hub2xvZ3kgcGVyZm9ybWFuY2UgbW9uaXRvcgo+IGV4dGVuc2lvbiB3aGlj
aCBwcm92aWRlcyBjb3VudGVyIG92ZXJmbG93IGludGVycnVwdCBhbmQgbW9kZQo+IGZpbHRlcmlu
ZyBtZWNoYW5pc21zLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
cmxpbkBhbmRlc3RlY2guY29tPgo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IENoYW5nZXMgdjIgLT4gdjM6Cj4gICAtIE5ldyBwYXRj
aAo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIEluY2x1ZGUgQ29ub3IncyBBY2tlZC1ieQo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgpSZXZp
ZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gaW5kZXggNjk0ZWZh
ZWE4ZmNlLi40ZTAwNjZhZmM4NDggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiBAQCAtMjU4LDYgKzI1
OCwxMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBpbiBjb21taXQgMmU1MjM2ICgiWnRz
byBpcyBub3cgcmF0aWZpZWQuIikgb2YgdGhlCj4gICAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51
YWwuCj4KPiArICAgICAgICAtIGNvbnN0OiB4YW5kZXNwbXUKPiArICAgICAgICAgIGRlc2NyaXB0
aW9uOgo+ICsgICAgICAgICAgICBUaGUgQW5kZXMgVGVjaG5vbG9neSBwZXJmb3JtYW5jZSBtb25p
dG9yIGV4dGVuc2lvbiBmb3IgY291bnRlciBvdmVyZmxvdwo+ICsgICAgICAgICAgICBhbmQgcHJp
dmlsZWdlIG1vZGUgZmlsdGVyaW5nLiBGb3IgbW9yZSBkZXRhaWxzLCBzZWUgQ291bnRlciBSZWxh
dGVkCj4gKyAgICAgICAgICAgIFJlZ2lzdGVycyBpbiB0aGUgQVg0NU1QIGRhdGFzaGVldC4KPiAr
ICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW5kZXN0ZWNoLmNvbS93cC1jb250ZW50L3VwbG9hZHMv
QVg0NU1QLTFDLVJldi4tNS4wLjAtRGF0YXNoZWV0LnBkZgo+ICsKPiAgICAgICAgICAtIGNvbnN0
OiB4dGhlYWRwbXUKPiAgICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICAgICAgICAgICAgICBUaGUg
VC1IZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgZXh0ZW5zaW9uIGZvciBjb3VudGVyIG92ZXJmbG93
LiBGb3IgbW9yZQo+IC0tCj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
