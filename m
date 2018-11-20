Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA66C46466
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 20:31:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1AC214D9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 20:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqYBIUSl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="K52MWwN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1AC214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQNG/hRxjGzHzNvWTyK1vr+k8D8EOMGygXbOmFRS9os=; b=jqYBIUSlLR+HX6
	a1sHD7uWZxFLfvxKCeCVk25LvVC2U6J31TtOQWoGcODl450Y7hzI0VVUOsulVTpPc1LE2+fyy3GRa
	ohKpjQ5Pg3vfma2Bz8J40MiwGLQJsofjAD8E/vR6umVNcWu+vsNmly9XzkoS7aBrFCIOGp+cF2KfC
	Qu5nHi+HxCaQ87QUXYD3kN2kDcyIQnPkSZklIed7ly1jVzvNmPHPDfQMgTevI9pZNPG6jfw9fShf6
	DW5LqobR7DmDizvRlKVhFOTuxdcWZDo3YMUHb5RgKwvuxbkiaQMuLv/f5/hVP7vfRpZikULzOBrjv
	UTDCf23aiI0rvS2yk8xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPCfG-0004lL-S1; Tue, 20 Nov 2018 20:30:30 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPCfC-00032b-U2
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 20:30:28 +0000
Received: by mail-lj1-f195.google.com with SMTP id g11-v6so2826525ljk.3
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 12:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHQXYBlESi9ND8yKpEZyLeSHKrDeqYCCB7KMnHp3wz4=;
 b=K52MWwN4ZRoyx9SF9Eyvj7Jyts2CQ+MEZqbNVDhDyXca4haI0UcJ8Lkv/y+FtDmeBg
 ohcKHtN2IjxdDLDpBRPD7AFse9UtwiEA94kml4bF4TUQWF7VWx61mZjG6u6eVwdgz99r
 cTeTnZ6nV5Yb13wJTsU24NsYf0VUc8cUxq0D8ixW/k9/g9/v7t2HAp90YOdTYDSj9UDX
 Wni1FGeW6cI9ru3Co79/zgQ+VgxuGTMwy7IGH/LW4r0ikbdl/DVX+Ym/ERLrPFfZzGHV
 jx0AGwlpzcd4t7SVezhAVB4p+SeQGhOiHsRRqrvCa7W2q3+FgrimddCpRPAqoRvd+qhC
 3g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHQXYBlESi9ND8yKpEZyLeSHKrDeqYCCB7KMnHp3wz4=;
 b=X+890a3rKRJmCoYguJ8TDlzBinBudHlLH7+dJS7xEvI1aNpJIxeW6FHDHcUTSUg0DE
 MqrZ9tRfx3wCBaurokjAjAehJ20blAkBvqOU9rwcOny2BJIo459t+hOHPzMRzun6e9NI
 EYUzQQRwOt2nUZBi9dowY7YONACLcyk9PtWGqalhBK6u80NPQNjhSkoKDhHStRUGctcr
 rAvONyIRKIX2UnLvwRJxHbXSRReWvSlL1Q1CR5zL3Cd69MotGPOFQtVgQy77tMcaYKEo
 5xhNmCVFWFp6bEB6gkosBu0aLgqVgXdj4yTITHOTkgsk+MJpoEaUscn8PvhS0Yh/U9WQ
 pFzw==
X-Gm-Message-State: AA+aEWZGuMNYGpp9aoWtR6jLEJAIPCvofADWj2JvOBGyitVgYkFLkP3/
 YaCNNVf1ivZR2VY3/ZU6pC2zOAZMPpZMoXdxeCjX
X-Google-Smtp-Source: AFSGD/Vjo/03rvJteIUMyZJbMDf3noXyS/ACKuTjL1Fh3U1WmHdq7tSloilfxqKgkN3vsbGJDe+TI+5dV52N61TibjE=
X-Received: by 2002:a2e:93ce:: with SMTP id
 p14-v6mr2054929ljh.42.1542745624786; 
 Tue, 20 Nov 2018 12:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
 <20181120001128.GA11300@altlinux.org>
In-Reply-To: <20181120001128.GA11300@altlinux.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Nov 2018 15:26:53 -0500
Message-ID:
 <CAHC9VhQDs8cMuR4PXDB2VZ9TEtDydyBF_EqBGvjML+NN8+2LNw@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] Prepare for PTRACE_GET_SYSCALL_INFO
To: ldv@altlinux.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_123026_964232_984631E2 
X-CRM114-Status: GOOD (  12.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: alexey.brodkin@synopsys.com, jcmvbkbc@gmail.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com,
 linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp,
 linux-hexagon@vger.kernel.org, lineprinter@altlinux.org, palmer@sifive.com,
 msalter@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 aou@eecs.berkeley.edu, jacquiot.aurelien@gmail.com,
 linux-m68k@lists.linux-m68k.org, green.hu@gmail.com, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, chris@zankel.net, vgupta@synopsys.com,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 rkuo@codeaurora.org, linux-audit@redhat.com, lftan@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120202653.YddIJSzHoMQD2_jDqLIw3b_7zIUVCFd_W23JJXHhBqY@z>

On Mon, Nov 19, 2018 at 7:11 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> syscall_get_arch() is required to be implemented on all architectures
> in order to extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO
> request.
>
> The primary intent is that the triple (audit_arch, syscall_nr, arg1..arg6)
> should describe what system call is being called and what its arguments are.

No real comment from me, most of this is arch specific code so I'll
let the individual arch folks comment on that; they know far better
than I do what is correct.

That said, anything that gets us closer to being able to offer syscall
auditing for these arches gets a big thumbs up from me - thanks!

> Dmitry V. Levin (15):
>   Move EM_HEXAGON to uapi/linux/elf-em.h
>   Move EM_ARCOMPACT and EM_ARCV2 to uapi/linux/elf-em.h
>   Move EM_UNICORE to uapi/linux/elf-em.h
>   elf-em.h: add EM_NDS32
>   elf-em.h: add EM_XTENSA
>   m68k: define syscall_get_arch()
>   arc: define syscall_get_arch()
>   c6x: define syscall_get_arch()
>   h8300: define syscall_get_arch()
>   hexagon: define syscall_get_arch()
>   nds32: define syscall_get_arch()
>   nios2: define syscall_get_arch()
>   riscv: define syscall_get_arch()
>   unicore32: define syscall_get_arch()
>   xtensa: define syscall_get_arch()
>
>  arch/arc/include/asm/elf.h           |  6 +-----
>  arch/arc/include/asm/syscall.h       | 10 ++++++++++
>  arch/c6x/include/asm/syscall.h       |  7 +++++++
>  arch/h8300/include/asm/syscall.h     |  5 +++++
>  arch/hexagon/include/asm/elf.h       |  6 +-----
>  arch/hexagon/include/asm/syscall.h   |  8 ++++++++
>  arch/m68k/include/asm/syscall.h      | 12 ++++++++++++
>  arch/nds32/include/asm/syscall.h     |  8 ++++++++
>  arch/nios2/include/asm/syscall.h     |  6 ++++++
>  arch/riscv/include/asm/syscall.h     | 10 ++++++++++
>  arch/unicore32/include/asm/elf.h     |  3 +--
>  arch/unicore32/include/asm/syscall.h | 12 ++++++++++++
>  arch/xtensa/include/asm/syscall.h    |  7 +++++++
>  include/uapi/linux/audit.h           | 15 +++++++++++++++
>  include/uapi/linux/elf-em.h          |  7 +++++++
>  15 files changed, 110 insertions(+), 12 deletions(-)
>  create mode 100644 arch/m68k/include/asm/syscall.h
>  create mode 100644 arch/unicore32/include/asm/syscall.h

-- 
paul moore
www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
