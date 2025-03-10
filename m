Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFD4C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 04:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+RShWsaTuZjHVmvpo6R6xOmnhsiolLlSMtClTE12Pc=; b=cCkJ9pPoFvd0Vc
	VsAMC3n0uzqpoQ/T5oSPpP6CzcRGJv1sfsICIIGsqVlr+zAGWF2Pb/h+l1N46AELWDSdTXZVrTTlr
	imwJXZkuKqu7H/L51GFpJttZzVz90cKm8iTk8Sl9mrajdGMOl26wZTBDnmthzpTt8y1N0Ze/Hg7X/
	D02ik6oIuPfxi004X6fq9gESBps+WxosCLhd02BmnlxMSBt3TuUXuPiDuw4jh9KGeMXnxbcpE20o+
	N6EY/BN8n83vxjHl9+1ZR2aTlqRkrLTnltRpAvTdA0nsCL74Psx/RGjCVjUOaPFlYUx4HkfeyEets
	UtOCxTAQkC5ZoRHlDo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trUq9-00000001Xne-2RRp;
	Mon, 10 Mar 2025 04:34:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trUq6-00000001Xmz-0PSU
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 04:34:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224019ad9edso85840555ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Mar 2025 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741581245; x=1742186045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13ChRW79RLZKXPIzEEQT8n5qa9QFsChJtd4X7Rr3YO0=;
        b=Cns4QbN3nyNHhZLRqPKh/bEj6vKF1bC1zfjnuMxXih3OHCXx69C3vu6Uoul959LDC9
         SZFRh1qowJ4p6GzcoBxEuQOyc5Hkxp9zmxTPOdNrAr35QfPVHUCtOCSKcZv/ySOrrz8V
         89BCtPN+U6KRjw6Rzgvk3EbZU0aKU7d8vxHa58VTdu5C2FlK4TWHMQcceOwEv+5QwhrR
         hi2oU6B0DIurpc0oHC1OArpNqiZO6PpPL9mvOo8KGM+tXDTwAgMPW1rF6eljOMBSx1xi
         DG1pXpE5wfV+3EnRMOn+2Gbqdw4eyc2oOxJhmRvOv5OzUKQZ1zFgzt9LfuL7z0eK2zJ2
         4kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741581245; x=1742186045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13ChRW79RLZKXPIzEEQT8n5qa9QFsChJtd4X7Rr3YO0=;
        b=GUORHeSP0aOJHgVev8+IHvDNLHaTShSpPqG+/AqlzVS1BLbm5uFVJ3X9fN+3upyHVO
         buyPelk/RP4oXB5iZx/28/0P6gvq+jQbihiawhDzcZZNWUBMMco8cQYpnzUr74/wyvwu
         ieKl7viEnLs47N69MIDzC+yZ74jdYxczFFiaeemwvEQUAgj37UAb2k/fnOkGwDm6gw3H
         oRfuoryTaJLTtqFFkKThflSktGuNYQwULudjhxdX7KEvn6GdC1STvTwgUHm5lB9nKZwx
         HcE8BjKJ5XXNP+HkDYzr/x/XeaamoMrVPTyMpzrKawKZMhcxev0XBMXHDWABkxQdUATe
         BVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXp/p7XrsEqB3kb4gK707TNFMUA5k7YkjUG0LRoyTvY7PgCXTMttEC47BK/z+DLcBHGu6WZJopiQQQYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD6OhafrbIVN9+p3MvYBT/wjHs2ubWmxuxML9vqprohcKOAyLr
	98P+GwLtQj9EQgsCzaOOOMzkAC117HhiUtNJGTcpc0mlpwCvWHIIZFxnttq7QSA=
X-Gm-Gg: ASbGncs+vPLmg6+YWNaR1A32USa+Afe49WPq3nHhp3qaDCLENTiPDYrYIZBsF+E+mnC
	4IYnqAe3bchOslACh380HRuk1/geQK1EppYK1JeEREjaydGAssXAzsH5ihpD7Et/zFfkQ8GiSu3
	w+/WoSqaJC26p41Fb76hyDuiux7nCb7m7sKhnl7rVSD1XEi3owxoUCqv+Rd7gHoZnhUSiNN8GUe
	5yRbMGL26MhIHxzY54ed836G4NqOUOMmjPPhzGMEGggHxEMlrkvinMQFj2JHpivqEsCHZviaF9R
	NU+7la4M5NBTZKtlptkiPHHlsRL7HatlaQVDsqA=
X-Google-Smtp-Source: AGHT+IG23e6e0NfcQWHHui1UgTUeATKpxeYS9TWIFzolvcIGQw0afq6BAO5/9cuUmkmceElelfdLBg==
X-Received: by 2002:a17:902:ea0c:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-2242888b35dmr161699375ad.20.1741581244773;
        Sun, 09 Mar 2025 21:34:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:677:c5f4:a978:3253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f999sm67389125ad.141.2025.03.09.21.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 21:34:03 -0700 (PDT)
Date: Sun, 9 Mar 2025 21:34:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <Z85ruFUoBQM60Vd8@ghost>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
 <87senn3dh1.ffs@tglx>
 <Z8zb-L8bFMh_YHxO@ghost>
 <87jz8y3953.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jz8y3953.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_213406_406991_CBB1D5C6 
X-CRM114-Status: GOOD (  15.28  )
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

On Sun, Mar 09, 2025 at 09:23:20AM +0100, Thomas Gleixner wrote:
> On Sat, Mar 08 2025 at 16:08, Charlie Jenkins wrote:
> > On Sat, Mar 08, 2025 at 01:37:30PM +0100, Thomas Gleixner wrote:
> >> On Wed, Mar 05 2025 at 16:43, Charlie Jenkins wrote:
> >> > Architectures using the generic entry code can be optimized by having
> >> > syscall_exit_to_user_mode inlined.
> >> 
> >> That's a pretty handwavy claim. What's the actual benefit in numbers?
> >
> > I put the numbers in the cover letter! Here is the data I gathered:
> 
> They should be in the change log as the cover letter is not part of what
> ends up in git.

Yes good point. I will add this data here in the next version of the patch.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
