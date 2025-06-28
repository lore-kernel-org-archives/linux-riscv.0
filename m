Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0346DC54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6mQ3uIfA3CKQ7pozbFgDduvqa66wa0fuTKf4quCFCQ=; b=c7cjFTeG0v+ryc
	imEYKF1a9UiT9XZOlDumcfVxu58FiiYEIAyozsDWmsDNrm5U3zCBXlex/GZJtEyqEdw/J8v1eVQut
	R8MiRJR5yZjZfZWSc92UiupFsjLvBmlBy90RWog/k7uEBedNs7iDvpx7BGodDKKUgQDm9zJ7W6XgT
	R6klEMaVx+aAsqYjrMOPM+WHm/DsUz+IwbTem6+OrVEutxtu3ojafMinzcZg7/bbU4xFAV5rp35bE
	3u6Ezcwa+tQRI/Q/9l0d0kS0RN0gKhdSHdSKK+yUhW3aSXEkx9ijKXhV9j6h0GA+g9lF2JXDlhP7o
	5UT6e9gv9MAcFYv9t0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVTVq-0000000GiOH-3U37;
	Sat, 28 Jun 2025 11:14:26 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVTVn-0000000GiNw-2fDW
	for linux-riscv@lists.infradead.org;
	Sat, 28 Jun 2025 11:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751109259; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=TRpU/crHQJjkYyYdJiqwyqhIKtVuiXKZNmxFbHlR0lI=;
	b=llVpTygM1dKlce95cN434k3Q6zxTnShMg14g/caUCZQUnQY1jz4O3PczJ9YJ5lmeHZZSiF3oP1E3YlENPxWVgRKWtXQoTDn78JKjX/n47Wefuh3E1E3VSBriHhz+jtXOhGw/chL5p6mY4IIlRu/C3EZ+0fwjnA0a1cps+XhlAeg=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WfjBSB7_1751109237 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 28 Jun 2025 19:14:16 +0800
From: cp0613@linux.alibaba.com
To: yury.norov@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	cp0613@linux.alibaba.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
Date: Sat, 28 Jun 2025 19:13:57 +0800
Message-ID: <20250628111357.1627-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aFWKX4rpuNCDBP67@yury>
References: <aFWKX4rpuNCDBP67@yury>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_041424_457534_46466DE2 
X-CRM114-Status: UNSURE (   8.94  )
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

On Fri, 20 Jun 2025 12:20:47 -0400, yury.norov@gmail.com wrote:

> Can you add a comment about what is happening here? Are you sure it's
> optimized out in case of the 'legacy' alternative?

Thank you for your review. Yes, I referred to the existing variable__fls()
implementation, which should be fine.

> Here you wire ror/rol() to the variable_ror/rol() unconditionally, and
> that breaks compile-time rotation if the parameter is known at compile
> time.
> 
> I believe, generic implementation will allow compiler to handle this
> case better. Can you do a similar thing to what fls() does in the same
> file?

I did consider it, but I did not find any toolchain that provides an
implementation similar to __builtin_ror or __builtin_rol. If there is one,
please help point it out.
In addition, I did not consider it carefully before. If the rotate function
is to be genericized, all archneed to include <asm-generic/bitops/rotate.h>.
I missed this step.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
