Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E30C369A8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROpMHFMZxPZJaaNM/AyhRSo4BksvBfa10WpLNGywNLQ=; b=cUFzc3yArBBM4k
	hlKKg5lawD/YoofKMjo2jThfgdsP+2Fa9Ogqq0a+qWwmIs3q7Oz321HaiART8RDLVL7m2PoBiFnqq
	h/M5mmHhwjHdEkXQfWFpl8iAvvg9cqCtLdOxcCedvUHlV+A1B8FEGsd35jGt+ntpNHwmWLIIctW72
	pJnaMh3SqHo4Pudh71D2YbgSFC8bzmM99wn8MoJCJ4JcH9uNiQm4djXJmmbxJjx20lOlNqCJ79Hbd
	G4rbaq6H5CkxT3DB8lGfIwqqyAQAplloNAdxOXR7gO0wbtHoNHT0bsw98XTc3iQ9bLI9kmGgXoXL/
	h8Z451ajE+2btpIkKmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u388L-0000000Cllp-188M;
	Fri, 11 Apr 2025 06:45:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37lj-0000000Ci01-36ry
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Apr 2025 06:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rVT8LKbU3fSlAY+4wTZXMe+j9MMekeeXuA3OF9rjvUs=; b=IxTafeylEcAtpq7Qr7FDZMoTjZ
	haPWC5hviw+UeRXu+Bl0r2lNaX4QG4EJPOTKYwwte1A07gRzasXMAeEKW0z8137gmlwXKJ7P1n7WX
	0VGYQESSF/ShOPbrzaTEshst3HNIy27kfSygKfoleliwQPwnSIzolVSw1LFwbVkMyAkmDoKdPY86s
	1lmzch0qX8o4kx7fXLs+Or+mrqqg57l1tHrwtSgNbFq2KN012ofbPFTi31a+WtCuZlxxpiJHyL7f2
	PRbi8hsNbpsWWPoAwD09blE2NtrHcscsedmQSI3CZYXIcEMq+lGI37TVjRGNVa9KFkMCE1Z8logyg
	2gvkLcUw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u37lg-00000008vtn-1IuT
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 06:21:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 261264435A;
	Fri, 11 Apr 2025 06:21:26 +0000 (UTC)
Message-ID: <23693e7f-4fff-40f3-a437-e06d827278a5@ghiti.fr>
Date: Fri, 11 Apr 2025 08:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Content-Language: en-US
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
 <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
 <3A22DFCBC7B91F71+320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <3A22DFCBC7B91F71+320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopeifrghnghihuhhlihesuhhnihhonhhtvggthhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvs
 ehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrtghhvghnsehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072136_902770_4CDA6551 
X-CRM114-Status: GOOD (  16.68  )
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

Hi WangYuli,

On 10/04/2025 16:28, WangYuli wrote:
> Hi Alex
>
> On 2025/4/10 21:42, Alexandre Ghiti wrote:
>> Hi WangYuli,
>>
>>
>> You forgot to replace kgdb_breakinst into kgdb_compiled_break.
>
> OK, I'll fix it.
>
> Thanks,
>
>>
>> You are fixing 2 things here, you need to split this patch into 2. 
> OK,
>> And as noted by Palmer, we actually don't need norvc here, so you can 
>> remove it instead.
>
> I have some questions regarding this.
>
> If .option norvc is unnecessary, what is the significance of .option 
> push/.option pop?
>
> Should they also be removed as well?


Yes, you can remove them.


>
> However, will this still function properly when the RISC-V C extension 
> is active?


.option norvc is used to prevent the assembler from using compressed 
instructions, but it's generally used when we need to ensure the size of 
the instructions that are used, which is not the case here as noted by 
Palmer since we only care about the address. So yes it will work fine 
with C enabled :)


>
>
> Thanks,
>

Thanks for the changes!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
