Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61681CFC5F9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHJavT1gA0jzeJpBGEK8S0nGxH5Uz8WSzr+n7zheO1k=; b=CyN0QEvj4Rseoe
	MT22tbdbjRWIzkKgEXqagxxHai2Pvv/iqjMX+RSnA9yWofY/dgDEzBt0dbuDrXSuyZx1UBVzoGinH
	yK/YNqIqVoqPlmoz+QQl1oRVti1NA5PgTBbx6vreqzO1VuPEj8Cda9YepUCDhXldiWXbCx22ymy/k
	Bah1UZZtBxPjzNjKc2yz2iRr1hw36LuRBowmTeTHivk2wJMKfurpUGJEI/p+pnBAZEaHWJqU7rbdy
	yzj1cbtTwcRyA9wLeS3W1tBFrdtnIL5lOwa2oVdtCEYWqBY4nNdrxKPdmbEsnOpyWTMhUs2NVu2Io
	aM8YvQ744/cVv06Rt5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyjw-0000000E5lU-3frB;
	Thu, 10 Oct 2024 19:22:24 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxs2-0000000Dr2U-3vNi
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:44 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e284982a31so22453657b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584801; x=1729189601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
        b=OrgrVnTtrz+qiD9I0S55GdwguFxumnKv3WwSP9lTvNcek28RXofi/P4YgBMLPPYMhb
         zCOiCCo9fd6Nk8bAoy3uGkg5aB+LFL9zzvsIoGmtZJWHk7S3XH6jGl4UgTdmy0jdzTRe
         uigdTw+2nDTBogSg6xzYhiat0dWmlOkE4NK4fdBCXO6eLIjWbfaMMyYAgIx+4I9JXs+q
         YYlcvGdNTOyx4Od36oRcYng2RADTfSTd5NrCF3iOCvOKsNAyx+6m8RHLPIhQGep99KBK
         95kPdxMBUQVU3/eq0UM2UXAuETUAQK8pz5gNiTU0JXjKfe390eNJWy/Ucn6yEkU139JE
         isgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584801; x=1729189601;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
        b=k6uKLd8yFAM4qd0iGB/fw8AGvAdYa4Xw1R17c+RWAN0CPdNCP6qmN0yA/I9R9zliJx
         Mw956GsyFwe4Ya1dd/XBAOBOtGiqXFO5ndGXB0Cb6DVbVGHvuRNmnuo2zUoA28z++5YM
         aijZV9K/FrN/7u7nXbcPdrFoBpIwCznxjglkm6Fqa3me9mQCH02Uuh6B+kvGta7bYP9F
         3ZH80cakaPAwiGnFTXPR9jaEpbYR6Tb8ptwEjH/jMA3Uc2CiJ7xiHyn2ygJq6QdgMWw0
         /7LFfccLTCcYMH6fl0xt9gc0fn0mvs1MyGLQkxqky98QzolqMN4ez2F0T3MQeFYQTKZO
         38+g==
X-Forwarded-Encrypted: i=1; AJvYcCWIUGI7ENtjtG05XUJxfFn2s4kSNh3yuuV8N535Ley7dHrwtO5Z+iwHgWi0KBjQmUTrmRfv1A/iuMcMDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg4raZe1MZ2/s8V+i7TfP2sq/anUKc6FyQ04rtX0BfcMj4KXX1
	ObcUKqHyO86zjj57l/hpkyQt2b28menr+7/xXgMvf141nUSbbjiX3uSEfAIcpJo1qOBuanHK1r9
	r4Q==
X-Google-Smtp-Source: AGHT+IGFUTZueI+Si3awRWj8jA+YGlhXMEzUcm/2nm7iA7dHF8070ZlvI1MSF0nUJUhFBhXPPz9v/uVg5Fg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2f08:b0:6e2:2c72:3abb with SMTP id
 00721157ae682-6e3224db667mr816567b3.7.1728584801239; Thu, 10 Oct 2024
 11:26:41 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:53 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-52-seanjc@google.com>
Subject: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112643_100237_CE83C25F 
X-CRM114-Status: GOOD (  14.22  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VXNlIF9fa3ZtX2ZhdWx0aW5fcGFnZSgpIGdldCB0aGUgQVBJQyBhY2Nlc3MgcGFnZSBzbyB0aGF0
IEtWTSBjYW4KcHJlY2lzZWx5IHJlbGVhc2UgdGhlIHJlZmNvdW50ZWQgcGFnZSwgaS5lLiB0byBy
ZW1vdmUgeWV0IGFub3RoZXIgdXNlcgpvZiBrdm1fcGZuX3RvX3JlZmNvdW50ZWRfcGFnZSgpLiAg
V2hpbGUgdGhlIHBhdGggaXNuJ3QgaGFuZGxpbmcgYSBndWVzdApwYWdlIGZhdWx0LCB0aGUgc2Vt
YW50aWNzIGFyZSBlZmZlY3RpdmVseSB0aGUgc2FtZTsgS1ZNIGp1c3QgaGFwcGVucyB0bwpiZSBt
YXBwaW5nIHRoZSBwZm4gaW50byBhIFZNQ1MgZmllbGQgaW5zdGVhZCBvZiBhIHNlY29uZGFyeSBN
TVUuCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2ln
bmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQog
YXJjaC94ODYva3ZtL3ZteC92bXguYyB8IDEzICsrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggODUxYmUwODIwZTA0
Li40NGNjMjVkZmViYmEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIv
YXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNjc5MCw4ICs2NzkwLDEwIEBAIHZvaWQgdm14X3Nl
dF9hcGljX2FjY2Vzc19wYWdlX2FkZHIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCXN0cnVjdCBr
dm0gKmt2bSA9IHZjcHUtPmt2bTsKIAlzdHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90cyA9IGt2bV9t
ZW1zbG90cyhrdm0pOwogCXN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7CisJc3RydWN0IHBh
Z2UgKnJlZmNvdW50ZWRfcGFnZTsKIAl1bnNpZ25lZCBsb25nIG1tdV9zZXE7CiAJa3ZtX3Bmbl90
IHBmbjsKKwlib29sIHdyaXRhYmxlOwogCiAJLyogRGVmZXIgcmVsb2FkIHVudGlsIHZtY3MwMSBp
cyB0aGUgY3VycmVudCBWTUNTLiAqLwogCWlmIChpc19ndWVzdF9tb2RlKHZjcHUpKSB7CkBAIC02
ODI3LDcgKzY4MjksNyBAQCB2b2lkIHZteF9zZXRfYXBpY19hY2Nlc3NfcGFnZV9hZGRyKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKIAkgKiBjb250cm9scyB0aGUgQVBJQy1hY2Nlc3MgcGFnZSBtZW1z
bG90LCBhbmQgb25seSBkZWxldGVzIHRoZSBtZW1zbG90CiAJICogaWYgQVBJQ3YgaXMgcGVybWFu
ZW50bHkgaW5oaWJpdGVkLCBpLmUuIHRoZSBtZW1zbG90IHdvbid0IHJlYXBwZWFyLgogCSAqLwot
CXBmbiA9IGdmbl90b19wZm5fbWVtc2xvdChzbG90LCBnZm4pOworCXBmbiA9IF9fa3ZtX2ZhdWx0
aW5fcGZuKHNsb3QsIGdmbiwgRk9MTF9XUklURSwgJndyaXRhYmxlLCAmcmVmY291bnRlZF9wYWdl
KTsKIAlpZiAoaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pKQogCQlyZXR1cm47CiAKQEAgLTY4Mzgs
MTAgKzY4NDAsMTMgQEAgdm9pZCB2bXhfc2V0X2FwaWNfYWNjZXNzX3BhZ2VfYWRkcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCiAJCXZtY3Nfd3JpdGU2NChBUElDX0FDQ0VTU19BRERSLCBwZm5fdG9f
aHBhKHBmbikpOwogCiAJLyoKLQkgKiBEbyBub3QgcGluIGFwaWMgYWNjZXNzIHBhZ2UgaW4gbWVt
b3J5LCB0aGUgTU1VIG5vdGlmaWVyCi0JICogd2lsbCBjYWxsIHVzIGFnYWluIGlmIGl0IGlzIG1p
Z3JhdGVkIG9yIHN3YXBwZWQgb3V0LgorCSAqIERvIG5vdCBwaW4gdGhlIEFQSUMgYWNjZXNzIHBh
Z2UgaW4gbWVtb3J5IHNvIHRoYXQgaXQgY2FuIGJlIGZyZWVseQorCSAqIG1pZ3JhdGVkLCB0aGUg
TU1VIG5vdGlmaWVyIHdpbGwgY2FsbCB1cyBhZ2FpbiBpZiBpdCBpcyBtaWdyYXRlZCBvcgorCSAq
IHN3YXBwZWQgb3V0LiAgS1ZNIGJhY2tzIHRoZSBtZW1zbG90IHdpdGggYW5vbnltb3VzIG1lbW9y
eSwgdGhlIHBmbgorCSAqIHNob3VsZCBhbHdheXMgcG9pbnQgYXQgYSByZWZjb3VudGVkIHBhZ2Ug
KGlmIHRoZSBwZm4gaXMgdmFsaWQpLgogCSAqLwotCWt2bV9yZWxlYXNlX3Bmbl9jbGVhbihwZm4p
OworCWlmICghV0FSTl9PTl9PTkNFKCFyZWZjb3VudGVkX3BhZ2UpKQorCQlrdm1fcmVsZWFzZV9w
YWdlX2NsZWFuKHJlZmNvdW50ZWRfcGFnZSk7CiAKIAkvKgogCSAqIE5vIG5lZWQgZm9yIGEgbWFu
dWFsIFRMQiBmbHVzaCBhdCB0aGlzIHBvaW50LCBLVk0gaGFzIGFscmVhZHkgZG9uZSBhCi0tIAoy
LjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
