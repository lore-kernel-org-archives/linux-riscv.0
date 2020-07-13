Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DEDC433EB
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 10:06:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EED2077D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 10:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sKLXkaBI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1RzZEMo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46EED2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vzdgUR1M3/kC5kULlh5R0kEBtpQGt1r3rjy9NFkaHAM=; b=sKLXkaBIzCG5bfwwwVczX4HGS
	NGG2NHTFQF87Fo2hLLammtucmJWnP1mfqju4iBXKHXPjORoxCpHlNpXm5kxjyHXg/QrgmvHjsBYnx
	iJ8nhX4kLkVeS00zVjoVOpBOdEu2AST0izrYBIbQFppC9Vp8PirWjOerlT5LqolsjqvHApmSD6INA
	eGMYHGT1Zzu+R6BajQigIPH97dp5/bkpGiqlPtv7MmPGx3ffazNCUUN/A/I3x0pPCAQJxGVQncqgN
	1oQYVikJ+vWQ4bEk2ueHbLz1cdYa5xkQvhgtTkVketU2GuSR8/MUdCep6MCrdkWB/xtsRAvj/Nrpb
	xyzMtsx2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juvLP-0004s5-D8; Mon, 13 Jul 2020 10:05:55 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juvLJ-0004oJ-3Q
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 10:05:53 +0000
Received: by mail-qv1-xf43.google.com with SMTP id h17so5524439qvr.0
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2R5FqpATOsC9anZCjDdbfJmwuMulHp2IY/fh6GixDKM=;
 b=M1RzZEMoz5QxfH8SpG+taA4nXeqDdQhlsmE7KUJcmdBZU1aCZMQAlI5y8ElOf6Fuhp
 4lh52bmfq+PnMcWMrf65ELqM4xBZhvfUb86Sl0MKqeqYSDtBPJn9vlZ3ZLWCHpazAJc/
 9s0PoRAXaDSyezsgU9OP13jwiif1veTIOUAqndwQ8KCfuxgw+AzHtYQa1xRi4GiwbZXM
 Ojjv9jB4SaGfwE1FkUXkomIv10SvKhmWJ1M5/6ApjeymByh7qiegSUUuI88ARLQw1pzh
 XnIcJZCyYJMgKpamqdjDwWqE6coAJynCjscbblgZTn0D/GtOfbpUUb5FNGSSImLkShX/
 eDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2R5FqpATOsC9anZCjDdbfJmwuMulHp2IY/fh6GixDKM=;
 b=SMUGZ1jVF2bF/taM/Lppb+v6acd/rBAATocaXx/as1+5xh5NO2ARb/MifDhsmqaJsB
 LEIPBBk1LXe0Npy4TRSs2HC3Z21f17K+lTzotgvNg1PeLxh/PKidyz+sjArhf/o5KhFf
 xBs/k+QD7e/FTDtYrOjhirMWKr5V1cu2wL89f5ByHdCFqV73bdGEQ/n1ORsHSIRBSA8P
 OdTT7KmiXsmFuil0gzsDcOkbBSu97YC9w74UlQDdOFdyvchrzKs/ivWE2h3xE9E/DoY1
 GeKWEA6KXBqilwF3IeT/exi9TW9IKxRfu0bnKlOyzwwxkP5ZZ38MiCTRCTmg1/2yyYlx
 BGsA==
X-Gm-Message-State: AOAM530RDhCiMm7qliQsbeGCNkcHNss6ziiYea08aSEaBgLMNt4NYbTE
 JRSu5ffPHVkcFRHxMoXHGmaXCK2OU/Q5caFcQn0=
X-Google-Smtp-Source: ABdhPJzFqEGiReKbwy5jLRxtaDiSvZmM3/d21BHz80ho9j12CosVkGT1LkCaauKrTm3/r4dgwAWY3ecgapZq6+wKTMw=
X-Received: by 2002:a0c:cd84:: with SMTP id v4mr44981386qvm.35.1594634747242; 
 Mon, 13 Jul 2020 03:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-5-hch@lst.de>
In-Reply-To: <20200710135706.537715-5-hch@lst.de>
From: Greentime Hu <green.hu@gmail.com>
Date: Mon, 13 Jul 2020 18:05:10 +0800
Message-ID: <CAEbi=3dSkAcTey8WeRuxN7oYq_O47QAZffLwruQRbpGpmqT-yA@mail.gmail.com>
Subject: Re: [PATCH 4/6] uaccess: remove segment_eq
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_060549_225124_32BCEBFC 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IOaWvCAyMDIw5bm0N+aciDEw5pelIOmAseS6
lCDkuIvljYg5OjU35a+r6YGT77yaCj4KPiBzZWdtZW50X2VxIGlzIG9ubHkgdXNlZCB0byBpbXBs
ZW1lbnQgdWFjY2Vzc19rZXJuZWwuICBKdXN0IG9wZW4gY29kZQo+IHVhY2Nlc3Nfa2VybmVsIGlu
IHRoZSBhcmNoIHVhY2Nlc3MgaGVhZGVycyBhbmQgcmVtb3ZlIG9uZSBsYXllciBvZgo+IGluZGly
ZWN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICAgfCAyICstCj4g
IGFyY2gvYXJjL2luY2x1ZGUvYXNtL3NlZ21lbnQuaCAgICAgICAgfCAzICstLQo+ICBhcmNoL2Fy
bS9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgIHwgNCArKy0tCj4gIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oICAgICAgfCAyICstCj4gIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9z
ZWdtZW50LmggICAgICAgfCAyICstCj4gIGFyY2gvaDgzMDAvaW5jbHVkZS9hc20vc2VnbWVudC5o
ICAgICAgfCAyICstCj4gIGFyY2gvaWE2NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgfCAy
ICstCj4gIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9zZWdtZW50LmggICAgICAgfCAyICstCj4gIGFy
Y2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAyICstCj4gIGFyY2gvbWlwcy9p
bmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgfCAyICstCj4gIGFyY2gvbmRzMzIvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oICAgICAgfCAyICstCj4gIGFyY2gvbmlvczIvaW5jbHVkZS9hc20vdWFjY2Vz
cy5oICAgICAgfCAyICstCj4gIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAg
fCAyICstCj4gIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgfCAyICstCj4g
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgfCAzICstLQo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgIHwgNCArLS0tCj4gIGFyY2gvczM5MC9pbmNs
dWRlL2FzbS91YWNjZXNzLmggICAgICAgfCAyICstCj4gIGFyY2gvc2gvaW5jbHVkZS9hc20vc2Vn
bWVudC5oICAgICAgICAgfCAzICstLQo+ICBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3VhY2Nlc3Nf
MzIuaCAgIHwgMiArLQo+ICBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaCAgIHwg
MiArLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgIHwgMiArLQo+ICBh
cmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgIHwgMiArLQo+ICBpbmNsdWRlL2Fz
bS1nZW5lcmljL3VhY2Nlc3MuaCAgICAgICAgIHwgNCArKy0tCj4gIGluY2x1ZGUvbGludXgvdWFj
Y2Vzcy5oICAgICAgICAgICAgICAgfCAyIC0tCj4gIDI0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2Vy
dGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+ClsuLi5dCj4gZGlmZiAtLWdpdCBhL2FyY2gvbmRz
MzIvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNz
LmgKPiBpbmRleCAzYTkyMTlmNTNlZTBkOC4uMDEwYmE1ZjFkN2RkNmIgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9hcmNoL25kczMyL2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC00NCw3ICs0NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
ZXRfZnMobW1fc2VnbWVudF90IGZzKQo+ICAgICAgICAgY3VycmVudF90aHJlYWRfaW5mbygpLT5h
ZGRyX2xpbWl0ID0gZnM7Cj4gIH0KPgo+IC0jZGVmaW5lIHNlZ21lbnRfZXEoYSwgYikgICAgICAg
KChhKSA9PSAoYikpCj4gKyNkZWZpbmUgdWFjY2Vzc19rZXJuZWwoKSAgICAgICAoZ2V0X2ZzKCkg
PT0gS0VSTkVMX0RTKQo+Cj4gICNkZWZpbmUgX19yYW5nZV9vayhhZGRyLCBzaXplKSAoc2l6ZSA8
PSBnZXRfZnMoKSAmJiBhZGRyIDw9IChnZXRfZnMoKSAtc2l6ZSkpCj4KSGkgQ2hyaXN0b3BoLCBU
aGFuayB5b3UuCkFja2VkLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVuLmh1QGdtYWlsLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
