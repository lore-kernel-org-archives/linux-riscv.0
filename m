Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EF2C83F01
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6/+73+/TPZwggsuyEQ8jrJrlE+BaCQSnL/7B3CPgOM=; b=QDVfS/G1XZK7hY
	/Q1J1TDUAPfZPuP/SQgwB9cDgReS102055NLQA8fCjZc7d0GwGLBGPBu63G7ycYdejUYeVHGDDmc6
	jYOd+QPNjla3HbzXaL7aes25n63orIlgzF3zJDqACyHNkiadARFuNMxNmibSF7gGhGJueCaOfmCZG
	KUMOA8Pb127mtw+XDadMXx0nuXAlYLF9eOr34Nj43EomkR4u6qjYx15T0gPd6AQ1EN583y3K+9/0t
	ZWJvjeTzFYwFzo61Ydta1cPSe6po3bPEumYdR2P73d8bC8b2RwTEwI+J8oNoFS7/2HWWkK00LKCIB
	pmGNBLQAs76e8BoosGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtax-006x9w-2F;
	Sat, 26 Aug 2023 13:44:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtau-006x9Y-2p
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 13:44:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 312A061882;
	Sat, 26 Aug 2023 13:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AC5C433C7;
	Sat, 26 Aug 2023 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693057491;
	bh=oFKyndOxe6LHZACuQUiWjyjDTRuOBgWPpdfdATB1Dug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rt7F/XMiZy780lu2ZKlBR7T7ydImNaVJEnqCZ5cXIIJ3/Mo5NxpAyvJJSVip8EpIw
	 DqSf2qCQCwpBFvpwt9iM1jArX7UOKG+fVihKEjemO9oERbttfmnU7UUOmTaN4RlEuw
	 E6B9Lhrho0Et2xyjuT6aSh2LiagMUISvRdc3d1/VLj7iRKy6tOD4TzfL6vlnNps2Ee
	 7BssZAx68OpYx9y4VNrm0ZqTcrjgoB0VB8k/P0y/o274rmkF+/Sp+87Iq3ESOv9Bnj
	 5lj1xm12RFXBZ5JF4rde6y96tqxw67Wj+KU9RTw2gvP79w7LM+jeG/74LjWILW6kei
	 9Qd9JGLofJG5w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Cc: bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
 yonghong.song@linux.dev, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Puranjay Mohan <puranjay12@gmail.com>
Subject: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
In-Reply-To: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
Date: Sat, 26 Aug 2023 15:44:48 +0200
Message-ID: <87v8d19aun.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_064453_023708_D033D6E1 
X-CRM114-Status: GOOD (  11.62  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBJJ20gY2hhc2luZyBh
IHdvcmtxdWV1ZSBoYW5nIG9uIFJJU0MtVi9xZW11IChUQ0cpLCB1c2luZyB0aGUgYnBmCj4gc2Vs
ZnRlc3RzIG9uIGJwZi1uZXh0IDllM2I0N2FiZWI4Zi4KPgo+IEknbSBhYmxlIHRvIHJlcHJvZHVj
ZSB0aGUgaGFuZyBieSBtdWx0aXBsZSBydW5zIG9mOgo+ICB8IC4vdGVzdF9wcm9ncyAtYSBsaW5r
X2FwaSAtYSBsaW5rZWRfbGlzdAo+IEknbSBjdXJyZW50bHkgaW52ZXN0aWdhdGluZyB0aGF0LgoK
K0d1byBmb3IgdXByb2JlCgpUaGlzIHdhcyBhbiBpbnRlcmVzdGluZyBidWcuIFRoZSBoYW5nIGlz
IGFuIGVicmVhayAoUklTQy1WIGJyZWFrcG9pbnQpLAp0aGF0IHB1dHMgdGhlIGtlcm5lbCBpbnRv
IGFuIGluZmluaXRlIGxvb3AuCgpUbyByZXByb2R1Y2UsIHNpbXBseSBydW4gdGhlIEJQRiBzZWxm
dGVzdDoKLi90ZXN0X3Byb2dzIC12IC1hIGxpbmtfYXBpIC1hIGxpbmtlZF9saXN0CgpGaXJzdCB0
aGUgbGlua19hcGkgdGVzdCBpcyBiZWluZyBydW4sIHdoaWNoIGV4ZXJjaXNlcyB0aGUgdXByb2Jl
CmZ1bmN0aW9uYWxpdHkuIFRoZSBsaW5rX2FwaSB0ZXN0IGNvbXBsZXRlcywgYW5kIHRlc3RfcHJv
Z3Mgd2lsbCBzdGlsbApoYXZlIHRoZSB1cHJvYmUgYWN0aXZlL2VuYWJsZWQuIE5leHQgdGhlIGxp
bmtlZF9saXN0IHRlc3QgdHJpZ2dlcmVkIGEKV0FSTl9PTiAod2hpY2ggaXMgaW1wbGVtZW50ZWQg
dmlhIGVicmVhayBhcyB3ZWxsKS4KCk5vdywgaGFuZGxlX2JyZWFrKCkgaXMgZW50ZXJlZCwgYW5k
IHRoZSB1cHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKCkKcmV0dXJucyB0cnVlIGV4aXRpbmcgdGhl
IGhhbmRsZV9icmVhaygpLCB3aGljaCByZXR1cm5zIHRvIHRoZSBXQVJOCmVicmVhaywgYW5kIHdl
IGhhdmUgbWVycnktZ28tcm91bmQuCgpMdWNreSBmb3IgdGhlIFJJU0MtViBmb2xrcywgdGhlIEJQ
RiBtZW1vcnkgaGFuZGxlciBoYWQgYSBXQVJOIHRoYXQKc3VyZmFjZWQgdGhlIGJ1ZyEgOy0pCgpU
aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSwgYnV0IGl0J3MgcHJvYmFibHkgYSBwcmV0dGllciB2
YXJpYW50OgotLTg8LS0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IGY3OThjODUzYmVkZS4uMTE5OGNiODc5ZDJm
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMKQEAgLTI0OCwyMyArMjQ4LDI5IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBnZXRfYnJlYWtfaW5zbl9sZW5ndGgodW5zaWduZWQgbG9uZyBwYykKIAogdm9pZCBo
YW5kbGVfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CisgICAgICAgYm9vbCB1c2VyID0g
dXNlcl9tb2RlKHJlZ3MpOworCiAjaWZkZWYgQ09ORklHX0tQUk9CRVMKLSAgICAgICBpZiAoa3By
b2JlX3NpbmdsZV9zdGVwX2hhbmRsZXIocmVncykpCi0gICAgICAgICAgICAgICByZXR1cm47Cisg
ICAgICAgaWYgKCF1c2VyKSB7CisgICAgICAgICAgICAgICBpZiAoa3Byb2JlX3NpbmdsZV9zdGVw
X2hhbmRsZXIocmVncykpCisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKIAotICAgICAg
IGlmIChrcHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKHJlZ3MpKQotICAgICAgICAgICAgICAgcmV0
dXJuOworICAgICAgICAgICAgICAgaWYgKGtwcm9iZV9icmVha3BvaW50X2hhbmRsZXIocmVncykp
CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKKyAgICAgICB9CiAjZW5kaWYKICNpZmRl
ZiBDT05GSUdfVVBST0JFUwotICAgICAgIGlmICh1cHJvYmVfc2luZ2xlX3N0ZXBfaGFuZGxlcihy
ZWdzKSkKLSAgICAgICAgICAgICAgIHJldHVybjsKKyAgICAgICBpZiAodXNlcikgeworICAgICAg
ICAgICAgICAgaWYgKHVwcm9iZV9zaW5nbGVfc3RlcF9oYW5kbGVyKHJlZ3MpKQorICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm47CiAKLSAgICAgICBpZiAodXByb2JlX2JyZWFrcG9pbnRfaGFu
ZGxlcihyZWdzKSkKLSAgICAgICAgICAgICAgIHJldHVybjsKKyAgICAgICAgICAgICAgIGlmICh1
cHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKHJlZ3MpKQorICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm47CisgICAgICAgfQogI2VuZGlmCiAgICAgICAgY3VycmVudC0+dGhyZWFkLmJhZF9jYXVz
ZSA9IHJlZ3MtPmNhdXNlOwogCi0gICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkKKyAgICAgICBp
ZiAodXNlcikKICAgICAgICAgICAgICAgIGZvcmNlX3NpZ19mYXVsdChTSUdUUkFQLCBUUkFQX0JS
S1BULCAodm9pZCBfX3VzZXIgKilyZWdzLT5lcGMpOwogI2lmZGVmIENPTkZJR19LR0RCCiAgICAg
ICAgZWxzZSBpZiAobm90aWZ5X2RpZShESUVfVFJBUCwgIkVCUkVBSyIsIHJlZ3MsIDAsIHJlZ3Mt
PmNhdXNlLCBTSUdUUkFQKQotLTg8LS0KCkknbGwgY29vayBhIGNsZWFuZXIvcHJvcGVyIHBhdGNo
IGZvciB0aGlzLCB1bmxlc3MgdGhlIHVwcm9iZXMgZm9sa3MgaGFzCmEgYmV0dGVyIHNvbHV0aW9u
LgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
