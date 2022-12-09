Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7DEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UE9OSlh0xrD9ZA9CYJ0zCt9WKw7lFxPzts27Di5fT58=; b=HlY1bDEHIMSEGM
	FEg9mXvhjWzm4BrGsPe6dMpEjarojWbHpQ6xZHpDitlR5S9TNcmjmh/UELviXZN5EQ19duULgEdJt
	IZwPVYm66kZUyrWDRRR70JXaCEhRjaDEEfz3LE/edqrhf6rsWLepDVWHaMIinfAcFXuorFc8U5+oS
	QWfHLhZZlM1IeQFfZMvTbk+0zm1gCK8wVC+v/nVRMToLQv/V32bXbmYCf5djVX/+bWsh5C/nqGxSr
	yGpB28BOFQN9RiTaHwiSvqE9zcq8Ku//2GmLTbZj/bg9JNeLvNpD36sfL849MQ2HrVC7gt6EJi3Uv
	llq8WI7qVjRPfKOaWr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ciR-007d2W-WA; Fri, 09 Dec 2022 12:43:00 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ciP-007d0r-IV
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 12:42:58 +0000
Received: by mail-qt1-x833.google.com with SMTP id h16so3441419qtu.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igBuNDpaHFuZEiBvHZ2c4/iSakohbRrwsz40HKIGNEA=;
        b=yZZBXbZxeZz5QZrL1Dt+BF4rJDeHdP6+MsHJiU+Jq7Kgdyhns9NGtYv82PhDfAB5b7
         o1L1h5aCpY6Kl6QWL5vQUcDCBzfj9Wv7dpj+GqW3+EM4r13+uqoo5EhpmjM41VVfTWho
         pQs/OiHYUdfi6exiEnxhQ1ME/h85omQJeRUbPtJQPcPPNOJRnbLd3XCd0/2j4scAEaPN
         8VMihd4/sNJpfFNVvZAEawyEKh/iTRPJqXqZhI7vpH6TK6dNctKCYl1nwcTNgN4fQ+Rt
         bvAgeXk2H5aIRUyOLZogd6PkidHEshj2c6Hzk7glLWx2Q9lBUZIJCnyPGnlwef5IgeOW
         xshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igBuNDpaHFuZEiBvHZ2c4/iSakohbRrwsz40HKIGNEA=;
        b=5oU0v6/h9rSCd4fe4J8lej5gB5TwyNpP4V/gDXVdvBG9Rj89E2TBUbRVbybdmH79HN
         wyP2Fkmb+DKnPWFKG4+lKoAGsw6gsvHMFLyi+r1QFJtN30SWpXKfoIQemPlfwQ+G+FtP
         QyOy1TPfkDiEKxu+c2RPDXOCj5kCQJHNwUiah/iKkaPSKUQLnm3EcH+w1CgfuhONsAMa
         bNKmKyyyGMUDIrHfTx+NuiA0qtOjtWYkiTI6grCBz2xztKwLxWkF4iEg8MPOlPEgs2Er
         AMMn+Je7NoJYzYi+bvELvn4ZwNx5wolsrOYl0nTLJgnTcoCYKinVcUsZFQnIPCEcbqpl
         qWhA==
X-Gm-Message-State: ANoB5pkZWEgRllIyovjs7JmmiSzvzKsql1KQVNCykbj8K4sbr8+iRI3c
	xaEuqsppx6ICyaEcAoaaayec
X-Google-Smtp-Source: AA0mqf7h3NrKKgZHoxcpultPrxTev9dn4y0DQnPSJpPUwiCdCUj+2QZZrVKFSHDsG7JKVvD1HYx8eA==
X-Received: by 2002:ac8:745:0:b0:3a8:325:47e with SMTP id k5-20020ac80745000000b003a80325047emr3161524qth.54.1670589775249;
        Fri, 09 Dec 2022 04:42:55 -0800 (PST)
Received: from bruce.bluespec.com ([38.70.11.69])
        by smtp.gmail.com with ESMTPSA id bp13-20020a05620a458d00b006fa16fe93bbsm1051872qkb.15.2022.12.09.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:42:54 -0800 (PST)
Date: Fri, 9 Dec 2022 07:42:52 -0500
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
Message-ID: <Y5MtTLtrDnCW6Dik@bruce.bluespec.com>
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
 <Y5MoPdYimQtqQvkM@bruce.bluespec.com>
 <874ju4lpum.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874ju4lpum.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_044257_629896_90156608 
X-CRM114-Status: GOOD (  16.90  )
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

On Fri, Dec 09, 2022 at 01:32:33PM +0100, Florian Weimer via Libc-alpha wrote:
> * Darius Rad:
> 
> > On Fri, Dec 09, 2022 at 11:02:57AM +0100, Florian Weimer wrote:
> >> * Andrew Waterman:
> >> 
> >> > This suggests that ld.so, early-stage libc, or possibly both will need
> >> > to make this prctl() call, perhaps by parsing the ELF headers of the
> >> > binary and each library to determine if the V extension is used.
> >> 
> >> If the string functions use the V extension, it will be enabled
> >> unconditionally.  So I don't see why it's okay for libc to trigger this
> >> alleged UAPI change, when the kernel can't do it by default.
> >> 
> >
> > Because the call to enable can fail and userspace needs to deal with that.
> 
> Failure is usually indicated by an AT_HWCAP or AT_HWCAP2 bit remaining
> zero, or perhaps a special CPU register (although that is more unusual).

That would indicate that the extension is not present, which is one of, but
not the only way it can fail.

The vector extension relies on dynamically allocated memory in the kernel,
which can fail.

It also provides the opportunity for the kernel to deny access to the
vector extension, perhaps due to administrative policy or other future
mechanism.

// darius


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
