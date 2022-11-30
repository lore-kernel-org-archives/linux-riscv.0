Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CBEC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50NgpWeWGLQcnZlBeBpuXSz5E9MeoCMYNEAk/WbnklI=; b=Js2qmdPx0xv90r
	LxTuq+NHAGMBEXoWQft14ovR1fG4oTVaWcKhhwgkrTcf6p8HobZvMnMyCqC2/jpWok1KOwV7pqwi3
	swv0qRADp+I6r2ZQslFkp4M6vO51I8t9JkBXLpcG+hf4vFjcSVYSOB9SgiNdtd2BalbKcPXE6OVkj
	Xoqs5l2OXDOjtJBqT0lPoM1EYEJiZUj5xquvScckLvXFWGUMxqzsSfbKZuigNpW8AWpDJ+/OuFmxF
	ZcGLJj9jI7bvkdSUkb6tpDn8JGPD0kit9EDtEYRCO9MCupJ8OKV1fwy2owHHfwaCXmSxtoD9qjKKA
	Enu5h4CJeYfELcKQxMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WEO-0036zB-W0; Wed, 30 Nov 2022 23:11:09 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDZ-0036Q4-VD
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:19 +0000
Received: by mail-pj1-x1049.google.com with SMTP id c10-20020a17090aa60a00b00212e91df6acso165916pjq.5
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E/ZNfNVjTWUDx7EclAA9RDMNJ28SDYbq0FBSTNkEW0=;
        b=YOeUjr5k1nRXALq3v0KKdNU/RoNOZHvdJ287PzEh8mewFol14vSXSy8/3fYRK98ogf
         DM6/FhXti4G1BKHQNvzjRV1tWyFhTyxYu+zxNSNi9IlHcolXKLZsPssVX0dsnM50iavV
         x2ODcftM6fP7S5M9f/kxN+kBZaYtyIW+z4R08Rc0Nfjpphi6e+XsI1tHwJnKWXkQaHpN
         Fvd9/AR9wQma2szpaVgVzc80G2d6HwNcimfP60MChrBcVuLXdfKe+wSSxLqRYu4pvEyL
         hD29cSFZ9nNlD/40iFEC/0Ct0+nb0Drk9Ewou2J1g8F1lSQpSFp12LOPbSOpy+zVepWe
         HB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2E/ZNfNVjTWUDx7EclAA9RDMNJ28SDYbq0FBSTNkEW0=;
        b=LYiaIHvjNuqLMUZtIsGwAwbQLATDm9TQX1FVUp0r4i/JvdQNm2V1l6ZWdxE0S0x88V
         VDwUPJwNgds+CMhuP3vwMmYe8mL5bkCth7RG5L+QEd+fQuhCDe0roz18gnRokcjIPgYE
         ew4G68EHMD1TLrpNGxcyEUV5T4UT3MPLBjYEE4L6E+3+3Ntu/zIqXFOqGt5u/S+keGnc
         JvSbpii8GW4vTwCGYtDmPBprKYC43o63eX13oazNJiiIAO+xomYDLyWMJrGzx5/lx2m1
         0bDaFrkol3aIe6r02IORtyaSY1SpT6RyQ/8o1LCcL79oxoq8Vie0M8ZrNhokNHGO/a5H
         s0Lw==
X-Gm-Message-State: ANoB5pn2tnU206KU9887ieXh7UQcwWq0zopcO8ipQFUsX2MBBY5cUC/Y
	1tXSf65X+co35ADPp1wbNmQ0oOoscgs=
X-Google-Smtp-Source: AA0mqf6fouTIX68sTKIWP0zUhpW+UmWGK5D4PKuHk4dF0PG0spJwJY42lnPZuN8WAPveTbTZZSc8FEJYBlE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:6045:0:b0:575:f66b:75a9 with SMTP id
 u66-20020a626045000000b00575f66b75a9mr3406091pfb.2.1669849816681; Wed, 30 Nov
 2022 15:10:16 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:07 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-24-seanjc@google.com>
Subject: [PATCH v2 23/50] KVM: MIPS: Register die notifier prior to kvm_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_151018_067736_0FDB0384 
X-CRM114-Status: UNSURE (   9.66  )
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

Q2FsbCBrdm1faW5pdCgpIG9ubHkgYWZ0ZXIgX2FsbF8gc2V0dXAgaXMgY29tcGxldGUsIGFzIGt2
bV9pbml0KCkgZXhwb3NlcwovZGV2L2t2bSB0byB1c2Vyc3BhY2UgYW5kIHRodXMgYWxsb3dzIHVz
ZXJzcGFjZSB0byBjcmVhdGUgVk1zIChhbmQgY2FsbApvdGhlciBpb2N0bHMpLgoKU2lnbmVkLW9m
Zi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Ci0tLQogYXJjaC9t
aXBzL2t2bS9taXBzLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva3ZtL21pcHMuYyBi
L2FyY2gvbWlwcy9rdm0vbWlwcy5jCmluZGV4IDc1NjgxMjgxZTJkZi4uYWU3YTI0MzQyZmRmIDEw
MDY0NAotLS0gYS9hcmNoL21pcHMva3ZtL21pcHMuYworKysgYi9hcmNoL21pcHMva3ZtL21pcHMu
YwpAQCAtMTY0MCwxNiArMTY0MCwxNyBAQCBzdGF0aWMgaW50IF9faW5pdCBrdm1fbWlwc19pbml0
KHZvaWQpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IGt2bV9pbml0KE5VTEws
IHNpemVvZihzdHJ1Y3Qga3ZtX3ZjcHUpLCAwLCBUSElTX01PRFVMRSk7Ci0KLQlpZiAocmV0KQot
CQlyZXR1cm4gcmV0OwogCiAJaWYgKGJvb3RfY3B1X3R5cGUoKSA9PSBDUFVfTE9PTkdTT042NCkK
IAkJa3ZtX3ByaW9yaXR5X3RvX2lycSA9IGt2bV9sb29uZ3NvbjNfcHJpb3JpdHlfdG9faXJxOwog
CiAJcmVnaXN0ZXJfZGllX25vdGlmaWVyKCZrdm1fbWlwc19jc3JfZGllX25vdGlmaWVyKTsKIAor
CXJldCA9IGt2bV9pbml0KE5VTEwsIHNpemVvZihzdHJ1Y3Qga3ZtX3ZjcHUpLCAwLCBUSElTX01P
RFVMRSk7CisJaWYgKHJldCkgeworCQl1bnJlZ2lzdGVyX2RpZV9ub3RpZmllcigma3ZtX21pcHNf
Y3NyX2RpZV9ub3RpZmllcik7CisJCXJldHVybiByZXQ7CisJfQogCXJldHVybiAwOwogfQogCi0t
IAoyLjM4LjEuNTg0LmcwZjNjNTVkNGMyLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
