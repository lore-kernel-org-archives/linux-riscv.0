Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BEBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKVdddk65nUPjH0eoy1ECH+2AjlCutN9RBAmt6y/zfY=; b=LWY/FXEdjs9PEz
	j/JohD7P5LC280th8jlV7/+P+km6v+p2rV3U757FH3+p02QMp8LQ6wu6g0wl+lRHt2ye9mQP7Lhth
	O6vzNY0ym/r2W76rANcwMF/rI71DSCjpgZYaU11Iwcf3+KXVnAxTD/nqA+9CPQtvywje4W6Ur09kO
	cTwvBVTlKvMEmBwZuSnHALmE7j2NcuJQLkyHvG7r0OrpP1QO/4cPfxU6i/HpgTR4E1CTlk+qyjR99
	m4Tdovyp+k+BEXKbK9z+OwhOGltJYaf2fkkxOl6+R+yFsZZqvU9fLzcojQHFJl5O5HzAprJIoJgHO
	2AhwUavBSQNmmFAPbc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2UAX-00DeVV-0j;
	Mon, 13 Nov 2023 10:27:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2UAU-00DeTy-0L
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 10:27:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6c431ca7826so3494537b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1699871257; x=1700476057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rv1AhH3eTB8RYD6tpZyG6/qCvengBvymMG2O9I43VwE=;
        b=GyaN0v3ub8Trm5iE1kQQKDX7qukoMzUs9e55IDxRhjxAhIQ31pq2/uBXoK6ZdYjfbw
         gSESuIRu8rh5lpOaHaQzGPhoDJVILiJljOjcJtDj02ZtJEk83zsXIZ7mZW4tmSG7dTEf
         YchIXJlYb5NaSHdQeuS/cLwkVqvBN23WP2L7XQc7HC2KpvTNOzeRYkFVH962MfkODOIf
         JcSOVFjZYi1h3aKShOPfxlicuV4v+7LFkzfdFmmRznE69H2wtYWUJSnCn1ZR5Cn85V3h
         jFfq0ujuJlesD0Bj34y02VgtO+la8QdKGu8Qh2afFlULJVpDnQ3i9BIdaypbvQXe+09h
         fbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871257; x=1700476057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rv1AhH3eTB8RYD6tpZyG6/qCvengBvymMG2O9I43VwE=;
        b=oeU6uYR+bDy/qCTFWgzXlNFdgvq+K6VLUn/vnZYlYqnWpOuM8OgfrG+zFTqI3T8dzU
         +aCFq7iz/WDWjFeHiaybsGFd8xJj816w6zAtqY29VPMl9S6rKAPFHwkZbSHmyo+unoMJ
         QQQ7+ocHz6OVdoNasnGA301g//mls7JRqLG5nOTv4K9Qm0WLfWGmjQlFs2aS+kNU+HZS
         pdcJmLdVkYPkB1QmVmVO6xrH9FWxV5WbsVmULTmHG53lVHHmmXL3oRyTNkGIxj1j6b3i
         AS8y8Z4sIilyKofO1rPclqpXgp67i+umHwbigA5kmf01mw/LRkFFTruHvaDiO0Ke+SKE
         Fwdg==
X-Gm-Message-State: AOJu0YxbGk+MOSslcDXIvBlhtkAuKUNNOc9ZNLrZ3XY1dP/Buz8PRIvj
	oM/1hW0Md9Vf9dQm/NNbiGn+6A==
X-Google-Smtp-Source: AGHT+IEFqZyGx2ecg6LIuVE9/qU5wiuzEX0ujNes8kMNMyFS2eIny6dsgSr1J1ePq1Po+ryjGlMjxQ==
X-Received: by 2002:aa7:9a84:0:b0:6b3:aded:7e9a with SMTP id x4-20020aa79a84000000b006b3aded7e9amr3865790pfi.27.1699871257098;
        Mon, 13 Nov 2023 02:27:37 -0800 (PST)
Received: from [192.168.68.107] ([152.250.131.148])
        by smtp.gmail.com with ESMTPSA id s18-20020a056a00195200b006c3328c9911sm3640433pfk.93.2023.11.13.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 02:27:36 -0800 (PST)
Message-ID: <6d8ff85e-b0b6-46f2-8554-b9543f3eab31@ventanamicro.com>
Date: Mon, 13 Nov 2023 07:27:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg is
 unknown
To: Andreas Schwab <schwab@suse.de>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org,
 ajones@ventanamicro.com
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
 <20230731120420.91007-2-dbarboza@ventanamicro.com> <mvmr0kz469m.fsf@suse.de>
 <5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com>
 <mvmfs1a3vjl.fsf@suse.de>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mvmfs1a3vjl.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_022746_176099_9F53EFED 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/13/23 05:30, Andreas Schwab wrote:
> On Nov 09 2023, Daniel Henrique Barboza wrote:
> 
>> Which QEMU version are you using?
> 
> The very latest release, both host and guest.

If by "latest release" you mean kernel 6.6 and QEMU 8.1, this combination is
broken ATM.

Back in 8.1 QEMU was checking for EINVAL to make an educated guess of whether an
extension was unavailable but the register exists, versus if the register was alien
to KVM at all (qemu commit f7a69fa6e6). This turned out to be a mistake because
EINVAL was being thrown for all sorts of errors, and QEMU would be wiser to just
error out in all errors like other VMMs were doing (including kvmtool).

These were considerations made when proposing this KVM side change in the cover letter.
Other VMMs would be unaffected by it, and QEMU would need changes to adapt to the new
error codes. QEMU 8.2 is already adapted. It's not ideal, but it's better to take
a hit now while the RISC-V ecosystem is still new and make things tidy for the
future.

And now that I'm thinking more about it, I'll push a QEMU change in 8.1-stable to
alleviate the issue for 8.1. My apologies, I should've thought about it earlier ...


Thanks,

Daniel


> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
