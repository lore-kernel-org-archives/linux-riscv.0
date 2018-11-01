Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FF5C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 11:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61095204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 11:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="avtYbPSW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hug-cx.20150623.gappssmtp.com header.i=@hug-cx.20150623.gappssmtp.com header.b="GG1sHd09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61095204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hug.cx
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tF8HV1cz48sGCKqqXNXW/mjBSYU64gUBM2TlK61rdyY=; b=avtYbPSWCysXuu
	u0JiKSzWZiTFEw6ndeYpwCyfvSiWeF2ZaL2rAkiEWSMi5ILBd3+gNwJiwRWG+t9FcWWWtV9vcG940
	e3WSxDr2k4h4FSPgga6SFuVCbY2O/lrcEsw99ifB3a/4PjVdlfUzNTPC6w0LpnWHFo+nZk+4FVA86
	yvAmKXc1DAiNpAOAqqR3ohYv6VEEuB1avE9Y91Gmt/RmppyAWMKbiwownibjR8FWbAHg2aNr7O/vu
	pYFbL/0/9FvR2yiV2Zg5Fj+pLtrCOsXMk/iSii0vLOryrJrsJvKbJsy79cSIpAFOz9E9G9Ac5acWk
	yVhFIevS9NEeC9p1rYSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIAlt-0002eQ-8A; Thu, 01 Nov 2018 11:04:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIAlp-0002d9-Vl
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 11:04:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id n5-v6so19617680wrw.12
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hug-cx.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkQKktVkzOZoL3Jv9tQjN3o7qXzTUB4c85fXNvp6vnA=;
 b=GG1sHd09Cza0jpznQ4RY5eRPLcheakzHS2chxJNvNV1Y/l/na/cp1/okdx3BxP4Qbo
 YdJ0SaUtnyj8QAE5S5BBOH2Q/QZzwNwr9SLqy2vsO6b3HFLdL6JOwXVeZFIZy6xhqtV2
 lCKFGkDx4ub2MUViDSIoLnqBDeoorHJFm0lrXHkbOXXr0Eg0jWjFOfyb6yT6OTfrK2pI
 h6Us3Nh9I362Puz5u4GdelRwAObknfwu4PIdQFPUaI5Gd/ImljO2LEQr6/Lf/5gcbutG
 Lf7FAMXgGoa7UW7SwqEec6y/CGURwWOpn40t+KGUwA/Bb5cDAFo5Wti6XPktcQbQwMfQ
 gWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkQKktVkzOZoL3Jv9tQjN3o7qXzTUB4c85fXNvp6vnA=;
 b=dVNX2vGItdWfXehphTKaRJrjPXC0SQpSqJ8yoj06YXfgVGVcjysZDnuo09FfWUuXpl
 gkMfD7q1xdjBED60stsu/jcdkVmQwVWBm2FS3iJXCgw83OUKPCmDBJLDY1M6ctXFhju0
 g0Mmi1VeSvzmrewYSi/R1RssoGg2aTMD4n7FeZiu9wcJVIF6QuyXJU0up280LOmQavTv
 fladHWCRUdkl4BcvsmRzaFe0dFbZDmo0CWw2qz66FUxxQdnlgV3NkR2QvRPe61Xp3/oz
 URu1g2BLg4kG6gd2YdLysDPbZZCM7Ys7ZHt05Gue93S+n+F1gEr+TvgoQ3y/F2iGKJLt
 LMxA==
X-Gm-Message-State: AGRZ1gL14WIpf1cRzvuan20EyQF1QvOnQDyi8uLVVR19UEeqN8YsABfP
 OrK/LGGvaNyBucNGIhQ2CIVRjWHpGfvTds83sxdp1w==
X-Google-Smtp-Source: AJdET5dM1w5NENzjeTswWIZ0MVvNF2PucD685Ue0LETJJdVch1VxHcuDfRLhD21rL64XfjR/OYAvwoqaEtciKnEElQE=
X-Received: by 2002:adf:f44e:: with SMTP id
 f14-v6mr6451918wrp.40.1541070242192; 
 Thu, 01 Nov 2018 04:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
In-Reply-To: <20181101094609.GE27120@redhat.com>
From: Philipp Hug <philipp@hug.cx>
Date: Thu, 1 Nov 2018 12:03:49 +0100
Message-ID:
 <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
Subject: Re: SBI extension proposal
To: rjones@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_040414_166758_50057E8E 
X-CRM114-Status: UNSURE (   6.14  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 olof.johansson@gmail.com, andrew@sifive.com, alankao@andestech.com,
 anup@brainfault.org, Palmer Dabbelt <palmer@sifive.com>, zong@andestech.com,
 atish.patra@wdc.com, mjc@sifive.com, arnd@arndb.de, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, abner.chang@hpe.com, vincentc@andestech.com,
 David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101110349.hDY8HFATyiCfLJZjMspnzzm0uN-Tfk0HaksRirA5d10@z>

Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
<rjones@redhat.com>:
>
> I agree.  Please try not to make things that depend on DT, as it's a
> Linux-only description which isn't suitable for other OSes and has a
> poorly defined ABI.
>
You don't have to depend on DT. If you implement ACPI you'd put this
information in ACPI as well as you do with other information about the
platform.
What's the advantage of putting static information into an SBI call
instead of putting it in DT, ACPI, ...?

Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
