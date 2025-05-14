Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC33C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5racT5NLGKBGz/QcbzxbbQXq0QoCmAJNBCHXRYnJDw=; b=K7r+aA+R/uvi/LOxuEYUI9Adj4
	GH9BIhdqpXgyBhbE5Rgj8Ho21A4RWBVVv3RdAXARqytEdzl4cBSpo6LMKaa/SeGHYCi0TfJm7y9t8
	so33KAiPiPRyGHwjKYq33My3rf+nJyYZP2Ypkgucj8dRXkspEmQVd9RxXtMaHpkiAxN9RYD7b3ev3
	VlGtnbmgwQ6jwK4fzKmtfFqaWhQZsCWY7pYJ9Rm0kzB6UVuGyVgC8em4hgmUDmh7+boNdOawpBI1q
	RlbZnm/anOordScbp52xNG4RaflGiWc4MMIetwRKKgu0gDGlFyU5DSXSVxT9qA7+csNWgyCmyEBdm
	D29xdgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Ku-0000000ETUF-0W0s;
	Wed, 14 May 2025 08:19:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF77X-0000000ER0P-1SKG
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 08:05:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1D3243A88;
	Wed, 14 May 2025 08:05:38 +0000 (UTC)
Message-ID: <7dfa540b-c6c5-46bf-ac78-acd405608afb@ghiti.fr>
Date: Wed, 14 May 2025 10:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] riscv: kprobes: Clean up instruction simulation
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746997351.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueefgeehheegtddvgeelgeejjeefudekgeetffeijefgveejudehfffftdelhffhnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpt
 hhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_010543_521818_6B0CF5E9 
X-CRM114-Status: GOOD (  10.05  )
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

On 11/05/2025 23:17, Nam Cao wrote:
> Hi,
>
> There is some instruction-processing code in kprobes simulate code. These
> code should be insn.h. In fact, most of them is duplicating insn.h.
>
> This series remove the duplicated bits and make use of macros already
> defined in insn.h. The non-duplicated bits are moved into insn.h.
>
> Nam Cao (11):
>    riscv: kprobes: Move branch_rs2_idx to insn.h
>    riscv: kprobes: Move branch_funct3 to insn.h
>    riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
>    riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
>    riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
>    riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
>    riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
>    riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
>    riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
>    riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
>    riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
>
>   arch/riscv/include/asm/insn.h            |  9 +++
>   arch/riscv/kernel/probes/simulate-insn.c | 94 +++++-------------------
>   2 files changed, 28 insertions(+), 75 deletions(-)


So for the whole series, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, that's a nice cleanup!

Alex


>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
