Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6115CD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFXJqJRnBhOCEa3OiEh7F5OrRYXcuF0mACjMqfCqQ6A=; b=bK5UzclsplvG34
	daIeb6H6V8ACPXSLbqQMKdRF6vCNBwOcbiT5bTsfcf5Mn2GcTpmTIcxqdwAcTHhFBCYA4aukruYZp
	Gud/pu6h2y7Vr6UNKrEsxfM6zWsrfxkROCvYTeCryHnr/zyV5WF49YJOlXgCHH3KeS9vyJerFZpCt
	dHYWq/hC+7bTrjxySQJCfqyz+KgrKFG4bTqXSux2HEQDpOEkUiSLLqwqhd3Nee25Log6Q8iEkAzzK
	TkffDmDgkzbYk3Fj+gAtgsnGEdupUsW0qgWNI74LRd22o5hI9ZHyaUY47HNTvrpHeEWaN/sf3EinP
	C2oLtzNeXk9IY/eP+TKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXl-00000004nBh-3rhE;
	Tue, 09 Jun 2026 06:02:33 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXb-00000004n15-1yIt
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUBImEnq8hbrnJQhJKzk1cL/zkOMmDZcmfYv80HVE44=;
	b=NsmLtSBptUWXHcKm7DpTShuwbjiQTkqfyAQv+YX8QR78qXKFwPH5eSqrjKbsWMANmdO3rC
	PZ6LOSoQvrBuGlOXBwxDdMbXsFQ7/Qbp5c+6pv5Qqd0bOwdXIEtyUkMkLVpEugw9ZvNczO
	gJ63rlUBpUyNC23GHMRLf0Wr5RQmqD0=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:22 -0700
Subject: [PATCH v6 08/21] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
MIME-Version: 1.0
Message-Id: <20260608-counter_delegation-v6-8-285b72ed65a9@meta.com>
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
X-CRM114-CacheID: sfid-20260608_230225_775510_8A76970D 
X-CRM114-Status: GOOD (  10.43  )
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

RnJvbTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpTbWNkZWxlZyBleHRlbnNp
b24gYWxsb3dzIHRoZSBNLW1vZGUgdG8gZGVsZWdhdGUgc2VsZWN0ZWQgY291bnRlcnMKdG8gUy1t
b2RlIHNvIHRoYXQgaXQgY2FuIGFjY2VzcyB0aG9zZSBjb3VudGVycyBhbmQgY29ycmVwc29uZGlu
ZwpocG1ldmVudCBDU1JzIHdpdGhvdXQgTS1tb2RlLgoKU3NjY2ZnICjigJhTc+KAmSBmb3IgUHJp
dmlsZWdlZCBhcmNoaXRlY3R1cmUgYW5kIFN1cGVydmlzb3ItbGV2ZWwKZXh0ZW5zaW9uLCDigJhj
Y2Zn4oCZIGZvciBDb3VudGVyIENvbmZpZ3VyYXRpb24pIHByb3ZpZGVzIGFjY2VzcyB0bwpkZWxl
Z2F0ZWQgY291bnRlcnMgYW5kIG5ldyBzdXBlcnZpc29yLWxldmVsIHN0YXRlLgoKVGhpcyBwYXRj
aCBqdXN0IGVuYWJsZXMgdGhlc2UgZGVmaW5pdGlvbnMgYW5kIGVuYWJsZSBwYXJzaW5nLgoKU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgIDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDUxYWQ1NWI5Njc3YS4u
MDg5MzUzYjI1MGIwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMTUsNiArMTE1LDggQEAK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklORAkJMTA2CiAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfU01DU1JJTkQJCTEwNwogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ05UUlBNRgkJMTA4Cisj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NDQ0ZHCQkxMDkKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9T
TUNERUxFRwkJMTEwCiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3CiAK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCAxNDUyNTIxZDc0MGEuLjFmZTY0N2UwMzUxNSAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMzMwLDYgKzMzMCwyNyBAQCBzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IHJpc2N2X2FfZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWktORSwJXAogCVJJ
U0NWX0lTQV9FWFRfWktOSAogCitzdGF0aWMgaW50IHJpc2N2X2V4dF9zbWNkZWxlZ192YWxpZGF0
ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgICAgICBjb25z
dCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQoreworCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNp
b25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQpICYmCisJICAg
IF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VY
VF9aSUhQTSkgJiYKKwkgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0
bWFwLCBSSVNDVl9JU0FfRVhUX1pJQ05UUikpCisJCXJldHVybiAwOworCisJcmV0dXJuIC1FUFJP
QkVfREVGRVI7Cit9CisKK3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3NzY2NmZ192YWxpZGF0ZShjb25z
dCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgICAgY29uc3QgdW5zaWdu
ZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlpZiAoIXJpc2N2X2V4dF9zbWNkZWxlZ192YWxpZGF0
ZShkYXRhLCBpc2FfYml0bWFwKSAmJgorCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfU01DREVMRUcpKQorCQlyZXR1cm4gMDsKKwor
CXJldHVybiAtRVBST0JFX0RFRkVSOworfQorCiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJp
c2N2X3prX2J1bmRsZWRfZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWktOLAogCVJJU0NWX0lT
QV9FWFRfWktSLApAQCAtNTc2LDEyICs1OTcsMTUgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9l
eHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0JVTkRMRV9WQUxJ
REFURSh6dmtzZywgcmlzY3ZfenZrc2dfYnVuZGxlZF9leHRzLCByaXNjdl9leHRfdmVjdG9yX2Ny
eXB0b192YWxpZGF0ZSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoenZrdCwgUklT
Q1ZfSVNBX0VYVF9aVktULCByaXNjdl9leHRfdmVjdG9yX2NyeXB0b192YWxpZGF0ZSksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAorCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBX1ZBTElEQVRFKHNtY2RlbGVnLCBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVHLAor
CQkJCSAgICAgIHJpc2N2X2V4dF9zbWNkZWxlZ192YWxpZGF0ZSksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoc21jbnRycG1mLCBSSVNDVl9JU0FfRVhUX1NNQ05UUlBNRiksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc21jc3JpbmQsIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHNtbXBtLCBSSVNDVl9JU0FfRVhUX1NNTVBNKSwKIAlfX1JJU0NWX0lTQV9FWFRf
U1VQRVJTRVQoc21ucG0sIFJJU0NWX0lTQV9FWFRfU01OUE0sIHJpc2N2X3hsaW51eGVudmNmZ19l
eHRzKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01T
VEFURUVOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJ
QSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoc3NjY2ZnLCBSSVNDVl9JU0FfRVhU
X1NTQ0NGRywgcmlzY3ZfZXh0X3NzY2NmZ192YWxpZGF0ZSksCiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHNzY3NyaW5kLCBSSVNDVl9JU0FfRVhUX1NTQ1NSSU5EKSwKIAlfX1JJU0NWX0lTQV9FWFRf
U1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJpc2N2X3hsaW51eGVudmNmZ19l
eHRzKSwKCi0tIAoyLjUzLjAtTWV0YQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
