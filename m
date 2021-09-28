Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D82C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 00:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF147611BD
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 00:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF147611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0VROyo2bgqi8cUb7veuzdh8ot3fKj+1kMigZs9ClRI=; b=mSDxhAvsUPKaY7
	CK0O+C29+UnXuomcB7hI+ryl08KHHWgsxmLlmFtIEoAGp11WPTZ59S3YGWgE2RVc+puhiIImhqem/
	WFwPNqOyjgbFZI3erfCOoNl/iWeMFbLGk5LTZ8dbhFSpmgGKaDDyPBVKsyafHc3GxnaW0M9n3T5lk
	qUmHJytpTx0svu/5p7rjt6WiNUFQ4Y+rl85OLK6JkTi4QlPIo63TBM8n+t0qA7owlWTXImRz+dbgy
	U3yF/+wYCfx9/KeVUwuPllUaGdXTqkn1TpQE1wOwSaEQ+apKiyw/On8LkD5nJEyH3P+F4pprTxw1W
	OVCmDQIPj19j5QcRWQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV1D9-00515W-0m; Tue, 28 Sep 2021 00:43:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV1D6-00514x-8J
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 00:43:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F16861206
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 00:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632789783;
 bh=ZF8e/FM0+eopT+Y8KRCcbREFQBdAT4gmwboao8jTDsM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j5X9Mo/9sZRA8a5d+Ol0b+nU24yJqJL1tPQhFoPdaLsNKvGILqdDqvK57Zsm9Jge3
 URoJ7ENq50jVWgzEuLKEtk2D7XLrfzEghOkWxQ3h6sFIKJX2REBkmKhigyigF9i7hm
 MSd/je4oKSfnQCa34J+P5CW+wVzo0w/Lgv9xnW67+wvghktKpoyz6p8pPGw+AZXApI
 4X92egnLM89E1NFMv58bxNCdj2G2OzOcai9doXYdkHEcZRzusH6NGwLzvQg6PiZGRp
 FoLLCfhC+bLSb2GJnUAX36+ZW8AGmc5v6mCzXb9cbsKe2Vytv9caVdCXRYLLClaP7+
 LlJEPvEpkiWkA==
Received: by mail-vk1-f175.google.com with SMTP id x207so7771655vke.2
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 17:43:03 -0700 (PDT)
X-Gm-Message-State: AOAM530wg7FQUP37ZncuLwrzmg7n2Hd9wO30ByszAAdkmPM4D5Yxvdqd
 bwMVNL1kdpQ27iiUvq2bHnkwMLnTbpuKJv5JbHE=
X-Google-Smtp-Source: ABdhPJy8GldO52SnlP7VBZDhPaFIid6a1O3zfroXvQOKN+eNASjt8B0G5rE5CZs5QPVvEAUKwfO1ScPfpxWhUjXz2BI=
X-Received: by 2002:a1f:1844:: with SMTP id 65mr2903239vky.3.1632789782389;
 Mon, 27 Sep 2021 17:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <20210923172107.1117604-2-guoren@kernel.org>
 <CAOnJCU+6hUSdviwCM6uwCQr=OV3xQP=RF-BmdJFY8Tzgd_L51Q@mail.gmail.com>
In-Reply-To: <CAOnJCU+6hUSdviwCM6uwCQr=OV3xQP=RF-BmdJFY8Tzgd_L51Q@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 28 Sep 2021 08:42:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSbPbVRYkhD5zaFT=UWKiRjj1-pxjfCVxL3AWgAiASp5A@mail.gmail.com>
Message-ID: <CAJF2gTSbPbVRYkhD5zaFT=UWKiRjj1-pxjfCVxL3AWgAiASp5A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] dt-bindings: riscv: Add svpbmt in cpu mmu-type
 property
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_174304_355530_B0C53EDB 
X-CRM114-Status: GOOD (  21.63  )
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

On Tue, Sep 28, 2021 at 3:32 AM Atish Patra <atishp@atishpatra.org> wrote:
>
>
>
> On Thu, Sep 23, 2021 at 10:22 AM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> Previous patch has added svpbmt in arch/riscv and changed the
>> DT mmu-type. Update dt-bindings related property here.
>>
>
> This is the first of many small ISA extensions to be added to RISC-V.
> Should we think about a generic DT property and parsing framework for all hart related ISA extensions now instead of adding
> to the existing mmu-type.
Change existing mmu-type will cause a compatible problem. If we still
keep current solution, I think it's still okay. eg:
mmu-type = "riscv,sv39,svpbmt,svnapot,svinval";

Or, if we still want to change, how:
mmu-type = "riscv,sv39";
mmu-type-ext = "svpbmt,svnapot,svinval"

Still keep mmu-type like before.

>
> We will soon need to add the CMO extensions as well.
>
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Cc: Anup Patel <anup@brainfault.org>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.yaml | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> index e534f6a7cfa1..5eea9b47dfc6 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> @@ -48,15 +48,18 @@ properties:
>>
>>    mmu-type:
>>      description:
>> -      Identifies the MMU address translation mode used on this
>> -      hart.  These values originate from the RISC-V Privileged
>> -      Specification document, available from
>> +      Identifies the MMU address translation mode and page based
>> +      memory type used on used on this hart.  These values originate
>> +      from the RISC-V Privileged Specification document, available
>> +      from
>>        https://riscv.org/specifications/
>>      $ref: "/schemas/types.yaml#/definitions/string"
>>      enum:
>>        - riscv,sv32
>>        - riscv,sv39
>> +      - riscv,sv39,svpbmt
>>        - riscv,sv48
>> +      - riscv,sv48,svpbmt
>>        - riscv,none
>>
>>    riscv,isa:
>> --
>> 2.25.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
