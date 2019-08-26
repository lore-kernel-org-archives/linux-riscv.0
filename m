Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB693C3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 14:58:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF6B3206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 14:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdmPiSP6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tycho-ws.20150623.gappssmtp.com header.i=@tycho-ws.20150623.gappssmtp.com header.b="AGKzs8O5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF6B3206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tycho.ws
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/p+xbg8PFBS9dWDFUnwR6yQDwjd7EW4ZyXf7z1JssnM=; b=GdmPiSP6SeEwCq
	tmA9abpJ65Q8kpRkMCG466TqypRxxjixcQaOBaQloN0Fr0iB1qKmmeL6+nCFEWUw8f/kDJH9P6PJJ
	oJVRv+BNl/C5bTfipzi+4f9l0jzf5dkBMPgnSQEwNAoZtaoH26npdLNFAE9i4xzIQpKCt1QqTbF+o
	1GgyWsokNlwBnEsbWi5UqtfWscabgtmav4Url3wmf7TmjxSJeJ5Vq5TQStyO9JJiP30CHtHjOilo0
	Z0aRgaIOffZrsD/emDmQsgN0gLE7uu+kIrFkwn5QwsKLQcUHSQg2kpON/WFkbVmqZdTk21V+D8prO
	8SrymJZPIFgynjEMQSrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2GRT-00021H-5A; Mon, 26 Aug 2019 14:57:59 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2GRQ-0001zy-9Y
 for linux-riscv@lists.infradead.org; Mon, 26 Aug 2019 14:57:57 +0000
Received: by mail-qk1-x741.google.com with SMTP id 201so14241519qkm.9
 for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2019 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho-ws.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NPJGDOo6L0S+CxpwgDKYq0p9QenFZx3WP7pTe8S4sMs=;
 b=AGKzs8O5qznJgGIwpcBHKPCKaBpDnNPQopX6O6DHaXhR0KlirNeInM2VbTizrvmum3
 0f4vpmov8OQjbLJk1Uu16D/TOk9HdYztfjR2UNe9dwmng70wrygV1IvJyjMDJATGZ7yk
 PobQ8qvG35MNY31lVY5cwgH3G7bORvaNch/ljPBUTdENjG6RkvRB2RS2398T2uRSGen5
 ViR0M5vcYyWEOfqp9LX7QdJWMYS6i91HVP7ljpA9/AH4jOB2UJTgVO/bz9QxDRTSh9fV
 2R9wHdvrj+d6EskJaU21USriV0jICM3S69Lq+YySOHBCEcG9R76zVDNftBSWlXet/W2R
 qVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NPJGDOo6L0S+CxpwgDKYq0p9QenFZx3WP7pTe8S4sMs=;
 b=W9QfE4yaLV5eXasMKP00JuulgzUEnCu9w54QokN7aJ6fEojzvXfP1si2v8K/VeckIA
 TFVW41JrbHFLSgV8JrWSrHP08pcdr4YKcJEFbvNSkv5ocCbIDcK1R4bbTOOd8bv8lbsu
 L+KiiFarqXSmd6a7PLtMWNLVL5sM/Uteb1SUN3+fvE3SGMUp9oSZdtuEPMoM+CeajVtX
 feV3A1fOHit/a7plwKLYQ9BydwlZ2dPIHl3wLMCTYOIZvUow67FhmsYvOgh6kp7Sbkx5
 udn/3QBPEOs5drcHlXFbwndAet//Aqvqh2aqdAkfJWOFHQxBVqWv4XphyOBzS+9jJ/14
 0WZQ==
X-Gm-Message-State: APjAAAVb4KFrXa+PjA+QSM9QI0bNIg2PpBuRuTFxt/o5HmQvj+WqGVY5
 sbFHUrbjI0wO3fZypO64Lo2Kiw==
X-Google-Smtp-Source: APXvYqylzZdUtT3tWQZ6cbQ0jUMry5R+13+YQvBswaR16gpPILhv7dep1DWgwRIXcXehIisp40eyBA==
X-Received: by 2002:a37:6e03:: with SMTP id j3mr16061933qkc.362.1566831472597; 
 Mon, 26 Aug 2019 07:57:52 -0700 (PDT)
Received: from cisco ([2601:282:901:dd7b:3979:c36f:a14f:ef87])
 by smtp.gmail.com with ESMTPSA id m20sm7309611qtk.11.2019.08.26.07.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:57:51 -0700 (PDT)
Date: Mon, 26 Aug 2019 08:57:56 -0600
From: Tycho Andersen <tycho@tycho.ws>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] riscv: add support for SECCOMP and SECCOMP_FILTER
Message-ID: <20190826145756.GB4664@cisco>
References: <20190822205533.4877-1-david.abdurachmanov@sifive.com>
 <alpine.DEB.2.21.9999.1908231717550.25649@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908231717550.25649@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_075756_340417_7970480D 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: Song Liu <songliubraving@fb.com>, Alan Kao <alankao@andestech.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Yonghong Song <yhs@fb.com>,
 me@carlosedp.com, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Will Drewry <wad@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>, netdev@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Vincent Chen <vincentc@andestech.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Aug 23, 2019 at 05:30:53PM -0700, Paul Walmsley wrote:
> On Thu, 22 Aug 2019, David Abdurachmanov wrote:
> 
> > There is one failing kernel selftest: global.user_notification_signal
> 
> Also - could you follow up with the author of this failing test to see if 
> we can get some more clarity about what might be going wrong here?  It 
> appears that the failing test was added in commit 6a21cc50f0c7f ("seccomp: 
> add a return code to trap to userspace") by Tycho Andersen 
> <tycho@tycho.ws>.

Can you post an strace and a cat of /proc/$pid/stack for both tasks
where it gets stuck? I don't have any riscv hardware, and it "works
for me" on x86 and arm64 with 100 tries.

Thanks,

Tycho

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
