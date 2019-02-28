Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D14EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 20:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0F9218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 20:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5vMJhL8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="m40bC/0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D0F9218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ynqFA8Zlv56klDvgJBMRg9Bi77acSCpyaQJSm35Y20=; b=A5vMJhL8ARj1rp
	wLUwNguKhRiQGwWW7PeXVWEDmR8FNXSuNFo73v/5PieUNzawBhlRSCHC23mGshyRF9EJtoGmRtyMT
	jJ7ZbXLvZZ12TC4gHzKl778f4H7/KN75eHL3yhuC3IgsBLNWL629gSRncgBezJQoS6FuH0iRx+TyR
	obx2VI88sMikCvhM+RHFWoWyoqwZi4t6FIXh7i57QTYWTeHD30svORG9VxRSAoJo+PCrw/MUQliG9
	8XLSyjyPOC9Rx1IdmbaBepcSpSuJtUdqgk7kkI98sGVs6azAhcoAKSNjssf9vlP39k9JvUSN6fhkM
	wznGk8SL9yf/17t/rqAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzSB9-0004Ry-Kn; Thu, 28 Feb 2019 20:21:15 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzSB6-0004Re-FR
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 20:21:14 +0000
Received: by mail-io1-xd35.google.com with SMTP id y13so17679966iop.11
 for <linux-riscv@lists.infradead.org>; Thu, 28 Feb 2019 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=KZht8Uii9aWTidBYh9kIieCCPgg/SM0V396L+0yWnfY=;
 b=m40bC/0vwMjbpUGDcd+GXgBrU9WNzkmm6JEq3BVDKkkg9HhZRZEry5+vuz/sOAb44g
 T84V8Fa3kh2AgVauxAliZKNdS38AAJJA/TED1p+3jQARpe8hRnptMbWGkCrwMV8kCKBz
 YSpzEFK+AHAW1x6iQkCcnOhOK1aSqEPz6yLM5QGBm5xF4cGjnDGe8FXgmqXe6gPIjgYC
 twnCmWIYI3glZIwyr7GELtriHnY7QBns1rFLX7uQeKG17Z5hrIpqcETd9qhLhEPSc/QD
 laF0gbjW7CSv3/eRNLVcgNOeS+9oWO+jOPOB71QYoyLn98C6Ci71KOuXapFJgJDtqOkd
 hf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=KZht8Uii9aWTidBYh9kIieCCPgg/SM0V396L+0yWnfY=;
 b=DxWT5X1qXQIPa6BwaGb/CK44dGHSDcH+0/+xWuZWObl+GI2Fhpox3BsxwYWzB8rGOz
 0dOpFskzKR+hASBOK3ipnOyRFMdHK8tADPWsPQKIiZSfFmltrL9oB3Lh2JZOKvULXcat
 bPa0jnqqstIqvrSjdRJdg8btLRozpYH2vuJnAWjCKrJ4AHreRY6ZqGgVSDe4MML5wPWc
 LNAFsuqRLJRN17S5YRzFJsyp/+qtNcKvtlggKzWMPE1cmbmVIOu1rJf8CcFoshRia3ji
 /ovEkXW2e4pXxW2E3SeLnvsygn3RZK6ddMWg+SqqH8Y3z5HjbD0/EGMPr1h8Z8rVIZwP
 sAhA==
X-Gm-Message-State: APjAAAXuXwLsGHsFDjtjVTc3pae0YoLe4+TPPvQz5RAVZruNIsZ+uGDJ
 Y7CpbisACoKVnSqVu43VajBv+w==
X-Google-Smtp-Source: APXvYqzfpzjoqkb871HS1L0jTrVITgGum1eEX0JoE0/939Z2Idt/Foa6Te48VZLTfmiL95V6Vkc9NA==
X-Received: by 2002:a6b:7a4b:: with SMTP id k11mr700849iop.119.1551385271191; 
 Thu, 28 Feb 2019 12:21:11 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e19sm7528685iob.70.2019.02.28.12.21.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 12:21:10 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 28 Feb 2019 12:21:09 -0800 (PST)
To: Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <0100016935831a0a-8ad31ea0-9ab5-44e7-8aae-ac8cb2491c72-000000@email.amazonses.com>
Message-ID: <alpine.DEB.2.21.9999.1902281217250.17965@viisi.sifive.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
 <0100016935426418-5eaf2d86-8a0f-4c1f-91b7-b4d872d6ba48-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902281034390.10196@viisi.sifive.com>
 <0100016935831a0a-8ad31ea0-9ab5-44e7-8aae-ac8cb2491c72-000000@email.amazonses.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_122112_527364_866C5BCA 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Feb 2019, Christopher Lameter wrote:

> On Thu, 28 Feb 2019, Paul Walmsley wrote:
> 
> > This is the AMO-based sequence that Palmer wrote in his E-mail:
> >
> >    li t0, 1
> >    la t1, counter
> >    amoadd.w zero, t0, 0(t1)
> >
> > The RMW takes place in the amoadd, and executes atomically from the point
> > of view of all cores in the cache coherency domain.
> >
> > Or am I misunderstanding you?
> 
> Yes Palmers example missed having the address of the per cpu space
> somewhere in a register (lets call it "tPerCpu"). Then you can do
> 
> 	li t0, 1
> 	la t1, offset of counter in percpu area
> 	amoadd.w zero,t0, 0(t1 + tPerCpu)
> 
> But as far as we know we do not have an amoadd that can do this. If you
> add the percpu space address earlier:
> 
> 	li t0, 1
> 	la t1, offset of counter in percpu area
> 	add t1, t1, tPerCPu
> 	amoadd.w zero, t0, 0(t1)
> 
> then you have the dnager of the amoadd being done on the wrong per cpu
> address because the scheduler may move the execution thread to a different
> processor betweeen the "add" and the amoadd.
> 
> If you do it without the amoadd with just lc/sc then there more potential
> issues exist.

Thanks for explaining that.

Is the offset of the counter from the start of my per-cpu area guaranteed 
to be the same across all CPUs?  If so, wouldn't there simply be a 
potential performance risk if preemption was left enabled, rather than a 
correctness risk?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
