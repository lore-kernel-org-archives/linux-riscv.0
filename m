Return-Path: <SRS0=ggg1=6Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5619C3A5A9
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 May 2020 09:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C92E21582
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 May 2020 09:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ezLxfBt4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U9FDisrU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C92E21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uoBzoBQB4BVIuqFQUVFVcE1WM4gIMhxIJSSV4i2CqWs=; b=ezLxfBt4BKIftyY/axGWlcaUN
	sSbGku3im2RE2wAqIzJEdMPKTBvsJt8BIHQbYC7uqp+oppJPScfAAvrSXl2dj9ZZBRXuPTbkqKV4m
	aYZbtAMD4PIHPbhofX16AbQwhQxW8SAMUQyu07KLd5fnthrh2E03yC863RcrCtH4NcJbD9jYI/Jk6
	XVJvcxVFsfwr74s+LdZk9kXgrPnZILCSlZCtHW3RcAqJUYPi+9yJWjl+XzYqw+dnFBNayeDl327Uu
	YqCUAy323kKzfecVdjkQ99hHXlg9QJ2ueBwGW14Uqkv1CpFkOZnr1rfGqSoBfeT1Hjb95HtIvN21b
	Ot+g9Azxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUomH-0006Ha-6D; Sat, 02 May 2020 09:49:45 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUomE-0006GY-0l
 for linux-riscv@lists.infradead.org; Sat, 02 May 2020 09:49:43 +0000
Received: by mail-ot1-x344.google.com with SMTP id i27so4563098ota.7
 for <linux-riscv@lists.infradead.org>; Sat, 02 May 2020 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uoBzoBQB4BVIuqFQUVFVcE1WM4gIMhxIJSSV4i2CqWs=;
 b=U9FDisrUMhsDhFo44hGWbKStvuHwnO7Ntpk9HnRp28d+d6A0g7J+T0Ot8hMaxegKcI
 zTMb4gClyG7Fl+FyOvTUNXH83lgnSUX1BNVa3mMWrISD/7N/goU7SgK72Gi4IuqpPaQk
 lrlaGqbu6wWBFcwWFONxzEg/HWO/sHW8xSV4R9kW7XlJy/N3LPPSr9mrVzge7yuosNEH
 xsPYJknKxdO4zjRB9elXwFs0kRHmfCHJINLqRAKg1MMVY/P2ahe5YmBT8k2K3uuTRKZ9
 kTqflJoP+MAflNexI0ijWBACdd/Z+0dGEySL6AfPcJBJSLSeKJVuAi33w4W9EgddNG8x
 wPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uoBzoBQB4BVIuqFQUVFVcE1WM4gIMhxIJSSV4i2CqWs=;
 b=q6Bh4zWCGYK7ivlKyaHK6lPxV05spXdKpFVcKj27Uq11t+DZslV3qrulGG9l5Dk1Kq
 vtfJynRVWrVB2Cb0ePXdfRD5Tbg81Kx58yp3d81NSiMC7+hXB8gkpxmeGpZ4j/IQ7BJ2
 83/LUSaNdIa2+NQs8WT3u2IS564LAjFx4t/PvjvPBJL1VBaC5yBbmdHvMhsKNNqddX/0
 N6thex86Zbk9dYm49EqhvhysSoS4hz++OK2uDPArsZ6a2LRQhmFrdr8ZuCEYV1+gHfEe
 0bKyFpPg403aKZKydSZ92OheBYUA1E65o7PtikKWPp6RrGm6aEuxm9PbuBMw5nNVzczl
 BARg==
X-Gm-Message-State: AGi0PuYQSQrTfWdyj0GriXfsuCLxbI+TV6PZhkFWyd7dMMweRPszpzVL
 7yJgp1XC1PQLHQSs8JfrLnv2Rs5BfXzV3hv3rlzwmA==
X-Google-Smtp-Source: APiQypLgmqa/AuOjC7ZVGpbIbQ53B2ED7l1oGRMbzMwyoxJiFpp0SrZzdBEULNhA0bIUnlMdP9ImYADH8YgIDL5ZEDU=
X-Received: by 2002:a9d:7dd8:: with SMTP id k24mr6910351otn.33.1588412980814; 
 Sat, 02 May 2020 02:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095325.111441-1-zong.li@sifive.com>
 <CAOnJCUJBJ3wrY-KY3YgD-qJfr7dsWzdA83fxFYmOTmjsrYgOfA@mail.gmail.com>
 <CANXhq0qk_GQubgWB9=2uMVDSLSCWaiLtPkBcHQCPLCHyVrtdnA@mail.gmail.com>
 <CAAhSdy0QRMCm0jWe2azQ-6_D3KPRO60YEX+Wk-+HMrJfwYn_sA@mail.gmail.com>
In-Reply-To: <CAAhSdy0QRMCm0jWe2azQ-6_D3KPRO60YEX+Wk-+HMrJfwYn_sA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 2 May 2020 17:49:30 +0800
Message-ID: <CANXhq0oyPxDzXjU7s-XDUn0OGMkA0JvKeGs6Ac=JJErWE5rVnA@mail.gmail.com>
Subject: Re: [PATCH] riscv: force __cpu_up_ variables to put in data section
To: Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_024942_094697_A3F4EF7E 
X-CRM114-Status: GOOD (  16.57  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, May 2, 2020 at 2:13 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, May 2, 2020 at 11:30 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Fri, May 1, 2020 at 2:23 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Thu, Apr 30, 2020 at 2:53 AM Zong Li <zong.li@sifive.com> wrote:
> > > >
> > > > Put __cpu_up_stack_pointer and __cpu_up_task_pointer in data section.
> > > > Currently, these two variables are put in bss section, there is a
> > > > potential risk that secondary harts get the uninitialized value before
> > > > main hart finishing the bss clearing. In this case, all secondary
> > > > harts would go through the waiting loop and enable the MMU before
> > > > main hart set up the page table.
> > > >
> > >
> > > That would be only true if you are using random booting protocol with
> > > SBI v0.1 implementation.
> > > With HSM extension in place, all the secondary cores are waiting in
> > > firmware. The booting core
> > > will bring them up one by one from cpu_up method.
> > >
> > > The HSM extension is already available in OpenSBI v0.7 and Linux
> > > kernel 5.7-rc1 onwards.
> >
> > If I understand correctly, the newest kernel still works with earlier
> > OpenSBI than v0.7 or BBL. It seems to me that we need to consider the
> > use cases if we don't limit it to up to OpenSBI v0.7.
>
> I think the commit description should clearly state that the issue will
> manifest only for random booting of multiple HARTs which means it
> will manifest only for BBL and OpenSBI v0.6 (or older).
>

OK. Let me modify the description. Thanks.

> Regards,
> Anup

