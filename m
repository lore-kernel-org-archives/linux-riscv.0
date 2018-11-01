Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A9AC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 11:25:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F1D205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 11:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NN5HnCCD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F1D205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZMAigNYtSmsvjw1v5kTnHs+aKIxKKW+TEKQSUwzqpM=; b=NN5HnCCD+2YFle
	wh/4O+VObtU+hm75/opLo0lGd9seqoQDCLe94DTgwkf/ej/pqioz/K3JvQfgadBQn2WWC8XJSiApj
	YGWUC1rFsys5czmzlrsd0+fWqAgdoHH33ubqvIa38cH6NqCFzR7dLgjtizb0s1R8coo7WtPbKUNCz
	vewuPeEvjYp37Rh/pyAurCqR3aj1+odI+1FuCMUv8a8l0HdYguAt1K9nyDmGW/9CudiGQjt/q6NRt
	TgFFwK5J3gU6ZnLL53o570QaP9uG3h/2NcKAmCcQH1oJGkMwcw/qmN05x2dPOdpanR2UlRpIeqV1R
	YjzbFC/BnP/JcGwOO2Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIB6e-0002r8-Fn; Thu, 01 Nov 2018 11:25:44 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIB6b-0002qS-TY
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 11:25:43 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9547F81DEA;
 Thu,  1 Nov 2018 11:25:30 +0000 (UTC)
Received: from localhost (ovpn-116-51.ams2.redhat.com [10.36.116.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38F0260927;
 Thu,  1 Nov 2018 11:25:29 +0000 (UTC)
Date: Thu, 1 Nov 2018 11:25:28 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Philipp Hug <philipp@hug.cx>
Subject: Re: SBI extension proposal
Message-ID: <20181101112528.GH27120@redhat.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
 <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 01 Nov 2018 11:25:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_042541_981295_B20223B7 
X-CRM114-Status: GOOD (  13.90  )
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
Message-ID: <20181101112528.H1i5m_O1OwEZmeGbCaLL2YcyH_9GuF_CGF4i-M1YeCE@z>

On Thu, Nov 01, 2018 at 12:03:49PM +0100, Philipp Hug wrote:
> Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
> <rjones@redhat.com>:
> >
> > I agree.  Please try not to make things that depend on DT, as it's a
> > Linux-only description which isn't suitable for other OSes and has a
> > poorly defined ABI.
> >
> You don't have to depend on DT. If you implement ACPI you'd put this
> information in ACPI as well as you do with other information about the
> platform.
> What's the advantage of putting static information into an SBI call
> instead of putting it in DT, ACPI, ...?

You only have to put it in one place.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
