Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DF9C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8buceUVxpk6jkhHM1417qOmfR3EXNxvaf2E1QbpkzI=; b=QBnkpN6JgWWTBs
	4lrzfXAFNshRYJvpfAUiWlDA10V8gQ6cna61AtTKNs4qWzvLz/Lxk/3GuZbBdjuWU3X9ZTeAPPQPq
	fhpJtzV7+2HgJIOk3ua7OBWUQ3AXp+YXQCmmp5dz0TA+/rmxqCww/urG2uNtAIgq+ccj7z2EGRk20
	HgIfhzKpiJWKrYYnze9TvgipaGQo+KTZhk9K37RPa2nSoOOQvr8rJ89Lz25yIF5GNt3DstG8WBKmS
	kWh4M7ylRi5+CuV+5/qgm513r42HqneT/MMcKzzy5i/FLnCMy3NdWd9pD+exL1mq9z16MuUbTmgm2
	panf55vj6hkITnCz5V6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFi1z-00FX7J-2R;
	Tue, 19 Dec 2023 21:53:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFi1w-00FX6P-0q
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 21:53:37 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cc7ba7d12eso18685501fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1703022814; x=1703627614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hz/U2VSJdAaxY/ib1h0wELKaoKa/2va1tfa/T+ld9zo=;
        b=S/Sm43+W6UH5RpNCLLWBeaN0eGrQt955slyiCT3WLIiEn1hs/6gan8l7bixlTxXC7N
         MK0PNfiCFWhlp/Nj3QYz4D1w3oAHqUGeH673QWdzhWJFUEUymA0+zIwJC3zEu0g9o8vq
         zGvaKO+YDLqW9JBAnvAiUzWjRGK7VXyOzypiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022814; x=1703627614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hz/U2VSJdAaxY/ib1h0wELKaoKa/2va1tfa/T+ld9zo=;
        b=MkmujvWjch8IwxLMpDVlVu6g0cR3LAr/mu0MtR2Mzj7FrkE1wTpA9+JpcBhy+QgjXj
         ysN1cohOTf0pIbnarXphTcpEl5x8mTeicp2YSL9sqDEwK41mYM9fSRNkhd+n6rlMxzjj
         rl2isiCDpAPXmW9WzpF2JrCpq0qEdsHEvaZLPANphR09yHBMpSdGA2dSbfHghq4/r4St
         tbC32zK+Bz0x2wTht0L7YK0BnXnmPyiTmUaLwhPw/xZ3Ac7EKBLEuWFLOrMM845NFPuC
         LWMATyfgB4COmZ0xiEqebPrMHcZ8I1CIRAHhGSSQ44szueL76b8FI+hWtMBcMqDWW46r
         9B5g==
X-Gm-Message-State: AOJu0YxAb04XsGemRC0iBvVD3RvoeUUptCjNiuipeuznMDZv5h0IBj2Q
	bxmL+RAewaqcIz37D01s9o0E2MoUOFcqstAtTV4p
X-Google-Smtp-Source: AGHT+IEBI/bpIQ97l43rPyGytCgY4JqCor6+evISM+YPjrCC06haZziIPngNt1u6GflI29QtDoc1RNL0LruJeUSt7h0=
X-Received: by 2002:a2e:a989:0:b0:2cc:8760:64db with SMTP id
 x9-20020a2ea989000000b002cc876064dbmr498888ljq.96.1703022814064; Tue, 19 Dec
 2023 13:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-25-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-25-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Dec 2023 13:53:22 -0800
Message-ID: <CAOnJCU+-Ocyc7JPz9Bo48fTke9s+XrW40K-NETCjCzDYbx_K5Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_135336_300057_1F1EFF0E 
X-CRM114-Status: GOOD (  13.79  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMjoxNuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gc2JpX2VjYWxsKCkgaXNuJ3QgdWNhbGwgc3BlY2lm
aWMgYW5kIGl0cyBwcm90b3R5cGUgaXMgYWxyZWFkeSBpbgo+IHByb2Nlc3Nvci5oLiBNb3ZlIGl0
cyBpbXBsZW1lbnRhdGlvbiB0byBwcm9jZXNzb3IuYy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIC4uLi9zZWxmdGVzdHMv
a3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysK
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jIHwgMjYgLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDI2
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGli
L3Jpc2N2L3Byb2Nlc3Nvci5jCj4gaW5kZXggNmMyNWY3ODQzZWY0Li42OTA1YTQzNDgzODAgMTAw
NjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNz
b3IuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vz
c29yLmMKPiBAQCAtMzY3LDMgKzM2NywyOSBAQCB2b2lkIHZjcHVfYXJnc19zZXQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgbnVtLCAuLi4pCj4gIHZvaWQgYXNzZXJ0X29uX3Vu
aGFuZGxlZF9leGNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gIH0KPiArCj4g
K3N0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVuc2lnbmVkIGxvbmcg
YXJnMCwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzEsIHVuc2ln
bmVkIGxvbmcgYXJnMiwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFy
ZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIGFyZzUpCj4gK3sKPiArICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhMCBhc20gKCJh
MCIpID0gKHVpbnRwdHJfdCkoYXJnMCk7Cj4gKyAgICAgICByZWdpc3RlciB1aW50cHRyX3QgYTEg
YXNtICgiYTEiKSA9ICh1aW50cHRyX3QpKGFyZzEpOwo+ICsgICAgICAgcmVnaXN0ZXIgdWludHB0
cl90IGEyIGFzbSAoImEyIikgPSAodWludHB0cl90KShhcmcyKTsKPiArICAgICAgIHJlZ2lzdGVy
IHVpbnRwdHJfdCBhMyBhc20gKCJhMyIpID0gKHVpbnRwdHJfdCkoYXJnMyk7Cj4gKyAgICAgICBy
ZWdpc3RlciB1aW50cHRyX3QgYTQgYXNtICgiYTQiKSA9ICh1aW50cHRyX3QpKGFyZzQpOwo+ICsg
ICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGE1IGFzbSAoImE1IikgPSAodWludHB0cl90KShhcmc1
KTsKPiArICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhNiBhc20gKCJhNiIpID0gKHVpbnRwdHJf
dCkoZmlkKTsKPiArICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhNyBhc20gKCJhNyIpID0gKHVp
bnRwdHJfdCkoZXh0KTsKPiArICAgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+ICsKPiArICAgICAg
IGFzbSB2b2xhdGlsZSAoCj4gKyAgICAgICAgICAgICAgICJlY2FsbCIKPiArICAgICAgICAgICAg
ICAgOiAiK3IiIChhMCksICIrciIgKGExKQo+ICsgICAgICAgICAgICAgICA6ICJyIiAoYTIpLCAi
ciIgKGEzKSwgInIiIChhNCksICJyIiAoYTUpLCAiciIgKGE2KSwgInIiIChhNykKPiArICAgICAg
ICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKyAgICAgICByZXQuZXJyb3IgPSBhMDsKPiArICAgICAg
IHJldC52YWx1ZSA9IGExOwo+ICsKPiArICAgICAgIHJldHVybiByZXQ7Cj4gK30KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jCj4gaW5kZXggZmU2ZDEw
MDRmMDE4Li4xNGVlMTcxNTFhNTkgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2xpYi9yaXNjdi91Y2FsbC5jCj4gQEAgLTEwLDMyICsxMCw2IEBACj4gICNpbmNsdWRlICJr
dm1fdXRpbC5oIgo+ICAjaW5jbHVkZSAicHJvY2Vzc29yLmgiCj4KPiAtc3RydWN0IHNiaXJldCBz
YmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWduZWQgbG9uZyBhcmcwLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnMSwgdW5zaWduZWQgbG9uZyBhcmcyLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnMywgdW5zaWduZWQgbG9u
ZyBhcmc0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnNSkKPiAt
ewo+IC0gICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGEwIGFzbSAoImEwIikgPSAodWludHB0cl90
KShhcmcwKTsKPiAtICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhMSBhc20gKCJhMSIpID0gKHVp
bnRwdHJfdCkoYXJnMSk7Cj4gLSAgICAgICByZWdpc3RlciB1aW50cHRyX3QgYTIgYXNtICgiYTIi
KSA9ICh1aW50cHRyX3QpKGFyZzIpOwo+IC0gICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGEzIGFz
bSAoImEzIikgPSAodWludHB0cl90KShhcmczKTsKPiAtICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJf
dCBhNCBhc20gKCJhNCIpID0gKHVpbnRwdHJfdCkoYXJnNCk7Cj4gLSAgICAgICByZWdpc3RlciB1
aW50cHRyX3QgYTUgYXNtICgiYTUiKSA9ICh1aW50cHRyX3QpKGFyZzUpOwo+IC0gICAgICAgcmVn
aXN0ZXIgdWludHB0cl90IGE2IGFzbSAoImE2IikgPSAodWludHB0cl90KShmaWQpOwo+IC0gICAg
ICAgcmVnaXN0ZXIgdWludHB0cl90IGE3IGFzbSAoImE3IikgPSAodWludHB0cl90KShleHQpOwo+
IC0gICAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gLQo+IC0gICAgICAgYXNtIHZvbGF0aWxlICgK
PiAtICAgICAgICAgICAgICAgImVjYWxsIgo+IC0gICAgICAgICAgICAgICA6ICIrciIgKGEwKSwg
IityIiAoYTEpCj4gLSAgICAgICAgICAgICAgIDogInIiIChhMiksICJyIiAoYTMpLCAiciIgKGE0
KSwgInIiIChhNSksICJyIiAoYTYpLCAiciIgKGE3KQo+IC0gICAgICAgICAgICAgICA6ICJtZW1v
cnkiKTsKPiAtICAgICAgIHJldC5lcnJvciA9IGEwOwo+IC0gICAgICAgcmV0LnZhbHVlID0gYTE7
Cj4gLQo+IC0gICAgICAgcmV0dXJuIHJldDsKPiAtfQo+IC0KPiAgdm9pZCAqdWNhbGxfYXJjaF9n
ZXRfdWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3Zt
X3J1biAqcnVuID0gdmNwdS0+cnVuOwo+IC0tCj4gMi40My4wCj4KCgpSZXZpZXdlZC1ieTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
