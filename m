Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC950C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 04:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AF061107
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 04:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30AF061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CK/VZlAcIkYUQC/7wAo2BB99IV7lddVLNSJGykeFQ0o=; b=1Q0SkhFpQMUIC+
	f5SD5ryvQV31Yp+s+9yfMMXSLlvcwRU3uG24o8NLnrWIjniKaPotc4xqGlC5yZ2bnrlkvDUTmu+uX
	bPzl9Pj8ECpj6VwwXPcpKCm8Cz30N2yUEsA+DpcFxuuG7B0vUv+oj8x/h71AzA7zRjKDhhtVBd/nj
	r+So+pCfNqleGEhUx3YK8jFvyilbdFJt23abQrtRLcLISJDkJCvkOMF1fMtLeFD1XGhn9FxIhmFIn
	VS+gjNzHv1ayCmhGNkvVVqGMGmewBf/BJFGah8BcdXH1a3Io7bQcg2HeG+KnXT+F8cn/zLh7Y11cH
	ikUm0sbi+DV7zXFRqebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTcv4-00D51d-U1; Fri, 24 Sep 2021 04:34:42 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTcv1-00D514-ND
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 04:34:41 +0000
Received: by mail-il1-x134.google.com with SMTP id i13so8993807ilm.4
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 21:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2r3uHfiNTEeauI0qfOMLdIlPnnjW+o7oi9itFKgNNmo=;
 b=fdGPBfTIIKmH8Ik+1f3lUEUMb8jFS/BFVFKhiWWulXm5ZJhjP92WmTlype1RVSjDkV
 l5kt8t3VvnDaMlBZnXLB6iZDpokrW39ZZGfkursRajR8yyS12bOM9QCNSUpP0IQbrFkO
 qkr33cDNczNmXBKCas0BR0rg39eaNcBRW5/EQT2s0IkHgIU/pLnKlYChY3pSAebeEXvO
 LmRWvX5DTRNP268BNkKVoXSrxbHxCQ8dvD52hRpocR+dB4po7zOeNCRGqmEob85s5tdj
 eBiZGcYaD29G5rOCykoi/nO2/5o7Ud5GnS2qMDKI4MHKLb2U0d4FCk0qriKkW57uB/aM
 KgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2r3uHfiNTEeauI0qfOMLdIlPnnjW+o7oi9itFKgNNmo=;
 b=fYHunyQEuxYk7y8sPSX+TK95YXgk7BtJg6/LwF1GEnZUM7oUPDPMTVONNxRj5itBhG
 L0vBQUTM0YxwaMp2xoWbRCgO/9ZzucWZSlUWIQsIUQ+BO8E4s4Jj3HDJyf2O3a/rfBnK
 TGYvGMbAnI6RpiG9sFmMXzoqyYX/pmosAnBcZ5w/q6SgHyza0aeONH5XxwGKekNEbcIX
 B7+81zG/VO7uRCY4EdIEHp+sh6NaFcxO/P/LaK89QJJtDa3yOGVI3zOGPPWy4PUouY93
 pxu0gzQlLqxJVe/4dQyTqP9vvt/ZUx1Fywy5WvS5OdqBmGqinrFxTvFkTR4++ZuGTDts
 utfg==
X-Gm-Message-State: AOAM531T/HzS5mY0cfAf9m4yy7hBbVvoTak6+P3FtqvC8+n19pv8UspJ
 O0oZK1orGQjbAdPV1wrMvIpr1rnTFsiGzs8Te9A=
X-Google-Smtp-Source: ABdhPJzEgBABW4mg2utXHmBrllZW9Z85DYLZ9jFrATnK8EeNSzpxxUEjhvDeaZruoslRCDJJpaNQGi/6Ll9SK8alKw8=
X-Received: by 2002:a05:6e02:1088:: with SMTP id
 r8mr6568454ilj.46.1632458078345; 
 Thu, 23 Sep 2021 21:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
In-Reply-To: <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 14:34:12 +1000
Message-ID: <CAKmqyKM+VN-KST9-VMULZMC=2sNbjH2wiE-CZ1WRfVFj3WmpdQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, 
 Jiri Olsa <jolsa@redhat.com>, linux-perf-users@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_213439_822420_388FBC7C 
X-CRM114-Status: GOOD (  28.06  )
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

T24gVHVlLCBTZXAgMjEsIDIwMjEgYXQgODo0NyBBTSBBbmRyw6kgQWxtZWlkYSA8YW5kcmVhbG1l
aWRAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGlzdGFpciwKPgo+IMOAcyAwMzoxMCBk
ZSAxNy8wOS8yMSwgQWxpc3RhaXIgRnJhbmNpcyBlc2NyZXZldToKPiA+IEZyb206IEFsaXN0YWly
IEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KPiA+Cj4gPiBTb21lIDMyLWJpdCBh
cmNoaXRlY3R1cmVzIChzdWNoIGFyZSAzMi1iaXQgUklTQy1WKSBvbmx5IGhhdmUgYSA2NC1iaXQK
PiA+IHRpbWVfdCBhbmQgYXMgc3VjaCBkb24ndCBoYXZlIHRoZSBTWVNfZnV0ZXggc3lzY2FsbC4g
VGhpcyBwYXRjaCB3aWxsCj4gPiBhbGxvdyB1cyB0byB1c2UgdGhlIFNZU19mdXRleF90aW1lNjQg
c3lzY2FsbCBvbiB0aG9zZSBwbGF0Zm9ybXMuCj4gPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
ISBIb3dldmVyLCBJIGRvbid0IHRoaW5rIHRoYXQgYW55IGZ1dGV4IG9wZXJhdGlvbgo+IGF0IHBl
cmYgaGFzIHRpbWVvdXQuIERvIHlvdSBwbGFuIHRvIGltcGxlbWVudCBhIHRlc3QgdGhhdCB1c2Ug
aXQ/IE9yIHRoZQo+IGlkZWEgaXMgdG8gZ2V0IHRoaXMgcmVhZHkgZm9yIGl0IGluIGNhc2Ugc29t
ZW9uZSB3YW50IHRvIGRvIHNvIGluIHRoZQo+IGZ1dHVyZT8KCkkgZG9uJ3QgaGF2ZSBwbGFucyB0
byBpbXBsZW1lbnQgYW55IG5ldyB0ZXN0cyAoYWx0aG91Z2ggSSdtIGhhcHB5IHRvCmFkZCBvbmUg
aWYgbmVlZCBiZSkuCgpNeSBnb2FsIHdhcyBqdXN0IHRvIGdldCB0aGlzIHRvIGJ1aWxkIGZvciBS
SVNDLVYgMzItYml0LiBUaGUgdGltZW91dAp3YXMgYWxyZWFkeSBleHBvc2VkIGJ5IHRoZSBvbGQg
ZnV0ZXggbWFjcm8sIHNvIEkgd2FzIGp1c3QgZm9sbG93aW5nCnRoYXQuCgo+Cj4KPiBBbHNvLCBJ
IGZhY2VkIGEgc2ltaWxhciBwcm9ibGVtIHdpdGggdGhlIG5ldyBmdXRleDIgc3lzY2FsbHMsIHRo
YXQKPiBzdXBwb3J0cyBleGNsdXNpdmVseSA2NGJpdCB0aW1lc3BlYy4gQnV0IEkgdG9vayBhIGRp
ZmZlcmVudCBhcHByb2FjaDogSQo+IGNhbGxlZCBfX05SX2Nsb2NrX2dldHRpbWU2NCBmb3IgMzJi
aXQgYXJjaGl0ZWN0dXJlcyBzbyBpdCB3b3VsZG4ndAo+IHJlcXVpcmUgdG8gY29udmVydCB0aGUg
c3RydWN0Ogo+Cj4gI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IF9fVElNRVNJWkUgPT0gMzIKPiAj
IGRlZmluZSBOUl9nZXR0aW1lNjQgX19OUl9jbG9ja19nZXR0aW1lNjQKPiAjZWxzZQo+ICMgZGVm
aW5lIE5SX2dldHRpbWU2NCBfX05SX2Nsb2NrX2dldHRpbWUKPiAjZW5kaWYKPgo+IHN0cnVjdCB0
aW1lc3BlYzY0IHsKPiAgICAgICAgIGxvbmcgbG9uZyB0dl9zZWM7ICAgICAgIC8qIHNlY29uZHMg
Ki8KPiAgICAgICAgIGxvbmcgbG9uZyB0dl9uc2VjOyAgICAgIC8qIG5hbm9zZWNvbmRzICovCj4g
fTsKPgo+IGludCBnZXR0aW1lNjQoY2xvY2tfdCBjbG9ja2lkLCBzdHJ1Y3QgdGltZXNwZWM2NCAq
dHYpCj4gewo+ICAgICAgICAgcmV0dXJuIHN5c2NhbGwoTlJfZ2V0dGltZTY0LCBjbG9ja2lkLCB0
dik7Cj4gfQo+Cj4gVGhlbiB3ZSBjYW4ganVzdCB1c2UgJnRpbWVvdXQgYXQgX19OUl9mdXRleF90
aW1lNjQgZm9yIDMyYml0IGFyY2ggYW5kIGF0Cj4gX19OUl9mdXRleCBmb3IgNjRiaXQgYXJjaC4K
ClNvIHRoZSBpZGVhIGlzIHRvIHVzZSA2NC1iaXQgdGltZV90IGV2ZXJ5d2hlcmUgYW5kIG9ubHkg
d29yayBvbiA1LjErIGtlcm5lbHMuCgpJZiB0aGF0J3MgdGhlIGZhdm91cmVkIGFwcHJvYWNoIEkg
Y2FuIGNvbnZlcnQgdGhpcyBzZXJpZXMgdG8geW91ciBpZGVhLgoKQWxpc3RhaXIKCj4KPiBUaGlz
IG1pZ2h0IGJlIGEgc2ltcGxlciBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbSB0aGF0IHlvdSBhcmUg
ZmFjaW5nIGJ1dAo+IEknbSBub3QgZW50aXJlbHkgc3VyZS4gQWxzbywgZnV0ZXgncyBzZWxmdGVz
dHMgZG8gdXNlIHRoZSB0aW1lb3V0Cj4gYXJndW1lbnQgYW5kIEkgdGhpbmsgdGhhdCB0aGV5IGFs
c28gd29uJ3QgY29tcGlsZSBpbiAzMi1iaXQgUklTQy1WLCBzbwo+IG1heWJlIHdlIGNhbiBzdGFy
dCBmcm9tIHRoZXJlIHNvIHdlIGNhbiBhY3R1YWxseSB0ZXN0IHRoZSB0aW1lb3V0Cj4gYXJndW1l
bnQgYW5kIGNoZWNrIGlmIGl0J3Mgd29ya2luZy4KPgo+IFRoYW5rcywKPiAgICAgICAgIEFuZHLD
qQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
