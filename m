Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA77C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7oKvfCKIGCHC/C4QCsP7TodKxdYzYeazcctyFEamHxM=; b=cePlJisy6hRsugrQSeEaZIume6
	LzVfctYxjXQMDLodSFlAVjGXyl/kfPAqHsPeQ8iN9fKPN9gfASGdYRYEXgzAHFLncrbNS4tm5H8zL
	sSoBldZUVyps6gn4xZrhuY2jo8ZzTpZF0H7OFpU3TYqovH18ldvU5VEf6tuTL0iYPB50IudLJq6rU
	krm7/62gqZtrhgXxVmE+LtWXi/c9YsUMuttQoM4zfjA+mjxcbQfDAQ+hTmDUIHRXO/hBuhoY3pvjF
	qMuLyrh/RzQ9SmT+xffLeWoUIUoSTuvBz0nH/OGdW5J6KLfepyHS7ai7j9L+vWzzKp1yay0MYLzkJ
	/N/EF5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt523-00F24t-Ld; Fri, 03 Dec 2021 09:39:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt51r-00F22v-Ik; Fri, 03 Dec 2021 09:38:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2DBD1435;
 Fri,  3 Dec 2021 01:38:51 -0800 (PST)
Received: from [10.57.82.187] (unknown [10.57.82.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25C633F5A1;
 Fri,  3 Dec 2021 01:38:49 -0800 (PST)
Subject: Re: [PATCH v1 4/4] perf tools: Support register names from all
 architectures
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 acme@kernel.org
Cc: John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-5-german.gomez@arm.com>
From: German Gomez <german.gomez@arm.com>
Message-ID: <c78b2533-6960-99c9-543a-965d669d1ece@arm.com>
Date: Fri, 3 Dec 2021 09:38:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211201123334.679131-5-german.gomez@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_013855_712002_B8DBDCE1 
X-CRM114-Status: GOOD (  16.43  )
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

Ck9uIDAxLzEyLzIwMjEgMTI6MzMsIEdlcm1hbiBHb21leiB3cm90ZToKPiBbLi4uXQo+Cj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9wZXJmX3JlZ3MuaCBiL3Rvb2xzL3BlcmYvdXRpbC9w
ZXJmX3JlZ3MuaAo+IGluZGV4IGVlYWMxODFlYi4uYTIwMTE4MWZjIDEwMDY0NAo+IC0tLSBhL3Rv
b2xzL3BlcmYvdXRpbC9wZXJmX3JlZ3MuaAo+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9wZXJmX3Jl
Z3MuaAo+IEBAIC0yNywxNSArMjcsNDIgQEAgdWludDY0X3QgYXJjaF9fdXNlcl9yZWdfbWFzayh2
b2lkKTsKPiAgI2lmZGVmIEhBVkVfUEVSRl9SRUdTX1NVUFBPUlQKPiAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBzYW1wbGVfcmVnIHNhbXBsZV9yZWdfbWFza3NbXTsKPiAgCj4gKyNpbmNsdWRlIDxzdHJp
bmcuaD4KPiAgI2luY2x1ZGUgPHBlcmZfcmVncy5oPgo+ICAKPiAgI2RlZmluZSBEV0FSRl9NSU5J
TUFMX1JFR1MgKCgxVUxMIDw8IFBFUkZfUkVHX0lQKSB8ICgxVUxMIDw8IFBFUkZfUkVHX1NQKSkK
PiAgCj4gIGludCBwZXJmX3JlZ192YWx1ZSh1NjQgKnZhbHAsIHN0cnVjdCByZWdzX2R1bXAgKnJl
Z3MsIGludCBpZCk7Cj4gIAo+IC1zdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKnBlcmZfcmVnX25h
bWUoaW50IGlkKQo+ICsjaW5jbHVkZSAicGVyZl9yZWdzX2Nza3kuaCIKPiArI2luY2x1ZGUgInBl
cmZfcmVnc19taXBzLmgiCj4gKyNpbmNsdWRlICJwZXJmX3JlZ3NfcG93ZXJwYy5oIgo+ICsjaW5j
bHVkZSAicGVyZl9yZWdzX3Jpc2N2LmgiCj4gKyNpbmNsdWRlICJwZXJmX3JlZ3NfczM5MC5oIgo+
ICsjaW5jbHVkZSAicGVyZl9yZWdzX3g4Ni5oIgo+ICsjaW5jbHVkZSAicGVyZl9yZWdzX2FybS5o
Igo+ICsjaW5jbHVkZSAicGVyZl9yZWdzX2FybTY0LmgiCgpTb21ldGhpbmcgdGhhdCBzbGlwcGVk
IHRocm91Z2g6IHRoaXMgaXMgZmFpbGluZyB0byBjb21waWxlIHBlcmYgb24gQVJNMzIKZHVlIHRv
IHRoZSBvcmRlciBvZiB0aGUgaW1wb3J0czoKCnV0aWwvLi4vLi4vYXJjaC9hcm02NC9pbmNsdWRl
L3VhcGkvYXNtL3BlcmZfcmVncy5oOjU6NjogZXJyb3I6IG5lc3RlZCByZWRlZmluaXRpb24gb2Yg
4oCYZW51bSBwZXJmX2V2ZW50X2FybV9yZWdz4oCZCsKgwqDCoCA1IHwgZW51bSBwZXJmX2V2ZW50
X2FybV9yZWdzIHsKwqDCoMKgwqDCoCB8wqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+CgpC
b3RoICNpbXBvcnQgPHBlcmZfcmVncy5oPiBhbmQgInBlcmZfcmVnc19hcm0uaCIgYXJlIGltcG9y
dGluZyB0aGUgc2FtZQpoZWFkZXIgKC90b29scy9hcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNtL3Bl
cmZfcmVncy5oKSBzbyB0aGlzIHBhcnQgb2YKdGhlIFtQQVRDSCAzLzRdIGlzbid0IGRvaW5nIGFu
eXRoaW5nOgoKZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9wZXJmX3JlZ3NfYXJtLmggYi90
b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzX2FybS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMC4uNzc5YjQwZDZjCi0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvcGVyZi91dGls
L3BlcmZfcmVnc19hcm0uaApAQCAtMCwwICsxLDU3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLworI2lmbmRlZiBfX1BFUkZf
UkVHU19BUk1fSAorI2RlZmluZSBfX1BFUkZfUkVHU19BUk1fSAorCisvKgorICogQVJNIGFuZCBB
Uk02NCByZWdpc3RlcnMgYXJlIGdyb3VwZWQgdW5kZXIgZW51bXMgb2YgdGhlIHNhbWUgbmFtZS4K
KyAqIFRlbXBvcmFyaWx5IHJlbmFtZSB0aGUgbmFtZSBvZiB0aGUgZW51bSB0byBwcmV2ZW50IHRo
ZSBuYW1pbmcgY29sbGlzaW9uLgorICovCisjZGVmaW5lIHBlcmZfZXZlbnRfYXJtX3JlZ3MgcGVy
Zl9ldmVudF9hcm1fcmVnc193b3JrYXJvdW5kCisKKyNpbmNsdWRlICIuLi8uLi9hcmNoL2FybS9p
bmNsdWRlL3VhcGkvYXNtL3BlcmZfcmVncy5oIgoKVGhlcmUgaXMgYSBzaW1pbGFyIHdvcmthcm91
bmQgaW4gdGhlIGNza3kgdmVyc2lvbi4gQWx0aG91Z2ggaXQgc2hvdWxkCmNvbXBpbGUsIEkgdGhp
bmsgc29tZSBvZiB0aGUgcmVnaXN0ZXIgbmFtZXMgbWlnaHQgYmUgbWlzc2luZyAodGhlIG9uZXMK
dW5kZXIgI2lmIGRlZmluZWQoX19DU0tZQUJJVjJfXykpLgoKSSdtIHdvbmRlcmluZyBpZiBpdCB3
b3VsZCBiZSB3aXNlciB0byB1cGRhdGUgdGhpcyBjaGFuZ2VzZXQgdG8gb25seQpjb25zaWRlciBh
IHNtYWxsIG51bWJlciBvZiBwbGF0Zm9ybXMgKG1heWJlIHg4NiBhbmQgYXJtNjQpIGFuZCBzZWUg
aG93Cml0IGdvZXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
