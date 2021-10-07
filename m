Return-Path: <SRS0=uA0y=O3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6B2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 02:25:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2437061215
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 02:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2437061215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBkOlEQqwlAjBaHID4o2R2C/xdrTymc6xdSEYXvKDf0=; b=a+r3VOVinpFESE
	xOJ1yPiY61+0CmRQtPwoqaNOB9aAMkNvHha4lLzXNvvc+sd3j/Fs4tImEFoegdFFYdAtGDkOKX8MP
	cZYzuAuK8zVyEoWRuFzf+Hb+hsAZI9ebE7yIzyxW/4xAhP8XlXS3/l7vDW11UWc0Gc9Mj4f6gK6VS
	LKq1Ktd4+V1k72+fgIrvEAtRKCRYyKYORoQThT4ishzErs1QDxJFXxQu2syW3eKw0tH3W96Z+JKsf
	iL5oyXEahSQKI053WwI8NXEEce34InNhQUp1ibC/mjRJJiVDxNkFfH344+O5c17JNuGlej/lbFx76
	9cBMnJlJbMdxC5rYWgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYJ63-00Fzu7-DV; Thu, 07 Oct 2021 02:25:23 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYJ5q-00Fzrq-VH; Thu, 07 Oct 2021 02:25:12 +0000
Received: by mail-pg1-x529.google.com with SMTP id a73so4258795pge.0;
 Wed, 06 Oct 2021 19:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6Fbp2oLqg5VLyJhPP2UoprEyUpjt3vE+k1k8NDwLMpk=;
 b=fVpVXChAwZh74Yak5ikdgyaoheURY4K/ccbznO6zTnIB1AbJR+bIgOAW5/cSxWFoOZ
 cY0eBdVYRQP1/jK52zezVr0uzpqaKqL4UT7RQvBZyhmKIcoiByFnE72l/T/lAzTh60PX
 2ZZ2YfXaMMnXi99HoWBLG5uUJUaMAp+mwPmSs0A9L0wSZq5MBqIGrLe/fQpBMPOxvPnK
 4rfWTUo7RKXBeIwus/mUrNTfwOqbla5PIcLbJRJuwd6IvqLGvZcPe9NmM60QdmCBRqmR
 sMF0mjWUQFOWNx2GTwfCL5Ktgovulw8+KnJ+87QvW6vVfTE6IVfRZKsoah2Gd8VJ0NWK
 +Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Fbp2oLqg5VLyJhPP2UoprEyUpjt3vE+k1k8NDwLMpk=;
 b=fc2Sg+q+QsJS/qDk2iu85RJMLdl4MI9CiAaWyTDHjHi5hBwZuBIkQI+OhxbwCK4nAd
 qvxnFYtAeoGNjtGykxN8K3RzYj0Loc8N/d4aSDY6xqegroGXdK3jqr5bTxvvBZsXj5EF
 itVvSDB9/vHwgoL+dVd9oDptk/UrP/zpbrYZIPXCxFfcJwURaumDbLxrgZlezDL5/sCx
 sMZMqqLNKxCoEyLG+WfqGnEkkHe2/tH7YMUspbq0aK+riDAzWsmoQl/Knh/uYYhOJpJz
 qMBx0rRU5BZoxhKpCQs0OlHVKv8fvZfZHMeCESa3iQcIkXL4pm6W0jWiprDBOAe/p73b
 6qdw==
X-Gm-Message-State: AOAM530fX3+0KUqrkZcei+zztd4iBvAl9oAvZjTdDUyivmv/TT5C+5X7
 D1KTBDYGgJvVxn9DqaEcLo8=
X-Google-Smtp-Source: ABdhPJys1HdOqewyun+C+iToAvx9hnErbBSMfwtBGQraooU+JJaijDbgzG5Y0UhUonum+9KpDmz8JA==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr1303051pgk.448.1633573509317; 
 Wed, 06 Oct 2021 19:25:09 -0700 (PDT)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g23sm22285369pfu.71.2021.10.06.19.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:25:08 -0700 (PDT)
Message-ID: <1a15bbef-cf3d-33c6-b6c1-3dd607d71d1d@gmail.com>
Date: Wed, 6 Oct 2021 19:24:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 00/12] DT: CPU h/w id parsing clean-ups and cacheinfo id
 support
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20211006164332.1981454-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_192511_061531_C76B2519 
X-CRM114-Status: GOOD (  11.56  )
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



On 10/6/2021 9:43 AM, Rob Herring wrote:
> The first 10 patches add a new function, of_get_cpu_hwid(), which parses
> CPU DT node 'reg' property, and then use it to replace all the open
> coded versions of parsing CPU node 'reg' properties.
> 
> The last 2 patches add support for populating the cacheinfo 'id' on DT
> platforms. The minimum associated CPU hwid is used for the id. The id is
> optional, but necessary for resctrl which is being adapted for Arm MPAM.
> 
> Tested on arm64. Compile tested on arm, x86 and powerpc.

On ARM and ARM64:

Tested-by: Florian Fainelli <f.fainelli@gmail.com>

lscpu -C continues to work on ARM64 as before with cache properties 
provided in the FDT.
-- 
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
