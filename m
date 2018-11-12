Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B66C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 04:27:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0478E21527
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 04:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Utky0MQn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="QRriG82f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0478E21527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvJUFh04R9L+YwejPnimUz8oT89X1taenwYjo2ihKs4=; b=Utky0MQn0+yiwb
	7YjJSMojy83nzHJomEPF6wYWqgNUtgc2N4WagQCjHjJEjRw8QJ14AaQizx3z1ohYhHzs7bar4tTFR
	a6viVUbJGHKanaylOGnTiZ3a0Vi6LFqVj+87r+q0t6hEJRCMRK9BeAhgLncJ1o/kyVjikGjm81VKo
	KYkEgMenUvDbbW83dswzGghPpf27yGpEwbG9N5G39OCSQ8KwvrauOSwQXLWqnxqJFv4Lfkb2j+p+a
	5DHMU8VA/Tskc8ugdvy/zwjanIvnh4N+GGdDNE006G7y7sZwn+T+GfWfh54/jKbZWhi6Oosh9jkrT
	7TkucqOTrGbsTJDTYzqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM3ow-0005Xq-5X; Mon, 12 Nov 2018 04:27:30 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM3os-0005Wr-Ub
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 04:27:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id u13-v6so6795468wmc.4
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 20:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sS9qOFTYQqdHnYlhyaiAgHwrmTJ+8DMJ1q1QxhUg5U=;
 b=QRriG82frU04AGrJaiFSzp+hEk19z0jPwwCzfmI8CQRiR3V7S5SAAehM15bJTJvIJv
 GQ+78OZAcasGnt2qonN20tjzJT8X+ZcuPoFDzrfiDmaVRJHGPFohd6NR/v4GNTAPqjrl
 mxz0khZV3JMCnDseVM6rBRMGHpS/U7cmbiLsmKW7EoKTby6lPdhdZHsxTInhERBJ0XTS
 g9uJl/go4UQXZB8GUJ7+62ObZUPv+6C51bSSi2D2KeOX6Co/z/mEwJKHZ9aJ6RtRLMf1
 CShlvTDLxiqVcablIHWzmQmyb8Xfxsz3Ze9J3ZQ6e4suYsGX6UCWwHgOwWh7QncPLl7C
 /ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sS9qOFTYQqdHnYlhyaiAgHwrmTJ+8DMJ1q1QxhUg5U=;
 b=CZarBZQFwtwjyko2gg725gypTmKE4OsnAv+9iiBE9TV7KIMp9y0okjp6FwQ2QiIW0A
 PDzmGxQenxX7jKKYV97I6ErKH0paRRAJlXmleOp+BkFYe9BIWXhDHUE1ovrXw1UGGsK2
 uYVAKcO6SuhYqPaYsN/BmVgUvOhwy6oK8SX1R69rwFb7H0/iCA75t00p6RiUd2Xc3WC6
 rQye2ulw5ds6Z72V1Zctr7QQ9tCbfH2F5tHGWv6H9kKrsRo8MTz4skvQB85nO8eIBxfF
 Zq1anZyaGcMVtN4OU5+a35dMKfcEGL6ybV0iM359P9QNceiiMbZuf26eYGUTbf6BDRkx
 nCzQ==
X-Gm-Message-State: AGRZ1gLDoxjYC6R+B3PscSbsMga87GvlxKeWsK8Bx2pnQCgaK/hMNVRh
 ZoH9nyrQZRmNhE6jAjDm2ybJxIj/HQ2N6e24c9QFVg==
X-Google-Smtp-Source: AJdET5cMH0+g7JBAzS2J859iZLccU2w7wtag+dxlauCP9gsUSYyJc9YieoCOQViTKJ6WJe0mFpZg69/WzQQac7w6RRk=
X-Received: by 2002:a1c:d785:: with SMTP id
 o127-v6mr445176wmg.56.1541996831267; 
 Sun, 11 Nov 2018 20:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-2-anup@brainfault.org>
 <20181109084256.GA6508@infradead.org>
In-Reply-To: <20181109084256.GA6508@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Nov 2018 09:57:02 +0530
Message-ID:
 <CAAhSdy1dYGShvtUEdDARw_8viC5P5MdMLBQOhe56nu6TMNgGaA@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_202726_993540_FFF5E0A4 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112042702.Y6rZOcIKzl62AQPh9stJDb15C9lsHQhTxHAJ6SZ2Yjk@z>

On Fri, Nov 9, 2018 at 2:12 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Oct 22, 2018 at 05:15:14PM +0530, Anup Patel wrote:
> > This patch does following optimizations:
> > 1. Pre-compute hart base for each context handler
> > 2. Pre-compute enable base for each context handler
>
> Why?

This is micro-optimizations. We don't need to re-compute
hart base and hart enable base everytime.

>
> > 3. Have enable lock for each context handler instead
> > of global plic_toggle_lock
>
> Why?  Also even if you want this it should be a separate patch.

Well, the PLIC register space it a bit strange.

Most PLIC context specific registers are in one place
except context IRQ enable registers which are part of
global registers.

To handle this, we had a global plic_toggle_lock which
was taken whenever PLIC driver touched context IRQ
enable registers. Instead of this, we can have per-context
IRQ enable lock for more granular locking.

Later when we implement IRQ set_affinity, we touch
IRQ enable registers of each context whenever IRQ
affinity changes. This fine grained IRQ enable locking
helps when IRQ load-balancer is changing affinity of
different IRQs parallely on separate cores. Again this
is a micro-optimization.

>
> >  #define PRIORITY_BASE                        0
> > -#define     PRIORITY_PER_ID          4
> > +#define PRIORITY_PER_ID                      4
>
> Also please drop the random whitespace changes.

Instead of dropping I will make it separate patch because
we are replacing "\t" between #define and define_name
with a space.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
