Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4820C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 15:10:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BFA2205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 15:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hiRwQ8Hc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FwQmSr2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BFA2205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K5VqyB5S3FAIdIUGx353S48lN1phJbK/LFsIiCi7x3M=; b=hiRwQ8Hc5zVo/0qbVvtXbRrSn
	Dm0SkWOFjLRxoUbvkrXhdc0dN7UybvMld5NPAVmE5/edKUT9EHO+baq6wq0bollw7r6rF533iIw4q
	KFUwHe2JVGMJO7m3OlP2hh5U3PMaMx+6nACC5PSJzmo0cYlnp7HLUCsqCY2U+tuYS8TrSjd38XmVQ
	YkcK8lyIjNIQ1mUPlgYvBofqH1E+0YFtZ7GrV6H9kZXAxvtYO55qvnvHiNXoKbS6eDT+E+qCIynJw
	S3RE1ZQx6x+e6d2mCuwKSHuIw5AbfOiKq4yLcg2vssq/76Wi5hJhDoGgG2eccQl62Oy/2psju/rkj
	kl95hVD7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIEbj-0005D0-6k; Thu, 01 Nov 2018 15:10:03 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIEbf-00054G-7I
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 15:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541084999; x=1572620999;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hAdGAvIoq3QOtnzmoBm5JPtxZFV6VHhet2L5VOHdpCE=;
 b=FwQmSr2fWN0y8LUAbIx2ulQ7SqYyPW64WVbQg1rpA0FRVFWhfJWICOkW
 r96DQRFzQIGoRtK7ns7Egr//qQuh7InZIdnAS5lDx4LfoB+Sb3O7W5CxN
 okat9IFOPrJpF/gWolasjGd6xoJpd9Ck5EJE/7lAZrpxPathn9UFgB1IC
 d/IIry+d2yylWuB29aGgM5kb2Zhg6hdVO0VEZlAvU2L2XPbUUPo3foSrb
 Ysmf2Q4X28jL4ijsNiejO3hi65gz4bSHJ0fH2C9K0piTAz8vgvVt1ZWVX
 YkfUdeWUgGvHNDYRUXpHr6Uxu30JRKxMEyT7jxr1eXuosHvX6rPRZZFPw g==;
X-IronPort-AV: E=Sophos;i="5.54,452,1534780800"; d="scan'208";a="95004892"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Nov 2018 23:09:43 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 01 Nov 2018 07:53:28 -0700
Received: from 19tp3g2.ad.shared (HELO [10.86.53.38]) ([10.86.53.38])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Nov 2018 08:09:42 -0700
Subject: Re: SBI extension proposal
To: "Richard W.M. Jones" <rjones@redhat.com>, Philipp Hug <philipp@hug.cx>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
 <20181101094609.GE27120@redhat.com>
 <CA+h06zjY86e5UHa9HzSFvKNkT_oMz7sQWkBQY8ufg6x25CmsKQ@mail.gmail.com>
 <20181101112528.GH27120@redhat.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7c20c4d5-1726-d940-58ef-6541f0a117d2@wdc.com>
Date: Thu, 1 Nov 2018 08:09:41 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181101112528.GH27120@redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_080959_417605_84F76A7F 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "olof.johansson@gmail.com" <olof.johansson@gmail.com>,
 "andrew@sifive.com" <andrew@sifive.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 "vincentc@andestech.com" <vincentc@andestech.com>,
 "mjc@sifive.com" <mjc@sifive.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 "David.Abdurachmanov@cern.ch" <David.Abdurachmanov@cern.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101150941.RTyUI_JmQdRLRQXx4wxU_jGRZ8tLRIN5wEEuNbKteRs@z>

On 11/1/18 4:25 AM, Richard W.M. Jones wrote:
> On Thu, Nov 01, 2018 at 12:03:49PM +0100, Philipp Hug wrote:
>> Am Do., 1. Nov. 2018 um 10:46 Uhr schrieb Richard W.M. Jones
>> <rjones@redhat.com>:
>>>
>>> I agree.  Please try not to make things that depend on DT, as it's a
>>> Linux-only description which isn't suitable for other OSes and has a
>>> poorly defined ABI.
>>>
>> You don't have to depend on DT. If you implement ACPI you'd put this
>> information in ACPI as well as you do with other information about the
>> platform.
>> What's the advantage of putting static information into an SBI call
>> instead of putting it in DT, ACPI, ...?
> 
> You only have to put it in one place.
> 
> Rich.
> 
I agree with Richard. It is better to manage it in SBI implementation. 
This version will not change in every kernel release or so. I think 
having global SBI version in SBI spec is fine.

However, we may need to put <function,version> for vendor specific APIs 
in DT/ACPI as pointed by olof earlier. That will help to avoid conflicts.

I will update the proposal such that it is clear that we are not making 
DT mandatory, ACPI is an option as well. SBI spec should independent of 
OS specific spec.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
