Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACEDC48BE5
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26AEA61179
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26AEA61179
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cVK2Cx0IwQ/TxTqhqUyC2UAva6F8HKE0bsGfPYYc6Vs=; b=uM8uUwtS1+O2hxqxAXAgkbXxDv
	zjU6ddRaBJ4igQPh6QioyOhzyfnXP8gXDq49pswHUytSZU7BXhG0o/nM5aYj4/nca0j5PY2ytdVZO
	W04bxOtbRMIcYZxIpdsFKf1K1V7m3GUeRuWQM+T4C2B8id7nLELevi7g1wGCp9xCMxj3hdY1x3X4f
	+hVbhb8U7vgsCySmRK/YThCQVYZd9jpIuhYUnQTdZt/P11/V5sYyVKBS5jajen/PyRd8U9+ThhKck
	o5L8XzcB1sxcYPo6Tv/po46cO++gNL2hhmIky9RBf/0u4ybbfptwdL7/HZlUxtIanOLmlaHVqmWx+
	07bk0MZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsEI5-009OlC-Qv; Sun, 13 Jun 2021 00:47:53 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsEI3-009OkE-3G
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 00:47:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id j12so5664076pgh.7
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4kWa26xpJIdxZYrpzpwz50JQfmVdBmBBJbvqtAaT0d8=;
 b=wGMDSKqyMSIsHWwMFHIZjtVTUgOt2eqxw28tQu/pnFGgSW8Q2gQ3Zmta4c+K1CwyLG
 8SfhBIEDrSV/catxYve1qFQKJmXpGd1SAFlkMBG0r14G38NGQo6XqVdFIHLF29b9HbXj
 tlu8JcE30UrIFAIiKVzMXA2rZdL5RWNXnzYexNKCrueknJu6/jqkVtxK4ZKBFVivkCEW
 ituYCchaCRmZRr1kBtR8rK43kxpt7fm9Gc9OfX4+c2NUfDjgyr7VCRdXUKwSz71Ju4oe
 tS9vpQiL9CgteFFYz7p5uRFiROi6M2Ur47nlSiVhKKw2GpsbKsjPXwiOIgsXZ6UCre1P
 VVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4kWa26xpJIdxZYrpzpwz50JQfmVdBmBBJbvqtAaT0d8=;
 b=oiOYgMlPFJ41J/F0p7+s7LaioMbHx+N/B1TwHnVykG8D2D7S5EPEwlQFvzuY3Q0DW3
 ySzpxZHTTcmLaFVZdEfn7fMrav74qKiXsY3ZcqQVPe2ZdviJhXdUMogilyeZ0oARz0Z4
 ggfDDcyZpyszWyUJaooYd52ZAdGnAIexFVzSBvmEnSjeHj6agcr0griIKl98CatNl2e1
 3shTNjAe4d0wwDhmT6YBsATzAIpSwAsQQaVhG74ijO76F/9JOve26bcrAWPk2wfHzLae
 Hw2ERacoD3BzTRvXMlAw6+nTZ8E6rjhcCSEIQMEzucXxWIEz48JsyU9UFCgfvPwtn3Oj
 4H8g==
X-Gm-Message-State: AOAM533CXgob94T/+hTxyLCkJuxmYMYHhfXTxeVPzLFzk4DiB+JJP+SR
 XaQkTh1Wkhbg2Bs3K1JxlO9+Og==
X-Google-Smtp-Source: ABdhPJyEAyBXCrrdWDsx9ImGWRr9gYRZyt5nhuJJ8UPC83rSCiNYu06eyx6tcQ+qv52aMFoRrlOZXA==
X-Received: by 2002:a62:2bc6:0:b029:2e7:a7c2:201 with SMTP id
 r189-20020a622bc60000b02902e7a7c20201mr15247548pfr.64.1623545261587; 
 Sat, 12 Jun 2021 17:47:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j12sm8903628pgs.83.2021.06.12.17.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 17:47:41 -0700 (PDT)
Date: Sat, 12 Jun 2021 17:47:41 -0700 (PDT)
X-Google-Original-Date: Sat, 12 Jun 2021 17:25:37 PDT (-0700)
Subject: Re: rebased ASID-based tlbflush
In-Reply-To: <20210606152050.636038-1-hch@lst.de>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-fe973a87-b364-4190-96f5-194895558801@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_174751_172375_72447782 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Jun 2021 08:20:48 PDT (-0700), Christoph Hellwig wrote:
> Hi all,
>
> this is what I think is a resonable set of patches for the ASID based
> flushing, largely based on the work from Guo and thus attributed to him.

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
