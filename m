Return-Path: <SRS0=rv00=GC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7C0C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Dec 2020 16:52:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43020207A9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Dec 2020 16:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43020207A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HT9CE0qdWxaJBYYrHvDY47gzufkdFiGRSUhurfLeYP8=; b=FJsE58qJP1z1VBcjdTuMGvtA8
	pz5ksNF6CdqT0rHuWunsIJohlgwVyTRokI0XY3I35RfovHvk7L/UUgmrORutS/rtuvX5VIneoMMHf
	EbnoU6gVyXawEY85eEjnHsjabDllEo0lUicQg6c1lSZvrBHcSMcdPQYICBIX82qlZVdYczg1b+JFZ
	6lWSdIqpyV30oX/2IMfhQKOUtNipPYUa/yDjCahXYQAVVZ2M7s9cGWbfLJAyqXFF8sTtwpjfmPr3I
	57nq4JFWk/zx1fU6WpEd28BN8nESvPH8xmyNFE0JHvRy/3OAznnGCH2vBR5IXxa23TkzcWRhxV53j
	1cQgT8r5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuei0-0001mL-1G; Wed, 30 Dec 2020 16:52:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuehx-0001lm-LS
 for linux-riscv@lists.infradead.org; Wed, 30 Dec 2020 16:52:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id q22so22633332eja.2
 for <linux-riscv@lists.infradead.org>; Wed, 30 Dec 2020 08:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvNSrPtAENxfYW4FrQD5sjwcFArArNdPq8pq28l/yAM=;
 b=JMv9uE6EBZx89gOeDuhTi4nCtDVhbXSoBqZmS+keUvyK+eOnc50ijx0GE+ZR3uR+/Y
 xThlfTwfSlHy0vzvG9o2K8zm+NkIZf3iFFOqPt9yVqnOJdcQbKQM0OfPIyUTnnhOWlg2
 y0+W1z7pLYcEMTdT+uei6b8WoOseEbHff/ERW29urfMx20fDSj/W1Zc6OjpWz1iLYeAR
 zKG/WynlnfTzZa7SoPhZeZAD76bAjftex6BcBG7R4YR2xwn6fREE+l+SAKKfLyM2VTYB
 EQTiGK09qR01WZH3lHFc4fBrcsSz3OfE1WQQDBzxj88tPW+zDK9dWK2pxF7FBxc4s2N7
 aNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvNSrPtAENxfYW4FrQD5sjwcFArArNdPq8pq28l/yAM=;
 b=ZQbKnSbiHqAjvWgTf1Zo7FtG+f09U/ftYz0QhE+KmIHwuro1BQBjMus4JScAH52YXJ
 xTSu6gVAtktzovRrVxZ9Htndxz0Oa+PslKTK3CDkFVwG1cVHp7hofo3M49xuV2HS2owk
 cthXV+SMin+PrLa/bnlMiWsvqkQSZba1IZdOxkMVMPrqVCEoJLGPKw6kPRxKPpPRoKpj
 ihS58R65xWo1bqerrmC7zIappA6cUnBggcB82l4BblvXkgoHhiLMKt3EgFwJ86JNG1Be
 Ak+VDA4JWlDU5yglyXikbMMtJFsjvqkDlxEQnpLCoJKAFRRD7f9HpOSTJux3MfjIoClS
 oJOQ==
X-Gm-Message-State: AOAM530OTIX4x92kbPgLfQDsgceewdWoQxG45lzh+q+Yjjlodwrkh6VP
 V5fUeHV9wyJPxkn/cf6r+NcdPItKZSDHgODBtog=
X-Google-Smtp-Source: ABdhPJxwp3OqOZa7CHXmPjtXDOIJv3UynWcLXzFEKnN49lyK4u8QKTGi3RcXxaa3t2ZMPw2w1LBcf3ewlZM/yACzX6E=
X-Received: by 2002:a17:906:2612:: with SMTP id
 h18mr51083923ejc.469.1609347138534; 
 Wed, 30 Dec 2020 08:52:18 -0800 (PST)
MIME-Version: 1.0
References: <1609339156-61806-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1609339156-61806-1-git-send-email-guoren@kernel.org>
From: Pekka Enberg <penberg@gmail.com>
Date: Wed, 30 Dec 2020 18:52:00 +0200
Message-ID: <CAOJsxLEcuJp2EU7UdPTEB6YM5DU8_93DSQdy3dMMMPaAnz16eQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: abort uaccess retries upon fatal signal
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_115221_726819_88E34ABF 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 30, 2020 at 4:40 PM <guoren@kernel.org> wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Pick up the patch from the 'Link' made by Mark Rutland. Keep the
> same with x86, arm, arm64, arc, sh, power.
>
> Link: https://lore.kernel.org/linux-arm-kernel/1499782763-31418-1-git-send-email-mark.rutland@arm.com/
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
