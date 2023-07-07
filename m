Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E0EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 05:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=44xmlN2+x0umoEJJ3JGu8x7jpevlGbcI+4X5DByznj4=; b=kh+dLAI9CFmjzy
	sJ8tsVx8kl5dH1sgil6TWv1Qx2NwBYn37ozv/IsZ/NTyTP5lfV23g9akl7b6Zd5K7QF61DrYjOvMs
	1uVeSpjLk6kz7wHZw9U8L2De1YoHEVetAn0B6786WZz6enE0xxYumnZZxQP/Kzlpy/sTwQif2NcV6
	NPkYyA5jmoNqY/7iQEdXfTLAx1hSO0+cz9ROeQGXOFi9Ec5w8/FmWPfDXgyNfWPU6bK+ujhqdplqH
	UoFxYAE7CfdPAQmqpq6y2F8MORPZ7TF+x2rfGqyJNjYkbIk0Tnb9KY7c3eFTiroV2A/Oyqf6Bpj4J
	QCepTXREdc6/n1xWIOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHeJN-003f4H-2h;
	Fri, 07 Jul 2023 05:47:21 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHeJL-003f2J-1p
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 05:47:21 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6b7474b0501so1396690a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688708837; x=1691300837;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=18JEHmCNriSXCt9lwVG1gdY95Ti8XFVzzNrMetTB3RE=;
        b=ogFntHJ6RxrAEPFVudPEAa0C385HOnOfUwce+99Yasx8myU/rGAYtZSCGU0Eg6ka2k
         fStAVEM215dE6taLQkpDCoVzX0gIBP50UI7H/XkVpcsDVTA90x0Sfgrc4Ft2KYz7AnKq
         RxFnRYV+MZVB5aSMSp7mFQQgunJ/v4Uemk3OuBWv+DLXyb9MDeP9aiPq6kNgqIUxOG+a
         +0WgAyvP2+nS43sXwUu2x16ezvod9el2VwCAHh4JvXyafuZMbmq/OVfpGtGrGZC6rlKD
         y0iO3BSK7iCLTf2qyZz3acrM6pKF7ZgTFb9VwN7JFN4JGrV+Sc8V38KYbGMY0lg1tGLm
         l+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688708837; x=1691300837;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18JEHmCNriSXCt9lwVG1gdY95Ti8XFVzzNrMetTB3RE=;
        b=XEtr8+vt7uJN73izWoSx17yBcfalOQDqrDpcxEfr92d5Tfqt2utdV3SGn0BhPf6VBD
         6Ja6xTM7gynTeX4ewIjqnv2Ke5wcYQmJCCCzvSVuG1hsZZBMtps1GltKRGFO0LMha9ci
         7zhCM7JH47Ku2BgC1J5vXyegb2V8DZB+AMmT9EUfHCRR4tpaes+rPsP8586/9uwSCShz
         p66dbPAFg9bBmhLH+MpMEJa+Wmvb7LxAEX/lxS+DaHVUTw9kLxoRvEZFP50WcnvEr9mu
         Qu2CbycWl1T4LlDTYkL8Ex2bxmlEydqZrHW1Qij4fujcLzESDzr+QmmgGyc1JcNXxLn/
         //1w==
X-Gm-Message-State: ABy/qLamRO3v6GR23jaTwaNp1JdFcWwxKSPmL2bVpvtr/aAz2Zb7z956
	JcC9T8rZ+8LzQr2IvGf4HLBxPyn5/i1xbiGxbuk=
X-Google-Smtp-Source: APBJJlHUM5/Nf9hH+y4tg3FzZmGqyw1ddyEvNg72h5Yn0LMsT5qA1AMEzfyr6IZEBbt4CHH90jrmOg==
X-Received: by 2002:a05:6870:d20e:b0:17a:c7ff:ccf5 with SMTP id g14-20020a056870d20e00b0017ac7ffccf5mr4889304oac.32.1688708837341;
        Thu, 06 Jul 2023 22:47:17 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p16-20020a17090ad31000b00263fc1ef1aasm710558pju.10.2023.07.06.22.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 22:47:16 -0700 (PDT)
Subject: [PATCH] module: Ignore RISC-V mapping symbols too
Date: Thu,  6 Jul 2023 22:40:01 -0700
Message-ID: <20230707054007.32591-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mcgrof@kernel.org, rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_224719_686747_D9625306 
X-CRM114-Status: GOOD (  19.83  )
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

UklTQy1WIGhhcyBhbiBleHRlbmRlZCBmb3JtIG9mIG1hcHBpbmcgc3ltYm9scyB0aGF0IHdlIHVz
ZSB0byBlbmNvZGUKdGhlIElTQSB3aGVuIGl0IGNoYW5nZXMgaW4gdGhlIG1pZGRsZSBvZiBhbiBF
TEYuICBUaGlzIHRyaXBzIHVwIG1vZHBvc3QKYXMgYSBidWlsZCBmYWlsdXJlLCBJIGhhdmVuJ3Qg
eWV0IHZlcmlmaWVkIGl0IHlldCBidXQgSSBiZWxpZXZlIHRoZQprYWxsc3ltcyBkaWZmZXJlbmNl
IHNob3VsZCByZXN1bHQgaW4gc3RhY2tzIGxvb2tpbmcgc2FuZSBhZ2Fpbi4KClJlcG9ydGVkLWJ5
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzlkOWUyOTAyLTU0ODktNGJmMC1kOWNiLTU1NmM4ZTVkNzFjMkBpbmZy
YWRlYWQub3JnLwpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KLS0tCkknbSBub3Qgc3VyZSBhYm91dCBhIGZpeGVzIGhlcmUsIHRoZSBicmVha2FnZSBj
b21lcyBmcm9tIGEgYmludXRpbHMgY2hhbmdlCnRoYXQncyBwcmV0dHkgbXVjaCBpbmRlcGVuZGVu
dCBmcm9tIHRoZSBrZXJuZWwuCgpQbHVtYmluZyBpbiB0aHJvdWdoIHRoZSBSSVNDLVYtc3BlY2lm
aWMgc3dpdGNoIGlzIGFsc28gYSBiaXQgdWdseSwgYnV0IEknbSBub3QKc3VyZSBqdXN0IGRyb3Bw
aW5nIGV2ZXJ5b25lJ3MgIiQiLXByZWZpeGVkIHN5bWJvbHMgaXMgYSBnb29kIGlkZWEgLS0gdGhl
IHJlc3QKb2YgdGhpcyBpcyBzb3J0IG9mIGhhbGYtd2F5IGFyY2gtc3BlY2lmaWMsIHRob3VnaCwg
c28gbWF5YmUgdGhhdCdzIHRoZSB3YXkgdG8KZ28/ICBJIGZpZ3VyZSBpdCdzIGVhc2llciB0byBk
ZWxldGUgc3R1ZmYgdGhhbiBhZGQgaXQsIHRob3VnaC4KLS0tCiBpbmNsdWRlL2xpbnV4L21vZHVs
ZV9zeW1ib2wuaCB8IDEyICsrKysrKysrKysrLQoga2VybmVsL21vZHVsZS9rYWxsc3ltcy5jICAg
ICAgfCAgOCArKysrKysrLQogc2NyaXB0cy9tb2QvbW9kcG9zdC5jICAgICAgICAgfCAgMiArLQog
MyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oIGIvaW5jbHVkZS9saW51eC9tb2R1
bGVfc3ltYm9sLmgKaW5kZXggN2FjZTdiYTMwMjAzLi41Yjc5OTk0MmIyNDMgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oCisrKyBiL2luY2x1ZGUvbGludXgvbW9kdWxl
X3N5bWJvbC5oCkBAIC0zLDEyICszLDIyIEBACiAjZGVmaW5lIF9MSU5VWF9NT0RVTEVfU1lNQk9M
X0gKIAogLyogVGhpcyBpZ25vcmVzIHRoZSBpbnRlbnNlbHkgYW5ub3lpbmcgIm1hcHBpbmcgc3lt
Ym9scyIgZm91bmQgaW4gRUxGIGZpbGVzLiAqLwotc3RhdGljIGlubGluZSBpbnQgaXNfbWFwcGlu
Z19zeW1ib2woY29uc3QgY2hhciAqc3RyKQorc3RhdGljIGlubGluZSBpbnQgaXNfbWFwcGluZ19z
eW1ib2woY29uc3QgY2hhciAqc3RyLCBpbnQgaXNfcmlzY3YpCiB7CiAJaWYgKHN0clswXSA9PSAn
LicgJiYgc3RyWzFdID09ICdMJykKIAkJcmV0dXJuIHRydWU7CiAJaWYgKHN0clswXSA9PSAnTCcg
JiYgc3RyWzFdID09ICcwJykKIAkJcmV0dXJuIHRydWU7CisJLyoKKwkgKiBSSVNDLVYgZGVmaW5l
cyB2YXJpb3VzIHNwZWNpYWwgc3ltYm9scyB0aGF0IHN0YXJ0IHdpdGggIiQiLsKgIFRoZQorCSAq
IG1hcHBpbmcgc3ltYm9scywgd2hpY2ggZXhpc3QgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGlu
Y29tcGF0aWJsZQorCSAqIGluc3RydWN0aW9uIGVuY29kaW5ncyB3aGVuIGRpc2Fzc2VtYmxpbmcs
IHNob3cgdXAgYWxsIG92ZXIgdGhlIHBsYWNlCisJICogYW5kIGFyZSBnZW5lcmFsbHkgbm90IG1l
YW50IHRvIGJlIHRyZWF0ZWQgbGlrZSBvdGhlciBzeW1ib2xzLsKgIFNvCisJICoganVzdCBpZ25v
cmUgYW55IG9mIHRoZSBzcGVjaWFsIHN5bWJvbHMuCisJICovCisJaWYgKGlzX3Jpc2N2KQorCQly
ZXR1cm4gc3RyWzBdID09ICckJzsKKwogCXJldHVybiBzdHJbMF0gPT0gJyQnICYmCiAJICAgICAg
IChzdHJbMV0gPT0gJ2EnIHx8IHN0clsxXSA9PSAnZCcgfHwgc3RyWzFdID09ICd0JyB8fCBzdHJb
MV0gPT0gJ3gnKQogCSAgICAgICAmJiAoc3RyWzJdID09ICdcMCcgfHwgc3RyWzJdID09ICcuJyk7
CmRpZmYgLS1naXQgYS9rZXJuZWwvbW9kdWxlL2thbGxzeW1zLmMgYi9rZXJuZWwvbW9kdWxlL2th
bGxzeW1zLmMKaW5kZXggZWY3M2FlN2M4OTA5Li4xZTk4OGU1NDJjNWQgMTAwNjQ0Ci0tLSBhL2tl
cm5lbC9tb2R1bGUva2FsbHN5bXMuYworKysgYi9rZXJuZWwvbW9kdWxlL2thbGxzeW1zLmMKQEAg
LTEyLDYgKzEyLDEyIEBACiAjaW5jbHVkZSA8bGludXgvYnNlYXJjaC5oPgogI2luY2x1ZGUgImlu
dGVybmFsLmgiCiAKKyNpZmRlZiBDT05GSUdfUklTQ1YKKyNkZWZpbmUgSVNfUklTQ1YgMQorI2Vs
c2UKKyNkZWZpbmUgSVNfUklTQ1YgMAorI2VuZGlmCisKIC8qIExvb2t1cCBleHBvcnRlZCBzeW1i
b2wgaW4gZ2l2ZW4gcmFuZ2Ugb2Yga2VybmVsX3N5bWJvbHMgKi8KIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2VybmVsX3N5bWJvbCAqbG9va3VwX2V4cG9ydGVkX3N5bWJvbChjb25zdCBjaGFyICpuYW1l
LAogCQkJCQkJCSAgY29uc3Qgc3RydWN0IGtlcm5lbF9zeW1ib2wgKnN0YXJ0LApAQCAtMjg5LDcg
KzI5NSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpmaW5kX2thbGxzeW1zX3N5bWJvbChzdHJ1Y3Qg
bW9kdWxlICptb2QsCiAJCSAqIGFuZCBpbnNlcnRlZCBhdCBhIHdoaW0uCiAJCSAqLwogCQlpZiAo
KmthbGxzeW1zX3N5bWJvbF9uYW1lKGthbGxzeW1zLCBpKSA9PSAnXDAnIHx8Ci0JCSAgICBpc19t
YXBwaW5nX3N5bWJvbChrYWxsc3ltc19zeW1ib2xfbmFtZShrYWxsc3ltcywgaSkpKQorCQkgICAg
aXNfbWFwcGluZ19zeW1ib2woa2FsbHN5bXNfc3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpLCBJU19S
SVNDVikpCiAJCQljb250aW51ZTsKIAogCQlpZiAodGhpc3ZhbCA8PSBhZGRyICYmIHRoaXN2YWwg
PiBiZXN0dmFsKSB7CmRpZmYgLS1naXQgYS9zY3JpcHRzL21vZC9tb2Rwb3N0LmMgYi9zY3JpcHRz
L21vZC9tb2Rwb3N0LmMKaW5kZXggYjI5YjI5NzA3ZjEwLi43YzcxNDI5ZDY1MDIgMTAwNjQ0Ci0t
LSBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYworKysgYi9zY3JpcHRzL21vZC9tb2Rwb3N0LmMKQEAg
LTEwNTIsNyArMTA1Miw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGlzX3ZhbGlkX25hbWUoc3RydWN0
IGVsZl9pbmZvICplbGYsIEVsZl9TeW0gKnN5bSkKIAogCWlmICghbmFtZSB8fCAhc3RybGVuKG5h
bWUpKQogCQlyZXR1cm4gMDsKLQlyZXR1cm4gIWlzX21hcHBpbmdfc3ltYm9sKG5hbWUpOworCXJl
dHVybiAhaXNfbWFwcGluZ19zeW1ib2wobmFtZSwgZWxmLT5oZHItPmVfbWFjaGluZSA9PSBFTV9S
SVNDVik7CiB9CiAKIC8qIExvb2sgdXAgdGhlIG5lYXJlc3Qgc3ltYm9sIGJhc2VkIG9uIHRoZSBz
ZWN0aW9uIGFuZCB0aGUgYWRkcmVzcyAqLwotLSAKMi40MS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
