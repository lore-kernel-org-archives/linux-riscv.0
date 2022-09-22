Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3613AC6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUM1Q9LrtRNtTuiJDtQSHELIh6PA1gW5SkNj0B80gMM=; b=ew9EliAbX5eLIP
	ls8JkQArKawJt3Vxk0OWOAoFS0BM9W+22tXB/dUJgCWV9VIhTJnQth3JO/DjydD5g4bQHT7JjJoLQ
	pCHeHQ8IQLFXpAyiReXLPep+9YNzlDSH+3rBRDk5M+2ZS/oSGaUakeKh4hNNTnoP0/gsysRFV4G6K
	LwGi1+EQyg7zZYX+fEtHblNeMd2j/kbn0sAAYeHCOBiYHztiJ7DGSZ3NJzS51Q+hFy0Bkviz5rYqx
	Q3Y0touoz6iPezszTfeqcNIiUlKI0zK2CGBa+hOE3w//2TO6cDHSsFoD9kga8Do5pUu6xYn75su3M
	QKmnwAF71qzH+qnUjr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJnY-00F1vd-JH; Thu, 22 Sep 2022 10:51:16 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJnV-00F1uT-M9
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 10:51:14 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id k2so9809273vsk.8
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+8RVBpvMoPFWmhGcL4H8dYuUDziDEsgkdhPy3XBz2I4=;
        b=ALXZwDuV3TsTjfRdY2r0nlIayYwKQkpAssa3cAxmHzh9FzEHyxGQJoM8/rFAa0rjWq
         pjnAg5AUJb2jZRCc0XBK5lc/K3e4n58QS7EfbIApkoV2lHESNKqvd9TaFEzQrfc48vbd
         wlSVh2GkkPC2rmyZsR3UPcfCIYTgN5JVeLlv2RX6V5tIqo6hugIJAd3e1erxwLljHY7j
         5yRf4vMzMttEiQAFCpG1mZeB2WQf8tSaPlgUeLsFIlcm8ALSevfBh+oDCj3FH3/u5xcO
         M/uwg+9E2b8LN1MeN6YJma7VTwCVcZo7L8PggzNdqcKu4py2kew8N3TnAgkeS/8W6ujF
         p//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+8RVBpvMoPFWmhGcL4H8dYuUDziDEsgkdhPy3XBz2I4=;
        b=UQfUdhx53TpmOahYvnKX0+96UlHT6Hz3lLxWj+2EzSiJSpNcsK9tOXYhUs1wGxzfx5
         gXDHK+0CkguUA6cLgAb2Gw7Yu5NFgTWFQDCQuKe6EXftzGUPqbIQmoCrVNCLaD2wfp/i
         bg4jewVoAodPs4J5BfrSFa3FN0T7ze74LeEwDL7uQ5PuJh7R5ev0xLa7Yg0z9eRL098K
         I1LkB157j5kgEC3hEFDYKlVfIJ+1EmivTodR6tYVeKNB78AOkolw3Kks3HZes3Ac2cIv
         GCpk4ZESXl4WyIdIMM6WERQn/2zRuKRaL4ldI7x3x7cGLSmTkxIjuPQvnBjM8NiLvZ2r
         YbgQ==
X-Gm-Message-State: ACrzQf2CBM5CAB3t/nsA9dai8uNSP9ktQOt6ozOkHIoLHM3IP0KqVJCh
	M9u7MZH0bL8ah/Z/I7bi8fw8xcrZSW1LvKHpbM4KlA==
X-Google-Smtp-Source: AMsMyM5ux/GTkwPJINb2jtUbdLbNx0AxJBCoraABepK6fxresVoILEuZIdOMa7gE8zQETeOy6f8ctYKKFt9G9jS7mFw=
X-Received: by 2002:a67:d211:0:b0:398:3cfd:5a34 with SMTP id
 y17-20020a67d211000000b003983cfd5a34mr899669vsi.35.1663843870401; Thu, 22 Sep
 2022 03:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220922083610.235936-1-xu.panda@zte.com.cn> <CABVgOSkjmuWDVwOW5PQRAtDYJGjHjcc_8Gg4JjhiT41Kez1rcw@mail.gmail.com>
 <Yyw24J7YFVtxsnJ7@kroah.com>
In-Reply-To: <Yyw24J7YFVtxsnJ7@kroah.com>
From: David Gow <davidgow@google.com>
Date: Thu, 22 Sep 2022 18:50:59 +0800
Message-ID: <CABVgOSmDn8aVz=LEE6HnLTH8FJ0Civ7gsqejVfhnizFiAWF6jw@mail.gmail.com>
Subject: Re: [PATCH linux-next] kunit: tool: use absolute path for wget
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cgel.zte@gmail.com, Brendan Higgins <brendan.higgins@linux.dev>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Shuah Khan <skhan@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xu Panda <xu.panda@zte.com.cn>, 
	Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_035113_739491_7DEA0CEF 
X-CRM114-Status: GOOD (  17.04  )
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

On Thu, Sep 22, 2022 at 6:20 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 22, 2022 at 06:09:28PM +0800, David Gow wrote:
> > On Thu, Sep 22, 2022 at 4:36 PM <cgel.zte@gmail.com> wrote:
> > >
> > > From: Xu Panda <xu.panda@zte.com.cn>
> > >
> > > Not using absolute path when invoking wget can lead to serious
> > > security issues.
> > >
> > > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > > Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> > > ---
> >
> > This seems mostly okay to me -- we'd be abandoning people who have
> > wget in an unusual location, but I don't think there are many people
> > who want to run KUnit under RISC-V, have wget in a non-standard
> > location, and can't acquire the bios file themselves.
> >
> > So this is:
> > Reviewed-by: David Gow <davidgow@google.com>
>
> Please no, at this point in time, submissions from this gmail "alias"
> are going to have to be rejected from the kernel.
>

Good to know, thanks.

This isn't queued anyway, as I think that getting rid of the code to
download the BIOS (and instead relying on the user's distro to provide
it) is probably a better solution.

Cheers,
-- David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
