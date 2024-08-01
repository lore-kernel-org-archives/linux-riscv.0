Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D733C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO33KmwGPmnSj02l6ztdhyaJy/aU0FCLgGagAEkrY4o=; b=3oMK8zBeJmZAzy
	hbtl1Kt2Tq/kxvxO3AcJH+eKbknbeOCwg3WYtrOjsKv7ytRdk8VRZ0b9+dBpaqFoBoMu5gMz+1hSD
	qxTnOWPvagQPfdEfE7H4VdLKg0eAITkZ6FoYHXeQepKAFOL3GccFlv3Dk9GHyNSBEPJwDOglxqsc+
	4M3h6OEuBM5l/Z3zs9BtiV/BeHruiTAKZbYK9oDisb86oCv+dYhZP/2PZESzDF3c35CE4SLYJZZdD
	rj9xIMvHv3+CCJ/FE7lP9nH/GmDTeg9Zojcs/s3LHC+Y3zAR2bhNslQi758IofMVongncbDm4NFLy
	vYTfeShJ1Ki4xKquM2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSAY-00000004atX-14oD;
	Thu, 01 Aug 2024 09:32:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSA3-00000004aj2-06oa
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 09:31:53 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a7aabb71bb2so915236766b.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722504709; x=1723109509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
        b=lVaE94dyfIV7jtgwXJ/dbz4b6bg+tgZPq+2n/LQuLRtGP9qI02e4Z1WJT4jqAb8vWd
         APh31y5Mmr5d2172uvCENZGOuEjStUkUtCrQy3gJB4LPxxFcYrcMF5DotEebtFvSqb62
         JrKCiv6Y2grgh9dDtINiYNRVaQRgeHR3gm20uS/g25MUYf9mMbB/IdtB2wsN4/Wpx535
         75vlel9/z+dryWeu6yE1ZsNzXnmbk4MVVNcXOuvkULu3hyldylpeS/uBx8S/345kEm+g
         xc9iLi8H6VTTzvLS04g71o6XDOVCQaTJbeIiM5CyGiGGyOvwFsoUftJwxNsxnmPgu6pB
         l/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504709; x=1723109509;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
        b=bNgwhWkKfRDg38jFNCKFfNb4M0Km6af6/FnRsQOrZjREb8TGQ/akjCWzFlcXyy+AJu
         yzUizE4VOXcjMM4xUBZKj7sassYjTQuAwPqx8DAyoDaAQngVTUImYVFRcM1a4ibSFT7R
         hZ6tAUnTbPGiTvMXET7ONzYWVBaokVUkTvDnMir8XXPjBR5pWTAWibWYQDYH27iO1eVF
         tGtThmtM+f/OdqlH0arZnLtUlyoo2E/VpL+rmXWSjuEYK2NPsW4XrONCev08e9iqFd48
         uwsiVNftibZ3gPD3TI0d8ozq3Ev9u44RvIPYvY/K8i3peOxiM3BPELhjuXzNkhchm/q3
         CYXg==
X-Forwarded-Encrypted: i=1; AJvYcCVJiQCSaSRA/S7r+Btx3LwfFwkVZX8noz3N6IjYNRSTPXLf/l6o8siUAch4/YlJy24DVLfa12MwsmMjBXOfGSZFNEAOMuQdXUyyTWabMC12
X-Gm-Message-State: AOJu0YxYn0qSZQO8W31MAtBlJDczBNZQ3rOatXERId9QIXqztTGVWu53
	MjXEtLRH39OvIYHlD1xbvrLosX50/K6y7eszYJD1XpiFm7xD0maOgf8n7m3bwRw=
X-Google-Smtp-Source: AGHT+IG5iXbqJIGCb3pyknIex0iMsjWXZk5BqBH1pB4+wqA2VBzM+EI5zwQ/R0bb0H5+cKiu5+pmpA==
X-Received: by 2002:a17:907:968b:b0:a77:cdaa:88ab with SMTP id a640c23a62f3a-a7daf544a4fmr161420366b.15.1722504708836;
        Thu, 01 Aug 2024 02:31:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8313sm876290366b.211.2024.08.01.02.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:31:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5DD7F5F80C;
	Thu,  1 Aug 2024 10:31:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 12/84] KVM: Drop @atomic param from gfn=>pfn and
 hva=>pfn APIs
In-Reply-To: <20240726235234.228822-13-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:21 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-13-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:31:46 +0100
Message-ID: <87plqseghp.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_023151_078845_9C138E66 
X-CRM114-Status: UNSURE (   6.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gRHJvcCBA
YXRvbWljIGZyb20gdGhlIG15cmlhZCAidG9fcGZuIiBBUElzIG5vdyB0aGF0IGFsbCBjYWxsZXJz
IHBhc3MKPiAiZmFsc2UiLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KClJl
dmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLSAKQWxl
eCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
