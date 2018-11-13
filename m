Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D22BC07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1A12243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcQ2QzD2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dSw61gOj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1A12243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:
	Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ursL7xgdXVCKD9LwDjI4yG5ay5F8DxY45SkbP4ohMsc=; b=KcQ2QzD2XpJ1A5
	wquuGMl7d84MBwxru1YPD3CFlrIjdblJp2TVff18FdqrsfVBUVoStGtIpdoy+NX8u3pBTt6e7I4tO
	VYpLikG5r7WPYyqU6cYtQkKEC2mTkeeEth6GzTfUlCZ1VY1TxJrQNCPmbPLR3Cl2p0tRNzjD0Qrgy
	w9RaZLza6/3OXQYaZwAOrMOOBiEj+UdNGhBTsf4MGuIwFoAeLjlHFFdgqDjPDz/buSwTdNSxgy1dI
	lQ/vYB3+609BzPz3HvJoINbwQ9wqFBvUkEv6A/W8SNWMwTzakBtRTax04GbgoySYAQt1vt13q/Cwl
	y+9qPhYKH+AQ6o0TwDUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3R-0005rc-St; Tue, 13 Nov 2018 02:03:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3P-0005or-QR
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:03:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id v9-v6so5215433pff.2
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:cc:from:to;
 bh=1fAHEY+0fxnM7FTjRqYpC/P9+fOazoZhOKZ35CFExHQ=;
 b=dSw61gOj7P1Wa9xWm7CdQW/kMV/8+6cd7yVtQKMHw+ryp/cgVC5BrBmihFAdYa6toB
 7cJwSWFPdRkOKJ+rkqmQp27h1uZ0D0fIRsoWfVByN9C60wXKONwjucgfZqkPB9LTRTwq
 TK7sNdTa8R72VWPYl9yocjOGyflct4iauOR6iil+SOKIlJB7BHCHMsS/EO9yztE3YrrX
 aUPTRH+9p5IeK062AheFedAkI8nHmv9Q1l//YMXIv/+R6ic12kIuetgqOvpHtoelbDcI
 e3xTDsO3nvWoHSEHwL8N+WKnI9Em/J2vPwlEQ5xwGmNyIjtHJH9LjNPg2xedHe5nQRdA
 JUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:cc:from:to;
 bh=1fAHEY+0fxnM7FTjRqYpC/P9+fOazoZhOKZ35CFExHQ=;
 b=kEgBW2G51qoUH53xIsHmJaCRnbDqpEVDq/P7xXvUHg7lrfsTN8G5u7hQ7fbFsXYSHl
 I9EhxoPOGdeE1N/+Z6fa/OmcxMYCL8Xj/RRR6uTa7h3A/jp8L+xszPg3TzhqFbdYbcSu
 QnWgIBXDNfyg7IdDQ1A+5E+73Zkpo1brI6r4U9veLvu9hQLWechAg1Rka83X9cTHJBmi
 RJ3nkm3j46EZ9y9BM6NKA+ziGEC6AT5cI5/xLs4f4FuIC7xeOKkvh42hPiEmy+SiBm0s
 HEoYlEf+GfccikOeR46E2sqstGyf4HBb/IKd6Q/8dUCCm3a0nyebizQb4GkvbEBLBtE+
 miJw==
X-Gm-Message-State: AGRZ1gLCFlE3+zB5RBiyQVclcttyFXParwjItRuikMnL8/HmAraUa09A
 waJF5pChUu7MEDfHm9B/af8s+Q==
X-Google-Smtp-Source: AJdET5eYXjkt4E9EC7AQl8EyZIP90RUidSQ0lhYRPfz4K2bSw/XWIdRu4scBgiU3lkBNkNfOmEXCcA==
X-Received: by 2002:a62:6547:: with SMTP id
 z68-v6mr3134744pfb.169.1542074616542; 
 Mon, 12 Nov 2018 18:03:36 -0800 (PST)
Received: from localhost ([216.9.110.11])
 by smtp.gmail.com with ESMTPSA id t4-v6sm18744623pfh.21.2018.11.12.18.03.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:35 -0800 (PST)
Subject: Re-run features-refresh.sh
Date: Mon, 12 Nov 2018 18:01:06 -0800
Message-Id: <20181113020113.29640-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180347_888299_75B4F6B1 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 yamada.masahiro@socionext.com, jhogan@kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 jglisse@redhat.com, linux-doc@vger.kernel.org, dhowells@redhat.com,
 jcmvbkbc@gmail.com, rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com,
 ren_guo@c-sky.com, david.abdurachmanov@gmail.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113020106.ywkZz43_pw_pHRhPzrN_EedHXc0-h9HeV20rqUumF4A@z>

I didn't even know this existed until David submitted a patch set that
included updates to the documentation as a result of some features he
added to RISC-V.  It looks like there may be a handful of other people
who don't know this exists either, so I figured I'd just mail out a
patch set containing all the updates split out as well as I can.

This smells like something that sholud be automatic, so if I'm jumping
the gun here then feel free to drop this.  If nobody says anything then
I guess I'll submit this as a separate PR to Linus from my personal
tree, as it's not really a RISC-V thing but it seems like it's worth
having docs that match the code where it's trivial -- I assume that's
what this does, I didn't actually read anything but the diff because I
never trust documentation to be up to date...

I feel compelled to say something like "maybe this should be part of
checkpatch?", but I'm definately not looking to learn perl :)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
