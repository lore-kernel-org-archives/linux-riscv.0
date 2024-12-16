Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A67E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yESzRkfbN11Jxn1Sz9NmpnTLPwk6I2OocJ1SAKQ4hw0=; b=oihekaKqRx3ZFs
	sQEqgIsHWm+ydubNljshaA12dBibKYQr9c4Pyu7ZX2FIa+eEuKzh8+Vrrh/MCIS4e/ZcB1hiEGTKf
	O4TuKB9JIFctUfbABrWqTZa24PqMRfFdb0D0+8f8Nh18gIYhb3u4Kr2nDs5H66lQZKk61qp6hBTab
	fjl+KFAI0FxxXssgFwmMvw32vt/cwPSGs2OhzYXsrvCGDVovq2to2OLo9SxceFd9Qo0R5F4M2cvSF
	bMYI0j77vztYtiBbiMaMMeZXsHnWlSHIIA5QPbQz9Lo7oikvJfS0oMRHMjZFDNH3MEWtiFGlVP7fe
	47ionhcHmdzi2/KVL95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7hG-00000009a7f-3JLq;
	Mon, 16 Dec 2024 09:47:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7hE-00000009a6p-3pjk
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 09:47:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa69599b4b0so64943966b.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734342443; x=1734947243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfwhoMEmCl4bzWZVdzsW/vy74IIm23dtlmSsoG0ijCk=;
        b=fYSHqwNoXkt4shvflkUqbfkVZwcP/Rn2zbg66HnJdD1Ja/W/lPef6FQRW8JdVhG3/3
         OYCyuaaQHzYuPVWLFrYLP2VscsKsoZotcM6/0E0EjPhgjmqXHzFCI2m+Uu4BRf1bepiO
         yWeklpZrPSOaTo89p2EoYmfaeDnFdN9dbqaXMUXpAZP3pfkPlk6hejeql9GtZm9pBXaL
         O10/sT6cR/ZtLJM2npPeUb4pMLXA8+6DP+lwzcO4Sr3S4htDNbxFas+MaLoppwDzyVOT
         AaoFFLDN00iI/xG3PH7lINe5NLXRG+XhkVDYvzslywUDSbNXiP2+tyIY1QF0nVBXKi3s
         OhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734342443; x=1734947243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfwhoMEmCl4bzWZVdzsW/vy74IIm23dtlmSsoG0ijCk=;
        b=EaSfPojBSi3ZFT5mbHSz2NBBrj+hP8S0656M8h4JQZRtAjVLcUNHbiniHwE+JFomMZ
         wYBxs402mZNW9Ok+xF+fzCQJqEdyG4KY91wry0zHftT6kythWeVxFg41j6D/asjliYzH
         U8AAR5vCqbyYMI//Z0SDluREvemmS3ayeJNd4TsVVyEB0swu4BgmcRbWFO5b1Tcf1W0E
         JGZ/UZIXrETexO2ehIKthqzOW/WF4+3wzb2qGWNDszAeKjL4b+3Jk7RPxOZ+dRfdjtSH
         9m0W2DIUyuSsoC9IjK8p3k4IOvdH3sPvh8HKGrPi9+wBAoDeYaLjyBQrpfIyD37DulZX
         MWdw==
X-Forwarded-Encrypted: i=1; AJvYcCXmr4X+GRfi1JieXDvYB0DmXFZQPIZ6+ykI8ilDLVGyJXgwhtJezuy6WIVYACyeYbf8Vybt4EXlYNcO1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFA96pefwzcIQB/lWA+C4TEZYw9EgBBWIjGGesveTIcb0e7wmo
	Yr+9RdQ5eWZAjJUmYiq/i+shME615VYMYL/dOajHJ2hQjhG3uI9dJBOR9kl0/X8=
X-Gm-Gg: ASbGncvccw6gVK0RziOGDZ6Zfi+HY99pXN5BHOF/RDpKSr7UnpcN1j/LUgGMqnBCcnj
	C5U6Wv/8L4Seor27rB7I+v3ffQE9tgPsgFiyIjAcwjx/l0kkNAT/PmuqoJZpPON6QZpM9FlGHmF
	EkTZUOyyVJrcJAbD7Oq7qulGS0e7GbaMyRXKjQ7UOgFXKxTXZ1m6XW0/6jG2ecc737CvYrY0ByC
	/09YBXK0WvDkmgAdhCuK1ifUvU2vuDNgVgd88qTERm1UQLUil1bcabK3RMrXGFh3wnp8BJaxVoC
	fMM+TMEXeDl3a2NvrwgTytBRf4eNmMKslzG0kpC3Zaa67A==
X-Google-Smtp-Source: AGHT+IHFeq/+nCe5ggsaLGepw/t531rWVuUQBmDN6QoOg6H6ozKl8Rg6N9Iw1AYH27D2IAU9zMcOww==
X-Received: by 2002:a17:907:3f8f:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-aab7794039amr442095266b.4.1734342442726;
        Mon, 16 Dec 2024 01:47:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-ac7d-82cf-fd83-c610.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:ac7d:82cf:fd83:c610])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9600e02esm310913266b.15.2024.12.16.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:47:22 -0800 (PST)
Date: Mon, 16 Dec 2024 10:47:21 +0100
From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, 
	conor@kernel.org, leobras@redhat.com, alexghiti@rivosinc.com, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	parri.andrea@gmail.com, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: qspinlock: Add virt_spin_lock() support for KVM
 guests
Message-ID: <36jzgc7cpsvphw32wghpegb7t6ezsgd622bm2ws7syjj6mmah2@pameujabd32c>
References: <20241215161322.460832-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241215161322.460832-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_014724_950672_EE26D595 
X-CRM114-Status: UNSURE (   8.76  )
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

2024-12-15T11:13:22-0500, guoren@kernel.org:
> Add a static key controlling whether virt_spin_lock() should be
> called or not. When running on bare metal set the new key to
> false.

Wouldn't re-using the combo spinlock qspinlock_key be better?

> The VM guests should fall back to a Test-and-Set spinlock,
> because fair locks have horrible lock 'holder' preemption issues.
> The virt_spin_lock_key would shortcut for the queued_spin_lock_-
> slowpath() function that allow virt_spin_lock to hijack it.

I think we want the proper paravirtualized slowpath, have the
discussions stalled on the SBI side?

Btw. how bad are the performance numbers without this patch?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
