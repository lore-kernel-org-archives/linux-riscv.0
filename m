Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C396FC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bDw8gcEPzI6dsRbXZdq7z2Y7DH3G8kr/ZjafMgx2iJ0=; b=Z1fPJ+lBIfNbWRD9K5+50y63/K
	4c2wBSGn384VdKL1rIZm3GuQorAHs9E7+fUd4ceDyFZdJFSMfgHXxZOXEGA5+Hr7hrJ3ePUhfS490
	Cz7oXxNJbgq7b8FsuYTrMNUxm/CJ4uieux1GoCRu4MOTCNSFa0+EkgAT2d3R3RPgptDUzohYaKdNu
	KxtoYk5XMJK99slnJFzZDtDBVQx6YszP6wIPlEhNl1AA5JikE5njVoQeND9E4S4mX9AX1Cl4U9t7E
	zOyPJRFWi1a/m+dSYWFoMhbLln1FPPRgIicauZcgKqiYpIQ2V+zIMgd9Bf3MhbsBEB8B2iPg9+AC5
	de0qyqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pst6Z-00DGHz-1p;
	Sat, 29 Apr 2023 22:31:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pst6W-00DGHX-0B
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 22:31:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aad55244b7so5636835ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682807502; x=1685399502;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPHsDpkGlPsUeymJHmip8825ZqzKSXSliZm57TlwjvQ=;
        b=OFkAUE/ZjnCUb9a0kpq5KQP//BxcdTW++AyWH6rq/D9WK9XtvkJ09tekM1DEkHWvry
         OfKR/rKqvlIk1pIhGjRSmZypireApgMBf+lcB4VG7Ir3RvnIbmBSc7te7r63ZlHwqsfa
         OUhLcxwKvCTxp7lix4KVWv9WccxiPRIjt1Ml/tEC3pyMpdTPdYAmeaCpbTvR+e1omwdw
         MpJGE2mT+meXC911Neu67LeG0kvqL3XvmtLmkt1fHdBIsX+B9SpcaVYj/GVDvqnACe8e
         KBOhnJyGkYbREmrVsPug31iPFvHJmpXwXzSYmVhh9fg6nv2YPPBB5qU8TOBqqNDxxjII
         +Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682807502; x=1685399502;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPHsDpkGlPsUeymJHmip8825ZqzKSXSliZm57TlwjvQ=;
        b=AfB1nyQfHfQNr1Hjv5t9fBpA0EopQtF3UfOuAy26T35fFP/2/SirM7c+LKsWq0CkBC
         +DzcUCOYQ3cMzo1g4H+wDrTsW1maIF9lJx5bFe5dQEQtmE6dkpXeGmFo73ZJSQQrPm3w
         u9NUQxm6zKsAZC/He9GmS+x/oAfSSaOAY7QJFX1HdMqnc7g5PkezdRUEpinSBgqCZs5I
         pWZ5MoK1POMMNSd0mFT05NjZ4upluItuihR89adSQTbECb/89JuDiTKLZU06qcPkFuL0
         I6hJXkHF9pCsQ22EeL6cE46KQmu2qIwULqrWB3imBjnvlwHt3SpxKZSpTs53Zi9R2+Wv
         oBoA==
X-Gm-Message-State: AC+VfDxK266xJG/bmxzARIp463io4IrBnlBBykQzGAM0T35HohZ9HUba
	5xORI/7KH7SuumkGl3PKtr74pciwP9edLtJ3n+ncuw==
X-Google-Smtp-Source: ACHHUZ6hqMeAHWypNk2/udmWcpEssqk/qIzLMjqRGYwvz2Y10ylroswUy4NiR+4Bcbs59WH1sk8GPg==
X-Received: by 2002:a17:903:2312:b0:1a6:82a7:6e60 with SMTP id d18-20020a170903231200b001a682a76e60mr11048331plh.47.1682807502286;
        Sat, 29 Apr 2023 15:31:42 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id bg12-20020a1709028e8c00b001a9567dc731sm12644148plb.24.2023.04.29.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 15:31:41 -0700 (PDT)
Date: Sat, 29 Apr 2023 15:31:41 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 15:31:25 PDT (-0700)
Subject: Re: [PATCH] RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP rename
In-Reply-To: <5fe1484b4f2b4ae960a9b599c4ab3ace@linux.dev>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: konstantin.ryabitsev@linux.dev
Message-ID: <mhng-539ec982-8235-478e-b695-ee6253b5308c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_153144_336277_54539B61 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 29 Apr 2023 14:48:18 PDT (-0700), konstantin.ryabitsev@linux.dev wrote:
>> April 29, 2023 4:17 PM, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:
>>>> I guess you picking this up for your second PR makes the most sense
>>>> Palmer?
>> 
>> Yep, except it crashes b4
>> 
>> $ b4 shazam -lts https://lore.kernel.org/all/20230429-trilogy-jolly-12bf5c53d62d@spud
>> Grabbing thread from lore.kernel.org/all/20230429-trilogy-jolly-12bf5c53d62d%40spud/t.mbox.gz
>> Analyzing 2 messages in the thread
>> Checking attestation on all messages, may take a moment...
>> Traceback (most recent call last):
>> File "/home/palmer/.local/src/b4/b4/command.py", line 383, in <module>
>> cmd()
>> File "/home/palmer/.local/src/b4/b4/command.py", line 366, in cmd
>> cmdargs.func(cmdargs)
>> File "/home/palmer/.local/src/b4/b4/command.py", line 100, in cmd_shazam
>> b4.mbox.main(cmdargs)
>> File "/home/palmer/.local/src/b4/b4/mbox.py", line 713, in main
>> make_am(msgs, cmdargs, msgid)
>> File "/home/palmer/.local/src/b4/b4/mbox.py", line 101, in make_am
>> am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
>> File "/home/palmer/.local/src/b4/b4/__init__.py", line 552, in get_am_ready
>> checkmark, trailers, attcrit = lmsg.get_attestation_trailers(attpolicy, maxdays)
>> File "/home/palmer/.local/src/b4/b4/__init__.py", line 1319, in get_attestation_trailers
>> for attestor in self.attestors:
>> File "/home/palmer/.local/src/b4/b4/__init__.py", line 1158, in attestors
>> self._load_patatt_attestors()
>> File "/home/palmer/.local/src/b4/b4/__init__.py", line 1261, in _load_patatt_attestors
>> patatt_config = patatt.get_config_from_git(r'patatt\..*', multivals=['keyringsrc'])
>> AttributeError: module 'patatt' has no attribute 'get_config_from_git'
>> 
>> So I probably need to just go update my setup, I've got a bunch of wacky stuff.
>> I'll try and remember to do so, but I'm going to scrub through other bits
>> first...
>
> Indeed, you have a newer version of b4 without also updating the 
> patatt dependency. If you're using b4 from git, you need to "git 
> submodule update".

Thanks, it's fixed.  This one's in the queue for testing, but it looks 
generally fine.  Might be a bit slower than usual, as I'm also running 
the glibc tests.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
