Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E12C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ItJGaULP4ORZNvgm4ehNMVWykeHt/umYkQgpSZwDhg=; b=tgscJPXVWvM6/a
	5ogXzlerffsdO6jw0uVX85UZu44WotYlWABSD/QvMDdPn/OzfjfC0CcOOQYLNalNOxWnJzfJU+9Bm
	dN9w8WQvRwf9zd6X6Zq8sgrsgnTcjzpQFRAjECdCD+r+cRoLLsxq2Q71elQyF+flHHC1r93QjCMQj
	mZ7E0vZwUMuJvNZp3b0NE+PnnpCt11dM2MlER9XXQuEnNWkuuPOO6PD0MgBkaQ49WIMpAm2NSdrEk
	qVQ0FmATX12n779plmey3YGZozUhtuOXjJeWgjh4ZRpIO86pzri1QC1xKpJoMPAC6UMVs09HZ+COT
	gXZzk1OJGFnjs5oi2PGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIRg-00000009KWq-0457;
	Thu, 17 Jul 2025 06:50:20 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIRc-00000009KUv-3crI
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 06:50:18 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-875acfc133dso24604539f.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752735016; x=1753339816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRP0QV8PsF634DZbiH7Bzk9P/KhNWvkCg2Ntb8AXlf8=;
        b=e4rEa8ceLn7tsBQTziyIgGqkHjShvSoPq2xN6mI3WDD9mMokIJNhFl5/uci/L4dBF4
         UkAEUUbOQ3sTWzN0vBvQxDWP2Rg9UAL3GMe4W2ZHDs4yehwXEhGEhHrsYbdP6jPHIJr4
         1QkSLG2AlrkF2TApKdXRWweB+kFDuyKln/P5+Ooe78ey+zuSKvIxQq0+TNA2Z/a83Xno
         7S9aoEMKNQTDtTINVtC3iJxahi7aCioONd25Jt/G2ALVtYaEopYOW6KlL0J/sm4HWYj/
         3RHNX3ZvC+LLQzljhcrqltaUKMHgIWf7oxQB3dvsBo8UAjGL56wfmHiDXwY7db7duG8Z
         QuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735016; x=1753339816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRP0QV8PsF634DZbiH7Bzk9P/KhNWvkCg2Ntb8AXlf8=;
        b=bXs0owhOjYqJuY/0SJlkH+rFh3OBA7g+l8RAuQHO/IA8939P7Sp1hb7P/c0aZ4eE9f
         2OypQMGg5xcjOiUJ9cf9qHcRcJ0lQHcTBQJhy2wsOL50iTcgtwIlhxoDM/h431FiW3w4
         +HMtnqlqLCNcVs/bkc0bnpqk+r1qtjvSWPBRXuX/MXE3obWUcKtn6xQfI8cjR+ir0gUq
         QWI9aADlzT6iN9UbvwlCkPmPJwBrKLxXxeGGOa0tvkD+9QJlYxEa0FhzOC18GdTiIDsg
         6UkUEFhXaTzzUa2YUNGm7RpxEqFkHrSfG55n/o/8KZZQwsly4fhD8vR61c1LoXnaZejV
         ukMA==
X-Forwarded-Encrypted: i=1; AJvYcCWasLw01HA3O3TvYpQbXDEEiQpGWMcSCQN52qXbOGT1XON+AnjxTLCTspgHxE5XlpaE0dkikx2s/YLk2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxThMwny4uYY5eU2NqwIWBaYnNE2CKAcnmV0bAX4wnEMcrXSCCG
	bVIvd1wI2LzlyupKG4TnWwXwmemlU1oD6+8S29piZdoEGISEb1L+kwpx7pyaH50IHPw/0XoKVYK
	r+IzAU9DxBnFhQ7pgwAXvLoYeA+9Ovlk2PHtpV+RuyqHrBJ0PKsAW
X-Gm-Gg: ASbGncthptxOMCHbMckdqPit0YN0c3h02VZ3OFbNDfh9yy8mHybv7YZwM416uMyfO+0
	KO//bIibNsc6Ps7n/n5WrPfMDsLC44wUoz+uJZ10WuxLqLx8llWBORn5KO/O1z7hh+A97ggL8k3
	ub/fd9TYx/EbQhGPq/2zULaczaheHiUCobNxv5o8AWKwrr5l+ybYIoNeRc1Izt4vj4afrb9EB2H
	HrfbjO274SGNOHS
X-Google-Smtp-Source: AGHT+IFZ8nvXjCaZDaRw8/yf5Mquo02OxAogwOkqoPvU2H/adfyL7R+G1wf2juDA3dRWlbOsvfGrx3RO4c7yvPjrEd0=
X-Received: by 2002:a05:6602:b87:b0:873:3691:6fb8 with SMTP id
 ca18e2360f4ac-879c2a9ce57mr522646239f.8.1752735015916; Wed, 16 Jul 2025
 23:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <230d6c8c8b8dd83081fcfd8d83a4d17c8245fa2f.1731552790.git.zhouquan@iscas.ac.cn>
In-Reply-To: <230d6c8c8b8dd83081fcfd8d83a4d17c8245fa2f.1731552790.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 12:20:04 +0530
X-Gm-Features: Ac12FXxjsfWvqdAAcziMJWepGgazwPrr9F7mVz3S3QUEnBEAVtT1PWIUTzHtpEM
Message-ID: <CAAhSdy26sV0SKjzKJoWF9vH2gLsBnqRfV1rCrWGokM0E=w0nJg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use find_vma_intersection() to search for
 intersecting VMAs
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235016_900300_1FEB0342 
X-CRM114-Status: GOOD (  15.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNjo0M+KAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gVGhl
cmUgaXMgYWxyZWFkeSBhIGhlbHBlciBmdW5jdGlvbiBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24oKSBp
biBLVk0KPiBmb3Igc2VhcmNoaW5nIGludGVyc2VjdGluZyBWTUFzLCB1c2UgaXQgZGlyZWN0bHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVk
IHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vbW11LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMg
Yi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IGI2MzY1MGY5Yjk2Ni4uMzQ1MmE4Yjc3YWYz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vbW11LmMKPiBAQCAtNDg3LDEwICs0ODcsMTEgQEAgaW50IGt2bV9hcmNoX3ByZXBhcmVfbWVt
b3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgKiAgICAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgICAgICAgICovCj4gICAgICAg
ICBkbyB7Cj4gLSAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gZmlu
ZF92bWEoY3VycmVudC0+bW0sIGh2YSk7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hOwo+ICAgICAgICAgICAgICAgICBodmFfdCB2bV9zdGFydCwgdm1fZW5kOwo+
Cj4gLSAgICAgICAgICAgICAgIGlmICghdm1hIHx8IHZtYS0+dm1fc3RhcnQgPj0gcmVnX2VuZCkK
PiArICAgICAgICAgICAgICAgdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9uKGN1cnJlbnQtPm1t
LCBodmEsIHJlZ19lbmQpOwo+ICsgICAgICAgICAgICAgICBpZiAoIXZtYSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPgo+ICAgICAgICAgICAgICAgICAvKgo+IC0tCj4gMi4zNC4x
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
