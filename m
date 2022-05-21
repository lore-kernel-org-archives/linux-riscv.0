Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A53C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lcky8G2GTxXI18E4oLvCCmrbkjeUu3w8yRUUYgXAZ+k=; b=Hm2E/qyJ8SX+Ge
	DvMnbYSRMYT2FB62+n4zh173zNjWWmWWJ67GEy9hdHjTwjNPZWt2rVsNcCYlO4j8AubpmLVr4AL9w
	hifavI19yrCS3LvX3WgK7ibZtwWjWGRmHZyJyAl+VNJqw08DTKYiDUsw1vvNc3RUtylhnaeEOBbvv
	bLyQDJTg40znCWIg45RnGtWOIXpy23qcUta3tpMNaWTezswSeu3kEtJ5vhrb5XejxTjziN+sX1dgN
	HGyvPe1iWhseL+Yfrs7OLI/CaGPTHmO4AOr5KTP/jw6KFUjva2DfwhMkXOEIWP89xwiCjjeK/OgNp
	Snb/+/oTIadZ+UtGZGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsX1Y-00Haz9-FR; Sat, 21 May 2022 21:52:36 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsX1W-00HayU-7F
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 21:52:35 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ck4so17399178ejb.8
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 14:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lhqDaPng1+rkR278Y3VlEC/fO44ND23dAfQ1G8YCCB8=;
 b=GQjSOd/UKrCh8XOCWTN7wvpZqdXZiDxxpauAeARK/YG5PG2AgEyaZ9bjPQM8BKAnKU
 Lj4nbiaorgFuIqXxKuzN+1X0O9rN8WA9ZASGOEBKdTL9yVj67uv1RRtna8a/PZ7CB+H7
 7cIAk4zF9F6+Q7gVva8aLQZQvC2AUyVnpQ8Kme85ejVZZWrd/hrBLxtyO163t5HvnK5q
 XA12qAMzmJLiJguF4aJuYm0GNfmw/0/0hOszL+kdF8+tKQ7Vm15VzW9SWpbeb5Yo5U2a
 cAHQ2kpkc0kgtHQkDl+whD7mNEdv9OhLmgxBQ4x65an5V/MTV1FR+EMsG2o1xmQBjt54
 hpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lhqDaPng1+rkR278Y3VlEC/fO44ND23dAfQ1G8YCCB8=;
 b=xGJZYl8bupzsHw3DLamQFF5+R9yQNdCVKkQpo1E/VpIGrFGVyPSYlsSuaxYHAMhjTR
 ikXX3QezLmDra8snNT2xiB/uYLjholwnE1HWaX2Oy9fVKRVh8FeAPuYEdivatudl8iPU
 xdSdSPHnadMGmLjW2xUqTYNlGWNCJ/Y2z9L4voqHxh4KSrDxs3Ww+7EFP4lF3ouO3lgS
 RZ+0X4fBqRQIyZcVM8XtWQu/e0Xxv255FN8wFzZoRvzvgN17LQxgXKJ2dtqh6LH4fzts
 IAemec2L7vt5/OJmizij54SiQKg4n8oouV+8r1D3047DjELvpd1ZsdgU+YWZwoBgrfwA
 1zMQ==
X-Gm-Message-State: AOAM533b3q00Y8Q06ubv17vYHSmmnwQ4UY3BaQ1Y9nOYg5973bS18f3p
 U+Z761F8rE7vfW2iwypxvXQ=
X-Google-Smtp-Source: ABdhPJx/bbB1i2GUTWTqk9nbhSd4CD/YIrK/kooZdYTLqaRet9U4rNhV4ffWCgfJ0KJZT0fNhq+pRw==
X-Received: by 2002:a17:907:9487:b0:6f8:747a:845e with SMTP id
 dm7-20020a170907948700b006f8747a845emr14307658ejc.299.1653169952432; 
 Sat, 21 May 2022 14:52:32 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214daesm4606931ejc.20.2022.05.21.14.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 14:52:31 -0700 (PDT)
Date: Sat, 21 May 2022 23:52:31 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 2/6] RISC-V: Match GCC's semantics for multiple -march
 instances
Message-ID: <20220521215231.66yvpgji64uqbyzv@mail>
References: <20220402050041.21302-1-palmer@rivosinc.com>
 <20220402050041.21302-3-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402050041.21302-3-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_145234_298569_0251E19C 
X-CRM114-Status: GOOD (  11.61  )
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

On Fri, Apr 01, 2022 at 10:00:37PM -0700, Palmer Dabbelt wrote:
> GCC's semantics for "-march=X -march=Y" are that Y entirely overrides X,
> but sparse takes the union of these two ISA strings.

OK, but then I prefer to explicitly clear riscv_flags at the start
of the function, like:

diff --git a/target-riscv.c b/target-riscv.c
index 3bba7c15ff1f..ca38d76e6465 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -54,6 +54,9 @@ static void parse_march_riscv(const char *arg)
 	};
 	int i;
 
+	// Each -march=.. options entirely overrides previous ones
+	riscv_flags = 0;
+
 	for (i = 0; i < ARRAY_SIZE(basic_sets); i++) {
 		const char *pat = basic_sets[i].pattern;
 		size_t len = strlen(pat);


-- Luc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
