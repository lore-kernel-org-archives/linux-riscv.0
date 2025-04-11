Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D327C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBN+zFvKfshdVc2FELBb4J8UDQChIFzW44QYTPtpjA8=; b=bE/cXzRoIcaeQI
	u2aEDm3zvtLy0leFHVKEX+jNQ3kOzl9McEo4Cd/f0534fyRkJA4zABmMByB1InA/hWGQNHYh5Mw4o
	TZ6dpqpNEJEtMRUmgPbe3Mtj5ErIVkKDa2YJgsXvbGS8zmz9rk2r0JNRW4YEvs03ebnnQeFJv7PRn
	k+RXkSkJUzvaoQddXXMlIYynKeRWDlPo3uqYUOZAAFnkuUmHoy09YeW6bGpqKGO2E+tjgR4KbRlDX
	GxRru+nC8pFAUCeSuSf92Og2LP1HXi9w8iI8BShHowvYhVT6dWJ1k98Jf6LMBj/kJrzr7B4LYFqNA
	QPTnxxCzidvuS39yOeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ca1-0000000DZ9V-3jGb;
	Fri, 11 Apr 2025 11:29:53 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CS5-0000000DXEZ-3IUm
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 11:21:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A5BA442BD;
	Fri, 11 Apr 2025 11:21:36 +0000 (UTC)
Message-ID: <fb65fc45-b1f1-47ef-b700-e90c6ef84957@ghiti.fr>
Date: Fri, 11 Apr 2025 13:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Amma Lee <lixiaoyun@binary-semi.com>,
 Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Maxim Kochetkov <fido_max@inbox.ru>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
References: <20250409171526.862481-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtohepphhinhhkvghshhdrvhgrghhhvghlrgesvghinhhfohgthhhiphhsrdgto
 hhmpdhrtghpthhtohepphhrihhtvghshhdrphgrthgvlhesvghinhhfohgthhhiphhsrdgtohhmpdhrtghpthhtohepuggrrhhshhgrnhdrphhrrghjrghprghtihesvghinhhfohgthhhiphhsrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_042141_978343_BC8124DB 
X-CRM114-Status: GOOD (  14.33  )
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

Hi Samuel,

On 09/04/2025 19:14, Samuel Holland wrote:
> The current code allows rel[j] to access one element past the end of the
> relocation section. Simplify to num_relocations which is equivalent to
> the existing size expression.
>
> Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - New patch for v2
>
>   arch/riscv/kernel/module.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 47d0ebeec93c..060f576cc988 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -859,7 +859,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>   				}
>   
>   				j++;
> -				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
> +				if (j == num_relocations)
>   					j = 0;
>   
>   			} while (j_idx != j);


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
