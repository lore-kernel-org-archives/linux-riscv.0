Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD3FC43464
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:41:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F9520888
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wuLaUDYh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="VYQfGUEA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F9520888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=663/3Bvu5See4o9hXzVsH954N7+e2jcTm8BoRkSUwok=; b=wuLaUDYhp3xmw1R6PpQT+mlA3
	IpfVUPpCCicX7gvy41ZaDRidUHoIekFbWm7e5twlJ1i8aZCakJehINn9fU92vG76JgJN0c/IOmcU7
	3S4OlIh2J+NNbUDeWh7X+uzReRTHn3tSGp+1qkZQiCkHsQVn2v8oJanrESdXhAtjt8LNUieFNWr1x
	hDIbPYswGtvsBQ3yxKAZbzbKywXZj85VrnnrZBh9q05C3wZ+yV/gtcrkkG/A+KrjbaaLp9O4/asmT
	P9QujyzR0i6tKSrLTRpWjBeW6Woq+HupFstAztROvSGCHuaG4IgRX/iZCsIvUOfLhVFdIbOagbAGP
	Ib1A1AQuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJUgq-0003g3-Ck; Sat, 19 Sep 2020 04:41:36 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJUgn-0003ff-GD
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 04:41:34 +0000
Received: by mail-pl1-x641.google.com with SMTP id u9so4048164plk.4
 for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2020 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0U+Dbiw8JUnuvLwJ+RFlNrwPxKsZPBsQuslXlMIRDCg=;
 b=VYQfGUEAu1xJLuJK5YTF17kGuh93Q5ohcNEDSoejfjVEt3m7CxO8A7tcG7NArx8/0E
 a5W1lLZgVlcr9x/t/TSsOh2I4v/4F1aoa4LLr0iNm1aRfzTu0TQZXVb317zLs+BSlnSH
 ARB6Z5n+2hRN6Hc0xVMTnSBKaSSDCHpBLI3ddFtup8AdiSi3n56bbU6wCkQLqud595Wx
 mL9wyWOI6o7OJ2xnlVXivkB0Pva17j0PCM/kknp6x4WwqC0IdNGZZjiXmCXdW8zRUIcT
 SabCsY2uLEzb3bLZ8mhu1kQPmSVDMp7N1CkybT5fiJ+/kH0dTfNcxmIiHBd2xK7ctNjF
 GfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0U+Dbiw8JUnuvLwJ+RFlNrwPxKsZPBsQuslXlMIRDCg=;
 b=LsPkSY3wtWMgfO6Gapeh+m7n8LfIZuf4NiVdsgF3sCEL8xKwkOILYMtenWIEuBlekS
 K8MgCcH911VV6agBBVaUGizJ3Ntcu528gT7gIVeEUd+4PLj6npOmzW5I4U1utU7Ipoor
 eu4dCo+kxfUZ5is+qJDrp7igZKjqf3i4ev4OuWvHqWV7atj0s2TxNk+lFsKe2hWPvVpB
 uuvLuEhWzGn1x7x8N4cBeL+/kBbrS+pHGx6ycXKLkCRcf1fVaKNM50xgfXw3LFSRuMmk
 YKfLy8kaXm9hqVVPA5W+Cpic01SzEhTNWwAZVGCpKp9+EpuOTo2R9TmatcphUAeVRdQw
 7y8A==
X-Gm-Message-State: AOAM530XQRRH/jK2qtpIC5baL+/Ylq3S1f47S17Djp6dqULNyz1E8pnL
 QEP3LYIRFZlBojY3HrmYlU8dgQ==
X-Google-Smtp-Source: ABdhPJyB02vYW/ZXzBUzwm+xOgsNi4YTZThESy5B6wG3Zj++xNSulybh5FYd1yIMeM4g9UNRjmkveQ==
X-Received: by 2002:a17:902:ee54:b029:d1:f2ae:e2 with SMTP id
 20-20020a170902ee54b02900d1f2ae00e2mr14059738plo.3.1600490488574; 
 Fri, 18 Sep 2020 21:41:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o20sm5044877pgh.63.2020.09.18.21.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 21:41:27 -0700 (PDT)
Date: Fri, 18 Sep 2020 21:41:27 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Sep 2020 21:41:25 PDT (-0700)
Subject: Re: [PATCH] riscv: Add sfence.vma after page table changed
In-Reply-To: <CAHCEehKnFpdDamANoOfSJV2pbeMzjhxWja667PL6Sueid9imPw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-9dba0867-f793-4cec-a3a0-82190bfcfde4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_004133_634291_85539BBD 
X-CRM114-Status: GOOD (  28.48  )
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
Cc: mark.rutland@arm.com, Marc Zyngier <maz@kernel.org>, aou@eecs.berkeley.edu,
 syven.wang@sifive.com, Will Deacon <willdeacon@google.com>,
 catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org, anup@brainfault.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNCBTZXAgMjAyMCAyMDo1ODoxMyBQRFQgKC0wNzAwKSwgZ3JlZW50aW1lLmh1QHNp
Zml2ZS5jb20gd3JvdGU6Cj4gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4g5pa8
IDIwMjDlubQ45pyINeaXpSDpgLHkuIkg5LiK5Y2IMTA6MDPlr6vpgZPvvJoKPj4KPj4gT24gTW9u
LCAwMyBBdWcgMjAyMCAyMDoyOTozMiBQRFQgKC0wNzAwKSwgYW51cEBicmFpbmZhdWx0Lm9yZyB3
cm90ZToKPj4gPiBPbiBUdWUsIEF1ZyA0LCAyMDIwIGF0IDg6MzIgQU0gR3JlZW50aW1lIEh1IDxn
cmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IFRoaXMgcGF0Y2ggYWRk
ZXMgbG9jYWxfZmx1c2hfdGxiX3BhZ2UoYWRkcikgdG8gdXNlIHNmZW5jZS52bWEgYWZ0ZXIgdGhl
Cj4+ID4KPj4gPiBzL2FkZGVzL2FkZHMKPj4gPgo+PiA+PiBwYWdlIHRhYmxlIGNoYW5nZWQuIFRo
YXQgYWRkcmVzcyB3aWxsIGJlIHVzZWQgaW1tZWRpYXRlbHkgaW4KPj4gPj4gbWVtc2V0KG5leHRw
LCAwLCBQQUdFX1NJWkUpIHRvIGNhdXNlIHRoaXMgaXNzdWUgc28gd2Ugc2hvdWxkIGFkZCB0aGUK
Pj4gPj4gc2ZlbmNlLnZtYSBiZWZvcmUgd2UgdXNlIGl0Lgo+PiA+Cj4+ID4gQWx0ZXJuYXRlIHZl
cnNpb24gb2YgdGhpcyBjb21taXQgZGVzY3JpcHRpb24gY2FuIGJlOgo+PiA+Cj4+ID4gSW52YWxp
ZGF0ZSBsb2NhbCBUTEIgYWZ0ZXIgYm90aCBzZXRfcGV0KCkgYW5kIGNsZWFyX3B0ZSgpIGJlY2F1
c2UgdGhlCj4+ID4gYWRkcmVzcyBjYW4gYmUgdXNlZCBpbW1lZGlhdGVseSBhZnRlciBwYWdlIHRh
YmxlIGNoYW5nZS4KPj4gPgo+PiA+PiBGaXhlczogZjJjMTdhYWJjOTE3ICgiUklTQy1WOiBJbXBs
ZW1lbnQgY29tcGlsZS10aW1lIGZpeGVkIG1hcHBpbmdzIikKPj4gPj4KPj4gPj4gUmVwb3J0ZWQt
Ynk6IFN5dmVuIFdhbmcgPHN5dmVuLndhbmdAc2lmaXZlLmNvbT4KPj4gPj4gU2lnbmVkLW9mZi1i
eTogU3l2ZW4gV2FuZyA8c3l2ZW4ud2FuZ0BzaWZpdmUuY29tPgo+PiA+PiBTaWduZWQtb2ZmLWJ5
OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+PiA+PiAtLS0KPj4gPj4g
IGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNyArKystLS0tCj4+ID4+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+PiA+Pgo+PiA+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiA+PiBpbmRleCBm
NGFkYjM2ODRmM2QuLjI5YjBmNzEwODA1NCAxMDA2NDQKPj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9t
bS9pbml0LmMKPj4gPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gPj4gQEAgLTIwMiwx
MiArMjAyLDExIEBAIHZvaWQgX19zZXRfZml4bWFwKGVudW0gZml4ZWRfYWRkcmVzc2VzIGlkeCwg
cGh5c19hZGRyX3QgcGh5cywgcGdwcm90X3QgcHJvdCkKPj4gPj4KPj4gPj4gICAgICAgICBwdGVw
ID0gJmZpeG1hcF9wdGVbcHRlX2luZGV4KGFkZHIpXTsKPj4gPj4KPj4gPj4gLSAgICAgICBpZiAo
cGdwcm90X3ZhbChwcm90KSkgewo+PiA+PiArICAgICAgIGlmIChwZ3Byb3RfdmFsKHByb3QpKQo+
PiA+PiAgICAgICAgICAgICAgICAgc2V0X3B0ZShwdGVwLCBwZm5fcHRlKHBoeXMgPj4gUEFHRV9T
SElGVCwgcHJvdCkpOwo+PiA+PiAtICAgICAgIH0gZWxzZSB7Cj4+ID4+ICsgICAgICAgZWxzZQo+
PiA+PiAgICAgICAgICAgICAgICAgcHRlX2NsZWFyKCZpbml0X21tLCBhZGRyLCBwdGVwKTsKPj4g
Pj4gLSAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKGFkZHIpOwo+PiA+PiAtICAg
ICAgIH0KPj4gPj4gKyAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyKTsKPj4gPj4gIH0K
Pj4KPj4gYXJtNjQgYXBwZWFycyB0byBiZSB1cGdyYWRpbmcgYWxsIHNldF9wdGUoKXMgb24gdmFs
aWQga2VybmVsIG1hcHBpbmdzIHRvCj4+IGluY2x1ZGUgdGhlIGZlbmNlLiAgSXQgbG9va3MgbGlr
ZSB0aGUgbWVzc2FnZSBmcm9tIDdmMGIxYmYwNDUxMSAoImFybTY0OiBGaXgKPj4gYmFycmllcnMg
dXNlZCBmb3IgcGFnZSB0YWJsZSBtb2RpZmljYXRpb25zIikgaXMgb3V0IG9mIGRhdGUsIGFzIEkg
Y2FuJ3QgZmluZAo+PiBjcmVhdGVfbWFwcGluZygpIGFueSBtb3JlLiAgSWYgdGhhdCB3YXMgc29t
ZSBnZW5lcmljIGtlcm5lbCB0aGluZyB0aGVuIHdlCj4+IHNob3VsZCBwcm9iYWJseSB1cGdyYWRl
IG91cnMgYXMgd2VsbCwgYnV0IGlmIGl0IHdhcyBhcmNoL2FybTY0LyBjb2RlIHRoZW4gdGhpcwo+
PiBhcHByb2FjaCBzZWVtcyBmaW5lIGFzIF9fc2V0X2ZpeG1hcCgpIGlzbid0IG9uIHRoZSBob3Qg
cGF0aCAtLSBJIGd1ZXNzIHRoaXMgaXMKPj4gZmluZSBlaXRoZXIgd2F5LCBidXQgdGhlcmUgbWF5
IGJlIG90aGVyIGlzc3VlcyB0aGF0IHRoZSBhcm02NCBhcHByb2FjaCBmaXhlcy4KPj4KPj4gRG8g
eW91IGd1eXMgaGFwcGVuIHRvIHJlbWVtYmVyIHdoYXQgd2FzIGdvaW5nIG9uIGhlcmU/Cj4KPiBI
aSBQYWxtZXIsCj4KPiBTb21lIGFyY2hpdGVjdHVyZXMgYWRkIGNhY2hlIHdyaXRlYmFjayBpbiBz
ZXRfcHRlKCksIGp1c3QgbGlrZSBuZHMzMiwgY3NreS4KPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL25kczMyL2luY2x1ZGUvYXNtL3BndGFibGUu
aCNMMjEzCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2Fy
Y2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgjTDEwNAo+Cj4gV291bGQgeW91IGxpa2UgdG8g
cGljayB0aGlzIHBhdGNoIG9yIHNob3VsZCBJIHNlbmQgYW5vdGhlciBwYXRjaCB0bwo+IGltcGxl
bWVudCBpdCBpbiBzZXRfcHRlKCk/CgpTb3JyeSwgSSBmb3Jnb3QgYWJvdXQgdGhpcy4gIEknbSBw
aWNraW5nIHVwIHRoaXMgcGF0Y2ggb24gZml4ZXMsIGFzIGl0IGNsZWFybHkKZml4ZXMgYSBidWcu
ICBXZSBtaWdodCBhbHNvIGhhdmUgdW5jb3ZlcmVkIGFub3RoZXIgYnVnLCBidXQgdGhlcmUncyBu
byBzZW5zZSBpbgpsZXR0aW5nIHRoaXMgb25lIGhhbmcgYXJvdW5kIHVudGlsIHdlIGZpZ3VyZSB0
aGF0IG91dC4KCkkndmUgY2xlYW5lZCB1cCB0aGUgY29tbWVudCB0ZXh0IGEgYml0LCBhcyBBbnVw
IHBvaW50ZWQgb3V0IHNvbWUgaXNzdXNlcy4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
