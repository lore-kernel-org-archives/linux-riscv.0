Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50227C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVz+Lb74T1x0NF75mD1WB9kAXLY9lyVwtap06uLPSlc=; b=r9y7am4mFixeAY
	wo2ZOgAuCAPRWMKKoii4GjE9hUQGD0uChqgIOKRREW0OhMetqs3x8RqXAPTtuFaOGG5cex05w9O2q
	+CtRXyZsvpxAyy7orPNSc4cTEVj02mcsiBtBCUgg5JAPxEIiPhXXa2AgoZT8FXJhSFXjYYmQY31QR
	LZEGyLxMtrZxOTKYk5nLbttstmlbyitZFXRvtv8BegiLM+yNVq0VmZ2iLuhW3IH9TjkaqWLNFF6bP
	1hR/3VFiSIsLbS7+Q4Y1ILqlL+EzEt/nGBb4iuFA1uvnMKEbOzJ7gb95CFmh9rwR3KXsu9sbuBPUh
	uSu/Lam3kg7QLoxpsJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcMb-0000000FzWI-0eIw;
	Tue, 18 Jun 2024 17:11:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcMX-0000000FzVk-40dS
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 17:11:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so15602f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718730675; x=1719335475; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMnnhcMJpi/gTaTN/vn78bq4LGXwg9q6pMTAn83Y3F8=;
        b=ZKutWXUSGaHtgb7e0EL4jmu2BGoOqp6ORH7r3HWszpZ7+AN+YBcihzI7VXyZLijI6Y
         gNTA6se/MN/F68sxBOqGls/YgdTXyHzWp8PH05tFP51gO6MIZHK+Absw0fClhRQJuyrU
         nIhNRetiRzuvP4DxqoGpjAq1QamiFCwABqTOtnVlvw0mEY5DinsATWCBxTTAMLYa8RgO
         dz5AfZRZBGxsSEgbwDwOUu5qTqY3iyWdy2zyPMWs85HuN9IouwxLyIuE4AUdKFV0X7J1
         VnpBwirC5RIQV+gUsB5QuZRjV0cQlIWoOucMCKP4JSQ8yPOo5tEga6Mme1sgn4TrnAZr
         xeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718730675; x=1719335475;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMnnhcMJpi/gTaTN/vn78bq4LGXwg9q6pMTAn83Y3F8=;
        b=ukof6rWDO2Dvj8QWvn2s2s/AwfUaoNuCRx02a+TUGUR2dhLz4bdJ9AXtur4KxXf27w
         TVIOBvEEOe1waTZ3QKbgyagExgkbO0QqJQS2U8snL6SYeFYjspQDApe7B3/k6EGNeAJn
         9wczxRs4FXhlvoIRfWiO98vQGifwbyk7FTgu0Qowyxv+iX5FbaUb7S2RiT6hZlpaOI28
         8fmetargaZKiv5qSkX1Q6Hhv5soi3CLk0EofzXy71WMWvzML+Qxag5zids8LOYNynkgl
         ak3dVAMUGfCzky8urDpn49U8Nhk/BkhLGuG3DL0tdxpVAR0MRIYAwUDh+zSc+PZS4K1C
         YJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHCJ1VMBBqTZwbJxBJVuZWshO7orlh89bA6ltNA04wPlIn1LFu373CpSyQ0csft53Gy9nu4/w9CeO0DgJO0HfxipSR4Cl4tAWr73sYGIUK
X-Gm-Message-State: AOJu0YySmbvXPoWlsvniKMnNKmtKK7PGlRNBAi82r+Rl6weT2nZDt1Q8
	vtKIvtoW8a89F7y594AhOpmNLJ9D+iJoflDthfI2n1Mj+Mu4ebs522J0+Gz5yTA=
X-Google-Smtp-Source: AGHT+IE3YLTxrz4a33OZELsomipBlbv34KTAQaWu5RA+5U74pd1KGVHNkLG+dAjkdpUc4qAC/ksT8w==
X-Received: by 2002:a05:6000:2:b0:362:363a:9594 with SMTP id ffacd0b85a97d-362363a95f1mr2284533f8f.11.1718730675351;
        Tue, 18 Jun 2024 10:11:15 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9184sm226912045e9.13.2024.06.18.10.11.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2024 10:11:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240618114653.12485-1-cuiyunhui@bytedance.com>
Date: Tue, 18 Jun 2024 18:11:04 +0100
Cc: Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 costa.shul@redhat.com,
 Andy Chiu <andy.chiu@sifive.com>,
 samitolvanen@google.com,
 linux-doc@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Message-Id: <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com>
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_101118_037362_F3238D9A 
X-CRM114-Status: UNSURE (   8.62  )
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

T24gMTggSnVuIDIwMjQsIGF0IDEyOjQ2LCBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4gd3JvdGU6Cj4gCj4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5j
b20+Cj4gCj4gQSBoYW5kZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhhdmlvciBpcyBiYXNlZCBvbiB0
aGUgZnJlcXVlbmN5IG9mIHRoZQo+IG1hY2hpbmUtbW9kZSB0aW1lLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgoKSSB3b3VsZCBzdWdnZXN0IHJl
ZmVycmluZyB0byB0aGUgdXNlci1tb2RlIENTUiBpbnN0ZWFkLCBpLmUuIOKAnHRpbWXigJ0KcmF0
aGVyIHRoYW4g4oCcbXRpbWXigJ0gdGhyb3VnaG91dCBpbiBuYW1lcyBhbmQgZGVzY3JpcHRpb25z
LCBzaW5jZSB0aGF04oCZcwp0aGUgdGhpbmcgdGhhdCB1c2VyLW1vZGUgc29mdHdhcmUgaXMgYWN0
dWFsbHkgcmVhZGluZyBmcm9tLgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
