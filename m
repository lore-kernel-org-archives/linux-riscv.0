Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C927ECCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCltO//Dy8f+KpI8MG7Imfz6JE2blpV6dYnT9yxfjIk=; b=m82bVjwFnlg9vq
	ijS+ayJMfGzqXhlpU2NTHTv42OkoNxr1R9y1IadSBg2xDEX/XWPdi68qTvfQaVsQDcbgw6ZCZ/Fve
	9p+5StdhTDf0NcUzV6vid3BdoaEHyCQP9oRcowxiO7YuW29A2p0H/n1qPQ77LQ5rCoXQU6K67UHrq
	YjFgoWoWD3BBHeK4PZlEZDnK/sArxrMVlpRTiLs96UsuA2WHrzA+CLuPxgtSNEr1Z6LO+edvYq4jc
	pfu2sz9++1V7iEuBfvueX66ZTlG7H2ApoQeGQNNX8yf0FRgIfhiSMx73UNNHC9AJ6MFAQ8EF816/4
	8NR4md34k60G26+hGLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn2Y-0000000GMb1-0yll;
	Tue, 28 Oct 2025 16:59:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn2V-0000000GMaS-3PJC
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 16:59:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso3693666a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761670758; x=1762275558; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
        b=G494eAUbnUsuD7NC0MLttM9jZzMO61wxLtuoyD8Lvq+1764P2Vglo5F5xz/pakjmSq
         gXWx56z2tRsue0egx02tc1Zul1pUJAOxJ2lOIsGRB1BewokKKmpSOzY7G1SImT4gtuoQ
         osEY45K2iglQ4tbQEtX9ogXeWDISJeuTdJN9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670758; x=1762275558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
        b=Hy69X+pD2SW3BakqwtMb3sQ8cwks2GW1Sw0fJN6o5KUoicpcCSWSBfj2qYW0c8AtFk
         2JZOjtxTszNT+cs8i3TuXJpqPoPAAaFIN20TDf85fLl9WN/LlBOEWnV2kbqK7WBe6kwR
         1gwHyz1QMMWSSNqOAtLPMmlWygGoMTxfYTkW6s+ujej+rxm1pmVxC3aChNQzE8pOaywS
         IJZlJu1AyatqMjVyJzdFxE+eU/bgX44NvhxwgewsOyN41rDEb2b/iKfVa5duBeIdybi9
         z1yYIXKzoQUZ0l1khhjP4TAigBvARRF5Yur2Sa+0UbuXbWpkVN9pkl0xlPQrUzIjEWkf
         JOsA==
X-Forwarded-Encrypted: i=1; AJvYcCWMQjT23k/bqPEjPw1N6b5oagtzV25GfWIWpuSSRZki19ftXDC0mHaF8MQnVNKKCknw6dz43STRyHbWmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH8ZCM4T+ywylVcLY7gw1ExqZa34cSkmR97uDfesakqtliu3Aa
	xkGMeKXYXAKWsm5doKxsdcqsWAlNZxMn8Oyt1vvWJlsMfoulv/9j5lIX5IvtKZmprkxfLMhHjRy
	KyCQc2tXeXg==
X-Gm-Gg: ASbGnctqchPv5qlxnCwqgAk/xRF/mZU4OVQyJsi2rbXvYqbSMr4gWzLFPyZy4ZWjX0A
	pAwPd6PVQLrci0KwIbo9JshCC+ras0ZWkRBAgKF2BSfL+20de7qfi0ZxKVzHvnFlI87zs+lq/KJ
	RGKxBbbrUZ/6LeHaGkxiAieaX9NEwUZsdSVtI7L1qRE46XZuCU8jUZBHSInFWt89Dbww2UIvyHd
	qcy++Itbf2DcHbTYfEYskhfj//lUdS3OZl/cjn1OvHBxICBRWVOCnV/WMSI04MivEPX7CV7SadJ
	VOVTt3zMbuCrWAc6JeQmC5T9TMlRgYRaz+rXjhsLHgc+mELmB0ZTNEXfBtBKESXKbWp4DLK/lfT
	sKo3oCiMMYK7HZx/YigEBV5PUMM3VjFbZ2czJJXdVRRNiOjPCqafAqUF3Dt3SwmVeJNYwBgYM0e
	sIHZXTmjmbgiBhLvczzVPrMSJXquVBObw8QplX2oEo/x0tp/ExVA==
X-Google-Smtp-Source: AGHT+IG2CI2HSxf4AEJ8FEtwGoqmM1aqaH97fOT8VkjTcaUdJzobjakZgZdWMKHcOniie9YE1PM7RQ==
X-Received: by 2002:a05:6402:44cc:b0:640:3730:285c with SMTP id 4fb4d7f45d1cf-64037302d57mr828672a12.36.1761670757778;
        Tue, 28 Oct 2025 09:59:17 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efb9739sm9607468a12.29.2025.10.28.09.59.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:59:17 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso4088972a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6TN25lpcQbNoPRvnzxkVX5QjKdXaqkMymZlDSOlz9LXIvLMBLNy1nGwwnVA5+ctZIbl/Lh400vTLABg==@lists.infradead.org
X-Received: by 2002:a05:6402:5244:b0:637:8faa:9df7 with SMTP id
 4fb4d7f45d1cf-63ed8cc16aamr3779861a12.29.1761670755473; Tue, 28 Oct 2025
 09:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
 <20251028053330.2391078-1-kuniyu@google.com> <20251028095407.2bb53f85@pumpkin>
 <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
In-Reply-To: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Oct 2025 09:58:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
X-Gm-Features: AWmQ_blBlp8rG7EHRLe1uP1FYCp4LO5ZZWflvlu1_iOk9v8s-pHpb1shOoMSUXA
Message-ID: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, dave.hansen@intel.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, 
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, will@kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_095919_859264_2D96C631 
X-CRM114-Status: UNSURE (   9.11  )
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

On Tue, 28 Oct 2025 at 09:42, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> This is the Zen 2 platform, so probably the stac/clac cost will be
> more expensive than you expect on Zen 5.

Yeah, clac/stac are horrenously expensive on Zen 2. I think they are
microcoded - and not the fast kind - so effectively serializing.

They got enormously faster and pipelined in later Zen microarchitectures.

Sadly, Agner Fog doesn't do timings on those instructions, and I
haven't found any other place that has some overview of the
performance on different microarchitectures.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
