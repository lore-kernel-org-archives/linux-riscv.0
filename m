Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A2ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 22:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M4x7Z6R09/afjiErkAgOJ/mu/alcAKe+h04cR80jizo=; b=afnr6DzqTRpvsA
	SyjsOjMusX6y3g8GnyCXRUn/hqfYHCaSkMI/0p/kvejjNoe1GXuLb026uEY1wtjn3Zn7/q5sTb3jp
	xhC4Zv3e9F+N+2sbR9QPAzfQ6ssFXRHyllgMNXzVK6vmdTUl4VdzVzfpY1/Uf1bdoteBBRtYf7bps
	VpqVena3sPEQZk7vN5ZHmzNuA6DO8KcT1TFlnhc5itqG6tdax7DPuapDnY2olfBNvxEcLnnjdaJf3
	rLvd/+5bH2Zz7ctNSc7Rpn6MVBOxEW4cF1bSjjepQaCh7GQhKb8EvS3WmnpTips8YvIwbU28pB01M
	Hf+QhLFv9j1eOBNQNccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaPQN-00FvIY-3Z; Mon, 19 Sep 2022 22:39:35 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaPQJ-00FvIF-71
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 22:39:32 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 3so718815pga.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fFcLaIdKXlgDGkA95O0lHl/2ZQsYb6rituY3HQNR/Cw=;
        b=KYcfCDEi4vF8hV/a+u7f57iqAAJ4vl/lQfGYkx27RywtgANIRwbfXfN5pAkDZs2F6N
         o1or1G779iRYXIfEL+QSHX9L9DzHSjh8QQv1wptf1THJA09U3hqVpHWBsh9GcY0PizSN
         zRXb8gMxH3ECXOPMRLdYAUL/7BbMtDyv8b8T1CgqRKOpGjnStB9MUUQfUeQ45Q75P9Vb
         eFxOkF3sns5d29ooDP09ItoyeViXWsIdfLM48+AzcIX5KoxOFXYur8/Jv6ZgoR2UceN4
         FQXK3bKK0+CfigkDXfsNUo6Z+pUguhpB5a9Jzf+8aC0SkDSoh0zwyjc8sfEgqMhDCxId
         52fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fFcLaIdKXlgDGkA95O0lHl/2ZQsYb6rituY3HQNR/Cw=;
        b=B5tUExj6V3F1elK6SSBK9DFq5BX2lRlRu5dISO04COch4F9tOMtqEiw8flD0HwWxcv
         6CDVxgxuIDJXvEC3ShdOHW6t2T4kYUXVZ9qzUmKFOSBSGyNZ9/mySMZdOCtppPrUYDIP
         NhM2K9+EmBHTWcirJQv/g//NGW1DM0mNc9xR9k3O2XSxksCFkWGxPrf0u/Fn8dtWDOFT
         HyN1nxRXxYL5iFg5Uv+kHh9hkzRliZ5Z3V1u2QcIWmRDpf87vcRnM2YyRAvbOqvjcVTB
         hUVP/teAiTcNBPRE2Vk1F2vUuLiBYepuJOaCsSNggeiltd2jCtuJOiDx9t5jn9MpPpsh
         tFpA==
X-Gm-Message-State: ACrzQf2rg26XC8XQL9GMtLlYqPPPRVRs2Jlr/4zOCnkQ1o5aLAF1rerQ
	T0JKuqnenvQlNLBaOKIi9ocqbQ==
X-Google-Smtp-Source: AMsMyM7DR/q1kUqDv3ej5C4oQEc0xUujKbwn4sZlKKHP//4c/iOs4jcquF4XZadj+kHrp9ciHVQrhw==
X-Received: by 2002:a63:4243:0:b0:439:2031:be87 with SMTP id p64-20020a634243000000b004392031be87mr17659366pga.592.1663627170148;
        Mon, 19 Sep 2022 15:39:30 -0700 (PDT)
Received: from lx2k.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903244500b00177f32b1a32sm21074410pls.271.2022.09.19.15.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 15:39:29 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] serial: sifive: enable clocks for UART when probed
Date: Mon, 19 Sep 2022 15:39:15 -0700
Message-Id: <20220919223915.5146-1-olof@lixom.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_153931_484398_3F1326F3 
X-CRM114-Status: GOOD (  14.06  )
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

V2hlbiB0aGUgUFdNIGRyaXZlciB3YXMgY2hhbmdlZCB0byBkaXNhYmxlIGNsb2NrcyBpZiBubyBQ
V01zIGFyZSBlbmFibGVkLAppdCBlbmRlZCB1cCBhbHNvIGRpc2FibGluZyB0aGUgc2hhcmVkIHBh
cmVudCB3aXRoIHRoZSBVQVJULCBzaW5jZSB0aGUKVUFSVCBkb2Vzbid0IGRvIGFueSBjbG9jayBl
bmFibGVtZW50IG9uIGl0cyBvd24uCgpUbyBhdm9pZCB0aGVzZSBzdXJwcmlzZXMsIGFkZCBjbGtf
cHJlcGFyZV9lbmFibGUvY2xrX2Rpc2FibGVfdW5wcmVwYXJlCmNhbGxzLgoKRml4ZXM6IGFjZTQx
ZDc1NjRlNjU1ICgicHdtOiBzaWZpdmU6IEVuc3VyZSB0aGUgY2xrIGlzIGVuYWJsZWQgZXhhY3Rs
eSBvbmNlIHBlciBydW5uaW5nIFBXTSIpCkNjOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgpDYzogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVu
bmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPgpDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+Ci0tLQogZHJpdmVy
cy90dHkvc2VyaWFsL3NpZml2ZS5jIHwgMTQgKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dHR5L3NlcmlhbC9zaWZpdmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwppbmRleCA1
YzNhMDc1NDZhNTguLjc1MWY5ODA2ODgwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFs
L3NpZml2ZS5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwpAQCAtOTUwLDIzICs5
NTAsMjggQEAgc3RhdGljIGludCBzaWZpdmVfc2VyaWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJCWRldl9lcnIoJnBkZXYtPmRldiwgInVuYWJsZSB0byBmaW5kIGNvbnRy
b2xsZXIgY2xvY2tcbiIpOwogCQlyZXR1cm4gUFRSX0VSUihjbGspOwogCX0KKwljbGtfcHJlcGFy
ZV9lbmFibGUoY2xrKTsKIAogCWlkID0gb2ZfYWxpYXNfZ2V0X2lkKHBkZXYtPmRldi5vZl9ub2Rl
LCAic2VyaWFsIik7CiAJaWYgKGlkIDwgMCkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJtaXNz
aW5nIGFsaWFzZXMgZW50cnlcbiIpOwotCQlyZXR1cm4gaWQ7CisJCXIgPSBpZDsKKwkJZ290byBw
cm9iZV9vdXQxOwogCX0KIAogI2lmZGVmIENPTkZJR19TRVJJQUxfU0lGSVZFX0NPTlNPTEUKIAlp
ZiAoaWQgPiBTSUZJVkVfU0VSSUFMX01BWF9QT1JUUykgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJ0b28gbWFueSBVQVJUcyAoJWQpXG4iLCBpZCk7Ci0JCXJldHVybiAtRUlOVkFMOworCQlyID0g
LUVJTlZBTDsKKwkJZ290byBwcm9iZV9vdXQxOwogCX0KICNlbmRpZgogCiAJc3NwID0gZGV2bV9r
emFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqc3NwKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFzc3Ap
Ci0JCXJldHVybiAtRU5PTUVNOworCWlmICghc3NwKSB7CisJCXIgPSAtRU5PTUVNOworCQlnb3Rv
IHByb2JlX291dDE7CisJfQogCiAJc3NwLT5wb3J0LmRldiA9ICZwZGV2LT5kZXY7CiAJc3NwLT5w
b3J0LnR5cGUgPSBQT1JUX1NJRklWRV9WMDsKQEAgLTEwMjgsNiArMTAzMyw3IEBAIHN0YXRpYyBp
bnQgc2lmaXZlX3NlcmlhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogcHJv
YmVfb3V0MjoKIAljbGtfbm90aWZpZXJfdW5yZWdpc3Rlcihzc3AtPmNsaywgJnNzcC0+Y2xrX25v
dGlmaWVyKTsKIHByb2JlX291dDE6CisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNsayk7CiAJcmV0
dXJuIHI7CiB9CiAKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
