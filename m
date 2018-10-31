Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8CBECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 11:46:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C81320685
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 11:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYbuQCQg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzw8xPuF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C81320685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mojw94wfs+O2J1DchQaSXrulr7QruzJswj+CnFX7JZ4=; b=FYbuQCQgjiNZzM
	fhn6XhaRGkXWbSPK6kbUfvasLayKvCWXpARFpWve8Wf9I9mOifKi2vppxDdGSxZX7qEAyXt0Dngnd
	6APSkyCHycSrbl9F/Lx2oe7B3WD0RCMLYFb9cTylblcRlPej/y3TAR0mxtClHxUwhW18hZBniR8mK
	IxkeBMCOjP3qHNx2A8Ilqjha2/Ug2mcx0hZdgaYsThVA23ky6mLEhdjPrRyKyLRGI3xdCOsszGQNs
	joISGTY2QOq7cWyrIoLxer6JX4VHeZ1Rje1LSQBQZccDC4OCOPCoLhb502qn0WHDoGU6XZyOaCfpE
	OgtU7WCBVKPysDvIsSxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHowk-00036F-Pl; Wed, 31 Oct 2018 11:46:02 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHowh-00035A-Vh
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 11:46:01 +0000
Received: by mail-qt1-x844.google.com with SMTP id v1-v6so13013643qtq.5
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 04:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+oC7J1e9wI7RTc5L631+Zq2WRCq00Xs6YvFyANbXVDw=;
 b=Zzw8xPuFr4bo3gzt2c4iqucxUf66fjZkPeKoNaoXIfl2dTIkfGtCTXYU6s0iIu4gir
 q1kZvZz/NHWR+RQ9UEWf6zGwT6bwN9b5X+NEg+FK7VKDjPF5C46/xfxQlQeX3yV2KhtB
 PUO+tuG6/QHGdr/58yOaj3jO052gFv7FHZcmPTP0Hp+DR3RxlNssNphZHAkHNMVCetCU
 pzKuUnhGR2ILCdXKM3vIDUvdz/srF27kvxAVDlmlGqP3j+AkFPlAbYV/1P7jRfKl/+Dx
 LXWFbq3mXOYsIYsrd8uc5zXxEH985QQZVnxHqOPg5eFbOXFDu4ORTFZCYpdmMRvsmlYC
 QsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+oC7J1e9wI7RTc5L631+Zq2WRCq00Xs6YvFyANbXVDw=;
 b=HN+FL3AK+M66nyIFbuZuCrrRDSbjROr93YTttd65FNybAwL0nTvM2p6/MinRZHzSCt
 BE/1Q01/k9JoKZxSIkuti+DhXTCHV0Rc/DCMr1nAoa0yTpDj7eYjdIioAqSeMLG9+uiw
 k2p06nH9gyqpg8q6/niGaMVRwh8pYZ6C1f0zJApK6df3LXawT9hPWn0KZmvEi4C0AI7V
 HuzUkE1sRGQuSii/g7BzpClM4TfYqcYzfXut2758fFyPwf1fIQNcpHKPV71g9fh4aqTJ
 DbBmeQCdU0RB/3HPSZuc8hVsXv1mZvAD4wlRG0Y3l+gyKZKzsTJtPLT+guEOr5o4Oisu
 /tVA==
X-Gm-Message-State: AGRZ1gKyltASlSs1tfk2EXEZ//onMrAs7b4KY0qrju0Ug3SWmWDcsjsq
 v3UsnfgCxzMrveBTmBxsu7SJIC3fr7q6pzZ/Qf0=
X-Google-Smtp-Source: AJdET5cvoP1jw8j3prxyFQMQZJ1shIqE7H4SQZ/lG7T9nYCF1j0/9pdNx4naVEm5G8VNWJtn4H7LiGQbWGiwEgqBusU=
X-Received: by 2002:a0c:d992:: with SMTP id y18mr2308393qvj.161.1540986348246; 
 Wed, 31 Oct 2018 04:45:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:988d:0:0:0:0:0 with HTTP; Wed, 31 Oct 2018 04:45:47
 -0700 (PDT)
In-Reply-To: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Oct 2018 12:45:47 +0100
X-Google-Sender-Auth: iGJj1ieP5_77ZVQnSCzEBXI6mEw
Message-ID:
 <CAK8P3a125hSg5cK_bt_4w2iLrxCETnPLHvHpFmYyRYXhjC9Bjg@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_044600_022225_E2578763 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Zong Li <zong@andestech.com>, Albert Ou <aou@eecs.berkeley.edu>,
 alankao@andestech.com, greentime@andestech.com,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 vincentc@andestech.com, linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031114547.dsIjzEaAVQ8xsN4uUaWdOsEOEjDgfOsnYJVLj5XxR-c@z>

On 10/31/18, Anup Patel <anup@brainfault.org> wrote:
> On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com>
> wrote:
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

Agreed, we did this on arm32 in the past, and it took us a long time
to change all the modern platforms (ARMv6/7/8) to be usable in a
shared kernel. It's better to avoid that and keep everything together
like we did on arm64 from the start.

One thing we do on arm32 is to support combinations of different
instruction set variants in a combined kernel through callback pointers
that turn into direct function calls when the kernel is configured for
only a single CPU type. This might be something to add later on
riscv, but I probably wouldn't do it right away.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
