Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14971C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 13:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73FB619E1
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 13:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B73FB619E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q43rEdG0illKAvbWbytpzoJQo6L3rmKXFsdpyLnZDPA=; b=Yio9bzY7aEWPps
	USuFZifHOpa5Hhxk8dDb8FqtK3AezSaB7Wp9AJdK+9RQAbK+snpIck50he6JeQU709ULTf/UrMkVh
	MLmRpp47qZrRy6BXZ+fw++qxqSw8Db+lDn+NHW8X7ydB6oWZR1Y1/zcM5mHa9eMW4HG7td0s51nP6
	QeVeuDtMpb3NQTpaPL21sVNcf84kmIUzrJXcgkxpXnaCw0in95Czq42P0JF++2IoCo+VRwp7SKU3J
	DfDiU27sYlaOraCZNd+NmK4ZpDdqelqsAh8mcRfWLOWdqKFbelSXtnGtMH4IQoRYliF4SBOLXganO
	Vx59jzyScltBRgf4l/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnhiz-007wqt-Jk; Thu, 18 Nov 2021 13:45:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnhiw-007wq9-Sx
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 13:45:12 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5C66940A06
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637243102;
 bh=SkABN7FSLVoCTXNwtMsVpF/6O00jmyQ1cjla8kqAH/Q=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=KoftSMOs/QchUQlDFTsKKZPtDqCF8Lpe1bpjJoMrthOiN2761cAwDXdW/D/hmKBvM
 LNFr7pwthbxuR+XVbHZmLwQEArDir5vrspXcXERV99LEKoLAeVCdostQUG07YIovcZ
 O22soMee830Q8hqdhX+ZwhZGAM3/v33f4fHNIheJWldrg6EW6JL93sJY1zCFKtz/xs
 OJovGuN896GTquJfMi+dtSgWb7+mdLbkPvQM5SrgNkcUugOg9TJSLS4xrvbOYDckMG
 XR9p/78Ugi9aVH0KjkPBAdG7CJ2mUDGIhBwgcWdNANOReesxGgdnEmxgu++aMNbDId
 wkZv+fZgUL+JA==
Received: by mail-lf1-f72.google.com with SMTP id
 b23-20020a0565120b9700b00403a044bfcdso4053634lfv.13
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 05:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SkABN7FSLVoCTXNwtMsVpF/6O00jmyQ1cjla8kqAH/Q=;
 b=6TZeC/RoToZvQx6yvg34N4jok/gfmzCTT5tmoj6IAeGk8LRY5NFQ+6jP4WN1WEkvGf
 2xW80KQAHQ83CcrRrZam8Aq5ZJEi9jbz2C4puWRwzvUPL6pcNLktqzudHKoPzgHZOsYT
 I+NHWi2kvlUpn1mpWRnXgdWrezDpYp9+unF5SBhTy0m0XRhQHyJ9YdvYjbuqOoOqVH6K
 bSO4wWWUURgT7iIVFs4xQK2jl9+tvXwgjWvMoNCWM163P8TpuRzXYJMaDLSDfouPjM8v
 AttESKh1bACaMEeg/zIs9Zmex+lC0UVKQNu8NmOdrHdO9m+UMsDAL4e5rF0hhSYBtzEG
 0RFw==
X-Gm-Message-State: AOAM533SkMBChr8KdBk2fc+UMSG4Ful7gOAewGcGtN2WIa4gxfmK/WyK
 ZZxEi0gfCJp2TNH1y2KO8D2mxK7PvtNReA8O6cvuhYLmLfQd2Qd95jbMGl0Cb2o6O3lN1YW8md+
 Wt7Oopcg6Bix3TEAG1kLZJ7ClNPkkWVRUZIOqYnH1wj4/4w==
X-Received: by 2002:a2e:5852:: with SMTP id x18mr16682695ljd.184.1637243101046; 
 Thu, 18 Nov 2021 05:45:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxp+b3XRdQRVsPuseT9rrdDR4Py0VnFvJx/IzhVQvRG8lUQZ8e6YNXcADek8vpy+yLeVubtg==
X-Received: by 2002:a2e:5852:: with SMTP id x18mr16682670ljd.184.1637243100797; 
 Thu, 18 Nov 2021 05:45:00 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 e3sm316851lfc.259.2021.11.18.05.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 05:45:00 -0800 (PST)
Message-ID: <d368dd0e-b883-26a1-7f2f-47f21c5f9763@canonical.com>
Date: Thu, 18 Nov 2021 14:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/6] riscv: dts: sifive unmatched: Name gpio lines
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
 <1444ff08-24a6-afbe-1512-9ea24ad5b32d@canonical.com>
 <20211118003418.2edd1913@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211118003418.2edd1913@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_054511_132585_F7963176 
X-CRM114-Status: GOOD (  19.12  )
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

On 18/11/2021 01:34, Vincent Pelletier wrote:
> On Wed, 17 Nov 2021 10:28:59 +0100, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>> On 17/11/2021 00:57, Vincent Pelletier wrote:
>>> Follow the pin descriptions given in the version 3 of the board schematics.
>>>
>>> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
>>>
>>> --
>>> Changes since v1:
>>> - Remove trailing "." on subject line.
>>> ---  
>>
>> This is not a correct changelog placement - you have to use '---' just
>> like git uses it. Just test it yourself and you will see the problem.
> 
> Indeed, thanks for catching this.
> 
> Is there a recommended way for managing these not-for-commit-message
> chunks automatically ?
> I obviously compose them by hand so far, and put them in my local git
> working copy commit messages, but I would be happier if I did not have
> to make (bad) decisions on such mechanical detail.

There is an idea of git notes (wasn't really efficient) or git branch
description for cover letter (--cover-from-description, didn't try yet).

> 
> On a related topic, is there a way to automate "git send-email"
> recipient list using get_maintainer.pl (plus some more magic lines,
> for example to exclude bouncing addresses) ?

There are few different options, so depends what do you want, e.g.:
git send-email --cc-cmd "scripts/get_maintainer.pl --no-git --no-roles
--no-rolestats" --to linux-kernel@vger.kernel.org 0*

However above does not take care about cover-letter.

> 
> While process/submitting-patches.rst describes what the result should
> look like, it feels to me that it (or another related file) could be
> more directive on what commands/workflows help to get such result, for
> casual contributors like myself. Have I missed such documentation ?

Not sure. Anyway just look at the lists at lore.kernel.org how other
people are doing it.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
