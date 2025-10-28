Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5CECCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Hq6e4QCT4/hJGA84O5PKyjknuUNQ6MA1FfXo1rhohc=; b=kvCnE8KZpz8luk
	pnXotQVbFa0YnyhcImWyWvf9D/85rXpl5QSHGLyYJUeFeELjt0hFZ5SPZ2m5KVJr0M7O4zGVTHsI+
	rQjdKg0EtOvyqGrWHV1PsyoVN5mAMDPYxy8DnuYtK4V0+OVDAoQG5rNoFLVE2g+58Y5yy8GlG7aL1
	j7q0CUi0+n967HmQo3RLP5Ao6Z7qnobjBFtSjO0AyUi/ozqcJokJLP0/gfcPovjxNVAaJlpSFMGRP
	xX0/xJXndMBSNqPWgI0rVUH/2Ix+dEN4eUJh/ULl8/ZuZPE0ZDSOndr4RMjWSbUFF12RGrdXI8Z59
	cut47HvT8/LKGgXwR4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkKA-0000000G3ql-0ckI;
	Tue, 28 Oct 2025 14:05:22 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkJo-0000000G3oU-0lLS
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 14:05:20 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-63e330a1360so6525873d50.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761660298; x=1762265098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
        b=BS+N2TaMZ9KTvq7u7VI8pLry4iZ3XvRpd0/waME3ovy3D3yGZhQ0cSbaRhOdWuE6PA
         GWnUCEzArVK1blgEom3QN7Iupnf7ELOb90NFHhianr+kXmcZam5lwxDq8typdTErCCsU
         xK5CoDbif4RI4YYNxoU//j6jLBk8gB8jxEUTQRyvkC6OiiQaHe2vxrnnNkSaUTt4xAy0
         mLj3S+VcmXwo7vcLYfyG+KdO4i0DQLOgocUmQwJn7uZEIQQfNXesHgP2tVDlibQrsBbx
         6ADGEnivA5y84j7zR2VG3GP1zUpzBxzumq8wetLYHETxn1MJ1cJkPfiCCQD6Kj0VBB6F
         ooLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761660298; x=1762265098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
        b=UhzyqRCsMfrl7WPy49/AJfPticSTZhVjzi3iHZDYKKJtvEGtpRP3P3Qxz0PLODA+fM
         DEhg192mBPrh0BVXaBh14SXzuQKLN1/s13k5h2CkH8Cvr9RPntUYF+5wmq8/M9MMZBx6
         0VDwLGpe29UlM4+5T+bBCS2k9+6T1mKiSk17eV6YskPReizNkSCdxhPWm3vSIXUNLE8V
         0bF1eoYg7PUWUp9PljrqNYTJtES826LioY7DxW0FezJsB7rHBeQHBkd2Z0LoGCmEQ0qo
         a3qR6ZgZbU82MYBiGL2vytg+dmDczCZ7dPs0wilcjmA1np5mjgFUF3RqwuPOa9PQo8E4
         WPBw==
X-Forwarded-Encrypted: i=1; AJvYcCWKoHgY4Rso3j+lKXjAzKWaf7AfKIMlOQiVWmQpsZCR2ThdZWMPTE1s+b4nDl99tzsEBAcZI3D/fiqsAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCQCQ0j0ua6VHOFzWYybP8DKdnqLVEo/RenvTErjea7pPZiasC
	tAOMXNqHjhIBtG/Swq0ckvyX7EYeBrc+MozO3hxYcp/ccVH1uDs+LRDyTXrkby1HyntEq1Ww95w
	zG5XbBnwTXgytvRYLafeSmsUDri4coes=
X-Gm-Gg: ASbGncuDWIViyw+2n+huw+tQ45RRMYl0Gcetpg7a9rc7UKMctxW2rbVypZa9RtS90Yw
	aVroH2/VEWyg/hCwOzLQUA6U3nmk1QS/2rEkkXaFHdmn3TtmCDoCEFaDnB+WOx7brU95025PBHl
	it9RGlJnAAuPH22KfDg2mRftFJtME3pGWgJ9SXUlYgEsqOMhYb8BAB5fUJBkmj+edRbMTxEc1iH
	DX9JoiGvRwmCA618j1SrpRY7+XtuihcWCBW6epqZdvt9P66NYgrHT0wdd3wvC5iU9XihQfWsqMC
	hgtKO1Zv7znpZLebuQ==
X-Google-Smtp-Source: AGHT+IGO59IsEPrMaZUmuz6Z8HqEjQzA2Ntsc7bvDVyVXUheTpOGkWA4zrFX+wmhIbJUO+iBKxLOdRdY9YaXu1dEED0=
X-Received: by 2002:a05:690e:d83:b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63f6ba849bamr2974242d50.44.1761660298140; Tue, 28 Oct 2025
 07:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251027083700.573016505@linutronix.de> <20251027083745.231716098@linutronix.de>
In-Reply-To: <20251027083745.231716098@linutronix.de>
From: Yann Ylavic <ylavic.dev@gmail.com>
Date: Tue, 28 Oct 2025 15:04:46 +0100
X-Gm-Features: AWmQ_bnQq8Ze7k4D-80utHvwT6MTXau8I1_bRZ4nLy6wJZW1-jMkY-uZGE3OIrk
Message-ID: <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
Subject: Re: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_070500_221380_D3686C26 
X-CRM114-Status: UNSURE (   8.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgMTA6MzLigK9BTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4gKwo+ICsjZGVmaW5lIF9fcHV0X2tlcm5lbF9ub2ZhdWx0
KGRzdCwgc3JjLCB0eXBlLCBsYWJlbCkgICAgICAgICAgICBcCj4gK2RvIHsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAg
IF9fbGFiZWxfXyBsb2NhbF9sYWJlbDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICsgICAgICAgYXJjaF9nZXRfa2VybmVsX25vZmF1bHQoZHN0LCBzcmMsIHR5cGUsIGxvY2Fs
X2xhYmVsKTsgICBcCgpQcm9iYWJseSBhcmNoX3B1dF9rZXJuZWxfbm9mYXVsdCgpIGluc3RlYWQ/
Cgo+ICsgICAgICAgaWYgKDApIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICBsb2NhbF9sYWJlbDogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgZ290byBsYWJlbDsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgfSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gK30gd2hpbGUg
KDApCgoKUmVnYXJkczsKWWFubi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
