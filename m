Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216D0D24447
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLGDBnmINk9iNIHfMt/nQmLojOk5Man65yV0msS6bCA=; b=L7aP0wFrYwTcXI
	E8fd97bHqAfXDOTUwP5XfbmXy/PDIiMpBOP8sducQuA554pp6A72Ul1q+KRVCKGYI8mjJMNPoLtjP
	t4E4YpzBrCbMwTMIyUyhNpUcTDlph6YYF9Y93UjP2lZ4Ic7Ser7XgqS9y4yi2sOo3BAc88PWmOq5L
	D6P0uy/KHBnbFElL7xd3yMF3sFKm2W8mDUYrRJKOeTl+t2pVeJPDxZHVeIv4ba+E0aivcH2yYYs9X
	amzZ5KsjoXuK8pLSYBMQ1vin8iGrvwnnIQtWA9X9q81dT3vbjIpp00B4Kcxx+111VszX219pLgIhQ
	0uqnSWXlt99G+FxoVTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syz6v-0000000EAeX-0og4;
	Thu, 10 Oct 2024 19:46:09 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsr-0000000Dri6-0f4k
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:34 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71dff575924so1544123b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584852; x=1729189652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
        b=cLJk3d4tBFRZOiFs+6bQQUgL9+5XLv36ZxgTPI3j7N9jPbVYQn5UYEHXG30q5cZAtp
         iLoVd863iI6QslfhR4bSkprz1688JE5LF2FO2gSOhcM+IGJX0QpjdBnRDdMQ62ouC3oJ
         bplSy/qMe21l7Xy1xG1IlCZN2yro1FWFNRNmv6sS9NMfZSUFAnJgg0EuPch5URNPcMG1
         EWbkSmQF0LU/UoEnI63VnExMYr/1qn9aDn18jIArJhfw+WuPYh6KtbBICRCY7K4lBcNN
         jSLMr/sBO077LKQZMCJI/BZ+oDjzP6wnkJ4048tQ5WDcVuMAxNcfuoW2taX/zjS5bjPT
         jaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584852; x=1729189652;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
        b=SSzFQKsrTT52kN18edqmrZYJFfZrNwjQqLcXpb7C2tTcYfwLNrnUNZZQcZMWhbpOLj
         YgWUDJLnDmh1xaXd1o7gZVz+9ZzPyJFWVWvM4pNVY/Ls0PfAdgeLWHkCYbYqS6YTqR9F
         rYXydc0CW0iZyGcSko9Rr086ugMKud9hdsDL37UoET9IpHb1qJg+Na1B4WMIGints38S
         T+A8XRaYW5F1IG2D6fI4P5EAeC9I3agaETdOqmA3TXwi6nca+megCOBtXNFmDi/dLggu
         VWqcgg9g37P2Jo7PWZ9twesBsd4iZTG2MnK67IiFALJ4yVHbvh+QstCH9Fi9pBoChAeA
         8QtA==
X-Forwarded-Encrypted: i=1; AJvYcCVX5J7yNABiJpAaVJfG+9k5SjqJ72XS3AtxGQ3VKLsRRUGrE1E+3hl/2CPS8N8OC/fv0bRykef9uCWVww==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuz19H/V2unOyEhg2xz5WTz6iaiLbFp2wfNOHSuEOrlaFZawym
	KF4mUqFs47hSDKO44ICLwufaZdev3OX5GQwEtl9xou5rdRngL4qgGGZpV0/at8BO1Iu6/IhhQdU
	1kA==
X-Google-Smtp-Source: AGHT+IHVUYgAS8Gi1OfHaumBjOVs/68U//Xc3NGlK2wEye9l2w1SuCdDQ/WQfsMbBzqgGqsCESzcy3AUxv4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:93b4:0:b0:71d:f64d:712c with SMTP id
 d2e1a72fcca58-71e1db65a16mr7365b3a.1.1728584851459; Thu, 10 Oct 2024 11:27:31
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:17 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-76-seanjc@google.com>
Subject: [PATCH v13 75/85] KVM: Convert gfn_to_page() to use kvm_follow_pfn()
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
X-CRM114-CacheID: sfid-20241010_112733_323638_D767D447 
X-CRM114-Status: UNSURE (   8.42  )
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

Q29udmVydCBnZm5fdG9fcGFnZSgpIHRvIHRoZSBuZXcga3ZtX2ZvbGxvd19wZm4oKSBpbnRlcm5h
bCBBUEksIHdoaWNoIHdpbGwKZXZlbnR1YWxseSBhbGxvdyByZW1vdmluZyBnZm5fdG9fcGZuKCkg
YW5kIGt2bV9wZm5fdG9fcmVmY291bnRlZF9wYWdlKCkuCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhl
cnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogdmlydC9rdm0va3ZtX21haW4uYyB8IDE2ICsr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9t
YWluLmMKaW5kZXggNjk2ZDVlNDI5YjNlLi4xNzgyMjQyYTQ4MDAgMTAwNjQ0Ci0tLSBhL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMzE0NSwxNCArMzE0
NSwxNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcHJlZmV0Y2hfcGFnZXMpOwogICovCiBzdHJ1
Y3QgcGFnZSAqZ2ZuX3RvX3BhZ2Uoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pCiB7Ci0Ja3Zt
X3Bmbl90IHBmbjsKKwlzdHJ1Y3QgcGFnZSAqcmVmY291bnRlZF9wYWdlID0gTlVMTDsKKwlzdHJ1
Y3Qga3ZtX2ZvbGxvd19wZm4ga2ZwID0geworCQkuc2xvdCA9IGdmbl90b19tZW1zbG90KGt2bSwg
Z2ZuKSwKKwkJLmdmbiA9IGdmbiwKKwkJLmZsYWdzID0gRk9MTF9XUklURSwKKwkJLnJlZmNvdW50
ZWRfcGFnZSA9ICZyZWZjb3VudGVkX3BhZ2UsCisJfTsKIAotCXBmbiA9IGdmbl90b19wZm4oa3Zt
LCBnZm4pOwotCi0JaWYgKGlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSkKLQkJcmV0dXJuIE5VTEw7
Ci0KLQlyZXR1cm4ga3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UocGZuKTsKKwkodm9pZClrdm1f
Zm9sbG93X3Bmbigma2ZwKTsKKwlyZXR1cm4gcmVmY291bnRlZF9wYWdlOwogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoZ2ZuX3RvX3BhZ2UpOwogCi0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1n
b29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
