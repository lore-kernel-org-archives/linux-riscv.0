Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08887ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D203420664
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:27:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+VYapZ6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fqqCOQ1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D203420664
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5hvQm6tA8iYe26BZUZ2JMEWhplVFQEaspzYh+9rqRi8=; b=W+VYapZ62n0IhSZNwCUMKNwMR
	yvCmRXYnXSP/3h6CPZ8Dr8xCVn4lSQeyhuePmkchYH6ZL0rgyTEBGfWVQVZyVMgtL0AQdUal94N1v
	NyCQVm0G0LesGUt0k3dEIOQU8+DinsEQZDFWMFqmdkDXyTbdmj49J7IIyzFvTdy4QpPI2FH5nMxfw
	s2BgmBKCR7JabHwx20YCS3+rQDBo88h/v4/+obLrBJOmcoZOI3HgDC8YELr/2MiMZ8TAbrC8WXqV9
	2GA68+9rRpoRDZEeByeetDTTfwIogMagASKfB0CvE3E0H8AWHSSNDvPFtyZ57qq4cCQOKG42ck5+u
	Jr4NDr25Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHuH2-0002d7-Sg; Wed, 31 Oct 2018 17:27:20 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHuGz-0002ay-8n
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 17:27:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id g21-v6so7935979pfi.7
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=c+AAfyPSg6Bdkghso4fAoZ8kpHRWAa540BD2QamzIO4=;
 b=fqqCOQ1+Xf1H6++nKQTU6L2QBwzE2LSAa9FuAeFx7LJfWf3NF2QAf3Irn6hpJ23vcP
 V4yPCOc8JwKAvB7GbExsHiPYJMmnxMhwrkyTecP0SrteNaGzTCr6xv2cHsAaBqWK4CFb
 bGD+cOfXA6FNZJy/+ol7bI0emyDc+ADoEk/M6LUNPnKNE2IdAa6GweM2ZFUt12eNllAO
 SF6vb4DqRo7KYuN3G70hu0sBIf3ABD9h7OJuxdQgbJYi1YtIJvnyGQ66P4u69jnJDXxi
 azf3GwI65YDsHzmdZH+9eMnl968oeP3xofZmmPkimRLrivj0kDC13++q+HmAH+8vzDw2
 6ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=c+AAfyPSg6Bdkghso4fAoZ8kpHRWAa540BD2QamzIO4=;
 b=ttV40zEsvJiEI331rR2FrZ33btBlmQW23bWiLOlhqZ/t3YtxjlwfMQxb3doRbJxyat
 5RV/QGr7jtbC0uf9ou0rA+fyIXef0ojzChNU18l5Om6T9Ro9wOQFpXUpguQs5k+UEhSD
 1qd6YHS3IwZFVXZYKxQ6yGk24B6sg7ILT31nBO7Oj6tlfjPYyR8c8CpKs4EsUoX07wHz
 27xntjLd8g8MaURLjIdu8aRC4GWFEYQoN6JtB351arGWlIRBFuvu9+vBUEOKVEMINBA7
 Ibu1B0C98MWF527RH6E+M8g4T41rnkfhhqLwx1of3MOMsEZZIv3BHJ5vaZi/RA+ydULZ
 tRhA==
X-Gm-Message-State: AGRZ1gJ2npEEzdpsqukSfMOA3Bnm6q6a+6YNpUDFT1CfbfPhvdWgTC/K
 Ntbyc9QvRNXJhc4b1FW86wxCJ9US5+c=
X-Google-Smtp-Source: AJdET5fwA+Ltdfa8FKYsZWwM35vQQzvVRvX4j21gCC7e6pycd0MjlnPX0mKo560Vj/eVqyu6b81+eQ==
X-Received: by 2002:a62:b87:: with SMTP id 7-v6mr4320959pfl.67.1541006826531; 
 Wed, 31 Oct 2018 10:27:06 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z14-v6sm31349726pge.47.2018.10.31.10.27.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 10:27:05 -0700 (PDT)
Date: Wed, 31 Oct 2018 10:27:05 -0700 (PDT)
X-Google-Original-Date: Wed, 31 Oct 2018 10:26:53 PDT (-0700)
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_102717_312901_147615AD 
X-CRM114-Status: GOOD (  20.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 alankao@andestech.com, greentime@andestech.com, linux-kernel@vger.kernel.org,
 vincentc@andestech.com, linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031172705.K-sAay9xoeqvdJy9zXzA8UkJuUGSQIDQ6TEjPDMS7BM@z>

On Wed, 31 Oct 2018 04:16:10 PDT (-0700), anup@brainfault.org wrote:
> On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
>>
>>   RISC-V permits each vendor to develop respective extension ISA based
>> on RISC-V standard ISA. This means that these vendor-specific features
>> may be compatible to their compiler and CPU. Therefore, each vendor may
>> be considered a sub-architecture of RISC-V. Currently, vendors do not
>> have the appropriate examples to add these specific features to the
>> kernel. In this RFC set, we propose an infrastructure that vendor can
>> easily hook their specific features into kernel. The first commit is
>> the main body of this infrastructure. In the second commit, we provide
>> a solution that allows dma_map_ops() to work without cache coherent
>> agent support. Cache coherent agent is unsupported for low-end CPUs in
>> the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
>> need this solution to overcome the limitation of cache coherent agent
>> support. Hence, it also can be used as an example for the first commit.
>>
>>   I am glad to discuss any ideas, so if you have any idea, please give
>> me some feedback.
>>
>
> I agree that we need a place for vendor-specific ISA extensions and
> having vendor-specific directories is also good.
>
> What I don't support is the approach of having compile time selection
> of vendor-specific ISA extension.
>
> We should have runtime probing for compatible vendor-specific ISA
> extension. Also, it should be possible to link multiple vendor-specific
> SA extensions to same kernel image. This way we can have a single
> kernel image (along with various vendor-specific ISA extensions) which
> works on variety of targets/hosts.
>
> As an example or runtime probing you can look at how IRQCHIP or
> CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
> hooks should called in similar fashion.

Yes, I agree.  My biggest concern here is that we ensure that one kernel can 
boot on implementations from all vendors.  I haven't had a chance to look at 
the patches yet, but it should be possible to:

* Build a kernel that has vendor-specific code from multiple vendors.
* Detect the implementation an run time and select the correct extra code.

This is essentially the same as my feedback for the performance counter stuff, 
which IIRC is what prompted adding a vendor-specific extensions.

If I was going to do this, I'd split it up such that the vendor-specific 
additions are per-subsystem.  That way we can focus on building a decent 
interface for each subsystem that needs vendor-specific support rather than 
just bundling everything together where the vendor-specific stuff will get all 
tangled together.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
