Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC1FD690ED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=611m27siQ72Q/mx/pKzeoO9SR6mYsJ/fESp443cbH3Y=; b=aIm8HboPyIR9/0
	Tplw5uWL3U7DTIWb3eoBTvK8HzVEYk4Rtwj782owBWYQkO9eGW8S/9guE45gAiSzOjGXWS/EmqFnj
	f19tZiF1ESlJfFsJGW3QXYQyRuODOG2fiSF0+IAU7LdMyPyWZPmyQAejstwIO2V/RJ29UJJn3BsfG
	PCt8VWPr16BbCOhIhkhRMf4moLRNIf2L06PA89tZC4mdNW4HPIgFC5syEyCao4HKgS7E3SIFi0yNl
	yOQ0aJECHyNRfYCfKenvPbdWXcR0BxEXGx053pxkFbG0Ot2XKcdarOkkH1XPyZPQZhYq32OVGog1p
	bSX7UQjpXPF7CSwXFsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa6o-0000000F2Xu-3m7t;
	Thu, 28 Nov 2024 08:42:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa6m-0000000F2Wb-34yG
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:42:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa535eed875so76348466b.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732783363; x=1733388163; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqNO4mcpLsB6nl6y5oYnZ+p9PNe/HBxDvPKQfTS22pA=;
        b=pIPcKW2brdjmCIQDDEAU2hLOpuH452KGc9Bq2wy8Nsw45dj5p3/CLWyqutusJYeYyc
         WHbhlrszhxJ54y8UrdFMKExzjYlpI3dkHrm7w70d6tSyBj1yc7rzQbZWXDSSI4LuTSk4
         fTMQy/1HVlPxTTuThbzhi7pDJRa7os0tj8VHKmlg9Z4h7QJKjWv0Fzq05PRVBCTiXPy8
         pRnhIEC66K7us84dDC+gINKRljAVx2cKQOLCRZuQsJQFRSgN3OVJqYo1mrxp4hH7o4ic
         QNllwtRcj9SoKqEwu4657hXC5aJ0l/JfvqJKQc2zsx1tIwAcKc9mz9ZpFrOG9BgSoLxW
         rt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783363; x=1733388163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqNO4mcpLsB6nl6y5oYnZ+p9PNe/HBxDvPKQfTS22pA=;
        b=oVSy2Kia9BuWihfgHmlNmmM3CJ4tTJEUjUcVaVD4mymNKS08nOWIwHSMuOOqn8ao5D
         JrGiJwzlEU5q8wKC/i7qfgJrmb71XIMG9mU8c8ZpUcCs6iYsHgSEcsHbuKN70K4/E/+X
         JDo9c60HiPzKEYOMDGua5YMPp0gTqhNG6Jl2X3dkMysE7Tgd6lNm93DUGhA2z6ts6EuF
         hdzes1Ev8kD1PUGLOEsMQ3RWsbOl+ytKpptmH9pvq1bR1n/dXpAnyBzJWUS7s5zMVhUg
         Xj1ZOalT5rxrqlVApol0UUvbHUZK6sKbXyQrvV1AyMLte4ZF4hvmuGKgg5Zt1mfkxMZc
         MEOA==
X-Forwarded-Encrypted: i=1; AJvYcCWs3H1xBqAF4izJEKz3xvXXb89gZi8syoVQFtpczT1LPNKY3eniVBGMsPl5p3ysqwf17edcySggu8bPBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHg082xUUMJANqNyWb4IYpFzRAftFwd53rxkfG1m7LFiKjf+yx
	YI/3N1oMbNjdnPUO/YLWp03Qw8iZKs6NfZBIC2YUWyQ8nAXQxMZmr9RnzKG72/I=
X-Gm-Gg: ASbGncv3VX3IDfpEWpTLOyqQcwV6jFv5CXNHorLg+F8o//NMnK/PBj+91cFawKeA5Fm
	/rox5+N/vf4W/RSJH9ya7mrV0504slhVm+MfztxzU+ZeK8NA73UwTpCcRbFfW78/SPtcTrxpK95
	SXoCafjO7S4TxJYjAjuiP3TNKzYtkYSlVZZS56kqiKr6m5gd/NFSQOgq/2S3H/brPIHdGRcBGiH
	OxUnhas/ZLM2A7Q2YkTX0yOAbMRVVXTSf3mYWl+mu+fs8OCefKwVVUuMmTYoB0wU/I6awnwXESw
	pjagd+545HHeD+Lmf5kal/ryv9aJwLFdosM=
X-Google-Smtp-Source: AGHT+IEtMpQZWj4endJlLK3Ilr+mbQxtLK9EL+/Wn1Pn2YYjrHxtBwEvTjmbyjJN4oWe/ENTW6ynRg==
X-Received: by 2002:a17:907:688f:b0:aa5:d1c:3dac with SMTP id a640c23a62f3a-aa580fdd57emr475064966b.36.1732783362949;
        Thu, 28 Nov 2024 00:42:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997ffc1bsm41610466b.83.2024.11.28.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:42:42 -0800 (PST)
Date: Thu, 28 Nov 2024 09:42:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH v4 14/16] KVM: selftests: Provide empty 'all' and 'clean'
 targets for unsupported ARCHs
Message-ID: <20241128-24a975e227dd4b86393f21ed@orel>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-15-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128005547.4077116-15-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_004244_770437_D61CCFEB 
X-CRM114-Status: GOOD (  12.58  )
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

On Wed, Nov 27, 2024 at 04:55:45PM -0800, Sean Christopherson wrote:
> Provide empty targets for KVM selftests if the target architecture is
> unsupported to make it obvious which architectures are supported, and so
> that various side effects don't fail and/or do weird things, e.g. as is,
> "mkdir -p $(sort $(dir $(TEST_GEN_PROGS)))" fails due to a missing operand,
> and conversely, "$(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) ..." will
> create an empty, useless directory for the unsupported architecture.
> 
> Move the guts of the Makefile to Makefile.kvm so that it's easier to see
> that the if-statement effectively guards all of KVM selftests.
> 
> Reported-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/.gitignore   |   1 +
>  tools/testing/selftests/kvm/Makefile     | 336 +----------------------
>  tools/testing/selftests/kvm/Makefile.kvm | 334 ++++++++++++++++++++++
>  3 files changed, 340 insertions(+), 331 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/Makefile.kvm
>

Acked-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
