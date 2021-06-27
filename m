Return-Path: <SRS0=W22O=LV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8B4C49EA7
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 03:31:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4877D619CD
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 03:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4877D619CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RA1yUOQ2GbuM9sc14heTg9iadrZvZbAp0yYv+Pu5jYk=; b=ZP9OMbRuev4haa
	612YzNEhX137SA+5Xb7wApUhHylgyptWbTql3qob9o83UOrAYstP3cm6ojA9/F362VrZqVqvywKnt
	hP8vWHB6NMT3YxKjj6j0tiCxK78VjGiHspMrngCUQRttIIze8VmCTD++E979WSg7k3pMtv9hUFjaf
	IEAl+KfYpk1GQw8lkFqV8GfbssFgvrNC2gHtniZGO8E2+cHV/3lzW3Jmy6+spLOiqWpobyGCB31JR
	MzHVDZ3dA0dFkAxDlx/Zf1CgmVyvdb6Od2U2hrzBo123yZhA+xPlsOwjCAssB64WPTkeATnxNXdpI
	MaIsu/JHpcSZbn0OKODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxLW4-00534g-1j; Sun, 27 Jun 2021 03:31:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxLW0-005349-NO
 for linux-riscv@lists.infradead.org; Sun, 27 Jun 2021 03:31:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso10482677pjv.4
 for <linux-riscv@lists.infradead.org>; Sat, 26 Jun 2021 20:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:organization:mime-version
 :content-transfer-encoding;
 bh=5a3k0PSZNfEbZFnHH4fH2h8Pwo0muyyax2Znd1f2pkg=;
 b=YniJw9wfO75BrJvm6Jww1RQiGs4/BgIJvGmwu+t6ha8wTCerx5oHCN49K480/gSEW3
 Ti/jlP+mp7GyeUy78Z8vJDcmHw4xEfZ/nxQAKal2t0x6eMfB5QkSH+lsRuEQ8LiVOAC3
 4hgm53hyacDaAuAaKCWHTJkK5XxofNuVh9nk8QGF/81YGufLxCGEv6oiWfxmJEncRKV2
 qYx3FQRTgtFZi7dmfeAqSarMpspHPaQ2FCTQL+r8SB/tCowQr82oOFojXehKrGyUASsx
 jV2zTiAeFXyfeHzcD1OzYaL7iK0/Z+ZujeUG0yzf6F9kTYPQQRQkmPoOiKGLVFt1E2c1
 rTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:organization
 :mime-version:content-transfer-encoding;
 bh=5a3k0PSZNfEbZFnHH4fH2h8Pwo0muyyax2Znd1f2pkg=;
 b=QHM2DtzltF3xwSLBFvxvJQf7GxkWn4anRw5d/5KqQNAy+I8yhLh/H/3DhQB7fEM7I6
 CgPuMItwo4vvpKqzKHbw5gqGqucpFW7FiFwUbXC1c2Iv48QRlGXudh7CpkkiQOjV/c5N
 qI7qX1T/rAnw+0d2rKRv1IyxTfWzuS1WkBbw9hNa2wLcg099Y2fjJv9+NHt6gjhj5qI0
 MWhgCqjw3xeMTypCCBV+Blz/Fxs+RjsUdBRLI9J8GLWt4Ad9YeFNvx5TyguUKCs2CCRp
 Q6myyjjY7Fpypv7KNEl78SVS1VTLA2YM5rUB1gWGnst3hgiU2+AWNxVI+adicgoGXeUE
 gLaQ==
X-Gm-Message-State: AOAM532ITNDR3eZNFKFLP8pWb6lPLZHIREV5aRhqhCZIyo+P6z5lxO8W
 xL2PdsyX2JUeFsh/0CJuUbPrWcNaiDP4JQ==
X-Google-Smtp-Source: ABdhPJzyXMEFgUMvE1/1v0bfdiGhS93VKwo+TVVO6OcnGDIaLfOQDE371VHUWVRH49z0fzmIiNurvQ==
X-Received: by 2002:a17:90b:3a91:: with SMTP id
 om17mr20468894pjb.50.1624764681817; 
 Sat, 26 Jun 2021 20:31:21 -0700 (PDT)
Received: from rata.localnet (fred.taniwha.com. [203.86.204.69])
 by smtp.gmail.com with ESMTPSA id g204sm1153940pfb.206.2021.06.26.20.31.20
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jun 2021 20:31:21 -0700 (PDT)
From: Paul Campbell <taniwha@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: prefetchw()
Date: Sun, 27 Jun 2021 15:31:18 +1200
Message-ID: <2623321.7s5MMGUR32@rata>
Organization: Moonbase Otago
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_203124_831995_9AC00146 
X-CRM114-Status: UNSURE (   3.73  )
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

i noticed today that __builtin_prefetch() emits nothing (at least in my gcc)

i wonder if it makes sense to do this for riscv linux?

static inline void prefetchw( volatile void  *addr)
{
        asm volatile("lb x0, 0(%0)" : : "r" (addr));
}

	Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
