Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F19C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPw8TC4AB+7aJhE3pgDRBwUHGLIiTo6w4lfEHyYxILI=; b=NYv9k7FM4OPx3r
	raUsA4q2iaUAeNd8iaJ75/9Ub1/knuVoK39CyOGGQB48jXU882hIhAxl77SXRHhKd+0SHFfh4jo7f
	kY1zr+AEyWuE4aBuH3RLGEDWoXkdfu7+kh4VO0Z6k+zkEyfzgclubS2tz0awC6UyMfeyedz/HSgGy
	+gcVOfJNDpz6EI5fi+td86HCBn4pf6Ur49+eNZ4n+FV9ikJLCZFoT/g8nDZkSIgkR9o+JGcPrhY2O
	y+x5MRDVkstIR6Ufpm28sVHJR0YgTsGj0FFy0z8n3RgqjG8oN1oYvo9aqy2fG5JJFD4SaAOCAWzPW
	xK5COh9zc7VlOWKikZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfa0U-00CDd5-BR; Sat, 16 Apr 2022 04:25:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfa0Q-00CDc2-Pe
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 04:25:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so13142721pjn.3
 for <linux-riscv@lists.infradead.org>; Fri, 15 Apr 2022 21:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwjZWUK23SDc9f6Fzho9lbrW12rtjQaU86s3X7g7WA8=;
 b=F34psi04KzHnYMusfXO0+Sf3dJ+pbADOBfrHzkAjvESdbhKsZSm2ygbl4eJ8nzig2M
 6I4LRslXFzO0BGeOnKyUp9HRJeF5QPCuHXGQNSY4rw5MVk8II4OdX1w478l05XQxHCaj
 ltrcULTumO2g2mcppqt0GiQ9OCt++92abzFh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwjZWUK23SDc9f6Fzho9lbrW12rtjQaU86s3X7g7WA8=;
 b=ByFN7JniBfQhl9ZEGYdeuZ/x1YqoRA6RhrMBbKE4++rlxODieQaBNyV8KD46XRB9VX
 1IYxi6CshnTOEByvs1b9AzNWr+VBGd4/zcBc7SkqTafH+JTn5VzcImL8abHukbiVe1Cc
 zmlQWA1rbcahy66P+K9oQLgm8KULoQ3VIC15jwEejWK/+SkXnrTIhLz587QkxP46XStj
 w6NaNI4ip27/PXv1aigQlLSbxBvcJGxxYf1NnaEOh059w54leqyr/XjN58jfw4UZInr0
 WrHVXDvhcfkVs170kCu7bwHoxvSUFU/TJmGBcFck/NTk/vYNwRxoZX+fsvFy1IUjNsEx
 k35A==
X-Gm-Message-State: AOAM533qOnx0TlLUKo+fJYjLvYlx9guFVgMVZeEPEW1yfu5m5dc8EtHs
 YySUqn13v0IaDOfq06mz6zxApw==
X-Google-Smtp-Source: ABdhPJzuch/i5PtXeUfpilPZbG0Ojdf8xS0zPST9o6TFZXb4i9S7hdqyz7HtmT5xcBIsyArbi7vBqw==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr2216377pjb.98.1650083153061; 
 Fri, 15 Apr 2022 21:25:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a17090a648500b001cd5137217fsm6115627pjj.47.2022.04.15.21.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 21:25:52 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: palmer@dabbelt.com, Al Viro <viro@zeniv.linux.org.uk>,
 ebiederm@xmission.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 niklas.cassel@wdc.com
Cc: Kees Cook <keescook@chromium.org>, linux-fsdevel@vger.kernel.org,
 vapier@gentoo.org, gerg@linux-m68k.org, linux-mm@kvack.org,
 stable@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Date: Fri, 15 Apr 2022 21:25:07 -0700
Message-Id: <165008310452.2715005.9013061971753495821.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220414091018.896737-1-niklas.cassel@wdc.com>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_212554_882738_FB31F8F6 
X-CRM114-Status: UNSURE (   8.86  )
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

On Thu, 14 Apr 2022 11:10:18 +0200, Niklas Cassel wrote:
> bFLT binaries are usually created using elf2flt.
> 
> The linker script used by elf2flt has defined the .data section like the
> following for the last 19 years:
> 
> .data : {
> 	_sdata = . ;
> 	__data_start = . ;
> 	data_start = . ;
> 	*(.got.plt)
> 	*(.got)
> 	FILL(0) ;
> 	. = ALIGN(0x20) ;
> 	LONG(-1)
> 	. = ALIGN(0x20) ;
> 	...
> }
> 
> [...]

Applied to for-next/execve, thanks!

[1/1] binfmt_flat: do not stop relocating GOT entries prematurely on riscv
      https://git.kernel.org/kees/c/a767e6fd68d2

-- 
Kees Cook


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
