Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD99CD98F0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+5HVKJ/fPeEDF+jgN42VNjUgtxplAP8cgb2qiL+uUc=; b=ClMXDMD3YADRX7
	na8WkL3ciZsFsMjGa+A5PtFpUY/GuNttLblBPpZjIkhoKz5T+raaTC4Cxa+ZqaYRefrW7hEa/+A+i
	UEAO0b/PlapP0UrMYdZxG/AtLNno2gEK+iIIW4gvVEw1NtvEMOzm6/PfSAQBaBRhHSIqNocZnVIKI
	SPeCFvt23pU1FsoHQqH1JDd80P9WoZAOOeWOGxiYFi+h6X0ZRlSPew902g2fZEdTceKGG30UN7bcK
	4nJXwYRFvbbSEFDxRgKb38touAQTRvHQlvUe92bluQiL4dzV6CwcVsTHT/L/v7DYbKXT+OikLJqZP
	ZMOGgIQHdaLixXCmIBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Dp-00000000lV6-2klz;
	Thu, 18 Jun 2026 07:31:33 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Dm-00000000lUN-2VYe
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 07:31:32 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-30bf854d5feso399615eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781767889; x=1782372689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VSCBYXCt65DixNVaZdVjTYa+6C9GG/pjQw7EWmlt+FE=;
        b=PORPBm9dJz07bwi1xn95JhRWFB33PimiOQcZo006qwJD5z4FdaFULsVLItqqmuxTar
         F7QtJtaIN6EmtUbCoKrdJNFy4sQintoYjEhhyrklAW6fOsu+R4aSwd+TrlWeLrjp+D4y
         ix6vlWSiUHeBkAfg7xdOq83MRjWJVR5IplRORBjN6kc8g6MVUhBpBYzYgzaOCoK4OET5
         6zFS8TqMSScNwFjl9rk5VbVKEajXc/2eV/aHwvG2Xz1MBdPXS57jFSmZsZdit2rnrIR8
         uFnsI86xdsJgOpyfye3iGq6XjLU7q+LmDpRB3OQ+oF7IHVm6vzSAHgPJaejj7iT4YjLX
         qAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767889; x=1782372689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSCBYXCt65DixNVaZdVjTYa+6C9GG/pjQw7EWmlt+FE=;
        b=EQDZRIHHj6IYSZ4JnXvJENtBqSXUa4PXdVUneluIzXYoOr/PFZnNtAxuWqEmVR01kj
         Vx1BqZpOe757/AKP0WbCfu08mQ1lYjWKHSlbOZHR8usJx1U+3ypFQqrs6W0F82LSoJwr
         t2cim+9DoN5a4Db5lvhU3PBKD73TfGXz3cv0zq5tLDQ3KHg3pyBVY+pehaddXQGsQvqH
         IOsFvUFLmWsCguDdY89vCBeUgKycN9KW1t17Y7Cm3xha5x73TGChChnE2bh9YJB/6l11
         qlr63HYytLX2L2eNgPU0sg3/yc5GYBveG7mVbiMRhpQAF+tQlqMZMuuX+fI9nIn/Q2ZU
         ZpUw==
X-Forwarded-Encrypted: i=1; AFNElJ9+gqGAk0CJTazb6kBopNJlwAmP3ORzSnUC8Tvwpgv76Is/vc5WPmyu9GSRUB6iB5qLkM6ikRPdWRujsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBVc/2wvAmX7CdRNTmgQEwHAFz4hjdMUPzxA8+Uf7yzCOD8Zao
	20H3v4QiH8pA5WKSDTOP4Gp8xX+x2MMQCIcxhf+j3riUd+LvSHIv0IEO
X-Gm-Gg: AfdE7cktBja+YskJiJj9Ea4353iNn2PHbN4Q9tho8qFYp+4o258QxjrLTpeS746Xmmd
	8sx3k0hDDS+Zm2pWqIzkbUvDBVzC2GNeEdHgzUBrUsI6RYHxrc1vuk4Pgdzv2m2FYZb5F9RTX9n
	P9xjATjFkKTef5hoxqClchuGIUaxc8dyOitkSBF0+weaM70/rYfTL+fkuwbCMzPUJZ1mdhsvtiW
	I9sOuNfoSHWEOZT6QbMS8kxxFhfH4prk9q4ajEuD4+o/w8qfA978OiXUmI/kYQsrHqGBL7gXfWH
	wplvKncMRAx34BZf/3CrvQQA1wD538K+PfXmr/skBZaxAzmZ20/AiFG1CP/zGDCDZBp08xbqQzR
	iEeOnM+P5Z37r20POhbpYRC66ecOxBeGumQ5vKCBoZoQepkGC4bFyb4bQ9vUUYolCC7tjCPq1Ox
	7q
X-Received: by 2002:a05:7301:1286:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30bf0a2bcf7mr1930579eec.34.1781767888969;
        Thu, 18 Jun 2026 00:31:28 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm7319764eec.22.2026.06.18.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:31:28 -0700 (PDT)
Date: Thu, 18 Jun 2026 00:31:26 -0700
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
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
Message-ID: <ajOezhejx7PcOw_x@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87jys5egum.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jys5egum.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_003130_631112_E23EB3C2 
X-CRM114-Status: GOOD (  15.62  )
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

On Thu, Jun 11, 2026 at 08:22:41AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> > This was again verified by checking all 32-bit values for each of these
> > functions and checking that the two version have the same behavior.
> 
> Your checking is missing some cases. branch instructions and c.jr are
> broken.
> 
> Btw, any chance that check can be added as a new kunit test case? I
> wrote the CONFIG_RISCV_KPROBES_KUNIT, but that only tests some values.

Okay I looked back over my test cases and realized my mistakes. I was
iterating through all possible 32-bit values and passing them into the
new simulate_* functions and comparing the register state to the old
simulate_* instructions. I missed the _pc + addr bug because the _pc
value I was using was 0. I missed the simulate_c_jr ra bug because I was
not checking ra.


Since I was checking against the previous version it's not possible to
do a straight one-to-one conversion to the kunit. I think it might be
possible to do something similar but I will need to mess with that to
determine a good way of doing it.

- Charlie

> 
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
