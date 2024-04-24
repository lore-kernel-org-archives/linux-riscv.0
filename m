Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19FC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eULOIWhpWk14ZkfSPLbS+P6iuuCjLgvNDSKPkhTesVw=; b=uA3io4kaD0espc
	Bei5eZMUTuUMW5NHkAbtPDSH0deC1POUShwW7krlQgp4xb7ubohOz+HY6LGXGBzfGNdN83sQ7GysE
	LdiME8x4UmUUVBSQJmfRz1pbT0+iaz/2scA0D4Po/hLtUfatOb3coUCHMgd/zEeEZMFVlin0lXKWA
	VK6l66FlSllSNzFGjSMPS0WdHbK7kMG1NFePh5hr1lkF/drTphgyyvZuxb2xcSGm1slpafglrfnT0
	fpkl/VrWuX0JhkDPZzziMaRDh/GbyaJIKd3O1+1cTxK1GM+NtlXnNs6Ld+ZUOLFdwQFO5aFzGRtZc
	K7N7lus4+O3I3jZJin6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeOu-00000004g8K-37N1;
	Wed, 24 Apr 2024 15:19:12 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeOq-00000004g6d-3ABW
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 15:19:10 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-43989e6ca42so446481cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713971947; x=1714576747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16IfUr/aDIVyiGDdNYlmv/QESeSDyKp3ic+JdrAeLjo=;
        b=DSFhKPPIHimlvQkNPfoFLfVEK4SU+BZ8DnHpLJf55aiw1JtciLnmjeayjJqTKQ3pb5
         DdT36pKtZynb5wlIZXSH69FER6O1aVkRcyCK8VbXylfbTIZlO7aUDkCAcixKKydKx0jP
         YCl11I3SLZE0ntC1XPwt8hHewZAEnUFj/VQJbklGGL7OX6ysVnJkwCnwrzIulTF1TwEV
         XvmkQDnJ73EBG1FhhdU9KNgFKHoUKzly3g7sCROpjcn+umr2dLRsgd17l++pnRzCPj6C
         CPgMMHLdMM6x2IqiG9mr5E6SW55jNGGwBpF7knvEoh5tG5+4V9+5Nkk964gVLwr9clDB
         MYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713971947; x=1714576747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16IfUr/aDIVyiGDdNYlmv/QESeSDyKp3ic+JdrAeLjo=;
        b=Vqa3GdwIjmIPiCb5n0fcn79YYfyWqHvdBz5cAOlSAHQucDVrfrcmzTvwI7GtWA5FzN
         zeLXbuty8FENsyfO1l6oMzpLJ/yphgZWFenCMKrteY9h3/Od+y+kVtUFhPdsMbO0VGRI
         5bLKQ2i9vLcCw6ggHbrSg1W+5f+m3DGuuyLSfCrQFwmM2KgVJp5Fjv7CXydQa7MoBaRK
         FKuQIvnKUGJ+3M+2s9cg3hKik9s7Tc+NqE0Egdb92ljSvo0dXOXKNkJbIexsoxHA4FB+
         qx0vvcu+T3A4P5VPJSV2vh35E4si7xtgNyNPmUKAkHW2MCbwa4MNvCo1FXGGtibDQbfD
         OEMA==
X-Forwarded-Encrypted: i=1; AJvYcCVD0DpZT94HHEWv1tSbFoF5qUW9MNsYft8zfavMe/1Ghsi1g+gl1q/rXPPHDYBI6Ofm2R076p+ROX09tmVHyTLsJlCBx8R51e7DzDjOv43F
X-Gm-Message-State: AOJu0YwN5iRGJI44l/YjEvRyULlTtVoJXmLKxwc3XwHZ/h1SUVe2TFk3
	pr0Wlzs6QtLsFCDLYn/nyNJX6+mVoDWS6ibRxN9b2bx8n7tlcC0u9ELBSV89t//MKGSz5O6qZdo
	uVl3J67UH6Yyn8z1QwaDuT0zlmyZM9wE0Y/IgTOBkNE+H6He8GjDz
X-Google-Smtp-Source: AGHT+IEFfX0IrtvdULyN66f10heNy91Xt+GeYOFUXi4nvaPeuN2PAOzDNm7Vw0JcnmVVNOeGCTZgBZtFwdAB2xtB2ts=
X-Received: by 2002:ac8:1286:0:b0:43a:2e2b:eec with SMTP id
 y6-20020ac81286000000b0043a2e2b0eecmr169202qti.2.1713971946704; Wed, 24 Apr
 2024 08:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com> <20240416061533.921723-14-irogers@google.com>
 <e8147f53-1930-44d8-abb8-fee460ec355f@linux.intel.com> <CAP-5=fVXv_gsoq5L08gaEJvU1E8xoihc3-L4taA+bPHyOJfgqw@mail.gmail.com>
 <7df3ff63-a421-42cc-bcaa-b0254ff6a0e8@linux.intel.com>
In-Reply-To: <7df3ff63-a421-42cc-bcaa-b0254ff6a0e8@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 24 Apr 2024 08:18:52 -0700
Message-ID: <CAP-5=fUi8DPNrbp=978K92Mopa71ag1sukttX3KcztD2ac0ADg@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] perf parse-events: Improvements to modifier parsing
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Beeman Strong <beeman@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_081908_817479_193F9A25 
X-CRM114-Status: GOOD (  19.57  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgNjoyMOKAr0FNIExpYW5nLCBLYW4gPGthbi5saWFuZ0Bs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMjQtMDQtMTkgMjoyMiBhLm0uLCBJ
YW4gUm9nZXJzIHdyb3RlOgo+ID4+PiArICAgICAgICAgICAgIC8qIFNpbXBsZSBtb2RpZmllcnMg
Y29waWVkIHRvIHRoZSBldnNlbC4gKi8KPiA+Pj4gKyAgICAgICAgICAgICBpZiAobW9kLnByZWNp
c2UpIHsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHU4IHByZWNpc2UgPSBldnNlbC0+Y29y
ZS5hdHRyLnByZWNpc2VfaXAgKyBtb2QucHJlY2lzZTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIC8qCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgKiBwcmVjaXNlIGlwOgo+ID4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICoKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAqICAw
IC0gU0FNUExFX0lQIGNhbiBoYXZlIGFyYml0cmFyeSBza2lkCj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgKiAgMSAtIFNBTVBMRV9JUCBtdXN0IGhhdmUgY29uc3RhbnQgc2tpZAo+ID4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICogIDIgLSBTQU1QTEVfSVAgcmVxdWVzdGVkIHRvIGhhdmUg
MCBza2lkCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgKiAgMyAtIFNBTVBMRV9JUCBtdXN0
IGhhdmUgMCBza2lkCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgKgo+ID4+PiArICAgICAg
ICAgICAgICAgICAgICAgICogIFNlZSBhbHNvIFBFUkZfUkVDT1JEX01JU0NfRVhBQ1RfSVAKPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
aWYgKHByZWNpc2UgPiAzKSB7Cj4gPj4gVGhlIHBtdV9tYXhfcHJlY2lzZSgpIHNob3VsZCByZXR1
cm4gdGhlIG1heCBwcmVjaXNlIHRoZSBjdXJyZW50IGtlcm5lbAo+ID4+IHN1cHBvcnRzLiBJdCBj
aGVja3MgdGhlIC9zeXMvZGV2aWNlcy9jcHUvY2Fwcy9tYXhfcHJlY2lzZS4KPiA+Pgo+ID4+IEkg
dGhpbmsgd2Ugc2hvdWxkIHVzZSB0aGF0IHZhbHVlIHJhdGhlciB0aGFuIGhhcmQgY29kZSBpdCB0
byAzLgo+ID4gSSdsbCBhZGQgYW4gZXh0cmEgcGF0Y2ggdG8gZG8gdGhhdC4gSSdtIGEgYml0IGNv
bmNlcm5lZCBpdCBtYXkgYnJlYWsKPiA+IGV2ZW50IHBhcnNpbmcgb24gcGxhdGZvcm1zIG5vdCBz
dXBwb3J0aW5nIG1heF9wcmVjaXNlIG9mIDMuCj4KPiBUaGUga2VybmVsIGFscmVhZHkgcmVqZWN0
cyB0aGUgcHJlY2lzZV9pcCA+IG1heF9wcmVjaXNlICh1c2luZyB0aGUgc2FtZQo+IHg4Nl9wbXVf
bWF4X3ByZWNpc2UoKSkuIEl0IHNob3VsZCBiZSBmaW5lIHRvIGFwcGx5IHRoZSBzYW1lIGxvZ2lj
IGluIHRoZQo+IHRvb2wuCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC94ODYvZXZlbnRzL2NvcmUuYyNu
NTY2Cj4KPiBXaWxsIHRoZSBleHRyYSBwYXRjaCBiZSBzZW50IHNlcGFyYXRlbHk/CgpMZXQncyBk
byBpdCBzZXBhcmF0ZWx5LiBJJ20gY29uY2VybmVkIGFib3V0IHRoZSBiZWhhdmlvciBvbiBBTUQg
KGFuZApwb3NzaWJseSBzaW1pbGFyIGFyY2hpdGVjdHVyZXMpIHdoZXJlIGNlcnRhaW4gZXZlbnRz
IHN1cHBvcnQgcHJlY2lzaW9uCmxpa2UgY3ljbGVzLCBhcyB0aGV5IGRldG91ciB0byB0aGUgSUJT
IFBNVSwgYnV0IG5vdCBhbGwgZXZlbnRzIHN1cHBvcnQKaXQuIFRoZSBtYXhfcHJlY2lzZSBzaG91
bGQgcmVmbGVjdCB0aGF0IEFNRCdzIFplbiBjb3JlIFBNVSBkb2VzCnN1cHBvcnQgcHJlY2lzaW9u
IGFzIGEgY29uc2VxdWVuY2Ugb2YgZGV0b3VyaW5nIHRvIElCUywgYnV0IG1heWJlCnRoaW5ncyBp
biBzeXNmcyBhcmVuJ3Qgc2V0IHVwIGNvcnJlY3RseS4KClRoYW5rcywKSWFuCgo+IFRoYW5rcywK
PiBLYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
