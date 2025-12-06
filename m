Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9CBD3B7D5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfQtxmwIMN1QKjBJ/WzciYmhAcfNXfcSsUDmyzFYDH4=; b=oopRPkTrRGio3Exr5s/6ZrWsZj
	nKT1C4bAgVGPOuD/C41WEj4lSUWABAqKw4WjV4Cin8zmjy9YltSSZr0SB4blfuvUIAodhTipStqy2
	I/vVWNv1ZOgbnu055DTPCqy7ZFmVTRcjkAFkwbdQYhVo1UGB4bHnlHMOnVYoJnkrlRhu1YBacn+JN
	JeOo5KUDonbVopWEOBz27ckmkZQIAlyD20/PLEPT6jA+XgFJChN13sTxcBb3S4JH7ZYiJ8xjdelcD
	bYprmGD5RkZN0zajF8qeBwQdvPBtv3Hj8tSVxoFy+SA5KQA0deCXjxiOShT4oAkt5/mPEOCd1FktH
	TW+R9npA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS1uK-0000000BJAB-1oNm;
	Sat, 06 Dec 2025 23:41:44 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS1uH-0000000BJ9l-0OCi
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 23:41:42 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-78c2e5745bdso13651497b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 15:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765064499; x=1765669299; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=DAF7pw1kj//h7JIRNlcRBqEAvuG9oMb9YAI/P0nbREPHr/bVZnyNEfZSrUAZzivI5a
         BtoM2rEEO+mKX86Zp24qO85IGH7lwCVM6uCGABZs7e83qaBZxO+vEfFSITyjFeXLvCzf
         NlhydOdenvYb/Ts8Pms3WfvAk0AW0zs5euCJDzpsTIkUlwpOkKVdlqsmy0kFZzWk2Ymb
         9Zwhpj0RaKY6P7pPuV0CDHkxKGUls6Efp2vUk9ssv8ot3iZIJ2ONb76NZTAToeJhPgNI
         B9KjF78cazCxz14XGhxCBixi03JMH6Unr6ySwMScF+Q+Dg1HEWJSbg0bgKQ9SEvPGLOe
         FSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064499; x=1765669299;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=Ah51jqmuGjYDSuGPBavCrkel/kNRWCnBJ1X7I7oxC/7d3ZbVnoBehs03oOCgaGhtgu
         e/aUAhWV/QQstV+HXsLGG2bF85GNQoM1P/hcFVFQRpq7yS/8HO9IEjVipgdhhWroTGrz
         lt11sflyKWPmcHTU+I2lOB0ulTZXBFDzeVedG1MAcJKNHpJ1WyyXk0p6xmeEyFsxZjlk
         YPj3FYTTHYfhe8oQFJyDtsBhqZrpgZ3dYhpBVQvUM4pxO3D4mAMu/hGno5qcHmIty+YY
         mZcJVGOdDUh9vENJKgtSr2I4la2EYA5HUGFMQDMX71nBlDI8/Cq/LuDav+zn/kDvrpO9
         M3IA==
X-Forwarded-Encrypted: i=1; AJvYcCW4RBTImG/RXXJIpsthAbtmwTAY/4Fv5YqmCChz8bJmTR1i7mGYKz9VDb0AFqiab0kDYi4E0jiJ0l6EMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxujyxSmnq7f5Spq+UjW/o4rdgSOkPNmcs/epk3A8/2SMZB4zJ5
	Jf8SMu9yNjXgbgXbjSIfscg/4VM4foQuPGIgUuI4lkDF0r7WD1K1yrAE
X-Gm-Gg: ASbGncudoF1ni9Szs+SChh+x4Q7+qsWzt2MmLc+8TitbthMkLg0YNf23soD9RZk8tZM
	3yGr/2FDHBJ/swG/SEuK1fghQNAoDVhXpfM16s/9dk1PFzKRnYtn9iCBHfkd85JqARUck4/SefX
	385R42gOlCXc/zQpPH4s7ibiCLW3zHkUe9NV0homxXDf20motBzPg0xbVw/lc6e/bdLe0OgLJQN
	FKC2J2s+hp0RH4wl750iwQMmhB4RwlxfKjS0IhRN1rEs0hfvQoMAEa8kRdnKtv6oXL472Ngrx7c
	dVTTPa0obfkaLOKJDPebnq56g/wkasdUOUxradOSErVY5p0hIUBy7Pe3q1oqYtdIr24gNgGP55p
	Ru7+qNoGq1D3s1IXCxsclZFB4FoFpa0Zz+UQLvGZaeB34oWu3GNYNaPDH+apC37qiOrdt34UgU2
	wsZSA6OE8A7mSgnm8xNF1H+GOBXmOj290NsccYL4sHJg3h
X-Google-Smtp-Source: AGHT+IF0mKyXnKTQB1xhzD6LpgpTfgywW7IIal9fCo1GqYHTHD2NnE85yzsXQBQPCshexFlzlGdhdg==
X-Received: by 2002:a05:690c:7404:b0:788:e74:b267 with SMTP id 00721157ae682-78c33cb321bmr61970637b3.65.1765064498716;
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b7a72dcsm31972167b3.52.2025.12.06.15.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9ef24254-2761-4a0f-9c4f-342293383800@gmail.com>
Date: Sun, 7 Dec 2025 07:41:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
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
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
 <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_154141_169903_73B85FBD 
X-CRM114-Status: UNSURE (   6.34  )
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

> The -x argument should explicitly tell (lib)clang what language the file
> is without needing an extension. I don't know why it's not working for
> you...

Didn't realize that I should pass a `-x` to the backend. It works now, 
I'll include it in the next revision. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
