Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD648C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=t3+9Dg9UnsQcIkSpxLCgE8mWSPCC35qzaswVuZxTkNI=; b=YWB7boNhj9aW81a8d5oYN6ayNA
	W8hU5tXb6DLpyJ8GzWSFDolZQoxt8rBQLc430d8mOcv8Nep63DzlIqzv6kJyQIHhFYv/gpXx0RHGB
	Y5OySf2gFUf6qfZeoiD0TYz6ZkxHvyXV75KDeiARCpdd/3YNTcMkUF/wZ7sbMf6mWrtdptjuDbbAM
	iBG7bc+LXDpPPQEyNAh6+s8fC1ZVfMDAVAB2uxWJQ6w/s328KiXCQlgaOQ+67jmfW+uvfbZMGkUrv
	I6qj9N3bdfqAdH1l/L9Mbn5qL2BZmsTNWH9prxBZUVp87q7e0tMXYpib30okib9hDEoiWzsMZ0ne8
	ekALuOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSMIG-00DaJd-Dq; Thu, 10 Mar 2022 17:09:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSMID-00DaIb-Bt
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 17:09:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id n2so5445884plf.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 09:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CXJIZNeGajqwp6jaZzleHdYhvxqijXnXTAupo8pKN9M=;
 b=lkIwxy6irebs+k/g2EEyfbXiasFCFgahK3OeU5fC2Ii0Y5QhEn2BSvvhMpLkQlo92x
 o7AI6Rt8Y7ZaHZS3TUKcz2wg/vR6Jb7fSn2JNwzdKOwq/I94ZLftFHUPTTAz2G/BHTFa
 z5Gnmchvcv3bT8PRLZ85jHkLetABtlxc229LHQVxqD8S0KAuV3bD7BgnITLcjewJxVbe
 BhAa7IPXGTPVWRa4DV+z0xzCIabyAxPU478EEd/8GFu2hhrpkyY4O+/KT+GxWupFSjQF
 3k7VOB5klVfc7wBJh7/6JRh9FmrP8aS8iFz+JWLZ6uKBSEbcwftUXPae7H25xv6Xngn7
 uauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CXJIZNeGajqwp6jaZzleHdYhvxqijXnXTAupo8pKN9M=;
 b=CdaQrhcOmEch2zYKrSYrXtXheIrcQchHvfiTTlUtGhDCwlHcChEv4FuECA3kQ/pLAm
 8WvNSisGHFYRqLXJF4Js74FxY2Ce/GgU9cRr1nt+TslbBsPizZRW9STwFVOyfKxPjAvp
 bfOmR4eiadBrhrz2B7Eg/FoRnt8SgL+LWOr5cqNlp7fKXvGSHJhDBtcmLU6ASeCECQqQ
 Ls5wSuE+v7bwUfXAWx8V+Zf8OqeYgFZQlsM+fWcE+sFOWVHYyxp2BWYbXWDhj8Ynck16
 yCtK9JTBvN8+Mn3xfRMZYRBkhfdGAbsrQb+zBLG+pphfBBPW6BD9ce1BY7vv0VLqGOu7
 BiZw==
X-Gm-Message-State: AOAM532/nqPClHPkGT8tOsFaS1ETOss0zoFXgbohxQIVNTKuNI7bX7x7
 sCZoNxH+p+ndjpzzZb6YZDtNlA==
X-Google-Smtp-Source: ABdhPJyVpypYQN9Wk4w5jvTCoAvJF9ERDsONHaoBVGcGWK0xcagj5xUzmVuqgSTOM+V37tN6snUXVw==
X-Received: by 2002:a17:902:c40a:b0:151:a792:71f2 with SMTP id
 k10-20020a170902c40a00b00151a79271f2mr6129701plk.36.1646932175179; 
 Thu, 10 Mar 2022 09:09:35 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3926516pjb.1.2022.03.10.09.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 09:09:34 -0800 (PST)
Date: Thu, 10 Mar 2022 09:09:34 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 09:08:29 PST (-0800)
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
In-Reply-To: <CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, michael@michaelkloos.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-3e1f2147-7acb-4dd7-8fce-41ec72def1d7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_090937_495645_8438420C 
X-CRM114-Status: GOOD (  27.69  )
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

On Wed, 09 Mar 2022 23:54:17 PST (-0800), Arnd Bergmann wrote:
> On Thu, Mar 10, 2022 at 8:34 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Wed, 09 Mar 2022 02:02:27 PST (-0800), Arnd Bergmann wrote:
>> > On Wed, Mar 9, 2022 at 6:28 AM Michael T. Kloos <michael@michaelkloos.com> wrote:
>>
>> That'd be wonderful, but unfortunately we're trending the other way --
>> we're at the point where "words in the specification have meaning" is
>> controversial, so trying to talk about which flavors of the
>> specification are standard is just meaningless.  I obviously hope that
>> gets sorted out, as we've clearly been pointed straight off a cliff for
>> a while now, but LMKL isn't the place to have that discussion.  We've
>> all seen this before, nobody needs to be convinced this leads to a mess.
>>
>> Until we get to the point where "I wrote 'RISC-V' on that potato I found
>> in my couch" can be conclusively determined not compliant with the spec,
>> it's just silly to try and talk about what is.
>
> I would argue that codifying the required extensions through kernel source

The problem here isn't the required extensions, it's that vendors can 
claim to implement an extension on hardware that doesn't exhibit any of 
the behavior the specification expresses that systems with those 
extensions must have.  The D1 is a very concrete example of this.

> code is much stronger than interpreting a specification. Ideally the
> specification
> would match what the kernel requires, but it's not the end of the world if
> the kernel ends up making decisions that are different: If Linux can do
> runtime detection of non-M, non-A or pre-standard extensions and handle
> them correctly without a notable performance impact, it can do that. Or
> Linux could end up requiring things that are normally there but not
> in the scope of the spec.
>
> Regardless of who determines what the compatible subset is, I think there
> is value in splitting out Kconfig options that prevent booting on normal
> RV64GC machines (XIP, NOMMU, 32-bit, ...). This would probably
> not include the non-M option, as long as a non-M kernel works as
> expected on CPUs with the M instructions.

I get the value to having an option hiding these things, as users might 
shoot themselves in the foot.  I sent a patch, not sure it's exactly 
what we want but at least it's something concrete to discuss.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
