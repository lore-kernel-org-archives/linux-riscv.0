Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA4FE80ABE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bk9AKxbuOFxkCQt8UMkh26K2v1/qgFwSY19bzkp+AXg=; b=D9k
	Vy7Z9rsX+X4spyQTj5MlYyDPq1VSPInsOX1XyfkRiP8DCytQbLX5i+kwo3WTzpfD7k6l/ixjDgnja
	ihZd+V55CiEj5vK1/tsFXj1ThP21sOQh4xsgwYgaepZHC0EXeIQ7VgJWnZ3ug016KyXLEnOIdxYvm
	2f51dyaDKjen7/omf0cs+TNBM+vQwZgmdTwXs6slH5qp6kW6da1wcB/iTaeU3yPcbbMCbrAUIoHHG
	+FGWAVT8IfpMHjzwYZh3sBIyw4YOiNH8hEmbm4wCyevVndt7RSQ+HuXapNDQHzXWN13BaadcNdlfD
	2I3a6O6Fp4ppbaachZXKXsQpVSYBsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKI-001s21-19;
	Wed, 27 Sep 2023 22:48:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKA-001rwd-2r
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 22:48:10 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c5b80fe118so164554065ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854882; x=1696459682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WgWh/gTAC4d5wcFhfvGxWr9mtitpn8knrAdbajEBfhU=;
        b=uH73QDEXl7ePjaYq/1A7hIBsBy2l1JP1hm7837dvfGLu3UIQJbKdGnAIcGcKyayiKy
         C84G3nIFVEa0SrsaKmPgu/KfvmZT7aJ3lW614uRuvZmpUsymYcO2EWilgjFRuiDZVaVE
         kOORd+oj0PYy2hSTSs+JCXphkcghKOz1Z4T+yysFoJ58XaqU75QFmx/2Hmu2Jq9PqN1b
         6s8AyxVhyeAwbLvLIBlOJlu1+HggCUZXSVV2t96saUTTnDyxYKtCVB4caoyEAqlfl16o
         BRTTC4oiNg3vAALQZ12TauO3a4nVX7Af1YoaF5gmaeHE6xs9WbgDfFvTrFw9R7fsn18L
         N5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854882; x=1696459682;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgWh/gTAC4d5wcFhfvGxWr9mtitpn8knrAdbajEBfhU=;
        b=h4iLMMNNGT/JqfDln9BcdiC83g7z9g4S6bHoRPmn5hEUeo/5G3BL4NPTGy+5CDM2TN
         BGI38DtgjnA0AwlnQj4Nv+dN4y8FZO7UrBUK2kowvATIsDo9EqwSorChqIwxLYdCrCq1
         3yP6NllY8oedC3+C7VWzhQmZQJga7Nk6iPFusj7Pxuh1EvR7ldn6UI0c5grll6KG9WrA
         h/XkfnGM0KXLSZcjrmwFLGutObXrtVeFG1wVuo+MouSNlkIHI2yJuhQhfzT4a0AzBZ8B
         BkM7t5iVUAiVtQtXM4rqv0BrJ12uESV3+GhCTQnLr7E0ntt2LFHEwvEXGJaG1ksYDjFi
         J0Dw==
X-Gm-Message-State: AOJu0Yyq3j+EnOKxsZyYMTAxMJInHvDiFekzI4BUqg1cUAQY+JejolH0
	i9I+nBFBTYeDUNnJm8mFVVdEhKVg9Ftp5/+7keg=
X-Google-Smtp-Source: AGHT+IGk7G47CUj9RF4pKzDPxTmtIoJ1wCsb9Pr7q3C8UWIAzHgCr3LMujULViUFT/Y4wYbyqLGeqN8JHqUBvqNtx3A=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:32c8:b0:1c3:4d70:6ed9 with
 SMTP id i8-20020a17090332c800b001c34d706ed9mr43384plr.3.1695854881902; Wed,
 27 Sep 2023 15:48:01 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:47:58 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3761; i=samitolvanen@google.com;
 h=from:subject; bh=f76u/UaoOPWAzvVIRbNmavYgFKWbwPzMxrH4Tc8hYhQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdhYoTc+kz3ZoLrFhYKOOymIFWJZVZRQni9
 KhyoZ1LHfaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7rnpC/0fjS9A3U3PayoFxJDC7BIBn2TZclbDccTnDGN8dmOZRr0q32iccvz1rwMtx5qn8nLSZy2
 HTDLopQWMRD97unLAk17J7+oywB1UqD9qjuCnhmwY10hlZvYQs+jeFjKtaJDjldiXjVVR7g//bZ
 ZSbBsc5fj1bc39TUa1lCyKHTSTMQo6n1nzdKY19gEwdvmt9XaomfUDlCyACj7U1PZLQ1oZ/MGVt
 JOnItns+7CtNGbq28/mjQkuoZ8w04WsGDOAaAecbjIY9dk4BPaEgKT0/4ez+Q4Q8M/qnciOrVOf
 KNfcrOMSo1EtJcYzW3TR2pMeJ5m2fmNkiGgC/qGC/1mbXe/kwbF7t0BSYNILf+H8h/Ljaevmm8b
 JkiBgac+k3XCuZMRK59/xOpTrYl22a7HAwYW6hPdm3Ca2W6Y3O3EvAXXzT5gId7vYGo05iGLyYK wFDUIb2j886cBr0U7uZQ37b/x3wCTwF1iUcPlbNwodFIZuibDcFtx03CUsYAm5Tqvfiys=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-8-samitolvanen@google.com>
Subject: [PATCH v4 0/6] riscv: SCS support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_154806_925465_9DF39CA8 
X-CRM114-Status: GOOD (  17.46  )
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

SGkgZm9sa3MsCgpUaGlzIHNlcmllcyBhZGRzIFNoYWRvdyBDYWxsIFN0YWNrIChTQ1MpIHN1cHBv
cnQgZm9yIFJJU0MtVi4gU0NTCnVzZXMgY29tcGlsZXIgaW5zdHJ1bWVudGF0aW9uIHRvIHN0b3Jl
IHJldHVybiBhZGRyZXNzZXMgaW4gYQpzZXBhcmF0ZSBzaGFkb3cgc3RhY2sgdG8gcHJvdGVjdCB0
aGVtIGFnYWluc3QgYWNjaWRlbnRhbCBvcgptYWxpY2lvdXMgb3ZlcndyaXRlcy4gTW9yZSBpbmZv
cm1hdGlvbiBhYm91dCBTQ1MgY2FuIGJlIGZvdW5kCmhlcmU6CgogIGh0dHBzOi8vY2xhbmcubGx2
bS5vcmcvZG9jcy9TaGFkb3dDYWxsU3RhY2suaHRtbAoKUGF0Y2ggMSBpcyBmcm9tIERlZXBhaywg
YW5kIGl0IHNpbXBsaWZpZXMgVk1BUF9TVEFDSyBvdmVyZmxvdwpoYW5kbGluZyBieSBhZGRpbmcg
c3VwcG9ydCBmb3IgYWNjZXNzaW5nIHBlci1DUFUgdmFyaWFibGVzCmRpcmVjdGx5IGluIGFzc2Vt
Ymx5LiBUaGUgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXMgdG8KbWFrZSBJUlEgc3Rh
Y2sgc3dpdGNoaW5nIGNsZWFuZXIgd2l0aCBTQ1MsIGFuZCBJJ3ZlIHNpbXBseQpyZWJhc2VkIGl0
IGFuZCBmaXhlZCBhIGNvdXBsZSBvZiBtaW5vciBpc3N1ZXMuIFBhdGNoIDIgdXNlcyB0aGlzCmZ1
bmN0aW9uYWxpdHkgdG8gY2xlYW4gdXAgdGhlIHN0YWNrIHN3aXRjaGluZyBieSBtb3ZpbmcgZHVw
bGljYXRlCmNvZGUgaW50byBhIHNpbmdsZSBmdW5jdGlvbi4gT24gUklTQy1WLCB0aGUgY29tcGls
ZXIgdXNlcyB0aGUKZ3AgcmVnaXN0ZXIgZm9yIHN0b3JpbmcgdGhlIGN1cnJlbnQgc2hhZG93IGNh
bGwgc3RhY2sgcG9pbnRlciwKd2hpY2ggaXMgaW5jb21wYXRpYmxlIHdpdGggZ2xvYmFsIHBvaW50
ZXIgcmVsYXhhdGlvbi4gUGF0Y2ggMwptb3ZlcyBnbG9iYWwgcG9pbnRlciBsb2FkaW5nIGludG8g
YSBtYWNybyB0aGF0IGNhbiBiZSBlYXNpbHkKZGlzYWJsZWQgd2l0aCBTQ1MuIFBhdGNoIDQgaW1w
bGVtZW50cyBTQ1MgcmVnaXN0ZXIgbG9hZGluZyBhbmQKc3dpdGNoaW5nLCBhbmQgYWxsb3dzIHRo
ZSBmZWF0dXJlIHRvIGJlIGVuYWJsZWQsIGFuZCBwYXRjaCA1IGFkZHMKc2VwYXJhdGUgcGVyLUNQ
VSBJUlEgc2hhZG93IGNhbGwgc3RhY2tzIHdoZW4gQ09ORklHX0lSUV9TVEFDS1MgaXMKZW5hYmxl
ZC4gUGF0Y2ggNiBmaXhlcyB0aGUgYmFja3dhcmQtZWRnZSBDRkkgdGVzdCBpbiBsa2R0bSBmb3IK
UklTQy1WLgoKTm90ZSB0aGF0IHRoaXMgc2VyaWVzIHJlcXVpcmVzIENsYW5nIDE3LiBFYXJsaWVy
IENsYW5nIHZlcnNpb25zCnN1cHBvcnQgU0NTIG9uIFJJU0MtViwgYnV0IHVzZSB0aGUgeDE4IHJl
Z2lzdGVyIGluc3RlYWQgb2YgZ3AsCndoaWNoIGlzbid0IGlkZWFsLiBnY2MgaGFzIFNDUyBzdXBw
b3J0IGZvciBhcm02NCwgYnV0IEknbSBub3QKYXdhcmUgb2YgcGxhbnMgdG8gc3VwcG9ydCBSSVND
LVYuIE9uY2UgdGhlIFppY2Zpc3MgZXh0ZW5zaW9uIGlzCnJhdGlmaWVkLCBpdCdzIHByb2JhYmx5
IHByZWZlcmFibGUgdG8gdXNlIGhhcmR3YXJlLWJhY2tlZCBzaGFkb3cKc3RhY2tzIGluc3RlYWQg
b2YgU0NTIG9uIGhhcmR3YXJlIHRoYXQgc3VwcG9ydHMgdGhlIGV4dGVuc2lvbiwKYW5kIHdlIG1h
eSB3YW50IHRvIGNvbnNpZGVyIGltcGxlbWVudGluZyBDT05GSUdfRFlOQU1JQ19TQ1MgdG8KcGF0
Y2ggYmV0d2VlbiB0aGUgaW1wbGVtZW50YXRpb24gYXQgcnVudGltZSAoc2ltaWxhcmx5IHRvIHRo
ZQphcm02NCBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggc3dpdGNoZXMgdG8gU0NTIHdoZW4gaGFyZHdh
cmUgUEFDCnN1cHBvcnQgaXNuJ3QgYXZhaWxhYmxlKS4KClNhbWkKCgotLS0KCkNoYW5nZXMgaW4g
djQ6CiAgLSBGaXhlZCB0aGUgQyBlbnZpcm9ubWVudCBzZXR1cCBpbiBoZWFkLlMgdG8gdXNlCiAg
ICBzY3NfbG9hZF9jdXJyZW50IChwYXRjaCA0KS4KICAtIFJlYmFzZWQgdG8gLXJjMyB0byBmaXgg
bWVyZ2UgY29uZmxpY3RzLgoKQ2hhbmdlcyBpbiB2MzoKICAtIERyb3BwZWQgYSBub3cgdW5uZWVk
ZWQgZnVuY3Rpb24gZGVjbGFyYXRpb24gKHBhdGNoIDEpLgogIC0gUmVmYWN0b3JlZCBjYWxsX29u
X2lycV9zdGFjayB0byB1c2Ugc3RhY2sgZnJhbWUgb2Zmc2V0cwogICAgYmFzZWQgb24gQ2zDqW1l
bnQncyBzdWdnZXN0aW9uIChwYXRjaCAyKS4KICAtIFJlYmFzZWQgb24gdG9wIG9mIHY2LjUuCgpD
aGFuZ2VzIGluIHYyOgogIC0gRml4ZWQgYXNtX3Blcl9jcHUgd2l0aCAhQ09ORklHX1NNUCAocGF0
Y2ggMSkuCiAgLSBBZGRlZCBhIGZpeCB0byB0aGUgQ0ZJX0JBQ0tXQVJEIGxrZHRtIHRlc3QgKHBh
dGNoIDYpLgogIC0gUmViYXNlZCBvbiB0b3Agb2YgLXJjNi4KCi0tLQoKRGVlcGFrIEd1cHRhICgx
KToKICByaXNjdjogVk1BUF9TVEFDSyBvdmVyZmxvdyBkZXRlY3Rpb24gdGhyZWFkLXNhZmUKClNh
bWkgVG9sdmFuZW4gKDUpOgogIHJpc2N2OiBEZWR1cGxpY2F0ZSBJUlEgc3RhY2sgc3dpdGNoaW5n
CiAgcmlzY3Y6IE1vdmUgZ2xvYmFsIHBvaW50ZXIgbG9hZGluZyB0byBhIG1hY3JvCiAgcmlzY3Y6
IEltcGxlbWVudCBTaGFkb3cgQ2FsbCBTdGFjawogIHJpc2N2OiBVc2Ugc2VwYXJhdGUgSVJRIHNo
YWRvdyBjYWxsIHN0YWNrcwogIGxrZHRtOiBGaXggQ0ZJX0JBQ0tXQVJEIG9uIFJJU0MtVgoKIGFy
Y2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArKwogYXJjaC9yaXNj
di9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLXByb3RvdHlwZXMuaCB8ICAgMSAtCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fz
bS5oICAgICAgICAgICAgfCAgNDEgKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJx
X3N0YWNrLmggICAgICB8ICAgMyArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Njcy5oICAgICAg
ICAgICAgfCAgNTQgKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2lu
Zm8uaCAgICB8ICAxNiArKy0KIGFyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgICAgICAg
ICB8ICAgOSArKwogYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgIHwgMTI0
ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgICAg
ICAgICAgICAgIHwgIDE5ICsrLS0KIGFyY2gvcmlzY3Yva2VybmVsL2lycS5jICAgICAgICAgICAg
ICAgICB8ICA1NiArKysrKy0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZF9lbnRyeS5T
ICAgICAgIHwgICA1ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgICAgICAgICAg
fCAgNjggKy0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSAgICAg
ICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZSAgICAgICAgICAgfCAg
IDQgKwogZHJpdmVycy9taXNjL2xrZHRtL2NmaS5jICAgICAgICAgICAgICAgIHwgIDEzICsrLQog
MTYgZmlsZXMgY2hhbmdlZCwgMjQ4IGluc2VydGlvbnMoKyksIDE3NyBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Njcy5oCgoKYmFzZS1jb21t
aXQ6IDY0NjVlMjYwZjQ4NzkwODA3ZWVmMDZiNTgzYjM4Y2E5Nzg5YjYwNzIKLS0gCjIuNDIuMC41
MTUuZzM4MGZjN2NjZDEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
