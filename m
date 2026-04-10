Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD5F36B91
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 06:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rY0TUnVSgwCG6H7adZlGTYHhdyX+pEuyYHhiid5PhcY=; b=iTchZ6f0L4z+pi
	JmFZ+0A7Gc4c+0AqGs4DOpJyJzIqkpPIFrr6OCNYE5i6iJCN2AMgG+cFl/WZ2GZ3kV2+EAu9QgXNE
	/nc5BnpSZatoOMH0bsnuAK6njPzL7ySvNEMiClWyPw2dGu4/4tloedZkW/tJagUE+yqdU/HRaEXdv
	/VFEBeyNMa0QbjZABP15fOM8InK6D+Hg6de3HJ4H0/ZM+RnLVxFNSA2cCQ5Li+0K8mCdqtYBlEDd3
	+H7XEI9T3dG8KKuh5t98Oqsinj1iXO/oJdg4kwEZdE8DyXsD1LfJCKSZMy6QGFLys2LeMTV+sYG9t
	Xx95VI8QJsVKUUNCp27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5Ha-0000000Bg88-47I1;
	Fri, 10 Apr 2026 06:23:58 +0000
Received: from mail-yx1-f41.google.com ([74.125.224.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5HX-0000000Bg7U-0yjS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 06:23:57 +0000
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-650775f427eso1728527d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 23:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775802232; cv=none;
        d=google.com; s=arc-20240605;
        b=IfUFBvFfjL/rXC0nh9oer9ufLL4P7rJLJqE5XyO68mvScFANFGNgQkKjKjN1G0BHLZ
         ZgY5qONjw4AztqW22rDwYa7pgLysE55qYgVYGqSClG23iCzcICoJyRgh3GVHSjknPjmG
         ObT08tTOYNSUc1VNu+fHVdt/qcYLKAfcF6AoZlVkSXXjzZgs8QASEIITIe1Uye+wGSQg
         Y07FY5+nnGZRlImS7DBVJfO5Vh+A4Fj9OOE4c2OEOSQYNPYH3lW+ryWaC8r0NR4pQbIh
         fvBSpfDD7tVVuok37IVuZkpC9bxmOF/hJ1MGmt1QIZednfzbX8An8xulJWmJ4fvyg284
         otYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=zwN09wqVjgB9wIlq9TUhi+QgHCBBjv5gkABXT08uWvE=;
        fh=cUKHKNebSzrccWgk5FdtF7aUjSwlUDrRry/sd8LvZiM=;
        b=SNKfjH0aSXm/Fb4vtGmfuQkYjp220Drt4elXttFLaR1h0QoKfkU7oXBnnpvjGgJ07b
         GeRn0ymzouQRiioAU2+0u1tD43sHRCRIZrEUEBZwR8TzGYembPZPUCdEZ6VEm3rFtvNq
         ooVoRI6x90Iq6Lg3PFvX1Tz8jnM3u3LeWEV/x7NOjWfsd+YBMRemEzR1TkQ2lFQb9QyW
         t/AFiz7v8j2aRFmAL17KtSng5rWao0PCCGMmElYUzz1tZNB+s1ZVNaSbjJECx/XsoqTx
         rT0Y9R635IqtE5vvCBgdaR1par8Dntu9DCo/F/qBl5tDqxhQOLeoaFu2TdN5t5kUAIVu
         1r8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802232; x=1776407032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwN09wqVjgB9wIlq9TUhi+QgHCBBjv5gkABXT08uWvE=;
        b=i/htL7PyKoSFKEnLpIkHDN+NDwg7rMGLUfSozqXXJAzt3cLtbIbGwzU4eVsrYA/AJr
         OaqKLR8lxV55Yhx0WkjL6UFjWoC3VcFht8YqhoDOsmFFunbW9/yQHTK/bHZjAoH939lH
         FfZz9hCRo33yNVxGWY4TqUU9uFATrk1cI8e9D+rf7I9SJP/oU7waXgnhzB9Z1x23rL/v
         zwdWGbpC9euk5cj0DcKTJ/sGA1b+0CcEDipLeJmuTQi8EZVKUkNQDc3Z6R01cJTeXKms
         NGGiV0JjDwJ7Put0D9l8fZK2J/HTzj9xl6/5GDlydurref0sKgskqEgbR/vv7154X68U
         LXBw==
X-Forwarded-Encrypted: i=1; AJvYcCVoSbr/TPrcB9N+ON0boUP2NOWFq27S2ADXUYUODfvfYTe/zscQg/Y7S2muM0bkF+j57jF6xXdn5OlrEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwuSJwCTULfTE1P1rUPkPAdWTS0/7FHZy+4nfQv3xPldHrULI/
	dY1ck/zZ1BLcfgDqHaWeOb0rikLa4ejSKoYS4jn3JE6aOQlthcTrFqYEdOS4eK/nfXhOu3Rb/I7
	Bj9w4hR0w7NMYKqb9eWLyrSuvThPBwZY=
X-Gm-Gg: AeBDieuxVpv6u60wwKnJ0CvHGOmrip6LZMgp0US/ulMoOoI4ZuLIJtWfaefuy7y5Zfp
	5/xoiuxgYRckkRHQG1TRPASk8q1l+BOL+VmhcuzdwhoPlDiVz/BeOQ5zDwLA6mJ1f66WQIF8ZuK
	ZaY4KD4iGfUUbr1U01XM+tl0XQ7eKOUlcdPro0W15h+7BT2FtUs5C3oHbj8f8fjSUa8bwbcYrnb
	iCrIUI56MFasAfbZFL3zFGjun9yk5Vwj2zFl90WS7v4H/0ELket70DG06p9dD7wvnS7nDKjCxAA
	K82g3Z/El5bJEODzuw==
X-Received: by 2002:a53:b48a:0:b0:650:88fa:f71b with SMTP id
 956f58d0204a3-65198c1838cmr1452707d50.61.1775802231639; Thu, 09 Apr 2026
 23:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260409091143.1348853-1-mikey@neuling.org> <20260409091143.1348853-4-mikey@neuling.org>
 <b3466f28-0d0f-4ff8-8542-e53216cf3667@kernel.org>
In-Reply-To: <b3466f28-0d0f-4ff8-8542-e53216cf3667@kernel.org>
From: Michael Neuling <mikey@neuling.org>
Date: Fri, 10 Apr 2026 16:23:40 +1000
X-Gm-Features: AQROBzB8qNE0o1n8oVc3GTluYNafTonW0yqCjlnyLV-cx2QrkT433PRVuwDuJI4
Message-ID: <CAEjGV6yKKtN3kGeQ+tdz1xy-DDS2FD0C0X4qm-iZ3zq7LEyhHQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: mm: Fix NULL pointer dereference in __set_memory
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
	Guo Ren <guoren@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, Nam Cao <namcao@linutronix.de>, 
	Oleg Nesterov <oleg@redhat.com>, Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Raj Vishwanathan4 <rvishwanathan@mips.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_232355_851752_EE43DD57 
X-CRM114-Status: UNSURE (   8.53  )
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

> >               area = find_vm_area((void *)start);
> > +             if (!area) {
> > +                     ret = -EINVAL;
> > +                     goto unlock;
> > +             }
> >               page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
> >
> >               for (i = page_start; i < page_start + numpages; ++i) {
>
> Which caller would end up calling __set_memory() in such a way?

It wouldn't. You're right on this and the other two. Sorry for the noise.

Mikey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
