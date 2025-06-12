Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B90C7114A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bgv9jmJ/6V4QHTLPkRvsKdkVjfqKSLAPmOFILB9u+GM=; b=mg1d3+mjNIw2zR
	oqg4IZuWhYuXp410I5aQ+j9hBbYQOm+xDeTgYNkOk1FlS6u6rtvUZ2qzr9boWbCPLYcWHZYRoPaQU
	0MMzq3yEpgRPiUlQ8hlhhXVqLTB/oN2ekkkqF9spsajurhxFHcE+Y9LhKhnXgPJuonb4e2zdBOZvQ
	EXNLcu4gjgX1ix1KWPXBOQGiJ0anBB5TjxNPOftzP0KmFLk6sggsWS+PqeoQJ2Hw/kivfUph4C5wy
	YMVP6ku6KrdJKCUftp/iBAWU3INCDEv/aaQwTOc+WzhkfYrzp+G1+o6W8uxbQTjZSWYvqGoq7Z68n
	LEJvxo4iEmIp69szzj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnmx-0000000EDio-0reG;
	Thu, 12 Jun 2025 19:40:39 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhj5-0000000DL9g-1pQ8
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:12:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C319431EB;
	Thu, 12 Jun 2025 13:12:09 +0000 (UTC)
Message-ID: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr>
Date: Thu, 12 Jun 2025 15:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guodong Xu <guodong@riscstar.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
 <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
 <20250612093227-GYA130879@gentoo>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250612093227-GYA130879@gentoo>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopegulhgrnhesghgvnhhtohhordhorhhgpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepp
 hgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehguhhoughonhhgsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061215_623722_CA52A434 
X-CRM114-Status: GOOD (  13.94  )
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

On 6/12/25 11:32, Yixun Lan wrote:
> Hi Alexandre,
>
> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
>> Hi Yixun,
>>
>> On 6/11/25 16:56, Yixun Lan wrote:
>>> Changes to defconfig should be always updated via 'make
>>> savedefconfig', run this command to make it aligned again.
>>>
>>> This will ease the effort of reviewing changes of defconfig
>>> in the future.
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> Update PDMA config bring in unnecessary changes[1], let's fix
>>> it by run savedefconfig first.
>>
>> It would be easier if this patch was part of the PDMA series since the
>> last patch will depend on it: @Guodong can you integrate this patch to
>> your next revision of your patchset?
>>
> I'd rather make this patch independent, as nothing strongly ralated with PDMA,
> and it probably would take several rounds for PDMA patch to be settled down..
>
> Besides, there is no problem for PDMA patch to depend on this patch if
> needed (easy to use b4 to handle this..)
>
> The idea here is to get this patch merged as early as possible, as it's
> quite straightforward, and other people may have similar problem instead
> of PDMA here


Ok makes sense, so let's Guodong deal with that then.

Thanks,

Alex


>
>> Thanks,
>>
>> Alex
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
