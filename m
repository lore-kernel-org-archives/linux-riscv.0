Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C23CFC5EB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9iNq5uFWBSWrXrtqbE+vO8YAM4H9lNNm1jE6e0bCjo=; b=ag6kMJL1btwOjb
	6RaalQOGlAKt0LLBF+MFO46F8cKBaTHZt7GyEbbiLQNJSEa2kz0Gs2i37MCpEg/CvjINNxy93Ue3R
	1oA0YvdE33PHjOZWELPA0pIlJ9+Gzg3TgA76G7k8lbYgVYYZsNKD3XK9DjdA0sI6gvA75NKT5x+rh
	cbKvq1FeEF+SHpj5Te0iBc0YhN4D5y2U35ZpNCCb4tMqWC7h11RWpISazkw4yboP0HWNMHulLi/lG
	ABV+22UOGAOH6AHFl/u1rdKy2kMu5zinzCfujwOTiwusxEo3TCpe3KYHXG2/OTmUPZA3oWIqigmvJ
	G/Oazqf5iFuLc7TuCI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syxyH-0000000DuTW-1PAB;
	Thu, 10 Oct 2024 18:33:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqI-0000000Dpcx-32EH
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:24:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20b6144cc2aso12164435ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584693; x=1729189493; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=shU7ea7RlpvjkLopneCrUBkZlJ/eYg9PruxHXuYYqoC41aPvYR8MviFIZwfv2Bs/38
         V6DM4Rhjol1hLNMqyclecumybgC3FqZubBkU0Ging5vsyF/ycStxP1eNRZ8RqYcwUO6+
         QIFFjFEsNwFdIFpKQOMcyhdiOrIwnUVQ0aczRiDG3U5DVsHpbLHR2gdJH5XPGINnkyOW
         FA4jebfmXxekNvf9FQp5hWO5lvvjLPmzuDXreg+TSJZ7IRbakavxEH2Txn31TG40lqKU
         +aVDrvuoXBNGaoduvnd40hFU1e+OVk+YXrp2xtTayTEAIRuw2evu92DsRJUkYmp4M0rX
         Kp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584693; x=1729189493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=bg0avh3eCdFIuHVk3lrCBERPbRQazaBTgXtNMnkUO73NJlV1aY21U3stmBZOUQR/uX
         hBv1wI/gGxYfZyECff/plVGvAno85HTlEVHqODgQPjYTvtzxi0Tdn75kAWZvr9f8NCs8
         vxWBTOVATptg0oq/X5BflDkCgdEeruF2Wl1UJcl07R7bCwJx6n+aZu5sF8AvHvLxVKHN
         vsY3m92DcHNmvPJN2lOqPWzs/SmEJvHIMT3EwqBJjeQZTNbzU+50xWpZ452LiBn0R2gO
         tjZuqEalHPnFIi4WUSBgg4J8/nRf356J5SEcftA6t3+ks8r/TukW4iLMKlCJ3mZELrY8
         nm3A==
X-Forwarded-Encrypted: i=1; AJvYcCVqwI3LXVJ1yKPKOG/O9q5tP8/PSEHkQ2lSLCJOwgJgjdftXcJOdnO3oIspxR7z1zJYzjSd3sVb++k/bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yybz4kRsUC3GaZqwwPlxDDrc+zyrBdiiyT8xmmooFi+K+jrYMRi
	EF8vOQHc9Xk0xed9K9AblvG7co2ngsiCjUCZvgq48Iqo3ssgT/4iOUFB8sqp9czCWMzFM2oQq0k
	gsg==
X-Google-Smtp-Source: AGHT+IHgBvu4/6UpOEaDnS659CK1Rn1/E5r8mTk00ZsUtMRUIXJafj8Ignnkw5WxXqtPYIrr50vXY4UIGHU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:ff02:b0:205:58ee:1567 with SMTP id
 d9443c01a7336-20c80362278mr43175ad.0.1728584692824; Thu, 10 Oct 2024 11:24:52
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:04 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-3-seanjc@google.com>
Subject: [PATCH v13 02/85] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
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
X-CRM114-CacheID: sfid-20241010_112454_782389_E7951E08 
X-CRM114-Status: GOOD (  10.09  )
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

QWxsb3cgcGFzc2luZyBhIE5VTEwgQHBhZ2UgdG8ga3ZtX3JlbGVhc2VfcGFnZV97Y2xlYW4sZGly
dHl9KCksIHRoZXJlJ3Mgbm8KdGFuZ2libGUgYmVuZWZpdCB0byBmb3JjaW5nIHRoZSBjYWxsZXJz
IHRvIHByZS1jaGVjayBAcGFnZSwgYW5kIGl0IGVuZHMgdXAKZ2VuZXJhdGluZyBhIGxvdCBvZiBk
dXBsaWNhdGUgYm9pbGVycGxhdGUgY29kZS4KClJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KLS0tCiB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3ZpcnQv
a3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDRiNjU5YTY0OWRmYS4u
MjAzMjI5MmRmMGIwIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKQEAgLTMxNzksNyArMzE3OSw3IEBAIHN0YXRpYyB2b2lkIGt2bV9zZXRf
cGFnZV9hY2Nlc3NlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKIAogdm9pZCBrdm1fcmVsZWFzZV9wYWdl
X2NsZWFuKHN0cnVjdCBwYWdlICpwYWdlKQogewotCWlmIChXQVJOX09OKCFwYWdlKSkKKwlpZiAo
IXBhZ2UpCiAJCXJldHVybjsKIAogCWt2bV9zZXRfcGFnZV9hY2Nlc3NlZChwYWdlKTsKQEAgLTMy
MDQsNyArMzIwNCw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9yZWxlYXNlX3Bmbl9jbGVhbik7
CiAKIHZvaWQga3ZtX3JlbGVhc2VfcGFnZV9kaXJ0eShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKLQlp
ZiAoV0FSTl9PTighcGFnZSkpCisJaWYgKCFwYWdlKQogCQlyZXR1cm47CiAKIAlrdm1fc2V0X3Bh
Z2VfZGlydHkocGFnZSk7Ci0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
