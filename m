Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7691DC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRsCJ6BtiuRxypsbTQTaHzstDa3dTLWHvxok5B1AUzk=; b=VI1qVf5fsaiQxe
	t9IMX7eDQzIJimUMinC1jSco4gDggvgSE77djgoR8ZwPW5FBzkxlrknCM3xc2InIq0YrjzRP6zwJ8
	WrEuvmvmxEcHo9UkvyxY/HEPuQANHFQWKkkXVOS/MvLZFf8lhLhcncmZtZLxa7FjYmTo6sDpJA7J0
	HxGHtexVp6cVg17eN1RKiaJ5cSnXnI/XA7UTcVzHvr/SuAnn6bJGaCgW8oVo3wW7gpLRM9y2uGKg+
	cOQ8S7irnz6Qs7SxG45fPpX8NH8PFaYcYPLwUmfKGv00gqvGrVg/oyEgvJc4Te8x/qLmwK+tNM9Iu
	TWzbXi69cPod18knoYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWU6-0000000Dxa7-2O0p;
	Mon, 29 Jan 2024 18:35:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWU4-0000000DxY6-050O
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58537CE16AA;
	Mon, 29 Jan 2024 18:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E63C433C7;
	Mon, 29 Jan 2024 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706553349;
	bh=7VTqyRWqMQC0WC90AaVTLUlSbK4Is7wpRvZH7TdlOyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UsRyj/881MhK0JkLPjFNC9nw35g/PmlBVTYvbpGwPQ2WPbH4WBXkOIU8r64CFzmVF
	 +vp6V/IDuUhrz6CR3syQ/kVZtkKlloBuvaMk+4Ck2+jf+8jRZSpxk/TLOGIpK7KSLZ
	 sVN04QfpIeu/Dazf2aIX1sKGfdT8fKMe4zVu8WCG9AouFYaA40opKeq+tEj9V8TyUn
	 148lI/gq4/sTwrpKTL7r4c/DxasZJ2oeGb2T9Jg8+nvB0y/0Xhz/JD2bVnJokhaneS
	 Bmv9Nz4ZKSM5TumyKenxJJGbhpO4XzEMU8AUiyH6v/UvJkNVhzidXSCF10OGqGBi8Y
	 mWX+HlCEg/f/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 05/10] tools: selftests: riscv: Fix compile warnings in mm tests
Date: Mon, 29 Jan 2024 13:35:13 -0500
Message-ID: <20240129183530.464274-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129183530.464274-1-sashal@kernel.org>
References: <20240129183530.464274-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_103552_309222_5A4B3670 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cgpb
IFVwc3RyZWFtIGNvbW1pdCAxMmMxNjkxOTY1MmI1ODczZjUyNGM4YjM2MTMzNmVjZmE1Y2U1ZTZi
IF0KCldoZW4gYnVpbGRpbmcgdGhlIG1tIHRlc3RzIHdpdGggYSByaXNjdjMyIGNvbXBpbGVyLCB3
ZSBzZWUgYSByYW5nZQpvZiBzaGlmdC1jb3VudC1vdmVyZmxvdyBlcnJvcnMgZnJvbSBzaGlmdGlu
ZyAxVUwgYnkgbW9yZSB0aGFuIDMyIGJpdHMKaW4gZG9fbW1hcHMoKS4gU2luY2UsIHRoZSByZWxl
dmFudCBjb2RlIGlzIG9ubHkgY2FsbGVkIGZyb20gY29kZSB0aGF0CmlzIGdhdGVkIGJ5IGBfX3Jp
c2N2X3hsZW4gPT0gNjRgLCB3ZSBjYW4ganVzdCBhcHBseSB0aGUgc2FtZSBnYXRpbmcKdG8gZG9f
bW1hcHMoKS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11
ZWxsbmVyQHZydWxsLmV1PgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1p
Y3JvLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyMzE4NTgyMS4y
MjcyNTA0LTYtY2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1ClNpZ25lZC1vZmYtYnk6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZp
biA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
bW0vbW1hcF90ZXN0LmggfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L21tL21tYXBfdGVzdC5o
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvbW0vbW1hcF90ZXN0LmgKaW5kZXggOWI4
NDM0ZjYyZjU3Li4yZTBkYjljNWJlNmMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L21tL21tYXBfdGVzdC5oCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L21tL21tYXBfdGVzdC5oCkBAIC0xOCw2ICsxOCw4IEBAIHN0cnVjdCBhZGRyZXNzZXMgewog
CWludCAqb25fNTZfYWRkcjsKIH07CiAKKy8vIE9ubHkgd29ya3Mgb24gNjQgYml0CisjaWYgX19y
aXNjdl94bGVuID09IDY0CiBzdGF0aWMgaW5saW5lIHZvaWQgZG9fbW1hcHMoc3RydWN0IGFkZHJl
c3NlcyAqbW1hcF9hZGRyZXNzZXMpCiB7CiAJLyoKQEAgLTUwLDYgKzUyLDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGRvX21tYXBzKHN0cnVjdCBhZGRyZXNzZXMgKm1tYXBfYWRkcmVzc2VzKQogCW1t
YXBfYWRkcmVzc2VzLT5vbl81Nl9hZGRyID0KIAkJbW1hcChvbl81Nl9iaXRzLCA1ICogc2l6ZW9m
KGludCksIHByb3QsIGZsYWdzLCAwLCAwKTsKIH0KKyNlbmRpZiAvKiBfX3Jpc2N2X3hsZW4gPT0g
NjQgKi8KIAogc3RhdGljIGlubGluZSBpbnQgbWVtb3J5X2xheW91dCh2b2lkKQogewotLSAKMi40
My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
