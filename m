Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F84BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 06:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34D121582
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 06:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aIqvkrSK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHSowSuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34D121582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+rBgjZTxsE5Z52iszpgGFmKPDkO5rtNWEy6dmZPmbo=; b=aIqvkrSKW2kKLM
	AMJPT2he7STCx3DOsj4bw7TwX1k87hj7H9a1mz4KVPvAc+PUe8OimO+xuRJBfEDyjpxmJCp6yzDz1
	gSLKK8ypdAyFTXQW2TT7Ufxjszht/k5A71z9QL3Fs7ufkNGhm0ZkBDTouGvVAfCXtE6q5zWM6voz3
	IQLBkPx8z4e0SZRx5KBDDYlFXmrEF8vGyl6mRHht3q1GcksqhP1EtXvfo1923V9WhwkOBzbXuk/fG
	7p784B3Q7dv/+rxnTapp7dOoByquJ6tIwGKa2pUUZXybjhU4ioSenyd1PWUNoVyQ8uPVgjusafAIW
	qxkArYEBJPdlUsM0JTWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM5jD-0000AZ-05; Mon, 12 Nov 2018 06:29:43 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM5j9-00009c-HW
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 06:29:41 +0000
Received: by mail-oi1-x243.google.com with SMTP id x63-v6so6265931oix.9
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 22:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=en+M8qwLLTVyz4mNnIV9oXGc3BXJGTwM/2EcYJ81ZKQ=;
 b=kHSowSuom4FqPNxM1HfDTZTYlPyh+HPk405uNCGTaPvRgmqaWI+4yZCq2A69DhzPA2
 fYt6KU/4SpVWiGg0ZALkO/NG/ZBJrMe54lz8Dbzsfy3dgOEJXWDXx5pY5ZE0YDGgz1dW
 ZeB2xaMfIMYER9/QFjPJVsSz0jgaTPP+Q/ymNhrcUiyWC7DV8wqHfmuC/Wn+5o6uGhWU
 KM7IUNTAkPPsZtZBoipIUCgoqaIAuT9mNCB3naaMG20RnCdi5kobVt2wqnPFC8UiKtUc
 hqWrEli6QIxdn3VLC9FvdpeKd+Jon7zXCEhCaLViEcIVz/NXavIa8ASPVXvb4WGTLMws
 nu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=en+M8qwLLTVyz4mNnIV9oXGc3BXJGTwM/2EcYJ81ZKQ=;
 b=asD+yze3qDtzs1DH+qhIbeywKr6wydXJkQfq5G3ITHMmn1g45x6tR3JL5fXgCCbh+T
 nNmcH1Sk3QSHXSr+UrZPP3BnWF04qnl9i3l5SEn0s56GTA39Ul2L0zBGLXW6L60OidWZ
 r46/x9yAbWCRJy0e9HXJV68WEof5jM894ks3Yu8m75NETJ1PuLDxDR12BeMkAsOS0leZ
 7aIhL00R8lLJycBW3O0m9LFH4rthd9/wmKj2xOj/kGx6lXvgvWPMGdjBwkV6PbqQ2O3e
 g5q+noN7CFEpl3mx9OAbuVpylhz0LHYT9PTH+vXuu3/Yy8TnjwQTd07mIht4Z8bSpF9w
 4RMQ==
X-Gm-Message-State: AGRZ1gLjrFZ/NRBbTCzX+phONX1xkCE05TGdz1TI1Xg3pC2+lJXBM5az
 Q1IGqsSzAlaGMmIH7nekGrgc1V6Y9AY1iH8YcIg=
X-Google-Smtp-Source: AJdET5fss32b3UWdqZc+Zgo/XhsB1Hriji1NuUqQF0mXw2ZXg34m3rQ8RDTN1XoJb5e0Tixhq3C70900jVJvJ2wyuc8=
X-Received: by 2002:aca:b183:: with SMTP id
 a125-v6mr9373445oif.44.1542004164743; 
 Sun, 11 Nov 2018 22:29:24 -0800 (PST)
MIME-Version: 1.0
References: <7958aa50-8808-e909-753c-e232b3d1f84e@packi.ch>
 <mhng-58f419dd-47a6-4540-91b6-08be173d4216@palmer-si-x1c4>
In-Reply-To: <mhng-58f419dd-47a6-4540-91b6-08be173d4216@palmer-si-x1c4>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 12 Nov 2018 07:29:13 +0100
Message-ID:
 <CAEn-LTqd3+t+zhmbbZ3CjPMnFOsUxy0pVNUkgvU5T7yQU_DkcQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: add S and U modes to ISA string
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_222939_580360_0C30313A 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: me@packi.ch, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112062913.ReFy2CG8W60fCUNYtHJKfjMaUuI_jvVfY9Ugxr1Yr3U@z>

On Sun, Nov 11, 2018 at 11:14 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sat, 10 Nov 2018 00:35:15 PST (-0800), me@packi.ch wrote:
> > On 10.11.18 07:45, David Abdurachmanov wrote:
> >>
> >> The patch adds the missing S and U modes.
> >
> > This is the same patch I submitted earlier (see v2 here [1], based on
> > Palmer's feedback). Palmer stated that the "S" extension should not be
> > exposed to usermode.
> >
> > Since two people arrived at the same solution, I wonder if the
> > supervisor mode should really be hidden from userspace, as it's about
> > the CPU information, not about the environment the calling code is
> > running as.
> >
> > [1] https://lkml.org/lkml/2018/11/10/96
>
> I still think S should be hidden from applications.  This patch was fairly
> mechanical, so it probably just wasn't though about twice -- that's the problem
> with user ABI stuff, lots of times the obvious answer isn't the correct one :).
>
True. It was mechanical based on warnings I noticed while booting Fedora
with latest kernel and BBL.

Also true, that /proc/cpuinfo doesn't need to reveal all things to user space
(especially if you don't want various programs to depend on it as some
tend to parse /proc/cpuinfo).

Note, that on server systems which probably would implement SMBIOS
(based on the current proposal for RISC-V) the administrator could
check for S mode.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
