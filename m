Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A503E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysChFdUjVAwRyOCXtIjA+9yIxMDBDe8dWnmC1RCr7L0=; b=cyUMRiRNJxS9ad
	H44+iZkixDrifDCZnZah4pQzNYH57MhTQYAIQ9xLKWDgsTQXDzimh1zoDKxbfkPVFdkqo+aoBB/O2
	CSdBFmYPGQsaQgb68BAOUzOlp8nuMijBnt6/F1OHEO2G6yMcmqeDvWpKBGpKBpfm4MBwA1VSHDKNY
	KS7xetoaUQ9GTpkxxevTzrkEViE84wiz8quDwWnJTLK4Zd+jF3899+To7b+HomiiWhcOpIJLvQLsZ
	jxR1gusp9PA2EsTjeQCkAXMYcB/ffwhhTd40shNDZ86TU/UBSv5erW9RM5FqkgW0BJun7PEWeXrDt
	rkxAsFVf5z98UvWE2qlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJoq-0000000GaAS-2JM0;
	Fri, 10 Jan 2025 18:33:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJoo-0000000Ga9u-0V0N
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 18:33:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9e44654ae3so362608666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736533992; x=1737138792; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztn+xx6/hhaGVps14838so7FLIOxsLeLWEES5e/LNFA=;
        b=HYzI8LUMAgl17DvIlKw9lIGrAtA3jB203KpbANAWJZP+FhMo3jhnFLGGtri58LW8L8
         uJqn4bOetfLSP6W4WayOV9qX/JnFm7bCcCaNDQ1Zoem4e18ZDxt14cSSF5PMDZEUW/pX
         Fp6vnSDh/9U2h6R72iMqcuQPPmxck3Jc6Pp/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736533992; x=1737138792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztn+xx6/hhaGVps14838so7FLIOxsLeLWEES5e/LNFA=;
        b=WbiG9JQ2MnkWtl4DmzFMTmrJ24VoKR3sCrHJsMRxU6vTc5+41sKMxIVsN5SRKWmKpK
         4yaNsK4S7lFRBID9PWU5lrxxcpct7UETfpDbivoEIUPeNfNxX4cNi3Mes1y2SJU+a8YN
         EoK8zDSrI7FWiuoCT3Cztch8rqZYcEI77VgPlxhdv8ZjjH1qlWj9ZvY9kI1iWzNZd729
         iNdC14dWbQoColz3n4tf+VsEeza2EbNTRtzFcEUHlrqoWf6wMBkCw4G2Fy547M3rZtLd
         JJ9D/1yww2sVhQd3TDbXKQVph11SMeL/ATLzOOyyEXnc2hQKNMnEoODTwcnhTqAbAbAu
         yvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMdrGt2Z2PbqXQxXmmIYTaF3uRHg93o7LfXue/x7XQ1x4FMYly6gP3fEc5L63a4CwFhgHlV26QnUA1PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJndN2YyGfvoKZrLWkComWDLX4S+lbsxBnByY9sMNEKE+jEIOg
	NRxj3LysBzUNRQtHo+AfE26Un99WldxhMamb3KsAV3mbxlTCvV58xRECAiFUm30BM06FNKv9pTQ
	CiJc=
X-Gm-Gg: ASbGncuUr0b6rjopFRT/gIsUuJBCvskww7C6fcetvrj35qeRu6K/hHYie8dXw/G16I8
	C+quKG5lbjey0TkV9IfmAMuWxVSwjMaiAPMqqly4P+bSqoDsk9ylbhE+CcU3RSdrIKu30mSlNwl
	jUVPAzIppSbs/KFxg2s0JY62fZYGvAuCthqVC5knZ8y85Z6CZZUO/BiEe+1/kpjWoLhcdnY8NgS
	9BwYzwacvEECogkdxuD5Tnnm/OUUZH/2nuQyGIzbXI/wm51V/p+Z0WXkJvXO36Ik/Dy2lwCs1od
	cZTI5Wxip3byDJa5K/lG8uwcVF5VC84=
X-Google-Smtp-Source: AGHT+IGeYVmsryZo0jtBf4+zyIe60/IJXc2XsZY0hrl6TnF93oXucSUluzN9xoweKDWXhBcRz7FE7w==
X-Received: by 2002:a17:907:7ea2:b0:aa6:a732:2123 with SMTP id a640c23a62f3a-ab2abde54demr907615466b.54.1736533991603;
        Fri, 10 Jan 2025 10:33:11 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c964992esm189711766b.185.2025.01.10.10.33.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 10:33:11 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso445928266b.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 10:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL/Kz6BmgFtW3Lokipt04VI0DqxEC+I57DRS6y6tnmCjhtr8M+VWWwu+THmWDGiaPI9rVS6RAy+9sNMw==@lists.infradead.org
X-Received: by 2002:a17:907:7f90:b0:aaf:300b:d1f7 with SMTP id
 a640c23a62f3a-ab2ab709c82mr859127166b.13.1736533990540; Fri, 10 Jan 2025
 10:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
 <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
In-Reply-To: <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jan 2025 10:32:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
X-Gm-Features: AbW1kvbigeb3lg5NVlMToaCtct6NB4aRMHwzUjQ-ItkeRzFo2HtXHrJ7EE1mr54
Message-ID: <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_103314_179007_8E7029E3 
X-CRM114-Status: GOOD (  10.02  )
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

On Fri, 10 Jan 2025 at 10:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I suppose this is a consequence of 8962b6b475bddc ("kbuild: print
> short log in addition to the whole command with V=1") which introduced
> an $(if ) where the else branch is simply ':' and so it always
> succeeds.

Hmm. Odd. I don't see why that part of the commit exists, and you're
right, that seems like a bad idea.

And removing that odd $(if..) and making it just do

   cmd = @set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1))

doesn't seem to have any obvious negative effects.

I'm probably missing some obvious reason why that $(if..) was added,
it's been that way for two years now.

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
