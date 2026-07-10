Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34524C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27JTKZQrlaXcFb9Cxn1LmZpM98oH7XvWULkxpoOl8Rg=; b=3UEgbzMxrZCy/n
	w6bJkcV+PLZCO+0XniBL+/b1x/C28KkwD38dPiplDey2XnCcAyHrgE0cABfi7r7ZnGZrhhie0AkbD
	G6xqx1r+lO9LCB60+YqxKRAWEkrqXAaJ99rSaLujT82cgagRDaLijJsHgQi6jE4/OiePN6m9mZLWu
	BZTtX6Ms13uqK3c6WQQSFNy/jd1ZkndRrQywb9B5lV/Ebc25lAWdUi3scFE5HOdL72s3v0yIYMryj
	2lEU1jRyoKKW1KOeLtcs9zSm7khFWog8gHehT1mDI2M3zcvEkT5klwv/08p/IHc2oRegoNfeFlOzh
	+ilVQsT5hyWrCq+Tkhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62f-00000004Nho-02FN;
	Fri, 10 Jul 2026 07:53:01 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62Y-00000004Nbg-2Dw9
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so664224a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669973; x=1784274773; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1vKA4/E3v7W7bFn4qyJsED7Lacs/12A597rqBVPmfww=;
        b=DycoAXWYHiHP8CQ42AEtoQ++rQNdcZuSv0JsdOSm+3pdb3F212g8GqbwzaJazDNtEn
         1qLJGzXbUC2vWGiLGwiRFdnh2w0tUo8geOrnrfPw4LTkSKAOhbF8A0dESGHmj/5w3DNS
         Q0pzlTzBmK20RXXQN9XzchrBonL+aSx415f6RAQh9atrJEhPBlPSlS/HKdP6M56cVNIb
         6MJl6jkxj5LOBcpBRg0PeVCLtzVTJD3dCKQrm7I7fefRryOgN/jFRx8T6eIv0AiUlYqO
         cHzZqn+Z7zfF+GMUlULHvUkRH8wbLQvh4BGx89UEbHaJR+KgU5H6k8rtjdmHVkFou5dy
         KH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669973; x=1784274773;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vKA4/E3v7W7bFn4qyJsED7Lacs/12A597rqBVPmfww=;
        b=fA0S3O/Ou21f++cNTmRlVIyK/e1uGZg+e6wXCVlzDAJNkSN2J2oKOKMd3ddHhBK7fV
         LWUngmZp/4SgRQRVv/HvnJ6wQDpgGKtFEUCg4ZTdnPlUYIzJNQEpIwD30rTm4h4NrdaJ
         QjOxyMWDqLSGbZAWo+Ciw1hffewwMBwIckKBXvDsHLf4ODeuyAXA2jHirC3nexGWXE/S
         v64HWlQMaYNxnrtUxHgLRuXMWTpSmlC1jCvfc6kFTnuvS79W0YH9bcm5v5DL7uETAZyB
         vDRVn5ZhFsPM2A+znOpD6jj6x0cKlL9KJG6mt/3SIQFOmpATEt13TAWXYWBr/fUYDeCo
         ZSuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoD/K2RLzI/bG3gsE3W3FuMzWtZ3IDgFdIcGiZSipbnFsQGCrWJ5BvRMJkGy70l7ey2OtXhaIRf7hIzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySUnfTtnwDCDEnx+RxpK4O1W1orFg2qXPTMjXdSAoaTs8UHxfK
	SOq7caf9TENCcEfZaYS0rd6WTj1ThjmamZHQYM5tTtucqArhW/UVVUXX
X-Gm-Gg: AfdE7cmhG64I1c/HkcCmRUBRRS4hz15y530dqW+1RhyAQs5moD4TnbHPNKHCzbPs7zI
	UKtsp01OrDzgY26ToIVEeUt14c+FMXOcqV8FWixvUgSHH+6RJRxwnZsA8cTgVeT4HIhKokH5un5
	YqaP5YeygAj47FyhWbPNzPKJUlE/T6nL+yRebhk2HDFEjAmf68a5wdhILmABKq+FcN6Carc/kt1
	e+sOGVn+jH2i+us4FlFU1GjjdSWWMEBqHjkysvQVPlAiaOpWykR0HYg8BMF6KbN1PXG6EFDf49X
	Er+isAISqeNSwchrkYbGSBIOZ0jkgUju7tG2ZCVvckneAjQP067OftSiao4BoXRjICPLJGQNoJk
	QE3FUWoU1CCeyPL/u3DHdJvf0IOHDXWg6QtBNucCaImYtrEF7/qlHNlLRjyN9ZeZtQV1tWAp9vu
	Ck7FsZE2ffPjYaoTJILmynmv2wRlT0uZwYTrCZz7sQ
X-Received: by 2002:a17:90b:4a0a:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-3893d530961mr9707655a91.0.1783669973502;
        Fri, 10 Jul 2026 00:52:53 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:52 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash()
 hot path
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Thomas Huth <thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>
In-Reply-To: <20260630045531.3939-9-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995932.1208691.13530053283560063106.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=632;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=Ag5hF8rTf0X6/MPKP15IB3NYCgooifLcPCObkTtH1N0=;
 b=XRTUMqEADW+KZk3nC8Ii+QzcGXzNTGq2bntuuyEk/nB+Q7Rjvlcqlgu4/3V3dHA5sGTlOTVXe
 qfXYMGUnVW7DGepiw3HKFoSXdft6CODFk3hsmUjcgJE6PD6p4836N0A
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005254_646041_74E8551D 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jun 2026 04:55:31 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Runtime constify the read-only after init data  __futex_shift(shift_32),
> __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> hot path to avoid referencing global variable.
> 
> This also allows __futex_queues to be allocated dynamically to
> "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
