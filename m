Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8E6EE49B2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gwHrvaUR8bpofAHSf+IDKB7ipARiy4MFLS4BuoNUXGI=; b=IVy7hTt7DoGmdMl22MAy9arERG
	ZzY9ckFxyXc40u+WInRqW7b6J3jjezyzV1SH/Grc83DJpzozCdOVmW8KKoL+Th8EUK1slVwkjRAOK
	GIetA1ZG+MruKHlkXV+rI/qApCFZFIqDMfCwtdo2FQ8kJjFoq/GYKTwT7tjQcoHEXaSfMKlzLp/jE
	cc7rHjXVoJKzg1VtPHpjernfG1A+vN1h28sswrYspb6GZD0y+jXHycuHOXe8FfDLkLQDOzk5BS+QH
	y9qoj3jDxlJX+bRcW5ePpx3CrdxTrsKmbYQ3j6FEpCaF8lsRFFjij5ePKf/YGttLUktfUFZcwiJ/4
	okC4Z7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpks-00FsGw-2Y;
	Thu, 31 Aug 2023 22:03:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpki-00FsDD-1k
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 22:03:03 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68c0d886ea0so1140200b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693519367; x=1694124167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FXDOTJgVIy3p/w3/K72n2bBJ9a4aRqyoQSBv0VXeBs=;
        b=DYnZWZA7/6+O6fapO9Zo+bwBCGOU3sBW2d2k0VwvRceybQOyr6eGOV/E+tA3/QhGt4
         V/Z3E+ZcOhKmJqF0QbHzSHO5Zkoj85NBauYH2uUPq//sZYKcrHoZerE9WxpXeHOlLUuk
         s1G7SDI4auuiUhJkzsR3mMwjZbLbc2xj2DguuYaSzJyS+h9xU+bt66TW1CLKZ6CooDvB
         +AEovzyH/z4D36V/oiTNtXbs78p0pxglK/4yWLuX0jufKsonZXVIbTB/21c/2NSQy9qZ
         Z0YvInDXHdXdbsfTyIggW0WUEA5Nm38tcT4XfIzJltIe85L+EDtTOLsYO5GbWZyYbHVv
         ouGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693519367; x=1694124167;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FXDOTJgVIy3p/w3/K72n2bBJ9a4aRqyoQSBv0VXeBs=;
        b=fa8vfkGcH9EClkugA/hWQ/2hhj2vFF6R8bEfO3n5JiKRxQTYUyNWC/2gj65O0oIvnX
         UCEz932kOj0CsOFb/mTEt/H4GoPulGfRFy0fBX9Sz+70Urm9cgTDl3X9svarUmFUBKyt
         74EWWChHDkCnt3ATChyH1MeBR73FHF4Sy1wZ6Sldv8rlU7XytZf5WxJgjWStiPlenoWw
         TfypaS5Yb6e2ZzwLAtlvz8ePbWkxjwuUyVdVULhwiz+ijkKDKYFDEyhmKNA3XcjzJGZ4
         8Es3DgP2B6RIvLAYU8v8DtRMpwzP3G9S8iYSreoD248grbaDOXJYLQrtMs3dkSvRodm4
         Zf7g==
X-Gm-Message-State: AOJu0YxChnMcCBCHR+Lw0RdbJsjH4easrJoBfdyXicwHNKH/aaYYd+Ie
	MheAlSzKGJXVP8+1F2TtF4JzqB9ZExtNPScbtnY=
X-Google-Smtp-Source: AGHT+IHvvQrZtCPeit45pg+srInBxN1ZARLTVgf/6cz1VOCYIfJFq2AzTxQ1+kIq5u3Npovyj5lO+A==
X-Received: by 2002:a05:6a00:21cf:b0:68a:6305:a4cc with SMTP id t15-20020a056a0021cf00b0068a6305a4ccmr1187938pfj.5.1693519367627;
        Thu, 31 Aug 2023 15:02:47 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id fm19-20020a056a002f9300b0068c1ac1784csm1719727pfb.59.2023.08.31.15.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 15:02:47 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:02:47 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Aug 2023 15:02:08 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Remove unused "size" in ptrace
In-Reply-To: <169351910648.23657.13688127900416740511.b4-ty@rivosinc.com>
CC: linux-riscv@lists.infradead.org, lkp@intel.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-86d610e1-acfa-4de7-87cc-e6051b6a113f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_150300_609982_5E9422DF 
X-CRM114-Status: GOOD (  10.67  )
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

On Thu, 31 Aug 2023 14:58:26 PDT (-0700), Palmer Dabbelt wrote:
>
> On Wed, 30 Aug 2023 13:37:54 -0700, Palmer Dabbelt wrote:
>> Looks like this just got lost somewhere in the respins.
>>
>>
>
> Applied, thanks!

I'm just squashing it in, as the offending patch was pretty much tip of 
the tree.

>
> [1/1] RISC-V: Remove unused "size" in ptrace
>       https://git.kernel.org/palmer/c/899230bac3b2
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
