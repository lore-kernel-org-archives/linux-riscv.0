Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F08EF48C8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 03:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dSqypfQdauNkJBdkmnxtYYZdhhBRNAd/2xEZyPTQlU=; b=eVMcyXhSn2yaBo
	2gYFmkkDq+z7bo4oKnYNOW9HCEy8bIAtjtUaI+nAxDqZxQ2zC4JfOrTkWvFfqEemtzX2srpKwgSTu
	4tVRZEYOPwoNFvrHQgD5aMt2xptKOKNbENqrx0kpmQSut2m5dQmwqziayPSYdbQ0bI0YJEnXDcslW
	KwCx5/eRNwhWELDTCRrUxv09p0263Iq2AJsiZTQp0l/CZvpBltYLae6xj2p2MENccMQfj29Dbdn9g
	f6Am01eDL/83fmcH/px/mKsqhzFNMvXDhYMccs9MaQGJkjiGDNGqdvb9MHE+8/yj4RAuQqzjiH9yB
	gBIWeAAAsgtNLshg/+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjyI-00000002v8t-2k4k;
	Fri, 13 Feb 2026 03:35:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjyG-00000002v8V-29cq
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 03:35:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8f92f3db6fso77040166b.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 19:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1770953753; x=1771558553; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qzFSEtQ+qaXHMroLlHfklD+qEuGo29r/msTHscPRp24=;
        b=A+tEnyMSdqCvV46hdbVybf5Wqs3pxYcuRSD7NrATxkGmabMeIgUlhtfo6U0NGPue5j
         yPYvoo42cPEqfPnqcXTmx/OmEobnDPgnSb3Jbbuurs+v2chGm2IHyNMxDObcnPf5FyqT
         9wDIFvsEOLxZwBAlQaY4VSlPDy7YrG/HfDU2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770953753; x=1771558553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzFSEtQ+qaXHMroLlHfklD+qEuGo29r/msTHscPRp24=;
        b=jLC/Nq4+uGdCokvQMD7IlgsMHrIyh+WMkhOZyqD3mwMM49DeqE21BErhVKhgDa+ahn
         RIhsEYvhHrkRUaRU7LZmKDueRilzBqHY9Y3/eqIBEl6jWVh3rfAilVAq1FEKDQy1bNhT
         QEsHnVRO8ZVwpKyeNTgBIg2jf9LuDclklTpUlLTW/k3VLqBJiTyZFK8adgwpbhH7L4/j
         Oaeo4etutiqxxx+E3y681KuLhN/pJYweLKvdmy+sf1mxOoHj5jMczbKsEnoYm7BGy5AX
         yJwHKqYVMOTHaML3nyRKbUuBSAmLZSeGIQwGmKgYgVbE+OIRT2UGQUMJ8riKeQIWnlzh
         holA==
X-Gm-Message-State: AOJu0YxuEYTWAGyjQrJClk7SJ+TMM/h4JJWTx4SdTgO1W0Mc3jZxnT80
	7F1yOJ2wi9OYcd80u0bTs8Sh88gzMgYAs1Bx81Srgm6MrT71lMPrLWQKyroqe0nxj0Of4L716av
	nKwfXc8w=
X-Gm-Gg: AZuq6aK6Qley7fKwOUx1aaNSqD10Swgsq7iCZP5rp4U2XClsrWhD7NqlQH9AOK8+zqJ
	4jLuk6/ISN9J1BoRU8+M4bPgOusG4xRphAqAlBhYDuf7ZZCM0OCHbOW6CObJqE8EU5q16NFcPtt
	4jLv1Ty28FWHnySyldWZ+vdGveDgumbbOzVlMlXn0/bmGj+uF3HtZt0k4knX8uxt+u0iB5ZjRr9
	5yx/NUfYIhqGWOj1RVUI17wfCBDP14zH8Rc7rIUgAxGmV3dSwx8e2nBgA+JtpzNsR/qfdjkZVTF
	HJ2gM5R8fmJyAtb3gvGxxnQupICVycjPbgoceVx7Ywd/tBkTW1ikr0FY53HHqKJnvoY6wEwtWhJ
	B5nG50YeZPrXYGJHdT0kJAdo5fTjdLb4sHDE3xmDdQ87j9XFV0cM4ovPzjAAYzF0eXLovOORUg3
	x3jKG6GfwyfrUsjGGcSM4KsVlckM+tAlpRmqHn+MDUs+HwagJXxGyr/MdDMQbTBX0dkyAjgVcXQ
	nq7XZkHDts=
X-Received: by 2002:a17:907:944f:b0:b87:15a7:85f7 with SMTP id a640c23a62f3a-b8fb41c366cmr15052766b.15.1770953753451;
        Thu, 12 Feb 2026 19:35:53 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fa0cf9093sm79984566b.29.2026.02.12.19.35.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 19:35:53 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo654056a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 19:35:52 -0800 (PST)
X-Received: by 2002:a05:6402:4303:b0:64b:3225:b771 with SMTP id
 4fb4d7f45d1cf-65bb112fb56mr157055a12.6.1770953752743; Thu, 12 Feb 2026
 19:35:52 -0800 (PST)
MIME-Version: 1.0
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
In-Reply-To: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Feb 2026 19:35:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
X-Gm-Features: AZwV_QjR3bW_fOFlM9xikHyy41Momz23tw2RtontR2CUdx5DwgkJ5GcccKfGuKU
Message-ID: <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
To: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_193556_640009_B5C854B5 
X-CRM114-Status: GOOD (  13.65  )
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

On Thu, 12 Feb 2026 at 15:39, Paul Walmsley <pjw@kernel.org> wrote:
>
> Deepak Gupta (26):
>       prctl: add arch-agnostic prctl()s for indirect branch tracking

Hmm. In the meantime, I had pulled the RSEQ time slice extensions
stuff first, so what happened was that these prctl numbers got bumped
up from 79-81 to 80-82.

I note that it looks like linux-next ended up merging things in a
different order, and so instead left the indirect branch status prctls
alone, and instead modified the RSEQ one.

Just letting everybody involved know - maybe this was obvious to
people, and maybe this came as a surprise.

And only very tangentially related: I think the indirect branch
locking could have been just a separate bit from the enable bit. I
don't see why it needed separate prctls for "set status" and "set
lock".

On a similar theme: why is it called "indir_br_lp"? That's a horrible name.

This was supposed to be architecture-neutral, but I get the feeling
that "lp" does not stand for "Long Play" and has nothing to do with
12-inch vinyl records.

I think it probably is shorthand for "lpad", which is RISC-V thing.
Which is complete nonsense for something that is documented to be
architecture-neutral.

So the naming is wrong, and needs to be fixed. So maybe just as well
that the numbers also changed.

In other words: I've pulled this, but I expect this to be fixed asap.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
