Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1848AC56202
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 01:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C583241A7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 01:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXOZa08s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6vbYSKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C583241A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ylf/q0NKXk9U3rY5dvUHDOeJM+QkB3zIJtY9iviNX2A=; b=JXOZa08smpFnOozUGblThtZVH
	4buFXK2qO9AuecK8ZjqHH39UF4PaoFPQYA/fQ5pLKPSD/nnt8I4PVcxLyUg+HcPZLFOzMGHylBYGZ
	Qjzv0ELRkQo19/2JkL21mVIeu/oYUHVr5y3QHFMQq4Mcl7S68fy3KHXRxviNfNPfNN7VoXcFupgts
	F3Tb/9y9NrMUcrPhPJ1L60MIDS4rfpMX8TgFig8+yx+IF6stR4u4AKxhSUfw5bbKqAeOriuaAa8uI
	MA1rEXrkUGyIJS0a31hC+W673WqQqcNDPIBREb6KKsPuzfmP/emwlxi+4P7W3eNgFhlf+9UokJEk0
	myShfCeHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfCVT-00020L-LT; Wed, 18 Nov 2020 01:43:35 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfCVQ-0001zR-TJ
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 01:43:33 +0000
Received: by mail-yb1-xb41.google.com with SMTP id o71so167268ybc.2
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 17:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VNx8kcq1AddWDv911im3ysAsNPKD5/m11Ak4OLU9NIM=;
 b=g6vbYSKUvbtFR/R1/A/Re3Zt72PtMtGCL8jQhc1aRDXYH87/L/Y5bY7B/SIzcgoAfA
 zsHs+gYUvSMYigLWdIAVjupKL99N8Cq/LUZbCCrJ6TyrnFhDdSgU1t1v2d/HjnLbO5T+
 vPXiw/YOr4YkCpdBOxRX9cHZwIX1g+BEbTpd9uX4LnwswKPTbHNSqk7MpEsmnDUEVSY1
 y+0lPvks5dqfwfMz2gkZwg96uDLPjZoq3+gum4EZTP8uM1sOby0r0V1piX6PrRgkVM/q
 gxpxTEt9Oq9bCBo8CgzoQkaXin9qpvCdBosHFL3hDYEtxhXdch1U8wBf2u77omgH0oAo
 vJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VNx8kcq1AddWDv911im3ysAsNPKD5/m11Ak4OLU9NIM=;
 b=XVfnu90pgqZAu38mDbZRViTL8dtkfGq8XmTA7EY09D33DfrlOlEowIBGH4JluKA6vW
 1a0H9DQZjLa0Shaj36l1ELFKLxzXmbKw5AoS4fd1HqZljZtUZsBosv/5tLOgZ500TCiF
 xdpQpSm5dCoHs3vbfePSTiHJwXy4Kn2A2Rup2R2oKrlhtqp6wQhCafOscAbcG4lXyoFT
 4Cn93Q+urfXtwskVCzqECNWxgfRZBPBBGx9yoRccUsI7rEXYWBtRbP2IM1Y0Oy1fy3dp
 yhnqNo8eesd7q3KmdJIsOYdWss1MOaI2+icxQFPBzXS0SyJc2D7O1Rwo1UMHHk8MGENq
 3LRw==
X-Gm-Message-State: AOAM532Zljf1uSTiP0Co1fSa3/ktHakElX227QEQWKIaP+YqaijdiiZi
 JMt0akk70zPBxeORaGNQEkvBshRNM5ki+RMOkQ4=
X-Google-Smtp-Source: ABdhPJwbV2VfRXixZfTVNj+jVsO2B5vKVlVnwnRQOVV3A/VY1Rw8KTVsMZjktOGK+hSfSfnGIj/mpS1xXrUDD/UAhtY=
X-Received: by 2002:a25:3d7:: with SMTP id 206mr3614284ybd.27.1605663811168;
 Tue, 17 Nov 2020 17:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20201117082638.43675-1-bjorn.topel@gmail.com>
 <20201117082638.43675-3-bjorn.topel@gmail.com>
In-Reply-To: <20201117082638.43675-3-bjorn.topel@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Nov 2020 17:43:20 -0800
Message-ID: <CAEf4BzZYXw8cd53+owz1ctsO9diFNJ9oCzgEEGMqRVUjmsN+ew@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: Avoid running unprivileged
 tests with alignment requirements
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_204332_958555_6B4B2B66 
X-CRM114-Status: GOOD (  18.42  )
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, luke.r.nels@gmail.com,
 Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-riscv@lists.infradead.org, xi.wang@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMTI6MjkgQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9w
ZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IFNvbWUgYXJjaGl0ZWN0dXJlcyBoYXZlIHN0cmljdCBh
bGlnbm1lbnQgcmVxdWlyZW1lbnRzLiBJbiB0aGF0IGNhc2UsCj4gdGhlIEJQRiB2ZXJpZmllciBk
ZXRlY3RzIGlmIGEgcHJvZ3JhbSBoYXMgdW5hbGlnbmVkIGFjY2Vzc2VzIGFuZAo+IHJlamVjdHMg
dGhlbS4gQSB1c2VyIGNhbiBwYXNzIEJQRl9GX0FOWV9BTElHTk1FTlQgdG8gYSBwcm9ncmFtIHRv
Cj4gb3ZlcnJpZGUgdGhpcyBjaGVjay4gVGhhdCwgaG93ZXZlciwgd2lsbCBvbmx5IHdvcmsgd2hl
biBhIHByaXZpbGVnZWQKPiB1c2VyIGxvYWRzIGEgcHJvZ3JhbS4gQSB1bnByaXZpbGVnZWQgdXNl
ciBsb2FkaW5nIGEgcHJvZ3JhbSB3aXRoIHRoaXMKPiBmbGFnIHdpbGwgYmUgcmVqZWN0ZWQgcHJp
b3IgZW50ZXJpbmcgdGhlIHZlcmlmaWVyLgoKSSdkIGluY2x1ZGUgdGhpcyBwYXJhZ3JhcGggYXMg
YSBjb2RlIGNvbW1lbnQgcmlnaHQgbmV4dCB0byB0aGUgY2hlY2sgYmVsb3cuCgo+Cj4gSGVuY2Us
IGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gbG9hZCB1bnByaXZpbGVnZWQgcHJvZ3JhbXMgd2l0
aG91dAo+IHN0cmljdCBhbGlnbm1lbnQgd2hlbiB0ZXN0aW5nIHRoZSB2ZXJpZmllci4gVGhpcyBw
YXRjaCBhdm9pZHMgZXhhY3RseQo+IHRoYXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybi50b3BlbEBnbWFpbC5jb20+Cj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi90ZXN0X3ZlcmlmaWVyLmMgfCAxMiArKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF92ZXJpZmllci5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3Rlc3RfdmVyaWZpZXIuYwo+IGluZGV4IDliZTM5NWQ5ZGM2NC4uMjA3NWY2
YTk4ODEzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3Zl
cmlmaWVyLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF92ZXJpZmll
ci5jCj4gQEAgLTExNTIsOSArMTE1MiwxNSBAQCBzdGF0aWMgdm9pZCBnZXRfdW5wcml2X2Rpc2Fi
bGVkKCkKPgo+ICBzdGF0aWMgYm9vbCB0ZXN0X2FzX3VucHJpdihzdHJ1Y3QgYnBmX3Rlc3QgKnRl
c3QpCj4gIHsKPiAtICAgICAgIHJldHVybiAhdGVzdC0+cHJvZ190eXBlIHx8Cj4gLSAgICAgICAg
ICAgICAgdGVzdC0+cHJvZ190eXBlID09IEJQRl9QUk9HX1RZUEVfU09DS0VUX0ZJTFRFUiB8fAo+
IC0gICAgICAgICAgICAgIHRlc3QtPnByb2dfdHlwZSA9PSBCUEZfUFJPR19UWVBFX0NHUk9VUF9T
S0I7Cj4gKyAgICAgICBib29sIHJlcV9hbGlnbmVkID0gZmFsc2U7Cj4gKwo+ICsjaWZuZGVmIENP
TkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gKyAgICAgICByZXFfYWxpZ25l
ZCA9IHRlc3QtPmZsYWdzICYgRl9ORUVEU19FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUzsKPiAr
I2VuZGlmCj4gKyAgICAgICByZXR1cm4gKCF0ZXN0LT5wcm9nX3R5cGUgfHwKPiArICAgICAgICAg
ICAgICAgdGVzdC0+cHJvZ190eXBlID09IEJQRl9QUk9HX1RZUEVfU09DS0VUX0ZJTFRFUiB8fAo+
ICsgICAgICAgICAgICAgICB0ZXN0LT5wcm9nX3R5cGUgPT0gQlBGX1BST0dfVFlQRV9DR1JPVVBf
U0tCKSAmJgo+ICsgICAgICAgICAgICAgICAhcmVxX2FsaWduZWQ7CgpJdCdzIGEgYml0IGNvbnZv
bHV0ZWQuIFRoaXMgc2VlbXMgYSBiaXQgbW9yZSBzdHJhaWdodGZvcndhcmQ6CgojaWZuZGVmIENP
TkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCiAgICBpZiAodGVzdC0+ZmxhZ3Mg
JiBGX05FRURTX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTKQogICAgICAgIHJldHVybiBmYWxz
ZTsKI2VuZGlmCi8qIHRoZSByZXN0IG9mIGxvZ2ljIHVudG91Y2hlZCAqLwoKPwoKCgoKCgo+ICB9
Cj4KPiAgc3RhdGljIGludCBkb190ZXN0KGJvb2wgdW5wcml2LCB1bnNpZ25lZCBpbnQgZnJvbSwg
dW5zaWduZWQgaW50IHRvKQo+IC0tCj4gMi4yNy4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
