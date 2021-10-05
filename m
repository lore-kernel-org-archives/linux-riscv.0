Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB04C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 14:08:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1D86113A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 14:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C1D86113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lH/Y4YKSQECcjM2sF6FGl4QZDOeuFa00c+3qsOO4ME=; b=xr+g3JinlnJnjT
	fOJBGHHxwo51OVH4moa7FAz3PHPBsxrjOzf0tF7lEuYu2XssH2JL94+Ywtkzlz+oFTYGdTF7CbFLC
	mnwVRHz6nYm++qWZP2hVSRd1tgsk1hh48InwjxJylqsibMyhJLIQ2nQjBPqohuWwoEnE+dO98ADdX
	Kbfnf2EtdbhLOg+St043cj21/UmvwObqtxan0KKD6MXaoAGBYVZcsSG95kW8VWbvC0vF1mL2f1W1k
	XUg1azsVdk8Vug9kZJTqyuYS0FkC4JMmpszs6GVH2XbOtfloewobjkciSbTAqOU0HN1dZZGNGZwsL
	4YDwnKknY+WR3wfZU6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXl6o-00AnZ2-S6; Tue, 05 Oct 2021 14:07:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXl6l-00AnXe-Fx
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 14:07:53 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 44CB73FFDD
 for <linux-riscv@lists.infradead.org>; Tue,  5 Oct 2021 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633442870;
 bh=xBfMLbhXq3eqWTn+wDo6cmI1h3D2Mfg/sPt1KAGGlNU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=UbvR6WvetvWn85c6SAHJaD8tOzD26jSz7HJarVFjSrDZ7kUv8dOM0SFNA0ftg46gJ
 IxEto8wx9k2yB6iq3cERtLVjNeLmSP4TVI+bBcDIYNo7VNB4kRIfcgAwUNfw40QZL0
 9N4+bNHFebSXZAlFt/QqZX8uy6s4r2EExLbElEObloeVX7yxE9jbmWVHyVZHz9l1cP
 qwdgZhZoTzkjFChuS46+pOVP5sM17SClUcvfT3ZHXKvH1Li//9XM3RZMCS/+wfuO6Q
 wdqcw80tfquOhyOOzFaw3emR4VmjKqqtyZ4doghwRTctIdHhTvbzjvZKUCC4T77wZ8
 yFzBt56EhgmpQ==
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso20778838edx.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Oct 2021 07:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xBfMLbhXq3eqWTn+wDo6cmI1h3D2Mfg/sPt1KAGGlNU=;
 b=Rr/htiNcJ+bgpC4Hnu80rRudy4S26aOeaaeooE+ibqkmPorVzR1y459TD2N20k8kRQ
 EOm1WbaGfoBjIwGP0NjlhuBuZ/zrJt+ZLgKyDFZjlETG+9s3W6ZGfU46vNe2hTnTzFF8
 QciIVpPVLUCBEi9WpJSEu+mO57XjwxxaxQBMS6YQlfIToFi1QaRuswPN/lWWTiwcMgmU
 mPNes0Ub5norUXBAzHWnoQi+OpGmNtqGefnZnTn1YTOgBAqL6jfeUhyaz4xGjM64aiyR
 355zwlWcduleYnA/aA2R1r/6GwHlaFuifRyWo0ap4NF4+8UTogrzVXwKd+3anOYyfc9J
 a+Dg==
X-Gm-Message-State: AOAM533e0p5FmdNKusIBAZ2NuHxGVANWaCX5xZ4TQ0xr25MI0mddNd2/
 kS53DAZc2QQiqB5veK0gA5p5Was6+31VYa71hMkvkUN747IUVOurDPunlW76E+QCFEC/29pdTVd
 rjCavU9chSYhaf62IY8COmTvEoAfCDcCFw9kEllvt5ui0bKna0AWB59kXZhhitA==
X-Received: by 2002:a17:906:5a8d:: with SMTP id
 l13mr13690138ejq.95.1633442863164; 
 Tue, 05 Oct 2021 07:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7sw8lhaBJqQHKil175VR7+etb4keiU6vVzzat7S5H7BpHrVJ6AEaiYDY9bNlTwuViwa/ijPLx7oVatk9t45I=
X-Received: by 2002:a17:906:5a8d:: with SMTP id
 l13mr13689815ejq.95.1633442859265; 
 Tue, 05 Oct 2021 07:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <00c521b5b872b06c9350145c7d39fe7c@mailhost.ics.forth.gr>
In-Reply-To: <00c521b5b872b06c9350145c7d39fe7c@mailhost.ics.forth.gr>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 5 Oct 2021 16:07:27 +0200
Message-ID: <CA+zEjCs0n8KA_oaFKJbaP6kNohDA=qJHvUKhePUK+hDFJSbHig@mail.gmail.com>
Subject: Re: RISC-V: patched kexec-tools on github for review/testing
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: ebiederm@xmission.com, kexec@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alexandre ghiti <alex@ghiti.fr>, rppt@kernel.org, 
 geert+renesas@glider.be, Stephano Cetola <scetola@linuxfoundation.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_070751_676295_F92A0EC5 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, Oct 5, 2021 at 2:15 PM Nick Kossifidis <mick@ics.forth.gr> wrote:
>
> Hello all,
>
> I've uploaded my kexec-tools patches for riscv on github for
> testing/review before sending them upstream.
> https://github.com/riscv-collab/kexec-tools/tree/riscv
>
> Both kexec and kdump were tested on latest rv64 qemu, using for-next
> branch with this patch applied:
> https://patchwork.kernel.org/project/linux-riscv/patch/20211002122026.1451269-1-mick@ics.forth.gr/
>

I'll test that asap and review your patch too.

Thanks for your time Nick!

Alex

> Regards,
> Nick
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
