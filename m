Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76717C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 20:40:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D8A218F0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 20:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNKn+h7w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B7v/zhuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D8A218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mthwBzNHa9bHhSvWz+uiLnkMKrpCjAZSHbpW9U1u/tA=; b=RNKn+h7wCbjs8/ZZNbz76Jqun
	kaRqG6MglEp6zBLmPSUhTdHBJy581nnHNkCZqe3dwEYz8O/vi6uX/ekhOjazCKlZkfiAimYmi1bLh
	Vj8Qge3qOwZ2aO11teY515H/OhXounzWcc4P1v3JEx2yeDEUGt3hxdMNW60uYSwF3wg0l/Wk/W3+v
	TU5+2rJHmCt7mdhliu2mgKloaCzbfGVACYxciJ8+v7x7cOTtp1LaOXFxzQNUmHNgj0QnKXp8xK0/D
	Cjrri/MwwcGfva1Vw/tyL2FUp3CrAlQH21bwjrvmrw7E9rCtGn2AQuE8e+f5sW3yLMaOZxXwKy9W+
	DtRzZAMqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga57h-0003WK-6n; Thu, 20 Dec 2018 20:40:49 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga57e-0003UT-C3
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 20:40:47 +0000
Received: by mail-qt1-x842.google.com with SMTP id v11so3371830qtc.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 12:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6JsmajvHgjh5zKiNZPfPF+qgRMpvJ7baDvQkLUr1SRk=;
 b=B7v/zhuK/o4Zjwe2RNO/FwJugvOj7+uuUa6Hpb0Q43PxVwVT5+QfyUKcKc+pn1cS3A
 MCa84yX/v7dUTJgp90EQQvNZJw7+lvlc0+ElvGi0Xi+ncWpWcSTcFnaeTI7z1keU8p9b
 AQqWbJApqrvM2zYddZ1PuLtxxX9bHX6QajXHzWRxFhBLUPwwanCWme6x+ID+C8WRIopQ
 m+JVF8RxBLY9DKLJ0RfCpiMmOEKGCzVdEBFn9vac3HSnuaCS1U/PKazsUh2l+EqJd7LV
 oI0XOT/xhpEwQFLHCkehF98rnPjzqDLf7IUlFFqfSnJlGkxM0Az6o0sNgyBW2CzqCEZ3
 JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6JsmajvHgjh5zKiNZPfPF+qgRMpvJ7baDvQkLUr1SRk=;
 b=eOJfGVwnQ7wHdEQfkDqNB2Ko4pGvziIvBEug29Yzb162Jod4Nt0yXV6FtSuL4iHzXb
 H10+EO3wDA+SY7VUzIohHibbB4m7ba5IyAg2dUywXXhWkHVXPChpXiVx5/RLSGuuI4sD
 3B8qDJ+eCwXeSY6qaXpTd6lsOFnbJQrhuJx+GTF2LsimtYTQXU527JcoNEjv+E9WM9Rq
 ccRCgvG/7wUN6tuRhaoy+8skSD5UsQanVvvzLS9MIKyCebEVGsM6ADRoCRJQL53mDKuh
 dGV5XMqRjJLsPepHck3RnQAsO7RjutFCAaApUW3f2uMlfKbqwdghtFnUble8kAbiFKg5
 PDTg==
X-Gm-Message-State: AA+aEWb9qLHDdwYoO9zmymV8oOtWrdg7UvG5yRIStyK9jlGF2NtHCLie
 SrfVQShBVOqyu2rTZhVwdlCxDQ==
X-Google-Smtp-Source: AFSGD/W2JH67Zmi7abUFE/wkZ6GQgPzv2VuNw3FoUKOIPfOWCKBaPozFhlwGQTeHz/Rh4Xw1VjrjsA==
X-Received: by 2002:a0c:b0db:: with SMTP id p27mr6514652qvc.73.1545338434545; 
 Thu, 20 Dec 2018 12:40:34 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id r47sm4479171qtc.77.2018.12.20.12.40.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Dec 2018 12:40:33 -0800 (PST)
Date: Thu, 20 Dec 2018 12:40:33 -0800 (PST)
X-Google-Original-Date: Thu, 20 Dec 2018 12:39:09 PST (-0800)
Subject: Re: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
In-Reply-To: <CAAhSdy1danjgviJ2WGGEANQXFkzZzXUdCj+04dZ4eLjcVOt14A@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-d6686972-69e1-4355-8b30-e03893e24db6@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_124046_415755_824BEFEF 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Dec 2018 01:36:45 PST (-0800), anup@brainfault.org wrote:
> On Mon, Nov 26, 2018 at 11:42 AM Anup Patel <anup@brainfault.org> wrote:
>>
>> The objcopy only emits loadable sections when creating flat kernel
>> Image. To have minimal possible size of flat kernel Image, we should
>> have all non-loadable sections after loadable sections.
>>
>> Currently, execption table section (loadable section) is after BSS
>> section (non-loadable section) in the RISC-V vmlinux.lds.S. This
>> is not optimal for having minimal flat kernel Image size hence this
>> patch makes BSS section as the last section in RISC-V vmlinux.lds.S.
>>
>> In addition, we make BSS section aligned to 16byte instead of PAGE
>> aligned which further reduces flat kernel Image size by few KBs.
>>
>> The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
>> 8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
>> 7991740 bytes with this patch applied using GCC 8.2.0. In summary,
>> this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>>  arch/riscv/kernel/vmlinux.lds.S | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>> index 65df1dfdc303..cc99eed44931 100644
>> --- a/arch/riscv/kernel/vmlinux.lds.S
>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>> @@ -74,8 +74,6 @@ SECTIONS
>>                 *(.sbss*)
>>         }
>>
>> -       BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
>> -
>>         EXCEPTION_TABLE(0x10)
>>         NOTES
>>
>> @@ -83,6 +81,8 @@ SECTIONS
>>                 *(.rel.dyn*)
>>         }
>>
>> +       BSS_SECTION(0x10, 0x10, 0x10)
>> +
>>         _end = .;
>>
>>         STABS_DEBUG
>> --
>> 2.17.1
>>
>
> Hi All,
>
> Any comment on this patch?

Sorry, I haven't had a chance to look at it yet.  Aside from the macro issue 
mentioned by Nick it seems OK.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
