Return-Path: <SRS0=3PXF=X5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833F1C4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 18:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEC62084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 18:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uc5lElZM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VwHl/+4f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEC62084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQXL2Amg2QqPXeU89xpEs6bZ21UaR26BQ2XKIXwI+X4=; b=Uc5lElZMVjkty4
	T5CCW9stuAq/FlI34IKkeoyDZdj3cKXuiPRx66CqtEkrc1mOycd56m8uZOD3iGijCAJcp8sLO+ufA
	dbxlgpuhQt3pKsrBJtlNLgmL5EdJFWZQ++smIHGfP9qDBOBj4MxU5OCC/Jtm3hI+KC9cpXKFpZDih
	p/Vnc0xbIA9qHXTJV8Iwhr0EYHT0AR0qtp7DvHFz89I4Buyu1ZemOVImhnfEC6Je3f/EI7RMNqCOl
	gQgz9AqjMAEB4fHMfatK+akHjcOUrJWzN3eVqWz1646jqx6tEWgEsMmMoyYe2WYSjXy9MQVieZufc
	anr7uWCDC5dLEys9tKQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGSHn-0001ZB-0F; Fri, 04 Oct 2019 18:26:39 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGSHl-0001Ys-1q
 for linux-riscv@lists.infradead.org; Fri, 04 Oct 2019 18:26:38 +0000
Received: by mail-io1-xd43.google.com with SMTP id n197so15541310iod.9
 for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2019 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=t8xd02zwYHFR1ug6Lij1NLvXJ514TyN1QMbUlSxJFp0=;
 b=VwHl/+4fKaaoT18gaA2dUh9WuS55xSFNwQIk7B6CLpOS0MlU/jrzqwld7gUOK+i+0V
 HBgZMsMLNgy6AooThDGrQ6+Kj3qP89muwCvmBepqtwruQwi38NqihJ0a6BNfbmo3zS4I
 q77DTbCddQ5FaiPNELBaw3+MWJTTiWmZLObKL/0kvwcnvD6nBamAigdfsUqCW5C6d0DM
 HpDjfoACTEgMWNLe0drc1TQ68Ov+HVBBkdNks2nPqY9GTFGdwJYROmso6i6SPUVIrFUP
 6W21rrj49NcOiYjVseux4Y4HwXDYTPCUmP2k2ipY/kU93RXkj64OxkXzyaJWOGeJoql9
 z/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=t8xd02zwYHFR1ug6Lij1NLvXJ514TyN1QMbUlSxJFp0=;
 b=h0EBeJpvHwZlj62fdZa1rPk2atq9S/P16rtZ0eT7ic6LGJUZMF4pV3ehzx8jIjXhVx
 MSV40FAb/KL9rQlMcK3Fdvn7EWCNbfhcn9i70Co/Ifmb8nOaTFC161j7Lng7vV6sR+5/
 Z6GUabpG9uhUwZbZ8F+5VBNg+Xa0AvxX9WZVSkYw6KWORwDuYZdHVxHszZdirCgVU+Lv
 f9hHRPVN627QTCXUkG/+3gi6qexO67ng7PISGGzKXAgu73mkwqASakJmcK8o7qAP8H2q
 kpMvL56UtgVqjFuhE16unwkAIm2n3kGRzlRKWQVjG68hIl2eFDNrAk9rPJAMM4yJAUvl
 GbZw==
X-Gm-Message-State: APjAAAWsNmLOy9xLmGD7eUyVzczK0hU6XVyt8Un9fq3YtJxraUCp4d7p
 AK0/tU3kwEmcD16xNqJ2a5o33A==
X-Google-Smtp-Source: APXvYqyzR0J5thuev/aaZSAW6LUCDh4I7Z/+jk8Q170nxQE+KqajfQzX0PhTAamMU6fO0fFmqLEmeA==
X-Received: by 2002:a92:4050:: with SMTP id n77mr16315409ila.219.1570213596150; 
 Fri, 04 Oct 2019 11:26:36 -0700 (PDT)
Received: from localhost (67-0-10-3.albq.qwest.net. [67.0.10.3])
 by smtp.gmail.com with ESMTPSA id 13sm2839063ilz.54.2019.10.04.11.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 11:26:35 -0700 (PDT)
Date: Fri, 4 Oct 2019 11:26:34 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH 2/4] rsicv: avoid sending a SIGTRAP to a user thread
 trapped in WARN()
In-Reply-To: <1569199517-5884-3-git-send-email-vincent.chen@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1910041126220.15827@viisi.sifive.com>
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
 <1569199517-5884-3-git-send-email-vincent.chen@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_112637_097171_2E18F602 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 23 Sep 2019, Vincent Chen wrote:

> On RISC-V, when the kernel runs code on behalf of a user thread, and the
> kernel executes a WARN() or WARN_ON(), the user thread will be sent
> a bogus SIGTRAP.  Fix the RISC-V kernel code to not send a SIGTRAP when
> a WARN()/WARN_ON() is executed.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Thanks, queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
