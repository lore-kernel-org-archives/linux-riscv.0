Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2B3C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HyyG6QRhIMA7EWBOosDAQLrMvUPbBsJ3W8jBVeWT+h0=; b=hG2i0ghFhhn0K16MsYQMjbK2Ul
	7bXK0ahswxipqPvu53hPZBUwF/ZB52lZ4Q8uW9yIwkWpXSZFkByxhBermOy81HVdrMncqgBMvZs44
	7TZUIcCgWkr+MD1nSS0Q6YoRcdPFFEYm84wActBoLjEZXwlTmRjhuLG0kXvpuRia4BGdaJ99qyiQt
	BV4eoJobxcCo9Fsl3xhudfAkUVBL68kFtMzJAneA6FcK7vy8qI7v2KxHIN2ZV9k2wvdXZqO9EfVGF
	3J9LnpaUX/91R2cn2oAkJWA7v+HRHJJYoliJgzyfKGV8uWXto9DDt4Gd99YqpLZR2uV5PZKsqUJfO
	u4yLpSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSDJf-00BlbK-AJ; Thu, 10 Mar 2022 07:34:31 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSDJb-00BlZS-Ih
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 07:34:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id z4so4009279pgh.12
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 23:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/cRXQiSJ5rIWf1RgUsbCqPw2RjGrtPdegUrxegBFwDg=;
 b=drrvyjXC5GTw4mGN3hjmCpR4QqGXIdZSM8NzuvaH9FuH+GTzewAH4wwF4CgXUGxcdJ
 5TnxSaZKkOGH5yGtGUUzB37aeaMs9mvj0uLtZ2ganFOtQa86at1qEmdYMYvzfUDN/GIO
 O4rhe3+a/Z7sFLYsq+h9w3AKpTJ9SpNVv3H1Aw1kwhHo+JG4+LuTXBUBYY0rqWQghPpQ
 bWHTyxzC+O9Np97hHOAC1dk329FWk4V4ijry9Wgxj/8gGRCP8o0laEBybE37BQO+j3Cy
 vajQqKyd7NcfoUaPMrXhgQqD8m5o7M6z4UNC3YyZb4gb4MgpoUSVbZn41VMgICH7+oeN
 rNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/cRXQiSJ5rIWf1RgUsbCqPw2RjGrtPdegUrxegBFwDg=;
 b=bq/T24wUOcwEyXheKVjZfSLx2Qp+bPzZJlVnrFQl1sDjriiVr8UxpDtTxGzEiSaHez
 6+5nnqwKerbIuB3zyzKH3QdopcchKE/dpyTqaEZI3bc0+1uZrFLsa9nTNCYDMyzlIFGo
 93vjtMVTq8pJKGgLYF6tUqSLdf+w7ILHufl4zUQMObCxQ07CMq085DAGHMBQcDrgtpAD
 N9b4occq7iGdaj3HKVjjuSW/pAGKR+Ks9dEAT6vf+h0tUYblFzz7Q9uJunShb9rAC+MR
 iGDoCc8sziWF4fkP3ilHXE1V78mCxaHzQjPop0eYPSqXyMT6YUKXOhvaKo1SvepWUnB2
 L6vg==
X-Gm-Message-State: AOAM530gb22TuQP/12LXoaWtjpNazuFvHtNGYaoU8CAmnCunLpmkUrG4
 6e+YpAVDjWwsDELP5fN3NTGJiY+MJijwoQ==
X-Google-Smtp-Source: ABdhPJxc+q7DDbxs0t4/P+31ptJrnup2lYJR0GZZf7c/akfYD1VQ0loaR35m7vzsGzW58v1D87rQwQ==
X-Received: by 2002:a05:6a00:2444:b0:4f7:73bb:7582 with SMTP id
 d4-20020a056a00244400b004f773bb7582mr2011116pfj.39.1646897666298; 
 Wed, 09 Mar 2022 23:34:26 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 j16-20020a63e750000000b00373598b8cbfsm4482675pgk.74.2022.03.09.23.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 23:34:25 -0800 (PST)
Date: Wed, 09 Mar 2022 23:34:25 -0800 (PST)
X-Google-Original-Date: Wed, 09 Mar 2022 23:21:11 PST (-0800)
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
In-Reply-To: <YimjbmdACoQOk+hj@infradead.org>
CC: michael@michaelkloos.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-08a28047-b563-41f4-b705-f27b88554f2c@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_233427_663011_D8D2C0AB 
X-CRM114-Status: GOOD (  17.33  )
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

On Wed, 09 Mar 2022 23:06:22 PST (-0800), Christoph Hellwig wrote:
> Why?

I have no idea, but this has come up a few times before.

IIRC the original port had a no-M flavor (don't remember if it even made 
it to the original patch submission, but it was around for a bit).  We 
decided to drop this under the theory that nobody would use it: 
essentially, if you can afford the handful of MiB of memory required to 
run Linux then you've probably got a multiplier.

If someone has hardware that lacks M and users care about running Linux 
on that then I'm happy to support it.  I'll still point out the 
silliness of that decision, but if it's too late to change things then 
I'd rather support the hardware.  If it's one of these "fill out every 
possible allowed ISA flavor, even if nobody has one that runs Linux" 
then I don't see a reason to bother -- there's an infinite amount of 
allowable RISC-V implementations, we'll all go crazy chasing them 
around.

FWIW: to a first order, that applies to the no-A stuff as well (though 
that got dropped because the Arm folks pointed out a way to support that 
was way better than ours).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
