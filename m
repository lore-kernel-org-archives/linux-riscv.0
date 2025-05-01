Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B4CC369D9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 00:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5f2Vc3SHgjJUKtJ0917ivN+sz+W17DF2b72FY3OK3c=; b=iiLUP7HaDYGgEN
	+1mjn6Co70h5QYT9jQQX0uZam5x9N+Z1BFHc/UTsRfWaCK3dDcUs2mG4wR24ZEUUChUMATyvCKEjY
	+vVMXF3pUkAh5ECaTBJVK4zIwpBOIPLgkW5g9mQUynPdz3AgwR+2Y0cp8NxvEmViqavRsDbWydjwE
	IlFEB4EDp+s6tUT8ZaGZ8zadnaJoOT23rvzS4Pkhdl59B5VJBzN+qlz6IWOYUc/DSD9i5hQ18vsbe
	NaNcpJzT/BQuZApedWBC40zsP4fLHFjIwvfb/WVYPGDxmK2+iWZg0pVsLoWIU9VGw0fUXw2fGeHV4
	ff4gVH2K57SEkNV43gWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHtS-0000000EJu6-0jQo;
	Thu, 01 May 2025 00:35:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHtP-0000000EJth-45pV
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 00:35:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3106217268dso3856151fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 17:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746059709; x=1746664509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW3y031a8bCMDfWfhst9H5EolfBgWcvOCZGufuzidSM=;
        b=Ow7KiNB1LlLtanUQNDcgTrSGzPK6chpM/ee4b7eyLyY8R6SWiCKO3RLVXfICp5y5OX
         ZbdXJVjlqGVFRWZN9iRo9Ciz2ynw5D7qirslrhSxoC9gI1l+Qcs3FESPApmd0O+jTrXx
         KoFUUFSzpYK6HupL1SsTvmEtG8sWgfxY4gQSINslA8RoU26JIU80b/T/MHoPsq0JUw6a
         Ilr4dW4GOn8KiWcldPEs6YD4c5VYjLnaR2MACWa5bRP5Rzu0k4xhPGIELFrTVE7RaBIM
         I/OAvxiEKgHzce/EGZy7YnKL0HaW3QHF5g3ma0/jYBFAXOkzYWHuDBeHK3KvQhC5yx7r
         eVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746059709; x=1746664509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eW3y031a8bCMDfWfhst9H5EolfBgWcvOCZGufuzidSM=;
        b=Q5xQOBB/dCwtAOvKNXlgnreJ1f0q/g4qW+NF4TY5gu4fQGHmAnK0oba1RZ660tSXOR
         UZ12WcEqblRe3ELu7MVTwfFYW/AWpzm5n2XRxWdbEIPPOeZrKhVFIUGNMtudHVrfoBW0
         ssm26SbgXakhnNvegO3kvb+uz4/q6YyMHhmy/ni7tOv4WjM+TyFfTpsKWRz7ISGnCQr/
         HbIKsFGy+6Oyr7lA+uExyAfjXFp5E6rzaz7t3E+nk6AvoYaQrf820cbfbBEWuvCyry9D
         e06/uE6SvGaFVQ9SbmkiWz9bLdoXk9RY0RzGIpcEQha3QWAo5zJa32gtB4FK/fC2+pNx
         yQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXie6GWOf3iFdEX+BAtBLSrhGZEK/BefYlpLA8SodCROsVlZ5A2o3ghf552FUUnbBN3Vxmdl9lU1HjJCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1l3QcSNxF+R6kptLKCckJzTVq15I+y5tP+caJpaUb89qYu3g3
	+PoWKMd9PV9PUGEEIuurHTDonQbrLx29ATnkpEGPNWEu7V0j0hCHvUE4IDQz2mPBbl5EcEfxjSR
	8vT7abAYmZxspFTsWarZ5gn5GdgSsW1PqDKoL
X-Gm-Gg: ASbGncu05qMBMTvPAthJ5YKyKoRC4LziiPXnrK3JEiaMv3zOTQxVp6HowdoSnsGyrBs
	ahEkbdPhYSEs9DehO5u8eaR77EBN18E5SBz2AE8OWRHPuGX1p1TesI3ieqUKDJixfo5kNUtSBUa
	OnLTKj/mFpkPe3JaJIQ4W9AQ==
X-Google-Smtp-Source: AGHT+IHwYZFEr3gcu16mdyqVUV8yH6eQN4AFZYotMXTeFCa5T2asw+fZ7/8xnzcqUzcozqKfbUDo0SALzDbsQBurO+E=
X-Received: by 2002:a05:651c:b22:b0:30d:e104:9ad4 with SMTP id
 38308e7fff4ca-31fc40d31c0mr836551fa.41.1746059709173; Wed, 30 Apr 2025
 17:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250430224720.1882145-1-dmatlack@google.com>
In-Reply-To: <20250430224720.1882145-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 30 Apr 2025 17:34:40 -0700
X-Gm-Features: ATxdqUFlsY-tCRXcGAt6vRsZIh9vEnM8vLXxYXsTvpXUC8BZ9_at6EiPaiKmPqk
Message-ID: <CALzav=dDcqoPa1wAdv53vyAx=HD+5bS15jUE8OV6GfKvRWeNpQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Use $(SRCARCH) instead of $(ARCH)
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_173512_041599_9A7335B6 
X-CRM114-Status: UNSURE (   8.04  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgMzo0N+KAr1BNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gVXNlICQoU1JDQVJDSCkgaW4gTWFrZWZpbGUua3ZtIGlu
c3RlYWQgb2YgJChBUkNIKS4gVGhlIGZvcm1lciBtYXkgaGF2ZQo+IGJlZW4gc2V0IG9uIHRoZSBj
b21tYW5kIGxpbmUgYW5kIHRodXMgbWFrZSB3aWxsIGlnbm9yZSB0aGUgdmFyaWFibGUKPiBhc3Np
Z25tZW50IHRvIGNvbnZlcnQgeDg2XzY0IHRvIHg4Ni4KCkJsZWdoIEkgbWVhbnQgdG8gc2F5ICJU
aGUgbGF0dGVyIC4uLiIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
