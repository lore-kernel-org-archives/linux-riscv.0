Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D177CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 03:07:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982EA64F49
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 03:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 982EA64F49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rgv2GajwdCPlNB4Ddg8FtX28ii+FgSa2BtTFZHT0YcE=; b=cBCCNyCbA0mrjNG4QnWXlL1Vk
	S/Y94DybccLxfxfPyWxwwjFZWZeU5kKQWWQ3rRISp7HlYYErh1HYWqHkDHe2RhG0mZSU9LYHiiOM/
	q89n5/n84eUpCq5UcpitIvApwYdmPgJejgqu7YI2Shbk6g0gfdRy/j6yKnLFBqaE98cqKs9ZCD3TL
	C8ZP3sm5TcELaLfngehdSp0uPXewfyJwj85wd6r87vM14m9VSfvS4qeON8C7QL9pwQj+MmA4IEqRG
	5U7sZr3waTliymT7JXMmH9k49unvi8cjNgkMsZq4fvpLvzBRSY/pywvsEESi6uI+fVMea9JNVU64D
	u3K+t8F3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l78VT-0000Bn-IA; Wed, 03 Feb 2021 03:07:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l78VR-0000Ae-7W
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 03:07:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id gx20so3714404pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 19:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WBiTH8QiguqnLOv32t9GF9mOlJTuAE6/25gykx61sYM=;
 b=M5JXY8IOoN/AO5OQf8cIeE5pJvWOwOo7jf5M5eLJ52ZDNXMRq3NNhhTha2vH5aQwYu
 foKeKzd3GaDXSQsjcskk4mTcyvW5Xw4RnTEn7rcfjhPLh07rz8ZACCAZEg2M3C1yYT59
 j+EyhqkermOi9e8CCoPGlhV0TA4qufUp+L4q6gdaZKYRZjBgmiDZsRXtJ6eyXUK/Oa6M
 nnd2e/sO+Z57GFfSYQDTPlkS4PRnhl5QF5yppnmQ880G1E77/UG7jZKGIMyTtuoECB3n
 DT2h1TAGI5KR6Ol6p7fW6qeudqA8I+4eVB/C6LbKCjWP+fEEoy/cAY2FxmNxYY/TeKC7
 AIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WBiTH8QiguqnLOv32t9GF9mOlJTuAE6/25gykx61sYM=;
 b=r3gPvdSRbGlaJXDCQraqx5l33++RQJArgrkAxw9aqQJk2vBaHrAbMsIVQZlPK9ruK9
 ethPbtmP0VySaZ1V2FwDBj8JbxeK8sUjtIDW8Pib0JZe7JZTC7mlxrPp8BqQbgNfBCW4
 E738L/xoAtdkf3MjNy4hFXBJxW9vck5j94bfkKq23btuxdjvzv6YrXmhfpN/YJvp+CjS
 H1XDnFLC08xjdnkCJ/DV0XFiIgifc+kU1UDC62n8rp1LYyaUGNCCSjS5KeEgingRUzw8
 1dgrafoCVf5/oSB83yHuNYmIrWeuHFNE2EWPzj4USMOZ9M/4zcuTFoq4BpDzJheIf/yD
 mUGA==
X-Gm-Message-State: AOAM530LgJJsGbw+fWK7VJWslKrPa5iD3K/VKNl3Xw/Srm5EMW8vwVKr
 rGsnODM9UqHA3l1HtrfTM8Y07dJKKiVNlA==
X-Google-Smtp-Source: ABdhPJws1V1h8N9CDU/SagO0L0jOxEHTfE1KH2PH0XV3/QmxsiTyPbjYe2LHodfb7doMmzJ71GFU7A==
X-Received: by 2002:a17:90b:618:: with SMTP id
 gb24mr1013574pjb.146.1612321618953; 
 Tue, 02 Feb 2021 19:06:58 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 141sm330169pfa.65.2021.02.02.19.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 19:06:58 -0800 (PST)
Date: Tue, 02 Feb 2021 19:06:58 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 19:06:42 PST (-0800)
Subject: Re: [Announcement] Successful KVM RISC-V bring up on FPGA (Rocket
 core with H extension)
In-Reply-To: <CAOnJCULY7PTcyZ4d0MiC6YBW3_ZdN3tVC4jg_wAJdJs_YeCnMQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-48f94a66-52fd-4e2d-80e8-c33bc521d0f5@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_220701_299694_1F578CBE 
X-CRM114-Status: GOOD (  20.72  )
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
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Feb 2021 00:43:51 PST (-0800), atishp@atishpatra.org wrote:
> Hi,
> We are glad to announce that we are able to boot Linux in KVM guest on
> a FPGA (Rocket chip + H extension v0.6.1). We now have three
> hypervisors working on a Hardware with H extension.
>
> 1. KVM [1]
> 2. Xvisor [2]
> 3. Bao [3]
>
> KVM bring up was done using Firesim and the detailed instructions will
> be available very soon. Here are the software versions used for
> bringup. Please find the attached boot log.
>
> OpenSBI: v0.9
> Linux kernel: 5.11-rc5 + KVM patches(v16) + few kernel fixes [4].
> Kvmtool: Upstream + RISC-V KVMTOOL patches (v6) [5]
>
> We would like to thank Sandro & Jose who implemented the H extension.
> The Rocket-H design is available as an AFI image to be used within
> Firesim or a stand alone FPGA board.
>
> We would also like to thank Andrew/John/Greg & others for defining such
> a clean specification as we did not discover any significant issues
> while doing the bring up. As there are no changes proposed to the H
> extension in the last year, we believe the current version of the H
> extension can be considered as a freeze candidate. Please let us know
> if that is not the case.

Congratulations!   Hopefully we can get this thing frozen, it's been a long 
time.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
