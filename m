Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AC9C41513
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0r6W3hmeudEyoaJuS2yCDRXYxmDOGVDbr09CTwBhCs=; b=WCJayQC9/Kx9iy
	62nLyiofpzPquOVMxC4NORlwPtAkmwAfEoxT4ffZo8IOgqPS9HgAYEvs1OHTMtXNl3oXD+4ELpJIT
	94DOI9PsVDsNWW3Bhh1633CXtlDZ+dnmoh1q9137h5CsknLWKP+liHdWjDq49EN8/v6SUB8eTJcoB
	Wv9uZ43HgtCsa+7Ys1ro3lP2w0ltUMpV6SiI61FVWkhkVgicVQ0+8d3jwF2vo+JoPPMuUbupMojTe
	1CSGlKdhzzRo327IZS9tqOr14JWoHfWfCg/IL6NvUtbXB/iBH3yRcm3iDlawXrDAPgY1bMxgVeu48
	6vSsExuGLjzjYAz7aK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1c-00A6hD-1q;
	Thu, 03 Aug 2023 15:14:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1V-00A6WU-2d
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:14:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc34b32785so7642405ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691075635; x=1691680435;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXVrhCdWLLKcnhxRquAkFhWRRF3he8a60KQeGx3CPwQ=;
        b=xMOWHjzhIFADI7yI+bdkuIUrM/IveX3fQo2nyRKXgK9FIXFeon8fFR3RBwpf2xJQQo
         CEmugwQXRO7kOib8f9JtuiUYixYu3qPrGAs7y8mjk54HnrQ28GzK9peVfLzRkMDPY8hy
         GY9Z6vxcNi3J8Q8L1LH4ZhQNk+/eVY32xwLCwVsNUK3/x6s13Q2VIX2eIY0uiFX1ANiC
         g/wHAkQR2RLIL48U4u+Y+f3F7zr/NCKZ0y8gkruv5gJ5KirmEN9SvfUYJP3xCbfXkpWB
         AcJKFSd221SCMZbRzA42l7nX1zwjQFreqtUsOvqKX1v5D/OE+rorkr4BOc/6qxoDGCES
         CGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075635; x=1691680435;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXVrhCdWLLKcnhxRquAkFhWRRF3he8a60KQeGx3CPwQ=;
        b=KvBRjPv2Lbju1mGhk9+bLf8EOKdAz3ss4mCfn/xNxyQqCGpf2zOiZv4vcjxRCxhlaz
         inAKBnAfcKy22JBC+AsONHI4QypEjc5d5tHwD5qCXqCzl1apyf22p8OeB7nl1vKzEQWh
         5RWOB5Zou3exfWUxI17tnCW8TMBLtydqsJJrGTJtbZ8knfHu58wHoLmUPVOmKwsrz/Nt
         CFzrlrjIlFdw/a8v7qdPjLFQp9WaO9oZfgOWycxjEzvef/sXPjks1xvQ+PMKCJDzHAur
         JditnaW3ip11+xhclbV12+Yx5SSiTlCEMXza2g+u0JrLUtYHplZglYjD1m4C2L3slYrI
         GpVQ==
X-Gm-Message-State: ABy/qLYiRw3jXqxwnU5OwdZgchY3gvLSI91DZ2I5Zr/UB2k7ArMwYvsT
	Db5ANCXOEvZCfiFf/HPxn/4OyQ==
X-Google-Smtp-Source: APBJJlHJCfL3eK3xXZPgRUSQoa7EWdazreYMd8M6jEbaOfDL0ZFs9AZ4gB01lCbcEKywUcJVa8l19g==
X-Received: by 2002:a17:902:e803:b0:1b7:e9e9:1004 with SMTP id u3-20020a170902e80300b001b7e9e91004mr19161935plg.30.1691075634839;
        Thu, 03 Aug 2023 08:13:54 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b001bba7aab838sm14478969plg.162.2023.08.03.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:13:54 -0700 (PDT)
In-Reply-To: <20230704121837.248976-1-alexghiti@rivosinc.com>
References: <20230704121837.248976-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD
 size for the direct mapping
Message-Id: <169107392510.27633.6639433423515028183.b4-ty@rivosinc.com>
Date: Thu, 03 Aug 2023 07:45:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081357_882689_CEF415A4 
X-CRM114-Status: UNSURE (   9.04  )
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


On Tue, 04 Jul 2023 14:18:37 +0200, Alexandre Ghiti wrote:
> So that we do not end up mapping the whole linear mapping using 4K
> pages, which is slow at boot time, and also very likely at runtime.
> 
> So make sure we align the start of DRAM on a PMD boundary.
> 
> 

Applied, thanks!

[1/1] riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping
      https://git.kernel.org/palmer/c/9d3e8e1ff0d8

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
