Return-Path: <SRS0=e+QJ=NI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448D8ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Oct 2018 11:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082EA20843
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Oct 2018 11:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOcdXfXm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ei4OmGbW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 082EA20843
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iM2WzjvneCZEVIapeSFIOzZ1BbYJkasTa0TdFQtLQo=; b=XOcdXfXmG8B4OD
	/eI59YZsfS65vZ6Ta6DCq6jFU0RH2rNuxMBX8SnJtSuLx39yGQ9TGbaSSxS+qc40TEx9IhDjzo5uQ
	5bmPxAZcyIScyswVYeMb9yz0iaEH3xui+eAdC+o8g+BiIF9TyguARAKbUjdafMd9MJfiS0TsbdWao
	YV+1G8egZ0PfycANFnDHnaPsdhZx+QFymJVQ4O6VCnl1vR46P1pK68d5xvvPaJC9FftIxbzMtJAoy
	tVrHAhnK2hia6MLHlrjBp2qBrelPNhzwYTL9fXKcwpipPz0t9bMRVJSYTFZdZ5lhnr0xPILHkieLW
	wRABGAgtL2wJaFtbZCng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGive-0003zU-OD; Sun, 28 Oct 2018 11:08:22 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGiva-0003yO-Am
 for linux-riscv@lists.infradead.org; Sun, 28 Oct 2018 11:08:20 +0000
Received: by mail-ot1-x343.google.com with SMTP id l1so4978604otj.5
 for <linux-riscv@lists.infradead.org>; Sun, 28 Oct 2018 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zoBdfcRiaVEHFB5Jm23iN91BJyij07w+KRhsgAhhdUQ=;
 b=Ei4OmGbW31h7xATkmdrworvdjvV/DwRSl0oIqEHDP1zFqaAZEPxewkv2rdhgoeq+Wv
 Kq+JOMNj+MhzQk/emORX3aMVsyYNm2EL5Iq35bXAxgqFfyXVqq8+jyHmQ0i/IdWjHZQY
 cQnaNmJ24l99uuIRKjiesvQ8/RXxPJrWfaIsarM/1xaPkhNdhhp+kuVdAEEKdRovxcfs
 XrWdwx/sWFvTdA/XdPa1paE4jbxjmkjdPwwWWApsxDZQ6bJeJ7YsCu8kh+JXm/m1Erlq
 2xiXOXn95NJcSsLwJb/GOtkD//lpQqu1w6CUsAyY65orM2M0vBc0emQH9knUuZKW6H0b
 ZZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zoBdfcRiaVEHFB5Jm23iN91BJyij07w+KRhsgAhhdUQ=;
 b=WIUPbV7gZzp11GM8PUIGLC4NqAoMs6X96oo7+luWNgRgOn69su7k/2AAkopVFldT+y
 26sT9ToRu4jWiPtWoGH1KIQLim+3B9nMnBx3KDAXGrAlB9koSqh0zBwf36yBvdt4f+gw
 iR5iKephySc3djxq4SiF7cf7apLldPyvhgulW6lk3tCHAjt9XWns+S++ryPnY6c/hv35
 z01yH1kBrPubu/ddYgM/Fywa3XTtJvfHHEZtt7RQGu32Suw6ZeASi2uxWyp93Nwx42cS
 iKJSSfBFJsFjBW+aQkX6u70c5wWXkDA9ZiLrHNo9y0g8ctxQ5VxPsJlg+wZPIzr/YbPo
 u8tA==
X-Gm-Message-State: AGRZ1gIILwEY6YgIpynFJLTTIHnmA9recU5UJSMdTYl6V34dCW9YHTY6
 PmnhbCMtxgMAk+80ggyf2B9yx88w20MbGhG3fYw=
X-Google-Smtp-Source: AJdET5ffKgyz0yIxiTz/OMvvS73F9UsXyRaFJvXNcNcmrYDTh+Au0hCM7GeB6H3R4oKuACSJ2TcUkEcb1pjJlreimKE=
X-Received: by 2002:a9d:5910:: with SMTP id t16mr5732504oth.99.1540724886617; 
 Sun, 28 Oct 2018 04:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
 <CAHC9VhT015tz4qZZ=vM6FowsUXLv-RYeBrH4C8d6jvg=XHumHA@mail.gmail.com>
In-Reply-To: <CAHC9VhT015tz4qZZ=vM6FowsUXLv-RYeBrH4C8d6jvg=XHumHA@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sun, 28 Oct 2018 12:07:55 +0100
Message-ID:
 <CAEn-LTonSqSG8GtgVmwt7ToJ2NZKsGEaWndmA0Q7Lzm316CFbA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: Paul Moore <paul@paul-moore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181028_040818_374825_ED0E8311 
X-CRM114-Status: GOOD (  15.28  )
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
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 gregkh@linuxfoundation.org, wesley@sifive.com,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 eparis@redhat.com, luto@amacapital.net, dhowells@redhat.com,
 linux-audit@redhat.com, Philippe Ombredanne <pombredanne@nexb.com>,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181028110755.OcLRJfYQYHlzVLRrQOhyaQjm2vmqgg_l9_i4DGjtipg@z>

On Thu, Oct 25, 2018 at 10:36 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> ...
>
> > Palmer,
> >
> > Half of the patch seems to touch audit parts. I started working on audit
> > support this morning, and I can boot Fedora with audit traces.
> >
> > [root@fedora-riscv ~]# dmesg | grep audit
> > [    0.312000] audit: initializing netlink subsys (disabled)
> > [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
> > audit_enabled=0 res=1
> > [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
> > auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> > terminal=? res=success'
> > [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
> > auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
> > exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> > res=success'
> > [..]
> >
> > I am still working on audit user-space support for better testing.
> >
> > I suggest we first implement audit and then seccomp.
>
> FYI, while small and far from comprehensive, we do have a test suite
> we use for basic validation of the audit kernel bits which may be
> helpful while you're working on the audit enablement:
>
> * https://github.com/linux-audit/audit-testsuite

Currently I checked the following to work:
- /proc/self/loginuid (required by DNF [package manager])
- auditctl (checked several different example rules from internet)
- aulast
- aulastlog
- ausearch
- ausyscall
- aureport
- autrace (compared some syscalls to strace: order and
  return value/input arguments seems to be correct)

I checked audit-testsuite yesterday and it seems to be only for
x86-64 / x86-32. After adjusting it (MODE, syscalls) I am at:

Failed 4/14 test programs. 19/88 subtests failed.

I don't plan to look further in the failure, e.g.:
- syscall_socketcall: that's an old stuff and not relevant to
  new arches
- syscall_module: Fedora kernel currently is not compiled
  with kernel loadable module support
- filter_exclude: two tests fail because id -Z doesn't print
  any categories, but "semanage login -l" output is identical
  between x86_64 and riscv64
- netfilter_pkt: don't have CONFIG_IP_NF_MANGLE enabled

Fedora kernel currently has minimal CONFIG_* options
and is built without loadable module support.

I will send the patches for review soon.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
