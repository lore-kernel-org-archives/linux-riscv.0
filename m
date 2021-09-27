Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FBCC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E258A60FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E258A60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YedT1NgBQPbu6zopUefsWpZlEtIkfiqBAJsVFm+6ec=; b=uXxp1UgVR8vdeh
	VllUOTlmuIt7Dqa0bG4lhXRp1swdll5Hi8gHx/iwYGdcp3UIlN03dRXl6zzfwulG9clUISWMDvUzs
	gFwSLToz6ML5jhRslhqmtYlevVLYIb4t6T53r9Bi1lZbHf8ZGeUz3a87NXZ/YE4OAIAdjUEz91HeQ
	IFopxBfme+QXlzv/dnKmVEcWE+XtwbeqL+BnDRR+XY+VzXHObTdXm9DJM+iw45ad9vieYOxVNgccl
	z24X7yLndozT70q5aE7hIeazIVh1F3DQZcbaptAHm2YAMv2EodJI8VktghFr24dFg581UpPRioSgu
	5DylOlyWNAw9lRhxaFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUpqu-002dVD-Ph; Mon, 27 Sep 2021 12:35:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUpqt-002dU6-Kb
 for linux-riscv@bombadil.infradead.org; Mon, 27 Sep 2021 12:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=SIFWB2JmltcqNv/KhYtKtRA8466rj25R6iWQXdLJ5L8=; b=DMSsBA3CtegcgPSXmtBCuzbG8Y
 1CJ3P8iskCAYd2SSy8BO1XVjraHRkPAsX3s5a+CJY/EXRPONwn+jnSSpGAN5VfA8a2sJCEX3yhE05
 a6dX9gIKjIIPkADLlAqwWUx6hP0Y15YiHNSZLCFfGNtdV2Zqui6qEJpnnXJybwizJImeawWXDp0Nz
 DfZtw7cnqnpfX46XrfglmbPiA8Hme3FsQB0oQJ7Aa2D2OvIvRC5nsDAEbQJBIOTywnPn7RbKmfx6W
 7Gl8TyfR8GteM5ZH2IHC4e7CO3T5wTCv8e4bWUW93O/UNqvyZc5CzIDqAGtlDYyjmwV56+DcbQ5/q
 PyOqVlQw==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUppv-009kRp-As; Mon, 27 Sep 2021 12:34:35 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 1027F410A1; Mon, 27 Sep 2021 09:34:19 -0300 (-03)
Date: Mon, 27 Sep 2021 09:34:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: William Cohen <wcohen@redhat.com>
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf annotate: Add riscv64 support
Message-ID: <YVG6S2CE4fQRgngo@kernel.org>
References: <20210927005115.610264-1-wcohen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927005115.610264-1-wcohen@redhat.com>
X-Url: http://acmel.wordpress.com
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

RW0gU3VuLCBTZXAgMjYsIDIwMjEgYXQgMDg6NTE6MTVQTSAtMDQwMCwgV2lsbGlhbSBDb2hlbiBl
c2NyZXZldToKPiBUaGlzIHBhdGNoIGFkZHMgYmFzaWMgYXJjaCBpbml0aWFsaXphdGlvbiBhbmQg
aW5zdHJ1Y3Rpb24gYXNzb2NpYXRlCj4gc3VwcG9ydCBmb3IgdGhlIHJpc2N2NjQgQ1BVIGFyY2hp
dGVjdHVyZS4KPiAKPiBFeGFtcGxlIG91dHB1dDoKPiAKPiAgICQgcGVyZiBhbm5vdGF0ZSAtLXN0
ZGlvMgo+ICAgU2FtcGxlczogMTIySyBvZiBldmVudCAndGFzay1jbG9jazp1JywgNDAwMCBIeiwg
RXZlbnQgY291bnQgKGFwcHJveC4pOiAzMDYzNzI1MDAwMCwgW3BlcmNlbnQ6IGxvY2FsIHBlcmlv
ZF0KPiAgIHN0cmNtcCgpIC91c3IvbGliNjQvbGliYy0yLjMyLnNvCj4gICBQZXJjZW50Cj4gCj4g
CSAgICAgIERpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gLnRleHQ6Cj4gCj4gCSAgICAgIDAwMDAwMDAw
MDAwNjlhMzAgPHN0cmNtcD46Cj4gCSAgICAgIF9fR0lfc3RyY21wKCk6Cj4gCSAgICAgIGNvbnN0
IHVuc2lnbmVkIGNoYXIgKnMyID0gKGNvbnN0IHVuc2lnbmVkIGNoYXIgKikgcDI7Cj4gCSAgICAg
IHVuc2lnbmVkIGNoYXIgYzEsIGMyOwo+IAo+IAkgICAgICBkbwo+IAkgICAgICB7Cj4gCSAgICAg
IGMxID0gKHVuc2lnbmVkIGNoYXIpICpzMSsrOwo+ICAgIDM3LjMwICAgICAgICBsYnUgIGE1LDAo
YTApCj4gCSAgICAgIGMyID0gKHVuc2lnbmVkIGNoYXIpICpzMisrOwo+ICAgICAxLjIzICAgICAg
ICBhZGRpIGExLGExLDEKPiAJICAgICAgYzEgPSAodW5zaWduZWQgY2hhcikgKnMxKys7Cj4gICAg
MTguNjggICAgICAgIGFkZGkgYTAsYTAsMQo+IAkgICAgICBjMiA9ICh1bnNpZ25lZCBjaGFyKSAq
czIrKzsKPiAgICAgMS4zNyAgICAgICAgbGJ1ICBhNCwtMShhMSkKPiAJICAgICAgaWYgKGMxID09
ICdcMCcpCj4gICAgMTguNzEgICAgICDihpMgYmVxeiBhNSwxOAo+IAkgICAgICAgcmV0dXJuIGMx
IC0gYzI7Cj4gCSAgICAgICB9CgpUaGFua3MsIGFwcGxpZWQuCgotIEFybmFsZG8KCiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXaWxsaWFtIENvaGVuIDx3Y29oZW5AcmVkaGF0LmNvbT4KPiAtLS0KPiAgLi4u
L3BlcmYvYXJjaC9yaXNjdjY0L2Fubm90YXRlL2luc3RydWN0aW9ucy5jIHwgMzQgKysrKysrKysr
KysrKysrKysrKwo+ICB0b29scy9wZXJmL3V0aWwvYW5ub3RhdGUuYyAgICAgICAgICAgICAgICAg
ICAgfCAgNSArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3Y2NC9hbm5vdGF0ZS9pbnN0cnVjdGlv
bnMuYwo+IAo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvcmlzY3Y2NC9hbm5vdGF0ZS9p
bnN0cnVjdGlvbnMuYyBiL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdjY0L2Fubm90YXRlL2luc3RydWN0
aW9ucy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjg2OWEw
ZWIyODk1Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3Y2NC9h
bm5vdGF0ZS9pbnN0cnVjdGlvbnMuYwo+IEBAIC0wLDAgKzEsMzQgQEAKPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4gK3N0YXRpYwo+ICtzdHJ1Y3QgaW5zX29wcyAq
cmlzY3Y2NF9fYXNzb2NpYXRlX2luc19vcHMoc3RydWN0IGFyY2ggKmFyY2gsIGNvbnN0IGNoYXIg
Km5hbWUpCj4gK3sKPiArCXN0cnVjdCBpbnNfb3BzICpvcHMgPSBOVUxMOwo+ICsKPiArCWlmICgh
c3RybmNtcChuYW1lLCAiamFsIiwgMykgfHwKPiArCSAgICAhc3RybmNtcChuYW1lLCAianIiLCAy
KSB8fAo+ICsJICAgICFzdHJuY21wKG5hbWUsICJjYWxsIiwgNCkpCj4gKwkJb3BzID0gJmNhbGxf
b3BzOwo+ICsJZWxzZSBpZiAoIXN0cm5jbXAobmFtZSwgInJldCIsIDMpKQo+ICsJCW9wcyA9ICZy
ZXRfb3BzOwo+ICsJZWxzZSBpZiAobmFtZVswXSA9PSAnaicgfHwgbmFtZVswXSA9PSAnYicpCj4g
KwkJb3BzID0gJmp1bXBfb3BzOwo+ICsJZWxzZQo+ICsJCXJldHVybiBOVUxMOwo+ICsKPiArCWFy
Y2hfX2Fzc29jaWF0ZV9pbnNfb3BzKGFyY2gsIG5hbWUsIG9wcyk7Cj4gKwo+ICsJcmV0dXJuIG9w
czsKPiArfQo+ICsKPiArc3RhdGljCj4gK2ludCByaXNjdjY0X19hbm5vdGF0ZV9pbml0KHN0cnVj
dCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkKPiArewo+ICsJaWYgKCFh
cmNoLT5pbml0aWFsaXplZCkgewo+ICsJCWFyY2gtPmFzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMg
PSByaXNjdjY0X19hc3NvY2lhdGVfaW5zX29wczsKPiArCQlhcmNoLT5pbml0aWFsaXplZCA9IHRy
dWU7Cj4gKwkJYXJjaC0+b2JqZHVtcC5jb21tZW50X2NoYXIgPSAnIyc7Cj4gKwl9Cj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gK30KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMg
Yi90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUuYwo+IGluZGV4IDBiYWUwNjFiMmQ2ZC4uZDkxOWZh
OTkzODcyIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS5jCj4gKysrIGIv
dG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMKPiBAQCAtMTUxLDYgKzE1MSw3IEBAIHN0YXRpYyBp
bnQgYXJjaF9fYXNzb2NpYXRlX2luc19vcHMoc3RydWN0IGFyY2gqIGFyY2gsIGNvbnN0IGNoYXIg
Km5hbWUsIHN0cnVjdCBpCj4gICNpbmNsdWRlICJhcmNoL21pcHMvYW5ub3RhdGUvaW5zdHJ1Y3Rp
b25zLmMiCj4gICNpbmNsdWRlICJhcmNoL3g4Ni9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyIKPiAg
I2luY2x1ZGUgImFyY2gvcG93ZXJwYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyIKPiArI2luY2x1
ZGUgImFyY2gvcmlzY3Y2NC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyIKPiAgI2luY2x1ZGUgImFy
Y2gvczM5MC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyIKPiAgI2luY2x1ZGUgImFyY2gvc3BhcmMv
YW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMiCj4gIAo+IEBAIC0xOTIsNiArMTkzLDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgYXJjaCBhcmNoaXRlY3R1cmVzW10gPSB7Cj4gIAkJLm5hbWUgPSAicG93ZXJwYyIs
Cj4gIAkJLmluaXQgPSBwb3dlcnBjX19hbm5vdGF0ZV9pbml0LAo+ICAJfSwKPiArCXsKPiArCQku
bmFtZSA9ICJyaXNjdjY0IiwKPiArCQkuaW5pdCA9IHJpc2N2NjRfX2Fubm90YXRlX2luaXQsCj4g
Kwl9LAo+ICAJewo+ICAJCS5uYW1lID0gInMzOTAiLAo+ICAJCS5pbml0ID0gczM5MF9fYW5ub3Rh
dGVfaW5pdCwKPiAtLSAKPiAyLjI3LjAKCi0tIAoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
