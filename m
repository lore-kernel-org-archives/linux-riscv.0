Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2CDC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGPhJUq8UQhctJ5ugeOxfNQPf0+xv4huNFb3VrsfDCE=; b=iwO5YcTTmEgmrPhas5bHW4w0A1
	g6QLRP5NSfXf+5FvdWJ3eZ3ZGWAsLjHXP0vzu0jmiC40hyPF0DQ9Nhwx12T3WWOZvpoifXrC4scM1
	pQcWtkDq3E6pRufUODxaseMDcj9ExHdJ0wNm9WAF9iEBMZMZd4k/Tai5qSZZldUGLFWVD+w60E+Gz
	Bces5SyfuIwwISEh7UuxOKdo08treYQGbqJnqS8t78qKe4XIEgGS6fdBWYTixxTM3exJUwxVJJRqm
	njRosLJT5xGGUmUJTlAkuWa0zOSl5IDyiEfCq+FLAVDNCatMjSuBVbUKHWQOgpydLSFRc3ohSZMcM
	qnHzAsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkK1-000000067Tp-3COm;
	Wed, 24 Apr 2024 21:38:33 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkJz-000000067SF-0vO9
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 21:38:33 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6ed06982819so247392a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 14:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713994706; x=1714599506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCSAAudt8oKZ7AoxbtS66uOuESn00+WtuUOSOogqNgQ=;
        b=2TgBz4Ggch5zrVyAUxAv1onsHmhNQplWU9SybX5x4E5AF/x7NkLQhJLHbBFsyU9iIE
         V1lniqi4hwbHLnjxjGyGikhJUTQGkzFt49k5Qq3y4F/kYlQxr5a0+7wHrYXr2dQaWpmJ
         E4WKq+tCZhC6jOGxTnw6L300t5n0AmI2pJa262yRSOrYJ4Ed48skULSn0d87MyEqBmu/
         5NsVRpQ8i5YT8IK9okIRrFhphQFnh6DJ5lJwpDwd34F+Rv7PunGxtGSumrbbDxiT6xHI
         TPVF9uI/Fg+6ZyANYb4COfzAO+FLAsth6kiyx3IuLGo4lLwpT02qehtLf24NFJ0H7lIB
         +nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713994706; x=1714599506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCSAAudt8oKZ7AoxbtS66uOuESn00+WtuUOSOogqNgQ=;
        b=oaf+9IyrZKDX4VEh5FvWYmiHiPNP5VE+ud0dbZWTVA0AtussHJnNdRAkcypkoG4UJL
         V3wP3TxqqXCO+IFTmN1ZZr73u9FTk9G1Sm3WgbgpBRe916Q14P9JOZFFxpQmoSPSHQxD
         mjv0o2a/7Jyfc8XwawvJDJm+wXcUIrogJx7Vxpi8L/Uf74I3Ohq1Ww6LZZsVgAO9N2zC
         g2fdSEnyPuZS8+ObpALoJshv+Bww7eyhDGNeuiV46MZPldfHb60TCFXXCqBu2C9HoP0A
         zUNPBYIfIyIlb6ovCN6f9TbfMlXT16e62hnoVQ1QgkRCYTGhGYuSh9xWJ82hD0rXFMoE
         BFWg==
X-Forwarded-Encrypted: i=1; AJvYcCWRzPL1f2bs6qlvxJQXl8c17ghlnpcV17MWhblX8jXCZ0y0t7rjpLxjurjmIgK1qYx2sB1h38qLkY6b1euV9TUIqV4UmqRVNvi/LvulZptJ
X-Gm-Message-State: AOJu0Yx74BlGM4RAhaW3lhBCoagT7Phg4uTuZUM6516AkhHh83GvIjhY
	SkIerk0Bn8TkId2JVCB9nPtt4n1jX1q+DjC2MbP1Gauo4k7gWkM0PbLrZSwvibw=
X-Google-Smtp-Source: AGHT+IHZ/YT25pef4JHoXBaJ+6FQRYLNP+/n2pVh1usBYPwTHcqVXj7WcdcTLvAD0fmz1HD+0VXiqg==
X-Received: by 2002:a05:6830:148a:b0:6eb:8d07:606f with SMTP id s10-20020a056830148a00b006eb8d07606fmr4812912otq.8.1713994706315;
        Wed, 24 Apr 2024 14:38:26 -0700 (PDT)
Received: from vedvyas-XPS-13-9310 ([72.177.88.222])
        by smtp.gmail.com with ESMTPSA id g1-20020a9d6201000000b006ea20712e66sm2499204otj.17.2024.04.24.14.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 14:38:26 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:38:23 -0500
From: Ved Shanbhogue <ved@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension
 description
Message-ID: <20240424213823.GA1889117@vedvyas-XPS-13-9310>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-3-cleger@rivosinc.com>
 <20240423-poser-splashed-56ab5340af48@spud>
 <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
 <20240424-rehydrate-sloppy-62132c72fe18@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-rehydrate-sloppy-62132c72fe18@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_143831_293569_B9B609A9 
X-CRM114-Status: UNSURE (   5.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Conor Dooley wrote:
>Usually I'd just not ack the RFC patches, but I do at least check how
>far they might be from frozen before I move on, The jira for this one
>says "Actual ARC Freeze Approval:	18/Apr/24", which made me think
>a freeze was gonna happen soon.

Yes, should happen soon - expected by 5/4. 

regards
ved

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
