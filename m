Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA2BC43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 02:03:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CDB2087D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 02:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7yMweFm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="d/+X9e2N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CDB2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=j8x4CwACSaEiZpK/7zIBzYDjpAs0d/Y9HG0oHOpTkeU=; b=d7yMweFmfSKpp0TxB8p0g2eJU
	0F2HEFoEZKawklNGETboXdwFjWwNK2rrHFM5pBG/fB12h4Jm94fxc/foxxhItBw4MhwOo+3/f3IY9
	jlV7n5TlwryaqKks3nkDJEpk0Kkl1uqu0tjdZRPLDzJOrG5B/KAwyZTXthOYGLc2lJ4mQlj3AAW3e
	Yqr86N+Y+jOueiO9NQWo7u+Urd+3Y5ymCetsr3MHvHC9vONBMTDSi0WlyDU6pJHpno7QbxN4KrjCi
	5RiN2xF1sxAD2cyspOBi7ip2me9s2ZRwngJFWEGRvDSrh6HamJgzdpUCcmOZ1tCAz2cLrKv41ulY5
	nro25nrIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIMmW-0008Cq-IR; Wed, 16 Sep 2020 02:02:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIMmT-0008Aj-N2
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 02:02:46 +0000
Received: by mail-pg1-x542.google.com with SMTP id 67so2971706pgd.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2020 19:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=L1fKBq/nA12iYo9p+8pvfr6oz9fGtVmjoUXdcMskeaM=;
 b=d/+X9e2NR8D/YvhFs5L+VJ1AkDVj0k0kiy2pGjqve/Z8oTyQd27yhp6jp5ItRzzCRY
 pkfxeyeuGwJYnjdqofM936AabOp2JKbxyNbosz3OpqQz/se3Sh0ojx+JANdfHDOOC1vX
 n2X3F4UKjAm+fLqWTmNYdenoBQe/b0UA4+AxEnEGreRqB4K9mntEfDOlRd9CZ9dytdW7
 rUpZR/B4ulhWVdZ6hBn1Qjb43bZjgrGnU/07bZe/yi2Xz6y2ZaQIumSQ2V0szQ+FbZh0
 J5uW2eUhhRETUZc4IwJgGQ7ycOnLDHp5+q3hbLPBiqvhIgA1mX9i9R2SzHvBFVDHqE10
 lLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=L1fKBq/nA12iYo9p+8pvfr6oz9fGtVmjoUXdcMskeaM=;
 b=floLyoXH9lf65rCjoEpFb86oCQUebYp7VIAjHr8zyx6EErPQthsJqb9jmrY9+H6qrV
 iF8tOrY46RD5ssLGyuldPXsef5QdUw4ge2ZIPjw4WHNerPpKgktIrohYKGJomrfL851B
 q5kMpbn8Hff0nDVngE6YpIFLlN31NSj83aCGSBaOPPZeY0RQnqMNoAFBcSSyhfB3RO04
 8cgiHsVDKrq9dt8s1BCNkOIWoc5dsjC88jQwZjf+au4UvSOn04RaeYjAyrfd+zYdj1AU
 /qBhJSVgcAsgqF1+WJ1HThQ4GjRovxjYGT0CXcv5Mci3HqewW4JMLZNYFfdkWWM6DHSB
 2Prw==
X-Gm-Message-State: AOAM531ydM2a86th70w7p//7A/8UmO93hX8UEy3YZM5M1RDTfApaUtev
 TS0Szrowbucp3ZKetoiFpNFDOw==
X-Google-Smtp-Source: ABdhPJw7IbidIw/HACEMIC0Ow+5nhRoHxuZUjL0t2F6X4gef/JhZBv3znQY2SkOmJMxH9I3YmGqAzw==
X-Received: by 2002:a63:f34b:: with SMTP id t11mr16835301pgj.111.1600221761789; 
 Tue, 15 Sep 2020 19:02:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bb6sm690065pjb.15.2020.09.15.19.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 19:02:40 -0700 (PDT)
Date: Tue, 15 Sep 2020 19:02:40 -0700 (PDT)
X-Google-Original-Date: Tue, 15 Sep 2020 19:02:39 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix compilation warning
In-Reply-To: <CY4PR04MB375179E27AE26DBD3ED0FF76E7210@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-bb93a26a-2217-4540-83f7-99b896516413@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_220245_872017_47979D1B 
X-CRM114-Status: GOOD (  27.23  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 atishp@atishpatra.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pk9uIFR1ZSwgMTUgU2VwIDIwMjAgMTg6Mjk6NTIgUERUICgtMDcwMCksIERhbWllbiBMZSBNb2Fs
IHdyb3RlOgo+PiBPbiAyMDIwLzA5LzE2IDQ6NDQsIEF0aXNoIFBhdHJhIHdyb3RlOgo+PiBPbiBU
dWUsIFNlcCAxNSwgMjAyMCBhdCAyOjE2IEFNIERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2Fs
QHdkYy5jb20+IHdyb3RlOgo+Pj4KPj4+IE1vdmUgdGhlIGRlY2xhcmF0aW9uIG9mIHB0X29wcyB1
bmRlciAiI2lmZGVmIGlDT05GSUdfTU1VIiB0byBhdm9pZCB0aGUKPj4+IGNvbXBpbGF0aW9uIHdh
cm5pbmc6Cj4+Pgo+Pj4gYXJjaC9yaXNjdi9tbS9pbml0LmM6NDQ6Mjg6IHdhcm5pbmc6IOKAmHB0
X29wc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZAo+Pj4gWy1XdW51c2VkLXZhcmlhYmxlXQo+Pj4g
ICAgNDQgfCBzdGF0aWMgc3RydWN0IHB0X2FsbG9jX29wcyBwdF9vcHM7Cj4+PiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgo+Pj4KPj4+IHdpdGggTk8gTU1VIGJ1aWxk
cyAoZS5nLiBub21tdV9rMjEwX2RlZmNvbmZpZykuCj4+Pgo+PiAKPj4gVGhhbmtzIGZvciB0aGUg
Zml4LiBwdF9vcHMgd2FzIGFkZGVkIGFzIGEgcGFydCBvZiBFRkkgc2VyaWVzLgo+PiBJIGFtIHBs
YW5uaW5nIHRvIHNlbmQgdjggdG8gaW5jbHVkZSBzb21lIG1vcmUgZ2VuZXJpYyBFRkkgY2hhbmdl
cy4KPj4gCj4+IERvIHlvdSBtaW5kIGlmIEkganVzdCBpbmNsdWRlIHRoaXMgZml4IGluIG15IHNl
cmllcyA/Cj4KPiBQbGVhc2UgZmVlbCBmcmVlIHRvIGludGVncmF0ZS9zcXVhc2ggdGhpcyBjaGFu
Z2UgaW4geW91ciBzZXJpZXMuIE5vIG5lZWQgZm9yIGEKPiBzZXBhcmF0ZSBwYXRjaCBmb3IganVz
dCB0aGF0LiBCdXQ6IElmIHlvdXIgRUZJIHNlcmllcyBpcyBub3QgZmluYWwsIHdoYXQgaXMgaXQK
PiBkb2luZyBvbiB0aGUgZm9yLW5leHQgYnJhbmNoID8/Pwo+IAo+IFBhbG1lciwKPiAKPiBXaGF0
IGlzIGdvaW5nIG9uIGhlcmUgPyBJZiBBdGlzaCBWNyBzZXJpZXMgaGFzIHByb2JsZW1zIGFuZCBp
cyBub3QgZmluYWwsIHdoeSBpcwo+IGl0IGFscmVhZHkgaW4gZm9yLW5leHQgPwoKSSdtIGJlaGlu
ZCBvbiB0aGlzIHRocmVhZCwgSSBqdXN0IHNhdyB0aGlzIGFzIEkgd2FzIHNpdHRpbmcgZG93biB0
byBkbwpzb21ldGhpbmcgZWxzZS4KCkl0IHdhcyBzdXBwb3NlZCB0byBiZSByZWFkeSB0byBnbywg
YnV0IGl0IGhhZCB0byBiZSByb2xsZWQgYmFjay4gIEFzIGZhciBhcyBJCnVuZGVyc3RhbmQgaXQg
bXkgZm9yLW5leHQgZG9lc24ndCBhY3R1YWxseSBoYXZlIGJyb2tlbiBzdHVmZiBvbiBpdCwgdGhl
IGlzc3VlCmlzIG1vcmUgdGhhdCBzb21lIG90aGVyIEVGSSB0cmVlIGNoYW5nZXMgbGFuZGVkIHRo
YXQgd291bGQgbWFrZSBtZXJnaW5nIHRoZQp0cmVlcyBtb3JlIGRpZmZpY3VsdC4gIElJUkMgQXJk
IHdhcyBnb2luZyB0byBhbiBFRkkgdHJlZSB0YWcgZm9yIG1lIHRvIG1lcmdlLAphbmQgSSB3YXMg
d2FpdGluZyB1bnRpbCB0aGF0IHRvIHNob3cgdXAgZm9yIHRoZSByZWJhc2Ugc28gd2UgZGlkbid0
IGp1Z2dsZQp0aGluZ3MgdG9vIG11Y2guICBJIGd1ZXNzIEknZCBhc3N1bWVkIHRoYXQgdGhlIGFj
dHVhbCBwYXRjaGVzIHdlcmVuJ3QgY2hhbmdpbmcKdGhhdCBtdWNoIGluIHRoZSBwcm9jZXNzLCBi
dXQgaWYgQXRpc2ggaXMgZ29pbmcgdG8gYmUgc2VuZGluZyBhbm90aGVyIHZlcnNpb24Kd2l0aCBt
ZWFuaW5nZnVsIGNoYW5nZXMgdGhlbiBJIHN1cHBvc2UgaXQncyBiZXN0IHRvIGRyb3AgdGhlIEVG
SSBzdHVmZiBmb3Igbm93LgoKSSBqdXN0IHJlYmFzZWQgZm9yLW5leHQsIGRyb3BwaW5nIHRoZSBF
RkkgcGF0Y2hlcy4KCj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxl
bW9hbEB3ZGMuY29tPgo+Pj4gLS0tCj4+PiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCA0ICsrLS0K
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4+PiBpbmRleCAzMmU3MjU4ZGE5YmIuLmM4ODhjNDQ3MGIzNCAxMDA2NDQKPj4+IC0tLSBh
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+Pj4g
QEAgLTQxLDggKzQxLDYgQEAgc3RydWN0IHB0X2FsbG9jX29wcyB7Cj4+PiAgI2VuZGlmCj4+PiAg
fTsKPj4+Cj4+PiAtc3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMgcHRfb3BzOwo+Pj4gLQo+Pj4g
IHN0YXRpYyB2b2lkIF9faW5pdCB6b25lX3NpemVzX2luaXQodm9pZCkKPj4+ICB7Cj4+PiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbWF4X3pvbmVfcGZuc1tNQVhfTlJfWk9ORVNdID0geyAwLCB9Owo+
Pj4gQEAgLTIxNCw2ICsyMTIsOCBAQCB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4+
PiAgfQo+Pj4KPj4+ICAjaWZkZWYgQ09ORklHX01NVQo+Pj4gK3N0YXRpYyBzdHJ1Y3QgcHRfYWxs
b2Nfb3BzIHB0X29wczsKPj4+ICsKPj4+ICB1bnNpZ25lZCBsb25nIHZhX3BhX29mZnNldDsKPj4+
ICBFWFBPUlRfU1lNQk9MKHZhX3BhX29mZnNldCk7Cj4+PiAgdW5zaWduZWQgbG9uZyBwZm5fYmFz
ZTsKPj4+IC0tCj4+PiAyLjI2LjIKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+PiAKPj4gCj4+IAo+Cj4KPi0tIAo+
RGFtaWVuIExlIE1vYWwKPldlc3Rlcm4gRGlnaXRhbCBSZXNlYXJjaAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
