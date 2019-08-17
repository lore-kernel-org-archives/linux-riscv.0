Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F425C3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 04:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E0B2173B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 04:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJIQI4VS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X4lTv/Yq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E0B2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opM1Nw5BYBK+lE+nMhfNkbbPxSKgeSIOyMPdvyWU70g=; b=TJIQI4VS+SWbP0
	S00NXn771wQBi/mG/9lqSqz+1E1U6mQcyYxu2UUKvt++IrLv2OWXj43ghHJD6aCoQX1wnSytUU9nv
	BKqz+mxRprhuOx0PRyPUUsKSiUV4Hc8ArfAbivLOn+RqWbkotBGTWiUoUbdMYUa0LxAgwa/gl/cBR
	2QVYG0855CY6g/IYjT13ohfSPaGx/19pLTlA7Q1SP5FKPzzSgQNjuH0dY0mi2c4oZ1uKtdCTvd3aG
	ce/xQ/+YnQEdAmktefuqkCRjBNsP/jDmEIwY5FBF7kLbZ+e53c8noMffU9eZ3tJkNoaV5oCMr7mkG
	qqt+5rUr/sOcBG580WPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyqUW-0005IJ-4g; Sat, 17 Aug 2019 04:39:00 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyqUT-0005Hc-3Q
 for linux-riscv@lists.infradead.org; Sat, 17 Aug 2019 04:38:58 +0000
Received: by mail-io1-xd42.google.com with SMTP id l7so10373137ioj.6
 for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2019 21:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=GtQCwZ2X3Dci9EQCWwa185nLCtMLhK/fJw/6g7BdD+w=;
 b=X4lTv/YqVm9nOz9kEUBgZsT4AKBufywPYgaDkRVxEoudsf1f+4NUMArTksa2fqaxvf
 gk5ymABGfU2wu69753L7SvTw1ffiZ9CQrQZZ6OvB6FT/El3qGVUjqgQhmEt6qU5Ow/lI
 2ykxgHOiN2tvVYnvxUdP0+wUrxBXoRT+4/OyT0VsxsKz7IPiF8U5Xy1dAHKPV5gtH10n
 pqljDzRCGrAga9Tda150byVBoamxRAz4GYwTD1YF7JhCW6VugRPm+YBLnEF5hWEd9yJO
 aELgJdCNJjimfJBJoqXpTfRNGrX91gBe0UCv05t5PpDjUeo07NvXqqFtHHxJcIbCVT14
 QvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=GtQCwZ2X3Dci9EQCWwa185nLCtMLhK/fJw/6g7BdD+w=;
 b=N7F5XVoK4WtFbioiEIOS8MQt+VLY6OHd6ivW3yUrl+3yO48CElOs6o5RE5sHl1sy0N
 mimdss3RRh52BkJQeEIEhj2D4foZiThOY7EIRcbLa9UaplaCGEQDNI/TCbc160qZGXzz
 eu8QzfUfb/eBAxdVN71/TibZMz7se+1fVgV8rLw4TtK7USso2pvOPNwhTxvCDa785B8u
 53MW6+U362cuxM0BDyjbDkHlqlpMtz9niMyBKVSeqz7bmZvYelGv06ciBCI5KLXrqOP1
 Ifptb3JqHCVcgzT3EBXZR+/U1blrvGquHXpkTv3PDkYHwe0MAcS8BKpfTgp9G5Z3fG76
 KuKg==
X-Gm-Message-State: APjAAAUeREZLA6z/y+Q9u18p/oOcqjhR0x0Hj7kY/FMIo7MNiI+Adcu1
 exkrz9nGGV934VlH/QwIDN9Amw==
X-Google-Smtp-Source: APXvYqyemrGz5/yyrhPBXlViihIGtYKX2Y4D4mb8FE5EQ/KLgkxbJNTFXm1Afkdt0tLEFLrOMKEoAQ==
X-Received: by 2002:a5e:990a:: with SMTP id t10mr14098316ioj.182.1566016735927; 
 Fri, 16 Aug 2019 21:38:55 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 s4sm14278009iop.25.2019.08.16.21.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 21:38:55 -0700 (PDT)
Date: Fri, 16 Aug 2019 21:38:54 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [PATCH -rcu/dev] Please squash: fixup! rcu/tree: Add basic
 support for kfree_rcu() batching
In-Reply-To: <20190817042211.137149-1-joel@joelfernandes.org>
Message-ID: <alpine.DEB.2.21.9999.1908162131490.18249@viisi.sifive.com>
References: <20190817042211.137149-1-joel@joelfernandes.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_213857_158576_0A4C6D34 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, rcu@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 17 Aug 2019, Joel Fernandes (Google) wrote:

> xchg() on a bool is causing issues on riscv and arm32.

Indeed, it seems best not to use xchg() on any type that's not 32 bits 
long or that's not the CPU's native word size.  Probably we should update 
the documentation.

> Please squash this into the -rcu dev branch to resolve the issue.
> 
> Please squash this fix.
> 
> Fixes: -rcu dev commit 3cbd3aa7d9c7bdf ("rcu/tree: Add basic support for kfree_rcu() batching")
> 
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

Link: https://lore.kernel.org/lkml/alpine.DEB.2.21.9999.1908161931110.32497@viisi.sifive.com/T/#me9956f66cb611b95d26ae92700e1d901f46e8c59
Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
