Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887D2C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+2mXHj8aXruc9QclS/7R/T8zMzMSyQAbBvMlxmhxJ4=; b=1XmQNl72s/sRsX
	7qvGzjHWhkawdXIgUfd6BHaGzefTm1I4tAbnS9HY/eMGbTxTMBtTW5WTnG4SlWwi1z+2rBUjD1YKR
	92dlJTFAAipI46sELjEmQ4HsNa3Lz5dK+ecECIvJtjXjJRhLaxNbGmzgqj+v+GB9+WDp0j9D6LK06
	4V4+c7UkgpE5X3kvnOtg+obXzdVi8T8rp/qIJZtqgeFgJ1Fyue4Ox8yLUT9ySPesaNIzmgQtScuZT
	p2buiDB4p990aPOXXyz5fXaB5IcRB9Oyz+3ZIsDuxiSarrLB0oCH6wuTN+pIgbFapQKAUP/x2JDn4
	K32hGyRSGYONX07f7g3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Dt-0000000EIe4-0oa3;
	Fri, 14 Mar 2025 13:37:13 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt55i-0000000EHBj-2RVL
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 13:28:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA90D42FF4;
	Fri, 14 Mar 2025 13:28:38 +0000 (UTC)
Message-ID: <4f6c83c0-39f6-467d-83c6-13d37440fb20@ghiti.fr>
Date: Fri, 14 Mar 2025 14:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] riscv: uaccess: optimizations
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemugehrgefmeehsgeisgemuggvfhekmeeltdguvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemugehrgefmeehsgeisgemuggvfhekmeeltdguvgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemugehrgefmeehsgeisgemuggvfhekmeeltdguvggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheptgihrhhilhgsuhhrsehtvghnshhtohhrrhgvnhhtrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepr
 ghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjrhhttgdvjeesjhhrthgtvdejrdgtohhmpdhrtghpthhtohepsggvnhdrughoohhkshestghouggvthhhihhnkhdrtghordhukhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_062846_760910_C131DDE1 
X-CRM114-Status: GOOD (  19.38  )
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

Hi Cyril,

On 21/02/2025 01:09, Cyril Bur wrote:
> This series tries to optimize riscv uaccess by allowing the use of
> user_access_begin() and user_access_end() which permits grouping user accesses
> and avoiding the CSR write penalty for each access.
>
> The error path can also be optimised using asm goto which patches 3 and 4
> achieve. This will speed up jumping to labels by avoiding the need of an
> intermediary error type variable within the uaccess macros
>
> I did read the discussion this series generated. It isn't clear to me
> which direction to take the patches, if any.
>
> V2:
> I've taken on this series as there isn't any response from Jisheng. No
> significant changes other than build fixes.
> - Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
> - Fixes build breakage in patch 4 on 32bit not having delcared __ptr in the
>    macro.
>
> V3:
> Significant commit message rewrites.
>   - Corrected the justification for patch 2
>   - Better explained/justified patches 3 and 4
> Minor code changes for legibility and more comments.
>
> Jisheng Zhang (4):
>    riscv: implement user_access_begin() and families
>    riscv: uaccess: use input constraints for ptr of __put_user()
>    riscv: uaccess: use 'asm goto' for put_user()
>    riscv: uaccess: use 'asm_goto_output' for get_user()
>
>   arch/riscv/include/asm/uaccess.h | 205 +++++++++++++++++++++++--------
>   1 file changed, 152 insertions(+), 53 deletions(-)
>
Following up on Ben's comment here 
https://lore.kernel.org/linux-riscv/b45aab1e-6d37-4027-9a15-4fa917d806b9@codethink.co.uk/

The problem that Ben mentions is caused by the use of *macros* which 
used to make the evaluation of the parameter inside the user-accessible 
section, and since this parameter could be a sleeping function, we could 
schedule another process with the SUM bit set, which could be cleared by 
this process, which would make the first process fault when trying to 
access user memory. I did not find any macro using unsafe_XXX() 
functions which could cause a problem right now, but I may have missed 
one and new could come up later, so we have multiple solutions here:

- suppose that a macro using unsafe_get/put_user() and passing a 
sleeping function as argument won't happen and then do nothing
- or save/restore CSR sstatus when switching processes
- or simply check that SUM is not set when switching processes

Let me know what you think.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
