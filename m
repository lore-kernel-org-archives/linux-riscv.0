Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CDBCD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGFus//dpWeyWYWQS2dzhwu3li+w555Ge7RuYwDuEec=; b=i7RWMghGsbd9pl
	KdrZ0eZJ5d2UT4lcqQlfcqLoQ5W4zR8LzPDC9uNt+U8DZDac635d3oAX5OiKMzuFDps/yKIPH+Kb+
	exTdXWbvz3Zx1OnqOU/nD5M8ANWJu6FPd+sA8HVK+5dZo9Ww0LviukzAjHVc9THOVg3kCIx46Y4J5
	aRwAAlu/1FC6ylt+6St3+R5v6WB6CLjQWxyJsiH97fB3O5SgLHisXgyyIpYZsX5szqKik87w8b7ze
	i8qIPU3KTbe2AwIZ44t4nI8Y/lQGVGZlaHelVordMWOHkNZMH2+rZQylK6JyndBP/U7+nmIgidYca
	sH6fuFM9PWgFtCqs8Btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0fj-00000007TUy-2jKL;
	Thu, 21 May 2026 10:30:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0fg-00000007TTu-1ngC
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 10:30:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso54382475e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779359430; x=1779964230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVQEf9C3kTfOB3iadwi2yKy7Aw1jjCc/eVbtPJeGc38=;
        b=kErWjn3E9SlsFTYtP0iusCebSZ5GuUyLeK+CNqQLJEBhckif68Mganr9e8QKn0STTD
         Xmv4w4oP5mnEdZasmUjEnUjyYchzN/jPZsXYrG+EA8cWRs8My8tP/FN7KfPKCjkLad7m
         /FtoaN9Man36uIRvpIsm+Pb1vmXUpFYJQ1a2Oc1+cu1EOsVC0lY70JUV2ENOnxV56+iB
         yIr69dutEcYt+paSPLHXfn+D8Yove7NvOvW+gy+Wz7VvFi0hy+t5RxR8AhnWNYAS8n7C
         Meg6OaJbpIbjOwRwHtD5Lup0oRGhBV5KzmynE/LtvBhHSE2bEVv46DinkTI1Hrq3XZj9
         K1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779359430; x=1779964230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OVQEf9C3kTfOB3iadwi2yKy7Aw1jjCc/eVbtPJeGc38=;
        b=K3MPeHkGn3nb+jAtHDSzH25wqmZvAfmtwKMzVIFUeO8obRHxTudZhA185wXWMrHXcE
         pKpJYjdcm6dLWC7DPDE3MTuKm71X5Gg84WtAId+e4db5SDGTixEL2qFrJMkaBn9RT5/4
         J6BZaA/IM8eyePnzhB+CQM0zJF+9x+6svvO+FkAPB/IseXNdsmC0Ch32BpW2Ke54aNf3
         Kd6nxZYXOjDTAjj9lHGIUuXrZws1anPc4HQC9Lqsku9pHgFI5dxXVPqeAiX69BhTAgJx
         Y2EX/DAtzXgO4Edjr1sZSZtDR9YSPrb0SFQNlcQmGK6W3wrCeOwKmAebbPM2cVNejCTF
         Q6ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9pEpppUc2qSQTU+Q5WI+VAUUWGLeCTGhfUVmTgfZbliyOQc94dI2KICsWYrNEAxfa+lxSXCK6NiQQB5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+rBPABNxXDJXlULQzyinWD+gN8O6euyczRtGbV+xQk1nrdAl/
	fG0JjG9U/DQdrfiZShl/WYZdZv4v0ndrQCiAz9lf+1tIY9JsNg/a/Cyo
X-Gm-Gg: Acq92OEvDwdpqhFGce8lYXwWdub2QN/fgPB496KxzCkSwD0N2KudiL1+ykjoiihNyE/
	ZNeHVvQ26TPafQ+QTKvNzTgPsIgjBo74B/bEZzc/rMegzSxYybBao+B11LFOdtT4m/EHRzrCliQ
	G/ka0njADUnvrfk3yHyK1eXBxLeVbCuE5gdtbMW3nzjs1oSLV/IPMETUglui9N8s5rHXHxb1X/6
	u27xN+7Fi/L1blUlKG3bcmmrj28lxMWGlYofolu8H46bFouXxN0MQhRe096pBt+HEXd+BfXvr4q
	RcVW8cD//jzXqOOryCM7Lwmitli/Je6BNYDjpi1M5vswZ0eegAVOknngaMFhxASPf10FNVo52+r
	0Z5k0ZupUb1YYn+tLjrsFvnGK0bKOuO1dm+FrbtbG147C8PXOqwAidIuTYgsd6tjeES9wXwSxne
	qihHKIFnfblDDLwI+twq7/nG9h1cwGt3yM1uGzLuwthe++cFS1OttZDauo/DIU9nF0qvNhl0vQZ
	AA=
X-Received: by 2002:a05:600c:1c1d:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-4903607fd1emr28479395e9.7.1779359429964;
        Thu, 21 May 2026 03:30:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caf0967sm15914715e9.15.2026.05.21.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:30:29 -0700 (PDT)
Date: Thu, 21 May 2026 11:30:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Implement _THIS_IP_ using inline asm
Message-ID: <20260521113028.0f25ad8f@pumpkin>
In-Reply-To: <20260521000436.3931067-1-elver@google.com>
References: <20260521000436.3931067-1-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_033032_480806_5242A2BD 
X-CRM114-Status: UNSURE (   6.05  )
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

On Thu, 21 May 2026 02:04:33 +0200
Marco Elver <elver@google.com> wrote:

FYI the nios-II one will be "nextpc %0".

-- David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
