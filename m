Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D9BCA5FE6
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YS2fDMbswQJ33QBzb+EdnwgdrLYXW9ss0X4GyTBYu8I=; b=YcAzkUNEAJFKa6
	NhRZ1Iu8bTh6ckbBzRd2SNTEMXabjV51No1pAq7QAXxEhLAPuwe01/23AkQcl0wZBgHq7TFGGJy1b
	etpOdBx2/k6sx0QnsJ536dBOj09Bk9fUGs+SPe63uRogRxziZeMu/U7U+sJM7xLaFVzbQeucqIEmS
	VKwmzrKNMjCxMmuVGf2v1E1JGtXTbQ3Gtwj1te+Dd23z3tVwHkuOiOOSce5eA8cCY47Ov9pxbiGzj
	KTTicYcKDvsC120ttZRGgS/PtXoq3oTCp0L/oa5xO/Ogypz2sPa1AzRf4ICQMQMfgnYL5izEtka5S
	I8uiXK7Ld+1KBmjYUNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZE-0000000DKko-3XJE;
	Sat, 03 Oct 2026 10:02:08 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZB-0000000DKiJ-2qQI
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 10:02:07 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so111505f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 03:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021724; cv=none;
        d=google.com; s=arc-20260327;
        b=C/pROsFHYpbdHK0FUJcOs+nWwu3HX1QpVWBKXRd/h6KlNVq6+vCilKuo7RVz4e/GbS
         83dkQ0PhwJj+ZTFc6HiPbIb3R5F7/+PgroV4M/hg3WbTYUpgesjDSm3Dpk9TGwdl0oNP
         jSxycB9R6mFsg6GEidUtibRxwscPXEdAoZCpvXNQCMifKDejqRk9wXEBt4qEMvL3AE3y
         jxWWHwlpi6ZT4RD6Pa6tExVw6FfacYTB7NmKIBJVnm9KsPk+DpSxWneGFk8BckKHnqQX
         NezHfequWLV7gg5zYKhx+/q1pK+sujhRb+/LKfffPs+rEUKOPKTFDdNMV+EcPKtB7j5C
         F1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MP8Sqa2CEbzPapCdfasmIP+eBvUM/xKkRDsl2sHLpvE=;
        fh=3P7ERknZr2rdja/e7Y0fbohGFi1nicW8PaVgGyv9dgk=;
        b=nKZIrovuUTnyUrcLOwvjxvEjPx/0cYCCn9qlaDPO4ev20jZma/xup10kcCfgemmS8Y
         QgTN7aF0ETg3ai69OLiNTE6P0jVxZ8DgHKRxC+C+g9N4zkbQ+y+Repn2MC4RhR+Tv3Ln
         lW9EHkU0XLUN4jY8jRlDozM/+F9xxul0j8lRPJaW4eDaFuAdNoc/yTR0tL5BtjbrTQ+2
         W058SzIpYu95Z4t6UTRQDZAFJWYf0AJ2kHF+kg6NGLmS3ex5GSTts/g6/SxdAHcx2BpA
         6igkHrfTno2G6KFPGCqcyscJ4yMbW8jKIrumek6nkWmDsp/negKwcnmlEo3X9tN6s10p
         4lVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791021724; x=1791626524; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP8Sqa2CEbzPapCdfasmIP+eBvUM/xKkRDsl2sHLpvE=;
        b=cJsVVMQ8YhPXotxy1FMZdrICrk45lPoEGKt6SF8vbQMyp7nFqRJLKaicSpsyBtMEub
         dzkADMXTmTCVFYaZZVocBpT3iF75R5zsAWyXzq3vGazPoLIS/8DcWWDBRLn7JlSLBPrq
         ZngRCMqswD70cK9LkeNRjyb98nIud/0t22L2jzm3mWJJGAJS9rQho9O7QMa4HrT3uohv
         vGuQ/jPUBkjDZcUTf99YmO2e2p1wQXcnSC5SK7u5BHu43UUOXpz7n5XlUQDxxJVdfMHX
         vj1J1oWvWVbf/e8iBSIpZ3i66Gi8HmsIOBziiKXXAcx1WFEf7G22764JQcgs7m9l54oX
         9rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021724; x=1791626524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP8Sqa2CEbzPapCdfasmIP+eBvUM/xKkRDsl2sHLpvE=;
        b=ADznp57YeYJJBESr+UxBvv7OhxkwDe4ZqvYpj6BqXUjI60Q+2Rr2yldydX8iHTEfvR
         hFqAfT2qHfCh2UGiYR23iiAw/vsnqezHHQF27+sLAeaIzHPSmkOkq7o+Mw1d4P/YwhWo
         sXQPQgBI5+2okOLgEPhvI7RJVhjtfDBObYmy5x+OiVSB+tKGsOhLTmQ31fFzfW4QszZj
         mYQW+FIW6XenXA9mn3WpnAohGkBYHFaVS6Z58lfAGuXXTGCioGTADLfqYPqqWg1+GsrZ
         K5TFjfg1K0COR43hu/VxP4GlaO7YPjwWRHXn1T4eyYMmBdjj7rBK3rgJ8rxU3qNsf4KZ
         SQRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr2q2gJPv1aw+V6AdYEH2he4kqv1ucUOg5UDzvnssbGm8M2hSJeyi3k2IvbpPNU20mkcAmoFBjzW83wQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKfNcQ0Lya06d/gyDOmkXFFQrR8VO9IY6jJZ7w33jdRh1Z3aI0X
	OnGFVkEwSgCp04n9oGSZ2b1qiN+EU7HhEa1TuWhm6TPIGm6kF5zSOObr7WFbfWdtNyfpekppNYw
	1Bg8IeQt0+pVsImnMsCWfRs++fpXemJOsWxPYTa4ZHg==
X-Gm-Gg: AYBFou3ROYFlCO2BqwyqeMlGnwQMZ+3tCIG/c23pKPdYRXje1MG7+C0TZZ1IZQ1Uaij
	1U8W8oojHDEl0vf9B5R54rekADyA/WIg0VUDBAm/1OwBBC5YJnANlTOee2jrMBCQX/nwzZSkn8h
	AQXp8gPrRWE72mJHdGcb7J0UtfKkiMt0KyohI9QUt3FFcHZT2rxPYqovDF08E2XOmziW+6SH8XJ
	NS3MTttP1Hl/dPbYC835epdzP75JdW+vVNCCt21i9pd2pKYh58pFfgjojfpJ6NWNtbnoueJEFmd
	W+SqPeXaJJtqFczLbEp/va3ImORrWAjvBDKr1a/sAifl9RVimNqHOyZBbrzmBRz3j6EhxyN0L8L
	IzU8I2JftGdOVTF+a3P+MBv1ScOaqgQ5AnFDxIGSqOfK8FpWOLWy/V58TtB/VmUcFoQSCYPqlxE
	s=
X-Received: by 2002:a05:6000:1846:b0:48b:1bf:ffb1 with SMTP id
 ffacd0b85a97d-48b12775c61mr10366149f8f.54.1791021723743; Sat, 03 Oct 2026
 03:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260814114507.583424-1-jinyu.tang@linux.dev> <20260814114507.583424-4-jinyu.tang@linux.dev>
In-Reply-To: <20260814114507.583424-4-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 15:31:52 +0530
X-Gm-Features: AclHuK-r6E6EOJLR4dsLSLuGmbe9Jaf0ZQFpEhYpdE-Qre9_eJHe2jf_2nwa2RI
Message-ID: <CAAhSdy3D+4Oh9mD+MFP8RwoeTDB855ZQoGRgjEnYJQwRH4K4=g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: selftests: Enable pre_fault_memory_test for RISC-V
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_030206_297648_F851759B 
X-CRM114-Status: GOOD (  13.88  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgNToxNuKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IFJJU0MtViBub3cgc3VwcG9ydHMgS1ZNX1BSRV9GQVVMVF9N
RU1PUlksIHNvIGluY2x1ZGUgdGhlIGdlbmVyaWMKPiBwcmVfZmF1bHRfbWVtb3J5X3Rlc3QgaW4g
dGhlIFJJU0MtViBLVk0gc2VsZnRlc3QgYnVpbGQuCj4KPiBUaGUgdGVzdCB1c2VzIFBBR0VfU0la
RSBmcm9tIHRoZSBhcmNoaXRlY3R1cmUgcHJvY2Vzc29yIGhlYWRlci4gRGVmaW5lCj4gdGhlIG5v
cm1hbCA0SyBSSVNDLVYgc2VsZnRlc3QgcGFnZSBzaXplIHNvIHRoZSBnZW5lcmljIHRlc3QgY2Fu
IGJ1aWxkCj4gZm9yIFJJU0MtVi4KPgo+IFJldmlld2VkLWJ5OiBOdXR0eSBMaXUgPG51dHR5Lmxp
dUBob3RtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDxqaW55dS50YW5nQGxp
bnV4LmRldj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywKQW51cAoKCj4g
LS0tCj4gdjEgLT4gdjI6Cj4gLSBEcm9wIHRoZSBwZXItdGVzdCBndWVzdF9tb2Rlc19hcHBlbmRf
ZGVmYXVsdCgpIGNhbGwgZnJvbQo+ICAgcHJlX2ZhdWx0X21lbW9yeV90ZXN0LmMuICBSSVNDLVYg
YWxyZWFkeSBpbml0aWFsaXplcyBzdXBwb3J0ZWQgYW5kCj4gICBkZWZhdWx0IGd1ZXN0IG1vZGVz
IGZyb20ga3ZtX3NlbGZ0ZXN0X2FyY2hfaW5pdCgpLCB3aGljaCBpcyBjYWxsZWQgYnkKPiAgIHRo
ZSBjb21tb24ga3ZtX3NlbGZ0ZXN0X2luaXQoKSBjb25zdHJ1Y3RvciwgYXMgc3VnZ2VzdGVkIGJ5
IFNlYW4uCj4KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlLmt2bSAgICAg
ICAgICAgICAgfCAxICsKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlz
Y3YvcHJvY2Vzc29yLmggfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5r
dm0gYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3ZtCj4gaW5kZXggNmZj
MzRlOWJmOGUxLi5hYzY0YWM5MmZkNGIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL01ha2VmaWxlLmt2bQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9NYWtlZmlsZS5rdm0KPiBAQCAtMjI1LDYgKzIyNSw3IEBAIFRFU1RfR0VOX1BST0dTX3Jpc2N2
ICs9IGNvYWxlc2NlZF9pb190ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGRpcnR5X2xv
Z19wZXJmX3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZ2V0LXJlZy1saXN0Cj4gIFRF
U1RfR0VOX1BST0dTX3Jpc2N2ICs9IG1tdV9zdHJlc3NfdGVzdAo+ICtURVNUX0dFTl9QUk9HU19y
aXNjdiArPSBwcmVfZmF1bHRfbWVtb3J5X3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0g
cnNlcV90ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IHN0ZWFsX3RpbWUKPgo+IGRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNz
b3IuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nv
ci5oCj4gaW5kZXggYWJkZTNjNzFjODkxLi43MDQ4N2M4ZWQxNTUgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiArKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+
IEBAIC0xMiw2ICsxMiw5IEBACj4gICNpbmNsdWRlIDxhc20vdmRzby9wcm9jZXNzb3IuaD4KPiAg
I2luY2x1ZGUgImt2bV91dGlsLmgiCj4KPiArI2RlZmluZSBQQUdFX1NISUZUICAgICAgICAgICAg
IDEyCj4gKyNkZWZpbmUgUEFHRV9TSVpFICAgICAgICAgICAgICBCSVRfVUxMKFBBR0VfU0hJRlQp
Cj4gKwo+ICAjZGVmaW5lIElOU05fT1BDT0RFX01BU0sgICAgICAgMHgwMDdjCj4gICNkZWZpbmUg
SU5TTl9PUENPREVfU0hJRlQgICAgICAyCj4gICNkZWZpbmUgSU5TTl9PUENPREVfU1lTVEVNICAg
ICAyOAo+IC0tCj4gMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
