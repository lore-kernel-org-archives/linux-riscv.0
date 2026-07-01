Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCBBC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipNYF5NklZ5stAeEYKCzxJapDFJVF324AlcCvKy5a3Y=; b=hwspm+TScR6J6I
	SDBbU1GgEIaa0hHjfo3gwsYwdrMN9tKmPLRNqmC/yC78kn8Po/h3Hnta3ddvRddFVm8sOwMHRrtz9
	pm2yPcAlLK9GR2CLnK2t7L80ZesZFXlmwC9bzwY2MbjEdb4pRDA3GkfHLSs4PA0jfENwAY0ba8uey
	rHQJxmC/0xYIIBOu08SGkBvs/l+AuERDZVxucE327XCJegD11E6MfaufgMecCBARu6BpKHpaA7pEJ
	KT0KA6+2q/emqMV4y7tI9ZyzViUbMr+hr1sEYWIhsHeICoT1w4ejVqAglUevFqCGxxIwYK8tuQZ5X
	kj8Bef36kq/u8xnxBZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbn-000000014Nk-14xk;
	Wed, 01 Jul 2026 08:47:51 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbk-000000014H1-2Qiz
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:47:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCJ2r81edroj2Hmgi/7A55is/dQobvLAXnLASBXtpg8=;
	b=hA7Q7Ziqj0FcrguHs1jTijVS/PGxrXPk8PqaMozHWTdozmjFOtcq7ATQjFyPUCbGURhvYA
	aFVu3M5KBssn2Bge4t8fBCPEPxeowXkEh0MvOiS7rW1FLFu7Wxya8IBCOYcWSXCyWmAv6K
	a75H3/1QG8AwXRVKhulLBPahHsqPxaw=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:46:54 -0700
Subject: [PATCH v8 06/22] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_014748_762251_BB25D7E5 
X-CRM114-Status: UNSURE (   9.04  )
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
Q1NScyBhcmUKYXZhaWxhYmxlIGluIFNzY2NmZyBvbmx5IGlmIFNtY250cnBtZiBpcyBwcmVzZW50
LgoKVGhhdCdzIHdoeSwga2VybmVsIG5lZWRzIHRvIGRldGVjdCBwcmVzZW5jZSBvZiBTbWNudHJw
bWYgZXh0ZW5zaW9uIGFuZAplbmFibGUgcHJpdmlsZWdlIG1vZGUgZmlsdGVyaW5nIGZvciBjeWNs
ZS9pbnN0cmV0IGNvdW50ZXJzLgoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2lu
Yy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMSArCiBhcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IGQ0YTdiOTBlMmQ3OC4uNTFhZDU1Yjk2
NzdhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMTQsNiArMTE0LDcgQEAKICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aSUNGSVNTCQkxMDUKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklO
RAkJMTA2CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQJCTEwNworI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1NNQ05UUlBNRgkJMTA4CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhF
TlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCAzZmEwYTU2M2ZiMjEuLjE0NTI1
MjFkNzQwYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtNTc2LDYgKzU3Niw3IEBAIGNvbnN0
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1Zf
SVNBX0VYVF9CVU5ETEVfVkFMSURBVEUoenZrc2csIHJpc2N2X3p2a3NnX2J1bmRsZWRfZXh0cywg
cmlzY3ZfZXh0X3ZlY3Rvcl9jcnlwdG9fdmFsaWRhdGUpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
X1ZBTElEQVRFKHp2a3QsIFJJU0NWX0lTQV9FWFRfWlZLVCwgcmlzY3ZfZXh0X3ZlY3Rvcl9jcnlw
dG9fdmFsaWRhdGUpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtYWlhLCBSSVNDVl9JU0FfRVhU
X1NNQUlBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NWX0lTQV9FWFRf
U01DTlRSUE1GKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNzcmluZCwgUklTQ1ZfSVNBX0VY
VF9TTUNTUklORCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21tcG0sIFJJU0NWX0lTQV9FWFRf
U01NUE0pLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzbW5wbSwgUklTQ1ZfSVNBX0VYVF9T
TU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAoKLS0gCjIuNTMuMC1NZXRhCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
