Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259BCD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5AcYKf+qr1SXiinVXM+w8113q32U+rg417b3xfkTZ0=; b=oqjXw1/0Fgx+Yx
	5uxCNzETOD0nI9Hv7aeYam8Fj2H7KFLxdVrf7T2deYTvCya9sP/qSkolpFrcvSZ5hGh/pESLkRmxR
	Qt9q1dwMG21NNz/fJ4Wl8rSbku71SzTkCUu1HdWS9zBOrZXWuqVhGPO/RVPHcVP30y+S9i/DLIv+g
	8P/J2Jo9vHhyXjpSJvdttXaGDLUOfRVNT8pcg4LvqR6ati45VV2woh7jejMh1oyhAjoJ/gNCJOk13
	GYmXDcPoHXULG5fuMM7vf4fWkviXcLDem0sRyQCz47lrPbzGxIBX7w3zBUlGxy7McCf+IM+8whg67
	DQb2jmrLjjQkVpVye+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpX8-00000004mZ1-1gbf;
	Tue, 09 Jun 2026 06:01:54 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpX4-00000004mS5-0sEb
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:01:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0CMNWEqrDOucVLL8KJozQojI6+LfSI56XzYeVMxjRY=;
	b=mK5dqfHyJvdr6BZk1BEPRAOOBoUrzsqiJToe6+57nd3OgfEwMMrTqUyrc3C6R13eoQV5bK
	GUd32G9qEHzpJgzCqyn0F5yG34JjsrJYcKg9DLtbQluj8ZeTgYYOfoj9ghxvNFsaJ8AipB
	BIL+VGKswhlCmSmJs/bHwvc2vYkoVLk=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:19 -0700
Subject: [PATCH v6 05/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20260608-counter_delegation-v6-5-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_230150_391098_86688C02 
X-CRM114-Status: UNSURE (   8.90  )
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

RnJvbTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpTbWNudHJwbWYgZXh0ZW5z
aW9uIGFsbG93cyBNLW1vZGUgdG8gZW5hYmxlIHByaXZpbGVnZSBtb2RlIGZpbHRlcmluZwpmb3Ig
Y3ljbGUvaW5zdHJldCBjb3VudGVycy4gSG93ZXZlciwgdGhlIGN5Y2xlY2ZnL2luc3RyZXRjZmcg
Q1NScyBhcmUKb25seSBhdmFpbGFibGUgb25seSBpbiBTc2NjZmcgb25seSBTbWNudHJwbWYgaXMg
cHJlc2VudC4KClRoYXQncyB3aHksIGtlcm5lbCBuZWVkcyB0byBkZXRlY3QgcHJlc2VuY2Ugb2Yg
U21jbnRycG1mIGV4dGVuc2lvbiBhbmQKZW5hYmxlIHByaXZpbGVnZSBtb2RlIGZpbHRlcmluZyBm
b3IgY3ljbGUvaW5zdHJldCBjb3VudGVycy4KClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBkNGE3YjkwZTJkNzguLjUx
YWQ1NWI5Njc3YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtMTE0LDYgKzExNCw3IEBACiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDRklTUwkJMTA1CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
U1NDU1JJTkQJCTEwNgogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5ECQkxMDcKKyNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9TTUNOVFJQTUYJCTEwOAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggM2ZhMGE1NjNmYjIx
Li4xNDUyNTIxZDc0MGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTU3Niw2ICs1NzYsNyBA
QCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlf
X1JJU0NWX0lTQV9FWFRfQlVORExFX1ZBTElEQVRFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVk
X2V4dHMsIHJpc2N2X2V4dF92ZWN0b3JfY3J5cHRvX3ZhbGlkYXRlKSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQV9WQUxJREFURSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QsIHJpc2N2X2V4dF92ZWN0
b3JfY3J5cHRvX3ZhbGlkYXRlKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1Zf
SVNBX0VYVF9TTUFJQSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jbnRycG1mLCBSSVNDVl9J
U0FfRVhUX1NNQ05UUlBNRiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jc3JpbmQsIFJJU0NW
X0lTQV9FWFRfU01DU1JJTkQpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtbXBtLCBSSVNDVl9J
U0FfRVhUX1NNTVBNKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoc21ucG0sIFJJU0NWX0lT
QV9FWFRfU01OUE0sIHJpc2N2X3hsaW51eGVudmNmZ19leHRzKSwKCi0tIAoyLjUzLjAtTWV0YQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
