Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C37AC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 03:58:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6047208E4
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 03:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XeDQvpAl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XsWUXcEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6047208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S88BuI8CGsP/Apjex842qbepZpoXY1uYt8290UCAVKE=; b=XeDQvpAlvNNWz51anw1quOXgA
	Dxv2XbKWnbzZq2MiA5KyjW4mJpViT5+OnoJrLPXHhIiICTRZZNvcWc73S8/6LKY3kvdonbGtMkev0
	qen5KCMG1nzAaCrS8qT3nmLX/zQYZX2cMV6NkjHd0eQ8vGyDWQrQgTtm88E9j+nj1NY4J4nGbZlIz
	eIYvjFgxX2jkvLAVihHzBv5bHtptoVYs/a/XuwgQvcaPtnHwC5vsLW5PcHUPPK9OhLkpcC0W++51O
	raEQaK8460rmp9ZZZfqRduhzU2EtJFuzPBwa5KETs2Fa77fLIG991PkaUxHWaaJLTChzAp3766kC+
	FY1Q3hLpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI26z-00069E-Fl; Tue, 15 Sep 2020 03:58:33 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI26w-00068q-VL
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 03:58:32 +0000
Received: by mail-qv1-xf43.google.com with SMTP id j10so1094751qvk.11
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 20:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pMJdPDx6ekVB7YXwuHGF9tRuH4E5JE+NQDZ61jgQOAI=;
 b=XsWUXcEgYKKv3P64NV7Q3vzVgQRBa9DgiVHKTpZ0+n70fDfEpFHaX09lAAeS8cJyuo
 qJ6RFZ0fTnH6BODhgwBlyaSbUVDL02our7WLYqeVYwWp9xFvas+p/MZzmZuUh9NMv44S
 6EPLUug67II6U9d7QmLhSmwCQVk+UncJJxDGpNOXjG+3CEaJcEEM2MuiWmvJOUw/ZsQE
 r9oVRAbzFOYVT1Wm8CtyMG2+IlY0w7OLYzrLrBPLz88rfrrWGLwthdQZxSN0i2ZCjUac
 RRWM4PTvxsjDGYU+UfDVM7zJMQA06pr0gdywnyHZdJhrs0/LuAPRNie/VKn8OwDqr/sO
 n8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pMJdPDx6ekVB7YXwuHGF9tRuH4E5JE+NQDZ61jgQOAI=;
 b=o1u/4NNThx1aJQxBnrx8kf6+wTVQDlvM2z0slwW+BBMpL3bn42WH0cjQYWemguSyOm
 Cx3XMjWKB1ObLcCtXL4VOr/Zt2Q8Ddu9vH1RJvaXb5wIO8526nyUs5/TG6KZZOwGFQp9
 B8JYNvoE0XfmwmOIAgcOXHlf0EkjtsUfQ+Px6lrxg+HudpIIS6zzQj7o+MSmSMR47/tm
 OUTaKM+XLTNWgAVIVGDOtSd3F91mnOVmkMhdXvOj+kLPGq6TEy+lYrh3LqUG+ChCcQ2D
 N4sstCqx1dDnRyvICM7cfnnv8zCBZ4URODWbZBwooRcH+/z6OscfneZTczH/b7iHcWl7
 7FQA==
X-Gm-Message-State: AOAM530RbYrB8J8PZGalGIyFPyB1t2JG3rYg+ornTGNKqFZZUlVfEVG9
 r2K+4ggIxvjL60xskUaad1G22dwsJNRCrUorMOhJcw==
X-Google-Smtp-Source: ABdhPJyjl4AeOLhR1zK1vHrRbaehEoqpsH6OVLDN65wxiqK03GMCKC93t2OcUrXWkV16aQ9nOiNtsd/WgCet4hoClP0=
X-Received: by 2002:a0c:e649:: with SMTP id c9mr15787689qvn.16.1600142305934; 
 Mon, 14 Sep 2020 20:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1QbMjZxxu+wSBYr3+3oaM2Qg=_Uwj8dfQidi=ck6PV_Q@mail.gmail.com>
 <mhng-1f7adcd7-551c-4b8a-80f5-e1230b335c6a@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-1f7adcd7-551c-4b8a-80f5-e1230b335c6a@palmerdabbelt-glaptop1>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 15 Sep 2020 11:58:13 +0800
Message-ID: <CAHCEehKnFpdDamANoOfSJV2pbeMzjhxWja667PL6Sueid9imPw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add sfence.vma after page table changed
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_235831_289364_9AE81C5F 
X-CRM114-Status: GOOD (  25.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Syven Wang <syven.wang@sifive.com>,
 Will Deacon <willdeacon@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4g5pa8IDIwMjDlubQ45pyINeaXpSDp
gLHkuIkg5LiK5Y2IMTA6MDPlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMDMgQXVnIDIwMjAgMjA6Mjk6
MzIgUERUICgtMDcwMCksIGFudXBAYnJhaW5mYXVsdC5vcmcgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1
ZyA0LCAyMDIwIGF0IDg6MzIgQU0gR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNv
bT4gd3JvdGU6Cj4gPj4KPiA+PiBUaGlzIHBhdGNoIGFkZGVzIGxvY2FsX2ZsdXNoX3RsYl9wYWdl
KGFkZHIpIHRvIHVzZSBzZmVuY2Uudm1hIGFmdGVyIHRoZQo+ID4KPiA+IHMvYWRkZXMvYWRkcwo+
ID4KPiA+PiBwYWdlIHRhYmxlIGNoYW5nZWQuIFRoYXQgYWRkcmVzcyB3aWxsIGJlIHVzZWQgaW1t
ZWRpYXRlbHkgaW4KPiA+PiBtZW1zZXQobmV4dHAsIDAsIFBBR0VfU0laRSkgdG8gY2F1c2UgdGhp
cyBpc3N1ZSBzbyB3ZSBzaG91bGQgYWRkIHRoZQo+ID4+IHNmZW5jZS52bWEgYmVmb3JlIHdlIHVz
ZSBpdC4KPiA+Cj4gPiBBbHRlcm5hdGUgdmVyc2lvbiBvZiB0aGlzIGNvbW1pdCBkZXNjcmlwdGlv
biBjYW4gYmU6Cj4gPgo+ID4gSW52YWxpZGF0ZSBsb2NhbCBUTEIgYWZ0ZXIgYm90aCBzZXRfcGV0
KCkgYW5kIGNsZWFyX3B0ZSgpIGJlY2F1c2UgdGhlCj4gPiBhZGRyZXNzIGNhbiBiZSB1c2VkIGlt
bWVkaWF0ZWx5IGFmdGVyIHBhZ2UgdGFibGUgY2hhbmdlLgo+ID4KPiA+PiBGaXhlczogZjJjMTdh
YWJjOTE3ICgiUklTQy1WOiBJbXBsZW1lbnQgY29tcGlsZS10aW1lIGZpeGVkIG1hcHBpbmdzIikK
PiA+Pgo+ID4+IFJlcG9ydGVkLWJ5OiBTeXZlbiBXYW5nIDxzeXZlbi53YW5nQHNpZml2ZS5jb20+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogU3l2ZW4gV2FuZyA8c3l2ZW4ud2FuZ0BzaWZpdmUuY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+
Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNyArKystLS0tCj4gPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+
ID4+IGluZGV4IGY0YWRiMzY4NGYzZC4uMjliMGY3MTA4MDU0IDEwMDY0NAo+ID4+IC0tLSBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+PiBA
QCAtMjAyLDEyICsyMDIsMTEgQEAgdm9pZCBfX3NldF9maXhtYXAoZW51bSBmaXhlZF9hZGRyZXNz
ZXMgaWR4LCBwaHlzX2FkZHJfdCBwaHlzLCBwZ3Byb3RfdCBwcm90KQo+ID4+Cj4gPj4gICAgICAg
ICBwdGVwID0gJmZpeG1hcF9wdGVbcHRlX2luZGV4KGFkZHIpXTsKPiA+Pgo+ID4+IC0gICAgICAg
aWYgKHBncHJvdF92YWwocHJvdCkpIHsKPiA+PiArICAgICAgIGlmIChwZ3Byb3RfdmFsKHByb3Qp
KQo+ID4+ICAgICAgICAgICAgICAgICBzZXRfcHRlKHB0ZXAsIHBmbl9wdGUocGh5cyA+PiBQQUdF
X1NISUZULCBwcm90KSk7Cj4gPj4gLSAgICAgICB9IGVsc2Ugewo+ID4+ICsgICAgICAgZWxzZQo+
ID4+ICAgICAgICAgICAgICAgICBwdGVfY2xlYXIoJmluaXRfbW0sIGFkZHIsIHB0ZXApOwo+ID4+
IC0gICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyKTsKPiA+PiAtICAgICAg
IH0KPiA+PiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKGFkZHIpOwo+ID4+ICB9Cj4KPiBh
cm02NCBhcHBlYXJzIHRvIGJlIHVwZ3JhZGluZyBhbGwgc2V0X3B0ZSgpcyBvbiB2YWxpZCBrZXJu
ZWwgbWFwcGluZ3MgdG8KPiBpbmNsdWRlIHRoZSBmZW5jZS4gIEl0IGxvb2tzIGxpa2UgdGhlIG1l
c3NhZ2UgZnJvbSA3ZjBiMWJmMDQ1MTEgKCJhcm02NDogRml4Cj4gYmFycmllcnMgdXNlZCBmb3Ig
cGFnZSB0YWJsZSBtb2RpZmljYXRpb25zIikgaXMgb3V0IG9mIGRhdGUsIGFzIEkgY2FuJ3QgZmlu
ZAo+IGNyZWF0ZV9tYXBwaW5nKCkgYW55IG1vcmUuICBJZiB0aGF0IHdhcyBzb21lIGdlbmVyaWMg
a2VybmVsIHRoaW5nIHRoZW4gd2UKPiBzaG91bGQgcHJvYmFibHkgdXBncmFkZSBvdXJzIGFzIHdl
bGwsIGJ1dCBpZiBpdCB3YXMgYXJjaC9hcm02NC8gY29kZSB0aGVuIHRoaXMKPiBhcHByb2FjaCBz
ZWVtcyBmaW5lIGFzIF9fc2V0X2ZpeG1hcCgpIGlzbid0IG9uIHRoZSBob3QgcGF0aCAtLSBJIGd1
ZXNzIHRoaXMgaXMKPiBmaW5lIGVpdGhlciB3YXksIGJ1dCB0aGVyZSBtYXkgYmUgb3RoZXIgaXNz
dWVzIHRoYXQgdGhlIGFybTY0IGFwcHJvYWNoIGZpeGVzLgo+Cj4gRG8geW91IGd1eXMgaGFwcGVu
IHRvIHJlbWVtYmVyIHdoYXQgd2FzIGdvaW5nIG9uIGhlcmU/CgpIaSBQYWxtZXIsCgpTb21lIGFy
Y2hpdGVjdHVyZXMgYWRkIGNhY2hlIHdyaXRlYmFjayBpbiBzZXRfcHRlKCksIGp1c3QgbGlrZSBu
ZHMzMiwgY3NreS4KCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rl
ci9hcmNoL25kczMyL2luY2x1ZGUvYXNtL3BndGFibGUuaCNMMjEzCmh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oI0wxMDQKCldvdWxkIHlvdSBsaWtlIHRvIHBpY2sgdGhpcyBwYXRjaCBvciBzaG91bGQgSSBz
ZW5kIGFub3RoZXIgcGF0Y2ggdG8KaW1wbGVtZW50IGl0IGluIHNldF9wdGUoKT8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
