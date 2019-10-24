Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AF6CA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 16:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA22E20659
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 16:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnpfL506";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WrSXffZq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA22E20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJuliAVrpDQVnWb2g19LzZ9UoM4niaamJRldf5Xdnq8=; b=GnpfL506WeLbj7
	CMxqkzrOVPuJBEOS4WJhnpgb1alBP8Q+FqTRql2YPDqLY7b+ag4sG9WockpJPpdozxpkmyEocPwHB
	fSz1XlQM4sKeLZpT2IAGvK78fETrTtvKqOPAEXOnu9r3NlaJhnJvO3dNNQWSBjtqYMbD8ygOhc52U
	BWT+PzEjgiv/mRTVhh4vZlpJOBDZwo2PisePaH+npjK8LTIgEdKV5aArhUYrFXYAQobrg5iTtUT+j
	XBm0gTWadmo5q3CaBPaqDh3UxrGx9/uzyjtXhFfPKieZgSexssMIAfPFVbtdpUSh0+e1lOgvrDlIx
	fQ+iyRSm0FT3FTs9EjFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNfiz-0002Vi-QY; Thu, 24 Oct 2019 16:12:33 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNfix-0002VP-DH
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 16:12:32 +0000
Received: by mail-io1-xd41.google.com with SMTP id y12so12611315ioa.6
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=x8BcYVSo0pJZRja7sdoJCDj46ChlVP1Uu1gFubHhlq0=;
 b=WrSXffZqMdHEcdR0kEWpEUrkhkCUZwcc2nyZNuOTKQAWGAhrQwu67PdqkmJ1aIUvmG
 SGUXrt/8F4W3U+WGp6wN11YM4DMk+4L/nFzTPwxMGGofUPVj/8WhzOeqyc9ZMIN9an5j
 5GIgtGQJ2HpmoyMLhELSImt43FECietuSbYNJBe9/ywDMoEn0e8mjIqd1KDfliDjx1tx
 Vshjb/3SBVH9m9iaL424UpHXDjdm4VKLMDCdvYoJdN1+/BcqIFxa0DVx13EGL16mvL93
 6py3UTEfII7C5so/A6gn8X4r72TZKUsBkZVfYdWFoTpcLsiUk0/mPym0liLv6A1JDPBf
 EMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=x8BcYVSo0pJZRja7sdoJCDj46ChlVP1Uu1gFubHhlq0=;
 b=Ds7iVOV1SXUHuCW813j0fClYIJbIjo5Nd9F+UT728XbTU05/2pdhmXSlyJs+/vNSnB
 PBBP+3q0OScE2dPSPGTrQFxQYnJjhaQFvIi0y3gJbfmsqG0hBYdEWcQjmyxxvh3ewSUh
 F2vXsGSK5diCDr2rGmECQ1BXiypeIQGK/Cqf+Bk8do6grDIKZANKer9m224ZYu2h/tW+
 KV15q3JG6H6NrlgXgnZk2J3sVuSuEff64qP7lbQb1xAQCFEDnhItTyoxCCCYcumCOfX2
 Peug7NBAdVE/ZENg3i7W11Z7BbrlNusajdvv+5VO08gr6dtK6nDEjD5YS+6oELMQ/dCk
 wPOw==
X-Gm-Message-State: APjAAAWR+lhEotBrL6jksq0PLOjieNtqauvH8rbnUy7BkkNYDhg4mzVk
 ij6NK7Rm3/VONL/FWh4xBH6lYRKDWe8=
X-Google-Smtp-Source: APXvYqy/TeE4NhBXgApTdoPb56BzW+erMv2a5LVVnlWBPETD42YroQWe0pJpABVPpEW2iKEGGRcMSQ==
X-Received: by 2002:a6b:8d09:: with SMTP id p9mr10616395iod.227.1571933550400; 
 Thu, 24 Oct 2019 09:12:30 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id s5sm7561225iol.71.2019.10.24.09.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:12:29 -0700 (PDT)
Date: Thu, 24 Oct 2019 09:12:27 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] riscv: only select serial sifive if TTY is enabled
In-Reply-To: <20191024072003.87116-1-wangkefeng.wang@huawei.com>
Message-ID: <alpine.DEB.2.21.9999.1910240911590.20010@viisi.sifive.com>
References: <20191024072003.87116-1-wangkefeng.wang@huawei.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_091231_451690_FADDCAC1 
X-CRM114-Status: UNSURE (   6.43  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 24 Oct 2019, Kefeng Wang wrote:

> There is some warning if TTY is not enabled, and lead to
> build error, only select serial sifive if TTY enabled, and
> this also makes randconfig happy.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Thanks for doing these randconfig tests!  Queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
