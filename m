Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A632CDB47A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 05:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtk/3oI3+UVrCmTaysDQlpHWLe3FyuOpi4eJNSLuSTg=; b=4WCgMkOZgkJZDO
	uwu/tPj5x8i8WfHxRc8ejN2lYUfL/O7WDXQTGxjCRgQI3VSkwpCRH1j2EWf8bsTu495ViEKS5TKmR
	Qig9zpCEGUknUaT5TaRa1/XkbrEGNvNzZSJjORqRDBT5UvQvnLrlJU3TGP0Z5dhB2ZBEghUmnE6z2
	vCYNYOslSB9UCXd8pgR+f+BywiX1c1KCyQ3kHRyZEk0PAdTg+qegmv3uW7m0EuCP6eSDmyt5yYk2F
	AxwmbxiHJiqhC2gtnh0A1hLUaQSJvGWO47A8iAzWOTjdTaNaQq3mD/7189YA5D+462s+F3v7OdEuD
	xoZBHafa5aERidYuYqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteD-00000005iSk-2iLY;
	Tue, 23 Jun 2026 05:26:09 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteB-00000005iQJ-0Kng
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 05:26:08 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3078e0dcd67so6170875eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jun 2026 22:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192366; x=1782797166; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euxUr99gVRmTKzYrxOsYTZTBpKcYj3aY+Du6bnH69fU=;
        b=oFbm8EECnXFpNnbS7qJPQu7NogfSCzFBpENsQd42ptH8hUZC0g+BEFkjgmF52iBxsu
         XJXkxEOgU4PTAWTNDXm2w4nXH3c/BB88U7xk48fPOHDavApiL/cw8+l2w90c1Ei2jNUn
         /IEP5UqBEwZoSthGK88I19MKCzFScGg4yfBxz3OQlH70Wy9/HSKLKdmf5piFp4MAIUct
         o8IRN0BmU9+DnvPoAIob7ucKe2inULCVjGtxErH9PL9fscjUbpjgMQBAma5qdybDnXux
         hPf2VCB4nGop82LGf3iH1jW8Oc8uWwY06TlSh3ggHVuuRR2ZagJ/IOqdTfEoLBJy0XR7
         fHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192366; x=1782797166;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euxUr99gVRmTKzYrxOsYTZTBpKcYj3aY+Du6bnH69fU=;
        b=djm1KtgNiuE9OXILqhCLh3vEek6oJ472l1ACW0CAR1DrUYWXv4uqqDWt6ZqDv9uZrD
         JBA8v4Crv4DR3BJGjmsmu0FgibtKIsHkJ77VbHFqWhyEIZ0Ex7327O7cP3GFXqJskeom
         SzQ9vYENcJjR+NDqqYSZ8CCSyYjp/kpS4oEL6Xy5OcUez2xafJp4gAsBO+79f2nNjrIF
         4MmxQUKry34+e9OhBrI9ulK2uqNn3IRVLw2KFjsx0nO2KFxSNuDjTyZPkpLJ9Oub8zEx
         95mDRyxALYSRjkGCkN7plgEwdzPOAEaA7pQzKLbAkTo1ceMMs697uwQkkeX1dkME/fPY
         6qMg==
X-Forwarded-Encrypted: i=1; AHgh+Rqt3fTov4pvmfZq4TfxZpGUzLCjs3wUSrt10w8Y6WIJXWkz3gfgECbK9VH5ybuzW1G3fX2UFbZceb1Dyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMVo+Dpz7fFIw5Jn3m7j74xMQRWaz1FLAmVrNkomdvHGnQV/dO
	cEmAPPcLePq+6NuFUIlxpoP0T/iDHCqUkwphtJ4sPGPyhPZmMK5ENNj5
X-Gm-Gg: AfdE7cmKcKLo7Rkdf/zQcZvCj3rTWM6me8uNNYnFEQxMB1b45UygbbGQCjBqnz0mKJl
	h+hrctLJDGpHFt9PUBerO/fHou6jurDmSExL7jZFDji/UK5JillBvVov3oDniSB60GOmz7U4QCI
	lugh73uGUZeEuV5jKYMW7UuUC4rTuCxQcEy+RiaSSU51mBElKcOm72iH4Gvxgwf6AAo62zxxk4Y
	fl9yakQtEAbhN+WB9pNdxIZIxhHxXfpwmP+I6LZaQfGdtYs7OlvRvzUCsUyMil8sIDHmCIg0xK5
	mpKQmdnWbeIdtw1iVr2irqB81X+jtvBPru9+Vl2u8AOZt5uZ6FwdwUQvZql6cvKmIlPmDaOVT2L
	m5rWNsJX3bjnkT+1lQgbl0+fbc2efWZFruLUkTfxYex4jO8EBEXMbjwFufnlk9P/J8n7T5WwuuR
	RhHws0UAo=
X-Received: by 2002:a05:7300:fd04:b0:2ea:c085:44b1 with SMTP id 5a478bee46e88-30c5b87a4c0mr708300eec.19.1782192366092;
        Mon, 22 Jun 2026 22:26:06 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4967fsm13102455eec.26.2026.06.22.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:26:05 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/8] riscv/runtime-const: Replace open-coded
 placeholder with RUNTIME_MAGIC
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Charlie Jenkins <charlie@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Charles Mirabile <cmirabil@redhat.com>
In-Reply-To: <20260430094730.31624-5-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-5-kprateek.nayak@amd.com>
Date: Mon, 22 Jun 2026 22:24:56 -0700
Message-Id: <178219229642.10927.5804159175321604816.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782192362; l=610;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=n+I3lxePERllHyfwEWyDEAhZnniet1N62LffQ9iv1A4=;
 b=BbyI070isif1KhCepDopyZNJYOc01bHzD6A+jVT3UijnT3HrwXWLYOswSXorRMeV+HlI4Inun
 OKgODIqIXrUAHVTJFNoyMxYBsj+Slz8Acjz3vKWxwe3qbx4eUZs6N2L
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_222607_113394_EC4D423B 
X-CRM114-Status: UNSURE (   7.85  )
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

On Thu, 30 Apr 2026 09:47:26 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Define the placeholder used for lui + addi[w] patching sequence as
> RUNTIME_MAGIC and use that instead of open coding the constants in the
> inline assembly.
> 
> No functional changes intended.
> 
> Suggested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

This is a great addition, thank you!

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
