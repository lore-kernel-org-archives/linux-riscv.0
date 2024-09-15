Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8682C3ABA1
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c2kB8dRtrM/Q+11z54TrIwFP3kKrEr5tJ+xirkhKB1Q=; b=U9ud9PuljF2D1z
	pK77QrcxTli6yMp/MQkskcN8EO6znR304SLS0IyGYeVK/3i9VQZF63eTza1xtBfEmOjTm/YQdKBSL
	rvbKFo748YrFF1VU5d0SynwUawzda40/0MFv+d3QJt+YZX1Boo2L/CGRPJiq+SJwsKKqW0WxSdgfm
	Zms6sFmmcU7wXe9oEoi0FCwrKV8KzsMMCzhz5RYp8nYkDQgZDf3FBx9+7etLjAfXEAIeO4dQ40aZt
	z8e2lei1SzGiMifFBNY9iHNLMhoqbKkhTQ63jxMlpOl787VonXvDG+JgTh4SnBqokEmkUrhyVc+UC
	9eQhl81RsI6Yr52e/sBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spstD-00000002OtF-37Kz;
	Sun, 15 Sep 2024 17:18:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spssB-00000002Oki-3yTv
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 17:17:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7191ee537cbso2651505b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Sep 2024 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726420638; x=1727025438; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3MYC8SASoZ/ndWRkqJRsLIGEaMN4yR8qugkGycdBeU=;
        b=kKjHiFKyJ5SvWDHOGzrA+04rszIl/uRG1vwweT+cQmHHFIoOrapvG9yHYE9uNb8EeU
         0ruXQEdZZK5oQuKrDY+173S+NPyNI4r5t6d853oglgy98j3mwD54VzRw4iEtQYtBwhxt
         6aQLkQWMJ6F1Qd9t0mnnHaqGXf8f9QaxXDmnIgM8bIt86Fu4TI6oCJXRr2wY68UWVzVJ
         03YJZb9dmhnhsY+i8xvxiw/tNtXQK0YNI7EmJkLYLQkDf4x4yJHju8oBb+ddFpGiBpKo
         4eT44U+wz+ItmRUN/qhEZdvJXeQNGr1TevUjrygugDXjUm+ys4nx8ZeeUD8qpzH6q0qE
         4Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726420638; x=1727025438;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3MYC8SASoZ/ndWRkqJRsLIGEaMN4yR8qugkGycdBeU=;
        b=gxR1X0F3/NQqkITMHVG2MnkrKvFlnk2vuJiqHMuqFmVhCwdIZV88wtAEuL9P5CtQjI
         SOfQmBnN4zo01l9Iy5DNhPJmnpQ2JJmm/yE5jeu1qwsNOif1p/+vU7PRi4uVcbVPXR0+
         iUo41HX9L2666R8/Wbob1Ri5xY96aqPKpbH7+2tA/XDSOwcd1hMfITjTAPV7gj8MKbkM
         J3DqGvKf+eu1hGZrZibc61GvUHB4/44PvacKkDuMkF6wnrwltMloZVHJzsNWCkyVbKgJ
         nnPPrBcGLWGYpRsU/2EqhVshbejTSHRWs1mbrnHtMD7hDUpZRP4m8vMkacbBu0N5EMs6
         lbeQ==
X-Gm-Message-State: AOJu0YzLUY8Bwbs++NEvmVjiKhWICxvpjl2Tyj+jL/JIOBO+Z5EB2VL9
	PrZ+xp17TkDEoyv/ZoaffF++dnAj1S7FDdnZ2lXSe7vlZ21SAyhdET8F7TkL
X-Google-Smtp-Source: AGHT+IHdiMlMzqsYfEtVecSgQ8fvbmLg1pydLhc+Ch7J12yaTYGKzmMQycwbX4PwK60k/pxwM2ufbA==
X-Received: by 2002:a05:6a21:9201:b0:1cf:3885:b9d8 with SMTP id adf61e73a8af0-1cf75ef2beemr19256548637.27.1726420637928;
        Sun, 15 Sep 2024 10:17:17 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4990cebbsm2795122a12.37.2024.09.15.10.17.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2024 10:17:16 -0700 (PDT)
From: "D. Miller" <surjaorkumar084@gmail.com>
X-Google-Original-From: "D. Miller" <info@sourcemedia.com>
Message-ID: <7cf7b5089c638289276854d58f7b1367b662a4c5b5d12b0860455f888bbc4f56@mx.google.com>
To: linux-riscv@lists.infradead.org
Subject: 9/15/2024
Date: Sun, 15 Sep 2024 13:17:13 -0400
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_101719_993545_456BAB77 
X-CRM114-Status: UNSURE (   1.78  )
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
Reply-To: dorisjmiller80@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,
I'm giving out my late husband's Yamaha Baby Grand Piano to any passionate instrument lover, kindly let me know if you will be interested or have someone who will.

Thanks,

Doris.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
