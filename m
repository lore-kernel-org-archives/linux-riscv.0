Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3D5D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EhyhYRLCbkN1nieOCUFgm5lAe7eRxcavCexP4oXlMw=; b=GCilZTeo6p+P2i
	hEjCKa8hI1+Z6hkU0s/kx+kkEmCWluC/+YPNeoqduY+ubnb/V196ke5F05aiU5eneL3nSPF3AYmPM
	sbH9YTEXm4sizA2nbH5e+OO7xDT49GqNReeO1dYXokhZxT9L5mWTQQBNRNwx3IOQ7JVs7rK+plaea
	gyXqbLdTDndwh0PJGuebqFqsQeGRju8Nl8H9Gv2axdlYgjvwEmdr1+XgymVfyr49YoBkZ8v9MFrB/
	1Y6flP3E0G18a43IT70d52lK6GydoHM781pK9mmwY20wUEh/vys8krHf4O9jMLxDgycO0/CS1Jw50
	FRqzJun+Fk0Ls2B8gJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1SM-0000000EVsi-2jOj;
	Thu, 10 Oct 2024 22:16:26 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxr6-0000000DqGB-1oXL
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:46 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e25b39871fso27043637b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584743; x=1729189543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHAZpPaCzYnE+TRrbh6ni4wh+Yys2pChavpSnHk2YEU=;
        b=Zb0EU3prV44v8rePPhkxu4JaEh7GECx4rDUMV31lO5GUbi2/yQu8jNNiHhLjJrB/2S
         OXtDhvADkrnimtQeMA+9W0Nz7h1XXpa8MTpyPZWvWureI2+J1i5mAMQ7vU3A0M5bepIA
         +RpwQGwEWZxr13xXmQeYkgCJkenuOlcASDNr/to7qY1cfgY2h+c4OgaSmVEAAzx8J5Af
         ZpQx654UMkRAeTlRjIvCxepr15qG8z2MYLnNUHLzyek8s0RMI66Nr33O89odLYjjSxX9
         AhGjwOH5ukYEndvRdqJSGnAjfdUuKkw0gWxtU/m+QI8HXgIijYEEPmmVaBGYqA594u03
         Cgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584743; x=1729189543;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eHAZpPaCzYnE+TRrbh6ni4wh+Yys2pChavpSnHk2YEU=;
        b=wknW1MvWymN82ogmXyCjWsY6yJfh23A4Aq2lcV3Pd9p3tMGG7+zzz4oEh50QNmNkHr
         MhglK67EqxWf4uuvI9vuiU3l2TwIx5ZcYh00DsH7Av+WryoHfVn0vGLWvBJKorV5S/Hf
         WJlyqFSY9onc5s81mvUzltW+qUMTnBJALi2xjPp+5NmpIj2bpQ++j6bT2rbWdbOK9xoM
         Ayptj890zQ+ERtqzNvy63SWCEwk8FENH3ocP3UXUwGCOKGv7CpdTdx/5isl9Vczk9peW
         9M+W+lUw5JDwY2IK6SJjb5kzgIB4QDXTfyQi9v+V/odmSVM4RmemduCzNByQCkgmRXD5
         181g==
X-Forwarded-Encrypted: i=1; AJvYcCWxAeD0ztfstfmYtYJt0NafaTbgFIebG3LbsrShktj7+WqCt9Qd7oOzR8MIY3i/dVD4LJ0aG5NTfg7Nwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnm9CnODw1whN1YYVB+II79NMKrB+CUCxI5an9Z/q1jwmwPEjG
	baxjrL283ArLu3ua+6gPBIoGk88Fdy7TIMWCYwkPhEHjqKgJE4zYuqlAXpeF6DSrHAXcp6omo+0
	xmA==
X-Google-Smtp-Source: AGHT+IGUAGxjHNELfO1gnQBoxyShlnhLiinRslmifWPsD1igdN7s2BU3B9tdatRPL4jwPkA1Z0qI9X+JjYQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:9346:0:b0:e28:fc1b:66bb with SMTP id
 3f1490d57ef6-e28fe4f0fddmr4836276.6.1728584742775; Thu, 10 Oct 2024 11:25:42
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:26 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-25-seanjc@google.com>
Subject: [PATCH v13 24/85] KVM: nVMX: Drop pointless msr_bitmap_map field from
 struct nested_vmx
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
X-CRM114-CacheID: sfid-20241010_112544_704253_C98C169C 
X-CRM114-Status: GOOD (  11.56  )
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

UmVtb3ZlIHZjcHVfdm14Lm1zcl9iaXRtYXBfbWFwIGFuZCBpbnN0ZWFkIHVzZSBhbiBvbi1zdGFj
ayBzdHJ1Y3R1cmUgaW4KdGhlIG9uZSBmdW5jdGlvbiB0aGF0IHVzZXMgdGhlIG1hcCwgbmVzdGVk
X3ZteF9wcmVwYXJlX21zcl9iaXRtYXAoKS4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5jIHwgOCArKysr
LS0tLQogYXJjaC94ODYva3ZtL3ZteC92bXguaCAgICB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS92bXgvbmVzdGVkLmMgYi9hcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5jCmluZGV4IGU5NGEyNTM3
M2E1OS4uZmIzNzY1OGI2MmM5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5j
CisrKyBiL2FyY2gveDg2L2t2bS92bXgvbmVzdGVkLmMKQEAgLTYyMSw3ICs2MjEsNyBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgbmVzdGVkX3ZteF9wcmVwYXJlX21zcl9iaXRtYXAoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAogCWludCBtc3I7CiAJdW5zaWduZWQgbG9uZyAqbXNyX2JpdG1hcF9sMTsKIAl1
bnNpZ25lZCBsb25nICptc3JfYml0bWFwX2wwID0gdm14LT5uZXN0ZWQudm1jczAyLm1zcl9iaXRt
YXA7Ci0Jc3RydWN0IGt2bV9ob3N0X21hcCAqbWFwID0gJnZteC0+bmVzdGVkLm1zcl9iaXRtYXBf
bWFwOworCXN0cnVjdCBrdm1faG9zdF9tYXAgbXNyX2JpdG1hcF9tYXA7CiAKIAkvKiBOb3RoaW5n
IHRvIGRvIGlmIHRoZSBNU1IgYml0bWFwIGlzIG5vdCBpbiB1c2UuICAqLwogCWlmICghY3B1X2hh
c192bXhfbXNyX2JpdG1hcCgpIHx8CkBAIC02NDQsMTAgKzY0NCwxMCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgbmVzdGVkX3ZteF9wcmVwYXJlX21zcl9iaXRtYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAogCQkJcmV0dXJuIHRydWU7CiAJfQogCi0JaWYgKGt2bV92Y3B1X21hcCh2Y3B1LCBncGFfdG9f
Z2ZuKHZtY3MxMi0+bXNyX2JpdG1hcCksIG1hcCkpCisJaWYgKGt2bV92Y3B1X21hcCh2Y3B1LCBn
cGFfdG9fZ2ZuKHZtY3MxMi0+bXNyX2JpdG1hcCksICZtc3JfYml0bWFwX21hcCkpCiAJCXJldHVy
biBmYWxzZTsKIAotCW1zcl9iaXRtYXBfbDEgPSAodW5zaWduZWQgbG9uZyAqKW1hcC0+aHZhOwor
CW1zcl9iaXRtYXBfbDEgPSAodW5zaWduZWQgbG9uZyAqKW1zcl9iaXRtYXBfbWFwLmh2YTsKIAog
CS8qCiAJICogVG8ga2VlcCB0aGUgY29udHJvbCBmbG93IHNpbXBsZSwgcGF5IGVpZ2h0IDgtYnl0
ZSB3cml0ZXMgKHNpeHRlZW4KQEAgLTcxMSw3ICs3MTEsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
bmVzdGVkX3ZteF9wcmVwYXJlX21zcl9iaXRtYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCW5l
c3RlZF92bXhfc2V0X2ludGVyY2VwdF9mb3JfbXNyKHZteCwgbXNyX2JpdG1hcF9sMSwgbXNyX2Jp
dG1hcF9sMCwKIAkJCQkJIE1TUl9JQTMyX0ZMVVNIX0NNRCwgTVNSX1RZUEVfVyk7CiAKLQlrdm1f
dmNwdV91bm1hcCh2Y3B1LCAmdm14LT5uZXN0ZWQubXNyX2JpdG1hcF9tYXAsIGZhbHNlKTsKKwlr
dm1fdmNwdV91bm1hcCh2Y3B1LCAmbXNyX2JpdG1hcF9tYXAsIGZhbHNlKTsKIAogCXZteC0+bmVz
dGVkLmZvcmNlX21zcl9iaXRtYXBfcmVjYWxjID0gZmFsc2U7CiAKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS92bXgvdm14LmggYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oCmluZGV4IDIzMjVmNzcz
YTIwYi4uNDAzMDNiNDNkYTZjIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oCisr
KyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmgKQEAgLTIwMCw4ICsyMDAsNiBAQCBzdHJ1Y3QgbmVz
dGVkX3ZteCB7CiAJc3RydWN0IGt2bV9ob3N0X21hcCB2aXJ0dWFsX2FwaWNfbWFwOwogCXN0cnVj
dCBrdm1faG9zdF9tYXAgcGlfZGVzY19tYXA7CiAKLQlzdHJ1Y3Qga3ZtX2hvc3RfbWFwIG1zcl9i
aXRtYXBfbWFwOwotCiAJc3RydWN0IHBpX2Rlc2MgKnBpX2Rlc2M7CiAJYm9vbCBwaV9wZW5kaW5n
OwogCXUxNiBwb3N0ZWRfaW50cl9udjsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdv
b2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
