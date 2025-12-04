Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49EAD1D892
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYd5bdwzatGru2OC+6Mlf9LHeH4/vv7ovqS2b6z+rbg=; b=JTFSQclEYsjGK2nQr4PyJEh9f2
	bb3xZ3iCcvGpHjhTS1iPTadpBBB5GlWqZNt7hu+bBjkuokWy/JxXpASR16myCG67h1t6FkAOgX9d9
	GcGzgkf25UKw/mu1pEAlicW8VsoAPtQCV8rAj3FpW16Mw4WzMOupc3e3gTZexX5X8WmVymGZL+6WK
	Qjl7uXdECnVRH30n/E4VklixMu5Up/mEv6IZKJw3Oc2+7XLY4Nnbr0wjMaDR+pCe4HW7TQVCelnQU
	jWKM8WYXNWG3r754u4nJ6XLEGTsWB/ozIq/H8EjKXC+9DfRwSyDyD+YUrOMXUBEbP8zxvBnhz7Gvd
	rmIQaCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4fi-00000007hmr-1JA1;
	Thu, 04 Dec 2025 08:26:42 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4ff-00000007hmY-3LLC
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 08:26:40 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-63fc72db706so523893d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764836798; x=1765441598; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=E26R9ABXyaJ7FZmsCj1JSE+V9/aAR7uAzjmrvligs4C3pG3tjv5G37J2DsIiA091ye
         oHQUT706nm+rVuwBC5kC8CVyAdegqieCUJm+BDsje9qS8fUKektDrrVExBSai44MmFr+
         SCO73FkBBXM3xwGSbxCB2uJFKUydtry8kN7sUMN6KdazpW/8Xet3eOQSlXQKbZdwDC+G
         R0Xzxcs3QgZWrT4ZYMJOj+XSey1ZLxWnxJUOTEJ/XqpQAbaM8PfZidugeeHo5XMFExCa
         7ACzTbR0aTpqreUpPWdb8ttVPTH5YgS9vXFHI3BG3BFAKi36eIT3b4UqPya2KIs2EuKp
         X4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836798; x=1765441598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=Qu6HSS/QkC8xzYf7ZcrSfJt+XVDiBbPygiesmNcsC4Q0RVekdrdjqKDdHf8o3CYmee
         dq9/RSDC098SXOSyOyOs3G3hwvdWl/QuqrzZIoIArp4QlV2zW65kK4XwffEossK+Wa5/
         TDiSB5fsSAFobcQtrWNpYtzgl722c160iS8F1vvKSywxiIzqhqvY/zFsdoPFH9v94Prp
         qOWDhCT12i/A9nN9RXeldKYIkCgWEPMQzXIx8v7ZVoyC1wCPipDkgzqdmsR/bS8SPBXL
         zs+hSKzYTNqK+2ejK9PcS07qDSr8RfbPwRhs+UEfjWDQ/FSzS6zrQ8UBHjX+pCPieRUN
         53mw==
X-Forwarded-Encrypted: i=1; AJvYcCWiW3yFjgGj6174T+RYWwDGlf8LcVkD7qkxg38bg9mkjctKIeo0STIdPdyx4da1USAz7jWEqWnDVXyoiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDVWrqj/lWPgIx8Hx1CNkX4Rr5lPOoT5skw6hqxyRoG1y2IJsT
	U18sAlRe1i4mwgELlB/w+RIAoR7UIMAJSVRD7dhzbsYlM1eIdrTjhkMb
X-Gm-Gg: ASbGncuXqgxrg77YQsAnTOjl5fINPW+IUffjaI6z1ycbN6wHblA6HKqH4lcKDie1HQj
	oYlt3yg+aJyfBEUSmB2iMNkpB2Mnpyw3xWZC4GK5Z7DpUF/aaf7xXw3hcxuDcRvrTWzevjdjJzG
	/btUFYcUlNMxQcsLiuCM1aj40A75qZpbeEfwdV1BzWwLjYhN94dY2n+DXcZoxygaycnFT9MQ7ZG
	SD5Mj10qR/vYvnfXEWrUPe47sCU03CwtDiD25c+4mIyo+5sy6/FjTZxF+Cz0cGvelv9XhHV4+Xz
	3INe8bgMoZLEC2RlZbya1zvfTmnPaoWZELdeobRiHDyf/94JAV2KBEAVfHFtfj+L03n9N5LdfPn
	Z/4TrfTvurwr0pUUMrfccW8C+MRrXUFpsKzwPYg9XCAIP3yzIcSH665nttWYz6xV6Kc16ymIYEK
	0pDO1S5YqTAsV3DPXgJP8Mg7+y0WMpuym1a5dRAvoS
X-Google-Smtp-Source: AGHT+IEToPXaJNU3FPitOhzv7XRD5fMJv3RarJ69HwAUtDs8DEKyQvLYwMwVPCfHblHOk8hTaaSfgg==
X-Received: by 2002:a05:690c:6f06:b0:788:e1b:5ec5 with SMTP id 00721157ae682-78c18956f0emr15033157b3.70.1764836798216;
        Thu, 04 Dec 2025 00:26:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ae534sm3349687b3.3.2025.12.04.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:26:37 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <74cf3591-fe3d-4005-a5af-269e4c806d9f@gmail.com>
Date: Thu, 4 Dec 2025 16:26:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_002639_841668_1F10E465 
X-CRM114-Status: UNSURE (   4.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Please ignore the "EDITME" in the title, I forgot to remove it from `b4 
--edit-cover`.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
