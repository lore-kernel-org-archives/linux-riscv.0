Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE6CD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvbYer5lw0cnFciB10lGIYm0FsUi5jYh7Osw8BwcTv8=; b=QwNG0yCKeRTPq7
	nduyKsgwTR1qXCe/By0nt0tDno0w3aDmC5P1ua4vMwV7Q4WJGNvFKoNC46RNqpabsnEopL3B5U5hS
	mVSewJSRE/wSBGbOPHNG0x/tznEIbWNqRKXp9ilp918nHghnXR+c540s6uw8s/Si+HoB1sKywJ+t4
	VVzxkbE3cFRBA5ogBJ5AAncwRua5Uv8PTViqPKiICY8woFnPapw0baJ5kg9rZjxQBudwvu0M77i/l
	UcyWN+0+yo+v6ke6TO74DSwd1Cvebs/C8aGf6LIBjSA0qgt2fC3wNYIqOllSvUZijl7d8hcYb1FHQ
	icFPuxu8kUlT4kMK0PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMsM-0000000FHCd-1k7y;
	Tue, 16 Jun 2026 06:02:18 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMsJ-0000000FHBg-0zqH
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 06:02:16 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-307631dbfedso8823414eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589734; x=1782194534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pI5rWxtEe50KjcsP0jF926SZexIl8kuuOKapFR5YRg=;
        b=QAccRqQCduxGPRvsQTx53WlGOx1A7O6L+buXDsC0JjjuCyzlpjBpGRJsMHGFYIi+mU
         IuKq1c8c1JHDeFOZP9ewoUYD18haJBaGFQaPMg73IMCs2Hu8UKqAZIC/0dfFahLntXyj
         OQs3hRkkPJXc2gupkj3fQ0APa+NZj0vpQ+Gtk79F5bB9ipEkzlLHVuS30ZC0iA5sIr+9
         F68lsF8T/u1RDc76yrpwbdsXepfikbqYfEbjxzke/GiNRGr7yJ3UpC/T7rK6R9XFnEee
         MkMjDpfoL6XUD4nUAaJw297+hzVmnMuPcO+vsr9WM9k+LxbUW9b6diZZmbugt/onmEqq
         oBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589734; x=1782194534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pI5rWxtEe50KjcsP0jF926SZexIl8kuuOKapFR5YRg=;
        b=U7nYN1MRphbXHm5DZmMSvsrHiIINwxpSC5POSic4w+zJ1Fea+wIyqHYT55SL9dHLH/
         YY6yFXz1Rg9kjr5ch6Xo69GA8KnlCRnBsLasbb6gLNhFaAqYHbt1fP4e7cSg40SnFNIJ
         oz+9JcTe0FOroZhmx+zF9+BULD8Qd7jf4446CZG8nsvhKBe51yGSu8fJNK9ZmlYeiu/r
         nr6Ia4jBEh9ANjHd18TwbDi6QLM/z5CYkpKFvOH9iI/AWF5ABZ2hnjyh+hXjoS+0M8L5
         TF9VBNlj7V1u6rcgsl21IOwM7pFp7+6PBpWiekhzMZneyzO+FR8AMUjZ/YJhbQvXAllK
         ycbg==
X-Forwarded-Encrypted: i=1; AFNElJ+o4DBq37q7NS/t+FkChwXCiZISf48641y8TgOSo2OqnliE8+/dn92cnwCjXNkoXXOCg+bRRvKnIP+n+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQz70oPcd15MEkeBwVfrz9HrvywEefwGnZ53d6VL3GiZI0sIPc
	l34qw8pTVXYhwg2hcGMkZwrB5PIRTO1f1egwdp+fLexGTODHsSUzvOnk
X-Gm-Gg: Acq92OHVy/+4zmv/yIBuWzvnZOp8copA1xuOxnXz4nGLh6N20W2E9fxleeXK+fcbyIK
	xAOcIYoFj0SNKl7lFNJV1vtAv7EpVAoGhZIXP2T+SYsah3cUDr0YhRpzzP5iMc1EtK2WseWQDOW
	hAN1BiJ17SoP6NMAj4Ji5fRc2cFfq1oFyzsRF0k1N18JwObMFDOM6VLeL9WxSuGqo0vv64mafZT
	6PBrIb+If4ABk6uyn6WQnXhDTvJtkm3s2yP4VfwsPZcexknf+0xz8NkifyEVu5AVmQUH1ofJBGz
	fHILaUhilfnCSGI/DXD3L8b0Cd5XpcPvDhJu1xst5b03/1/vlgbkppetCDxEBe50xSSew/Q5s4j
	nqW1Zxzhob00xQLG+tx8jltS125gAXk/fdG6CREfg2VwQ3BnN5sJo8is9datih+3S5x92p+5B+/
	gZYXW9VHvPE/s=
X-Received: by 2002:a05:7300:e882:b0:304:e2a5:689e with SMTP id 5a478bee46e88-30ba5989923mr1369233eec.2.1781589734142;
        Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0357sm16552304eec.11.2026.06.15.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:02:13 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:02:11 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/16] riscv: kgdb: Use generated instruction headers
Message-ID: <ajDm49ucbj6mVRo9@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-3-54b4736a1e77@gmail.com>
 <87pl1xehi4.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pl1xehi4.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230215_299150_F793CCAF 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, Jun 11, 2026 at 08:08:35AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> > +#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
> > +	({                                                                      \
> > +		unsigned long _ret;                                             \
> > +		if ((type)riscv_insn_reg_get_val(                               \
> > +			    regs_ptr,                                           \
> > +			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
> > +			    _comparison(type) riscv_insn_reg_get_val(           \
> > +				    regs_ptr,                                   \
> > +				    riscv_insn_##_insn##_extract_xs2(_opcode))) \
> > +			_ret = riscv_insn_##_insn##_extract_imm(_opcode);       \
> 
> Should be
> 		_ret = _pc + riscv_insn_##_insn##_extract_imm(_opcode);

Hmm I am surprised my test cases didn't catch that. Thank you!

- Charlie

> 
> > +		else                                                            \
> > +			_ret = _pc + 4;                                         \
> > +		_ret;                                                           \
> > +	})
> > +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
