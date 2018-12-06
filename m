Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0730DC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 18:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF73820892
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 18:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRa6NYvl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDOT6h9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF73820892
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiEw78CVNa17dPAo8CZxRVm0XlwfaUr5yRzw4fXOTFg=; b=PRa6NYvlQY0UNw
	0UOVD5aZm1g7ituqTyXRhz7t9Qza2f92gto6kcsD5ITw8KHaCNVXxa76dZDofvPok8uXkAUsFPBJA
	qZBAtTMCelY+dkY6gloFzXas/kb22KGleLJlce6EA2kWy+ABfdKeddUHgVItU07tbrrSMqNTzeRrC
	6+Mp1TD0d6x8IJybcvfLS7Ea/dwSdyqZsCFhKyyR6ARot+IPxHP17//tzWxkq8z2vzteDaHwOGswV
	DQTVU9AmGe+OAu6It4qrn62Q+7sLQTQouKRKhR9BgqF/7Dfu/5XXV+hkO2iUmC3B9RZI9nJLMoUEI
	bo8/9CXuc+1pQdSLGVKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUySN-0000oB-Pv; Thu, 06 Dec 2018 18:33:03 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUySL-0000jS-2Y
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 18:33:02 +0000
Received: by mail-yb1-xb44.google.com with SMTP id f6-v6so1191123ybg.12
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mI6l0Fnf9aPw9X8+3mFJjLs23r9ZCBc2ngt0khlo8JE=;
 b=dDOT6h9tHkebE5jadmWnc0RjGj3857W5dvSm+Fe6EXUZhPL4uVuPP+DRTvMJHclw+/
 x+w4pYShmZXFcaqmgsy5QFS3M4RlEG5apFSesXyflKv8IVr+cmezmZQKvsYCFpDpnwjn
 VLjQye+Ilk4ylB5EpgmgX2lJs0PkAcQSxP/vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mI6l0Fnf9aPw9X8+3mFJjLs23r9ZCBc2ngt0khlo8JE=;
 b=P4nVY7F2MUR55Zej3xhYok+saJl/5MDe9+2BoeY9GkzkOWlYh4LeoTlR2V+kZlu6bP
 BgRGP6Mnuh8Jg4uByXPAfXqC3/1D3CmRD1/jcybWtxu6xg/AdK5HoKw44S4m6AHo2YzQ
 /eGi7X6wlUsYpa8g907G3KnlR6icUgHEh9AVa9e2b0PDx4jMbeABpgX+54WYNqTuRCHy
 wUiRfq4BSQ4rOpUvBob3TCLgXDgGeZeJAgxFsC+RG524Qfa1rC6bVeKoLUrCR00fwjpu
 55W5xFVJj90seJvbV544IIFVT+/oVIB0jSFL09wHXnFSaUfp80PJKtoQIVnbAluIghHv
 Tx+Q==
X-Gm-Message-State: AA+aEWY0v1mwM9/c4YHH/D5xks2Ky8S3BkCsB1tAO5opqFLnYvp0xC4b
 +1UExiJyCQyCu4qfVTK7do8+0ol/IlM=
X-Google-Smtp-Source: AFSGD/VGHI2fbKSezr2m0DhsBCTgHY+ZefI0WkwtgM9lInAbFk7EUuNUxSa5TN+rMFdEamNgFO/L6g==
X-Received: by 2002:a25:ae22:: with SMTP id a34mr14507734ybj.301.1544121169257; 
 Thu, 06 Dec 2018 10:32:49 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id x1sm338207ywf.94.2018.12.06.10.32.48
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 10:32:48 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id s15so1217990ybk.6
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 10:32:48 -0800 (PST)
X-Received: by 2002:a25:2347:: with SMTP id j68mr20346207ybj.137.1544121167686; 
 Thu, 06 Dec 2018 10:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
 <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
 <CAEn-LTrhGAX2+V5r1kdBQw33M4Sre8P5e7wfRcwFruT5Y-WeXw@mail.gmail.com>
In-Reply-To: <CAEn-LTrhGAX2+V5r1kdBQw33M4Sre8P5e7wfRcwFruT5Y-WeXw@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 6 Dec 2018 10:32:36 -0800
X-Gmail-Original-Message-ID: <CAGXu5jJAb0QMxvAjS+BxVOx02bHDtxFdu1V1kRjOz8K5xxTSqA@mail.gmail.com>
Message-ID: <CAGXu5jJAb0QMxvAjS+BxVOx02bHDtxFdu1V1kRjOz8K5xxTSqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_103301_221555_0D4DB9CC 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, green.hu@gmail.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 10:26 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Thu, Dec 6, 2018 at 5:52 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
> > <david.abdurachmanov@gmail.com> wrote:
> > > The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).
> >
> > Can you add support to tools/testing/selftests/seccomp/seccomp_bpf.c
> > as well? That selftest finds a lot of weird corner-cases...
>
> I hate it locally and will include in v2.

I hate it too. ;) But seriously (reading through the "have" typo),
that's awesome. Thanks!

> The results see fine (tested in QEMU).

Great!

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
