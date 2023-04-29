Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18787C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 21:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFRu3iRQkOcz70QCwZLpY6opME7ugXvnu272iKIsfC4=; b=TQ07Z8bQFIEymL
	LtFcad406hG8RQj/ILIyvmVImA8nXa454fvMkMkRIB5SZEOeRJSM4hXZH+KzbTklOAs70Nf0WW2ZF
	jEXoPu1zaXe7Fuu60h/WKuvOszM31OnRphHfUwb9JYF7h+6Y1lYJ1mE8HDHur1NXmFQFCnezpMSsK
	1Nxk2SRnnR9KVhIONR9JiCFuxzE1HATesh0+D4FvteOFNZt6T+bZQvVN+yyFAS7idZOVZX/OBpy5k
	KDJHKTmIVowj4Saq1FiZZ1PhXznWzf0Zrsb8V0GYF4xPuZSeGFuhx27ExgtqPe7yMP1pL0QN2Q1oq
	TY6xFsqbeMrA0pSOMFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pssQj-00DDGH-3D;
	Sat, 29 Apr 2023 21:48:34 +0000
Received: from out-43.mta0.migadu.com ([2001:41d0:1004:224b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pssQf-00DDEl-1t
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 21:48:31 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1682804899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeEJr4NqU/Ww/AxE6IB8tbd9JvoM0OEBTeBY+6h2h0s=;
	b=cIE/xFyH3GJrLkVkx5RnJe2vOFyel94XhEc9lUhaIf7PJN9h3peroK0zGl9BTNAD2TKGIc
	B00+gc5LOTSJQ3NoBaCC8k+pcDWN9NauhzyA5addWdvIzktlBgpdGmKVS6MJ/80Hwn91MI
	I1DQ8/fcVXxz+j29r1InLnO34Rgg9OQ=
Date: Sat, 29 Apr 2023 21:48:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <5fe1484b4f2b4ae960a9b599c4ab3ace@linux.dev>
Subject: Re: [PATCH] RISC-V: fixup in-flight collision with
 ARCH_WANT_OPTIMIZE_VMEMMAP rename
To: "Palmer Dabbelt" <palmer@dabbelt.com>, "Conor Dooley"
 <conor@kernel.org>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Linus Torvalds"
 <torvalds@linux-foundation.org>, akpm@linux-foundation.org,
 aneesh.kumar@linux.ibm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
In-Reply-To: <mhng-b5a20207-95a2-4607-9e6c-52396d569d91@palmer-ri-x1c9a>
References: <mhng-b5a20207-95a2-4607-9e6c-52396d569d91@palmer-ri-x1c9a>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_144829_789042_2E08835E 
X-CRM114-Status: UNSURE (   4.27  )
X-CRM114-Notice: Please train this message.
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

April 29, 2023 4:17 PM, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:
>>> I guess you picking this up for your second PR makes the most sense
>>> Palmer?
> 
> Yep, except it crashes b4
> 
> $ b4 shazam -lts https://lore.kernel.org/all/20230429-trilogy-jolly-12bf5c53d62d@spud
> Grabbing thread from lore.kernel.org/all/20230429-trilogy-jolly-12bf5c53d62d%40spud/t.mbox.gz
> Analyzing 2 messages in the thread
> Checking attestation on all messages, may take a moment...
> Traceback (most recent call last):
> File "/home/palmer/.local/src/b4/b4/command.py", line 383, in <module>
> cmd()
> File "/home/palmer/.local/src/b4/b4/command.py", line 366, in cmd
> cmdargs.func(cmdargs)
> File "/home/palmer/.local/src/b4/b4/command.py", line 100, in cmd_shazam
> b4.mbox.main(cmdargs)
> File "/home/palmer/.local/src/b4/b4/mbox.py", line 713, in main
> make_am(msgs, cmdargs, msgid)
> File "/home/palmer/.local/src/b4/b4/mbox.py", line 101, in make_am
> am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
> File "/home/palmer/.local/src/b4/b4/__init__.py", line 552, in get_am_ready
> checkmark, trailers, attcrit = lmsg.get_attestation_trailers(attpolicy, maxdays)
> File "/home/palmer/.local/src/b4/b4/__init__.py", line 1319, in get_attestation_trailers
> for attestor in self.attestors:
> File "/home/palmer/.local/src/b4/b4/__init__.py", line 1158, in attestors
> self._load_patatt_attestors()
> File "/home/palmer/.local/src/b4/b4/__init__.py", line 1261, in _load_patatt_attestors
> patatt_config = patatt.get_config_from_git(r'patatt\..*', multivals=['keyringsrc'])
> AttributeError: module 'patatt' has no attribute 'get_config_from_git'
> 
> So I probably need to just go update my setup, I've got a bunch of wacky stuff.
> I'll try and remember to do so, but I'm going to scrub through other bits
> first...

Indeed, you have a newer version of b4 without also updating the patatt dependency. If you're using b4 from git, you need to "git submodule update".

Regards,
-K

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
