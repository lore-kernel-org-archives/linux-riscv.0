Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC8CFC5FD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM40cmduuKQ+NYae/zEfKYDNmevDcOhMyFqI1Q/YOMQ=; b=Ptt05d/qhNmpbN
	C2Vvj+UMB4DEf/Qg8nnh2uWE75XCKsz8nHK05CDkJ2EX4msin9xtpfTUBgHPxawZ8tAe77I2W1yUR
	MlnKgVcNdUmi7srQzaZSOxaCq+lSGbTteAu8xsGxtI1t7fMpNXrAo48z26KAv4jrUzM6JhMlU6aLJ
	AGkVnGwFTI28kCQ7vgZABwJnfTTdgT20+CZYDiWAr43MMAO+rAshIZUd5HsDJpHAqeuNes896acvT
	BJA1J5JUoLWjagtDe8z5EUFhSj2cEi5OQjFwb25S/9gFlLh8ghOD+RRb3bxhl1PEtPRWtGAgANbCY
	j9O02G409eUFX6C/YZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyjv-0000000E5ke-3Fm0;
	Thu, 10 Oct 2024 19:22:23 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxs1-0000000Dr16-1bUF
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:42 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1173234a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584800; x=1729189600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
        b=elSopkBGV/LG/XHB/FpT5FQ1XT7+s8gQjY51jYXfFfnx0SB95Fq9HirqWw0fsoteYW
         Bffj+ulNayw15y81/0D2n6Yv0IDMpZGIOP92+zOPG2I+hWzmnSL6j82Db+Nnuc+If0F+
         jRQFR5zcK+C9bg3YuwgbQ6dacmJfuU9Yzf5hjvl0BdTAcz0oc/hsnwzTI6VTwzB1N359
         yYxZs5N9ir8CnrpandHwL87esEKL7WNWT1uDtaC+el7gvgzBd+WfI6Ag1K5EEQ/8XTqN
         hmhMLcy6QLvFtNVMU8MuYmQBYmGdxbPvlTqSq9ZDA868gww6BrArZnM7UTRqLXqpeVdC
         26wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584800; x=1729189600;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
        b=vEBROiZ4WjfNGIYBqpociiCFfY8rGcMIyAsn/9PeAGT05WhOrTgmNBHQWzmsc8Hele
         +PpU7hO7/Hzp8RWAd6tadtfZBA5yWdWcivD78cEG+R2tFbs9EhBFTwmxP1tBch5bdv9R
         V+Wk3Dqxkxp0HXtFB+S3xjm620bAywwuiYxuKW0nHYnM+PBBuDijirEct49+s8bcWNZZ
         z5/qqLgPia8E/2ldIzQLS/CofMf4dUwQsWkbP/w2XP6roJN2VsLPoazKeCemzANfGWXe
         DghcNAWnhs0tgNxEALPd/MxdEcewDMCCMj9AcJg8JeN9VQPIR/mbr+iqsORcn4aJLQ2y
         XNgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjG4oqmsTYtqLd8NDirLXt7xmxrgZFeAujEC+Gp0m61n3pAFCzZ2w5x4bOqMUEs/A32U6+9ivnBXCtnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj3lh51eDrS+WIDDDmIE08niWrcLNAAcLre5/UOd4pX+/1dqvO
	AV87YLovfEFKcgAbdSgs5bGFNhobEYp5cPYYe104Oi3FuuNuT4ubQNGNRXDgQGI437GrOYlWpXS
	OSg==
X-Google-Smtp-Source: AGHT+IEd4uxjZrUyEQQM0MU+jkiJqh3LQboji5/ZXtrCgOTVgrRv0yMO5ln1NKE0y5PwnoqkXxjnsp8xFDc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fe86:b0:2da:872e:9ea4 with SMTP id
 98e67ed59e1d1-2e2f0d7e9d7mr54a91.3.1728584798284; Thu, 10 Oct 2024 11:26:38
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:52 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-51-seanjc@google.com>
Subject: [PATCH v13 50/85] KVM: VMX: Hold mmu_lock until page is released when
 updating APIC access page
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
X-CRM114-CacheID: sfid-20241010_112641_505693_98A2815A 
X-CRM114-Status: GOOD (  12.67  )
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

SG9sZCBtbXVfbG9jayBhY3Jvc3Mga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKCkgd2hlbiByZWZyZXNo
aW5nIHRoZSBBUElDCmFjY2VzcyBwYWdlIGFkZHJlc3MgdG8gZW5zdXJlIHRoYXQgS1ZNIGRvZXNu
J3QgbWFyayBhIHBhZ2UvZm9saW8gYXMKYWNjZXNzZWQgYWZ0ZXIgaXQgaGFzIGJlZW4gdW5tYXBw
ZWQuICBQcmFjdGljYWxseSBzcGVha2luZyBtYXJraW5nIGEgZm9saW8KYWNjZXNzZXMgaXMgYmVu
aWduIGluIHRoaXMgc2NlbmFyaW8sIGFzIEtWTSBkb2VzIGhvbGQgYSByZWZlcmVuY2UgKGl0J3MK
cmVhbGx5IGp1c3QgbWFya2luZyBmb2xpb3MgZGlydHkgdGhhdCBpcyBwcm9ibGVtYXRpYyksIGJ1
dCB0aGVyZSdzIG5vCnJlYXNvbiBub3QgdG8gYmUgcGFyYW5vaWQgKG1vdmluZyB0aGUgQVBJQyBh
Y2Nlc3MgcGFnZSBpc24ndCBhIGhvdCBwYXRoKSwKYW5kIG5vIHJlYXNvbiB0byBiZSBkaWZmZXJl
bnQgZnJvbSBvdGhlciBtbXVfbm90aWZpZXItcHJvdGVjdGVkIGZsb3dzIGluCktWTS4KClRlc3Rl
ZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9r
dm0vdm14L3ZteC5jIHwgMjEgKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
dm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCAxYTQ0MzgzNThjNWUu
Ljg1MWJlMDgyMGUwNCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9h
cmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC02ODMyLDI1ICs2ODMyLDIyIEBAIHZvaWQgdm14X3Nl
dF9hcGljX2FjY2Vzc19wYWdlX2FkZHIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlyZXR1cm47
CiAKIAlyZWFkX2xvY2soJnZjcHUtPmt2bS0+bW11X2xvY2spOwotCWlmIChtbXVfaW52YWxpZGF0
ZV9yZXRyeV9nZm4oa3ZtLCBtbXVfc2VxLCBnZm4pKSB7CisJaWYgKG1tdV9pbnZhbGlkYXRlX3Jl
dHJ5X2dmbihrdm0sIG1tdV9zZXEsIGdmbikpCiAJCWt2bV9tYWtlX3JlcXVlc3QoS1ZNX1JFUV9B
UElDX1BBR0VfUkVMT0FELCB2Y3B1KTsKLQkJcmVhZF91bmxvY2soJnZjcHUtPmt2bS0+bW11X2xv
Y2spOwotCQlnb3RvIG91dDsKLQl9CisJZWxzZQorCQl2bWNzX3dyaXRlNjQoQVBJQ19BQ0NFU1Nf
QUREUiwgcGZuX3RvX2hwYShwZm4pKTsKIAotCXZtY3Nfd3JpdGU2NChBUElDX0FDQ0VTU19BRERS
LCBwZm5fdG9faHBhKHBmbikpOwotCXJlYWRfdW5sb2NrKCZ2Y3B1LT5rdm0tPm1tdV9sb2NrKTsK
LQotCS8qCi0JICogTm8gbmVlZCBmb3IgYSBtYW51YWwgVExCIGZsdXNoIGF0IHRoaXMgcG9pbnQs
IEtWTSBoYXMgYWxyZWFkeSBkb25lIGEKLQkgKiBmbHVzaCBpZiB0aGVyZSB3ZXJlIFNQVEVzIHBv
aW50aW5nIGF0IHRoZSBwcmV2aW91cyBwYWdlLgotCSAqLwotb3V0OgogCS8qCiAJICogRG8gbm90
IHBpbiBhcGljIGFjY2VzcyBwYWdlIGluIG1lbW9yeSwgdGhlIE1NVSBub3RpZmllcgogCSAqIHdp
bGwgY2FsbCB1cyBhZ2FpbiBpZiBpdCBpcyBtaWdyYXRlZCBvciBzd2FwcGVkIG91dC4KIAkgKi8K
IAlrdm1fcmVsZWFzZV9wZm5fY2xlYW4ocGZuKTsKKworCS8qCisJICogTm8gbmVlZCBmb3IgYSBt
YW51YWwgVExCIGZsdXNoIGF0IHRoaXMgcG9pbnQsIEtWTSBoYXMgYWxyZWFkeSBkb25lIGEKKwkg
KiBmbHVzaCBpZiB0aGVyZSB3ZXJlIFNQVEVzIHBvaW50aW5nIGF0IHRoZSBwcmV2aW91cyBwYWdl
LgorCSAqLworCXJlYWRfdW5sb2NrKCZ2Y3B1LT5rdm0tPm1tdV9sb2NrKTsKIH0KIAogdm9pZCB2
bXhfaHdhcGljX2lzcl91cGRhdGUoaW50IG1heF9pc3IpCi0tIAoyLjQ3LjAucmMxLjI4OC5nMDYy
OThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
