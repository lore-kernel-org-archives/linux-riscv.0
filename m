Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A317BC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 03:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LZ65gDQvp87QGlGc/+O9Ma/PrG9b07Ofgsh/U4fhmXU=; b=1kUlK66D4lYek7W0lFVT1puS3v
	eqnoh440N0d4fALCfd2uXJhekabdFeVaqrP+e0CfJoIIsfhlJZB0xhbKqm8KNitwRwU7mghZHbp0t
	/WG1q74FY8vnfa5k+xKS4qQ+VMaqe3O34u5BI2QLbHUjPDse+dp2YfqFlq4KdryT1HdL3B/Tzv12w
	M/UjuRUHn9BbOvC7OugVODGXXhaGPThJEkl0/9N+gv50llZppnC7n1jQhstXSukYmSpbU9+SDSrJb
	ozcTWY5BDipX5Pn1gF7Pq7CMwIcqLetOAbfAHrXK7wtdNA0mbtEgjpfPW4+EKAQwSr5hbFZ4FA89+
	xqCei9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS8IH-004V45-Su; Wed, 15 Feb 2023 03:17:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS8IE-004V3X-C4
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 03:17:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o13so16968432pjg.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 19:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HoOW7mnikI/W6qgH9CzqhnH7tqIVURB7YzkTuqqxeg=;
        b=yRLLo+Y2l9Rqw6rar1SCyG1SxgiM4k2LfTdR7HicsoJ3ot5+CNso463IU5kURN1h86
         nSFxSUeaFV+/D+mlWEOgnks7/Y7ZVhJVAKTYCKDTrGq9/HdNNX1yUcykVibwEyQ9jpsq
         fU2wTqpQfQzfy7JvALOZOQzvr7brLByl3XKurkcI3DHXCgcX79yvkS83ZaA37iqJpA4C
         KDea2/o8hQGM0PGNNPafiUtTbhNWi6DCUjkL8d/7qDUr80FhqUKabcI2fl9lQK7gQu4M
         02O+3gWIonFsGFOLw244Xs+ECHNZsDJtJA1ZejtNyupqPwLJb7iaz5xgprNxEmyL672c
         dJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HoOW7mnikI/W6qgH9CzqhnH7tqIVURB7YzkTuqqxeg=;
        b=Vj7n1zBqO008nOrmP1619N6zmSDH1hCVXLu01maQ2w6l1veln2yVlBgeX5s8Se1wFV
         /4M59xUc3+ud/npguj7gKtuSoFLC7+QQv5yS6kb8OofsAYzkU5DRaUqo38B7TXSUxpzk
         jRABDUWZ8BM+GC8ia0bm+xyqbHlp9empbqdID21IGjz5FBAJABxIs0NtXYCOPYtnVM5w
         uRbxEE2P4xO+piYdZ6iWfe/mdFYNQGeIgZ3LW9FUOyBmjg49gZJ7MfsDSqls7hp1nMLg
         YnO8gwwqQFvhckuNEYs618Suy8Si59DhlP7ODuT7vn6K5dZoqNFJEbMTYfJHla1K2rvo
         yX8A==
X-Gm-Message-State: AO0yUKX+LSJbv9/UWcJStqvWOnmryRR0o3iJRuxyf2IBERdfzpmPbLHT
	TRJsaRtYssx3gsfLn82g8DnJq/NcuciYC6BX
X-Google-Smtp-Source: AK7set+1aqVANLzDp5HMuErgCQtOQR3yuVXnnsXY/YD+E/CloFSoZS7gNIcwS34GPrlK9OomuYcunQ==
X-Received: by 2002:a17:903:32c1:b0:19a:6b55:a453 with SMTP id i1-20020a17090332c100b0019a6b55a453mr1399170plr.9.1676431032105;
        Tue, 14 Feb 2023 19:17:12 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b00198f2407ea1sm10792632plp.241.2023.02.14.19.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 19:17:11 -0800 (PST)
Date: Tue, 14 Feb 2023 19:17:11 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 19:17:04 PST (-0800)
Subject: Re: [PATCH v16 0/9] RISC-V IPI Improvements
In-Reply-To: <86357k1ihd.wl-maz@kernel.org>
CC: apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  tglx@linutronix.de, daniel.lezcano@linaro.org, marcan@marcan.st, sven@svenpeter.dev,
  alyssa@rosenzweig.io, atishp@atishpatra.org, Alistair Francis <Alistair.Francis@wdc.com>,
  anup@brainfault.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  asahi@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-a886c4b4-d748-420f-889b-76ada4f9a432@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_191714_653984_96EFCB04 
X-CRM114-Status: GOOD (  18.29  )
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

On Sun, 05 Feb 2023 03:04:14 PST (-0800), Marc Zyngier wrote:
> On Tue, 03 Jan 2023 14:12:12 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> This series aims to improve IPI support in Linux RISC-V in following ways:
>>  1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
>>     specific hooks. This also makes Linux RISC-V IPI support aligned with
>>     other architectures.
>>  2) Remote TLB flushes and icache flushes should prefer local IPIs instead
>>     of SBI calls whenever we have specialized hardware (such as RISC-V AIA
>>     IMSIC and RISC-V SWI) which allows S-mode software to directly inject
>>     IPIs without any assistance from M-mode runtime firmware.
>
> [...]
>
> I'm queuing patches 3 and 9 via the irqchip tree as they are
> standalone.
>
> For the rest, I need an Ack from the riscv maintainers as they change
> a large amount of arch-specific code, and the couple of irqchip
> patches depend on these changes.
>
> Palmer, Paul?

I haven't gotten time to give this a proper review, but I think we've 
got enough of a mess with our interrupt handling that it doesn't really 
matter so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if you want to take it for this cycle that's fine with me, but I'm also 
fine holding off so it can have a while to bake in linux-next -- there's 
no real rush for any of this, as there's no hardware yet.

>
> Thanks,
>
> 	M.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
