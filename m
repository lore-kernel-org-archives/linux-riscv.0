Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBBBC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 10:44:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079DC233CF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 10:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 079DC233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTvT201o4bZFqvUNO8RxuOjHf/S7N5QXnxnekTfQgTg=; b=EM/wkEOZPcgw1Qwbdca28MjRiK
	+ZBwpQ4nUOAEjkp7vT7K5nr7+I5iqMATJl3/mC56BBB9VlBPwlO5fnqJKBQ6wi3tJgo/UNn7Lu6lz
	RXnJtZxYvB8VZEOqwPsJTw2eXMEJ7JibsSL+J66/FldLqMANE6cPcdzXWN+nRaE3qle2IOf5C4o+j
	f/eWvkqdBs8qQATWzEx2o5eJ3VXY3f/31QElqENP8t+zs5Nj6nrmdsLXAIiMj9Yd6aHrUNDMOCA5j
	9Ya0mTdK9YxFgaP8DWU1H7yHQ2EighQtvb5gMkcmC9ygALJmCz/DI677mhMoc0pzMbgfrX7YKSTmo
	A637apvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Ma7-0003wM-TO; Fri, 15 Jan 2021 10:43:51 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Ma3-0003vI-Mr
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 10:43:50 +0000
Received: by mail-lj1-x234.google.com with SMTP id x23so9844421lji.7
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 02:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5KthTeXhG9zYR2XUBnXVlinwFDvxSXX3TRUTi/EkJk=;
 b=eOiVjdCcyHtEZxvGbZBM2F3z2kQX62FWVXnciVmtsxZVQTtZcPEvmQjQANp4fRH4Y0
 6cRHxPc4YrAj3s+6lm/z3TpwnjIj1kX6ASx1DbHPPR2XHCxscfCBjeDz+gZEejUUXMXS
 xnLwkHSz0QXcl6Vzu6Qh2I9af3tJslAnrYci06rSCJQE54xeALPCf8+9jlpV3PoXel7D
 jwmO/o+z2HBmc6kV7Rv6+ECBnZbKIvTe1Dc36tRR718bKLdF+JEbrgcRJbnKKhoyKD8q
 LjyscSazJQaVi+wqfDSyE96weGhQIJqRxNoGmubtNOudIvVExuadYGU1ueCDEtKZMIia
 JZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5KthTeXhG9zYR2XUBnXVlinwFDvxSXX3TRUTi/EkJk=;
 b=Lnz3M6LPCYPG/y+1+Z6E0DI4YmzKEtHQKu+TtVKAneRypf2x8N8zxXECGbQpriEIOy
 35ebIvhAruE1RdJ9NMVqCsVaYVXjoC7mJsebphjHuBXb+NE9T6ADk5IMPLksfUoN5Gam
 U32tLL+vfdB1xLKWrzoq2c6JtBePXTBdKM6XHz/gw3BxOrsyt+j6YGb5Hguh6v+AnKji
 HFtD0SVYPkDww8u2T3S/L3yow/FOIfI3CynBix9Ha8QRc4nVNDg36ckHX5ZpY3wMdyK+
 ByAvSSOdAnAHaieBfYcyFmnhufIo4oxbLxed0vTfCWOM/5d7HQXetnFgoFFFCzZmTRjn
 5Icw==
X-Gm-Message-State: AOAM530Wc/BBgFsRFMjXRyX2aOsCpV0v6ie3tDqjKY7DHRiZxtP9bJJ1
 1LbPKb20lrxeHTiuVo8PK6c=
X-Google-Smtp-Source: ABdhPJxHW9y/m+FKwNjJRh6qlv0CDana0YCVPGb3v4OIgQCK1Os++OtGqZ7VIgMhBv60vWc37rBzYg==
X-Received: by 2002:a2e:7613:: with SMTP id r19mr5371921ljc.284.1610707422639; 
 Fri, 15 Jan 2021 02:43:42 -0800 (PST)
Received: from btopel-mobl.ger.intel.com (c213-102-90-208.bredband.comhem.se.
 [213.102.90.208])
 by smtp.gmail.com with ESMTPSA id c3sm762267ljk.88.2021.01.15.02.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:43:41 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf] MAINTAINERS: update my email address
Date: Fri, 15 Jan 2021 11:43:37 +0100
Message-Id: <20210115104337.7751-1-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_054347_786763_4D7FD42B 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCk15IEludGVsIGVtYWlsIHdp
bGwgc3RvcCB3b3JraW5nIGluIGEgbm90IHRvbyBkaXN0YW50IGZ1dHVyZS4gTW92ZSBteQpNQUlO
VEFJTkVSUyBlbnRyaWVzIHRvIG15IGtlcm5lbC5vcmcgYWRkcmVzcy4KClNpZ25lZC1vZmYtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Ci0tLQogLm1haWxtYXAgICAgfCAyICsr
CiBNQUlOVEFJTkVSUyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvLm1haWxtYXAgYi8ubWFpbG1hcAppbmRleCA2
MzI3MDBjZWU1NWMuLmIxYWIwMTI5YzdkNiAxMDA2NDQKLS0tIGEvLm1haWxtYXAKKysrIGIvLm1h
aWxtYXAKQEAgLTU1LDYgKzU1LDggQEAgQmFydCBWYW4gQXNzY2hlIDxidmFuYXNzY2hlQGFjbS5v
cmc+IDxiYXJ0LnZhbmFzc2NoZUB3ZGMuY29tPgogQmVuIEdhcmRuZXIgPGJnYXJkbmVyQHdhYnRl
Yy5jb20+CiBCZW4gTSBDYWhpbGwgPGJlbi5tLmNhaGlsbEBpbnRlbC5jb20+CiBCasO2cm4gU3Rl
aW5icmluayA8Qi5TdGVpbmJyaW5rQGdteC5kZT4KK0Jqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IDxiam9ybi50b3BlbEBnbWFpbC5jb20+CitCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiA8Ympvcm4udG9wZWxAaW50ZWwuY29tPgogQm9yaXMgQnJlemlsbG9uIDxiYnJlemls
bG9uQGtlcm5lbC5vcmc+IDxiLmJyZXppbGxvbi5kZXZAZ21haWwuY29tPgogQm9yaXMgQnJlemls
bG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+IDxiLmJyZXppbGxvbkBvdmVya2l6LmNvbT4KIEJv
cmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPiA8Ym9yaXMuYnJlemlsbG9uQGJv
b3RsaW4uY29tPgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBi
MTU1MTRhNzcwZTMuLjBkZmQxYTY3ZDQzMCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIv
TUFJTlRBSU5FUlMKQEAgLTMzMzYsNyArMzMzNiw3IEBAIEY6CWFyY2gvcmlzY3YvbmV0LwogWDoJ
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwogCiBCUEYgSklUIGZvciBSSVNDLVYgKDY0
LWJpdCkKLU06CUJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KK006CUJqw7Zy
biBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CiBMOgluZXRkZXZAdmdlci5rZXJuZWwub3JnCiBM
OglicGZAdmdlci5rZXJuZWwub3JnCiBTOglNYWludGFpbmVkCkBAIC0xOTQwOSw3ICsxOTQwOSw3
IEBAIEY6CWRyaXZlcnMvbmV0L2V0aGVybmV0LyovKi8qeGRwKgogSzoJKD86XGJ8Xyl4ZHAoPzpc
YnxfKQogCiBYRFAgU09DS0VUUyAoQUZfWERQKQotTToJQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9w
ZWxAaW50ZWwuY29tPgorTToJQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KIE06CU1h
Z251cyBLYXJsc3NvbiA8bWFnbnVzLmthcmxzc29uQGludGVsLmNvbT4KIFI6CUpvbmF0aGFuIExl
bW9uIDxqb25hdGhhbi5sZW1vbkBnbWFpbC5jb20+CiBMOgluZXRkZXZAdmdlci5rZXJuZWwub3Jn
CgpiYXNlLWNvbW1pdDogNDIzN2U5ZjRhOTYyMjhjY2M4YTdhYmU1ZTRiMzA4MzQzMjNjZDM1Mwot
LSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
