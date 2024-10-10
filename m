Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6239D24459
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjFbaMsOcVaFK16wNz6D28UM72PL9IxBKW8uk1UoomU=; b=qcT+zQ1Or7s78Q
	r6Jw+U0z+fFsEGXWEsPcIfC4g3PozQn5dJ0OU+gOB+TvE9QyLdor7L31ghNWMjmHjCXiWzLc4S2Na
	guGHYY6pgXlWVdOYly7NUK3xr7/a5jbyC+zWPwvem7pnvkZeUctk374Dwptz9/IQY3HbV2Oc/hzCz
	glYEsTd9roHWcX4uk8hM1DZxhEN6QTVBQL4Xx356Va+b0m7Si2k5MaBuZKXZP1fpTkrDzMXEwuG7q
	XBYvdkb1OKNA0AFHIaiHgOcLOireoxMSgEsPixWeCt1MGJFGkFuES9FKAbX2nL630TJNa3xdBFFuV
	y9MB68UMjRMFYpNbJDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1SN-0000000EVtH-3sc7;
	Thu, 10 Oct 2024 22:16:27 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxr8-0000000DqHo-0VaY
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:48 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e25b39871fso27044077b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584744; x=1729189544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
        b=iLMIpzBZnXcGg0be6+lfC0lRkhEn5KMOD8i176j/1z6K3vzSEKUgEY2w7Slsux3/sR
         3Law3bIdQBGjRc99BGD1QjTrmVGIIdRklEe+BS8USHYkaFZ87LaMNp0wTitj1ABRQEGb
         +GB2Ly492NrlOCkVLBGlkdVcdkTXT7bd/nxeCgdcefR38PXWMKZfxp+zYbQ2eTwdTLLi
         Cr0gabDJOvk1eneM9z0RaBxYhv4itP1lyjhdFwUNWGM/9rjT6blS0JrqB6TqwHJeOUuj
         OXlSTptN9xWHtLzCgYAxhDDTihYLI7dD3QW4kF/L5ZcA16r+jrF0UOiapmRfSZAtHtOM
         hG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584744; x=1729189544;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
        b=S/Jiat/yI0nuKQ7p6TQvQkzgGLywPv/3KshCdq/g+5b9eKOm3anjlZ2+mKIsdw0MnK
         L9MspFOEGhl9A4h5GEm4KwbF7HC5YpgxRiIRVdpwFUQr1cVbArF7laXRVRCjMqesklNi
         MJzru+CHe2zHvBbjH0Z/DyroypUJwEFKMFLuTW7z744ZaH+eTqQn6Ip/DrB6/64A5Ftg
         gl5XJK408SvwoYsmRcXWiQigtCFQ0EHFNzURxD/N224yNfjDmxVpH4Yh9SuJHVmjDInT
         PaqSufnUOMtcxJEksI2CaOld/6s8+AOS+0dTecb5VXRh5TVdc/WCXZTllPGW0XgSlcKt
         V2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUtwFdGpCGOcq6nJmFRrSpDRpAcmBE3awF4NADEUMwsrTBTTePpRNxKsDHH3We+cXcPMKvSBrDUYR1UCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWrwWQ9XIlLNjwALFK4vDFaWD48WPK8M2Cu4ZEd2V1ISwALaZd
	zn9oNkm4j/PR6w9A69dQDREjUveilj7jKQyD9xfTFibHtPqZ+cg77ZzkPq8XoyV4V9qh63Gc7CZ
	3Vw==
X-Google-Smtp-Source: AGHT+IEdX//xUJq0LlzHSFsWnzcNANrEE9KtnndGvFzP5BAu23zXYFVXA6eeBi51F5M5i08FgAsxiLe5HbY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:300b:b0:6e3:f32:5fc8 with SMTP id
 00721157ae682-6e32217bbe0mr502817b3.1.1728584744665; Thu, 10 Oct 2024
 11:25:44 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:27 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-26-seanjc@google.com>
Subject: [PATCH v13 25/85] KVM: nVMX: Add helper to put (unmap) vmcs12 pages
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
X-CRM114-CacheID: sfid-20241010_112546_277858_F264935A 
X-CRM114-Status: GOOD (  11.41  )
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

QWRkIGEgaGVscGVyIHRvIGRlZHVwIHVubWFwcGluZyB0aGUgdm1jczEyIHBhZ2VzLiAgVGhpcyB3
aWxsIHJlZHVjZSB0aGUKYW1vdW50IG9mIGNodXJuIHdoZW4gYSBmdXR1cmUgcGF0Y2ggcmVmYWN0
b3JzIHRoZSBrdm1fdmNwdV91bm1hcCgpIEFQSS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVu
ZGVkLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNp
Z25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0K
IGFyY2gveDg2L2t2bS92bXgvbmVzdGVkLmMgfCAzMiArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvbmVzdGVkLmMgYi9hcmNoL3g4Ni9rdm0v
dm14L25lc3RlZC5jCmluZGV4IGZiMzc2NThiNjJjOS4uODE4NjVkYjE4ZTEyIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvbmVzdGVk
LmMKQEAgLTMxNCw2ICszMTQsMjEgQEAgc3RhdGljIHZvaWQgdm14X3N3aXRjaF92bWNzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGxvYWRlZF92bWNzICp2bWNzKQogCXZjcHUtPmFyY2gu
cmVnc19kaXJ0eSA9IDA7CiB9CiAKK3N0YXRpYyB2b2lkIG5lc3RlZF9wdXRfdm1jczEyX3BhZ2Vz
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRvX3Zt
eCh2Y3B1KTsKKworCS8qCisJICogVW5waW4gcGh5c2ljYWwgbWVtb3J5IHdlIHJlZmVycmVkIHRv
IGluIHRoZSB2bWNzMDIuICBUaGUgQVBJQyBhY2Nlc3MKKwkgKiBwYWdlJ3MgYmFja2luZyBwYWdl
ICh5ZWFoLCBjb25mdXNpbmcpIHNob3VsZG4ndCBhY3R1YWxseSBiZSBhY2Nlc3NlZCwKKwkgKiBh
bmQgaWYgaXQgaXMgd3JpdHRlbiwgdGhlIGNvbnRlbnRzIGFyZSBpcnJlbGV2YW50LgorCSAqLwor
CWt2bV92Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC5hcGljX2FjY2Vzc19wYWdlX21hcCwg
ZmFsc2UpOworCWt2bV92Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC52aXJ0dWFsX2FwaWNf
bWFwLCB0cnVlKTsKKwlrdm1fdmNwdV91bm1hcCh2Y3B1LCAmdm14LT5uZXN0ZWQucGlfZGVzY19t
YXAsIHRydWUpOworCXZteC0+bmVzdGVkLnBpX2Rlc2MgPSBOVUxMOworfQorCiAvKgogICogRnJl
ZSB3aGF0ZXZlciBuZWVkcyB0byBiZSBmcmVlZCBmcm9tIHZteC0+bmVzdGVkIHdoZW4gTDEgZ29l
cyBkb3duLCBvcgogICoganVzdCBzdG9wcyB1c2luZyBWTVguCkBAIC0zNDYsMTUgKzM2MSw4IEBA
IHN0YXRpYyB2b2lkIGZyZWVfbmVzdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAl2bXgtPm5l
c3RlZC5jYWNoZWRfdm1jczEyID0gTlVMTDsKIAlrZnJlZSh2bXgtPm5lc3RlZC5jYWNoZWRfc2hh
ZG93X3ZtY3MxMik7CiAJdm14LT5uZXN0ZWQuY2FjaGVkX3NoYWRvd192bWNzMTIgPSBOVUxMOwot
CS8qCi0JICogVW5waW4gcGh5c2ljYWwgbWVtb3J5IHdlIHJlZmVycmVkIHRvIGluIHRoZSB2bWNz
MDIuICBUaGUgQVBJQyBhY2Nlc3MKLQkgKiBwYWdlJ3MgYmFja2luZyBwYWdlICh5ZWFoLCBjb25m
dXNpbmcpIHNob3VsZG4ndCBhY3R1YWxseSBiZSBhY2Nlc3NlZCwKLQkgKiBhbmQgaWYgaXQgaXMg
d3JpdHRlbiwgdGhlIGNvbnRlbnRzIGFyZSBpcnJlbGV2YW50LgotCSAqLwotCWt2bV92Y3B1X3Vu
bWFwKHZjcHUsICZ2bXgtPm5lc3RlZC5hcGljX2FjY2Vzc19wYWdlX21hcCwgZmFsc2UpOwotCWt2
bV92Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC52aXJ0dWFsX2FwaWNfbWFwLCB0cnVlKTsK
LQlrdm1fdmNwdV91bm1hcCh2Y3B1LCAmdm14LT5uZXN0ZWQucGlfZGVzY19tYXAsIHRydWUpOwot
CXZteC0+bmVzdGVkLnBpX2Rlc2MgPSBOVUxMOworCisJbmVzdGVkX3B1dF92bWNzMTJfcGFnZXMo
dmNwdSk7CiAKIAlrdm1fbW11X2ZyZWVfcm9vdHModmNwdS0+a3ZtLCAmdmNwdS0+YXJjaC5ndWVz
dF9tbXUsIEtWTV9NTVVfUk9PVFNfQUxMKTsKIApAQCAtNTAxMCwxMSArNTAxOCw3IEBAIHZvaWQg
bmVzdGVkX3ZteF92bWV4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgdm1fZXhpdF9yZWFz
b24sCiAJCXZteF91cGRhdGVfY3B1X2RpcnR5X2xvZ2dpbmcodmNwdSk7CiAJfQogCi0JLyogVW5w
aW4gcGh5c2ljYWwgbWVtb3J5IHdlIHJlZmVycmVkIHRvIGluIHZtY3MwMiAqLwotCWt2bV92Y3B1
X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC5hcGljX2FjY2Vzc19wYWdlX21hcCwgZmFsc2UpOwot
CWt2bV92Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC52aXJ0dWFsX2FwaWNfbWFwLCB0cnVl
KTsKLQlrdm1fdmNwdV91bm1hcCh2Y3B1LCAmdm14LT5uZXN0ZWQucGlfZGVzY19tYXAsIHRydWUp
OwotCXZteC0+bmVzdGVkLnBpX2Rlc2MgPSBOVUxMOworCW5lc3RlZF9wdXRfdm1jczEyX3BhZ2Vz
KHZjcHUpOwogCiAJaWYgKHZteC0+bmVzdGVkLnJlbG9hZF92bWNzMDFfYXBpY19hY2Nlc3NfcGFn
ZSkgewogCQl2bXgtPm5lc3RlZC5yZWxvYWRfdm1jczAxX2FwaWNfYWNjZXNzX3BhZ2UgPSBmYWxz
ZTsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
