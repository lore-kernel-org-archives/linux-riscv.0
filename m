Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E221C65C22
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 15:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2117C20657
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 15:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0QBzkQW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I+7bP+rH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2117C20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMTPqCMYssdZqUGWlhM5vgxDPX1IMTPsLDAeR2fDSVk=; b=u0QBzkQWtjJ44P
	h7rbMpeFSIjYpfkUuWnMcooIZ5hsQD7FH/6JGph5ycDKdS5+deT/4lLwIget+1ev0mL9ndO86jGF3
	HanoYF/IBvWXprgjwZSbOsqZqA10NN53AJLf1LGwoPRw2iVudABuO2sjX/j3C9pQttQG7CTCk9ZkO
	htVqRS/SqD5YV4izCkybfHDchT/7CfxHz1beAvIko80h66XG55gwx6rKFoUtdE9FliFKf30q57Ggd
	OdjZ3QMCu3L2mNY991jXjDEs2ermqYIkqpWiqTRp013VMKRHSud2ofeAzS0TGq8Si1ler3o0yTn3q
	E9C3s5hVUQ6O149sfzRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIbk6-0005vP-84; Fri, 02 Nov 2018 15:52:14 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIbk3-0005so-GJ
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 15:52:13 +0000
Received: by mail-yb1-xb43.google.com with SMTP id v92-v6so975198ybi.5
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Qv7IoKjig1gc3J/CUecwIgnlYcDydbRPK8/Q8reJzlI=;
 b=I+7bP+rHeE85DBmu6lxQ5yKDx+DptEnK9WuAdHJufCtjt77t0qTemmKCba9kll7Srj
 UqZz2Dy4V6WpjNZVN2hV5FfGiUmBC/+BZA7RVp22aCBnW9zQWR2eMsMH4kNOv7EVmnwI
 QC2Ba3fKhu7AHRKZdL77+iGgt2t3Au1IitAqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Qv7IoKjig1gc3J/CUecwIgnlYcDydbRPK8/Q8reJzlI=;
 b=l5GUtFO98m4s5JfPX0e5wQu/Mxrc7LoNXGRN7768Ksf2wr3v+RLf2gyfBynoUWjvmV
 hbLcqQRF/MFXrdCqoqvNo7QQHyDaxaSqYpmCXlek+IrzjHWhAOLJVmWO8TrybX9m7OXZ
 K3Ovl3SOLcbmLGudh2DkdQqjO1hSwnTDOWNIAhUi5v4sjWpn1iJyxiwzRmtT6YLW4wvs
 tjmD/j9EpY3AjEVTa70+c8u814GT4YHY35i2DEJERm0YU78I7hqh4ZGzAZzwxA0TD9Vj
 LVoXzghVbnhOWifGeJDmzUWZ5KXLYPoIOZLEh1F/scW8HSum9IhDeDUMfnPwV3x+IOBP
 d82g==
X-Gm-Message-State: AGRZ1gIxX8BLmcFRnrnU2A9h10GRDk/XSo8Ja0OTsNErr7qRJMlqXeID
 D0h5kvM2b+XU0OOwhRgGCkQeTUBU5cU=
X-Google-Smtp-Source: AJdET5fxJc0YJewAOShpTRSxVAPM13uXq+zAZc1MGEuojdLEnsWl+os80JJA+Fi2JOo+Uec20jpqIA==
X-Received: by 2002:a25:2984:: with SMTP id
 p126-v6mr12053428ybp.381.1541173919434; 
 Fri, 02 Nov 2018 08:51:59 -0700 (PDT)
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com.
 [209.85.161.44])
 by smtp.gmail.com with ESMTPSA id h186-v6sm11579867ywe.103.2018.11.02.08.51.57
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Nov 2018 08:51:57 -0700 (PDT)
Received: by mail-yw1-f44.google.com with SMTP id v1-v6so941079ywv.6
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 08:51:57 -0700 (PDT)
X-Received: by 2002:a0d:e984:: with SMTP id
 s126-v6mr10100710ywe.47.1541173916399; 
 Fri, 02 Nov 2018 08:51:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP;
 Fri, 2 Nov 2018 08:51:55 -0700 (PDT)
In-Reply-To: <CAEn-LTr6eTgy4HsxT2y_LhXXtQczJNZmQJdY-em-maDOcFL9fA@mail.gmail.com>
References: <CAEn-LTonSqSG8GtgVmwt7ToJ2NZKsGEaWndmA0Q7Lzm316CFbA@mail.gmail.com>
 <mhng-71c7a4db-432a-4f97-86cd-1fe16091a6c8@palmer-si-x1c4>
 <CAEn-LTr6eTgy4HsxT2y_LhXXtQczJNZmQJdY-em-maDOcFL9fA@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 2 Nov 2018 08:51:55 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLhDxRHYe2kZ3wDJThsbkDMsZHt3ufM7YG_L0y0fU+brw@mail.gmail.com>
Message-ID:
 <CAGXu5jLhDxRHYe2kZ3wDJThsbkDMsZHt3ufM7YG_L0y0fU+brw@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_085211_545016_9B5AF871 
X-CRM114-Status: GOOD (  25.50  )
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
 Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, David Howells <dhowells@redhat.com>,
 Linux Audit <linux-audit@redhat.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102155155.JNuO5Lky1fWrohmLT9FZLh-toWMhKx5oSzAFDlgeNZI@z>

On Fri, Nov 2, 2018 at 6:32 AM, David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Mon, Oct 29, 2018 at 9:27 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Sun, 28 Oct 2018 04:07:55 PDT (-0700), david.abdurachmanov@gmail.com wrote:
>> > On Thu, Oct 25, 2018 at 10:36 PM Paul Moore <paul@paul-moore.com> wrote:
>> >>
>> >> On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
>> >> <david.abdurachmanov@gmail.com> wrote:
>> >> > On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
>> >>
>> >> ...
>> >>
>> >> > Palmer,
>> >> >
>> >> > Half of the patch seems to touch audit parts. I started working on audit
>> >> > support this morning, and I can boot Fedora with audit traces.
>> >> >
>> >> > [root@fedora-riscv ~]# dmesg | grep audit
>> >> > [    0.312000] audit: initializing netlink subsys (disabled)
>> >> > [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
>> >> > audit_enabled=0 res=1
>> >> > [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
>> >> > auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
>> >> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>> >> > terminal=? res=success'
>> >> > [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
>> >> > auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
>> >> > exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
>> >> > res=success'
>> >> > [..]
>> >> >
>> >> > I am still working on audit user-space support for better testing.
>> >> >
>> >> > I suggest we first implement audit and then seccomp.
>> >>
>> >> FYI, while small and far from comprehensive, we do have a test suite
>> >> we use for basic validation of the audit kernel bits which may be
>> >> helpful while you're working on the audit enablement:
>> >>
>> >> * https://github.com/linux-audit/audit-testsuite
>> >
>> > Currently I checked the following to work:
>> > - /proc/self/loginuid (required by DNF [package manager])
>> > - auditctl (checked several different example rules from internet)
>> > - aulast
>> > - aulastlog
>> > - ausearch
>> > - ausyscall
>> > - aureport
>> > - autrace (compared some syscalls to strace: order and
>> >   return value/input arguments seems to be correct)
>> >
>> > I checked audit-testsuite yesterday and it seems to be only for
>> > x86-64 / x86-32. After adjusting it (MODE, syscalls) I am at:
>> >
>> > Failed 4/14 test programs. 19/88 subtests failed.
>> >
>> > I don't plan to look further in the failure, e.g.:
>> > - syscall_socketcall: that's an old stuff and not relevant to
>> >   new arches
>> > - syscall_module: Fedora kernel currently is not compiled
>> >   with kernel loadable module support
>> > - filter_exclude: two tests fail because id -Z doesn't print
>> >   any categories, but "semanage login -l" output is identical
>> >   between x86_64 and riscv64
>> > - netfilter_pkt: don't have CONFIG_IP_NF_MANGLE enabled
>> >
>> > Fedora kernel currently has minimal CONFIG_* options
>> > and is built without loadable module support.
>> >
>> > I will send the patches for review soon.
>>
>> Thanks!
>
> I fixed the last issue I see with SECCOMP this morning.

Can you CC me on the series? I'd love to take a look.

> I also have patch on top of libseccomp-2.3.3.

Nice! If you toss it up on github I can review that too. :)

-Kees

>
> Testsuite results for SIM:
>
> Regression Test Summary
>  tests run: 4434
>  tests skipped: 88
>  tests passed: 4434
>  tests failed: 0
>  tests errored: 0
>
> Testsuite results for LIVE:
>
> Regression Test Summary
>  tests run: 6
>  tests skipped: 0
>  tests passed: 6
>  tests failed: 0
>  tests errored: 0
>
> Then tested a couple examples manually w/ and w/o BPF and it
> performed the same as on x86_64 (also checked exit codes &
> strace output).
>
> Upstream libseccomp has now more tests. Once I rebase & re-test
> with master of libseccomp, I will send both.
>
> david



-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
