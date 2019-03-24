Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAFAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 21:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776FF20989
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 21:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJzezZK4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQxHbU8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776FF20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqoUitouHqmWnDLXaojhKQ0/hiIXRiSVwRHU3wF0LE4=; b=lJzezZK4pa5kci
	W/NZW3G2sIbHM/cYyJx1skyeb/r0ScEvJ5D9EBeiSd5lrO41hNi0Esfpg2sSGJ8GBwWeRHP0lYRwv
	t0/Lcu5whq+UkvflkaSul8kyG8G4u/J5ILpQrexG+nhcJThx7CUhJNtZGFH/A3ksT3s3WFIU+QCVO
	r1MFV+SRQfAz/D2LxGL/OD5LIoMKkEB8ro3SsOhr/nvUVl0el14yeMLUtQQTEcJgzfHx4g9zA5ZEI
	4lR8x51dzUHSrY1jRoOua3svN9srizqD8HLu43vriUTkvRpb+d9asbMDH+4n9YzsoC+N5Qrh++eam
	7RLpd+iSfE6CC3w3XReQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8AU3-00006o-P7; Sun, 24 Mar 2019 21:16:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8AU1-00006T-5h
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 21:16:46 +0000
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B27CF218E2
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553462204;
 bh=GBmR9fmpp+O0Ypc2SFn4CXzytAFmr+0PXSj4Y68h3x0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HQxHbU8vuMnDsHRFu/GBRs+Q5cTx8uSe9faXWinxPtHhScILAvk4eU9I4O/J98SmN
 lNVz/RYy9rEDX8sYzMoPBSJCshvfJkH24ebdekmvKUTzoMR+/tMZioD2Bf0HJEmDfP
 MdOSEIuRmCPXag34mZqtIV2Udl6ek8+AnuJItxM0=
Received: by mail-qt1-f181.google.com with SMTP id k14so8206846qtb.0
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 14:16:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXsluZ0OpQFvmFQznYKHBSFJU+Vy+9TLWEHYE1RbwA3RYrvQVwX
 f/XmoMt9XqCWCrUwyjkfXuoNxCj0IjfttyNQgg==
X-Google-Smtp-Source: APXvYqxUGl7AdfmV+gdN14yJICBGL+E2EuCdqCELwzFCS8tlQj1SRldU5+ITBtf38aAH1AdFMETqnofojz+lGcqZAOQ=
X-Received: by 2002:ac8:30bc:: with SMTP id v57mr17619209qta.26.1553462203824; 
 Sun, 24 Mar 2019 14:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-3-atish.patra@wdc.com>
In-Reply-To: <20190320234806.19748-3-atish.patra@wdc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 24 Mar 2019 16:16:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCJOioe63oAJVS_=jBuwxTtE79xBnOzqscV4yY_6WfOA@mail.gmail.com>
Message-ID: <CAL_JsqJCJOioe63oAJVS_=jBuwxTtE79xBnOzqscV4yY_6WfOA@mail.gmail.com>
Subject: Re: [RFT/RFC PATCH v3 2/5] dt-binding: cpu-topology: Move cpu-map to
 a common binding.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_141645_231640_00E54242 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Otto Sabart <ottosabart@seberm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will.deacon@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 6:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> cpu-map binding can be used to described cpu topology for both
> RISC-V & ARM. It makes more sense to move the binding to document
> to a common place.
>
> The relevant discussion can be found here.
> https://lkml.org/lkml/2018/11/6/19
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  .../topology.txt => cpu/cpu-topology.txt}     | 82 +++++++++++++++----
>  1 file changed, 66 insertions(+), 16 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
