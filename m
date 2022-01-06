Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4688C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9dJTfyHb0wT6S+T0lKob+NvsTRL39/7pPF5Dtp9cMqI=; b=zuRF7HbBkB8wenoGO5o7ZLQ8Ma
	ptQqtDoViiz9SWK5/Gm+/wcrJzdzIVllPlSRY1vDb6GkBmNrMcNFDFRmBQ4H6M9EuhqwEi+5AE2fC
	XqvW+S7VaPkJM08tcHjeXtC0lvlYazTNUsEVRHXRI3uga7nhIjkS0eMXDMxQaql+5t5frRyPqim07
	JZ90cWX8ssEfm3/vmYZBxEzN+PGjoPFoSztZcYsRKo673J5dOvSmRbnpP5kdgoBIgiWaqj4SjfmPc
	KJ0MjDmifHAHrwTQjElbwQts9UX7bgLou4QFLOPUCJ3fPdLZKl+ulit2o1XY2gAyHRl2HrebjADPw
	AdTw6tEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5JLI-00GHCJ-Tk; Thu, 06 Jan 2022 03:21:32 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5JLF-00GHBe-IX
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 03:21:31 +0000
Received: by mail-pj1-x1036.google.com with SMTP id oa15so474335pjb.4
 for <linux-riscv@lists.infradead.org>; Wed, 05 Jan 2022 19:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=L1kt8i+PKHaNiwL3dKZWcYg8PXU//JPnPYFIcwDdGfc=;
 b=2R0Da2tFc7++Xc3yybYIx+8Lh8wqtM9Mjox4PAZuIEDFcqITJek0A59lpXRvWUlXk0
 uF53KE3M8oeji64aGEwHFwT3WuJpkD+dBsw7/yt4ubkkB8RynEGp3sfCH/ChZNHdRwKV
 wABF92HSTztHwKgLaHghfMnbWBLGRE5sSZVgf1vJ2XOGqIkPIbjgSN5Ko5Ug0MmuwO6n
 5PoPoJpw9tpp4ir0O4bJ8UNC9v4JELpYzA2L/Db9H3U+iYpeHBAOM8ZbeHareODlS+Zv
 AfkBEf8hxLpqlT3pBLEj4e2rA0NByIlRmkZFefYd6/xhOPOueMj/79HVhTXkMXJ1XGqO
 qvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=L1kt8i+PKHaNiwL3dKZWcYg8PXU//JPnPYFIcwDdGfc=;
 b=SBX/WNF+v1+fphTm42JA54zwb0rNh+y1FRHXWLJCQhYAPVhccIHRcQIOZfqQFHa/Vg
 C3Zczt/dQKRDf0rFfdhlHq/WW2NyFgLw81uul55yNOZlzCnbFZybYhGNEfPefUQw0Yi9
 q3QimMs6guds9IwZUbtPKPVa2DnokKrD79IZi72tpR/K6Md686qA/GN6Z1lSuGhw8NXZ
 cQn1xTqevZr46d2eh7rzjLTfX/7TmLyA9UT4ld5MZenLrSDt6KoDBKIovpgGrZgPrdP7
 kfzJOtjAYch+LNmyPq0BcMrLEXa1XiZlY5S3U6J2dNaVHejDxV+OhrYbUpMmyAwOkCwK
 I9jw==
X-Gm-Message-State: AOAM533SGpv6MzcqWiKEtn63/zoK4fGVXmyOXJVVW9WJwccWnpX5mcOk
 bbZwHOoQrqZpRbXDVg6h6IIOow==
X-Google-Smtp-Source: ABdhPJx+qsaW9e3nS8xYE3uGzJD868WVU1ZiRYqaH/dQax0aODKoR/36iJxLlMJS1PRFkPjsegb6YA==
X-Received: by 2002:a17:903:1cf:b0:149:b6f:4e98 with SMTP id
 e15-20020a17090301cf00b001490b6f4e98mr56918701plh.118.1641439286739; 
 Wed, 05 Jan 2022 19:21:26 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q21sm467662pfu.176.2022.01.05.19.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 19:21:26 -0800 (PST)
Date: Wed, 05 Jan 2022 19:21:26 -0800 (PST)
X-Google-Original-Date: Wed, 05 Jan 2022 19:20:58 PST (-0800)
Subject: Re: [PATCH 09/12] riscv: extable: add `type` and `data` fields
In-Reply-To: <20211118152155.GB9977@lakrids.cambridge.arm.com>
CC: jszhang3@mail.ustc.edu.cn, tglx@linutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, john.fastabend@gmail.com, kpsingh@kernel.org,
 masahiroy@kernel.org, 
 michal.lkml@markovi.net, ndesaulniers@google.com, wangkefeng.wang@huawei.com,
 tongtiangen@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mark.rutland@arm.com
Message-ID: <mhng-84ef2902-21c8-4cde-9d02-aa89f913a981@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_192129_643290_D99BDD2B 
X-CRM114-Status: GOOD (  26.77  )
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

On Thu, 18 Nov 2021 07:21:55 PST (-0800), mark.rutland@arm.com wrote:
> On Thu, Nov 18, 2021 at 07:42:49PM +0800, Jisheng Zhang wrote:
>> On Thu, 18 Nov 2021 19:26:05 +0800 Jisheng Zhang wrote:
>>
>> > From: Jisheng Zhang <jszhang@kernel.org>
>> >
>> > This is a riscv port of commit d6e2cc564775("arm64: extable: add `type`
>> > and `data` fields").
>> >
>> > We will add specialized handlers for fixups, the `type` field is for
>> > fixup handler type, the `data` field is used to pass specific data to
>> > each handler, for example register numbers.
>> >
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>
>> > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
>> > index 0c031e47a419..5b5472b543f5 100644
>> > --- a/scripts/sorttable.c
>> > +++ b/scripts/sorttable.c
>> > @@ -376,9 +376,11 @@ static int do_file(char const *const fname, void *addr)
>> >  	case EM_PARISC:
>> >  	case EM_PPC:
>> >  	case EM_PPC64:
>> > -	case EM_RISCV:
>> >  		custom_sort = sort_relative_table;
>> >  		break;
>> > +	case EM_RISCV:
>> > +		custom_sort = arm64_sort_relative_table;
>>
>> Hi Mark, Thomas,
>>
>> x86 and arm64 version of sort_relative_table routine are the same, I want to
>> unify them, and then use the common function for riscv, but I'm not sure
>> which name is better. Could you please suggest?
>
> I sent a patch last week which unifies them as
> sort_relative_table_with_data():
>
>   https://lore.kernel.org/linux-arm-kernel/20211108114220.32796-1-mark.rutland@arm.com/
>
> Thomas, are you happy with that patch?
>
> With your ack it could go via the riscv tree for v5.17 as a preparatory
> cleanup in this series.
>
> Maybe we could get it in as a cleanup for v5.16-rc{2,3} ?

I don't see anything on that thread, and looks like last time I had to 
touch sorttable I just took it via the RISC-V tree.  I went ahead and 
put Mark's patch, along with this patch set, on my for-next.  I had to 
fix up a few minor issues, so LMK if anything went off the rails.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
