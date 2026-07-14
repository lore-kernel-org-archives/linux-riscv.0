Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CD6C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HM3A1fqdYP0n3ThBIxwYwTAmN7CmUMzmHbDvK9tv3PE=; b=BBMMbEopRDWyOK
	hoskIvv2ARmTZdOsk/1qWwlH6heUmJ+7df43YRtB5Pwmxe3N/j7ffh963mhNVginqg0KV4Kj8IzGX
	Yld0HxqViLm8Ad0jf3pxE95vl2cqOUEOeaBpWIDpygWywSmlv7wBtYfDYoHkxJALODqkPEyyeEa/4
	WWrXzwleFcj0j+mBXytjTCp36XUiqhvoP6cYKL94z1+OLlby5EHlgjoz4o+vFkWcDVFnzCVdpPPWz
	jrsw751q4jlr52SQT0qqhoojLWzeoBb9T6atIP6BQJgiYj9SkdMzTPwLYcKLP+jHaLoUZmtW294T7
	NycQKCAy6j6iyHgnn6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcL8-0000000BxQr-2MI2;
	Tue, 14 Jul 2026 12:34:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcL6-0000000BxPC-2rc2
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:34:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f365afc5aso1350560f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032459; x=1784637259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=gfUlMiYg9Sl0ErZuZeFiSBhkUhH5MFb+SZ5RggYePukR0yH/G+ap2xlGYJEb4diDXP
         OetIWyKBvFS3tROJ2JYk9BJJyof/Hjd/jTGZ0uJyOa5jr4nolKBpSD9h+HSauRS7knoj
         RwU5Jkhu65ygDJb5VrgN/wRo29qk09xzJTAhrz+5P2DRgBUErZjQilRbebkEUEVF0hPQ
         Ed88ktfEqlJ22Jpfu356Buw7I4T+hIngSlLeE5vnHDxO1bKFFJzp/fwSOdomONmUlgbf
         TzUz+4z7B0CBI7Qyt6nXCQXmuBzWzI6bwpYCXqN8t2sP9beiOpH7auWxxP4v16JCdUbb
         ++mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032459; x=1784637259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=ThVcymIXSOPc6DPOcKUJuah0kBsle2KBeRVcfVSbx6N+Y1xlZJQOxopZ0RFlpXRbCj
         cHpFw8Ff3DwilrTZipu/5uDsgVO4rddoi3rW6FvFyuZJJpWqrGT9VtosaFXA4ugiB271
         9GFNgMlF6KpLGvB/7u+xc9Ah22CCix+zRMXxd0SL2VXZMa9D6QY1/sx7Znqv3P14W9vo
         9V/b5EEm55U8CB0f4hE4m+eNpZWquVKAD6pRvJR+cdS7nFDALOvLC8LWH/kecq/ojoFK
         fTU90vKMDrc7jRlFNXl59sG7fL8A+lrXa4cKiybJowUMhb6XwpTc7qRs+Q/AasCu5I2g
         5woQ==
X-Forwarded-Encrypted: i=1; AHgh+RqL5PjqN9QLkZDeu6YycsmTvQ6bTQr+nwXqYVVNBDU9qlUcFcU502hNPi/TacZCV0ncfMXZUxsf2YK1rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWHcJ3oTlUv6MXEJUc5i5Av+Qq9njKjKx6uBycpGCPIlV67k3f
	SNdL6kIz8Fm8U02WoB4giZiHh1WNjpRACYf2RgefUtac6c4kaHiiaxZv
X-Gm-Gg: AfdE7ckWpHZKcg5mzytxtAQXxUW/YOf+cw+PmGMkoP7W3PXN8AjK4BUidoyxBLCIAg2
	2PZfXDECnHFQdZP3R5AqLeKtXSHvH46xpAqly9RVKKkFunlImtKpRwtYkx8AE3vWmgj7cI6WkAz
	9oZxLBPPrTb+D4+xjyXizaC9WGGLiXLlWYxL/1S7TlIWKK2EmLCiZvUAZ0EFdr3yfbxIT87ApAc
	6zBHHNCG8SAGE8o69GHRMZB8HnjePplHFe1bNWaK3QA2E3YOGGrlQvvoZj03g6ozWXcjUSktI1i
	pCRH+wcZvRdkyDFAGGI0QYQJ+UB0Dk8NkjUiLqR9DVo6RTCe3RWVqdwc+AC4jurrez0kFTZ4Mgw
	iPzU5VUEa123rn8ZbE6J7Av5tmfazfkpzVT0DYCvh0s42pE/c0W+qaounUTp5Boex9qHdEsIrU3
	3BiBMZDkRIlXPDafULj/zYy8DA5s9a9Pe8QV9f4NLsCkpQpoxktVM0/uB3wgzz
X-Received: by 2002:a05:6000:4903:b0:47e:9d58:3b4e with SMTP id ffacd0b85a97d-47f4887f947mr2511343f8f.24.1784032458400;
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm8103524f8f.29.2026.07.14.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 david@kernel.org, linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714133415.78e25654@pumpkin>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053420_782164_90FC2773 
X-CRM114-Status: UNSURE (   8.57  )
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

On Mon, 13 Jul 2026 14:55:41 +0100
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

If you use a two element structure the compiler/ABI might be able to
return that from a function in two registers.
That might make the entire mess more readable ...

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
