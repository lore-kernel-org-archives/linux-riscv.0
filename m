Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBBFC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 21:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eh48io2HHoZeJpTLkj5b7jgNulcT11RXxN9q0/eui9E=; b=Y0ZaFJpX9X36nY
	v/3SMJ+Yjlw7vRwAbAiB9Bbzkumcudb9tl+sCHxrubYKGTyUg1NDgVJOGfR/iOTQdP1oZ/b0prBhX
	DmoAdX4ZdQtG9ffDZ/dwTBmMkdz+TCtqfGGdlokIbsgLzGvjNpXMcBTwP/U6xJxXzAudH9neVuspN
	slxoAapGbGHCuChLqEpXcwjaTqkkW8+cS43yRETd48hZNi8lZXen8vM/VMTv4AVQ9ypW8UhiTns96
	FgfBVN6uFf/v0jl8r3o582q8hBv1R/G35b/o5ahsUulqd2o9fmFRt5DijvH/hVr3ajSze2gLNG90N
	wA+vEdjXek6gfOHTb7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYz1-00000003ivY-0LMm;
	Thu, 18 Apr 2024 21:07:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYyx-00000003iup-3BbX
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 21:07:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e86333bbe9so59925ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713474466; x=1714079266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJVJe5DYIGKiqAkh914q9HNHt4cBXtTHQHGV+XEJwYc=;
        b=CbjphtODihBA8pixpaDV6byzMloA0UChMS2UdLZY+tJPhA9B7VHbfGp5ypy5lwtP6d
         a7uHW9jGa/HzeNafkMDgRY0CW+WEvWAfPQ25BX84IzAy08frVIEzDNCJqyeAxRzZxEIi
         aMNtX8QyDBynmnQVAyiGAy5Pxbj3az3fe5wNarg3wIRtboXUr0sROboyGn9XythXysBe
         pK4ZVuUE4Tb4AwienvazdWOWNVtAX/0rwketwKLwCG5mFY8Forxkek14+EPXrsnhLxEk
         AFxCVVqBDpWlYm0dlqpzolb71Ro9RHXmJOZXDh+lPXIIu9oXyxzOLtbAtAF1N0VCp70V
         GQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713474466; x=1714079266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJVJe5DYIGKiqAkh914q9HNHt4cBXtTHQHGV+XEJwYc=;
        b=itnAfGFl8GNh1ehN6oK7GChzY+BpwT46FCxrxhAIMBW1WK53GJjgGqzMNi1bJaxRGk
         SMkDUN8uQcYO5hujuwmUypYvKu8WTvoWlHbka5FQOqZJHAqyWREwRwxc3YSwzYzVKM7K
         KlRYB70ufg+VSjVQKtDJ7QR2qZKXaFpaJjwpFieOLbNbyPQgchpJgFRMJYjvq7vKaJfk
         yV2yqT8jf/4MXZ09YsAUHjor32ML+2MAd/dEZHwtJGfGa/bAO4KgFhA5Tcq4RVxH/Q4N
         lnWp86EkWtBrBSWUJEMmO7lsdRWceq953fsz0qYG+qrZBV3Hak4FnQpN8VDQuOAUOTXH
         kf9A==
X-Forwarded-Encrypted: i=1; AJvYcCV9bLJPkHrAIXAFMTc4JTzrHIaUC6pPnifFf3ZWcGQI6re2du9KRUjZCOborkseNsOoVGl07dkUB73a+57Q+7W5yt1/VxTLNBxdyhoq7yDM
X-Gm-Message-State: AOJu0YwVwbs4Cse42o1hOxGsbEo5+NlDWa7Ggc05QcBcG5+EtKPvLYUK
	PVLJSwz7WMvWtEX4BuTiz+cGdRlwspVwAicyXYfiKGl41ZTYBboDidAgledf+543s0Fk2MLBwBa
	gcNOSWI3CACw8fSXABd9z/oLPhD3RMt9ICFHTwrLDMgz5oRU0uDgn
X-Google-Smtp-Source: AGHT+IGllCxp65eQfyYK3/aoRyDs6LzYbT60FkRzl2fi4BM0xmIMleEppw8pZ1EJkTt6eSUC/kh6f8ZA8Pc/FzTdMig=
X-Received: by 2002:a17:902:680c:b0:1e3:cb9b:d29c with SMTP id
 h12-20020a170902680c00b001e3cb9bd29cmr15441plk.23.1713474465710; Thu, 18 Apr
 2024 14:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com> <20240416061533.921723-12-irogers@google.com>
 <ac8835f8-0ea5-4f28-941c-aa43f0da92fd@linux.intel.com>
In-Reply-To: <ac8835f8-0ea5-4f28-941c-aa43f0da92fd@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 18 Apr 2024 14:07:31 -0700
Message-ID: <CAP-5=fXkn-nFTqGEqBYt6NUvoXU7OyLJeSCnWdD3taLHyK-xtQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] perf parse-events: Improve error message for bad numbers
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
X-CRM114-CacheID: sfid-20240418_140748_019672_D13CD69E 
X-CRM114-Status: GOOD (  25.29  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMToyN+KAr1BNIExpYW5nLCBLYW4gPGthbi5saWFuZ0Bs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMjQtMDQtMTYgMjoxNSBhLm0uLCBJ
YW4gUm9nZXJzIHdyb3RlOgo+ID4gVXNlIHRoZSBlcnJvciBoYW5kbGVyIGZyb20gdGhlIHBhcnNl
X3N0YXRlIHRvIGdpdmUgYSBtb3JlIGluZm9ybWF0aXZlCj4gPiBlcnJvciBtZXNzYWdlLgo+ID4K
PiA+IEJlZm9yZToKPiA+IGBgYAo+ID4gJCBwZXJmIHN0YXQgLWUgJ2N5Y2xlcy9wZXJpb2Q9OTk5
OTk5OTk5OTk5OTk5OTk5OTkvJyB0cnVlCj4gPiBldmVudCBzeW50YXggZXJyb3I6ICdjeWNsZXMv
cGVyaW9kPTk5OTk5OTk5OTk5OTk5OTk5OTk5LycKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcX19fIHBhcnNlciBlcnJvcgo+ID4gUnVuICdwZXJmIGxpc3QnIGZvciBhIGxp
c3Qgb2YgdmFsaWQgZXZlbnRzCj4gPgo+ID4gIFVzYWdlOiBwZXJmIHN0YXQgWzxvcHRpb25zPl0g
Wzxjb21tYW5kPl0KPiA+Cj4gPiAgICAgLWUsIC0tZXZlbnQgPGV2ZW50PiAgIGV2ZW50IHNlbGVj
dG9yLiB1c2UgJ3BlcmYgbGlzdCcgdG8gbGlzdCBhdmFpbGFibGUgZXZlbnRzCj4gPiBgYGAKPiA+
Cj4gPiBBZnRlcjoKPiA+IGBgYAo+ID4gJCBwZXJmIHN0YXQgLWUgJ2N5Y2xlcy9wZXJpb2Q9OTk5
OTk5OTk5OTk5OTk5OTk5OTkvJyB0cnVlCj4gPiBldmVudCBzeW50YXggZXJyb3I6ICdjeWNsZXMv
cGVyaW9kPTk5OTk5OTk5OTk5OTk5OTk5OTk5LycKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcX19fIHBhcnNlciBlcnJvcgo+ID4KPiA+IGV2ZW50IHN5bnRheCBlcnJvcjog
Jy4ubGVzL3BlcmlvZD05OTk5OTk5OTk5OTk5OTk5OTk5OS8nCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXF9fXyBCYWQgYmFzZSAxMCBudW1iZXIgIjk5OTk5OTk5OTk5OTk5
OTk5OTk5Igo+Cj4KPiBJdCBzZWVtcyB0aGUgcGF0Y2ggb25seSB3b3JrcyBmb3IgZGVjaW1hbD8K
Pgo+IC4vcGVyZiBzdGF0IC1lICdjeWNsZXMvcGVyaW9kPTB4YWFhYWFhYWFhYWFhYWFhYWFhYWFh
YS8nIHRydWUKPiBldmVudCBzeW50YXggZXJyb3I6ICcuLmxlcy9wZXJpb2Q9MHhhYWFhYWFhYWFh
YWFhYWFhYWFhYWFhLycKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxfX18g
cGFyc2VyIGVycm9yCj4gIFJ1biAncGVyZiBsaXN0JyBmb3IgYSBsaXN0IG9mIHZhbGlkIGV2ZW50
cwo+Cj4gICBVc2FnZTogcGVyZiBzdGF0IFs8b3B0aW9ucz5dIFs8Y29tbWFuZD5dCj4KPiAgICAg
IC1lLCAtLWV2ZW50IDxldmVudD4gICBldmVudCBzZWxlY3Rvci4gdXNlICdwZXJmIGxpc3QnIHRv
IGxpc3QKPiBhdmFpbGFibGUgZXZlbnRzCj4KPiBUaGFua3MsCj4gS2FuCgpSaWdodCwgZm9yIGhl
eGFkZWNpbWFsIHdlIHNheSB0aGUgbnVtYmVyIG9mIGRpZ2l0cyBpcyBhdCBtb3N0IDE2LCBzbwp3
aGVuIHlvdSBleGNlZWQgdGhpcyB0aGUgdG9rZW4gaXMgbm8gbG9uZ2VyIHJlY29nbml6ZWQuIEl0
IGp1c3QKYmVjb21lcyBpbnB1dCB0aGF0IGNhbid0IGJlIHBhcnNlZCwgaGVuY2UgcGFyc2VyIGVy
cm9yLiBEb2luZyB0aGlzCm1lYW5zIHdlIGNhbiBzaW1wbGlmeSBvdGhlciBzdHJ0b3VsbCBjaGVj
a3MsIGJ1dCBJIGFncmVlIGhhdmluZyBhCmJldHRlciBlcnJvciBtZXNzYWdlIGZvciBoZXhhZGVj
aW1hbCB3b3VsZCBiZSBnb29kLiBMZXQncyBkbyBpdCBhcwpmb2xsb3cgdXAuCgpUaGFua3MsCklh
bgoKPiA+IFJ1biAncGVyZiBsaXN0JyBmb3IgYSBsaXN0IG9mIHZhbGlkIGV2ZW50cwo+ID4KPiA+
ICBVc2FnZTogcGVyZiBzdGF0IFs8b3B0aW9ucz5dIFs8Y29tbWFuZD5dCj4gPgo+ID4gICAgIC1l
LCAtLWV2ZW50IDxldmVudD4gICBldmVudCBzZWxlY3Rvci4gdXNlICdwZXJmIGxpc3QnIHRvIGxp
c3QgYXZhaWxhYmxlIGV2ZW50cwo+ID4gYGBgCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJv
Z2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvcGVyZi91dGlsL3Bh
cnNlLWV2ZW50cy5sIHwgNDAgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3BhcnNlLWV2ZW50cy5sIGIvdG9vbHMvcGVy
Zi91dGlsL3BhcnNlLWV2ZW50cy5sCj4gPiBpbmRleCA2ZmUzNzAwM2FiN2IuLjBjZDY4YzlmMGQ0
ZiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVudHMubAo+ID4gKysr
IGIvdG9vbHMvcGVyZi91dGlsL3BhcnNlLWV2ZW50cy5sCj4gPiBAQCAtMTgsMjYgKzE4LDM0IEBA
Cj4gPgo+ID4gIGNoYXIgKnBhcnNlX2V2ZW50c19nZXRfdGV4dCh5eXNjYW5fdCB5eXNjYW5uZXIp
Owo+ID4gIFlZU1RZUEUgKnBhcnNlX2V2ZW50c19nZXRfbHZhbCh5eXNjYW5fdCB5eXNjYW5uZXIp
Owo+ID4gK2ludCBwYXJzZV9ldmVudHNfZ2V0X2NvbHVtbih5eXNjYW5fdCB5eXNjYW5uZXIpOwo+
ID4gK2ludCBwYXJzZV9ldmVudHNfZ2V0X2xlbmcoeXlzY2FuX3QgeXlzY2FubmVyKTsKPiA+Cj4g
PiAtc3RhdGljIGludCBfX3ZhbHVlKFlZU1RZUEUgKnl5bHZhbCwgY2hhciAqc3RyLCBpbnQgYmFz
ZSwgaW50IHRva2VuKQo+ID4gK3N0YXRpYyBpbnQgZ2V0X2NvbHVtbih5eXNjYW5fdCBzY2FubmVy
KQo+ID4gIHsKPiA+IC0gICAgIHU2NCBudW07Cj4gPiAtCj4gPiAtICAgICBlcnJubyA9IDA7Cj4g
PiAtICAgICBudW0gPSBzdHJ0b3VsbChzdHIsIE5VTEwsIGJhc2UpOwo+ID4gLSAgICAgaWYgKGVy
cm5vKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gUEVfRVJST1I7Cj4gPiAtCj4gPiAtICAgICB5
eWx2YWwtPm51bSA9IG51bTsKPiA+IC0gICAgIHJldHVybiB0b2tlbjsKPiA+ICsgICAgIHJldHVy
biBwYXJzZV9ldmVudHNfZ2V0X2NvbHVtbihzY2FubmVyKSAtIHBhcnNlX2V2ZW50c19nZXRfbGVu
ZyhzY2FubmVyKTsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyBpbnQgdmFsdWUoeXlzY2FuX3Qgc2Nh
bm5lciwgaW50IGJhc2UpCj4gPiArc3RhdGljIGludCB2YWx1ZShzdHJ1Y3QgcGFyc2VfZXZlbnRz
X3N0YXRlICpwYXJzZV9zdGF0ZSwgeXlzY2FuX3Qgc2Nhbm5lciwgaW50IGJhc2UpCj4gPiAgewo+
ID4gICAgICAgWVlTVFlQRSAqeXlsdmFsID0gcGFyc2VfZXZlbnRzX2dldF9sdmFsKHNjYW5uZXIp
Owo+ID4gICAgICAgY2hhciAqdGV4dCA9IHBhcnNlX2V2ZW50c19nZXRfdGV4dChzY2FubmVyKTsK
PiA+ICsgICAgIHU2NCBudW07Cj4gPgo+ID4gLSAgICAgcmV0dXJuIF9fdmFsdWUoeXlsdmFsLCB0
ZXh0LCBiYXNlLCBQRV9WQUxVRSk7Cj4gPiArICAgICBlcnJubyA9IDA7Cj4gPiArICAgICBudW0g
PSBzdHJ0b3VsbCh0ZXh0LCBOVUxMLCBiYXNlKTsKPiA+ICsgICAgIGlmIChlcnJubykgewo+ID4g
KyAgICAgICAgICAgICBzdHJ1Y3QgcGFyc2VfZXZlbnRzX2Vycm9yICplcnJvciA9IHBhcnNlX3N0
YXRlLT5lcnJvcjsKPiA+ICsgICAgICAgICAgICAgY2hhciAqaGVscCA9IE5VTEw7Cj4gPiArCj4g
PiArICAgICAgICAgICAgIGlmIChhc3ByaW50ZigmaGVscCwgIkJhZCBiYXNlICVkIG51bWJlciBc
IiVzXCIiLCBiYXNlLCB0ZXh0KSA+IDApCj4gPiArICAgICAgICAgICAgICAgICAgICAgcGFyc2Vf
ZXZlbnRzX2Vycm9yX19oYW5kbGUoZXJyb3IsIGdldF9jb2x1bW4oc2Nhbm5lciksIGhlbHAgLCBO
VUxMKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBFX0VSUk9SOwo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gKyAgICAgeXlsdmFsLT5udW0gPSBudW07Cj4gPiArICAgICByZXR1cm4gUEVf
VkFMVUU7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgaW50IHN0cih5eXNjYW5fdCBzY2FubmVyLCBp
bnQgdG9rZW4pCj4gPiBAQCAtMjgzLDggKzI5MSw4IEBAIHIweHtudW1fcmF3X2hleH0gIHsgcmV0
dXJuIHN0cih5eXNjYW5uZXIsIFBFX1JBVyk7IH0KPiA+ICAgICAgICAqLwo+ID4gICIvIi97ZGln
aXR9ICAgICAgICAgIHsgcmV0dXJuIFBFX0JQX1NMQVNIOyB9Cj4gPiAgIi8iL3tub25fZGlnaXR9
ICAgICAgICAgICAgICB7IEJFR0lOKGNvbmZpZyk7IHJldHVybiAnLyc7IH0KPiA+IC17bnVtX2Rl
Y30gICAgICAgICAgICB7IHJldHVybiB2YWx1ZSh5eXNjYW5uZXIsIDEwKTsgfQo+ID4gLXtudW1f
aGV4fSAgICAgICAgICAgIHsgcmV0dXJuIHZhbHVlKHl5c2Nhbm5lciwgMTYpOyB9Cj4gPiAre251
bV9kZWN9ICAgICAgICAgICAgeyByZXR1cm4gdmFsdWUoX3BhcnNlX3N0YXRlLCB5eXNjYW5uZXIs
IDEwKTsgfQo+ID4gK3tudW1faGV4fSAgICAgICAgICAgIHsgcmV0dXJuIHZhbHVlKF9wYXJzZV9z
dGF0ZSwgeXlzY2FubmVyLCAxNik7IH0KPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBXZSBuZWVk
IHRvIHNlcGFyYXRlICdtZW06JyBzY2FubmVyIHBhcnQsIGluIG9yZGVyIHRvIGdldCBzcGVjaWZp
Ywo+ID4gICAgICAgICogbW9kaWZpZXIgYml0cyBwYXJzZWQgb3V0LiBPdGhlcndpc2Ugd2Ugd291
bGQgbmVlZCB0byBoYW5kbGUgUEVfTkFNRQo+ID4gQEAgLTMzMCw4ICszMzgsOCBAQCBjZ3JvdXAt
c3dpdGNoZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsgcmV0dXJuIHN5bSh5
eXNjYW5uZXIsIFBFUkZfQ09VTlRfU1dfQ0dST1VQX1NXSVRDSEVTKTsgfQo+ID4gIHtsY190eXBl
fS17bGNfb3BfcmVzdWx0fS17bGNfb3BfcmVzdWx0fSAgICAgIHsgcmV0dXJuIHN0cih5eXNjYW5u
ZXIsIFBFX0xFR0FDWV9DQUNIRSk7IH0KPiA+ICBtZW06ICAgICAgICAgICAgICAgICB7IEJFR0lO
KG1lbSk7IHJldHVybiBQRV9QUkVGSVhfTUVNOyB9Cj4gPiAgcntudW1fcmF3X2hleH0gICAgICAg
ICAgICAgICB7IHJldHVybiBzdHIoeXlzY2FubmVyLCBQRV9SQVcpOyB9Cj4gPiAte251bV9kZWN9
ICAgICAgICAgICAgeyByZXR1cm4gdmFsdWUoeXlzY2FubmVyLCAxMCk7IH0KPiA+IC17bnVtX2hl
eH0gICAgICAgICAgICB7IHJldHVybiB2YWx1ZSh5eXNjYW5uZXIsIDE2KTsgfQo+ID4gK3tudW1f
ZGVjfSAgICAgICAgICAgIHsgcmV0dXJuIHZhbHVlKF9wYXJzZV9zdGF0ZSwgeXlzY2FubmVyLCAx
MCk7IH0KPiA+ICt7bnVtX2hleH0gICAgICAgICAgICB7IHJldHVybiB2YWx1ZShfcGFyc2Vfc3Rh
dGUsIHl5c2Nhbm5lciwgMTYpOyB9Cj4gPgo+ID4gIHttb2RpZmllcl9ldmVudH0gICAgIHsgcmV0
dXJuIHN0cih5eXNjYW5uZXIsIFBFX01PRElGSUVSX0VWRU5UKTsgfQo+ID4gIHtuYW1lfSAgICAg
ICAgICAgICAgICAgICAgICAgeyByZXR1cm4gc3RyKHl5c2Nhbm5lciwgUEVfTkFNRSk7IH0KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
