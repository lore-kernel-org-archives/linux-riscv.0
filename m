Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F9EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5Bh5ZrYjcRpWlwjQ6HrtBjPtHSId4P5MWg2alGRWMs=; b=d310fAo3p4EVYY
	Z/jbOKRhhdBnAgKcMiFANUfJgIDJJgtV79uuefjGJGjVk29Xnol7FXsIBl3is3vjTZZOfAx5rF1VW
	sL6jpC65Swzy/JBbnPI+MWjmIvuwIFNbF2ag25NXUuux6v4msFS2b9wcbsqv6GAiMBk3BBf/i+o09
	IMm5toQbvLturj8kB7aQiQRvZqmDBZXNcyFneIbWNeKvVs0vaQ149XC0D4joOrVyFuqc8aQ2LlooF
	iVZEHmyQRXU4yIs90nnF6QyjYVRMlO+Da/AXJT/0ZhcneTMRDMtT+0NkBF9+xd4JwKS8nZGUVenc2
	USxU7RsuW/BCxo7fUJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iHu-00E9af-3A;
	Thu, 15 Jun 2023 08:25:02 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iHo-00E9Wm-2g
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 08:24:59 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b448470602so2705771fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686817492; x=1689409492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TO/9bQchmvWU5XsZ6PVSrKCC9iEyDaJ7fBfesY7nUXo=;
        b=FHIIfDdJcAOiiR4LbSL4/uGAdi7niaXDloG0VoBSjXwwGpoL4MfrwpXKJhGzPQwucE
         dOdvEIxRl+k6G2Hh2lXO8KWmw7BZwrfanEepuJFlHhgMixev0/FEqtjq051lycVOa9ab
         XGqysDrQA2Sx0DQo8Y41Vi1CNyTAhFB+HJMdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686817492; x=1689409492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO/9bQchmvWU5XsZ6PVSrKCC9iEyDaJ7fBfesY7nUXo=;
        b=FNAZfE1CzpxZvUY2ifNHkRmSCz+oUYnaZFITrQ921Hy88IeuHLISelx1vvuTpg7J+7
         8eA3kKY/MKmGF5lVB8S5wFh3yxZrpXpYzwcd9R648/ymD8RgsKluEdqyBCqAAWV16VS6
         Q3IxcMAmo0ec8sfG3SWGXzWMyhGKUIXe5pQtvb8/7cKUbqQBC2YpB8MH2EI2juotxzWQ
         BTKCvDgrvRg7zpE7ldurcWeVXOH4YVhXj9JV3fBoML0OP2Lzahon2+f/42hO+JUh37yG
         XgxxoFwsEI+B+KAVs/2+US9bYWjVWcjQIHj2aDmcWyFfwZ6wchOI37AtYWAOrC80vvea
         XnHg==
X-Gm-Message-State: AC+VfDwNkfIt8qhYQTB8HTTmkBP2zEg+HGBG0mg/fSKRj9RIdbrxnB9g
	AEj0GU0fV8S9DklaSk7j7a50n0DtX0HGEd0JVdRh
X-Google-Smtp-Source: ACHHUZ58CLSQF6iLpuxgFB1R71m1T7/aC/04CVGgkmQPECwvn6JLMHS3x0PLLr7WuPja8wAD1MVhHvQNld8wIM4pSkM=
X-Received: by 2002:a2e:a165:0:b0:2b1:e369:f98 with SMTP id
 u5-20020a2ea165000000b002b1e3690f98mr8402105ljl.11.1686817491842; Thu, 15 Jun
 2023 01:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-2-alexghiti@rivosinc.com> <20230531-5678beb107af4b9805cbb611@orel>
 <84626c83-8806-d807-a7bf-b497f70e56fd@ghiti.fr>
In-Reply-To: <84626c83-8806-d807-a7bf-b497f70e56fd@ghiti.fr>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 15 Jun 2023 01:24:40 -0700
Message-ID: <CAOnJCU+rhbFY6DaA508E6KFaa4VoEWiHOFpZnsjiqTwEdTVGEg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] perf: Fix wrong comment about default event_idx
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
X-CRM114-CacheID: sfid-20230615_012456_870675_6F1D47C5 
X-CRM114-Status: GOOD (  22.26  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTI6MTDigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4KPiBPbiAzMS8wNS8yMDIzIDE1OjU0LCBBbmRyZXcgSm9uZXMg
d3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMDo1MzoxMkFNICswMjAwLCBBbGV4
YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPj4gZXZlbnRfaWR4IGRlZmF1bHQgaW1wbGVtZW50YXRpb24g
cmV0dXJucyAwLCBub3QgaWR4ICsgMS4KPiA+IFRoZSBjb21tZW50IHdhcyBjb3JyZWN0IHVudGls
IGNvbW1pdCBjNzE5ZjU2MDkyYWQgKCJwZXJmOiBGaXggYW5kIGNsZWFuCj4gPiB1cCBpbml0aWFs
aXphdGlvbiBvZiBwbXU6OmV2ZW50X2lkeCIpLiBJJ20gbm90IHN1cmUgdGhhdCB3YXJyYW50cyBh
IGZpeGVzCj4gPiB0YWcsIGJ1dCBtYXliZSBhIHJlZmVyZW5jZSBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UuCj4KPgo+IFlvdSdyZSByaWdodCwgSSdsbCBhZGQgYSByZWZlcmVuY2UsIEkgZG9uJ3QgdGhp
bmsgaXQgZGVzZXJ2ZXMgYQo+IGJhY2twb3J0LCB0aGF0J3MganVzdCBhIGNvbW1lbnQuCj4KPgoK
V2l0aCB0aGF0IGRvbmU6CgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2lu
Yy5jb20+Cgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGluY2x1ZGUvbGludXgvcGVyZl9ldmVudC5oIHwg
MyArKy0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BlcmZfZXZlbnQuaCBiL2lu
Y2x1ZGUvbGludXgvcGVyZl9ldmVudC5oCj4gPj4gaW5kZXggZDU2MjhhN2I1ZWFhLi41NmZlNDNi
MjA5NjYgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50LmgKPiA+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L3BlcmZfZXZlbnQuaAo+ID4+IEBAIC00NDIsNyArNDQyLDggQEAg
c3RydWN0IHBtdSB7Cj4gPj4KPiA+PiAgICAgIC8qCj4gPj4gICAgICAgKiBXaWxsIHJldHVybiB0
aGUgdmFsdWUgZm9yIHBlcmZfZXZlbnRfbW1hcF9wYWdlOjppbmRleCBmb3IgdGhpcyBldmVudCwK
PiA+PiAtICAgICAqIGlmIG5vIGltcGxlbWVudGF0aW9uIGlzIHByb3ZpZGVkIGl0IHdpbGwgZGVm
YXVsdCB0bzogZXZlbnQtPmh3LmlkeCArIDEuCj4gPj4gKyAgICAgKiBpZiBubyBpbXBsZW1lbnRh
dGlvbiBpcyBwcm92aWRlZCBpdCB3aWxsIGRlZmF1bHQgdG8gMCAoc2VlCj4gPj4gKyAgICAgKiBw
ZXJmX2V2ZW50X2lkeF9kZWZhdWx0KS4KPiA+PiAgICAgICAqLwo+ID4+ICAgICAgaW50ICgqZXZl
bnRfaWR4KSAgICAgICAgICAgICAgICAoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50KTsgLypvcHRp
b25hbCAqLwo+ID4+Cj4gPj4gLS0KPiA+PiAyLjM3LjIKPiA+Pgo+ID4gT3RoZXJ3aXNlLAo+ID4K
PiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+
Cj4KPiBUaGFua3MhCj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
