Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C394FC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTKECrPq0t4+6OKxY+9Gv9YVOupw5OVDyWFfz2j+1Ow=; b=mB34NaiqzWMjkP
	5vxivS5NxIcnmk1d8p0Rv9U7SqKaq+6LL15Y23FFvx7u8oS/owVditi6v0ihL5HVIPR1ns6ONoeXy
	jc8ld3CTVXC00bGgkEZHAeIq5mH8A6ZVdM+xzaj0Q4f7eul5Ma09rO7PtWkgK6KyQiIlt14OJre/J
	0VHkV1X/lY9ziW/FvOUWMBRXVXvpSjoaq3ihJhXEDUHRSFru4EMH5DwyTB+oMttM3rhWjpT0FnJFQ
	9ybpKn7k4p0VHo6ezPwFD8yW+rTBmJaNmKRSMyD6yAG7dJc6GM1HWXwwfuX0dIU/fLpZ8VZdX1hIv
	19SdFtIHQSpptsTu1Rgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ohH-004pt7-1V;
	Thu, 01 Jun 2023 20:14:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ohF-004ps6-0W
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 20:14:58 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fdae76f3aso1207091a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 13:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685650495; x=1688242495;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DU10fC4sdK9R/A5wUXzFvrPcTHv4BJBjCG5IQvpna0g=;
        b=iVSgJYKDVnVhYZj8QCyFCeURHMmhLu3VVf8IA+Rktq9uFB8EkPW5m6Ta5omFHjlEeK
         WuA1egxlBJoFX5mx4bdjc1D8pVs+Odg5HLEtlFnUkVyugOfudDT+LFLkbIQn0kgyz0qo
         sMUcF+kD19PIIgjBfuk/r6UTZ7WYLIKpUslxGXQGOlnYByxvn0oh1P6v//0IBEp9xNNK
         hefNQz5ZUTwTeubzx4wXkJ9h1RIpCbKwEksKEcOBVJC/vOX0JG43aeQsYPGhj5gmB81A
         5UYVotS4nrV/9S/lmh5v5YrkBe2T2XrJ1UKQnTFjxgKfIvRbkfKuwE07ILAToGU5QP9N
         FdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685650495; x=1688242495;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU10fC4sdK9R/A5wUXzFvrPcTHv4BJBjCG5IQvpna0g=;
        b=Hs2aagxlh48FfEL7OfyP0Iau6QJ0wp1LsxXQwQ3ZKWzA8ivCCr2ynyWLXprEWm4Zno
         K2f9AlYbKyit6VAgieT6uivuNZ+1HYvsCEXqJISIfW/OQhjvx6iMksDnkhQPZwJlLHCu
         fVgvyDBgWWO4PbHFM225q9KKQhrZdqcu0tnx9kzk4gjGiHJWZks1/luALapxX5kPVJQg
         54KpZflVSZaua933O7kuZnzm9GmD7dVreFBnZE+XQRMe+8aRTJ5xThfeabrRPhn3NEbR
         +bfdTmke5YGz9fvjpp0axJmtAiGHq+7Xc0wxPvu7Hgg6M2n/qqu+sHoti0OLRA5ETQBa
         ZuUA==
X-Gm-Message-State: AC+VfDxz2rgbJcDcxbwwUQZOHYf6RhCOP9XXeEEPiiD3d4ip0kE5GvtB
	VBGAyJeTWaSXmNHeIF8zMrGDBA==
X-Google-Smtp-Source: ACHHUZ7sHeZlkfxdt9cp0rU09UKrgKs34CyQceaBIsyDPaeRwvqlUKonnuxVfhmQV1l7lk2NTicJxA==
X-Received: by 2002:a05:6a20:5494:b0:10c:8f0c:f81c with SMTP id i20-20020a056a20549400b0010c8f0cf81cmr13043820pzk.53.1685650495170;
        Thu, 01 Jun 2023 13:14:55 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 126-20020a630984000000b0052c562bd942sm1885144pgj.19.2023.06.01.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 13:14:54 -0700 (PDT)
In-Reply-To: <20230428120120.21620-1-alexghiti@rivosinc.com>
References: <20230428120120.21620-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes 1/2] riscv: Fix huge_ptep_set_wrprotect when PTE
 is a NAPOT
Message-Id: <168565042167.24704.4716430227206622688.b4-ty@rivosinc.com>
Date: Thu, 01 Jun 2023 13:13:41 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
  Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_131457_198251_2D483046 
X-CRM114-Status: UNSURE (   8.37  )
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


On Fri, 28 Apr 2023 14:01:19 +0200, Alexandre Ghiti wrote:
> We need to avoid inconsistencies across the PTEs that form a NAPOT
> region, so when we write protect such a region, we should clear and flush
> all the PTEs to make sure that any of those PTEs is not cached which would
> result in such inconsistencies (arm64 does the same).
> 
> 

Applied, thanks!

[1/2] riscv: Fix huge_ptep_set_wrprotect when PTE is a NAPOT
      https://git.kernel.org/palmer/c/d22ce4f4137a
[2/2] riscv: Implement missing huge_ptep_get
      https://git.kernel.org/palmer/c/640ad2677d56

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
