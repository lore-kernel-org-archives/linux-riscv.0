Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B16C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 13:03:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACCD20862
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 13:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iUAYsZXw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CELJ9w/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACCD20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdGsj8ptHXDMusIyfvKKbxqtM2lJXtPzvH5QuZy29BA=; b=iUAYsZXwHXPIX4
	c4F9Mp5voR1sogF6FI47BmoJB3CtHYbtngiXghODULfJlpnrUx34nGyuNzQNLoJQMZOkjJiF+CZHR
	HqRYhlfvz/H21yX+ghK9dZ+GlzydYpnXLM/6NkBJS12u7nC3XbZ58+PJZlFZu/kPH7TF4PrSUQHHt
	Z84PyaBqtj3sMBqCf2oW6r52Wpca2wv5MX9niZMnE+Gi5CrD2Zt1Sdgqmm1ycuGcM59PdpUeKlEzJ
	twVKGJX26yS0sL3J1DF0nxSO/hIaoM5O45hNYl7iw4vZtNJMPdK61uMfnaouCyofQFFCCZsOeondw
	qa61Q/NXyCSRMUOx6ckw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRG2F-0007Ll-PI; Thu, 16 May 2019 13:02:59 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRG2C-0007KS-VX
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 13:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxWIdfV2hL7/iT51c08JGwX3nJjgTJ/fYPgEs9gxoGM=; b=CELJ9w/bLskERYh1DvzhJgdlGf
 54lADYLraF3PDZwmFVt7Jnk2lWkPZpPAlv2ET94JJQda86DYoESF1Z3Kxq10+xtoh00lzdSpnjRSt
 N/ZSXMHaqMtIVUFndc/fMyAUKNfwcU0f9pBLoSSTxWYgcNz6qj+LombOlFDZrCDT21zg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hRG26-0003He-KB; Thu, 16 May 2019 15:02:50 +0200
Date: Thu, 16 May 2019 15:02:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v3 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190516130250.GD14298@lunn.ch>
References: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
 <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
 <20190516123120.GB14298@lunn.ch>
 <CAARK3H=L2AFtog6wdJGU7rKi7yk-AzDgFdjcjktZgkqdDwnOZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAARK3H=L2AFtog6wdJGU7rKi7yk-AzDgFdjcjktZgkqdDwnOZQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_060257_166546_09F6D198 
X-CRM114-Status: UNSURE (   4.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> Other SiFive chip's with Ocore based I2C re-implementation might not
> need the broken IRQ workaround.

They then get a different compatible string, because they are not bug
compatible.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
