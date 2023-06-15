Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5C7EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL7X6BOoGw0CQfyv/jsiE9W1s+zvTM2i7h6h4o2gTZI=; b=VK4Zxdo7b6oh71
	G9Xch7CvUZe8xXwL3ORILf+wuY2+ZlLuOzf4roOqm1+kXpuSTYtcKhZspj6Pz2BFCbLCe5ccWNmbr
	msaaBB+XKFSL09C0XFUQZzH8qBVgs7HjKQ61QrEd+YhLCp88o2ikdnEisvbAv/gNuP7J6p3IsP35l
	Jmnx/ml26ZJZTAd5+8sQ4k3wZ82yDTzwq5wXHevzFDw+vVGFTXucjowq67jY9Ta1Pde/D4d4Co5hy
	GDwAq/zwdpKFHPIWR3LDi1xCfyZyFK/Qy/CaQ/ifpIDGDZsnBwbpQQamm+PvfojtBFw+/QY91PcPg
	AxTzbOD2o1pEHvevK/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iT2-00EBRV-1w;
	Thu, 15 Jun 2023 08:36:32 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iSy-00EBP0-1q
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 08:36:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b34ac4b6e8so20626671fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686818186; x=1689410186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDqFlnJs7b5XSrXYfFDcBdbg7c+MBzrrq0kAraysWF0=;
        b=BF4NTGgyxuXLd/DCtsfhMWllCFX5t8hYdRqzQeUl9mxCjttJAJ7Pm8/A9437zSmkP2
         fiulhEjOtigFq6kjTjDFwsjbyk5q51xYQkvo3CsBOJjdXMSWDuxF3PDmK12cqPN7B66v
         hsQKjBkbPmpmAppRPNgBHtAEKvcG+b6yfyydk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818186; x=1689410186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDqFlnJs7b5XSrXYfFDcBdbg7c+MBzrrq0kAraysWF0=;
        b=VUqwkPE84AbFozR4r3NuVGJGOM2ua9JP2ABKxwqNp8B+6BTHOTJiAFoQQFu+x+SDrp
         xJiHRDg/p9wVDISk2NRIWGEDrnkvEOIrMOuyR+UX52ExXhQmPBJITetIa3xHXLdjkbQ1
         3BhiH/WAnk79B+bBi2rmzPsY599+Rgv8mfkJhtQSTsVmo/k1rMjfKb5NP1Xkx0KO0PyS
         eHXcs68m0AsFF201GtHOwEVdl2FmwwaaBOg+MmPMPGLyj9u+EtwQFpVptJqwYuLbgkIY
         TJppZdF2X5xcCS5E1lElmEKE28ZGcyyvDSqh8Q5/WMmMKtnIzwWjJ9REJEnuQBygwvpb
         omcA==
X-Gm-Message-State: AC+VfDz8Kv+6ZuVmZ4llTElveui5TraEtYQA9saqJLaXKSFqjtqZHAwC
	6pAO7rexyrMSI0/dZTkWJ19wlHCW+3O54/CAi3ec
X-Google-Smtp-Source: ACHHUZ5Bdq/pHXm3zHoqwzxyGEBNA9JTaa6iUkRvIy+81mbIKyUzp1Kmd9vgi/5KwuUU4fD/I76lgbpxMD9W4Q7qWlI=
X-Received: by 2002:a2e:8611:0:b0:2b3:4c18:cf41 with SMTP id
 a17-20020a2e8611000000b002b34c18cf41mr2931471lji.53.1686818186178; Thu, 15
 Jun 2023 01:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-3-alexghiti@rivosinc.com> <20230531-707d254be1238272fb2c182d@orel>
In-Reply-To: <20230531-707d254be1238272fb2c182d@orel>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 15 Jun 2023 01:36:14 -0700
Message-ID: <CAOnJCUJHMt4ziauJw-O5vr1NohaSDpN=NQUoSC4oxHRurkV0JQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_013628_608704_A39EFE85 
X-CRM114-Status: GOOD (  18.88  )
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

T24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgNjo1NuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMTA6NTM6
MTNBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gVGhlIGN1cnJlbnQgaW5jbHVk
ZSBndWFyZCBwcmV2ZW50cyB0aGUgaW5jbHVzaW9uIG9mIGFzbS9wZXJmX2V2ZW50LmgKPiA+IHdo
aWNoIHVzZXMgdGhlIHNhbWUgaW5jbHVkZSBndWFyZDogZml4IHRoZSBvbmUgaW4gcmlzY3ZfcG11
Lmggc28gdGhhdCBpdAo+ID4gbWF0Y2hlcyB0aGUgZmlsZSBuYW1lLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IFJldmll
d2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gLS0t
Cj4gPiAgaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oIHwgNiArKystLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggYi9pbmNsdWRlL2xpbnV4L3Bl
cmYvcmlzY3ZfcG11LmgKPiA+IGluZGV4IDQzZmM4OTJhYTdkOS4uOWY3MGQ5NDk0MmUwIDEwMDY0
NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oCj4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmgKPiA+IEBAIC02LDggKzYsOCBAQAo+ID4gICAqCj4g
PiAgICovCj4gPgo+ID4gLSNpZm5kZWYgX0FTTV9SSVNDVl9QRVJGX0VWRU5UX0gKPiA+IC0jZGVm
aW5lIF9BU01fUklTQ1ZfUEVSRl9FVkVOVF9ICj4gPiArI2lmbmRlZiBfUklTQ1ZfUE1VX0gKPiA+
ICsjZGVmaW5lIF9SSVNDVl9QTVVfSAo+ID4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGVyZl9ldmVu
dC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9wdHJhY2UuaD4KPiA+IEBAIC04MSw0ICs4MSw0IEBA
IGludCByaXNjdl9wbXVfZ2V0X2hwbV9pbmZvKHUzMiAqaHdfY3RyX3dpZHRoLCB1MzIgKm51bV9o
d19jdHIpOwo+ID4KPiA+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX1BNVSAqLwo+ID4KPiA+IC0j
ZW5kaWYgLyogX0FTTV9SSVNDVl9QRVJGX0VWRU5UX0ggKi8KPiA+ICsjZW5kaWYgLyogX1JJU0NW
X1BNVV9IICovCj4gPiAtLQo+ID4gMi4zNy4yCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJh
IDxhdGlzaHBAcml2b3NpbmMuY29tPgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
