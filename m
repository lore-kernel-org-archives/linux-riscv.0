Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604D6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 18:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3278B2070D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 18:06:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owYtWY+Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQdWK863"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3278B2070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGyip8L2lxGwtHcLkelnLNQ7+2FRJIeMnmWqBUcq18k=; b=owYtWY+ZI+2PuU
	78D8Iaupx9nfvNL5wu0S8cpO6hsKHgzWitRceA9iUlF7nIOqCuuAbJ2q+eAOD5HUgbinyDKCUqtq3
	//JMn63xgJnhHJ4RRllMcPRiz+YgldeOTgBJzaWcNuXybVu8ajToBSBJl4aIu8ZxTnca/mXL7dp42
	Vr+7TP8i74XCXGydo2NMCu7W3NQQvCdB4U1ZLbLquZlvzlvVtdqZ7MBvvamIKpbtffHPiKaKr/zPE
	K8yu9IFvJ96GaQN9KmOTef8WK+R09hPlxp78kTOWNLOX/wmO9T3xm4V8Atb+L7OjJnaj9FmAvRFVd
	E1+6VIKSs/GUc9KRk4CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxFDc-0001rr-Kc; Fri, 22 Feb 2019 18:06:40 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxFCX-0000Mz-46
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 18:05:35 +0000
Received: by mail-lj1-x242.google.com with SMTP id l5so2420340lje.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Feb 2019 10:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxYzLeroRCrwaC14L67flcP2TLWv1jy+Z+l6EBqVfJQ=;
 b=QQdWK863Td/zmZcA1OhJDuNXRkBGhVrL8ffmnz0CjYvWo9yQRXRKWcdpa9kT1RP33s
 UIeVxEC6GTHbPJJEwjsz9MolrtpYS6zXfHWg2UppIHka2FKEsZ6Do9E6NXlIdjCQidm0
 tMewp5sybk9kgwxzy3y7338oqqUBdDlexXwQc+5LczyUwom1m9nDRN7IaprFUEL4HMuU
 gp89tKEhz9Jg8vCl2D/eaf2OIpUiqOaxWg4vxImCnW9eRXn9J4fv8pZBFoy92A0JthLb
 9CbdFhnDkYBkk4wQ3MgW2wpYp/AvVItnnHPCbplnLMhxTpFE6LzMX5yOgl7D5HCZGu6X
 Y5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxYzLeroRCrwaC14L67flcP2TLWv1jy+Z+l6EBqVfJQ=;
 b=PpmBO0BwA5FmKBQhkmWhEwl4AoNWJpbUDE85ZWVB++hbwf304CrmEKCweWpyEJ5zxa
 XlajbqX56buvggzPAGLtr1t6AHNH86UH3sMbiTNq5tFYoMlki9/bWq4WuGuipfie2/QU
 Qk664BzVmV9rUsU8o8RGY6bhxPaWm4MgCztOO57Xci1XoQGqptlV36RpaoSjYQQQF4A3
 XndhRqmbFjsY06GpWPnrAmh8JkBg73t17k5n/yCvSIKUnHlKDyvFkqlgzE+uINCMUVAF
 QNhvZP5iB/98Zz4IqBw5CXPQOPfPi/ko3JU5MABW10byyD9qI88riSybjagqMTl3mGfd
 iB2w==
X-Gm-Message-State: AHQUAuanaplgBvMlGw3gI19fWgbqVJ/AqwInXaX6ulRBzCQypCPmUWwZ
 BMkC1YCxVk7n5HBetEAuz780sSoBkX0/F+SV3AU=
X-Google-Smtp-Source: AHgI3IaG64u7UcZBuRNWGh6J7upYUC4GkFXw8Ini/rnWQ2xZPZIFGpGSzw43iy8ghPCR/fOS+yqDqo8rloRNKfMPX9o=
X-Received: by 2002:a2e:711b:: with SMTP id m27mr2994129ljc.141.1550858731400; 
 Fri, 22 Feb 2019 10:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20190221003231.31625-1-alistair.francis@wdc.com>
 <20190221115227.ipwjpn3xm4q7jfg2@sirius.home.kraxel.org>
 <CAKmqyKM_pb-riJ+jO65eT0SsVDxrstPOgurPuDf92Fd4C8k1Ug@mail.gmail.com>
 <20190222053747.rhed6j6nyi6tmg4l@sirius.home.kraxel.org>
In-Reply-To: <20190222053747.rhed6j6nyi6tmg4l@sirius.home.kraxel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Feb 2019 10:05:04 -0800
Message-ID: <CAKmqyKNNwHin9XD1-9z13XZrRch_36Po_0R5X=GNUTGAAOek_A@mail.gmail.com>
Subject: Re: [PATCH] drm/bochs: Fix the ID mismatch error
To: "kraxel@redhat.com" <kraxel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_100533_356309_F06F7765 
X-CRM114-Status: GOOD (  14.89  )
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
Cc: "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 9:37 PM kraxel@redhat.com <kraxel@redhat.com> wrote:
>
> On Thu, Feb 21, 2019 at 10:44:06AM -0800, Alistair Francis wrote:
> > On Thu, Feb 21, 2019 at 3:52 AM kraxel@redhat.com <kraxel@redhat.com> wrote:
> > >
> > > On Thu, Feb 21, 2019 at 12:33:03AM +0000, Alistair Francis wrote:
> > > > When running RISC-V QEMU with the Bochs device attached via PCIe the
> > > > probe of the Bochs device fails with:
> > > >     [drm:bochs_hw_init] *ERROR* ID mismatch
> > > >
> > > > This was introduced by this commit:
> > > >     7780eb9ce8 bochs: convert to drm_dev_register
> > > >
> > > > To fix the error we ensure that pci_enable_device() is called before
> > > > bochs_load().
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > >
> > > Pushed to drm-misc-fixes.
> >
> > Thanks. Any chance this will make it into 5.0?
>
> Hmm, we are damn close to the release, not sure there will be one more
> drm-fixes pull req.  But I've added a proper Fixes: tag, so even if the
> patch misses the boat it should land in the stable branches shortly
> thereafter.

Landing in the stable branches is probably enough. If you do end up
sending another pull request it would be great if this gets in. It
would be nice to have this fixed in the official 5.0 tag.

Alistair

>
> cheers,
>   Gerd
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
