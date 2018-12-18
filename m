Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD48C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE210217D8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLaBCDEo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rzXuX6wl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE210217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOHPxezrc7xbg8rZ/6WqsYGEMd90U4p2jtPxv7zYYtU=; b=lLaBCDEoRRBRXR
	dTYLmUgf4x5gTe4ka92ZVC55rV7Vw3tFm1lcmb6pkON8S0jvE7bckbcynDX+k/iSqmjbnckydeR2Q
	bJdoWCuoQrB1OYc1eUjsw7kD8xrSO6sOiG0+K1vcTC5u1kns2JEI7AxGj+bOd9ybABWWwu5UfVGwB
	66dNS9jsIKEKBq1lanEzmZnJb6WLK9RfKLeckSYda6zDWeI+8Pm+pcMeM+OMfHM27Dvf7vORTB/Gl
	3skbsXyEDEhB7FhtsLdwYtBWkarmSNxLxobAqZF/GwUIfWmpIeYazsA1gmZ9EYS8EiDmn5L9T4Y/5
	oMpz0yX/U5iT6bvqnxqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZAmB-0005mm-0N; Tue, 18 Dec 2018 08:30:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZAm4-0005lX-OL
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 08:30:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id u4so13959015wrp.3
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vtoAZDWB6d72bsfhuRuDAYI2YAn1wAXF262N6zlQ9g=;
 b=rzXuX6wl9UWOz3eHzTzw0freV0en0/eEaOLG3mFK8/DsJW5scR2lR89esXb0rXU+Sv
 LP91c7XkqG67r0APqeusPjaDFaR4c94tNQgiUCXemUk9sT1xRhcvSaado3z304heWHba
 nB+rh1dAJ7TZf3Nt+BtUz1WpsY+BmxQaNIT74ihBgdxAtbDasjLQ70+HsfwX6ixsVGwm
 1CA7I/vjFoY5GHQBkz0NTT09SI1n3pFArqkEg0rVC5xQf48eMDqKAb4ykOiV9DrmzyWT
 3nf5Jm64kkkZSpMc/5PovTRqcgWTxnxP4v71PrrdN6Yk2kRXckFcFKRk6jQDALz0toag
 T5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vtoAZDWB6d72bsfhuRuDAYI2YAn1wAXF262N6zlQ9g=;
 b=cwGAMqdtYpVHu/KHJZkJq+UYKGAVJOKAz1UrO+js4++mrXZeLEmNQxHJYG3pLaEkZu
 4MOshcz0TtphRh3ZjUYqLrsw6YH3DkRzBDmZGkh5guDv+jM7gtjF3C/o6GmXVB5zoO0O
 zOoXoFGxKP1LtrpKfHlYbdn6x2BvKP9sq7rRHS9WIvw8oow8ue8Kp6RZZwKXLKCoP9Bt
 Ks37ePCle5KgAFHRcekemUvMG1gFXeg01QQTBhimhHLyeS1GhBNp9DV7WtovCPJxZWSN
 E9E1Rjcn73BCgB3t0P2BVyJDZVHmKJIrYR2fIP9k3SU/FyeZ5GrjKiFrM7qmzplLPPYO
 fpKA==
X-Gm-Message-State: AA+aEWZ9d/VN6qxGIqr7IYGO7gosFv5WmuuGugo4TCZ2p7ozkLHoBhC1
 RvmwSDQmbdJ+HHwjZOoWPT+nHkDjcoRQW91AdcaGXQ==
X-Google-Smtp-Source: AFSGD/UFO3Uq7RUEy+TbXqXUlEpP5VpULpXnuIj65KrAeFA++M0PUkmid3oIh4mJQcnCxzxjzgRT0BszrwzkQMALgio=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr14201034wrn.187.1545121832742; 
 Tue, 18 Dec 2018 00:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-2-anup@brainfault.org>
 <20181217182520.GB7086@infradead.org>
In-Reply-To: <20181217182520.GB7086@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Dec 2018 14:00:21 +0530
Message-ID: <CAAhSdy11WFLjMGa6PVWdL1=YVQLA_nHB5kA1rBj2FFuk0dOeMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] irqchip: sifive-plic: Pre-compute context hart
 base and enable base
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_003046_167598_015E4DD9 
X-CRM114-Status: UNSURE (   8.79  )
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

On Mon, Dec 17, 2018 at 11:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Nov 30, 2018 at 01:32:02PM +0530, Anup Patel wrote:
> > This patch does following optimizations:
> > 1. Pre-compute hart base for each context handler
> > 2. Pre-compute enable base for each context handler
> > 3. Have enable lock for each context handler instead
> > of global plic_toggle_lock
>
> All of which is pretty obvious from reading the patch.  The big question
> that needs to be answered in the changelog is why you do that.

To compute enable_base and hart_base is two integer additions and
one integer multiplication. This micro-optimization simply avoids this
repeated operations.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
