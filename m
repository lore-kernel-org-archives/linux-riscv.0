Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE59C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXQa8PBgJFzdFoBVEMTk0xbo8n4/GKblm39a46NhjLw=; b=rkbYn3YMg8so0E
	37fO4iwMu5owc9oQmi5bg4xEYGPK9b8zG2zmhLeyYJF11JQCKq/76uK1CWM2lTyJD4o/WulN+ynWd
	JiIebyVsOW6wmL0+7UtbL1lKQuDdKS4OJZn1VSerrJ6XsHsQHLTJJqYGrGFRcL8TQD55givCA3PEM
	5/+txj3w4lY5orAA2ep9eLtir1vPzPpMYRreK8M5nThtgQbBiibzv56z3Ep6lmSnDlOZA7r/PN3FR
	yYNXYltFwERR0Mls5YYPIabJ7gEzsmlcC2mfgaJgwcbyUW1xzObzxsYpk4vEii17iBhlLOvHRLFvi
	eDnnaWPSczUODbXkLnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4PJx-000ZAi-1o;
	Wed, 31 May 2023 17:09:13 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4PJv-000Z8W-09
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 17:09:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af2696fd1cso66312381fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685552948; x=1688144948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQ4u7E+2pu1MUIvR5vq40l8aNtL/U44SVHTVaiFl+ZE=;
        b=dpkjmQJu6nzfEvoWvKrVmVKQFGK9PktpjQr+7FUyc7TmLV2jDpBImI3W6D2jWa8bxQ
         l5hJd7cLgyNz7BZdZU1OQXZKfXRkX4bD9w1XsNtr411FOCbaa6RddJGelQbb9wilkc9y
         DMWXRHS43Ov4MPvOjEalEiIKCv7yNQTvhrIlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685552948; x=1688144948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQ4u7E+2pu1MUIvR5vq40l8aNtL/U44SVHTVaiFl+ZE=;
        b=henZWJ27KddIIG4ujh9MgyiVfl9fiCxyRR0QNsZFUncepfYkiNhtIMcKfOZPi/HGGI
         rOozbwpsM8p+G0qMbw+94nTz+L9V6ONnRCn8LhCY6aHm8G59cUbtQ7QngO/O03CBOqvh
         HzWp8hriwaWNR5wzBIz3hKbq+UCyBVl71vVssQN+REIbIMC0h95/kwjTIRdRkp06GIww
         aTrhqGA+RjWl3Qxc7eq07dPxQz86v0jOalvxbeZTlrYM8CIbYAm4TrYCrWtwcn99ae1s
         6Z+wkqwfE9OsdIPlHdacpsqaW7K2fZlbp8Qs9sl8i3x8gsmHyvnxCv+PxKxVSFU1ylYQ
         M3WQ==
X-Gm-Message-State: AC+VfDyNZA9lXpbGlLv5KvQazlfjMNB/g7bZOzZD+9KSt6z7GEecjHUD
	V7y+k/yu2JYbUFHKQcRH2JU/1GOocBbkH7CoOHlt
X-Google-Smtp-Source: ACHHUZ4Yj35TR6Xj5jR1jPOnnSx23dqmIilZiSg9iS5EDhMCva7jreZ1DdDVMqkhgJshkIN4lTSdR5pmfFIPgmIgll4=
X-Received: by 2002:a2e:8189:0:b0:2ad:ba85:9f7 with SMTP id
 e9-20020a2e8189000000b002adba8509f7mr3527397ljg.22.1685552947968; Wed, 31 May
 2023 10:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-9-alexghiti@rivosinc.com> <20230531-0707dc46df8078cd92711314@orel>
In-Reply-To: <20230531-0707dc46df8078cd92711314@orel>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 31 May 2023 10:08:56 -0700
Message-ID: <CAOnJCU+sda3UaOvC3Si4TT3nvibUSEOwmx94eQK-9ouvG4=ovQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
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
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_100911_080527_9868B95E 
X-CRM114-Status: GOOD (  27.10  )
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

T24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgODowN+KAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMTA6NTM6
MTlBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gcmlzY3Ygbm93IHVzZXMgdGhp
cyBzeXNjdGwgc28gZG9jdW1lbnQgaXRzIHVzYWdlIGZvciB0aGlzIGFyY2hpdGVjdHVyZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwu
cnN0IHwgMjQgKysrKysrKysrKysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0Cj4gPiBpbmRleCA0YjdiZmVhMjhjZDcuLjkzY2Q1MThj
YTk0YiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tl
cm5lbC5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5l
bC5yc3QKPiA+IEBAIC05NDEsMTYgKzk0MSwzMiBAQCBlbmFibGVkLCBvdGhlcndpc2Ugd3JpdGlu
ZyB0byB0aGlzIGZpbGUgd2lsbCByZXR1cm4gYGAtRUJVU1lgYC4KPiA+ICBUaGUgZGVmYXVsdCB2
YWx1ZSBpcyA4Lgo+ID4KPiA+Cj4gPiAtcGVyZl91c2VyX2FjY2VzcyAoYXJtNjQgb25seSkKPiA+
IC09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ICtwZXJmX3VzZXJfYWNjZXNz
IChhcm02NCBhbmQgcmlzY3Ygb25seSkKPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KPiA+ICsKPiA+ICtDb250cm9scyB1c2VyIHNwYWNlIGFjY2VzcyBmb3IgcmVh
ZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLgo+ID4KPiA+IC1Db250cm9scyB1c2VyIHNwYWNlIGFj
Y2VzcyBmb3IgcmVhZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLiBXaGVuIHNldCB0byAxLAo+ID4g
LXVzZXIgc3BhY2UgY2FuIHJlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBjb3VudGVyIHJlZ2lzdGVy
cyBkaXJlY3RseS4KPiA+ICthcm02NAo+ID4gKz09PT09Cj4gPgo+ID4gIFRoZSBkZWZhdWx0IHZh
bHVlIGlzIDAgKGFjY2VzcyBkaXNhYmxlZCkuCj4gPiArV2hlbiBzZXQgdG8gMSwgdXNlciBzcGFj
ZSBjYW4gcmVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGNvdW50ZXIgcmVnaXN0ZXJzCj4gPiArZGly
ZWN0bHkuCj4gPgo+ID4gIFNlZSBEb2N1bWVudGF0aW9uL2FybTY0L3BlcmYucnN0IGZvciBtb3Jl
IGluZm9ybWF0aW9uLgo+ID4KPiA+ICtyaXNjdgo+ID4gKz09PT09Cj4gPiArCj4gPiArV2hlbiBz
ZXQgdG8gMCwgdXNlciBhY2Nlc3MgaXMgZGlzYWJsZWQuCj4gPiArCj4gPiArV2hlbiBzZXQgdG8g
MSwgdXNlciBzcGFjZSBjYW4gcmVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGNvdW50ZXIgcmVnaXN0
ZXJzCj4gPiArZGlyZWN0bHkgb25seSB0aHJvdWdoIHBlcmYsIGFueSBkaXJlY3QgYWNjZXNzIHdp
dGhvdXQgcGVyZiBpbnRlcnZlbnRpb24gd2lsbAo+ID4gK3RyaWdnZXIgYW4gaWxsZWdhbCBpbnN0
cnVjdGlvbi4KPiA+ICsKPiA+ICtUaGUgZGVmYXVsdCB2YWx1ZSBpcyAyLCB3aGljaCBlbmFibGVz
IGxlZ2FjeSBtb2RlICh1c2VyIHNwYWNlIGhhcyBkaXJlY3QKPiA+ICthY2Nlc3MgdG8gY3ljbGUs
IHRpbWUgYW5kIGluc3JldCBDU1JzIG9ubHkpLiBOb3RlIHRoYXQgdGhpcyBsZWdhY3kgdmFsdWUK
PiA+ICtpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIHJlbW92ZWQgb25jZSBhbGwgdXNlcnNwYWNl
IGFwcGxpY2F0aW9ucyBhcmUgZml4ZWQuCj4KPiBBbGwgbW9kZXMgY2FuIGFjY2VzcyB0aGUgdGlt
ZSBDU1Igc28gSSdtIG5vdCBzdXJlIGlmIGl0IHNob3VsZCBiZSBwb2ludGVkCj4gb3V0IGhlcmUg
YXMgaWYgaXQncyBhbiBleGNlcHRpb24uIE1heWJlIHdlIHNob3VsZG4ndCBwb2ludCBpdCBvdXQg
YXQgYWxsCj4gb3Igd2Ugc2hvdWxkIHBvaW50IGl0IG91dCBmb3IgYWxsIHRocmVlPwo+CgpWYWxp
ZCBwb2ludC4gVGhhbmtzIERyZXcuCkluIHRoZSBmdXR1cmUsIHdlIHByb2JhYmx5IHdhbnQgdG8g
c3VwcG9ydCBwcmN0bAooUFJfU0VUX1RTQy9TRUNDT01QX01PREVfU1RSSUNUKSB0byBkaXNhYmxl
IGV2ZW4KdGltZSBDU1IgYWNjZXNzLiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSB1c2UgY2Fz
ZSBmb3IgaXQgcmlnaHQgbm93LgoKPiBUaGFua3MsCj4gZHJldwoKCgotLSAKUmVnYXJkcywKQXRp
c2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
