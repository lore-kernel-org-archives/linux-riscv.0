Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CAFC65C22
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 13:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124B62081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 13:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDr07BAR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihJToZ8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 124B62081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9PQ3I1K47ItWEaHxEfKRq3xcQm8PIg7sfhe9Uv9fQ4=; b=KDr07BARmP0OPw
	FreKDPyY/NWeFCoQXGh0OOp6mE76G7RBwY2sqQTw7/2RbOmKD08A+DqkhAy+7fjfbPAsq/oDP0JOl
	pMW0HjcIYwfs6PUVeBT9x628r9qCzPtuRJiCf/4oOIgsWosBaAV5yAqcdY00w4xZ79Z7T/X7P1uX1
	FATYJf5cYx3MIRm/Rh1Hete8/hjXI90QHSDt5FecQ3vKmQW//n3cIbsVVPj85mM4voBpJ/nMxDYBK
	3+plp4kJAJSgmVKUe1KkRS/3WVZfgHiHDyJabCa3ro9f+GIRJagVYamohhaqWYzICwG6BBonw7jTO
	NfYSwYT2lJSdcHU3o+Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIZZZ-0004pC-CL; Fri, 02 Nov 2018 13:33:13 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIZZW-0004o5-7G
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 13:33:12 +0000
Received: by mail-ot1-x344.google.com with SMTP id z33so1561296otz.11
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 06:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iiBj4MNKBy7fOpxwwS5hRmTxjV00jauWji3Oo4eSyFw=;
 b=ihJToZ8+XnHw33trEUWuPenyaV2K6vcx/9Lbd6fLp2bni26va5F+Cr+6dkeR9yBh/H
 hnTpsxM/Y6aOM8uVVvMAZxioV15M6kVFVb3NsCXfACjdb+u5WM5XpOwpKAHJIQV4B/hZ
 ohR0bxRmYGXpzvjUAAJGfYlGuoTUV+hjtK03muq8WN1c9m6CBRTs/JlYT2BqWmRtmaTA
 sobPGS8ValyGPn4+cFB34mrYnaB2aYkg4jsbJLzD2/QGYZbpkeD2S3Yz3Ot2RrnF66A/
 58TGOK/xGEQdEMa95LNC3Yim3rEdXAf7tKa+4Ufhb4Odffw11Hrv/hLy4ASR7RToERLi
 4E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iiBj4MNKBy7fOpxwwS5hRmTxjV00jauWji3Oo4eSyFw=;
 b=PvSgGuzLwBnNOfLQWzl05pguDdJoXkhpAAVuspdo0SwkJCGdmk06strO5mtPdXqRlY
 3QKuefWR1fcKDc9Bq101y4BO58Lionzm7ZR55xpNnXbjFCSrNS9Gkov2D1ljLuHuuWrZ
 PHwoQM9l06SmyN8Ez71yuBiI+z0DModsIB+fSr+4Q2IOC0XT6j2WwRHO3ZwPc7A4s357
 freXLGikp177rNBu5lce5nvMKuvKXvPtdW1qCdNfokGvfGMi4PaC4WoDnTji9kYk/W+E
 Veg1wYYcn88d5D4wZKpzUkcE0fuXtgInvCSsdHVYlghxf1bWK5ffn0ScsrxC+GGVR+7B
 5UFw==
X-Gm-Message-State: AGRZ1gJ2yuCDTS6Qw2Zv1EKVmviq6JA4/+Z3W5lUtwe5FVNdSVCul/tP
 6glf9boGmCKzd1lp8MC8Am3ca9Sk0/iwq5xcvzc=
X-Google-Smtp-Source: AJdET5ftJ9HhlISux4LD7TcI//eYvYqZqLhxk+peFA6/YoJdUYMs10zrDR+nanjEYpGqt7Gt9imUtCyyLXj3CYEtNNs=
X-Received: by 2002:a9d:2fac:: with SMTP id r41mr6741407otb.169.1541165578824; 
 Fri, 02 Nov 2018 06:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAEn-LTonSqSG8GtgVmwt7ToJ2NZKsGEaWndmA0Q7Lzm316CFbA@mail.gmail.com>
 <mhng-71c7a4db-432a-4f97-86cd-1fe16091a6c8@palmer-si-x1c4>
In-Reply-To: <mhng-71c7a4db-432a-4f97-86cd-1fe16091a6c8@palmer-si-x1c4>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 2 Nov 2018 14:32:47 +0100
Message-ID:
 <CAEn-LTr6eTgy4HsxT2y_LhXXtQczJNZmQJdY-em-maDOcFL9fA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_063310_264965_1A328745 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, aou@eecs.berkeley.edu,
 Will Drewry <wad@chromium.org>, Paul Moore <paul@paul-moore.com>,
 gregkh@linuxfoundation.org, wesley@sifive.com, linux-kernel@vger.kernel.org,
 eparis@redhat.com, luto@amacapital.net, dhowells@redhat.com,
 linux-audit@redhat.com, Philippe Ombredanne <pombredanne@nexb.com>,
 linux-riscv@lists.infradead.org, tglx@linutronix.de,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102133247.3Y3twdZHqHvQ_XzXh0XW23qh9I2ZN7BQrJvOzWUHOmQ@z>

On Mon, Oct 29, 2018 at 9:27 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sun, 28 Oct 2018 04:07:55 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> > On Thu, Oct 25, 2018 at 10:36 PM Paul Moore <paul@paul-moore.com> wrote:
> >>
> >> On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
> >> <david.abdurachmanov@gmail.com> wrote:
> >> > On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
> >>
> >> ...
> >>
> >> > Palmer,
> >> >
> >> > Half of the patch seems to touch audit parts. I started working on audit
> >> > support this morning, and I can boot Fedora with audit traces.
> >> >
> >> > [root@fedora-riscv ~]# dmesg | grep audit
> >> > [    0.312000] audit: initializing netlink subsys (disabled)
> >> > [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
> >> > audit_enabled=0 res=1
> >> > [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
> >> > auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
> >> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> >> > terminal=? res=success'
> >> > [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
> >> > auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
> >> > exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> >> > res=success'
> >> > [..]
> >> >
> >> > I am still working on audit user-space support for better testing.
> >> >
> >> > I suggest we first implement audit and then seccomp.
> >>
> >> FYI, while small and far from comprehensive, we do have a test suite
> >> we use for basic validation of the audit kernel bits which may be
> >> helpful while you're working on the audit enablement:
> >>
> >> * https://github.com/linux-audit/audit-testsuite
> >
> > Currently I checked the following to work:
> > - /proc/self/loginuid (required by DNF [package manager])
> > - auditctl (checked several different example rules from internet)
> > - aulast
> > - aulastlog
> > - ausearch
> > - ausyscall
> > - aureport
> > - autrace (compared some syscalls to strace: order and
> >   return value/input arguments seems to be correct)
> >
> > I checked audit-testsuite yesterday and it seems to be only for
> > x86-64 / x86-32. After adjusting it (MODE, syscalls) I am at:
> >
> > Failed 4/14 test programs. 19/88 subtests failed.
> >
> > I don't plan to look further in the failure, e.g.:
> > - syscall_socketcall: that's an old stuff and not relevant to
> >   new arches
> > - syscall_module: Fedora kernel currently is not compiled
> >   with kernel loadable module support
> > - filter_exclude: two tests fail because id -Z doesn't print
> >   any categories, but "semanage login -l" output is identical
> >   between x86_64 and riscv64
> > - netfilter_pkt: don't have CONFIG_IP_NF_MANGLE enabled
> >
> > Fedora kernel currently has minimal CONFIG_* options
> > and is built without loadable module support.
> >
> > I will send the patches for review soon.
>
> Thanks!

I fixed the last issue I see with SECCOMP this morning.
I also have patch on top of libseccomp-2.3.3.

Testsuite results for SIM:

Regression Test Summary
 tests run: 4434
 tests skipped: 88
 tests passed: 4434
 tests failed: 0
 tests errored: 0

Testsuite results for LIVE:

Regression Test Summary
 tests run: 6
 tests skipped: 0
 tests passed: 6
 tests failed: 0
 tests errored: 0

Then tested a couple examples manually w/ and w/o BPF and it
performed the same as on x86_64 (also checked exit codes &
strace output).

Upstream libseccomp has now more tests. Once I rebase & re-test
with master of libseccomp, I will send both.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
