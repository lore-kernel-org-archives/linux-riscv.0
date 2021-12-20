Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA9CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HL72q8aQOPNewMd5hkUtJjY6ITtYrC+4RaTmRvsF9Tg=; b=Dfy33X3HLpfNgZ
	VEqIWMr84EsarARRbUEYaGI8HTjDI0Jt719654Ru4P/8+DuIBdaHd23Nqn63yHWHe9HKdQ254K7Io
	aPRYtG1BI5biC1I11aZ0jFHG1si83FX3RNqSxSgFRJUaUFPOsq9kLsMWD6kwYI4RVavNUAYxZ6ElS
	c9tKAZenCBQzHwRsmaB6PFr3Kd9tHnMRgVbgFwR/8J1hfJQ3+vRwDEYvE5Hmv0c7CzkVNn4H/Wss0
	ujag4Wa6Qb8ftnPd8BRCmcvQjAj5kPTiAyFofX8xJVeod0bS6XtpAFxfjELYjUMKp7WN0LebQ0oB5
	ar3Y+gSAXJXV755umTKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzOat-0048f6-06; Mon, 20 Dec 2021 19:45:11 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzOap-0048dc-IZ
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 19:45:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so157801pjo.5
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9utNYtF7nbB+ny8Zz1Q0qxMiDuM46joQzQmvzzrN56I=;
 b=MKzIkQMyFLCHcVjCyhCE9CFcyp/GFZNhZKLrRFLpauudskVD6/M4E35pj8N/k6PFWq
 dxzXbCQNLTbgHOaUo9lyEe52DhZrMqSOpSbWSiC3rmhawnW3Vhcd2ofHg460QmU1S3+6
 Juc6MueHrzIezVNQDFi0ziywbIuQMp2GUfwUM2IDndVk4h12Ttlu0y1YuL+IIAAcClpH
 pcO8b38Rxyzdn0ExdcWur3WTwjX7Xj4O2VV6xFK0tTaLgKrNfzqA6KUAKKatpBvJalGh
 h3U2EwBSR65pEIIFRkNWtLWYO7wI53W6Sn9vUZ+8PVeJS+fOejo7KJmGMt0hzTumzmS5
 JlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9utNYtF7nbB+ny8Zz1Q0qxMiDuM46joQzQmvzzrN56I=;
 b=Jv/4DFqxX7toBCC1YieqLGZ3IlPIFF31MSZxZ5CPwQ+2bIufpAyBUqxo22S3s1jUom
 jUAVVzpfd1zYGtVe4SlG+H2PUcpSbjuZkf7l4dvgcpa2dIQj+gNM2lhehYoOEBIGe9zr
 YtjaPr3OuXwm8oMJWsxwjVIEwkzgaFF8gM+H0IE0sORBZWFVmWxyFnzxqM3xIRaDNs47
 l91O1T2+AnlzlXQ/qbZRG4bOJLQmvMEJTK8X8fVA5SH8iVT04tLHufPoWcEhp7EuWyxM
 xx22goN3pMS6V0KbSHOxdhbpVhg/d/hTKyGKBDduYgXx7KQe2bbKUvt6RFn1sZXBWTOz
 DD0w==
X-Gm-Message-State: AOAM5325fOEDkuuuzdcseSahaLNMJzSzQ37fkx2RUUEytjR0ePwTti9q
 D2OMH6c3yDM6THFeNWkBiDFz4Q==
X-Google-Smtp-Source: ABdhPJz9fxZPk5z4s+GXQitXrpsy8xcsqun69MNxnSpmZ5tOYABVgyfGrAXKFYzahDOFlitumpiksw==
X-Received: by 2002:a17:90a:a083:: with SMTP id r3mr601594pjp.55.1640029505867; 
 Mon, 20 Dec 2021 11:45:05 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t8sm19386929pfj.26.2021.12.20.11.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 11:45:05 -0800 (PST)
Date: Mon, 20 Dec 2021 19:45:01 +0000
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level
 Makefile
Message-ID: <YcDdPUn9bAVnxb/2@google.com>
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-4-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129075451.418122-4-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_114507_640731_2024D56C 
X-CRM114-Status: UNSURE (   8.56  )
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

On Mon, Nov 29, 2021, Anup Patel wrote:
> We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile

Nit, wrap closer to 75 chars.

> which will allow users to pass additional compile-time flags such
> as "-static".

In case there's any hesitation in applying this (Paolo asked if this was just for
debugging in v1), being able to pass "-static" is helpful for our environment as
our test systems have a funky and minimal configuration (no gcc, and the interpreter
is in a weird location).  Running selftests either requires building them with
-static or creating a symbolic link for /lib64/ld-linux-x86-64.so.2.  It's generally
easier to just tell people to compile with -static.

> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---

Reviewed-and-tested-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
