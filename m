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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D04C433E3
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 10:03:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76D12068F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 10:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lW7WMXP8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR22FJr5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76D12068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RNIjKPSXia9W1aQQm8G4DRWW+OxYbXEwvkMw9j/+OKY=; b=lW7WMXP85dHiIPTe2vdkxiLHm
	5oMyfNAA6xpQ+4G9z2wUQild2km2iO5DDz89p57T/nThYdrcnT1YcWUNTfwBN0mxyRsighl9C+R71
	6WndRKlfesPAGJaswKzmdEh4nSnG1jFtDemgnkYyW4OaaVxqmVyxOHisiX9W4kbzfgyXx8DpmRQdr
	cX3ID+RTWWdrTeP+OXTK1PTCTUJycIXpRoGRdR70OQTFT1LLZruhZacXSzwsnDYhdwX+JYWkf4J+S
	wPS0qmVANIWlGscl/EuyvlQf2YqnJUutozuFXJtAx63uLTvmrjAsAjWRI2jdSjxFzOAAK0+7/kPK+
	7fQx/AsOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juvJ3-00049W-1m; Mon, 13 Jul 2020 10:03:29 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juvIy-00046t-Sg
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 10:03:26 +0000
Received: by mail-qv1-xf42.google.com with SMTP id e3so5482158qvo.10
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1Bp6ooBnl29LgQwgRasRlGwvso/97p63GtfZ5PiBQTw=;
 b=fR22FJr528HTbVr5yiXlhTnjGckWEGpRvUrfyASmhnDxv6mvCczdyorbQCxUHO6G3T
 4q9ZBdkP1yjgEj59VZVCDj3VFcZoXzLjOoDn1Sg23HMGi7cxs1/9ml3IHiBW9nmjM1zc
 pNrmqAneD7xhJynGDsNTRlI1VUgbs41JNz+qsasrr9rHx87rYwUsMWmfGGfXHcfVomWh
 bwB6J+Za2xh4yLI4L8YNvnNJ7IMLIIcK1+qjgA6EW5lnnUWakEqyRj5uAbPQt2XyOULt
 Jb3sjcmmLgcspQ1IAkGNLXyykglmsY4ZKOAPw56zJmk3NggmDBfeFJFjIa5vGF4KA7hL
 cOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1Bp6ooBnl29LgQwgRasRlGwvso/97p63GtfZ5PiBQTw=;
 b=TRpX+WnpvSyeKvpMmFMyKs7uoqCNpvTrDdla5KN3gRJpu31kSAmPLiPI4LgpBgzPvD
 L7MM2J3YypUhfuJnFnLHsdXRrPI+wGfOhCZR8tny/iZrCzD8dv43tqq0NAH71KpmXv6X
 LdQ5r0uVqtMnivAtzI6XDlXxHVn4pJaq2fGKX3C6YJEKRvEwyjjqFzXVyipPSFnPbEVn
 XW0n1S6jumpS8p2hTefyrDVkFlGI7EKLkXK6DYyN60SgJnZngV0ggvpIEs0EsNdLdaD6
 DFTheOk6AVSEoSMSbgPQReNREgmbPTIavADZGeX0pXBxrIfpr6wtbJkxnsqiMknTQImz
 WwSA==
X-Gm-Message-State: AOAM531HxXuQnP1zd0Qe9ZiFy21KXrHbynO0SStzhlmX8Cwsd/pVXGMN
 rzKlL0cz72kLfuncj6IEpymtzfoUfgs1+oIr8WY=
X-Google-Smtp-Source: ABdhPJyG9JgXRd06w9jCyfF/WDMYIp+vUYSvmAwfGAEme8KlkS+YHZBhN5qetyJzGOkuVRlY4lr0HRKihqYP5EOwdVo=
X-Received: by 2002:a0c:fe01:: with SMTP id x1mr77159663qvr.246.1594634601328; 
 Mon, 13 Jul 2020 03:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-3-hch@lst.de>
In-Reply-To: <20200710135706.537715-3-hch@lst.de>
From: Greentime Hu <green.hu@gmail.com>
Date: Mon, 13 Jul 2020 18:02:44 +0800
Message-ID: <CAEbi=3dKwDQ5-wdxQagX2n5Z3tYeYwTcmDNqxPH=83Dy-VKA1w@mail.gmail.com>
Subject: Re: [PATCH 2/6] nds32: use uaccess_kernel in show_regs
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_060324_982335_7B503C2E 
X-CRM114-Status: GOOD (  13.93  )
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
lCDkuIvljYg5OjU35a+r6YGT77yaCj4KPiBVc2UgdGhlIHVhY2Nlc3Nfa2VybmVsIGhlbHBlciBp
bnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9uZHMzMi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9uZHMzMi9r
ZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggOTcxMmZkNDc0ZjJjYTMuLmYwNjI2NTk0OWVjMjhiIDEw
MDY0NAo+IC0tLSBhL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvbmRz
MzIva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC0xMjEsNyArMTIxLDcgQEAgdm9pZCBzaG93X3JlZ3Mo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgICAgICAgIHJlZ3MtPnVyZWdzWzNdLCBy
ZWdzLT51cmVnc1syXSwgcmVncy0+dXJlZ3NbMV0sIHJlZ3MtPnVyZWdzWzBdKTsKPiAgICAgICAg
IHByX2luZm8oIiAgSVJRcyBvJXMgIFNlZ21lbnQgJXNcbiIsCj4gICAgICAgICAgICAgICAgIGlu
dGVycnVwdHNfZW5hYmxlZChyZWdzKSA/ICJuIiA6ICJmZiIsCj4gLSAgICAgICAgICAgICAgIHNl
Z21lbnRfZXEoZ2V0X2ZzKCksIEtFUk5FTF9EUyk/ICJrZXJuZWwiIDogInVzZXIiKTsKPiArICAg
ICAgICAgICAgICAgdWFjY2Vzc19rZXJuZWwoKSA/ICJrZXJuZWwiIDogInVzZXIiKTsKPiAgfQo+
Cj4gIEVYUE9SVF9TWU1CT0woc2hvd19yZWdzKTsKCkhpIENocmlzdG9waCwgVGhhbmsgeW91LgpB
Y2tlZC1ieTogR3JlZW50aW1lIEh1IDxncmVlbi5odUBnbWFpbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
