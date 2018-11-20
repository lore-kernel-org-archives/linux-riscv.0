Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66DFC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:21:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5A520684
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5yNMNsu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A/p57rAV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ksPQkARn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5A520684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Mime-Version:Message-ID:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y/Ztnplow5r9LAeLk0BTxo/dF+ImtzGuPfBY/bSOBK0=; b=b5yNMNsu77RThi
	PMzX547ITwdqzTQtdnGl/k16cShZhmo8L0VmHvwYsriIDt8L1J5ZEFAl7HSDADFB09dGnVYYMtONV
	BA9C2J3EifbaeLl5jfwK5PRFnFxBFGJOVNjsiAhXZA8V+5I/SqHplYgl+L+HU39TmQPwSAub2oNZx
	vFpZ7O1T9wRJ9Z2ykON6n3NJIxZnlnkqA2H4QuGrDQ7cy/NKDqvaTo3oBiM7lpmJlgNs1q3chI3G1
	du4BSU4f6gC/+BdwxSnxADbLPk0lTT1SZ62iOTrc+4F3ffOJVQ4EBN2vHNalCEjWqWZJclR6ud3sm
	wIhzXzhaPGNQ2ppGh+oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8li-00064u-VS; Tue, 20 Nov 2018 16:20:55 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8iO-0000HX-Gv
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 16:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:From:Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:Subject:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rsax0eF1mbH9i7ksbLXCLZHjgRT+N5Mj/Hn+obk/9Eg=; b=A/p57rAV5sGUcLmJfNaVXqrjA
 2FofuhPaLaQCnZSr3vu5NiViVGlH/uGhnY1KzTKycFtDOIvspQrdO3EKG1/MkaZuUifUnsK+nAvMR
 6zUA11/q1LT0JpTI//uSo9bJ8zTPlYyGbTa2+7pvzMtUUwwxP4ZsGDq4aUq2WrswhNB2Q3j5Zseqh
 2xUeqH0ySiSc7erbWGMxkSNnrQ6M3/2VKAPQ3BSkgTt3fdf5aACuEw1M9IrLgs09z083xrV+iXZjS
 kesK0zScsfWWa0wJFOKWVDPe7chwB2A0C3Qg4a5wRxMk7+ijt3/kMcCySavBVYSlzY+KznV/7SAJO
 YBG30wnWA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8ge-0001ZQ-4K
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 16:15:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id u3-v6so1224256pfm.4
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 08:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:message-id:mime-version:content-transfer-encoding:from
 :to; bh=rsax0eF1mbH9i7ksbLXCLZHjgRT+N5Mj/Hn+obk/9Eg=;
 b=ksPQkARnbQWu2R7UN+Ym2gW8895Nlv5btxUj001HO8vfwSs7eKNZmCa/ZoAFqotQLN
 Npd1jEDKVPqgtXHOvRNZgIU3CFYgkYeFjwCGYf9PaCqSQchIOfjEJHcWp3IyxGLdM8vz
 ogVf9F2CAJ7hb29ij6+rgaacguSzQOTOKzVnAYQyIVGdXei5uMx3Ssmg+JS9DGNi8FM6
 tGnHZF/YOKWERXXzmUtvvKt1UFtRCFgLVs0UOfoXZLmkdz82KP22J3E1gicNV6XsyU23
 DdUzVANHjhuGZV/nJ33ZD0s57n1Ua+2WgYNkEewo0cofLHKqovjxRdV+lYlHR7nCR6TY
 diHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:mime-version
 :content-transfer-encoding:from:to;
 bh=rsax0eF1mbH9i7ksbLXCLZHjgRT+N5Mj/Hn+obk/9Eg=;
 b=D8WEUtYBdZA0orBnfIS+wksrTXo9SEOIocOGvKspJeSQf4g0HBYZ7u8X4pEeL9iL9k
 A5FxtVU1jN01ezxwTXNcRjoDGXaf0JgYUsUdlivjaGzUJarWK9U0GHCmKinzMEPuLW1d
 SW1WFgCy3MeFLT3eci2Kg7sG4FOgQ0uegc7hrSCS3mVnxMmeSfWkeeFHofgJ0ZykQktz
 Vu9f0GTK3J+5L5/vQ+bTKZB5EAU/x7LpUQiNIxpuI5tG4+APtLChXWYKRfwxI7LjNTiV
 83Vl125EbNm5HGWJCQVKPbK+HIi/BG/XFjhuN43y3AV14xU1QUZlMOAFHl92N/KmwamH
 DGcQ==
X-Gm-Message-State: AA+aEWaiMI7ugXVj5oylDY+lslLDEuAzeW38QOznp40Glsy5jWS/G3Kf
 ujAN67we1KXUWoc8MpmbXdfKAQ==
X-Google-Smtp-Source: AFSGD/UobCefefSx6mTbuhyFb7NwZCcoAj0DCyCw5Fdq3prbk6GfkOsrh+y+tlvmGtkM5kmy7HbDzw==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr2411149pgh.265.1542730468087; 
 Tue, 20 Nov 2018 08:14:28 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q35sm31520651pgk.12.2018.11.20.08.13.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 08:14:10 -0800 (PST)
Date: Tue, 20 Nov 2018 08:14:10 -0800 (PST)
X-Google-Original-Date: Mon, 19 Nov 2018 18:03:10 PST (-0800)
Subject: RISC-V Patchwork
Message-ID: <mhng-f1f11265-f6fe-4284-8dc0-a28ac937fdb4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_161540_349530_035DB1DE 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120161410.yZbbCrFjuPiBWRdVomdHfDtZW0MMjcMH1mEdhs5JuaA@z>

Atish tracked down the documentation for creating a patchwork, which now lives 
here

    https://patchwork.kernel.org/project/linux-riscv/list/

I have no idea how to use it, so we can all learn together :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
