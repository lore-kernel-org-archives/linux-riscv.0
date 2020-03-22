Return-Path: <SRS0=FJKd=5H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95D1C4332B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2020 17:49:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B108A206C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2020 17:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YVxMHHb0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3Qj1OqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B108A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iBSKyEapNJdFDgkGK5NVnULV3E9a0TwHux4z8qk4QOI=; b=YVxMHHb0F5WEsZE/SskRIrOh1
	vld90RCSuvxYy/7qIDOhGfDTeox47JJewN2RncVdjQ6bkxcQvPr2bCvSVSjBbOico7k0zz+MjyiOB
	D3hjRiKegMCRf+/BPqBm5xTcLZEeP3Jsu9FiE0oeWhdLT6RpBIl+f3icwcSuccj5sES0NGx9eU0Ot
	CIHgGQaqpQZBnJeDnydz8/k08K10MQ/C4DJfABbqqsiSk/Kvl2dV4RB/p64HFjK0CazKrzbDqMFwq
	D7UEnc+/HtPGWKSDH7kgqX9fOrUbP68WrV1/3oXYT+rWf1qMMgZaizQVEVHPA3yNDKbZzLNbzKQDO
	5WW+mJOrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG4jA-00033w-Hs; Sun, 22 Mar 2020 17:49:36 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG4j8-00033W-9b
 for linux-riscv@lists.infradead.org; Sun, 22 Mar 2020 17:49:35 +0000
Received: by mail-yb1-xb44.google.com with SMTP id f17so5722871ybp.4
 for <linux-riscv@lists.infradead.org>; Sun, 22 Mar 2020 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iBSKyEapNJdFDgkGK5NVnULV3E9a0TwHux4z8qk4QOI=;
 b=A3Qj1OqZur8cYwBAguz7+LJxXHCNgcoFf6ozFJp2nwgiCfdiiRkTL9D9cb4tWvnp+t
 GSTfGkKsyk138anPW2i0ZVOMf+BQ9Xm8zapqod/RnEoCvl6+tFkZ1bfI9gBvL6Qk/odT
 iq0nN3A9WgtlxbbqJd4NFRGBTFE9q5LVwvi72VI90jjCqWOvqU0gwATxg6/MV4Zgu3Db
 tFtMimZEJzH34BeVDwk0YxUT6QLlcZADBs7wPDiR1gon3qScfaSM/UZiucpUk3ri0XC4
 76cBoINyNcg0XSRiHQi3oL4/OQOAxFky/KyEV2WAOT+lf+ql2DyuF7ZOkep80aRP0Ks/
 zqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBSKyEapNJdFDgkGK5NVnULV3E9a0TwHux4z8qk4QOI=;
 b=A0g/+iEhmgYTXUnLHEfBvluJDdG9Z8RXKkJVpEhyBx5z7ybEDm6NZ7OKhT76ILUdh7
 HyDtlPmOVhUuRM+I5hvCvS9i1dbO3pJS/WijU1zefMb3hKYTAPSkzIe4W6X0UqVg69Lc
 1G4tKRcfJzl1cjjlIDEXBVsdKmnoSl7wd0BA1/mUCSrUYucd3jj5RU+NW7ro8bUdpVZZ
 HNAlgrBb2hT/cnbhpBHZVizyVeogdLSaqFxQ0w8E6mwjzGWBVKijK76vbq7XyqIP2EHN
 QLzo/XkejI1Yo65DRleXQNZgcE4rglGY52uRvx3usPQ8n6/wyxdC4i9Ktf9RJLMfzES1
 mNpQ==
X-Gm-Message-State: ANhLgQ2f6Lz8JWN+JSs+edjPTgqo7XSbKm4pE3wsL8RWReW//T0GU7di
 4KkBX73uHpTzELqNfelOzHAXkCJgT5cdXM3jYPo=
X-Google-Smtp-Source: ADFU+vujMILMvlk5bbVmuQa0RF4y3Qk57Y571CzlbeXaKgG4dsRXBY/cjgbviAvO4VfuvftXAupG1r53uOLWYnc8X8U=
X-Received: by 2002:a5b:648:: with SMTP id o8mr30066618ybq.471.1584899372689; 
 Sun, 22 Mar 2020 10:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200318011144.91532-1-atish.patra@wdc.com>
In-Reply-To: <20200318011144.91532-1-atish.patra@wdc.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 22 Mar 2020 18:49:21 +0100
Message-ID: <CANBLGcxB7Tf7wmkDnjsiEpmo6djwzN2DEjGqPfCt4LG6wcjLbQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] Add support for SBI v0.2 and CPU hotplug
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_104934_334843_C5A8EB6C 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Wed, 18 Mar 2020 at 02:12, Atish Patra <atish.patra@wdc.com> wrote:
>
> The Supervisor Binary Interface(SBI) specification[1] now defines a
> base extension that provides extendability to add future extensions
> while maintaining backward compatibility with previous versions.
> The new version is defined as 0.2 and older version is marked as 0.1.
>
> This series adds following features to RISC-V Linux.
> 1. Adds support for SBI v0.2
> 2. A Unified calling convention implementation between 0.1 and 0.2.
> 3. SBI Hart state management extension (HSM)
> 4. Ordered booting of harts
> 4. CPU hotplug

If it's any help I tried this series with both OpenSBI v0.6 and master
(9a74a64ae08),
and in both cases Linux found all four cpus. I can test the hotplug
stuff too if you send
me instructions. In any case you can add my

Tested-by: Emil Renner Berthing <kernel@esmil.dk>

/Emil

