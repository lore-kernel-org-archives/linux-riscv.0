Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB00FD2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8lbNB/D/08aZFhDXGcnGhmU21hzz7mkS1sZcBdn5JE=; b=QL942kMa1Vk+ZI
	euWPsjNDwwPQ61KOAmUKSucoVCPvxtKzdKa6GxwdGO7UOk6IwoAmopabhOnTvsU5z+KCR9qfkV4Tt
	/DudzzW9uy6u1ulejhIeTLL1rzEsO0LEke5G0VRnMjV8hnaBDSIxQg9eqQn3d2rzWTU5TQxdy4y0B
	ZCZ0qY2ybfBrxXYKEAR7Zh1Q3G0dhDSA9kYd/+tn+BiEyNPO1VOScyR9dSkP6BaDitltvRd2wEm/O
	1EZRQl/Ewi7Uf4hVM2qwKb+O7K4uS+UTDrazCuDvFneIKwnLtmpTw5aPg/CUXyrv2ZYPmBiKyMLlw
	O/Ms6U4Jo8F/JIJGibjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0Hm-0000000ELju-35yC;
	Thu, 10 Oct 2024 21:01:26 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxr4-0000000DqEd-0vzh
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:45 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20b8bf5d09aso15596605ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584741; x=1729189541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
        b=cHCxW9OvZGr1yBq6iVLuom+7EfZOc2EiXI7ygoBxdL22tnMY4Rj8QktPQoH9Zvi7rY
         qyOcJSNL56bk8CzNNK18Qv8diJFnIWO5chCmwCAkSlGhhfKd2k9jLijI97GeNIR3JSb5
         KDlg64BqicYf/HRueE0w1SDL7nCmZA4NdT6OUJajraX/1Si4XFYP/vdmBM232nIzJ/Vg
         6B+M47Y5OHDhvCmF/DpY/dTExiOIuOVDanc++9fpYZHB1avwuohYC45mdc78wc8C+odL
         PzeJTkRQxew5bIRj0u4rP3K84+JAXK/nVdKxY+zRIlu3rMcO5RHJD0zj3yKwqUl7by/Z
         hxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584741; x=1729189541;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
        b=GoAMQejNn/zySbrOCD7bLEfZCKAcqt2bDfxYBT+GwmzozW+C0iG2sitMlWovr844MG
         Z1GUoInRg42y/e9sXvs6Kef1Y2kC/3/05tctNcPPxfWdRLg40kOOe+P64xvfhYV3e4cY
         GZIcjLyymC2uGyHUe3SlIXzsUTgi6f31za/d/ePTothlJ3zlu6NHmZloCLoJm2wXohFe
         x8YkH34JhDvGymwUqpIeeW5T1DkzfQ4uicudI3zDSOWyQAaRnTFMgCJAWAqcAs1Tou8r
         4+yE6jASuvk56o/pCJnxHBosN3ni9ltO/2yTYQ3cwH8Og2ZEmHYutsFy9SvRlQfGEij1
         BDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUNgjNWmAEcfiitz+csOvdOg50wjZw2+ndb9rSUiMWVVj4FEi3vsFa3oxNcpxzluy7dlzHjGxVSV6QRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/wxa2Q59bAqDaizGicQjtc3pl52ofAkwNoQuS4gFc0Qa1/lQ3
	HOdiU3ZxfRelze9PUnen+VsMTom5mVZLHt51298bKf1Z55O7pWqEb2C+v0byYb5GG2a5FSPdh4o
	pzQ==
X-Google-Smtp-Source: AGHT+IFSsaj7YGs0xXvL7KvHpo4OHZS23TfW901WnGn1dNBw4UEq8HUBbyPz7tDSJuBwPv672jv+MkN6+4M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:2349:b0:20b:9365:e6e4 with SMTP id
 d9443c01a7336-20c63782bdcmr1094885ad.9.1728584740809; Thu, 10 Oct 2024
 11:25:40 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:25 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-24-seanjc@google.com>
Subject: [PATCH v13 23/85] KVM: nVMX: Rely on kvm_vcpu_unmap() to track
 validity of eVMCS mapping
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
X-CRM114-CacheID: sfid-20241010_112542_369474_37E85BEE 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

UmVtb3ZlIHRoZSBleHBsaWNpdCBldm1wdHIxMiB2YWxpZGl0eSBjaGVjayB3aGVuIGRlY2lkaW5n
IHdoZXRoZXIgb3Igbm90CnRvIHVubWFwIHRoZSBlVk1DUyBwb2ludGVyLCBhbmQgaW5zdGVhZCBy
ZWx5IG9uIGt2bV92Y3B1X3VubWFwKCkgdG8gcGxheQpuaWNlIHdpdGggYSBOVUxMIG1hcC0+aHZh
LCBpLmUuIHRvIGRvIG5vdGhpbmcgaWYgdGhlIG1hcCBpcyBpbnZhbGlkLgoKTm90ZSwgdm14LT5u
ZXN0ZWQuaHZfZXZtY3NfbWFwIGlzIHplcm8tYWxsb2NhdGVkIGFsb25nIHdpdGggdGhlIHJlc3Qg
b2YKdmNwdV92bXgsIGkuZS4gdGhlIG1hcCBzdGFydHMgb3V0IGludmFsaWQvTlVMTC4KClRlc3Rl
ZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9r
dm0vdm14L25lc3RlZC5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvbmVzdGVk
LmMgYi9hcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5jCmluZGV4IGE4ZTdiYzA0ZDliZi4uZTk0YTI1
MzczYTU5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5jCisrKyBiL2FyY2gv
eDg2L2t2bS92bXgvbmVzdGVkLmMKQEAgLTIzMSwxMSArMjMxLDggQEAgc3RhdGljIGlubGluZSB2
b2lkIG5lc3RlZF9yZWxlYXNlX2V2bWNzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlzdHJ1Y3Qg
a3ZtX3ZjcHVfaHYgKmh2X3ZjcHUgPSB0b19odl92Y3B1KHZjcHUpOwogCXN0cnVjdCB2Y3B1X3Zt
eCAqdm14ID0gdG9fdm14KHZjcHUpOwogCi0JaWYgKG5lc3RlZF92bXhfaXNfZXZtcHRyMTJfdmFs
aWQodm14KSkgewotCQlrdm1fdmNwdV91bm1hcCh2Y3B1LCAmdm14LT5uZXN0ZWQuaHZfZXZtY3Nf
bWFwLCB0cnVlKTsKLQkJdm14LT5uZXN0ZWQuaHZfZXZtY3MgPSBOVUxMOwotCX0KLQorCWt2bV92
Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC5odl9ldm1jc19tYXAsIHRydWUpOworCXZteC0+
bmVzdGVkLmh2X2V2bWNzID0gTlVMTDsKIAl2bXgtPm5lc3RlZC5odl9ldm1jc192bXB0ciA9IEVW
TVBUUl9JTlZBTElEOwogCiAJaWYgKGh2X3ZjcHUpIHsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5
OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
