Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2E2C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 03:17:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D157F20666
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 03:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gnvvk67l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="FJRQZhL2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D157F20666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Lj+ktWcGliaooiJAxOSw+9G9lZQky0wIWaSdW64JVA=; b=Gnvvk67lVoTwPX
	C0Iqs3CeR56kyC5lkuL7Q4ooTie1MDtZrA7JDMrHzq2jzLYQGwDgxr1rrWXFP47rX7ZC2w01XfLeR
	Y0ENb83VInmSY0lNW7rR0JnMmmYTbbeCIvZBbfQfBFYE0DbQ2H4yhlfX36Ao+npD434fqa6RJ8t0t
	m9MQjK5UT9i1+A41ur8P8V2g13wc5pPuHvr6lOJUmGeulwK0n5dKk8lFJT6L/PifKjNerZboaNw/3
	gL2pImmSlPaaqahCy08Uo83z4k14Tpjh8yXeOIE//QsNLmGsgDKE2zU8/SYCr51vz9vZdzuIoUwDl
	kdpEpdNdH57bQOJRuFGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIPxq-0003NW-4U; Fri, 02 Nov 2018 03:17:38 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIPxn-0003MI-6d
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 03:17:36 +0000
Received: by mail-lf1-x143.google.com with SMTP id o2-v6so347097lfl.13
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 20:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jRWFEyc5JkqaTYq/6LpKBSkL+jm4w4fxtvEpHb5YxqM=;
 b=FJRQZhL2pqHrikR9KwB6az0FMCTp0Si9F87pPPQSXaxBpdliloKC7rQWOgvm9dpJBf
 7cHXtyK+sCEbDG8f+pUA9RzqaYPVH8KWNkrYfYfYWJULCrBt3ImvQ3R9dF8Kwy563fIa
 Zy0Vxa8kzwZKfd5KQCBqVas2oBgA4+UfGLmjRzwsTknbEAVmV/Q8V+MASVakJdXMnmXR
 2nxncfyrm6p2QkqY4OaF6LCrT0hhjwETB06tSOB6bBzBAPe1evbe9Pjrdtcno4gcqxVQ
 DBxb0uRniba5ZuA4cJ5q5aoWGjcoC1hOrYgcC5uVuhYzcNbbTog/WL4VXcYWO2he4bkQ
 2NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jRWFEyc5JkqaTYq/6LpKBSkL+jm4w4fxtvEpHb5YxqM=;
 b=lCKmivYEhPuqKWHCfKaiTRGkTmpZSgALqL1rpz+Pla0t2GMQUCbzuoAdy4AOpVktjT
 Kaa7cysvqeWIIwH2jiYgQz1SBhTTxY+UUETVNCMtGXiTsOsu6nndxroqqfiURqGsCmr/
 At57tDiG9X9hcB0wI2JmDhUOF9fqKXPbDI9Eyblp+L/3UV/utL0bkqLIey+qSUJQL6Fe
 e0yCHSYe1eImucyHFkgLWvOGVRIGlhqOA8RnaJKp/dJdm0XKhCJmd4NmDNRkq4mscl5E
 iS5f4kWmJ9kT9VuyB3M+/3cAk3VoGkUNst33FsCWMfJ3vcXaBJIFUqi+rVAYOkuy/kL2
 6znA==
X-Gm-Message-State: AGRZ1gLxiKS4zzGfaU57O+Xn+9aZWOQ20EP/GtebE/EGHqWJSLclK/RH
 8e7iI8VOlQFJrHphi8KZgzsV12duc8T2HyIKcW3p4A==
X-Google-Smtp-Source: AJdET5ckdXxS5dOwf6FTK0QsMJzTpgCJVcLRU6QTeqmo4js2qhZB5Omx4dsZInDAVfdiuLUXRwUKeFbcrYJHt4Zqkxs=
X-Received: by 2002:a19:4c02:: with SMTP id z2-v6mr5620297lfa.48.1541128643066; 
 Thu, 01 Nov 2018 20:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
 <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
 <20181101112528.GH27120@redhat.com>
 <7c20c4d5-1726-d940-58ef-6541f0a117d2@wdc.com>
In-Reply-To: <7c20c4d5-1726-d940-58ef-6541f0a117d2@wdc.com>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 1 Nov 2018 20:17:09 -0700
Message-ID:
 <CAOesGMiRW=CHy7i3xWgEk2Oq8BGxRwd2Mvt8DWt96XNqBFB1HA@mail.gmail.com>
Subject: Re: SBI extension proposal
To: atish.patra@wdc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_201735_243260_DFE1311D 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, zong@andestech.com,
 Damien.LeMoal@wdc.com, olof johansson <olof.johansson@gmail.com>,
 Andrew Waterman <andrew@sifive.com>, alankao@andestech.com, philipp@hug.cx,
 Palmer Dabbelt <palmer@sifive.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, vincentc@andestech.com, mjc@sifive.com,
 Arnd Bergmann <arnd@arndb.de>, paul.walmsley@sifive.com,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 abner.chang@hpe.com, David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102031709.VCdLS4ipHqrdiWj8f4rAnl6fiIO0TdTstx1_E6fLoS0@z>

On Thu, Nov 1, 2018 at 8:10 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 11/1/18 4:25 AM, Richard W.M. Jones wrote:
> > On Thu, Nov 01, 2018 at 12:03:49PM +0100, Philipp Hug wrote:
> >> Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
> >> <rjones@redhat.com>:
> >>>
> >>> I agree.  Please try not to make things that depend on DT, as it's a
> >>> Linux-only description which isn't suitable for other OSes and has a
> >>> poorly defined ABI.
> >>>
> >> You don't have to depend on DT. If you implement ACPI you'd put this
> >> information in ACPI as well as you do with other information about the
> >> platform.
> >> What's the advantage of putting static information into an SBI call
> >> instead of putting it in DT, ACPI, ...?
> >
> > You only have to put it in one place.
> >
> > Rich.
> >
> I agree with Richard. It is better to manage it in SBI implementation.
> This version will not change in every kernel release or so. I think
> having global SBI version in SBI spec is fine.
>
> However, we may need to put <function,version> for vendor specific APIs
> in DT/ACPI as pointed by olof earlier. That will help to avoid conflicts.
>
> I will update the proposal such that it is clear that we are not making
> DT mandatory, ACPI is an option as well. SBI spec should independent of
> OS specific spec.

Please keep the ACPI mess out of it for now, there is no reason to go there.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
