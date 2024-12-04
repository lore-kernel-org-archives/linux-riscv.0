Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09F1E7716D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=18tcX4hycOvmY9/ulEfPVBmD/3XYyWbElT/oYdytj5U=; b=iw/2o0jx7vMipL
	nNVjH8SCnMB9K5uObysWGnN2QetgVkn0QNFeKUE9bgmc5ljHgFaxQ6rp88hQnF7XleAxRH6YCwDRZ
	Tncb89aUWh0dmsih1HbrxTkk1qsIRNSuXt0QolHJUkwgHcuU5jyf3kG5s8uqwicwWh0wP39UGAg4G
	hPQK7T7sxXSy2RNM2Saty2QZa7NMICRKmQiBluq7Ea50Q1zFwliK8djRBoayye7ZgXJILAG4hdeBI
	YoMgVLDOH7lfIKPQtzM+ieWyvKWPg3yJ1glgY5iDfFghHv4PGbwWzkRDQLng7eNigx155kfROhFfL
	KaxcZ7IKOaOFhGLZkplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItVN-0000000DQta-3lCk;
	Wed, 04 Dec 2024 17:49:41 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInkf-0000000CPqi-1R2i;
	Wed, 04 Dec 2024 11:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733312466; x=1764848466;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=L3N4xnB4hpUkX70oEIl5ay7oOHjK5rWVH5VO26SBMRE=;
  b=UO/tm47s00ne6mK89oZltuzCB5p6jjyEPHhHVvRgfuI29sftogbwKg3G
   wpwlV6UvfJS3JsKr4zxAlg65kThmr5azehCDfE/XmDTY5q97IBfSbrnp5
   QHlOpAMN7tk78+aXQG07OXu8AUgBJ9gqxWMx6a+mFKKYYOySROpk/yt59
   4=;
X-IronPort-AV: E=Sophos;i="6.12,207,1728950400"; 
   d="scan'208";a="475378494"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 11:40:58 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.17.79:59262]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.10.207:2525] with esmtp (Farcaster)
 id 52e49eb4-420c-4db9-a56f-779f9c594c75; Wed, 4 Dec 2024 11:40:55 +0000 (UTC)
X-Farcaster-Flow-ID: 52e49eb4-420c-4db9-a56f-779f9c594c75
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 4 Dec 2024 11:40:55 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 11:40:55 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Wed, 4 Dec 2024 11:40:55 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Jiri Slaby <jirislaby@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
	<bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
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
Thread-Index: AdtGQRkhPCy0bAvuc0C5GQef/95iog==
Date: Wed, 4 Dec 2024 11:40:55 +0000
Message-ID: <4192766c8f02494a82db68f5732c6dd2@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.143.173]
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_034105_594502_02D50B68 
X-CRM114-Status: GOOD (  13.05  )
X-Mailman-Approved-At: Wed, 04 Dec 2024 09:49:40 -0800
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

On 12/4/2024 1:02 PM, Jiri Slaby wrote:
>> +
>> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>> +     bool "Clear forwarded VM interrupts during kexec"
>> +     default n
>> +     help
>> +       When enabled, this option allows the kernel to clear the active state
>> +       of interrupts that are forwarded to virtual machines (VMs) during a
>> +       machine kexec. For interrupts that are not forwarded, if supported,
>> +       the kernel will attempt to trigger an End of Interrupt (EOI).
>
> This caught my attention. It looks like you want to allow people toggling it? I believe only arch code should turn it on as you do by "select", not users.

Thomas Gleixner has also commented about it:
"
This should not be user selectable. Just keep it as:

config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
        bool

which defaults to 'n'. Just add a comment what this is about like it's done with the other options in that file which are only selectable.
"

I will fix it in v6.
I'm just waiting for a reply if the new configuration option should be
placed inside or after the following section:
```
menu "IRQ subsystem"

endmenu
```

Thanks, Eliav
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
