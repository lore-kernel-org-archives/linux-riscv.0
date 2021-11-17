Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB262C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 09:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B618A63236
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B618A63236
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0cFKhvawBnR8eawZUp9foL6gxcfbFEnOsby/cYZqGU=; b=m8x51H64Jcx0oY
	4n5Za7vaja3HH01Ccxw84UFQybQKHt68rNWYAQWsi3iccQwCPfLxbQbhxTm4qWRJ74y2ui+ojNcFO
	5HcfgL8ZPu1pO2lsoYGQPI2GTG0cQDCL6Aeha3w4/atqbcrvtzSvUEaEtvXpDZxAmJv2nxPiuEP9R
	KBonYHdyf0oruaVJH0ZtG1idl/hVMHy9PhwPkZlh8oSE0hLlOpD1lMR+C2HtgQFY6gX6Y+ragoB+Y
	uY4PlXGznrdFxYie3WysXsFfCi33/QVzibaMe6wTpu8Wp2kKh/1Gbq/pnqxXlDStrBIyGHfvgg/bS
	4K8QnRdB8mWgx8B0KW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHHO-004GLT-6Z; Wed, 17 Nov 2021 09:30:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHFW-004FZw-ST
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 09:29:04 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1B6C93F190
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637141341;
 bh=g6sftRfYoS5K8kCTriz66+zQQzgvVb2wBfDCaV4eUgU=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=PF30djKa5SRkbsiPnkDAUCwJv28dAbT5S5h42BJ5MZbwHdSqyBOiuLQoyqx3WSqzw
 MApQe99mVQdZceBTsIj7ciJ2Ra8uUmTLZEf/4O3/R3X/MO140Nq4b8UoO1LWZ7+qa/
 I5pyuZ8GTKnRwC6inD8MDJL14QPI2mVbdl06o7mEa9zcV9nspZE9okAykRJ1Zt5Sqx
 AXlDtdIYcXOokmEnlXQTaDPv3ib8a8/gxfp7X1HWoaj4IxLkC/DsSUu9n4pPMX59kV
 U6Ebx9WS+elaq248VPQuD4kih+O7VCTJP8Av409KLvrJGqUL78DsVy0BGB5iEMxnqz
 6DXVFEkU5K60g==
Received: by mail-lf1-f69.google.com with SMTP id
 z12-20020a0565120c0c00b004037427efb7so1077770lfu.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 01:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g6sftRfYoS5K8kCTriz66+zQQzgvVb2wBfDCaV4eUgU=;
 b=HQnViFyasay8s8nouvQXNf/sqpR2K9Kkwxu9Vsfvmy3iKI6mT2oq4qG1iMjovGSoG8
 f7djG2/SsCDC9g5bwzidoW85NqMVENtjhfxXT+qGN/FnBHLybPPlsg5dUG/U123nmry7
 djt7UznB9EiNBfXJqlm6aDLZXFuLf7nKY1pRMK61EphfRoUkI3fley0Y2HSewyPzRINe
 Ij18mwxPKK5b5ZUFRwUsDygD2r4GUSp8sqPAeJ2BCboicwKm8gWuO4bzujDOGm/mNko7
 DxO0NeTjVZVgisp3aftWQTNGFjwDrCzDMvxP1rbJTs96zInodhBkoHnrQzr8VpXaPnCM
 9G/Q==
X-Gm-Message-State: AOAM533q4rbPhL43Fkbs+nkO4op4Nh1+ocoRiEKp9uWmk1JE1VO4WU6Y
 HO+XcPcA12UbgRe/lv3kQViiZtkTPxUwKs/TtdyxHknXRGyX3zKpaa4kF6xMdWbEYY7ojmokKn8
 wnX1DxqwRqQbZSyVvb4HGrvO/phvco7SKERImh3RplxNVaQ==
X-Received: by 2002:a2e:a591:: with SMTP id m17mr6124180ljp.511.1637141340605; 
 Wed, 17 Nov 2021 01:29:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk3rckhVD3o/KrVz7Fl+GIwyh2oCoLL4QcTE6BtGG9W8Byfyh6HuAtKrO+h4bpUSVl1x+npw==
X-Received: by 2002:a2e:a591:: with SMTP id m17mr6124171ljp.511.1637141340471; 
 Wed, 17 Nov 2021 01:29:00 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 u16sm1666325lfu.42.2021.11.17.01.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 01:29:00 -0800 (PST)
Message-ID: <1444ff08-24a6-afbe-1512-9ea24ad5b32d@canonical.com>
Date: Wed, 17 Nov 2021 10:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/6] riscv: dts: sifive unmatched: Name gpio lines
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_012903_279313_BD28F72E 
X-CRM114-Status: GOOD (  10.92  )
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

On 17/11/2021 00:57, Vincent Pelletier wrote:
> Follow the pin descriptions given in the version 3 of the board schematics.
> 
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> 
> --
> Changes since v1:
> - Remove trailing "." on subject line.
> ---

This is not a correct changelog placement - you have to use '---' just
like git uses it. Just test it yourself and you will see the problem.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
