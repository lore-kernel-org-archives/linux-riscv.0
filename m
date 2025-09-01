Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5DECA0FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBF01uod5qmu5RHlgXy7Hhqg4gZxlAqyPCdTE0qZEuQ=; b=i4wHL5tYP1PLPY
	KgpU2KcHqnCZsrc3x87Ght6wnbn6tlMY2Ma3hBW1j5t2oL07Ytm99jEeBiH8hky82znAgjosKKeMt
	FZm2In0pJxfswdU03XuRH/Y6D4T+teojGIrHT3S77KNq3CpJhlKYXyaxBid58A2FnMQ/U44eHcY6v
	JFcEDxQUAL9iQ5Vwqtam4SuvStusA9SkAEVk2I0qBSuLWMcx8uTpUhsJ70B9hQcx5zwzHwkonGRX5
	RZKXSFDJ9Kkm0YvKK88l4cw5rGMDvh6zGnBALYG8MG0wlDnUbkW4deIUjbdvxnz5LlOU7p1y/j0sY
	FjpKNMxEAFNPb8BcdFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1zx-0000000BwTK-1j6T;
	Mon, 01 Sep 2025 10:42:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut11l-0000000Bmqh-20lI;
	Mon, 01 Sep 2025 09:40:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E97E43294;
	Mon,  1 Sep 2025 09:40:35 +0000 (UTC)
Message-ID: <8bc8b5b9-30a5-4c2f-b7a2-8074f8321d56@ghiti.fr>
Date: Mon, 1 Sep 2025 11:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kexec: Fix invalid field access
To: Baoquan He <bhe@redhat.com>
Cc: Breno Leitao <leitao@debian.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Coiby Xu <coxu@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, kernel-team@meta.com
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
 <f7d55c91-8877-41aa-8cf0-64af38a9a109@ghiti.fr>
 <aLVhCuzhRTRnDytw@MiWiFi-R3L-srv>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <aLVhCuzhRTRnDytw@MiWiFi-R3L-srv>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledukedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudejiedrudegjedrudeghedrgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudegjedrudeghedrgeegpdhhvghloheplgduledvrdduieekrddurdduheelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlvghithgrohesuggvsghirghnrdhorhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegtohiguhesrhgvughhrghtrdgtohhmpdhrtghpthhto
 hepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_024041_650816_68C340D3 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

Hi Baoquan,

On 9/1/25 11:02, Baoquan He wrote:
> On 09/01/25 at 08:42am, Alexandre Ghiti wrote:
>> Hi Breno,
>>
>> On 8/27/25 12:42, Breno Leitao wrote:
> .....snip...
>> I see that the commit those patches fix is in 6.16 so we should add cc:
>> stable.
>>
>> And who should merge those patches? Should we do it on a per-arch basis?
> It's been in Andrew's akpm-mm/mm-hotfixes-unstable.


Great, thanks for letting me know.

Alex


>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
