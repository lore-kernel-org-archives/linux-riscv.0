Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9339C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lbItLYI/XpktmP932ztcMBmK9yO72jI0tLvLS/yoA0=; b=xBVV7W3FlX6g4m
	QWHDo+IH0aE3qqofGyec1wKs+HKkSFg+/SD6nvOtWqIjlS/23qBF7uPT6ANekyTZ+y7KmRHQ+ksOE
	WbGFngSbCrVI27d9wiOUT+p77myzyMgpgiL+8gSkHDlu1qqQOuxt+RkV9n76VtIkkJgXcABTP49iq
	MF2q/ixYShp0trunIAFjlrZYJy1Xd/GoIKWI6GV0eo/Sm2UYm6l/NXZAIk/IK8w7m8Fecq6IwS5Hn
	lAVZwhjb0RRbypeYOgHEI7+UPic6WkAmLLbiNWAcmfpqh4flvMiKvfRPMlcnmmf0SEN9e/NO191dj
	kyAb+mv+fDXfrv6Kzchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADtP-005LST-2E;
	Mon, 04 Dec 2023 18:42:07 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADtM-005LQL-17
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 18:42:06 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ce46470647so854830b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 10:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701715323; x=1702320123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwMqSnGo4QDjm2pjAxkXN4dZgMZZOVKqtY+jomMdbrk=;
        b=R8NjNvBfN0ByY8NYuvnjvDNFxxlXonk1RlfHJatqdxOPeHA0d68p22IwWwAKnszW3J
         uyjuwAjlPGktDdqnM66ixg0i9YEXpQDeSe43zV8IqnmQ4QEoDib4qGKd+BBhJx+cIOV3
         B/hpUn77xM934ylgFj0wtwqFhh+jOP3mcLcbz64yXk7j9d1wH6Z2kiF3Bq+5uJK98BIL
         eH9Xc9XPIovmaY7xIO3o2GuEygNsfPeoLxoJEllFwTLX2MpLN0CcwsFy99VVKRtZEO52
         jTBJAKzZ3kkbH1p4VeV1r4kongBhZr/ABo7yhzu+Q5GxxvvD9M1KYSZmCFas2uIV4+7B
         RcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701715323; x=1702320123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwMqSnGo4QDjm2pjAxkXN4dZgMZZOVKqtY+jomMdbrk=;
        b=rBNiGVQz7UpN6RnAeBZHA7lcRlq55QyC8IZDSCuKHAfBiUXuDnYs6mxYtx2DyiE7fR
         UPc+JplJGLh0grz6U9kxAnIwwZh4dRvCtbHwdJjnGNsbaZsfYIFyiroZg55hm46WNVOi
         0SQWefdAkVA8rJ3FHxCRWpdcPFcsSTFVh2Q+bKN5JzvQb8tUP8h6641yIw8Tvu4EISng
         yMkdqbpHezDRS/X7aLf8QR/sAUDT3/HdqiaHnRXHIWUSazfvetOYFl+cH3B9e3/nU1O1
         R2X0G3c1gWSEAA5p8KzzLbBS0e3Bqq51vhV6Bz+XhpcVO1pSE8vRi9BPyyNdXs1Ixe5V
         MNFA==
X-Gm-Message-State: AOJu0YzrIKCUdviWE2GTMvDnaI1px5DTNW0swuyiMi9YOGOKsimMC8HF
	Len60sGrXCU1BMTJt97YCRzUZOaKPEoETjdvC8v3rQ==
X-Google-Smtp-Source: AGHT+IHKEES0EPsD+IyXZ6wxSaPge1KMCqc5mn24C5+zo1vqFwVwrwwwLQ+SFGxsjolXMOrQ4oEdmg==
X-Received: by 2002:a05:6a00:340f:b0:6ce:58d3:34ee with SMTP id cn15-20020a056a00340f00b006ce58d334eemr2724pfb.30.1701715322912;
        Mon, 04 Dec 2023 10:42:02 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id j8-20020aa783c8000000b006c320b9897fsm7954921pfn.126.2023.12.04.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:42:02 -0800 (PST)
Date: Mon, 4 Dec 2023 10:42:00 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ron Economos <re@w6rz.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Safely remove entries from relocation list
Message-ID: <ZW4dePVEM8sslNAJ@ghost>
References: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
 <20231122-module_linking_freeing-v3-1-8e9e412a3305@rivosinc.com>
 <87bkbfzddr.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkbfzddr.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_104204_627774_E4864B08 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, Nov 27, 2023 at 11:42:08AM +0100, Andreas Schwab wrote:
> On Nov 22 2023, Charlie Jenkins wrote:
> 
> > @@ -683,17 +700,29 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
> >  
> >  	if (!found) {
> >  		rel_head = kmalloc(sizeof(*rel_head), GFP_KERNEL);
> > +
> > +		if (!rel_head)
> > +			return -ENOMEM;
> > +
> >  		rel_head->rel_entry =
> >  			kmalloc(sizeof(struct list_head), GFP_KERNEL);
> > +
> > +		if (!rel_head->rel_entry)
> > +			return -ENOMEM;
> 
> This leaks rel_head on error.
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

Thank you for pointing this out, I fixed this issue in the next version
but forgot to respond to this thread.

https://lore.kernel.org/linux-riscv/20231127-module_linking_freeing-v4-1-a2ca1d7027d0@rivosinc.com/

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
