Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACDCC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QtqNs1sWOQEWLacMEUrTKmW0gaC9Bm6zkHS+Vt1dmQ=; b=BvsFvDHYCAtYDM
	Sg6amLGbOalpNIWXObuK5HGLXfikqUqit8TDkUV0mYQSd9e5YvWL1mNzstOfzyTsmuHjgXKl6IPlE
	tXlS3zsR4XaAtB4EovtzN7fzcDqAB6ZXJaBE8tQdcyWr9B0Lvkf8LT/posatDXGllkhPXg68ns5Xz
	6I4n/ghjWPdVWEirKcwQvTFyqWbugulLPbdzdLZwJDbSaIK7Vz2uXshfbvHkD/5fg1VuBYhfwgRce
	Kr9l/NL7f0LqBq5BPlUqDgH0XBUMmnRBomgoA85WlAZsvVt8SxTba+PbtnvhKbx9yhmXnGZxevj72
	x6LykSyd+ny0+xP8wjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMprb-007tDC-Lz; Tue, 31 Jan 2023 12:35:51 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMprX-007tB7-2z
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 12:35:50 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id e15so17842194ybn.10
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vQn+TZx2ZHg1ApK09QZ06jQPj+oxkoi+MpHZ23vJ/Mo=;
        b=SUoYVHk6JknUbDyV3+y2XxOlGAx0wbz6zPz0hDrvwIcmWO3KF47MMR6Ik4X2wQLU6L
         oNwWcRAmcpmGwiJxGHjr9xmbNr2S/F9xP383wGXCdjUABZfZb36VxM7R4uajIplJQQwA
         j4OzpwN//6CECGck374xZYMFakfthacfCzVRfBvOfJeacFmvMNuQGh0itFVZOG7/StIm
         FGTR/tZvHYkyKrCc1Nw+cTSz4f7FwZAKH5EewKWK0r/UAhlIrqke0iMdFQpGbSHlkX0D
         uLN2fQPpGzIYierqyS21Zp73OGb/8HQhVtc57B+khefwgEBJaQ2uwv5p5i2N2oRP0tYq
         kclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQn+TZx2ZHg1ApK09QZ06jQPj+oxkoi+MpHZ23vJ/Mo=;
        b=fN3vU6+lTx99l4fnd1H2mQsbXuHEwl+NatjitvAW20ElPpoPxhjX3YKPCq7NDWYr8e
         H/66J7SL1PQDv6oyRPvFi7aNIBzWYm1J8UIK7IaC5BVQG7V3nwGKu0hbb4V7X/5EAJzJ
         jbsKamdrtyMdVEhfJmExCCaWgE/iHcnXOScC7YYW1xGSm9XFlY+2CD2Kice/gTGwC4Aw
         W03hCUH1fIMzD6vLmBNM+5neQVseOPtNNYnMIMSQsjOWyE1iPhMBzyVF+hTc1pXHnxLZ
         WOL/Y8YFUoqkFKX0jHsmczSMYv5yKD+078W8UP/Kw7iLDb37cGZyTiMBjp3VwsjQNVKk
         yKqQ==
X-Gm-Message-State: AO0yUKV3z8iANlHipbuKg9qTcCgaf+stXVNPkWhaYFfueLw7R0KHQ/HP
	0PC+baBDX6bdoHV53nrQcJL9Vu8RKdglOf0AIS0ogQ==
X-Google-Smtp-Source: AK7set+WXs6daZruHvyrocSF896E3CxVGcrQOI3JhFDNxYzHQLkkFrrrqU4xfxSofcZ59ugZQKkUJnVf0ucFbmsbLIs=
X-Received: by 2002:a25:cfd7:0:b0:80b:8a60:fc4 with SMTP id
 f206-20020a25cfd7000000b0080b8a600fc4mr1549332ybg.541.1675168545233; Tue, 31
 Jan 2023 04:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-15-andy.chiu@sifive.com>
 <Y9MKeqtT+PEe7KTY@spud>
In-Reply-To: <Y9MKeqtT+PEe7KTY@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 31 Jan 2023 20:34:00 +0800
Message-ID: <CABgGipW1E3922+TM6tgWEeAsDbogrNxB1rBxFdshqjdP3oO=Mw@mail.gmail.com>
Subject: Re: [PATCH -next v13 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_043547_157032_F8A187D6 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org, Vincent Chen <vincent.chen@sifive.com>, anup@brainfault.org, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Nick Knight <nick.knight@sifive.com>, palmer@dabbelt.com, Eric Biederman <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 27, 2023 at 7:19 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jan 25, 2023 at 02:20:51PM +0000, Andy Chiu wrote:
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index 44d2eb381ca6..4f36c553605e 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -7,6 +7,7 @@
> >  #define _ASM_RISCV_PROCESSOR_H
> >
> >  #include <linux/const.h>
> > +#include <linux/cache.h>
>
> What have I missed that is the reason for adding this header?
>
__ro_after_init is defined in linux/cache.h, so we need that header.
> >  #include <vdso/processor.h>
> >
> > @@ -203,8 +205,10 @@ static size_t cal_rt_frame_size(void)
> >
> >       frame_size = sizeof(*frame);
> >
> > -     if (has_vector() && vstate_query(task_pt_regs(current)))
> > -             total_context_size += rvv_sc_size;
>
> Usual naming comment here about rvv.
Ok, changing it to riscv_v_
>
> Thanks,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
