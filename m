Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152B6C3ABCC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3cTkutG+IgMN8DbnzoQGOrz6vRp9m/U6gn9WIHK9SE=; b=usU2S3BXFdNuT+
	B0zFIKHnmfQakXsqrVI6nxT4NHr1tvMxL7ubXM4qLJVF28R2EtTwnG/3Vyx7gBMReQ+7Q4mXdKwOK
	tjecbsnEX49wm2ssM1tCTz+CS6Gae8iUVS4qXGFO9OphcRv5bQ6nQpW96iJYb5Tzy4GUl6WbB7A2c
	I3mPOBVE8jDF7V3HhhPSbNd92W559OSmCnIm1+xd/IXjgV5/wo99/8xAgExB+RHX3AgyFlfib6d/+
	SuUMQPaviOqwKtNLMs22Ka/rxH8qsd7faUiHMDOV1xq9VFmlTFUSNPSFqVcTg5ilCmKP8M+0bZ5QG
	gBYQEZ6QEdHqzm+X0Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnys-0000000CH81-1Eyd;
	Tue, 13 May 2025 11:39:30 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnyo-0000000CH6k-39Yq
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 11:39:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D84DA43AD2;
	Tue, 13 May 2025 11:39:15 +0000 (UTC)
Message-ID: <da18536c-cb40-42f4-a097-2e8a03780dc9@ghiti.fr>
Date: Tue, 13 May 2025 13:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5] raid6: Add RISC-V SIMD syndrome and recovery
 calculations
Content-Language: en-US
To: Chunyan Zhang <zhang.lyra@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: zhangchunyan@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Charlie Jenkins <charlie@rivosinc.com>,
 song@kernel.org, yukuai3@huawei.com, linux-riscv@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305083707.74218-1-zhangchunyan@iscas.ac.cn>
 <mhng-63c49bc7-0f86-47f7-bc41-0186f77b9d6f@palmer-ri-x1c9>
 <CAAfSe-vD_37uihLjGwOqQKnyKJaJ36OwxDeocMOhK4s6-cpzAA@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAAfSe-vD_37uihLjGwOqQKnyKJaJ36OwxDeocMOhK4s6-cpzAA@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetieeitefghfeuvddvjeeiudehheeiffffgeeviedtleehgeffgfdtveekteehudenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegttddvgeemvgefgeeimeefjeekudemrgejieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegttddvgeemvgefgeeimeefjeekudemrgejieehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegttddvgeemvgefgeeimeefjeekudemrgejieehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeiihhgrnhhgrdhlhihrrgesghhmrghilhdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopeiih
 hgrnhhgtghhuhhnhigrnhesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihuhhkuhgrihefsehhuhgrfigvihdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_043926_941785_5D51FEE5 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Chunyan,

On 08/05/2025 09:14, Chunyan Zhang wrote:
> Hi Palmer,
>
> On Mon, 31 Mar 2025 at 23:55, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Wed, 05 Mar 2025 00:37:06 PST (-0800), zhangchunyan@iscas.ac.cn wrote:
>>> The assembly is originally based on the ARM NEON and int.uc, but uses
>>> RISC-V vector instructions to implement the RAID6 syndrome and
>>> recovery calculations.
>>>
>>> The functions are tested on QEMU running with the option "-icount shift=0":
>> Does anyone have hardware benchmarks for this?  There's a lot more code
>> here than the other targets have.  If all that unrolling is necessary for
>> performance on real hardware then it seems fine to me, but just having
>> it for QEMU doesn't really tell us much.
> I made tests on Banana Pi BPI-F3 and Canaan K230.
>
> BPI-F3 is designed with SpacemiT K1 8-core RISC-V chip, the test
> result on BPI-F3 was:
>
>    raid6: rvvx1    gen()  2916 MB/s
>    raid6: rvvx2    gen()  2986 MB/s
>    raid6: rvvx4    gen()  2975 MB/s
>    raid6: rvvx8    gen()  2763 MB/s
>    raid6: int64x8  gen()  1571 MB/s
>    raid6: int64x4  gen()  1741 MB/s
>    raid6: int64x2  gen()  1639 MB/s
>    raid6: int64x1  gen()  1394 MB/s
>    raid6: using algorithm rvvx2 gen() 2986 MB/s
>    raid6: .... xor() 2 MB/s, rmw enabled
>    raid6: using rvv recovery algorithm
>
> The K230 uses the XuanTie C908 dual-core processor, with the larger
> core C908 featuring the RVV1.0 extension, the test result on K230 was:
>
>    raid6: rvvx1    gen()  1556 MB/s
>    raid6: rvvx2    gen()  1576 MB/s
>    raid6: rvvx4    gen()  1590 MB/s
>    raid6: rvvx8    gen()  1491 MB/s
>    raid6: int64x8  gen()  1142 MB/s
>    raid6: int64x4  gen()  1628 MB/s
>    raid6: int64x2  gen()  1651 MB/s
>    raid6: int64x1  gen()  1391 MB/s
>    raid6: using algorithm int64x2 gen() 1651 MB/s
>    raid6: .... xor() 879 MB/s, rmw enabled
>    raid6: using rvv recovery algorithm
>
> We can see the fastest unrolling algorithm was rvvx2 on BPI-F3 and
> rvvx4 on K230 compared with other rvv algorithms.
>
> I have only these two RVV boards for now, so no more testing data on
> more different systems, I'm not sure if rvv8 will be needed on some
> hardware or some other system environments.


Can we have a comparison before and after the use of your patch?

In addition, how do you check the correctness of your implementation?

I'll add whatever numbers you provide to the commit log and merge your 
patch for 6.16.

Thanks a lot,

Alex


>
> Thanks,
> Chunyan
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
