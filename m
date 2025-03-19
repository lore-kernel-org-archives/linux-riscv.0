Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A573EC282EC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 01:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaFVG1aziBtADTy1CokvxebPum/IYM4ZSQcKX6K4UO4=; b=luKmzjvBkz4s9x
	sElzrTQg4PSiLmTjTT2wzjsxpMOakAzW4cFbpZzFBoQi0kHq7i99qZP0iO8aZNKJ9K9YAwZKe1h1v
	V2FGhJSPmMkyVIGwrl/f+0wsORp2BZIMJpggcqXG4qBhkMBDu5MV0kHK6ulEQ2Ut/0vphbNWU7QCt
	vHimMi/TefRrL7Ej+jTy2npTs4MZ17eS6g2N3l6Ly1WeEJ0jCioeihVUY9mRCdtxTNBCjen0qxoCR
	k1P3ShVF+dVmUXnzApQE4tGx/Q0tbQXF+WHipdiSRau6d0oUxul1Wj4jFKEHs/7FMQTwQFgEyNvTx
	Rcl9nVyICJTS0V3E3Yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuifL-00000007lTA-1VYo;
	Wed, 19 Mar 2025 01:56:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuifJ-00000007lSe-0rct
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 01:56:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22548a28d0cso20079235ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742349376; x=1742954176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kfSYL161gfIZziJoaNEPd49jdNT8x0tZy2mZDGsqfFQ=;
        b=GRkKyzqpSBZCgH92VicnO+9dPLDUyQs3R33ie10M0QwGuUt+ah1rtEK4icJrHwWYDy
         6xXsW5bB43UGSOvgbCuo4kuf4FPdXh5tTjZrbSfP6jga+sZ8brwf3aSzSTdiMe0Y/uw0
         0qCYFb3V94ULTWFJtP/LknSuIQ5FPhQfIkPEpE6s2x6n9BL6AYAzay8m7Lem1dArsQJY
         7ak/vUT8FNoMNYkYyUv64S0kAX7TN7+D9W1PgtXpDedGMkdGgbcaacFfzXjcc7IUMu+t
         sDo/92hXRt4/7q1cThgR/aEiWr+fY1WBjG+JnjcNmj7NTQJSCTOvPcyYBEjiEbXIkwpB
         WVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742349376; x=1742954176;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfSYL161gfIZziJoaNEPd49jdNT8x0tZy2mZDGsqfFQ=;
        b=S2Y5PYyyRRd2Ljmxms9OuEyQO2MUgOz51JJmKJcNBFo+3FhbgKp7mqP0rTdgoJGtxA
         NcFlK10y3q4gNCflXvhc8NSZ+Jjy/T63+l2ZyIwCPhkTO7Nf6oNj+A1vnucmFixRB5qL
         yXICMwqtwODZKA++FUEUNvirKfa6Keu3jnrAu9lTsZzpr79OY464oaN1akURfqh5qAmH
         vLu4SE467DdNnMMPPQ2aZic5Lkt3rCwMeSMbErpHQUNt3ue4ZnJS6g6GbtrRYTUU7N67
         N/4cYQIu4tHXEKhbOH0itUTXb4aSUT4DjIUvCcK4p6zoQU2+0yiONI1L4DLibRCUNRU6
         XlaA==
X-Gm-Message-State: AOJu0YyUp/Hy8PQRrocgpDF8ZbWn5dFtYZ4PLaE+q9MeCWSF7ZHuhXwS
	ZOTMNG9nBsZBfesOq9JHml0egTB79Ax3HXJbsDR8e5IUVaBjjKppykch81rdeQEyHLgX85AYHJS
	wnvdK
X-Gm-Gg: ASbGncvRYMbEraWgTgOenhixVH83epEQ2pr96kZzgdwzLNeDwB3TYFgdEOefzmY5FCS
	A7IXVsCUrs01hE8hRGuVM5uvDyY/Ktx5mJTsgkawHc3QXj+DpLPhz/98WoMRz9wfx2ZGi1Y467k
	Cx8STZVDsvD3CNZ+rUN3ETAhmyvk6YIX5F4gAMgQZEABL/gQuIQeamQQCbQ4X3ofoCQEHXRfcWa
	sj8agt68u4T3F4i7mdVIISKxxMI+jqAKX5V1KlMnSWoqsAT7C+KlZECDtFmI84uc48pycX3L1V1
	2Q2piKPooB5J5W+zbjw2YAIFWteC6hP3/L8xkU7bHXW9jyBYHUmvUpngy/aTChtBcg==
X-Google-Smtp-Source: AGHT+IG4aYGLWzhUSXqPklhX63oL6b0Chh4MUxqPBtMaZK5s4ebrHNR820gE0xM/ygYk34MdDhDAdA==
X-Received: by 2002:a17:902:d4d0:b0:215:6e01:ad07 with SMTP id d9443c01a7336-2264982aa1cmr10975815ad.6.1742349375959;
        Tue, 18 Mar 2025 18:56:15 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a40a7sm102324425ad.59.2025.03.18.18.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 18:56:15 -0700 (PDT)
Message-ID: <81544837-6e2b-4a75-a6d9-595128519447@tenstorrent.com>
Date: Wed, 19 Mar 2025 12:56:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] riscv: uaccess: optimizations
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 charlie@rivosinc.com, jrtc27@jrtc27.com, ben.dooks@codethink.co.uk,
 alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
Content-Language: en-US
In-Reply-To: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_185617_252819_0879191D 
X-CRM114-Status: GOOD (  17.23  )
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



On 18/3/2025 5:15 pm, Cyril Bur wrote:
> This series tries to optimize riscv uaccess by allowing the use of
> user_access_begin() and user_access_end() which permits grouping user accesses
> and avoiding the CSR write penalty for each access.
> 
> The error path can also be optimised using asm goto which patches 3 and 4
> achieve. This will speed up jumping to labels by avoiding the need of an
> intermediary error type variable within the uaccess macros
> 
> I did read the discussion this series generated. It isn't clear to me
> which direction to take the patches, if any.
> 
> V2:
> I've taken on this series as there isn't any response from Jisheng. No
> significant changes other than build fixes.
> - Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
> - Fixes build breakage in patch 4 on 32bit not having delcared __ptr in the
>    macro.
> 
> V3:
> Significant commit message rewrites.
>   - Corrected the justification for patch 2
>   - Better explained/justified patches 3 and 4
> Minor code changes for legibility and more comments
> 
> V4:
> Fixed checkpatch errors
> Added a unsafe_copy_from_user()
> Added patch from Ben Dooks to save SR_SUM bit on switch

There is something uniquely wrong with V4 (not sure of the cause yet). I 
will send a new version.

> 
> Ben Dooks (1):
>    riscv: save the SR_SUM status over switches
> 
> Jisheng Zhang (4):
>    riscv: implement user_access_begin() and families
>    riscv: uaccess: use input constraints for ptr of __put_user()
>    riscv: uaccess: use 'asm goto' for put_user()
>    riscv: uaccess: use 'asm_goto_output' for get_user()
> 
>   arch/riscv/include/asm/processor.h |   1 +
>   arch/riscv/include/asm/uaccess.h   | 218 ++++++++++++++++++++++-------
>   arch/riscv/kernel/asm-offsets.c    |   5 +
>   arch/riscv/kernel/entry.S          |   8 ++
>   4 files changed, 179 insertions(+), 53 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
