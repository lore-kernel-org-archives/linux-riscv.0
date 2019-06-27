Return-Path: <SRS0=5nvY=U2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71512C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 22:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4346D208CB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 22:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pZUaKgr5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ScGjlMzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4346D208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fg8d5oChg+o5vzbZGzetJ0qyjeeckMVgNpLRVL4/UT0=; b=pZUaKgr5eYpJ8G
	whiGHpnhuHKZEGHRfJLad88SAv7KAHTc+7uHCJwEIyeucZ6slAjS1tz6TIi1o/oJdLotsmwx3jbc6
	G2mhjgasmiivvgh/WhvwlS2PqmymGZIlO/OEK4G/mkKLqSmY+2WxHyw5ND1PJ4vZapd3hPYd3soo7
	eYWJ69BI3ylIgRthEO4vVkW8RlVankaZYoLcwfXpKe5NBC/x4SfSuF1eYE0JDU5bNTMbrWyLgEQiF
	UxSOJLJFqa1zMNiD021Rl0wCKDH+30fplUTYviCJX6SENek4JwHJ7VCkdvghTwGMQ4/ZwJ2TJP1EU
	3wUl5MBngjGq6JNGVwYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgdFQ-0001Ro-59; Thu, 27 Jun 2019 22:52:08 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgdFN-0001R0-8e
 for linux-riscv@lists.infradead.org; Thu, 27 Jun 2019 22:52:06 +0000
Received: by mail-io1-xd42.google.com with SMTP id u13so8476109iop.0
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2019 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=2ZPt3bSuTMo5TIF/X4TIfYbm6lSZkCvj2hiud9mLUwQ=;
 b=ScGjlMzBrt+gzFTzxnwNjm2sfFfhzC5U1erk+Bo3BkENgE6XZjELr+PwRDTfPBCzsz
 ehaou3iZcGGqLV+7nDFCVisiOfrvGrx4Yz74c9bUoVGn4ccWMyrLn/VMfxE/avPCyF9S
 oG4NwYXF0joM8HyaBNyzNiAczn/mAcHXN/EXNTdmv7C0nJJVhoBUrPbPuJfYZy3StFuQ
 TGv57McCloeyh6l6+6K1mRDcmI/Swb9A96L4nwOiaLV3GEIF8/ELbvhsOCkvUkaugtD5
 UqcS1yV7EAMNJRdo3HNWlVuuxSMn1+ewVVrP2KTKdJllZV2j2AWHtMDxnsXXFRT6rvkn
 +ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=2ZPt3bSuTMo5TIF/X4TIfYbm6lSZkCvj2hiud9mLUwQ=;
 b=XpGmb76tp43RRyQRKpn9YAhMwMxxIuI7/r3AD8ScNh8x6U+zrSr7emI4ymMZznGAv9
 AYStgXj06uMSqTVeNAAsGMnIl/HEa1hJuAhxCEMGCI3xQ6TuXjG6DTMBY3d/Cynghn2S
 MVNXxhiWRq36Nr3LMrVHPRw/p3prNtna0TIEdE9/Z2sR8o12EOMQi7QP2wjKN2uzStEU
 zOtBLfFihGeKqz6s9hUfFyJwTlHRP2LQamjPyWTIbBq8WWNePcgxrO1EG5wUh4wBBUFz
 ylAXgURQiXjtN0Cfa0WS8j/ZOvt18KikKEj+oLakjNM5GUQnor2omhOLhLIPPCDiqFsu
 Nn0w==
X-Gm-Message-State: APjAAAXIZ8PgN1BYjqJPdRS8O7GFtW7xo/YBdIHSHS4Pc2XbC24sUecU
 V+oP7wugP6RSFCFDOijoLRuNbw==
X-Google-Smtp-Source: APXvYqwxBh4uhyqa5sBroUGYfeGOI31tYES7uPcBuVkWMyy5wkS0Gpzh6UrXExHg2bHhvrz6oqjvQQ==
X-Received: by 2002:a5d:9f4a:: with SMTP id u10mr5618627iot.243.1561675924177; 
 Thu, 27 Jun 2019 15:52:04 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 r139sm1200959iod.61.2019.06.27.15.52.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 15:52:03 -0700 (PDT)
Date: Thu, 27 Jun 2019 15:52:03 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] riscv: Remove gate area stubs
In-Reply-To: <d7f5a3b26eb4f7a41a24baf89ad70b3f37894a6e.1561610736.git.luto@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1906271549160.13860@viisi.sifive.com>
References: <d7f5a3b26eb4f7a41a24baf89ad70b3f37894a6e.1561610736.git.luto@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_155205_324520_D62C2D86 
X-CRM114-Status: UNSURE (   5.60  )
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
Cc: Florian Weimer <fweimer@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, hch@infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Jun 2019, Andy Lutomirski wrote:

> Since commit a6c19dfe3994 ("arm64,ia64,ppc,s390,sh,tile,um,x86,mm:
> remove default gate area"), which predates riscv's inclusion in
> Linux by almost three years, the default behavior wrt the gate area
> is sane.  Remove riscv's gate area stubs.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Andy Lutomirski <luto@kernel.org>

Thanks, queued for v5.3 with Christoph's Reviewed-by:.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
