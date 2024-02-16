Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA38C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRo3qfX09PQV1fPxp/hfaO6eIlb6J2xwZLcaIZ7k0Q8=; b=jwxKHasj9htJP6
	dezFBeCgNVIwlUIwWp9XSHWBGOwe1FzJZZUqLmR3Tsu6+NuUiRXIimrkaS7GRJJdCnyJkJwrJPSue
	PspTBYca55bgEEQhXJBe1u7ee09qIlXLKvrvJIOH8iKsMxoJblEmQ4E2UsUhL1eXwNeXt/doa1Jza
	yic3eE1GzfQQ5SOdelgdaSHgievuP9nT9mLNq1aj7AD5V/U9Mm9x7QzND2soti6vYQ6KfnvlFscPK
	aqULspxUxNw7KQNUHn34K07BVOKj0XpdVDLuGCcU79s02/RHOxzhJ4QpptEJO1zkZNlwwNrcwpf+8
	vAReeOJSCArhyEi5i+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5Or-00000003l6F-0hAO;
	Fri, 16 Feb 2024 21:05:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5Oo-00000003l5o-2xwo
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 21:05:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a26f73732c5so187352666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708117533; x=1708722333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=shgZmNUDjmgRe3frEU74jFBqUA2SGxRFjX4pA6qgQys=;
        b=jHNUWyL+4j0u2I0sZRnePGMU1phFJ3XLec5ZZiDRvc8dIIJEf3VVd5bHCpp8hYXAqW
         CRdNwkUgtuO0/EnYYMj+obDIawNeNHIgDgIUsES/UXm/fP3W8lG4R0SJJa7CXcpxWl/I
         Gvp4wkn8UqcsMzuyZJTzfsopc4IusXyIazzADzj5F4YQ7tj/dZdhhfF/ZnF46+lcOTiH
         xwPyFastJPZeO1lW2gA0b0kZl1A01tBEJRDpOjjlqqvbgsKG2+YnI4iDRxCAfMYr3fty
         9jW59s8XALrXkmJKH5wkwKSn/5JLkIHcdhIUXHfwlmMz8fheF49YeJPz4MnWDe07e5yR
         2fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708117533; x=1708722333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shgZmNUDjmgRe3frEU74jFBqUA2SGxRFjX4pA6qgQys=;
        b=mEvXUqd+ae247hCr/5WiYCucrIUw9tqGgYBqa+b7Q5dNCiB7srd5uSdECQSqqH+3Bb
         0a1AoCpI0nC3EAev7WDJzCucUjW8VFscrtmXcXHrp8TOjY5wZ8/LaFMxwtKeqHVIe8tM
         MNcZfpVfTuAbZxe0jLkoMhgJAbQL+ahnaPFhBZj6CAFi6M+R7iCf10YuzgZIZ3opPI0h
         j3OYZv0abZRdmrFOvNU6J4tUnV9e7ydrMlxNvAzXRnqzEPeelGoVNraJtXTZNo1X2A2D
         Dwak32u8NuPzZgyCcUyosA5yOPKF8P4p26dlMwyjGHFwfjA+2JI+ylXgvFReiTfXokdf
         niXA==
X-Forwarded-Encrypted: i=1; AJvYcCX1c6HkTkno1xJPLSeOpuDv5ODgHxEYWFSv2R616JQYNLjrc6DgAUv2WqCo+lv7i3tq+4iEfIfSAkn33aCqJh/7/4ZlaNH+xgqYLMJCSOwW
X-Gm-Message-State: AOJu0Yy5g6YGFY2W0gLkmoB8+sPau6PNbmXyPhuz8WL2jDN1OryNaxIe
	7P4eIcmVrQRmgoEw77qQwsVI3W6YJcb+MCTX+V9mKlKAIxXtIphH
X-Google-Smtp-Source: AGHT+IHVZYJGn0cvz6Sv6SWm8Y4imXPZlRLwn80Ognqtd4Py8wzXOlhGOcYZENg07BFe4Z/vpViEjw==
X-Received: by 2002:a17:906:c40c:b0:a3d:568:966e with SMTP id u12-20020a170906c40c00b00a3d0568966emr5022351ejz.6.1708117532761;
        Fri, 16 Feb 2024 13:05:32 -0800 (PST)
Received: from andrea ([31.189.39.37])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709063b8800b00a3cf243de37sm331704ejf.111.2024.02.16.13.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 13:05:32 -0800 (PST)
Date: Fri, 16 Feb 2024 22:05:30 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Eric Chan <ericchancf@google.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] riscv/barrier: Resolve checkpatch.pl error
Message-ID: <Zc/OGnjVKcCuKNA5@andrea>
References: <20240213223810.2595804-1-ericchancf@google.com>
 <20240213224000.2597959-1-ericchancf@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213224000.2597959-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_130534_807661_FA6050EC 
X-CRM114-Status: GOOD (  10.25  )
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

On Tue, Feb 13, 2024 at 10:40:00PM +0000, Eric Chan wrote:
> The past form of RISCV_FENCE would cause checkpatch.pl to issue
> error messages, the example is as follows:
> ERROR: space required after that ',' (ctx:VxV)
> +#define __atomic_acquire_fence()       RISCV_FENCE(r,rw)

Not the "best" example, according to Samuel's feedback and the diff
below.  How about something like:

ERROR: space required after that ',' (ctx:VxV)
#10: FILE: arch/riscv/include/asm/barrier.h:28:
+#define __smp_mb()	RISCV_FENCE(rw,rw)


> -#define __mb()		RISCV_FENCE(iorw,iorw)
> -#define __rmb()		RISCV_FENCE(ir,ir)
> -#define __wmb()		RISCV_FENCE(ow,ow)
> +#define __mb()		RISCV_FENCE(iorw, iorw)
> +#define __rmb()		RISCV_FENCE(ir, ir)
> +#define __wmb()		RISCV_FENCE(ow, ow)

This would go away per my comment to 1/4.


From a less technical viewpoint and FYI, an unwritten rule of "working
with the Linux kernel community" is:

  Don't forget to keep people who spent time reviewing, or providing
  feedback to, your patch in the loop/in Cc: in your next iterations;
  they might be the only people who will be able to provide feedback
  /suggestions/help in your future life.

;-)

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
