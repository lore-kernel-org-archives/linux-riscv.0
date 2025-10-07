Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF2CCA471
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 02:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYNjhR23PXtzhja2HzUDHR0An5F/NNtZ03zgIn0ALGc=; b=FQuv5WW9yTjSyA
	4bTpheWiFrsFAI3AIRnHlfjVF6snRQYprEjHAy3MUMR/CuM5+exrxeZgp/eKv8XRJUPWQrjxqh8WY
	c2Ily0PYDucgSKTAHfdcdevFv1yGOBFMAXDfnHUR59fNwDw460CO6jJ1D6ShblRml9E0vwc6PiEoc
	ECyinokg/kO12lTs43Ctk1E65r0gpUXgjL6WnkGG8CRQBSAKkZhVPtC8H0miwwvSbvRvr3BN+SS4l
	Jk4cAV/EOdju/tbDuO1RF89fQ6wwrDBgB8gKaEa5CIafku213k+i2JJ0gvCmBHQiHdfv038khfhBo
	OZLoVoIjkGT7AeyMv4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5xsD-00000001Be5-3hXC;
	Tue, 07 Oct 2025 02:56:21 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5xsA-00000001Bdm-3P1e
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 02:56:20 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-635355713d9so6148000d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 19:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1759805777; x=1760410577; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuFAPKshWl//JiXRjMB35HbsTIfb2+26+cuu4EjKaKg=;
        b=hYTl7sKhuewMd6uCyqYuP0NKFDi+6l7/HVJ/2BH5BLKIvcZNOgL18EWr8rDREoLcrS
         +Qy+bh4HP3d/DueeE/fh4QxS8blmoZC2NUqkQ4hyRC3yO9LrJh4psN/3MYaMUW6Tb12N
         sYtdlsZEAJNxyYkVIPxgToFkAMvsioqSPep8jvyKfiWgpBM5WXVJD4iuU2Xx7PmLbSkD
         thkYu0XZ48vlavZB5mAohvlpe4MgqrMDsyu7PwixkSFxdt1/3VmZN3I6a8RUaGTTd5n4
         M7NB4IM3s2p4dphrDyBExu56HssrbZAXVCaRX9P7TnI6U5tEGLIjHMZsvYXMYaQmlkC4
         ipVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759805777; x=1760410577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuFAPKshWl//JiXRjMB35HbsTIfb2+26+cuu4EjKaKg=;
        b=CC5NAd8+vWXC7nFfIuQf2Kj3Var7IUkoXHlCy5YRmbIrjy1qad6WTeQzUEY/x3b92X
         6TBjyJ6eAD/LPlKlBaJVpL78yyXE6/gCUtaNthq03rdo0FkONfVjNX+A6q66xjVsvPY6
         +ndCY5SK/8ZA/nCTF6b+sA2YsxoAHkHj4+/m/tBh1iBSPYJ7YKLVIa+PfP7CG7uFRji5
         lRjgJHbDLzsubLelFKbZx89mOmB88gGEjTCEQ5GmARm4hVCHwmSzuSCFXWaI7QKV0odd
         cSYY36wuXlFBITgfoJp9ggk+p8YiUq9xqUirpnlboJhl05+QA+kRQBgblZuORiScZMDe
         c3pw==
X-Forwarded-Encrypted: i=1; AJvYcCWxz1TsOprDqXbsSg17KpBPcKzk/RkB+/n0YpS0PZ61ZtRFSVpwBTX7jHzgkp6WPdW7VDr6hpODuY25PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjifX1YfzFinRes5jm7/stsaXrLqZGnJke+HiWtpW76SWieLAW
	OYVe0ShqyepMB1SEysheiAlbys/Xnlnbuotld0ptgHyPj2ERe5aYcGd5LJ9DqJcrM/7hylVT3B9
	HzH9t+Sf1ZPmr+D6QDXb3hW7B+2cda3RovPWr3AXmhg==
X-Gm-Gg: ASbGnctu4OtQVySFvSIqgb1tOwfAVzDgcz+gZC/xW/wxtDj2mAm7X9ooPPO6ghm7qTW
	rGe79GrVlom+mLcfVRxRKWAIPJ8Y8EHuW08wc7vnOsLc0eJ/8DGPPE5ijGRRDit4wvljIhwHbI4
	A6u99CJWx2a7OrQD52suLrfmSY9MJimbuYQP6E75ZjnCRvTf5c6280AtrkibqQN5oJH4bCJqZSj
	odO5dBAIwuytWRC2Y26vnAB4t0v418=
X-Google-Smtp-Source: AGHT+IGiL5ZbUyw4GIm1wEiPzbvi0bFG0G6zf6Qg7uBuzVV7lluUj++swICMyX/mIRT04h7owb9dsBoqFDjT19u1Wdo=
X-Received: by 2002:a53:a090:0:b0:635:4ecd:75a5 with SMTP id
 956f58d0204a3-63b9a107b85mr10946438d50.51.1759805777473; Mon, 06 Oct 2025
 19:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
 <20251006-tt-bh-dts-v2-6-ed90dc4b3e22@oss.tenstorrent.com> <a05be32b-dc8f-444f-8c1c-2d49eb19536d@kernel.org>
In-Reply-To: <a05be32b-dc8f-444f-8c1c-2d49eb19536d@kernel.org>
From: Joel Stanley <jms@tenstorrent.com>
Date: Tue, 7 Oct 2025 13:26:01 +1030
X-Gm-Features: AS18NWDhncaNX_AgRBWrUJDmiFjfXWDY84NNzl_Nu5rdMYVHwC56fOAaV3Fa3Jw
Message-ID: <CAM3sHeBweq285Mwqzwd7no3zwzoosRgsHkunnVkYSgHyh37eAw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: Add Tenstorrent Blackhole SoC PCIe cards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, 
	Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@tenstorrent.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Drew Fustini <dfustini@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_195618_853785_0986E458 
X-CRM114-Status: UNSURE (   9.50  )
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

On Tue, 7 Oct 2025 at 11:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> You should have at least serial or any other interface, otherwise I
> don't see how this can be used at this stage.

If you read the cover letter it explains how it is used:

 > The HVC SBI console is sufficient for boot testing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
