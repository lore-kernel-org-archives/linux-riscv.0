Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9B3FEFB7C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vR7ETG2pAIKterzmqTDx6GGAZFUkEt6rAKrOmjsaXRE=; b=JCJk8eprdBGt1S
	RFd3GEMEIjMxn+GDL/KRDnz1n5i2UVk+LyoxXUjBCrD7Egw3zBj2RoyB6kuq/QEFnMPWe1NQ3FHDr
	g4FabUoi64dTTw5xp3eEuzH+O24/BoXjewkG+lk5qE2ruYFUDDE3W2ss3dJewZdShWJrNOJ8Uj66e
	JWH2NgGnVTTEHbVgU8iD9zsjIU9sfgCOSeoFN5sZii3s+E6qj6KYt5YfXy4hAUJqg2FLNd75T4TYm
	4iE+NJBRG/P0fXStA1gYjs/DWo0avbrDpt10yEV5mfxJyqhzOguZIrQuLmRegN0NR4PWJGch0yBFl
	GrusqxtFdRITuvar5Fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3YG-000000090GL-1gM4;
	Fri, 27 Feb 2026 19:31:04 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Y9-00000009076-2RbK
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:30:58 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5033387c80aso44783731cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Feb 2026 11:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772220656; x=1772825456; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
        b=kMKVI8Zg4ApGqQZLRFgRZFvRTjCzZYzSd/cw5MyRmUejy0H0tpF0Oxwrfx+eelDyUH
         erA+/hiu7XoS1Ays3O+7SGA0Ru2JBISuXl7Vxw2+td5Ps+9sIPl4Pw+yvs50LEgDKjjr
         PFkG++OiukMVd6eI2izc9mnyBMvQAKhZ+XegyRIC7vRY7FqDsUgmfKw431OxWIuiIo3i
         AppMnZ8GNbXzbS8uxe6ZIU0yj0VjtoULj49yqYWNUEuI09fwDgqsDicNnayO1jZ2r4R1
         R7tqg8R0Id8Vz7fo+P3rBXQ3ZLQpffeIs1NyR9u726h6HztyNaRrKQ8KZq3SNpJaPXoU
         k1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772220656; x=1772825456;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
        b=tp6kXIypbiT8FI3lBZWAAX5NTTkVGovPbsdLNyaUqU4wfKhW9noo5u32ZY0LUm/4iT
         FTrKlnb/mdPGflV6YYdAVad7Prgj8iqYARHAWdmtv8cRN/fSzVraLEyQ/KZxZh246WGr
         245r1vHdUoJyHsV1qsDtP/ciJKzN0SaKX0tFjnF/vrMmlcEq4kqXmdpw+q7xQswC5fqd
         6EkxVmwqUH0e55D1X3eNQpG6LyzbX392d5yw+rhY2RVjOaSvwtArOYxePNA43JJ5EPGx
         CjEj395vj17wTQxfEC/DGlO4EFaVQ2gFRHzmVn4t+CotqPbq7XVE8/e3KfF7VCENutmh
         0RKg==
X-Forwarded-Encrypted: i=1; AJvYcCUbUv0rcJ8xh2X+nFws34m9P5NMMhMTzd+OTUS48BwfyUdqy40dSM/aaoNxqEnAWLpTCzFZjloo1DdAag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQmwbH9KlaBxR3OPJ6t4S054uyjlN03x9B7lC1MfRvlQIUP3/
	16skvjgH6g1+NYW8Bqk9vbaEgerxjPnaT1sJtunZAx1tYrGuiZjWg6X4
X-Gm-Gg: ATEYQzx9U7X6D+QLG8idDX1Miie/koHV85nf3TwDO34sYYbTmpXf7vXafBGJsRUlFPn
	jXCD+CZdFKRMkRVSUlH8S7lj4Gkc3fkH0+ssO7mdwE+2agqrNIVq6fdxRjeE9+kKZP6cwcBIpMU
	xWxWXzwM9wJaq5JB7iTRJOayJ1lRCsz6wHcmKgRLb2XL9GF84+Z47GnnY8slI5DvBcENpF3ZsvY
	3t7ok4rp6qQ3oX/ykgeIzB2EixSbFwZWQBBXAY30ubtzGXW7RfcKSaGodpHrzMmMOAWXF87F4eI
	snrC6WXbxqObeY5McQe3J1ZEOCo23wfvbRAuiicJNjdZF7DhDDN+5C8mYQnIgmtxAyYmWrA/XIE
	TsC7itIXbSDDfih3zq6Ve36g6Z6FOTuVGUqLJ3xsuzjZJwRAbHv9RYE/dsMhvlZD5U9Is4FoW2C
	MMeb+8F5d0ylMyYH+x11/tjA4lsOVL0LowPNENsWo4jOVH
X-Received: by 2002:a05:622a:48:b0:4ff:a6b7:6c9d with SMTP id d75a77b69052e-5075248b828mr56391801cf.38.1772220655720;
        Fri, 27 Feb 2026 11:30:55 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744af0731sm60355271cf.31.2026.02.27.11.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 11:30:54 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 27 Feb 2026 11:30:49 -0800
Message-Id: <DGPZSF0HMGPJ.2ZDZ6J28MFTQK@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_113057_640788_5199F317 
X-CRM114-Status: UNSURE (   4.60  )
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

On Fri Jan 23, 2026 at 9:58 AM PST, Gary Guo wrote:
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
Nit: Missing colon after MBOX1, should it be `MBOX1: {:#x}`.

Thanks!




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
