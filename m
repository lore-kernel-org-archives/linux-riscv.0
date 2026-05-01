Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB14FF885A
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCB4rmNg5PvCrgLnFpVW5umhIB0e2akozRXBhtOmNbY=; b=oa+8WIVh1JJnOW
	I3Rtv/IeJnXYvBd4adq/dToTJ73BYd4oJxleL7bAqiMepWy5SEM6Cm35wtwyO2NfZuqAEaGnm1Z1D
	13WcklS8qojsFQ2eB5yzyGTJh9ul785seCC51zIKCxL1nBY/tQ1NazWS9gHPT67p43y1+LtYOSTJQ
	Mb2B8VmmHMZpf3yxf0ahBP4GxhdIRjBM0l7oZyg/EBPUGu+c8ceirAr8D1HZ91lW5SnlLUPEllpmO
	WC4q00LVV7n8VqdxP3lCgo7oqJwcPykazUA9au2TrGGoMnur5GWs65PsmnUgpR80Dya8RaV9v6/RM
	zpCGphnTgWoUxmjPX+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIhG9-00000006PmJ-3p5H;
	Fri, 01 May 2026 06:21:57 +0000
Received: from mail-yx1-f51.google.com ([74.125.224.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIhG6-00000006Pm0-22CO
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 06:21:56 +0000
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651cfaa21e6so1485587d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 23:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777616512; cv=none;
        d=google.com; s=arc-20240605;
        b=REXHpYwuecOJZUcx5BlLlf8AxG0t+gIWcO9n2I5ged43jBQlD/t5dsmxwpVKaImu5u
         4GPj+kRUfCwyOnMnhvCcg2gq03ubn+JPFEJhaXvPuioVbap6opwEK2m3HBn/pO7BF/I/
         xQg1RG+8wqoCRal9dGOVyCoowDGNwxLhdwtab4TQHXwucOTONSaQhPbw8ZJZagvj52WA
         2fXTTOzNPwYhSrlILiYsV7iuWuLgSxTKTMr0bdP9W8WgHj/pB5gI5QO1jtuYlP2bXUU8
         ZpWZW4iWdlB209SGmHDs7sP154g+2SqMpyfqrRHdSULEuWKTHpRy3Ky2NpaPh7vN9m3p
         a3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=McN2JSF+RjkLNfm3lpb1zCeyKMceMuOSZT3nslS3xlQ=;
        fh=YO+pDgpCHU5iyrL+/eQjMTIqkd3JfEfRBg80E5GaIiQ=;
        b=KI79F6H5m7SkOQVi7pD3ZGxsRDDvp0nckPFme0eoZ/j83zScUgRoakB46P+gt188ia
         oo36u037SFTFbWX7759rYaxt6V+ewHy6zzvrJrvi0eX8cHTsl7gh1/OCUq3p9nikIXH3
         VbDy9t9cObBujcMuUCFhKGyLq9ZM2Fv09R28dkdWSrEC6TgV4KZ6XKmw8MXrvP2UgT7X
         g6Z1lZQLfVXMWGp9wAIsQbfVEU9heVitIEfZL97Q4559HOHcqW8YeC8N4MTu+iiyyUux
         FSWlRNxcRNAQaoniqg6v2ZWt1zkl5qnErQfIT+MMdrhoy19lpPm0W2G/b7RswjJ6JzGZ
         CP6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777616512; x=1778221312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McN2JSF+RjkLNfm3lpb1zCeyKMceMuOSZT3nslS3xlQ=;
        b=IXmXSusGy1w7rkzyxU5SZ/tXvO5v6/oPH5TmOcfXxf+x0sqYjQPs2sonoNkSSuGnqH
         lP8hVD8JDTmDH+JILjb7Sda11XoqLexYAAz5n+5VRVDZZydCpO/kbo01XF2ZjCaatTe1
         pGfPCqFIsghc0JJQO3uxq2KTzk1fgFU+4KM6w37eOsEojhMnBdenMhvOMGxYIpds4ELL
         cDOJy3GzlL3LQ3jJs9uz/HQBu/YkvRH2XqcyfyDTfJ1hXjWLXlU1+DxQfj9QZUgli+gy
         Izj3fLVfIyc4ra/dgjIxdwQFDdx5pYRC67JXeCkTgDzeVoIsMi7Dx08Rq9IUC/AiBQt9
         6DrA==
X-Forwarded-Encrypted: i=1; AFNElJ8KLsXI/2W9Bh1lKXnhcxEO0IjMASiY79h53NTp9TJxYGlQX2YPziEQgiIuUp6ddAKKCbYgDpPrpO2dzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNS9AQNu96jcdva3KWsFTmGODTEbl6HRapeuplX90cFmwZXBmE
	bpX+bb2y8D69dh+zczEZvob0M1ImhfGhbGiQ72DxqmLy71MHUgLHEiLn3v5CE2SmSzr/bGrITE+
	AiZJ1QNlL97Wq81Zk3xHQXFT8ROdHMKQ=
X-Gm-Gg: AeBDieuaiZkyQ9TSzyOXd+SCPH/dOAJNb9ConMSxC4GdEDmV31wHfOc7widj9wK38oe
	XIUjDjgz4iJY62F/kY/8Av9CwAulPYV515+J0FnyHZCiaw+R50AuYRWZuVMPLtXXfWZt8tGeCM2
	tg9754czerkSnYoVpJjICI78FVJyfR9+e/u7+QZokD6QgxKqz3l0IkozUHR1yizOYPfC7jBxf3l
	5IhXtwU0Xd3uQ0vzND7Galp6qhYZ+O7G4EdpCSTe9yVrp35g5pDKp5tAp4Dvdk6JzYgmvDUiFIz
	mpezHj1AYEGOVyPgvw==
X-Received: by 2002:a05:690e:d04:b0:654:fd9:2e88 with SMTP id
 956f58d0204a3-65c1b0d914amr3988744d50.31.1777616512622; Thu, 30 Apr 2026
 23:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260409091143.1348853-1-mikey@neuling.org> <20260409091143.1348853-3-mikey@neuling.org>
 <78b4e931-9ec7-14b6-1487-906652a65ce8@kernel.org>
In-Reply-To: <78b4e931-9ec7-14b6-1487-906652a65ce8@kernel.org>
From: Michael Neuling <mikey@neuling.org>
Date: Fri, 1 May 2026 16:21:41 +1000
X-Gm-Features: AVHnY4JYhLphUdwRKl2LtaQ0q12Km4gKT0ZxcnEv1WR_FznqHfVpouTKcJV13yY
Message-ID: <CAEjGV6zfw3eC9FumCHeEwt9rJyaV_tYKz-V_Lo3nuRBWV9Ax7A@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: ptrace: Fix register corruption in
 compat_riscv_gpr_set on error
To: Paul Walmsley <pjw@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Guo Ren <guoren@kernel.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Nam Cao <namcao@linutronix.de>, Oleg Nesterov <oleg@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, Raj Vishwanathan4 <rvishwanathan@mips.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_232154_562834_C1B66255 
X-CRM114-Status: UNSURE (   6.64  )
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

> Thanks.  I'm wondering if we have the same issue in
> compat_restore_sigcontext().  Care to add that to your patch if you agree?

Agreed, resending.

Mikey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
