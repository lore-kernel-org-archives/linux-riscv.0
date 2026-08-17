Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3A5C5DF74
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YTi6YEu5oro84apJASwtxweLDOhHPpTz9D0qQ0hF88=; b=CnDZeOaDtQHxaO
	7AfXCGmrLzQbt+z2vf+J1UxM+Q2T5XSAQcKWxNhE3SfVkO+541lDY8/5j0Bgws9mN5jgHVPxibACs
	YRv6iqpXU5wLpvyKWyVNzkp8SfJJ3MiH4uvbeUXKjqaqHZw929FAG2yUwgRjM0Z0O4FzmBHFamAyv
	nDhLBVQ7y8D9GSkT05fCpE0whqyttsx7+MXXnLB+ZUBk1tbVkqDIa0Oubr8JTzvqvCMaTNobVutG1
	dHjtWd0s5po95RwK44UbJe6XehwpPGquA4cebHghZBaFkGXNV/x6kWiI9IlamnIuq/mETzvP+rFLr
	aMPMxchuQfnf++nlwmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4g1-00000006pIX-0rn6;
	Mon, 17 Aug 2026 21:15:25 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4fy-00000006pGE-1DvB
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 21:15:23 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84830c774a0so3421383b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787001321; x=1787606121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/C23C/CX4jq31Nu0aUJIPQmsjx7JRON9E+wD4xLc798=;
        b=sKdeWVz9Vi5jXecBl0KgIrQyl3ecqT2PWSUa9XC0jZGaRTwlzKJDDZOIS3KAEaaWhS
         8qhWKzDSRlmHaR541f0XyTdCssMaDWYmt6TPVqiX8nTHigVuGSxcWqNTZ2wnjhU22npL
         py4s+Yznt8lZlTTuOtIVZ0DB2QHB0C2IPXk4Br9Q13m8biw1418vnqyZAqT5bQvr8ipf
         EZT/UsmHwh9gHQg0goecZE7lOzFxKbZN+on5Dt6OFvJAHa/H7dwTBOe/JZUPk/4l5ZG3
         kfpOwN3LSTMsKUVgPmp68PBZufaBWzSwpcSbFOnNu5IgST4erGpIYhJ+Dp+J9bbLSPSd
         3Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001321; x=1787606121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/C23C/CX4jq31Nu0aUJIPQmsjx7JRON9E+wD4xLc798=;
        b=YyYQYTw9t+NSiLEZOvik03nRZGbbqTtU5MiQbWFvXYaDRBnqzGcwQ+y+wRigrk24/u
         Wt9zUWVFn7nrvkRKOxU0QPz7GDGOxfevx+bt/yQg99OSh6ngKvBYV1PabPCNNfKFFdIC
         aXCUaKE0APwK9h8gegJ1v6oVgbbwL8WzZBOkjEEyAhOlVuKAdIT4dQ08R58z/YEBGbIi
         BhhkOnEnUC1+OmEfZ+jfpM1RxD5lMy4L697SRv+PUpWdyORK7wSvwyzEYzDhcMR2zrBs
         NnLyA+Ex4V75Qcoo4Pd2Zka3yXgUdjS3K48MQHk9SnSuIL2t04hAo3mDxN9rh9YKfAIj
         4oLA==
X-Forwarded-Encrypted: i=1; AHgh+RruEyGQBG9bUOIQxx9spA84ZJoIIVb5Kdcb7r9eDujM9kD3+GfXV1GAwdOdWpybeYnQh2sW6ew4Z7qp3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoMYdEAQSpnFdmgw/y7VGgLdEPf0BNNTefinpN21l7Oyzn8KqJ
	YGSqk0UzxmTvCEa8gK+3G3N3SvcOOKVQyp5T5jf+qkwh8bVR4WhNLUEg
X-Gm-Gg: AR+sD12ZpXrpS2keqgUW2AbPOUivgXYBd+kbvCpObI2o0C4iZ6VtUW0oolDC5BDpUMC
	qkIR0eDuOKyHctwMHIxLfYBGQ5/Rp2WWl3ViRryMFQ3ebzmeH4NHMEjYJ2/gDMQSk3TlbiUYWea
	12Bc5VOrFniQC27G2rMmnLby0OETb8DEJ05F4RQrr+mFe4ySYGevOWc27WLhglr2Y+IQDWCZHtx
	kBljywILqy+dExpu2xy89w9YTDyUpivLSIIWY53Ipcs6k3fMbt7qXDPUDOk5zVmNeM1L4I6Y9Yp
	yFclnEAGBMgwRzQAKnn3/ZZ4vQ8ts/OW7oYiulgmMxPKyorXaeL9tw+xGU4Ej3CltDU3fih//xF
	YH/AF9JPGx6qffRD83pPwSHRBGq0Nl0Zb2Nq/8G0z/QXNI3k25ObEzqbP5uXnb/u1iRYh7L1i4l
	XJB7kNWTSo2p9FNuhVTp75qow7xJxhtda/y5RUJ2L3wPmLxRsFH8gBuw==
X-Received: by 2002:a05:6a00:14ca:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84fde14ffb3mr22189374b3a.1.1787001320797;
        Mon, 17 Aug 2026 14:15:20 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6f8cb7fsm820663b3a.30.2026.08.17.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:15:19 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: conor.dooley@microchip.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] riscv: hwprobe: require both F and D extensions for RISCV_HWPROBE_IMA_FD
Date: Mon, 17 Aug 2026 15:15:07 -0600
Message-ID: <20260817211507.28685-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817-unmade-dyslexic-4bb4acf535af@wendy>
References: <20260817-unmade-dyslexic-4bb4acf535af@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_141522_331778_CD99540A 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, Aug 17, 2026 at 03:14:36PM +0100, Conor Dooley wrote:
> The kernel never supports F without D, so this cannot occur.
> riscv_isa_extension_available(NULL, f) always returns false if D is not
> also present.
>
> If anything, the code in has_fpu() should be changed to only check D and
> not F to match expectations elsewhere, or F and D for the same reason.

Ah ok, thanks for the clarification.. I hadn't realized F-without-D is
already structurally impossible here, so this patch doesn't change
actual behavior.

Would you prefer a v2 that fixes has_fpu() instead (checking D only,
or F && D, whichever matches the intended semantics elsewhere), or
would you rather I just drop this patch since RISCV_HWPROBE_IMA_FD already
behaves correctly in practice?

Happy to send whichever you'd find useful!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
