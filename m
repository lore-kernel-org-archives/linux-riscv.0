Return-Path: <SRS0=vikP=Z7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E84C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 21:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DADB206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 21:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cm4jDPv4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="GgghZlxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DADB206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.washington.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQw42i4zrOEiE7l1gfYBQQxkZjKK0Mv7al/wpBYPpL4=; b=Cm4jDPv4xIcs+B
	oxyB1euTH5TgdQAAAs+AQ9YhLMkU6zElMa8NGVMaAHibIhVKF3Vk78n3LMepb17UcIUQnJ6SsQSfO
	hbWqgOc30L06Wdts1uImBMhZPJ6xqzx81SlNZZhF/Ct41C/Vv1weuMV1xTZVHn9BaoJXFjAo8x8q2
	eQdv+tS3qClo0FTdW5GZLdTUddqEhORhPW2/xbfBf19ytqqcxtDB6DCXBwBXPmE0EtAShckQgHvwl
	/cmHuixJzuEGvj7kw4sxvJcKREYBRh4yJq1I7jLoG670jJpvvsL3PZ0QQLooejqARnytTsSPAk7wT
	SqFqm/c6hedysrer3Szg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQH8-0008BX-KE; Mon, 09 Dec 2019 21:09:02 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQH5-0008Aj-7d
 for linux-riscv@lists.infradead.org; Mon, 09 Dec 2019 21:09:00 +0000
Received: by mail-il1-x143.google.com with SMTP id p8so14035656iln.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 13:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs.washington.edu; s=goo201206;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AQw42i4zrOEiE7l1gfYBQQxkZjKK0Mv7al/wpBYPpL4=;
 b=GgghZlxE2UW0nZzjkBKGxpSYQGQqwLAtELejS5BlXB6fEFYQg+GEozmoauAoFPHA/3
 cR5ciYpYnPiDfffi5ofOYvxHIDkLLUNT86+jiqb74REnNP3riayaCXpF30VuZo9z18Wf
 iCH43boNR9Kglx6KaZE6Bz8bnb91nvZ4kRIZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AQw42i4zrOEiE7l1gfYBQQxkZjKK0Mv7al/wpBYPpL4=;
 b=LoWvsaXZmgvRQzqrRjn5SGGzdKishoVao1/GptHYnpjJeoPfkQukQWqTcVYS/kksf4
 3E+FHBcfyPp7IY5MXarPncR5XeYTv+D/oAaBmXJ220ez24g9uPy2PhVM3BNyMMaGzZL9
 D5Jrlza2m6dnhbyO5ie0vadR684c6ELc+l//74JjSVrJKvERAS3lMKThsyy7HMowYiwy
 p/Vj0SyXQ+GaCZEPyKKA9NTb97W6oO4q/utbFsk1ErNmEtnNMMirA5feFA/u6x9b6edw
 WXtXiLrBtiUHnLTXba1D6ZWHeOsG8HBAjgOk6XJ73L+dmjNXjQkD+VUTJN9HukhPSVbj
 GLuw==
X-Gm-Message-State: APjAAAW2+G9JzsUjQWbJ9FASh7YNQ3KPMWyT37laSBc70ZHfAqa7JDu3
 Y2K13Q5P4KhvE8sTS0eFJdHowu8/ZtFu1z1D6rFGgg==
X-Google-Smtp-Source: APXvYqzild6VW6epyzUHodkZ6hBxH6+Vozoi6KWDPVVvdVY34P7P9ox4LxSF+V93EAmpDQA5MLv18ES3t6MGaxB5vQ4=
X-Received: by 2002:a92:86c5:: with SMTP id l66mr29155216ilh.280.1575925736421; 
 Mon, 09 Dec 2019 13:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
 <20191209173136.29615-3-bjorn.topel@gmail.com>
In-Reply-To: <20191209173136.29615-3-bjorn.topel@gmail.com>
From: Luke Nelson <lukenels@cs.washington.edu>
Date: Mon, 9 Dec 2019 13:08:34 -0800
Message-ID: <CADasFoDOyJA0nDVCyA6EY78dHSSxxV+EXS=xUyLDW4_VhJvBkQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/8] riscv, bpf: add support for far branching
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_130859_296146_C50804A4 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Netdev <netdev@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, linux-riscv@lists.infradead.org,
 bpf <bpf@vger.kernel.org>, Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 9, 2019 at 9:32 AM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com=
> wrote:
>
> This commit adds branch relaxation to the BPF JIT, and with that
> support for far (offset greater than 12b) branching.
>
> The branch relaxation requires more than two passes to converge. For
> most programs it is three passes, but for larger programs it can be
> more.
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com>

We have been developing a formal verification tool for BPF JIT
compilers, which we have used in the past to find bugs in the RV64
and x32 BPF JITs:

https://unsat.cs.washington.edu/projects/serval/

Recently I added support for verifying the JIT for branch and jump
instructions, and thought it a good opportunity to verify these
patches that add support for far jumps and branching.

I ported these patches to our tool and ran verification, which
didn't find any bugs according to our specification of BPF and
RISC-V.

The tool and code are publicly available, and you can read a more
detailed writeup of the results here:

https://github.com/uw-unsat/bpf-jit-verif/tree/far-jump-review

Currently the tool works on a manually translated version of the
JIT from C to Rosette, but we are experimenting with ways of making
this process more automated.


Reviewed-by: Luke Nelson <lukenels@cs.washington.edu>
Cc: Xi Wang <xi.wang@gmail.com>

