Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E453BC6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF422082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MxZnf3aE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Z41bLBSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF422082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Sl/JhjRibovlh4+BVMEi9zgashxEmWtAEhdblHHPitg=; b=MxZnf3aES5Uj1DHzeaol6Jf2u
	zIO38qBlIYgApKXj5/PpcA+UxT91TmtQuOmwLFQdTdBdoFgb8zUEmwolwkKiS3vWqhOwKhHrhkycJ
	irL201GYcPgTYlI0VLXvWfQXU0eANMGRSNxgXEcoABKpAf+BmSCn/ZEXOyu+8If0GsI9jdwOfE1NP
	69+AyvKtJiN2GS0I3AiEnnLLqixYzudb6FZE4T3o/s2AhR262WWXXV7JqZpRyQPjrqU0vHQXdfdum
	zxMFbLWUP41xZJUv6xFBrGB7CfGO73idbcsDA7rP6OVzjYHZdOkljOwU+L1oAOG1GiqfG6GsNPukD
	h4I3InS2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIH6o-0005dN-Vc; Thu, 01 Nov 2018 17:50:18 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIH6n-0005Aq-20
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 17:50:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id r64-v6so9680315pfb.13
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 10:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GFlRgMZkJ4YMHOMTHBQoUQxMJc7k1tC+EcFFH8tZutg=;
 b=Z41bLBSysABsyy3IHVEJQzoULwqyc7jqXN9vEKH2igPsZdi+icv34TVdjtHQvBO+H6
 Q+bovyQIsXPKifThtKOnL7+5S82ju/4mEOunOz33ariVVn9WAg5n7hEEwqsLObjwrRqi
 FGfHxCI8l81g8Jec6j82EThH6FYowKHNi/7j607WNt9ydRTKHvJwp881H67qIGkfDMg7
 r7Rh7bI1GMlEJVmmxnIxW5lpHrm6zSqOwwmbg5YH2IydUa6RgOJXHNbabwBR6fhk8iOL
 ObOKPyG1UIR9YXYL6zA9VO7mIz4KtPq6zbsT4cirJHaKqar4FqS8EsmTb429KQNXAJci
 BJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GFlRgMZkJ4YMHOMTHBQoUQxMJc7k1tC+EcFFH8tZutg=;
 b=Loe9PAeAFuywF2Q9Z5uIBcx5BbQ5NSLA/AR2TaE+W+fWiWjPVWLKjb+mQ/yCceftNO
 sza9CqCqMHu+ZsK93uvBFE/Tyynuf6w14P+kaUrgUwXcEe3IeM1yGFRwkXesrQ/+FmZd
 ajzN+eucfP9AAvegjr5rR/uESx8V/9nPmJTFH4Trj3jn/ECKw5ZK56VZju54i7f43yiT
 GzlnvYIpB8DJl8RSYimQV/1dbBsMSUm158zGn5/b2+vxkiuzdj8t3stQ7XqcEY6/IJ5Q
 VxTIQu9Fa0OBFLKlRk/bz5NRolQeXTJB/b0XdZtLwb7BmYLDJ3YczpNyk/zruNmSlbWO
 Hg1A==
X-Gm-Message-State: AGRZ1gI6BPy3fAnwurXZjaKF7rA/uQJRJ2Ia4etm9EOCBMTRHkrN7EqG
 Hz3i8cOLsUQdrWZ019tG/T+a9tYZ/DQ=
X-Google-Smtp-Source: AJdET5cwpGuphfqFHjwbJ1QEYaAwcz2T8I+FVV0Fyo/MlNFeaCjpgqRMaxBaL6OvADbL8iTngeip1w==
X-Received: by 2002:a63:6ac5:: with SMTP id f188mr8071804pgc.165.1541094605708; 
 Thu, 01 Nov 2018 10:50:05 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m20-v6sm38421157pfj.171.2018.11.01.10.50.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 10:50:04 -0700 (PDT)
Date: Thu, 01 Nov 2018 10:50:04 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 10:49:38 PDT (-0700)
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <20181101005541.GA25604@andestech.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alankao@andestech.com
Message-ID: <mhng-22ded2c8-7f87-4acc-b017-627e369cf874@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_105017_095621_D35E6656 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 greentime@andestech.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, vincentc@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101175004.Btuwgn5MuKG3hhugpSMLKRYlB8vEGMaZ_1QEgYAPhkc@z>

On Wed, 31 Oct 2018 17:55:42 PDT (-0700), alankao@andestech.com wrote:
> On Wed, Oct 31, 2018 at 07:17:45AM -0700, Christoph Hellwig wrote:
>> On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
>> > I agree that we need a place for vendor-specific ISA extensions and
>> > having vendor-specific directories is also good.
>>
>> The only sensible answer is that we should not allow vendor specific
>> extensions in the kernel at all.  ...
>
> How can this even be possible if a extension includes an extra register
> set as some domain-specific context?  In such a case, kernel should
> at least process the context during any context switch, just like how it
> deals with the FP context.

Ya, I think there are cases where vendor-specific extensions are going to be 
necessary to handle within the kernel.  Right now the only one I can think of 
is the performance counter stuff, where we explicitly allow vendor-specific 
counters as part of the ISA spec.

For stateful extensions, we currently have a standard mechanism where the XS 
bits get set in sstatus and the actual save/restore code is hidden behind an 
SBI call.  That call doesn't currently exist, but if we just go ahead and add 
one it should be easy to support this from within Linux.  We'll need to figure 
out how to enable these custom extensions from userspace, but that seems 
tractable as well.  We'll probably also want some fast-path for the V extension 
(and any other stateful standard extensions), but I think as long as the V 
extension adds a quick check for dirtiness then it's not a big deal.

Do you guys have stateful extensions?  We're trying really hard to avoid them 
at SiFive because they're a huge headache, so unless there's a compelling base 
of software using one I don't want to go add support if we can avoid it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
