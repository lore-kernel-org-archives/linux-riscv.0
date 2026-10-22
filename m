Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09946606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 02:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5puBtqh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fmSqPnQ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DDSHDP0ZdXP9GEo1657zLVkXE83uQk7PCK/JSPvrkI=; b=F5puBtqhroMr4A
	2ulPVZa0RK555LFbokefTZ/wkKg6M8zhlak14FzELhJ40/5vuOfMLpstXKlkcfeBWnoXYVkZsIOaw
	xv/EovKGGZuPHjL5jJpFl+py/c5j1N3PLCAjwaodgm7l65nzie/6StyCa5mm9xC6WHnX/QrOCYEvj
	17oImnEdx+M+gB3ESnko7CwpB+iZI/ogsXO2PclEnsUyFNEMJAkqokCjdtGjno5inlAx2UaF9OJp8
	bQmfBSZ+T5x+wtoVGGzZnC4rPeZN6S6HaKvNkiMfft0LDifNjHhnk8bXrgurVIEifkoMq3gI5odtO
	LcvpDEcQi8zfngjdKuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiOB-0000000DBjZ-0nh7;
	Thu, 22 Oct 2026 02:18:43 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiO8-0000000DBiD-0CJB
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 02:18:41 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2607059eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635519; x=1793240319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=fmSqPnQ0QLWSr2PmmyNZBAleGSwDFReILHNzoizJOr3AzR/SQRKaktnvN/zjD7aUvr
         ilC6ZeZ4sIfic/nJITvl4HkbiHFsSGI4wdGkp9Ifa68+xwFlFck3U2PVcmksLbIIF9G9
         3PeIcLyFWxSRKVFoQC0RBcU5OmbOUEwuz3s3/n9PkaJtABsyNwbFnqU2LjhWmXMlyeVK
         Liw363MqMn4R8c8mxbA/6BF4O3Mn6ABpqZPd4vHsho19B5JrJ5cdtLdAsimWG4TFJV9Y
         bIY/zVxnf2j43FDpePmNBZByKrVIXFYtDQWOCQxFWn5Yw0bOxNcKxz11smuD2exo6Z33
         Mopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635519; x=1793240319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=lgEPyQg0bQRGuRDnR5n+cZU1yshD6FuS1FI+JPXNEXEOU/NvTyyQc+WHKpN/ItZD9h
         Ocv16TcRAbQUxCwCkUK8uYQ/ljSvdGfXk9ipbzo4lPlB0v7aLWuKW+Ny4rXrK6VVQzuJ
         fZ6tVSkfGFK1fVt6mUN1nndrqhK/uN2AmYA9h/wUJeO9Zrm8fTBaVr5jDF0IH8x66h95
         PcafrIkTMEaWxfmjEYJKAaRIqNhrbjrRp+pNQ7zcrbUGcqXfEpZNKjJ2qunqMyhNoLFn
         dY+2m+kBacyn72epmKvg07nqinfss4eIy9RFhCt56vb87y4z4Dpz7tQhdp2SSghn8BkS
         dDTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwunS68y1Jy4gjpz9qI51pp8sVZJukWCuKyGsnbSgI4rqCD/HrTxK4mCDd4geRlc1Fh0Qm7apMk18IaUA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIRcBYQGWbo3VIhLEq338y2NNHV3mGNcTvyJyAIewNW48c/YRrZ
	uOcR5sf9KOOrqBrg4fISXB/xrZgI93TJ3DNCYJLPeDWw+ylMBqqCoKWq
X-Gm-Gg: AYBFou1dNIawwJpaZgRy6lxufWTgTFRfyUsUFgipNFJsIfkJJIYIo8PkWAPPj/NPN23
	+uqxXLZa59HOK0FyijDToaKgyGnkUIcsxRweKA2NN/HhV3aYaLEVnDmaTJdU4Ixt+eY3JRg7aZv
	XDum5otIfQvaWJlKytbtGR9ovTPmH4nPAmjqw4/wGcWjsCeFA4g6D6OxLe8N0yOQteyU9iRLAGz
	2YP+VDIH7l9hjZdlfbews9CLgCO5T31+LSU6X2eRZY+QVvvSK/v5H7aa5CJDaSi2CRSsKgfpxYS
	SCC5+JbukpF8I8ZP5wUp4JLQ1po+1h23iSBqSRq3GYu4CO7msWmfkSLZPGT/u9+txq+wHbQSDW8
	Nhy7oBv6RzcWS7N+nYJy5NsWqqwTEO1Lh+hxyK93oTVSVmj71OdHZOQoqCBYaL9iKNJ+/Yf7COb
	3sD/mBiMj8DPXUDse8Nm2VcOpg1qnQb5QzWf0GZQNUDOxC8/lEjAYl4CiY98efiy77Nn6J5janL
	WUWVfvoNWXDkYZ0OBDQzErxKbD0KmlSv9xcMvq8HXzHTf4=
X-Received: by 2002:a05:7301:618e:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3674c63d579mr5523810eec.10.1792635518735;
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368b4b8e9c6sm3556805eec.1.2026.10.21.19.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
Date: Thu, 22 Oct 2026 10:18:20 +0800
Message-ID: <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com> <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com> <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_191840_088707_5A9D7CFD 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>
> Why it's open-coded ?

For the same reason as read_word_at_a_time(): commit ece69af2ede1
("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
it "to avoid having to pull the entire instrumented.h header into
rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
instrumented.h with linux/bug.h and kmsan-checks.h.

Thanks,
Qiliang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
