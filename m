Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F99CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 05:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XWuvHpas96V/ewaplQut/lV0qgX7p7pqgM4Uon93Yck=; b=iQq8LHxQ63g9xwxa+U9Pcd1CTp
	YfbNqOf5STvU8PZW6qjLck7mkqtVCi8lY3RnkFsX0OhO/m+GPy1AQF+0dFcwCZV4ZL5l3NPc+Q2yG
	8cfdK9nNsrbttAWgJWLGAwpKG7tHoT8dFeq9t6RpJsuHi7VUAJFn51XIbFs4daOTNfHwISvdq4mXh
	l/XWqq2TmuEXDS4MCjP+DxccgxyaQNeKDopJkhqeY+edaWOwk57lNwpI570WsuJHZk9chWtGdara3
	JLVInxpZe1qJmQteXF3CqFxRh1+JqKtw0++9J2vYqP7pTrH18r4d90MJCsskbUExsdzbAtrqSkaC0
	PY+oWuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcKu-0000000FGpo-3ZO4;
	Tue, 28 Oct 2025 05:33:36 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcKs-0000000FGna-18Y3
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 05:33:35 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc08so12912641a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761629612; x=1762234412; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
        b=A47tz3i//SGCwR/+cn4MJsiMi6DCjluk4i/88FJ/DhF731qpUeW6PAejde6gw8fb/h
         rCbsXah7q5N7HMoalTcgXbYl4jiLKTlLn380//eDQ3CCgTlOzRBWW9M0xCR1Oxg1mttb
         EqHe9galdFygNKrLyYPeuTJJyUKWKL/goT58iFO3iKjSpeXiZkaTODEbWANh8h6QAZ6U
         AhVVChJNDkBKwf+rackHjMxiLXLNfohKqZ3hBwi2JlYxfImE7n6PgjcM92W4DY2FalHZ
         +GXz+U5XicCcPVIQFZaVLFRuDRCMYGkgAuAXebVFXxdyXD2m/h7ELhJrk/9XlfbsFuaR
         pI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629612; x=1762234412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
        b=iwDizp6eGD76OqHiyRifUPk4ZfSaCr4IOdG/OR1qDZp4n46Sns3mQBbQO28O8Fgbel
         QKSn1mXkezOdxai3jqS5t3iuDzMoUHmHjKVU0OdBOfvP64g5TWff2QhqZcDYarAilY2s
         uBmmxnfkh21LTUzOxQ2eXbsmFVTYCCeYaQZe8gb6UoFXp4/kvurvsSFSQy11E8W/Wuc9
         KUFqsK4E5H4oMyETXNeiKcwwuIryD6rkxCZxxai9BAzyJ1RBtwJg+eboIViy9oWlU9Rf
         xIpOHWbtMXFyhRMBIxONvPbgkFknyNZ4NG20/5KyPGG16/x3ECUJboFPTzD5RPD7bUIo
         fQxg==
X-Forwarded-Encrypted: i=1; AJvYcCVVvOBTjMcibyzvYb8CS+4mihbysZwRWl413rAlnm9uq2gBYJU8kgVb/mhthb288abSDmWXlY/PIUe5mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhyc8fK4iKXeEZHLR2E18X+X6gAlxuKK6iZlUYaNFWqA0Ka1sr
	jTRLnZVUC6hfdfnZk50dW3V4yer9GEf/gU/XsvPzpQCeVSvhYX/bcNnyimJ+SQ/xyf8ksEbX38Y
	ZB0v9Bw==
X-Google-Smtp-Source: AGHT+IEgPd1Vro8jar4YuvbY14ALahZ9RGAW96D7MCTDGrIDbCO1GDP/qete02Qehy0msaJmFvHad1jiwWY=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:33d:98cb:883b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2290:b0:273:ab5f:a507
 with SMTP id d9443c01a7336-294cb394740mr35360685ad.21.1761629612502; Mon, 27
 Oct 2025 22:33:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 05:32:13 +0000
In-Reply-To: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
Mime-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251028053330.2391078-1-kuniyu@google.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: dave.hansen@intel.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, 
	brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_223334_313935_9089069C 
X-CRM114-Status: GOOD (  17.78  )
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

From: Dave Hansen <dave.hansen@intel.com>
Date: Fri, 24 Oct 2025 07:05:50 -0700
> On 10/23/25 22:16, Kuniyuki Iwashima wrote:
> >> This makes me nervous. The access_ok() check is quite a distance away.
> >> I'd kinda want to see some performance numbers before doing this. Is
> >> removing a single access_ok() even measurable?
> > I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.
> > 
> > epoll_put_uevent() can be called multiple times in a single
> > epoll_wait(), and we can see 1.7% more pps on UDP even when
> > 1 thread has 1000 sockets only:
> > 
> > server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
> > client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
> > server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp
> > 
> > Without patch (2 stac/clac):
> > Udp6InDatagrams                 2205209            0.0
> > 
> > With patch (1 stac/clac):
> > Udp6InDatagrams                 2242602            0.0
> 
> I'm totally with you about removing a stac/clac:
> 
> 	https://lore.kernel.org/lkml/20250228203722.CAEB63AC@davehans-spike.ostc.intel.com/
> 
> The thing I'm worried about is having the access_ok() so distant
> from the unsafe_put_user(). I'm wondering if this:
> 
> -	__user_write_access_begin(uevent, sizeof(*uevent));
> +	if (!user_write_access_begin(uevent, sizeof(*uevent))
> +		return NULL;
> 	unsafe_put_user(revents, &uevent->events, efault);
> 	unsafe_put_user(data, &uevent->data, efault);
> 	user_access_end();
> 
> is measurably slower than what was in your series. If it is
> not measurably slower, then the series gets simpler because it
> does not need to refactor user_write_access_begin(). It also ends
> up more obviously correct because the access check is closer to
> the unsafe_put_user() calls.
> 
> Also, the extra access_ok() is *much* cheaper than stac/clac.

Sorry for the late!

I rebased on 19ab0a22efbd and tested 4 versions on
AMD EPYC 7B12 machine:

 1) Base 19ab0a22efbd

 2) masked_user_access_begin()
    -> 97% pps and 96% calls of ep_try_send_events()

 3) user_write_access_begin() (Dave's diff above) (NEW)
    -> 102.2% pps and 103% calls of ep_try_send_events()

 4) __user_write_access_begin() (This patch)
    -> 102.4% pps and 103% calls of ep_try_send_events().

Interestingly user_write_access_begin() was as fast as
__user_write_access_begin() !

Also, as with the previous result, masked_user_access_begin()
was the worst somehow.

So, I'll drop patch 1 and post v2 with user_write_access_begin().

Thank you!


1) Base (19ab0a22efbd)

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2184011            0.0

@ep_try_send_events_ns:
[256, 512)       2796601 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         627863 |@@@@@@@@@@@                                         |
[1K, 2K)          166403 |@@@                                                 |
[2K, 4K)           10437 |                                                    |
[4K, 8K)            1396 |                                                    |
[8K, 16K)            116 |                                                    |


2) masked_user_access_begin() + masked_user_access_begin()
97% pps compared to 1).
96% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2120498            0.0

@ep_try_send_events_ns:
[256, 512)       2690803 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         533750 |@@@@@@@@@@                                          |
[1K, 2K)          225969 |@@@@                                                |
[2K, 4K)           35176 |                                                    |
[4K, 8K)            2428 |                                                    |
[8K, 16K)            199 |                                                    |


3) user_write_access_begin()
102.2% pps compared to 1).
103% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2232730            0.0

@ep_try_send_events_ns:
[256, 512)       2900655 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         622045 |@@@@@@@@@@@                                         |
[1K, 2K)          172831 |@@@                                                 |
[2K, 4K)           17687 |                                                    |
[4K, 8K)            1103 |                                                    |
[8K, 16K)            174 |                                                    |


4) __user_write_access_begin()
102.4% pps compared to 1).
103% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2238524            0.0

@ep_try_send_events_ns:
[256, 512)       2906752 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         630199 |@@@@@@@@@@@                                         |
[1K, 2K)          161741 |@@                                                  |
[2K, 4K)           17141 |                                                    |
[4K, 8K)            1041 |                                                    |
[8K, 16K)             61 |                                                    |


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
