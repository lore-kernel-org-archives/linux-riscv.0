Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482D4EB64DB
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bOzK35iH3NBSVWHb/b5bpGVv3kodxYnWqxTCIp/JLM=; b=MitvNjVZjyPVaM
	9wGUDhmoR3Dr1OZ1mJexZDBJp001LLdI8n9cf+npA3MMyH0miqR1zaPfi2k0pipgXu1pf4zB99FHW
	dbPO1Gk2hBjhMzHJSvOSHBnv188aVRVxiZMB/p3YOJiZ3gA+JaLUZp7PjKJwRNVeDDXz6Phvfoym+
	HRTMC2clCVM3WFyC4c1z0qz5XQc6XDuFQn+DtwQiliMiiFw2hSEYameFidIsH+cbIdDoJNUw4uIiQ
	T/M6oTOUFSwvLKbygqfaohapQQdL3XYyFIiYDaAHxjoeksdCqEe2LyMQEQwZi5jXfxhLl+aXwgtK5
	StUU4k60RUPDmMeQkB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA3zI-00HA8X-0N;
	Fri, 16 Jun 2023 07:35:16 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA3zE-00HA79-2B
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 07:35:14 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so418837e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686900910; x=1689492910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1j80AwpMkKggqs8JmwcVb7r4+TSqY0M2+PEoCgbGaQ=;
        b=n0rkyQFpCrFkjxi0k33DMxWY76a+6oC/tXuVgF+FlA8I0dNziZl/JDIpP2nnqsZYdY
         l0JOGFvRuH2bjtBD97WxDf5ULr8yVdelWn4de0sZZWAZhLhdoXIWFBpicP5sznM4mZ1m
         kE49OQ06Briwnh2HhBWzThEXw4wIo9O2nRZrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686900910; x=1689492910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1j80AwpMkKggqs8JmwcVb7r4+TSqY0M2+PEoCgbGaQ=;
        b=b3qrbRtJ9LGw7cvs8TiVPT08I1zvmSPbGw8eHIbBeKrVBi6AGFcUwVyKMfIllcNkyn
         ent+JtUUv1Q0chsXmNCFBkKZAAFxuQAtIrASF/eB5s9ObSUiq+Fvpplt+EE57mgoG5KC
         Q5nPxStVQlBwur0C4hInmCYW2n0awYvDUvAs85SMkpZ2SHSA2sP700sRvEYkNYBcd8cY
         U7yDYwZeTM+MkbWo4qFMUfACrj7em3Y1kLLKzildC13vucU0jTmcKv1m0GXLODN03wNP
         vjMYs5jpTzxuc/2LT4EpU9Jt+BuAY9QN6+X4lU0hiWI2qDV9g4tniJIkxDgM1dwSzJWR
         LPqw==
X-Gm-Message-State: AC+VfDweGGkw5o9tiNA28Ny4JrLxK4CKprvuue7bdq9MReLxK221OjCW
	nKCDLTXNRiFTjdh6yGhUp3FJwQmj5nL9rKs1kIsY
X-Google-Smtp-Source: ACHHUZ43YpdHWcjr24UbBiPB5GuakeWk8t7eRVinOjbsCz7rlcDmqcSVxsPDNZRIG096Z8PlRx7m8GYC/NTB/4nDBSA=
X-Received: by 2002:a2e:980a:0:b0:2b3:356c:94d6 with SMTP id
 a10-20020a2e980a000000b002b3356c94d6mr888795ljj.16.1686900910233; Fri, 16 Jun
 2023 00:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230615073353.85435-1-apatel@ventanamicro.com> <20230615073353.85435-9-apatel@ventanamicro.com>
In-Reply-To: <20230615073353.85435-9-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 16 Jun 2023 00:34:58 -0700
Message-ID: <CAOnJCUJG9ewVvFP7H+6++m0x=Mkc5RLMnBTdiSvcu61vZSvapw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] RISC-V: KVM: Expose APLIC registers as
 attributes of AIA irqchip
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_003512_719780_5529EA82 
X-CRM114-Status: GOOD (  19.96  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTI6MzTigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXZSBleHBvc2UgQVBMSUMgcmVnaXN0ZXJzIGFzIEtW
TSBkZXZpY2UgYXR0cmlidXRlcyBvZiB0aGUgaW4ta2VybmVsCj4gQUlBIGlycWNoaXAgZGV2aWNl
LiBUaGlzIHdpbGwgYWxsb3cgS1ZNIHVzZXItc3BhY2UgdG8gc2F2ZS9yZXN0b3JlCj4gQVBMSUMg
c3RhdGUgdXNpbmcgS1ZNIGRldmljZSBpb2N0bHMoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9haWEuaCAgfCAgMyArKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oIHwgIDYgKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgICAgICAgIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9haWFf
ZGV2aWNlLmMgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA3NyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fYWlhLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaAo+IGluZGV4IGY2
YmQ4NTIzMzk1Zi4uYmE5MzljMDA1NGFhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2FpYS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmgK
PiBAQCAtMTI5LDYgKzEyOSw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fcmlzY3ZfdmNwdV9h
aWFfaW1zaWNfY2xlYW51cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgfQo+Cj4gK2lu
dCBrdm1fcmlzY3ZfYWlhX2FwbGljX3NldF9hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQg
bG9uZyB0eXBlLCB1MzIgdik7Cj4gK2ludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2dldF9hdHRyKHN0
cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlLCB1MzIgKnYpOwo+ICtpbnQga3ZtX3Jp
c2N2X2FpYV9hcGxpY19oYXNfYXR0cihzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlw
ZSk7Cj4gIGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2luamVjdChzdHJ1Y3Qga3ZtICprdm0sIHUz
MiBzb3VyY2UsIGJvb2wgbGV2ZWwpOwo+ICBpbnQga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbml0KHN0
cnVjdCBrdm0gKmt2bSk7Cj4gIHZvaWQga3ZtX3Jpc2N2X2FpYV9hcGxpY19jbGVhbnVwKHN0cnVj
dCBrdm0gKmt2bSk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+IGluZGV4IDA0N2M4ZmM1
YmQ3MS4uOWVkODIyZmM1NTg5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9rdm0uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+IEBA
IC0yNDksNiArMjQ5LDEyIEBAIGVudW0gS1ZNX1JJU0NWX1NCSV9FWFRfSUQgewo+ICAjZGVmaW5l
IEtWTV9ERVZfUklTQ1ZfQUlBX0dSUF9DVFJMICAgICAgICAgICAgIDIKPiAgI2RlZmluZSBLVk1f
REVWX1JJU0NWX0FJQV9DVFJMX0lOSVQgICAgICAgICAgICAwCj4KPiArLyoKPiArICogVGhlIGRl
dmljZSBhdHRyaWJ1dGUgdHlwZSBjb250YWlucyB0aGUgbWVtb3J5IG1hcHBlZCBvZmZzZXQgb2Yg
dGhlCj4gKyAqIEFQTElDIHJlZ2lzdGVyIChyYW5nZSAweDAwMDAtMHgzRkZGKSBhbmQgaXQgbXVz
dCBiZSA0LWJ5dGUgYWxpZ25lZC4KPiArICovCj4gKyNkZWZpbmUgS1ZNX0RFVl9SSVNDVl9BSUFf
R1JQX0FQTElDICAgICAgICAgICAgMwo+ICsKPiAgLyogT25lIHNpbmdsZSBLVk0gaXJxY2hpcCwg
aWUuIHRoZSBBSUEgKi8KPiAgI2RlZmluZSBLVk1fTlJfSVJRQ0hJUFMgICAgICAgICAgICAgICAg
ICAgICAgICAxCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgYi9h
cmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+IGluZGV4IGVlY2Q4ZjRhYmUyMS4uMzllNzJhYTAx
NmE0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiBAQCAtNTAxLDYgKzUwMSw0OSBAQCBzdGF0aWMgc3Ry
dWN0IGt2bV9pb19kZXZpY2Vfb3BzIGFwbGljX2lvZG9ldl9vcHMgPSB7Cj4gICAgICAgICAud3Jp
dGUgPSBhcGxpY19tbWlvX3dyaXRlLAo+ICB9Owo+Cj4gK2ludCBrdm1fcmlzY3ZfYWlhX2FwbGlj
X3NldF9hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlLCB1MzIgdikKPiAr
ewo+ICsgICAgICAgaW50IHJjOwo+ICsKPiArICAgICAgIGlmICgha3ZtLT5hcmNoLmFpYS5hcGxp
Y19zdGF0ZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICsgICAgICAg
cmMgPSBhcGxpY19tbWlvX3dyaXRlX29mZnNldChrdm0sIHR5cGUsIHYpOwo+ICsgICAgICAgaWYg
KHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7
Cj4gK30KPiArCj4gK2ludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2dldF9hdHRyKHN0cnVjdCBrdm0g
Kmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlLCB1MzIgKnYpCj4gK3sKPiArICAgICAgIGludCByYzsK
PiArCj4gKyAgICAgICBpZiAoIWt2bS0+YXJjaC5haWEuYXBsaWNfc3RhdGUpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsKPiArICAgICAgIHJjID0gYXBsaWNfbW1pb19yZWFk
X29mZnNldChrdm0sIHR5cGUsIHYpOwo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK2ludCBrdm1f
cmlzY3ZfYWlhX2FwbGljX2hhc19hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0
eXBlKQo+ICt7Cj4gKyAgICAgICBpbnQgcmM7Cj4gKyAgICAgICB1MzIgdmFsOwo+ICsKPiArICAg
ICAgIGlmICgha3ZtLT5hcmNoLmFpYS5hcGxpY19zdGF0ZSkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9ERVY7Cj4gKwo+ICsgICAgICAgcmMgPSBhcGxpY19tbWlvX3JlYWRfb2Zmc2V0KGt2
bSwgdHlwZSwgJnZhbCk7Cj4gKyAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biByYzsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgaW50IGt2bV9yaXNjdl9h
aWFfYXBsaWNfaW5pdChzdHJ1Y3Qga3ZtICprdm0pCj4gIHsKPiAgICAgICAgIGludCBpLCByZXQg
PSAwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jp
c2N2L2t2bS9haWFfZGV2aWNlLmMKPiBpbmRleCA3YWI1NTUxMjE4NzIuLmM2NDlhZDZlOGUwYSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS9haWFfZGV2aWNlLmMKPiBAQCAtMzY1LDYgKzM2NSwxNSBAQCBzdGF0aWMgaW50IGFp
YV9zZXRfYXR0cihzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga3ZtX2RldmljZV9hdHRy
ICphdHRyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAg
ICB9Cj4KPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEtWTV9ERVZfUklT
Q1ZfQUlBX0dSUF9BUExJQzoKPiArICAgICAgICAgICAgICAgaWYgKGNvcHlfZnJvbV91c2VyKCZu
ciwgdWFkZHIsIHNpemVvZihucikpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAt
RUZBVUxUOwo+ICsKPiArICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygmZGV2LT5rdm0tPmxvY2sp
Owo+ICsgICAgICAgICAgICAgICByID0ga3ZtX3Jpc2N2X2FpYV9hcGxpY19zZXRfYXR0cihkZXYt
Pmt2bSwgdHlwZSwgbnIpOwo+ICsgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRldi0+a3Zt
LT5sb2NrKTsKPiArCj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgfQo+Cj4gQEAg
LTQxMiw2ICs0MjEsMjAgQEAgc3RhdGljIGludCBhaWFfZ2V0X2F0dHIoc3RydWN0IGt2bV9kZXZp
Y2UgKmRldiwgc3RydWN0IGt2bV9kZXZpY2VfYXR0ciAqYXR0cikKPiAgICAgICAgICAgICAgICAg
aWYgKGNvcHlfdG9fdXNlcih1YWRkciwgJmFkZHIsIHNpemVvZihhZGRyKSkpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4KPiArICAgICAgICAgICAgICAgYnJlYWs7
Cj4gKyAgICAgICBjYXNlIEtWTV9ERVZfUklTQ1ZfQUlBX0dSUF9BUExJQzoKPiArICAgICAgICAg
ICAgICAgaWYgKGNvcHlfZnJvbV91c2VyKCZuciwgdWFkZHIsIHNpemVvZihucikpKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsKPiArICAgICAgICAgICAgICAg
bXV0ZXhfbG9jaygmZGV2LT5rdm0tPmxvY2spOwo+ICsgICAgICAgICAgICAgICByID0ga3ZtX3Jp
c2N2X2FpYV9hcGxpY19nZXRfYXR0cihkZXYtPmt2bSwgdHlwZSwgJm5yKTsKPiArICAgICAgICAg
ICAgICAgbXV0ZXhfdW5sb2NrKCZkZXYtPmt2bS0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIGlm
IChyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByOwo+ICsKPiArICAgICAgICAg
ICAgICAgaWYgKGNvcHlfdG9fdXNlcih1YWRkciwgJm5yLCBzaXplb2YobnIpKSkKPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiArCj4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgfQo+Cj4gQEAgLTQ0OCw2ICs0NzEsOCBAQCBzdGF0aWMgaW50IGFpYV9o
YXNfYXR0cihzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga3ZtX2RldmljZV9hdHRyICph
dHRyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgICAgICAg
ICB9Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBLVk1fREVWX1JJU0NW
X0FJQV9HUlBfQVBMSUM6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBrdm1fcmlzY3ZfYWlhX2Fw
bGljX2hhc19hdHRyKGRldi0+a3ZtLCBhdHRyLT5hdHRyKTsKPiAgICAgICAgIH0KPgo+ICAgICAg
ICAgcmV0dXJuIC1FTlhJTzsKPiAtLQo+IDIuMzQuMQo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBh
dHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
