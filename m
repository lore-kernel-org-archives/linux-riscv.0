Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B1BCD11DD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 23:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGubzQo/YKIsz8SqnDV/FqN6zu6sD92MhK6z11IK6kk=; b=P4HyKWb0baqx4R
	qyrr0l+MMOY7mbkfSYX/VweFrmmbm+Tn/wNGwDw/6rxCxAjl7MTwR1yv8V8nuG8IWk9pLjsiRanKH
	GjMOtqoHZP7z62k2GAs9ZMjNgDuaYV/dpBZMyODSSxiCfmTsxq9luYAARqL7lznuiWjCFT9k9WzRu
	4PuM0gRz861Us0eijZ6OZQ0mNdb8oEqlRXw3/HSCEQDfn7PEajw7rA5LTCKxNcL/SSsMeKBhmMMNg
	uu8NaT9EqWXqHEF+TZkga30YRWXRFeUnltjOm1Ira7is1MbFyEWpr2+27ms2NW5fGF5b1yrJjnfiC
	ISQnZ0uXFkCsvfXUkReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpyoJ-0000000G1GU-0mkj;
	Thu, 28 Mar 2024 23:05:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpyoG-0000000G1Eb-0f9A
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 23:05:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-29f8ae4eae5so406860a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1711667122; x=1712271922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3aFzydSyExlB9BmbA34QemVRJ/ZXxJRv4umeOt6fqw=;
        b=aGcPaupzazQUnC6f/bAJsqvaZ5XGyAKIMheW4xHdGlY1mGT2fgg6lBDtgxkaOUXZRV
         jOtLVYUeptqnIYx4BDB5LhgIPQcJDxE8Kw2Vah5Rqt0TaKqyhL04VD1c3UEYUIlHZimu
         tvL5Tpdak9QgDSQWoSKPsm8MMjA9W6tjJhtKkWJG21r8FgmlHDltmnMyy16G5cV8GyUx
         a4EOMDE5/OuJlIGbWIZidiA+vUC9cC1opxnVMLK7yuRtMu8iYFajzMgUZuTP3NFkxbu0
         TjkOJyppRvvjCs7NCR7YWfmb3CHJeqtXeUvoX9h1Qpyfuj0fSB4RDxIRlaK4p+O8BZNW
         ABzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711667122; x=1712271922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3aFzydSyExlB9BmbA34QemVRJ/ZXxJRv4umeOt6fqw=;
        b=lXVcWUqKuWC4ceowPzI9O4/MTEis81rdu71Cbl/0tRYXVfN15h4W2ZNu3+I3HeO/cx
         ViOcr6fRzeBpbUcZqVeoCMf4z5Ukx18DcV+iyo7ROFVp2mca0hBUrSPHj0HAiuzRfm8J
         H/gc+i67FWXqslL3UY5t1OLwgz/rIFmlbhrVW+fgBqOgegw8aWGuPusdmYdhF2oheFUU
         P4aFScwpjN9D877jaq6AccQqiW+Ozf6JYp8nFRHnaYpf+Ev2P5XRIQTj8ng1Qe0G/e+w
         bnDtK+TDCeTptXe/NMqHPdFeartZTE+WI6lFcDfAk62CwLX0LL3hLjr4X7X6MmtjBNSI
         0G6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS2GSQPdRxYgRDUJE1z/Nl8qlqTL8rQc8+ZBO+Gs0sqTnVqYPJfHeydcd0FSei9TUis2QssPmt9Xzfs07KvAffRhHqS4a9AocCVDTqPRb/
X-Gm-Message-State: AOJu0YwzkKF6elaCBHN1W5IVLXwMPR/+6I89AJof/EQ1WM/H/yhfazvw
	DPndMtuXQXkZ9QaxqMu1InBlNck7fCK2IwNfpkZU66kbD/XiQAQRZ5L+1KWeFoA=
X-Google-Smtp-Source: AGHT+IGt0gkc119snKbJARF7UnrFMVXsS7gpTXjZzbZBfCEKd0wr8mr1SMS6Ds7kY42qafqSBM/uug==
X-Received: by 2002:a17:90b:3504:b0:29b:780c:c671 with SMTP id ls4-20020a17090b350400b0029b780cc671mr907698pjb.0.1711667121826;
        Thu, 28 Mar 2024 16:05:21 -0700 (PDT)
Received: from [127.0.0.1] ([50.234.116.5])
        by smtp.gmail.com with ESMTPSA id cx18-20020a17090afd9200b0029d7e7b7b41sm4013902pjb.33.2024.03.28.16.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:05:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Joel Granados <j.granados@samsung.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
 io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
Subject: Re: (subset) [PATCH 0/7] sysctl: Remove sentinel elements from
 misc directories
Message-Id: <171166712004.796545.8747989552701562593.b4-ty@kernel.dk>
Date: Thu, 28 Mar 2024 17:05:20 -0600
MIME-Version: 1.0
X-Mailer: b4 0.12.5-dev-2aabd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_160524_219347_762F01F6 
X-CRM114-Status: GOOD (  10.48  )
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


On Thu, 28 Mar 2024 16:57:47 +0100, Joel Granados wrote:
> What?
> These commits remove the sentinel element (last empty element) from the
> sysctl arrays of all the files under the "mm/", "security/", "ipc/",
> "init/", "io_uring/", "drivers/perf/" and "crypto/" directories that
> register a sysctl array. The inclusion of [4] to mainline allows the
> removal of sentinel elements without behavioral change. This is safe
> because the sysctl registration code (register_sysctl() and friends) use
> the array size in addition to checking for a sentinel [1].
> 
> [...]

Applied, thanks!

[6/7] io_uring: Remove the now superfluous sentinel elements from ctl_table array
      (no commit info)

Best regards,
-- 
Jens Axboe




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
