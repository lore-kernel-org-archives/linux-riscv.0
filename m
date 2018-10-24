Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC15ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 22:35:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960DC20652
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 22:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4n5Ev1J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BJWkFf+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960DC20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFuW41mbBGkOpJIoASwfHV4vO7BPEdprc9nx5Z6yRqY=; b=t4n5Ev1JkWhI7V
	1eve3g6DLfaMyqMtA1gEASOJMkY+tpvSrEcvlwfQ0xOue85NneFPv5up6Styjjb6gGmkpxncr4hqy
	LloWVLeKlC60P/YPwoYhlpfYrJjghc9yG4Kg0IFQaSoVD8g4nQfaPVVjm15Bqs1FxmG1HZM6pmrH+
	Vjy0W/snhzDONtOlNjWVKAkJU7q/0XhK5QCKHVQitm0+UkBqGSDlHzwfbLAshBtx2SsS8RvLo3EVi
	YZwDYIBcl8i/JcrjvvzUvJ4VjmIbFYywYKhtlTtq4zy9fVrvFemw7BtQWOLTJfga2ohbqdlGTHgF3
	Akn7HUzG7l7t8trxQm/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFRjz-0002oi-S0; Wed, 24 Oct 2018 22:35:03 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFRjw-0002kg-PP
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 22:35:02 +0000
Received: by mail-yw1-xc44.google.com with SMTP id j75-v6so2774629ywj.10
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6ANNM4CK+o4++gTDNibM1c+Y7POTejQXLCymkEuMr64=;
 b=BJWkFf+m/AYc4RgUvfApNmmwmpZZ/x7d/vMB1j8X5lSoQ8ASrXf7aIsD5DwhLODC7t
 5mkJwtaADV3gE17XdNOJLSIxYwk7jDx7n7tySGv7DjgqGPeVWnxujomwQ+hWZyiGJijQ
 fNdf3d4SPbe/pERzqrXkjqr4RDIUA7BmcIkw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6ANNM4CK+o4++gTDNibM1c+Y7POTejQXLCymkEuMr64=;
 b=lEArKqXDWzdGZt0lxHG2OcgSDm4pqgd3X7bNQZ30XJv+f1PjsHli6S3qhyIpfbxpp3
 pkxbWgvohgBbwJjBwmnlyto0BPcYsSQ252jf/4GQg2eEdo1/s2kXvbva8bj0aiIcKgJp
 fSGLeVd1xolUK/cF2asuWqwiezLPHsbLI2novXTIj+C+f5fEuBW+XqPyh2F1UwuRspao
 xjNM9gtWYulTpN4dHPTqvg+K7qjPXwio/MzBnQnZ8N/EkBCj1wxfJXW+svl1v6ZamdW0
 d5IfB03ZykYkNgG4uNiTEb1hNMz6ckpqtHmlwT2NNsl0Np0hBiPpTszXszRm/F6tXLeA
 qwsA==
X-Gm-Message-State: AGRZ1gKjNSBed+qH9O99RAfGg7GKWndRtTr9efNYLXQi5gOZEOj6KgTL
 lx8u64Eqy3tT/YSfrFx5tCCpyzR6LTo=
X-Google-Smtp-Source: AJdET5dl1NA8C6gJ7z4JgEuyrpG1S68BaoOPGhOpaQC6ErHhvfCy8FGQQTmgx3wRVMn6gD5yWcQ60Q==
X-Received: by 2002:a81:834e:: with SMTP id
 t75-v6mr4028598ywf.428.1540420488654; 
 Wed, 24 Oct 2018 15:34:48 -0700 (PDT)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com.
 [209.85.161.52])
 by smtp.gmail.com with ESMTPSA id 138-v6sm1392168yws.28.2018.10.24.15.34.46
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 15:34:46 -0700 (PDT)
Received: by mail-yw1-f52.google.com with SMTP id v77-v6so2781535ywc.4
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 15:34:46 -0700 (PDT)
X-Received: by 2002:a81:2cc3:: with SMTP id
 s186-v6mr4287649yws.168.1540420485724; 
 Wed, 24 Oct 2018 15:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Wed, 24 Oct 2018 15:34:45
 -0700 (PDT)
In-Reply-To: <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 24 Oct 2018 15:34:45 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+N5Du=c-dfGd-_rLjE3NEeN+MXTsKjt2APA1U1xwwSag@mail.gmail.com>
Message-ID:
 <CAGXu5j+N5Du=c-dfGd-_rLjE3NEeN+MXTsKjt2APA1U1xwwSag@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_153500_826911_F8470CA8 
X-CRM114-Status: GOOD (  10.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Paul Moore <paul@paul-moore.com>, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, david.abdurachmanov@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, David Howells <dhowells@redhat.com>,
 Linux Audit <linux-audit@redhat.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024223445.JSFWyOS4xkma6r7ocR5NnEfzJ_NfMq5cOHGIoWcC61k@z>

On Wed, Oct 24, 2018 at 2:42 PM, Kees Cook <keescook@chromium.org> wrote:
> config HAVE_ARCH_SECCOMP_FILTER
>         bool
>         help
>           An arch should select this symbol if it provides all of these things:
>           - syscall_get_arch()
>           - syscall_get_arguments()
>           - syscall_rollback()
>           - syscall_set_return_value()
>           - SIGSYS siginfo_t support
>           - secure_computing is called from a ptrace_event()-safe context
>           - secure_computing return value is checked and a return value of -1
>             results in the system call being skipped immediately.
>           - seccomp syscall wired up

Oh, and I should add to this list, "passes
tools/testing/selftests/seccomp/seccomp_bpf test". :)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
