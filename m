Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5A7C4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=00DYar8QXlawq0RR9tWnDebywsHqRXn04JDfooeRNgs=; b=P/URHDLi72ijymk7tANLaaAhd8
	xtpdmP1j8SVF1WM68o5Acw8keLZQtfYTrUOENjStbtEJhqsM9IasPoTfHi0+4nmLSsRITdgxN1C6/
	Qv8V1RskjWWOzLD19zxOSsfCqvgzb7rgFbnjQAxrNXlQN/1RxVFAm71kU5EUhQp6zs+RONmJtbDU5
	L3sxUcJm29AWwsUjZF5g8abWg5gxqpGf7ppf6/BBH3yo+r7KCMa5lXFv6B2FA2BBBuHmPSWRJnuvg
	d5JYgm5Tfurz/pBdNwcng4XjKABtWJJzAIMW28VZJMKe9n7rhsAvrLz/k2MxBO6QJIg7DClfFWrGL
	1cGumlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziR9-003LAx-FJ; Mon, 28 Nov 2022 18:00:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozi7w-003AGE-9Z
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 17:41:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so14745827pjh.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6q4jScSzGE0hAs6a/t+5ZN33uNwYVBNck/2+9CXYC4=;
        b=3YCmph2XTQjXPW2kQT44/lBSrcV2BpRf8B02K4M0/F0zlARwt7BGO0FcrBDliS9A7e
         KSGO9p0Y4xwzZjBDLlxLkqrKn+FEejPq6VjkurShbb1t0lKoH5cVLbMmm1pcPl2n2LJ9
         6M9b3v+sWvKoE/ufm5tUBe8hi+74vzGrEoDNh3o12n9UDjrAlAG8W8dA4+FgSalqIUxS
         oM6DyysQ1akZoli2Le3BzsQHneQDybzTtEFheRLnkBxAxjoBcS6jlF43Q/bcVLDE5sIG
         uaCB4b+aOjDkQR75H5qSJU7HsZnF4KpnvH8blWmbZjcCtg98z5jqsjGBwoK61xJgQavv
         nRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6q4jScSzGE0hAs6a/t+5ZN33uNwYVBNck/2+9CXYC4=;
        b=TVKQ8EuPw+o1fMom4o81e6OmFUm5MNmc8HbPUxZr1wQEvmi01LBcmX8ADNsz8gI0q8
         Av5ooPwWe5FMWvTXoafUpymZsvSeyst/EFS1GYJW3Qpu+eCNe2ZfS8hdazxEBz9aGyoH
         DzOtBQMQOd4NBUtcSI3fs+xXV1I1yqDIttWh60R0XYN+yiThIoeEJL8V/fzFTogzx0LS
         5ZXL5ZvhA3I/qdJlFri03yI0bds8uNGKRfhc9gMDZligpD+fVywBF1Jr5f05L70peQcF
         k+SnME20DIyeiwM9RTgLLDuKKWXrt/EZr+DjqpoF3+u5Jihnm94wx6ocRZRWQ4vJ0huR
         3mbA==
X-Gm-Message-State: ANoB5pkXzbOO6bac8EEH/FpbuIMMsYp1X1EbpsV8jEHJq9CzEPjLdiaX
	/e/UW3c1MLbCQbp/lTVNJVaKKJG/UoPDuw==
X-Google-Smtp-Source: AA0mqf4BG7cD7dOe75eRk/tyoHpPS6XhRbTW4R2+xH79QjQ5xTv8FablNNAruRzdzGGKgyVqnix98g==
X-Received: by 2002:a17:902:c1c9:b0:188:fcda:1141 with SMTP id c9-20020a170902c1c900b00188fcda1141mr32581936plc.62.1669657263784;
        Mon, 28 Nov 2022 09:41:03 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z25-20020aa79f99000000b0056b95260b91sm8336914pfr.67.2022.11.28.09.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 09:41:03 -0800 (PST)
Date: Mon, 28 Nov 2022 09:41:03 -0800 (PST)
X-Google-Original-Date: Mon, 28 Nov 2022 09:40:54 PST (-0800)
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
In-Reply-To: <7034611.lOV4Wx5bFT@diego>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  ajones@ventanamicro.com, guoren@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-fee0e650-fb2d-4e36-8f75-ef90d5028f41@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_094108_601328_9ABBD27D 
X-CRM114-Status: GOOD (  22.69  )
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

On Thu, 24 Nov 2022 05:42:20 PST (-0800), heiko@sntech.de wrote:
> Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
>> I used the wikipedia table for ordering extensions when updating the
>> pattern here in foo.
>
> 	    ^ foo? :-)
>
>> Unfortunately that table did not match canonical order, as defined by
>> the RISC-V ISA Manual, which defines extension ordering in (what is
>> currently) Table 41, "Standard ISA extension names". Fix things up by
>> re-sorting v (vector) and adding p (packed-simd) & j (dynamic
>> languages). The e (reduced integer) and g (general) extensions are still
>> intentionally left out.
>>
>> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
>> Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> So I have compared the new pattern to the isa manual,
> and it looks like the order checks out, so

Which ISA manual?  There have been many mutually incompatible ISA string 
encoding rules, at least one of them was a change to the extension 
ordering.  It's not entirely clear what the right answer is here, as we 
can't really parse ISA strings without also knowing the version of the 
ISA manual we're meant to parse them against.  Maybe we just accept 
everything?

IMO it's time to just stop using the ISA string.  It's not a stable 
interface, trying to treat it as such just leads to headaches.  We 
should just come up with some DT-specific way of encoding whatever HW 
features are in question.  Sure it'll be a bit of work to write that all 
down in the DT bindings, but it's going to be way less work than trying 
to keep around all this ISA string parsing code.

I know I've said the opposite before, but there's just been way too many 
breakages here to assume they're going to stop.

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> index e80c967a4fa4..b7462ea2dbe4 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> @@ -80,7 +80,7 @@ properties:
>>        insensitive, letters in the riscv,isa string must be all
>>        lowercase to simplify parsing.
>>      $ref: "/schemas/types.yaml#/definitions/string"
>> -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>>
>>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>>    timebase-frequency: false
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
