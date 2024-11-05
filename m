Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B9D1CA26
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 05:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYYzid7+b6G/V1n9sYUGL76qR9XU1LbkIsg9B1o7izI=; b=lth7DXbeFd54Cx
	WDFxS18HfhT3qdZX5mUzVDFlE9HZg8l5coRqn37MfzicdYeEiGS/MZb9aBwNw2W4OIHFiAU4ixEfE
	djWAeEstpzpa23j4i09d5R8Z8wD2JmqTl7adaOQ9Qp7F7gqqAjwYjH0QCmpvjMAu5YbChYJ6ACGHS
	tl3iz77N+ArXZN63i2hC35RcW8Y5EC3AjRG8zPO0oNyNV1mfZwLUv1ZHvqZGYBi4sWBpouZ4CrohC
	/CutI0dVdpqrcCttdt+yJ4v2D+p6wb1qFCjuO5OCyUNatSfvmjhIvrQu118ghGOEOR+hbSUjU2F4a
	v8650W86s/M0fqBwyhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BzL-0000000FvkS-0aBY;
	Tue, 05 Nov 2024 05:20:23 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BzJ-0000000Fvk5-01EY
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 05:20:22 +0000
Received: by mail-oi1-x241.google.com with SMTP id 5614622812f47-3e5fa17a79dso2814260b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 21:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730784020; x=1731388820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVIDqyMFPmN4cUigm8mgpzwe7aTulhrXs9SX4YLqJfs=;
        b=i45fWien6zp5bcTccYDx34vac4MKQbSmvuJ1PaDLRKGlTCv0zAbs+rAT6DBLAC4W7C
         Q4PRh8LBKj5gIEewK5pMpaHVKdwwAS5RGR8EWX2ddla5S90/FOuVwlWgOsf3uBX7v4bW
         TIuJ5BlUs5UlLCV928WJqHQ1zxa6Oc1VIpAuk5ezYwTsFxDW6yaCyv5HOs0VCQ4uYYtm
         3kJRNQGo9xuy9Q97CiZVRXYStloRKLcx7WskcUyMYwlUcESoBW90hGpRucWsN3+mMNoq
         1iePAJNIitdMVpXwn5bSVE9kfm0RNhbqqdK92lVXxf1q/952+B1FVkeLz7Aw5XQ2L4OB
         284g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730784020; x=1731388820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVIDqyMFPmN4cUigm8mgpzwe7aTulhrXs9SX4YLqJfs=;
        b=uEx+eGTYQeO2sWwRNugr9mywv6ujB57CDmvyhmv+yHRSmxEN7ZDXFibtHA7O9gpKwB
         XMEmM5b/NuIGgRNw8SMZe6Jb7N+PIY219kps8LC/5VFyddfusTu96T9iDWshy4JBCBLL
         mTc0ME2/QVSeLk8CD0MMw5cRcV1UbuOYTdyg675vGKLGmVtSVgQB+FSHtTc8oDLqTgoX
         UdeztUDHBmVqYbSWEnD/51U0baQMMTMK49Dljre/MmasyzUijp3hEMrohdVQDX8GRHVc
         8GOw5tR/0KtAvfXLLkH3SSx6Mfh8Xkd4qmixlKKB5+TbfMbRsMniR0bjeTuylgxksIbh
         nhoA==
X-Forwarded-Encrypted: i=1; AJvYcCU6h1tHtpPYkASC5THJzu+Z32+QU9sU7FJV1eU1QAIynfqAjDd4kNIDaK+paIxnBEi5BVEdnvFv05JDkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMGXnft08F7Mbr29lxzjb3q0Hneongnwo2oBa0cIeEaXl27Xhd
	br49/BtryLYinH/z9cawM1pq3VrFpU+bZrqv8VsK05IiGchvXf+B
X-Google-Smtp-Source: AGHT+IHoumst3uPdf4NL+OrVtBSVt4fmNllaSCy38++T/BPGlXiWWEGwidCLdjrRMdlBJygYmO+0AA==
X-Received: by 2002:a05:6808:3a06:b0:3e6:5b8c:d95a with SMTP id 5614622812f47-3e65b8cd9cbmr17613629b6e.20.1730784019859;
        Mon, 04 Nov 2024 21:20:19 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459feaadsm7899842a12.69.2024.11.04.21.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 21:20:19 -0800 (PST)
Message-ID: <190e9d7b-daaa-4c7d-9954-ca143925a08d@gmail.com>
Date: Tue, 5 Nov 2024 13:20:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Samuel Holland <samuel.holland@sifive.com>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
 <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
 <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
 <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
 <8a04f84b-453b-44e5-9053-204a08d38e19@sifive.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <8a04f84b-453b-44e5-9053-204a08d38e19@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_212021_082683_28D8A188 
X-CRM114-Status: UNSURE (   6.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2024/11/5 10:50, Samuel Holland wrote:
> One "<address size>" element is just one item. maxItems > 1 would be for
> hardware with multiple discontiguous register ranges: <address1 size1>,
> <address2 size2>.
got it.I will fix it in next version.
> 
> Regards,
> Samuel

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
