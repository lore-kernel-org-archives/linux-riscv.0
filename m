Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05D9C07E95
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 00:21:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C6461360
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 00:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C6461360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tuSmhNf6M0tPq0ZRZEg97QTA8d/RZyy7MeRqF06kpNM=; b=RUUs24uBbcXA1X2RTXqC5ORv5I
	L9JArtyrgdxsN5roIg8I5nhe0QIsFKJrWGMeuu8bI9CuuoCjzB+StjyJC/s5WtfMSbec3nt9lWIKO
	BqHf13N9cueb9x6oZqHkDN3a6HBMLIiGkohzaodp80Ijs2/zFaMz5DMhvpRrGhx+KVObsnmcHaKnn
	2BgtRsYb2T76qyn2DvdiyGHvGx0J3w3iy5VpAX1zNDT0g3eql71wm79er2LT5n+C3Il7xhlQ5Sshx
	y7hKfsBCO+SIV3cS6ehFsVSeHtF0IR06vQBq2i8bf/bkPBoLHuXQXb8xF/h89GfIvON9kdNXKVeAq
	L53VTbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Sdr-00BkLT-RE; Wed, 14 Jul 2021 00:20:47 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Sdd-00BkIn-KG
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 00:20:35 +0000
Received: by mail-il1-x130.google.com with SMTP id o8so14216212ilf.4
 for <linux-riscv@lists.infradead.org>; Tue, 13 Jul 2021 17:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=O3GExnVczfUOt4y6aHmFDd/ImVOXZspx323TdrIBemg=;
 b=qQ6Nye1cZ7NtyHjGfVkQQo3BD1WAJ9czkzPzt+ikSvAoPA/bL2NMJlyIHY0zgrpweW
 QK2M1zpmdU2Epg4s4aooXVgnMssTdCORwm8fdtOrDOLBGjXorfuETGFswmbP8eMj677q
 YEOm+gwQikLXPfTe1Nlf/bKVJ7Yi7AxHQpehy7YsmQm0xThCOhkDJ8Hsxf3W2RK4R1to
 4Tn97waNXUt34FMC7E+0rx7oiLqT2JXSss2qKLr6qgiEEUC/N00SPTk1T/QxRgHq7qLC
 oMD9P4MO30FNRuf0Ok53PEBLq26VlIW2CztDNwDA+772Mfx4vNC6EkFu4K2Q3H0F3pkk
 9dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=O3GExnVczfUOt4y6aHmFDd/ImVOXZspx323TdrIBemg=;
 b=eaF0W/mMHSufNGG5RxI+EBuyAyWZUbyDvMsawN0ee07ssPE+WezBk5Wz9PikBYrljA
 hVWsS3RLEOJy0boND0f2Rybqkh9yQ6oN44hjq74z1TNpfijqbxTsth7//7zJaPlEbcry
 64EdsdR6BV7xnCT0xGANzAI6U/8Nj0aZuHW3HrAvEVmRzPKJ9GdiSqaLIipu4w6K3qqI
 CH98gTcGTikJmltmfsPWppX035pk/CGjT9/VVaC81CUGt1tnuUQXVhTjREu05MpZ0j6k
 L5LVLIWYlRTSDwPtO4tYmarj8uCjiXp4WQCc1bsiXje0pYuGNGYmc/mCwGkVB1W4n5Q4
 eqsg==
X-Gm-Message-State: AOAM530PaJQC8jGw6uTfAGbMcEtQKqrpqy4mXCSK1xZSW9WmPQMqhk4u
 WPt4GeluIQVESYdiotfTnVw=
X-Google-Smtp-Source: ABdhPJx7cYCy3SoqVdvOnw+gGpQu31dUzwdkbm/T/30anr7Cv7o5V3/kgnzuFZR0o4nQyvqwtJIWdg==
X-Received: by 2002:a92:c504:: with SMTP id r4mr4654610ilg.131.1626222032028; 
 Tue, 13 Jul 2021 17:20:32 -0700 (PDT)
Received: from localhost ([172.243.157.240])
 by smtp.gmail.com with ESMTPSA id r6sm314516ilh.35.2021.07.13.17.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 17:20:31 -0700 (PDT)
Date: Tue, 13 Jul 2021 17:20:23 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: "Roy, UjjaL" <royujjal@gmail.com>, Song Liu <song@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, 
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Networking <netdev@vger.kernel.org>, BPF <bpf@vger.kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Message-ID: <60ee2dc76ac1c_196e22088d@john-XPS-13-9370.notmuch>
In-Reply-To: <20210712173723.1597-1-royujjal@gmail.com>
References: <"Roy, UjjaL" <royujjal@gmail.com>>
 <20210712173723.1597-1-royujjal@gmail.com>
Subject: RE: [PATCH v2 bpf-nxt] Documentation/bpf: Add heading and example for
 extensions in filter.rst
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_172033_730397_19E6F6D3 
X-CRM114-Status: UNSURE (   8.55  )
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

Roy, UjjaL wrote:
> [1] https://www.kernel.org/doc/html/latest/bpf/
> 
> Add new heading for extensions to make it more readable. Also, add one
> more example of filtering interface index for better understanding.
> 
> Signed-off-by: Roy, UjjaL <royujjal@gmail.com>
> Acked-by: Song Liu <songliubraving@fb.com>

Looks OK to me. I thought the original was readable without the header, but
if it helps someone seems easy enough to do.

Acked-by: John Fastabend <john.fastabend@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
