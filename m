Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677D0C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347972082D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNGcH9ON";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SG5v/KEI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 347972082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=O+Fdg6pfAyB0S0w+AYuU1UYuhHlNEwV32MYAvVfvsl4=; b=BNGcH9ONnH2jQ1eBAi3KoRXqm
	EoeP7HjXyFTe2n8coA+QfAkBY8boA1va/sS0ytZAnxkpaulhEkKhNii7dwCnJG2QcVzYoNE6CnIiP
	tsbF4XrKXi9FOufZjcHnGlSnlpy3JF8vcCirJFuQybB+KfZqy7PasKWBRmCToWAnqaHF/oF5HTalF
	90xvEZ8A0ipp4UR+winzSt1dqqGFD2RaV9Ztckoa4UVOhbSkWe8WxfaOqxqWvxa1rRagI3wt/w/QA
	4tm1wr3Mgb12Aw0tMKTTUn/riKQWN7ymQwG45PqdXinF+8YSo7okAeCnAgsm/kzeN1mfo2ywGDscB
	kbxgSgh2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKPj-0004iD-Kr; Fri, 07 Dec 2018 17:59:47 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKPg-0004hm-BX
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 17:59:45 +0000
Received: by mail-pl1-x643.google.com with SMTP id z23so2163618plo.0
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dZIJPc/zDz1bTAg9EEp8yT4SR06aEXY8EPAhihF1+ms=;
 b=SG5v/KEIiaCZJPM0uEg7R4VLe0RAoQ6Az4uCmG5sMLXm/cbWEgQLBNxahWWiJ6ue1f
 /ioV3Z5X+VXUTj+/i1ZDohX9YgTKwANMaii/84z1k7Nvo7N+wQWY6pCGihU9gy9aCVL7
 XXR1Yd1A7s6VRJ+cwT6rO1Hi56aUewNsu9ksDxnVyN7lUD5HCLDaBscA+97QrLE73hC/
 FO2wwwoozlmxNIsIPl/Lor6j3l9lR0oI38houGQD5H0ZwNKDwS4TwGrxq/zM69Wa+k86
 RyJvBzYrdLbKzPkoxI14FUVtAJ6zNfZC03O0/+HZhvhwitrhDpU0cH5JhqpKjqFcRnDj
 QKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dZIJPc/zDz1bTAg9EEp8yT4SR06aEXY8EPAhihF1+ms=;
 b=gdFtHhRmoaruqcHz0DfaTaOixtPZ5Cv3gwU0BLXZupbjk3HzySLDpQfJzyfDYoNRXX
 Xt3mAXQX8qgimrg2g/xCKX1dvC7/tvDcJBxVpkL0Y4gtoXh/Lm3gPqs15anw35koI4Pu
 gB61y9+i+PMyN/eTTAcyRSsy6ys2dYLHupB+bzcRL1MO99J4ro7Gd4LL9kExS1LnXIME
 PrynSIWSALuvJEGDwGcTceWU+UGkTlUzIFFajIBhEw1jtQBvB6GjZAkGFN67pyi/Cwf8
 ZoN26o7XKpml8s0TvP4fLG8xREfve7s3uG5h6ZqmKcapxHlxp/8M0QMQtLxB2P443iGJ
 Mq5g==
X-Gm-Message-State: AA+aEWZRLfl+uAHG6V9iR1bENz7Yq5ZdPCnjEgBCj1jMMccLHbVKiARc
 W90mQZ/tPRUA5PXu/hH7mzcSww==
X-Google-Smtp-Source: AFSGD/Xf/B9hJBUbhFDXUt24hm9VBW7iY3nSbGQ6JfMmLtXVBh6M3utXW7Y+U+n5/iKOs65b9f722Q==
X-Received: by 2002:a17:902:4324:: with SMTP id
 i33mr2946391pld.227.1544205573760; 
 Fri, 07 Dec 2018 09:59:33 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id p7sm6094445pfa.22.2018.12.07.09.59.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 09:59:33 -0800 (PST)
Date: Fri, 07 Dec 2018 09:59:33 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 09:59:26 PST (-0800)
Subject: Re: [PATCH v2 0/2] Provide sched_clock for riscv_timer
In-Reply-To: <20181204102952.21297-1-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-3c8e382b-518c-4e32-b76e-3eebdd41034a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_095944_392328_6F10EC10 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 02:29:50 PST (-0800), anup@brainfault.org wrote:
> This patchset extends riscv_timer to provide sched_clock using generic
> sched_clock framework.
>
> The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc5
> and can be found at riscv_sched_clock_v2 branch of:
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Added patch to select GENERIC_SCHED_CLOCK for RISC-V
>  - Kconfig RISCV_TIMER depends on GENERIC_SCHED_CLOCK
>
> Anup Patel (2):
>   RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers
>   clocksource: riscv_timer: Provide sched_clock
>
>  arch/riscv/Kconfig                | 1 +
>  drivers/clocksource/Kconfig       | 2 +-
>  drivers/clocksource/riscv_timer.c | 9 +++++++++
>  3 files changed, 11 insertions(+), 1 deletion(-)

I'm going to add these to my for-next, but let me know if these should go 
through a clock maintainer's tree instead and I'll drop them.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
