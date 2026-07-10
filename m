Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEAEC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkuLTP5EtQhasLmkf60Xh22jLXkshMo8qFVYK5RXvDk=; b=ZF4YvTvPwT4RCd
	Romr4u1P4ejjLXK7NByn/gCsQhiVJAMXbHjgfyUVjZX0xzjKdUnfyMOUmE8VkggGVhyI62l7k2IvI
	Q/CQdrVRQldBTIxWIVKU8xp6grjAa4lB4lXUPXCLIC01v5csUVg+eurZ8xmO5lQD9IhEsSNMxBGIx
	syt63p+3P+O+Zb81jwChpYwBYl+ena4UpODwlv1NYqC0oOcYfIuO8KehYtpsEBdjrJcKmmPRp/UmL
	SNMB5fcFLqwCJHwAqfteiWqDS2PHVqX/gUKzgRnxZRvpC666w/txGcwX8GkUEkCF44iqvPeIAhNRl
	mj41AMq1KGAIHEIU1+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62e-00000004Nhc-3rLL;
	Fri, 10 Jul 2026 07:53:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62W-00000004NaR-1FdD
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84861fc51f5so483742b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669971; x=1784274771; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XxVWLkjTDZhg2ZpXoG0uLB6wK5WtCztBheSr28w2OfY=;
        b=mBBanWPge7PAqDJoqrd4pvr18m1iD8ncwbahvVLWxgpsx6FJYLl3CkR8DqxsFkPh1C
         R2COHJQGcQ3gMoMzCyi8Y+cv5+1FfMIJgZpwkgMNdRjcFEpphhjdoovzMQAsWpSqqfkD
         eL2Pk2wa/5BseTjIMwSpvhmrFf0YHdqWHeJb6xVE/aBgVlNBQnO3PI5zX3+JsFoFZrKO
         Qeopd+r1lIx3V6xSt3g9bgHShRvB27UbRveTgySld0628Kl8yPBg4HZjJQzvRuTL+WP0
         k0NAl69U7w7tTJo0bWzLHWo7f8bFyBLIF29qGjZXUCCSExZG0MYlcS+UlZ7SCgchMkgS
         7tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669971; x=1784274771;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxVWLkjTDZhg2ZpXoG0uLB6wK5WtCztBheSr28w2OfY=;
        b=NQxukOb2dC126r5vfnPF2/qexw6mMtaizUOHNRPkANvK2CPgZwN1mW1c4rTU8r3rPP
         6jUC8KXEd3IOJVlILJ/w0KYp44U+DaCFZ/UimqKHK0EdJrENwWQSkDiVYdbrIWHBqOVJ
         F+Rvn1YJ0sHX0DnQiFjBzLV3z0r3MZmGa3oDZ0IXjITerSDovv3Bd5sLVY07DtHbEmpx
         yAHuTk+g0+8SmHvp4nRvKS2jnrlNEJyIvhJWj/idNcDgcus9seFsZJf87WoIgki7+9al
         SIfiWNJGRBW2xKMuU1ChOSJWITONO5ebXxOxAwlbpxn1ENUddmpSkhjcBC8eMnha8epj
         //og==
X-Forwarded-Encrypted: i=1; AHgh+RrOGlHbkM44XkEJ+lCWZgwo1skEAkTcauG3pqMIETEs42nnSCZrUh9ZhbduWSLuyaM2XwINuhz6LRV7Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMNVbHzinqqhnwCMmY+5hR+FAot3ommCwyABM32+/pzkmd4e/Y
	58kJ9PStZNYPy4Pf/vgbGIzZIGMchPCSXfulFn5mq/177pqGvCbfKfDt9i3Wdikr
X-Gm-Gg: AfdE7ckMs4hbsoKNikqzjHY9vU4wUjelzcbInNclmi78at1X82IaBLh4umoi4cVxbg6
	M4OzWORxWWFLlLZrsNlhh9qsr7eIqazCYZsQiAHnC8ftXjEthx8mIBulF6GEHR7LDsLTMv+e/iB
	bpDWWVq04QAx5VmVAzpwWqV0+Dj+HSmNfUtjZ0nmm2tbSH758duGtHNvpOQN0Xf5DoxQ8yj5t1l
	AHyHgR+38gqcYT/wW17YjLQrFmQu9W05H52UqL09JktHrZNVBcOY+XTGcMUgpUCqsvLgXUeV/xK
	WiSwgqeUsOWv/wcvi6VGJattRLlXX9HiHriaDsX9RGhO6LC5Fnd2ZcIGg5sxih1PDVIGGUBzjvL
	6y4vq9KWK1tAn1KVIDinrcf7xSQI/xZYrqaezG6QX9B2HTp0uWvh4POixCEVXDBDNnrNiTe0fdq
	ewSQJyTwtQmLKRZWAotHrxXPHEm8oLI9uA+E7MbEmD
X-Received: by 2002:a05:6a20:d045:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3c0bce1ec2amr13936533637.4.1783669971391;
        Fri, 10 Jul 2026 00:52:51 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:50 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 7/8] asm-generic/runtime-const: Add dummy
 runtime_const_mask_32()
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org
In-Reply-To: <20260630045531.3939-8-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-8-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995931.1208691.16267083905782992990.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=326;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=339QwCmoNdOUhoq07+p5mhlOUQoPA8Y4kjfe9Kj1h/4=;
 b=+du2Hkd0RyMKi/EB9cZncyqJjA+YBHOqCVom2yvmO99t8UG/3SEUftV+TbybYm/IXhHQS2fGb
 d+Eveyk5xyHAx1lucH8A8KAbw7r8Wb+AaVQqOSex2YBgPMjHQHcvXwN
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005252_347494_0659C2BF 
X-CRM114-Status: UNSURE (   5.97  )
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

On Tue, 30 Jun 2026 04:55:30 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Add a dummy runtime_const_mask_32() for all the architectures that do
> not support runtime-const.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
