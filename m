Return-Path: <SRS0=Tq7r=WZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC47C3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 01:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72668215EA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 01:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqZ2x8+Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N0Tiu7A4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72668215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qnmjnjD/ZWa6E32JLNKL8i+okcF3rkbKaaV/3EcOmg=; b=kqZ2x8+Zk7/b73
	nXZtJNpfpsXv0fNHhenGbM2nYWBdf1vASUy8YrsYI5gmRru1bmeP8+pW5fuNTSitbjTfxPgyFxUL7
	fZJga2/zvNU8nAoCSTLfRNFFfmVPRQEyt/zNy/TBnLKHzuq48Kh/HNjZ83mSH8bRZryNBiLDYBfZn
	hRv3wLz7gpUDlpcIwJUILv48iwlMzYq16ABE6Wzr8h3ZwURHTk5xHB1EaF55reTYpICwDroAMpQox
	qJTHgB2RAnKuMWfJdtQ1L6ngaY+Tyc/odlNJiTRBSVHSm3B6Rvwt1ypA/DYBymWoW9pIO1OmJSlWQ
	oSCDogLEBKBztZOyJBGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i39GV-0003To-5g; Thu, 29 Aug 2019 01:30:19 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i39GT-0003TP-6E
 for linux-riscv@lists.infradead.org; Thu, 29 Aug 2019 01:30:18 +0000
Received: by mail-pg1-x544.google.com with SMTP id x15so662123pgg.8
 for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2019 18:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=oNuMQ0k3tolgyGaRQrF7TXZFayppiTIHnhst6LSZzgM=;
 b=N0Tiu7A4E04tZ0bGKbShdzjcMamCLdZF8w9OOQK6PqJNfA15z95T1h2MEkAr1QGrkv
 MTmnaoNxMhluJ+2QIg5wgRlKZG4ebI1krbhI2gFwPGhzgjl3Mo9eYwmeXkS342XWdvW2
 6o8joBVW/w2HTRLZcmWXJgsyKzxaDVdpZopFc+IAFxfJItzbjS6MQxV8iMzvMh+wCbxD
 Jlu+YvTpNL5xNRiykc69s779w7U0EiJlNB8fL9OGeoCN3UhQ1qRDkxoOPgj2e9fdO+nP
 rUwqW2dh56+pi8vTJEXJED0sq/nTmn2tjeRp9FDE/GII0XdAAqqoM5RIQmupCWDxlq+V
 rHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=oNuMQ0k3tolgyGaRQrF7TXZFayppiTIHnhst6LSZzgM=;
 b=aJWmwjRVVQJDUzcJUDwn44Ui2SXSaZUX9+ryZAcqAtakb6IDHUC8hJdpk1AJA2o5ai
 OZlRGnRsd1kbzPoQOGGNbEGrlSW/a/LW/AE/wXoSUneX106j/lEqEkrrbfy2WihFAzVc
 pVMbdsoTxU6H6zeANyZeMd9RjCfNnbAjBBZe0zVewn4J2RfQ09XK5p8m+wk0Gd5I8KlQ
 84fkyz3VTcJpLn8wQkTJFhm1r/rnxr4ek04h1fVBrgVb5BllE0+PomBPH/aEI3Xvsdgf
 X0BgSJOKYsd5xHYpKxvpwi7kPeov1VZP5lj/4Sgz8J58TW5PkmeE5+hLSxv5vDgj6iyI
 Vpyw==
X-Gm-Message-State: APjAAAUZELX/Yb+fYtAqya4UDkQXYGCYubBSmZs3afIDcbUhWVMgXpYR
 MN8LapMqV8EHEFzmNAq3g3sYUA==
X-Google-Smtp-Source: APXvYqzneWTer11an0OtynaQ0NdmFFtoQFTgNrY29fSA6ajAUSOjqiO56Ptl9fWn/+Jpt6o1LcWHIg==
X-Received: by 2002:aa7:8602:: with SMTP id p2mr8123966pfn.138.1567042216270; 
 Wed, 28 Aug 2019 18:30:16 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y13sm669451pfm.164.2019.08.28.18.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 18:30:15 -0700 (PDT)
Date: Wed, 28 Aug 2019 18:30:14 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kees Cook <keescook@chromium.org>, Tycho Andersen <tycho@tycho.ws>
Subject: Re: [PATCH v2] riscv: add support for SECCOMP and SECCOMP_FILTER
In-Reply-To: <201908261043.08510F5E66@keescook>
Message-ID: <alpine.DEB.2.21.9999.1908281825240.13811@viisi.sifive.com>
References: <20190822205533.4877-1-david.abdurachmanov@sifive.com>
 <alpine.DEB.2.21.9999.1908231717550.25649@viisi.sifive.com>
 <20190826145756.GB4664@cisco>
 <CAEn-LTrtn01=fp6taBBG_QkfBtgiJyt6oUjZJOi6VN8OeXp6=g@mail.gmail.com>
 <201908261043.08510F5E66@keescook>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_183017_264150_CA8367FA 
X-CRM114-Status: GOOD (  14.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Alan Kao <alankao@andestech.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Yonghong Song <yhs@fb.com>,
 me@carlosedp.com, Albert Ou <aou@eecs.berkeley.edu>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Will Drewry <wad@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>, netdev@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Vincent Chen <vincentc@andestech.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Kees,

On Mon, 26 Aug 2019, Kees Cook wrote:

> On Mon, Aug 26, 2019 at 09:39:50AM -0700, David Abdurachmanov wrote:
> > I don't have the a build with SECCOMP for the board right now, so it
> > will have to wait. I just finished a new kernel (almost rc6) for Fedora,
> 
> FWIW, I don't think this should block landing the code: all the tests
> fail without seccomp support. ;) So this patch is an improvement!

Am sympathetic to this -- we did it with the hugetlb patches for RISC-V -- 
but it would be good to understand a little bit more about why the test 
fails before we merge it.

Once we merge the patch, it will probably reduce the motivation for others 
to either understand and fix the underlying problem with the RISC-V code 
-- or, if it truly is a flaky test, to drop (or fix) the test in the 
seccomp_bpf kselftests.

Thanks for helping to take a closer look at this,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
