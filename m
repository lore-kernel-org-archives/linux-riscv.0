Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3DBCCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 05:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7SSIxDAC7/i4gfbDg6ReY4mX8SjB+eB+dZ+8SD0xkE=; b=fweMANBGnsSCH5
	XkkHOidmPhEM2XdtGNu/VPEbdEiLAtfKlfTT9lsAPG6a1n7PYKGeI9Ig+PiFK9T4MzYtooQDPeoQX
	wqzfPpnDNWB7bLrW2s1VKTlG6r3lS/tDWXol+mzUdshbmWz06vp4D3ZjxHkBw9tBZCdH3qAj1r7S0
	P6Ko68JPTg/WQ2Lf6uz++TOrZED9GH7pomD8Tveifw50yCJ7qiLz+OYwvsTael8UW2zDqJe0dgZPi
	9RlndtaQaMYROpVvea235DGnO0Gy2DWdKOFHJaCzmxMIhOsibvKtaP0TskcSJVBvJrIjtNYvBEF1v
	1xfoC1JxPfo/swPta/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBo1H-000000059Ac-1Fxz;
	Thu, 23 Oct 2025 05:37:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBo1E-000000059A6-2KRa
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 05:37:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-63e18829aa7so514959a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 22:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761197866; x=1761802666; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
        b=LLSt1B4l00ATSjPap1f7TRPKORhxiA5vCrS/aBDpI+KhEBZ8sfE6k2GPkqlfz96yJL
         gbG5giYiYcsMHUnhEDT0TUgnaBHam1xmz3i7/xQwZyV+nBgh1qk7MUR/QGFNHYA2SFkM
         zwq7wh740zntpogddau1UZZ5zgg5ehPhI5tbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761197866; x=1761802666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
        b=WHplzMVjsDJJi0/FQIEIoU9Tqx34uf4+eHEpXD5QLTSgB5XEQVXXQkbiEMcp/gOoXW
         pm7qzsusrKJL0oo1HA6w27DYwfX/Cc0Lrfs1lGcTLoWk1CqpKlFcuPo/Q7DagTjqBRVj
         q9wg+l5ZAMLYaXI8/Ap5rIxnOlSkkGqza6uqyflVHmobsZJ7Ce+/i+321pxnONw0/Eo1
         Ue2DbE0YdDF2yIG0lAypM3VsdtONbYP4BDzm6sFrRemljBIJmNxkWjYzkgWu+N++fIXi
         KIN0P8tt1frChihULz/6WT0PBdIRCt/35yR3sThYCZoueDvckYDlCBXmcx3LmNrr+qP5
         +hnw==
X-Forwarded-Encrypted: i=1; AJvYcCUGFszWS5vtyqNFjXtVDlGlBnm+yU994FvfK/n5PxNg3n/ygQBED3BOn7PFmq4x9yoTTlbieDG86YkW9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPirS3K9Y2jjMHa2cIkshWnqIzoa9TjXf3Gw9Zjryt4gyDygDP
	+30AV69iG6x3hulTXdqT2wSQNaU0Xw4vDOYAb4g+FoVYfRALSxY0kAS6cp4T45coJfHb7480IrG
	x1ZQUcB4=
X-Gm-Gg: ASbGnctpDILP1+Sy/+gLhgIXbBeqR/W3RESP9oSX66nSCK6v1VoMw4W/2iSVHiqXDPE
	YgddKDOAzKBA5RrV/mvrL9EZdzUJpxskz9tmUUQEXv5qRX71kzZwXwIxYNR4WRWKl1OOHK3HolP
	8OTDe+oelbBB0S+5zg5N+cgDX/ESwe2X1k+tHSHFRUzHJYgfHTENXfyK6J0MYp/+7XxC/v+/7kJ
	DywEmvlkNYKx4jPLde9LCmC2Z50iFL45ecMYiurUvq3avzUG7MSoyrL2zqj5Ry7gKM1VqSZCEjs
	WJSsvsr4VU4rI7honuHXs05ctfLkN6QQksgAFrGJoEvzNRSIVleteVXlJlUNxvgTgUE6F/Jwz3L
	QNUiViwr17GzZC+NFx0EzVZBFy96KmMlEouhDENM6LFXpu6xdELPDVjuEetrXKXJRi+7M+LiLbE
	r543eyh33LjlFmcesT0ynbRWJ16RMX0nK6oa/YfkOsk2uvXAp0eQ==
X-Google-Smtp-Source: AGHT+IHQbwyDSk5ybFj5pgFYqlm3iQNhrvEU4TrcjY7MiNw+kkTuOMA8wVFguONHXtcc9b4rLL53TA==
X-Received: by 2002:a17:907:72d3:b0:b41:f729:77b0 with SMTP id a640c23a62f3a-b6472b5e475mr2737666766b.21.1761197866512;
        Wed, 22 Oct 2025 22:37:46 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51317e97sm109593066b.35.2025.10.22.22.37.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 22:37:44 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b457d93c155so80620366b.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 22:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2quU8mCzJZt9mFJMrK+4Qw8QwcRwmBOTV3v2RZRjSDkOxymcUg3Yl2hYpxwawV21nL3Yptx1CL1VBLw==@lists.infradead.org
X-Received: by 2002:a17:907:7ea6:b0:b41:c892:2c67 with SMTP id
 a640c23a62f3a-b6474940c41mr2905229266b.45.1761197863543; Wed, 22 Oct 2025
 22:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com> <20251023000535.2897002-2-kuniyu@google.com>
In-Reply-To: <20251023000535.2897002-2-kuniyu@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Oct 2025 19:37:27 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
X-Gm-Features: AWmQ_bk45WJyQfjQIDpRb59HoMm72eRtwroHiVS5YhkseklDQ1bsOMejpvZJz24
Message-ID: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_223748_763630_60B90FE4 
X-CRM114-Status: GOOD (  12.56  )
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

On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> unsafe_put_user() can be used to save a stac/clac pair, but
> masked_user_access_begin() or user_access_begin() introduces
> an unnecessary address masking or access_ok().
>
> Add a low-level helper for such a use case.

I really suspect that you cannot actually measure the cost of the
extra masking, and would be much happier if you just used a regular
"user_access_begin()" (perhaps the "user_write_access_begin()"
variant).

The masking is very cheap - literally just a couple of ALU
instructions. And unless you can actually measure some real advantage
of avoiding it, let's not add another helper to this area.

We spent a fair amount of time undoing years of "__get_user()" and
"__put_user()" cases that didn't actually help, and sometimes only
made it hard to see where the actual user pointer validation was done.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
