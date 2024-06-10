Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023CCC27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Bvc19BRb6UJYFqpUhAg5VNE2jyQfRyAmM79lbw4DVc=; b=PsKEhCKBmFcK/V
	gJppvshrxiNj68MDJYfFmAcvc/rPO05xBJPQUmZjxYN/cXUtIIoY5XfmNBag8J8AKVQMSKRYVzaFS
	DtcpwsVZA6BtlUx4mo9xZ6VZsy+mvY479+nB5SuyEzcCscVTy6VKakEvyJG5zvSgFPokAe5Ut0/ip
	UgJ5NET6Bc5BVZhAM33oifrWSqs1oIN2LDGyb8W3Cl6J5VwukSQLm4/Tic1m92k7E4XKG62huQYyZ
	6r1xV11NYZVI74MgBw2GmP3CWcpyclRRjs8igtFx5XPFHuytkrmup4RX9HuhUioGOQZNr+055w3Tu
	W9xkjQnSeq1t+wfwCkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGj9S-0000000622b-3Seh;
	Mon, 10 Jun 2024 17:49:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGj9O-0000000620K-3rkd
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 17:49:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-421798185f0so21118815e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718041783; x=1718646583; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zyb+ujtIGgfui3VzqiGKyVsxQvcv7H95kxqnj+CmxU=;
        b=lyXHOXLZlXhCnEp/AqSNnoB66M4j41pkDxdxmOJa1sITEv4K2+RGDcYubkA0JH35ix
         as54hlBLbp5BrALLG6FIAL8/fGuJ7GzfR8OIPg/yvLZVdpa44jPdN2Hn3IGKK5SSrqq/
         O9lFVb9MOYxBy4J6jXTlVqEHsuyU3tTOqSsVHlOtBsjXqlHqA7QLD99511TuOcnPIZhq
         0gV6Cc1xB69QEHV3reYZRn4T9fy56aZHa4D5FzJeR/tMfKCflSyDxLBHD6SKAzyAQiyx
         ka/YiHM8iiPKfbjpwwpy0RjlLBOIB4cDwEnGQ6a4gW4k/kodpuGFcGCWnv1Jccw8PrLu
         qeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041783; x=1718646583;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Zyb+ujtIGgfui3VzqiGKyVsxQvcv7H95kxqnj+CmxU=;
        b=VVMATBqCSiJEuJDm5KIFeQzkqrpOvp90GjS33CpoSOCpvZG4TgMAhpFKb8a3NgwIyd
         eR0ypcADA/aglIwJS5alMGWnBkpikZt6G+3lt37bNo6ZdE5yH/JbirX3yqeR+EInvVCy
         82ABKwx127JCqCNUuVxlIH1vR7PDCz+qf+GpwIny54S79MTHEMKkKn+AUsn72tZZ0+cJ
         D7K4WrCVKbub97VCGrpbmxd1WHOnhwF9of1UnzNBp8e53x+IwUGOPh4oTv39O4TvQixV
         FrC6zf34aT+7HyuMgRmr1ogpuLU4XEgUTTd5cCculqaBkP3kkmlUL0rxsoqKFfPu9Nqj
         0ZqA==
X-Forwarded-Encrypted: i=1; AJvYcCUC1aYAKC1oGWtDABg2xiRVOjbhT5T+R1xyMSGxzMolvwR+2xzq0dVY9/sJ/7lOEO2XHTR/JKXR/6fDe8wAT18xDhlHnIFUTiMoJM2mCjR+
X-Gm-Message-State: AOJu0Yx9x4LVLpsRs9bDyDCfY4tQgvqemTfEn9Z/SMCj3sgIj6JKBEuH
	jfmYdpQ6thbBrVdo7g91jhuYURY6DEGZvh+QX2ZKnjXSJ3CCPcC3X0L7GunaXhI=
X-Google-Smtp-Source: AGHT+IGOL4J84jhPB6MOYY7C/yQXa66itQV4TEzYbITX4tGHe/3k2ra5FCnezqsLOntd6VEWEWr5PA==
X-Received: by 2002:a05:600c:1ca3:b0:421:6b79:8900 with SMTP id 5b1f17b1804b1-4216b798c9cmr55824915e9.41.1718041782597;
        Mon, 10 Jun 2024 10:49:42 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e97dsm149074925e9.5.2024.06.10.10.49.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2024 10:49:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
Date: Mon, 10 Jun 2024 18:49:30 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <FD6771F5-5739-469A-9C0B-952AAC62AB68@jrtc27.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_104947_229057_DD7F0620 
X-CRM114-Status: GOOD (  17.12  )
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

On 10 Jun 2024, at 05:45, Charlie Jenkins <charlie@rivosinc.com> wrote:
> 
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..50c9f4ec8a7f 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> riscv,isa = "rv64imafdc";
> riscv,isa-base = "rv64i";
> riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -       "zifencei", "zihpm";
> +       "zifencei", "zihpm", "xtheadvector";
> + riscv,vlenb = <128>;

thread,vlenb

Jess

> #cooling-cells = <2>;
> 
> cpu0_intc: interrupt-controller {
> 
> -- 
> 2.44.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
