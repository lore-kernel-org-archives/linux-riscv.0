Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EFAC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 23:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvN8pTxbuO7IU5y7XC69jyFW5rDO7wTU49xmmy6njQw=; b=3bx+l7PKD6z3sm
	qMCBdALvivkuApX5QqZj4wpQ0uY3eEuWWgBjLhy7/lQ+aHlf1Vt2t09BzQNQ662+3KhQhTUuqg2Sx
	QBXP8v6iwLnnzkl0HXVeTnL4C2E3+CtdvU/I6oFdbOuyKofNUaX6aeUp1T2k4jtz8UOLRmgJFGyEu
	+U8avJLZJGcu1KTLt/a4epVEG91TMsZJ0FR9sOvqgdkKYMrdlZvXGoV9IZSdv3xm/joBgy2wlwAXw
	mCXIXZOBbh7TJWjgnil4zGzmky1Bm7EewI9ooKbmSp05yh48MZ0ijDk18HRnfl5GcHCRmejiw+Uuc
	EwCus4RkEkQ1gTT7sB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLAT-000d1i-7O; Fri, 16 Sep 2022 23:54:45 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLAP-000czO-Qd
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 23:54:43 +0000
Received: by mail-oi1-x232.google.com with SMTP id w125so7972202oig.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 16:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bNu9U/LBqMRQt3SzqzkiSAT9uWT1Ee0AqooPT62yzkg=;
        b=axVlvMDUC9C+6dy1iWDj4Lh/OefIO6yZWpLiTXuYH6ACZxai7vYOz32xRawpwf5O7H
         eDhgWJ0Q8DGIDBNNu4ueHAN9tPifSpO1UrntyJshQy60VkflG2kQUsdQwkmlzVivvWCT
         o3fAUxuNgBPrtGHqQ91lFfxMegsmfKLv0Z9Dqsw+sDzk1cBVudKs+qoG03kIf2k4D9Kl
         GswDD3jAIfcE/cf7PwgU7foxVQCVpQLnexj9Dg4gGzoIEpwrrgb+kN/gRBOJnUF0O0B5
         Ee5SyuszgAXwMsl3hUzt7Ds7Bnbdxx4k/EO1968ROTUq2Dih0w2G3S3zNx4CHaDvvvVc
         +efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bNu9U/LBqMRQt3SzqzkiSAT9uWT1Ee0AqooPT62yzkg=;
        b=iKQ5RmObF3yVpLjm2P4/gkpStPjxtt7ZOU10hGRA/lYiXMoBO7Q+qaxQpQLtxsK2UA
         9dU04EY3TGOvInNQf0xAGcsUAZ0UiAr2wPev7OXQ87/XH8zTryJK8BchYmHrlvjtP4LJ
         Mo1dFiYH9CvnYQ1zuKpwN5tf4DpIZECG1ZsQxy2ZyBxL4VsHaF5tYPqY9T+T0zHZI84Q
         nVjnUkCt1pYuJcwaGTBGGrMiufPgD5afJSe0Rty9UddhmnoGMNajK0S3Abwv56z02YrL
         2fVQEB0CIEeoG4rwxnyrhHUoEwysneDUJh3SBeJw1qD0NuP/Rd4fkozSc9V9crBjOyuY
         RWRQ==
X-Gm-Message-State: ACrzQf0sDmV2eWUEX2gxtKke63Kmg9kb0+u08jKfrTvUrDMkdwwwMnQC
	+3EkIr77aRO/5l7vwmuGH+agUj5BZdSa5tJ1QlU5cQ==
X-Google-Smtp-Source: AMsMyM57H6wgptD93sv07JwBhDq8Z+Y2iB/I1DDpheQxuN6sT9sUmxI+Oi3h2FftZA8DOgJrLG1m78WmHWpT8UEbppk=
X-Received: by 2002:a05:6808:49:b0:350:77ce:3368 with SMTP id
 v9-20020a056808004900b0035077ce3368mr831321oic.195.1663372480499; Fri, 16 Sep
 2022 16:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-6-andy.chiu@sifive.com> <CAJF2gTRntKCD-Ou0cDtyCQhvSKq7iOqyo7+pxk7NO88UVi3nOg@mail.gmail.com>
In-Reply-To: <CAJF2gTRntKCD-Ou0cDtyCQhvSKq7iOqyo7+pxk7NO88UVi3nOg@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 17 Sep 2022 00:54:29 +0100
Message-ID: <CABgGipUwUv8e2yKmPYdHgNk1w8UuE=zmb_d_eZS1Qq2+41FtOg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_165441_990872_CEDE8125 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Guo,

Sorry for sending it again, I forgot to send in plain-text on the last mail.

On Wed, Sep 14, 2022 at 3:06 PM Guo Ren <guoren@kernel.org> wrote:
>
> Is this patch related to this series?
>

This is related to dynamic code patching but not the mechanism of
"function tracer" itself. You are right, I should submit another patch
for that.

> On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > runtime code patching must be done at a naturally aligned address, or we
> > may execute on a partial instruction.
> If it's true, we can't use static branches at all. Have you
> encountered a problem?
>
> If you are right, arm64 ... csky all need the patch.
>
In fact we have run into problems that traced back to static jump
functions during the test. We switched tracer randomly for every 1~5
seconds on a dual-core QEMU setup and found the kernel stucking at a
static branch where it jumps to itself. The reason is that the static
branch was 2-byte but not 4-byte aligned. Then, the kernel would patch
the instruction, either J or NOP, with 2 half-word stores, if the
machine does not have efficient unaligned accesses. Thus, there exists
moments where a half of the NOP mixes with the other half of the J
when transitioning the branch. In our particular case, on a
little-endian machine, the upper half of the NOP was mixed with the
lower part of the J when enabling the branch, resulting in a jump that
jumped to itself. On the other way, it would result in a HINT
instruction when disabling the branch, but it might not be observable.

ARM64 does not have this problem since all instructions must be 4-byte aligned.

Regards,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
