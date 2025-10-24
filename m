Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8CBCCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXsYdgjP+37EqEszdeY1AeYB5FoNinFwVYr7Q+TouvA=; b=tFzkp1pgklZT9l
	7+zl9ZWzJ32aKlWKhHt/euVwuqwTGYH/aTuide+mJY9U/FFABLXY5PardNMuBY58Au+oOFAQVwCsd
	ewQTviA4j1vjHtvezJLbjFNZy/cEtuWjraDW1HIRNd22Upyt+HpAonAObHoP8szQsjHhgHy1sF1yf
	OAzyND2nXNuRz8pFrI/Z+wAAsfjrAykKrmHEs+oYNSUxSQ3hi+8UfM5FP8tMMYHvCWjeSa6qifJxl
	bALyIzFyAGwXNxApGFbSCOhr4w//ZCKuC47zciV+MpcrbJ/Q1ZD9QrqqT/pjFUnC+loyW3g2Rh8e3
	6tFyw0kwi2VsfZVuD5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4e-00000009hW5-3mqd;
	Fri, 24 Oct 2025 14:47:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4c-00000009hUR-2ozA
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 14:47:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47106fc51faso26655515e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761317241; x=1761922041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
        b=UvSky8xDQrQvkOuQ19bRryibQcuZtF9FFmn65yfaQZiIWv7FggceOuPQbQTYzNnE3W
         IYT3SZ+jBulRzPaETjcTx3bxQyxPy/BJ8gPAXlqFImJ5hrR0rrKXQK5nBlPbLNw0vK2v
         rF0xeaPI2CQFClo58rncpqJ5NRykcETYbM+nmWdfo76uJCtEtgHyFT6lwMi3EITVrva+
         clEig3Jb9ysX93VkXwOSI7KPdsdm2vObBpekZgLYA5VQGLBwSmu6skGD/g4ZP/kvhE/H
         T1a8SIp2SUSgQ941rFOyN/sgkOpODpkCIiUDXEgQ1RLErkA+0Z5joo3XmRZ49gsXj2XP
         56cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317241; x=1761922041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
        b=b8IoW+rdeLnkLPWvGCXnb/sX/g30ncCVe7ci9w5yAGKYHpcX4BT87HpgXnil0jUi83
         H4aGew+AFn3LAg5WnA7d4mXaeA/tsNhkQDSjRH1Hhk1O25WGvcuv1+OJP480BswGW7RA
         yeFhe2AFYlrPvGfgqSvGdrSr/QJ1NodZbgFFgKkztnLt9EXbnhSS6PHcS2Xfw6eCnxGU
         zn5oe4sWec+IdNOrzfGP3G/j60VU2WUWzVJah1sPs/tejQzHR55oNK0ox8iJpBPKRKBr
         eC+IuPBSAcn6UAMj12V3sPTwqQJWLYN9mZNL6FWCZokTpkkaTbb7dMwd9hNXa6BWTr00
         YkNg==
X-Forwarded-Encrypted: i=1; AJvYcCXXNeCOL+Cn5iDjmZqFwZCi4i3pw0B4YXJVFxx2NcWzuclw+pYpoT43n1oRkq2Wb11+aQQquZYHATSXyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTf8S5blFsXofFrSryIS+kGLm5UK9YZhySyBDsBFjQKPFvf4Wa
	KHY78eRvs+0tAQdhkiA6t3OBf3sFqlPiygvGHd3z6E3NbVpX32oasiJd
X-Gm-Gg: ASbGnct3dG/YAVh3vsZ8gn1DISN/vhmb+Fl5RUuLh6UuXS2QMqFvZfkDlKJGEsKLklO
	Fb7VghPzmSdbDN8lw6Kchfi9Ds00xwBsvb3AQcbArbQSpolYtEsQbKffJoQT1507kLJjEP4c0KB
	aZiAtuANHzsOIEwzPqMmB5YI2iEF36hxc/77iC9kb/kUB7YnFTBD9tBz7Fe1S5yWvj8TgRlC2Ws
	nj3AhzzgnwCHSR1w0ivMhL2wHrPmMxu76qcW7LeB3O+sGwi5v8b4RVpXGjdX2TBeGoV3OCZCHml
	0JWPerc0cm/IJFcJUhNbU3JRitQ9azqRwAQ8njK/SE42KybrTCGFLp0QRu+sgmMaUEFCIVCvCFg
	1lgmPdcEQXI6yYklEiXA1JA4r4Qnd46J3MyuPDgh8ck+QX2+gHPUqUJi2bZFlfZZQptpIJzUNoH
	TddBMAldJy1Axxe6KdXT6j17IY49S5k6VA417/J2oPrkGqT4lsnePT
X-Google-Smtp-Source: AGHT+IHTEaO13+9fHR05oni62pNnB6SFZLHntJBdSUcQjV2Scfibpu0XNA7qJvhSpMY2WZf1fNFglQ==
X-Received: by 2002:a5d:584f:0:b0:428:52d8:9680 with SMTP id ffacd0b85a97d-42852d89820mr8617704f8f.18.1761317240510;
        Fri, 24 Oct 2025 07:47:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429932cbbb0sm514747f8f.35.2025.10.24.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:47:19 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:47:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, alex@ghiti.fr,
 aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, brauner@kernel.org,
 catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org,
 x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251024154715.577258ef@pumpkin>
In-Reply-To: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
References: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
	<20251024051653.66329-1-kuniyu@google.com>
	<ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074722_720856_457FEC51 
X-CRM114-Status: GOOD (  21.97  )
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

On Fri, 24 Oct 2025 07:05:50 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

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

access_ok() does contain a conditional branch
- just waiting for the misprediction penalty (say 20 clocks).
OTOH you shouldn't get that more that twice for the loop.

I'm pretty sure access_ok() itself contains an lfence - needed for reads.
But that ought to be absent from user_write_access_begin().

The 'masked' version uses alu operations (on x86-64) and don't need
lfence (or anything else) and don't contain a mispredictable branch.
They should be faster than the above - unless the code has serious
register pressure and too much gets spilled to stack.

The timings may also depend on the cpu you are using.
I'm sure I remember some of the very recent ones having much faster
stac/clac and/or lfence.

	David

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
