Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEC9C531FC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bphuOLbfP0YYlLZFOmUDoRkGdKNT+neHzQLiWyxPggk=; b=QEQGrOXJbJqM6l
	l5LI4RNxfmQkjX22fm62HaUw3tUiAk8cpC9YL/jxhFoQkFFRCqoX1v89pZs7XOWay18hW5aJBfGj1
	rUZSmc5hmcC/w6p3Sjla5EmobKvWeV7xdZYOPsO0bp6f5hbRfHaC7Zxub80sBq69uiieWsby4xHPj
	qH0Jh2i1gaChHcPdqD1ss1UAfnDZ4E8FjGabzJbVelDzyw5pPTa9eiRIchw+ifHra2zucF2vNSj4g
	IxwiJh2QtPt3VLkKsFPESWZ2fhEuUYgixjm57j2HKVm/29KdCd94Rgb7YugDW1uo6PBRgg50/2Rla
	NBDI2RZcT+TEvbMqmZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLik-0000000HBJI-238d;
	Fri, 24 Jul 2026 19:38:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLij-0000000HBJC-3End
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 19:38:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58D43600AD;
	Fri, 24 Jul 2026 19:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9027C1F000E9;
	Fri, 24 Jul 2026 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784921887;
	bh=zDSNgvrN46Mh8+EbjqbSRln6do6ct55g+Nt1nrPXrw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=R0GtXkLzAIr2zrZrhJDigbTNwzY1XZnncdp0RpWcgoiCTUK3C3gyj3q9FlXbr5pbD
	 Sj0FJNviqxvD4Whiqfn0305REgTH1/KIkl9eEdoPaq8N1icEZbReDAi5ztUiClKFBG
	 72Ec+V0rlx28zSpmo7F7n5h9Q/j+G65p8lse5qL+qsYc77YPlKwJTDK4PWm78f2X4v
	 DLZ4OF23tyX1RSQ0goffVPk2CndnfBuQ7GBRqPn8AUMdzyDw5sY9QuvjMEcaBoa7uF
	 7wmsbUEgJyCbbX2clml/dI23R4Okf1d5WD8IE2y6g7IsLn9z9rkiYtd3BeCvbIs75s
	 xkkY9ABoeaVbQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Varun R Mallya <varunrmallya@gmail.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, pulehui@huawei.com
Cc: alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 puranjay@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, varunrmallya@gmail.com
Subject: Re: [PATCH bpf-next v3 0/6] Add BPF Exceptions support for RISC-V
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
Date: Fri, 24 Jul 2026 21:38:03 +0200
Message-ID: <87cxwcqiuc.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

VmFydW4gUiBNYWxseWEgPHZhcnVucm1hbGx5YUBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhpcyBw
YXRjaHNldCBhaW1zIHRvIGFkZCBCUEYgZXhjZXB0aW9ucyBzdXBwb3J0cyBmb3IgcmlzY3Y2NCBi
eQo+IGltcGxlbWVudGluZyB0aGUgYXJjaF9icGZfc3RhY2tfd2FsayBmdW5jdGlvbiBhbmQgdGhl
biB1cGRhdGluZyB0aGUKPiBwcm9sb2d1ZSBhbmQgZXBpbG9ndWUgZm9yIEJQRiBKSVQgb24gcmlz
Y3YuIEFsc28sCj4gYnBmX2ppdF9zdXBwb3J0c19leGNlcHRpb25zKCkgcmV0dXJucyB0cnVlIG5v
dyBzbyB0aGF0IHRoZSB2ZXJpZmllciBkb2VzCj4gbm90IHJlamVjdCBwcm9ncmFtcyBjb250YWlu
aW5nIEJQRiBleGNlcHRpb25zIG9uIHJpc2N2NjQuCj4KPiBPbiByaXNjdiB0aGUgdW53aW5kZXIg
dXNlZCBieSBhcmNoX2JwZl9zdGFja193YWxrKCkgaXMgdGhlIGZyYW1lLXBvaW50ZXIKPiB1bndp
bmRlciwgc28gZXhjZXB0aW9uIHN1cHBvcnQgaXMgZ2F0ZWQgb24gQ09ORklHX0ZSQU1FX1BPSU5U
RVIuCj4KPiBJbiB0aGUgcHJvbG9ndWUgYW5kIGVwaWxvZ3VlIG9mIHRoZSBSSVNDLVYgSklULCBJ
IHNhdmVkIHRoZQo+IHJldHVybiBhZGRyZXNzIGFuZCB0aGVuIHRoZSBmcmFtZS1wb2ludGVyIGFj
Y29yZGluZyB0byBbMV0uIEFsc28sCj4gYWNjb3JkaW5nIHRvIFsyXSwgczAgdG8gczExIGFyZSBj
YWxsZWUgc2F2ZWQgcmVnaXN0ZXJzLCB3aGljaCBpcyB3aHkgYQo+IG5ldyBhcnJheSAocnZfZXhj
ZXB0aW9uX2NzYXZlX3JlZ3MpIGhhcyBiZWVuIGNyZWF0ZWQgdG8gc2F2ZSB0aGVzZQo+IHJlZ2lz
dGVycyB3aGljaCBjb250YWlucyBhbGwgdGhlIHJlcXVpcmVkIHJlZ2lzdGVycyBhbG9uZyB3aXRo
IHRoZSBmcmFtZQo+IHBvaW50ZXIgYXMgd2VsbCBhcyByZXR1cm4gYWRkcmVzcy4KCi4uLgoKPiBT
aW5jZSBhbGwgZXhjZXB0aW9uIHRlc3RzIHBhc3Mgbm93LCB0aGUgZGVueWxpc3QgZmlsZSBoYXMg
YmVlbiByZW1vdmVkCj4gYXMgaXQgaXMgZW1wdHkgbm93Lgo+Cj4gQ2hhbmdlcyBpbiB2MS0+djI6
Cj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI2MDYyMTE0NDI1OS4yODgxMzUt
MS12YXJ1bnJtYWxseWFAZ21haWwuY29tLwo+IC0gcmVzb2x2ZSB0aGUgZnRyYWNlIHRyYW1wb2xp
bmUgYWRkcmVzcyB3aXRoIGZ0cmFjZV9ncmFwaF9yZXRfYWRkcigpCj4gICBpbnNpZGUgYXJjaF9i
cGZfc3RhY2tfd2FsaygpCj4gLSBSZW1vdmUgZHVwbGljYXRlZCBjb2RlIGluIGJwZl9qaXRfYnVp
bGRfcHJvbG9ndWUoKQo+Cj4gQ2hhbmdlcyBpbiB2Mi0+djM6Cj4gdjI6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi8yMDI2MDYyODA4MTcxMC4xMTMzMzMtMS12YXJ1bnJtYWxseWFAZ21haWwu
Y29tLwo+IC0gZXh0ZW5kIHdhbGtfc3RhY2tmcmFtZSB0byB1c2Ugc3AvZnAgc2ltaWxhciB0byBo
b3cgYXJtNjQgZG9lcyBpdC4gKEJqw7ZybiBUw7ZwZWwpCj4gLSByZWZhY3RvciBwcm9sb2d1ZS9l
cGlsb2d1ZSBpbnRvIGhlbHBlcnMuIChCasO2cm4gVMO2cGVsKQo+IC0gZml4IGNvbW1lbnRzIHRv
IG1ha2UgdGhlbSBuZXRkZXYgc3R5bGUuCj4gLSBzYXZlL3Jlc3RvcmUgdGhlIHRhaWwtY2FsbCBj
b3VudGVyIGluIHRoZSBleGNlcHRpb24gcHJvbG9ndWUvZXBpbG9ndWUKPiAtIGV4Y2VwdGlvbl90
YWlsX2NhbGwgbm93IHBhc3NlcyBzaW5jZSBicGYyYnBmK3RhaWxjYWxsIG1peGluZyBsYW5kZWQg
WzNdLCBzbwo+ICAgZHJvcCB0aGUgKG5vdy1lbXB0eSkgREVOWUxJU1QucmlzY3Y2NAo+IC0gKCFh
dXgtPmV4Y2VwdGlvbl9jYikgaGFzIGJlZW4gc2ltcGxpZmllZCB0byBvbmx5IG9uZSBjb25kaXRp
b24gKFB1IExlaHVpKQoKVmFydW4hCgpUaGFua3MgZm9yIHRoZSByZXdvcmsuIFRoZSBvdmVyYWxs
IHN0cnVjdHVyZSBpcyBtdWNoIGJldHRlciBub3csIGFuZCB0aGUKbWFpbiB2MiBjb21tZW50cyBh
cm91bmQgcmV1c2luZyB0aGUgc3RhY2sgd2Fsa2VyIGFuZCBzcGxpdHRpbmcgdGhlCnByb2xvZ3Vl
L2VwaWxvZ3VlIGhhdmUgYmVlbiBhZGRyZXNzZWQhCgpJIHRyaWVkIHRvIG1ha2Ugc2Vuc2Ugb2Yg
U2FzaGlrbydzIHJlcG9ydHMgYXMgd2VsbC4uLgoKU2FzaGlrbyBzZWVtcyBjb3JyZWN0IGFib3V0
IHNwIGJlaW5nIHN0YWxlIGFmdGVyIGNyb3NzaW5nIGFuIGV4Y2VwdGlvbgpmcmFtZS4gV2UgcmVz
dG9yZSBwYyBhbmQgZnAgZnJvbSBwdF9yZWdzLCBzbyBzcCBzaG91bGQgYmUgcmVzdG9yZWQgZnJv
bQp0aGVyZSBhcyB3ZWxsLiBXb3VsZCB5b3UgYWdyZWU/CgpUaGUgZnVsbCBwdF9yZWdzIHNob3Vs
ZCBhbHNvIGJlIHZhbGlkYXRlZCBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdC4uLj8KCkkgKnRoaW5r
KiB0aGUgaW5zdHJ1bWVudGF0aW9uIGNvbmNlcm4gYWxzbyBsb29rcyB2YWxpZC4gVGhlIG5ldwpz
dGFjay13YWxrIGFkYXB0ZXIgY2FsbGJhY2tzIHNob3VsZCBub3QgYmUgaW5zdHJ1bWVudGFibGUu
CgpJIGRvbid0IHRoaW5rIHRoZSAhQ09ORklHX0ZSQU1FX1BPSU5URVIgcmVwb3J0IGlzIGFuIGV4
Y2VwdGlvbi1zdXBwb3J0CmJ1Zy4gRXhjZXB0aW9ucyByZXF1aXJlIGEgdmFsaWQgYm91bmRhcnkg
ZnJhbWUgcG9pbnRlciwgc28gdGhlIGN1cnJlbnQKZ2F0aW5nIGxvb2tzIGNvcnJlY3QuCgpTYXNo
aWtvIGlzIGFsc28gY29ycmVjdCB0aGF0IGRlbGV0aW5nIERFTllMSVNULnJpc2N2NjQgYnJlYWtz
IHRoZQpkb2N1bWVudGVkIHNlbGZ0ZXN0IGNvbW1hbmQuIFBsZWFzZSB1cGRhdGUgdGhlIFJFQURN
RSBvciByZXRhaW4gYW4gZW1wdHkKZmlsZS4KCk1pbm9yIHdvcmRpbmcgaXNzdWU6IHJhIGlzIG5v
dCBjYWxsZWUtc2F2ZWQuIFBsZWFzZSBzYXkg4oCcUkEgYW5kIHRoZQpjYWxsZWUtc2F2ZWQgcmVn
aXN0ZXJzIHMwLXMxMS7igJ0KCgpUaGFua3MsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
