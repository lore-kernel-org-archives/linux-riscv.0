Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3423EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDzTdOd2+AM/DSynwo+o5tcO3mbi/oWEFEWTlj9LaHM=; b=cuj/ID+Q8iZp47
	CFO9zckhlUlLnGDUJNQqYclq5a649zjexyDzPEuCg0XOVobFZLfgMJDt5sw9Yqm8/+y5mE8ww7Nrx
	jYSFPURCquoyfgqiROFy7wzzHFWWXFM3Ep4doKQpwUCompHa9UCp19CnKE0Ny8pYKSoEGkUsS11+M
	u5LCQT9YSL5GsvRHl2OF6WMfTtob9fozOAPpRhJVdNP+mFgxGN62WmtJOCZtPie6Ipt4y3h7IS+bQ
	V32qNZxAsRhydhrzlpp7bWO0qdSFtc3QOtu99jWUHrthQ/zh6WOCoW2SEfj3KIyBAdMjYtLdq3FB1
	Emxlpzc2lMuO6BkIYJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCm22-004LhV-2B;
	Fri, 23 Jun 2023 19:01:18 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCm1z-004Lfz-0I
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 19:01:16 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b47742de92so17519361fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 12:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687546872; x=1690138872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00/Y6ptXh35aGcl0eDeOuw0hr2DowGhnnzQCBPE2/o0=;
        b=IK507L00753xrSymrZD52v17Z1Yu5+ftbblUBW0TXY0SRqtXDcO8MvJ5dq3lQC/NnM
         eUi1IRDlos3YzYdTtDlOioLr7x8gpQlIu08+R7xjpvHbTyvZaQ9Anc34eN2KUcKTdGNf
         A56xbBUwGMP5vd0wamo/bvV7G/2+swSRuCbhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687546872; x=1690138872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00/Y6ptXh35aGcl0eDeOuw0hr2DowGhnnzQCBPE2/o0=;
        b=XSx+012Ip/EozyGsUwaaQ5jRkEqlWxPUjzuX4QTtrFUfcHUyylxkhXY1AbsaqdTxbu
         eMDxXrHdj07Ar/SeOlCvLMAUcVZCCN5v1rMFs3ILAOJm/94qq/UfzalVv0/MuJh/gCdp
         bk+Xd+y4b+DlnYRM+fOkaLTzBPSJ7jD7OCNVSbAZy082zGGw4SU+/wUQ1MsMEjd7Ciyp
         ZHftfJeCsY5AR+EF2FOaXMN8gtLXdD5xHdFJI8vizkuRvTH211ev5ibD2WJt6J/8ikmN
         fFkN3bnAHTYRcuqeS2L/2CuFIPXAqdu5Kyd3Zaih1TaRPnmmt6r2F2Gc5PK7S7gCmeyF
         XF8w==
X-Gm-Message-State: AC+VfDw7bTqDOIpPfH6pa52Ve+JIpGOT8Z/oYtg3JH/ecUid6/p/mcb3
	+M4kWOBkQUN4kSx/p0yR5POGSdDUpw/As9hCdyJo
X-Google-Smtp-Source: ACHHUZ6ZOyOCx6Oh8AEg5iMwbZ8jUGBWgHD+lAZfOT7YG84geuqIl15CpywJvjeYJ+eMQPrNCvi/nfGTts5WtZwXc2c=
X-Received: by 2002:a2e:3211:0:b0:2b4:7d83:c807 with SMTP id
 y17-20020a2e3211000000b002b47d83c807mr9418756ljy.50.1687546872091; Fri, 23
 Jun 2023 12:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
In-Reply-To: <20230623095547.51881-1-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 23 Jun 2023 12:01:00 -0700
Message-ID: <CAOnJCUKmwScQtA2E-3L__ixa8+HxjgMqPv1KaXtS4CdBZQ3mSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_120115_347392_BCEE9450 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Song Shuai <songshuaishuai@tinylab.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgMjo1NuKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgYm9vdGFyZ3Mgbm9kZSBpcyBhbHNvIGFk
ZGVkIGJ5IHRoZSBFRkkgc3R1YiBpbiB0aGUgZnVuY3Rpb24KPiB1cGRhdGVfZmR0KCksIHNvIGFk
ZCBpdCB0byB0aGUgdGFibGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vYXJtL3VlZmkucnN0
IHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FybS91ZWZpLnJzdCBiL0RvY3VtZW50
YXRpb24vYXJtL3VlZmkucnN0Cj4gaW5kZXggYmFlYmU2ODhhMDA2Li4yYjdhZDliZDdjZDIgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm0vdWVmaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2FybS91ZWZpLnJzdAo+IEBAIC01MCw3ICs1MCw3IEBAIFRoZSBzdHViIHBvcHVsYXRlcyB0
aGUgRkRUIC9jaG9zZW4gbm9kZSB3aXRoIChhbmQgdGhlIGtlcm5lbCBzY2FucyBmb3IpIHRoZQo+
ICBmb2xsb3dpbmcgcGFyYW1ldGVyczoKPgo+ICA9PT09PT09PT09PT09PT09PT09PT09PT09PSAg
PT09PT09ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IC1O
YW1lICAgICAgICAgICAgICAgICAgICAgICAgU2l6ZSAgICAgRGVzY3JpcHRpb24KPiArTmFtZSAg
ICAgICAgICAgICAgICAgICAgICAgIFR5cGUgICAgIERlc2NyaXB0aW9uCj4gID09PT09PT09PT09
PT09PT09PT09PT09PT09ICA9PT09PT0gICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4gIGxpbnV4LHVlZmktc3lzdGVtLXRhYmxlICAgICA2NC1iaXQgICBQaHlz
aWNhbCBhZGRyZXNzIG9mIHRoZSBVRUZJIFN5c3RlbSBUYWJsZS4KPgo+IEBAIC02Nyw0ICs2Nyw2
IEBAIGxpbnV4LHVlZmktbW1hcC1kZXNjLXZlciAgICAzMi1iaXQgICBWZXJzaW9uIG9mIHRoZSBt
bWFwIGRlc2NyaXB0b3IgZm9ybWF0Lgo+Cj4gIGthc2xyLXNlZWQgICAgICAgICAgICAgICAgICA2
NC1iaXQgICBFbnRyb3B5IHVzZWQgdG8gcmFuZG9taXplIHRoZSBrZXJuZWwgaW1hZ2UKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJhc2UgYWRkcmVzcyBsb2NhdGlvbi4K
PiArCj4gK2Jvb3RhcmdzICAgICAgICAgICAgICAgICAgICBTdHJpbmcgICBLZXJuZWwgY29tbWFu
ZCBsaW5lCj4gID09PT09PT09PT09PT09PT09PT09PT09PT09ICA9PT09PT0gICA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLS0KPiAyLjM5LjIKPgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKClJldmll
d2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApB
dGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
