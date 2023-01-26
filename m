Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C715FC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TW94RoQxurYj+uoh+GLEtXMaAEI7nkAnjlkxw4dD9/k=; b=wn7g0V6FkLBAD6
	eWTwGjTUv4Op2gdcgyERzgItFu7WziHif4ZhThTnkUqoVaLbv5w3zsdMfi/0kw1VUj/GZhHXLQinD
	gMeaBTmTv9C1VROM7kJbmt6o2x1zwdRMFiAMAK0y9t0XH4KbmGYOV+9M7jOGnK9pn6L8rAD3FN3ua
	XSpOSs2FNg+IGa71oPV6g+XHImabcQnvxkgN3OOSXFWdjrslpeHTQuJ7+wl96U1X25IjVIubqggon
	LKHTLzLS+r5TwFL3FM9wubXYyBI8v9R+5tHANpu1hXFzs/NtB/PZKqdhnpgdC2eIiSWEDH2a/5l5G
	bKO1T79RVbjWD1sZu+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7hl-00CH5O-N1; Thu, 26 Jan 2023 19:14:37 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7hj-00CH3e-8V
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 19:14:36 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-50aa54cc7c0so9142237b3.8
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 11:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBaflCYw2m4ZpSYc/L1jwPBbC18VWFzN42/SpYCj2js=;
        b=bHAnbg1qrvnjFDBq4rDAEAtuPzYtSeM884V5t/BDJUvSPa4oE6QHpUQrdKHepinthY
         0pb7G2bSubps2A+l0PMZ+helB6y0qtS2IUwGvbHoWxgGhKqhpEzG42wRh512unI5VHt/
         AmIdu3Eoan6D3ezRzU66gub3AuwNvPhWL+ByBPZCawbS5o2k0XZf/oubwhyIZku8mW2u
         pwQDz5oLoUzBvnFb+nUf3TBrt1+mS+4OmzMTGO1PMbxOrA+cfQguoHSHhIjo7BvZTjii
         DC4BmYixGumZlYPOa6RX8hlmusN8cR/YkFINMUfQt92/el5jqRaRU01nOG/RazAz0LbP
         pMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBaflCYw2m4ZpSYc/L1jwPBbC18VWFzN42/SpYCj2js=;
        b=P+lWn29wiui/nttk7qgp21wgmqvLqgh+g9OhBnlZyn8ErQuHmZKDl8dE+oD6OKMOPW
         YHzjFYV8ok5yhjPQXAGg8bsXmLNv3zjyztVmkijMQFJT5IwleqeYy6DTZE8+wWs/h81r
         bWxBzHkjK+ilGzDVwxW/ivneg0zt5Ch8YHBLS8nJCi/xUjAHNbwrPDeLimW0iRLvSUQn
         ej4zfJmAwWoIMjuHbMbEGlbFhaCpfH3THhMk+e4dwDkl3d52o43eWXeRynepd6oFGykF
         oL8N8I7SU4uD6KfHh7nawX0A2Aksl4oy7BYvvd+32WXVcQvadHJB/0PqRL9Sa+dMjfWn
         Qqvg==
X-Gm-Message-State: AFqh2kpfk2DNfd/hrsMmzAQxL/Gm0NhzXkd041LRHp7S9slV90S8M5V3
	jrI58XhlWXM1zE4o6LxUDSc2ICgVfPF0akDaSLI=
X-Google-Smtp-Source: AMrXdXupcW0FnUSj2qcKDJ+i5BekGrYWsKP2NEjPHQ96FZBN7tvseY5dVT/oMmNzyu5LA/vU+un2CYi0wXZ5jEg6QOU=
X-Received: by 2002:a81:5402:0:b0:3d8:8c0e:6d48 with SMTP id
 i2-20020a815402000000b003d88c0e6d48mr3099310ywb.462.1674760471019; Thu, 26
 Jan 2023 11:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20230126172516.1580058-1-guoren@kernel.org> <20230126172516.1580058-2-guoren@kernel.org>
In-Reply-To: <20230126172516.1580058-2-guoren@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Jan 2023 20:14:19 +0100
Message-ID: <CANiq72=Srm7aBu7Stz8-t1PkhFsPXUyoxaLJCLJHG9b6mVc8sQ@mail.gmail.com>
Subject: Re: [PATCH -next V15 1/7] compiler_types.h: Add __noinstr_section()
 for noinstr
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, bjorn@kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>, 
	Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_111435_315922_D79A71C3 
X-CRM114-Status: UNSURE (   6.95  )
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

On Thu, Jan 26, 2023 at 6:25 PM <guoren@kernel.org> wrote:
>
> From: Lai Jiangshan <laijs@linux.alibaba.com>
>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>

If Lai is the author, but you are submitting it, shouldn't your
`Signed-off-by` be after his? Or are you co-authors? (but then it
would need a Co-developed-by tag)

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
