Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923C8C2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 20:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627612082D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 20:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pn07wVxc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lvqRDg+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627612082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=syKU2kTqBCF2BMc1e/eT0NDgitv98/yT0Kh2pKV1NbM=; b=Pn07wVxc4JJN4V/CUWKgv3n53
	YMBpJW0iZEmXfk0VZW8hiWn80vD5Bx1NQGXihrIIri3NUlduy3/DKw+0mBbb6y9necXrraR4NKrFb
	zFupZ7/p4qngVcgXykkcVC+3X8dkT2PrrP7wW5SSAHy2WRpmNyUq4eJjzyh2Gyz14jUJXwoJLDTcZ
	uo/rXn5cOKX9Z0FWKr189Rm5COJBPsvkIOLgEcLfRd+QnvagkyFTmI9v3e0LISNquOjU7BUqTR9qY
	Taer4q5M81OwbQlMAIiznV0YZf4L9YWn/4CkINswyP3UhFuO/aiowTbEfXikGH3k4Z52K4XFA2yQE
	XEtFDhCDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHE8x-0001Ki-7b; Mon, 29 Oct 2018 20:28:11 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHE8t-0001JV-QZ
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 20:28:09 +0000
Received: by mail-pf1-x442.google.com with SMTP id f26-v6so4594288pfn.9
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LY6lAqNcxExcV8lgaM2ag9Fc+YtefJStleIDC6qqA4E=;
 b=lvqRDg+4iSlL4MZl8ndBGJP+QSX5XmYJq5VakzPcAbooaiEnekl/rfkZSYbgiQH9KL
 fM6TDGu5qwBUyD+VCbwbPosFZYQySGZmkN6gRyukuEbCm6zRvLbQvbhyaVPIpN6H7n6w
 ixwhKDoW/3X3C5a7bI18UmMqjneNdrvAVLCR1NEDeoZ8KXZjVP1Y5ZD6RBpumSXaHRy8
 czLu5lyFuBeMgqMHTu1MN2FDGIFz0hN7O3F1xI6eyVB7jE7SsIp5feX8llCEdnWwskrw
 aco8ZmLcR2XrzhJ8QLYYXyRdcU5Th0+a/MjtQ8R37SpmNh/QMFgmR8xl71O6G6c0YoCv
 ZUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LY6lAqNcxExcV8lgaM2ag9Fc+YtefJStleIDC6qqA4E=;
 b=HDxnnUInCIcZVsJZwFaCXpSbAT1Z+9x8BLKyxo4KOg09EfUXgikVbg8R/lk0LpCzVb
 eZPjyREGU7IQBk0choa8TydbUgfxvjRhXEI4J3kjI8pcmF/Bav0qQ2gSZ/eiRGzMBe87
 MNwqcOLLnVzgKeM6heOCs/0Cj8WNusfeMfGsowQdyh8/NAcDH8DNoNBIem52HHJO3d2a
 hkmILdzpG8TNvmAqtoiL6Phr/eCxwcuwQwPDfy+wPL1OcnjOSoZLNCg3ZnYcrwgdqzlu
 ftZvmtoexIhkttMzZqDJqNmWK3DOJb664vRGctEqKjHV0o8IVkmOwQOuC1GlbnvUGXnh
 NBJA==
X-Gm-Message-State: AGRZ1gKYW5PeUP9peJRi8oAJl5Ab/RHaV/+flgRmzQ01R+rh1cf1aK/3
 nEhFqhe+ueKOQHSZAnOa4tdCvg==
X-Google-Smtp-Source: AJdET5fs5W4DvrTb2ce1Wspf37l962LiK9MI87zj08O7FgqxeY1EvFPp/YiF1Fi0Z18HtYJPdgCZFQ==
X-Received: by 2002:a65:594b:: with SMTP id
 g11-v6mr13109817pgu.229.1540844876300; 
 Mon, 29 Oct 2018 13:27:56 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k86-v6sm37831175pfb.167.2018.10.29.13.27.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Oct 2018 13:27:55 -0700 (PDT)
Date: Mon, 29 Oct 2018 13:27:55 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Oct 2018 13:12:12 PDT (-0700)
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAEn-LTonSqSG8GtgVmwt7ToJ2NZKsGEaWndmA0Q7Lzm316CFbA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-71c7a4db-432a-4f97-86cd-1fe16091a6c8@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_132807_862705_68CBFF03 
X-CRM114-Status: GOOD (  20.28  )
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 paul@paul-moore.com, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, linux-kernel@vger.kernel.org,
 eparis@redhat.com, luto@amacapital.net, dhowells@redhat.com,
 linux-audit@redhat.com, pombredanne@nexb.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, keescook@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029202755.vzHupNX49MOPkpKuwCGImi-RfJEGTDIZYduGOhxyhPk@z>

On Sun, 28 Oct 2018 04:07:55 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> On Thu, Oct 25, 2018 at 10:36 PM Paul Moore <paul@paul-moore.com> wrote:
>>
>> On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
>> <david.abdurachmanov@gmail.com> wrote:
>> > On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
>>
>> ...
>>
>> > Palmer,
>> >
>> > Half of the patch seems to touch audit parts. I started working on audit
>> > support this morning, and I can boot Fedora with audit traces.
>> >
>> > [root@fedora-riscv ~]# dmesg | grep audit
>> > [    0.312000] audit: initializing netlink subsys (disabled)
>> > [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
>> > audit_enabled=0 res=1
>> > [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
>> > auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
>> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>> > terminal=? res=success'
>> > [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
>> > auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
>> > exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
>> > res=success'
>> > [..]
>> >
>> > I am still working on audit user-space support for better testing.
>> >
>> > I suggest we first implement audit and then seccomp.
>>
>> FYI, while small and far from comprehensive, we do have a test suite
>> we use for basic validation of the audit kernel bits which may be
>> helpful while you're working on the audit enablement:
>>
>> * https://github.com/linux-audit/audit-testsuite
>
> Currently I checked the following to work:
> - /proc/self/loginuid (required by DNF [package manager])
> - auditctl (checked several different example rules from internet)
> - aulast
> - aulastlog
> - ausearch
> - ausyscall
> - aureport
> - autrace (compared some syscalls to strace: order and
>   return value/input arguments seems to be correct)
>
> I checked audit-testsuite yesterday and it seems to be only for
> x86-64 / x86-32. After adjusting it (MODE, syscalls) I am at:
>
> Failed 4/14 test programs. 19/88 subtests failed.
>
> I don't plan to look further in the failure, e.g.:
> - syscall_socketcall: that's an old stuff and not relevant to
>   new arches
> - syscall_module: Fedora kernel currently is not compiled
>   with kernel loadable module support
> - filter_exclude: two tests fail because id -Z doesn't print
>   any categories, but "semanage login -l" output is identical
>   between x86_64 and riscv64
> - netfilter_pkt: don't have CONFIG_IP_NF_MANGLE enabled
>
> Fedora kernel currently has minimal CONFIG_* options
> and is built without loadable module support.
>
> I will send the patches for review soon.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
