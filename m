Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D96FCCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3QPahmRa0nUBeh4kdjqzDJyNsw5OKZCJRCxjWlWonA=; b=EOEllwh9ETB5hh
	tys19XCVl/Sm0O+GpavRnAgD71Cm/vZFkgo+esIoBrDt+ij6cXIxVEdwwE/KRclz4cYNaxVUjnQoX
	G5dfj4Sprp+zTeBWSCTa1H9DQYfrK/7yyePisEkUOMBYFq+fSpxUmgV5PTinRKzpTHVgqiQUIdiCk
	Ai8/0m9Po5ohAZ+iGKa/yJerUaxDo0hPd3NSySKxO14H+w7flrqV8GnJFbsg0oZ+L0KvgoKe6kVNe
	fkUKqrD/236DD46X7HLY+kwRh0qpLVZBQAHwhXALRl4MCdQD+G1maREfyP4qfXp5NZRcvh13zIcPa
	zk+4mlSJAtJ3POhKDONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9L28-00000004O5Q-1Cm8;
	Thu, 16 Oct 2025 10:16:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9L25-00000004O4k-41RD
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 10:16:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760609788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLL69dJksF4/iqPmPUgAV5VYqtWXMBbCiNFdjNIo33A=;
	b=4dyf4keGlON8LSBC1aKpcUUuL7XHEVITligizH+whmze2T1S9YiS2D6lI5s+/gLeIWR+Ah
	2ZvutviDhrj2QYaki5VnTWq9WyAVwapLiVFaqxATBh3L/m2E1ihklhIKGi144T0EXKix2C
	oQbaxy9NojKDXswd7xxV+KFCr6e4+WtJc/oXCYHxht1AmCjh7NXJP6B6C85s5AXv6vKidQ
	sxL9j4vlNzXONRtdmWcoynupVyIKDsrh3VK2xxETQMpmgK7096cCoIIyrviDRMVa9jDArH
	D1H/x+S15p6l6MhcgrXNkB0oq/YW2StHHvaUm/wdDaSnsUNWHPGtTMdbVfqx6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760609788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLL69dJksF4/iqPmPUgAV5VYqtWXMBbCiNFdjNIo33A=;
	b=m97xrjB9cTEobIoToBzhJ5TnfbY2K7rA/p04sZvWEmK5R41wJb0EJV+mN6bY2YtAI0RRug
	rUMF1tse33kTVWDA==
To: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian
 Wang <dramforever@live.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, Lucas Zampieri <lzampier@redhat.com>
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
In-Reply-To: <20251016084301.27670-4-lzampier@redhat.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
 <20251016084301.27670-4-lzampier@redhat.com>
Date: Thu, 16 Oct 2025 12:16:26 +0200
Message-ID: <87sefj179h.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_031630_204422_58B13F8E 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Oct 16 2025 at 09:42, Lucas Zampieri wrote:
> @@ -430,6 +516,8 @@ static const struct of_device_id plic_match[] = {
      ^^^^^^^^^^^^
How on earth did you manage to screw up the hunk header?

Applying: irqchip/plic: Add support for UltraRISC DP1000 PLIC
error: corrupt patch at line 116

>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>  	{ .compatible = "thead,c900-plic",
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> +	{ .compatible = "ultrarisc,cp100-plic",
> +	  .data = (const void *)BIT(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM) },
>  	{}
>  };
>  
> @@ -664,12 +752,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
     ^^^^^^^^^^^^^^^
Ditto here.

I fixed it up manually. Please be more careful next time.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
