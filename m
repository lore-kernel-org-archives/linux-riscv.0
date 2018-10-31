Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EE8C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 18:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29CA420657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 18:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DB+SYL9b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qK9hIU6z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29CA420657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R5p2/f1Kuluo03GZvg05ymnegnLD5lOaBHAXUy95iFo=; b=DB+SYL9b4szafqT9zHhZ8qxyVH
	BHrMPPfO/gV7T9vGunipzyBtWhoP8WvUsuzjaLYhPnozUaZDtAvpDGxnq/iHAAc0ho1JaSSyUxnSf
	zuzJdLlt1Vk2CRfWWCRyUmq3+X75zf3ptfSF4tj8jX7F05++Ct+0VPmPEDjXCjXT4BioLRN/hFcdb
	dvBwD87+e8bGOxtRWuRLJKURTNFxxiJhY0I5aRwc03zUN6fXj/lVySR27lZgA3VwCpczDtvqupUQy
	dAiHnzi50IaNyEerD98FnzO01BstCSeRZRSnhteTbDG6xyy8UlucioZMuCQz1xtQUqVtS1gwwRbfJ
	olcJVmTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHv9k-0007q3-Du; Wed, 31 Oct 2018 18:23:52 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHv9h-0007ox-7G
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 18:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541010230; x=1572546230;
 h=from:to:cc:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=EEnRTh0hRgcf6EzvA5WK+PKpWvqM/9NsnX3kykIESow=;
 b=qK9hIU6zoewOMGTzlTPinA6g0AuKiJSIPYZqutmAyawiJbjK++8rXNze
 VJZiHhnX3zyU4l3oYxU7hUgGj/MazPPpFi+MYfWjjsxLeqqlroPdfrz6p
 FSEwARVJ/RBhh/g1VAelx8KtPWlU6lyHbXD6YBjgo7b/0+V1bTIWmsQnC
 PKUz+XxKMVL/3g73rzafN/YWeQNdb0LdfrBDzF/f/fVUAUOO38GS8w/rK
 eCtyyeYpIcA/ZPzu5Nf11/mx1+qzsZXGHA3gI5wKEtubKRTqO2XGEOWpI
 AOtCq3TBji8b9hD5MpshKJVRkD2iF9WdGQ47TJwLKTSRZTuG3gpJsnJmQ w==;
X-IronPort-AV: E=Sophos;i="5.54,447,1534780800"; d="scan'208";a="94347933"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Nov 2018 02:23:37 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 31 Oct 2018 11:07:23 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 Oct 2018 11:23:36 -0700
From: Atish Patra <atish.patra@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: SBI extension proposal
Message-ID: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
Date: Wed, 31 Oct 2018 11:23:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_112349_402770_1E94AC9F 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Zong Li <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>, Andrew Waterman <andrew@sifive.com>,
 Alan Kao <alankao@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "Rwmjones.fedora" <rjones@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 "vincentc@andestech.com" <vincentc@andestech.com>,
 Michael Clark <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, "Chang,
 Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>,
 David.Abdurachmanov@cern.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031182335.KF-rBtLMJg44fJj-2aZ79w-uHP5wYS7kyaVEBPV403E@z>

Here is a proposal to make SBI a flexible and extensible interface.
It is based on the foundation policy of RISC-V i.e. modularity and
openness. It is designed in such a way that it introduces very few new
mandatory SBI APIs that are absolutely required to maintain backward
compatibility. Everything else is optional so that it remains an open
standard yet robust.

1. Introduction:
----------------
The current RISC-V SBI only defines a few mandatory functions such as
inter-processor interrupts (IPI) interface, reprogramming timer, serial
console and memory barrier instructions. The existing SBI documentation
can be found here [1]. Many important functionalities such as power
management/cpu-hotplug are not yet defined due to difficulties in
accommodating modifications without breaking the backward compatibility
with the current interface.

Its design is inspired by Power State Coordination Interface (PSCI) from
ARM world. However, it adds only two new mandatory SBI calls providing
version information and supported APIs, unlike PSCI where a significant
number of functions are mandatory. The version of the existing SBI will
be defined as a minimum version(0.1) which will always be backward 
compatible. Similarly, any Linux kernel with newer feature will fall 
back if an older version of SBI does not support the updated 
capabilities. Both the operating system and SEE can be implemented to be 
two way backward compatible.

2. New functions:
-----------------

-- u32 sbi_get_version(void):

Returns the current SBI version implemented by the firmware.
version: uint32: Bits[31:16] Major Version
              Bits[15:0] Minor Version

The existing SBI version can be 0.1. The proposed version will be at 0.2
A different major version may indicate possible incompatible functions.
A different minor version must be compatible with each other even if
they have a higher number of features.

-- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):

Accepts a start_api_id as an argument and returns if start_api_id to
(start_api_id + count - 1) are supported or not.
The API numbering scheme is described in section 3.

A count is introduced so that a range of APIs can be checked at one SBI
call to minimize the M-mode traps.

-- int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
long priv)

Brings up "hartid" either during initial boot or after a sbi_hart_down
SBI call.

"start" points to a runtime-specified address where a hart can enter
into supervisor mode. This must be a physical address.

"priv" is a private data that caller can use to pass information about
execution context.

Return the appropriate SBI error code.

-- int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
long priv)

Suspends the calling hart to a particular power state. Suspended hart
will automatically wake-up based on some wakeup events at resume_entry
physical address.

"priv" is a private data that caller can use to pass information about
execution context. The SBI implementation must save a copy so that
caller can reuse while restoring hart from suspend.

Return the appropriate SBI error code.

-- int sbi_hart_down()

It powers off the hart and will be used in cpu-hotplug.
Only individual hart can remove itself from supervisor mode. It can be
moved to normal state only by sbi_hart_up function.

Return the appropriate SBI error code.

-- u32 sbi_hart_state(unsigned long hartid)

Returns the RISCV_POWER_STATE for a specific hartid. This will help make
kexec like functionality more robust.

-- void sbi_system_shutdown()

Powers off the entire system.

3. SBI API ID numbering scheme:
------------------------------
An API Set is a set of SBI APIs which collectively implement some
kind of feature/functionality.

Let's say SBI API ID is u32  then
Bit[31:24] =  API Set Number
Bit[23:0] = API Number within API Set

Here are few API Sets for SBI v0.2:
1. Base APIs
API Set Number: 0x0
Description: Base APIs mandatory for any SBI version

2. HART PM APIs
API Set Number: 0x1
Description: Hart UP/Down/Suspend APIs for per-Hart
power management

3. System PM APIs
API Set Number; 0x2
Description: System Shutdown/Reboot/Suspend for system-level
power management

4. Vendor APIs
API Set Number: 0xff
Description: Vendor specific APIs.
There is a possibility that different vendors can choose to assign same 
API numbers for different functionality. In that case, vendor specific 
strings in Device Tree can be used to verify if a specific API belongs 
to the intended vendor or not.

4. Return error code Table:
---------------------------

Here are the SBI return error codes defined.

       SBI_SUCCESS           0
       SBI_NOT_SUPPORTED    -1
       SBI_INVALID_PARAM    -2
       SBI_DENIED           -3
       SBI_INVALID_ADDRESS  -4

A mapping function between SBI error code & Linux error code should be
provided.

5. Power State
--------------

A RISC-V core can exist in any of the following power states.

enum RISCV_POWER_STATE {
        //Powered up & operational.
        RISCV_HART_ON              =  0,
        //Powered up but at reduced energy consumption. WFI instruction
can be used to achieve this state.
        RISCV_HART_STANDBY        =   1,
        //Deeper low power state. No reset required but higher wakeup
latency.
        RISCV_HART_RETENTION       =  2,
        //Powered off. Reset of the core required after power restore.
        RISCV_HART_OFF             =  3
}

TODO:
Any other power management related features or state?

6. Implementation
-------------------
Currently, SBI is implemented as a part of BBL. There is a different SBI 
implementation available in coreboot as well.

Alternatively, a separate open BSD/MIT licensed SBI project can be 
created which can be used by anybody to avoid these kind of SBI 
fragmentation in future. This project can generate both a firmware 
binary (to executed directly in M mode) or a static library that can be 
used by different boot loaders. It will also help individual boot 
loaders to either work from M or S mode without a separate SBI 
implementation.

This proposal is far from perfect and absolutely any suggestion is
welcome. Obviously, there are many other functionalities that can be
added or removed from this proposal. However, I just wanted to start
with something that is an incremental change at best to kick off the
discussion. The aim here is initiate a discussion that can lead to a 
robust SBI specification.

Looking forward to discuss other ideas as well or any feedback on this 
proposal.

Reference:
-----------
[1]
http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf
[2] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.md


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
