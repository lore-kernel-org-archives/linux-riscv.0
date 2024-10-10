Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B690D24442
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mRJU0IiKvwPrZuW+mfN4ZAM/nax/283V5R79NFNZYA=; b=o8RGYp4mrgn/m5
	YSgTeXCH5qft8E3WTsV2T+QqEO7jBkJ/oX+WejRxLIGqQM7sv8+8KN2Ue+FCxkzpKlcZxSexc0Yi6
	1WGpf83sHI/w61oIS5U8X0S3IyQaTg0PZ/HiY70HEC4Wb3N39PmK9iloWVY2yBcmoYcTthH7zxW4/
	iN8qTw5Bnd8MAQHvVfj1qTwVALMxNw+ANObrKk7RVXgKxBjpBphQKriUA2NRsY7gDSbaXPB4kDuSF
	WmX0fKwdObfAzKl6uWAoaENYoICEX6c0FFAyN1qrNZCCJjNI+7UFjWH6fUXBZ8krscDufH2oLsNPx
	XvKQfsmgMwkHs7qSHynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzIS-0000000ED79-2l0f;
	Thu, 10 Oct 2024 19:58:04 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxtC-0000000Drz7-2hYd
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:56 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7b696999c65so864046a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584873; x=1729189673; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
        b=C91LwOthEGXkxiPQx1j9UVtQEFjUoPUaMYYqnTNP0TCswa9+hhVSEARBcovA5nnV2c
         32Zbt1YX9VZVNqA/MIhC1E9BJoIzGjcTF5OAV0U6hy0FCdm9R8+piH4EntBUT5Flzs0g
         7XRT8akLUDK2TQ7w5LYG7bObbSDKy6EuyXBiGjndcjvGJU4XUeHMGrzHCRWi3yzoHhuS
         sjBWzkfEmw+kj5JGm+gKX2+ScM8kNPIL2wd94uiV/uBTA9RB+YhiZeF2TIqolgG7sF1b
         +fe9fpJERCCgWOqYOz0sVLDF1YIWhDfhuugU+/HTW/vPaD/KWNLvNxRYp2hahT2HA9dL
         ndpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584873; x=1729189673;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
        b=LRuvJKS+Y5Gprny14z/YD5okOvwQErz369BdU6bmCj8Peajf/NADN2Q9UZptiZ/+/J
         YwYwAVS20pQdEljoBw1ZUNipDsKrF4HHwBc1iU/SodYRZYGvUx6DC0UEPlZifknbF7r7
         8HFrGWWGn3ib/3BfIOfoqIDQjvkk/q8o7/AtGYE2ik9gdhxdj635aAbetBbiqgsxW2/R
         QIseW00gedVjfwtrLoO3lg7iYuuTsTqdk4JG4gTj6ETgqq0M7HgTUNCn2Act1593qYxL
         lZephJA41SfPEqDiGhKC/s2+3htAozTJw/VyI9ahaKpkkmoR0gEZ125GmKGtJV42sJNZ
         Q6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVhvOAANITUS8rDTZliIcW7DfFaWjdk30bBc+HkOHerjFgApbAJYg34DPEf/fPT88j+gzfZvX6nygf/fA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4WjZRccNbgb5RNjDHouozw2tMH3N5VUrxOWsHVBfpXfADI4j5
	clBzXE9dFv7os6d3q5spUlkpwoVqeqxNXlHoRHxtNlJXdUtgBKAa6J7Oiak1Ma8mmnnP+BCqg/T
	Klw==
X-Google-Smtp-Source: AGHT+IHZp/jcJ6VF/U4r8Ds8cBqCm7oOG+WyWj8b167iLxGpwwfpynwEnbVm0Ou2T4AqluEw0PW/YyS/yKE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:e715:0:b0:7d5:d088:57d4 with SMTP id
 41be03b00d2f7-7ea535b6b4fmr26a12.9.1728584872016; Thu, 10 Oct 2024 11:27:52
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:27 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-86-seanjc@google.com>
Subject: [PATCH v13 85/85] KVM: Don't grab reference on VM_MIXEDMAP pfns that
 have a "struct page"
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
X-CRM114-CacheID: sfid-20241010_112754_780379_3048782F 
X-CRM114-Status: GOOD (  20.24  )
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

Tm93IHRoYXQgS1ZNIG5vIGxvbmdlciByZWxpZXMgb24gYW4gdWdseSBoZXVyaXN0aWMgdG8gZmlu
ZCBpdHMgc3RydWN0IHBhZ2UKcmVmZXJlbmNlcywgaS5lLiBub3cgdGhhdCBLVk0gY2FuJ3QgZ2V0
IGZhbHNlIHBvc2l0aXZlcyBvbiBWTV9NSVhFRE1BUApwZm5zLCByZW1vdmUgS1ZNJ3MgaGFjayB0
byBlbGV2YXRlIHRoZSByZWZjb3VudCBmb3IgcGZucyB0aGF0IGhhcHBlbiB0bwpoYXZlIGEgdmFs
aWQgc3RydWN0IHBhZ2UuICBJbiBhZGRpdGlvbiB0byByZW1vdmluZyBhIGxvbmctc3RhbmRpbmcg
d2FydAppbiBLVk0sIHRoaXMgYWxsb3dzIEtWTSB0byBtYXAgbm9uLXJlZmNvdW50ZWQgc3RydWN0
IHBhZ2UgbWVtb3J5IGludG8gdGhlCmd1ZXN0LCBlLmcuIGZvciBleHBvc2luZyBHUFUgVFRNIGJ1
ZmZlcnMgdG8gS1ZNIGd1ZXN0cy4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMyAtLQogdmlydC9r
dm0va3ZtX21haW4uYyAgICAgIHwgNzUgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDc2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaAppbmRleCBkMDQ1ZjgzMTBhNDguLjAyZjAyMDZmZDJkYyAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApA
QCAtMTczMCw5ICsxNzMwLDYgQEAgdm9pZCBrdm1fYXJjaF9zeW5jX2V2ZW50cyhzdHJ1Y3Qga3Zt
ICprdm0pOwogCiBpbnQga3ZtX2NwdV9oYXNfcGVuZGluZ190aW1lcihzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOwogCi1zdHJ1Y3QgcGFnZSAqa3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2Uoa3ZtX3Bm
bl90IHBmbik7Ci1ib29sIGt2bV9pc196b25lX2RldmljZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdl
KTsKLQogc3RydWN0IGt2bV9pcnFfYWNrX25vdGlmaWVyIHsKIAlzdHJ1Y3QgaGxpc3Rfbm9kZSBs
aW5rOwogCXVuc2lnbmVkIGdzaTsKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92
aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDM5NmNhMTRmMThmMy4uYjFiMTBkYzQwOGEwIDEwMDY0
NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAg
LTE2MCw1MiArMTYwLDYgQEAgX193ZWFrIHZvaWQga3ZtX2FyY2hfZ3Vlc3RfbWVtb3J5X3JlY2xh
aW1lZChzdHJ1Y3Qga3ZtICprdm0pCiB7CiB9CiAKLWJvb2wga3ZtX2lzX3pvbmVfZGV2aWNlX3Bh
Z2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCi17Ci0JLyoKLQkgKiBUaGUgbWV0YWRhdGEgdXNlZCBieSBp
c196b25lX2RldmljZV9wYWdlKCkgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgb3IKLQkgKiBub3QgYSBw
YWdlIGlzIFpPTkVfREVWSUNFIGlzIGd1YXJhbnRlZWQgdG8gYmUgdmFsaWQgaWYgYW5kIG9ubHkg
aWYKLQkgKiB0aGUgZGV2aWNlIGhhcyBiZWVuIHBpbm5lZCwgZS5nLiBieSBnZXRfdXNlcl9wYWdl
cygpLiAgV0FSTiBpZiB0aGUKLQkgKiBwYWdlX2NvdW50KCkgaXMgemVybyB0byBoZWxwIGRldGVj
dCBiYWQgdXNhZ2Ugb2YgdGhpcyBoZWxwZXIuCi0JICovCi0JaWYgKFdBUk5fT05fT05DRSghcGFn
ZV9jb3VudChwYWdlKSkpCi0JCXJldHVybiBmYWxzZTsKLQotCXJldHVybiBpc196b25lX2Rldmlj
ZV9wYWdlKHBhZ2UpOwotfQotCi0vKgotICogUmV0dXJucyBhICdzdHJ1Y3QgcGFnZScgaWYgdGhl
IHBmbiBpcyAidmFsaWQiIGFuZCBiYWNrZWQgYnkgYSByZWZjb3VudGVkCi0gKiBwYWdlLCBOVUxM
IG90aGVyd2lzZS4gIE5vdGUsIHRoZSBsaXN0IG9mIHJlZmNvdW50ZWQgUEdfcmVzZXJ2ZWQgcGFn
ZSB0eXBlcwotICogaXMgbGlrZWx5IGluY29tcGxldGUsIGl0IGhhcyBiZWVuIGNvbXBpbGVkIHB1
cmVseSB0aHJvdWdoIHBlb3BsZSB3YW50aW5nIHRvCi0gKiBiYWNrIGd1ZXN0IHdpdGggYSBjZXJ0
YWluIHR5cGUgb2YgbWVtb3J5IGFuZCBlbmNvdW50ZXJpbmcgaXNzdWVzLgotICovCi1zdHJ1Y3Qg
cGFnZSAqa3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2Uoa3ZtX3Bmbl90IHBmbikKLXsKLQlzdHJ1
Y3QgcGFnZSAqcGFnZTsKLQotCWlmICghcGZuX3ZhbGlkKHBmbikpCi0JCXJldHVybiBOVUxMOwot
Ci0JcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Ci0JaWYgKCFQYWdlUmVzZXJ2ZWQocGFnZSkpCi0J
CXJldHVybiBwYWdlOwotCi0JLyogVGhlIFpFUk9fUEFHRShzKSBpcyBtYXJrZWQgUEdfcmVzZXJ2
ZWQsIGJ1dCBpcyByZWZjb3VudGVkLiAqLwotCWlmIChpc196ZXJvX3BmbihwZm4pKQotCQlyZXR1
cm4gcGFnZTsKLQotCS8qCi0JICogWk9ORV9ERVZJQ0UgcGFnZXMgY3VycmVudGx5IHNldCBQR19y
ZXNlcnZlZCwgYnV0IGZyb20gYSByZWZjb3VudGluZwotCSAqIHBlcnNwZWN0aXZlIHRoZXkgYXJl
ICJub3JtYWwiIHBhZ2VzLCBhbGJlaXQgd2l0aCBzbGlnaHRseSBkaWZmZXJlbnQKLQkgKiB1c2Fn
ZSBydWxlcy4KLQkgKi8KLQlpZiAoa3ZtX2lzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkpCi0JCXJl
dHVybiBwYWdlOwotCi0JcmV0dXJuIE5VTEw7Ci19Ci0KIC8qCiAgKiBTd2l0Y2hlcyB0byBzcGVj
aWZpZWQgdmNwdSwgdW50aWwgYSBtYXRjaGluZyB2Y3B1X3B1dCgpCiAgKi8KQEAgLTI4MDQsMzUg
KzI3NTgsMTAgQEAgc3RhdGljIGt2bV9wZm5fdCBrdm1fcmVzb2x2ZV9wZm4oc3RydWN0IGt2bV9m
b2xsb3dfcGZuICprZnAsIHN0cnVjdCBwYWdlICpwYWdlLAogCWlmIChrZnAtPm1hcF93cml0YWJs
ZSkKIAkJKmtmcC0+bWFwX3dyaXRhYmxlID0gd3JpdGFibGU7CiAKLQkvKgotCSAqIEZJWE1FOiBS
ZW1vdmUgdGhpcyBvbmNlIEtWTSBubyBsb25nZXIgYmxpbmRseSBjYWxscyBwdXRfcGFnZSgpIG9u
Ci0JICoJICBldmVyeSBwZm4gdGhhdCBwb2ludHMgYXQgYSBzdHJ1Y3QgcGFnZS4KLQkgKgotCSAq
IEdldCBhIHJlZmVyZW5jZSBmb3IgZm9sbG93X3B0ZSgpIHBmbnMgaWYgdGhleSBoYXBwZW4gdG8g
cG9pbnQgYXQgYQotCSAqIHN0cnVjdCBwYWdlLCBhcyBLVk0gd2lsbCB1bHRpbWF0ZWx5IGNhbGwg
a3ZtX3JlbGVhc2VfcGZuX2NsZWFuKCkgb24KLQkgKiB0aGUgcmV0dXJuZWQgcGZuLCBpLmUuIEtW
TSBleHBlY3RzIHRvIGhhdmUgYSByZWZlcmVuY2UuCi0JICoKLQkgKiBDZXJ0YWluIElPIG9yIFBG
Tk1BUCBtYXBwaW5ncyBjYW4gYmUgYmFja2VkIHdpdGggdmFsaWQgc3RydWN0IHBhZ2VzLAotCSAq
IGJ1dCBiZSBhbGxvY2F0ZWQgd2l0aG91dCByZWZjb3VudGluZywgZS5nLiB0YWlsIHBhZ2VzIG9m
Ci0JICogbm9uLWNvbXBvdW5kIGhpZ2hlciBvcmRlciBhbGxvY2F0aW9ucy4gIEdyYWJiaW5nIGFu
ZCBwdXR0aW5nIGEKLQkgKiByZWZlcmVuY2UgdG8gc3VjaCBwYWdlcyB3b3VsZCBjYXVzZSBLVk0g
dG8gcHJlbWF0dXJlbHkgZnJlZSBhIHBhZ2UKLQkgKiBpdCBkb2Vzbid0IG93biAoS1ZNIGdldHMg
YW5kIHB1dHMgdGhlIG9uZSBhbmQgb25seSByZWZlcmVuY2UpLgotCSAqIERvbid0IGFsbG93IHRo
b3NlIHBhZ2VzIHVudGlsIHRoZSBGSVhNRSBpcyByZXNvbHZlZC4KLQkgKgotCSAqIERvbid0IGdy
YWIgYSByZWZlcmVuY2UgZm9yIHBpbnMsIGNhbGxlcnMgdGhhdCBwaW4gcGFnZXMgYXJlIHJlcXVp
cmVkCi0JICogdG8gY2hlY2sgcmVmY291bnRlZF9wYWdlLCBpLmUuIG11c3Qgbm90IGJsaW5kbHkg
cmVsZWFzZSB0aGUgcGZuLgotCSAqLwotCWlmIChtYXApIHsKKwlpZiAobWFwKQogCQlwZm4gPSBt
YXAtPnBmbjsKLQotCQlpZiAoIWtmcC0+cGluKSB7Ci0JCQlwYWdlID0ga3ZtX3Bmbl90b19yZWZj
b3VudGVkX3BhZ2UocGZuKTsKLQkJCWlmIChwYWdlICYmICFnZXRfcGFnZV91bmxlc3NfemVybyhw
YWdlKSkKLQkJCQlyZXR1cm4gS1ZNX1BGTl9FUlJfRkFVTFQ7Ci0JCX0KLQl9IGVsc2UgeworCWVs
c2UKIAkJcGZuID0gcGFnZV90b19wZm4ocGFnZSk7Ci0JfQogCiAJKmtmcC0+cmVmY291bnRlZF9w
YWdlID0gcGFnZTsKIAotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
