Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07797CA9EC9
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NSvLt6q8aRTFku5ggxmFPJQU+RcMKZYXHbM8GfAMbI=; b=q54MXtUE98KSca
	T3v5h49ZzP/ma+eMjfXMfl6u4qmvLNuzJEljkmXAz/iZEwGcSyGR4/s5bTJuohLQPUROWA23J0RHw
	Pc1Ht1fiMl7zr0oiwkvbNR8qgI5oyQU/Q7yz7codjyTiNmUxQxQ4kaqLbHJh+6Vx/HwxzEaeE++kp
	yQMC9CR3eFnPzY04Co/NrqzrANyk2vyvYHc7RhF/XrpQVyqDbx2lcONEl+A0W2bs81VA9HgHxeZ4S
	ropF9KCwB2FZ6/UwDeEQJ22Qq0c9wOc0SsF3TJSqWjaSow9ChkEAmpXPJDIYAUcigIAzB9s9lrlrf
	2GRybeVBGNVFLxpR+2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsJP-00000008z4z-3nh3;
	Sun, 11 Oct 2026 12:05:55 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsJM-00000008z4e-3CRw
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 12:05:54 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1015114e0c.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Oct 2026 05:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791720351; x=1792325151;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MYYLB6b8ldp68NYO/Uak5yoQKizi4SG6z+b0YMUosW4=;
        b=m98Utfu2w0WxlBQC63y4ukZTjDMHWn0cvTPls8D46w6cC3Hk0ZJ6GgXXIk/S3E+Gvt
         pV0Pdu1ls4ziNu/snEQb+tMBlzobfdiExfK5dzcD81q6CihZjJZwhGNaM/HKo3m9SU4A
         Sr02nIhLjBUh7UH7rhAb4rzibrV0T5lHp7XDvcSln3uN9QINoX09ROCBTu3T18IHvsLr
         ru5VHG0pw/OXsLtaZtLBf5Jl81RiRMsLSWxAAAB2VD8yP3pwYnm69FuzP3bZPYIPKEbi
         YSPSsVwB1fnUd2+FAL1KYVhAT9soFRbiZv67D7c2gDFyLgc9EmWGHAyT9Qt4YQmdGroj
         dJSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb/KW90JSK32b8685YqCY89Nuvet5sYjornohLEiP5FFKCE8JCfw8RtboIVXoVyGzaisYEWdPrjQbCsw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIdUFArrwaZauHsnQcYIUl/4VUjScWqJAhtb3CEFXDGOEBv7azR
	4MIcJQZWrkeP1q3P9irFNXJKkxlXq1nUJHmMwmwLjL1FnxKi6bD9qopJpDyrev3w
X-Gm-Gg: AYBFou23xpkenFVz/J7qFXpsrIdVQundoALyKhA/CAQkxba8eJ2l0XDGzNo1Xqn7OIR
	lFNizS/pjjvcxebyRdbqDUCD2Cf7LwHPUQOkUI45nI1cVcfZRo8ZCq+PY0+J2/S0ogNcmeSngDd
	vpoR5o7gjwhi0iQHV/C7RVmjBM4z/zptNYjB28ejeSZ4JfXxCPzhvm3mg+6YoREQdKESdcIlrWl
	rKuMV0L+nuhcorSZd+sO6dOqK7gBB1gqx0UA2V1MOqYK8dbzT7chwrsgCJoZ1uM+trexyOdJ/r/
	I/dfTORFNrExL/voOGU5DJRHoOCuSkxEBDioBHLvchD7bUrMIAxWHyPoED//KOVBY6fDcqVTqt6
	JK97RvMdiH49PAoQo6Ja+Cp8QHRSkKlCkEtDaftu1ADI4ujhEct1XUQPwG2GDo+xvj48qfqkitX
	Y5eiSF2HOv6VHwAfGtGXrQEfYI6RbEPhrow6vGQBWL+DIcvlcLwyv0y2DT3u8NePDYKyPfIOTAw
	qfRuZKmlcECHcOoO+bF6BiGEwPgenA5OOt/
X-Received: by 2002:a05:6122:3788:b0:5d4:7441:1671 with SMTP id 71dfb90a1353d-5e91f518b12mr2647847e0c.19.1791720350693;
        Sun, 11 Oct 2026 05:05:50 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cbf7fccsm5205698e0c.15.2026.10.11.05.05.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 05:05:50 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-779d18ef706so585457137.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Oct 2026 05:05:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdnsIKw88c5JCVPJCLTjJgZrtvD6uH9WPubpN1dkh2h7Qmhy1HV0hzFF8rL3s1GA7ziyXT5kbrQdNSOg==@lists.infradead.org
X-Received: by 2002:a05:6102:441f:b0:7c2:ea3:418a with SMTP id
 ada2fe7eead31-7cb37afb854mr2227341137.36.1791720349137; Sun, 11 Oct 2026
 05:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261009-ee797bb64a30cf907f583aca@squawk> <8d0fd503-4f4f-4cd1-9ae8-08ecd478b8cb@kernel.org>
In-Reply-To: <8d0fd503-4f4f-4cd1-9ae8-08ecd478b8cb@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 11 Oct 2026 14:05:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUR6S6Qqg8T_scvuwsBUW68T4chtafqT2xGV3r0dHV5A@mail.gmail.com>
X-Gm-Features: AclHuK_3ph9_N-gFM3EdCHEuQ4CbPPEvdL1VONmUE_XR8yHShDG2ifHd2IIhZDU
Message-ID: <CAMuHMdXUR6S6Qqg8T_scvuwsBUW68T4chtafqT2xGV3r0dHV5A@mail.gmail.com>
Subject: Re: RISCV: canaan: Deprecated (oficially) the K210
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_050552_827039_58AC203F 
X-CRM114-Status: GOOD (  18.83  )
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

On Fri, 9 Oct 2026 at 11:32, Damien Le Moal <dlemoal@kernel.org> wrote:
> On 2026/10/09 11:29, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Two years ago, at LPC, the only known user of the k210, Damien, gave his

FTR, I still test each renesas-drivers release on SiPEED MAiX BiT...

> > okay to delete the platform from the kernel but this never actually took
> > place. Deprecate the platform now, marking it as broken so that users
> > will have to explicitly re-enable it on updating their kernels.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> Sad... But yeah, this platform never was really super useful in itself, beside
> the code cleanups it generated.
>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Sad to see it go, but it's indeed been a while since the kernel was small
enough to actually get to a shell prompt...

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
