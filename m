Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC023C83F0A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1/iHBqlRZ379Nz+m+FpyKChCGqec84000bibRdT2ow=; b=cuCGnGJMzbrl2k
	yBd/N9he2oniJpgVvv6Dgd5oNKMDNdKy6XrxieMQileC7ZeCu6Z5QMmv15SMTIx4FhYkmFFr0NnPn
	P+tRZbFHUVKhXX9iSEoqSypzTOTP6x6ts3h+0M95D0PH+wTv2+GXjShVljqXIA7KKSdWYsGC5M0kJ
	Lirh1TP0y5M/cNQ8OvlYZBUMjsv0r7zNWG/kBwmZp1DhCn7XmgOYz3eu5NMIZyROz1sHuPzCQIY99
	F2polraitRGMS6FlT49vWihrwu3YXPevF/17Im2PnLBrZI8PnjtMYy31z92fA911JDo/Um+JLthP1
	am3+9i8bDE4vZpIehX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8aH-00000005TJL-328v;
	Tue, 08 Jul 2025 13:42:09 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8M5-00000005R0c-2CHz
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 13:27:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27AF2441C0;
	Tue,  8 Jul 2025 13:27:23 +0000 (UTC)
Message-ID: <9bf5fc76-4bb2-4baf-88fe-e593b451f0ff@ghiti.fr>
Date: Tue, 8 Jul 2025 15:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] riscv: kprobes: Clean up instruction simulation
To: Nam Cao <namcao@linutronix.de>, patchwork-bot+linux-riscv@kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <cover.1747215274.git.namcao@linutronix.de>
 <174904758698.2309006.9940004806769596353.git-patchwork-notify@kernel.org>
 <20250708102537.VovauOQC@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250708102537.VovauOQC@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepteetuddtkeffiefgjeffffefgfekffefteffgfffveffleeiieeufffffefhtddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgnecukfhppedukeehrddvudefrdduheegrddugeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudegfedphhgvlhhopegluddtrddugedrtddruddungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgrthgthhifohhrkhdqsghothdolhhinhhugidqrhhishgtvheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghul
 hdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_062729_696131_71F11A97 
X-CRM114-Status: GOOD (  14.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Nam,

On 7/8/25 12:25, Nam Cao wrote:
> On Wed, Jun 04, 2025 at 02:33:06PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:
>> Hello:
>>
>> This series was applied to riscv/linux.git (for-next)
>> by Alexandre Ghiti <alexghiti@rivosinc.com>:
>>
>> On Wed, 14 May 2025 11:38:39 +0200 you wrote:
>>> Hi,
>>>
>>> There is some instruction-processing code in kprobes simulate code. These
>>> code should be insn.h. In fact, most of them is duplicating insn.h.
>>>
>>> This series remove the duplicated bits and make use of macros already
>>> defined in insn.h. The non-duplicated bits are moved into insn.h.
>>>
>>> [...]
>> Here is the summary with links:
>>    - [v2,01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
>>      https://git.kernel.org/riscv/c/d29656bab74c
>>    - [v2,02/11] riscv: kprobes: Move branch_funct3 to insn.h
>>      https://git.kernel.org/riscv/c/da6de46c2eed
>>    - [v2,03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
>>      https://git.kernel.org/riscv/c/6d47d903b18f
>>    - [v2,04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
>>      https://git.kernel.org/riscv/c/5cefc323f32a
>>    - [v2,05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
>>      https://git.kernel.org/riscv/c/a285674909ae
>>    - [v2,06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
>>      https://git.kernel.org/riscv/c/c7196c136e29
>>    - [v2,07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
>>      https://git.kernel.org/riscv/c/768007ca3fe8
>>    - [v2,08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
>>      https://git.kernel.org/riscv/c/f2c715fff676
>>    - [v2,09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
>>      https://git.kernel.org/riscv/c/284ca2a100de
>>    - [v2,10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
>>      https://git.kernel.org/riscv/c/a60c2933ec74
>>    - [v2,11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
>>      https://git.kernel.org/riscv/c/ee4c45f5cbeb
> This series was dropped from 6.16 due to conflict. Can it be re-applied? It
> applies cleanly to riscv/for-next.
>
> The same story for:
> https://lore.kernel.org/linux-riscv/174904758974.2309006.8809303189389627595.git-patchwork-notify@kernel.org/


Yes, I have both in my for-next branch, sorry I did not advertise that 
(I'm working on it).

FYI, I have enabled kunit tests in the upstream kernel CI: 
https://github.com/linux-riscv/linux/actions/runs/15967114709/job/45030410210?pr=571#step:5:625

Thanks,

Alex


>
> Best regards,
> Nam
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
