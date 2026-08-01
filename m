Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0263DC54FCD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxRKTeXe/aPlR+tLxy6EQoPmqLlIh8pkfyaYKKXnahQ=; b=rx/hqKA+CzZrda
	hlGtBp3qkqQierrmmPuWbaKtb1gr8KVVKJ3pKSqTU4ImSuS/6oyPV/zfGjNSPCUqF7r93zSvWjAiu
	M3r448jp13sVSAF/X6ANrhyu/l4wLDrrsXNoXF2azwyCEDI/dGZAb7Noi8mzAzO9tdRH3VCbQORBe
	/90T3NNV/3jhiZlYzao1QnoAJk18iiwMA/L72nCD3luQINHDBsDvtCuomugXky5pN+Juv059qHidO
	1Ts3DI9X+klkXQvMvcUuhvCCZ3N/DJ7nZ8nfWPSu00JTQQu4GGJaDB+SSiOOFxHnmHpsJUefKh+EM
	6XavcZBg9aQz5GHj0phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Bu-0000000E3VW-3ZWf;
	Sat, 01 Aug 2026 08:35:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Bs-0000000E3UA-0l6J
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:35:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1826299f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573330; cv=none;
        d=google.com; s=arc-20260327;
        b=JUav13S5cfSdw2N07OEAWRTVZl9kgke+slViyQ30AEpyl+7POJY4BFMu2h/Q/Eq0q3
         q2wwZsYKEwG1K99FCGov7aiSY1TbdY8F1Dawn86T2T0XCS6DqGb5eFra6YVl6akolBaG
         m3uFJOMLtKrhaPTQKdxHk69wiB9cdNgMRhfr6RS1C6BrZRNYQUZZrxw2xPfqQnYW6PuE
         SYpcUZmGJkdMpReNJq10aHbqGqJZl0949pHGfhm6S4B/8xEh03TED72O95fMPkjnNruP
         s3XCnqpFGrh5HFoLes11/lTFd6j4kPwJ72drzFf7Vfu0FwpLPxhSI/yJ8kuOeHZLKFxY
         xevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUTf6pJUeP1uJ/800+RmRcBQOzqOSOy6aUpAs+g0B94=;
        fh=aAo67SybEMkOgv/VibwU6xsMcNsMiA3bDUR7EHoHfJE=;
        b=Tcx+M0AO7t1Eb0QHbEYoJ84NoyueKinHdKC8tHQYFGh09G4nM3E/zixMDEP/eAZ2as
         F8yWHTrVFqzC6+X5PgeU3FhpApJq/J4gf/O2L8Mk0DfFeq9aCk+kpi44fe84yHRfLb7g
         /ULeYHIdRMqQ7/s2cdtXJ5lf4CMPHaC5eJzPgCYE3DENn8ebuo/uDkg40TuU0DnGn7zA
         mR4CYPAIPdy81L8NbVnuCMyoX4ncn0RtVHZn2zrmWXapv4CSrd+aRp1XxftOWTGyNtNY
         N2fjjBjm7JWUCNvj2MNXqp1HDuENr3XJEILnb0QCCRnYBgMcvikQg5vJbgLUvh4LiWdD
         oevg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573330; x=1786178130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUTf6pJUeP1uJ/800+RmRcBQOzqOSOy6aUpAs+g0B94=;
        b=oVpTzg27Tmt7yILWfQSoRwsG++SsmH3FQih6E/J42V0r/fVNr4QlolNKff5ZSxecnH
         FTmczj//hx02doA6h1UWR1dNkuT+X2TMcww/oIyiYq0MseqYFiBr628yAoeI4hu2gBB6
         33JIKllAkKjf6w6Ccm3U/fhHN/s8uCtpSHYrzJKGvj9jQimRwR5i7++yO+Dt8tvM6vzL
         7+nWT5sVX02KUoJ61LpAOhgdk+Zf+6CWP4YnvWxShLRjLMAu9yyY81CRhs9Sg01mUpxD
         iZrq++S4264FwvQjTW54VDdNlMslqIRDqXFdlp6yIyVF+nGHneT4e0oGzbiXnz2Bw3ir
         YmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573330; x=1786178130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUTf6pJUeP1uJ/800+RmRcBQOzqOSOy6aUpAs+g0B94=;
        b=JbaXK/Qh/rVWOASMXslK9duq1oaMouFXKZ0oK8Lxudvd+faat7S0c4eJcDKe6cWxBq
         RI7ZIsyuJJ0gHIVfqCj/D0DQBhBRYxbICpgqLZaLX5akhARbRJ/jYFgOUoVEEY0rIhWX
         j1k2DKv8AgC5pmiDCz6FjMDToAv3dZaKrCxDuy/4Nc7/lzwz3VNBFD2ZTYDJhgXQ6Mf3
         9RstLzEvifihFmDDY28kvI20n33t1+AsZcGXG3ygAWM7wcEJ+MbKEpKFV7eqM+sb7zJE
         uZ1n3+0LgwSEjovPtfq+njUfmA3tp8l+aFbU5dXgXeYAW0mbou5c390TTEw1Stv+Gc5p
         o4pw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8FnOkHaFnHfGrg5pUGMuioYZ8QnO/IR0a+ndF1A8F8L0YKgUYE282jki5T8LGLz4Paq3MtQe+cKvTag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpAzyVyQBs2MRYyioANebXG7vik1qDmEK+8m+Ftk02l8KB4wWa
	3t6XhCtRuqfENhoWA0qVQ/D4Dla3buye6AnrdOd0AMQJzXMRkVj2BNY29T4Da4oivUlIYh5dIC/
	bOsMUKCExzQ2T5eDluZTUYdto/vD+b2qxIrBDAo265g==
X-Gm-Gg: AR+sD12obXR/oUOG01mt7BmgyDzbddauOBlmD08RegTOGk4vQpqnCQ7dKdYW18GOitq
	q9tLoDICO/SXh+nJgy4kEFj3TPQF7px+BaJi/Q6/CEY6AwyVCkOGCZQTJploj1alKrpEtOvatnw
	mep/w51ff047mj6nuZzA5tJq8WNw4mXJ5hAneBvQJoalDQIBH0lJLa8oIwNyAaEcXZxN2OrJUsg
	WagrN/aqigMemosV5fkse+iP5niBJf615XzlOrybXQM3mSNaTNX5DlEvmZ7IXraymc19jDR6TUK
	/feAklqbEkFCb9noF2o69AJ6/iO3RuXH0Z+OoJdi7+WKpWErtC17l7NLERt5fvM2VvAVYfwmEa7
	YunAG9m9jMDQCSzeH1qV3gUSNkf4scru+9tznm2Z/ujNJpjNpLhMyHpgf3wHMqJi0LCLGJjCSxl
	ZV
X-Received: by 2002:a05:6000:1846:b0:47f:6e8b:699c with SMTP id
 ffacd0b85a97d-47fd729208fmr5228759f8f.14.1785573330190; Sat, 01 Aug 2026
 01:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn> <20260731093833.1551341-3-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731093833.1551341-3-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:18 +0530
X-Gm-Features: AUfX_mxVZMTqUYg5I25kzku9hNu-Y6ngd-XdOTNy6Xs3S7Apun6Etlayif9FnM8
Message-ID: <CAAhSdy1r=wfR3j5da2DtyiitNi6S5EOrRAh6Nv6kMqZDBpMMhg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: Introduce make_xfence_request_nodata
 for FENCE.I requests
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013532_253681_829F4904 
X-CRM114-Status: GOOD (  19.39  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMzoxMuKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IEZFTkNFLkkgZG9lcyBub3QgbmVlZCBoZmVuY2Ug
ZGF0YSwgYnV0IGl0IGN1cnJlbnRseSBnb2VzIHRocm91Z2ggdGhlCj4gZ2VuZXJpYyBtYWtlX3hm
ZW5jZV9yZXF1ZXN0KCkgcGF0aCB3aXRoIE5VTEwgZGF0YSwgaW5jdXJyaW5nIHVubmVjZXNzYXJ5
Cj4gcGVyLVZDUFUgY2hlY2tzLgo+Cj4gU3BsaXQgb3V0IGEgc2VwYXJhdGUgbWFrZV94ZmVuY2Vf
cmVxdWVzdF9ub2RhdGEoKSBmdW5jdGlvbiB0byBoYW5kbGUKPiBGRU5DRS5JIGRpcmVjdGx5LCBh
bmQgbW92ZSB0aGUgZGF0YSB2YWxpZGl0eSBjaGVjayB0byB0aGUgdG9wIG9mIHRoZQo+IGdlbmVy
aWMgZnVuY3Rpb24gdG8gYXZvaWQgcmVkdW5kYW50IGNoZWNrcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS90bGIuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdGxiLmMgYi9hcmNoL3Jpc2N2L2t2
bS90bGIuYwo+IGluZGV4IGM1NDUyMmRlY2FhNjQuLmZkNDQ1ZTlmYTNmOTQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS90bGIuYwo+IEBA
IC0zMjUsNiArMzI1LDI5IEBAIHZvaWQga3ZtX3Jpc2N2X2hmZW5jZV9wcm9jZXNzKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIH0KPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIG1ha2VfeGZl
bmNlX3JlcXVlc3Rfbm9kYXRhKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyBoYmFzZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGht
YXNrLCB1bnNpZ25lZCBpbnQgcmVxKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGk7Cj4g
KyAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7Cj4gKyAgICAgICBERUNMQVJFX0JJVE1BUCh2
Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICsKPiArICAgICAgIGJpdG1hcF96ZXJvKHZjcHVf
bWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1
LCBrdm0pIHsKPiArICAgICAgICAgICAgICAgaWYgKGhiYXNlICE9IC0xVUwpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAodmNwdS0+dmNwdV9pZCA8IGhiYXNlIHx8Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2Y3B1LT52Y3B1X2lkID49IGhiYXNlICsgQklUU19QRVJf
TE9ORykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlmICghKGhtYXNrICYgKDFVTCA8PCAodmNwdS0+dmNwdV9pZCAt
IGhiYXNlKSkpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
KyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGJpdG1hcF9zZXQodmNwdV9t
YXNrLCBpLCAxKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBrdm1fbWFrZV92Y3B1c19yZXF1
ZXN0X21hc2soa3ZtLCByZXEsIHZjcHVfbWFzayk7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG1h
a2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBoYmFzZSwgdW5zaWduZWQgbG9uZyBobWFzaywKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZXEsIHVuc2lnbmVk
IGludCBmYWxsYmFja19yZXEsCj4gQEAgLTMzNSw2ICszNTgsOSBAQCBzdGF0aWMgdm9pZCBtYWtl
X3hmZW5jZV9yZXF1ZXN0KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgIERFQ0xBUkVfQklUTUFQ
KHJlcV92Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICAgICAgICAgREVDTEFSRV9CSVRNQVAo
ZmFsbGJhY2tfcmVxX3ZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4KPiArICAgICAgIGlmICgh
ZGF0YSB8fCAhZGF0YS0+dHlwZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAg
ICAgIGJpdG1hcF96ZXJvKHJlcV92Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICAgICAgICAg
Yml0bWFwX3plcm8oZmFsbGJhY2tfcmVxX3ZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gICAg
ICAgICBrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0pIHsKPiBAQCAtMzQ2LDExICszNzIs
NiBAQCBzdGF0aWMgdm9pZCBtYWtlX3hmZW5jZV9yZXF1ZXN0KHN0cnVjdCBrdm0gKmt2bSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAg
ICB9Cj4KPiAtICAgICAgICAgICAgICAgaWYgKCFkYXRhIHx8ICFkYXRhLT50eXBlKSB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgYml0bWFwX3NldChyZXFfdmNwdV9tYXNrLCBpLCAxKTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAtICAgICAgICAgICAgICAgfQo+IC0K
PiAgICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogRW5xdWV1ZSBoZmVuY2Ug
ZGF0YSB0byBWQ1BVIGhmZW5jZSBxdWV1ZS4gSWYgd2UgZG9uJ3QKPiAgICAgICAgICAgICAgICAg
ICogaGF2ZSBzcGFjZSBpbiB0aGUgVkNQVSBoZmVuY2UgcXVldWUgdGhlbiBmYWxsYmFjayB0bwo+
IEBAIC0zNjksOCArMzkwLDcgQEAgc3RhdGljIHZvaWQgbWFrZV94ZmVuY2VfcmVxdWVzdChzdHJ1
Y3Qga3ZtICprdm0sCj4gIHZvaWQga3ZtX3Jpc2N2X2ZlbmNlX2koc3RydWN0IGt2bSAqa3ZtLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBoYmFzZSwgdW5zaWduZWQgbG9u
ZyBobWFzaykKPiAgewo+IC0gICAgICAgbWFrZV94ZmVuY2VfcmVxdWVzdChrdm0sIGhiYXNlLCBo
bWFzaywgS1ZNX1JFUV9GRU5DRV9JLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1f
UkVRX0ZFTkNFX0ksIE5VTEwpOwo+ICsgICAgICAgbWFrZV94ZmVuY2VfcmVxdWVzdF9ub2RhdGEo
a3ZtLCBoYmFzZSwgaG1hc2ssIEtWTV9SRVFfRkVOQ0VfSSk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9y
aXNjdl9oZmVuY2VfZ3ZtYV92bWlkX2dwYShzdHJ1Y3Qga3ZtICprdm0sCj4gLS0KPiAyLjM5LjMK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
