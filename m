Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95CDECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlv4oF9WC49kOIiWZWLmlvV/oQRqQH6bXjEwKVK5LDU=; b=iBV5b8oKZENI/f
	AUmDuVsvwGQZcpfFM/RjtbnwPGfTSGoQ+SLRmhNrMhUbyGo09hzjYrJKWLi1Q82691Bk8GZbIyRKK
	mC+XzRR/Yzvzq/Ibh2w9jaRbsBk4zr6xU4rTaWofB8ud/ljA7eD2LhikIvSTroHv8Js+BAka/9gnD
	4jwfw0u0mU0EaEOAu8UlHJ3bxcXT+vu9Uzsu7dlHNkASOoSmHHxDj3PJLVuVLj+wojGhdcEedunil
	nsRGo5bR15LyoNqMhhNiZUG790rJRcevNR5dDLB7JcT9pgCV7FhuBGXrzrMZv5jseIm4iC1RjpjEU
	Lpf+W/OFpxsSEbPG0kPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByN-00FAvU-7t; Thu, 27 Oct 2022 23:07:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByC-00FAqK-Jl
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 23:07:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id s196so3176978pgs.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 16:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3Cg4hSAtiIjg4fn0TICaEm2CR+A3G1G6cZSFVGjRNw=;
        b=Av8g1yEyrqRtyNEXn86lA8dQA/VPx5chCpzAaJr8YHh5QrQmllXTNXOUXPEOHaLTfh
         wah/v1AynDgRuQETrGf+yixPVV98WHKq97+NxSSOno8kO3DQ3jhB4U2rusKJLC4eHY1q
         wvTdtdNBgSP3+lqbOhcYy2xMoK6+NjU02/JEB32NB6KAp+5XW8ZorvJH6xFksCrpjFha
         PfR5PKVMXdkD1G2H0+2DVzam1yHTpIYi9xyvFNrvsp6EVyibEf/ArLZyc15zp3dkx/yc
         2a9nAPFMspoi8DdfPyLHMnROPkG2cRexh19jNGrSi055Js0iQvWZVKZ3RIJqFKROLbFn
         QSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3Cg4hSAtiIjg4fn0TICaEm2CR+A3G1G6cZSFVGjRNw=;
        b=I5a4jLcTy3EmIH877/+x9e0kGdKyv8lD7Qi15wOcPMhhK1zV6mfJj/vpbQ5BVgZO/X
         Yo7iAjr1QdpLbvFntzudqwmfJOMAMbNiRtk8kRCPcjG57NzaiIK2BWiZNkGfxg23rehu
         bnibFoyPlFYdRqHUklJvi6Tr/4C8NQ2PvHKOGpMFJYRZytmH6lmEuWGymqUOBlH44jYZ
         +MC1VsgXotX1nnjdfP32eGk+SF08qYPRxTSbY3G9NooXjuBNvjLB5ddJNTCjq0Sl55jy
         BcyIP2BUGKvXa8ewAHxYNMT045j7ReKE0A2SAXaTmI0kybJqv/ERCF8fn0Orddy69v3I
         QFug==
X-Gm-Message-State: ACrzQf3IelhBDCULLrpnIE4S7Ek4MPOFVtO2uofYEMf7ktlW/66wbjWF
	9e7Xub0J+KGCLmEjCZuTq+9E2NfVNtepJQ==
X-Google-Smtp-Source: AMsMyM7kN3GSvCxNiwfw+NyImUjG5pItb0YNfkTmIf3lG0wAIQ4nx3SiQhJ3M8nvIi0JCl+uWSHK+g==
X-Received: by 2002:a63:8241:0:b0:46e:ffaf:cc4a with SMTP id w62-20020a638241000000b0046effafcc4amr20467261pgd.546.1666912046644;
        Thu, 27 Oct 2022 16:07:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001867fdec154sm1688526plf.224.2022.10.27.16.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:26 -0700 (PDT)
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>
References: <20221006173520.1785507-1-conor@kernel.org>
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support detection
Message-Id: <166691074050.22328.4455408116267853696.b4-ty@rivosinc.com>
Date: Thu, 27 Oct 2022 15:45:40 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
  llvm@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>,
  Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>, Conor Dooley <conor@kernel.org>,
  Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_160728_677207_C403FA3C 
X-CRM114-Status: UNSURE (   6.58  )
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

On Thu, 6 Oct 2022 18:35:19 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> This came up due to a report from Kevin @ kernel-ci, who had been
> running a mixed configuration of GNU binutils and clang. Their compiler
> was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.
> 
> [...]

Applied, thanks!

[1/2] riscv: fix detection of toolchain Zicbom support
      https://git.kernel.org/palmer/c/b8c86872d1dc
[2/2] riscv: fix detection of toolchain Zihintpause support
      https://git.kernel.org/palmer/c/aae538cd03bc

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
