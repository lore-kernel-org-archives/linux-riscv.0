Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D6C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cxWNuCD/FY9+bOH+xH/zSkOnDDjXyGjk8BRTlhtO7ik=; b=QZDWxnXpD/u7Vc
	MexwchhYnRzYOozUiSERPmW3qRFozSwbs2nqg/eAM+5q8BL1Qr++XEzYOZPN4p5OXVier50Qn0P65
	i0OauswiCgl8aBTe/aig5DIoMDX9edyB7+QD2GGknLUtB2YDROeCyztdnCChJZK0qsaXvWeuoLmxo
	AvvTeX2qFouNu7heOpxWLaAcMoloB+30L/+lLDX3Nvy8MXJCy9+GniLeYS/ORqdFf1RB2yIYr2T8v
	rjBIlaEpbVGG+wSOQ/C8ANFudkJDnI/d114QmOAQG4xpWXzu58hF1IHfrvFwz8IqutaXcH7rSBnpK
	vLwN8246CyKbnSeqHg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrvO-00EPyr-26;
	Fri, 21 Jul 2023 15:20:10 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrvK-00EPwj-0g
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 15:20:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-262ea2ff59dso1036801a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689952802; x=1690557602;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=FGQb7KpZNRpkho8cgTr8i+WhDErsFNhD07P94FZeYEg=;
        b=jyGW0VROISNel3ta/haidB7fgiMqP0Zkmj+6DUV0U7xOMbyjTGO4zqz+UmikA0arDq
         G1XP4wsJy/uW/lCh6p+t3AF2zpxi3bX5eIP5MvGsGL/s6wIpcIQFKGkDcCKmE5bAc7XX
         2I7Lc7jgkq9tCmnpQapaKNEPFPpvKnZsZ1VTaMmoLQMuQUwcnXFFUuBwS9EE27hi1V/K
         x7X6eSi01HV7s3y4QlE43UmyszzSF9coNM4P2xz91MRaQXyJzKS52FqI/z7s7qKvuffo
         1F2GDRay3xUjIDDDh+e079CtbD/2llPbTo/blF3uIunNuI5jYSlvNDLuFfyC4bJiA9nI
         Hc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952802; x=1690557602;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGQb7KpZNRpkho8cgTr8i+WhDErsFNhD07P94FZeYEg=;
        b=Hj7CCs49llQc7Yttb+wf5ddUkGFisEdxIvlqyP0JJ8QwxgvBel/2HUdqUB91vtnswu
         MxZ80HYCDqb/qDD6Vly1u8ZDxUK2pbNvt4i8k7R6J+3Uy+I3DdDFGdfmpzozyJZuraS9
         VbZvPUGAnzTyo/Juk/avlK7kLgDk5zJbGW1z2pDRXocEU0lfW50GuizbmyBHXNk3BEf4
         v/qZjvsJjQL/x2F/vHw5eKARdb5bHeKKp3LMlUv4EfZS0KPdZGHD868a/mXbqW7sdFGf
         gXYuw0NAuuktQiDEMi9aM51YSuyK7aNuKGoNqwnK6Ubc6x7eiu6QZ5wDUSEVfU6Xj/cQ
         urwg==
X-Gm-Message-State: ABy/qLYOuQstYV1T6wwoIciZycXQ0MBkA1qJmDQlB0wJ6zAVYqmDEF+S
	3ZC/G5kW9S8PnpRjDYD/QcnDRw7ABGlsDbRZApk=
X-Google-Smtp-Source: APBJJlG6GgiEc98hunrP1hfoR2yOoKJPDjPA4NwGb4Tj9nP0mHHeF6RAEjvKUb7PpLJBrmKu+6FLog==
X-Received: by 2002:a17:90a:7c0f:b0:262:c212:9898 with SMTP id v15-20020a17090a7c0f00b00262c2129898mr1515120pjf.26.1689952802429;
        Fri, 21 Jul 2023 08:20:02 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id g13-20020a17090a290d00b0025eb5aafd3csm2830783pjd.32.2023.07.21.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:20:01 -0700 (PDT)
Subject: [PATCH] modpost, kallsyms: Treat add '$'-prefixed symbols as mapping symbols
Date: Fri, 21 Jul 2023 08:01:48 -0700
Message-ID: <20230721150147.11720-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-kbuild@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: masahiroy@kernel.org, wangkefeng.wang@huawei.com, mcgrof@kernel.org,
  nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_082006_467504_8BCAC332 
X-CRM114-Status: GOOD (  16.86  )
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

VHJ5aW5nIHRvIHJlc3RyaWN0IHRoZSAnJCctcHJlZml4IGNoYW5nZSB0byBSSVNDLVYgY2F1c2Vk
IHNvbWUgZmFsbG91dCwKc28gbGV0J3MganVzdCB0cmVhdCBhbGwgdGhvc2Ugc3ltYm9scyBhcyBz
cGVjaWFsLgoKRml4ZXM6IGMwNTc4MGVmM2MxICgibW9kdWxlOiBJZ25vcmUgUklTQy1WIG1hcHBp
bmcgc3ltYm9scyB0b28iKQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3
MTIwMTU3NDcuNzcyNjMtMS13YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbS8KU2lnbmVkLW9mZi1i
eTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Ci0tLQpJdCB3YXNuJ3QgY2xl
YXIgaWYgd2Ugc2hvdWxkIGp1c3QgcmV2ZXJ0IHRoZSBvcmlnaW5hbCBwYXRjaCBhbmQgc3BpbiBh
Cm5ldyBvbmUsIGJ1dCBsb29rcyBsaWtlIHRoaXMgaXMgaW4gYXQgbGVhc3Qgc29tZSB0cmVlcyBz
byBJIHNlbnQgYQpmb2xsb3ctb24gcGF0Y2ggLS0gYXQgbGVhc3QgdGhpcyB3YXkgSSBjYW4gbWFr
ZSBjb2ZmZWUgYmVmb3JlIGZvcmdldHRpbmcKdG8gc2VuZCBpdCA7KQotLS0KIGluY2x1ZGUvbGlu
dXgvbW9kdWxlX3N5bWJvbC5oIHwgMTYgKystLS0tLS0tLS0tLS0tLQoga2VybmVsL21vZHVsZS9r
YWxsc3ltcy5jICAgICAgfCAgMiArLQogc2NyaXB0cy9tb2QvbW9kcG9zdC5jICAgICAgICAgfCAg
MiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oIGIvaW5jbHVkZS9saW51
eC9tb2R1bGVfc3ltYm9sLmgKaW5kZXggNWI3OTk5NDJiMjQzLi4xMjY5NTQzZDA2MzQgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oCisrKyBiL2luY2x1ZGUvbGludXgv
bW9kdWxlX3N5bWJvbC5oCkBAIC0zLDI1ICszLDEzIEBACiAjZGVmaW5lIF9MSU5VWF9NT0RVTEVf
U1lNQk9MX0gKIAogLyogVGhpcyBpZ25vcmVzIHRoZSBpbnRlbnNlbHkgYW5ub3lpbmcgIm1hcHBp
bmcgc3ltYm9scyIgZm91bmQgaW4gRUxGIGZpbGVzLiAqLwotc3RhdGljIGlubGluZSBpbnQgaXNf
bWFwcGluZ19zeW1ib2woY29uc3QgY2hhciAqc3RyLCBpbnQgaXNfcmlzY3YpCitzdGF0aWMgaW5s
aW5lIGludCBpc19tYXBwaW5nX3N5bWJvbChjb25zdCBjaGFyICpzdHIpCiB7CiAJaWYgKHN0clsw
XSA9PSAnLicgJiYgc3RyWzFdID09ICdMJykKIAkJcmV0dXJuIHRydWU7CiAJaWYgKHN0clswXSA9
PSAnTCcgJiYgc3RyWzFdID09ICcwJykKIAkJcmV0dXJuIHRydWU7Ci0JLyoKLQkgKiBSSVNDLVYg
ZGVmaW5lcyB2YXJpb3VzIHNwZWNpYWwgc3ltYm9scyB0aGF0IHN0YXJ0IHdpdGggIiQiLsKgIFRo
ZQotCSAqIG1hcHBpbmcgc3ltYm9scywgd2hpY2ggZXhpc3QgdG8gZGlmZmVyZW50aWF0ZSBiZXR3
ZWVuIGluY29tcGF0aWJsZQotCSAqIGluc3RydWN0aW9uIGVuY29kaW5ncyB3aGVuIGRpc2Fzc2Vt
YmxpbmcsIHNob3cgdXAgYWxsIG92ZXIgdGhlIHBsYWNlCi0JICogYW5kIGFyZSBnZW5lcmFsbHkg
bm90IG1lYW50IHRvIGJlIHRyZWF0ZWQgbGlrZSBvdGhlciBzeW1ib2xzLsKgIFNvCi0JICoganVz
dCBpZ25vcmUgYW55IG9mIHRoZSBzcGVjaWFsIHN5bWJvbHMuCi0JICovCi0JaWYgKGlzX3Jpc2N2
KQotCQlyZXR1cm4gc3RyWzBdID09ICckJzsKLQotCXJldHVybiBzdHJbMF0gPT0gJyQnICYmCi0J
ICAgICAgIChzdHJbMV0gPT0gJ2EnIHx8IHN0clsxXSA9PSAnZCcgfHwgc3RyWzFdID09ICd0JyB8
fCBzdHJbMV0gPT0gJ3gnKQotCSAgICAgICAmJiAoc3RyWzJdID09ICdcMCcgfHwgc3RyWzJdID09
ICcuJyk7CisJcmV0dXJuIHN0clswXSA9PSAnJCc7CiB9CiAKICNlbmRpZiAvKiBfTElOVVhfTU9E
VUxFX1NZTUJPTF9IICovCmRpZmYgLS1naXQgYS9rZXJuZWwvbW9kdWxlL2thbGxzeW1zLmMgYi9r
ZXJuZWwvbW9kdWxlL2thbGxzeW1zLmMKaW5kZXggNzhhMWZmYzM5OWQ5Li5lZjczYWU3Yzg5MDkg
MTAwNjQ0Ci0tLSBhL2tlcm5lbC9tb2R1bGUva2FsbHN5bXMuYworKysgYi9rZXJuZWwvbW9kdWxl
L2thbGxzeW1zLmMKQEAgLTI4OSw3ICsyODksNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqZmluZF9r
YWxsc3ltc19zeW1ib2woc3RydWN0IG1vZHVsZSAqbW9kLAogCQkgKiBhbmQgaW5zZXJ0ZWQgYXQg
YSB3aGltLgogCQkgKi8KIAkJaWYgKCprYWxsc3ltc19zeW1ib2xfbmFtZShrYWxsc3ltcywgaSkg
PT0gJ1wwJyB8fAotCQkgICAgaXNfbWFwcGluZ19zeW1ib2woa2FsbHN5bXNfc3ltYm9sX25hbWUo
a2FsbHN5bXMsIGkpLCBJU19FTkFCTEVEKENPTkZJR19SSVNDVikpKQorCQkgICAgaXNfbWFwcGlu
Z19zeW1ib2woa2FsbHN5bXNfc3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpKSkKIAkJCWNvbnRpbnVl
OwogCiAJCWlmICh0aGlzdmFsIDw9IGFkZHIgJiYgdGhpc3ZhbCA+IGJlc3R2YWwpIHsKZGlmZiAt
LWdpdCBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYyBiL3NjcmlwdHMvbW9kL21vZHBvc3QuYwppbmRl
eCA3YzcxNDI5ZDY1MDIuLmIyOWIyOTcwN2YxMCAxMDA2NDQKLS0tIGEvc2NyaXB0cy9tb2QvbW9k
cG9zdC5jCisrKyBiL3NjcmlwdHMvbW9kL21vZHBvc3QuYwpAQCAtMTA1Miw3ICsxMDUyLDcgQEAg
c3RhdGljIGlubGluZSBpbnQgaXNfdmFsaWRfbmFtZShzdHJ1Y3QgZWxmX2luZm8gKmVsZiwgRWxm
X1N5bSAqc3ltKQogCiAJaWYgKCFuYW1lIHx8ICFzdHJsZW4obmFtZSkpCiAJCXJldHVybiAwOwot
CXJldHVybiAhaXNfbWFwcGluZ19zeW1ib2wobmFtZSwgZWxmLT5oZHItPmVfbWFjaGluZSA9PSBF
TV9SSVNDVik7CisJcmV0dXJuICFpc19tYXBwaW5nX3N5bWJvbChuYW1lKTsKIH0KIAogLyogTG9v
ayB1cCB0aGUgbmVhcmVzdCBzeW1ib2wgYmFzZWQgb24gdGhlIHNlY3Rpb24gYW5kIHRoZSBhZGRy
ZXNzICovCi0tIAoyLjQxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
