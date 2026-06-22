Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2733DCDB475
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5AcYKf+qr1SXiinVXM+w8113q32U+rg417b3xfkTZ0=; b=yKQiB7+f19A1o0
	F3iZeByqU5SaOg7MNl/d0G4GeNb20PlOzqc/sahShDaq73ozexoCuqWKMyh/PVEUL5p5OLuNxzIXi
	FGW8EkFqBzQArm7dNWVdkgeFT7UUMuA+bK59o/MUsP9zdkCTfn84PSDSWthdVgp04oLxUmW20d2J/
	+rvtIUX5Se7XOcZ3LgYjajUTVq8cg97uqVEz+bd4rkrJJmubRGnsknabdYF49J96gfxP2ZvfQD1EE
	mdaEGmJATUGmRVknf90HkIxWC4NhUAu7sp3WFPO4jbydINCuic/Kb+86UWWnTfWdd55LnCi+XRSfA
	o98UAQFGvoofm2XK29vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfd-00000004cZl-1UA5;
	Mon, 22 Jun 2026 08:06:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfb-00000004cVa-3Hnq
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g0CMNWEqrDOucVLL8KJozQojI6+LfSI56XzYeVMxjRY=; b=SPdEAIOicjhbqTWkgIK+uQ5/FN
	z98o1X6jW53P4SXdvorswtnzghcaYsmbqQiCC2qmDbG/XLZh7oU7RVWUbnQ2HYme/jPuFZTdD7k3F
	2EfivF772gsefwk2EVXEoO+nNcmRMTRJdz/l3wgWKybWLsroAUSMcncz8++Spc2oPRFQPiib5/mZy
	7fRkwM5O1Q97iENcpYONeEWQcvlOWaoIZT5iwG3PxlS4oEXZSI61udH1PkldJcoqRGSB6yqzOXHnT
	W4MpNSBDLwa08UyhJMqghTIktiljVLR9EYdAVP4AP3+5qtso8g5sGRyPDYgKNu0A+mYjwhA0lXEfH
	J3xnIuXg==;
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbZel-0000000HA7f-2vNd
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0CMNWEqrDOucVLL8KJozQojI6+LfSI56XzYeVMxjRY=;
	b=BbckfiSj80Rht+Nf9jqt/XwTMVumBwaHDRfewa+cDZ/WOYT2EO4UENrDNP/T0vDycPhOB1
	yTmfkLCUhWi6XfHdjfL5fYzga81DU7Fmp86hV31bJZ9alKrMWiPT+Q+GR9L0BG64SvV4km
	rEKxYuBaQPHXGntKmqxDRAcC7PwKHIU=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:18 -0700
Subject: [PATCH v7 06/22] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20260622-counter_delegation-v7-6-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090524_052422_ADF870C5 
X-CRM114-Status: UNSURE (   8.87  )
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
