Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2B8C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQE4MFKY9Sh9bBHF7c2GVylT4k1vagjabiijuZSQlBc=; b=dyjJwWfnLU2hDU
	IqV+LcTQ3NNU+eldSX57PqJUCeDjATP/iWlXRhGW0GmZEr2Q1wW84dxnPNqfG7Xosw/Cr/Bf/wCKP
	sep1EeAf3MHH3+I3surhePpOzHm/v3HCjFZM+5n+NtcrXF5nHKFab+KxJCwGKCF2D5ySROBkSKOlj
	LyBJlQjYk5EyWnqoWtraSSwwILMVJ59+WowRzc/tGFEGwC2ClZgp9La3KR7dVw/1z0c11EuqzUtM5
	tHvbGJeBUl3zKYd2zJ5QTXKyYR9LnDINeV6aPOiipDgUNS5vNJKppOU2chZ5RQhDVfJ4tBjMYPyZe
	EqicANZR02VpfYCDwePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeO-00000007LYW-170I;
	Fri, 07 Aug 2026 08:09:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeN-00000007LW7-1VG7
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uH8jIuxLMy4lWgOnqryCdwNUqd6ifoWFBriuPzXx9AA=; b=S2S3pehykyLD21PG7e4hgeXaXE
	jPRdcAhCjOKproclq9E84kQhFZw6mytbomBL0lcq6rEpSFjbwLxfzkCgF6NKKhwb7xRSrUbO4IaDk
	2Q5RJN1ncpKbgkbL1+XXTqplgeN6HQGRgq2U2knan/Ok7Xh9KWCYrmsyUkQX5ex+mxlrQ+aQSZ1aB
	Ykh+4KIBILM9nOjkqHJCbMPeJG9S/MTzuk5ETN8VcMKO+kDgHJAFqeZs9vE7Cs/ZA7NH16YrG/bV5
	HLSyTjreawj9X+mkjfW/C2B+96sseouF6SklcRVtfu1/IMa+yntgK5WMKl+mMqTorr5rwCQryoey1
	EOtEtTlQ==;
Received: from mta1.migadu.com ([37.59.57.117] helo=out-182.mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFeK-0000000CAfl-0Xx4
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uH8jIuxLMy4lWgOnqryCdwNUqd6ifoWFBriuPzXx9AA=;
	b=He9aUBrooZ5ohd6C7fdPaJDlhU5m69w5c/S/QiosjC2gL5wf/hjli79l35ErqUGqNDM4wf
	4NOEaVgD+V0ljF/UEKYif7YF9rX3N94gFDtRFtPRY3lgTQ9Dx7Rxxi5P+8rc8g2pnHFu8n
	qpjCvql4nivbA7VJrQu9Dc6EgjG36DM=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:04 -0700
Subject: [PATCH v9 09/20] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-9-58658104e487@meta.com>
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
X-CRM114-CacheID: sfid-20260807_090952_349145_ABD03972 
X-CRM114-Status: GOOD (  10.38  )
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
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ckxpbms6IGh0dHBz
Oi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDcwMS1jb3VudGVyX2RlbGVnYXRpb24tdjgtOS03OTA5
Zjg2M2E2NDVAbWV0YS5jb20KU2lnbmVkLW9mZi1ieTogUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5l
bC5vcmc+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdt
YWlsLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAgMiArKwogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
aW5kZXggNTFhZDU1Yjk2NzdhLi4wODkzNTNiMjUwYjAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
QEAgLTExNSw2ICsxMTUsOCBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NTQ1NSSU5ECQkxMDYK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNTUklORAkJMTA3CiAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfU01DTlRSUE1GCQkxMDgKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NDRkcJCTEwOQorI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVHCQkxMTAKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1hMSU5VWEVOVkNGRwkxMjcKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDE0NTI1MjFkNzQw
YS4uMWZlNjQ3ZTAzNTE1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0zMzAsNiArMzMwLDI3
IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfYV9leHRzW10gPSB7CiAJUklTQ1Zf
SVNBX0VYVF9aS05FLAlcCiAJUklTQ1ZfSVNBX0VYVF9aS05ICiAKK3N0YXRpYyBpbnQgcmlzY3Zf
ZXh0X3NtY2RlbGVnX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRh
dGEsCisJCQkJICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCit7CisJaWYg
KF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VY
VF9TU0NTUklORCkgJiYKKwkgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2Ff
Yml0bWFwLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSAmJgorCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNp
b25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfWklDTlRSKSkKKwkJcmV0dXJu
IDA7CisKKwlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKK30KKworc3RhdGljIGludCByaXNjdl9leHRf
c3NjY2ZnX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCisJ
CQkJICAgICBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQoreworCWlmICghcmlzY3Zf
ZXh0X3NtY2RlbGVnX3ZhbGlkYXRlKGRhdGEsIGlzYV9iaXRtYXApICYmCisJICAgIF9fcmlzY3Zf
aXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9TTUNERUxF
RykpCisJCXJldHVybiAwOworCisJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cit9CisKIHN0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfemtfYnVuZGxlZF9leHRzW10gPSB7CiAJUklTQ1ZfSVNB
X0VYVF9aS04sCiAJUklTQ1ZfSVNBX0VYVF9aS1IsCkBAIC01NzYsMTIgKzU5NywxNSBAQCBjb25z
dCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NW
X0lTQV9FWFRfQlVORExFX1ZBTElEQVRFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVkX2V4dHMs
IHJpc2N2X2V4dF92ZWN0b3JfY3J5cHRvX3ZhbGlkYXRlKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QV9WQUxJREFURSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QsIHJpc2N2X2V4dF92ZWN0b3JfY3J5
cHRvX3ZhbGlkYXRlKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VY
VF9TTUFJQSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoc21jZGVsZWcsIFJJU0NW
X0lTQV9FWFRfU01DREVMRUcsCisJCQkJICAgICAgcmlzY3ZfZXh0X3NtY2RlbGVnX3ZhbGlkYXRl
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NWX0lTQV9FWFRfU01DTlRS
UE1GKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNzcmluZCwgUklTQ1ZfSVNBX0VYVF9TTUNT
UklORCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21tcG0sIFJJU0NWX0lTQV9FWFRfU01NUE0p
LAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzbW5wbSwgUklTQ1ZfSVNBX0VYVF9TTU5QTSwg
cmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtc3RhdGVl
biwgUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlh
LCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURShz
c2NjZmcsIFJJU0NWX0lTQV9FWFRfU1NDQ0ZHLCByaXNjdl9leHRfc3NjY2ZnX3ZhbGlkYXRlKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiks
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njc3JpbmQsIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQp
LAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzc25wbSwgUklTQ1ZfSVNBX0VYVF9TU05QTSwg
cmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAoKLS0gCjIuNTMuMC1NZXRhCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
