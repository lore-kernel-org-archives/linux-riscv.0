Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E949C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 09:46:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F394720657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 09:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UkGTJ1RE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F394720657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcPge+7N1B5wo598VXRCmfexT+SRWULrMzPWelui/uM=; b=UkGTJ1REh5lq/S
	vNATajx8NU//Dxs7Z3u+KH1E8wO3ZTsjhTxwqqtL+KA09065coiJKbTFNfyA1SFfy3jhqBuvutHNt
	GkEO3XykRHeOjcblA93hvHXo3zyQwO01p51elTgoiRxC1HVKu9mPYW5S+qYYQSkOevlNKCnFe7OZt
	J6GMOjXT6N8icF8o50AkfiqgrpWf6305gAqDuuJzYsjRuS+bmFz7xgO/bgFpa5rY+7NAk0hGtPkQh
	mgj8kP3k3c2pBpHcw46E7DFiwdeLs37nynM821tBJT/8+LSpMb8cpeTuN0JuH+7zvW7deTycvoTI3
	O1pTGjGonebIqh31j0Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI9YY-0003ec-56; Thu, 01 Nov 2018 09:46:26 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI9YV-0003de-5o
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 09:46:24 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5EDDC89AC2;
 Thu,  1 Nov 2018 09:46:11 +0000 (UTC)
Received: from localhost (ovpn-116-51.ams2.redhat.com [10.36.116.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20A585D6B5;
 Thu,  1 Nov 2018 09:46:09 +0000 (UTC)
Date: Thu, 1 Nov 2018 09:46:09 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Anup Patel <anup@brainfault.org>
Subject: Re: SBI extension proposal
Message-ID: <20181101094609.GE27120@redhat.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 01 Nov 2018 09:46:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_024623_237335_8EA286E9 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, olof.johansson@gmail.com,
 Andrew Waterman <andrew@sifive.com>, alankao@andestech.com, philipp@hug.cx,
 Palmer Dabbelt <palmer@sifive.com>, Zong Li <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, Michael Clark <mjc@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, abner.chang@hpe.com, vincentc@andestech.com,
 David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101094609.sJdnmQajerHOrB0RVMupZDXUHnD9YenF-G6060gb1Eg@z>

On Thu, Nov 01, 2018 at 03:05:51PM +0530, Anup Patel wrote:
> On Thu, Nov 1, 2018 at 2:50 PM Philipp Hug <philipp@hug.cx> wrote:
> >
> > Hi Atish,
> >
> > Am Mi., 31. Okt. 2018 um 19:24 Uhr schrieb Atish Patra <atish.patra@wdc.com>:
> >>
> >> -- u32 sbi_get_version(void):
> >> -- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):
> >
> >
> > How about putting the version information into device tree and use the compatible string? This seems more reliable than probing.
> > e.g.
> > firmware {
> >         sbi {
> >                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
> >         };
> > };
> 
> If it was just DT then I think having this information in DT makes
> sense. In future,
> we might definitely see some ACPI support in RISC-V too (just like ARM64 world).

I agree.  Please try not to make things that depend on DT, as it's a
Linux-only description which isn't suitable for other OSes and has a
poorly defined ABI.

Rich.

> Of course, we cannot keep adding new SBI calls for static information but we can
> certainly have bare-minimum mandatory SBI calls for version and capabilities.
> 
> >
> > You could also add more information about the supported features to this sbi node.
> >
> > I'd also suggest that all functions can return an error code and are not of type void.
> 
> Yes, I agree. With SBI v0.2, existing SBI calls from v0.1 should
> return error code.
> 
> Regards,
> Anup

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
