Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6BECA553F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 01:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUVJxggljAH9KpDa1KVaDs324HGmnqJPlIs51Nit2UU=; b=prX2QILdYGuBxT
	JHG24B1N4abd7xlYgGYV1pr4mC2LFa2MMnoEL7ePWI2s1G4NuBrawOhHYkiD6ritMagLHY4U29baF
	1i9XqnluTe89COseAC299LQ2AnT4g5peRDPaPm8mB5VZcX3Y4RMq4rCr+QL69BDXyn2LJgyEvhj1w
	BVfWVo0FcMlijqnAiUoppubCWL7dVZVOu8cwM2TgOz9ldfcgnwQg4eGSVItQJqHo+RT3afg7whUxW
	RZnW5LChwr+HCyxg6m/A9EHKPcOr3pPgCVmpdvoKcFxd7N/AAACWk74+FT19g6D+Z7dRkARd0S0vf
	jfTRDx8ATWzrQLacDVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxdk-009YLj-0A;
	Fri, 15 Sep 2023 01:29:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxdg-009YKr-2B
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 01:28:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf7423ef3eso13910985ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 18:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694741334; x=1695346134; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Njb5nxfBOiRZsqkfkDCdtMn4zV0CHNcc0b53FSbSvDk=;
        b=NIJ3o87HOI0I6F7YV74dRmwh5quK6NXU2+cEwap6kIbQ6bxjJYmT26FlL0JKAYgNo1
         tcRQe8hFVIdbI5NV2iK35UAKuoNq7ERMCKbybmzQN0xYi5gVtTI7bHp5Z8dmEIJ5C6em
         GHCgE7dDqZSALWtlhP1tWfpdXglrtx1Go8m0RZU7uPcuGl+Sp9yV0r37OSKs+qlA1qjD
         u/SH4ADsoVIaFG9h809cRvKqJXNOC211v1+MSjmgIE0e013m5EsKFCpNUBq36ccNMaf1
         GpUkHEMToXi9ezfrmLJgJpF01KoL8CoPy3hvzwcl8MoMTZwWzJ3qDwjZRSsoQLZ24Cj/
         ld8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694741334; x=1695346134;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Njb5nxfBOiRZsqkfkDCdtMn4zV0CHNcc0b53FSbSvDk=;
        b=ZOSC2DZpV4Sok6Bk+UEY2kcpnL7bzr0JP4dI57JZdti2VsG0dZ1JFFxXp1YzeOXdvJ
         DIqWpW1QSRzcc6nHLCpfgeF4OD02ofVKdOb/zBq5c21mA2qjHKeBR3e/wFU9IfY+Pu/O
         U+4yvP6lfdW9vNwNF8wQu5cEn0/mw3K8Vr5XEBnSoM8qqCDSYxS5wsR/rlPH36n5yt43
         1/zh1l5s4S13aFWqMmqJsEKVIOD+KtYN1ZAcHoDbkiAL68RJ2MC0SdqaNF9NY9G1Ycs+
         K3bSIMze/G6lij7NjBYv5vvqk+eeRiZC/FOSFm+XkGVUrPcwbDcQeWSPVW5xIw0ECP8G
         7N/Q==
X-Gm-Message-State: AOJu0YyGMUqKL3irDdSMQjEga+t59jL7r2pcbDL+g4b40ycrlAe2kzt7
	vHTnrTtiDAGYnIaMbGM/Q/g=
X-Google-Smtp-Source: AGHT+IHIoKHpNVoOGVVa41JrXrpya9Ksz+fxttZexrHmiutl1tkYeMKrQQqAHf/kcxk0JTqnZKL8qg==
X-Received: by 2002:a17:902:f80d:b0:1bc:382b:6897 with SMTP id ix13-20020a170902f80d00b001bc382b6897mr294837plb.13.1694741334104;
        Thu, 14 Sep 2023 18:28:54 -0700 (PDT)
Received: from ?IPv6:2402:7500:5ce:c546:8426:5e14:d5b7:9128? ([2402:7500:5ce:c546:8426:5e14:d5b7:9128])
        by smtp.gmail.com with ESMTPSA id w16-20020a1709027b9000b001c3a8b135ebsm2192536pll.282.2023.09.14.18.28.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Sep 2023 18:28:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 10/12] RISC-V: crypto: add Zvkned accelerated AES
 encryption implementation
From: He-Jie Shih <bignose1007@gmail.com>
In-Reply-To: <1BB805D3-FF47-4A58-8507-CCA72A27DD82@sifive.com>
Date: Fri, 15 Sep 2023 09:28:49 +0800
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <481D910C-8D83-4A6D-9D22-3D3A7C4723E6@gmail.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-11-heiko@sntech.de>
 <20230721054036.GD847@sol.localdomain>
 <CCA32056-CCE2-4FB5-8CFC-62444CDDA89F@sifive.com>
 <CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com>
 <1BB805D3-FF47-4A58-8507-CCA72A27DD82@sifive.com>
To: CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_182856_723030_2E5A298C 
X-CRM114-Status: UNSURE (   9.05  )
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
Reply-To: 1BB805D3-FF47-4A58-8507-CCA72A27DD82@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 12, 2023, at 15:15, Jerry Shih <jerry.shih@sifive.com> wrote:

>> This pull request doesn't appear to contain any XTS code at all, only CBC.
> 
> We have some license issues for upstream. We will append the specialized
> AES modes soon.

We have the XTS and other specialized AES modes in OpenSSL PR[1] now.
The specialized implementations all perform better than generic implementation
on FPGA.
We will try to make that implementations happen in kernel.

-Jerry

[1]
https://github.com/openssl/openssl/pull/21923


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
