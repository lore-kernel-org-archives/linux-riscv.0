Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9090CE74ACF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 20:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GwSg7mSlyFGi8aomwshEzjdBJSSdEhOscLkyZwRrUeQ=; b=P3RRHPBJhBK53p
	8C1A5Gj50ZMsWxwGL0JCG0xkii8JZfI8xzMQ5YsMw5v/8u0GEwBWTldToz/0pX5NTOvMH2eYXQrOo
	2id4Lvp2DoRSGMNN+N4j0HG/VZsvhRvl3yVLc8FK/wwVlUxhcDcqqs5NncBDatD+Odo6skcILmUaW
	mHMUqas+X83IpRhrl/VQsXd0w2GlLEwb8olMS+kudWlRhoTbSR+GrQd2NFB1i+mYBKmQkKdm/Ae9i
	D2kQXksaIEw160olbsaohRad2shvE+NTmPFno66MywwjNYojeNkUh6MOkUUeAedmTPAnW0ZY/s3OT
	SCfCd738SWntB+HtmtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZKI-0000000Abmg-3RW4;
	Tue, 03 Dec 2024 20:16:54 +0000
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISRd-00000009W06-3bW7;
	Tue, 03 Dec 2024 12:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733230562; x=1764766562;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=zHt8L2Z6dJwqzsWV71weChOsU9eMWPerfPu1DOoxdJ8=;
  b=L4e/unjhlCvocVtj+zwSGc9JN97dRHTya1WLNX2dTehSZNJrzBpQhvz4
   6CJVOPa+jczjWDhAzYI15i9P/NGC4XpnXgwlTGFNunWDhjmTYAL1RSweE
   oIO6N2+jcYi1JlyptQqwpBCN0nBlBPx1gW5KfvUDHC6C2XidJObR4/EQm
   U=;
X-IronPort-AV: E=Sophos;i="6.12,205,1728950400"; 
   d="scan'208";a="357635905"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 12:55:55 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:25389]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.32.206:2525] with esmtp (Farcaster)
 id 321ae853-bb47-4473-a697-0a3ceab94d46; Tue, 3 Dec 2024 12:55:53 +0000 (UTC)
X-Farcaster-Flow-ID: 321ae853-bb47-4473-a697-0a3ceab94d46
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 3 Dec 2024 12:55:53 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 3 Dec 2024 12:55:53 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Tue, 3 Dec 2024 12:55:53 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>,
	"hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
	"sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
	"adityag@linux.ibm.com" <adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v5 1/2] kexec: Consolidate machine_kexec_mask_interrupts()
 implementation
Thread-Topic: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Thread-Index: AdtFgq6lXwncie71LkSE+iBNpljfQg==
Date: Tue, 3 Dec 2024 12:55:52 +0000
Message-ID: <077908c5f02545f0a9e02ae77cbd771c@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.143.174]
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_045602_110993_30F53E88 
X-CRM114-Status: GOOD (  10.10  )
X-Mailman-Approved-At: Tue, 03 Dec 2024 12:16:37 -0800
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

On 12/3/2024 1:04 PM, Thomas Gleixner wrote:
>> +
>> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>> +     bool "Clear forwarded VM interrupts during kexec"
>
> This should not be user selectable. Just keep it as:
>
> config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>         bool
>
> which defaults to 'n'. Just add a comment what this is about like it's
> done with the other options in that file which are only selectable.
Question: Should this new configuration option be placed inside or
outside the following section:
```
menu "IRQ subsystem"


endmenu
```
In my patch, I have added the new configuration option at the end of
the file, outside the "IRQ subsystem" section.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
