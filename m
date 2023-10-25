Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0918DC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTEtSUXHuxKsPEAyPz5/8Xh3M71Rz4EDZefcf5p30zM=; b=j9pQvoolZRTo+o
	1y347xJPYceZpk+MjY0GnRxDZT4rWppQ7hRbqCeYmFyKJiUOYQtKDlyLDB3RnlTfFMhZL47vIX6Dc
	q+SbE9J0rp+2jZBnYxbzb24Sa/FD9vFYIJEpvJk5N2qPThya2I+M4zmC8fNHPm9Nx+6IT853y+iql
	pt7DijlNKY+YF1/AYZo7IpSi3ypNhz0bet/ZvCht3KJA/IpuLV4PUZl7gInckypCaiAznTySiAOoZ
	vy7d7nVq6ZEI6Gub9wZSNhA/FsYn82m3I3hQLHc8T1NKsL6GUoMLtyJOubEEtV4+vfIx3TNhC4NSt
	r5H6z366mzhc1AaX+GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcwS-00CIMN-1D;
	Wed, 25 Oct 2023 12:24:56 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcwP-00CIL5-0g;
	Wed, 25 Oct 2023 12:24:54 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b41132c33aso730622b6e.1;
        Wed, 25 Oct 2023 05:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698236689; x=1698841489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqrOjLRs28riw/P20lQEQPNQZ15w1j+cN1KPKpYivnA=;
        b=erYTVNfHd2A4NvN/9ZqOV7D9/wHYlvuiuwKyFMy/oIP1auWC+kqJfW+Fj8aYMj+z2R
         e84GGVW29mY/4DzlUA2pVkZ+YWOvwjCvkAyNWbBG/tDUAg/W4qr+fsbz7cSe4Eo09a8F
         eV8B1EgnMet1m2QjjsOZvwL4b47G8t7iDSRg4ynaItp3xaIBcKs9/uWfHE+kiJAYNaov
         vVPa+TDkYu/r0aPUsEJNhZiGO0i9Ylmci/0Q5qIkYJGB0VmNCIueq4KHlodSOiVWy9HN
         bwPfGwxNw4HbgtWSzO5LfmNB+t4h+8fnTezriGPClUTtXpdLOx3VUBpAMTCDV6BMJl16
         NJ5g==
X-Gm-Message-State: AOJu0YzjYG6BNahPsQKdHlT7UMkNJWCBN24VguHScb1R6HnVH6Xp2rro
	/FdxRIqmxp/YjjK8qB9wBCwaALo21RkXKuuKT0E=
X-Google-Smtp-Source: AGHT+IH0abo2IUeh3MMH/ljYPbwfAcLVEOc9S12Py6b46kJ2D0FQnzYE6dwOuGyQPuXQTVW3E358Eq8mZL3ePrf5tJk=
X-Received: by 2002:a05:6808:2190:b0:3b2:f3c3:3874 with SMTP id
 be16-20020a056808219000b003b2f3c33874mr16080958oib.4.1698236689574; Wed, 25
 Oct 2023 05:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-5-vincent.guittot@linaro.org> <20231025115456.GD31201@noisy.programming.kicks-ass.net>
 <20231025121143.GA28289@noisy.programming.kicks-ass.net>
In-Reply-To: <20231025121143.GA28289@noisy.programming.kicks-ass.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 25 Oct 2023 14:24:38 +0200
Message-ID: <CAJZ5v0hrsC0TPUt8a+1Fqy7RQqsTQpA3K0H2z0twx4Ya6Apa9A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] energy_model: use a fixed reference frequency
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_052453_259245_63E9FB37 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMjUsIDIwMjMgYXQgMjoxMeKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAyNSwgMjAyMyBhdCAwMTo1NDo1
NlBNICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPgo+IEFsc28sIGNhbiB3ZSBwcmV0dHkg
cGxlYXNlIG5vdCBjcm9zcy1wb3N0IHRvIG1vZGVyYXRlZCBsaXN0cywgdGhhdCdzCj4gcnVkZS4K
Pgo+IFJhZmFlbCwgY2FuIHlvdSBwbGVhc2UgbWFyayB0aGlzIGFjcGljYS1kZXZlbCBjcmFwIGFz
IG1vZGVyYXRlZCBpbgo+IE1BSU5UQUlORVJTIHNvIHRoYXQgaXQgY2FuIGJlIGF1dG8tbWFnaWNh
bGx5IGV4Y2x1ZGVkIGZyb20gcmVjZWl2aW5nCj4gbWFpbD8KCkknbSBhY3R1YWxseSBub3Qgc3Vy
ZSB3aHkgaXQgaXMgbW9kZXJhdGVkLiAgSSdsbCBzZWUgaWYgdGhhdCBjYW4gYmUgY2hhbmdlZC4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
