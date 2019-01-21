Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC11C282DB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 08:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF402084A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 08:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="siaEylTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF402084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEYpJId6DDYNRiQgSoXTwSTdNAlK83fLQmJrBVrhI3g=; b=siaEylTIJjEEAI
	z7N9q4LunLWHmT8nZK2oZRjcuhUyTHCeZKgLQ9mtkEQ5ZvzZxVpsXbq7sTDQ6j41WM02Mca5t0GxX
	eThLKIby9LsRvr7D8QF4hBeP1ZjMTkkbuvc7pFIndQfQAuwhtQjOb+6ThZqJi/TimEGNt0xVFV9eE
	YXm52CIegze6M7X0uIbf2ja601v/wXalWPLKdCw0gWax6cki7kw5KjDrfep5QSLb1i5baD/u0JY41
	W9EhOuhGKROW1AqMx7qOhlmfWZXfjIlRKxdfKXpyeShnUVWoG0mmQrOPHg2NYAnUyodSetaKR7DHq
	7PMywHSR9BCY8DOZN1yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glVQt-0006rK-Rx; Mon, 21 Jan 2019 08:59:51 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glVQk-0006pL-Ln
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 08:59:50 +0000
Received: by mail-lf1-f68.google.com with SMTP id y14so14869432lfg.13
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 00:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CBPf8HOT93sc0oj4tv290B2Z61lA88aXyyFQdOpSyj0=;
 b=eULiwsu3SGT2UJ+3Nxh4uyjyHWk82UPowSCzQUtMc3tAwKwAFRyWHI/5tWJuCTXF4I
 MAwVoNGP8XE+vFz803MCgbj6HFrBRLHTYdrqxawK2j+xNPICfrzHJjaqqU7rZHwBJYXG
 oZrS176Do7W3I2+NOqbQcmKCctGt7/z0MDQNKOEhkyN00aZMEVBepId/BqwU2unTeEcb
 XhCLxr1fF/4Xe/mOTdy2hsVB0+iKKqFgpkUfMTEOuOhHX2u0hOxyA48RT9yn1+JmqUC8
 Ue3isE6ielh+2XC+gOTKYzIIPxVzf1DTaQ/oHst3yvvRDTV+4l+90iY6mkyLu42e0Zjj
 oDFw==
X-Gm-Message-State: AJcUukc9MQgqygkEQ2vo+YryJnjEobz+/xzSDTAxg+gM1+uXtV3/JcUO
 uNcHRLOn+lWBlYe0RrzZyvc=
X-Google-Smtp-Source: ALg8bN6DKFlyHHbNBuQhh2Rrhe5wmbHn3TVTP5Dk7mbkg+PFyUtFlFcm4QqTdAZEMeiq0GYOAGEGAQ==
X-Received: by 2002:a19:5d42:: with SMTP id p2mr18472269lfj.83.1548061179965; 
 Mon, 21 Jan 2019 00:59:39 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id e5-v6sm2130011ljj.91.2019.01.21.00.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 00:59:39 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1glVQc-0000Re-GR; Mon, 21 Jan 2019 09:59:34 +0100
Date: Mon, 21 Jan 2019 09:59:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 4/5] riscv: treat cpu devicetree nodes without status as
 enabled
Message-ID: <20190121085934.GH3691@localhost>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-5-johan@kernel.org>
 <alpine.DEB.2.21.999.1901190140510.8813@utopia.booyaka.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.999.1901190140510.8813@utopia.booyaka.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_005942_812064_4C37D643 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 19, 2019 at 01:43:58AM +0000, Paul Walmsley wrote:
> On Fri, 18 Jan 2019, Johan Hovold wrote:
> 
> > Follow the Linux convention and treat devicetree nodes without a status
> > property as enabled rather than disabled, while also allowing "ok" as a
> > shorthand for "okay".
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
> 
> ... although I probably would have phrased the commit message slightly 
> differently - something like "Use of_device_is_available() in 
> riscv_of_processor_hartid(), in place of an open-coded test."  That frames 
> the change as one that removes custom code in place of an existing 
> standard function for the same purpose.

You're right, and that was my motivation too. In the end I decided to
highlight the side effect in case someone was perhaps unknowingly
relying on the current behaviour.

Thanks for the review!

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
