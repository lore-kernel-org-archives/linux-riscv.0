Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF16C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ug39VjDFKMlhz4DLWPV9Mi7vO+ufBso8crE0MjMQhCI=; b=2jkRV/d0zOBKcR
	85fsoUuPgzqCmKCzvujLcfidnmf7zEdpboU6devO1XXb0hwsHQhv/FqtwtZl1cVI5qheEc5Z3TbHK
	MxzP9phi8c2p0D+l2STj9HYHPTcsWXnMqMZhJmVIXJaUT/ZKEtB3uJEo5klWQa1lPU3mx461GEgWr
	4JrBHcnt60HjNKuk8X3PBlWji+m/2B4u279d68wHBW9UdFpshrsKF87BUAljPAxZRAuYmPbQ9A2Dp
	Z3IPXVzU1ks50yRcjyKMahfc8EUSQqIn6CRSGtBd15IdelxfLqclNYFs1uvJj2zULtwuNq4MNb+0O
	7o4Eu1w1Od+itaR6W+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6RS-00000007fDl-39fj;
	Mon, 02 Jun 2025 14:47:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Qb-00000007f4k-0aC5
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 14:46:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so725035866b.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748875575; x=1749480375; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=fkc5tFNTRWgTAF+aFVaqYZNJG48h4vpWqoQMqEGizGv8ttqgVHENk9m2FLzaTlTf7o
         BazwrcH0tPKsY2BWcP++2ok0vk7mHltPZX3OffifaDdA5wqpUetcfaXlXu0GpI7QjVnr
         VK6J6kqfbJOIoMNpwpNZwYLZ/5SRTIwoSDTf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875575; x=1749480375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=QREX+7nhhUP+SYyQsLhiteD7fHtSI2iNRD9vtyxbthO+qExgZvJwHj+MYg9/7uJGKB
         8mH4b1BSM4GH9riDo19PqVFewfN0HsFxHuZJhaCuhTMlPd3o5Mvi9firbCP1pZtn+389
         m10Map8YILxY/LYTdOMWhk1wTE1HLRfBoQBWAbHhb/jSzlQyJtr/qRjkJgN9K9wI8m3V
         7W/CXFrzpN4AoGJNnRLocIUDU0q8cn6oEDuAjFdxOXSUFwOFItfN6z9ImYbE4IZrJ6o7
         u+vqyO8HYbApLGyL6OgJ4ndonW9K6/chPoov0wyKqUXGSB2oyKlQ+0V8stCSUnMJCLt8
         QMcg==
X-Forwarded-Encrypted: i=1; AJvYcCU1u0jEyFkVV0t7BKSKqQkXmxmSTKlpbPk1hh4WnlZ4l8WEgnb3ZFXLeYvYeyYYizh9L46t1zKJfCSR8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv46IU0R3o2WKHsFL9o+GfViVoFMtVjGweKcK9ayBrvagJRflm
	aIc4pl2Z+exVfFvC7wnwKy/x9NxlLDyaWGd9L0FEDQB+NiaFIvW9IZ1PwOMfX8MMpmUGDSCb1F8
	QKvYoPBg=
X-Gm-Gg: ASbGncvql6d/IhkTIYa+b1JO8JKzs4Y3t2SX428/NQPwoBmKoqpoWKQN2TjfE5oDz8+
	I7mzM+fXnyL2QXp/z4OJsHtczT84ZjKMlyvCL580bC/QXg1f9b8juv8tIuIrF3/P5AxyGZkbAS7
	5XkKbqWrWMBHx6hFm0NWYnjcbHedwIcQFLGEGJZrwEdPvbgFS5n88orT/Lxc7FutdLp/coOnz0w
	F48WAjcM5Bg3T0jicvMvymrsB5VHo9HD6Bk/tQYwz47nxm3182AiOHt/H8ZewSmoG8xaOI0cLEf
	785eVrKsHb7tKLm6w8Lde2+2YCIKJq6oV+l13eb8vBjA9wbq3IBd0RxunJXwMz224V5h1S6pGGR
	2H2gAZhZBFzeiHU/AubZmc/H3Ig==
X-Google-Smtp-Source: AGHT+IFG2gvbDSFKGeBiIbDoZ2nlI6NywULIHpsT/6L7Yh68XCJACtkqp3IaQIdSlu5bql6YnEh8Jw==
X-Received: by 2002:a17:907:72ce:b0:ad8:9e80:6bb4 with SMTP id a640c23a62f3a-adb322d8d94mr1311128866b.20.1748875574875;
        Mon, 02 Jun 2025 07:46:14 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d773sm812961066b.61.2025.06.02.07.46.13
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355622a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqjFyJaZ3ZCMmPSL8TuNMNNf1DHcze1rtIb1VIMTHG2eqQRfS025B9eQbIPn8e6UZhwoMRkfYY1MCItg==@lists.infradead.org
X-Received: by 2002:a05:6402:5205:b0:606:3146:4e85 with SMTP id
 4fb4d7f45d1cf-60631464feemr3563572a12.4.1748875572780; Mon, 02 Jun 2025
 07:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol> <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com> <20250601230014.GB1228@sol>
In-Reply-To: <20250601230014.GB1228@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jun 2025 07:45:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
X-Gm-Features: AX0GCFuodXM8SKmhJCuuDQhW2iq8pjrSnsjy_QXiBCm4TA9D0azfhocKT2KWhmk
Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_074617_226627_A7EAAFF0 
X-CRM114-Status: UNSURE (   7.50  )
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

On Sun, 1 Jun 2025 at 16:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> I implemented my proposal, for lib/crc first,

Ok, I scanned through that series, and it looks good to me. A clear improvement.

         Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
