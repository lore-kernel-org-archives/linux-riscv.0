Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC21D24454
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+EBDty2r0KkiZce4Fyu9yKKAHNGaa25WFTqfloVn8k=; b=mKnzKv0zeXFJwr
	391z+55xIAqGNXK/Um56/xn+2CGsGpjBycHbHpbzU39dE+Qhu2YVZYsdp+lAbxpflm8EizXy61sdo
	paH31P5dCb2igXVC73D7yl1cmeX+klyIzuat/3qRepdFs9fTrdM/Kl+gW3t8o2VbYrA56LlDeWCj5
	Ox7XC2YFy+8b2x7eK+WoJvL/7Aczbvlhd+h7IcVKOpf8jWQ97FbeHX89BlmXu/rQ6GtlcxD8NtoT4
	mvLWgS/jz6AQhoP1qWDWuHEHDYgPNY9YBWmliPCHAtfPhnlaeDO1YuwpkyII63r2AVdO2Cj2JcmI/
	RpoV6IHUgJYrCVwP3QWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0WK-0000000ENXX-4BCS;
	Thu, 10 Oct 2024 21:16:29 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrK-0000000DqT0-2D6X
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e290b8b69f8so2137714276.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584757; x=1729189557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQaiAwtn89tr8uPQzQfay17fvGV3F3WPslUlHA+BgDY=;
        b=OSACH8GjnuyuiXpMfRDQCjz+rzwPNx3aGaepvL099zA8znTQC1egQ2seldu9OeijMU
         LazKJ2ZGVLT3cJM5U1v/DaYRFVPu0uxfn8zMN/VSc5LNS7kFSdzT1N8jORlYegWBdM/M
         6+R11SLiQDzZrRPEGc1qEG0QzXF6NWx2dCA+IXrYAeG9Ro77XlesdpijfZpvz09fesrT
         q+fr7nWvVHD1GEkg/Q0M4eSGZNQMP2USY0zm3KIrxgzWmSOvWe+t8nR4i6Zd1AWzpjTY
         FkihywB7cmxcQ55tLY2qp4bZYNfslEZRg29M9xzmTj8+zhGiB5ThGCdBROkdMErWT8rb
         +SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584757; x=1729189557;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQaiAwtn89tr8uPQzQfay17fvGV3F3WPslUlHA+BgDY=;
        b=mPFWWQb5oS0RGoq8dguiaT2nqKcp3eTQQdA0sn2hEFvnRvdF7bnzz5VEVxkhDgk5m0
         A0ELfKXQzQrEVrMsNYBm/WjVpxRcDN+FH3aG6M3hVm4o94nAYXIE4BhxyqKyv/PywThZ
         hCI+NZ7MavmgMhKPFjocKaMnqPtdUZYGWEN4YeJ5ZIGaky5aH9dUr7OJYShYtP1osozU
         HbzidlXbU9XQs8PC9SWy9a10CW/zE2c/6WRRRrwg/dtciRMijuXdOD2tx0BqO29mLfDm
         kNx40AC/hIgva3xT4rtPNzHiswOevDKfboVFO/ZoE9+lpODMCJZBYVpMhs8m6686b327
         1UhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk7F+0jkdM5BQz5NwikGb/cUFxzoyn969mBkLLrd446W8uR/O2dioRV5HyY0pSjoMzXKMSZbgRR7uMsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsWmERfmqapbEfan5GNT5vFIul7WjnK+LKXb4EOTYdS8aNPTpq
	ja8Xbpm1vp0WFe1frts7o/chTRHkrvbm+9mhCxOq5pf9Nc+eHs4ZGOKANclF5B5L93+iiPzzzG3
	+ig==
X-Google-Smtp-Source: AGHT+IHY0yNiFmgeAXsfVKl7EbEBY2R3q1IXvjRBHtSPoxXhe2HbHq4twyB0Huv0R+/OHvP6V1ZW3nZzpzQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:80cb:0:b0:e20:2502:be14 with SMTP id
 3f1490d57ef6-e28fe410672mr4860276.7.1728584757233; Thu, 10 Oct 2024 11:25:57
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:33 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-32-seanjc@google.com>
Subject: [PATCH v13 31/85] KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
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
X-CRM114-CacheID: sfid-20241010_112558_743167_7EC3FFEC 
X-CRM114-Status: GOOD (  22.60  )
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

UGluLCBhcyBpbiBGT0xMX1BJTiwgcGFnZXMgd2hlbiBtYXBwaW5nIHRoZW0gZm9yIGRpcmVjdCBh
Y2Nlc3MgYnkgS1ZNLgpBcyBwZXIgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9waW5fdXNlcl9wYWdl
cy5yc3QsIHdyaXRpbmcgdG8gYSBwYWdlIHRoYXQKd2FzIGdvdHRlbiB2aWEgRk9MTF9HRVQgaXMg
ZXhwbGljaXRseSBkaXNhbGxvd2VkLgoKICBDb3JyZWN0ICh1c2VzIEZPTExfUElOIGNhbGxzKToK
ICAgICAgcGluX3VzZXJfcGFnZXMoKQogICAgICB3cml0ZSB0byB0aGUgZGF0YSB3aXRoaW4gdGhl
IHBhZ2VzCiAgICAgIHVucGluX3VzZXJfcGFnZXMoKQoKICBJTkNPUlJFQ1QgKHVzZXMgRk9MTF9H
RVQgY2FsbHMpOgogICAgICBnZXRfdXNlcl9wYWdlcygpCiAgICAgIHdyaXRlIHRvIHRoZSBkYXRh
IHdpdGhpbiB0aGUgcGFnZXMKICAgICAgcHV0X3BhZ2UoKQoKVW5mb3J0dW5hdGVseSwgRk9MTF9Q
SU4gaXMgYSAicHJpdmF0ZSIgZmxhZywgYW5kIHNvIGt2bV9mb2xsb3dfcGZuIG11c3QKdXNlIGEg
b25lLW9mZiBib29sIGluc3RlYWQgb2YgYmVpbmcgYWJsZSB0byBwaWdneWJhY2sgdGhlICJmbGFn
cyIgZmllbGQuCgpMaW5rOiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvOTMwNjY3Ckxpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNjgzMDQ0MTYyLmdpdC5sc3RvYWtlc0Bn
bWFpbC5jb20KVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgot
LS0KIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8ICAyICstCiB2aXJ0L2t2bS9rdm1fbWFpbi5j
ICAgICAgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiB2aXJ0
L2t2bS9rdm1fbW0uaCAgICAgICAgfCAgNyArKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDcgaW5z
ZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDAyYWIzYTY1N2FhNi4u
ODczOWI5MDVkODViIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC0yODAsNyArMjgwLDcgQEAgc3RydWN0IGt2bV9o
b3N0X21hcCB7CiAJICogY2FuIGJlIHVzZWQgYXMgZ3Vlc3QgbWVtb3J5IGJ1dCB0aGV5IGFyZSBu
b3QgbWFuYWdlZCBieSBob3N0CiAJICoga2VybmVsKS4KIAkgKi8KLQlzdHJ1Y3QgcGFnZSAqcmVm
Y291bnRlZF9wYWdlOworCXN0cnVjdCBwYWdlICpwaW5uZWRfcGFnZTsKIAlzdHJ1Y3QgcGFnZSAq
cGFnZTsKIAl2b2lkICpodmE7CiAJa3ZtX3Bmbl90IHBmbjsKZGlmZiAtLWdpdCBhL3ZpcnQva3Zt
L2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IGIxYzFiN2U0ZjMzYS4uNDBh
NTk1MjZkNDY2IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3Zt
L2t2bV9tYWluLmMKQEAgLTI4MTQsOSArMjgxNCwxMiBAQCBzdGF0aWMga3ZtX3Bmbl90IGt2bV9y
ZXNvbHZlX3BmbihzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwgc3RydWN0IHBhZ2UgKnBhZ2Us
CiAJICovCiAJaWYgKG1hcCkgewogCQlwZm4gPSBtYXAtPnBmbjsKLQkJcGFnZSA9IGt2bV9wZm5f
dG9fcmVmY291bnRlZF9wYWdlKHBmbik7Ci0JCWlmIChwYWdlICYmICFnZXRfcGFnZV91bmxlc3Nf
emVybyhwYWdlKSkKLQkJCXJldHVybiBLVk1fUEZOX0VSUl9GQVVMVDsKKworCQlpZiAoIWtmcC0+
cGluKSB7CisJCQlwYWdlID0ga3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UocGZuKTsKKwkJCWlm
IChwYWdlICYmICFnZXRfcGFnZV91bmxlc3NfemVybyhwYWdlKSkKKwkJCQlyZXR1cm4gS1ZNX1BG
Tl9FUlJfRkFVTFQ7CisJCX0KIAl9IGVsc2UgewogCQlwZm4gPSBwYWdlX3RvX3BmbihwYWdlKTsK
IAl9CkBAIC0yODM0LDE2ICsyODM3LDI0IEBAIHN0YXRpYyBrdm1fcGZuX3Qga3ZtX3Jlc29sdmVf
cGZuKHN0cnVjdCBrdm1fZm9sbG93X3BmbiAqa2ZwLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIHN0YXRp
YyBib29sIGh2YV90b19wZm5fZmFzdChzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwga3ZtX3Bm
bl90ICpwZm4pCiB7CiAJc3RydWN0IHBhZ2UgKnBhZ2U7CisJYm9vbCByOwogCiAJLyoKLQkgKiBG
YXN0IHBpbiBhIHdyaXRhYmxlIHBmbiBvbmx5IGlmIGl0IGlzIGEgd3JpdGUgZmF1bHQgcmVxdWVz
dAotCSAqIG9yIHRoZSBjYWxsZXIgYWxsb3dzIHRvIG1hcCBhIHdyaXRhYmxlIHBmbiBmb3IgYSBy
ZWFkIGZhdWx0Ci0JICogcmVxdWVzdC4KKwkgKiBUcnkgdGhlIGZhc3Qtb25seSBwYXRoIHdoZW4g
dGhlIGNhbGxlciB3YW50cyB0byBwaW4vZ2V0IHRoZSBwYWdlIGZvcgorCSAqIHdyaXRpbmcuICBJ
ZiB0aGUgY2FsbGVyIG9ubHkgd2FudHMgdG8gcmVhZCB0aGUgcGFnZSwgS1ZNIG11c3QgZ28KKwkg
KiBkb3duIHRoZSBmdWxsLCBzbG93IHBhdGggaW4gb3JkZXIgdG8gYXZvaWQgcmFjaW5nIGFuIG9w
ZXJhdGlvbiB0aGF0CisJICogYnJlYWtzIENvcHktb24tV3JpdGUgKENvVyksIGUuZy4gc28gdGhh
dCBLVk0gZG9lc24ndCBlbmQgdXAgcG9pbnRpbmcKKwkgKiBhdCB0aGUgb2xkLCByZWFkLW9ubHkg
cGFnZSB3aGlsZSBtbS8gcG9pbnRzIGF0IGEgbmV3LCB3cml0YWJsZSBwYWdlLgogCSAqLwogCWlm
ICghKChrZnAtPmZsYWdzICYgRk9MTF9XUklURSkgfHwga2ZwLT5tYXBfd3JpdGFibGUpKQogCQly
ZXR1cm4gZmFsc2U7CiAKLQlpZiAoZ2V0X3VzZXJfcGFnZV9mYXN0X29ubHkoa2ZwLT5odmEsIEZP
TExfV1JJVEUsICZwYWdlKSkgeworCWlmIChrZnAtPnBpbikKKwkJciA9IHBpbl91c2VyX3BhZ2Vz
X2Zhc3Qoa2ZwLT5odmEsIDEsIEZPTExfV1JJVEUsICZwYWdlKSA9PSAxOworCWVsc2UKKwkJciA9
IGdldF91c2VyX3BhZ2VfZmFzdF9vbmx5KGtmcC0+aHZhLCBGT0xMX1dSSVRFLCAmcGFnZSk7CisK
KwlpZiAocikgewogCQkqcGZuID0ga3ZtX3Jlc29sdmVfcGZuKGtmcCwgcGFnZSwgTlVMTCwgdHJ1
ZSk7CiAJCXJldHVybiB0cnVlOwogCX0KQEAgLTI4NzIsMTAgKzI4ODMsMjEgQEAgc3RhdGljIGlu
dCBodmFfdG9fcGZuX3Nsb3coc3RydWN0IGt2bV9mb2xsb3dfcGZuICprZnAsIGt2bV9wZm5fdCAq
cGZuKQogCXN0cnVjdCBwYWdlICpwYWdlLCAqd3BhZ2U7CiAJaW50IG5wYWdlczsKIAotCW5wYWdl
cyA9IGdldF91c2VyX3BhZ2VzX3VubG9ja2VkKGtmcC0+aHZhLCAxLCAmcGFnZSwgZmxhZ3MpOwor
CWlmIChrZnAtPnBpbikKKwkJbnBhZ2VzID0gcGluX3VzZXJfcGFnZXNfdW5sb2NrZWQoa2ZwLT5o
dmEsIDEsICZwYWdlLCBmbGFncyk7CisJZWxzZQorCQlucGFnZXMgPSBnZXRfdXNlcl9wYWdlc191
bmxvY2tlZChrZnAtPmh2YSwgMSwgJnBhZ2UsIGZsYWdzKTsKIAlpZiAobnBhZ2VzICE9IDEpCiAJ
CXJldHVybiBucGFnZXM7CiAKKwkvKgorCSAqIFBpbm5pbmcgaXMgbXV0dWFsbHkgZXhjbHVzaXZl
IHdpdGggb3Bwb3J0dW5pc3RpY2FsbHkgbWFwcGluZyBhIHJlYWQKKwkgKiBmYXVsdCBhcyB3cml0
YWJsZSwgYXMgS1ZNIHNob3VsZCBuZXZlciBwaW4gcGFnZXMgd2hlbiBtYXBwaW5nIG1lbW9yeQor
CSAqIGludG8gdGhlIGd1ZXN0IChwaW5uaW5nIGlzIG9ubHkgZm9yIGRpcmVjdCBhY2Nlc3NlcyBm
cm9tIEtWTSkuCisJICovCisJaWYgKFdBUk5fT05fT05DRShrZnAtPm1hcF93cml0YWJsZSAmJiBr
ZnAtPnBpbikpCisJCWdvdG8gb3V0OworCiAJLyogbWFwIHJlYWQgZmF1bHQgYXMgd3JpdGFibGUg
aWYgcG9zc2libGUgKi8KIAlpZiAoIShmbGFncyAmIEZPTExfV1JJVEUpICYmIGtmcC0+bWFwX3dy
aXRhYmxlICYmCiAJICAgIGdldF91c2VyX3BhZ2VfZmFzdF9vbmx5KGtmcC0+aHZhLCBGT0xMX1dS
SVRFLCAmd3BhZ2UpKSB7CkBAIC0yODg0LDYgKzI5MDYsNyBAQCBzdGF0aWMgaW50IGh2YV90b19w
Zm5fc2xvdyhzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwga3ZtX3Bmbl90ICpwZm4pCiAJCWZs
YWdzIHw9IEZPTExfV1JJVEU7CiAJfQogCitvdXQ6CiAJKnBmbiA9IGt2bV9yZXNvbHZlX3Bmbihr
ZnAsIHBhZ2UsIE5VTEwsIGZsYWdzICYgRk9MTF9XUklURSk7CiAJcmV0dXJuIG5wYWdlczsKIH0K
QEAgLTMwOTksMTAgKzMxMjIsMTEgQEAgaW50IGt2bV92Y3B1X21hcChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIGdmbl90IGdmbiwgc3RydWN0IGt2bV9ob3N0X21hcCAqbWFwKQogCQkuc2xvdCA9IGdm
bl90b19tZW1zbG90KHZjcHUtPmt2bSwgZ2ZuKSwKIAkJLmdmbiA9IGdmbiwKIAkJLmZsYWdzID0g
Rk9MTF9XUklURSwKLQkJLnJlZmNvdW50ZWRfcGFnZSA9ICZtYXAtPnJlZmNvdW50ZWRfcGFnZSwK
KwkJLnJlZmNvdW50ZWRfcGFnZSA9ICZtYXAtPnBpbm5lZF9wYWdlLAorCQkucGluID0gdHJ1ZSwK
IAl9OwogCi0JbWFwLT5yZWZjb3VudGVkX3BhZ2UgPSBOVUxMOworCW1hcC0+cGlubmVkX3BhZ2Ug
PSBOVUxMOwogCW1hcC0+cGFnZSA9IE5VTEw7CiAJbWFwLT5odmEgPSBOVUxMOwogCW1hcC0+Z2Zu
ID0gZ2ZuOwpAQCAtMzEzOSwxNiArMzE2MywxNiBAQCB2b2lkIGt2bV92Y3B1X3VubWFwKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ob3N0X21hcCAqbWFwLCBib29sIGRpcnR5KQog
CWlmIChkaXJ0eSkKIAkJa3ZtX3ZjcHVfbWFya19wYWdlX2RpcnR5KHZjcHUsIG1hcC0+Z2ZuKTsK
IAotCWlmIChtYXAtPnJlZmNvdW50ZWRfcGFnZSkgeworCWlmIChtYXAtPnBpbm5lZF9wYWdlKSB7
CiAJCWlmIChkaXJ0eSkKLQkJCWt2bV9yZWxlYXNlX3BhZ2VfZGlydHkobWFwLT5yZWZjb3VudGVk
X3BhZ2UpOwotCQllbHNlCi0JCQlrdm1fcmVsZWFzZV9wYWdlX2NsZWFuKG1hcC0+cmVmY291bnRl
ZF9wYWdlKTsKKwkJCWt2bV9zZXRfcGFnZV9kaXJ0eShtYXAtPnBpbm5lZF9wYWdlKTsKKwkJa3Zt
X3NldF9wYWdlX2FjY2Vzc2VkKG1hcC0+cGlubmVkX3BhZ2UpOworCQl1bnBpbl91c2VyX3BhZ2Uo
bWFwLT5waW5uZWRfcGFnZSk7CiAJfQogCiAJbWFwLT5odmEgPSBOVUxMOwogCW1hcC0+cGFnZSA9
IE5VTEw7Ci0JbWFwLT5yZWZjb3VudGVkX3BhZ2UgPSBOVUxMOworCW1hcC0+cGlubmVkX3BhZ2Ug
PSBOVUxMOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3ZjcHVfdW5tYXApOwogCmRpZmYgLS1n
aXQgYS92aXJ0L2t2bS9rdm1fbW0uaCBiL3ZpcnQva3ZtL2t2bV9tbS5oCmluZGV4IGQzYWMxYmE4
YmE2Ni4uYWNlZjNmNWM1ODJhIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbW0uaAorKysgYi92
aXJ0L2t2bS9rdm1fbW0uaApAQCAtMzAsNiArMzAsMTMgQEAgc3RydWN0IGt2bV9mb2xsb3dfcGZu
IHsKIAkvKiBGT0xMXyogZmxhZ3MgbW9kaWZ5aW5nIGxvb2t1cCBiZWhhdmlvciwgZS5nLiBGT0xM
X1dSSVRFLiAqLwogCXVuc2lnbmVkIGludCBmbGFnczsKIAorCS8qCisJICogUGluIHRoZSBwYWdl
IChlZmZlY3RpdmVseSBGT0xMX1BJTiwgd2hpY2ggaXMgYW4gbW0vIGludGVybmFsIGZsYWcpLgor
CSAqIFRoZSBwYWdlICptdXN0KiBiZSBwaW5uZWQgaWYgS1ZNIHdpbGwgd3JpdGUgdG8gdGhlIHBh
Z2UgdmlhIGEga2VybmVsCisJICogbWFwcGluZywgZS5nLiB2aWEga21hcCgpLCBtcmVtYXAoKSwg
ZXRjLgorCSAqLworCWJvb2wgcGluOworCiAJLyoKIAkgKiBJZiBub24tTlVMTCwgdHJ5IHRvIGdl
dCBhIHdyaXRhYmxlIG1hcHBpbmcgZXZlbiBmb3IgYSByZWFkIGZhdWx0LgogCSAqIFNldCB0byB0
cnVlIGlmIGEgd3JpdGFibGUgbWFwcGluZyB3YXMgb2J0YWluZWQuCi0tIAoyLjQ3LjAucmMxLjI4
OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
