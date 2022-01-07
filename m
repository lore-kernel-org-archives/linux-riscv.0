Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6879C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ytf/AFu7xAQLkhtiUVqCcgv0/45a6vBs/THtv4ChPwQ=; b=OeHKcDFlv2fwLX
	Y7JmmsUusPR7RnYL6cVetE14/CXc2VmUyrvkiGTI7MbLsI46/w29ZtwCcqL+ZG447YstU5YFZ9NAq
	s1pxnEqP8nWYe6NlRdwo5bWCLjxuRyvFFBvniiEQjddE+urced2rbjAbFEWcjaYKpqiSktqfipfc9
	I93j6cgzMU0nFj+cgTA2+WgT/C+N7P4dDI2tstnJT8DXezvITrMzUy4vBec329RToHLASb6yBMheZ
	LSjXjCZMY5ZA9oxKCJnjSGgc+WJN3J3HjM8jmSHMlTGEUDizJzpPK0vRmCCOntXrvNmCb0cRd8Quo
	AuNj72qA/2fOf6d28xtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5pIo-003zZf-8l; Fri, 07 Jan 2022 13:29:06 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5pIl-003zYn-Gb
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 13:29:05 +0000
Received: by mail-qt1-x829.google.com with SMTP id f17so2996157qtf.8
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 05:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G93pNib2AdYHJFPzHxQ0fNlVSs9vGqI40MeIunwH1I4=;
 b=dVopYzfU+vYmuHEIGsl7xDGblp+DXnUgl2XAUswDynW9EppOkRKAk1H0adUgdQ3RC+
 Tfyro2/t3gmle6RyTotvf4UyCj8ZSAp+TiO6L8KWWL9BjUYJHRVeqGT4ZOCHUrwDu4IF
 oLBxaA0CkKD1ZSDvphgC6Q+M65UvtmLZkHomAup5Z+T3lED4kKw7OZrKbo3ZbdTzI7DK
 qALOLVAw1m/AveRPnFbj95xqbgYD/83l1irj7WAwkdtFinOpk0qTaSjYblDQ9V/ZMDZ7
 rfma75ea7kRyGXWGoOYwK6i6XnQq/QyQwW9mRzr8sv70OQuBASjU83DqaK3Ys8HqkqBE
 YWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G93pNib2AdYHJFPzHxQ0fNlVSs9vGqI40MeIunwH1I4=;
 b=hQTt/4esI1arVgtvcEUMaRM7sgbAvQMEESdn9ay8zhR80eTBdNlUdCn2mtubETASc1
 kq3fSdBnz6ez/5QMLmIPJTLYFg12bHigvzBrnguCQrNG7ZKzMQ+aRMznrl4/8veKn42v
 v7FUHSosozxEixniHT78jwfcOiAoufUO5faQ1yfrPZrgxS3gFN4tU9YLKiVF0wL3RVdg
 +6wadX5W2lzq1xa9bJPQT0znwBQ6vRix3W6VgTfpEXxdjy2ytm/ifzYkjB7W8chLsvF7
 6/HVNhFrifQ8NVIRpkxIhQuj+YwrfwybpStCen1U6pakfQ+eC5W+exzHsVcYUj5qE//O
 WCfg==
X-Gm-Message-State: AOAM530O68F6G+bLQ99txeN+amSvBEnBaIh/XilU7PxgK5V43qcrhF+g
 OlyQLqp21SNUvR3++UUswL5PDtJTShfwR+0FC3zNtg==
X-Google-Smtp-Source: ABdhPJx5S+KrFZFdaW06QLf/K5Z8D9nNip9g3mX/Qb+GJz3jTcjVqkt4OL9dHv90IsMsXAvxk9GoTqbB1AYxcCuWXis=
X-Received: by 2002:a05:622a:1386:: with SMTP id
 o6mr56067325qtk.64.1641562141301; 
 Fri, 07 Jan 2022 05:29:01 -0800 (PST)
MIME-Version: 1.0
References: <15d09938180ee45bc5481c4a2d41ad656ca23c82.1636362169.git.greentime.hu@sifive.com>
 <mhng-a7a94a37-5791-4c76-8f2d-072130d71819@palmer-ri-x1c9>
In-Reply-To: <mhng-a7a94a37-5791-4c76-8f2d-072130d71819@palmer-ri-x1c9>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Fri, 7 Jan 2022 21:28:50 +0800
Message-ID: <CAHCEehJhMQf9jtVkTvorriv6xY5QnEDmN_JjM-UxcCj9UL86Lg@mail.gmail.com>
Subject: Re: [PATCH v9 08/17] riscv: Add vector struct and assembler
 definitions
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_052903_616344_AE78845D 
X-CRM114-Status: GOOD (  21.16  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4g5pa8IDIwMjHlubQxMuaciDE15pel
IOmAseS4iSDkuIrljYgxMjoyOeWvq+mBk++8mgo+Cj4gT24gVHVlLCAwOSBOb3YgMjAyMSAwMTo0
ODoyMCBQU1QgKC0wODAwKSwgZ3JlZW50aW1lLmh1QHNpZml2ZS5jb20gd3JvdGU6Cj4gPiBBZGQg
dmVjdG9yIHN0YXRlIGNvbnRleHQgc3RydWN0IGluIHN0cnVjdCB0aHJlYWQgYW5kIGFzbS1vZmZz
ZXRzLmMKPiA+IGRlZmluaXRpb25zLgo+ID4KPiA+IFRoZSB2ZWN0b3IgcmVnaXN0ZXJzIHdpbGwg
YmUgc2F2ZWQgaW4gZGF0YXAgcG9pbnRlciBvZiBfX3Jpc2N2X3Zfc3RhdGUuIEl0Cj4gPiB3aWxs
IGJlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBpbiBrZXJuZWwgc3BhY2UuIEl0IHdpbGwgYmUgcHV0
IHJpZ2h0IGFmdGVyCj4gPiB0aGUgX19yaXNjdl92X3N0YXRlIGRhdGEgc3RydWN0dXJlIGluIHVz
ZXIgc3BhY2UuCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQu
Y2hlbkBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50
LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50
aW1lLmh1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oICAgfCAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFj
ZS5oIHwgMTEgKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5j
ICAgICAgfCAgNiArKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IGluZGV4IDQ2YjQ5MmM3OGNi
Yi4uYTI2OGYxMzgyZTUyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
cm9jZXNzb3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+
ID4gQEAgLTM1LDYgKzM1LDcgQEAgc3RydWN0IHRocmVhZF9zdHJ1Y3Qgewo+ID4gICAgICAgdW5z
aWduZWQgbG9uZyBzWzEyXTsgICAgLyogc1swXTogZnJhbWUgcG9pbnRlciAqLwo+ID4gICAgICAg
c3RydWN0IF9fcmlzY3ZfZF9leHRfc3RhdGUgZnN0YXRlOwo+ID4gICAgICAgdW5zaWduZWQgbG9u
ZyBiYWRfY2F1c2U7Cj4gPiArICAgICBzdHJ1Y3QgX19yaXNjdl92X3N0YXRlIHZzdGF0ZTsKPiA+
ICB9Owo+ID4KPiA+ICAvKiBXaGl0ZWxpc3QgdGhlIGZzdGF0ZSBmcm9tIHRoZSB0YXNrX3N0cnVj
dCBmb3IgaGFyZGVuZWQgdXNlcmNvcHkgKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRy
YWNlLmgKPiA+IGluZGV4IDg4MjU0N2Y2YmQ1Yy4uYmQzYjhhNzEwMjQ2IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKPiA+IEBAIC03Nyw2ICs3NywxNyBAQCB1bmlv
biBfX3Jpc2N2X2ZwX3N0YXRlIHsKPiA+ICAgICAgIHN0cnVjdCBfX3Jpc2N2X3FfZXh0X3N0YXRl
IHE7Cj4gPiAgfTsKPiA+Cj4gPiArc3RydWN0IF9fcmlzY3Zfdl9zdGF0ZSB7Cj4gPiArICAgICB1
bnNpZ25lZCBsb25nIHZzdGFydDsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgdmw7Cj4gPiArICAg
ICB1bnNpZ25lZCBsb25nIHZ0eXBlOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyB2Y3NyOwo+Cj4g
RG9uJ3Qgd2UgYWxzbyBuZWVkIHZsZW4gdG8gYWRlcXVhdGVseSBkZXRlcm1pbmUgdGhlIHZlY3Rv
ciBzdGF0ZT8KPiBPdGhlcndpc2Ugd2UncmUgZ29pbmcgdG8gZW5kIHVwIGRyb3BwaW5nIHNvbWUg
c3RhdGUgd2hlbiB2bCBpc24ndCB2bG1heCwKPiB3aGljaCBJSVVDIGlzbid0IGxlZ2FsLgoKRG8g
eW91IG1lYW4gdmxlbmI/IFNpbmNlIGl0IGlzIGEgY29uc3RhbnQgdmFsdWUsIHdlIGRvbid0IG5l
ZWQgdG8Kc2F2ZS9yZXN0b3JlIGl0IGluIHRoZSBjb250ZXh0LgoKPiA+ICsgICAgIHZvaWQgKmRh
dGFwOwo+ID4gKyNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiA+ICsgICAgIF9fdTMyIF9fcGFkZGlu
ZzsKPiA+ICsjZW5kaWYKPgo+IFdoeSBpcyB0aGVyZSBwYWRkaW5nPwoKVG8ga2VlcCB2ZWN0b3Ig
cmVnaXN0ZXJzIHNhdmVkIGluIGEgMTYtYnl0ZXMgYWxpZ25lZCBhZGRyZXNzIGZvciBydjMyLgoK
c3RydWN0IF9fcmlzY3ZfY3R4X2hkciB7CiAgICAgICAgX191MzIgbWFnaWM7CiAgICAgICAgX191
MzIgc2l6ZTsKfTsKc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0ZSB7CiAgICAgICAgc3RydWN0IF9f
cmlzY3ZfY3R4X2hkciBoZWFkOwogICAgICAgIHN0cnVjdCBfX3Jpc2N2X3Zfc3RhdGUgdl9zdGF0
ZTsKfSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDE2KSkpOwoKcnY2NCA9PiA0OGJ5dGVzIC0+IDE2
Ynl0ZSBhbGlnbmVkCnJ2MzIgPT4gMzJieXRlcyAtPiAxNmJ5dGUgYWxpZ25lZAoKVGhpcyBzdHJ1
Y3QgYW5kIHZlY3RvciByZWdpc3RlcnMgd2lsbCBiZSBjb3BpZWQgdG8Kc2lnY29udGV4dC5yZXNl
cnZlZFtdIGZvciBzaWduYWwgaGFuZGxlciBzbyB3ZSdkIGxpa2UgdG8ga2VlcCBpdCBpcwoxNi1i
eXRlIGFsaWduZWQuCgpzdHJ1Y3Qgc2lnY29udGV4dCB7CiAgICAgICAgc3RydWN0IHVzZXJfcmVn
c19zdHJ1Y3Qgc2NfcmVnczsKICAgICAgICB1bmlvbiBfX3Jpc2N2X2ZwX3N0YXRlIHNjX2ZwcmVn
czsKICAgICAgICAvKgogICAgICAgICAqIDRLICsgMTI4IHJlc2VydmVkIGZvciB2ZWN0b3Igc3Rh
dGUgYW5kIGZ1dHVyZSBleHBhbnNpb24uCiAgICAgICAgICogVGhpcyBzcGFjZSBpcyBlbm91Z2gg
dG8gc3RvcmUgdGhlIHZlY3RvciBjb250ZXh0IHdob3NlIFZMRU5CCiAgICAgICAgICogaXMgbGVz
cyBvciBlcXVhbCB0byAxMjguCiAgICAgICAgICogKFRoZSBzaXplIG9mIHRoZSB2ZWN0b3IgY29u
dGV4dCBpcyA0MTQ0IGJ5dGUgYXMgVkxFTkIgaXMgMTI4KQogICAgICAgICAqLwogICAgICAgIF9f
dTggX19yZXNlcnZlZFs0MjI0XSBfX2F0dHJpYnV0ZV9fKChfX2FsaWduZWRfXygxNikpKTsKfTsK
Cgo+ID4gK307Cj4gPiArCj4gPiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4KPiA+ICAj
ZW5kaWYgLyogX1VBUElfQVNNX1JJU0NWX1BUUkFDRV9IICovCj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZz
ZXRzLmMKPiA+IGluZGV4IDkwZjhjZTY0ZmE2Zi4uMzRmNDNjODQ3MjNhIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvYXNtLW9mZnNldHMuYwo+ID4gQEAgLTcyLDYgKzcyLDEyIEBAIHZvaWQgYXNtX29mZnNl
dHModm9pZCkKPiA+ICAgICAgIE9GRlNFVChUU0tfU1RBQ0tfQ0FOQVJZLCB0YXNrX3N0cnVjdCwg
c3RhY2tfY2FuYXJ5KTsKPiA+ICAjZW5kaWYKPiA+Cj4gPiArICAgICBPRkZTRVQoUklTQ1ZfVl9T
VEFURV9WU1RBUlQsIF9fcmlzY3Zfdl9zdGF0ZSwgdnN0YXJ0KTsKPiA+ICsgICAgIE9GRlNFVChS
SVNDVl9WX1NUQVRFX1ZMLCBfX3Jpc2N2X3Zfc3RhdGUsIHZsKTsKPiA+ICsgICAgIE9GRlNFVChS
SVNDVl9WX1NUQVRFX1ZUWVBFLCBfX3Jpc2N2X3Zfc3RhdGUsIHZ0eXBlKTsKPiA+ICsgICAgIE9G
RlNFVChSSVNDVl9WX1NUQVRFX1ZDU1IsIF9fcmlzY3Zfdl9zdGF0ZSwgdmNzcik7Cj4gPiArICAg
ICBPRkZTRVQoUklTQ1ZfVl9TVEFURV9EQVRBUCwgX19yaXNjdl92X3N0YXRlLCBkYXRhcCk7Cj4g
PiArCj4gPiAgICAgICBERUZJTkUoUFRfU0laRSwgc2l6ZW9mKHN0cnVjdCBwdF9yZWdzKSk7Cj4g
PiAgICAgICBPRkZTRVQoUFRfRVBDLCBwdF9yZWdzLCBlcGMpOwo+ID4gICAgICAgT0ZGU0VUKFBU
X1JBLCBwdF9yZWdzLCByYSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
