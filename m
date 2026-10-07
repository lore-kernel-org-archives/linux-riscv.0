Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1DCA5FF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 06:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wNxXmY2TNwhbdAPiqjU3fwbWpUpbOnNEanWqm0s2Rw=; b=OaS6KOadIlYe5w
	2SKjgNDdhFdlZZYn/T9IwUpoxk0gNurbqNpHlmHULSnfGOsfnN5ZRx72AloZCkeR7k+Sv7AoUvKaW
	MdzwXtSdhcZzo3dolX/YxS1V7WFGtJB1ocKleVTi+CzxD1oQEbg9fSl5RFkPKSI0JC/LqOwQ76ljJ
	IpYlmUDXqSCSNRbqtm0PyxkRzVjaa6nE4POpMoIUejVcLVuqPRe4OggCH0654QqLhNJkZcF/RPYZL
	IPDKIrbzUqETwkOAD1EdjMU28Y1mtdBqcAvQQFdmIU31Niv0Kq1iQ4OCTHP0Z7KZD4WYQ/RSjpjch
	ylNAWYL+o9yrow4s86qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEL7u-00000001m6N-0qkR;
	Wed, 07 Oct 2026 06:27:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEL7s-00000001m63-0Npi
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 06:27:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49d05d51553so25932635e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791354458; x=1791959258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fydqj4hmNH78wH617QGFX5r4cVYqMTrHIFSWZQexZXo=;
        b=G/AwiacE1ZbL2b6KD64EjIRQC7WNWVBZcO7Efu004UEutUvMWjhhnkYdC6B9RtqEhM
         hKhx3bJ9smb7rHCcVWR6XdMutVMUjpjJpCpmyPfEIrykNi/06OeqUXJzrLfUZQ5PrcAR
         A1vZwuOMAcgDr/XhfOF9RyP+MI4KkgKnwc+j94RHgxKdfzoSps64U0StfzzylYsBSIhi
         92rhS9fnvStK6JZd3GStiPZYZ+FUSzZBAiJaHnE1dBehCYAW5pF4RCmSMulDsU/ZpE9s
         lSqEU+3P9EmYkOzl0FaXqMKNSyVuq4fwcNuLfg8jls8riIV/ZiPD25YOC2L/maDirjqz
         AzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354458; x=1791959258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fydqj4hmNH78wH617QGFX5r4cVYqMTrHIFSWZQexZXo=;
        b=DHVcxaZU6YO7E+ueYBDjCI8tV5Gh4ph3EMaA5zsmA3RbmeqsPBfovYllDhIexqGrUf
         TnLcFZMCphbzJ9H8ZY0Pm3Huubf86TohuENxgZ+mp5BpZoGNhz5HdGQZjT80EVWqcu26
         EQsK2EL1vZKFtlwFSAL583rwjOUFsSsbZenNHfZFxIVT7DG2aHEi0n7njY9KPhQA1lRb
         AG+LV2Au4VD0yM+3w1S8HHdAqf3lVd9MlKJDQFfvl6gAizNEY/MYOATd0VFXnkSnpjKL
         q/4+NraWnpohFFDhcomRE0BnGZ2mfE0HQ7YL2fML0MXpxpFuX5AJ5AEGgWcYOEc3pKBT
         PcoA==
X-Forwarded-Encrypted: i=1; AKwUvBxBxqVLnrfthUiYEWZEhV8Cx41z//X6/IScwOkghq2uaXUHXfvUTt50nQT8pHzoHbW46XZEaiSxQCs+Jg==@lists.infradead.org
X-Gm-Message-State: AFuF++nyjRlqGMfJOTdF/CSdRjO2+A9X5ScdPzQ/4qvVi7rDe3VbwId7
	6lkDqhjBkrLqq4UWhW80g422ByQtRFmmUrc83X3y95C9i1lnLzRBhpao
X-Gm-Gg: AYBFou3/q2JNN3cAaXr66EloqLd20tfLX+H1+uyXcSwCbD7rw0eFBmtXBHhNY32SsDA
	dRZynY79ZjoTffDkD1k18+Nl5AA54/yEWc6bqM4gNLBkaWz/mObj5g8Yq7O3G9bnKXX44E9HTu+
	7MTLC6o39qTcNebKObV55dBoNECAK081P9tCCUH3MmUJpXXsZtRs/X8C/N/VllNnlwM/3sEiXe4
	K2WIR5b3AkTDaS+3lFBLBIPlSR7I8ipnb0Z7bZtwGTLN8xaAPLokBxwimR/Eqm44NbwlSKK0duS
	yVmF0I9X6WUVKzL+SrZ3TV0oA+wVXXU4XIAa68BUxjWRRkO/ZsBn4PVPncThlRKeU/PRekMmZXS
	B6j2WyzpcckM75OCI0IVJKDQwhNjhdtER1W8zzzrUxvGXbD3Zpzc77w/LC40xjgohDAhIIXS1Wm
	btrYC3BCeFwLSKeHwshSL9FXBrMDcCnkyY3zoqZEqiUty2ysddItMrVFSgvKUZXOdqm2BcU9jJ8
	Li+gCm/MqsJWKO+GJTvCABWcuBXxySQMhu/Lg4Oo/JV1IUvyCSW7RQlEUqzVm3VQ9ZnHiA3oblp
	S2+PVX8t5LsO7CmymjANfy55KCZzyV+XNHgwfUcv5lqF6dvJqQJi/rgKj4pyPSlkg8hQ/ErD
X-Received: by 2002:a05:600c:c0c1:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1811c81b8mr7255155e9.26.1791354457565;
        Tue, 06 Oct 2026 23:27:37 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-a1e1-2201-60f4-32e0-4d59-5772.310.pool.telefonica.de. [2a02:3100:a1e1:2201:60f4:32e0:4d59:5772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180303863sm20629145e9.3.2026.10.06.23.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:27:37 -0700 (PDT)
Date: Wed, 7 Oct 2026 08:27:34 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
Message-ID: <asXlyzkNoALogots@gmail.com>
References: <20260907190750.26303-1-kmehltretter@gmail.com>
 <ap-CqOtyN9qvWHOb@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap-CqOtyN9qvWHOb@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_232740_138635_683398C9 
X-CRM114-Status: UNSURE (   7.77  )
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

On Tue, Sep 08, 2026 at 11:36:08AM +0100, Jisheng Zhang wrote:
> > Fixes: d0fdc20b0429 ("riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 

Friendly ping. Is anything else needed?

Thanks,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
