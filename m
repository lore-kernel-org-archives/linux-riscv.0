Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9167C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 05:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvKLUKyPvw1NdjB8yHuY/lKr3aAwv0NNdYdBATii6kM=; b=psmazeWus/SwPQ
	urtS/6HMgKeEHnyOA56UHvDUWszPvPTNVzYqD2Q1RIIG3E45Vya5JpYIZlCAbwxqrVI5gIRAcCuqu
	PU+QXGyUbNsMM5ijlXAOuHGNQKTdpW0j3KMdm9OLAOjVty2dMmmnOh1A+0BRRIR0bd+831fz60dWs
	/nZTMz+XpMMUWHCcH7OatK/za6+yr2My62WH5QT/ukBHeABwYRRf92bxXViPZHqViV2AqURkR5Nqh
	e+qGxAO2zfH+CEBrfLEgt2AIlPrKj4MFOaY5xDQA1ZkhLnzDmh1vIFT50q7KPRzDOYqm3gIPD/4LG
	URr/6deRqzvfDdiJ0Dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0c1E-004r2C-BR; Thu, 01 Dec 2022 05:21:56 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0c12-004qxX-Sa; Thu, 01 Dec 2022 05:21:46 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NN4Dq6Zmxz4x1V;
	Thu,  1 Dec 2022 16:21:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669872096;
	bh=N0orzYmQiDoqaJ7NYGjlM3UnNxlX/cknbPTGfPB6WFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J5OxG6kIMoR1klHiq+pJUaSgDwQrXyp2IQVExgmmPNs6d5M2zalc/rFARJpzB6LCF
	 mIrvgM+Yk6zmcYrbL1HL6byl4gygucjhaR6xhicDvgiER8ov5k6cvGvblLKfkLL79G
	 Qr4K7TgrY7ozLHH4Rz1BcWO+Y6BxcTIrY8j51NIdM6oHGO3QrlQNIe919bNypOKqe4
	 YHuJsYYV/nFeRurQTMfOCln/DE+Mz3BkBkR/vDvI86w1ePXtODUCbkiSWEC3PK7pVj
	 7hgwt5pYqLFahDmf67Gs9PQJ8p24LtR4/LQuAP00TNjl2lawnoAD2XkoV81D7xf9C5
	 T4FWO6qMAX8YQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Sean
 Christopherson <seanjc@google.com>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant
 <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra
 <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Yuan Yao
 <yuan.yao@intel.com>, Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata
 <isaku.yamahata@intel.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, Kai Huang <kai.huang@intel.com>,
 Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check
 to module init
In-Reply-To: <20221130230934.1014142-27-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-27-seanjc@google.com>
Date: Thu, 01 Dec 2022 16:21:31 +1100
Message-ID: <87cz93snqc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_212145_276530_FC5B763A 
X-CRM114-Status: GOOD (  17.92  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKPiBNb3ZlIEtW
TSBQUEMncyBjb21wYXRpYmlsaXR5IGNoZWNrcyB0byB0aGVpciByZXNwZWN0aXZlIG1vZHVsZV9p
bml0KCkKPiBob29rcywgdGhlcmUncyBubyBuZWVkIHRvIHdhaXQgdW50aWwgS1ZNJ3MgY29tbW9u
IGNvbXBhdCBjaGVjaywgbm9yIGlzCj4gdGhlcmUgYSBuZWVkIHRvIHBlcmZvcm0gdGhlIGNoZWNr
IG9uIGV2ZXJ5IENQVSAocHJvdmlkZWQgYnkgY29tbW9uIEtWTSdzCj4gaG9vayksIGFzIHRoZSBj
b21wYXRpYmlsaXR5IGNoZWNrcyBvcGVyYXRlIG9uIGdsb2JhbCBkYXRhLgo+Cj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vY3B1dGFibGUuaDogZXh0ZXJuIHN0cnVjdCBjcHVfc3BlYyAqY3Vy
X2NwdV9zcGVjOwo+ICAgYXJjaC9wb3dlcnBjL2t2bS9ib29rM3MuYzogcmV0dXJuIDAKPiAgIGFy
Y2gvcG93ZXJwYy9rdm0vZTUwMC5jOiBzdHJjbXAoY3VyX2NwdV9zcGVjLT5jcHVfbmFtZSwgImU1
MDB2MiIpCj4gICBhcmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5jOiBzdHJjbXAoY3VyX2NwdV9zcGVj
LT5jcHVfbmFtZSwgImU1MDBtYyIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJj
bXAoY3VyX2NwdV9zcGVjLT5jcHVfbmFtZSwgImU1NTAwIikKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cmNtcChjdXJfY3B1X3NwZWMtPmNwdV9uYW1lLCAiZTY1MDAiKQoKSSdtIG5v
dCBzdXJlIHRoYXQgb3V0cHV0IGlzIHJlYWxseSB1c2VmdWwgaW4gdGhlIGNoYW5nZSBsb2cgdW5s
ZXNzIHlvdQpleHBsYWluIG1vcmUgYWJvdXQgd2hhdCBpdCBpcy4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMgYi9hcmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5jCj4gaW5k
ZXggNTdlMGFkNmEyY2EzLi43OTU2NjdmN2ViZjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2t2bS9lNTAwbWMuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMKPiBAQCAtMzg4
LDYgKzM4OCwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBrdm1wcGNfZTUwMG1jX2luaXQodm9pZCkK
PiAgewo+ICAJaW50IHI7Cj4gIAo+ICsJciA9IGt2bXBwY19lNTAwbWNfY2hlY2tfcHJvY2Vzc29y
X2NvbXBhdCgpOwo+ICsJaWYgKHIpCj4gKwkJcmV0dXJuIGt2bXBwY19lNTAwbWM7CiAKVGhpcyBk
b2Vzbid0IGJ1aWxkOgoKbGludXgvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYzogSW4gZnVuY3Rp
b24g4oCYa3ZtcHBjX2U1MDBtY19pbml04oCZOgpsaW51eC9hcmNoL3Bvd2VycGMva3ZtL2U1MDBt
Yy5jOjM5MToxMzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGt2
bXBwY19lNTAwbWNfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdOKAmTsgZGlkIHlvdSBtZWFuIOKAmGt2
bXBwY19jb3JlX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXTigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQogIDM5MSB8ICAgICAgICAgciA9IGt2bXBwY19lNTAwbWNfY2hl
Y2tfcHJvY2Vzc29yX2NvbXBhdCgpOwogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgICAgICAgICAgIGt2bXBwY19jb3JlX2No
ZWNrX3Byb2Nlc3Nvcl9jb21wYXQKbGludXgvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYzozOTM6
MjQ6IGVycm9yOiDigJhrdm1wcGNfZTUwMG1j4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGt2bV9vcHNfZTUwMG1j4oCZPwogIDM5MyB8
ICAgICAgICAgICAgICAgICByZXR1cm4ga3ZtcHBjX2U1MDBtYzsKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
IGt2bV9vcHNfZTUwMG1jCmxpbnV4L2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmM6MzkzOjI0OiBu
b3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9y
IGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgoKCkl0IG5lZWRzIHRoZSBkZWx0YSBiZWxvdyB0
byBjb21waWxlLgoKV2l0aCB0aGF0OgoKQWNrZWQtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBl
bGxlcm1hbi5pZC5hdT4gKHBvd2VycGMpCgpjaGVlcnMKCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2t2bS9lNTAwbWMuYyBiL2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMKaW5kZXggNzk1NjY3
ZjdlYmYwLi40NTY0YWEyN2VkY2YgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1j
LmMKKysrIGIvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYwpAQCAtMTY4LDcgKzE2OCw3IEBAIHN0
YXRpYyB2b2lkIGt2bXBwY19jb3JlX3ZjcHVfcHV0X2U1MDBtYyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCiAJa3ZtcHBjX2Jvb2tlX3ZjcHVfcHV0KHZjcHUpOwogfQogCi1pbnQga3ZtcHBjX2NvcmVf
Y2hlY2tfcHJvY2Vzc29yX2NvbXBhdCh2b2lkKQoraW50IGt2bXBwY19lNTAwbWNfY2hlY2tfcHJv
Y2Vzc29yX2NvbXBhdCh2b2lkKQogewogCWludCByOwogCkBAIC0zOTAsNyArMzkwLDcgQEAgc3Rh
dGljIGludCBfX2luaXQga3ZtcHBjX2U1MDBtY19pbml0KHZvaWQpCiAKIAlyID0ga3ZtcHBjX2U1
MDBtY19jaGVja19wcm9jZXNzb3JfY29tcGF0KCk7CiAJaWYgKHIpCi0JCXJldHVybiBrdm1wcGNf
ZTUwMG1jOworCQlnb3RvIGVycl9vdXQ7CiAKIAlyID0ga3ZtcHBjX2Jvb2tlX2luaXQoKTsKIAlp
ZiAocikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
