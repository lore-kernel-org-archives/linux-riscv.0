Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36E2CF6499
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7C2OTLRzWBntSCjEXjW5L2i7YFcVJmdVBx05fJbnuA=; b=Yx76cXp63/n4+N
	WxhYwkFMZhmjY7ER0K03KD/qxGA4oVNXPm1/9WtHIHp1UZZdO/IpXeaZxpmgjkNu6JTmNnEEIKYqu
	dos1AmIhXCSHLmBsy2SijEes6BXT3P8/7lIpKCjPBXrxGBT+LI8c5EXzp45dTYh5wd6OyxS2WUb0T
	7HSxIGaoq++P6hK+M3rr7Dwh36l0B62auYsbz2CmPkFK1ZXvHgg64LgOfP0h+fAHfle41svBg5twf
	ZX+5fcidcDaZn1Y0xjzKt+/jWAOaeGZzl0ZXe/qPAdSWyfnArw1MocNUOJWsjicOWJ5nEdKbO5iRn
	stVTVyW1As8E/2iDMAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suvXl-0000000Ew8O-2byQ;
	Sun, 29 Sep 2024 15:09:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suvXi-0000000Ew7o-1bOI
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 15:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727622540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R+sCdbkfhTEz7TnfaD4paIwB2+AbGZczJG6rCSFUluM=;
	b=JH5/9Cztuiq/IW0TX9y+XajQ9Pztxhdd505JQljzwI3zmGQ8/s/PxzWE2G3ZuP/nS+W+PF
	m89vtcLbvlNn+ACm3c5FLbDmOl2NtO2BXirPF7Df+2BupcuV6DCAm90eCvPsPI+wBNq86h
	FDHNw823rc5NBM149rFqGZKYjqJRav8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-RIa8TRA7PGylYPB-VrxoVQ-1; Sun,
 29 Sep 2024 11:08:57 -0400
X-MC-Unique: RIa8TRA7PGylYPB-VrxoVQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BF2E19030B5;
	Sun, 29 Sep 2024 15:08:56 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.151])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 254803003E40;
	Sun, 29 Sep 2024 15:08:53 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Jeff Law <jeffreyalaw@gmail.com>
Cc: linux-riscv@lists.infradead.org,  Palmer Dabbelt <palmer@rivosinc.com>,
  Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: Page sizes supported by RISC-V
In-Reply-To: <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com> (Jeff Law's
	message of "Sun, 29 Sep 2024 08:51:25 -0600")
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
	<e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com>
Date: Sun, 29 Sep 2024 17:08:51 +0200
Message-ID: <8734lixzss.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_080902_520580_FF119327 
X-CRM114-Status: GOOD (  12.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

* Jeff Law:

> On 9/28/24 10:35 AM, Florian Weimer wrote:
>> I'm working on adding a <sys/pagesize.h> header to glibc, so that
>> programmers can easily determine the range of possible page sizes for a
>> particular target, for things like pointer tagging and mapped file
>> alignment requirements.
>> Linux currently supports 4 KiB pages only.  I couldn't find anything
>> in
>> the RISC-V specifications that mandates a specific page size, but of
>> course the way ELF LOAD segments are constructed necessarily imposes a
>> maximum page size constraint for particular executables.  Today, the
>> toolchain assumes the maximum supported page size is 4 KiB, and this is
>> also reflected in arch/riscv/Kconfig in the Linux sources (as far as I
>> can read Kconfig).

> 4k is probably the most common in practice right now.  RISC-V
> generally seems to leave this kind of thing to the implementors to
> decide, so I wouldn't be at all surprised if there's nothing in the
> privileged spec other than specifying a minimum page size.

I understand that not making a call in the specifications avoids the
need to resolve these conflicts.  But if you don't define a maximum page
size there, it is effectively specified as 4096 bytes.  This will cause
problems if distributions targeting large systems want a larger page
size because it better aligns with the kind of hardware they target.
It's really bad for cross-distribution binary compatibility, something
that's important outside the embedded space and probably necessary for
mainstreaming.

(Of course you know all this. 8-)

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
