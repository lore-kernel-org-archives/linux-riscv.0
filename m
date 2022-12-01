Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8634C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ab4Ld3996+5+xNQotFAcfnDxY0bA7YQh82GisFdk2Gg=; b=v/OusS+Z3GXPuZ
	XGqpdqe6v+Vt7JpmYOeDD6bq1lTEtH9S3sfA2MpVfOacw7F8Vlc47U4nvRuU1lG6WmGUPqc1gZjKM
	Yr88szsdpuAs2LFHe/EhV9GR+mf0JFlDzPrtPbZluR6GCBT+slDFdSMR9zVDUjW7VmnE3HSmTYI/q
	fl3CiFa29+nyANNt2yXdPIQh79ImbPuMDs/AOoCGHzLx5TsMdkwNcMcb/8gXhP/2u6sbmVm9gjPkk
	PIVHwDkVFffSGlZCwOZo8VVXo9jWFjn7wR8aspAW40l1yKbDAFwugb9lNTVO9Y7HDK1Wt9zjt8KWo
	eRlzk/vWsCv96HYiyEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rk1-00BKt1-Od; Thu, 01 Dec 2022 22:09:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rbQ-00BIjw-JT
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 22:00:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso5078635wme.5
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 14:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIafPhFD9IJ7Ly0CwNSGH3i2Rs4yyu6nN9+ipEhZh0A=;
        b=jjyByQFW3CViXa2XSpO0S5OezirA8iriSGyNq1Emb3eAjXPvAcs8h/qhWZvQRHrkM7
         E4yO5aU5oCECenX1ChS/eFoKmPv0xbsgDyU0kSVTl00jl03ZBLNhtOgaVKcwhuzhfB8T
         N7R+KHdaQ76bY3Z76ec67H1IKhJ28BX8clWmhefVQ98++dEoXnF5l49Qy+3a5Cak9CFt
         EIL7cmRV6y+1rtO82GUIbFuUYJjyYdwwYbZEtJNme41VeTXnC4oIE2dnPOWtcMsSXZFG
         q6jTLuz1FCKKC86LuPzjUTBAJLTqeyAPRmVpOXM4szcQvlKMGYRA5VkbQrYDVl2oy6Mj
         mCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIafPhFD9IJ7Ly0CwNSGH3i2Rs4yyu6nN9+ipEhZh0A=;
        b=kOQrwyqgy/QKFtXjIdvjRCjKBSGd13lvpUK71G0vu1cFyfxMNk7PBegCekv6Zk3QgA
         s87Fp90sXbVdRDd1UTaj84m7eJWzA/Xsnqmgh+KQkFjZQKuWyO3IAw6jztgZOi/zRTzV
         o1hk8xBs6EEA2NtkdrfklD6hxtQGahE2NbkIVTfDuA068z8B6pn3149SRKf9OHli4gyr
         EtUD9xrD1zGLTwMTmkoTdygftXGKLqqA0JyINvj459M+/0SpBhWbbT4a7cVy2cH8gcX3
         i/21IYUdjfhJkfKv1cS0Xl2PK22ax+IPwPeQNP/9yFFBN583FWTVgzv8DVXz8cVNRZTz
         4bEg==
X-Gm-Message-State: ANoB5plHjEIJEHneBvcLcRTCfsrYGYLjmX46Ax5EcWhyzM2Wjfb83aeU
	MzhFGThfFIP4lQAyIpOGnDCuTA==
X-Google-Smtp-Source: AA0mqf6xx+vYTMkMQZD2sUVXTGHs5cp2mVsSPKIbRGdbGqnCPXkM+pX1knRmP86IOvF6J1/cipiL/g==
X-Received: by 2002:a05:600c:3495:b0:3cf:ae53:918f with SMTP id a21-20020a05600c349500b003cfae53918fmr38954917wmq.131.1669932017038;
        Thu, 01 Dec 2022 14:00:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id k12-20020adfe8cc000000b00241b5af8697sm5556585wrn.85.2022.12.01.14.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 14:00:16 -0800 (PST)
Message-ID: <beb697c2-dfad-780e-4638-76b229f28731@linaro.org>
Date: Thu, 1 Dec 2022 23:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 21/50] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata
 <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>,
 Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-22-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221130230934.1014142-22-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_140020_710611_8D7381AA 
X-CRM114-Status: GOOD (  20.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8xMi8yMiAwMDowOSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBOb3cgdGhhdCBL
Vk0gbm8gbG9uZ2VyIHN1cHBvcnRzIHRyYXAtYW5kLWVtdWxhdGUgKHNlZSBjb21taXQgNDVjN2U4
YWY0YTVlCj4gIk1JUFM6IFJlbW92ZSBLVk1fVEUgc3VwcG9ydCIpLCBoYXJkY29kZSB0aGUgTUlQ
UyBjYWxsYmFja3MgdG8gdGhlCj4gdmlydHVhbGl6YXRpb24gY2FsbGJhY2tzLgo+IAo+IEhhcmNv
ZGluZyB0aGUgY2FsbGJhY2tzIGVsaW1pbmF0ZXMgdGhlIHRlY2huaWNhbGx5LXVubmVjZXNzYXJ5
IGNoZWNrIG9uCj4gbm9uLU5VTEwga3ZtX21pcHNfY2FsbGJhY2tzIGluIGt2bV9hcmNoX2luaXQo
KS4gIE1JUFMgaGFzIG5ldmVyIHN1cHBvcnRlZAo+IG11bHRpcGxlIGluLXRyZWUgbW9kdWxlcywg
aS5lLiBiYXJyaW5nIGFuIG91dC1vZi10cmVlIG1vZHVsZSwgd2hlcmUKPiBjb3B5aW5nIGFuZCBy
ZW5hbWluZyBrdm0ua28gY291bnRzIGFzICJvdXQtb2YtdHJlZSIsIEtWTSBjb3VsZCBuZXZlcgo+
IGVuY291bnRlciBhIG5vbi1OVUxMIHNldCBvZiBjYWxsYmFja3MgZHVyaW5nIG1vZHVsZSBpbml0
Lgo+IAo+IFRoZSBjYWxsYmFjayBjaGVjayBpcyBhbHNvIHN1YnRseSBicm9rZW4sIGFzIGl0IGlz
IG5vdCB0aHJlYWQgc2FmZSwKPiBpLmUuIGlmIHRoZXJlIHdlcmUgbXVsdGlwbGUgbW9kdWxlcywg
bG9hZGluZyBib3RoIGNvbmN1cnJlbnRseSB3b3VsZAo+IGNyZWF0ZSBhIHJhY2UgYmV0d2VlbiBj
aGVja2luZyBhbmQgc2V0dGluZyBrdm1fbWlwc19jYWxsYmFja3MuCj4gCj4gR2l2ZW4gdGhhdCBv
dXQtb2YtdHJlZSBzaGVuYW5pZ2FucyBhcmUgbm90IHRoZSBrZXJuZWwncyByZXNwb25zaWJpbGl0
eSwKPiBoYXJkY29kZSB0aGUgY2FsbGJhY2tzIHRvIHNpbXBsaWZ5IHRoZSBjb2RlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0t
LQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMiArLQo+ICAgYXJjaC9t
aXBzL2t2bS9NYWtlZmlsZSAgICAgICAgICAgfCAgMiArLQo+ICAgYXJjaC9taXBzL2t2bS9jYWxs
YmFjay5jICAgICAgICAgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9taXBzL2t2bS9taXBz
LmMgICAgICAgICAgICAgfCAgOSArKy0tLS0tLS0KPiAgIGFyY2gvbWlwcy9rdm0vdnouYyAgICAg
ICAgICAgICAgIHwgIDcgKysrKy0tLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDI2IGRlbGV0aW9ucygtKQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvbWlwcy9rdm0v
Y2FsbGJhY2suYwo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggMjhmMGJhOTdk
YjcxLi4yODAzYzljMjFlZjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKPiArKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC03
NTgsNyArNzU4LDcgQEAgc3RydWN0IGt2bV9taXBzX2NhbGxiYWNrcyB7Cj4gICAJdm9pZCAoKnZj
cHVfcmVlbnRlcikoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgIH07Cj4gICBleHRlcm4gc3Ry
dWN0IGt2bV9taXBzX2NhbGxiYWNrcyAqa3ZtX21pcHNfY2FsbGJhY2tzOwoKSUlVQyB3ZSBjb3Vs
ZCBldmVuIGNvbnN0aWZ5IHRoaXMgcG9pbnRlci4KCkFueXdheSwKUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvbWlwcy9rdm0vbWlwcy5jIGIvYXJjaC9taXBzL2t2bS9taXBzLmMKPiBpbmRleCBhZjI5NDkw
ZDk3NDAuLmYwYTZjMjQ1ZDFmZiAxMDA2NDQKPiAtLS0gYS9hcmNoL21pcHMva3ZtL21pcHMuYwo+
ICsrKyBiL2FyY2gvbWlwcy9rdm0vbWlwcy5jCj4gQEAgLTEwMTIsMTcgKzEwMTIsMTIgQEAgbG9u
ZyBrdm1fYXJjaF92bV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGlvY3Rs
LCB1bnNpZ25lZCBsb25nIGFyZykKPiAgIAo+ICAgaW50IGt2bV9hcmNoX2luaXQodm9pZCAqb3Bh
cXVlKQo+ICAgewo+IC0JaWYgKGt2bV9taXBzX2NhbGxiYWNrcykgewo+IC0JCWt2bV9lcnIoImt2
bTogbW9kdWxlIGFscmVhZHkgZXhpc3RzXG4iKTsKPiAtCQlyZXR1cm4gLUVFWElTVDsKPiAtCX0K
PiAtCj4gLQlyZXR1cm4ga3ZtX21pcHNfZW11bGF0aW9uX2luaXQoJmt2bV9taXBzX2NhbGxiYWNr
cyk7Cj4gKwlyZXR1cm4ga3ZtX21pcHNfZW11bGF0aW9uX2luaXQoKTsKPiAgIH0KPiAgIAo+ICAg
dm9pZCBrdm1fYXJjaF9leGl0KHZvaWQpCj4gICB7Cj4gLQlrdm1fbWlwc19jYWxsYmFja3MgPSBO
VUxMOwo+ICsKPiAgIH0KPiAgIAo+ICAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfZ2V0X3NyZWdz
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2t2bS92ei5j
IGIvYXJjaC9taXBzL2t2bS92ei5jCj4gaW5kZXggYzcwNmY1ODkwYTA1Li5kYWZhYjAwM2VhMGQg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL2t2bS92ei5jCj4gKysrIGIvYXJjaC9taXBzL2t2bS92
ei5jCj4gQEAgLTMzMDQsNyArMzMwNCwxMCBAQCBzdGF0aWMgc3RydWN0IGt2bV9taXBzX2NhbGxi
YWNrcyBrdm1fdnpfY2FsbGJhY2tzID0gewo+ICAgCS52Y3B1X3JlZW50ZXIgPSBrdm1fdnpfdmNw
dV9yZWVudGVyLAo+ICAgfTsKPiAgIAo+IC1pbnQga3ZtX21pcHNfZW11bGF0aW9uX2luaXQoc3Ry
dWN0IGt2bV9taXBzX2NhbGxiYWNrcyAqKmluc3RhbGxfY2FsbGJhY2tzKQo+ICsvKiBGSVhNRTog
R2V0IHJpZCBvZiB0aGUgY2FsbGJhY2tzIG5vdyB0aGF0IHRyYXAtYW5kLWVtdWxhdGUgaXMgZ29u
ZS4gKi8KPiArc3RydWN0IGt2bV9taXBzX2NhbGxiYWNrcyAqa3ZtX21pcHNfY2FsbGJhY2tzID0g
Jmt2bV92el9jYWxsYmFja3M7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
