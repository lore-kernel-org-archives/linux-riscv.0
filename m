Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3B5C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irLA5o2Jy5dqdWbReY4gchbh3axIDaI8Xb9lxGOAuyc=; b=BFw4b5qqyE+SiF
	qRDm0a2dHYU5KFZRW1q7YiQv5VggFyOxgPRlD+hcwksOKvNzjdxycfTNEmKzQEK8jyITd5IepN8G3
	pH1bBq//oEAGIqpE+g5f9sBcZT4wxajN1/vPmfrLHIF5No9LKc2mqW/eyWs8V+hgOiXdD/aGmSl9A
	h2C5bw2DHD0WQm13DvPfHt3PK9UMva3/nFpfT1tMUXQTIYLlyoLY917RNPEWDaOU6BhWALclvwu6L
	AyMW2J3jeqDxpPuBgbpmSrIYg6jOWzsHwgwh0fghWLkviOLHSC64XLpWqv72IbO+Vjkno5We5qY3P
	CNNSQxXBudwQTtaRBMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ5F-007cXq-HJ; Tue, 07 Jun 2022 13:17:21 +0000
Received: from forward500j.mail.yandex.net ([2a02:6b8:0:801:2::110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ51-007cMx-NN; Tue, 07 Jun 2022 13:17:09 +0000
Received: from myt5-f0e8352497c8.qloud-c.yandex.net (myt5-f0e8352497c8.qloud-c.yandex.net [IPv6:2a02:6b8:c12:3c22:0:640:f0e8:3524])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id D93886CB6DAE;
	Tue,  7 Jun 2022 16:17:01 +0300 (MSK)
Received: from myt6-654ec0a0ab93.qloud-c.yandex.net (myt6-654ec0a0ab93.qloud-c.yandex.net [2a02:6b8:c12:1d80:0:640:654e:c0a0])
	by myt5-f0e8352497c8.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 3zNxHODKJI-H0fO9MpU;
	Tue, 07 Jun 2022 16:17:01 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1654607821;
	bh=hQhndwkj71U3FGMLsP/eq3Nugqa3M1fyrFTWT3q68hQ=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=NJnzfUlSlee1UpmU5Dgch59/F8lXLuIVD8FhhXiFA9CJ1kWdMxKhcIdnWVy6AZTyV
	 3DqZZltYprFxT3qkivpyJ0ssDY7OpxzlKcpbiyThK37jmqOpTq4pnBxIpCpTTzdWHO
	 q+ZchxAeidjMHg1V/WiYd32NttwLoMnkuASiG1Ls=
Authentication-Results: myt5-f0e8352497c8.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-654ec0a0ab93.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id sOXgg17Zrk-GxM4mQbH;
	Tue, 07 Jun 2022 16:16:59 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V PMU DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PMU PROFILING AND DEBUGGING),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM)
Subject: [PATCH v3 2/4] RISC-V: Support CPUID for risc-v in perf
Date: Tue,  7 Jun 2022 16:16:45 +0300
Message-Id: <20220607131648.29439-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607131648.29439-1-nikita.shubin@maquefel.me>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_061708_176782_D16D8B72 
X-CRM114-Status: GOOD (  19.75  )
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

RnJvbTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5w
dD4KClRoaXMgcGF0Y2ggY3JlYXRlcyB0aGUgaGVhZGVyLmMgZmlsZSBmb3IgdGhlIHJpc2MtdiBh
cmNoaXRlY3R1cmUgYW5kIGludHJvZHVjZXMgc3VwcG9ydCBmb3IKUE1VIGlkZW50aWZpY2F0aW9u
IHRocm91Z2ggc3lzZnMuCkl0IGlzIG5vdyBwb3NzaWJsZSB0byBjb25maWd1cmUgcG11LWV2ZW50
cyBpbiByaXNjLXYuCgpEZXBlbmRzIG9uIHBhdGNoIFsxXSwgdGhhdCBpbnRyb2R1Y2VzIHRoZSBp
ZCBzeXNmcyBmaWxlLgoKU2lnbmVkLW9mZi1ieTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxqb2Fv
Lm1hcmlvQHRlY25pY28udWxpc2JvYS5wdD4KW05pa2l0YTogcmVwbGFjZWQgc29jOnBtdSB0byBy
aXNjdi1wbXUvaWRdClNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHViaW4gPG4uc2h1YmluQHlhZHJv
LmNvbT4KVGVzdGVkLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Ci0tLQp2
Mi0+djM6Ci0gQ2hhbmdlICdzb2Mvc29jOnBtdS9pZCcgdG8gJ3Jpc2N2LXBtdS9pZCcKLS0tCiBk
cml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgICAgICAgICAgICB8IDE4ICsrKysrKysrCiB0b29scy9w
ZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZCAgICB8ICAxICsKIHRvb2xzL3BlcmYvYXJjaC9yaXNj
di91dGlsL2hlYWRlci5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmls
ZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Bl
cmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCmluZGV4IGIyYjhkMjA3NGVkMC4u
ZDFhYTRlMGU1MjdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKKysrIGIv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCkBAIC0xNyw2ICsxNywyMyBAQAogCiAjaW5jbHVkZSA8
YXNtL3NiaS5oPgogCitQTVVfRk9STUFUX0FUVFIoZXZlbnQsICJjb25maWc6MC02MyIpOworCitz
dGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqcmlzY3ZfYXJjaF9mb3JtYXRzX2F0dHJbXSA9IHsKKwkm
Zm9ybWF0X2F0dHJfZXZlbnQuYXR0ciwKKwlOVUxMLAorfTsKKworc3RhdGljIHN0cnVjdCBhdHRy
aWJ1dGVfZ3JvdXAgcmlzY3ZfcG11X2Zvcm1hdF9ncm91cCA9IHsKKwkubmFtZSA9ICJmb3JtYXQi
LAorCS5hdHRycyA9IHJpc2N2X2FyY2hfZm9ybWF0c19hdHRyLAorfTsKKworc3RhdGljIGNvbnN0
IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKnJpc2N2X3BtdV9hdHRyX2dyb3Vwc1tdID0geworCSZy
aXNjdl9wbXVfZm9ybWF0X2dyb3VwLAorCU5VTEwsCit9OworCiBzdGF0aWMgdW5zaWduZWQgbG9u
ZyBjc3JfcmVhZF9udW0oaW50IGNzcl9udW0pCiB7CiAjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3Jl
YWQoX19jc3JfbnVtLCBfX3ZhbCkJCXtcCkBAIC0zMDcsNiArMzI0LDcgQEAgc3RydWN0IHJpc2N2
X3BtdSAqcmlzY3ZfcG11X2FsbG9jKHZvaWQpCiAJCQljcHVjLT5ldmVudHNbaV0gPSBOVUxMOwog
CX0KIAlwbXUtPnBtdSA9IChzdHJ1Y3QgcG11KSB7CisJCS5hdHRyX2dyb3Vwcwk9IHJpc2N2X3Bt
dV9hdHRyX2dyb3VwcywKIAkJLmV2ZW50X2luaXQJPSByaXNjdl9wbXVfZXZlbnRfaW5pdCwKIAkJ
LmFkZAkJPSByaXNjdl9wbXVfYWRkLAogCQkuZGVsCQk9IHJpc2N2X3BtdV9kZWwsCmRpZmYgLS1n
aXQgYS90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZCBiL3Rvb2xzL3BlcmYvYXJjaC9y
aXNjdi91dGlsL0J1aWxkCmluZGV4IDdkMzA1MDEzNGFlMC4uNjAzZGJiNWFlNGRjIDEwMDY0NAot
LS0gYS90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZAorKysgYi90b29scy9wZXJmL2Fy
Y2gvcmlzY3YvdXRpbC9CdWlsZApAQCAtMSw0ICsxLDUgQEAKIHBlcmYteSArPSBwZXJmX3JlZ3Mu
bworcGVyZi15ICs9IGhlYWRlci5vCiAKIHBlcmYtJChDT05GSUdfRFdBUkYpICs9IGR3YXJmLXJl
Z3MubwogcGVyZi0kKENPTkZJR19MSUJEV19EV0FSRl9VTldJTkQpICs9IHVud2luZC1saWJkdy5v
CmRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIuYyBiL3Rvb2xz
L3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uOThkNDBiODdjOWYzCi0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvcGVy
Zi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMKQEAgLTAsMCArMSw2NiBAQAorI2luY2x1ZGUgPHN0
ZGlvLmg+CisjaW5jbHVkZSA8c3RkbGliLmg+CisjaW5jbHVkZSA8YXBpL2ZzL2ZzLmg+CisjaW5j
bHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlICIuLi8uLi91dGlsL2RlYnVnLmgiCisjaW5jbHVkZSAi
Li4vLi4vdXRpbC9oZWFkZXIuaCIKKworI2RlZmluZSBTVFJfTEVOIDEwMjQKKyNkZWZpbmUgSURf
U0laRSA2NAorCitzdGF0aWMgaW50IF9nZXRfY3B1aWQoY2hhciAqYnVmLCBzaXplX3Qgc3opCit7
CisJY29uc3QgY2hhciAqc3lzZnMgPSBzeXNmc19fbW91bnRwb2ludCgpOworCXU2NCBpZCA9IDA7
CisJY2hhciBwYXRoW1BBVEhfTUFYXTsKKwlGSUxFICpmaWxlOworCisJaWYgKCFzeXNmcyB8fCBz
eiA8IElEX1NJWkUpCisJCXJldHVybiAtRUlOVkFMOworCisJc2NucHJpbnRmKHBhdGgsIFBBVEhf
TUFYLCAiJXMvZGV2aWNlcy9wbGF0Zm9ybS9yaXNjdi1wbXUvaWQiLAorCQkJc3lzZnMpOworCisJ
ZmlsZSA9IGZvcGVuKHBhdGgsICJyIik7CisJaWYgKCFmaWxlKSB7CisJCXByX2RlYnVnKCJmb3Bl
biBmYWlsZWQgZm9yIGZpbGUgJXNcbiIsIHBhdGgpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisJ
aWYgKCFmZ2V0cyhidWYsIElEX1NJWkUsIGZpbGUpKSB7CisJCWZjbG9zZShmaWxlKTsKKwkJcmV0
dXJuIC1FSU5WQUw7CisJfQorCisJZmNsb3NlKGZpbGUpOworCisJLypDaGVjayBpZiB2YWx1ZSBp
cyBudW1lcmljIGFuZCByZW1vdmUgc3BlY2lhbCBjaGFyYWN0ZXJzKi8KKwlpZCA9IHN0cnRvdWwo
YnVmLCBOVUxMLCAxNik7CisJaWYgKCFpZCkKKwkJcmV0dXJuIC1FSU5WQUw7CisJc2NucHJpbnRm
KGJ1ZiwgSURfU0laRSwgIjB4JWx4IiwgaWQpOworCisJcmV0dXJuIDA7Cit9CisKK2NoYXIgKmdl
dF9jcHVpZF9zdHIoc3RydWN0IHBlcmZfcG11ICpwbXUgX19tYXliZV91bnVzZWQpCit7CisJY2hh
ciAqYnVmID0gTlVMTDsKKwlpbnQgcmVzOworCisJaWYgKCFwbXUpCisJCXJldHVybiBOVUxMOwor
CisJYnVmID0gbWFsbG9jKElEX1NJWkUpOworCWlmICghYnVmKQorCQlyZXR1cm4gTlVMTDsKKwor
CS8qIHJlYWQgaWQgKi8KKwlyZXMgPSBfZ2V0X2NwdWlkKGJ1ZiwgSURfU0laRSk7CisJaWYgKHJl
cykgeworCQlwcl9lcnIoImZhaWxlZCB0byBnZXQgY3B1aWQgc3RyaW5nIGZvciBQTVUgJXNcbiIs
IHBtdS0+bmFtZSk7CisJCWZyZWUoYnVmKTsKKwkJYnVmID0gTlVMTDsKKwl9CisKKwlyZXR1cm4g
YnVmOworfQotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
