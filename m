Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B72C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8ZlBf7ZN2KN0f4fL5aFNupayutnYa1IvtHvWxYTIi0=; b=lsg+M3S5NtTa4q
	g90MokG7P3vC0SR4yRDUMPfNAE83Z1/Wtu0Hr5PvFHkMaGstlH+y9IYTRtMHXcfhEFjzO5E7KxuUG
	4qhiqwqWjcnNYqdIqJfryJ2SKo4QwCgYcV7pQOMz1Qz8Q8PdcIHfGB9kcJp+SenAoepn7OEmFZVII
	kpnOL1tUQWMy2u2Mu6/lDK/7hd29CWAbbMQwA7codIkCfi/P4iMxXNwrgSilmwf/AYX8u0M0QAkIo
	G5L5NF8ckQtK0g++YjFGXcCuIlC2kzhqLxw9UtEZFXjk/9uiFcNGzIqTwl23EomcdhLq9hHaHlnpn
	7fE6o+QjaSKzU+x8+j2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqZd-00AgcM-LH; Thu, 13 Oct 2022 05:16:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqZU-00AgXf-4k
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:15:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso3922853pja.5
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 22:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2fKthUs4mUziiU4CqwCHh9r8ONx7JO3ULHld29EKsk=;
        b=utAWPCggRIueMQ6KeVgLizosJPHa83rxDBIOjoURrmd1jqYRxPCwB4eNU7H7+Dimoh
         FjLZau4AI6wRWn6020MOJrJwaxA3U6b3XLFp6eofKRhEzQq79ngOOWDc63s9dcYXk1iY
         sdk3QC0nttdlDYS3LrgU+8qzswobgFMlppClLCyaJl77TOt0zBuj7jhgbO7/lw/4fb1V
         06E+VeVH2RuWQhc/NFYnsFoa3vT1/yuHlM3tpfnEUlwUemcw1CbaYWUwaf1Lp9y0BoiB
         T10o8I/3ycPbQt408hneYU1asES2iHIkGGtm5bz3C1wvc4OYm5EGf+Q9+kP5Jbjr2arH
         mU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2fKthUs4mUziiU4CqwCHh9r8ONx7JO3ULHld29EKsk=;
        b=q3T3Py5/xCPKAwPuLPPvQ2zfcTwtkG/7Nt2GzJKVq29JQS+C1yJ51/wDcoXFOzqqsB
         c2Y43u2Wxqgxg5o4GhE8JwIF8orNboGbr6K2sVv0528tNip4wrCQeuB7VPp3v3txY1bZ
         tLeErAR6sd0qDinJURStNx9s/IFctghAfbcLvDdoUGZGsCIGyaL++pdE/s7e/TMx+CNX
         MZMHfgS6n8tJ1XLtqWCWPy2jf6YYABE+GGQ1MjJNoMNmYcvEacS0xjjfBdYxEINeBfY2
         S4xpPTsqxknam2fgU9HfMR1aL3qb1J4vA6juPHR3Tp2rwCSzP7t4gkU1JrY3YXrLkTXy
         gYOQ==
X-Gm-Message-State: ACrzQf2rJnlIdxiiPa/Dv/3tnZilk+q7ym8L/+M+Oe4RinI0xyVCOBIZ
	qPZ/CNUegZjth/buVYy10NQmg7uvcVcHmQ==
X-Google-Smtp-Source: AMsMyM5u1djuepnnU2uuu3C60UcV6N7mIWFslVyl/Z2skTG/RaKexnaJ413hFFivl/RifuiyvUmSNA==
X-Received: by 2002:a17:90b:1d4d:b0:20a:794a:f6e7 with SMTP id ok13-20020a17090b1d4d00b0020a794af6e7mr9219370pjb.151.1665638151098;
        Wed, 12 Oct 2022 22:15:51 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b00172bf229dfdsm11390803plb.97.2022.10.12.22.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 22:15:50 -0700 (PDT)
In-Reply-To: <20220920200037.6727-1-palmer@rivosinc.com>
References: <20220920200037.6727-1-palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Avoid dereferening NULL regs in die()
Message-Id: <166563815017.20405.14789701604613297905.b4-ty@rivosinc.com>
Date: Wed, 12 Oct 2022 22:15:50 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-2a85d
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_221552_888161_DBF9D351 
X-CRM114-Status: UNSURE (   7.79  )
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

On Tue, 20 Sep 2022 13:00:37 -0700, Palmer Dabbelt wrote:
> I don't think we can actually die() without a regs pointer, but the
> compiler was warning about a NULL check after a dereference.  It seems
> prudent to just avoid the possibly-NULL dereference, given that when
> die()ing the system is already toast so who knows how we got there.
> 
> 

Applied, thanks!

[1/1] RISC-V: Avoid dereferening NULL regs in die()
      https://git.kernel.org/palmer/c/f2913d006fcd

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
