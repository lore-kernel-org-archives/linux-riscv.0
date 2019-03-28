Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9ACC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 09:53:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFAA206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 09:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCwp5qWs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="BYMulcOU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFAA206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZanIqdsUt5txeVAt/fvnzng/wqRhpgDP9m3uAQOmqCM=; b=gCwp5qWsFl7R5e
	y+Rk6UtTAEEbgRGxwpN9Nt6C3A1O7qJrZUm//LsPGSpUsD8M0o4hkowhk4fUxsqh15SQiVzp6nFDC
	4JBeLU4YlQP5GsN9RU3FydGrsLu851u2bgeAyZaNU/fkEGCn7TzgHjOyyrB9G6nl9SUUpuuimOwzV
	Qd4S9SY3FsP9tX4OazrLy5/scmlY9FkZ2WsjdVs5r+l67qypjhghrDyx6kK4XiCYCwEBRC+r2NBWr
	DYCIS8PFJilhxwjudpo9BtQA/4aANjw7tRddyAG9w1+oNnau5TnBbiBcWzt8mRlME72ZLyrfh5+YB
	ZtUlE2P5KTNuRVBcdCNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Rin-0006tO-59; Thu, 28 Mar 2019 09:53:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Rij-0006sr-HG
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 09:53:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id q1so22051608wrp.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 02:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhA1qdRHEXWJUF9ewlQbprtaxlTvnHssd0Yr2vmSUhU=;
 b=BYMulcOUPLgEeyeLI4wbm/JXS9MwOLz5b7TIjN2cpUB5w1g9mekqEdnF45oAyH2mDM
 uXLL1XYXzsAg3AqmLb+iwleGyQ4ngjZ8YRIUKKx5c4sGYZy14Rhygmd/5u62uduuBeR7
 F+mc2Cu8sm450bIPpaJQnDQ+agIMi0S76TeVZwTTMIVUGUCbxChPxnz+t/SEteGBesg7
 LeNJwSOlhu8LKPfDENdCGuIqQLM/Dwn0mpgdLreLRPZbhXDOgG64RHdte6oijZS0vyEd
 x/g/HRqow+V6B4o0gd1+dJmZqjdYjdpCnp4Hl22mm8jhRpu0GMC9pMB4CBxB+LDJ2R7R
 6rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhA1qdRHEXWJUF9ewlQbprtaxlTvnHssd0Yr2vmSUhU=;
 b=B18A+BD6/k/KxM654BwsF5voeolWZVKYnh3bSGSlX1XSdb8Y6aHgNg8xfTmtZwzXho
 G/muCBfj49bGfXqNa5OkIn9kmkxrVS8U4bgMmvaDcWWQtf0HXkqToU445IxFoo4bkf/1
 96PbEq2HkQWx7HCYLLS/eu3FsXkO9yTDOetqyJAcLBTEXiDqKmFtKrJg4ltio99vmdzR
 emak1ItuXficv8gwQ8dtocSmHBzJKbZsuD/COsaZx0Fj9o3fWUrn4jViL0ntVqScfjLK
 AwG3ltCskDeb5h70CDE4QCRrY7urWLSHQlucN00aX8Ik+ROdVLRJ4WvkXqynVHEpnJBN
 N70A==
X-Gm-Message-State: APjAAAUVjo7i8iI05nxXt7XMSDL+ztWKQfrgLDkmXWlUpNPQr3RcMwtc
 fL08KgEjGi+o0ZLQwnyDZ6KZCV8sPmOLwv1Ji0OaoQ==
X-Google-Smtp-Source: APXvYqz2Z/87jFTLbsOqO8EdDrWPIMgjY0k8QKqRKQu30h+XFb11vYvJQ/iNhdbZASNsI7fVA9fqXG3iyeinfH72Qts=
X-Received: by 2002:adf:9427:: with SMTP id 36mr27906412wrq.128.1553766790178; 
 Thu, 28 Mar 2019 02:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
 <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
 <20190327075441.GA29894@infradead.org> <20190328075526.GC14864@rapoport-lnx>
In-Reply-To: <20190328075526.GC14864@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 15:22:58 +0530
Message-ID: <CAAhSdy3URWHVY_GPNb2yRBuctRELRtTTWPM2OpwUVSRFAyXyiA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_025313_647100_8C397A67 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: me@anthonycoulter.name, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 1:25 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Wed, Mar 27, 2019 at 12:54:41AM -0700, Christoph Hellwig wrote:
> > On Mon, Mar 25, 2019 at 09:46:59PM +0530, Anup Patel wrote:
> > > > Why do you even care about kernel mappings for non-existant ram.
> > >
> > > We care because there will always be some buggy kernel driver/code going
> > > out-of-bound and accessing non-existent RAM. If we by default map all
> > > possible kernel virtual address then behaviour of buggy accesses will be
> > > unpredictable.
> > >
> > > Further, I think we should also make .text and .rodata sections of kernel
> > > as read-only. This will protect kernel code and rodata.
> >
> > All of that is useful at the final_setup_vm() time - but none of it
> > matters during early setup_vm where life is complicated.
> >
> > Mike suggested on the previous iteration that you only do smaller
> > mappings when setting up the final mapping to avoid the ops churn,
> > and I fully agree with him.
> >
> > So I would suggest we avoid complicated the fiddly early boot changes
> > that just add complxity, and you instead redirect your efforts to
> > say implemented proper ro and non-executable sections using 4k mappings
> > in the final VM setup only.  That should actuall lead to less code
> > and complexity, and provide more benefits.
>
> It might be worth keeping trampoline_pg_dir if we are to split setup_vm().
> Then setup_vm() will only initialize the trampoline_pg_dir and
> final_setup_vm() will setup the swapper_pg_dir and switch to it.
> Otherwise final_setup_vm() would need to update live mappings which might
> be fragile.
>

We finally know the purpose trampoline_pg_dir page table.

The trampoline_pg_dir is suppose to contain only one 2M/4M mapping
to handle case where PAGE_OFFSET < load_address.

For 64bit systems, the PAGE_OFFSET is very high value typically
0xFFFFxxxxxxxxxxxx compared to RAM start 0x80000000. It is very
unlikely that we will have enormous RAM ending somewhere
0xFFFFxxxxxxxxxxxx.

For 32bit systems, it is quite possible that bootloader loads kernel at
load_address > 0x80000000. Let say PAGE_OFFSET = 0xC0000000
and load_address = 0xC0100000. Now the instruction which enables
MMU will be 0xC0100xxx and after enabling it will try to fetch next
instruction 0xC0100xxx + 4 but 0xC0100000 maps to 0xC0200000
as load_address > PAGE_OFFSET hence we will see wrong instruction
after enabling MMU.

(Note: Above explanation was provided by Anthony)

I guess we will have to keep both trampoline_pg_dir and swapper_pg_dir
init in setup_vm() because trampoline_pg_dir will only contain just
one 2M/4M mapping.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
