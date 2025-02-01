Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E803C0218A
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Feb 2025 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13qTg7saIpgQ6vFRdbnVPJW8eKyO2+UfLniHh4mn0ew=; b=zf4/mVSSUrL2Ad
	wt1kKGLLQJL7TA1G9ejuyRX9Xs6r3Y7Ll2M577LW4pofXYUastQclmVwSn5ia4tGWYspr5AYyuyW+
	yY9LgtZPUiD7haXepODpcgOEITs2P3cu0GXFvKWduAIpeDOEr/y/OjPVCFTPgxATQw1QM5MuFcutZ
	ghZ3HzVXCS2RUJuxvTn1EaDGu4AcO3WdSjKO45TYVgVxhuuC1I1zf/3UE+lh+oajEkqNF/mkdsCK4
	82O6TIH3Cn+HDJpBnP2mN1ope6ub6FXP5kWPvuCiWNJdXi7opoyitplP8uLkKyrMFDGv8UWqmyeSC
	swpntE7f91kiaV4vOB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te4g4-0000000Br0z-35Qn;
	Sat, 01 Feb 2025 04:00:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te4g2-0000000Br03-2Ieh
	for linux-riscv@lists.infradead.org;
	Sat, 01 Feb 2025 04:00:15 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so7240083a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 20:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738382412; x=1738987212; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zk4WN08CNrpl2CFHu09s+YzfSsVnh8G4cBCTok6rwk=;
        b=OWBZVJBB7EvcW/Rm1kYd8NjvRO7AdNcKlzu9lxK3FLMRXbkCsJ1RM7m7rziKEfhrnz
         TXWWtwBlV+VypFl/VTy8mZtrgxO5fJqyRUD8pHGLlpj/hJoHOjOr9jN70ozqzFojV5n0
         rkuIur1warXIyp6F+gmjzBCPwGVXlpsfL7ias=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738382412; x=1738987212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zk4WN08CNrpl2CFHu09s+YzfSsVnh8G4cBCTok6rwk=;
        b=N+COFX+xZCWcwE0XS5MfJihT5u6WXUiFoXCiNDmk+4K/fSYzmW4RngSt29ZdRjz4fW
         /6sVDsukjsC00s7Kp09+RJv3CYeZOYtLwIKc374xJzooHEsff01ikhsgxztCul6CjG1r
         G7esxPvmTtmn8qZc8A0b0gJ/yT6kjiloUkav7oSH26WXOwGAZGQO8LTh7oTEBy6Z+aNd
         gOdmDo/qkRZH/9o9CUlcHSXo8AfsU3daMiXQAxrreGteYQGjA35N7SPQGW2gaag2d4Ej
         j7H4rmr1XdgUVkAAwLu9vDIniDZblDP6DX+2sYFde7JlGFvJ9d0sFa8LFcwiuzMH4xDp
         hEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8er1P0pX9u+/VMQL9AjjK0XoAvyEZSqbHLuQnMMsk15GjNoZKRmrqr+SVwHlxBskP+XtWW+6WZ9Jn2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR9PP1h4c/8AOn5P9sPzVviEB3SiDpsDOUPxU+i++goqf1St9r
	CHmTaycsxG8gFVYpxab35fQBbcOB2QLSBYdTyesFEY+hhGjIZmEPfhi27pR0DOjXcJaJpNxcXYw
	gl4w=
X-Gm-Gg: ASbGnctSwFahIGcCQHyALwTAntZXlb5BXRakMYsEUoHVcikgKR3AqN2NqWE5R67olhn
	dRzR6Ib9Jgi8kcr2TMaz4Tjw7DJgpVD0EzYqsA/hqKe6im0zM3MD637wDYsaNI4pPfH9VElpYPb
	ofZSsvN8d3CO8QPx7vNCHkgdq0vKkyjPZlfqek8vimWZKuAL1neoxjBEyD+VwUqENk4u258Z8Xe
	UiZVuOlgISuN0TNTxcN5q6wGBlyKnmQR+AbMIIf53ZqeItJcS9RPr6iCj9lOpZhlXrdenAmC9qr
	Xpt91g/r8Sqz6UY1f0DIJBitmWAH94jahtHRMKoFdCqDy42VawHFmjpFRtY8lH3Lkg==
X-Google-Smtp-Source: AGHT+IGpeMYmfLV0ZPBVclmDi2pVqCHhtJ/wLxFQ5gRMEgE7jNXZU1saUtv0SrfvoDp/2yUP8EBRcw==
X-Received: by 2002:a17:907:da8:b0:ab3:61e2:8aaf with SMTP id a640c23a62f3a-ab6f760e28fmr686112366b.25.1738382412096;
        Fri, 31 Jan 2025 20:00:12 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a56587sm391575266b.175.2025.01.31.20.00.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 20:00:11 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so237024166b.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 20:00:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxXWaWmGDb4ctvF+QcsF4AGypqBKFwjlXHpe0W/bxUJMJKjogwI8/WEBJU28rNRVLb9XIVMIhWPC/+EQ==@lists.infradead.org
X-Received: by 2002:a17:906:dc90:b0:ab6:d4ce:5674 with SMTP id
 a640c23a62f3a-ab6f760de6emr713220566b.26.1738382409950; Fri, 31 Jan 2025
 20:00:09 -0800 (PST)
MIME-Version: 1.0
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9> <20250201020003.GA77370@sol.localdomain>
In-Reply-To: <20250201020003.GA77370@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2025 19:59:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=whk5X3s=vRM8-pZHmLLOempVbDHUJKofVhsnUUmHp9YmQ@mail.gmail.com>
X-Gm-Features: AWEUYZnb9RzpYW6_8B6f0D6dkej0i9B545ZoGrtrx0yV0z_972ni3dxKSAkg_Js
Message-ID: <CAHk-=whk5X3s=vRM8-pZHmLLOempVbDHUJKofVhsnUUmHp9YmQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
To: Eric Biggers <ebiggers@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_200014_606238_D639B7A0 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, 31 Jan 2025 at 18:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> FYI this pull request added a 90KB ELF binary at
> scripts/selinux/genheaders/genheaders in the following commit:

Grr. And yes, I missed that entirely. It's the stale version of a
build-time executable that is now called security/selinux/genheaders.
It got renamed some time ago.

We actually have code to get rid of stale copies of that file exactly
*because* the renaming caused annoying left-overs in peoples build
trees that "make clean" didn't get rid of (because "make clean" just
cleaned up the *new* location). So renaming generated files easily
causes stale files to be left around.

So it gets removed automatically by

   ./scripts/remove-stale-files

But that removal happens as part of 'archprepare', and I suspect this
got committed before the stale file removal, and then the commit got
rebased (Author date of commit: last August. Commit date: this
Wednesday. Date of genheaders moving: September)

> Presumably a mistake, or else something a lot more interesting.

Well, unlikely to be anything more interesting, since the only thing
that is ever done with that file is removing it. It's not actually
ever *run*.

But yes, very annoying to have this in the kernel git history now,
even if I'll obviously get rid of it.

Thanks for noticing.

                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
