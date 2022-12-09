Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A30C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 04:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dN44pZ/dKGE/8VtSr3BZZGus+zTDdy+Z/BI1nC0EA1E=; b=maGlVpGIXLmjx9wxqwwE+etL8s
	thnulg5DPNarzPXG+Jqej8mlECapCV34klLYp68PeptAl8ZHfp9gvpmChU3Jv0D1VNWlZWWtHO1Cc
	4xAoWCohLR9CXE1KXXDjn03nhzTRpqo95SzPXAqYUc6Gqwfjsu4zZUfYYz3a+K9xCqH9QYJQKgkpn
	92UJRk+qDjauBc2iM2cQKCRGCxL4mYSZYwwdvb6p7eAaNuOS6MbeL4Tzmgq+UJlma4bp14s2Ua08d
	bWTfmrBQfmLJC/Ym2KjeOdfPA8IVIxQJCsuY6BW8UO777i5Dh9ZRMUbX0SadfiN7EJqg6t3CJ9EzW
	qck216rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3V4W-003RWi-Pv; Fri, 09 Dec 2022 04:33:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3V4T-003RMz-OT
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 04:33:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so7484846pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 20:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V2911JbsQ7q3MV8ByLBMvoup/1u6ZZgGLRpPzpF/E8=;
        b=tD9/OuaQk4Ny5ftlapIHalH7LY+UdxT5DNVq73qwQk5brpKADBpSV9VBVZOrdrU7xS
         jFYq052qCafhdRHVC/bdhkALtxcuHOOH4BEpTNI66zXOXYxyZbqg6kxKdhXeXo4nGBza
         5raDi1jiqsQ2OAWGNFkv8XlefPj1uC0aaWRqbqYnuABo/HjzH+yfNp/qVKmpqkN8Uk9L
         1jFrGeZRQQm3n+1vkzjJxQHzxx9nTNlMKkY0QL8t/OPY/2B3lTzZRNUV5HS+9OMTCEO9
         1bgrkOd/X4V6rKK8IF5TqW3xRVzi6tBpzp4i+FDIcjZDj/1mxWREQIOM5UTRTd2emXnf
         eEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8V2911JbsQ7q3MV8ByLBMvoup/1u6ZZgGLRpPzpF/E8=;
        b=VQ0DAP9cQdOoQ22o3CA3hAsd3SWz3EjlxpFNqHPb+0pHtNIEPnHbRLMpy58YZChOB2
         rs0/2Si4h/5NacH474DF9kjPnN+S2T9exsgQ7oVaRfDpa/fdk0L178W6gXONhEU50K2m
         WPbL6Mp70Op/SrbtM5+qjSBp5JD5bbp9ybEWH3iKAhtsEWGukzu5aIsIQLlx9VZopv6a
         Hs8Ug+1d8DcIqbfdwo9RhbyD/RjTvSMwj3Wg/Lk4pZsl0c1bnLECJxJV6pApRIU1ftJF
         S6QmS/EFgnyaIWt4pzKXdeSkysptL/hMNEiTuvVYhHc61l4vH4vs4lFGWydpVEKRCi93
         GZIw==
X-Gm-Message-State: ANoB5plQFu1iK9pcXcMMEQv7ehIicweri4x+VbZt9LMod78CrpuNtptx
	P2vOhUR7rO2Mo2Zul+f9SMvfNQ==
X-Google-Smtp-Source: AA0mqf53l7n1lwXWo6ELFRoXqPMMWNSKJ4uBBIpg0VM28LtzLEoabSx/gaDvmcRZcN05Lor9GtpL0A==
X-Received: by 2002:a05:6a20:e68f:b0:9d:efbf:48d7 with SMTP id mz15-20020a056a20e68f00b0009defbf48d7mr6076987pzb.27.1670560390227;
        Thu, 08 Dec 2022 20:33:10 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g26-20020aa79f1a000000b0056bbeaa82b9sm296387pfr.113.2022.12.08.20.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 20:33:09 -0800 (PST)
Date: Thu, 08 Dec 2022 20:33:09 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 20:32:57 PST (-0800)
Subject: Re: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
In-Reply-To: <CAOnJCUJ6b5=e=k19q0Q51Gptgw_QSr_989cN8q0xoBN+yq=Mmw@mail.gmail.com>
CC: apatel@ventanamicro.com, pbonzini@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-1fa7f552-95e4-4299-ab83-52001eab8b30@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_203314_054311_CE2ACB52 
X-CRM114-Status: GOOD (  13.07  )
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

On Mon, 28 Nov 2022 13:07:27 PST (-0800), atishp@atishpatra.org wrote:
> On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
>> can be used by KVM module so let us export these functions.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  arch/riscv/kernel/sbi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 775d3322b422..5c87db8fdff2 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -627,16 +627,19 @@ long sbi_get_mvendorid(void)
>>  {
>>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
>>  }
>> +EXPORT_SYMBOL_GPL(sbi_get_mvendorid);
>>
>>  long sbi_get_marchid(void)
>>  {
>>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
>>  }
>> +EXPORT_SYMBOL_GPL(sbi_get_marchid);
>>
>>  long sbi_get_mimpid(void)
>>  {
>>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
>>  }
>> +EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>>
>>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
>>  {
>> --
>> 2.34.1
>>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
