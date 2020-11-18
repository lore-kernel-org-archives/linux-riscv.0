Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A692C6369E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 07:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE9742223D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 07:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPKRzA7h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vSVKnliA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE9742223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xSVGM7cOq2OgtvsKjCbB4z8ZsHf1LLYQEs+sFFU9/QI=; b=bPKRzA7hzq5+yjq7BiQqmjgVB
	9spD4FLrii2iJHZK8ye3jStawqTBzKJo49ASdFyB/XdDMa6F2NiFsdtVAWySTsCepehbvLBd+ert1
	npYJprxHNaAtNKXYrAM293Q4RfqjJEgQ1g2lnUk9cke8S8HTohkeN+6aXV1tQAmIPGb96HW7EObrY
	dZ0t2PpJKcspXAYRUvUTlPkG5K5yFq4Xxd2k3v8Hkb5QYfrmzn/pL7C16XbSJXEMFGA/u0RsqNMnA
	4g/gQsUxz0Jp9ngjcn4XBr+Z2OB7BMFjIHB5ZkmnDJCUfVb7zAx40GtF3POTZbqLN/XCxIOJTw9Hm
	6/Dx9C7Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHiD-0005Rt-Kg; Wed, 18 Nov 2020 07:17:05 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHiC-0005Qr-2k
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 07:17:04 +0000
Received: by mail-pf1-x442.google.com with SMTP id 10so843517pfp.5
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 23:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQiaQWe1AWIjaVTJuJBFgIAAz8j2qQ724nNHTwatFOs=;
 b=vSVKnliAxoFoUdps97fF/MjRhQ5PIHrwyawIWZd05AJfXApgPY82aNInmnvjBjmpan
 6g+i0/Qy6UGSRQM9zy54Ys6f9FmGP/ZDKsQt10DYxTrmAYZ6taCZ4pajYYSDIY1+jUwx
 Pegt0N08Y39QrbAhGCun5bB5P7uMiNcTp6oV8DGaZ+alPc1c2bNwwRn5bCZ6slXQPfOZ
 BztFvviYFyuc/xxH2DaLwDyWTiNRsmhq+jLiUlco0fyTEFyUDE0GPz3yM5AND2yAFaub
 jFOCBs9sTz8PblxAWALD5mnIDHFiPyxlPjiJTMBccppvhVs120jj5nx60ZJgNUUch1bY
 fFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQiaQWe1AWIjaVTJuJBFgIAAz8j2qQ724nNHTwatFOs=;
 b=AHSN823WSrEgByHeB6SUB0gzkkMiiag6t9QvXRbD7goCZcK0bxJ7EujqPJyf/EVONf
 AM+20T+8YnyTJs277A2zPQd2gTRfrxJ0a7G4KRASW2nOOV58yeUOrjGoCvKcK19OPiyn
 eGAOQ6PNt39HYOMx6PDnFVd8+wpR/oBzUdJDq7mMo0C7dzXd/uU/g3CPmBet6cWIIAIv
 L+dAt/HhOGqKyvBR/+45lza7yt5xjMJbfCmV3YrYba9amWNlmwI0fquPIst1f6tc5PA0
 CrrKj8vU+KzpdYmG/ljI3cYDLKmMkdlmTCmFrs/JWg3K1gOSgQJD223k/awezeiTQcvG
 HydQ==
X-Gm-Message-State: AOAM531zfSYPtcfbsU+pEgU6DbB1lXVDeDiLvphPlnPYg7DMnXsoiEMo
 9FCUkWY1G/ORUtDWPYbvOmc=
X-Google-Smtp-Source: ABdhPJw2gtuOIRE7j9J06MAVlG7kUBMjmQwO7oGzFjqSilAEwDBsEPJYa2gm3i+uAcaI0ozD7n0IgA==
X-Received: by 2002:a65:684d:: with SMTP id q13mr7150124pgt.372.1605683822228; 
 Tue, 17 Nov 2020 23:17:02 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.45])
 by smtp.gmail.com with ESMTPSA id e128sm23019382pfe.154.2020.11.17.23.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 23:17:01 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next v2 2/3] selftests/bpf: Avoid running unprivileged
 tests with alignment requirements
Date: Wed, 18 Nov 2020 08:16:39 +0100
Message-Id: <20201118071640.83773-3-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118071640.83773-1-bjorn.topel@gmail.com>
References: <20201118071640.83773-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_021704_188312_BA080AE8 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, andrii.nakryiko@gmail.com, xi.wang@gmail.com,
 luke.r.nels@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29tZSBhcmNoaXRlY3R1cmVzIGhhdmUgc3RyaWN0IGFsaWdubWVudCByZXF1aXJlbWVudHMuIElu
IHRoYXQgY2FzZSwKdGhlIEJQRiB2ZXJpZmllciBkZXRlY3RzIGlmIGEgcHJvZ3JhbSBoYXMgdW5h
bGlnbmVkIGFjY2Vzc2VzIGFuZApyZWplY3RzIHRoZW0uIEEgdXNlciBjYW4gcGFzcyBCUEZfRl9B
TllfQUxJR05NRU5UIHRvIGEgcHJvZ3JhbSB0bwpvdmVycmlkZSB0aGlzIGNoZWNrLiBUaGF0LCBo
b3dldmVyLCB3aWxsIG9ubHkgd29yayB3aGVuIGEgcHJpdmlsZWdlZAp1c2VyIGxvYWRzIGEgcHJv
Z3JhbS4gQW4gdW5wcml2aWxlZ2VkIHVzZXIgbG9hZGluZyBhIHByb2dyYW0gd2l0aCB0aGlzCmZs
YWcgd2lsbCBiZSByZWplY3RlZCBwcmlvciBlbnRlcmluZyB0aGUgdmVyaWZpZXIuCgpIZW5jZSwg
aXQgZG9lcyBub3QgbWFrZSBzZW5zZSB0byBsb2FkIHVucHJpdmlsZWdlZCBwcm9ncmFtcyB3aXRo
b3V0CnN0cmljdCBhbGlnbm1lbnQgd2hlbiB0ZXN0aW5nIHRoZSB2ZXJpZmllci4gVGhpcyBwYXRj
aCBhdm9pZHMgZXhhY3RseQp0aGF0LgoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm4udG9wZWxAZ21haWwuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0
X3ZlcmlmaWVyLmMgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3Zl
cmlmaWVyLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF92ZXJpZmllci5jCmlu
ZGV4IDliZTM5NWQ5ZGM2NC4uNGJmZTNhYTJjZmM0IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvdGVzdF92ZXJpZmllci5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi90ZXN0X3ZlcmlmaWVyLmMKQEAgLTExNTIsNiArMTE1MiwxOSBAQCBzdGF0aWMgdm9p
ZCBnZXRfdW5wcml2X2Rpc2FibGVkKCkKIAogc3RhdGljIGJvb2wgdGVzdF9hc191bnByaXYoc3Ry
dWN0IGJwZl90ZXN0ICp0ZXN0KQogeworI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5B
TElHTkVEX0FDQ0VTUworCS8qIFNvbWUgYXJjaGl0ZWN0dXJlcyBoYXZlIHN0cmljdCBhbGlnbm1l
bnQgcmVxdWlyZW1lbnRzLiBJbgorCSAqIHRoYXQgY2FzZSwgdGhlIEJQRiB2ZXJpZmllciBkZXRl
Y3RzIGlmIGEgcHJvZ3JhbSBoYXMKKwkgKiB1bmFsaWduZWQgYWNjZXNzZXMgYW5kIHJlamVjdHMg
dGhlbS4gQSB1c2VyIGNhbiBwYXNzCisJICogQlBGX0ZfQU5ZX0FMSUdOTUVOVCB0byBhIHByb2dy
YW0gdG8gb3ZlcnJpZGUgdGhpcworCSAqIGNoZWNrLiBUaGF0LCBob3dldmVyLCB3aWxsIG9ubHkg
d29yayB3aGVuIGEgcHJpdmlsZWdlZCB1c2VyCisJICogbG9hZHMgYSBwcm9ncmFtLiBBbiB1bnBy
aXZpbGVnZWQgdXNlciBsb2FkaW5nIGEgcHJvZ3JhbQorCSAqIHdpdGggdGhpcyBmbGFnIHdpbGwg
YmUgcmVqZWN0ZWQgcHJpb3IgZW50ZXJpbmcgdGhlCisJICogdmVyaWZpZXIuCisJICovCisJaWYg
KHRlc3QtPmZsYWdzICYgRl9ORUVEU19FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUykKKwkJcmV0
dXJuIGZhbHNlOworI2VuZGlmCiAJcmV0dXJuICF0ZXN0LT5wcm9nX3R5cGUgfHwKIAkgICAgICAg
dGVzdC0+cHJvZ190eXBlID09IEJQRl9QUk9HX1RZUEVfU09DS0VUX0ZJTFRFUiB8fAogCSAgICAg
ICB0ZXN0LT5wcm9nX3R5cGUgPT0gQlBGX1BST0dfVFlQRV9DR1JPVVBfU0tCOwotLSAKMi4yNy4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
