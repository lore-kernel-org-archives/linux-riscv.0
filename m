Return-Path: <SRS0=yhZS=QK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5FBC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 11:52:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F2421773
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 11:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FQkzICEg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spl00bHh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F2421773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ef6lq5kFba0YFIU41vH4q4gCOPftDe5BCEBIAxQl2I=; b=FQkzICEgGEE3pS
	sBKxkUpSobbF5YFm5u4+HITsBMQ98msnS9PJgYlb5pSjkIK2tbjaOcoujhaYCOzZ0dKYnbyQRWNJp
	vHxGjvskuwQvIr/ItBOs0Yq6MqR9dEhSlPXe1nasqfQP5zeyML0GyQk/PeBlxVgQgzX8RBBiG8DEG
	p4Jasb5yNpv4SbaHpiaH7hmptx5d3RWmTjeV3gV5cK2a/duc2YE0WTgYAJn/4fQBoJZM+AtgY27+m
	r9Nbgm4DX9qRoHkV6dyZzN/tJCVaiklk3AkKPpZcYqsiwnKORMHjLCD7CzIfmjudV1CR+yLooJ2HQ
	XstvmTbcU1aYKDXAYsuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqGKV-0007oz-JI; Sun, 03 Feb 2019 11:52:55 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqGKT-0007oA-3M
 for linux-riscv@lists.infradead.org; Sun, 03 Feb 2019 11:52:54 +0000
Received: by mail-ed1-x543.google.com with SMTP id f23so9019872edb.3
 for <linux-riscv@lists.infradead.org>; Sun, 03 Feb 2019 03:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ov2pY1QRT8MdFzbiJyQGfF9j+mQj8oBAgdYLbigi/aQ=;
 b=spl00bHhBHFLhb54GwqLWgpKVuOz32gC0O3fQKb+n9Z4U5fH274m0cC6qpDDHHKOXh
 MTqafi8fNwZmK4GMe6Y4EbIdXTVbCkf0P8XmqcuYr/4F2aldWoOYmbI9n2vOmyG5LDl0
 LDPng/90vqoUZYSJGLrl39QBnszBNE215i6Zf/gnxUW1az5/NcA4SPmKQSwaEvBbdJxD
 0yOuEds/XuIEjsuFmx/z5V2QTwVGCautsOYtpVOKGTiEVai/FAjqb52MPBsMM+eAd5qJ
 nTWkZ9uyqUbZHg6FhrV0cndGQeZz85m8bIhDzoDnQ9VWkbi3dyrym/GkVkw1k9rraEYH
 tqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ov2pY1QRT8MdFzbiJyQGfF9j+mQj8oBAgdYLbigi/aQ=;
 b=LR23VYUA2E43uVtWkTj5iRnfSqFUPYWns0BY+drbjARYq2gQqMGHFRRH6c9/8a1hmJ
 7w0CUruw4jBd9hBJxnKoRCYCh+cvM+IKKvahZUkTuPVZN7DOqG3v3S4J51pdKbmK0vez
 mvwBdfGvBU1pOJWu8pRwEr9osVvUhQEf0W1Lzm4TQAtPORgGFaX/6/DMvzul+EEuQkcQ
 +XSJIUuqAbIpl+UpCGfOOPAOUDPnf7L4n1EOK8o40xtAzu1Drou4mOAdPEbQS1/RX44z
 AJlIo3DaHUY4LPKxxr0goaH4ovWuUsEBiN9W5fFPLx3dfvVPkv6X6NBjpk1g937g0UvX
 iz0g==
X-Gm-Message-State: AJcUukccrTYGl74KzBgORP5yW8+10qd05IfgxWPDAPUCKL1ssHWfy6Rn
 WQMkU7rNoK6/5pa0iQuskbyXzN46+4fkBQ==
X-Google-Smtp-Source: ALg8bN6VXWYsaOPI6sgjHpOTQAoIe00f+ea3bVdGck4+VmOLBYtKPI9rv9d5kscsXcWkPlptkqP58A==
X-Received: by 2002:a17:906:ee2:: with SMTP id
 x2mr23502391eji.202.1549194771272; 
 Sun, 03 Feb 2019 03:52:51 -0800 (PST)
Received: from btopel-mobl.ger.intel.com
 ([2001:67c:1810:f055:c82b:bcf5:1add:2ef0])
 by smtp.gmail.com with ESMTPSA id l10sm2120719ejq.55.2019.02.03.03.52.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 03:52:50 -0800 (PST)
From: bjorn.topel@gmail.com
To: linux-riscv@lists.infradead.org, daniel@iogearbox.net, ast@kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH bpf-next 2/3] MAINTAINERS: add RISC-V BPF JIT maintainer
Date: Sun,  3 Feb 2019 12:51:30 +0100
Message-Id: <20190203115132.8766-3-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190203115132.8766-1-bjorn.topel@gmail.com>
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_035253_139362_2CC5FAF4 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Cc: hch@infradead.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKQWRkIEJqw7ZybiBU
w7ZwZWwgYXMgUklTQy1WIEJQRiBKSVQgbWFpbnRhaW5lci4KClNpZ25lZC1vZmYtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDYgKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRB
SU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAwMTlhMmJjZmJkMDkuLmI0NDkxMTMyYjljZSAxMDA2
NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTI5MDcsNiArMjkwNywx
MiBAQCBMOgluZXRkZXZAdmdlci5rZXJuZWwub3JnCiBTOglNYWludGFpbmVkCiBGOglhcmNoL3Bv
d2VycGMvbmV0LwogCitCUEYgSklUIGZvciBSSVNDLVYgKFJWNjRHKQorTToJQmrDtnJuIFTDtnBl
bCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgorTDoJbmV0ZGV2QHZnZXIua2VybmVsLm9yZworUzoJ
TWFpbnRhaW5lZAorRjoJYXJjaC9yaXNjdi9uZXQvCisKIEJQRiBKSVQgZm9yIFMzOTAKIE06CU1h
cnRpbiBTY2h3aWRlZnNreSA8c2Nod2lkZWZza3lAZGUuaWJtLmNvbT4KIE06CUhlaWtvIENhcnN0
ZW5zIDxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgotLSAKMi4xOS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
