Return-Path: <SRS0=SIOo=WU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439D5C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2019 02:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E856721848
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2019 02:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mMMZBM1b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="K8uOXFGi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E856721848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evaV9bPBTI4+DlMEoVnfngnRaafjOC+MHgwM0fVbxrg=; b=mMMZBM1bYDG1Kw
	vjZFH/iOzqTUCrf+FenMn5nI0Nejwliz8LdPeHlDzZWk8SeuuN51+P2QSXPufULeUmpPsqS+vvUWs
	t0wmxPtAqw9nSBMHzIviLzUtOR1LM1QjEQDHUpfYfe651ZmUuc6qqrDgQjjyk+CP09wXFmzHzfpzN
	730EJDK4CWu1PSSqTyM8oAzJrsB8BTs1VJWqxJbrP8g7vUib7CIhi5UhmafXsIzhxR97LsF7gJ92Q
	Kg5CpfI6EgIh32AvpfFwucP0BVpbx7BlPO9so07TW/TD/j+k4PRQoXBgUoEiXoRikfxCJsqD3eiit
	CaqU47I9tXbvQ5hu83cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1LXx-0006ue-BU; Sat, 24 Aug 2019 02:12:53 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1LXt-0006u1-5v
 for linux-riscv@lists.infradead.org; Sat, 24 Aug 2019 02:12:51 +0000
Received: by mail-pf1-x441.google.com with SMTP id v12so7728026pfn.10
 for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2019 19:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0c5tfxW9T0sPTgy4GO92lU2NgowJCnI0ylQa6hGZSJs=;
 b=K8uOXFGilp6oBlpfOcagQsAr2a890kFdDxu90+Bwnwy1TM7vRzjya9Y8uy2ZgX1WaV
 4vO1FhPoq7YAiN3QQXnJ4lBxl0c7+8ZztsWjBkEsb99iu/ofNAO2sgv6CUd5CfNnFoCK
 EdPIAq0KrFtJllq8Z5uSUlGILQHZ0AphnU3XDnKEBmQQDuTsqUl+JaURdHZyAFX/dEcP
 7y/kzMWKj3hPXIzojWEkxNkEJHSPcl/y7GhQXSlFTBwFKGC387KQgw7aKc+SqjXkAuH9
 rkI0J9c4TvQIu11znISg++soMJvMtwLvWQ7j+RzADhIntYu0bgTN+h/n7jzPF38VGPE3
 cjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0c5tfxW9T0sPTgy4GO92lU2NgowJCnI0ylQa6hGZSJs=;
 b=MdvbG7ffqpzFxXVRCjEniQDqBu6k2M4ZO4vJ7ROgpIxmXipGjg+OFKkSdOdEbK0iNN
 lB6bqU1z2a+r5ekkqNhBQM6Gc8V2naTFQti74+mA84f7mS1K8TH+YfXQ5H9qXa5cw1f4
 YmX69TT7U2EyQ5vIN/FpGU31lk6pPafebIZh6focUU4t/hzRgtjjwX1WyX8sGCLRXN0t
 VQl6i/IISc8iNxR6o8z3K2Ekw+cmVERTBZHwumivKy6cb4nJ1hfDgA6sI5AaTbsxiW/K
 iA3SDGjwFhnUN6CGMMXiGKu4yxdlU+SircgDm1nIQlAAKfBN0IQCrKMlJ1qukLCJ9S+W
 UraA==
X-Gm-Message-State: APjAAAVnhoy2N0KN5s/dYqf6GPeJ8CuCpjjU/iICofXkDJgMcxKZUfkU
 jrFLYYnEoreiUF4t65rBw3DYYg==
X-Google-Smtp-Source: APXvYqydseqCd8Js0RvYeeRbvYtJr8JsPj86P5GpJZKq53yiQcob6PjeZkw1lnzOmp37dOCz1PY5nQ==
X-Received: by 2002:a65:68d9:: with SMTP id k25mr6503622pgt.337.1566612767443; 
 Fri, 23 Aug 2019 19:12:47 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x2sm6513191pja.22.2019.08.23.19.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 19:12:46 -0700 (PDT)
Date: Fri, 23 Aug 2019 19:12:45 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Mao Han <han_mao@c-sky.com>
Subject: Re: [PATCH V3 0/3] riscv: Add perf callchain support
In-Reply-To: <20190819105618.GA6377@vmh-VirtualBox>
Message-ID: <alpine.DEB.2.21.9999.1908231910350.18210@viisi.sifive.com>
References: <cover.1558081981.git.han_mao@c-sky.com>
 <alpine.DEB.2.21.9999.1908161008450.18249@viisi.sifive.com>
 <20190819081758.GA15999@vmh-VirtualBox>
 <20190819105618.GA6377@vmh-VirtualBox>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_191249_255497_6CB1EBF6 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 christian@brauner.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 19 Aug 2019, Mao Han wrote:

> PS: I got some compile error while compiling glibc 2.30 with linux
> v5.3-rc4 header. vfork.S include linux/sched.h(./include/uapi/linux/sched.h)
> which has a struct clone_args inside, added by
> 7f192e3cd316ba58c88dfa26796cf77789dd9872.

Noticed that also.  Probably the sched.h uapi kernel header file needs an 
"#ifndef __ASSEMBLY__" around the struct clone_args...


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
