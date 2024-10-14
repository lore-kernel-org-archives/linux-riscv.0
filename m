Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB2AD18130
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc12aWMWbLOFkDXOLdPPSoSY1GJMH1IGsxCwwWyo3XY=; b=YRd/fsraH+cnFD
	PvOICEWS2pQStqsPAYaxjnPZKW7SHq6Bbbs2HnzV/icg/d9SeOD0CjiUukwjvXgUqPQ3cbCbzWEA+
	kgKFzakZjSoj9WEFO0htuFD70CIp+92hbuBJ2IxnpY85KpSYTDhbOQxem9uOzJgULt51Md8c4tkrA
	Jby8+wJBwSQGOEXZFggAIN96+zJC4uN04QGoqQ9MF9Fhu5osDzSyh8zaI29hqOMdKzdPLeJg5cWiq
	GkmZ6WJnBwoqVbdH4gZPF9A+RwUe2DCVgeg+5ag93p3isVuTky6Ku37HXqvhzihHCn3ucUndlXsy4
	XuLzKx1HETNf87GCyEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0O5w-00000005u8F-2qbn;
	Mon, 14 Oct 2024 16:38:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0O5q-00000005u3I-3O0m
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 16:38:55 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728923928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YIY16wXiGYjvpyHqlLYNoeeEF3MtoTc0EB4XbDJop/o=;
	b=bAcwgtUu3xFLP8Lco3S25VfYe78YgxOCRrvsYOhcUEjNIe5uyhJjVW+mhk3MGFbc+WSvKB
	bFH2fOrzr7zSZzVDp5mR8bD1A1rJ0Q0BirRC5T/jWY1+yiRUsXcMXeSPMxQrybm29fIhhr
	9N7GZI+/HH3en6R7K3nmjqgjvephhsZHw/0EUadRJc439KDwYSXb//708DSYBbPwhLgDVu
	b91t6hFjMCLx+g+9AP32kFwUBvXATR/YBCvAofCIsSvelICgL/pvE+SnTlSTRnrb1ztGj/
	+AfQpARP76G6WdrLv7Vuq/aaIJ0YFRqK3cYukaORonVZV0YkpaO0ezp5ceCuCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728923928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YIY16wXiGYjvpyHqlLYNoeeEF3MtoTc0EB4XbDJop/o=;
	b=xTroEj4cBADdE1o+N9fbYKa/4pmpakOv+wcnu7mALpMU6XjcNrzWA0Z1jenjtoTIrpsh9/
	PH+h7MnATOpiAiCA==
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Peter
 Zijlstra <peterz@infradead.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Yangyu Chen <cyy@cyyself.name>, Jinyu
 Tang <tangjinyu@tinylab.org>, Hal Feng <hal.feng@starfivetech.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
In-Reply-To: <20241009224410.53188-3-inochiama@gmail.com>
References: <20241009224410.53188-1-inochiama@gmail.com>
 <20241009224410.53188-3-inochiama@gmail.com>
Date: Mon, 14 Oct 2024 18:38:47 +0200
Message-ID: <87ldyqfxm0.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_093851_015293_E9D4CEAE 
X-CRM114-Status: UNSURE (   5.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10 2024 at 06:44, Inochi Amaoto wrote:
> +config THEAD_C900_ACLINT_SSWI
> +	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
> +	depends on RISCV
> +	select IRQ_DOMAIN_HIERARCHY

Lacks
        select GENERIC_IRQ_IPI_MUX

Other than that this looks good.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
