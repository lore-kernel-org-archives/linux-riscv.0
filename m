Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AC4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 21:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2ADB61A02
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 21:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2ADB61A02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fppvhmhMIKLlHELhqmxHLv1uVEypAQYDRwjt2Pu1QEk=; b=ENJL18JrvC1AGH
	ZcGHeI/jWaA3vkUv0wIeuUugffncitKxW51y19lXlU8bZSi+cPyxSSzGzYB6OxmwM67vo0O1fKbYL
	/KkGSjBd01e9CsdnSEYFKWrukHgk53cPKYnb5LvhrOdUiPmG8puCP5ldoVlV+zIpRm98f9NmsMZ3J
	9CHnPUGJVSKNkRJQ29ZWly8hvwLV1g6/tI+UfrfdDhAeCVSIA1/dPOi5xR7UtkD+5trZjRUxznNSn
	0MoTs+I5B07Y6Zu1ur76TZhcXfYGioaRNuqPkDOncY10u9nUV1UQmJv/4YrmX39T4p/SJP3cTHEng
	SEv3C2usdSS8aBj8ah0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW3U9-00G1lD-LX; Thu, 30 Sep 2021 21:20:57 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW3U7-00G1kM-5d
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 21:20:56 +0000
Received: by mail-qt1-x834.google.com with SMTP id a13so7083063qtw.10
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
 b=BlxMYaM/OWq2QOg73mmSIuZReJqS9WDVJwYpygBxYlCdpjQvMPkG8JUUJuWMEfe7VW
 Kc4xJOkMskHk8O+awxj6C0zYig/iRuEgT85zngr4j5VHau1O2THU+xT3x/AlUo4/mD7V
 wX52wLkXcsoyoK8aKbnCd70Ljj6pEqXvKGjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
 b=7o17BWyVETyddpB/VQqE1XKWYhQt+163x6kyFVLpwe/WHIhKgNc8hg1o8Vn/edCl6D
 fSbe88EiHgXIh8mTq+KBOVWetAdEEWU6dy4Pv+Lhr1e3eB+jvP8SNlIIRZiC3n6zaN0s
 mrpNUwJs3PIv69gUjB3yDCzomF7w6iJZrzEW3kHcSOlVCrzho6VEPpoMYa2FFnOlfwHa
 Hm1t/6SxpoIX2TDHou4U9SOQ7Z+YqP6doy39hD3o2SEQAkyEjwsiGHI8sg50kqR0rCgi
 tF7wiexSb8sHT6Culp7pnDieU5G/brHAJEoCO+DWeKA86dcbSgDcLnYaKAHXJLm3/0GF
 xduw==
X-Gm-Message-State: AOAM531kPyUtKOf1G5GycnYaXcRcfFgqswpZRsKBjgcabbIkjvhVy/6K
 irOZWImSGsVgxUmd3dw0WInF/A1HQZdiWd1hQ7w=
X-Google-Smtp-Source: ABdhPJypRPsmzb+YJWo9DMey2QrJOrweMYw27JxsJZzt2Vgkn7ft55MSL+vNbilbQMYTDa9y2wptUg==
X-Received: by 2002:ac8:71d4:: with SMTP id i20mr9083363qtp.248.1633036851747; 
 Thu, 30 Sep 2021 14:20:51 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id o5sm879001qkl.50.2021.09.30.14.20.50
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 14:20:50 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 71so16229502ybe.6
 for <linux-riscv@lists.infradead.org>; Thu, 30 Sep 2021 14:20:50 -0700 (PDT)
X-Received: by 2002:a25:df06:: with SMTP id w6mr1562849ybg.459.1633036849801; 
 Thu, 30 Sep 2021 14:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930185031.18648-1-rppt@kernel.org>
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Sep 2021 14:20:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Juergen Gross <jgross@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, 
 kasan-dev <kasan-dev@googlegroups.com>, KVM list <kvm@vger.kernel.org>, 
 alpha <linux-alpha@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-efi <linux-efi@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linux-um <linux-um@lists.infradead.org>, linux-usb@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-sparc <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_142055_240490_4AE5AA5A 
X-CRM114-Status: GOOD (  12.91  )
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

On Thu, Sep 30, 2021 at 11:50 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The first patch is a cleanup of numa_distance allocation in arch_numa I've
> spotted during the conversion.
> The second patch is a fix for Xen memory freeing on some of the error
> paths.

Well, at least patch 2 looks like something that should go into 5.15
and be marked for stable.

Patch 1 looks like a trivial local cleanup, and could go in
immediately. Patch 4 might be in that same category.

The rest look like "next merge window" to me, since they are spread
out and neither bugfixes nor tiny localized cleanups (iow renaming
functions, global resulting search-and-replace things).

So my gut feel is that two (maybe three) of these patches should go in
asap, with three (maybe four) be left for 5.16.

IOW, not trat this as a single series.

Hmm?

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
