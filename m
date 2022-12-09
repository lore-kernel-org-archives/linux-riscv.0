Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EAFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kECAF+c+qjYSVZFWVkiQzD2t1eZjesv+8Z/Y4K+VqKA=; b=i34AZ2MjPmVS7M
	0EtrywtP/tX7/pWNkii7MfoZNkswJabe35KWNrQ5/ZgeIwsyKlDhPZq/PYlNuMHmjGL3Cvm/4hEVQ
	isIJyxM8ADbuj4eHIugqv8T/yCt0NrV2QPFLf9e1VDpFK9fngOlZdR2znhEKOJ50XCoFSTQSghM58
	QgkofYxlymjIxFCEuqbQyKq6HI3QriAMNPznW6KWnPabAGPl2iTmd4Ks8zeL/ysvkeGORdhJN50B+
	0KMO04dHoyyPFSSJRVTTn9TlZNzEOEBs515Rpx6Bw8IIv4BuDmW02/uULHpfCuDMW1oAG/dHC2b91
	8/En0cVxYzlWG/KS513Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3dTH-007wKw-KH; Fri, 09 Dec 2022 13:31:23 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3cNX-007VXv-4M
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 12:21:24 +0000
Received: by mail-qt1-x82f.google.com with SMTP id j16so3404064qtv.4
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 04:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqHr86p38/ahhMMntxCit7rBXX2FGTwoGGuYENfxfkw=;
        b=me7hH9eK8xEViajfD3/ge6xV9UYEwjUHb1cxDB5Zx4id5QpJ/ed7BO8baLZ2lHwYiK
         jo53vr8D2Qgda/300i18jmH4WkYm7aZwXv/qXnjpdMdr4+K/qofcUpAwVYgPQg0Ur2d7
         xr/3JIowbb56/gQmJCl+ada34ziC65tLr4UiwX6OytOH9ra+oHiBHQ4C4X/1fRGc6wPW
         g8umbUjB//+sf9D4hhfXDAfZsYYK/vbAa7V0pbTlbjzCtSSkQ5nZEpWqntS/6pAz1pQf
         HceDH/nPI9hd3vzvZiR4NnzUeM/5FmrmTRKMJz1rD2okMA+LciMI7rBBS2MukNJ3fB+u
         hU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqHr86p38/ahhMMntxCit7rBXX2FGTwoGGuYENfxfkw=;
        b=Qk2uAZCaoLDU91JKco1VLDHsjOo6wkBb94Nl4WSXMVI6JU3UPwizYYkqruJNNhB37X
         j58qRTCNrjuVmVhzbR+C8cEGTUw3hm9Z53BTzqzE/a+iJ4nf/1Uxq+yWkcrDFbZopkkz
         iYWbCEpdDqAIUQ5p15e9pRR7s69DQJcN0CsZXNuPfYVXxgfIw5Wbk1Q1iJop9y5tf/5g
         9cNPBSFwQHYrbnS9zrQUE046bSgWYnDyLvFmlTadANKFfRZd+YSFDmtKxPnqXIBPh7LN
         J1Z+gKtcsNv85wSOWyuBNCZd1dlE+UQ0SmA49gDsUmHuhQq0Gsyfbj4OjKASHRsSuveJ
         P1EQ==
X-Gm-Message-State: ANoB5pn5EYbwLFEVRTl0ub2vwB3oDTNAcQ8TUaM24yuy9cO0eVZ5ByGz
	qs3g6pEr2ZLYyNRzfeJ36Z2+
X-Google-Smtp-Source: AA0mqf6jy5TEadrryrnY9gwsb6bsAL/EY3tPtxte5XewddTH+2WwuTaDxWqGXYssr+ntoNxx7FTEzg==
X-Received: by 2002:a05:622a:4084:b0:3a7:ec9b:e00b with SMTP id cg4-20020a05622a408400b003a7ec9be00bmr8990106qtb.68.1670588480205;
        Fri, 09 Dec 2022 04:21:20 -0800 (PST)
Received: from bruce.bluespec.com ([38.70.11.69])
        by smtp.gmail.com with ESMTPSA id w4-20020ac843c4000000b003a606428a59sm737839qtn.91.2022.12.09.04.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:21:19 -0800 (PST)
Date: Fri, 9 Dec 2022 07:21:17 -0500
From: Darius Rad <darius@bluespec.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Andrew Waterman <andrew@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vineet Gupta <vineetg@rivosinc.com>, stillson@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
	atishp@atishpatra.org, guoren@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	bjorn@kernel.org, libc-alpha@sourceware.org,
	christoph.muellner@vrull.eu, Aaron Durbin <adurbin@rivosinc.com>,
	linux@rivosinc.com
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Message-ID: <Y5MoPdYimQtqQvkM@bruce.bluespec.com>
Mail-Followup-To: Florian Weimer <fweimer@redhat.com>,
	Andrew Waterman <andrew@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vineet Gupta <vineetg@rivosinc.com>, stillson@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
	atishp@atishpatra.org, guoren@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	bjorn@kernel.org, libc-alpha@sourceware.org,
	christoph.muellner@vrull.eu, Aaron Durbin <adurbin@rivosinc.com>,
	linux@rivosinc.com
References: <b1dae947-d52a-d28e-5ddc-c1ad6d29828c@rivosinc.com>
 <mhng-84ad9495-ef4b-4343-89ee-dfe45ab69ff7@palmer-ri-x1c9>
 <CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
 <877cz0nbce.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877cz0nbce.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_042123_405254_FB09B547 
X-CRM114-Status: GOOD (  11.49  )
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

On Fri, Dec 09, 2022 at 11:02:57AM +0100, Florian Weimer wrote:
> * Andrew Waterman:
> 
> > This suggests that ld.so, early-stage libc, or possibly both will need
> > to make this prctl() call, perhaps by parsing the ELF headers of the
> > binary and each library to determine if the V extension is used.
> 
> If the string functions use the V extension, it will be enabled
> unconditionally.  So I don't see why it's okay for libc to trigger this
> alleged UAPI change, when the kernel can't do it by default.
> 

Because the call to enable can fail and userspace needs to deal with that.

// darius

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
