Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF92C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulYSValyaRvE1SaHKoSgdWAA6pCZBrc5W2K88AA8IJE=; b=LA3Lb3fjmqiFxI
	uX/Ee6TeTns5WM1yHN8lBjLOYwu7jTihJ1sx2WyEwUE2+jxhTyWXSNPWn+VeL9K5G7PfnCS72PduG
	5kzGY+Ikv4rWBHztLiqG29LRSipVpi5yIeXk32iolw56J/NGoLc68Gk7h27ZiD1Y1cA9w22yHSOZb
	sSNIXZIhFDAD9ixc0KziZLArem8lu1J2s1XkV1KMOFFIMsIVI5S7wYeRQUpA0Z3vn37AY72J6biIu
	qYm72N7tSf58bZwIPAmrBX4CG+adUQbv+YNEq6DnVVFpvsrKPP+fJad3AIlcfJSAM0/DmxISmsTO3
	sdlZqJp+yjsKLTSdrmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeJ-00000007LQN-0cZf;
	Fri, 07 Aug 2026 08:09:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeH-00000007LMN-35Q8
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sBqwitrzuPPa1Vxy+koJRidNylMz9UIgzSZlHnhJwUY=; b=gor70nNJ40NGkQLZ//ub/9c+ZN
	dDfMazoOfZAUH32knkU9rjgB9iiGcrdDt9Lkc7J5E8I4oZcbtMD/ifCzBXjRZSdSDbEw3v6wxuTDe
	QUk2zsYpDbdxDDO02XDfdG75ex0L7jVPsm7M1WUNivcpWk5StWn/lQCX5ItndpFW7Z/RLkB9NVO2A
	6Wlntd/ZWdZnngsncPBJ6XGpMSHFiXHGqc51M/nnRBhojhrncQ1Ef3ND8kzsVhdAa5yu7aQeYoL7e
	l0leqtXIqx4ANFWrn5ndfYW198X86sKpZpXxpTYT+/7AcSwENLE75LkhJ3W9QwFh/naO16usfd5Zk
	sGmJ4caw==;
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFeD-0000000CAeM-3Hc3
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sBqwitrzuPPa1Vxy+koJRidNylMz9UIgzSZlHnhJwUY=;
	b=glwRAdrtcWYpCghWdNdouTO5vh1snHIseTXAD9UCLKQuOxg8X509L0wUp9woGfdx29jZ9j
	92AfOTilHbr5L0zy1rBFG6f+/qol6LAVsdlvwnid+YU+FJ3ewHyuzKa30FVvIcUA+iQPJc
	OzyRN+ddQdYSLS7ge4Wu8QcoLfYY15o=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:03 -0700
Subject: [PATCH v9 08/20] RISC-V: Add Ssccfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-8-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090945_947275_2385249E 
X-CRM114-Status: UNSURE (   7.53  )
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgdGhlIHNj
b3VudGluaGliaXQgQ1NSIGRlZmluaXRpb24gYW5kIFMtbW9kZSBhY2Nlc3NpYmxlIGhwbWV2ZW50
CmJpdHMgZGVmaW5lZCBieSBzbWNkZWxlZy9zc2NjZmcuIHNjb3VudGluaGliaXQgYWxsb3dzIFMt
bW9kZSB0byBzdGFydC9zdG9wCmNvdW50ZXJzIGRpcmVjdGx5IGZyb20gUy1tb2RlIHdpdGhvdXQg
aW52b2tpbmcgU0JJIGNhbGxzIHRvIE0tbW9kZS4gSXQgaXMKYWxzbyB1c2VkIHRvIGZpZ3VyZSBv
dXQgdGhlIGNvdW50ZXJzIGRlbGVnYXRlZCB0byBTLW1vZGUgYnkgdGhlIE0tbW9kZSBhcwp3ZWxs
LgoKU2lnbmVkLW9mZi1ieTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5
OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4KVGVzdGVkLWJ5
OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4KTGluazogaHR0
cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNzAxLWNvdW50ZXJfZGVsZWdhdGlvbi12OC04LTc5
MDlmODYzYTY0NUBtZXRhLmNvbQpbcGp3QGtlcm5lbC5vcmc6IGZpeGVkIHN1YmplY3QgdHlwb10K
U2lnbmVkLW9mZi1ieTogUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAppbmRleCA3ZjA5ZTU0YTBm
OWEuLmM4Yjk0ZjMzMzdjMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3Iu
aAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCkBAIC0yNDEsNiArMjQxLDIzIEBA
CiAjZGVmaW5lIFNNU1RBVEVFTjBfSFNFTlZDRkcJCShfVUxMKDEpIDw8IFNNU1RBVEVFTjBfSFNF
TlZDRkdfU0hJRlQpCiAjZGVmaW5lIFNNU1RBVEVFTjBfU1NUQVRFRU4wX1NISUZUCTYzCiAjZGVm
aW5lIFNNU1RBVEVFTjBfU1NUQVRFRU4wCQkoX1VMTCgxKSA8PCBTTVNUQVRFRU4wX1NTVEFURUVO
MF9TSElGVCkKKy8qIEhQTUVWRU5UIGJpdHMuIFRoZXNlIGFyZSBhY2Nlc3NpYmxlIGluIFMtbW9k
ZSB2aWEgU21jZGVsZWcvU3NjY2ZnICovCisjZGVmaW5lIEhQTUVWRU5UX09GCQkJKEJJVF9VTEwo
NjMpKQorI2RlZmluZSBIUE1FVkVOVF9NSU5ICQkJKEJJVF9VTEwoNjIpKQorI2RlZmluZSBIUE1F
VkVOVF9TSU5ICQkJKEJJVF9VTEwoNjEpKQorI2RlZmluZSBIUE1FVkVOVF9VSU5ICQkJKEJJVF9V
TEwoNjApKQorI2RlZmluZSBIUE1FVkVOVF9WU0lOSAkJCShCSVRfVUxMKDU5KSkKKyNkZWZpbmUg
SFBNRVZFTlRfVlVJTkgJCQkoQklUX1VMTCg1OCkpCisjaWZuZGVmIENPTkZJR182NEJJVAorI2Rl
ZmluZSBIUE1FVkVOVEhfT0YJCQkoQklUKDMxKSkKKyNkZWZpbmUgSFBNRVZFTlRIX01JTkgJCQko
QklUKDMwKSkKKyNkZWZpbmUgSFBNRVZFTlRIX1NJTkgJCQkoQklUKDI5KSkKKyNkZWZpbmUgSFBN
RVZFTlRIX1VJTkgJCQkoQklUKDI4KSkKKyNkZWZpbmUgSFBNRVZFTlRIX1ZTSU5ICQkJKEJJVCgy
NykpCisjZGVmaW5lIEhQTUVWRU5USF9WVUlOSAkJCShCSVQoMjYpKQorI2VuZGlmCisKKyNkZWZp
bmUgU0lTRUxFQ1RfU1NDQ0ZHX0JBU0UJCTB4NDAKIAogLyogbXNlY2NmZyBiaXRzICovCiAjZGVm
aW5lIE1TRUNDRkdfUE1NCQkJRU5WQ0ZHX1BNTQpAQCAtMzIyLDYgKzMzOSw3IEBACiAjZGVmaW5l
IENTUl9TQ09VTlRFUkVOCQkweDEwNgogI2RlZmluZSBDU1JfU0VOVkNGRwkJMHgxMGEKICNkZWZp
bmUgQ1NSX1NTVEFURUVOMAkJMHgxMGMKKyNkZWZpbmUgQ1NSX1NDT1VOVElOSElCSVQJMHgxMjAK
ICNkZWZpbmUgQ1NSX1NTQ1JBVENICQkweDE0MAogI2RlZmluZSBDU1JfU0VQQwkJMHgxNDEKICNk
ZWZpbmUgQ1NSX1NDQVVTRQkJMHgxNDIKCi0tIAoyLjUzLjAtTWV0YQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
