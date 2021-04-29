Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6465C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 14:41:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFD861029
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 14:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CFD861029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bh4oykyUZbT06zizwtY9U9D0VIIqhyozr8dfg1UjL98=; b=PIY8YgkbCs8BEeZXG7fb1E3cf
	NPsN+XdvqX+XKSpzXEr9d0fnfvIEmMPSuEL82jjblpy1Vgvhus1KzBk7gaj0wm9dm8Y4eTZXlwITf
	IvGH7+WZcpgUlOqBgVe5EiQzaKzxo0cswRuJQxcOrYpV7gDZd8qJiuUSuB60oyNPNkX4LSxEvVy0j
	pfpoxkB6/lJZPr8ARLkHKQmEAh4lyqhB7EtIqWpIgIS8rYkSz4gcI1JLvp1LxWaJLDzwCDuJElaCi
	cAOlY/lTSrnoCrX03vy/USY5LhVQJ6I9tLLMOp1DEEAaxInoXyfHgX2nmyGnsUcnMyYuizIiKo+qU
	OL3/PB1RA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc7rI-005qi3-Gz; Thu, 29 Apr 2021 14:41:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7rG-005qhk-2Y
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 14:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=1duNQ45gysbugwXrktBTo31sNNlK9JvBYcuHKmnWwBs=; b=KbamiftrKLM17ZDEJACpVJ0sq4
 mVX4snSBHGpA8K+I9YqwWDW9IetNVSRYvGgZJw/whGnl3rCyjq0gcRqYlSEYAYD8LHyf6xfRsG8RT
 5ffY2y2g/qCab6Bagmw9MW9gil0dSWqAcU7EMj1skreFxp38kwMSPI55K6ZdpAUq/47Xz5Lep57SX
 DoiLvTM5RpFOlgEIe428ZKdjtZaFh7ZojuewkKA6N4Qw1rViVZ2Skqsr+3xVj4RNTRwnd+6ID6nUc
 aoWBD3Tuv1gRhO4/Qodx7VoPXqBVJmFEi2tKNuytoCNy3jYegjPPtp2+CQMaDgBQdXnCJFogEQMoz
 bvkFSnZw==;
Received: from mail-vs1-f51.google.com ([209.85.217.51])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7rD-000hJ2-4V
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 14:41:36 +0000
Received: by mail-vs1-f51.google.com with SMTP id k124so33851643vsk.3
 for <linux-riscv@lists.infradead.org>; Thu, 29 Apr 2021 07:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1duNQ45gysbugwXrktBTo31sNNlK9JvBYcuHKmnWwBs=;
 b=YBs5T9B0GwTP8wLwsY+U3WFnZfC0SWpJePxEzX3pOHHUi+CtJBc75nTRKVugnbyYQE
 gPSY0qj9ux/LmZUzUMrUSDOHlqGg1UWsf0nLwN9k1IC4zsF0fn+wdhMo5rJxWv1cW8Eb
 gnhzh2HeQKCvp+tPdJbX6f2jZIE32lgwsIRrO9SzLFiP6i932z1NZqG5nQjGbNufTvzi
 bEpowB/GRPIMOS9tbOyJ+geJ6DBLcVUfeQGlf6tS4/BB7xAVYf+hjgfYwxRJE3I7xDXT
 JDI3fkxiL8A1lfks+KR9EdYPCdbjn8IvZrzuxePcO6EFXQ3wOBntJCBsjQX7tGU/qtTm
 lfwA==
X-Gm-Message-State: AOAM53383kSG8ZQKtyEiCvwzHp1jzbLjRSk5eT2PwiHmLt2wUqu2eTyO
 1h0i0ijC85vpFj6ySzs2C4DInE6rnHE92iLBrDU=
X-Google-Smtp-Source: ABdhPJxaE0d5lgxiwnQ9Nvnc2pxVgy9FTuxI8ZPVZwlv5na3rF4773vo6jNMOeXIgB+ks1yo26uXkSWjR8QDiUmyku8=
X-Received: by 2002:a67:8745:: with SMTP id j66mr366840vsd.18.1619707293304;
 Thu, 29 Apr 2021 07:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <1a7660125046b94db9c6a7d62aa0ce88c8cd2f1d.1619617340.git.geert+renesas@glider.be>
 <605dc5e8-0a41-7458-6037-d6263b0ffd59@ghiti.fr>
In-Reply-To: <605dc5e8-0a41-7458-6037-d6263b0ffd59@ghiti.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Apr 2021 16:41:21 +0200
Message-ID: <CAMuHMdWV69hjaja=8YyjuvTUDwrO_oryJzhwgoR4Kfz0esUhZg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Only extend kernel reservation if mapped read-only
To: alex@ghiti.fr
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_074135_197315_66E2EAAE 
X-CRM114-Status: GOOD (  31.02  )
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

SGkgQWxleCwKCk9uIFRodSwgQXByIDI5LCAyMDIxIGF0IDQ6MDkgUE0gQWxleCBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4gd3JvdGU6Cj4gTGUgNC8yOC8yMSDDoCA5OjQ1IEFNLCBHZWVydCBVeXR0ZXJo
b2V2ZW4gYSDDqWNyaXQgOgo+ID4gV2hlbiB0aGUga2VybmVsIG1hcHBpbmcgd2FzIG1vdmVkIG91
dHNpZGUgb2YgdGhlIGxpbmVhciBtYXBwaW5nLCB0aGUKPiA+IGtlcm5lbCBtZW1vcnkgcmVzZXJ2
YXRpb24gd2FzIGluY3JlYXNlZCwgdG8gdGFrZSBpbnRvIGFjY291bnQgbWFwcGluZwo+ID4gZ3Jh
bnVsYXJpdHkuICBIb3dldmVyLCB0aGlzIGlzIGRvbmUgdW5jb25kaXRpb25hbGx5LCByZWdhcmRs
ZXNzIG9mCj4gPiB3aGV0aGVyIHRoZSBrZXJuZWwgbWVtb3J5IGlzIG1hcHBlZCByZWFkLW9ubHkg
b3Igbm90Lgo+ID4KPiA+IElmIHRoaXMgZXh0ZW5zaW9uIGlzIG5vdCBuZWVkZWQsIHVwIHRvIDIg
TWlCIG1heSBiZSBsb3N0LCB3aGljaCBoYXMgYQo+ID4gYmlnIGltcGFjdCBvbiBlLmcuIENhbmFh
biBLMjEwICg2NC1iaXQgbm9tbXUpIHBsYXRmb3JtcyB3aXRoIG9ubHkgOCBNaUIKPiA+IG9mIFJB
TS4KPiA+Cj4gPiBSZWNsYWltIHRoZSBsb3N0IG1lbW9yeSBieSBvbmx5IGV4dGVuZGluZyB0aGUg
cmVzZXJ2ZWQgcmVnaW9uIHdoZW4KPiA+IG5lZWRlZCwgaS5lLiBtYXRjaGluZyB0aGUgY29uZGl0
aW9uYWwgbG9naWMgYXJvdW5kIHRoZSBjYWxsIHRvCj4gPiBwcm90ZWN0X2tlcm5lbF9saW5lYXJf
bWFwcGluZ190ZXh0X3JvZGF0YSgpLgo+ID4KPiA+IEZpeGVzOiAyYmZjNmNkODFiZDE3ZTQzICgi
cmlzY3Y6IE1vdmUga2VybmVsIG1hcHBpbmcgb3V0c2lkZSBvZiBsaW5lYXIgbWFwcGluZyIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPgo+ID4gLS0tCj4gPiBPbmx5IHRlc3RlZCBvbiBLMjEwIChTaVBlZWQgTUFJWCBCaVQpOgo+
ID4KPiA+ICAgICAgLU1lbW9yeTogNTg1MksvODE5MksgYXZhaWxhYmxlICgxMzQ0SyBrZXJuZWwg
Y29kZSwgMTQ3SyByd2RhdGEsIDI3Mksgcm9kYXRhLCAxMDZLIGluaXQsIDcySyBic3MsIDIzNDBL
IHJlc2VydmVkLCAwSyBjbWEtcmVzZXJ2ZWQpCj4gPiAgICAgICtNZW1vcnk6IDU5NDhLLzgxOTJL
IGF2YWlsYWJsZSAoMTM0NEsga2VybmVsIGNvZGUsIDE0N0sgcndkYXRhLCAyNzJLIHJvZGF0YSwg
MTA2SyBpbml0LCA3MksgYnNzLCAyMjQ0SyByZXNlcnZlZCwgMEsgY21hLXJlc2VydmVkKQo+ID4K
PiA+IFllcywgSSB3YXMgbHVja3ksIGFzIG9ubHkgOTYgS2lCIHdhcyBsb3N0IDstKQo+ID4gLS0t
Cj4gPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMTAgKysrKysrKystLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRl
eCA3ODhlYjIyMmRlYWNmOTk0Li4zNDM5NzgzZjI2YWJjNDg4IDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBAQCAt
MTM2LDExICsxMzYsMTcgQEAgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQo+ID4KPiA+
ICAgICAgIC8qCj4gPiAgICAgICAgKiBSZXNlcnZlIGZyb20gdGhlIHN0YXJ0IG9mIHRoZSBrZXJu
ZWwgdG8gdGhlIGVuZCBvZiB0aGUga2VybmVsCj4gPiAtICAgICAgKiBhbmQgbWFrZSBzdXJlIHdl
IGFsaWduIHRoZSByZXNlcnZhdGlvbiBvbiBQTURfU0laRSBzaW5jZSB3ZSB3aWxsCj4gPiArICAg
ICAgKi8KPiA+ICsjaWYgZGVmaW5lZChDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpICYmIGRlZmlu
ZWQoQ09ORklHXzY0QklUKSAmJiBcCj4gPiArICAgIGRlZmluZWQoQ09ORklHX01NVSkgJiYgIWRl
ZmluZWQoQ09ORklHX1hJUF9LRVJORUwpCj4KPiBBUkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWCBk
ZXBlbmRzIG9uIE1NVSBhbmQgIVhJUF9LRVJORUwgc28gSSB0aGluayB5b3UKPiBjYW4gZ2V0IHJp
ZCBvZiB0aG9zZSBjaGVja3MuCgpUaGFua3MsIHlvdSdyZSByaWdodC4gIFdpbGwgc2ltcGxpZnkg
aW4gdjIuCgpJJ2xsIGFsc28gY2xlYW4gdXAgdGhlIG90aGVyIGxvY2F0aW9uIHdoZXJlIHRoaXMg
d2FzIGNvcGllZCBmcm9tLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
