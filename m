Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667BDC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 02:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3380420855
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 02:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8LD6Nrx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UexMq+ET";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="P96fUM7g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3380420855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hNFQfdq9Nh9l5W90EYt+DlV555UCZGR3cgfJjC9IfpM=; b=J8LD6Nrx/zyYgcntButprBxUPx
	BoBbFHsgxrA0YeNGo4SzjjHgAfq2lqTHz8F34Ld7GJM699cVx5xaJ5CjKI/Iu6fePIEtQ4Epo5NLq
	EHEBsmbVAyNhvRamZv9zskWrjsh/kALbRWNrXwz9eJdC9qJgzFhfHKZJi4J4cLXxFUw7VLVwpsO5d
	BV5XYryHCcsQRR4HkWlbwlG+zH+0fQ9fxvlqVwbyTIPUW3TpRjQmJa2ElJi/D/hQ28eO7mSrnosez
	Lka01lyESZQzABTUnM2dcOdaL9fsEfLq6OzA+CC0d2XqswjW8rHIQ7juhDvGcvQj5gjEFE/ozFicT
	DNECoagQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLJEU-0001KQ-Kh; Sat, 10 Nov 2018 02:42:46 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLJES-0001Jx-NA
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 02:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:Cc:From:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VkqDqeMsvRuVUE/UEPqXBHSwjLZVwgHZqtc4Oc6e1CM=; b=UexMq+ETd7olx2z6oFLO+e329C
 61FyztGBVYNo1XaAhjlXRXoANyp4zjzAqqTL5j4qwqzJ8OnSyptpKO9Kragb+fWQCsvtXTQYK9rZ7
 gn9WfAsMx6EWC3+plxr/M1/hWgWbCJtioViUegnDUXUlujluSauWDgpuQh6yUI4TutS71/zqh8A19
 aXbOH/h1bT9IR5b+f4fPHTz0X3dDSSSdPwH2W0Ln3oc9qzrTQhE/AJ82PV+gAdeP8krFZU+83HVb9
 JsijYWtU4vhrlbVzsTVRfwbuJRRRMn0s+IJQiGuvMHqpKBISukC9wlaAF8+9ZAi5PcaWFnmu3wR1w
 Iem2Dkkw==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLJEP-0000mc-16
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 02:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541817761; x=1573353761;
 h=to:from:cc:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=k/9Dmrx0bpXKsga94Mjm2HlmMbDBdujPgFn0uC43UgM=;
 b=P96fUM7gffEZW6R20bT7K9MlOuX3R+wHRma8KvdJDEVKBeudb3otBkTm
 LSchbWmw8w0h5l2f39dthTEN4FIetVH3hmfAq6C2AmPhydinoIJe0E3jB
 95Kz5cKy5SQMjQUZgwfHJrT++WNZOIG6aq1IajACOiDg87U85ifo1MLPo
 jTDdxwPs+IYTTYWh2Zq/HGpLtmC0yKrYu22gWFJ2IABRAa285P/7YqqM1
 /P7mHqZb9fWx5I/bdB/MxmFLIYRW62mzdMyzBaX9jTAZZ1SxHwV25BMOD
 PC+ugZBW5v16Am6oA3ZjM2dTBJQNB18QFfwbo/r8pCvr5bNTuPuIsdu2Y w==;
X-IronPort-AV: E=Sophos;i="5.54,485,1534780800"; d="scan'208";a="95064230"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2018 10:42:26 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 09 Nov 2018 18:25:58 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Nov 2018 18:42:25 -0800
To: "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Subject: SBI extension proposal v2
Message-ID: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
Date: Fri, 9 Nov 2018 18:42:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_214241_310635_69245677 
X-CRM114-Status: GOOD (  29.38  )
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
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "olof.johansson@gmail.com" <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 Zong Li <zong@andestech.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, "andrew@sifive.com" <andrew@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110024224.40ZGrGVLJX-UatIzgCH63xe-d3xdD1W2BsJBuAl9GIA@z>

Hi,
I have updated the proposal based on feedback received on previous 
version. This version has a better scalable SBI Function ID
numbering scheme. I have adopted markdown formatting for github docs.

If you prefer a github interface, it's available here as well.

https://github.com/riscv/riscv-sbi-doc/pull/12

Looking forward to your feedback.

Regards,
Atish
------------------------------------------------------------------------

## Introduction:
This is a proposal to make SBI a flexible and extensible interface.
It is based on the foundation policy of RISC-V i.e. modularity and
openness. The proposal tries to introduces very few new mandatory SBI 
Functions, that are absolutely required to maintain backward 
compatibility. Everything else is optional so that it remains an open 
standard yet robust.

The current RISC-V SBI only defines a few mandatory functions such as
inter-processor interrupts (IPI) interface, reprogramming timer, serial
console, and memory barrier instructions. The existing SBI documentation
can be found here [1]. Many important functionalities such as power
management/cpu-hotplug are not yet defined due to difficulties in
accommodating modifications without breaking the backward compatibility
with the current interface.

The proposed design is inspired by Power State Coordination Interface 
(PSCI) from ARM world. However, it adds only two new mandatory SBI calls 
providing version information and supported Functions, unlike PSCI where 
a significant number of functions are mandatory. The version of the 
existing SBI will be defined as a minimum version(0.1) which will always 
be backward compatible. Similarly, any Linux kernel with a newer feature 
will fall back if an older version of SBI does not support the updated 
capabilities. Both the operating system and SEE can be implemented to be 
two way backward compatible.

## SBI Calling Conventions (TODO)
There are some suggestions[3] to distinguish between SBI function return 
value and SBI calling sequence return value. Here are the few possible 
discussed ideas.

1. Return a single value, but values in the range {-511, -1} are 
considered errors, whereas return values in the range {0, 2^XLEN-512} 
are considered success.

2. Every SBI function call may return the following structure
```
struct valerr {
   long value;
   long error;
};
```
According to the RISC-V ABI spec[4], both a0 & a1 registers can be used 
for function return values.

3. Introduce an extra argument that can return error by reference.
```
/* Returns the CPU that was started.
  * @err indicates an error ID if one occurred, otherwise 0.
  * @err can be NULL if no error detection is required.
*/
int start_cpu(int cpu_num,..., Error *err);
```
Both approaches (2 & 3) will work, but there will be two versions of 
existing SBI functions to maintain the compatibility.

## SBI Functions:

A SBI function is an individual feature that SBI interface provides to 
supervisor mode from machine mode. Each function ID is assigned as per 
below section.

#### SBI Function ID numbering scheme:
A Function Set is a group of SBI functions which collectively implement 
similar kind of feature/functionality. The function ID numbering scheme 
need to be scalable in the future. At the same time, function validation 
check should be as quick as possible. Keeping these two requirements in 
mind, a hybrid function ID scheme is proposed.

SBI Function ID is u32 type.

```
31            24                        0
-----------------------------------------
|O|            |                        |
-----------------------------------------
Function Set   | Function Type          |
```
Bit[31]    =  ID overflow bit

Bit[30:24] =  Function Set

Bit[23:0]  =  Function Type within Function Set

The Function set is Bits [31:24] describing both function set number and 
overflow bit. In the beginning, the overflow bit should be set to 
**zero** and the function Type per function set can be assigned by left 
shifting 1 bit at a time. The overflow bit can be set to one **only** 
when we need to allocate more than 24 functions per function set in 
future. Setting the overflow bit will indicate an integer function type 
scheme. Thus, there will more than enough function IDs available to use 
in the future. Refer appendix 1 for examples.

Here are few Function Sets for SBI v0.2:

| Function Set         | Value  | Description 
       |
| -------------------  |:------:| 
:--------------------------------------------|
| Base Functions       | 0x00   | Base Functions mandatory for any SBI 
version |
| HART PM Functions    | 0x01   | Hart UP/Down/Suspend Functions for 
per-Hart power management|
| System PM Functions  | 0x02   | System Shutdown/Reboot/Suspend for 
system-level power management|
| Vendor Functions     | 0x7f   | Vendor specific Functions|

N.B. There is a possibility that different vendors can choose to assign 
the same function numbers for different functionality. That's why vendor 
specific strings in Device Tree/ACPI or any other hardware description 
document can be used to verify if a specific Function belongs to the 
intended vendor or not.

# SBI Function List in both SBI v0.2 and v0.1

|Function Type              | Function Set      | ID(v0.2)     |ID (v0.1)  |
|---------------------------| ------------------|:------------:|:---------:|
| sbi_set_timer             | Base              | 0x00 000000  |0          |
| sbi_console_putchar       | Base              | 0x00 000001  |1          |
| sbi_console_getchar       | Base              | 0x00 000002  |2          |
| sbi_clear_ipi             | Base              | 0x00 000004  |3          |
| sbi_send_ipi              | Base              | 0x00 000008  |4          |
| sbi_remote_fence_i        | Base              | 0x00 000010  |5          |
| sbi_remote_sfence_vma     | Base              | 0x00 000020  |6          |
| sbi_remote_sfence_vma_asid| Base              | 0x00 000040  |7          |
| sbi_shutdown              | System PM         | 0x02 000000  |8          |
| sbi_system_reset          | System PM         | 0x02 000001  |-          |
| sbi_get_version           | Base              | 0x00 000080  |-          |
| sbi_get_function_mask     | Base              | 0x00 000100  |-          |
| sbi_get_function_count    | Base              | 0x00 000200  |-          |
| sbi_hart_up               | Hart PM           | 0x01 000000  |-          |
| sbi_hart_down             | Hart PM           | 0x01 000001  |-          |
| sbi_hart_suspend          | Hart PM           | 0x01 000002  |-          |
| sbi_hart_state            | Hart PM           | 0x01 000004  |-          |

#### Function Description

This section describes every newly introduced(in v0.2) function in 
details. Please refer to [1] for any v0.1 functions.

```
u32 sbi_get_version(void):
```
Returns the current SBI version implemented by the firmware.
version: uint32: Bits[31:16] Major Version
              Bits[15:0] Minor Version

The existing SBI version can be 0.1. The proposed version will be at 0.2
A different major version may indicate possible incompatible functions.
A different minor version must be compatible with each other even if
they have a higher number of features.

```
u32 sbi_get_function_mask(u32 ftype)
```
Given a function set type, it returns a bitmask of all functions IDs 
that are implemented for that function set.

```
u32 sbi_get_function_count(u32 ftype, u32 start_fid, unsigned long count):
```

This is a **reserved** function that should only be used if overflow bit 
in SBI function ID is set.

Accepts a start_Function_id as an argument and returns if 
start_Function_id to (start_Function_id + count - 1) are supported or not.

A count can help in minimizing the number of the M-mode traps by 
checking a range of SBI functions together.

```
int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
long priv)
```
Brings up "hartid" either during initial boot or after a sbi_hart_down
SBI call.

"start" points to a runtime-specified address where a hart can enter
into supervisor mode. This must be a physical address.

"priv" is a private data that caller can use to pass information about
execution context.

Return the appropriate SBI error code.

```
int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
long priv)
```
Suspends the calling hart to a particular power state. Suspended hart
will automatically wake-up based on some wakeup events at resume_entry
physical address.

"priv" is a private data that caller can use to pass information about
execution context. The SBI implementation must save a copy so that
caller can reuse while restoring hart from suspend.

Return the appropriate SBI error code.

```
int sbi_hart_down()
```
It powers off the hart and will be used in cpu-hotplug.
Only individual hart can remove itself from supervisor mode. It can be
moved to normal state only by sbi_hart_up function.

Return the appropriate SBI error code.

```
u32 sbi_hart_state(unsigned long hartid)
```
Returns the RISCV_POWER_STATE for a specific hartid. This will help make
kexec like functionality more robust.

```
void sbi_system_reset(u32 reset_type)
```
Reset the entire system.

## Return error code Table:
Here are the SBI return error codes defined.

| Error Type               | Value  |
| -------------------------|:------:|
|  SBI_ERR_SUCCESS         |  0     |
|  SBI_ERR_FAILURE         | -1     |
|  SBI_ERR_NOT_SUPPORTED   | -2     |
|  SBI_ERR_INVALID_PARAM   | -3     |
|  SBI_ERR_DENIED          | -4     |
|  SBI_ERR_INVALID_ADDRESS | -5     |


## Power State
A RISC-V core can exist in any of the following power states.

| Power states         | Value  | Description 
       |
| ------------------- 
|:------:|:---------------------------------------------|
| RISCV_HART_ON        | 0      | Powered up & operational. 
       |
| RISCV_HART_STANDBY   | 1      | Powered up but at reduced energy <br> 
consumption WFI instruction can be used to achieve this state|
| RISCV_HART_RETENTION | 2      | Deeper low power state. No reset <br> 
required but higher wakeup latency|
| RISCV_HART_OFF       | 3      | Powered off. Reset of the core 
required after power restore|

**_TODO_**:

We probably also need deeper hart power states or system-level power 
state reporting at some point, and non-HART components (caches, memory, 
etc).  Likely aligned with platform specs, once those start to show up.

## Implementation
Currently, SBI is implemented as a part of BBL. There is a different SBI 
implementation available in coreboot as well.

Alternatively, a separate open BSD/MIT licensed SBI project can be 
created that can be used by anybody to avoid this kind of SBI 
fragmentation. This project can generate both a firmware binary (to be 
executed directly in M mode) or a static library that can be used by 
different boot loaders. It will also help individual bootloaders
to either work from M or S mode without a separate SBI implementation.

## Conclusion
This proposal is far from perfect and absolutely any suggestion is 
welcome. Obviously, there are many other functionalities that can be 
added to this proposal. However, I just wanted to start with something 
that is an incremental change at best to kick off the discussion. The 
aim here is to initiate a discussion that can lead to a robust SBI 
specification.

## Reference:

[1] 
http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf

[2] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.md

[3] https://github.com/riscv/riscv-sbi-doc/pull/9

[4] https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

## Appendix

1. Overflow Reserved bit example.

Let's choose function set type as Hart PM (0x1)

Function1 : 0x01 000001<br>
Function2 : 0x01 000002<br>
Function3 : 0x01 000004<br>
.<br>
.<br>
.<br>
Function24:0x01 800000<br>

At this point in future, Let's say we need more function IDs for Hart 
PM. The scheme can be switched to an integer scheme by setting the 
overflow bit.

Function25: 0x81 000001<br>
Function26: 0x81 000002<br>
Function27: 0x81 000003<br>
Function28: 0x81 000004<br>
.<br>
.<br>
Function34: 0x81 00000A<br>
.<br>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
