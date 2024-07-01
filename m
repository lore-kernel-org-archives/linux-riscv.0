Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE9C30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mJxVMbgw6nCPlHjnqIEq3r5kdZY96wby+X9o3ExzHGE=; b=TNaZNZix0LORc8
	4dnLE1QCxDw4HVf5Tr1KJxJTZVC9I8WIysyEAa6xBsQssHwaM81J3K45HnW9vRDKER1drFaqtNm4f
	9T+VdexmypH2RkVf1UNdFyngFwlLSKv2p+yi+ZpzEN60K8uoTANR1M++qfc2T5Clh0t7oZF/ZO7g9
	Ik/DzgVEa6ljzCkSIf0F6TsopZWs0q9zLA5b3g95pujJ/kNA30dkJp+PAzN59vxP9KPVKCoULAXzL
	YfrPQvPAj1kIN/+Mbk2T0v3IV4COYHxjuOQy5l0P6ls2RtaZVUwV0mVatDrGnEqEHMSk9LU/ToHLp
	D421/QDx4slhxG+O7qmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD1j-00000002O2X-1RcA;
	Mon, 01 Jul 2024 09:08:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD1g-00000002O1K-246K
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:08:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70675977d0eso1552796b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719824923; x=1720429723; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6WXKhVquxKBmnuaSl24UzTN3kZgvXon5QTzrgZIhbvA=;
        b=UesxgOJdevA7hwLCQTnZbIVX72hEM+0aHUeTuFX22NNCpSNAsFDZ6t0yt1NeTzrEhS
         +LRwCcH7o8S+D8Ie41ZctMvR+fQCduKD4j2gSbTWaXq/3+gf690cLaYghrNoekcZH9mH
         56nAw0ARmuCk9Y0vvdWevgc49G71t4PeE3Yx87GqBqI33V0B5DEragTknncAMbdt71mx
         8qZBftIJ2klsGLlm3BoFe74BWzMcvhmMAKT1GEGOqvOAdTCN4wE/bk7GugT1ZoFEJytQ
         gY010sBTWKdsFfLag8skAP8uLMuz4enrRa0rbm3dyes2nwipUEKpmpUXlSIJgQ8zZj95
         f4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824923; x=1720429723;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WXKhVquxKBmnuaSl24UzTN3kZgvXon5QTzrgZIhbvA=;
        b=d4qoUuqigNWymHJsjgNdzQ0QkT0pPzPL5fGsix4OYly/EG6z+qLwJtHZmMTvBrH92g
         KvpwREUZ6tLOYuzfnEu41iGCXxj65P5S7B8xC8ar8E1XoNieHvY4zfBJHxTaw3laWU9w
         3TJ+C6yWpvOoTbzsX6FXTeOF2a09WcLGvTqWQtDPgEu0ctz5RveDxamevTM9qpnpkvsW
         anNph4tnoxKmD15wMRP/ir91a87WMZQvvBOwjH4dMO9R0+v26nYObGRMb6WQ3xixQxwY
         DSg8KDVNbc6EpdwPHlHhKUOCtIPo+i81443sa2kGr/v/3aXcj11m/emQ0dqTqgCB5/aa
         5BAg==
X-Forwarded-Encrypted: i=1; AJvYcCWpE6q/P3creXj2dnlNVcyRMG7bimuydFGgoroaNpadZQhvYF2cjX5n1i75nuP43Oe1PccEpOmG/0drHJK7EJLk59ArldbIXikSP38zvFGj
X-Gm-Message-State: AOJu0YyMQ8wWfUE65lq1qsogC3hBaHAYbRpxU8pufcO81fvFPlI0UtrE
	L5ZZEriaKJ/KmNgw43CoGVZ2AA76naBwwqQW9nPriPibDmtpmtjN0sYdhlII6UUVSATTbqO31TE
	66/gHOW8EvTSb7Rz5pEsHPpfH1n0aqQ0AnCAb8Q==
X-Google-Smtp-Source: AGHT+IEgAsh149ti0BTh6LotkCt0ngK3zcIvyoBZa1MvJ9UC3TTJagW0Wy8SZctYpGKequ7AFRSiIupiPbLEW3kmGHI=
X-Received: by 2002:a05:6a20:3d8b:b0:1be:e39d:6caf with SMTP id
 adf61e73a8af0-1bef613f895mr3744763637.20.1719824922934; Mon, 01 Jul 2024
 02:08:42 -0700 (PDT)
MIME-Version: 1.0
From: Robbin Ehn <rehn@rivosinc.com>
Date: Mon, 1 Jul 2024 11:08:31 +0200
Message-ID: <CAEEvPLBZQnG2=-+P8rS3jE0HkZjfNZy+tcZTRMw9wuLnGudkug@mail.gmail.com>
Subject: Vector on Banana Pi BPI-F3
To: Ludovic Henry <ludovic@rivosinc.com>, yangfei@iscas.ac.cn, 
	linux-riscv@lists.infradead.org
Cc: Hamlin Li <hamlin@rivosinc.com>, Tony Printezis <tony@rivosinc.com>, caogui@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_020844_552226_03D3DBA4 
X-CRM114-Status: UNSURE (   4.45  )
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

Hey!

There seems to be a large interest in running openjdk with vector on
this board out-of-the-box.
The vendor kernel have vector from 6.4 back-ported without hwprobe.
And FYI: the vendor kernel for k230 has THEAD vector patches.
Both do the right thing during context switches (sources have been checked).

It seems like we have three options, anymore?

A:
Keep what we do: i.e. no hwprobe no V.
Downside no V (default) on contemporary boards.
Hence no V coverage in CI testing and disappointed early adopters.

B:
Enable it for triplet mvendorid/marchid/mimplid.
Only V for this specific board, other boards and/or updates to this
board require new binaries.

C:
Enable it for boards with V in hwcap.
Downside boards false reporting V (1.0), such as K230 small-CPU and THEAD,
needs to be handled, safe fetch vsetvli and vsetvli v1.0 check can fix
those two examples.
If we miss a board or a new board comes out we may lack proper check thus crash.

In PRs:
https://github.com/openjdk/jdk/pull/19472
https://github.com/openjdk/jdk/pull/19679

Options A was used.

The question is if we can reconsider due to the benefits and use
another option allowing V to automatically work?

Thanks, Robbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
