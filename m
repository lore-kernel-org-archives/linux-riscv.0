Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069ACC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 08:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E03218E2
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 08:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxfsqa4e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E03218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3GOIj+SHOV3c9f6n5upEMZqT4sB59BFUBuSaHzXQZIg=; b=hxfsqa4egt37aQs646uiQ9N7J
	D+KN17xJEoWuEJeU9LpNZgqlhTIX9+QCkznsfWsrW7+OnbyN4svNBuzFw39FlXh7g03g3xepBZP4B
	6Ls0GMr0CPu1ooZ5CLZnqraHrRlkCIsrysx4XxUN4cEYiMszLyqu50M87dG3RcZeDLAHJ3HKN0HIo
	0+GIjA9JiSL/dkBHt1gw+TOee8MZziZ7SORc5kklt4a19B5coDX7Kjhvzdu1KCN5KGpUPdoDAvYiH
	jOp/SlyqsOH1f/eWXWs7LiwdPaV2D+3AT2O7xEhnBfT5NNYTjO8VMfiISBCeouSwXOhKe+3EqHA3/
	uRhNGPWQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7brI-0000Hk-9j; Sat, 23 Mar 2019 08:18:28 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7br9-00009Z-HH; Sat, 23 Mar 2019 08:18:21 +0000
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9811C200009;
 Sat, 23 Mar 2019 08:18:02 +0000 (UTC)
Subject: Re: [PATCH 1/4] arm64, mm: Move generic mmap layout functions to mm
To: Christoph Hellwig <hch@infradead.org>
References: <20190322074225.22282-1-alex@ghiti.fr>
 <20190322074225.22282-2-alex@ghiti.fr> <20190322132127.GA18602@infradead.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <72751399-3170-059b-b572-b9b9986ca0fd@ghiti.fr>
Date: Sat, 23 Mar 2019 04:18:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190322132127.GA18602@infradead.org>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_011819_724712_075C7E89 
X-CRM114-Status: GOOD (  13.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMy8yMi8xOSA5OjIxIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4gSXQgdGhlbiBp
bnRyb2R1Y2VzIGEgbmV3IGRlZmluZSBBUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01NQVBfTEFZ
T1VUCj4+IHRoYXQgY2FuIGJlIGRlZmluZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlcyB0byBiZW5l
Zml0IGZyb20gdGhvc2UgZnVuY3Rpb25zLgo+IENhbiB5b3UgbWFrZSB0aGlzIGEgS2NvbmZpZyBv
cHRpb24gZGVmaW5lZCBpbiBhcmNoL0tjb25maWcgb3IgbW0vS2NvbmZpZwo+IGFuZCBzZWxlY3Rl
ZCBieSB0aGUgYXJjaGl0ZWN0dXJlcz8KCgpZZXMsIEkgd2lsbCBkby4KCgo+PiAtI2lmbmRlZiBT
VEFDS19STkRfTUFTSwo+PiAtI2RlZmluZSBTVEFDS19STkRfTUFTSyAoMHg3ZmYgPj4gKFBBR0Vf
U0hJRlQgLSAxMikpCS8qIDhNQiBvZiBWQSAqLwo+PiAtI2VuZGlmCj4+IC0KPj4gLXN0YXRpYyB1
bnNpZ25lZCBsb25nIHJhbmRvbWl6ZV9zdGFja190b3AodW5zaWduZWQgbG9uZyBzdGFja190b3Ap
Cj4+IC17Cj4+IC0JdW5zaWduZWQgbG9uZyByYW5kb21fdmFyaWFibGUgPSAwOwo+PiAtCj4+IC0J
aWYgKGN1cnJlbnQtPmZsYWdzICYgUEZfUkFORE9NSVpFKSB7Cj4+IC0JCXJhbmRvbV92YXJpYWJs
ZSA9IGdldF9yYW5kb21fbG9uZygpOwo+PiAtCQlyYW5kb21fdmFyaWFibGUgJj0gU1RBQ0tfUk5E
X01BU0s7Cj4+IC0JCXJhbmRvbV92YXJpYWJsZSA8PD0gUEFHRV9TSElGVDsKPj4gLQl9Cj4+IC0j
aWZkZWYgQ09ORklHX1NUQUNLX0dST1dTVVAKPj4gLQlyZXR1cm4gUEFHRV9BTElHTihzdGFja190
b3ApICsgcmFuZG9tX3ZhcmlhYmxlOwo+PiAtI2Vsc2UKPj4gLQlyZXR1cm4gUEFHRV9BTElHTihz
dGFja190b3ApIC0gcmFuZG9tX3ZhcmlhYmxlOwo+PiAtI2VuZGlmCj4+IC19Cj4+IC0KPiBNYXli
ZSB0aGUgbW92ZSBvZiB0aGlzIGZ1bmN0aW9uIGNhbiBiZSBzcGxpdCBpbnRvIGFub3RoZXIgcHJl
cCBwYXRjaCwKPiBhcyBpdCBpcyBvbmx5IHZlcnkgbGlnaHRseSByZWxhdGVkPwo+Cj4KCk9rLCB0
aGF0IG1ha2VzIHNlbnNlLgoKPj4gKyNpZiBkZWZpbmVkKEhBVkVfQVJDSF9QSUNLX01NQVBfTEFZ
T1VUKSB8fCBcCj4+ICsJZGVmaW5lZChBUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01NQVBfTEFZ
T1VUKQo+IE5vdCBzdXJlIGlmIGl0IGlzIHdy0ZZ0dGVuIGRvd24gc29tZWh3ZXJlIG9yIGp1c3Qg
Y29udmVudGlvbiwgYnV0IEkKPiBnZW5lcmFsIHNlZSBjcHAgZGVmaW5lZCBzdGF0ZW1lbnRzIGFs
aWduZWQgd2l0aCBzcGFjZXMgdG8gdGhlCj4gb25lIG9uIHRoZSBwcmV2aW91cyBsaW5lLgoKCk9r
LCBJIHdpbGwgZml4IHRoYXQuCgoKPiBFeGNlcHQgZm9yIHRoZXNlIG5pdHBpY2tzIHRoaXMgbG9v
a3MgdmVyeSBuaWNlIHRvIG1lLCB0aGFua3MgZm9yIGRvaW5nCj4gdGhpcyB3b3JrIQoKClRoYW5r
cyA6KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
