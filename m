Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952CAC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F7D4206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFYvTmJ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="cW+L2NFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F7D4206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvw7czpoiMaatFhGxmfPGKNNhJaLfF1PY/I7lIpwODk=; b=gFYvTmJ3LsBL2R
	8VGAt1TnKt8XcrAfJ9EpdDJHkICo1rycmiqmTBrtWQcyt2eKsNh2tC4M/HXzUutG5T96dappt/flq
	1pJzQd64V+zzA0sEVWcbFRX8gUHf9ZH6khxXIHbpf4xaTAfvKKptM3EfDB2wI/9wh4fZD0VEk/ff4
	R0NEVSTqoAnsjNguHMbpmYTwx8mABhFOgO+9boi7CKN/KzF2N+BfzwVF82Nwdvp4sxjt+K3zJwNVI
	f4HxBrFhvf0InaCFnTZMjkTWRr7pHa7tmuNjM7lhG57pRMYXgSFAlMgbn95RNv9zFuMLpf6KVIswx
	bNahAm1k78NoE5IgEZzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grKah-0003JP-SI; Wed, 06 Feb 2019 10:38:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grKaf-0003J2-4c
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 10:38:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id a62so1901766wmh.4
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 02:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyk0gxrAADp3Y1Rp9UakssvbomXy064HRVdKZJEi6AM=;
 b=cW+L2NFjxou8SJJ1RXO10je80Wu8/dnOUONg0MxFL/HKelW7+xTusdAmNWvimVbSoR
 8upurLAMh4Q5+mTfiW+5hZY7WAPN8MjYKk71IIEjEMZSGaGagLzypPSJE91JqTg0ZcmR
 azad9s+zP2ThR8xUhdV5t2RmLirPYdGffWwv3Sf13UjxfjhWcef9oN49jbWgWZtQvBP3
 EiAqiiIxreRqwsPM8LSRbGGS5Jzfn/a0mLAu56Linu5T3LHH9KzJ77Lu0qPtv9QoKaDs
 45ZCyC0AkrbwEoG+woK9JhDSNCeBMUIMjnrD/HE3OosajWeg0hgcYGBSsSbve3XaWw3/
 vfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyk0gxrAADp3Y1Rp9UakssvbomXy064HRVdKZJEi6AM=;
 b=gR61UnY1u3lYqJ8qGH3mM6Dpo1/af7ddjtLYcIe9W/c+968Qf7Nwj9/NEkrrQ3AJjQ
 fG3ZAe8l5qRedFVslSKvvUtCBifyLROfTGp25KRzsJC9JU/WANy+KiMK6dBR3pBjj2uq
 k8BMN+xOg0nfaEPxYoFG7quS2OM5lTl/Cw7xVndj/QNe0gu5N0LaZ6iBOhenxjHqb7nR
 Gt3vxxYyg6Ln4WxWnD0ENPY0d+sIQRZQaeV1XSink1+8GhykFEmUmiYKyUV7ei2GufwO
 fYHM1RZqi7PE09GeOzgwqS9eeyHsxze5TtUTx9U+Fjmbg7JmGnN4uhwLgrau/yC6Reum
 Mu8A==
X-Gm-Message-State: AHQUAuaNUwxrIzu2Y6Uz0GJmyVWs3LWv6uDaU4V/ilkHb2RjZiiqrXQ/
 4NNg7+dbVkz+dK1a+I5wlJVsTt38kDcB5dPZsZKV0Q==
X-Google-Smtp-Source: AHgI3IabGv9bsnokLWMzs67jZYgXhFXBuIyUJ+hc9o8dJftyAtQJyMLqZWLiEua6pf6Z/ULSTCKMCS2qXjvOAWOmhyk=
X-Received: by 2002:a1c:d082:: with SMTP id h124mr2442017wmg.21.1549449478743; 
 Wed, 06 Feb 2019 02:37:58 -0800 (PST)
MIME-Version: 1.0
References: <mvmsgx22r3u.fsf@suse.de>
 <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com>
 <mvmtvhh1dl2.fsf@suse.de>
 <CAAhSdy1OWwh86u1w=jtX-3SidWjZm46T-5giKtXD1LMcZSywQg@mail.gmail.com>
 <mvmftt11bdq.fsf@suse.de>
 <CAAhSdy33AFXrCQppswWzscy8TQh0Tjp1ixcjFcoB97v6vAwWxw@mail.gmail.com>
 <mvmbm3p1a1u.fsf@suse.de>
In-Reply-To: <mvmbm3p1a1u.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Feb 2019 16:07:47 +0530
Message-ID: <CAAhSdy3Dw=_dszr3css71zOfbu-i1adMwXxYS7115NO2e0JWqA@mail.gmail.com>
Subject: Re: Boot stuck at "smp: Bringing up secondary CPUs ..."
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_023801_224489_216A0ADE 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 6, 2019 at 4:03 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Feb 06 2019, Anup Patel <anup@brainfault.org> wrote:
>
> > On Wed, Feb 6, 2019 at 3:34 PM Andreas Schwab <schwab@suse.de> wrote:
> >>
> >> On Feb 06 2019, Anup Patel <anup@brainfault.org> wrote:
> >>
> >> > On Wed, Feb 6, 2019 at 2:47 PM Andreas Schwab <schwab@suse.de> wrote:
> >> >>
> >> >> On Feb 05 2019, Atish Patra <Atish.Patra@wdc.com> wrote:
> >> >>
> >> >> > Are you loading Linux from U-Boot and openSBI ?
> >> >>
> >> >> No.
> >> >
> >> > We requite Atish's SMP fixes to boot upstream kernel on Unleashed board.
> >>
> >> The same boot image has booted sucessfully before.  The problem with SMP
> >> bringup only started when I started experimenting with openSBI and
> >> U-Boot.  Coincidence?
> >
> > Lot of kernel bugs are hidden due to FDT fixups done by BBL at boot-time.
>
> Then why does it fail with BBL?

Not sure what case you referring with BBL.

Please review Atish's SMP fix patches.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
