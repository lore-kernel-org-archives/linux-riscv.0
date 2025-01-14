Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA740E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SVi0o6lt1jnRXe8O759H7Nt1ikc+aGGrLiS0rWBIxk=; b=EXh+zQEvZ4cKdA
	Bw2t5LyiItMk68Vpoa9aXUT/G1oo7xJi3lrnlsaJnxOd1AofcsHMDHKngwr7CVYavEpEPgnyTplms
	eMm2dqBCddL0k83nIuw9ugPGxmo1vcmGa6/g6upNVZdCltca5JbbCQP/hsIkV/uuVUgU+5uZtK1kI
	D8YxcsiL3tCqACksUokvfZh8nlZ2nm6HE5mCWNs6l11FqoIP9pFY9z1YXXfH7Sak4JDk4BNai+65/
	qG9Laon4z+cIYx2WO25OGNVvNeWRUWxVH3ZZG8cveruEwrhiASfLhbfTGGDrpwrVBKsaXIPoLXs9M
	U8g6QqvCwYZJFzyKB8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkKy-000000097lY-1Cdm;
	Tue, 14 Jan 2025 17:04:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkKv-000000097kJ-1TJS
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:04:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso41392075e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 09:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736874255; x=1737479055; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyPFycRjvp5c6AtQYiXYIATVbEpsK0e4npb0nthvins=;
        b=h6hPs9pSrFLvZoeL/9RD6ZmMFvBHr8Sa1SWEGR3f9fwIHWWHzqfQDS/dEOThG//GP9
         pP9Y0qHzk/pMGgntz858P93I3bO5HxqBe4RZxq63QHi/EuWscE9FQtWkiPn6CdILaiTp
         wKh2EH+y4zfsxkKDH8hYx0AlI4Ou2FmaAvPjqEvCwylaEBB/aQz/PQElRlrRM2JGgwZE
         dD5HDtqfST+Suzzkzu3G7IR5NZXtML4yemjJkTNTH49WB6jr63ozjxmOfN/mUfUj0rDY
         2TvqGtf2EvyhMoK4JIGgku2N7PbzoztpRTL2FgKQzcGa2pq/1PTzR1eqPtNAt+ToTqca
         hOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736874255; x=1737479055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyPFycRjvp5c6AtQYiXYIATVbEpsK0e4npb0nthvins=;
        b=ZoOylBKu5vdujnEpXfO0fXzzKYg+i/ZJNxDwYM10FaBLfZFgvRj985HMU43ZQvPUT1
         +ZkqXx9Xe80WvcbdSfeU0oTePU4YCPHy4BU7r/KXgAkojBu8TYxLTbkIyuLC52+MutCY
         9e6cTZn4jhVNvZxt8LCAB6cLezM9ut0hZl2fheE93WsePTA6TBGDsl7kAfawKBxl9c8e
         3wcLa31QYGuJX56JShxgRZY29oB98HtVx3cct8PPSWyVtplNq6KHm3DVqw9Fp1alkIG7
         Zk4Sy1lC8xMcK0kiORkFFck+WWf5XfeR9/Y2NWHFnU/9dYkO/227Dl0ptJrJ0ybwntSa
         Nm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7e14xCRDrKw4ojhITDJnOHhynZoL9a/P21fLITrlOaQReeTiQGBt4zaBD5wsuzKzNvnmH+T4fYCdnQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+1FQkGjDSlK2WfEBy8RPD03A/hr/P6sKWgxe6HmFGDaAQdx6H
	Ixmbjz8HQH8Q74SbScbwLuHph11CiGjmYkA7tFSYghZd9g4dQOO+
X-Gm-Gg: ASbGnctgC4MwAvhTRfKyRjkph7Mkmqf/l7bZiGe0o408drHit8iKazRpnTSia9YYe9m
	vrypxhaSzMbwlL28r9H7QEDwJ00j65VZt409rsLzM0x/oo7ebxmLRd8grsCrqVANe+b/bnGo+nO
	/R1lwUIsZiXaZv99n4QLU9jWBXWfRXPsYFQig60gHf2b97kknYNxDUdxYcH3iax29DIqzRhYliX
	pZHjRQunrMZvtRgGq7Q0DHdkimNUgVHcGIK3ueaMP+12E881Tcjh88azYULQR141W3R/xF2gQ0Q
	3hzL+o9eIGfnG3luDao5
X-Google-Smtp-Source: AGHT+IFgc/2Cf3s34iyy+3E1k6hm3BL9JT+SafDKeYk3hGm+IO82RaUKZZEEHoGVi7fxL60DE8Ad8g==
X-Received: by 2002:a05:6000:2c6:b0:385:f847:aa40 with SMTP id ffacd0b85a97d-38a8733a209mr26139393f8f.38.1736874254872;
        Tue, 14 Jan 2025 09:04:14 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89fc3sm218569245e9.30.2025.01.14.09.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:04:13 -0800 (PST)
Date: Tue, 14 Jan 2025 17:04:12 +0000
From: Stafford Horne <shorne@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] rseq/selftests: Fix riscv rseq_offset_deref_addv inline
 asm
Message-ID: <Z4aZDM1i6D9KKOI9@antec>
References: <20250103040326.2603734-1-shorne@gmail.com>
 <44f202e8-dc35-40aa-8dc3-2f2e4c28feda@efficios.com>
 <3bcdf139-81e2-4ef3-8e86-1e22b4df6d49@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bcdf139-81e2-4ef3-8e86-1e22b4df6d49@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_090417_387881_713F2E67 
X-CRM114-Status: GOOD (  19.23  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2025 at 03:59:24PM -0700, Shuah Khan wrote:
> On 1/10/25 09:22, Mathieu Desnoyers wrote:
> > On 2025-01-02 23:03, Stafford Horne wrote:
> > > When working on OpenRISC support for restartable sequences I noticed
> > > and fixed these two issues with the riscv support bits.
> > > =

> > > =A0 1 The 'inc' argument to RSEQ_ASM_OP_R_DEREF_ADDV was being implic=
itly
> > > =A0=A0=A0 passed to the macro.=A0 Fix this by adding 'inc' to the lis=
t of macro
> > > =A0=A0=A0 arguments.
> > > =A0 2 The inline asm input constraints for 'inc' and 'off' use "er",=
=A0 The
> > > =A0=A0=A0 riscv gcc port does not have an "e" constraint, this looks =
to be
> > > =A0=A0=A0 copied from the x86 port.=A0 Fix this by just using an "r" =
constraint.
> > > =

> > > I have compile tested this only for riscv.=A0 However, the same fixes=
 I
> > > use in the OpenRISC rseq selftests and everything passes with no issu=
es.
> > > =

> > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > =

> > Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > =

> =

> If these are going through risc repo
> =

> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> =

> If you would like me to take this, let me know.

Thanks, I have not heard from Palmer yet regarding what he wants to do.  I =
will
send a v2 aggregating the Reviewed-by/Acked-by hopefully that will help.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
