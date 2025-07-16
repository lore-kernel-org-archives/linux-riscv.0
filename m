Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B952C83F34
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ht3gLmohGq6gf00K0LN6/r9cml3yXmUJSj6haaXmaPE=; b=MxDYY8kkjOjkB5KnNtV/fZRO+I
	endUR59det5BW5DzAK0qxeZ7dxcP/0zNoiR4JDEswo7/pNuxKBOkcdHCUwvqiHLZS25vjI3wv9Q9b
	Vt1Jv1PXdToQMRRciiWNUEkvmvxrQL09h+r5ox6uus3W2qllHR8W2tQgIyKA+ciCd57oh5Knmr3/Y
	ZPDLLbI/9UI9qVyUC0MdF+k+BzkQpxT/x/yoyoYwi3sDMX6UiuB4CqoEg6qaW9dlobKNzToQGXAxh
	I0dwEY9+/kx4U++8tsy7r0UZ2M9k5D+YQlg3fK8MvaCYPV0ZxL4gs2PfKXaYafBwFI23dslzfiwh4
	e7rKIZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc445-000000083yQ-1vrH;
	Wed, 16 Jul 2025 15:29:01 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3y2-000000082eb-0s2Z
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 15:22:47 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso3590933a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752679365; x=1753284165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4vl3Ek2bHdxNr4E5QFSQW0xOn72vkMZt86TovXCUIE=;
        b=l2QchwTMhEbZ4lXxwWtDgzhONw38+IICatDOPDIuLYWSufUl2H5cv7vy0ffhRQssXp
         QwLcSxzCVAIHwAi4a9wRRBb+FoAcvz0sFT4qtSL8JsZp25Tfj46gjUUXoqXR9HscEHgb
         OjCTd5cPaFFKU4XdtyUnmZy9DE9jt+Nv39YLHa938wQdAHO6p02STOZ/oCWsvM+WVLfT
         H1X/1b/HjS8lb5LePYolM1KEylf5Srb1xC0NmxSuo6tVbjU508nieuoi1tkIlzJiV2+U
         PL1hT7OV6diaKNxJjqJhW4gB7l64RcDg7w/8ycl7n9NmAtyd7Fy4LKW7BoWt8KoB0IV6
         LvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679365; x=1753284165;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4vl3Ek2bHdxNr4E5QFSQW0xOn72vkMZt86TovXCUIE=;
        b=n/IIeH8jF6kdZegBJLVd7syTbpUTtYKz0StQr6Puawlo/iPjaVXaa4l6OELRv2bWJM
         AnvlTUfki4x2XzlAYz0oaERuW/gnJOOQnXd0PZz1tLrK902xDvOHuSeQroB6SjSHaWPC
         ONAF86Ihj7hg+w1xYw6xyCf0rmAXGhltBaSzuLwx69buGwEeZgnyVl7lEe5+9e5M9HbM
         UQGBTgtujrjajQV398/FjCwFExfVBfVPMSOT0FlsXV6HyNC80HXHOjoUzYkSPdoza54I
         JLiD67kQSg7kaanythG1Ndkkj19XRYBtSPC7eNgWrOcXDf3ixH5BFPEalfsD86IKwBHn
         YExg==
X-Forwarded-Encrypted: i=1; AJvYcCWiEqloha0E4jVxeMuEeNt4T65kF4Pl+YiWKe81ExDxrpoh+CVSveehl8IuIhjFuGPI852oSoUNItkHdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjia1/RkxbzkCKItEnjqGhx1oZ+9hC0I+Yz9fyfpG96qzFcsEi
	F0SXW+l1KSJr/pJVyvUdXucwZaKZR8chAj+XmLkxNmyeN+2156p1yREz3FWLzPEzqt4=
X-Gm-Gg: ASbGncuNL1jL6TUuYdehEPnnRLpOOOxR9aQAnA3sJXWMqk0mv++rgO0es+ZBV1kLodg
	p0/lFzbFVHN/UROa/BCe6ZxAUsffu5DvRfIgeiDuEwQ326hbsL+ycIZskMuOyPkNpT4QuxhJaOj
	27FIchHyyTaxxi/mOzNFYTWwZJenI7z392BkXZgRjFYzHjXqQdUQcF2IlG5W4r382wOAiyWfV8A
	3QIJ8q0gy1Dm7GkfUtVDS6xK56gJY1XFZ7clKlWeK5Cfxm7r03FAKcqKOUKKc8nJi7/9LP31e+D
	aIsu+uYEutZfrroxomPLMDUIUI1PLF9FOU5t+AiTMRvGaBN3ew6Hf4be3qtTN8cynfXyjdgPisC
	/X9ANT3hmI4BYAqWgPT6X
X-Google-Smtp-Source: AGHT+IEUK5YxYWi+V5YGljb21gJhlrrSTSaF6hPULhP4e3D+hleSH74OxqsThIvkIQTiAsvoJfkRVQ==
X-Received: by 2002:a17:903:290b:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23e2b44525emr13611865ad.1.1752679365284;
        Wed, 16 Jul 2025 08:22:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de43227acsm129073585ad.124.2025.07.16.08.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:22:44 -0700 (PDT)
Date: Wed, 16 Jul 2025 08:22:44 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jul 2025 08:22:15 PDT (-0700)
Subject: Re: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a race condition
In-Reply-To: <20250709124536.4ce3a90b@batman.local.home>
CC: alexghiti@rivosinc.com, mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  rabenda.cn@gmail.com, wangruikang@iscas.ac.cn, ziyao@disroot.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rostedt@goodmis.org
Message-ID: <mhng-E799444F-E3F5-4100-B236-45026970E1A5@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082246_244459_A5220A04 
X-CRM114-Status: GOOD (  16.20  )
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

On Wed, 09 Jul 2025 09:45:36 PDT (-0700), rostedt@goodmis.org wrote:
> On Wed, 09 Jul 2025 07:12:47 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>> >  #ifdef CONFIG_DYNAMIC_FTRACE
>> > +void ftrace_arch_code_modify_prepare(void)
>> > +{
>> > +	mutex_lock(&text_mutex);
>> > +}
>> > +
>> > +void ftrace_arch_code_modify_post_process(void)
>> > +{
>> > +	mutex_unlock(&text_mutex);
>> > +}
>>
>> IIRC there's a reason we don't do it this way, we had (or had tried to)
>> have it before.  It's been a while, though, and I'm just having some a
>> coffee so may I'm just wrong...
>
> Yes, because it caused issues with stop machine[1], but if you are no
> longer using stop machine, this should be what you should do now.
>
> [1] https://lore.kernel.org/all/20220310045454.672097-1-changbin.du@gmail.com/

Thanks.  The v2 staged for the tester, should show up on fixes soon.

>
> -- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
