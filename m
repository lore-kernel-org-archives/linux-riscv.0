Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B65EEAA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyLmQ8IrqPb8fCH8MASRubRWczHCHWx1gvxCCGWUHCU=; b=osp8KNLIwKoib5
	klMHrLs6GiopCFXAxo2AgaTOl/wdkTdnrcyO5JkgRt4CJarijy0G5B2MTCOjC6lyjC//nA4zfNJKw
	OVEf/pX06v/5XaFtA8WfYcgYgt2A13Shs6QE8T3YaX/ficp4wdiz1KgTzrKv/+rmg2QeTs0s8imS5
	V53ij/cBKNop/5NyQwqezuABMhAIxXalelatBhZtnHUfSPPPEVNeQ9yldvE77RVnKJwrW57SLa8iO
	v5dK7w34BbustErTzjRQPThHxUYpJG/rg3yil08jVE6fOlGzSzkaXVLzteR4bRQvvLlWX/u2KY1dP
	ri45pMgLFoK75YDWprJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxwI-009Z4G-2I;
	Fri, 15 Sep 2023 01:48:10 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxwF-009Z3n-2e
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 01:48:08 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a76d882052so970560b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694742486; x=1695347286; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0FFekWGyUIP+/QpzRxD5C04IppzIdAo52JFOT6ol0w=;
        b=Me0+D/4Mtr9uDbYm6ZT39VUQDJAKDayiG5Y4JamKAwndvNkF6fANGJZqYkKqhuYaTy
         HtUYRtXTSmsHm2i7+QHf79ZQynAlzswymEZLEmtAHqmkSpfxqwGVxG7QWRvUe05sbwEQ
         e+t/nuq8LBrv1yzReRbG6kO5D6bJNTGsV/Yl1gmZ2wgy4QMv/zBqkbbRwyjZS0/BgmxA
         uPBUPqBVuGJNnjJFJMqR9bYwFmU6vrg2W/m/E2iHL/L5KRiht511YeHKYVZQ4L3RIwL2
         lIZ2A2DMDBiz5l5nxwvFs7Y8A/+Fy8qPGyGc1ttx0v9akbeaYRbef7yquwpSnxwjiSvP
         v/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694742486; x=1695347286;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0FFekWGyUIP+/QpzRxD5C04IppzIdAo52JFOT6ol0w=;
        b=iu3tMolDM3VOjKlZlKFYozUxBSfX1aKk6z1PWqh6rQSHQnX+QP4McK+BezQUZX9cMe
         SMNb+BYJ6LdNyH9ROWkdRe+mWFh81xBeg5fOxqBuU5wppZw5VUx4FexQijgNafpQX6B2
         ljHqLf+zxC3T+QR4rNiaFWjB5USt1ayBNnreGrFUjGl7Vrd4KYrk/Cz3AG6WViclqPM5
         kK7viABBJnSMOlxt+Ti804MVra+zdCqg+WtFEbqYMwtAphrhOy+AWr0oLch67KRolMy0
         iOMjTlpMnWYsJyKy2LZv2pBPFUo41cFXpo9qpsq8lbSiZ7cggR5xjR5ySA+q6K5svmEs
         etZQ==
X-Gm-Message-State: AOJu0YywpqQCOoV18Zyf2kLhfySsfYuvLC8+D5N8ZT23p1uaN6LiK4En
	lFh9W+J8yyrViOZTAfkP+LY=
X-Google-Smtp-Source: AGHT+IHMBTg3s39w5nzKGtWCSn3FgFj4ijDZgoj1j8XZ4FGFvetP6Mq79S/qKyPMIn9/Up2tlE9QEA==
X-Received: by 2002:aca:2218:0:b0:3a8:5ff0:6b52 with SMTP id b24-20020aca2218000000b003a85ff06b52mr341083oic.15.1694742486434;
        Thu, 14 Sep 2023 18:48:06 -0700 (PDT)
Received: from ?IPv6:2402:7500:5ce:c546:8426:5e14:d5b7:9128? ([2402:7500:5ce:c546:8426:5e14:d5b7:9128])
        by smtp.gmail.com with ESMTPSA id m21-20020aa79015000000b0068a6972ca0esm1905533pfo.106.2023.09.14.18.48.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Sep 2023 18:48:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
From: He-Jie Shih <bignose1007@gmail.com>
In-Reply-To: <ZQJdnCwf99Glggin@ghost>
Date: Fri, 15 Sep 2023 09:48:01 +0800
Cc: Eric Biggers <ebiggers@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain> <ZQJdnCwf99Glggin@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_184807_879598_208D7AAB 
X-CRM114-Status: GOOD (  12.77  )
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
Reply-To: ZQJdnCwf99Glggin@ghost
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 14, 2023, at 09:10, Charlie Jenkins <charlie@rivosinc.com> wrote:

> On Wed, Sep 13, 2023 at 05:11:44PM -0700, Eric Biggers wrote:
>> On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
>> 
>> Hi Heiko!  Are you still working on this patchset?  And which of its
>> prerequisites still haven't been merged upstream?
>> 
>> - Eric
> It is my understanding that Heiko is taking a break from development, I
> don't think he will be working on this soon.

We would like to take over these RISC-V vector crypto implementations.
Our proposed implementations is under reviewing in OpenSSL pr.
And I will check the gluing parts between Linux kernel and OpenSSL.

-Jerry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
