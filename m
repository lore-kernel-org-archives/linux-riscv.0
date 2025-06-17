Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CA3C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0Oi7jsFYL+pw1dTDe9U2rHqIcOewBaQ1EZH3NL/XDM=; b=U7cWSnN4qZ0xxd
	FNKbQjXLfm2TQ+tsQvuFoFZhOBLuXrMKUExxy0SSKiJvXxBXhlw6DrMQa3n5XhLhOgwLO2axQbRVT
	jkMliKBTKJEpbfWJ7AyBOD4qb2TUHtmtq6QhecGhL4+REwdCdmVrIVx3PNmoTyiBazGQ6YJwCjZiW
	sxCyxOyMbo+7F2hde/XB3b3akQWIcmP99h4/SrIHlNP6MePITAQvL80Ms2EtWRsdA6r5QTQ1Gj+Od
	tkDCxQwn+Fs8w2F3Y7k4ljcp9YJdRhPEdhACzk9qWLrbMj8YrJoLRHthHzusWoPD1jbcWR2StyxqX
	bCMHk7lsyLHFvdLOs7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcEx-00000008H5b-4Bfj;
	Tue, 17 Jun 2025 19:45:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcEB-00000008GuE-17y4
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 19:44:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ade4679fba7so1122976266b.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 12:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750189453; x=1750794253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=eSF2E0cUY09v8HWJyQ4dDGXn83X3vUzoRB9iYbvEOl1lo2/j8oubxPu9Cd1+iPdiNe
         12/ScMXC0XA28p98wim/QInE45BjkjBim5SA4IsQKbmn3hWEGxgGARUS8N9Ce6DIZ21d
         avTg1eicbNuHuuiN38yBWHjMmbMSvfvqBK1dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189453; x=1750794253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=XrpxlR4p76jGyY5dygkMyz7E34WyaQn2dfVAA5IScEL/n9okF1EerB551F21tUfS/c
         3q4NijBNeMKlvpw8QHuCdFZxuX3LBP6ER745uuCpiu3/76SOFrejBW68zcLuC/0uF8bJ
         n4Mliz0YUdM62vED565e1NOPIp6/4+EomQf7YQxtII7dHHirW+X9RKfKp4BDLlJbp5Eo
         vVRW24K0ndofsX6EcHgGhCBF+08GBS8U2tkhk4s1GTwf++3dzi6MdTGvALlFdbzKZFxu
         OoZv4Xadu84RlvbIG1H3GBS+NuiPvjLa12uYQdL1RWVW8JXPzshhpjy5Lcum0cM9RbNa
         7Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBPCKDCZeMEUl2UYACHXrT7IOD/pN+Kejz6FOJzqw8WFPOUgTp9lMaKi1/U8PScT2/6KfgKz7NQuanmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh4j8qPe5uo0l66Tayzj1hU2MkMvGZdTEhvLSR/Ms501xrx58c
	61WjU4qtwSyxttHggvds4Dvt3AKxkLt+F/w0M/sxvczXkvUT2sIta8YQC4Zat+bujMGdbZHm9l4
	iQaZ2bGg=
X-Gm-Gg: ASbGncsAqkW1qj8X6HJzH/uE0E/7divpx7JtfI+GBCwgLlyUj89PDQRJ+un3NLrWBdh
	Vo7WAF+bjHzr4H7otU8iQttoKNCDHTjrbBLifucwGdtW/mDhwk0fgfWYn8TIwjq1Onhz4xKqGhx
	PmprlcovGHHzuMix5dZe07Za3eLTcSUdX9DdSoGgtwIv/fAGiusGWXYNttuM9tqBg02TALk2Al9
	P+pv7Gbi3YYfQrPnIMLlgVi3k2VjvOEh6Dgc784naKfo7WIsW0BcbWMw2pQyncFzf89W/fN+x8Z
	NSH/u7O3FU0dOnL45Ir0i2tpTTXmYxukyvRlhXkJZeMjA06v70Xv515XI+3u2fzEyNyrK0QjZw1
	aqn4MFoqei/xWSH+RH57kGjGFcxVV4jvlRrjT
X-Google-Smtp-Source: AGHT+IE7K977+Y7VhodjMA1BmtMOJkPXdWvkHqdnW5+IBHfkf428hpQxa9QTSPUqWR0A8SFT3tiuIw==
X-Received: by 2002:a17:907:7e94:b0:acb:abff:a5b6 with SMTP id a640c23a62f3a-adfad39ab83mr1223388266b.13.1750189453252;
        Tue, 17 Jun 2025 12:44:13 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c1f04sm915589266b.54.2025.06.17.12.44.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso10846632a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqOjreWRLY7W5dqdV6h60x/Qem0KHeIOH263I+eiXGhNWmtrFP/2+UdPdujwFysWyjxe0Rdv4cudUEdQ==@lists.infradead.org
X-Received: by 2002:a05:6402:278e:b0:602:29e0:5e2f with SMTP id
 4fb4d7f45d1cf-608d086197cmr14681659a12.10.1750189450991; Tue, 17 Jun 2025
 12:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com> <20250617192212.GA1365424@google.com>
In-Reply-To: <20250617192212.GA1365424@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 12:43:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
X-Gm-Features: AX0GCFszNgSlkg9Mnl9IREDvPmSYgcHDQLiQJ6pRqgmPlre4NTxTJm_9n0SX2DU
Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_124415_329543_653D641A 
X-CRM114-Status: GOOD (  13.99  )
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

On Tue, 17 Jun 2025 at 12:22, Eric Biggers <ebiggers@kernel.org> wrote:
>>
> The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
> has a negative diffstat once you subtract them.

Yes, the patches were separate, but my point stands.

Let me repeat that part of the email since you seem to have missed it:

> If I see a pull request that only adds new tests, it's a no-brainer.
>
> If I see a pull request that only re-organizes the code and the
> diffstat just just renames with some small updates for new locations,
> it's a no-brainer.
>
> If I see a pull request that does both, it's a pain in the arse,
> because then I need to start to look into individual commits and go
> "which does what".

IOW, I really prefer pull requests to do clearly separate things too
when we're talking re-organization. Or at the very least spell things
out *very* clearly.

Otherwise I have to waste time just to go split things out _anyway_.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
