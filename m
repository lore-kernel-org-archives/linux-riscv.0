Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD165C282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 12:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D07920818
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 12:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWl+WWqM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B7LQMkR3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGAhCvsi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D07920818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxWKlGsFfOZL9B9wmI8a+5zmwlJabsY9+2bmWfvlvS4=; b=dWl+WWqMFU1/sU
	xaF4YOulxT1yolnyoV5QV8EAbgVupI5Y15pmShKqPIC7M0wqGNGZmGMFZU2GYjOJlxIxXNoPLAzCv
	VSSqlBSo55smGuUonh7ATJh3QIdg5ETVGGARNYk62ln6RHWmDtiu863wPdVu9nVDf8elxYaq5oe4a
	XbkGiY/YoMkDHYB0e18kvaBye63wWEXYpjv6nDiwilSHqzmrOs4jxoTbsqdAi3F0kb/DpDK1KB+KG
	pOV/RzqhrO5s3VaXVtm3VhZaTc3eogoTZJoNMig9pnT61YYj6PETGJED8/tmW2ZNUOwQnx8QvtorD
	Q64weso1L/nsaQWEqe2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0IN-0002fN-5D; Tue, 05 Feb 2019 12:57:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0IJ-0002CI-Nv
 for linux-riscv@bombadil.infradead.org; Tue, 05 Feb 2019 12:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrzR9lbg/TqzIpUd4cPUsm9HDS0QjFtayef4QW4qU7Q=; b=B7LQMkR3v+AGra3EbXCZZWzmAT
 Nqa6eyqbD0gERpN+Bu125kM5+aiVBrCdVMHrT90EUkeIQ6Rjm4yg7AEcbHmnHEjzPmFSoJcXV8Fxk
 2HOxDy4PvLRRYv/mOQh9rEcslpUrsMzCF9nK3etu+K+up1JuvR6aK3VCSnfcsL9rNTx+iP5UDi4Gu
 4patBtiXSCLVpAS7xIV5uDP7cvoP/TgmaSIZwrf3QnsoDUxGs+ul1uamJtDNrS+0W1K8R8xyM1By/
 c9gGhP+/pDuAt6/N6916gzQ8zt0xCmxD0aZ5xBFlxlS5Jl0FL3PrFTmrVQk1wFT5VwA2NdlElXsZh
 Fc9KzMWQ==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr03J-0007VF-Fh
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 12:42:15 +0000
Received: by mail-pf1-x441.google.com with SMTP id b7so1413122pfi.8
 for <linux-riscv@lists.infradead.org>; Tue, 05 Feb 2019 04:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YrzR9lbg/TqzIpUd4cPUsm9HDS0QjFtayef4QW4qU7Q=;
 b=PGAhCvsi/GMm/QLqIX6PuM2JEkzo9LIqzX1hC5GfY/fNsbb1sbz3uZe30vadW9u/IM
 aRkLdWRLS18VtswXyhhOUSaS+TxL4co6+Tm06jFVBP3DAIodEx48MnmGnD5s4lZtfArH
 0yLxTz2uuNqa/ef2pRv5tQIeX0vKOpSOTShrZ66uuenP8Oi3fHv46bIv4x2foVEliod5
 uBhB6LkxmNzaUfHQNueJsF6lKEmd2L53Cj5rIsXb9XgO7K4n1BrSRw3FI8CVN/EHDr2U
 WHEBmEB4og/uj1q9OOp19DvKRy4B5mH9BejMZR6o71MQdLU//g3fMNIW0ItbW+tsWCbx
 HpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YrzR9lbg/TqzIpUd4cPUsm9HDS0QjFtayef4QW4qU7Q=;
 b=pULv5rp6wF740YbU57lQSPRuaqVeYtgMGh0sYYaVAW0r29Ne4W5Zv2RzOCUYinma14
 zAhPp+ztt6+D8uC9ZuZSlBPHWsoG3+NUbhQlmA0vWNd27UPEW/ZEHeOy2wbwDXYZlJfN
 YNYZzWdqCvcVBUrRAPsDvCqkLlNavqmLrad7m56Zye+91pXWAFfKxLUIRb4fPZgRaHqr
 t+nfscIRWT1gbTJmQYTfz/y5mOrq7IdJrE9nI/bim8WKaC4mb/RZ7GdbvK7DRJgDbUEf
 8a6XQYlEb3XgSESUhNEjpYfZgoYg79XPoaHgPfkFJAk9K/TfGMvFYoHtbGlF97Ehv4it
 TuwQ==
X-Gm-Message-State: AHQUAublL/xiskgKjzGuO98xokHFCWvdrlxPwY5X57qQwJ0WJtru5iZv
 jK3ZJ2uGmcbiE0Tc8wJfjTUFPF90ZID81w==
X-Google-Smtp-Source: AHgI3IZN3IsbWz5Q2oM1mEs3v+lkwkQkH+IEO/B0M+s69FoR+oJ/YifzL0lgOLtd49fKGAIc9LU73g==
X-Received: by 2002:a62:6ec8:: with SMTP id j191mr4840003pfc.198.1549370531771; 
 Tue, 05 Feb 2019 04:42:11 -0800 (PST)
Received: from btopel-mobl.ger.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.139.73])
 by smtp.gmail.com with ESMTPSA id g6sm5116774pgq.18.2019.02.05.04.42.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Feb 2019 04:42:11 -0800 (PST)
From: bjorn.topel@gmail.com
To: linux-riscv@lists.infradead.org, daniel@iogearbox.net, ast@kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH bpf-next v2 3/4] bpf, doc: add RISC-V JIT to BPF documentation
Date: Tue,  5 Feb 2019 13:41:24 +0100
Message-Id: <20190205124125.5553-4-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190205124125.5553-1-bjorn.topel@gmail.com>
References: <20190205124125.5553-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_124213_709483_B9F1FE28 
X-CRM114-Status: GOOD (  11.78  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKVXBkYXRlIERvY3Vt
ZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0IGFuZApEb2N1bWVudGF0aW9uL3N5c2N0bC9u
ZXQudHh0IHRvIG1lbnRpb24gUklTQy1WLgoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm4udG9wZWxAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vbmV0d29ya2luZy9maWx0
ZXIudHh0IHwgMTYgKysrKysrKysrLS0tLS0tLQogRG9jdW1lbnRhdGlvbi9zeXNjdGwvbmV0LnR4
dCAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2ZpbHRlci50
eHQgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZmlsdGVyLnR4dAppbmRleCAwMTYwM2JjMmVm
ZjEuLmI1ZTA2MGVkZmMzOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Zp
bHRlci50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2ZpbHRlci50eHQKQEAgLTQ2
NCwxMCArNDY0LDExIEBAIGJyZWFrcG9pbnRzOiAwIDEKIEpJVCBjb21waWxlcgogLS0tLS0tLS0t
LS0tCiAKLVRoZSBMaW51eCBrZXJuZWwgaGFzIGEgYnVpbHQtaW4gQlBGIEpJVCBjb21waWxlciBm
b3IgeDg2XzY0LCBTUEFSQywgUG93ZXJQQywKLUFSTSwgQVJNNjQsIE1JUFMgYW5kIHMzOTAgYW5k
IGNhbiBiZSBlbmFibGVkIHRocm91Z2ggQ09ORklHX0JQRl9KSVQuIFRoZSBKSVQKLWNvbXBpbGVy
IGlzIHRyYW5zcGFyZW50bHkgaW52b2tlZCBmb3IgZWFjaCBhdHRhY2hlZCBmaWx0ZXIgZnJvbSB1
c2VyIHNwYWNlCi1vciBmb3IgaW50ZXJuYWwga2VybmVsIHVzZXJzIGlmIGl0IGhhcyBiZWVuIHBy
ZXZpb3VzbHkgZW5hYmxlZCBieSByb290OgorVGhlIExpbnV4IGtlcm5lbCBoYXMgYSBidWlsdC1p
biBCUEYgSklUIGNvbXBpbGVyIGZvciB4ODZfNjQsIFNQQVJDLAorUG93ZXJQQywgQVJNLCBBUk02
NCwgTUlQUywgUklTQy1WIGFuZCBzMzkwIGFuZCBjYW4gYmUgZW5hYmxlZCB0aHJvdWdoCitDT05G
SUdfQlBGX0pJVC4gVGhlIEpJVCBjb21waWxlciBpcyB0cmFuc3BhcmVudGx5IGludm9rZWQgZm9y
IGVhY2gKK2F0dGFjaGVkIGZpbHRlciBmcm9tIHVzZXIgc3BhY2Ugb3IgZm9yIGludGVybmFsIGtl
cm5lbCB1c2VycyBpZiBpdCBoYXMKK2JlZW4gcHJldmlvdXNseSBlbmFibGVkIGJ5IHJvb3Q6CiAK
ICAgZWNobyAxID4gL3Byb2Mvc3lzL25ldC9jb3JlL2JwZl9qaXRfZW5hYmxlCiAKQEAgLTYwMyw5
ICs2MDQsMTAgQEAgZ290IGZyb20gYnBmX3Byb2dfY3JlYXRlKCksIGFuZCAnY3R4JyB0aGUgZ2l2
ZW4gY29udGV4dCAoZS5nLgogc2tiIHBvaW50ZXIpLiBBbGwgY29uc3RyYWludHMgYW5kIHJlc3Ry
aWN0aW9ucyBmcm9tIGJwZl9jaGVja19jbGFzc2ljKCkgYXBwbHkKIGJlZm9yZSBhIGNvbnZlcnNp
b24gdG8gdGhlIG5ldyBsYXlvdXQgaXMgYmVpbmcgZG9uZSBiZWhpbmQgdGhlIHNjZW5lcyEKIAot
Q3VycmVudGx5LCB0aGUgY2xhc3NpYyBCUEYgZm9ybWF0IGlzIGJlaW5nIHVzZWQgZm9yIEpJVGlu
ZyBvbiBtb3N0IDMyLWJpdAotYXJjaGl0ZWN0dXJlcywgd2hlcmVhcyB4ODYtNjQsIGFhcmNoNjQs
IHMzOTB4LCBwb3dlcnBjNjQsIHNwYXJjNjQsIGFybTMyIHBlcmZvcm0KLUpJVCBjb21waWxhdGlv
biBmcm9tIGVCUEYgaW5zdHJ1Y3Rpb24gc2V0LgorQ3VycmVudGx5LCB0aGUgY2xhc3NpYyBCUEYg
Zm9ybWF0IGlzIGJlaW5nIHVzZWQgZm9yIEpJVGluZyBvbiBtb3N0CiszMi1iaXQgYXJjaGl0ZWN0
dXJlcywgd2hlcmVhcyB4ODYtNjQsIGFhcmNoNjQsIHMzOTB4LCBwb3dlcnBjNjQsCitzcGFyYzY0
LCBhcm0zMiwgcmlzY3YgKFJWNjRHKSBwZXJmb3JtIEpJVCBjb21waWxhdGlvbiBmcm9tIGVCUEYK
K2luc3RydWN0aW9uIHNldC4KIAogU29tZSBjb3JlIGNoYW5nZXMgb2YgdGhlIG5ldyBpbnRlcm5h
bCBmb3JtYXQ6CiAKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3lzY3RsL25ldC50eHQgYi9E
b2N1bWVudGF0aW9uL3N5c2N0bC9uZXQudHh0CmluZGV4IGJjMDY4MDcwNjg3MC4uMmFlOTFkMzg3
M2JiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3N5c2N0bC9uZXQudHh0CisrKyBiL0RvY3Vt
ZW50YXRpb24vc3lzY3RsL25ldC50eHQKQEAgLTUyLDYgKzUyLDcgQEAgdHdvIGZsYXZvcnMgb2Yg
SklUcywgdGhlIG5ld2VyIGVCUEYgSklUIGN1cnJlbnRseSBzdXBwb3J0ZWQgb246CiAgIC0gc3Bh
cmM2NAogICAtIG1pcHM2NAogICAtIHMzOTB4CisgIC0gcmlzY3YKIAogQW5kIHRoZSBvbGRlciBj
QlBGIEpJVCBzdXBwb3J0ZWQgb24gdGhlIGZvbGxvd2luZyBhcmNoczoKICAgLSBtaXBzCi0tIAoy
LjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
