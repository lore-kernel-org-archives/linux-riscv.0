Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF99C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628F620676
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ce5+l+pc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OkklBWPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628F620676
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uD8WaFWrmUlk1r5i58qjXvkVpxbTTMD8gyvcRnBy4EM=; b=ce5+l+pcsgNV6fQVrV7RBWcqM
	upIz+F1JNDPTeIell0woA6jYfuCfCkjR2RuPfTxSMTXWx0esz+ps522PFaTV+km9pFFZ9Xspu6QTO
	FCj+E+Ws8hTeXlpXjQi96xlqMMtMWHb9B+z8BE+4OEgBkD9Gc9sRu42epLrGICJBF9Wm2rTvvDsCr
	iSuBqPOH3YWOd9VoiBvAismFA4tR5k7EMmwJpC4x4+jMLB+o82XXMpappj0eviNFI4aedtWSnuxds
	fU/0XKaVa6mcwOVDiOvQUObiEq+RCcqrh4skpifvGlO0Usi8JN+cQ/oGYX3xy+h/N7Di7oASPnQAa
	pfNa5ea1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4qcr-0001ni-It; Tue, 25 Sep 2018 16:55:53 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4qBH-0002RF-JX
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 16:27:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id y18-v6so8635858pge.0
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hkFg8tZ3ZHqdm5X6Zj0yvqredzmGzdE8fMXMHOKa8Go=;
 b=OkklBWPZObDZMexHRsCPqZJHlIYOruaRqnIrNHLV5tjxZljlFG8AaXVqJFmgS2Y1dZ
 MJqqf2ntCDKqitqkoCK59Y4xAACKVB7vdycs7ikhBV07fqckWZAD7ArUQ417znHWW7o1
 WOOvN+P1a53Ltxg7tMag7rp76LhIhyVHqk5qZGTHm2qxCDAMImCsNMiAJURtYwkw2SrR
 pdl0+v1EdxUwh30Bju7WK4teg6FwZeEddP4XfittxdD/fWZgauhTiE4/uU/hhFfLv9nM
 r0vLodqfZndU+jufu6heRbC1SadmyhSXrUqIGyr9HMZJp51xC31VCJ3YVr9ugFLspSBd
 oaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hkFg8tZ3ZHqdm5X6Zj0yvqredzmGzdE8fMXMHOKa8Go=;
 b=lnE6kMgZagiy1pWVQGABR9nQXukkmdLoQq1G2POCXEgztJ+JWw5QHDaD74O84c+hb/
 QXyzu5up0VmVCaNQA/RcoxjY9IRKSzNTa+U3QGE8/7WI3yQOmzUfp5S95SjsD0NHb48T
 ez7t19aQ5spkgMxeVagOwIAMcvT72urSEgXPFRFvpkRc23QS6QG6hiBKEpeiIGzvnsQy
 UvPENN+4nORv9JbACKAjw4c1YP6TTcY58p81noTrENYJ/CXzAXfiB4c4UDI02grcQirO
 t6fEUfrHMzyuV1oUIiErYH0d5q5kWfMybwX94bFc7MYSD6B2O/dBwQhw2nNLbQrta3cS
 ANgg==
X-Gm-Message-State: ABuFfoghc1YcV59P/juHR8dYQiC0lbTxowOnh/eT52lBjraH3OIi7ruD
 BxMrwWqgH2kWIU2q5EunWtUy6omM23s=
X-Google-Smtp-Source: ACcGV62WRwTe7RFU87t/GdL0baP2zXbT/xh6PpUbeHf7C1gTX6GvXQnUGK07woyTwlINFxSgQmWi3A==
X-Received: by 2002:a63:f252:: with SMTP id d18-v6mr1793396pgk.2.1537892812839; 
 Tue, 25 Sep 2018 09:26:52 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o17-v6sm4002572pgc.30.2018.09.25.09.26.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 09:26:51 -0700 (PDT)
Date: Tue, 25 Sep 2018 09:26:51 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Sep 2018 09:20:02 PDT (-0700)
Subject: Re: [GIT PULL] A Single RISC-V Update for 4.19-rc6
In-Reply-To: <20180925161538.GA5328@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-3ad7c756-ed90-4cfd-b178-cd09e021a758@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_092723_692385_A2EF688C 
X-CRM114-Status: GOOD (  14.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925162651.2dJlLKPW7W3f7vA2GYGWUd8j9pcVE9A5Cc9ssaIR4kQ@z>

On Tue, 25 Sep 2018 09:15:38 PDT (-0700), Christoph Hellwig wrote:
> I think this fix isn't quite right actually - we don't need asm-generic
> asm-prototypes.h, as said in the review of this patch.
>
> Also on it's own it isn't going to help with doing a modversions enabled
> build, as the return_to_handler export needs to be dropped.

Ah, sorry -- my understanding was that while this wasn't the cleanest fix, it 
would at least enable the Debian people to work around their issue.  If that's 
not the case then I'll just drop this PR, but I'd really like to enable the 
Debian people to ship kernel images and that's a big step.

Did I misunderstand what's going on here?  I tried to build it according to the 
patch's instructions and don't remember seeing the warnings, but I might just 
be wrong here...

> Last but not least I'm not sure who is going pull this if you only
> send it to linux-riscv :)

My flow is to tag PRs on Monday and then send them to linux-riscv for review.  
If there are no issues then I send them to Linus on Wednesday morning.  The 
flow is designed to catch issues like this, but I think it's the first time we 
found something concrete.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
