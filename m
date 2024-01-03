Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B0DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jwXhV4Oe/0R/D7RU4uhN3glegEwLfAQt/YRvrVttN0=; b=JY38+TCHoivMck
	k5qEhMi3E7rID1HShPwAKqAYqMeGQe875kLCswCdwyyAMu2qYWWLSmmyqZUL23yf2clA4EXZbyVxZ
	iNaXRQSPTwXRv/67TOR8nmPmK416HvS+EH9mVzbBrCaycgA44d3IeDlwtk2UPURdY4GA073LnQ5F6
	CTNn5O3MhGwuhZTyR3y/YaatwgeTeknJ4MHKI76Wm8n8vOGoKmNXtqv4NJxSCrvJhpyIytajH0F7v
	SBDViBTlymxmh35FDAlttjG3/t07IbCSAm7/ttnWpVV4E4l1dwRxhcYqpAO3C5ZctbI9zC1zc7MOn
	eyfW7a+sn1f5k3rLjOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7ws-00C3wT-16;
	Wed, 03 Jan 2024 20:34:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7wp-00C3vY-1k
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 20:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704314082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FX7BzCsdBzWcwtB5ciPRsuFeZU5q4lF8Kx0DlbuB/5c=;
	b=P395IUIQIirb9UxWiZ+0GZCIxcmzaOv2w7GOU60QqkwBReRgiqVwHT0oTwaV1dNUQSp4YH
	PPpBtFRxEof+UZ1kX7XBNWJeQHr9OcwLQi0T4oH32+U8WgURaxOAB6JSvhTQ0q5MJGEVFu
	jWC4V6zp/IA/8NgYLjbd7TJl+xfZIks=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-mHt62vsfNOOnQKk8vwzYJA-1; Wed, 03 Jan 2024 15:34:41 -0500
X-MC-Unique: mHt62vsfNOOnQKk8vwzYJA-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-35fd673f361so127736435ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 12:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704314081; x=1704918881;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FX7BzCsdBzWcwtB5ciPRsuFeZU5q4lF8Kx0DlbuB/5c=;
        b=D5Ddb68PdRJy4Yp3bovHBOpKQFQsuif/yEauHYSAhC8jSJFp08Hy06JjQaH0sHrahy
         cD4AQZO6Yugb13M61dKfqiZDTJRYfg0P0fo1jWHqXFkqv2jRg0PVNveCuE6Pr/igLEr1
         F4mW5fd+eItmR06c5JwA9q3eQTbndPGj7Suj1kpfd590bTgP8MSpHEzLTcM0F3VtSQsE
         NgD3RA19EyQWpSSdmQFD3qdjEfgJPbYav/kQE3IPcVmXrfqcMylRWuHORW9EcQzfyH8Z
         GLq/4ztnsoKiu0Z6PLywYO/zrQPGZNYt94tuugQmEtqEksyOMKqbkbAlUMcnojDDFK8m
         mZgQ==
X-Gm-Message-State: AOJu0YzDIwlfEqFevbQ1NKzUW3AfbOabN2MUpvjNDspeXpK5L+7/D6IW
	TtwXRg7anpmUF5njhN9+rtpScqXGn31J4/M+U8bnK2QMZzwIyZlBjWIsEtV9THp8331ZV4yjOOa
	JEtOSQWqygUTrVePqFAzqvCRCOHE+KLlxFUdj
X-Received: by 2002:a05:6e02:20cd:b0:35f:ca37:c4d5 with SMTP id 13-20020a056e0220cd00b0035fca37c4d5mr16559833ilq.118.1704314080738;
        Wed, 03 Jan 2024 12:34:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElkXfRwXeQ0zLdK6u+AW5iDdQ9uJb6J5D0NvPWmHZDlgrBZS9EE8h5rwtClC0OWfUFQde28A==
X-Received: by 2002:a05:6e02:20cd:b0:35f:ca37:c4d5 with SMTP id 13-20020a056e0220cd00b0035fca37c4d5mr16559822ilq.118.1704314080537;
        Wed, 03 Jan 2024 12:34:40 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id j33-20020a63fc21000000b005cdc9b091b7sm4862359pgi.53.2024.01.03.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:34:39 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions & cpufeature
Date: Wed,  3 Jan 2024 17:34:29 -0300
Message-ID: <ZZXE1WoXaAdkrH8A@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103-4f92e1f7290975300ecc64ce@orel>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-2-guoren@kernel.org> <20240103-4f92e1f7290975300ecc64ce@orel>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_123443_654878_B9A786BD 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: wefu@redhat.com, keescook@chromium.org, atishp@atishpatra.org, peterz@infradead.org, unicorn_wang@outlook.com, paul.walmsley@sifive.com, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, jszhang@kernel.org, panqinglin2020@iscas.ac.cn, Guo Ren <guoren@linux.alibaba.com>, guoren@kernel.org, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 03, 2024 at 08:48:12PM +0100, Andrew Jones wrote:
> On Sun, Dec 31, 2023 at 03:29:51AM -0500, guoren@kernel.org wrote:
> ...
> > +#define CBO_PREFETCH_I(base, offset)				\
> > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> > +	       SIMM12(offset), RS1(base))
> > +
> > +#define CBO_PREFETCH_R(base, offset)				\
> > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> > +	       SIMM12(offset), RS1(base))
> > +
> > +#define CBO_PREFETCH_W(base, offset)				\
> > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> > +	       SIMM12(offset), RS1(base))
> 
> These should just be named
> 
>  PREFETCH_I
>  PREFETCH_R
>  PREFETCH_W
> 
> without the CBO_ prefix. The other CMO instructions we've added have the
> CBO_ prefix because their actual instruction names are e.g. cbo.zero,
> but the prefix instructions are not named that way.
> 
> Thanks,
> drew
> 

Sure, that's ok this way :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
