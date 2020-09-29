Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08D7C47420
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 18:03:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD9420C09
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 18:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/N35hFA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD9420C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5XxiFWol78N12vQW9lIRIZPoI2VqTA7TS07E/5e/Fpg=; b=s/N35hFAdewL34br5tOqXGrly
	NHZVtY8Wj3lW+i10Yl+TZRN2CpLZ5Mdlj7DcnpWBwBmU2nZr3XKQjh1fUsV0RNtUapTev4+pjeI6s
	OCQ8c5/tYjfz6+sAkOVc8nwyLzKvHyuM5/09Z7Fe+UJBv1vp3OxsnnUx0PxACsJW+EuLmeu+yi4Mw
	3uW2cDG71lUz87xEV+W7IoA40uYXFT1SklFm5EnsSbItiaKzGoZcZYDIKS2M4ZL1ZLrSA2vREq9ZT
	56tbsGUq8LVmPg+DV/bs62J/ioQuYmLX6lLQEbVG3T1uimppq+0wH75sm2EYMBue/Pe7ANhTSZTEq
	X2amVK+9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJyc-0000gY-5l; Tue, 29 Sep 2020 18:03:46 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJyY-0000fR-Pd
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 18:03:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 21E3667373; Tue, 29 Sep 2020 20:03:39 +0200 (CEST)
Date: Tue, 29 Sep 2020 20:03:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: remove set_fs for riscv v2
Message-ID: <20200929180339.GA12546@lst.de>
References: <20200928124928.GA5834@lst.de>
 <mhng-a034d2ee-67eb-4432-be9e-66fff000acda@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-a034d2ee-67eb-4432-be9e-66fff000acda@palmerdabbelt-glaptop1>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_140342_942983_284677D9 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 28, 2020 at 09:45:30AM -0700, Palmer Dabbelt wrote:
>>>    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-remove_set_fs
>>>
>>> under the assumption it might get lost otherwise, but let me know if that's not
>>> what you were looking for.
>>
>> Well, we'll want it in linux-next and then 5.10.  Either a merge through
>> the RISC-V maintainer, or as part of the base branch from Al would
>> make sense to me.
>
> Sorry, I guess my question was really: does that branch have all the
> dependencies necessary for the RISC-V stuff to actually work?  IIRC this actual
> patch set depended on some other one, and while I thinK I got everything I
> don't want to pull in something broken.

The riscv patchset depend only on the base.set_fs branch in Als tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
