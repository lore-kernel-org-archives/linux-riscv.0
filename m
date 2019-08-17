Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74471C3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 19:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CE521019
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 19:11:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ndSNomDP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FYZoGl/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CE521019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1kUT3eoEiWS095QF897CgyvMj8MufS2blONdkToGSlE=; b=ndSNomDP0vmE9/
	tnFHT9TOv2Ii31yDK7Ms2r8RPcZulFYTt3a35SqodEmDUC/tCLh75L1lYKQmmUcwtK56yaRzXngTc
	ucSliw0/WxokmORuaKpiI8ShhL3qUB63RscmOq8K0gtiE27WTAcK7Q+O0nHdnZQalj/DuveueBiME
	fTqn46bT4e5ZoSUNhy8twozzr5uJHIlNdamha6V4fcse+XAH18/j3TTbWi21fUbYoe6e6ru/Xdgvh
	dezM8XKWH7Z5floE8/Z6n68jGSaDzhXnG/T8EGVzkT+QwHL3H+Ggc+BGNlunZ50JVu940yvdhAPrS
	SR17ZmXb5RYXwrd+uz2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hz46v-0008Eg-Nf; Sat, 17 Aug 2019 19:11:33 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz46s-0008EE-Fu
 for linux-riscv@lists.infradead.org; Sat, 17 Aug 2019 19:11:32 +0000
Received: by mail-io1-xd41.google.com with SMTP id j5so12942708ioj.8
 for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2019 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:subject:message-id:user-agent:mime-version;
 bh=3MH+KcofjVATRoRd6ATBavy8RSHNWVPLU7weq/zXh4U=;
 b=FYZoGl/cSEfVM66LpSdmNAnFbLSCoFHSsZ5OXRuLwEDeWX6LvKAW2otVpnXo3AORgk
 rivKaz72+580JUZv7wv4dFWs/k1yj0QC53wegg0Fm2Qx4lpqP2gqmxxroyGj+cXTX75N
 3o7kAuITyCAcMYdKKZR0VOi/ycaFkJBUp1TEK62o5FQOhW1YGvdUaPGhR4drGq0WXgHL
 8mOF17QmJ6hKSaXtitFhonm2hD7fCe3yHbpPCYEkkH1UWgfblRnLZQT4rDXOYa0JVE0N
 fphAa++KClqlpIgrQw8Lu4ZytqoCO5+Pr9hjnD/vGbh9fVbp2lnxHV9/xaC18GvJPK7W
 MPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:user-agent
 :mime-version;
 bh=3MH+KcofjVATRoRd6ATBavy8RSHNWVPLU7weq/zXh4U=;
 b=n3Eqo/GsJrbffdl8aZ8VR9An3O0mysfNyyN9/XpO4EMg7E0lfUa6hRzXC+Ab7BhakY
 bTHJaFPscasZgYzvErJqYJkPAGMp9fxe5ruTIqW4uWmSuaKRTr5g/QuiVtuyCMxToJa0
 hNTaEU/fZtWWmofkm5/0QRXt36OlKutjZ6hShVi3uCvZMot+3QTTQ7Omqx3+jg0fb8h+
 NsSBYmC/n5MclcyHJFE0rnyA+lRjF49sw8RwVM6tcMap/WqFfdOckWrirGyzlQM5YRub
 KJ//wTGEnazHWfTdt4i8ptCHcCtfy2ghmgCJUnSYOb7MqpTXevMEgB9hxH2XcNSZo43h
 Oa9Q==
X-Gm-Message-State: APjAAAUYBbTSEJYycpWmoA/Gpz1SuOC2oPq+FwQxLxWdLgjQIuZbWe11
 /wo1HA0zncABM75rteJZfbUXY8eFKa8=
X-Google-Smtp-Source: APXvYqwlKu0g92JDVhxTuFF7zl2fOdmCEuEf/ScxA0MtRInXAGhmljHAyHBuCxi/plIOUWT5+hS2fQ==
X-Received: by 2002:a02:a703:: with SMTP id k3mr17420217jam.12.1566069088210; 
 Sat, 17 Aug 2019 12:11:28 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 q8sm8421823ion.82.2019.08.17.12.11.27
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 12:11:27 -0700 (PDT)
Date: Sat, 17 Aug 2019 12:11:27 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: Improving our commit messages
Message-ID: <alpine.DEB.2.21.9999.1908171200020.4130@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_121130_562910_93517F3B 
X-CRM114-Status: UNSURE (   5.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Fellow linux-riscv folks,

I've received feedback from a longtime kernel developer that some of the 
patch descriptions that we're sending upstream could be better-written.  
I've also noticed other (non-RISC-V) kernel developers being more 
attentive to the quality of patch descriptions than has often been the 
case in the past.

So far, as maintainers, we've used a light touch on patch descriptions.  
But I think it's time for us all to be more active here.  And as 
maintainers, we'll become more discerning, also - we'll start pushing back 
more if something isn't clear.

Everyone should please quickly re-read this section of 
"submitting-patches":

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n102

As a maintainer, I'd say the most important goal for anyone writing 
patches is to answer the question "why": Why should someone want to apply 
this patch?  Why is it needed?  It's okay to summarize "how," particularly 
for more complex patches, but competent developers should be able to read 
that from the code.  "why" is really the most important question to 
answer.

Please also don't hesitate to use a spell-checker if you're uncertain 
about spelling.  English spelling sucks, there's no two ways about it; but 
at least a spell checker can help.

Thanks for your attention everyone,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
