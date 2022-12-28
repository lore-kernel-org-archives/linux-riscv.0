Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ew0dpZN5sT69+jHEv8yxkdjU8tDvmB6ujQ6J6YlwSAs=; b=h+8wWeI3Nkpp3W
	rL0tKQfTQoOMn4/ge7/+gHVhwNK8FDz0t48U0N72IMUNSvgPcn7e1fz+fL+bDnI26vUWlR1YSBfhl
	A5x8R25kX+EDvSor25n+tfte/2mlXCrWNl89J8ZSGTo3VgJU9FvGbCMhN0tZgwc7OtbtvbrK+uKOK
	hNpmFcdfsR/2ohlrxk7y4UUtixFihaYeXhGlFbKQ71dtSSxd+kLmm8HRihD55hzGWFK2r2LQ1JHYr
	uSVhKpRRq33CbQZ4Z9XlMNbagtNumZ81S9LwGhogm1pW/ym0IT/SePHCFCk4a9FoP6hEW/F0aan+N
	fSzu3gyBmFvWPIxbz0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAU4I-004ENQ-CS; Wed, 28 Dec 2022 10:53:54 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAU4F-004EKi-J7
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 10:53:53 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 203so17123980yby.10
        for <linux-riscv@lists.infradead.org>; Wed, 28 Dec 2022 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VYOrDaVPNtLJtH5uQsxA5/SQ8gOQzjZNBqZBKz0xxG0=;
        b=ILJQ7viatc/sWoyOI6PgtljXBOzmpwzBfQDAilKs0B6lwQrjq5HL7DwvwtpULJvt+1
         VQiqR85zvOp65xAM1/XCEnF7K2ODOUqj3WaYZR8wDgWyA3svNDGXdDbHeflF1uxVF1AQ
         u8fT/3Do0CZWgdttJ9tx9iDeOYe5qyzDCiw7O2L1Ig45+LB8MW5X4fsn5lsRogFPFPtv
         sOmyIiwDBYDPu+u4ktRS0pSJfr1kJds5ARUCYc0mfpI08EPrQxFu26EHhsDo0fEXkZDh
         blZHc/AFCwjcNQLp0v7r+fWkgujkFDa13YnVy6Z8h3VTinqJGNGW8dJxdcyz6doOZchy
         YOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYOrDaVPNtLJtH5uQsxA5/SQ8gOQzjZNBqZBKz0xxG0=;
        b=wlO0EGCUgL6lO8FS098N5MU+wHdVZIsr02wOcoqWbHPsAsJbsQfv+qWSGWPbe3hqh0
         MELQwfI0Q/0gByW2bgT/xyHt02Sn58jxtgl0YJWDddnDQbiTQGKx+LdWZWZuScJaoJX9
         EAUQ2DgTFHmFKeBBS/C2SbfE8LWr4EYR4UozkE4Mvmk4eO2A/CKB5Em38ENkRvaU3057
         1p6Deb4IZnWyPUFKfHmE+ZuUAkzLeFQEDQz6QVGSJe0uFOP3CthQ1oRWfBcjkItRb0+5
         swQ26r7qzN9usoyxQxxsFmLFyvilAEnVsNjxkW48j8xnJ4t2dZZbJJB5O9md/eORKMZv
         9egA==
X-Gm-Message-State: AFqh2kqLssGlgASF+b1xo8/xc1lkPn/7HKkEQU1OCQqUPdkjuBHdELwi
	1OcOHs/9WeJu/46rjkDhWAM0Dw0HYS5+Il4zjPP6Ng==
X-Google-Smtp-Source: AMrXdXv/GrM455c4rEBnKdZooiFGmjG1NTCk/v2lDmwd21IG3IVAcgpI6Rtyppcz1ffeXX4Ot750lfNJRV7K8y/bRWY=
X-Received: by 2002:a25:eb10:0:b0:6d3:bab1:8d32 with SMTP id
 d16-20020a25eb10000000b006d3bab18d32mr2467180ybs.541.1672224828642; Wed, 28
 Dec 2022 02:53:48 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
In-Reply-To: <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 28 Dec 2022 18:53:37 +0800
Message-ID: <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Szabolcs Nagy <szabolcs.nagy@arm.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>, 
	Andrew de los Reyes <adlr@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_025351_696705_308A3618 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, Dec 23, 2022 at 4:28 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
> This approach looks perfect. Lets productize it to fold this patch into
> the respective patch(es).
> We would then need fixups to not unconditionally enable V on fork/execve
> and hook that up to a prctl.
> Let me work on that and provide something on top of your series.

Hi Vineet, I have included the approach into the Vector series
according to suggestions, which makes it formaler than the PoC one.
Additionally, I picked up your prctl patch and added a kconfig to
compile a kernel that won't unconditionally enable V. Please tell me
if this does not seem right to you. I will submit the series if this
seems well to you and let's discuss some more details further in that
thread. Here is the tree, thanks:

https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13.1-newapi-prctl

-Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
