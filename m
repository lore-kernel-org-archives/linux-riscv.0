Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A343C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 00:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1Icmq4SGLeNoBGJxmLYTNX0Ej2zWP2LWl8K2KqI78w=; b=ocgi/OkcQZ68k7
	g5fws8NDXxpT2CCy2YBT0fYZ+hMrVNdS63ARz+CKaw5gye2hpZSRJDPgCsI267iSTDg751EAzNoey
	nEmUxwLlcDUk7jXQ5frAoBOjJU+CUngwdpDXTke3QGjkPU7l2x1Ts0bUtPUw+uQByq7P+t31vumdU
	G+biQVd0+iGwxun2heYecAEnXHDL4KazqnDKMbuo+RF+mH/y4Fv5Coe/L6l0FE5Ea0C8t2HpyT+Iz
	7MwB/aocn76gcr+FJ8jAn+8NusA8+9pGTC3eoNjhhcJmRwo4lSkbK74rwF+/QB1WkTtt7sfnNEYSv
	Zfuriuq4UpzKStdWF9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhKLR-00AwII-A0; Thu, 21 Apr 2022 00:06:49 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhKLL-00AwFz-Gc
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 00:06:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso3555088pjk.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtZMfNzGeYhMURXLY1XiggmvzmJ7zBGBwSixzSCqueo=;
 b=eBgz4Jdj3KpVL+L3DcDIANI9sXH884X7GMcuZDA3daEecFWtjgBYouZek6J44gsx+L
 JmUKgRpTPAV6vqC+BoeegczlKhnGF7v6OxI0Cy6QNJk0m4GuTizslzCIWzTcoZ/FMPqd
 QgpxrMCY8OCJxCNXDrbMqD2dSJMnxvYGTiUyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtZMfNzGeYhMURXLY1XiggmvzmJ7zBGBwSixzSCqueo=;
 b=bGkTOFCaMw7eCGsI7/jioo0QEEl8b94No3PbrX6wUhY2+sWHKNik0YGd9q25VNz2Ex
 Kfv1y4KpgIQjWUJGwtQfKx1FL6pb3AoSgc1NlIxIlNmcwqVFwfTDPcDHrG+b/x1cMTUo
 AGAGFySwx1FuGuR4z3ckt9YRe3NqdcnzYkXxGpvDhuCOYKKbNbxDaOmrbPbMzjkDa2PD
 LejeMINNTstkLPVyzBzt/ykuVYXz4o5dMYu5NH9GP0FEuDSkvhekLupIp63Oo0zAvATZ
 qPKiVt9OWeZW4/KJ6Vo5n2wkCT9lMEsM4wZPhA9io4bwcFJIdqlV+s3OAnfeB1zvZslY
 2dBQ==
X-Gm-Message-State: AOAM5330KUtxlv8IhFPxv9qqZyRNr1NNsJJ2XF+ZjT/YBa/mk+iQXUSw
 4xEBHuRqY3zGfYKt5QHzTG3dfmBvq3S7aA==
X-Google-Smtp-Source: ABdhPJwUZ02o3o5MBT8n6MGMrt+xN1PWAFYVkoIs5DF8SnTYZwrpdZebjT8ZyRj80drR/SDxakHSUA==
X-Received: by 2002:a17:902:ba8e:b0:151:ed65:fda4 with SMTP id
 k14-20020a170902ba8e00b00151ed65fda4mr23129589pls.127.1650499602483; 
 Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a17090a639300b001cd4989febasm320094pjj.6.2022.04.20.17.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:06:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: ebiederm@xmission.com
Cc: Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org,
 dalias@libc.org, aou@eecs.berkeley.edu, gerg@linux-m68k.org,
 geert@linux-m68k.org, vapier@gentoo.org, palmer@dabbelt.com,
 damien.lemoal@opensource.wdc.com, linux-m68k@lists.linux-m68k.org,
 linux-riscv@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 paul.walmsley@sifive.com, ysato@users.sourceforge.jp,
 Niklas.Cassel@wdc.com, linux-sh@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org
Subject: Re: (subset) [PATCH] binfmt_flat: Remove shared library support
Date: Wed, 20 Apr 2022 17:05:47 -0700
Message-Id: <165049954506.2420506.9909431091128831748.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org>
 <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_170643_609922_DF6DBAB8 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, 20 Apr 2022 09:58:03 -0500, Eric W. Biederman wrote:
> In a recent discussion[1] it was reported that the binfmt_flat library
> support was only ever used on m68k and even on m68k has not been used
> in a very long time.
> 
> The structure of binfmt_flat is different from all of the other binfmt
> implementations becasue of this shared library support and it made
> life and code review more effort when I refactored the code in fs/exec.c.
> 
> [...]

It seems like there is agreement that the shared library support is
unused, so let's test that assumption. :)

With typos fixed up, applied to for-next/execve, thanks!

[1/1] binfmt_flat: Remove shared library support
      https://git.kernel.org/kees/c/c85b5d88951b

-- 
Kees Cook


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
