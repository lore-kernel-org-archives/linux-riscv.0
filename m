Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4E4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKpGT8A9QmnuRm2hoqZR6EL5+KR8uA8uwI0qcCmWl8s=; b=1E19VCBMBGU4qN
	//kULtUua9AJ8NpcgXxQnCu30zNx9VSvxTaHKj+pZFeN2dxUGGDKxcnxAf3if1zH28R6I6gLMyq8W
	N8XKMiemlY3fDK7awLG+vdf4n7KH8Xn6ua5DIu7TSkCUwUOLWTu9919sckrWf6OhmNVVak2J3IQLv
	TsO2NPxYcROoD8LmT462HjVu/zL0Kz+5P9ZBov5IYGgyLliDs+Q4WhV0MCQMmpfR+jD26rYmsHNMb
	uS3rZKASkuZD/K9nPoztQM2/rZNA+bOzhMiwpCBshOT/RCJPLawP1GNJuq668MzGyh70WUENgBBh3
	cTbKRFl0gL6G/SLFyGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZq45-00000008c82-47E8;
	Fri, 02 Aug 2024 11:03:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZq43-00000008c61-3fFq
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 11:03:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a7abf92f57bso1040856366b.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722596593; x=1723201393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
        b=JSI1eFHgg4mHHqtcfLhoyn/AhkxaNMLznkK00d0FTCgQezdgP8U8C2cB3YH8doSayJ
         wN3z+kSie/nQ8ReuxLL7zrggT4TmW2A38GQ2tcoPHttRw7ALtRMuWvLFeuMj003fOUjF
         lqZ7tPn0wzh9UNlvEDetLqfYtQPPclO6MV+JXdbo3iW7Ne/BguntrWpBSjcF8P/seNHk
         kHyONYrME/6LFbGlXnww1hRbOs2iDIlZ2fMJ6jJj25ojT+d1mBRc/CJJ4eWlruumKvvC
         mksyKlGlJ81zlDn/uHfcr5e42hUXlNx/bXIUAoL1gkkTiKMbK4a6OgekCWiR01qNwQBp
         tyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596593; x=1723201393;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
        b=YvwjXwhVkDArmr7LoM0v8fNXgDSRK2vTwOtOfqK0drjYxfo0Sa1S4hx4Da/hnxTbU6
         234EGlslBHozDUCIKLl1obnb5jvfrkZI4mFKRE4DdGo2FKR/PaANpOKDkfMZaiL9sVsR
         8rAJPQ5VCoMBAVGeylUNEJgNcf9pT/RQqNVux1GfwOtU71isFDS3ane2lK0eV0RltEb5
         ZSzP4wp/LQVdMJDVCZ3zdNl+cux4MgpCB3H8llwhH7PL7msGYAwcjppaepkCOpeB2RSM
         uTsdN4mn9i+IUenPAPtA9tBjkZU86a0tKevlAUBDin/Q5RSIey4vVLxOccyPacRESD0M
         3vXw==
X-Forwarded-Encrypted: i=1; AJvYcCXO2OHLDBci3Cx7XRFLLcu3MJAQ8XELqlRvPRaQzrILw0vfYI7apd9JoNQZ4KYzfno72xiKwLt+g0cQpJeRiYWLdz5D1u8ol5CZDPHLICRs
X-Gm-Message-State: AOJu0YwhaDGlgcrNK6mHLKEoyZ5KXo+OaRgxlyVKj5LRCuHV2i/Th9o3
	lgHYVKUL4vlcIHJj/bMNTAwcWMXPXfV0FWMPFp/h31qPI1HQVJFSAdapqexlc1Q=
X-Google-Smtp-Source: AGHT+IFGQonexgpZjGUwl51oIYY4w2W/jqJ1zQyOCpk3kJFGs8T5j8dynyIwmzMmmRUPMHGi6NWZlQ==
X-Received: by 2002:a17:907:7f24:b0:a7d:a29e:5c41 with SMTP id a640c23a62f3a-a7dc5029a1dmr251865166b.40.1722596592689;
        Fri, 02 Aug 2024 04:03:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e8676fsm84603966b.164.2024.08.02.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:03:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 24FEC5F8A9;
	Fri,  2 Aug 2024 12:03:11 +0100 (BST)
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
Subject: Re: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page"
 via pfns
In-Reply-To: <20240726235234.228822-84-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:52:32 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-84-seanjc@google.com>
Date: Fri, 02 Aug 2024 12:03:11 +0100
Message-ID: <87jzgzchlc.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_040316_090523_C41D2AB7 
X-CRM114-Status: UNSURE (   4.91  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gUmVtb3Zl
IGFsbCBrdm1fe3JlbGVhc2Usc2V0fV9wZm5fKigpIEFQSXMgbm90IHRoYXQgYWxsIHVzZXJzIGFy
ZSBnb25lLgoKbm93PwoKT3RoZXJ3aXNlOgoKUmV2aWV3ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVj
aCBMZWFkIEAgTGluYXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
