Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D9C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EntL8vfFqxXSkjCiiZwY2bp4AAASQQyArEp5qVj/m4=; b=uHjGSoi36qHdTk
	dmsmYRSUfkZ1CkHYqHvK5deqfuh8Cvkyjt/YCsu4CjZm9qbvPVOsckYmInz/6MBqGLhncOr1nf6iC
	xSORsUTzfHl/98je9usKgoNyFadbgUgfsC1li0dNjqY9MFs9W9dxaQqM5hD9WNdaQR7X7V2efzXj7
	xWVZehCw4ELdSd2RrM/uwNqT1cAIgV0jah45HALmtcok0T5kp5nq4RVGijRiR2sAwZMsqDmPwZ4Rc
	hk1JzwB5q5eNbIcmmeBALOhDzi5BTpquUyTCh67YxUuNqCasNCvGJzUHApd3S96o5ER0OMKWD7jgQ
	IG0jUXug/fdQicjpLe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okUK5-00E6y9-TS; Mon, 17 Oct 2022 17:54:45 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okUK3-00E6xG-2S
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 17:54:44 +0000
Received: by mail-il1-x12b.google.com with SMTP id d14so6225048ilf.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Oct 2022 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weq+CxDWSCXJPl3M3OxO2N9/e6vne8TY8uzW2UQCOZs=;
        b=Jn/zFWhbz7kNqKqWD8dX/aKe2nPuFSDBgFjXjcwJ0dT0ySbcGWbe0k1zvFTrd9fpgB
         V9CfbAac10l+oNB9JkLRVSyf8lYdEfRoHaA4n4dAvgO2STAjpawVz2GBmJVI1PF+uYfA
         S1aGbQ/m201uawZI0Rz8IB8gCuE7LuJaEnpB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weq+CxDWSCXJPl3M3OxO2N9/e6vne8TY8uzW2UQCOZs=;
        b=rRHLaSZLF1dofiTfmROIr+11mZ9EQkRhetZgYVQW4vrJgWD+UGi5mtriCkwLhsIO9r
         wil2vg08zyyb+aJb2YuZQ2ygih00c1eTTpGhRubFRkWsEVphhZqane16h7zPr31F/Ahf
         kqfXIu5bJTVE4z45e9iBwL1JYUMR2xLQ1JBBhy/2pcyNfhW5jPaXldzxvpKKpSb0sQP5
         nyWTMni8ro2iNWOXMOfCTRiAjdVPJ1EYHubjMZ5Ot083BgM2UtyA3+wn4828DP3zKh4k
         VQtwoGbRe900eIuxixmJh4U3Rx0epNhNErIA6NPJRDESfh/LjrJASlncMoCqeGsd4XgN
         j/oQ==
X-Gm-Message-State: ACrzQf2W0jeFH/8BHbK2AiabRU82VRQkn+RV87RbknuqimpGlZ75LUBU
	AT7GRi4RHpKO54goBY60EE1G/r1XwjieqeTkXmKi
X-Google-Smtp-Source: AMsMyM7hYFaWEPPhB0V7gM1J196Y8ecfAPeZEPmOZFXymEusnUwf/T7ZmUd+n8IVcbPLkYjQY3L8otmnR1fhNXlS0UI=
X-Received: by 2002:a05:6e02:1054:b0:2fa:a73:cfa1 with SMTP id
 p20-20020a056e02105400b002fa0a73cfa1mr5440116ilj.203.1666029279099; Mon, 17
 Oct 2022 10:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
In-Reply-To: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 17 Oct 2022 10:54:28 -0700
Message-ID: <CAOnJCUKeszH7Q6n+jdvBZkL90b7DasWqoO4VT6QU4-kaZSMwUQ@mail.gmail.com>
Subject: Re: Bug report: cpu_relax call from vdso space
To: Denis Ivanov <denis.ivanov@cloudbear.ru>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Dao Lu <daolu@rivosinc.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_105443_414570_92BDA6B3 
X-CRM114-Status: GOOD (  10.56  )
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

On Sat, Oct 15, 2022 at 12:09 AM Denis Ivanov <denis.ivanov@cloudbear.ru> wrote:
>
> Hello,
>
> Segmentation fault may be raised from cpu_relax()
> (arch/riscv/include/asm/vdso/processor.h).
>
> cpu_relax() may be called from vDSO functions (ex:
> __vdso_clock_gettime). This means that global 'riscv_isa_ext_keys'
> variable must not be used in cpu_relax() directly.
>
> Use of this array was added to cpu_relax() in
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=fixes&id=8eb060e10185cfc97ef0200d197ec246ba0f9f8c
>

Thanks. We saw some other issues with the static key in cpu_relax path as well.

https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/

We may remove the static key altogether from that path.

> Denis Ivanov
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
