Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8690C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wubHxj4z8NzrILO04awiPTKh3Kz2fg6liwdkTTXBeCU=; b=wkTaYFXjp+CgGo
	94wnpqGvUY0yM6vcZiJeiqv7+2faACX4RCZyZ7AzZabf3WSgQZg7Kre1YbroSjkZQgoKHhSuVkybR
	7MJeIAcUJ2VZofWQFus++ZMlGI7/Uv3M92QeMv2C5rY/WA0LcJh/CdeIISUWXH48KW82RMBzreWUr
	KqR4PnzA3OGq1LKDIeQkBASLkNyYzve8II54O0W8sMWACS+vyV3sVMAZcauU1C38bNyWmms7nrig2
	+6tJDS6NNWgBdnO77mLiJutKnwA3ru2pIckM1Apr2uiV26dUCTU/jEqmS6IHZM5mMzpmhCT/VN5hT
	LfEsxqJA/WL0GgQ8Fqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeB-00000007LE1-1Cxo;
	Fri, 07 Aug 2026 08:09:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeA-00000007LC9-0ZOM
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0fXPjUEsKLmMlYF2Xh97POk8oi0HXHyoazy+E9ORUCA=; b=dFSCbSBSKOjwqw3Fhfx3PL4U1g
	Goc5z3822QXJvOFO5MFDLNaGKXgnVjDnVU0KFzxZ2EhT/FaRTC2e+mNtqh6tLHuNU7OReQfKIdcPs
	qtOGpvMW7L9YsJsfHSKJmS5OfgJ1S4CYV0uy54U+mIMKFBJVnVJDrly35U4KvRk7xmxCsEgJAxRRc
	dPKqplFFdlrw6VdamaEUG1hl/7MVuGCYzlbwoXR03CeJyJz/JIJH4vA+SZ3fK0BlnSOKU/fRpN2ep
	3ajlJ/dDRr77g71b4BLsdOXOvNMJKPtzf8lrYMzZmnBmVCbEaeFB1ykILnLOscfJo+ai40NvPuGWl
	edhRQXGg==;
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFe6-0000000CAbu-37OH
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fXPjUEsKLmMlYF2Xh97POk8oi0HXHyoazy+E9ORUCA=;
	b=DL/PD0CJsCYDIe/s6T3q4qcumeisMJzAccMDpUzusR1atbfL/NoSZ5mAVS2TqqSJCOCZn0
	XZrMzXmcgQ2vS0U2ooTFUDaEkNlmv3tGe0XB5Y6s9JUd6sdyqp2Wgrl2xT0Qo9Iewn5GZ/
	Kv5jc6bZj4BfzyoWaoAtpfCSE0wuLtY=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:01 -0700
Subject: [PATCH v9 06/20] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-6-58658104e487@meta.com>
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
X-CRM114-CacheID: sfid-20260807_090938_867071_03DCBB31 
X-CRM114-Status: UNSURE (   8.39  )
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
Yy5jb20+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdt
YWlsLmNvbT4KVGVzdGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdt
YWlsLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNzAxLWNvdW50ZXJf
ZGVsZWdhdGlvbi12OC02LTc5MDlmODYzYTY0NUBtZXRhLmNvbQpTaWduZWQtb2ZmLWJ5OiBQYXVs
IFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggZDRh
N2I5MGUyZDc4Li41MWFkNTViOTY3N2EgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTExNCw2
ICsxMTQsNyBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MJCTEwNQogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1NTQ1NSSU5ECQkxMDYKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNTUklO
RAkJMTA3CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01DTlRSUE1GCQkxMDgKIAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4
IDNmYTBhNTYzZmIyMS4uMTQ1MjUyMWQ3NDBhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC01
NzYsNiArNTc2LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2Ff
ZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0JVTkRMRV9WQUxJREFURSh6dmtzZywgcmlzY3Zf
enZrc2dfYnVuZGxlZF9leHRzLCByaXNjdl9leHRfdmVjdG9yX2NyeXB0b192YWxpZGF0ZSksCiAJ
X19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoenZrdCwgUklTQ1ZfSVNBX0VYVF9aVktULCBy
aXNjdl9leHRfdmVjdG9yX2NyeXB0b192YWxpZGF0ZSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
c21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY250
cnBtZiwgUklTQ1ZfSVNBX0VYVF9TTUNOVFJQTUYpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNt
Y3NyaW5kLCBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5EKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShz
bW1wbSwgUklTQ1ZfSVNBX0VYVF9TTU1QTSksCiAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHNt
bnBtLCBSSVNDVl9JU0FfRVhUX1NNTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCgotLSAK
Mi41My4wLU1ldGEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
