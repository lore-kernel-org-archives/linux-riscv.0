Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC5C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWJBu0/yV41euSxmQ8Hx2jGihovNmrW1muGONtEE51w=; b=bbyjTza9bg+Asm
	klEy9b5uZxPMsHvu0UjABvc4OtykoPtK+rChIaQo7V9RWxhcgv/WuyZy5je1kP4j1l9JAdsIDlmY6
	wtE5BOzqc6DHqOFOVT9mnKIlTXahSbgM0KuJj8ESFa4zoAx9Vss32n34vQr2c1EvUqSNviXA0fnwN
	K/ihulni2YedOgjD27bMXSMFIm/gABNSyYgwGTw+ZSGuR3pPsdhsNyNwGO9Gojj9qZOJV1QQS2V0Y
	lSWI2XpbJO/UtGZRoOlo+CaQMiHQw5Uxj6RZjUcaAba6xhiIjX2ZCM43Zlp9E80NJvX6JPlyPxkjH
	5bL+NKf4D8E3faVZx4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOr2-00000008zoM-43Ea;
	Mon, 15 Apr 2024 16:06:48 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOqv-00000008zjy-3lnE
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 16:06:47 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso2059632a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713197200; x=1713802000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9YkT2PBxlsTiQpc9k80Xb2w2qGzzlQLFXvx15ENFSo=;
        b=Y0orKxxosNBMSkxwxxI5RPcBnuxSyQcBP3Vje4e+Iq1460/TQPYPjTBkHOMWWGRjAO
         mcY8qEoHHt3j+4IAkH81OsNnJgX4gbIeefrD7RIuwpxpOly8djUkxIK8tgeuMS6mOZph
         de1kK5H3enJaQXOjkdyOZsQpXvxtPo82gA+38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197200; x=1713802000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9YkT2PBxlsTiQpc9k80Xb2w2qGzzlQLFXvx15ENFSo=;
        b=fwCgiBpNYM527cYRvXDNTrzkbI6TTDFyzczhBUqp5RVWtQx1zgRED13Ronx7Y3XihF
         2r4qgadmplFM/uHkCf/NEacc83xC/CDLER1U3KxOJdbppyXHSsWQtJXLC08chW6du1yH
         ePryW0qkFP8ggwW/dVY0kRKRC24C/uLoWFWvlKBryGtCB/me4X5Hhx0L4frlgFl5XN15
         7SHuVXaaQdVp2eJqGRUQH6d65kHqUqR584cZHMfw/EvPs2oryMqZdTgDNGKWbfWHyl2d
         pJ3bAp/wBkx5F57rWQRO3SFfU2YnW+W+AxuNan/8ditS5Er1HbIGQMooOab5dMgST5O6
         rBCA==
X-Forwarded-Encrypted: i=1; AJvYcCW8YAD+ITV3U/ilM0y/tJ6kmPKuRWI48TANuL1/RJ1aIKqV2LCn000PXBKbnOAfoLoYuX7uxU3toOAWpTnb5SdR8zrQVCya1DJyCo8Ya1m3
X-Gm-Message-State: AOJu0YwIfSfzRf83Nne9pKKI3IdfhfWiaT0g16XSeZMCZy1RH2jbE3HB
	48Etdf5mJP0IuVEvwTg0efIOBWSX2rIiCLYz3Ka13Ya68USraZS1omcWJy0eFA==
X-Google-Smtp-Source: AGHT+IEOd/x1N/CPtx25Nf+PUqf1rfZqa2mTy1XxaxcS7HXEzP+ucQDv/NhrafY/fDlqqKtbbV3LWA==
X-Received: by 2002:a17:90b:3d3:b0:2a5:ba9d:a06b with SMTP id go19-20020a17090b03d300b002a5ba9da06bmr10113697pjb.5.1713197200332;
        Mon, 15 Apr 2024 09:06:40 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090a49c600b002a46b925e99sm8796108pjm.18.2024.04.15.09.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:06:39 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:06:39 -0700
From: Kees Cook <keescook@chromium.org>
To: j.granados@samsung.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	io-uring@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] security: Remove the now superfluous sentinel
 element from ctl_table array
Message-ID: <202404150906.C37D8D9DA1@keescook>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_090641_990269_CF2B93BE 
X-CRM114-Status: GOOD (  13.11  )
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

On Thu, Mar 28, 2024 at 04:57:49PM +0100, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which will
> reduce the overall build time size of the kernel and run time memory
> bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove the sentinel from all files under security/ that register a
> sysctl table.
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>

Acked-by: Kees Cook <keescook@chromium.org> # loadpin & yama

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
