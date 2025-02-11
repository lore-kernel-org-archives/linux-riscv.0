Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D5CC0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFnkNwF3JdgxyGsqGe4WnnmCBCcplqdEbaAm4FfSuI8=; b=DrtHE0Q54H3lmEm16xtL3xgsH3
	AOHZAjae4aSLbQQ8LGjuT+5SgBc2QmERvGTq8fx3UfmnY8Ie7PK2VtQUwnbXbtWwa4SU/8CSVg+q8
	ag46RzyaG322hFMzZZm4uJOuF+ikTu6HVOttc97YA23JDxQXAOTIZDsCfUYCBa98J87unCA6fz3tl
	O9EEkNKwQPRbIU6D4ww47D4JRFZJF9g4kaEbnI+ZawF1YQ6ZzkIX33gMkdk8gXhjw4r+XBvZL9pOq
	PhviJPb/5bM14qI3rorC3u8/n0kSIBPQvQBHyKQzJhsLhMyKDWCgJ4Vs3lU7X48Qi080CuE0Ikw+0
	6afqvO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjP6-00000002ebw-3M6z;
	Tue, 11 Feb 2025 06:05:52 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjP3-00000002eb1-3CA1
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 06:05:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f61b01630so52357985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 22:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739253949; x=1739858749; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MBqIRdwxcxCwshRcxNA0crppewQ5oTYfihHZZAluN0=;
        b=HaeAQoiHK5A+qmrnRcMB3Ypa/TJmTjGk3Yf4aSPX+4DEzeI5UdTrreFEOAdsS5rkXH
         zAq4nPaqqYzz2ZPk2RY1I5UMwRDzUVIzzleNlkGby/lpWnICr2z6fR8u/UvJlk7YKNd9
         lvbMjyiBYBC0E7JShg7LBJJt6PwtJH6/a9yMesDJXkk26nTFj4AZzMbx0h0ZpJWrlu15
         B6pDCHkriMypNKAD8eoQl6LPjXJNDwSLOe5+ezMxuK72sr9yW8NO9K89IPoLLpNdlOAt
         xR344MjjsvZAMuIYwZgF+rn4AnfELQqfSc8V2cK2yAW6dwBiNoY2URsoNKcqN0y5TT3c
         l/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739253949; x=1739858749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MBqIRdwxcxCwshRcxNA0crppewQ5oTYfihHZZAluN0=;
        b=wSpn3Hz3cs9ZTiQGVUsKwqn1VUPHWJYlOiKeZ8mr7/6I8U4zlksBRx3IO82xumQctC
         6dWdguc0f4SPlXCSpZemWOVI4UcB9pztQ5FAyjNnATLeIjV5Dkd7gY8GnvnGclCn8jHC
         2ooj9lvbo5a5XY0StOTgSYnWPvORL+U7fPAn48seyBuC27kZTjCci0ibRmZo4/OZnaih
         C1GUwF18j+s0WnpHKXwROmxhf1w34yNmrAt4rCSUphEkd30E1NlXEp4w9h52u0GjhS1S
         CsVGtQJmJnBUY2tKD7EE9GW5zY1up7DTJ+nRwfQ9GliYGgvxbvv14kpUULouwXxuLVKU
         8yww==
X-Forwarded-Encrypted: i=1; AJvYcCVlBwKaQAkArvq/ibkz/aKNyPugFhfC9F+hcjmfSbyPDdP++N27R5Lfw63noXOU989uhYb5jue/TqyuKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO7p+aZN/4TEPDSiwg86tFkft94eiUGpyoBVGZUlambyX3loYA
	UifzuhfnPbkZcnHCUXY9EBn7sm5T8u0/OePfQNOBR2N5tjocSrkvmLM6Ux1l+3M=
X-Gm-Gg: ASbGncvfBFxq/XsWjFzA30h0d7Og8tcX/7oN6de9hN8OYBZBQqjtr76yKouDwQVv3I8
	uiSg8vd6T0512AWVHJltv6UEBm3FRsPq3kPLGf1D+gDUor55HW6Vt9NflL4szPyItyssPRxgYna
	OT79aALCOp3Fg1WiEqclDxv70YrEWumhwbj0VR7oTC+bWcYz1gEnAFe78vyKs8Tb1jlFoxQDsbi
	lf0Nm+2GcApqrvAAnobRNN3/ZNEeZW1g58WKFkX/ArTPz5ArHUCnMXJAY5QhYYm/vcDlOXMg0/A
	NYfZaMg2QU/QsQEIK7OZnnxQlw==
X-Google-Smtp-Source: AGHT+IH/1R26NlLJZyOyqaoXeZYqCyF01+N1vBhKDh4u7o7gbIXbZU50VOk7nAyf7jdBnJTufNHygg==
X-Received: by 2002:a05:6a20:244f:b0:1e1:a920:225d with SMTP id adf61e73a8af0-1ee4b77355fmr3102269637.19.1739253948792;
        Mon, 10 Feb 2025 22:05:48 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308aa3a1cfsm3437000b3a.137.2025.02.10.22.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:05:48 -0800 (PST)
Date: Mon, 10 Feb 2025 22:05:46 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 15/15] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <Z6roumtGyFOfoOiw@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-16-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210213549.1867704-16-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_220549_801440_691C27E6 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 10:35:48PM +0100, Cl=E9ment L=E9ger wrote:
>SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
>misaligned load/store exceptions. Save and restore it during CPU
>load/put.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>---
> arch/riscv/kvm/vcpu.c          |  3 +++
> arch/riscv/kvm/vcpu_sbi_fwft.c | 39 ++++++++++++++++++++++++++++++++++
> 2 files changed, 42 insertions(+)
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
