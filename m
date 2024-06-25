Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA7CC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 18:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emhbgYH4g6cFDal3v0hnfqG2DkW6GtP+NTZbebEtMIQ=; b=mGvXHakaWwpJSj
	RY2AZIt5sSZR1KwafLFQBbFnGQEpTGKQHYNAvibxOM9EBPJVNozQbbnV2XXBFnrLrTNekkOrposRv
	wu4PndCCmQoHfnnPzO5CVvLrPrCsmRdkrhkp3LdDKMOZnd1EJemA107N6xKeO7+rxEfbRxOWAP16V
	NhMdwgpb7rokvRZ5QMX3MRDje62mlK8yDTS0IeGacyfDEUmLVGDpS//n0mCftrIEU1XRzKQHAU0Nd
	sQmOJGG0oDiHBnpdSymrd3Dc2ypYnI9OXQw2V43oVqHZ6iwgtbEIkLfFnMkGLAU+G+FS1giYmrqkP
	t326i/Df0WJjgVQBtTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAem-000000042Wg-408C;
	Tue, 25 Jun 2024 18:12:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAek-000000042V3-1xCd
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 18:12:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52bbf73f334so4571964e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719339155; x=1719943955; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p6VwDOaqwr4wbQW4OWCZIaWgizSIAoa+poBbII7mCEk=;
        b=FOuC3QQydMI7amtuQllykHMZM6ujV1id77P0KDW2DC1UqyFsKVPmvjV1ukqdvpdGsQ
         uYW/N2O9NxigzhojKtnFMwuIWgmYBoCcDI1Yg1pUY3MIwGIu+q6NpiK1GCa7EU0uZfTQ
         uFCS0i3fBJonxWZz3Sj0i0HaszhvihKt1/o0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719339155; x=1719943955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6VwDOaqwr4wbQW4OWCZIaWgizSIAoa+poBbII7mCEk=;
        b=h9ceA+Oa02WygJ/eb/FvQWorbKR/D8fPmlb3IfwLGajYUSFFTfeBHkyCksh4o65K5U
         Sio/I/9lOaVZgc/p4I44UX/ouIhawmNVvH8VdN4cDvU48p1G4YJ2r2xZwMzuGLlJRABv
         0IsuE+KRNgWMmqA+rfpnmeltiwOonP5CETQ/8kgCl9wMtglC0OtIaW3ILKyGNNHUELmf
         6rh7z7NP8HYc/tHKqSz136cTSHa6KlXBJvAnkQvPJ2rKFheEqftmyWntJTp6mmKI5JOF
         T/A3JKZPw+m9cPmskLLFQo4rxsKlEUTN5bzJTogAoPa0VDhTxmPVOyRm+LYN2vL4AuKf
         nfog==
X-Forwarded-Encrypted: i=1; AJvYcCUJTHIegW6UTvZptQ3Cv7/oB2kKxQFCK0e4iTChVZUri57HKmzMb2hqNTQR0Hvk/SjmN5dL22rSqoDrMUC4LVEHLa/fqp4TBWDTz6BBr1im
X-Gm-Message-State: AOJu0YwXMBTzJPXVcbjUQ7c0vJiwDeAFofgHlHBxcA5eiAVlcbr6cM7G
	hoemYULM8z/vJRmMZwgtHOPWbgAtvFdgs6xXIRAsmObJ8+0PE7b+yjjlbhD/1a3Nr3pV5NtRwJS
	Mqepzgg==
X-Google-Smtp-Source: AGHT+IFfLnT3mN6zqOL3eEbnVrwv3T3a8xwwCZuIt0kivLVLstN6+9CkB0+FhJ9CZs3Sl5GQMUysQQ==
X-Received: by 2002:a05:6512:52e:b0:52c:d78c:f886 with SMTP id 2adb3069b0e04-52cdf7f6720mr5667541e87.41.1719339153561;
        Tue, 25 Jun 2024 11:12:33 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdd9a5236sm1020558e87.121.2024.06.25.11.12.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 11:12:32 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bbf73f334so4571923e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 11:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGR1NpGsFFJNPXtbnyGpvXHl91jrfHyXyiwmxQ8Y0K+PaM9DIjwwMOaWcu0HnuBbzVD/jaQ2q7veBwuYUj6falGlfKWu1wUg5Da4sNZAVG
X-Received: by 2002:a05:6512:1594:b0:52c:cca8:a9fb with SMTP id
 2adb3069b0e04-52cdf820956mr7108544e87.42.1719339152174; Tue, 25 Jun 2024
 11:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240625040500.1788-1-jszhang@kernel.org> <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
In-Reply-To: <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Jun 2024 11:12:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
Message-ID: <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_111238_852674_0241ED36 
X-CRM114-Status: GOOD (  14.98  )
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

On Tue, 25 Jun 2024 at 00:22, Arnd Bergmann <arnd@arndb.de> wrote:
>
> I think the only bets we really need from an architecture
> here are:
>
> - __enable_user_access()/__disable_user_access() in
>    the label version

KCSAN wants user_access_save/restore() too, but yes.

> - __raw_get_mem_{1,2,4,8}() and __raw_put_mem_{1,2,4,8}()

You still need to split it into user/kernel.

Yes, *often* there is just one address space and they can be one "mem"
accessor thing, but we do have architectures with actually separate
user and kernel address spaces.

But yes, it would be lovely if we did things as "implement the
low-level accessor functions and we'll wrap them for the generic case"
rather than have every architecture have to do the wrapping..

The wrapping isn't just the label-based "unsafe" accesses and the
traditional error number return case, it's also the size-based case
statements ("poor man's generics").

The problem, of course, is that the majority of architectures are
based on the legacy interfaces, so it's a lot of annoying low-level
small details. I think there's a reason why nobody did the arm64
"unsafe" ones - the patch didn't end up being that bad, but it's just
fairly grotty code.

But apparently the arm64 patch was simple enough that at least RISC-V
people went "that doesn't look so bad".

Maybe other architectures will also be fairly straightforward when
there's a fairly clear example of how it should be done.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
