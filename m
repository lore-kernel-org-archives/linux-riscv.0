Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5B7C07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AC79Z6ciCgoElRHQQXtwq3h64DCpux+EiRdbsX6zXQ=; b=yihGhLi+40Cntv
	7HCYNKnAk+mxYHl/OBhhDvbBEpkP9WQZvUoqaBJ82fO4bL7kQSdMs8NrMIsuyZgM4/exhyqTw8Df/
	UiPYrhYDDGw9SimoGZxANlsaE6n42nE5ea8UJqSsoU0ixFkqxVCSwpqOPcR5hbA940SZFC6Rmzz/z
	LXVeT0Qj9GLXbjO/Y/n/cOWjGseTfzjCb478KtQL3kx1O0H1wnUi9yu0eLPquEjLcCpG0oN1+sWCe
	xU+pJmSnL1wkmXMY/wDwXYoOauHYnEpsfo+1qxEQAnrlmtuJFsAT40c/vCvw2L8iDzLgXOn6n60Dz
	L6YX5Rh8Kr0dHsNKlGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fxX-00AofC-2e;
	Thu, 30 Nov 2023 12:15:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fxV-00Aodn-0S
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 087D4CE1F29;
	Thu, 30 Nov 2023 12:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E23C43391;
	Thu, 30 Nov 2023 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701346554;
	bh=svHjq6BTZhzzPhI8kj7ht+r5VyVLRJaN4ub31HCJx4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R9oL32ff+QkFBx3i3fH0/0mtKAmFM0CH0F0ufNbYTBbEiCG/7ylFsb3GKTmfh8VNy
	 rRMKrEoXB0cvPPfEql1QxbXKdPachSTbTMH9wqFnvEYGIAm5stSZbLzDOM/hs+7zt0
	 se/LW52xooEzYPnnLdH1QjeQ81/wdImJNsH0qFfzJTcK+HNxDEwlflYUIL2a1gdsPt
	 nT8EK1rshSQQgviG62rvN5WDVxzkuKjjr+RoOCzSsVW/kMk/XdKkF+F1eAE3AROh0L
	 8f9Tf7L/UYygK9dBMWYE4yzeJtFSJqvI5TL2QM3dDPSfGzP4+4vDQXMWfx0AW0BsTF
	 sQl5p+GNdog6g==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Song Shuai <suagrfillet@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	songshuaishuai@tinylab.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v12 for-next 3/4] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Thu, 30 Nov 2023 13:15:30 +0100
Message-Id: <20231130121531.1178502-4-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130121531.1178502-1-bjorn@kernel.org>
References: <20231130121531.1178502-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_041557_647842_59B70FF7 
X-CRM114-Status: GOOD (  12.57  )
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

RnJvbTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgoKU2VsZWN0IHRoZSBEWU5B
TUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyB0byBwcm92aWRlIHRoZQpyZWdpc3Rlcl9mdHJh
Y2VfZGlyZWN0W19tdWx0aV0gaW50ZXJmYWNlcyBhbGxvd2luZyB1c2VycyB0byByZWdpc3Rlcgp0
aGUgY3VzdG9tZWQgdHJhbXBvbGluZSAoZGlyZWN0X2NhbGxlcikgYXMgdGhlIG1jb3VudCBmb3Ig
b25lIG9yIG1vcmUKdGFyZ2V0IGZ1bmN0aW9ucy4gQW5kIG1vZGlmeV9mdHJhY2VfZGlyZWN0W19t
dWx0aV0gYXJlIGFsc28gcHJvdmlkZWQKZm9yIG1vZGlmeWluZyBkaXJlY3RfY2FsbGVyLgoKVG8g
bWFrZSB0aGUgZGlyZWN0X2NhbGxlciBhbmQgdGhlIG90aGVyIGZ0cmFjZSBob29rcyAoZS5nLgpm
dW5jdGlvbi9mZ3JhcGggdHJhY2VyLCBrW3JldF1wcm9iZXMpIGNvLWV4aXN0LCBhIHRlbXBvcmFy
eSByZWdpc3RlcgppcyBub21pbmF0ZWQgdG8gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2Nh
bGxlciBpbgpmdHJhY2VfcmVnc19jYWxsZXIuIEFmdGVyIHRoZSBzZXR0aW5nIG9mIHRoZSBhZGRy
ZXNzIGRpcmVjdF9jYWxsZXIgYnkKZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlIFJFU1RPUkVfUkVH
UyBpbiBmdHJhY2VfcmVnc19jYWxsZXIsCmRpcmVjdF9jYWxsZXIgd2lsbCBiZSBqdW1wZWQgdG8g
YnkgdGhlIGBqcmAgaW5zdC4KCkFkZCBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBz
dXBwb3J0IGZvciBSSVNDLVYuCgpTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxl
dEBnbWFpbC5jb20+ClRlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+ClNpZ25l
ZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpBY2tlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAg
ICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIHwgIDcgKysrKysr
KwogYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TICB8IDEwICsrKysrKysrKysKIDMgZmls
ZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2Nv
bmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCA2OWM5NWU0MmJlOWYuLjQ2ODRjZGM3NTRh
MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZp
ZwpAQCAtMTE0LDYgKzExNCw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBIQVZFX0RFQlVHX0tN
RU1MRUFLCiAJc2VsZWN0IEhBVkVfRE1BX0NPTlRJR1VPVVMgaWYgTU1VCiAJc2VsZWN0IEhBVkVf
RFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1VICYmIChDTEFOR19TVVBQT1JUU19E
WU5BTUlDX0ZUUkFDRSB8fCBHQ0NfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UpCisJc2VsZWN0IEhB
VkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKIAlzZWxlY3QgSEFWRV9EWU5BTUlD
X0ZUUkFDRV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQogCXNlbGVjdCBIQVZFX0ZU
UkFDRV9NQ09VTlRfUkVDT1JEIGlmICFYSVBfS0VSTkVMCiAJc2VsZWN0IEhBVkVfRlVOQ1RJT05f
R1JBUEhfVFJBQ0VSCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAppbmRleCBiMzgzOTI2ZjczYmUuLjMy
OTE3MjEyMjk1MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCkBAIC0xMzUsNiArMTM1LDEzIEBA
IHN0cnVjdCBmdHJhY2VfcmVnczsKIHZvaWQgZnRyYWNlX2dyYXBoX2Z1bmModW5zaWduZWQgbG9u
ZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCiAJCSAgICAgICBzdHJ1Y3QgZnRyYWNlX29w
cyAqb3AsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpOwogI2RlZmluZSBmdHJhY2VfZ3JhcGhf
ZnVuYyBmdHJhY2VfZ3JhcGhfZnVuYworCitzdGF0aWMgaW5saW5lIHZvaWQgX19hcmNoX2Z0cmFj
ZV9zZXRfZGlyZWN0X2NhbGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBh
ZGRyKQoreworCQlyZWdzLT50MSA9IGFkZHI7Cit9CisjZGVmaW5lIGFyY2hfZnRyYWNlX3NldF9k
aXJlY3RfY2FsbGVyKGZyZWdzLCBhZGRyKSBcCisJX19hcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2Nh
bGxlcigmKGZyZWdzKS0+cmVncywgYWRkcikKICNlbmRpZiAvKiBDT05GSUdfRFlOQU1JQ19GVFJB
Q0VfV0lUSF9SRUdTICovCiAKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3Vu
dC1keW4uUwppbmRleCBjOTAyYTdkZGIzMTAuLmI3Y2UwMDE3NzljMSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3Vu
dC1keW4uUwpAQCAtMjI5LDYgKzIyOSw3IEBAIFNZTV9GVU5DX0VORChmdHJhY2VfY2FsbGVyKQog
CiAjZWxzZSAvKiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTICovCiBTWU1fRlVOQ19T
VEFSVChmdHJhY2VfcmVnc19jYWxsZXIpCisJbXYJdDEsIHplcm8KIAlTQVZFX0FCSV9SRUdTIDEK
IAlQUkVQQVJFX0FSR1MKIApAQCAtMjM2LDcgKzIzNywxMCBAQCBTWU1fSU5ORVJfTEFCRUwoZnRy
YWNlX3JlZ3NfY2FsbCwgU1lNX0xfR0xPQkFMKQogCWNhbGwJZnRyYWNlX3N0dWIKIAogCVJFU1RP
UkVfQUJJX1JFR1MgMQorCWJuZXoJdDEsIC5MZGlyZWN0CiAJanIJdDAKKy5MZGlyZWN0OgorCWpy
CXQxCiBTWU1fRlVOQ19FTkQoZnRyYWNlX3JlZ3NfY2FsbGVyKQogCiBTWU1fRlVOQ19TVEFSVChm
dHJhY2VfY2FsbGVyKQpAQCAtMjUwLDMgKzI1NCw5IEBAIFNZTV9JTk5FUl9MQUJFTChmdHJhY2Vf
Y2FsbCwgU1lNX0xfR0xPQkFMKQogCWpyCXQwCiBTWU1fRlVOQ19FTkQoZnRyYWNlX2NhbGxlcikK
ICNlbmRpZiAvKiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTICovCisKKyNpZmRlZiBD
T05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKK1NZTV9DT0RFX1NUQVJUKGZ0
cmFjZV9zdHViX2RpcmVjdF90cmFtcCkKKwlqcgl0MAorU1lNX0NPREVfRU5EKGZ0cmFjZV9zdHVi
X2RpcmVjdF90cmFtcCkKKyNlbmRpZiAvKiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJF
Q1RfQ0FMTFMgKi8KLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
