Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6953ECA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCmDADBRXKAhF/thzPeK6cxzENXQgL1Ov9eyMPUKTI4=; b=LxC2gzofdwSQusVN/5C2T3gpFP
	A4uYz46RmFYqTkw/+eSvJcRPmBfrrrZOhBGBqnVrJnchR/HvaBTNZ/dHmks4sbi1w2vtHq6kmAr4s
	xthUsjV+r8OB8MwjJirMfFyieG2QbvvOvW0uSsYb43cr4axQV4z/PMI1GV0WskuxhTjib+QyMZedu
	y2fnMeXKtpwuTwRaNgyk6dyNcdpDzbPaM2QYqcWpxOsA3G/lNuIuX8NgCJbHFucT7KEtY/7nNaot5
	Cnfyqm5OxQAfn0VQDm7Txu8Lc3ZaSPDpf3bDEyAtOgMJq7IQjbQYb4ZtGZJuOip8wlpHi3PZEGid8
	avglE3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usDi7-00000007S7f-3jeZ;
	Sat, 30 Aug 2025 05:01:07 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usDi5-00000007S6R-2O2k
	for linux-riscv@lists.infradead.org;
	Sat, 30 Aug 2025 05:01:07 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e96eb999262so1976898276.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 22:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756530064; x=1757134864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:content-language:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySHz07CCI/3xmGOniCbCder4okJxP/0F9QnnzMAcm8o=;
        b=DrmWqFM3obdrHMCg6ujdxbZ+9sICBYZ9nAJD1JJ1vk71ttoqR4Skv9rj5qqJKBljtF
         jYVt5GYSZuguExpYacVLDz7wVPCsaHEBVb8wJf/x0hHGHJ9uXcQNESEbm5iB/V7xY27u
         RtXNaWj55NptGRBQxhjlpO6Vaj5mcvO190vDWmn/tqoz9JLoXfIP7RMQnTiYNBT9EZGg
         jCbn70fmSv5Q6FDmPGz63xnFf+KOGEBCA8RfV88ToVJqNQy5EujqTRAmO/K9VWaHaI8J
         gUh/vPHEGaFcrJ78nCxuoXb2ZVJukSN7qFXG4ImmBThIm0UPa2Q7HdX4uszyjwKNX9um
         qTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756530064; x=1757134864;
        h=content-transfer-encoding:cc:to:subject:content-language:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySHz07CCI/3xmGOniCbCder4okJxP/0F9QnnzMAcm8o=;
        b=f6lzdJgtpluB9jbEczlOkIMZdukK7GaCasLlTahwkbviVhFSZoUkIRpzy2tJ73ZY6R
         w6bhPUCxT94dFTv2rHg2FTlFmMCFqw/A3AAp0OYzatl35BWnZGZREBT1KZKfCRkKH4U+
         HnTKPchbEJtcFbAy5jwytnZbKD4a+79+uuC8c1Nxy4k4dRu18+35P3ney8K8wBSYDKU3
         YecDQmIEV6y/q26lGhq21CjeVNeHh94Kqe+t1dchc5Ery45DL7niVP2duUhLlmhdqwvA
         +2/f2hyc5A3hc6WFFe1lrTpL+KcFKFeHMA/CT7eKKsBaa/8rhdJZ8u3VAYXcy1naRnM2
         kV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhAA7uVmhTOpUSf8YQnAiIiq2nQ5vB7TLkm3M0DDUoeZlUTs8GjPGL3TVeFSY07bog1aXJYDxeuQ+cmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/yd08T8Gwoy1XBxqm1bp4RfJ0UX/5A0Z5kqqWn4TxRT2WdjFF
	rTp3XcmeqxNzJB73sU5qZdwqWs96IWfYYnQw01nZrmLw9fhX3juXH3qs
X-Gm-Gg: ASbGncsweDwpEE8Bn6Qd76ZGqv89ch2Wot1WL0vt+wWJt/0f7T2BuK6Jr25L4oaPUVk
	HEE2eYKcZ/QA9tp1VQeyttlbXFqjQX8gE9WnhEEvnNSOEi0R/Bz6mX01t3o/UeZUhc4e77cDxGe
	rlI+Gs6GPD4PbpOyd0ZtapSQ7y7ZBBUOGflSZ8lJ62MHg3TZbba6umJ1DED3nUQfVOGTDnmNXvJ
	sViBJtCoSgPveCYYtxuVgCIUP5UsXpjJX9D+hYeQqrpzrRVVe7sHlAmwmX8rNUObbDzK5p+XveE
	xcBcjjsT31XxIoWQxZgDRNs3ovBeLx3KLyO8L/XWlRvKuKIsjDsT8pl9nyckL/0lPE6BdQCDD27
	g9e4MsQFeK9Ur0UvcbdtWanFKAV9Uzzvj9SAVu7zQYAbiw/YTlRXm
X-Google-Smtp-Source: AGHT+IFTNCicmUzh9ebhvvZRtbgT7yLvuWDKeZxk+wFYkuzGpT8P77jekfRYhnpiqL+NMc4r/32rgw==
X-Received: by 2002:a05:690c:6004:b0:71f:db79:994d with SMTP id 00721157ae682-722763d887dmr11241957b3.19.1756530063292;
        Fri, 29 Aug 2025 22:01:03 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-721c634bb52sm11989857b3.19.2025.08.29.22.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 22:01:02 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
Date: Sat, 30 Aug 2025 13:00:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Subject: RISC-V: Re-enable GCC+Rust builds
To: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Asuna Yang <SpriteOvO@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_220105_612297_E72FC7F7 
X-CRM114-Status: UNSURE (   7.15  )
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

I noticed that GCC+Rust builds for RISC-V were disabled about a year 
ago, as discussed in
https://lore.kernel.org/all/20240917000848.720765-1-jmontleo@redhat.com/

I'm a bit lost here. What are the main obstacles to re-enabling GCC 
builds now?

Conor said:
 > Okay. Short term then is deny gcc + rust, longer term is allow it 
with the same caveats as the aforementioned mixed stuff.
"the same caveats" means detecting what specifically?

We have a RISC-V PWM driver being written in Rust. Currently, GCC being 
disabled for building the kernel with Rust for RISC-V is the primary 
blocker for including these drivers in RISC-V distros. Therefore, I'd 
like to push forward and contribute to the re-enabling of GCC builds. Is 
there a more detailed direction on what I can do here?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
