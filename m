Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA88C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 21:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FU0nwbIcUTeXhsGDTbznnYPhP3vqprnA824maZcRT8w=; b=XznmQG4vyOMhOCRG0iihrxa5Ui
	LEFQ3aSYJd60IIbkAS3q/OcnUfTqqzTo4b5QV5Ds1EnzegRjQoVMTwi9+RRyBqwk2uYOLBppJb9Ip
	m/2kWiq7pY8QQpmkA9l46pNgjGvM5OD3XGqD6KCbRC3b49EoRg5JjAM/NUqv80OlPP/hSee/e1luS
	Ts4ZYAT9yu8lNAZKUrVH+rpa9vcp4GeEBhiVSNt6U1Vu2IWWcPkZyO7o96tuyp4ilelzM3yEJKf1b
	ppw7sg2xBmb7lrgjyjoH+OM6qGuTfi4aVqM0ovt3c1rtFaUsXc8J5P6hAsfNgOePzKFYa8zAztY0e
	3itTShTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEiV-008oBl-HN; Fri, 03 Jun 2022 21:20:23 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEiR-008o6g-Nu
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 21:20:21 +0000
Received: by mail-pg1-x529.google.com with SMTP id 137so8143107pgb.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jun 2022 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=aSL7ZHMXz3P5XlI8cikK9k/wBwL3m4ZnnGzl4LDbF5w=;
        b=yNAzb0ajq75+NUTWQ6F/Imkp+LkAOvWyjvIEZ9Ah9mLyIFvXVmZByYLwWgzXGPugJH
         MZUuBsPksKXivdKiY3wf5wMtR12nIaXA6IVFdxR7/USFhYToEqM8KTUL5jdj/vHXeGh1
         olb4yI9AOqG/8V8wmwUW2Z91bj9n5R+WM0//+OmgWylvnq0NhEYoGaqWJTLkAmL0QNAr
         60jA9p5eud68gO4TkVyG1Ac1+bCKirNYFckPPkX5eCbAhOZoOiMj2Vx3YgEZfVI03H/s
         agkeGuWvGhFYWY5Qbj+wNfabulM2TXDfn6iB7RnlIACHBFT6laOahv13Vh2nn13Z53gQ
         ZLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=aSL7ZHMXz3P5XlI8cikK9k/wBwL3m4ZnnGzl4LDbF5w=;
        b=Jeft/6MBBsV0U868GtYf409GgzTWolAzA0WIfvmIeZej+gumkUqFsa+G3s9PEuOxY6
         cmBUIxf0zH0UN0Z+vis7WErSVBR0B5ktDoCMCODCsViLEnAX1sFokipwTYTm6T2WJoua
         IxwvWjfrjQVwdovlrg10xT+WOwqoY/VnV3VksIImDBc4glY/LvFzswMyRvnpuuXtb31q
         9qHF7hzuuxh/LzsEgAcAxJdwgOvLOtynmktqUdEt+ym2AhMmeTI8AfJ7pZlRL7tEKexK
         Eto8JRe63kKOCw2MKlPqXW/rgHVcAMZuTTF+y+pVGepX/Wy5eGTDk0lCmn6kwQ62zF2x
         9/fA==
X-Gm-Message-State: AOAM531vL73/Niai1Px5bTku5d/xe8YPzOo08bknasd8Y6DlYRQvYSX6
	YLeyk69a+fsss85pQQRjJuXskg==
X-Google-Smtp-Source: ABdhPJy74UdT1UAYK7NS4BOTDuipUyhVJ4Wcq5kgiiy/hpj0AmjWPiOSYCycussqXvJh6aPittlOqQ==
X-Received: by 2002:a63:b57:0:b0:3fb:a948:6d96 with SMTP id a23-20020a630b57000000b003fba9486d96mr10378007pgl.596.1654291216494;
        Fri, 03 Jun 2022 14:20:16 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id t10-20020a17090a950a00b001e28e80a8d6sm5604411pjo.38.2022.06.03.14.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 14:20:15 -0700 (PDT)
Date: Fri, 03 Jun 2022 14:20:15 -0700 (PDT)
X-Google-Original-Date: Fri, 03 Jun 2022 14:20:14 PDT (-0700)
Subject: Re: (RISC-V KVM) Re: [PATCH] RISC-V: fix typos in comments
In-Reply-To: <CAAhSdy3+imWabbArUAg0Bki3qvD1PGVB-L-xY5CvNa_YBu80aA@mail.gmail.com>
CC: Julia.Lawall@inria.fr, kernel-janitors@vger.kernel.org, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-90fa273a-b4b0-4078-887b-5e4f58986006@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_142019_817210_236DB90C 
X-CRM114-Status: GOOD (  23.01  )
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

On Thu, 02 Jun 2022 21:33:00 PDT (-0700), anup@brainfault.org wrote:
> On Thu, Jun 2, 2022 at 9:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Sat, 30 Apr 2022 12:11:20 PDT (-0700), Julia.Lawall@inria.fr wrote:
>> > Various spelling mistakes in comments.
>> > Detected with the help of Coccinelle.
>> >
>> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>> >
>> > ---
>> >  arch/riscv/kvm/vmid.c |    2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
>> > index 2fa4f7b1813d..4a2178c60b5d 100644
>> > --- a/arch/riscv/kvm/vmid.c
>> > +++ b/arch/riscv/kvm/vmid.c
>> > @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
>> >                * We ran out of VMIDs so we increment vmid_version and
>> >                * start assigning VMIDs from 1.
>> >                *
>> > -              * This also means existing VMIDs assignement to all Guest
>> > +              * This also means existing VMIDs assignment to all Guest
>> >                * instances is invalid and we have force VMID re-assignement
>> >                * for all Guest instances. The Guest instances that were not
>> >                * running will automatically pick-up new VMIDs because will
>>
>> Anup: I'm guessing you didn't see this because it didn't have KVM in the
>> subject?
>>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> if that helps any, I don't see in anywhere but not sure if I'm just
>> missing it.
>
> Thanks Palmer, I had already planned to pick this as a RC fix for 5.19
> but I forgot to reply here.

OK, no worries.  I was't going to do anything with it as it's 
arch/riscv/kvm, so no rush on my end.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
