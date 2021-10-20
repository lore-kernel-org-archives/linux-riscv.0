Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1879AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 01:56:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA78E6112D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 01:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA78E6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ye4zu2HTBf2xbECMDr7G0DZqf9+d2TVrsmgyuWLE+mo=; b=UdGIRgZDIDBo5N
	f2cTiiI0fMpavlc8Ka4r4C2LfRug3vtIhMWS85XQO3weQpzaOqWQQJmZNWYGlum374BtR1+/Vi0vj
	Mx4HHmOXU2xezJpFOJtyPO/uutbX0H3yqzAA6qhgk0kyVDqy1lsK74v0UqPjhS5W0ijx3GwPA5vLV
	nTfSDMYx9DslD3T5zMfYQviCTj7JToyZy73M9qILE+b7odsGjlvbI297eVwEuMRyJNFMJnj7anj9q
	56mWK8kFm48SDifEPC5gl4WkXh8pM5aV8W6uzhi4nCzfm3JgG0VDItr+TuslLA2I9YGWds2kAGiqy
	RXkovgXXoo0I6y8Sldgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md0qQ-0039wS-Al; Wed, 20 Oct 2021 01:56:42 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md0qN-0039vT-Ls
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 01:56:41 +0000
Received: by mail-io1-xd2c.google.com with SMTP id o184so10699818iof.6
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DFVDY1TJPfx7Pv2rJU4HCu/PwzjdV9E9KpImILjaAsk=;
 b=NUcLe5roZ29vnvGWcS+csTcdd3v6W8cSjAFujWc8dr4t1VqRmtvSmPRpV8mWXKdued
 tXexRLFSyJ51ctf76vfQ41AAymfkz7iT1AVmSrAonT2b2xqtN+q7qFVxEdwTDPGyE/QK
 xtAsa2N8Co0Xs9WUYEYXm80WFhq7exVuUvorFmWYYISBWRaSrh8CtlA+jVSSoZ8xwVql
 WltprzlDWEtoy/Ci1nCvndvwENwo6eYCUJn5GWICtiEcNDFttXzc07B7r7m4DTrIz6ni
 Q+PxbAiccUIdApujy66OZcfc0zvRPVwQO9G3ayAwTEJgAxaUbyjHcHRrrOeobnzh/YaP
 o8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DFVDY1TJPfx7Pv2rJU4HCu/PwzjdV9E9KpImILjaAsk=;
 b=s9ey54pA3TvESmuuORSZMM8Jfa5Ei4dimZLAf/crF4BSVkHsYMj/W+XvxnkfEd5x5r
 2Rmoic7urG6qe8lFUCuprPI52IJCtR1iXn0V43oGRkB5xYNn4OrWupa93xpGHbJNlCZc
 L6YlB2REUsV9khj4zrfENLl5ip7CXRFLJycEa10eNddF1CqQim/hpIBMyLJt+PPXHnlv
 SpeF/pNddteGHSyFGhv1K2CWEALcOi1txICoPKav7r4l5DWm0M1gh9OFRYlTEI4apfIq
 wXMit3PJ7W1V+LaqK4iAI5yoW+E1CXmmfr9Nbai6UMTvdh5XFhVZBNxo7TK96aca1GbL
 5zNQ==
X-Gm-Message-State: AOAM530MPMreprLYH5fdluIJFFt8kQ725yedSEFdoIKO4VljswPOpTvb
 5r/Feaf4XgVQIlyQdU5yYlSXSeIIPd75ihVwYyYGTLmnR63j5w==
X-Google-Smtp-Source: ABdhPJwDNbtfj+34pBOJjmx8T8tmETtM9BhtTtPAPHE6GTvRprbadPwkvaoiHNh3AW9RvFjv0nA4rZLRKD2BUN7a3PY=
X-Received: by 2002:a05:6638:1192:: with SMTP id
 f18mr6661747jas.114.1634694998856; 
 Tue, 19 Oct 2021 18:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
 <YW74wK03ibOS3jVZ@kernel.org>
 <CAKmqyKP6AU-9tcYOp-ERvYFP7t6DMp4kbQgDmJxD6wb0WTUy+w@mail.gmail.com>
 <0d55b0a0-dd8c-0494-a200-7acb1976e32a@collabora.com>
In-Reply-To: <0d55b0a0-dd8c-0494-a200-7acb1976e32a@collabora.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 11:56:12 +1000
Message-ID: <CAKmqyKNZAkxO_QQ2oTYp1JK0q0GxZ1iQdsmKW==mkOHbacPE1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf bench futex: Use a 64-bit time_t
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-perf-users@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>, 
 Darren Hart <dvhart@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Atish Patra <atish.patra@wdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_185639_735226_8E40E9D0 
X-CRM114-Status: GOOD (  17.53  )
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

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMTA6MDEgQU0gQW5kcsOpIEFsbWVpZGEKPGFuZHJlYWxt
ZWlkQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gw4BzIDIwOjE3IGRlIDE5LzEwLzIxLCBBbGlz
dGFpciBGcmFuY2lzIGVzY3JldmV1Ogo+ID4gT24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMjo1NiBB
TSBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8KPiA+IDxhcm5hbGRvLm1lbG9AZ21haWwuY29tPiB3
cm90ZToKPiA+Pgo+ID4+IEVtIEZyaSwgT2N0IDE1LCAyMDIxIGF0IDEwOjU2OjMzQU0gKzEwMDAs
IEFsaXN0YWlyIEZyYW5jaXMgZXNjcmV2ZXU6Cj4gPj4+IEZyb206IEFsaXN0YWlyIEZyYW5jaXMg
PGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KPiA+Pj4KPiA+Pj4gQ29udmVydCB0b29scy9wZXJm
IHRvIG9ubHkgdXNlIGEgNjQtYml0IHRpbWVfdC4gT24gNjQtYml0IGFyY2hpdGVjdHVyZXMKPiA+
Pj4gdGhpcyBpc24ndCBhIGZ1bmN0aW9uYWwgY2hhbmdlLiBPbiAzMi1iaXQgYXJjaGl0ZWN0dXJl
cyB3ZSBub3cgb25seQo+ID4+PiBwZXJmb3JtIDY0LWJpdCB0aW1lX3Qgc3lzY2FsbHMgKF9fTlJf
ZnV0ZXhfdGltZTY0KSBhbmQgdXNlIGEgc3RydWN0Cj4gPj4+IHRpbWVzcGVjNjQuCj4gPj4+Cj4g
Pj4+IFRoaXMgd29uJ3Qgd29yayBvbiBrZXJuZWxzIGJlZm9yZSA1LjEsIGJ1dCBhcyBwZXJmIGlz
IHRpZWQgdG8gdGhlIGtlcm5lbAo+ID4+PiB0aGF0J3Mgb2suCj4gPj4KPiA+PiBObywgcGVyZiBp
cyBub3QgdGllZCB0byB0aGUga2VybmVsLCBvbmUgY2FuIHVzZSBhIG5ldyBwZXJmIHRvb2wgb24g
YW55Cj4gPj4gcHJldmlvdXMga2VybmVsLCBhbmQgYW4gb2xkIHBlcmYgdG9vbCBzaG91bGQgd29y
ayBvbiBuZXcga2VybmVscyBhcwo+ID4+IHdlbGwuCj4gPgo+ID4gKyBBbmRyw6ksIEkgd29uJ3Qg
YmUgZG9pbmcgdGhpcyB0aGUgd2F5IHlvdSByZXF1ZXN0ZWQKPiA+Cj4KPiBPaywgdGhhbmtzIGFu
eXdheSBmb3IgeW91ciB3b3JrIGFuZCBzb3JyeSBmb3IgdGhlIHRyb3VibGUgOikKCk5vIHdvcnJp
ZXMhCgpBbGlzdGFpcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
