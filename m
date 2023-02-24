Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C259C6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 23:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ebDE7OvoVeoemAT7MudG57rUGGLYXtv2K8TkoAnTiOo=; b=iiEFEZTxDzwE8LtY00jK3SuxWS
	b/T6UJpPPIsHXuixP7hC901B8n7SKHWUcQc3tzrLpX2+LN1+w4JWDz0cRpSUqAu3D9YsYzieY+1Mk
	6EfLYPhFlSe6+aM5Ri2mrA2vvicfax2ajjnQO7Zgb2k4s8OYm+/V1Wt6TH8YbgIsQp4JcM0o6nDSC
	xsX2By+vijX8jzF5AI4bvfNSlSpt7CP21ayknwVr8IM2rmtzvQpHkDfTwVR+ioJOFQeqD4WDJYRtw
	EY4KrAFFVRoqNWN4IKt6X5hVKXkbkJgw33RkTZJUp6QEMMS2RY1AZesjfaS3DKnXK8kXtDhQj9rzU
	p9JgTXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVhKJ-004Gtd-PF; Fri, 24 Feb 2023 23:18:07 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVhKH-004Gt8-77
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 23:18:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so7198099pjn.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 15:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX1R2gtpS7PTJMMj2XzkRK8QoMFOMXwlDnaBp/O//5Y=;
        b=c8tddRXKciU40CU2uGoIeK1kgI4zQGR73paZYrd7u3/ki3jB1M2TQ6uhzSu9wQvF3s
         kdEzKpS2EhXW7z3UEdPsrzvfqZr6laqZAFyEJgO4/kqWPvXc70YZhiLgtoPq8Hk3ls6U
         DFmnR+n6Wy7xuCLutA/EOXdBmeTXFC5dlMT/1LgpQ9MKsB5KXhZjlC43/bYknWGD9YPi
         JUkg6hzSv11lsoS/jk7xH64ddbg07hj9yYSwEHOskrh50Qfs2W7VuZAd7TXifAdpUfm6
         5NQAWoZTrQLn55+j88OtXH6bdqMjvsza/oMvvkN8V5qvBBoHgSZHMu++tkEvu1xyaNIj
         fw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX1R2gtpS7PTJMMj2XzkRK8QoMFOMXwlDnaBp/O//5Y=;
        b=CIIDPscJ5CZbzD58/2sXHUHYNGI40v+xSLE1LNk9+sL8T7UngUdxz0qvPLYyE+BKUG
         DCNKdPmpwhmqK242pmG04ausS1qbiYjq7rgi3UT6gnh8NiPKmH4Z2E6jVtEpBge/sLq2
         dFq0UosdF5nZVau/CgZAjJiA4+hUnWkbvGZDZIHrmowrNQtCGYGneoSNjOohV+jdUlPI
         wn6CifswN3+lXMu760iqGmPEpzW68FeJ/amjEDPLqegeBVD9C5updrxvbQOyU9WrkJMM
         Un+lbiF+kDZB1tBLPy+99s238Y5rkMRyERU9g3bSmWYSZNa5SsujAgQUXqtU1sjzlKXV
         7LMQ==
X-Gm-Message-State: AO0yUKUBlI1nVR08Go7mBfo4hNkD+aJzgbYaY4u5HQyAhRzFD8ul9bsc
	9wf4JLfuF5zoNnAc/iy4ipU80w==
X-Google-Smtp-Source: AK7set+FjlLmjlbXKl/hb0rF9jHxqpKdq7pxOc+XOmxKvvLljAbBnp9DR6wlnW/P8k+DlGKdRyPNkw==
X-Received: by 2002:a05:6a20:7f9f:b0:cc:6728:f3da with SMTP id d31-20020a056a207f9f00b000cc6728f3damr6055852pzj.19.1677280683659;
        Fri, 24 Feb 2023 15:18:03 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r19-20020a6560d3000000b00502ea97cbc0sm33732pgv.40.2023.02.24.15.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 15:18:03 -0800 (PST)
Date: Fri, 24 Feb 2023 15:18:03 -0800 (PST)
X-Google-Original-Date: Fri, 24 Feb 2023 15:17:19 PST (-0800)
Subject: Re: [RFC 0/2] RISC-V: enable rust
In-Reply-To: <CANiq72nfGfqnk4QyKsf3kmjgBVPG3WFLQqd7_+jLcYh9jG+fQw@mail.gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
  boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: miguel.ojeda.sandonis@gmail.com
Message-ID: <mhng-b792c358-a678-4ab3-aba4-4bc38da55744@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_151805_536253_5FC4DF61 
X-CRM114-Status: GOOD (  28.09  )
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

On Fri, 24 Feb 2023 14:38:28 PST (-0800), miguel.ojeda.sandonis@gmail.com wrote:
> On Fri, Feb 24, 2023 at 10:32 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> I'm fine with it, but IIRC the Rust support for most targets was pulled
>> out as they weren't deemed ready to go yet.  If the Rust folks are OK
>
> So we trimmed the original series from v8 to v9 as much as possible in
> order to upstream things piece by piece, get maintainers involved, and
> so on; i.e. they were not trimmed because they were not ready.

OK, cool, that's way less scary.

> Having said that, for the architectures support in particular, what we
> had is indeed a prototype: each architecture we added was able to
> compile, boot into QEMU, load the sample Rust modules, pass a few
> tests, and so on in our CI, using a couple kernel configs. But that is
> just the basic support, and it does not mean it works for other kernel
> configs, all hardware, all security features, and so on.
>
> So it depends on how you want to approach it, whether you are
> interested in the basic support or not, etc. In any case, I would
> recommend having an expert on the architecture take a look to
> double-check things look sane, run some tests on real hardware, etc.

We generally take stuff pretty early in RISC-V land, for example we take 
a bunch of stuff that's just in the ISA but doesn't have any hardware 
yet.  The good news is that we don't really have any of the complicated 
language-tied features in RISC-V land, so with any luck it's pretty 
straight-forward to flip on.

>> turning on RISC-V support then it's fine with me, but I think it's
>> really more up to them at this point.
>>
>> So
>>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> in case folks want to take it via some Rust-related tree, but I'm also
>> fine taking it via the RISC-V tree if that's easier.
>
> Thanks Palmer! We are trying to get maintainers of the different
> subsystems/archs/... involved so that they maintain the different Rust
> bits we are upstreaming, so ideally it would go through the RISC-V
> tree.

Works for me.

I've got a few other things in the pipeline for this merge window so 
this probably won't make it, but I'll dig in after that.  We've got a 
bunch of Rust-types floating around Rivos as well, so with any luck 
someone else will have some time to poke around.  Having a full cycle in 
linux-next is probably the right way to go for this sort of thing 
anyway, as it's likely to shake out some long-tail issues.

That'll also give us time to sort out the authorship issues, which we'd 
of course need to do before merging anything.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
