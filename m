Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E61ECCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3Nvo4fdU0IHGCrJmzb6BgoGNQRG63P/hXDO/5IxhUY=; b=Ey7pBEPMIdSkpl
	wpzUOFxDQsNOYlHCoNPapgdttPFM0pR5AhxtXEr06d0hqc0HL6kWy6ca7s8SeNGQf9SjiLHgrKqyZ
	AUVs+G0GBg4OvnfxKlsMrGXSR10TLKaz1iWVCBsQGY8KDJGcEb//QVLk0cWEb8/8cBENQHtO+5iha
	jTvfgzXhD63vGySkWHp1zxEjZLTiCD0BXMOoj7UlIWfKaLNa37luGiY6FgNQQ1EGh8asYRAV1Tt+Z
	1EOCuvwzNBbkdm3ItJ+LQAGO7hhX3ig5o0UWf4dYkTNbreoV+M77nF7WdjrZYxg9ii6VtigN+AD3D
	GxMpT5OWz/dqQ9PXAtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiwC-0000000FwiQ-0yEa;
	Tue, 28 Oct 2025 12:36:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiw9-0000000Fwhl-2Nms
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:36:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4271234b49cso792787f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761654987; x=1762259787; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyOvbQrIsm+G0Ym24/Af4gfQ7jSESa1LluzqC9uUdU=;
        b=oD9ErHYm3D1rJjnXhOgREUsNdYQwgllu7/6NI4KkCQeK7Ql4c4OLKrc/1f4d4fvSxj
         CABm54MNiu20Fd3R3aZRIs9CGyaBB/jiSDDpuOmJR5rA360nROKCjxq9GrhkVrGRJKlU
         dEyGGua9mcbucPOwE/wkyw2oPh7ptmNJDMFLNO7DxtwZde6cSXenPy/w6ELh+jOUyHTi
         xVy/9QZDaFWaK9y6912LXQJZOEka/sRcmCTthETrGRBnfffpF8/d+U9rFWZiG9ehrnWZ
         r5V2OIHtpQ/2Eo59cbmqy0Ls2MBLXRd0ZsFxeGjpq6wUV7K7MB45FX79emIBIuwesC3o
         Fw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761654987; x=1762259787;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQyOvbQrIsm+G0Ym24/Af4gfQ7jSESa1LluzqC9uUdU=;
        b=TgqXvMIzklECg3iIjc5huGt5Z3oYvLZeyGC0i3YNqHqaB0kuxn+yvX3wabqo7T/xqY
         eQG7BCOmeAO6vFb/1zDp190BHNys6kFT+LOSPcPYjYEULSFtgGJUUZ+WuoO0a3qJfQM4
         y7Gbq/YDljzRb1Amcma77seo2bqRZzaxBF1hEBzwizwIOZwh0N/enpuwcDQCOaB69YqC
         qCCJIZBFPh/IwbLmVvPGooXILbpjOn5NYGkZf/6qXkeo0gMEHiIkJkhJSAH7ebVC4Ss3
         HAI2MfQtE0C4BRbx3aiEv1gL2bYoM6rpLwah/bsbvCLZ1d8i6Ek5L6ZRElZu7Se9CwI8
         6tRw==
X-Forwarded-Encrypted: i=1; AJvYcCU1aTg/TYnqsJPp0oOsod5Ulq3KNAA1domW5tponBAs9dv0DKlH4sWZav9091cj65FEN4C2QZRfADQnsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9oCJofQiieCe0pNiLDiWYtGtfNSuFlCnXlLdNLMAgjsHPVGIT
	15f7UZv+cz2rE91X6hWYptcdytNYFDSjLu3gAT2EeH92I2R/4XTPxArKEiw0z2GH/eQ=
X-Gm-Gg: ASbGncuQoAezK+TNusixiTWdjSqdbVgnt/8kFig3Kzj1wNCs9BKAkXIrYeJKxrtDiJJ
	xgizPM20BujQ2QqLi2F2CnJo72AgAQVyhPZflDxCR9Cu23GYERZ5h3fvObWsguenm+SLijXAIOw
	bGZvT6sKo0pZGALissYqbo9IawnlQ4wJIZbGXHqwXoLbwU3y/fGu9/KQDwi/EFRF77kYjFPRqDD
	xi8R2pX4vblDgvH79Be2SWAsnNxI+whVMjPozWzxQF/lLwRo1WY+irtfzVDi0h088LmBPgbOwyp
	fAQpJbjuny+mZ+6vHfeVKgSFxvWWWg8wgikQK0SI+XXHa6YQagsUwlAMkpZTWawu9duFFlAqdvx
	dSMYfjXhqTOmS5x4SOZdedeqOnQVAr+kdVWIAe0NxyqEkcP7hbpGCBXP2VFHIBd69
X-Google-Smtp-Source: AGHT+IERzNAPCuMV5ZEd056F4yvrhY3xaFUs/IZCciZzISu1FZ3xid6ZyglBvWFh7twn6bZPyUL+oQ==
X-Received: by 2002:a05:6000:25c5:b0:425:6fb5:2ac8 with SMTP id ffacd0b85a97d-429a7e97509mr1501787f8f.9.1761654987044;
        Tue, 28 Oct 2025 05:36:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952e2e06sm20285678f8f.46.2025.10.28.05.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:36:26 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 28 Oct 2025 13:36:20 +0100
Message-Id: <DDTYKLFUE3M0.17GD0S4OSQG16@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 3/3] riscv: crash: use NMI to stop the CPU
Cc: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <atishp@rivosinc.com>, <cleger@rivosinc.com>, <ajones@ventanamicro.com>,
 <apatel@ventanamicro.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <songshuaishuai@tinylab.org>,
 <bjorn@rivosinc.com>, <charlie@rivosinc.com>, <masahiroy@kernel.org>,
 <valentina.fernandezalanis@microchip.com>, <jassisinghbrar@gmail.com>,
 <conor.dooley@microchip.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Conor Dooley" <conor@kernel.org>, "Yunhui Cui"
 <cuiyunhui@bytedance.com>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-4-cuiyunhui@bytedance.com>
 <20251028-scallion-list-c8aa5f350286@spud>
In-Reply-To: <20251028-scallion-list-c8aa5f350286@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_053629_630143_A45BFE38 
X-CRM114-Status: UNSURE (   9.13  )
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

2025-10-28T10:42:12+00:00, Conor Dooley <conor@kernel.org>:
> On Mon, Oct 27, 2025 at 09:34:31PM +0800, Yunhui Cui wrote:
>> NMI is more robust than IPI for stopping CPUs during crashes,
>> especially with interrupts disabled. Add SBI_SSE_EVENT_LOCAL_CRASH_NMI
>> eventid to implement NMI for stopping CPUs.
>> 
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> ---
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> @@ -487,6 +487,7 @@ enum sbi_sse_attr_id {
>>  #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
>>  #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
>>  #define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
>> +#define SBI_SSE_EVENT_LOCAL_CRASH_NMI		0xffff0002

This event isn't defined in the SBI pull request.

I assume it's a pure software event that the platform shouldn't inject.
If we want to reserve more events for software use, why not make them
generic, like SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
