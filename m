Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB8DC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 11:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847492073E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 11:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMqvXwAv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYbnmJqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847492073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hvxjbxUPz1fj8jg3fCtuiVWt2H5MQh8XqmSqhkDYH1I=; b=IMqvXwAv0jsoaA9snUjBFk0cV
	lbiD5nKtYbCRMumGe+A7Vnh0yn1EQW8y4aYJgPYFzFDMt0yqmuZlt1eEDsDvky0YVihAFo/ddwKEq
	uCcuoZ1MUfgH04G+uqS0/aent77cspYVJ5IBezC/VoijjeMaK4ZezfEHHJtuc/w32EF5i5SE2cNXD
	bDIjkd8QjZJYvYzXjtRLf7cTZ0h5w1zwE5tW7fcaQCJI6tv2hpkq7f4WVvSXFdc976P3ChI+/Al4w
	t2yo2hSbr/UdTxBfhSlK5euw/Law297xDrHEk6Ph0vNBBvOEVRn48JW0BU0hcU1lLfRnVMKngGyJT
	QF5i1tyDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqbCK-0006oo-JN; Wed, 01 Jul 2020 11:46:40 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqbCI-0006nC-7y
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 11:46:39 +0000
Received: by mail-qk1-x744.google.com with SMTP id z63so21771567qkb.8
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 04:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iYqF4GJWJhiq0zr8OJJzrOWqCriyzTSLkTobBVYc5/s=;
 b=aYbnmJqIMQKblPHiJRycAGb04R3B72H7jsqO/6ylS2mppwKkBIpk9UoHyuSrey4Jvy
 6BTgKhlaLOmMMEkE4nS9kML7tlq7mQndDNYznC+xFMZAGwM0g4dEEOWnMJhfTnmyeqf6
 /0VPnqwBNsXnkbmL6cJyjYO1SnqrCOj5N3RSVkj8b6xd6DIj62VvqyS3RUzY2ITAfNkV
 rje1wpA18rBWsCRXuPbD/rikd6/O9Wc7eMLEw4X7l+NLoGY8RtpvOKgbKfHA4qvxaiky
 ZslzS9cEDmKfKm4YWS+xc1cgzD2dX7sqoitreAdvsynJGA0jlDiXviF0lCBODxmGfxju
 e+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iYqF4GJWJhiq0zr8OJJzrOWqCriyzTSLkTobBVYc5/s=;
 b=m2ScznK/T3rppdAAfTS/SVeJEIcqxTEWjr8lCRJHbRfZOPztWWY/LsXaI8nuZUEDoj
 Lprmr7tsQU0WDxxG1PuwCcbZJcqgy7MjkRWMP2OymXv0B6/TU5DA766VCuKFNiiN2lqd
 SwCcW4rclWBMe+m9BOQ+6Ih5xjSLV6kGAyerEXkBypIfwmMUeupP+oT1mNmneGcZs1/D
 RZIMFauXWReJOjaAWmrhfYWpfwQFSVE8AMsTu/JvOKRwfH50Q4Cp2V+wX0J6kcVUU4q4
 kA7ZhK8Fqt9mSuDiN97IVJdjCs24EHxpoc7G/9cC32m3J4t4lkXndoSwulMbDNtegeXw
 pfIQ==
X-Gm-Message-State: AOAM530pc8XBF/TZQDzk1HNrwpogeRS7LQA+Khc+6htix+jvSXFxyR3+
 Grpe4Ms4O0CWQ/MSou3czp4zIH4CJ1CseBGuTj8=
X-Google-Smtp-Source: ABdhPJwqu1fXRrwg0M7novYpBkm8DNW5TDfTOFJuqqC9PKaa+vMtnobtum6nx6izu14USV4vL6yPP+gCUj1N4kPnoVo=
X-Received: by 2002:ae9:f803:: with SMTP id x3mr23680182qkh.488.1593603995183; 
 Wed, 01 Jul 2020 04:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200626223130.199227-1-peterx@redhat.com>
 <20200626223625.199813-1-peterx@redhat.com>
In-Reply-To: <20200626223625.199813-1-peterx@redhat.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Wed, 1 Jul 2020 14:46:24 +0300
Message-ID: <CAOJsxLEYHzjgMtXgbkoWYvU+Lf_08GPkMAFqibnEwARNzxJZxQ@mail.gmail.com>
Subject: Re: [PATCH 17/26] mm/riscv: Use general page fault accounting
To: Peter Xu <peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_074638_311467_4C3AD787 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Peter,

On Sat, Jun 27, 2020 at 1:36 AM Peter Xu <peterx@redhat.com> wrote:
> Use the general page fault accounting by passing regs into handle_mm_fault().
> It naturally solve the issue of multiple page fault accounting when page fault
> retry happened.

I sent a patch to fix up riscv page fault accounting some days ago:

http://lists.infradead.org/pipermail/linux-riscv/2020-June/000775.html

However, your fix is obviously even better. For the generic and riscv parts:

Reviewed-by: Pekka Enberg <penberg@kernel.org>

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
