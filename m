Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19984CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pmza7oE3DFZjyZWzuPan4/e9nJrKKdLbdAkae5jPnPo=; b=YoAvXAP5U2IMn4
	pjHWdkDDv2FYnAHrvhVOlwsl68yj9L5D5/pOMNwsjd+7kQwKWXucTRDIdGyJQeRfqSufwVhHlmS0S
	JY1GyNevi+cKL+1llz5Yy6rGqeI48diaqvVwkN47QIQuI31OAZh6EMb5vq+g6XV7EthuBBEWrFoZD
	uovrN6uBLOsOq9arZWBpRykvwIPPKH8WXYCXU7MscC4uGIxRqcdqc3nAk6OWcesykg8vz9dvLebKn
	qxBBKVhcQV63FfQYNXd0aIDdA/F4GbaAiLeaRQYdi3TN6ZIXTUJ1Jlu/HgxEt0RssCORqtTtMoFkk
	P68H6/2am4XEo9FsLKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3TF-0000000BGjH-25KD;
	Mon, 01 Jun 2026 14:18:25 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3TD-0000000BGic-0JCd
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 14:18:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so16866095ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780323502; x=1780928302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=bikHwUSiSTd8qRSjq+tIAiauwr38INsVNhcHG7AmaiaKuceyTTl7v/7v4cpZd1rUwJ
         1QtEYb0/CaV4tpbVJMkivkANqczQbRcz8kwdzX0PXZ8wO4rKsIyLPva1fql2YpT533o8
         5vdhE9XtkiOCN67yAp/qAjh5lGB/MNDx9QLWHOt5TSp5L4R3BityNVO4pZhk5T1dST1e
         HpKihJGB6ipeYnpqA9cglPI/opH1FRUh24fzgg83CuTiJutdVD+J8Sh7NK7cmGDwoAy1
         spoin//6yiiqC4Jt/eNg/oiBD/MctgA0RtdJGoRWQIePDP6XTavKWUSt7hAWT6iSMLwa
         HxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323502; x=1780928302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=TZtvrMG0YyS2pvNuKK1XB5boehazx9PqBIrKiSAy4XMZ1RMUnrvXSk1R2reibDffDu
         ki7xuy1g1gwIG/ZHLWdIgLKVKfJYHyuBZxjgoZsAN4UH8TkGfPjFyLGkLIJKBFMs5sIy
         o39iAGVUA+Sv11b4LPKuxLsIOmtspFxhTtWInvT185CqdcmyHlCeuxK6gLO1w0q14uWh
         v7fb101TMlpr66hRysv/UXKrYuRPvRp34FaccEdOc7skIuvYd7pcH+9A1KbXwtJ3Gg2U
         0v9M8zURXl9Zv92O6zU4UhD45zJNh4kfc2qdMWc7hia9fdUmEqOPkq6wkCmBAezBvL7c
         P4BQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hOWwNwvPX6akQNLgpUccKFgNSK3soH5QreLNw0Ts21fXvfw0QfpSeKuDfsMxtlc4GtJMJDGJ46oxQYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN4h0Ki8tB1UcWBw8xpRB0b1HXSh1wRypn7ggyBpjCb6aqDnZE
	v31mZ3vI736+/LyJjthbng+zjeBOTCqw4TGVBCJlHLS5YfMK2gD03A2O
X-Gm-Gg: Acq92OG78uGCZnOzTW+qsYZrHLJsIwJUBJ+vkVpSAKGhH9uFAbAci7bXgBjJ1rskU0A
	4R3Ia6E09cWI5a4VI0Ps+V64UWveVPsC+V4GJxX9N7ZcezEX8mbCoqaHnYwxp8YWZLmfkxoTEga
	+woC+jrfUOfKvPOTs51lUT4i0oEWB+cd1836ZSRJZ7xqfA3g8mSZBHXu9vlqOs/EcTSEeqypDhk
	Clfd5U5NaToKyEQUwacpoH53C+0JfXHT7sIfGss1VTchbCfVPKAlNGJHcTBXjSLJ7ik4nG7YrqH
	DyJsb24obsgXXMz08wDQEJN22YCBOuK2WtzwZ/U5RyusDhYwdE+vmsiBXYH5lFvsSouyW6NFj4x
	xSp7QtldANee3H4KedYTg/iNIys8cXTgx83ORumNwMNCW0QzDF4kGZsUs8m0DdcSG9D7+TAxOCa
	6p84GM2TQKpX/eACf52M9VgOBmT/iXuhLqQA==
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr133870415ad.34.1780323502187;
        Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::40e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm134646855ad.69.2026.06.01.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:18:21 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>
Cc: Guodong Xu <docular.xu@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 03/10] riscv: Standardize extension capitalization
Date: Mon,  1 Jun 2026 22:11:50 -0400
Message-ID: <20260602021638.158707-1-docular.xu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com> <20260511-rva23u64-hwprobe-v2-v2-3-21c5a544f1dc@riscstar.com> <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071823_132811_D078FE0F 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Anup,

> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks for the review.

> @Paul, This patch is independent of other changes
> in this series. If you are okay then I can take this single
> patch through KVM RISC-V tree.

There is a dependency ordering I should point out. Patch 08
("riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection")
uses the upper-case RISCV_ISA_EXT_I/M/A... macros introduced in this patch,
so it won't build without patch 03. I mean, if patch 03 goes into a
different tree on its own.

But of course, I can rebase them onto your tree if patch 03 lands earlier
than the other patches.

Either way should be fine with me, your call.

Thanks,
Guodong Xu
docular.xu@gmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
